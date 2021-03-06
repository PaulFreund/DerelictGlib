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

module derelict.glib.gbitlock;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;

extern (C):

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        void g_bit_lock(gint* address, gint lock_bit);
        gboolean g_bit_trylock(gint* address, gint lock_bit);
        void g_bit_unlock(gint* address, gint lock_bit);
        void g_pointer_bit_lock(void* address, gint lock_bit);
        gboolean g_pointer_bit_trylock(void* address, gint lock_bit);
        void g_pointer_bit_unlock(void* address, gint lock_bit);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_bit_lock = void function(gint* address, gint lock_bit);						
        alias da_g_bit_trylock = gboolean function(gint* address, gint lock_bit);				
        alias da_g_bit_unlock = void function(gint* address, gint lock_bit);					
        alias da_g_pointer_bit_lock = void function(void* address, gint lock_bit);				
        alias da_g_pointer_bit_trylock = gboolean function(void* address, gint lock_bit);		
        alias da_g_pointer_bit_unlock = void function(void* address, gint lock_bit);			
    }

    __gshared
    {
        da_g_bit_lock g_bit_lock; 
        da_g_bit_trylock g_bit_trylock; 
        da_g_bit_unlock g_bit_unlock; 
        da_g_pointer_bit_lock g_pointer_bit_lock; 
        da_g_pointer_bit_trylock g_pointer_bit_trylock; 
        da_g_pointer_bit_unlock g_pointer_bit_unlock; 
    }
}
