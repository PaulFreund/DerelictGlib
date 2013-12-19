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

module derelict.glib.gstring;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.gunicode;
import derelict.glib.garray;
import std.c.stdarg;

import core.stdc.string;
import core.stdc.config;

extern (C):

alias _GString GString;

struct _GString
{
	gchar* str;
	gsize len;
	gsize allocated_len;
}


version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
	    GString* g_string_new(const(gchar)* init);
        GString* g_string_new_len(const(gchar)* init, gssize len);
        GString* g_string_sized_new(gsize dfl_size);
        GBytes* g_string_free_to_bytes(GString *string);
        gchar* g_string_free(GString* string, gboolean free_segment);
        gboolean g_string_equal(const(GString)* v, const(GString)* v2);
        guint g_string_hash(const(GString)* str);
        GString* g_string_assign(GString* string, const(gchar)* rval);
        GString* g_string_truncate(GString* string, gsize len);
        GString* g_string_set_size(GString* string, gsize len);
        GString* g_string_insert_len(GString* string, gssize pos, const(gchar)* val, gssize len);
        GString* g_string_append(GString* string, const(gchar)* val);
        GString* g_string_append_len(GString* string, const(gchar)* val, gssize len);
        GString* g_string_append_c(GString* string, gchar c);
        GString* g_string_append_unichar(GString* string, gunichar wc);
        GString* g_string_prepend(GString* string, const(gchar)* val);
        GString* g_string_prepend_c(GString* string, gchar c);
        GString* g_string_prepend_unichar(GString* string, gunichar wc);
        GString* g_string_prepend_len(GString* string, const(gchar)* val, gssize len);
        GString* g_string_insert(GString* string, gssize pos, const(gchar)* val);
        GString* g_string_insert_c(GString* string, gssize pos, gchar c);
        GString* g_string_insert_unichar(GString* string, gssize pos, gunichar wc);
        GString* g_string_overwrite(GString* string, gsize pos, const(gchar)* val);
        GString* g_string_overwrite_len(GString* string, gsize pos, const(gchar)* val, gssize len);
        GString* g_string_erase(GString* string, gssize pos, gssize len);
        GString* g_string_ascii_down(GString* string);
        GString* g_string_ascii_up(GString* string);
        void g_string_vprintf(GString* string, const(gchar)* format, va_list args);
        void g_string_printf(GString* string, const(gchar)* format, ...);
        void g_string_append_vprintf(GString* string, const(gchar)* format, va_list args);
        void g_string_append_printf(GString* string, const(gchar)* format, ...);
        GString* g_string_append_uri_escaped(GString* string, const(gchar)* unescaped, const(gchar)* reserved_chars_allowed, gboolean allow_utf8);
        GString* g_string_append_c_inline(GString* gstring, gchar c);
        GString* g_string_down(GString* string);
        GString* g_string_up(GString* string);
    }
}
else
{
    extern( C ) nothrow 
    {
	    alias da_g_string_new = GString* function(const(gchar)* init);																												
        alias da_g_string_new_len = GString* function(const(gchar)* init, gssize len);																								
        alias da_g_string_sized_new = GString* function(gsize dfl_size);					
        alias da_g_string_free_to_bytes = GBytes* function(GString *string);
        alias da_g_string_free = gchar* function(GString* string, gboolean free_segment);																							
        alias da_g_string_equal = gboolean function(const(GString)* v, const(GString)* v2);																							
        alias da_g_string_hash = guint function(const(GString)* str);																												
        alias da_g_string_assign = GString* function(GString* string, const(gchar)* rval);																							
        alias da_g_string_truncate = GString* function(GString* string, gsize len);																									
        alias da_g_string_set_size = GString* function(GString* string, gsize len);																									
        alias da_g_string_insert_len = GString* function(GString* string, gssize pos, const(gchar)* val, gssize len);																
        alias da_g_string_append = GString* function(GString* string, const(gchar)* val);																							
        alias da_g_string_append_len = GString* function(GString* string, const(gchar)* val, gssize len);																			
        alias da_g_string_append_c = GString* function(GString* string, gchar c);																									
        alias da_g_string_append_unichar = GString* function(GString* string, gunichar wc);																							
        alias da_g_string_prepend = GString* function(GString* string, const(gchar)* val);																							
        alias da_g_string_prepend_c = GString* function(GString* string, gchar c);																									
        alias da_g_string_prepend_unichar = GString* function(GString* string, gunichar wc);																						
        alias da_g_string_prepend_len = GString* function(GString* string, const(gchar)* val, gssize len);																			
        alias da_g_string_insert = GString* function(GString* string, gssize pos, const(gchar)* val);																				
        alias da_g_string_insert_c = GString* function(GString* string, gssize pos, gchar c);																						
        alias da_g_string_insert_unichar = GString* function(GString* string, gssize pos, gunichar wc);																				
        alias da_g_string_overwrite = GString* function(GString* string, gsize pos, const(gchar)* val);																				
        alias da_g_string_overwrite_len = GString* function(GString* string, gsize pos, const(gchar)* val, gssize len);																
        alias da_g_string_erase = GString* function(GString* string, gssize pos, gssize len);																						
        alias da_g_string_ascii_down = GString* function(GString* string);																											
        alias da_g_string_ascii_up = GString* function(GString* string);																											
        alias da_g_string_vprintf = void function(GString* string, const(gchar)* format, va_list args);																				
        alias da_g_string_printf = void function(GString* string, const(gchar)* format, ...);																						
        alias da_g_string_append_vprintf = void function(GString* string, const(gchar)* format, va_list args);																		
        alias da_g_string_append_printf = void function(GString* string, const(gchar)* format, ...);																				
        alias da_g_string_append_uri_escaped = GString* function(GString* string, const(gchar)* unescaped, const(gchar)* reserved_chars_allowed, gboolean allow_utf8);				
        alias da_g_string_append_c_inline = GString* function(GString* gstring, gchar c);																							
        alias da_g_string_down = GString* function(GString* string);																												
        alias da_g_string_up = GString* function(GString* string);
    }

    __gshared
    {
        da_g_string_new g_string_new; 
        da_g_string_new_len g_string_new_len; 
        da_g_string_sized_new g_string_sized_new; 
        da_g_string_free g_string_free; 
        da_g_string_free_to_bytes g_string_free_to_bytes;
        da_g_string_equal g_string_equal; 
        da_g_string_hash g_string_hash; 
        da_g_string_assign g_string_assign; 
        da_g_string_truncate g_string_truncate; 
        da_g_string_set_size g_string_set_size; 
        da_g_string_insert_len g_string_insert_len; 
        da_g_string_append g_string_append; 
        da_g_string_append_len g_string_append_len; 
        da_g_string_append_c g_string_append_c; 
        da_g_string_append_unichar g_string_append_unichar; 
        da_g_string_prepend g_string_prepend; 
        da_g_string_prepend_c g_string_prepend_c; 
        da_g_string_prepend_unichar g_string_prepend_unichar; 
        da_g_string_prepend_len g_string_prepend_len; 
        da_g_string_insert g_string_insert; 
        da_g_string_insert_c g_string_insert_c; 
        da_g_string_insert_unichar g_string_insert_unichar; 
        da_g_string_overwrite g_string_overwrite; 
        da_g_string_overwrite_len g_string_overwrite_len; 
        da_g_string_erase g_string_erase; 
        da_g_string_ascii_down g_string_ascii_down; 
        da_g_string_ascii_up g_string_ascii_up; 
        da_g_string_vprintf g_string_vprintf; 
        da_g_string_printf g_string_printf; 
        da_g_string_append_vprintf g_string_append_vprintf; 
        da_g_string_append_printf g_string_append_printf; 
        da_g_string_append_uri_escaped g_string_append_uri_escaped; 
        da_g_string_append_c_inline g_string_append_c_inline; 
        da_g_string_down g_string_down; 	
        da_g_string_up g_string_up;
    }
}
