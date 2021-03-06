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

module derelict.glib.gstdio;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import std.stdio;
import std.file;

extern (C):

version(Derelict_Link_Static)
{
    extern( C ) nothrow 
    {
        int g_access(const(gchar)* filename, int mode);
        int g_chdir(const(gchar)* path);
        int g_unlink(const(gchar)* filename);
        int g_rmdir(const(gchar)* filename);
    }
}
else
{
    extern( C ) nothrow 
    {
        alias da_g_access = int function(const(gchar)* filename, int mode);																																																		
        alias da_g_chdir = int function(const(gchar)* path);																																																					
        alias da_g_unlink = int function(const(gchar)* filename);																																																				
        alias da_g_rmdir = int function(const(gchar)* filename);																																																				
    }

    __gshared
    {
        da_g_access g_access; 
        da_g_chdir g_chdir; 
        da_g_unlink g_unlink; 
        da_g_rmdir g_rmdir; 	
    }
}
