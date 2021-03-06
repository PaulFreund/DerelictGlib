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

module derelict.glib.garray;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;

import core.stdc.config;

extern (C):

alias _GBytes GBytes;
alias _GArray GArray;
alias _GByteArray GByteArray;
alias _GPtrArray GPtrArray;

struct _GArray
{
	gchar* data;
	guint len;
}

struct _GByteArray
{
	guint8* data;
	guint len;
}

struct _GPtrArray
{
	gpointer* pdata;
	guint len;
}

struct _GBytes;

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        GArray* g_array_new(gboolean zero_terminated, gboolean clear_, guint element_size);
        GArray* g_array_sized_new(gboolean zero_terminated, gboolean clear_, guint element_size, guint reserved_size);
        gchar* g_array_free(GArray* array, gboolean free_segment);
        GArray* g_array_ref(GArray* array);
        void g_array_unref(GArray* array);
        guint g_array_get_element_size(GArray* array);
        GArray* g_array_append_vals(GArray* array, gconstpointer data, guint len);
        GArray* g_array_prepend_vals(GArray* array, gconstpointer data, guint len);
        GArray* g_array_insert_vals(GArray* array, guint index_, gconstpointer data, guint len);
        GArray* g_array_set_size(GArray* array, guint length);
        GArray* g_array_remove_index(GArray* array, guint index_);
        GArray* g_array_remove_index_fast(GArray* array, guint index_);
        GArray* g_array_remove_range(GArray* array, guint index_, guint length);
        void g_array_sort(GArray* array, GCompareFunc compare_func);
        void g_array_sort_with_data(GArray* array, GCompareDataFunc compare_func, gpointer user_data);
        void g_array_set_clear_func(GArray* array, GDestroyNotify clear_func);
        GPtrArray* g_ptr_array_new();
        GPtrArray* g_ptr_array_new_with_free_func(GDestroyNotify element_free_func);
        GPtrArray* g_ptr_array_sized_new(guint reserved_size);
        GPtrArray* g_ptr_array_new_full(guint reserved_size, GDestroyNotify element_free_func);
        gpointer* g_ptr_array_free(GPtrArray* array, gboolean free_seg);
        GPtrArray* g_ptr_array_ref(GPtrArray* array);
        void g_ptr_array_unref(GPtrArray* array);
        void g_ptr_array_set_free_func(GPtrArray* array, GDestroyNotify element_free_func);
        void g_ptr_array_set_size(GPtrArray* array, gint length);
        gpointer g_ptr_array_remove_index(GPtrArray* array, guint index_);
        gpointer g_ptr_array_remove_index_fast(GPtrArray* array, guint index_);
        gboolean g_ptr_array_remove(GPtrArray* array, gpointer data);
        gboolean g_ptr_array_remove_fast(GPtrArray* array, gpointer data);
        void g_ptr_array_remove_range(GPtrArray* array, guint index_, guint length);
        void g_ptr_array_add(GPtrArray* array, gpointer data);
        void g_ptr_array_sort(GPtrArray* array, GCompareFunc compare_func);
        void g_ptr_array_sort_with_data(GPtrArray* array, GCompareDataFunc compare_func, gpointer user_data);
        void g_ptr_array_foreach(GPtrArray* array, GFunc func, gpointer user_data);
        GByteArray* g_byte_array_new();
        GByteArray* g_byte_array_new_take(guint8* data, gsize len);
        GByteArray* g_byte_array_sized_new(guint reserved_size);
        guint8* g_byte_array_free(GByteArray* array, gboolean free_segment);
        GBytes* g_byte_array_free_to_bytes(GByteArray* array);
        GByteArray* g_byte_array_ref(GByteArray* array);
        void g_byte_array_unref(GByteArray* array);
        GByteArray* g_byte_array_append(GByteArray* array, const(guint8)* data, guint len);
        GByteArray* g_byte_array_prepend(GByteArray* array, const(guint8)* data, guint len);
        GByteArray* g_byte_array_set_size(GByteArray* array, guint length);
        GByteArray* g_byte_array_remove_index(GByteArray* array, guint index_);
        GByteArray* g_byte_array_remove_index_fast(GByteArray* array, guint index_);
        GByteArray* g_byte_array_remove_range(GByteArray* array, guint index_, guint length);
        void g_byte_array_sort(GByteArray* array, GCompareFunc compare_func);
        void g_byte_array_sort_with_data(GByteArray* array, GCompareDataFunc compare_func, gpointer user_data);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_array_new = GArray* function(gboolean zero_terminated, gboolean clear_, guint element_size);										
        alias da_g_array_sized_new = GArray* function(gboolean zero_terminated, gboolean clear_, guint element_size, guint reserved_size);			
        alias da_g_array_free = gchar* function(GArray* array, gboolean free_segment);																
        alias da_g_array_ref = GArray* function(GArray* array);																						
        alias da_g_array_unref = void function(GArray* array);																						
        alias da_g_array_get_element_size = guint function(GArray* array);																			
        alias da_g_array_append_vals = GArray* function(GArray* array, gconstpointer data, guint len);												
        alias da_g_array_prepend_vals = GArray* function(GArray* array, gconstpointer data, guint len);												
        alias da_g_array_insert_vals = GArray* function(GArray* array, guint index_, gconstpointer data, guint len);								
        alias da_g_array_set_size = GArray* function(GArray* array, guint length);																	
        alias da_g_array_remove_index = GArray* function(GArray* array, guint index_);																
        alias da_g_array_remove_index_fast = GArray* function(GArray* array, guint index_);															
        alias da_g_array_remove_range = GArray* function(GArray* array, guint index_, guint length);												
        alias da_g_array_sort = void function(GArray* array, GCompareFunc compare_func);															
        alias da_g_array_sort_with_data = void function(GArray* array, GCompareDataFunc compare_func, gpointer user_data);							
        alias da_g_array_set_clear_func = void function(GArray* array, GDestroyNotify clear_func);													
        alias da_g_ptr_array_new = GPtrArray* function();																							
        alias da_g_ptr_array_new_with_free_func = GPtrArray* function(GDestroyNotify element_free_func);											
        alias da_g_ptr_array_sized_new = GPtrArray* function(guint reserved_size);																	
        alias da_g_ptr_array_new_full = GPtrArray* function(guint reserved_size, GDestroyNotify element_free_func);									
        alias da_g_ptr_array_free = gpointer* function(GPtrArray* array, gboolean free_seg);														
        alias da_g_ptr_array_ref = GPtrArray* function(GPtrArray* array);																			
        alias da_g_ptr_array_unref = void function(GPtrArray* array);																				
        alias da_g_ptr_array_set_free_func = void function(GPtrArray* array, GDestroyNotify element_free_func);										
        alias da_g_ptr_array_set_size = void function(GPtrArray* array, gint length);																
        alias da_g_ptr_array_remove_index = gpointer function(GPtrArray* array, guint index_);														
        alias da_g_ptr_array_remove_index_fast = gpointer function(GPtrArray* array, guint index_);													
        alias da_g_ptr_array_remove = gboolean function(GPtrArray* array, gpointer data);															
        alias da_g_ptr_array_remove_fast = gboolean function(GPtrArray* array, gpointer data);														
        alias da_g_ptr_array_remove_range = void function(GPtrArray* array, guint index_, guint length);											
        alias da_g_ptr_array_add = void function(GPtrArray* array, gpointer data);																	
        alias da_g_ptr_array_sort = void function(GPtrArray* array, GCompareFunc compare_func);														
        alias da_g_ptr_array_sort_with_data = void function(GPtrArray* array, GCompareDataFunc compare_func, gpointer user_data);					
        alias da_g_ptr_array_foreach = void function(GPtrArray* array, GFunc func, gpointer user_data);												
        alias da_g_byte_array_new = GByteArray* function();																							
        alias da_g_byte_array_new_take = GByteArray* function(guint8* data, gsize len);																
        alias da_g_byte_array_sized_new = GByteArray* function(guint reserved_size);																
        alias da_g_byte_array_free = guint8* function(GByteArray* array, gboolean free_segment);													
        alias da_g_byte_array_free_to_bytes = GBytes* function(GByteArray* array);																	
        alias da_g_byte_array_ref = GByteArray* function(GByteArray* array);																		
        alias da_g_byte_array_unref = void function(GByteArray* array);																				
        alias da_g_byte_array_append = GByteArray* function(GByteArray* array, const(guint8)* data, guint len);										
        alias da_g_byte_array_prepend = GByteArray* function(GByteArray* array, const(guint8)* data, guint len);									
        alias da_g_byte_array_set_size = GByteArray* function(GByteArray* array, guint length);														
        alias da_g_byte_array_remove_index = GByteArray* function(GByteArray* array, guint index_);													
        alias da_g_byte_array_remove_index_fast = GByteArray* function(GByteArray* array, guint index_);											
        alias da_g_byte_array_remove_range = GByteArray* function(GByteArray* array, guint index_, guint length);									
        alias da_g_byte_array_sort = void function(GByteArray* array, GCompareFunc compare_func);													
        alias da_g_byte_array_sort_with_data = void function(GByteArray* array, GCompareDataFunc compare_func, gpointer user_data);					
    }

    __gshared 
    {
        da_g_array_new g_array_new; 
        da_g_array_sized_new g_array_sized_new; 
        da_g_array_free g_array_free; 
        da_g_array_ref g_array_ref; 
        da_g_array_unref g_array_unref; 
        da_g_array_get_element_size g_array_get_element_size; 
        da_g_array_append_vals g_array_append_vals; 
        da_g_array_prepend_vals g_array_prepend_vals; 
        da_g_array_insert_vals g_array_insert_vals; 
        da_g_array_set_size g_array_set_size; 
        da_g_array_remove_index g_array_remove_index; 
        da_g_array_remove_index_fast g_array_remove_index_fast; 
        da_g_array_remove_range g_array_remove_range; 
        da_g_array_sort g_array_sort; 
        da_g_array_sort_with_data g_array_sort_with_data; 
        da_g_array_set_clear_func g_array_set_clear_func; 
        da_g_ptr_array_new g_ptr_array_new; 
        da_g_ptr_array_new_with_free_func g_ptr_array_new_with_free_func; 
        da_g_ptr_array_sized_new g_ptr_array_sized_new; 
        da_g_ptr_array_new_full g_ptr_array_new_full; 
        da_g_ptr_array_free g_ptr_array_free; 
        da_g_ptr_array_ref g_ptr_array_ref; 
        da_g_ptr_array_unref g_ptr_array_unref; 
        da_g_ptr_array_set_free_func g_ptr_array_set_free_func; 
        da_g_ptr_array_set_size g_ptr_array_set_size; 
        da_g_ptr_array_remove_index g_ptr_array_remove_index; 
        da_g_ptr_array_remove_index_fast g_ptr_array_remove_index_fast; 
        da_g_ptr_array_remove g_ptr_array_remove; 
        da_g_ptr_array_remove_fast g_ptr_array_remove_fast; 
        da_g_ptr_array_remove_range g_ptr_array_remove_range; 
        da_g_ptr_array_add g_ptr_array_add; 
        da_g_ptr_array_sort g_ptr_array_sort; 
        da_g_ptr_array_sort_with_data g_ptr_array_sort_with_data; 
        da_g_ptr_array_foreach g_ptr_array_foreach; 
        da_g_byte_array_new g_byte_array_new; 
        da_g_byte_array_new_take g_byte_array_new_take; 
        da_g_byte_array_sized_new g_byte_array_sized_new; 
        da_g_byte_array_free g_byte_array_free; 
        da_g_byte_array_free_to_bytes g_byte_array_free_to_bytes; 
        da_g_byte_array_ref g_byte_array_ref; 
        da_g_byte_array_unref g_byte_array_unref; 
        da_g_byte_array_append g_byte_array_append; 
        da_g_byte_array_prepend g_byte_array_prepend; 
        da_g_byte_array_set_size g_byte_array_set_size; 
        da_g_byte_array_remove_index g_byte_array_remove_index; 
        da_g_byte_array_remove_index_fast g_byte_array_remove_index_fast; 
        da_g_byte_array_remove_range g_byte_array_remove_range; 
        da_g_byte_array_sort g_byte_array_sort; 
        da_g_byte_array_sort_with_data g_byte_array_sort_with_data; 
    }
}


