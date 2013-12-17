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

module derelict.glib.gfileutils;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.gquark;
import derelict.glib.gerror;
import core.stdc.config;

extern (C):

alias _Anonymous_0 GFileError;
alias _Anonymous_1 GFileTest;

enum _Anonymous_0
{
	G_FILE_ERROR_EXIST = 0,
	G_FILE_ERROR_ISDIR = 1,
	G_FILE_ERROR_ACCES = 2,
	G_FILE_ERROR_NAMETOOLONG = 3,
	G_FILE_ERROR_NOENT = 4,
	G_FILE_ERROR_NOTDIR = 5,
	G_FILE_ERROR_NXIO = 6,
	G_FILE_ERROR_NODEV = 7,
	G_FILE_ERROR_ROFS = 8,
	G_FILE_ERROR_TXTBSY = 9,
	G_FILE_ERROR_FAULT = 10,
	G_FILE_ERROR_LOOP = 11,
	G_FILE_ERROR_NOSPC = 12,
	G_FILE_ERROR_NOMEM = 13,
	G_FILE_ERROR_MFILE = 14,
	G_FILE_ERROR_NFILE = 15,
	G_FILE_ERROR_BADF = 16,
	G_FILE_ERROR_INVAL = 17,
	G_FILE_ERROR_PIPE = 18,
	G_FILE_ERROR_AGAIN = 19,
	G_FILE_ERROR_INTR = 20,
	G_FILE_ERROR_IO = 21,
	G_FILE_ERROR_PERM = 22,
	G_FILE_ERROR_NOSYS = 23,
	G_FILE_ERROR_FAILED = 24
}

enum _Anonymous_1
{
	G_FILE_TEST_IS_REGULAR = 1,
	G_FILE_TEST_IS_SYMLINK = 2,
	G_FILE_TEST_IS_DIR = 4,
	G_FILE_TEST_IS_EXECUTABLE = 8,
	G_FILE_TEST_EXISTS = 16
}

extern( C ) nothrow 
{
    alias da_g_file_error_quark = GQuark function();																						
    alias da_g_file_error_from_errno = GFileError function(gint err_no);																	
    alias da_g_file_test = gboolean function(const(gchar)* filename, GFileTest test);														
    alias da_g_file_get_contents = gboolean function(const(gchar)* filename, gchar** contents, gsize* length, GError** error);				
    alias da_g_file_set_contents = gboolean function(const(gchar)* filename, const(gchar)* contents, gssize length, GError** error);		
    alias da_g_file_read_link = gchar* function(const(gchar)* filename, GError** error);													
    alias da_g_mkdtemp = gchar* function(gchar* tmpl);																						
    alias da_g_mkdtemp_full = gchar* function(gchar* tmpl, gint mode);																		
    alias da_g_mkstemp = gint function(gchar* tmpl);																						
    alias da_g_mkstemp_full = gint function(gchar* tmpl, gint flags, gint mode);															
    alias da_g_file_open_tmp = gint function(const(gchar)* tmpl, gchar** name_used, GError** error);										
    alias da_g_dir_make_tmp = gchar* function(const(gchar)* tmpl, GError** error);															
    alias da_g_build_path = gchar* function(const(gchar)* separator, const(gchar)* first_element, ...);										
    alias da_g_build_pathv = gchar* function(const(gchar)* separator, gchar** args);														
    alias da_g_build_filename = gchar* function(const(gchar)* first_element, ...);															
    alias da_g_build_filenamev = gchar* function(gchar** args);																				
    alias da_g_mkdir_with_parents = gint function(const(gchar)* pathname, gint mode);														
    alias da_g_path_is_absolute = gboolean function(const(gchar)* file_name);																
    alias da_g_path_skip_root = const(gchar)* function(const(gchar)* file_name);															
    alias da_g_basename = const(gchar)* function(const(gchar)* file_name);																	
    alias da_g_get_current_dir = gchar* function();																							
    alias da_g_path_get_basename = gchar* function(const(gchar)* file_name);																
    alias da_g_path_get_dirname = gchar* function(const(gchar)* file_name);																	
}

__gshared
{
    da_g_file_error_quark g_file_error_quark; 
    da_g_file_error_from_errno g_file_error_from_errno; 
    da_g_file_test g_file_test; 
    da_g_file_get_contents g_file_get_contents; 
    da_g_file_set_contents g_file_set_contents; 
    da_g_file_read_link g_file_read_link; 
    da_g_mkdtemp g_mkdtemp; 
    da_g_mkdtemp_full g_mkdtemp_full; 
    da_g_mkstemp g_mkstemp; 
    da_g_mkstemp_full g_mkstemp_full; 
    da_g_file_open_tmp g_file_open_tmp; 
    da_g_dir_make_tmp g_dir_make_tmp; 
    da_g_build_path g_build_path; 
    da_g_build_pathv g_build_pathv; 
    da_g_build_filename g_build_filename; 
    da_g_build_filenamev g_build_filenamev; 
    da_g_mkdir_with_parents g_mkdir_with_parents; 
    da_g_path_is_absolute g_path_is_absolute; 
    da_g_path_skip_root g_path_skip_root; 
    da_g_basename g_basename; 
    da_g_get_current_dir g_get_current_dir; 
    da_g_path_get_basename g_path_get_basename; 
    da_g_path_get_dirname g_path_get_dirname; 
}