/* c99portability.h */


#if !defined(__GNUC__)
#	if (!defined(__cplusplus__) || !defined(__STDC_VERSION__) ||  (__STDC_VERSION__ < 199901L)) && !defined(inline)
#		define inline
#	endif
#endif
