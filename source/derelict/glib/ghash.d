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

module derelict.glib.ghash;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.glist;

extern (C):

alias _GHashTable GHashTable;
alias int function (void*, void*, void*) GHRFunc;
alias _GHashTableIter GHashTableIter;

struct _GHashTableIter
{
	gpointer dummy1;
	gpointer dummy2;
	gpointer dummy3;
	int dummy4;
	gboolean dummy5;
	gpointer dummy6;
}

struct _GHashTable;

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        GHashTable* g_hash_table_new(GHashFunc hash_func, GEqualFunc key_equal_func);
        GHashTable* g_hash_table_new_full(GHashFunc hash_func, GEqualFunc key_equal_func, GDestroyNotify key_destroy_func, GDestroyNotify value_destroy_func);
        void g_hash_table_destroy(GHashTable* hash_table);
        void g_hash_table_insert(GHashTable* hash_table, gpointer key, gpointer value);
        void g_hash_table_replace(GHashTable* hash_table, gpointer key, gpointer value);
        void g_hash_table_add(GHashTable* hash_table, gpointer key);
        gboolean g_hash_table_remove(GHashTable* hash_table, gconstpointer key);
        void g_hash_table_remove_all(GHashTable* hash_table);
        gboolean g_hash_table_steal(GHashTable* hash_table, gconstpointer key);
        void g_hash_table_steal_all(GHashTable* hash_table);
        gpointer g_hash_table_lookup(GHashTable* hash_table, gconstpointer key);
        gboolean g_hash_table_contains(GHashTable* hash_table, gconstpointer key);
        gboolean g_hash_table_lookup_extended(GHashTable* hash_table, gconstpointer lookup_key, gpointer* orig_key, gpointer* value);
        void g_hash_table_foreach(GHashTable* hash_table, GHFunc func, gpointer user_data);
        gpointer g_hash_table_find(GHashTable* hash_table, GHRFunc predicate, gpointer user_data);
        guint g_hash_table_foreach_remove(GHashTable* hash_table, GHRFunc func, gpointer user_data);
        guint g_hash_table_foreach_steal(GHashTable* hash_table, GHRFunc func, gpointer user_data);
        guint g_hash_table_size(GHashTable* hash_table);
        GList* g_hash_table_get_keys(GHashTable* hash_table);
        GList* g_hash_table_get_values(GHashTable* hash_table);
        void g_hash_table_iter_init(GHashTableIter* iter, GHashTable* hash_table);
        gboolean g_hash_table_iter_next(GHashTableIter* iter, gpointer* key, gpointer* value);
        GHashTable* g_hash_table_iter_get_hash_table(GHashTableIter* iter);
        void g_hash_table_iter_remove(GHashTableIter* iter);
        void g_hash_table_iter_replace(GHashTableIter* iter, gpointer value);
        void g_hash_table_iter_steal(GHashTableIter* iter);
        GHashTable* g_hash_table_ref(GHashTable* hash_table);
        void g_hash_table_unref(GHashTable* hash_table);
        gboolean g_str_equal(gconstpointer v1, gconstpointer v2);
        guint g_str_hash(gconstpointer v);
        gboolean g_int_equal(gconstpointer v1, gconstpointer v2);
        guint g_int_hash(gconstpointer v);
        gboolean g_int64_equal(gconstpointer v1, gconstpointer v2);
        guint g_int64_hash(gconstpointer v);
        gboolean g_double_equal(gconstpointer v1, gconstpointer v2);
        guint g_double_hash(gconstpointer v);
        guint g_direct_hash(gconstpointer v);
        gboolean g_direct_equal(gconstpointer v1, gconstpointer v2);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_hash_table_new = GHashTable* function(GHashFunc hash_func, GEqualFunc key_equal_func);																							
        alias da_g_hash_table_new_full = GHashTable* function(GHashFunc hash_func, GEqualFunc key_equal_func, GDestroyNotify key_destroy_func, GDestroyNotify value_destroy_func);					
        alias da_g_hash_table_destroy = void function(GHashTable* hash_table);																														
        alias da_g_hash_table_insert = void function(GHashTable* hash_table, gpointer key, gpointer value);																							
        alias da_g_hash_table_replace = void function(GHashTable* hash_table, gpointer key, gpointer value);																						
        alias da_g_hash_table_add = void function(GHashTable* hash_table, gpointer key);																											
        alias da_g_hash_table_remove = gboolean function(GHashTable* hash_table, gconstpointer key);																								
        alias da_g_hash_table_remove_all = void function(GHashTable* hash_table);																													
        alias da_g_hash_table_steal = gboolean function(GHashTable* hash_table, gconstpointer key);																									
        alias da_g_hash_table_steal_all = void function(GHashTable* hash_table);																													
        alias da_g_hash_table_lookup = gpointer function(GHashTable* hash_table, gconstpointer key);																								
        alias da_g_hash_table_contains = gboolean function(GHashTable* hash_table, gconstpointer key);																								
        alias da_g_hash_table_lookup_extended = gboolean function(GHashTable* hash_table, gconstpointer lookup_key, gpointer* orig_key, gpointer* value);											
        alias da_g_hash_table_foreach = void function(GHashTable* hash_table, GHFunc func, gpointer user_data);																						
        alias da_g_hash_table_find = gpointer function(GHashTable* hash_table, GHRFunc predicate, gpointer user_data);																				
        alias da_g_hash_table_foreach_remove = guint function(GHashTable* hash_table, GHRFunc func, gpointer user_data);																			
        alias da_g_hash_table_foreach_steal = guint function(GHashTable* hash_table, GHRFunc func, gpointer user_data);																				
        alias da_g_hash_table_size = guint function(GHashTable* hash_table);																														
        alias da_g_hash_table_get_keys = GList* function(GHashTable* hash_table);																													
        alias da_g_hash_table_get_values = GList* function(GHashTable* hash_table);																													
        alias da_g_hash_table_iter_init = void function(GHashTableIter* iter, GHashTable* hash_table);																								
        alias da_g_hash_table_iter_next = gboolean function(GHashTableIter* iter, gpointer* key, gpointer* value);																					
        alias da_g_hash_table_iter_get_hash_table = GHashTable* function(GHashTableIter* iter);																										
        alias da_g_hash_table_iter_remove = void function(GHashTableIter* iter);																													
        alias da_g_hash_table_iter_replace = void function(GHashTableIter* iter, gpointer value);																									
        alias da_g_hash_table_iter_steal = void function(GHashTableIter* iter);																														
        alias da_g_hash_table_ref = GHashTable* function(GHashTable* hash_table);																													
        alias da_g_hash_table_unref = void function(GHashTable* hash_table);																														
        alias da_g_str_equal = gboolean function(gconstpointer v1, gconstpointer v2);																												
        alias da_g_str_hash = guint function(gconstpointer v);																																		
        alias da_g_int_equal = gboolean function(gconstpointer v1, gconstpointer v2);																												
        alias da_g_int_hash = guint function(gconstpointer v);																																		
        alias da_g_int64_equal = gboolean function(gconstpointer v1, gconstpointer v2);																												
        alias da_g_int64_hash = guint function(gconstpointer v);																																	
        alias da_g_double_equal = gboolean function(gconstpointer v1, gconstpointer v2);																											
        alias da_g_double_hash = guint function(gconstpointer v);																																	
        alias da_g_direct_hash = guint function(gconstpointer v);																																	
        alias da_g_direct_equal = gboolean function(gconstpointer v1, gconstpointer v2);																											
    }

    __gshared
    {
        da_g_hash_table_new g_hash_table_new; 
        da_g_hash_table_new_full g_hash_table_new_full; 
        da_g_hash_table_destroy g_hash_table_destroy; 
        da_g_hash_table_insert g_hash_table_insert; 
        da_g_hash_table_replace g_hash_table_replace; 
        da_g_hash_table_add g_hash_table_add; 
        da_g_hash_table_remove g_hash_table_remove; 
        da_g_hash_table_remove_all g_hash_table_remove_all; 
        da_g_hash_table_steal g_hash_table_steal; 
        da_g_hash_table_steal_all g_hash_table_steal_all; 
        da_g_hash_table_lookup g_hash_table_lookup; 
        da_g_hash_table_contains g_hash_table_contains; 
        da_g_hash_table_lookup_extended g_hash_table_lookup_extended; 
        da_g_hash_table_foreach g_hash_table_foreach; 
        da_g_hash_table_find g_hash_table_find; 
        da_g_hash_table_foreach_remove g_hash_table_foreach_remove; 
        da_g_hash_table_foreach_steal g_hash_table_foreach_steal; 
        da_g_hash_table_size g_hash_table_size; 
        da_g_hash_table_get_keys g_hash_table_get_keys; 
        da_g_hash_table_get_values g_hash_table_get_values; 
        da_g_hash_table_iter_init g_hash_table_iter_init; 
        da_g_hash_table_iter_next g_hash_table_iter_next; 
        da_g_hash_table_iter_get_hash_table g_hash_table_iter_get_hash_table; 
        da_g_hash_table_iter_remove g_hash_table_iter_remove; 
        da_g_hash_table_iter_replace g_hash_table_iter_replace; 
        da_g_hash_table_iter_steal g_hash_table_iter_steal; 
        da_g_hash_table_ref g_hash_table_ref; 
        da_g_hash_table_unref g_hash_table_unref; 
        da_g_str_equal g_str_equal; 
        da_g_str_hash g_str_hash; 
        da_g_int_equal g_int_equal; 
        da_g_int_hash g_int_hash; 
        da_g_int64_equal g_int64_equal; 
        da_g_int64_hash g_int64_hash; 
        da_g_double_equal g_double_equal; 
        da_g_double_hash g_double_hash; 
        da_g_direct_hash g_direct_hash; 
        da_g_direct_equal g_direct_equal; 
    }
}
