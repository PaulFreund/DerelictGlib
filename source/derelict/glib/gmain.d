/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/ 

module derelict.glib.gmain;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.gslist;
import derelict.glib.gpoll;
import derelict.glib.gthread;
import core.sys.posix.poll;
import core.stdc.config;

extern (C):

alias _GMainContext GMainContext;
alias _GMainLoop GMainLoop;
alias _GSource GSource;
alias _GSourcePrivate GSourcePrivate;
alias _GSourceCallbackFuncs GSourceCallbackFuncs;
alias _GSourceFuncs GSourceFuncs;
alias int function (void*) GSourceFunc;
alias void function (int, int, void*) GChildWatchFunc;
alias void function () GSourceDummyMarshal;

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        GSourceFuncs g_timeout_funcs;
        GSourceFuncs g_child_watch_funcs;
        GSourceFuncs g_idle_funcs;
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_timeout_funcs = GSourceFuncs;
        alias da_g_child_watch_funcs = GSourceFuncs;
        alias da_g_idle_funcs = GSourceFuncs;
    }

    __gshared
    {
        da_g_timeout_funcs g_timeout_funcs;
        da_g_child_watch_funcs g_child_watch_funcs;
        da_g_idle_funcs g_idle_funcs;
    }
}


struct _GSource
{
	gpointer callback_data;
	GSourceCallbackFuncs* callback_funcs;
	GSourceFuncs* source_funcs;
	guint ref_count;
	GMainContext* context;
	gint priority;
	guint flags;
	guint source_id;
	GSList* poll_fds;
	GSource* prev;
	GSource* next;
	char* name;
	GSourcePrivate* priv;
}

struct _GSourceCallbackFuncs
{
	void function (gpointer) ref_;
	void function (gpointer) unref;
	void function (gpointer, GSource*, GSourceFunc*, gpointer*) get;
}

struct _GSourceFuncs
{
	gboolean function (GSource*, gint*) prepare;
	gboolean function (GSource*) check;
	gboolean function (GSource*, GSourceFunc, gpointer) dispatch;
	void function (GSource*) finalize;
	GSourceFunc closure_callback;
	GSourceDummyMarshal closure_marshal;
}

struct _GSourcePrivate;


struct _GMainLoop;


struct _GMainContext;


version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        GMainContext* g_main_context_new();
        GMainContext* g_main_context_ref(GMainContext* context);
        void g_main_context_unref(GMainContext* context);
        GMainContext* g_main_context_default();
        gboolean g_main_context_iteration(GMainContext* context, gboolean may_block);
        gboolean g_main_context_pending(GMainContext* context);
        GSource* g_main_context_find_source_by_id(GMainContext* context, guint source_id);
        GSource* g_main_context_find_source_by_user_data(GMainContext* context, gpointer user_data);
        GSource* g_main_context_find_source_by_funcs_user_data(GMainContext* context, GSourceFuncs* funcs, gpointer user_data);
        void g_main_context_wakeup(GMainContext* context);
        gboolean g_main_context_acquire(GMainContext* context);
        void g_main_context_release(GMainContext* context);
        gboolean g_main_context_is_owner(GMainContext* context);
        gboolean g_main_context_wait(GMainContext* context, GCond* cond, GMutex* mutex);
        gboolean g_main_context_prepare(GMainContext* context, gint* priority);
        gint g_main_context_query(GMainContext* context, gint max_priority, gint* timeout_, GPollFD* fds, gint n_fds);
        gint g_main_context_check(GMainContext* context, gint max_priority, GPollFD* fds, gint n_fds);
        void g_main_context_dispatch(GMainContext* context);
        void g_main_context_set_poll_func(GMainContext* context, GPollFunc func);
        GPollFunc g_main_context_get_poll_func(GMainContext* context);
        void g_main_context_add_poll(GMainContext* context, GPollFD* fd, gint priority);
        void g_main_context_remove_poll(GMainContext* context, GPollFD* fd);
        gint g_main_depth();
        GSource* g_main_current_source();
        void g_main_context_push_thread_default(GMainContext* context);
        void g_main_context_pop_thread_default(GMainContext* context);
        GMainContext* g_main_context_get_thread_default();
        GMainContext* g_main_context_ref_thread_default();
        GMainLoop* g_main_loop_new(GMainContext* context, gboolean is_running);
        void g_main_loop_run(GMainLoop* loop);
        void g_main_loop_quit(GMainLoop* loop);
        GMainLoop* g_main_loop_ref(GMainLoop* loop);
        void g_main_loop_unref(GMainLoop* loop);
        gboolean g_main_loop_is_running(GMainLoop* loop);
        GMainContext* g_main_loop_get_context(GMainLoop* loop);
        GSource* g_source_new(GSourceFuncs* source_funcs, guint struct_size);
        GSource* g_source_ref(GSource* source);
        void g_source_unref(GSource* source);
        guint g_source_attach(GSource* source, GMainContext* context);
        void g_source_destroy(GSource* source);
        void g_source_set_priority(GSource* source, gint priority);
        gint g_source_get_priority(GSource* source);
        void g_source_set_can_recurse(GSource* source, gboolean can_recurse);
        gboolean g_source_get_can_recurse(GSource* source);
        guint g_source_get_id(GSource* source);
        GMainContext* g_source_get_context(GSource* source);
        void g_source_set_callback(GSource* source, GSourceFunc func, gpointer data, GDestroyNotify notify);
        void g_source_set_funcs(GSource* source, GSourceFuncs* funcs);
        gboolean g_source_is_destroyed(GSource* source);
        void g_source_set_name(GSource* source, const(char)* name);
        const(char)* g_source_get_name(GSource* source);
        void g_source_set_name_by_id(guint tag, const(char)* name);
        void g_source_set_callback_indirect(GSource* source, gpointer callback_data, GSourceCallbackFuncs* callback_funcs);
        void g_source_add_poll(GSource* source, GPollFD* fd);
        void g_source_remove_poll(GSource* source, GPollFD* fd);
        void g_source_add_child_source(GSource* source, GSource* child_source);
        void g_source_remove_child_source(GSource* source, GSource* child_source);
        void g_source_get_current_time(GSource* source, GTimeVal* timeval);
        gint64 g_source_get_time(GSource* source);
        GSource* g_idle_source_new();
        GSource* g_child_watch_source_new(GPid pid);
        GSource* g_timeout_source_new(guint interval);
        GSource* g_timeout_source_new_seconds(guint interval);
        void g_get_current_time(GTimeVal* result);
        gint64 g_get_monotonic_time();
        gint64 g_get_real_time();
        gboolean g_source_remove(guint tag);
        gboolean g_source_remove_by_user_data(gpointer user_data);
        gboolean g_source_remove_by_funcs_user_data(GSourceFuncs* funcs, gpointer user_data);
        guint g_timeout_add_full(gint priority, guint interval, GSourceFunc function_, gpointer data, GDestroyNotify notify);
        guint g_timeout_add(guint interval, GSourceFunc function_, gpointer data);
        guint g_timeout_add_seconds_full(gint priority, guint interval, GSourceFunc function_, gpointer data, GDestroyNotify notify);
        guint g_timeout_add_seconds(guint interval, GSourceFunc function_, gpointer data);
        guint g_child_watch_add_full(gint priority, GPid pid, GChildWatchFunc function_, gpointer data, GDestroyNotify notify);
        guint g_child_watch_add(GPid pid, GChildWatchFunc function_, gpointer data);
        guint g_idle_add(GSourceFunc function_, gpointer data);
        guint g_idle_add_full(gint priority, GSourceFunc function_, gpointer data, GDestroyNotify notify);
        gboolean g_idle_remove_by_data(gpointer data);
        void g_main_context_invoke_full(GMainContext* context, gint priority, GSourceFunc function_, gpointer data, GDestroyNotify notify);
        void g_main_context_invoke(GMainContext* context, GSourceFunc function_, gpointer data);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_main_context_new = GMainContext* function();																										
        alias da_g_main_context_ref = GMainContext* function(GMainContext* context);																				
        alias da_g_main_context_unref = void function(GMainContext* context);																						
        alias da_g_main_context_default = GMainContext* function();																									
        alias da_g_main_context_iteration = gboolean function(GMainContext* context, gboolean may_block);															
        alias da_g_main_context_pending = gboolean function(GMainContext* context);																					
        alias da_g_main_context_find_source_by_id = GSource* function(GMainContext* context, guint source_id);														
        alias da_g_main_context_find_source_by_user_data = GSource* function(GMainContext* context, gpointer user_data);											
        alias da_g_main_context_find_source_by_funcs_user_data = GSource* function(GMainContext* context, GSourceFuncs* funcs, gpointer user_data);					
        alias da_g_main_context_wakeup = void function(GMainContext* context);																						
        alias da_g_main_context_acquire = gboolean function(GMainContext* context);																					
        alias da_g_main_context_release = void function(GMainContext* context);																						
        alias da_g_main_context_is_owner = gboolean function(GMainContext* context);																				
        alias da_g_main_context_wait = gboolean function(GMainContext* context, GCond* cond, GMutex* mutex);														
        alias da_g_main_context_prepare = gboolean function(GMainContext* context, gint* priority);																	
        alias da_g_main_context_query = gint function(GMainContext* context, gint max_priority, gint* timeout_, GPollFD* fds, gint n_fds);							
        alias da_g_main_context_check = gint function(GMainContext* context, gint max_priority, GPollFD* fds, gint n_fds);											
        alias da_g_main_context_dispatch = void function(GMainContext* context);																					
        alias da_g_main_context_set_poll_func = void function(GMainContext* context, GPollFunc func);																
        alias da_g_main_context_get_poll_func = GPollFunc function(GMainContext* context);																			
        alias da_g_main_context_add_poll = void function(GMainContext* context, GPollFD* fd, gint priority);														
        alias da_g_main_context_remove_poll = void function(GMainContext* context, GPollFD* fd);																	
        alias da_g_main_depth = gint function();																													
        alias da_g_main_current_source = GSource* function();																										
        alias da_g_main_context_push_thread_default = void function(GMainContext* context);																			
        alias da_g_main_context_pop_thread_default = void function(GMainContext* context);																			
        alias da_g_main_context_get_thread_default = GMainContext* function();																						
        alias da_g_main_context_ref_thread_default = GMainContext* function();																						
        alias da_g_main_loop_new = GMainLoop* function(GMainContext* context, gboolean is_running);																	
        alias da_g_main_loop_run = void function(GMainLoop* loop);																									
        alias da_g_main_loop_quit = void function(GMainLoop* loop);																									
        alias da_g_main_loop_ref = GMainLoop* function(GMainLoop* loop);																							
        alias da_g_main_loop_unref = void function(GMainLoop* loop);																								
        alias da_g_main_loop_is_running = gboolean function(GMainLoop* loop);																						
        alias da_g_main_loop_get_context = GMainContext* function(GMainLoop* loop);																					
        alias da_g_source_new = GSource* function(GSourceFuncs* source_funcs, guint struct_size);																	
        alias da_g_source_ref = GSource* function(GSource* source);																									
        alias da_g_source_unref = void function(GSource* source);																									
        alias da_g_source_attach = guint function(GSource* source, GMainContext* context);																			
        alias da_g_source_destroy = void function(GSource* source);																									
        alias da_g_source_set_priority = void function(GSource* source, gint priority);																				
        alias da_g_source_get_priority = gint function(GSource* source);																							
        alias da_g_source_set_can_recurse = void function(GSource* source, gboolean can_recurse);																	
        alias da_g_source_get_can_recurse = gboolean function(GSource* source);																						
        alias da_g_source_get_id = guint function(GSource* source);																									
        alias da_g_source_get_context = GMainContext* function(GSource* source);																					
        alias da_g_source_set_callback = void function(GSource* source, GSourceFunc func, gpointer data, GDestroyNotify notify);									
        alias da_g_source_set_funcs = void function(GSource* source, GSourceFuncs* funcs);																			
        alias da_g_source_is_destroyed = gboolean function(GSource* source);																						
        alias da_g_source_set_name = void function(GSource* source, const(char)* name);																				
        alias da_g_source_get_name = const(char)* function(GSource* source);																						
        alias da_g_source_set_name_by_id = void function(guint tag, const(char)* name);																				
        alias da_g_source_set_callback_indirect = void function(GSource* source, gpointer callback_data, GSourceCallbackFuncs* callback_funcs);						
        alias da_g_source_add_poll = void function(GSource* source, GPollFD* fd);																					
        alias da_g_source_remove_poll = void function(GSource* source, GPollFD* fd);																				
        alias da_g_source_add_child_source = void function(GSource* source, GSource* child_source);																	
        alias da_g_source_remove_child_source = void function(GSource* source, GSource* child_source);																
        alias da_g_source_get_current_time = void function(GSource* source, GTimeVal* timeval);																		
        alias da_g_source_get_time = gint64 function(GSource* source);																								
        alias da_g_idle_source_new = GSource* function();																											
        alias da_g_child_watch_source_new = GSource* function(GPid pid);																							
        alias da_g_timeout_source_new = GSource* function(guint interval);																							
        alias da_g_timeout_source_new_seconds = GSource* function(guint interval);																					
        alias da_g_get_current_time = void function(GTimeVal* result);																								
        alias da_g_get_monotonic_time = gint64 function();																											
        alias da_g_get_real_time = gint64 function();																												
        alias da_g_source_remove = gboolean function(guint tag);																									
        alias da_g_source_remove_by_user_data = gboolean function(gpointer user_data);																				
        alias da_g_source_remove_by_funcs_user_data = gboolean function(GSourceFuncs* funcs, gpointer user_data);													
        alias da_g_timeout_add_full = guint function(gint priority, guint interval, GSourceFunc function_, gpointer data, GDestroyNotify notify);					
        alias da_g_timeout_add = guint function(guint interval, GSourceFunc function_, gpointer data);																
        alias da_g_timeout_add_seconds_full = guint function(gint priority, guint interval, GSourceFunc function_, gpointer data, GDestroyNotify notify);			
        alias da_g_timeout_add_seconds = guint function(guint interval, GSourceFunc function_, gpointer data);														
        alias da_g_child_watch_add_full = guint function(gint priority, GPid pid, GChildWatchFunc function_, gpointer data, GDestroyNotify notify);					
        alias da_g_child_watch_add = guint function(GPid pid, GChildWatchFunc function_, gpointer data);															
        alias da_g_idle_add = guint function(GSourceFunc function_, gpointer data);																					
        alias da_g_idle_add_full = guint function(gint priority, GSourceFunc function_, gpointer data, GDestroyNotify notify);										
        alias da_g_idle_remove_by_data = gboolean function(gpointer data);																							
        alias da_g_main_context_invoke_full = void function(GMainContext* context, gint priority, GSourceFunc function_, gpointer data, GDestroyNotify notify);		
        alias da_g_main_context_invoke = void function(GMainContext* context, GSourceFunc function_, gpointer data);			
    }

    __gshared
    {
        da_g_main_context_new g_main_context_new; 
        da_g_main_context_ref g_main_context_ref; 
        da_g_main_context_unref g_main_context_unref; 
        da_g_main_context_default g_main_context_default; 
        da_g_main_context_iteration g_main_context_iteration; 
        da_g_main_context_pending g_main_context_pending; 
        da_g_main_context_find_source_by_id g_main_context_find_source_by_id; 
        da_g_main_context_find_source_by_user_data g_main_context_find_source_by_user_data; 
        da_g_main_context_find_source_by_funcs_user_data g_main_context_find_source_by_funcs_user_data; 
        da_g_main_context_wakeup g_main_context_wakeup; 
        da_g_main_context_acquire g_main_context_acquire; 
        da_g_main_context_release g_main_context_release; 
        da_g_main_context_is_owner g_main_context_is_owner; 
        da_g_main_context_wait g_main_context_wait; 
        da_g_main_context_prepare g_main_context_prepare; 
        da_g_main_context_query g_main_context_query; 
        da_g_main_context_check g_main_context_check; 
        da_g_main_context_dispatch g_main_context_dispatch; 
        da_g_main_context_set_poll_func g_main_context_set_poll_func; 
        da_g_main_context_get_poll_func g_main_context_get_poll_func; 
        da_g_main_context_add_poll g_main_context_add_poll; 
        da_g_main_context_remove_poll g_main_context_remove_poll; 
        da_g_main_depth g_main_depth; 
        da_g_main_current_source g_main_current_source; 
        da_g_main_context_push_thread_default g_main_context_push_thread_default; 
        da_g_main_context_pop_thread_default g_main_context_pop_thread_default; 
        da_g_main_context_get_thread_default g_main_context_get_thread_default; 
        da_g_main_context_ref_thread_default g_main_context_ref_thread_default; 
        da_g_main_loop_new g_main_loop_new; 
        da_g_main_loop_run g_main_loop_run; 
        da_g_main_loop_quit g_main_loop_quit; 
        da_g_main_loop_ref g_main_loop_ref; 
        da_g_main_loop_unref g_main_loop_unref; 
        da_g_main_loop_is_running g_main_loop_is_running; 
        da_g_main_loop_get_context g_main_loop_get_context; 
        da_g_source_new g_source_new; 
        da_g_source_ref g_source_ref; 
        da_g_source_unref g_source_unref; 
        da_g_source_attach g_source_attach; 
        da_g_source_destroy g_source_destroy; 
        da_g_source_set_priority g_source_set_priority; 
        da_g_source_get_priority g_source_get_priority; 
        da_g_source_set_can_recurse g_source_set_can_recurse; 
        da_g_source_get_can_recurse g_source_get_can_recurse; 
        da_g_source_get_id g_source_get_id; 
        da_g_source_get_context g_source_get_context; 
        da_g_source_set_callback g_source_set_callback; 
        da_g_source_set_funcs g_source_set_funcs; 
        da_g_source_is_destroyed g_source_is_destroyed; 
        da_g_source_set_name g_source_set_name; 
        da_g_source_get_name g_source_get_name; 
        da_g_source_set_name_by_id g_source_set_name_by_id; 
        da_g_source_set_callback_indirect g_source_set_callback_indirect; 
        da_g_source_add_poll g_source_add_poll; 
        da_g_source_remove_poll g_source_remove_poll; 
        da_g_source_add_child_source g_source_add_child_source; 
        da_g_source_remove_child_source g_source_remove_child_source; 
        da_g_source_get_current_time g_source_get_current_time; 
        da_g_source_get_time g_source_get_time; 
        da_g_idle_source_new g_idle_source_new; 
        da_g_child_watch_source_new g_child_watch_source_new; 
        da_g_timeout_source_new g_timeout_source_new; 
        da_g_timeout_source_new_seconds g_timeout_source_new_seconds; 
        da_g_get_current_time g_get_current_time; 
        da_g_get_monotonic_time g_get_monotonic_time; 
        da_g_get_real_time g_get_real_time; 
        da_g_source_remove g_source_remove; 
        da_g_source_remove_by_user_data g_source_remove_by_user_data; 
        da_g_source_remove_by_funcs_user_data g_source_remove_by_funcs_user_data; 
        da_g_timeout_add_full g_timeout_add_full; 
        da_g_timeout_add g_timeout_add; 
        da_g_timeout_add_seconds_full g_timeout_add_seconds_full; 
        da_g_timeout_add_seconds g_timeout_add_seconds; 
        da_g_child_watch_add_full g_child_watch_add_full; 
        da_g_child_watch_add g_child_watch_add; 
        da_g_idle_add g_idle_add; 
        da_g_idle_add_full g_idle_add_full; 
        da_g_idle_remove_by_data g_idle_remove_by_data; 
        da_g_main_context_invoke_full g_main_context_invoke_full; 
        da_g_main_context_invoke g_main_context_invoke; 	
    }
}
