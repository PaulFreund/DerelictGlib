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

module derelict.glib.gstrfuncs;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import core.stdc.config;
import std.c.stdarg;

extern (C):

alias _Anonymous_0 GAsciiType;

version(Derelict_Link_Static)
{
    //extern( C ) nothrow 
    //{
    //    const guint16* g_ascii_table;
    //}
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_ascii_table = const guint16*;
    }

    __gshared
    {
        da_g_ascii_table g_ascii_table;
    }
}


enum _Anonymous_0
{
	G_ASCII_ALNUM = 1,
	G_ASCII_ALPHA = 2,
	G_ASCII_CNTRL = 4,
	G_ASCII_DIGIT = 8,
	G_ASCII_GRAPH = 16,
	G_ASCII_LOWER = 32,
	G_ASCII_PRINT = 64,
	G_ASCII_PUNCT = 128,
	G_ASCII_SPACE = 256,
	G_ASCII_UPPER = 512,
	G_ASCII_XDIGIT = 1024
}

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
	    gchar g_ascii_tolower(gchar c);
        gchar g_ascii_toupper(gchar c);
        gint g_ascii_digit_value(gchar c);
        gint g_ascii_xdigit_value(gchar c);
        gchar* g_strdelimit(gchar* string, const(gchar)* delimiters, gchar new_delimiter);
        gchar* g_strcanon(gchar* string, const(gchar)* valid_chars, gchar substitutor);
        const(gchar)* g_strerror(gint errnum);
        const(gchar)* g_strsignal(gint signum);
        gchar* g_strreverse(gchar* string);
        gsize g_strlcpy(gchar* dest, const(gchar)* src, gsize dest_size);
        gsize g_strlcat(gchar* dest, const(gchar)* src, gsize dest_size);
        gchar* g_strstr_len(const(gchar)* haystack, gssize haystack_len, const(gchar)* needle);
        gchar* g_strrstr(const(gchar)* haystack, const(gchar)* needle);
        gchar* g_strrstr_len(const(gchar)* haystack, gssize haystack_len, const(gchar)* needle);
        gboolean g_str_has_suffix(const(gchar)* str, const(gchar)* suffix);
        gboolean g_str_has_prefix(const(gchar)* str, const(gchar)* prefix);
        gdouble g_strtod(const(gchar)* nptr, gchar** endptr);
        gdouble g_ascii_strtod(const(gchar)* nptr, gchar** endptr);
        guint64 g_ascii_strtoull(const(gchar)* nptr, gchar** endptr, guint base);
        gint64 g_ascii_strtoll(const(gchar)* nptr, gchar** endptr, guint base);
        gchar* g_ascii_dtostr(gchar* buffer, gint buf_len, gdouble d);
        gchar* g_ascii_formatd(gchar* buffer, gint buf_len, const(gchar)* format, gdouble d);
        gchar* g_strchug(gchar* string);
        gchar* g_strchomp(gchar* string);
        gint g_ascii_strcasecmp(const(gchar)* s1, const(gchar)* s2);
        gint g_ascii_strncasecmp(const(gchar)* s1, const(gchar)* s2, gsize n);
        gchar* g_ascii_strdown(const(gchar)* str, gssize len);
        gchar* g_ascii_strup(const(gchar)* str, gssize len);
        gint g_strcasecmp(const(gchar)* s1, const(gchar)* s2);
        gint g_strncasecmp(const(gchar)* s1, const(gchar)* s2, guint n);
        gchar* g_strdown(gchar* string);
        gchar* g_strup(gchar* string);
        gchar* g_strdup(const(gchar)* str);
        gchar* g_strdup_printf(const(gchar)* format, ...);
        gchar* g_strdup_vprintf(const(gchar)* format, va_list args);
        gchar* g_strndup(const(gchar)* str, gsize n);
        gchar* g_strnfill(gsize length, gchar fill_char);
        gchar* g_strconcat(const(gchar)* string1, ...);
        gchar* g_strjoin(const(gchar)* separator, ...);
        gchar* g_strcompress(const(gchar)* source);
        gchar* g_strescape(const(gchar)* source, const(gchar)* exceptions);
        gpointer g_memdup(gconstpointer mem, guint byte_size);
        gchar** g_strsplit(const(gchar)* string, const(gchar)* delimiter, gint max_tokens);
        gchar** g_strsplit_set(const(gchar)* string, const(gchar)* delimiters, gint max_tokens);
        gchar* g_strjoinv(const(gchar)* separator, gchar** str_array);
        void g_strfreev(gchar** str_array);
        gchar** g_strdupv(gchar** str_array);
        guint g_strv_length(gchar** str_array);
        gchar* g_stpcpy(gchar* dest, const(char)* src);
    }
}
else
{
    extern( C ) nothrow 
    {
	    alias da_g_ascii_tolower = gchar function(gchar c);																		
        alias da_g_ascii_toupper = gchar function(gchar c);																		
        alias da_g_ascii_digit_value = gint function(gchar c);																	
        alias da_g_ascii_xdigit_value = gint function(gchar c);																	
        alias da_g_strdelimit = gchar* function(gchar* string, const(gchar)* delimiters, gchar new_delimiter);					
        alias da_g_strcanon = gchar* function(gchar* string, const(gchar)* valid_chars, gchar substitutor);						
        alias da_g_strerror = const(gchar)* function(gint errnum);																
        alias da_g_strsignal = const(gchar)* function(gint signum);																
        alias da_g_strreverse = gchar* function(gchar* string);																	
        alias da_g_strlcpy = gsize function(gchar* dest, const(gchar)* src, gsize dest_size);									
        alias da_g_strlcat = gsize function(gchar* dest, const(gchar)* src, gsize dest_size);									
        alias da_g_strstr_len = gchar* function(const(gchar)* haystack, gssize haystack_len, const(gchar)* needle);				
        alias da_g_strrstr = gchar* function(const(gchar)* haystack, const(gchar)* needle);										
        alias da_g_strrstr_len = gchar* function(const(gchar)* haystack, gssize haystack_len, const(gchar)* needle);			
        alias da_g_str_has_suffix = gboolean function(const(gchar)* str, const(gchar)* suffix);									
        alias da_g_str_has_prefix = gboolean function(const(gchar)* str, const(gchar)* prefix);									
        alias da_g_strtod = gdouble function(const(gchar)* nptr, gchar** endptr);												
        alias da_g_ascii_strtod = gdouble function(const(gchar)* nptr, gchar** endptr);											
        alias da_g_ascii_strtoull = guint64 function(const(gchar)* nptr, gchar** endptr, guint base);							
        alias da_g_ascii_strtoll = gint64 function(const(gchar)* nptr, gchar** endptr, guint base);								
        alias da_g_ascii_dtostr = gchar* function(gchar* buffer, gint buf_len, gdouble d);										
        alias da_g_ascii_formatd = gchar* function(gchar* buffer, gint buf_len, const(gchar)* format, gdouble d);				
        alias da_g_strchug = gchar* function(gchar* string);																	
        alias da_g_strchomp = gchar* function(gchar* string);																	
        alias da_g_ascii_strcasecmp = gint function(const(gchar)* s1, const(gchar)* s2);										
        alias da_g_ascii_strncasecmp = gint function(const(gchar)* s1, const(gchar)* s2, gsize n);								
        alias da_g_ascii_strdown = gchar* function(const(gchar)* str, gssize len);												
        alias da_g_ascii_strup = gchar* function(const(gchar)* str, gssize len);												
        alias da_g_strcasecmp = gint function(const(gchar)* s1, const(gchar)* s2);												
        alias da_g_strncasecmp = gint function(const(gchar)* s1, const(gchar)* s2, guint n);									
        alias da_g_strdown = gchar* function(gchar* string);																	
        alias da_g_strup = gchar* function(gchar* string);																		
        alias da_g_strdup = gchar* function(const(gchar)* str);																	
        alias da_g_strdup_printf = gchar* function(const(gchar)* format, ...);													
        alias da_g_strdup_vprintf = gchar* function(const(gchar)* format, va_list args);										
        alias da_g_strndup = gchar* function(const(gchar)* str, gsize n);														
        alias da_g_strnfill = gchar* function(gsize length, gchar fill_char);													
        alias da_g_strconcat = gchar* function(const(gchar)* string1, ...);														
        alias da_g_strjoin = gchar* function(const(gchar)* separator, ...);														
        alias da_g_strcompress = gchar* function(const(gchar)* source);															
        alias da_g_strescape = gchar* function(const(gchar)* source, const(gchar)* exceptions);									
        alias da_g_memdup = gpointer function(gconstpointer mem, guint byte_size);												
        alias da_g_strsplit = gchar** function(const(gchar)* string, const(gchar)* delimiter, gint max_tokens);					
        alias da_g_strsplit_set = gchar** function(const(gchar)* string, const(gchar)* delimiters, gint max_tokens);			
        alias da_g_strjoinv = gchar* function(const(gchar)* separator, gchar** str_array);										
        alias da_g_strfreev = void function(gchar** str_array);																	
        alias da_g_strdupv = gchar** function(gchar** str_array);																
        alias da_g_strv_length = guint function(gchar** str_array);																
        alias da_g_stpcpy = gchar* function(gchar* dest, const(char)* src);														
    }

    __gshared
    {
        da_g_ascii_tolower g_ascii_tolower; 
        da_g_ascii_toupper g_ascii_toupper; 
        da_g_ascii_digit_value g_ascii_digit_value; 
        da_g_ascii_xdigit_value g_ascii_xdigit_value; 
        da_g_strdelimit g_strdelimit; 
        da_g_strcanon g_strcanon; 
        da_g_strerror g_strerror; 
        da_g_strsignal g_strsignal; 
        da_g_strreverse g_strreverse; 
        da_g_strlcpy g_strlcpy; 
        da_g_strlcat g_strlcat; 
        da_g_strstr_len g_strstr_len; 
        da_g_strrstr g_strrstr; 
        da_g_strrstr_len g_strrstr_len; 
        da_g_str_has_suffix g_str_has_suffix; 
        da_g_str_has_prefix g_str_has_prefix; 
        da_g_strtod g_strtod; 
        da_g_ascii_strtod g_ascii_strtod; 
        da_g_ascii_strtoull g_ascii_strtoull; 
        da_g_ascii_strtoll g_ascii_strtoll; 
        da_g_ascii_dtostr g_ascii_dtostr; 
        da_g_ascii_formatd g_ascii_formatd; 
        da_g_strchug g_strchug; 
        da_g_strchomp g_strchomp; 
        da_g_ascii_strcasecmp g_ascii_strcasecmp; 
        da_g_ascii_strncasecmp g_ascii_strncasecmp; 
        da_g_ascii_strdown g_ascii_strdown; 
        da_g_ascii_strup g_ascii_strup; 
        da_g_strcasecmp g_strcasecmp; 
        da_g_strncasecmp g_strncasecmp; 
        da_g_strdown g_strdown; 
        da_g_strup g_strup; 
        da_g_strdup g_strdup; 
        da_g_strdup_printf g_strdup_printf; 
        da_g_strdup_vprintf g_strdup_vprintf; 
        da_g_strndup g_strndup; 
        da_g_strnfill g_strnfill; 
        da_g_strconcat g_strconcat; 
        da_g_strjoin g_strjoin; 
        da_g_strcompress g_strcompress; 
        da_g_strescape g_strescape; 
        da_g_memdup g_memdup; 
        da_g_strsplit g_strsplit; 
        da_g_strsplit_set g_strsplit_set; 
        da_g_strjoinv g_strjoinv; 
        da_g_strfreev g_strfreev; 
        da_g_strdupv g_strdupv; 
        da_g_strv_length g_strv_length; 
        da_g_stpcpy g_stpcpy; 
    }
}
