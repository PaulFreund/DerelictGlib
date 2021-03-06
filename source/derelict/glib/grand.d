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

module derelict.glib.grand;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import core.stdc.config;

extern (C):

alias _GRand GRand;

struct _GRand;


version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
	    GRand* g_rand_new_with_seed(guint32 seed);
        GRand* g_rand_new_with_seed_array(const(guint32)* seed, guint seed_length);
        GRand* g_rand_new();
        void g_rand_free(GRand* rand_);
        GRand* g_rand_copy(GRand* rand_);
        void g_rand_set_seed(GRand* rand_, guint32 seed);
        void g_rand_set_seed_array(GRand* rand_, const(guint32)* seed, guint seed_length);
        guint32 g_rand_int(GRand* rand_);
        gint32 g_rand_int_range(GRand* rand_, gint32 begin, gint32 end);
        gdouble g_rand_double(GRand* rand_);
        gdouble g_rand_double_range(GRand* rand_, gdouble begin, gdouble end);
        void g_random_set_seed(guint32 seed);
        guint32 g_random_int();
        gint32 g_random_int_range(gint32 begin, gint32 end);
        gdouble g_random_double();
        gdouble g_random_double_range(gdouble begin, gdouble end);
    }
}
else
{
    extern( C ) nothrow 
    {
	    alias da_g_rand_new_with_seed = GRand* function(guint32 seed);													
        alias da_g_rand_new_with_seed_array = GRand* function(const(guint32)* seed, guint seed_length);					
        alias da_g_rand_new = GRand* function();																		
        alias da_g_rand_free = void function(GRand* rand_);																
        alias da_g_rand_copy = GRand* function(GRand* rand_);															
        alias da_g_rand_set_seed = void function(GRand* rand_, guint32 seed);											
        alias da_g_rand_set_seed_array = void function(GRand* rand_, const(guint32)* seed, guint seed_length);			
        alias da_g_rand_int = guint32 function(GRand* rand_);															
        alias da_g_rand_int_range = gint32 function(GRand* rand_, gint32 begin, gint32 end);							
        alias da_g_rand_double = gdouble function(GRand* rand_);														
        alias da_g_rand_double_range = gdouble function(GRand* rand_, gdouble begin, gdouble end);						
        alias da_g_random_set_seed = void function(guint32 seed);														
        alias da_g_random_int = guint32 function();																		
        alias da_g_random_int_range = gint32 function(gint32 begin, gint32 end);										
        alias da_g_random_double = gdouble function();																	
        alias da_g_random_double_range = gdouble function(gdouble begin, gdouble end);	
    }

    __gshared
    {
        da_g_rand_new_with_seed g_rand_new_with_seed; 
        da_g_rand_new_with_seed_array g_rand_new_with_seed_array; 
        da_g_rand_new g_rand_new; 
        da_g_rand_free g_rand_free; 
        da_g_rand_copy g_rand_copy; 
        da_g_rand_set_seed g_rand_set_seed; 
        da_g_rand_set_seed_array g_rand_set_seed_array; 
        da_g_rand_int g_rand_int; 
        da_g_rand_int_range g_rand_int_range; 
        da_g_rand_double g_rand_double; 
        da_g_rand_double_range g_rand_double_range; 
        da_g_random_set_seed g_random_set_seed; 
        da_g_random_int g_random_int; 
        da_g_random_int_range g_random_int_range; 
        da_g_random_double g_random_double; 
        da_g_random_double_range g_random_double_range; 
    }
}
