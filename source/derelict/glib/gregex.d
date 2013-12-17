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

module derelict.glib.gregex;

import derelict.glib.gtypes;
import derelict.glib.glibconfig;
import derelict.glib.gstring;
import derelict.glib.gerror;
import derelict.glib.gquark;
import core.stdc.string;
import core.stdc.config;

extern (C):

alias _Anonymous_0 GRegexError;
alias _Anonymous_1 GRegexCompileFlags;
alias _Anonymous_2 GRegexMatchFlags;
alias _GRegex GRegex;
alias _GMatchInfo GMatchInfo;
alias int function (const(_GMatchInfo)*, _GString*, void*) GRegexEvalCallback;

enum _Anonymous_0
{
	G_REGEX_ERROR_COMPILE = 0,
	G_REGEX_ERROR_OPTIMIZE = 1,
	G_REGEX_ERROR_REPLACE = 2,
	G_REGEX_ERROR_MATCH = 3,
	G_REGEX_ERROR_INTERNAL = 4,
	G_REGEX_ERROR_STRAY_BACKSLASH = 101,
	G_REGEX_ERROR_MISSING_CONTROL_CHAR = 102,
	G_REGEX_ERROR_UNRECOGNIZED_ESCAPE = 103,
	G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER = 104,
	G_REGEX_ERROR_QUANTIFIER_TOO_BIG = 105,
	G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS = 106,
	G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS = 107,
	G_REGEX_ERROR_RANGE_OUT_OF_ORDER = 108,
	G_REGEX_ERROR_NOTHING_TO_REPEAT = 109,
	G_REGEX_ERROR_UNRECOGNIZED_CHARACTER = 112,
	G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS = 113,
	G_REGEX_ERROR_UNMATCHED_PARENTHESIS = 114,
	G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE = 115,
	G_REGEX_ERROR_UNTERMINATED_COMMENT = 118,
	G_REGEX_ERROR_EXPRESSION_TOO_LARGE = 120,
	G_REGEX_ERROR_MEMORY_ERROR = 121,
	G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND = 125,
	G_REGEX_ERROR_MALFORMED_CONDITION = 126,
	G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES = 127,
	G_REGEX_ERROR_ASSERTION_EXPECTED = 128,
	G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME = 130,
	G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED = 131,
	G_REGEX_ERROR_HEX_CODE_TOO_LARGE = 134,
	G_REGEX_ERROR_INVALID_CONDITION = 135,
	G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND = 136,
	G_REGEX_ERROR_INFINITE_LOOP = 140,
	G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR = 142,
	G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME = 143,
	G_REGEX_ERROR_MALFORMED_PROPERTY = 146,
	G_REGEX_ERROR_UNKNOWN_PROPERTY = 147,
	G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG = 148,
	G_REGEX_ERROR_TOO_MANY_SUBPATTERNS = 149,
	G_REGEX_ERROR_INVALID_OCTAL_VALUE = 151,
	G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE = 154,
	G_REGEX_ERROR_DEFINE_REPETION = 155,
	G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS = 156,
	G_REGEX_ERROR_MISSING_BACK_REFERENCE = 157
}

enum _Anonymous_1
{
	G_REGEX_CASELESS = 1,
	G_REGEX_MULTILINE = 2,
	G_REGEX_DOTALL = 4,
	G_REGEX_EXTENDED = 8,
	G_REGEX_ANCHORED = 16,
	G_REGEX_DOLLAR_ENDONLY = 32,
	G_REGEX_UNGREEDY = 512,
	G_REGEX_RAW = 2048,
	G_REGEX_NO_AUTO_CAPTURE = 4096,
	G_REGEX_OPTIMIZE = 8192,
	G_REGEX_DUPNAMES = 524288,
	G_REGEX_NEWLINE_CR = 1048576,
	G_REGEX_NEWLINE_LF = 2097152,
	G_REGEX_NEWLINE_CRLF = 3145728
}

enum _Anonymous_2
{
	G_REGEX_MATCH_ANCHORED = 16,
	G_REGEX_MATCH_NOTBOL = 128,
	G_REGEX_MATCH_NOTEOL = 256,
	G_REGEX_MATCH_NOTEMPTY = 1024,
	G_REGEX_MATCH_PARTIAL = 32768,
	G_REGEX_MATCH_NEWLINE_CR = 1048576,
	G_REGEX_MATCH_NEWLINE_LF = 2097152,
	G_REGEX_MATCH_NEWLINE_CRLF = 3145728,
	G_REGEX_MATCH_NEWLINE_ANY = 4194304
}

struct _GRegex;


struct _GMatchInfo;

extern( C ) nothrow 
{
    alias da_g_regex_error_quark = GQuark function();																																														
    alias da_g_regex_new = GRegex* function(const(gchar)* pattern, GRegexCompileFlags compile_options, GRegexMatchFlags match_options, GError** error);																						
    alias da_g_regex_ref = GRegex* function(GRegex* regex);																																													
    alias da_g_regex_unref = void function(GRegex* regex);																																													
    alias da_g_regex_get_pattern = const(gchar)* function(const(GRegex)* regex);																																							
    alias da_g_regex_get_max_backref = gint function(const(GRegex)* regex);																																									
    alias da_g_regex_get_capture_count = gint function(const(GRegex)* regex);		
    alias da_g_regex_get_has_cr_or_lf = gboolean function(const GRegex *regex);
    alias da_g_regex_get_string_number = gint function(const(GRegex)* regex, const(gchar)* name);																																			
    alias da_g_regex_escape_string = gchar* function(const(gchar)* string, gint length);																																					
    alias da_g_regex_escape_nul = gchar* function(const(gchar)* string, gint length);																																						
    alias da_g_regex_get_compile_flags = GRegexCompileFlags function(const(GRegex)* regex);																																					
    alias da_g_regex_get_match_flags = GRegexMatchFlags function(const(GRegex)* regex);																																						
    alias da_g_regex_match_simple = gboolean function(const(gchar)* pattern, const(gchar)* string, GRegexCompileFlags compile_options, GRegexMatchFlags match_options);																		
    alias da_g_regex_match = gboolean function(const(GRegex)* regex, const(gchar)* string, GRegexMatchFlags match_options, GMatchInfo** match_info);																						
    alias da_g_regex_match_full = gboolean function(const(GRegex)* regex, const(gchar)* string, gssize string_len, gint start_position, GRegexMatchFlags match_options, GMatchInfo** match_info, GError** error);							
    alias da_g_regex_match_all = gboolean function(const(GRegex)* regex, const(gchar)* string, GRegexMatchFlags match_options, GMatchInfo** match_info);																					
    alias da_g_regex_match_all_full = gboolean function(const(GRegex)* regex, const(gchar)* string, gssize string_len, gint start_position, GRegexMatchFlags match_options, GMatchInfo** match_info, GError** error);						
    alias da_g_regex_split_simple = gchar** function(const(gchar)* pattern, const(gchar)* string, GRegexCompileFlags compile_options, GRegexMatchFlags match_options);																		
    alias da_g_regex_split = gchar** function(const(GRegex)* regex, const(gchar)* string, GRegexMatchFlags match_options);																													
    alias da_g_regex_split_full = gchar** function(const(GRegex)* regex, const(gchar)* string, gssize string_len, gint start_position, GRegexMatchFlags match_options, gint max_tokens, GError** error);									
    alias da_g_regex_replace = gchar* function(const(GRegex)* regex, const(gchar)* string, gssize string_len, gint start_position, const(gchar)* replacement, GRegexMatchFlags match_options, GError** error);								
    alias da_g_regex_replace_literal = gchar* function(const(GRegex)* regex, const(gchar)* string, gssize string_len, gint start_position, const(gchar)* replacement, GRegexMatchFlags match_options, GError** error);						
    alias da_g_regex_replace_eval = gchar* function(const(GRegex)* regex, const(gchar)* string, gssize string_len, gint start_position, GRegexMatchFlags match_options, GRegexEvalCallback eval, gpointer user_data, GError** error);		
    alias da_g_regex_check_replacement = gboolean function(const(gchar)* replacement, gboolean* has_references, GError** error);																											
    alias da_g_match_info_get_regex = GRegex* function(const(GMatchInfo)* match_info);																																						
    alias da_g_match_info_get_string = const(gchar)* function(const(GMatchInfo)* match_info);																																				
    alias da_g_match_info_ref = GMatchInfo* function(GMatchInfo* match_info);																																								
    alias da_g_match_info_unref = void function(GMatchInfo* match_info);																																									
    alias da_g_match_info_free = void function(GMatchInfo* match_info);																																										
    alias da_g_match_info_next = gboolean function(GMatchInfo* match_info, GError** error);																																					
    alias da_g_match_info_matches = gboolean function(const(GMatchInfo)* match_info);																																						
    alias da_g_match_info_get_match_count = gint function(const(GMatchInfo)* match_info);																																					
    alias da_g_match_info_is_partial_match = gboolean function(const(GMatchInfo)* match_info);																																				
    alias da_g_match_info_expand_references = gchar* function(const(GMatchInfo)* match_info, const(gchar)* string_to_expand, GError** error);																								
    alias da_g_match_info_fetch = gchar* function(const(GMatchInfo)* match_info, gint match_num);																																			
    alias da_g_match_info_fetch_pos = gboolean function(const(GMatchInfo)* match_info, gint match_num, gint* start_pos, gint* end_pos);																										
    alias da_g_match_info_fetch_named = gchar* function(const(GMatchInfo)* match_info, const(gchar)* name);																																	
    alias da_g_match_info_fetch_named_pos = gboolean function(const(GMatchInfo)* match_info, const(gchar)* name, gint* start_pos, gint* end_pos);																							
    alias da_g_match_info_fetch_all = gchar** function(const(GMatchInfo)* match_info);				
}

__gshared
{
    da_g_regex_error_quark g_regex_error_quark; 
    da_g_regex_new g_regex_new; 
    da_g_regex_ref g_regex_ref; 
    da_g_regex_unref g_regex_unref; 
    da_g_regex_get_pattern g_regex_get_pattern; 
    da_g_regex_get_max_backref g_regex_get_max_backref; 
    da_g_regex_get_capture_count g_regex_get_capture_count; 
    da_g_regex_get_has_cr_or_lf g_regex_get_has_cr_or_lf;
    da_g_regex_get_string_number g_regex_get_string_number; 
    da_g_regex_escape_string g_regex_escape_string; 
    da_g_regex_escape_nul g_regex_escape_nul; 
    da_g_regex_get_compile_flags g_regex_get_compile_flags; 
    da_g_regex_get_match_flags g_regex_get_match_flags; 
    da_g_regex_match_simple g_regex_match_simple; 
    da_g_regex_match g_regex_match; 
    da_g_regex_match_full g_regex_match_full; 
    da_g_regex_match_all g_regex_match_all; 
    da_g_regex_match_all_full g_regex_match_all_full; 
    da_g_regex_split_simple g_regex_split_simple; 
    da_g_regex_split g_regex_split; 
    da_g_regex_split_full g_regex_split_full; 
    da_g_regex_replace g_regex_replace; 
    da_g_regex_replace_literal g_regex_replace_literal; 
    da_g_regex_replace_eval g_regex_replace_eval; 
    da_g_regex_check_replacement g_regex_check_replacement; 
    da_g_match_info_get_regex g_match_info_get_regex; 
    da_g_match_info_get_string g_match_info_get_string; 
    da_g_match_info_ref g_match_info_ref; 
    da_g_match_info_unref g_match_info_unref; 
    da_g_match_info_free g_match_info_free; 
    da_g_match_info_next g_match_info_next; 
    da_g_match_info_matches g_match_info_matches; 
    da_g_match_info_get_match_count g_match_info_get_match_count; 
    da_g_match_info_is_partial_match g_match_info_is_partial_match; 
    da_g_match_info_expand_references g_match_info_expand_references; 
    da_g_match_info_fetch g_match_info_fetch; 
    da_g_match_info_fetch_pos g_match_info_fetch_pos; 
    da_g_match_info_fetch_named g_match_info_fetch_named; 
    da_g_match_info_fetch_named_pos g_match_info_fetch_named_pos; 
    da_g_match_info_fetch_all g_match_info_fetch_all; 
}