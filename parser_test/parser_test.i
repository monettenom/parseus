

#pragma once
#pragma once
extern "C" {
}

#pragma once
#pragma comment(linker,"/manifestdependency:\"type='win32' "            \
        "name='" "Microsoft.VC80" ".CRT' "              \
        "version='" "8.0.50608.0" "' "                          \
        "processorArchitecture='x86' "                                  \
        "publicKeyToken='" "1fc8b3b9a1e18e3b" "'\"")
#pragma pack(push,8)
#pragma once

#pragma pack(push,8)
extern "C" {
typedef __w64 unsigned int   uintptr_t;
typedef char *  va_list;

}
#pragma pack(pop)
extern "C" {
typedef __w64 unsigned int   size_t;
typedef size_t rsize_t;
typedef __w64 int            intptr_t;

typedef __w64 int            ptrdiff_t;
typedef unsigned short wint_t;
typedef unsigned short wctype_t;
__declspec(deprecated("This name was supported during some Whidbey pre-releases. Instead, use the standard name errno_t.")) typedef int errcode;
typedef int errno_t;
typedef __w64 long __time32_t;

typedef __int64 __time64_t;
typedef __time64_t time_t;
struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct * pthreadlocinfo;
typedef struct threadmbcinfostruct * pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct
{
    pthreadlocinfo locinfo;
    pthreadmbcinfo mbcinfo;
} _locale_tstruct, *_locale_t;
typedef struct tagLC_ID {
        unsigned short wLanguage;
        unsigned short wCountry;
        unsigned short wCodePage;
} LC_ID, *LPLC_ID;
typedef struct threadlocaleinfostruct {
        int refcount;
        unsigned int lc_codepage;
        unsigned int lc_collate_cp;
        unsigned long lc_handle[6];
        LC_ID lc_id[6];
        struct {
            char *locale;
            wchar_t *wlocale;
            int *refcount;
            int *wrefcount;
        } lc_category[6];
        int lc_clike;
        int mb_cur_max;
        int * lconv_intl_refcount;
        int * lconv_num_refcount;
        int * lconv_mon_refcount;
        struct lconv * lconv;
        int * ctype1_refcount;
        unsigned short * ctype1;
        const unsigned short * pctype;
        const unsigned char * pclmap;
        const unsigned char * pcumap;
        struct __lc_time_data * lc_time_curr;
} threadlocinfo;
}
#pragma pack(pop)
#pragma pack(push,8)
extern "C" {
struct _iobuf {
        char *_ptr;
        int   _cnt;
        char *_base;
        int   _flag;
        int   _file;
        int   _charbuf;
        int   _bufsiz;
        char *_tmpfname;
        };
typedef struct _iobuf FILE;

__declspec(dllimport) FILE * __cdecl __iob_func(void);
typedef __int64 fpos_t;
__declspec(dllimport)  int __cdecl _filbuf(     FILE * _File );
__declspec(dllimport)  int __cdecl _flsbuf(     int _Ch,      FILE * _File);
__declspec(dllimport)  FILE * __cdecl _fsopen(       const char * _Filename,        const char * _Mode,      int _ShFlag);
__declspec(dllimport) void __cdecl clearerr(     FILE * _File);
__declspec(dllimport)  errno_t __cdecl clearerr_s(     FILE * _File );
__declspec(dllimport)  int __cdecl fclose(     FILE * _File);
__declspec(dllimport)  int __cdecl _fcloseall(void);
__declspec(dllimport)  FILE * __cdecl _fdopen(     int _FileHandle,        const char * _Mode);
__declspec(dllimport)  int __cdecl feof(     FILE * _File);
__declspec(dllimport)  int __cdecl ferror(     FILE * _File);
__declspec(dllimport)  int __cdecl fflush(       FILE * _File);
__declspec(dllimport)  int __cdecl fgetc(     FILE * _File);
__declspec(dllimport)  int __cdecl _fgetchar(void);
__declspec(dllimport)  int __cdecl fgetpos(     FILE * _File ,      fpos_t * _Pos);
__declspec(dllimport)  char * __cdecl fgets(       char * _Buf,      int _MaxCount,      FILE * _File);
__declspec(dllimport)  int __cdecl _fileno(     FILE * _File);
__declspec(dllimport)  char * __cdecl _tempnam(         const char * _DirName,          const char * _FilePrefix);

__declspec(dllimport)  int __cdecl _flushall(void);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "fopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  FILE * __cdecl fopen(       const char * _Filename,        const char * _Mode);

__declspec(dllimport)  errno_t __cdecl fopen_s(                  FILE ** _File,        const char * _Filename,        const char * _Mode);

__declspec(dllimport)  int __cdecl fprintf(     FILE * _File,         const char * _Format, ...);
__declspec(dllimport)  int __cdecl fprintf_s(     FILE * _File,         const char * _Format, ...);
__declspec(dllimport)  int __cdecl fputc(     int _Ch,      FILE * _File);
__declspec(dllimport)  int __cdecl _fputchar(     int _Ch);
__declspec(dllimport)  int __cdecl fputs(       const char * _Str,      FILE * _File);
__declspec(dllimport)  size_t __cdecl fread(     void * _DstBuf,      size_t _ElementSize,      size_t _Count,      FILE * _File);
__declspec(dllimport)  size_t __cdecl fread_s(     void * _DstBuf,      size_t _DstSize,      size_t _ElementSize,      size_t _Count,      FILE * _File);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "freopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  FILE * __cdecl freopen(       const char * _Filename,        const char * _Mode,      FILE * _File);

__declspec(dllimport)  errno_t __cdecl freopen_s(                  FILE ** _File,        const char * _Filename,        const char * _Mode,      FILE * _OldFile);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "fscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl fscanf(     FILE * _File,         const char * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_fscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _fscanf_l(     FILE * _File,         const char * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  int __cdecl fscanf_s(     FILE * _File,         const char * _Format, ...);

__declspec(dllimport)  int __cdecl _fscanf_s_l(     FILE * _File,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl fsetpos(     FILE * _File,      const fpos_t * _Pos);
__declspec(dllimport)  int __cdecl fseek(     FILE * _File,      long _Offset,      int _Origin);
__declspec(dllimport)  long __cdecl ftell(     FILE * _File);

__declspec(dllimport)  int __cdecl _fseeki64(     FILE * _File,      __int64 _Offset,      int _Origin);
__declspec(dllimport)  __int64 __cdecl _ftelli64(     FILE * _File);

__declspec(dllimport)  size_t __cdecl fwrite(       const void * _Str,      size_t _Size,      size_t _Count,      FILE * _File);
__declspec(dllimport)  int __cdecl getc(     FILE * _File);
__declspec(dllimport)  int __cdecl getchar(void);
__declspec(dllimport)  int __cdecl _getmaxstdio(void);

__declspec(dllimport) char * __cdecl gets_s(       char * _Buf,      rsize_t _Size);

extern "C++" { template <size_t _Size> inline char * __cdecl gets_s(     char (&_Buffer)[_Size]) { return gets_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "gets_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl gets( char *_Buffer);
 int __cdecl _getw(     FILE * _File);
__declspec(dllimport) void __cdecl perror(         const char * _ErrMsg);

__declspec(dllimport)  int __cdecl _pclose(     FILE * _File);
__declspec(dllimport)  FILE * __cdecl _popen(       const char * _Command,        const char * _Mode);
__declspec(dllimport)  int __cdecl printf(        const char * _Format, ...);
__declspec(dllimport)  int __cdecl printf_s(        const char * _Format, ...);
__declspec(dllimport)  int __cdecl putc(     int _Ch,      FILE * _File);
__declspec(dllimport)  int __cdecl putchar(     int _Ch);
__declspec(dllimport)  int __cdecl puts(       const char * _Str);
__declspec(dllimport)  int __cdecl _putw(     int _Word,      FILE * _File);
__declspec(dllimport)  int __cdecl remove(       const char * _Filename);
__declspec(dllimport)  int __cdecl rename(       const char * _OldFilename,        const char * _NewFilename);
__declspec(dllimport)  int __cdecl _unlink(       const char * _Filename);

__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_unlink" ". See online help for details.")) __declspec(dllimport)  int __cdecl unlink(       const char * _Filename);
__declspec(dllimport) void __cdecl rewind(     FILE * _File);
__declspec(dllimport)  int __cdecl _rmtmp(void);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "scanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl scanf(        const char * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_scanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _scanf_l(        const char * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  int __cdecl scanf_s(        const char * _Format, ...);

__declspec(dllimport)  int __cdecl _scanf_s_l(        const char * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "setvbuf" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void __cdecl setbuf(     FILE * _File,              char * _Buffer);
__declspec(dllimport)  int __cdecl _setmaxstdio(     int _Max);
__declspec(dllimport)  unsigned int __cdecl _set_output_format(     unsigned int _Format);
__declspec(dllimport)  unsigned int __cdecl _get_output_format(void);
__declspec(dllimport)  int __cdecl setvbuf(     FILE * _File,          char * _Buf,      int _Mode,      size_t _Size);
__declspec(dllimport)  int __cdecl _snprintf_s(       char * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const char * _Format, ...);
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl _snprintf_s(     char (&_Dest)[_Size],      size_t _Size,         const char * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return _vsnprintf_s(_Dest, _Size, _Size, _Format, _ArgList); } __pragma(warning(pop)); }
__declspec(dllimport)  int __cdecl sprintf_s(       char * _DstBuf,      size_t _DstSize,         const char * _Format, ...);
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl sprintf_s(     char (&_Dest)[_Size],         const char * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return vsprintf_s(_Dest, _Size, _Format, _ArgList); } __pragma(warning(pop)); }
__declspec(dllimport)  int __cdecl _scprintf(        const char * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "sscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl sscanf(       const char * _Src,         const char * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_sscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _sscanf_l(       const char * _Src,         const char * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  int __cdecl sscanf_s(       const char * _Src,         const char * _Format, ...);

__declspec(dllimport)  int __cdecl _sscanf_s_l(       const char * _Src,         const char * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _snscanf(         const char * _Src,      size_t _MaxCount,         const char * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _snscanf_l(         const char * _Src,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _snscanf_s(         const char * _Src,      size_t _MaxCount,         const char * _Format, ...);
__declspec(dllimport)  int __cdecl _snscanf_s_l(         const char * _Src,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "tmpfile_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  FILE * __cdecl tmpfile(void);

__declspec(dllimport)  errno_t __cdecl tmpfile_s(                FILE ** _File);
__declspec(dllimport)  errno_t __cdecl tmpnam_s(       char * _Buf,      rsize_t _Size);

extern "C++" { template <size_t _Size> inline errno_t __cdecl tmpnam_s(       char (&_Buf)[_Size]) { return tmpnam_s(_Buf, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "tmpnam_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl tmpnam( char *_Buffer);
__declspec(dllimport)  int __cdecl ungetc(     int _Ch,      FILE * _File);
__declspec(dllimport)  int __cdecl vfprintf(     FILE * _File,         const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vfprintf_s(     FILE * _File,         const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vprintf(        const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vprintf_s(        const char * _Format, va_list _ArgList);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "vsnprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl vsnprintf(     char * _DstBuf,      size_t _MaxCount,         const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vsnprintf_s(       char * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsnprintf_s(       char * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const char * _Format, va_list _ArgList);
extern "C++" { template <size_t _Size> inline int __cdecl _vsnprintf_s(     char (&_Dest)[_Size],      size_t _Size,         const char * _Format, va_list _Args) { return _vsnprintf_s(_Dest, _Size, _Size, _Format, _Args); } }
#pragma warning(push)
#pragma warning(disable:4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl _snprintf(     char *_Dest,      size_t _Count,         const char * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl _vsnprintf(     char *_Dest,      size_t _Count,         const char * _Format, va_list _Args);
#pragma warning(pop)
__declspec(dllimport) int __cdecl vsprintf_s(       char * _DstBuf,      size_t _Size,         const char * _Format, va_list _ArgList);
extern "C++" { template <size_t _Size> inline int __cdecl vsprintf_s(     char (&_Dest)[_Size],         const char * _Format, va_list _Args) { return vsprintf_s(_Dest, _Size, _Format, _Args); } }
#pragma warning(push)
#pragma warning(disable:4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "sprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl sprintf( char *_Dest,  const char * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "vsprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl vsprintf( char *_Dest,  const char * _Format, va_list _Args);
#pragma warning(pop)
__declspec(dllimport)  int __cdecl _vscprintf(        const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _snprintf_c(     char * _DstBuf,      size_t _MaxCount,         const char * _Format, ...);
__declspec(dllimport)  int __cdecl _vsnprintf_c(     char *_DstBuf,      size_t _MaxCount,         const char * _Format, va_list _ArgList);

__declspec(dllimport)  int __cdecl _fprintf_p(     FILE * _File,         const char * _Format, ...);
__declspec(dllimport)  int __cdecl _printf_p(        const char * _Format, ...);
__declspec(dllimport)  int __cdecl _sprintf_p(       char * _Dst,      size_t _MaxCount,         const char * _Format, ...);
__declspec(dllimport)  int __cdecl _vfprintf_p(     FILE * _File,         const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vprintf_p(        const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsprintf_p(       char * _Dst,      size_t _MaxCount,         const char * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _scprintf_p(        const char * _Format, ...);
__declspec(dllimport)  int __cdecl _vscprintf_p(        const char * _Format, va_list _ArgList);
__declspec(dllimport) int __cdecl _set_printf_count_output(     int _Value);
__declspec(dllimport) int __cdecl _get_printf_count_output();

__declspec(dllimport)  int __cdecl _printf_l(        const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _printf_p_l(        const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _printf_s_l(        const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vprintf_l(        const char * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vprintf_p_l(        const char * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vprintf_s_l(        const char * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(dllimport)  int __cdecl _fprintf_l(     FILE * _File,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _fprintf_p_l(     FILE * _File,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _fprintf_s_l(     FILE * _File,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vfprintf_l(     FILE * _File,        const char * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vfprintf_p_l(     FILE * _File,        const char * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vfprintf_s_l(     FILE * _File,        const char * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_sprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _sprintf_l(     char * _DstBuf,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _sprintf_p_l(       char * _DstBuf,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _sprintf_s_l(       char * _DstBuf,      size_t _DstSize,         const char * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _vsprintf_l(     char * _DstBuf,        const char * _Format,        _locale_t, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsprintf_p_l(       char * _DstBuf,      size_t _MaxCount,         const char* _Format,        _locale_t _Locale,  va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsprintf_s_l(       char * _DstBuf,      size_t _DstSize,         const char * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(dllimport)  int __cdecl _scprintf_l(        const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _scprintf_p_l(        const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vscprintf_l(        const char * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vscprintf_p_l(        const char * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _snprintf_l(     char * _DstBuf,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _snprintf_c_l(     char * _DstBuf,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _snprintf_s_l(       char * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _vsnprintf_l(     char * _DstBuf,      size_t _MaxCount,         const char * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsnprintf_c_l(     char * _DstBuf,      size_t _MaxCount, const char *,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsnprintf_s_l(       char * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const char* _Format,       _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  FILE * __cdecl _wfsopen(       const wchar_t * _Filename,        const wchar_t * _Mode,      int _ShFlag);
__declspec(dllimport)  wint_t __cdecl fgetwc(     FILE * _File);
__declspec(dllimport)  wint_t __cdecl _fgetwchar(void);
__declspec(dllimport)  wint_t __cdecl fputwc(       wchar_t _Ch,      FILE * _File);
__declspec(dllimport)  wint_t __cdecl _fputwchar(       wchar_t _Ch);
__declspec(dllimport)  wint_t __cdecl getwc(     FILE * _File);
__declspec(dllimport)  wint_t __cdecl getwchar(void);
__declspec(dllimport)  wint_t __cdecl putwc(       wchar_t _Ch,      FILE * _File);
__declspec(dllimport)  wint_t __cdecl putwchar(       wchar_t _Ch);
__declspec(dllimport)  wint_t __cdecl ungetwc(     wint_t _Ch,      FILE * _File);

__declspec(dllimport)  wchar_t * __cdecl fgetws(       wchar_t * _Dst,      int _SizeInWords,      FILE * _File);
__declspec(dllimport)  int __cdecl fputws(       const wchar_t * _Str,      FILE * _File);
__declspec(dllimport)  wchar_t * __cdecl _getws_s(       wchar_t * _Str,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline wchar_t * __cdecl _getws_s(     wchar_t (&_String)[_Size]) { return _getws_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_getws_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _getws( wchar_t *_String);
__declspec(dllimport)  int __cdecl _putws(       const wchar_t * _Str);

__declspec(dllimport)  int __cdecl fwprintf(     FILE * _File,         const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl fwprintf_s(     FILE * _File,         const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl wprintf(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl wprintf_s(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _scwprintf(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl vfwprintf(     FILE * _File,         const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vfwprintf_s(     FILE * _File,         const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vwprintf(        const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl vwprintf_s(        const wchar_t * _Format, va_list _ArgList);

__declspec(dllimport) int __cdecl swprintf_s(       wchar_t * _Dst,      size_t _SizeInWords,         const wchar_t * _Format, ...);
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl swprintf_s(     wchar_t (&_Dest)[_Size],         const wchar_t * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return vswprintf_s(_Dest, _Size, _Format, _ArgList); } __pragma(warning(pop)); }
__declspec(dllimport) int __cdecl vswprintf_s(       wchar_t * _Dst,      size_t _SizeInWords,         const wchar_t * _Format, va_list _ArgList);
extern "C++" { template <size_t _Size> inline int __cdecl vswprintf_s(     wchar_t (&_Dest)[_Size],         const wchar_t * _Format, va_list _Args) { return vswprintf_s(_Dest, _Size, _Format, _Args); } }

__declspec(dllimport)  int __cdecl _swprintf_c(       wchar_t * _DstBuf,      size_t _SizeInWords,         const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _vswprintf_c(       wchar_t * _DstBuf,      size_t _SizeInWords,         const wchar_t * _Format, va_list _ArgList);

__declspec(dllimport)  int __cdecl _snwprintf_s(       wchar_t * _DstBuf,      size_t _DstSizeInWords,      size_t _MaxCount,         const wchar_t * _Format, ...);
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl _snwprintf_s(     wchar_t (&_Dest)[_Size],      size_t _Count,         const wchar_t * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return _vsnwprintf_s(_Dest, _Size, _Count, _Format, _ArgList); } __pragma(warning(pop)); }
__declspec(dllimport)  int __cdecl _vsnwprintf_s(       wchar_t * _DstBuf,      size_t _DstSizeInWords,      size_t _MaxCount,         const wchar_t * _Format, va_list _ArgList);
extern "C++" { template <size_t _Size> inline int __cdecl _vsnwprintf_s(     wchar_t (&_Dest)[_Size],      size_t _Count,         const wchar_t * _Format, va_list _Args) { return _vsnwprintf_s(_Dest, _Size, _Count, _Format, _Args); } }
#pragma warning(push)
#pragma warning(disable:4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl _snwprintf(     wchar_t *_Dest,      size_t _Count,         const wchar_t * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl _vsnwprintf(     wchar_t *_Dest,      size_t _Count,         const wchar_t * _Format, va_list _Args);
#pragma warning(pop)

__declspec(dllimport)  int __cdecl _fwprintf_p(     FILE * _File,         const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _wprintf_p(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _vfwprintf_p(     FILE * _File,         const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vwprintf_p(        const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _swprintf_p(       wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _vswprintf_p(       wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _scwprintf_p(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _vscwprintf_p(        const wchar_t * _Format, va_list _ArgList);

__declspec(dllimport)  int __cdecl _wprintf_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _wprintf_p_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _wprintf_s_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vwprintf_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vwprintf_p_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vwprintf_s_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(dllimport)  int __cdecl _fwprintf_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _fwprintf_p_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _fwprintf_s_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vfwprintf_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vfwprintf_p_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vfwprintf_s_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(dllimport)  int __cdecl _swprintf_c_l(       wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _swprintf_p_l(       wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _swprintf_s_l(       wchar_t * _DstBuf,      size_t _DstSize,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vswprintf_c_l(       wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vswprintf_p_l(       wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vswprintf_s_l(       wchar_t * _DstBuf,      size_t _DstSize,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(dllimport)  int __cdecl _scwprintf_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _scwprintf_p_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vscwprintf_p_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _snwprintf_l(     wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _snwprintf_s_l(       wchar_t * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _vsnwprintf_l(     wchar_t * _DstBuf,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vsnwprintf_s_l(       wchar_t * _DstBuf,      size_t _DstSize,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);

#pragma warning(push)
#pragma warning(disable:4141 4996 4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_swprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl _swprintf(     wchar_t *_Dest,         const wchar_t * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "vswprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl _vswprintf(     wchar_t *_Dest,         const wchar_t * _Format, va_list _Args);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "__swprintf_l_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl __swprintf_l(     wchar_t *_Dest,         const wchar_t * _Format, _locale_t _Plocinfo, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vswprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl __vswprintf_l(     wchar_t *_Dest,         const wchar_t * _Format, _locale_t _Plocinfo, va_list _Args);
#pragma warning(pop)
#pragma once
#pragma warning( push )
#pragma warning( disable : 4793 4412 )
static __inline int swprintf(wchar_t * _String, size_t _Count, const wchar_t * _Format, ...)
{
    va_list _Arglist;
    int _Ret;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    _Ret = _vswprintf_c_l(_String, _Count, _Format, 0, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4412 )
static __inline int __cdecl vswprintf(wchar_t * _String, size_t _Count, const wchar_t * _Format, va_list _Ap)
{
    return _vswprintf_c_l(_String, _Count, _Format, 0, _Ap);
}
#pragma warning( pop )
#pragma warning( push )
#pragma warning( disable : 4793 4412 )
static __inline int _swprintf_l(wchar_t * _String, size_t _Count, const wchar_t * _Format, _locale_t _Plocinfo, ...)
{
    va_list _Arglist;
    int _Ret;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Plocinfo) ) + ( (sizeof(_Plocinfo) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    _Ret = _vswprintf_c_l(_String, _Count, _Format, _Plocinfo, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4412 )
static __inline int __cdecl _vswprintf_l(wchar_t * _String, size_t _Count, const wchar_t * _Format, _locale_t _Plocinfo, va_list _Ap)
{
    return _vswprintf_c_l(_String, _Count, _Format, _Plocinfo, _Ap);
}
#pragma warning( pop )
#pragma warning( push )
#pragma warning( disable : 4996 )

#pragma warning( push )
#pragma warning( disable : 4793 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "swprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline int swprintf(     wchar_t * _String,         const wchar_t * _Format, ...)
{
    va_list _Arglist;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    int _Ret = _vswprintf(_String, _Format, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "vswprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline int __cdecl vswprintf(     wchar_t * _String,         const wchar_t * _Format, va_list _Ap)
{
    return _vswprintf(_String, _Format, _Ap);
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4793 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_swprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline int _swprintf_l(     wchar_t * _String,         const wchar_t * _Format, _locale_t _Plocinfo, ...)
{
    va_list _Arglist;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Plocinfo) ) + ( (sizeof(_Plocinfo) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    int _Ret = __vswprintf_l(_String, _Format, _Plocinfo, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vswprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline int __cdecl _vswprintf_l(     wchar_t * _String,         const wchar_t * _Format, _locale_t _Plocinfo, va_list _Ap)
{
    return __vswprintf_l(_String, _Format, _Plocinfo, _Ap);
}
#pragma warning( pop )

#pragma warning( pop )
__declspec(dllimport)  wchar_t * __cdecl _wtempnam(         const wchar_t * _Directory,          const wchar_t * _FilePrefix);

__declspec(dllimport)  int __cdecl _vscwprintf(        const wchar_t * _Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vscwprintf_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "fwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl fwscanf(     FILE * _File,         const wchar_t * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_fwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _fwscanf_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  int __cdecl fwscanf_s(     FILE * _File,         const wchar_t * _Format, ...);

__declspec(dllimport)  int __cdecl _fwscanf_s_l(     FILE * _File,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "swscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl swscanf(       const wchar_t * _Src,         const wchar_t * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_swscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _swscanf_l(       const wchar_t * _Src,         const wchar_t * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  int __cdecl swscanf_s(       const wchar_t *_Src,         const wchar_t * _Format, ...);

__declspec(dllimport)  int __cdecl _swscanf_s_l(       const wchar_t * _Src,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _snwscanf(         const wchar_t * _Src,      size_t _MaxCount,         const wchar_t * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _snwscanf_l(         const wchar_t * _Src,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _snwscanf_s(         const wchar_t * _Src,      size_t _MaxCount,         const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _snwscanf_s_l(         const wchar_t * _Src,      size_t _MaxCount,         const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl wscanf(        const wchar_t * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _wscanf_l(        const wchar_t * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  int __cdecl wscanf_s(        const wchar_t * _Format, ...);

__declspec(dllimport)  int __cdecl _wscanf_s_l(        const wchar_t * _Format,        _locale_t _Locale, ...);

__declspec(dllimport)  FILE * __cdecl _wfdopen(     int _FileHandle ,        const wchar_t * _Mode);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wfopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  FILE * __cdecl _wfopen(       const wchar_t * _Filename,        const wchar_t * _Mode);
__declspec(dllimport)  errno_t __cdecl _wfopen_s(                  FILE ** _File,        const wchar_t * _Filename,        const wchar_t * _Mode);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wfreopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  FILE * __cdecl _wfreopen(       const wchar_t * _Filename,        const wchar_t * _Mode,      FILE * _OldFile);
__declspec(dllimport)  errno_t __cdecl _wfreopen_s(                  FILE ** _File,        const wchar_t * _Filename,        const wchar_t * _Mode,      FILE * _OldFile);
__declspec(dllimport) void __cdecl _wperror(         const wchar_t * _ErrMsg);

__declspec(dllimport)  FILE * __cdecl _wpopen(       const wchar_t *_Command,        const wchar_t * _Mode);
__declspec(dllimport)  int __cdecl _wremove(       const wchar_t * _Filename);
__declspec(dllimport)  errno_t __cdecl _wtmpnam_s(       wchar_t * _DstBuf,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wtmpnam_s(       wchar_t (&_Buffer)[_Size]) { return _wtmpnam_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wtmpnam_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wtmpnam( wchar_t *_Buffer);

__declspec(dllimport)  wint_t __cdecl _fgetwc_nolock(     FILE * _File);
__declspec(dllimport)  wint_t __cdecl _fputwc_nolock(       wchar_t _Ch,      FILE * _File);
__declspec(dllimport)  wint_t __cdecl _ungetwc_nolock(     wint_t _Ch,      FILE * _File);
inline wint_t __cdecl getwchar()
        {return (fgetwc((&__iob_func()[0]))); }
inline wint_t __cdecl putwchar(wchar_t _C)
        {return (fputwc(_C, (&__iob_func()[1]))); }
__declspec(dllimport) void __cdecl _lock_file(     FILE * _File);
__declspec(dllimport) void __cdecl _unlock_file(     FILE * _File);
__declspec(dllimport)  int __cdecl _fclose_nolock(     FILE * _File);
__declspec(dllimport)  int __cdecl _fflush_nolock(       FILE * _File);
__declspec(dllimport)  size_t __cdecl _fread_nolock(     void * _DstBuf,      size_t _ElementSize,      size_t _Count,      FILE * _File);
__declspec(dllimport)  size_t __cdecl _fread_nolock_s(     void * _DstBuf,      size_t _DstSize,      size_t _ElementSize,      size_t _Count,      FILE * _File);
__declspec(dllimport)  int __cdecl _fseek_nolock(     FILE * _File,      long _Offset,      int _Origin);
__declspec(dllimport)  long __cdecl _ftell_nolock(     FILE * _File);
__declspec(dllimport)  int __cdecl _fseeki64_nolock(     FILE * _File,      __int64 _Offset,      int _Origin);
__declspec(dllimport)  __int64 __cdecl _ftelli64_nolock(     FILE * _File);
__declspec(dllimport)  size_t __cdecl _fwrite_nolock(       const void * _DstBuf,      size_t _Size,      size_t _Count,      FILE * _File);
__declspec(dllimport)  int __cdecl _ungetc_nolock(     int _Ch,      FILE * _File);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_tempnam" ". See online help for details.")) __declspec(dllimport) char * __cdecl tempnam(         const char * _Directory,          const char * _FilePrefix);

__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fcloseall" ". See online help for details.")) __declspec(dllimport)  int __cdecl fcloseall(void);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fdopen" ". See online help for details.")) __declspec(dllimport)  FILE * __cdecl fdopen(     int _FileHandle,         const char * _Format);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fgetchar" ". See online help for details.")) __declspec(dllimport)  int __cdecl fgetchar(void);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fileno" ". See online help for details.")) __declspec(dllimport)  int __cdecl fileno(     FILE * _File);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_flushall" ". See online help for details.")) __declspec(dllimport)  int __cdecl flushall(void);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fputchar" ". See online help for details.")) __declspec(dllimport)  int __cdecl fputchar(     int _Ch);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_getw" ". See online help for details.")) __declspec(dllimport)  int __cdecl getw(     FILE * _File);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_putw" ". See online help for details.")) __declspec(dllimport)  int __cdecl putw(     int _Ch,      FILE * _File);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_rmtmp" ". See online help for details.")) __declspec(dllimport)  int __cdecl rmtmp(void);
}
#pragma pack(pop)
#pragma once
#pragma warning(disable:4514)

extern "C" {
#pragma deprecated("_ftcscat")
#pragma deprecated("_ftcschr")
#pragma deprecated("_ftcscpy")
#pragma deprecated("_ftcscspn")
#pragma deprecated("_ftcslen")
#pragma deprecated("_ftcsncat")
#pragma deprecated("_ftcsncpy")
#pragma deprecated("_ftcspbrk")
#pragma deprecated("_ftcsrchr")
#pragma deprecated("_ftcsspn")
#pragma deprecated("_ftcsstr")
#pragma deprecated("_ftcstok")
#pragma deprecated("_ftcsdup")
#pragma deprecated("_ftcsnset")
#pragma deprecated("_ftcsrev")
#pragma deprecated("_ftcsset")
#pragma deprecated("_ftcscmp")
#pragma deprecated("_ftcsicmp")
#pragma deprecated("_ftcsnccmp")
#pragma deprecated("_ftcsncmp")
#pragma deprecated("_ftcsncicmp")
#pragma deprecated("_ftcsnicmp")
#pragma deprecated("_ftcscoll")
#pragma deprecated("_ftcsicoll")
#pragma deprecated("_ftcsnccoll")
#pragma deprecated("_ftcsncoll")
#pragma deprecated("_ftcsncicoll")
#pragma deprecated("_ftcsnicoll")
#pragma deprecated("_ftcsclen")
#pragma deprecated("_ftcsnccat")
#pragma deprecated("_ftcsnccpy")
#pragma deprecated("_ftcsncset")
#pragma deprecated("_ftcsdec")
#pragma deprecated("_ftcsinc")
#pragma deprecated("_ftcsnbcnt")
#pragma deprecated("_ftcsnccnt")
#pragma deprecated("_ftcsnextc")
#pragma deprecated("_ftcsninc")
#pragma deprecated("_ftcsspnp")
#pragma deprecated("_ftcslwr")
#pragma deprecated("_ftcsupr")
#pragma deprecated("_ftclen")
#pragma deprecated("_ftccpy")
#pragma deprecated("_ftccmp")
}
#pragma once
extern "C" {
__declspec(dllimport) void *  __cdecl _memccpy(        void * _Dst,      const void * _Src,      int _Val,      size_t _MaxCount);
__declspec(dllimport)  const void *  __cdecl memchr(          const void * _Buf ,      int _Val,      size_t _MaxCount);
__declspec(dllimport)  int     __cdecl _memicmp(         const void * _Buf1,          const void * _Buf2,      size_t _Size);
__declspec(dllimport)  int     __cdecl _memicmp_l(         const void * _Buf1,          const void * _Buf2,      size_t _Size,        _locale_t _Locale);
         int     __cdecl memcmp(         const void * _Buf1,          const void * _Buf2,      size_t _Size);
         void *  __cdecl memcpy(         void * _Dst,          const void * _Src,      size_t _Size);

__declspec(dllimport) errno_t  __cdecl memcpy_s(         void * _Dst,      rsize_t _DstSize,          const void * _Src,      rsize_t _MaxCount);

        void *  __cdecl memset(         void * _Dst,      int _Val,      size_t _Size);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_memccpy" ". See online help for details.")) __declspec(dllimport) void * __cdecl memccpy(       void * _Dst,          const void * _Src,      int _Val,      size_t _Size);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_memicmp" ". See online help for details.")) __declspec(dllimport)  int __cdecl memicmp(         const void * _Buf1,          const void * _Buf2,      size_t _Size);
        __declspec(deprecated("This function or variable may be unsafe. Consider using " "_strset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) char *  __cdecl _strset(         char * _Str,      int _Val);
__declspec(dllimport)  errno_t __cdecl _strset_s(           char * _Dst,      size_t _DstSize,      int _Value);

__declspec(dllimport)  errno_t __cdecl strcpy_s(       char * _Dst,      rsize_t _DstSize,        const char * _Src);

extern "C++" { template <size_t _Size> inline errno_t __cdecl strcpy_s(       char (&_Dest)[_Size],        const char * _Source) { return strcpy_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strcpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  char * __cdecl strcpy( char *_Dest,  const char * _Source);

__declspec(dllimport)  errno_t __cdecl strcat_s(           char * _Dst,      rsize_t _DstSize,        const char * _Src);

extern "C++" { template <size_t _Size> inline errno_t __cdecl strcat_s(           char (&_Dest)[_Size],        const char * _Source) { return strcat_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strcat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  char * __cdecl strcat( char *_Dest,  const char * _Source);
         int     __cdecl strcmp(       const char * _Str1,        const char * _Str2);
         size_t  __cdecl strlen(        const char * _Str);
__declspec(dllimport)  size_t  __cdecl strnlen(          const char * _Str,      size_t _MaxCount);

static __inline  size_t  __cdecl strnlen_s(          const char * _Str,      size_t _MaxCount)
{
    return strnlen(_Str, _MaxCount);
}
__declspec(dllimport)  errno_t __cdecl memmove_s(         void * _Dst,      rsize_t _DstSize,          const void * _Src,      rsize_t _MaxCount);

__declspec(dllimport)  void *  __cdecl memmove(         void * _Dst,          const void * _Src,      size_t _Size);
__declspec(dllimport)  char *  __cdecl _strdup(         const char * _Src);

__declspec(dllimport)  const char *  __cdecl strchr(       const char * _Str,      int _Val);
__declspec(dllimport)  int     __cdecl _stricmp(        const char * _Str1,         const char * _Str2);
__declspec(dllimport)  int     __cdecl _strcmpi(        const char * _Str1,         const char * _Str2);
__declspec(dllimport)  int     __cdecl _stricmp_l(        const char * _Str1,         const char * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int     __cdecl strcoll(        const char * _Str1,         const  char * _Str2);
__declspec(dllimport)  int     __cdecl _strcoll_l(        const char * _Str1,         const char * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int     __cdecl _stricoll(        const char * _Str1,         const char * _Str2);
__declspec(dllimport)  int     __cdecl _stricoll_l(        const char * _Str1,         const char * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int     __cdecl _strncoll  (       const char * _Str1,        const char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int     __cdecl _strncoll_l(       const char * _Str1,        const char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int     __cdecl _strnicoll (       const char * _Str1,        const char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int     __cdecl _strnicoll_l(       const char * _Str1,        const char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  size_t  __cdecl strcspn(        const char * _Str,         const char * _Control);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strerror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  char *  __cdecl _strerror(         const char * _ErrMsg);
__declspec(dllimport)  errno_t __cdecl _strerror_s(       char * _Buf,      size_t _SizeInBytes,          const char * _ErrMsg);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strerror_s(     char (&_Buffer)[_Size],          const char * _ErrorMessage) { return _strerror_s(_Buffer, _Size, _ErrorMessage); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strerror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  char *  __cdecl strerror(     int);

__declspec(dllimport)  errno_t __cdecl strerror_s(       char * _Buf,      size_t _SizeInBytes,      int _ErrNum);

extern "C++" { template <size_t _Size> inline errno_t __cdecl strerror_s(     char (&_Buffer)[_Size],      int _ErrorMessage) { return strerror_s(_Buffer, _Size, _ErrorMessage); } }
__declspec(dllimport)  errno_t __cdecl _strlwr_s(           char * _Str,      size_t _Size);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strlwr_s(           char (&_String)[_Size]) { return _strlwr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strlwr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _strlwr( char *_String);
__declspec(dllimport)  errno_t __cdecl _strlwr_s_l(           char * _Str,      size_t _Size,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strlwr_s_l(           char (&_String)[_Size],        _locale_t _Locale) { return _strlwr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strlwr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _strlwr_l(         char *_String,        _locale_t _Locale);

__declspec(dllimport)  errno_t __cdecl strncat_s(           char * _Dst,      rsize_t _DstSize,        const char * _Src,      rsize_t _MaxCount);

extern "C++" { template <size_t _Size> inline errno_t __cdecl strncat_s(           char (&_Dest)[_Size],        const char * _Source,      size_t _Count) { return strncat_s(_Dest, _Size, _Source, _Count); } }
#pragma warning(push)
#pragma warning(disable:4609 6059)

__declspec(deprecated("This function or variable may be unsafe. Consider using " "strncat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl strncat(           char *_Dest,        const char * _Source,      size_t _Count);
#pragma warning(pop)
__declspec(dllimport)  int     __cdecl strncmp(       const char * _Str1,        const char * _Str2,      size_t _MaxCount);

__declspec(dllimport)  int     __cdecl _strnicmp(       const char * _Str1,        const char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int     __cdecl _strnicmp_l(       const char * _Str1,        const char * _Str2,      size_t _MaxCount,        _locale_t _Locale);

__declspec(dllimport)  errno_t __cdecl strncpy_s(       char * _Dst,      rsize_t _DstSize,          const char * _Src,      rsize_t _MaxCount);

extern "C++" { template <size_t _Size> inline errno_t __cdecl strncpy_s(     char (&_Dest)[_Size],        const char * _Source,      size_t _Count) { return strncpy_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strncpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl strncpy(     char *_Dest,        const char * _Source,      size_t _Count);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strnset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char *  __cdecl _strnset(         char * _Str,      int _Val,      size_t _MaxCount);
__declspec(dllimport)  errno_t __cdecl _strnset_s(           char * _Str,      size_t _Size,      int _Val,      size_t _MaxCount);
__declspec(dllimport)  const char *  __cdecl strpbrk(       const char * _Str,        const char * _Control);
__declspec(dllimport)  const char *  __cdecl strrchr(       const char * _Str,      int _Ch);
__declspec(dllimport) char *  __cdecl _strrev(         char * _Str);
__declspec(dllimport)  size_t  __cdecl strspn(       const char * _Str,        const char * _Control);
__declspec(dllimport)  const char *  __cdecl strstr(       const char * _Str,        const char * _SubStr);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strtok_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  char *  __cdecl strtok(           char * _Str,        const char * _Delim);

__declspec(dllimport)  char *  __cdecl strtok_s(           char * _Str,        const char * _Delim,                        char ** _Context);

__declspec(dllimport)  errno_t __cdecl _strupr_s(           char * _Str,      size_t _Size);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strupr_s(           char (&_String)[_Size]) { return _strupr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strupr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _strupr( char *_String);
__declspec(dllimport)  errno_t __cdecl _strupr_s_l(           char * _Str,      size_t _Size, _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strupr_s_l(           char (&_String)[_Size], _locale_t _Locale) { return _strupr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strupr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _strupr_l(         char *_String,        _locale_t _Locale);
__declspec(dllimport)  size_t  __cdecl strxfrm (       char * _Dst,        const char * _Src,      size_t _MaxCount);
__declspec(dllimport)  size_t  __cdecl _strxfrm_l(       char * _Dst,        const char * _Src,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" {
inline  char * __cdecl strchr(       char * _Str,      int _Ch)
	{ return (char*)strchr((const char*)_Str, _Ch); }
inline  char * __cdecl strpbrk(       char * _Str,        const char * _Control)
	{ return (char*)strpbrk((const char*)_Str, _Control); }
inline  char * __cdecl strrchr(       char * _Str,      int _Ch)
	{ return (char*)strrchr((const char*)_Str, _Ch); }
inline  char * __cdecl strstr(       char * _Str,        const char * _SubStr)
	{ return (char*)strstr((const char*)_Str, _SubStr); }
inline  void * __cdecl memchr(         void * _Pv,      int _C,      size_t _N)
	{ return (void*)memchr((const void*)_Pv, _C, _N); }

}

__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strdup" ". See online help for details.")) __declspec(dllimport)  char * __cdecl strdup(         const char * _Src);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strcmpi" ". See online help for details.")) __declspec(dllimport)  int __cdecl strcmpi(       const char * _Str1,        const char * _Str2);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_stricmp" ". See online help for details.")) __declspec(dllimport)  int __cdecl stricmp(       const char * _Str1,        const char * _Str2);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strlwr" ". See online help for details.")) __declspec(dllimport) char * __cdecl strlwr(         char * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strnicmp" ". See online help for details.")) __declspec(dllimport)  int __cdecl strnicmp(       const char * _Str1,        const char * _Str,      size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strnset" ". See online help for details.")) __declspec(dllimport) char * __cdecl strnset(         char * _Str,      int _Val,      size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strrev" ". See online help for details.")) __declspec(dllimport) char * __cdecl strrev(         char * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strset" ". See online help for details."))         char * __cdecl strset(         char * _Str,      int _Val);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strupr" ". See online help for details.")) __declspec(dllimport) char * __cdecl strupr(         char * _Str);

__declspec(dllimport)  wchar_t * __cdecl _wcsdup(       const wchar_t * _Str);
__declspec(dllimport)  errno_t __cdecl wcscat_s(           wchar_t * _Dst,      rsize_t _DstSize, const wchar_t * _Src);

extern "C++" { template <size_t _Size> inline errno_t __cdecl wcscat_s(           wchar_t (&_Dest)[_Size],        const wchar_t * _Source) { return wcscat_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcscat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcscat( wchar_t *_Dest,  const wchar_t * _Source);
__declspec(dllimport)  const wchar_t * __cdecl wcschr(       const wchar_t * _Str, wchar_t _Ch);
__declspec(dllimport)  int __cdecl wcscmp(       const wchar_t * _Str1,        const wchar_t * _Str2);

__declspec(dllimport)  errno_t __cdecl wcscpy_s(       wchar_t * _Dst,      rsize_t _DstSize,        const wchar_t * _Src);

extern "C++" { template <size_t _Size> inline errno_t __cdecl wcscpy_s(     wchar_t (&_Dest)[_Size],        const wchar_t * _Source) { return wcscpy_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcscpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcscpy( wchar_t *_Dest,  const wchar_t * _Source);
__declspec(dllimport)  size_t __cdecl wcscspn(       const wchar_t * _Str,        const wchar_t * _Control);
__declspec(dllimport)  size_t __cdecl wcslen(       const wchar_t * _Str);
__declspec(dllimport)  size_t __cdecl wcsnlen(         const wchar_t * _Src,      size_t _MaxCount);

static __inline  size_t __cdecl wcsnlen_s(         const wchar_t * _Src,      size_t _MaxCount)
{
    return wcsnlen(_Src, _MaxCount);
}
__declspec(dllimport)  errno_t __cdecl wcsncat_s(           wchar_t * _Dst,      rsize_t _DstSize,        const wchar_t * _Src,      rsize_t _MaxCount);

extern "C++" { template <size_t _Size> inline errno_t __cdecl wcsncat_s(           wchar_t (&_Dest)[_Size],        const wchar_t * _Source,      size_t _Count) { return wcsncat_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcsncat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsncat(     wchar_t *_Dest,        const wchar_t * _Source,      size_t _Count);
__declspec(dllimport)  int __cdecl wcsncmp(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount);

__declspec(dllimport)  errno_t __cdecl wcsncpy_s(       wchar_t * _Dst,      rsize_t _DstSize,        const wchar_t * _Src,      rsize_t _MaxCount);

extern "C++" { template <size_t _Size> inline errno_t __cdecl wcsncpy_s(     wchar_t (&_Dest)[_Size],        const wchar_t * _Source,      size_t _Count) { return wcsncpy_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcsncpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsncpy(     wchar_t *_Dest,        const wchar_t * _Source,      size_t _Count);
__declspec(dllimport)  const wchar_t * __cdecl wcspbrk(       const wchar_t * _Str,        const wchar_t * _Control);
__declspec(dllimport)  const wchar_t * __cdecl wcsrchr(       const wchar_t * _Str,      wchar_t _Ch);
__declspec(dllimport)  size_t __cdecl wcsspn(       const wchar_t * _Str,        const wchar_t * _Control);
__declspec(dllimport)  const wchar_t * __cdecl wcsstr(       const wchar_t * _Str,        const wchar_t * _SubStr);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcstok_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  wchar_t * __cdecl wcstok(           wchar_t * _Str,        const wchar_t * _Delim);
__declspec(dllimport)  wchar_t * __cdecl wcstok_s(           wchar_t * _Str,        const wchar_t * _Delim,                        wchar_t ** _Context);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcserror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  wchar_t * __cdecl _wcserror(     int _ErrNum);
__declspec(dllimport)  errno_t __cdecl _wcserror_s(         wchar_t * _Buf,      size_t _SizeInWords,      int _ErrNum);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcserror_s(     wchar_t (&_Buffer)[_Size],      int _Error) { return _wcserror_s(_Buffer, _Size, _Error); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "__wcserror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  wchar_t * __cdecl __wcserror(         const wchar_t * _Str);
__declspec(dllimport)  errno_t __cdecl __wcserror_s(         wchar_t * _Buffer,      size_t _SizeInWords,        const wchar_t * _ErrMsg);
extern "C++" { template <size_t _Size> inline errno_t __cdecl __wcserror_s(     wchar_t (&_Buffer)[_Size],        const wchar_t * _ErrorMessage) { return __wcserror_s(_Buffer, _Size, _ErrorMessage); } }

__declspec(dllimport)  int __cdecl _wcsicmp(       const wchar_t * _Str1,        const wchar_t * _Str2);
__declspec(dllimport)  int __cdecl _wcsicmp_l(       const wchar_t * _Str1,        const wchar_t * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _wcsnicmp(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _wcsnicmp_l(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsnset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsnset(         wchar_t * _Str,        wchar_t _Val,      size_t _MaxCount);
__declspec(dllimport)  errno_t __cdecl _wcsnset_s(           wchar_t * _Dst,      size_t _DstSizeInWords, wchar_t _Val,      size_t _MaxCount);
__declspec(dllimport) wchar_t * __cdecl _wcsrev(         wchar_t * _Str);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsset(         wchar_t * _Str, wchar_t _Val);
__declspec(dllimport)  errno_t __cdecl _wcsset_s(           wchar_t * _Str,      size_t _SizeInWords, wchar_t _Val);

__declspec(dllimport)  errno_t __cdecl _wcslwr_s(           wchar_t * _Str,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcslwr_s(           wchar_t (&_String)[_Size]) { return _wcslwr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcslwr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcslwr( wchar_t *_String);
__declspec(dllimport)  errno_t __cdecl _wcslwr_s_l(           wchar_t * _Str,      size_t _SizeInWords,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcslwr_s_l(           wchar_t (&_String)[_Size],        _locale_t _Locale) { return _wcslwr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcslwr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcslwr_l(         wchar_t *_String,        _locale_t _Locale);
__declspec(dllimport)  errno_t __cdecl _wcsupr_s(           wchar_t * _Str,      size_t _Size);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcsupr_s(           wchar_t (&_String)[_Size]) { return _wcsupr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsupr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsupr( wchar_t *_String);
__declspec(dllimport)  errno_t __cdecl _wcsupr_s_l(           wchar_t * _Str,      size_t _Size,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcsupr_s_l(           wchar_t (&_String)[_Size],        _locale_t _Locale) { return _wcsupr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsupr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsupr_l(         wchar_t *_String,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl wcsxfrm(       wchar_t * _Dst,        const wchar_t * _Src,      size_t _MaxCount);
__declspec(dllimport)  size_t __cdecl _wcsxfrm_l(       wchar_t * _Dst,        const wchar_t *_Src,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl wcscoll(       const wchar_t * _Str1,        const wchar_t * _Str2);
__declspec(dllimport)  int __cdecl _wcscoll_l(       const wchar_t * _Str1,        const wchar_t * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _wcsicoll(       const wchar_t * _Str1,        const wchar_t * _Str2);
__declspec(dllimport)  int __cdecl _wcsicoll_l(       const wchar_t * _Str1,        const wchar_t *_Str2,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _wcsncoll(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _wcsncoll_l(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _wcsnicoll(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _wcsnicoll_l(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" {
inline  wchar_t * __cdecl wcschr(       wchar_t *_Str, wchar_t _Ch)
        {return ((wchar_t *)wcschr((const wchar_t *)_Str, _Ch)); }
inline  wchar_t * __cdecl wcspbrk(       wchar_t *_Str,        const wchar_t *_Control)
        {return ((wchar_t *)wcspbrk((const wchar_t *)_Str, _Control)); }
inline  wchar_t * __cdecl wcsrchr(       wchar_t *_Str,      wchar_t _Ch)
        {return ((wchar_t *)wcsrchr((const wchar_t *)_Str, _Ch)); }
inline  wchar_t * __cdecl wcsstr(       wchar_t *_Str,        const wchar_t *_SubStr)
        {return ((wchar_t *)wcsstr((const wchar_t *)_Str, _SubStr)); }
}
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsdup" ". See online help for details.")) __declspec(dllimport)  wchar_t * __cdecl wcsdup(       const wchar_t * _Str);

__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsicmp" ". See online help for details.")) __declspec(dllimport)  int __cdecl wcsicmp(       const wchar_t * _Str1,        const wchar_t * _Str2);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsnicmp" ". See online help for details.")) __declspec(dllimport)  int __cdecl wcsnicmp(       const wchar_t * _Str1,        const wchar_t * _Str2,      size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsnset" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsnset(         wchar_t * _Str,        wchar_t _Val,      size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsrev" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsrev(         wchar_t * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsset" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsset(         wchar_t * _Str, wchar_t _Val);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcslwr" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcslwr(         wchar_t * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsupr" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsupr(         wchar_t * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsicoll" ". See online help for details.")) __declspec(dllimport)  int __cdecl wcsicoll(       const wchar_t * _Str1,        const wchar_t * _Str2);
}
extern "C" {
}

#pragma once

#pragma pack(push,8)
extern "C" {
__declspec(dllimport)  unsigned char * __cdecl _mbsdup(       const unsigned char * _Str);

__declspec(dllimport)  unsigned int __cdecl _mbbtombc(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbbtombc_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbbtype(     unsigned char _Ch,      int _CType);
__declspec(dllimport)  int __cdecl _mbbtype_l(     unsigned char _Ch,      int _CType,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbctombb(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbctombb_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport) int __cdecl _mbsbtype(         const unsigned char * _Str,      size_t _Pos);
__declspec(dllimport) int __cdecl _mbsbtype_l(         const unsigned char * _Str,      size_t _Pos,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbscat_s(           unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbscat_s(       unsigned char (&_Dst)[_Size],        const unsigned char * _DstSizeInBytes) { return _mbscat_s(_Dst, _Size, _DstSizeInBytes); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbscat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbscat( unsigned char *_Dest,  const unsigned char * _Source);
__declspec(dllimport) errno_t __cdecl _mbscat_s_l(           unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbscat_s_l(       unsigned char (&_Dest)[_Size],        const unsigned char * _Source,        _locale_t _Locale) { return _mbscat_s_l(_Dest, _Size, _Source, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbscat_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbscat_l(         unsigned char *_Dest,        const unsigned char * _Source,        _locale_t _Locale);
__declspec(dllimport)   const unsigned char * __cdecl _mbschr(       const unsigned char * _Str,      unsigned int _Ch);
__declspec(dllimport)   const unsigned char * __cdecl _mbschr_l(       const unsigned char * _Str,      unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbscmp(       const unsigned char * _Str1,        const unsigned char * _Str2);
__declspec(dllimport)  int __cdecl _mbscmp_l(       const unsigned char * _Str1,        const unsigned char * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbscoll(       const unsigned char * _Str1,        const unsigned char * _Str2);
__declspec(dllimport)  int __cdecl _mbscoll_l(       const unsigned char * _Str1,        const unsigned char * _Str2,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbscpy_s(       unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbscpy_s(     unsigned char (&_Dest)[_Size],        const unsigned char * _Source) { return _mbscpy_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbscpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbscpy( unsigned char *_Dest,  const unsigned char * _Source);
__declspec(dllimport) errno_t __cdecl _mbscpy_s_l(       unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbscpy_s(     unsigned char (&_Dest)[_Size],        const unsigned char * _Source,        _locale_t _Locale) { return _mbscpy_s(_Dest, _Size, _Source, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbscpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbscpy_l(     unsigned char *_Dest,        const unsigned char * _Source,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbscspn(       const unsigned char * _Str,        const unsigned char * _Control);
__declspec(dllimport)  size_t __cdecl _mbscspn_l(       const unsigned char * _Str,        const unsigned char * _Control,        _locale_t _Locale);
__declspec(dllimport)  unsigned char * __cdecl _mbsdec(         const unsigned char * _Start,        const unsigned char * _Pos);
__declspec(dllimport)  unsigned char * __cdecl _mbsdec_l(         const unsigned char * _Start,        const unsigned char * _Pos,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsicmp(       const unsigned char * _Str1,        const unsigned char * _Str2);
__declspec(dllimport)  int __cdecl _mbsicmp_l(       const unsigned char * _Str1,        const unsigned char * _Str2,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsicoll(       const unsigned char * _Str1,        const unsigned char * _Str2);
__declspec(dllimport)  int __cdecl _mbsicoll_l(       const unsigned char * _Str1,        const unsigned char * _Str2,        _locale_t _Locale);
__declspec(dllimport)  unsigned char * __cdecl _mbsinc(       const unsigned char * _Ptr);
__declspec(dllimport)  unsigned char * __cdecl _mbsinc_l(       const unsigned char * _Ptr,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbslen(       const unsigned char * _Str);
__declspec(dllimport)  size_t __cdecl _mbslen_l(       const unsigned char * _Str,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbsnlen(         const unsigned char * _Str,      size_t _MaxCount);
__declspec(dllimport)  size_t __cdecl _mbsnlen_l(         const unsigned char * _Str,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbslwr_s(         unsigned char *_Str,      size_t _SizeInBytes);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbslwr_s(         unsigned char (&_String)[_Size]) { return _mbslwr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbslwr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbslwr( unsigned char *_String);
__declspec(dllimport) errno_t __cdecl _mbslwr_s_l(         unsigned char *_Str,      size_t _SizeInBytes,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbslwr_s_l(       unsigned char (&_String)[_Size],        _locale_t _Locale) { return _mbslwr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbslwr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbslwr_l(         unsigned char *_String,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsnbcat_s(           unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsnbcat_s(       unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count) { return _mbsnbcat_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnbcat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsnbcat( unsigned char *_Dest,  const unsigned char * _Source,  size_t _Count);
__declspec(dllimport) errno_t __cdecl _mbsnbcat_s_l(           unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsnbcat_s_l(       unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale) { return _mbsnbcat_s_l(_Dest, _Size, _Source, _Count, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnbcat_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsnbcat_l(         unsigned char *_Dest,        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsnbcmp(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsnbcmp_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsnbcoll(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsnbcoll_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbsnbcnt(         const unsigned char * _Str,      size_t _MaxCount);
__declspec(dllimport)  size_t __cdecl _mbsnbcnt_l(         const unsigned char * _Str,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsnbcpy_s(       unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsnbcpy_s(     unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count) { return _mbsnbcpy_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnbcpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsnbcpy( unsigned char *_Dest,  const unsigned char * _Source,  size_t _Count);
__declspec(dllimport) errno_t __cdecl _mbsnbcpy_s_l(       unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsnbcpy_s_l(     unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale) { return _mbsnbcpy_s_l(_Dest, _Size, _Source, _Count, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnbcpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsnbcpy_l(     unsigned char *_Dest,        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsnbicmp(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsnbicmp_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsnbicoll(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsnbicoll_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnbset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned char * __cdecl _mbsnbset(           unsigned char * _Str,      unsigned int _Ch,      size_t _MaxCount);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnbset_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned char * __cdecl _mbsnbset_l(           unsigned char * _Str,      unsigned int _Ch,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsnbset_s(           unsigned char * _Dst,      size_t _DstSizeInBytes,      unsigned int _Ch,      size_t _MaxCount);
__declspec(dllimport) errno_t __cdecl _mbsnbset_s_l(           unsigned char * _Dst,      size_t _DstSizeInBytes,      unsigned int _Ch,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsncat_s(           unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsncat_s(       unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count) { return _mbsncat_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsncat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsncat( unsigned char *_Dest,  const unsigned char * _Source,  size_t _Count);
__declspec(dllimport) errno_t __cdecl _mbsncat_s_l(           unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsncat_s(       unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale) { return _mbsncat_s(_Dest, _Size, _Source, _Count, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsncat_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsncat_l(         unsigned char *_Dest,        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbsnccnt(         const unsigned char * _Str,      size_t _MaxCount);
__declspec(dllimport)  size_t __cdecl _mbsnccnt_l(         const unsigned char * _Str,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsncmp(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsncmp_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsncoll(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsncoll_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsncpy_s(       unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsncpy_s(     unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count) { return _mbsncpy_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsncpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsncpy( unsigned char *_Dest,  const unsigned char * _Source,  size_t _Count);
__declspec(dllimport) errno_t __cdecl _mbsncpy_s_l(       unsigned char * _Dst,      size_t _DstSizeInBytes,        const unsigned char * _Src,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsncpy_s_l(     unsigned char (&_Dest)[_Size],        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale) { return _mbsncpy_s_l(_Dest, _Size, _Source, _Count, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsncpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsncpy_l(     unsigned char *_Dest,        const unsigned char * _Source,      size_t _Count,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbsnextc (       const unsigned char * _Str);
__declspec(dllimport)  unsigned int __cdecl _mbsnextc_l(       const unsigned char * _Str,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsnicmp(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsnicmp_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _mbsnicoll(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount);
__declspec(dllimport)  int __cdecl _mbsnicoll_l(       const unsigned char * _Str1,        const unsigned char * _Str2,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  unsigned char * __cdecl _mbsninc(         const unsigned char * _Str,      size_t _Count);
__declspec(dllimport)  unsigned char * __cdecl _mbsninc_l(         const unsigned char * _Str,      size_t _Count,        _locale_t _Locale);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned char * __cdecl _mbsnset(           unsigned char * _Dst,      unsigned int _Val,      size_t _MaxCount);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsnset_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned char * __cdecl _mbsnset_l(           unsigned char * _Dst,      unsigned int _Val,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsnset_s(           unsigned char * _Dst,      size_t _DstSizeInBytes,      unsigned int _Val,      size_t _MaxCount);
__declspec(dllimport) errno_t __cdecl _mbsnset_s_l(           unsigned char * _Dst,      size_t _DstSizeInBytes,      unsigned int _Val,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)   const unsigned char * __cdecl _mbspbrk(       const unsigned char * _Str,        const unsigned char * _Control);
__declspec(dllimport)   const unsigned char * __cdecl _mbspbrk_l(       const unsigned char * _Str,        const unsigned char * _Control,        _locale_t _Locale);
__declspec(dllimport)   const unsigned char * __cdecl _mbsrchr(       const unsigned char * _Str,      unsigned int _Ch);
__declspec(dllimport)   const unsigned char * __cdecl _mbsrchr_l(       const unsigned char *_Str,      unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport) unsigned char * __cdecl _mbsrev(         unsigned char * _Str);
__declspec(dllimport) unsigned char * __cdecl _mbsrev_l(         unsigned char *_Str,        _locale_t _Locale);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned char * __cdecl _mbsset(         unsigned char * _Str,      unsigned int _Val);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsset_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned char * __cdecl _mbsset_l(         unsigned char * _Str,      unsigned int _Val,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsset_s(           unsigned char * _Dst,      size_t _DstSizeInBytes,      unsigned int _Val);
__declspec(dllimport) errno_t __cdecl _mbsset_s_l(           unsigned char * _Dst,      size_t _DstSizeInBytes,      unsigned int _Val,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbsspn(       const unsigned char *_Str,        const unsigned char * _Control);
__declspec(dllimport)  size_t __cdecl _mbsspn_l(       const unsigned char * _Str,        const unsigned char * _Control,        _locale_t _Locale);
__declspec(dllimport)  unsigned char * __cdecl _mbsspnp(       const unsigned char * _Str1,        const unsigned char *_Str2);
__declspec(dllimport)  unsigned char * __cdecl _mbsspnp_l(       const unsigned char *_Str1,        const unsigned char *_Str2,        _locale_t _Locale);
__declspec(dllimport)   const unsigned char * __cdecl _mbsstr(       const unsigned char * _Str,        const unsigned char * _Substr);
__declspec(dllimport)   const unsigned char * __cdecl _mbsstr_l(       const unsigned char * _Str,        const unsigned char * _Substr,        _locale_t _Locale);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbstok_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  unsigned char * __cdecl _mbstok(           unsigned char * _Str,        const unsigned char * _Delim);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbstok_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  unsigned char * __cdecl _mbstok_l(           unsigned char *_Str,        const unsigned char * _Delim,        _locale_t _Locale);
__declspec(dllimport)  unsigned char * __cdecl _mbstok_s(           unsigned char *_Str,        const unsigned char * _Delim,                        unsigned char ** _Context);
__declspec(dllimport)  unsigned char * __cdecl _mbstok_s_l(           unsigned char * _Str,        const unsigned char * _Delim,                        unsigned char ** _Context,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbsupr_s(           unsigned char *_Str,      size_t _SizeInBytes);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsupr_s(       unsigned char (&_String)[_Size]) { return _mbsupr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsupr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsupr( unsigned char *_String);
__declspec(dllimport) errno_t __cdecl _mbsupr_s_l(           unsigned char *_Str,      size_t _SizeInBytes,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbsupr_s_l(       unsigned char (&_String)[_Size],        _locale_t _Locale) { return _mbsupr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbsupr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) unsigned char * __cdecl _mbsupr_l(         unsigned char *_String,        _locale_t _Locale);

__declspec(dllimport)  size_t __cdecl _mbclen(       const unsigned char *_Str);
__declspec(dllimport)  size_t __cdecl _mbclen_l(       const unsigned char * _Str,        _locale_t _Locale);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbccpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) void __cdecl _mbccpy(     unsigned char * _Dst,        const unsigned char * _Src);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbccpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) void __cdecl _mbccpy_l(     unsigned char *_Dst,        const unsigned char *_Src,        _locale_t _Locale);
__declspec(dllimport) errno_t __cdecl _mbccpy_s(     unsigned char * _Dst,      size_t _DstSizeInBytes,        int * _PCopied,        const unsigned char * _Src);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbccpy_s(     unsigned char (&_Dest)[_Size],        int * _PCopied,        const unsigned char * _Source) { return _mbccpy_s(_Dest, _Size, _PCopied, _Source); } }
__declspec(dllimport) errno_t __cdecl _mbccpy_s_l(     unsigned char * _Dst,      size_t _DstSizeInBytes,        int * _PCopied,        const unsigned char * _Src,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbccpy_s_l(     unsigned char (&_Dest)[_Size],        int * _PCopied,        const unsigned char * _Source,        _locale_t _Locale) { return _mbccpy_s_l(_Dest, _Size, _PCopied, _Source, _Locale); } }

extern "C++" {
inline  unsigned char * __cdecl _mbschr(       unsigned char *_String,      unsigned int _Char)
{
    return ((unsigned char *)_mbschr((const unsigned char *)_String, _Char));
}

inline  unsigned char * __cdecl _mbschr_l(       unsigned char *_String,      unsigned int _Char,        _locale_t _Locale)
{
    return ((unsigned char *)_mbschr_l((const unsigned char *)_String, _Char, _Locale));
}

inline  unsigned char * __cdecl _mbspbrk(       unsigned char *_String,        const unsigned char *_CharSet)
{
    return ((unsigned char *)_mbspbrk((const unsigned char *)_String, _CharSet));
}

inline  unsigned char * __cdecl _mbspbrk_l(       unsigned char *_String,        const unsigned char *_CharSet,        _locale_t _Locale)
{
    return ((unsigned char *)_mbspbrk_l((const unsigned char *)_String, _CharSet, _Locale));
}

inline  unsigned char * __cdecl _mbsrchr(       unsigned char *_String,      unsigned int _Char)
{
    return ((unsigned char *)_mbsrchr((const unsigned char *)_String, _Char));
}

inline  unsigned char * __cdecl _mbsrchr_l(       unsigned char *_String,      unsigned int _Char,        _locale_t _Locale)
{
    return ((unsigned char *)_mbsrchr_l((const unsigned char *)_String, _Char, _Locale));
}

inline  unsigned char * __cdecl _mbsstr(       unsigned char *_String,        const unsigned char *_Match)
{
    return ((unsigned char *)_mbsstr((const unsigned char *)_String, _Match));
}

inline  unsigned char * __cdecl _mbsstr_l(       unsigned char *_String,        const unsigned char *_Match,        _locale_t _Locale)
{
    return ((unsigned char *)_mbsstr_l((const unsigned char *)_String, _Match, _Locale));
}
}

__declspec(dllimport)  int __cdecl _ismbcalnum(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcalnum_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcalpha(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcalpha_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcdigit(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcdigit_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcgraph(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcgraph_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbclegal(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbclegal_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbclower(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbclower_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcprint(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcprint_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcpunct(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcpunct_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcspace(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcspace_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcupper(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcupper_l(     unsigned int _Ch,        _locale_t _Locale);

__declspec(dllimport)  unsigned int __cdecl _mbctolower(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbctolower_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbctoupper(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbctoupper_l(     unsigned int _Ch,        _locale_t _Locale);

__declspec(dllimport)  int __cdecl _ismbblead(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbblead_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbbtrail(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbbtrail_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbslead(         const unsigned char * _Str,        const unsigned char * _Pos);
__declspec(dllimport)  int __cdecl _ismbslead_l(         const unsigned char * _Str,        const unsigned char * _Pos,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbstrail(         const unsigned char * _Str,        const unsigned char * _Pos);
__declspec(dllimport)  int __cdecl _ismbstrail_l(         const unsigned char * _Str,        const unsigned char * _Pos,        _locale_t _Locale);

__declspec(dllimport)  int __cdecl _ismbchira(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbchira_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbckata(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbckata_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcsymbol(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcsymbol_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcl0(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcl0_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcl1(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcl1_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _ismbcl2(     unsigned int _Ch);
__declspec(dllimport)  int __cdecl _ismbcl2_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbcjistojms(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbcjistojms_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbcjmstojis(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbcjmstojis_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbctohira(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbctohira_l(     unsigned int _Ch,        _locale_t _Locale);
__declspec(dllimport)  unsigned int __cdecl _mbctokata(     unsigned int _Ch);
__declspec(dllimport)  unsigned int __cdecl _mbctokata_l(     unsigned int _Ch,        _locale_t _Locale);
}
#pragma pack(pop)
extern "C" {
typedef char            _TCHAR;
typedef signed char     _TSCHAR;
typedef unsigned char   _TUCHAR;
typedef unsigned char   _TXCHAR;
typedef unsigned int    _TINT;

typedef char            TCHAR;
__inline const char * _tcschr(     const char * _s1,     unsigned int _c) {return (const char *)_mbschr((const unsigned char *)_s1,_c);}
__inline size_t _tcscspn(     const char * _s1,     const char * _s2) {return _mbscspn((const unsigned char *)_s1,(const unsigned char *)_s2);}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsncat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsncat(         char *_Destination,        const char *_Source,      size_t _Count)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnbcat((unsigned char *)_Destination,(const unsigned char *)_Source,_Count);
#pragma warning(pop)
}

__inline  errno_t _tcsncat_s(           char *_Destination,      size_t _Destination_size_chars,        const char *_Source,      size_t _Count)
{
    return _mbsnbcat_s((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source,_Count);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcsncat_s(           char (&_Dest)[_Size],        const char * _Source,      size_t _Count) { return _tcsncat_s(_Dest, _Size, _Source, _Count); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsncat_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsncat_l(         char *_Destination,        const char *_Source,      size_t _Count,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnbcat_l((unsigned char *)_Destination,(const unsigned char *)_Source,_Count, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsncat_s_l(           char *_Destination,      size_t _Destination_size_chars,        const char *_Source,      size_t _Count,        _locale_t _Locale)
{
    return _mbsnbcat_s_l((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source,_Count, _Locale);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcsncat_s_l(           char (&_Dest)[_Size], const char * _Source, size_t _Count, _locale_t _Locale) { return _tcsncat_s_l(_Dest, _Size, _Source, _Count, _Locale); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsncpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsncpy(         char * _Destination,       const char * _Source,     size_t _Count)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnbcpy((unsigned char *)_Destination,(const unsigned char *)_Source,_Count);
#pragma warning(pop)
}

__inline  errno_t _tcsncpy_s(       char * _Destination,      size_t _Destination_size_chars,        const char * _Source,     size_t _Count)
{
    return _mbsnbcpy_s((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source,_Count);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcsncpy_s(     char (&_Dest)[_Size],        const char * _Source,      size_t _Count) { return _tcsncpy_s(_Dest, _Size, _Source, _Count); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsncpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsncpy_l(       char * _Destination,       const char * _Source,     size_t _Count,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnbcpy_l((unsigned char *)_Destination,(const unsigned char *)_Source,_Count, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsncpy_s_l(       char * _Destination,      size_t _Destination_size_chars,        const char * _Source,     size_t _Count,        _locale_t _Locale)
{
    return _mbsnbcpy_s_l((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source,_Count, _Locale);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcsncpy_s(     char (&_Dest)[_Size],        const char * _Source,      size_t _Count,        _locale_t _Locale) { return _tcsncpy_s(_Dest, _Size, _Source, _Count, _Locale); } }

__inline  const char * _tcspbrk(     const char * _s1,     const char * _s2) {return (const char *)_mbspbrk((const unsigned char *)_s1,(const unsigned char *)_s2);}
__inline  const char * _tcsrchr(     const char * _s1,     unsigned int _c) {return (const char *)_mbsrchr((const unsigned char *)_s1,_c);}
__inline  size_t _tcsspn(     const char * _s1,     const char * _s2) {return _mbsspn((const unsigned char *)_s1,(const unsigned char *)_s2);}
__inline  const char * _tcsstr(     const char * _s1,     const char * _s2) {return (const char *)_mbsstr((const unsigned char *)_s1,(const unsigned char *)_s2);}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcstok_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline  char *  _tcstok(           char * _String,       const char * _Delimiters)
{
#pragma warning(push)
#pragma warning(disable:4996)
	return (char * )_mbstok((unsigned char *)_String,(const unsigned char *)_Delimiters);
#pragma warning(pop)
}

__inline  char *  _tcstok_s(           char * _String,       const char * _Delimiters,                        char **_Current_position)
{
	return (char * )_mbstok_s((unsigned char *)_String,(const unsigned char *)_Delimiters, (unsigned char **)_Current_position);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcstok_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline  char *  _tcstok_l(           char * _String,       const char * _Delimiters,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
	return (char * )_mbstok_l((unsigned char *)_String,(const unsigned char *)_Delimiters, _Locale);
#pragma warning(pop)
}

__inline  char *  _tcstok_s_l(           char * _String,       const char * _Delimiters,                        char **_Current_position,        _locale_t _Locale)
{
	return (char * )_mbstok_s_l((unsigned char *)_String,(const unsigned char *)_Delimiters, (unsigned char **)_Current_position, _Locale);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsnset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsnset(           char * _Dst,      unsigned int _Value ,      size_t _Count)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnbset((unsigned char *)_Dst, _Value, _Count);
#pragma warning(pop)
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsnset_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsnset_l(           char * _Dst,      unsigned int _Value ,      size_t _Count,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnbset_l((unsigned char *)_Dst, _Value, _Count, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsnset_s(           char * _Dst,      size_t _SizeInBytes,      unsigned int _Value ,      size_t _Count)
{
    return _mbsnbset_s((unsigned char *)_Dst, _SizeInBytes, _Value, _Count);
}

__inline  errno_t _tcsnset_s_l(           char * _Dst,      size_t _SizeInBytes,      unsigned int _Value ,      size_t _Count,        _locale_t _Locale)
{
    return _mbsnbset_s_l((unsigned char *)_Dst, _SizeInBytes, _Value, _Count, _Locale);
}

__inline char * _tcsrev(     char * _s1) {return (char *)_mbsrev((unsigned char *)_s1);}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsset(         char * _Dst,      unsigned int _Value)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsset((unsigned char *)_Dst, _Value);
#pragma warning(pop)
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tscset_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsset_l(         char * _Dst,      unsigned int _Value,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsset_l((unsigned char *)_Dst, _Value, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsset_s(           char * _Dst,      size_t _SizeInBytes,      unsigned int _Value)
{
    return _mbsset_s((unsigned char *)_Dst, _SizeInBytes, _Value);
}

__inline  errno_t _tcsset_s_l(           char * _Dst,      size_t _SizeInBytes,      unsigned int _Value,        _locale_t _Locale)
{
    return _mbsset_s_l((unsigned char *)_Dst, _SizeInBytes, _Value, _Locale);
}

__inline  int _tcscmp(     const char * _s1,     const char * _s2) {return _mbscmp((const unsigned char *)_s1,(const unsigned char *)_s2);}

__inline  int _tcsicmp(       const char * _String1,        const char * _String2)
{
    return _mbsicmp((const unsigned char *)_String1,(const unsigned char *)_String2);
}

__inline  int _tcsicmp_l(       const char * _String1,        const char * _String2,        _locale_t _Locale)
{
    return _mbsicmp_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Locale);
}

__inline  int _tcsnccmp(     const char * _s1,     const char * _s2,     size_t _n) {return _mbsncmp((const unsigned char *)_s1,(const unsigned char *)_s2,_n);}
__inline int _tcsncmp(     const char * _s1,     const char * _s2,     size_t _n) {return _mbsnbcmp((const unsigned char *)_s1,(const unsigned char *)_s2,_n);}

__inline  int _tcsncicmp(       const char * _String1,        const char * _String2,      size_t _Char_count)
{
    return _mbsnicmp((const unsigned char *)_String1,(const unsigned char *)_String2,_Char_count);
}

__inline  int _tcsncicmp_l(       const char * _String1,        const char * _String2,      size_t _Char_count,        _locale_t _Locale)
{
    return _mbsnicmp_l((const unsigned char *)_String1,(const unsigned char *)_String2,_Char_count, _Locale);
}

__inline  int _tcsnicmp(       const char * _String1,        const char * _String2,      size_t _Char_count)
{
    return _mbsnbicmp((const unsigned char *)_String1,(const unsigned char *)_String2,_Char_count);
}

__inline  int _tcsnicmp_l(       const char * _String1,        const char * _String2,      size_t _Char_count,        _locale_t _Locale)
{
    return _mbsnbicmp_l((const unsigned char *)_String1,(const unsigned char *)_String2,_Char_count, _Locale);
}

__inline  int _tcscoll(       const char * _String1,        const char * _String2)
{
    return _mbscoll((const unsigned char *)_String1,(const unsigned char *)_String2);
}

__inline  int _tcscoll_l(       const char * _String1,        const char * _String2,        _locale_t _Locale)
{
    return _mbscoll_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Locale);
}

__inline  int _tcsicoll(       const char * _String1,        const char * _String2)
{
    return _mbsicoll((const unsigned char *)_String1,(const unsigned char *)_String2);
}

__inline  int _tcsicoll_l(       const char * _String1,        const char * _String2,        _locale_t _Locale)
{
    return _mbsicoll_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Locale);
}

__inline  int _tcsnccoll(       const char * _String1,        const char * _String2,      size_t _Count)
{
    return _mbsncoll((const unsigned char *)_String1,(const unsigned char *)_String2, _Count);
}

__inline  int _tcsnccoll_l(       const char * _String1,        const char * _String2,      size_t _Count,        _locale_t _Locale)
{
    return _mbsncoll_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Count, _Locale);
}

__inline  int _tcsncoll(       const char * _String1,        const char * _String2,      size_t _Count)
{
    return _mbsnbcoll((const unsigned char *)_String1,(const unsigned char *)_String2, _Count);
}

__inline  int _tcsncoll_l(       const char * _String1,        const char * _String2,      size_t _Count,        _locale_t _Locale)
{
    return _mbsnbcoll_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Count, _Locale);
}

__inline  int _tcsncicoll(       const char * _String1,        const char * _String2,      size_t _Count)
{
    return _mbsnicoll((const unsigned char *)_String1,(const unsigned char *)_String2, _Count);
}

__inline  int _tcsncicoll_l(       const char * _String1,        const char * _String2,      size_t _Count,        _locale_t _Locale)
{
    return _mbsnicoll_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Count, _Locale);
}

__inline  int _tcsnicoll(       const char * _String1,        const char * _String2,      size_t _Count)
{
    return _mbsnbicoll((const unsigned char *)_String1,(const unsigned char *)_String2, _Count);
}

__inline  int _tcsnicoll_l(       const char * _String1,        const char * _String2,      size_t _Count,        _locale_t _Locale)
{
    return _mbsnbicoll_l((const unsigned char *)_String1,(const unsigned char *)_String2, _Count, _Locale);
}
__inline  size_t _tcsclen(       const char * _String)
{
    return _mbslen((const unsigned char *)_String);
}

__inline  size_t _tcscnlen(       const char * _String,      size_t _Maximum)
{
    return _mbsnlen((const unsigned char *)_String, _Maximum);
}

__inline  size_t _tcsclen_l(       const char * _String,        _locale_t _Locale)
{
    return _mbslen_l((const unsigned char *)_String, _Locale);
}

__inline  size_t _tcscnlen_l(       const char * _String,      size_t _Maximum,        _locale_t _Locale)
{
    return _mbsnlen_l((const unsigned char *)_String, _Maximum, _Locale);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tscnccat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsnccat(         char * _Destination,        const char * _Source,      size_t _Count)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsncat((unsigned char *)_Destination,(const unsigned char *)_Source, _Count);
#pragma warning(pop)
}

__inline  errno_t _tcsnccat_s(           char * _Destination,      size_t _Destination_size_chars,        const char * _Source,      size_t _Count)
{
    return _mbsncat_s((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source, _Count);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsnccat_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsnccat_l(         char * _Destination,        const char * _Source,      size_t _Count,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsncat_l((unsigned char *)_Destination,(const unsigned char *)_Source, _Count, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsnccat_s_l(           char * _Destination,      size_t _Destination_size_chars,        const char * _Source,      size_t _Count,        _locale_t _Locale)
{
    return _mbsncat_s_l((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source, _Count, _Locale);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsnccpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsnccpy(       char * _Destination,        const char * _Source,      size_t _Count)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsncpy((unsigned char *)_Destination,(const unsigned char *)_Source, _Count);
#pragma warning(pop)
}

__inline  errno_t _tcsnccpy_s(       char * _Destination,      size_t _Destination_size_chars,        const char * _Source,      size_t _Count)
{
    return _mbsncpy_s((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source, _Count);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsnccpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsnccpy_l(       char * _Destination,        const char * _Source,      size_t _Count,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsncpy_l((unsigned char *)_Destination,(const unsigned char *)_Source, _Count, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsnccpy_s_l(       char * _Destination,      size_t _Destination_size_chars,        const char * _Source,      size_t _Count,        _locale_t _Locale)
{
    return _mbsncpy_s_l((unsigned char *)_Destination, _Destination_size_chars, (const unsigned char *)_Source, _Count, _Locale);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsncset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsncset(       char *_Destination,      unsigned int _Value,      size_t _Count)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnset((unsigned char *)_Destination, _Value, _Count);
#pragma warning(pop)
}

__inline  errno_t _tcsncset_s(     char *_Destination,      size_t _SizeInBytes,      unsigned int _Value,      size_t _Count)
{
    return _mbsnset_s((unsigned char *)_Destination, _SizeInBytes, _Value, _Count);
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsncset_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsncset_l(     char *_Destination,      unsigned int _Value,      size_t _Count,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsnset_l((unsigned char *)_Destination, _Value, _Count, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsncset_s_l(       char *_Destination,      size_t _SizeInBytes,      unsigned int _Value,      size_t _Count,        _locale_t _Locale)
{
    return _mbsnset_s_l((unsigned char *)_Destination, _SizeInBytes, _Value, _Count, _Locale);
}
__inline  char * _tcsdec(     const char * _s1,     const char * _s2) {return (char *)_mbsdec((const unsigned char *)_s1,(const unsigned char *)_s2);}
__inline  char * _tcsinc(     const char * _s1) {return (char *)_mbsinc((const unsigned char *)_s1);}
__inline  size_t _tcsnbcnt(     const char * _s1,     size_t _n) {return _mbsnbcnt((const unsigned char *)_s1,_n);}
__inline  size_t _tcsnccnt(     const char * _s1,     size_t _n) {return _mbsnccnt((const unsigned char *)_s1,_n);}
__inline  char * _tcsninc(     const char * _s1,     size_t _n) {return (char *)_mbsninc((const unsigned char *)_s1,_n);}
__inline  char * _tcsspnp(     const char * _s1,     const char * _s2) {return (char *)_mbsspnp((const unsigned char *)_s1,(const unsigned char *)_s2);}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcslwr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcslwr(         char * _String)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbslwr((unsigned char *)_String);
#pragma warning(pop)
}

__inline  errno_t _tcslwr_s(           char * _String, size_t _SizeInBytes)
{
    return _mbslwr_s((unsigned char *)_String, _SizeInBytes);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcslwr_s(       char (&_String)[_Size]) { return _tcslwr_s(_String, _Size); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcslwr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcslwr_l(         char * _String,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbslwr_l((unsigned char *)_String, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcslwr_s_l(           char * _String,      size_t _SizeInBytes,        _locale_t _Locale)
{
    return _mbslwr_s_l((unsigned char *)_String, _SizeInBytes, _Locale);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcslwr_s_l(       char (&_String)[_Size],        _locale_t _Locale) { return _tcslwr_s_l(_String, _Size, _Locale); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsupr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsupr(         char * _String)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsupr((unsigned char *)_String);
#pragma warning(pop)
}

__inline  errno_t _tcsupr_s(           char * _String,      size_t _Count)
{
    return _mbsupr_s((unsigned char *)_String, _Count);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcsupr_s(       char (&_String)[_Size]) { return _tcsupr_s(_String, _Size); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tcsupr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline char * _tcsupr_l(         char * _String,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    return (char *)_mbsupr_l((unsigned char *)_String, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tcsupr_s_l(           char * _String,      size_t _Count,        _locale_t _Locale)
{
    return _mbsupr_s_l((unsigned char *)_String, _Count, _Locale);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tcsupr_s_l(       char (&_String)[_Size],        _locale_t _Locale) { return _tcsupr_s_l(_String, _Size, _Locale); } }

__inline  size_t _tclen(       const char * _s1) {return _mbclen((const unsigned char *)_s1);}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tccpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline void _tccpy(       char * _Destination,        const char * _Source)
{
#pragma warning(push)
#pragma warning(disable:4996)
    _mbccpy((unsigned char *)_Destination, (const unsigned char *)_Source);
#pragma warning(pop)
}

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_tccpy_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __inline void _tccpy_l(       char * _Destination,        const char * _Source,        _locale_t _Locale)
{
#pragma warning(push)
#pragma warning(disable:4996)
    _mbccpy_l((unsigned char *)_Destination,( const unsigned char *)_Source, _Locale);
#pragma warning(pop)
}

__inline  errno_t _tccpy_s(       char * _Destination, size_t _SizeInBytes,        int *_PCopied,        const char * _Source)
{
    return _mbccpy_s((unsigned char *)_Destination, _SizeInBytes, _PCopied, (const unsigned char *)_Source);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tccpy_s(     char (&_Dest)[_Size],        int * _PCopied,        const char * _Source) { return _tccpy_s(_Dest, _Size, _PCopied, _Source); } }

__inline  errno_t _tccpy_s_l(       char * _Destination,      size_t _SizeInBytes,        int *_PCopied,        const char * _Source,        _locale_t _Locale)
{
    return _mbccpy_s_l((unsigned char *)_Destination, _SizeInBytes, _PCopied, (const unsigned char *)_Source, _Locale);
}

extern "C++" { template <size_t _Size> inline errno_t __cdecl _tccpy_s_l(     char (&_Dest)[_Size],        int * _PCopied,        const char * _Source,        _locale_t _Locale) { return _tccpy_s_l(_Dest, _Size, _PCopied, _Source, _Locale); } }
__inline  unsigned int _tcsnextc(       const char * _s1)
{
    unsigned int _n=0;
    if (_ismbblead((unsigned int)*(unsigned char *)_s1))
    {
        if(_s1[1]!='\0')
        {
            _n=((unsigned int)*(unsigned char *)_s1)<<8;
            _s1++;
        }
    }
    _n+=(unsigned int)*(unsigned char *)_s1;

    return(_n);
}
extern "C++" {
inline  char * __cdecl _tcschr(       char *_S,      unsigned int _C)
        {return ((char *)_tcschr((const char *)_S, _C)); }
inline  char * __cdecl _tcspbrk(       char *_S,        const char *_P)
        {return ((char *)_tcspbrk((const char *)_S, _P)); }
inline  char * __cdecl _tcsrchr(       char *_S,      unsigned int _C)
        {return ((char *)_tcsrchr((const char *)_S, _C)); }
inline  char * __cdecl _tcsstr(       char *_S,        const char *_P)
        {return ((char *)_tcsstr((const char *)_S, _P)); }
}
}
#pragma once

#pragma once

#pragma once

#pragma once

#pragma once

#pragma once
#pragma once
#pragma pack(push,8)
		
		
		
	
		
	

#pragma once
#pragma comment(lib,"msvcprt")

#pragma comment(linker,"/manifestdependency:\"type='win32' "            \
        "name='" "Microsoft.VC80" ".CRT' "              \
        "version='" "8.0.50608.0" "' "                           \
        "processorArchitecture='x86' "                                  \
        "publicKeyToken='" "1fc8b3b9a1e18e3b" "'\"")

		
namespace std {
typedef bool _Bool;
}
		

		
typedef __int64 _Longlong;
typedef unsigned __int64 _ULonglong;

		
		
		
namespace std {
		
#pragma warning(push)
#pragma warning(disable:4412)
class __declspec(dllimport) _Lockit
	{	
public:
    explicit __thiscall _Lockit();	
	explicit __thiscall _Lockit(int);	
	__thiscall ~_Lockit();	
    static  void __cdecl _Lockit_ctor(int);
    static  void __cdecl _Lockit_dtor(int);

private:
    static  void __cdecl _Lockit_ctor(_Lockit *);
    static  void __cdecl _Lockit_ctor(_Lockit *, int);
    static  void __cdecl _Lockit_dtor(_Lockit *);

	 _Lockit(const _Lockit&);				
	_Lockit&  operator=(const _Lockit&);	

	int _Locktype;

	};

class __declspec(dllimport) _Mutex
	{	
public:
    __thiscall _Mutex();
	__thiscall ~_Mutex();
	void __thiscall _Lock();
	void __thiscall _Unlock();
private:
    static  void __cdecl _Mutex_ctor(_Mutex *);
    static  void __cdecl _Mutex_dtor(_Mutex *);
    static  void __cdecl _Mutex_Lock(_Mutex *);
    static  void __cdecl _Mutex_Unlock(_Mutex *);

	 _Mutex(const _Mutex&);				
	_Mutex&  operator=(const _Mutex&);	
	void *_Mtx;
	};

class __declspec(dllimport) _Init_locks
	{	
public:
    __thiscall _Init_locks();
	__thiscall ~_Init_locks();
private:
    static  void __cdecl _Init_locks_ctor(_Init_locks *);
    static  void __cdecl _Init_locks_dtor(_Init_locks *);
	};
#pragma warning(pop)
}
		

__declspec(dllimport) void __cdecl _Atexit(void (__cdecl *)(void));

typedef int _Mbstatet;
#pragma pack(pop)
 #pragma warning(disable: 4514)

#pragma once
#pragma once

namespace std {
using ::size_t; using ::fpos_t; using ::FILE;
using ::clearerr; using ::fclose; using ::feof;
using ::ferror; using ::fflush; using ::fgetc;
using ::fgetpos; using ::fgets; using ::fopen;
using ::fprintf; using ::fputc; using ::fputs;
using ::fread; using ::freopen; using ::fscanf;
using ::fseek; using ::fsetpos; using ::ftell;
using ::fwrite; using ::getc; using ::getchar;
using ::gets; using ::perror;
using ::putc; using ::putchar;
using ::printf; using ::puts; using ::remove;
using ::rename; using ::rewind; using ::scanf;
using ::setbuf; using ::setvbuf; using ::sprintf;
using ::sscanf; using ::tmpfile; using ::tmpnam;
using ::ungetc; using ::vfprintf; using ::vprintf;
using ::vsprintf;
}

#pragma once
#pragma once

#pragma pack(push,8)
extern "C" {
typedef int (__cdecl * _onexit_t)(void);
typedef struct _div_t {
        int quot;
        int rem;
} div_t;

typedef struct _ldiv_t {
        long quot;
        long rem;
} ldiv_t;

#pragma pack(4)
typedef struct {
    unsigned char ld[10];
} _LDOUBLE;
#pragma pack()
typedef struct {
        double x;
} _CRT_DOUBLE;

typedef struct {
    float f;
} _CRT_FLOAT;

typedef struct {
        long double x;
} _LONGDOUBLE;
#pragma pack(4)
typedef struct {
    unsigned char ld12[12];
} _LDBL12;
#pragma pack()
__declspec(dllimport) extern int __mb_cur_max;
__declspec(dllimport) int __cdecl ___mb_cur_max_func(void);
__declspec(dllimport) int __cdecl ___mb_cur_max_l_func(_locale_t);
typedef void (__cdecl *_purecall_handler)(void);
__declspec(dllimport) _purecall_handler __cdecl _set_purecall_handler(       _purecall_handler _Handler);
__declspec(dllimport) _purecall_handler __cdecl _get_purecall_handler();
extern "C++"
{

}
typedef void (__cdecl *_invalid_parameter_handler)(const wchar_t *, const wchar_t *, const wchar_t *, unsigned int, uintptr_t);
__declspec(dllimport) _invalid_parameter_handler __cdecl _set_invalid_parameter_handler(       _invalid_parameter_handler _Handler);
__declspec(dllimport) _invalid_parameter_handler __cdecl _get_invalid_parameter_handler(void);
extern "C++"
{
}

__declspec(dllimport) extern int * __cdecl _errno(void);
errno_t __cdecl _set_errno(     int _Value);
errno_t __cdecl _get_errno(     int * _Value);
__declspec(dllimport) unsigned long * __cdecl __doserrno(void);
errno_t __cdecl _set_doserrno(     unsigned long _Value);
errno_t __cdecl _get_doserrno(     unsigned long * _Value);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "strerror" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) char ** __cdecl __sys_errlist(void);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "strerror" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) int * __cdecl __sys_nerr(void);
__declspec(dllimport) int *          __cdecl __p___argc(void);
__declspec(dllimport) char ***       __cdecl __p___argv(void);
__declspec(dllimport) wchar_t ***    __cdecl __p___wargv(void);
__declspec(dllimport) char ***       __cdecl __p__environ(void);
__declspec(dllimport) wchar_t ***    __cdecl __p__wenviron(void);
__declspec(dllimport) char **        __cdecl __p__pgmptr(void);
__declspec(dllimport) wchar_t **     __cdecl __p__wpgmptr(void);

__declspec(dllimport) extern int __argc;
__declspec(dllimport) extern char ** __argv;
__declspec(dllimport) extern wchar_t ** __wargv;

__declspec(dllimport) extern char ** _environ;
__declspec(dllimport) extern wchar_t ** _wenviron;
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_pgmptr" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) extern char * _pgmptr;
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_wpgmptr" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) extern wchar_t * _wpgmptr;
errno_t __cdecl _get_pgmptr(       char ** _Value);
errno_t __cdecl _get_wpgmptr(       wchar_t ** _Value);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_fmode" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) extern int _fmode;

__declspec(dllimport) errno_t __cdecl _set_fmode(     int _Mode);
__declspec(dllimport) errno_t __cdecl _get_fmode(     int * _PMode);
#pragma warning(push)
#pragma warning(disable:4141)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_osplatform" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details."))	__declspec(dllimport) extern unsigned int _osplatform;
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_osver" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details."))			__declspec(dllimport) extern unsigned int _osver;
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_winver" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details."))		__declspec(dllimport) extern unsigned int _winver;
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_winmajor" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details."))		__declspec(dllimport) extern unsigned int _winmajor;
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_winminor" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details."))		__declspec(dllimport) extern unsigned int _winminor;
#pragma warning(pop)

__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details.")) errno_t __cdecl _get_osplatform(     unsigned int * _Value);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details.")) errno_t __cdecl _get_osver(     unsigned int * _Value);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details.")) errno_t __cdecl _get_winver(     unsigned int * _Value);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details.")) errno_t __cdecl _get_winmajor(     unsigned int * _Value);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "GetVersionEx" "instead. See online help for details.")) errno_t __cdecl _get_winminor(     unsigned int * _Value);
extern "C++"
{
template <typename _CountofType, size_t _SizeOfArray>
char (*__countof_helper( _CountofType (&_Array)[_SizeOfArray]))[_SizeOfArray];

}
__declspec(dllimport) __declspec(noreturn) void __cdecl exit(     int _Code);
__declspec(dllimport) __declspec(noreturn) void __cdecl _exit(     int _Code);
__declspec(dllimport) void __cdecl abort(void);
__declspec(dllimport) unsigned int __cdecl _set_abort_behavior(     unsigned int _Flags,      unsigned int _Mask);
        int     __cdecl abs(     int _X);
        long    __cdecl labs(     long _X);
        __int64    __cdecl _abs64(__int64);

        int    __cdecl atexit(void (__cdecl *)(void));
__declspec(dllimport) double  __cdecl atof(       const char *_String);
__declspec(dllimport) double  __cdecl _atof_l(       const char *_String,        _locale_t _Locale);

__declspec(dllimport)   int    __cdecl atoi(       const char *_Str);
__declspec(dllimport)  int    __cdecl _atoi_l(       const char *_Str,        _locale_t _Locale);
__declspec(dllimport)  long   __cdecl atol(       const char *_Str);
__declspec(dllimport)  long   __cdecl _atol_l(       const char *_Str,        _locale_t _Locale);
__declspec(dllimport)  void * __cdecl bsearch_s(     const void * _Key,        const void * _Base,
             rsize_t _NumOfElements,      rsize_t _SizeOfElements,
             int (__cdecl * _PtFuncCompare)(void *, const void *, const void *), void * _Context);

__declspec(dllimport)  void * __cdecl bsearch(     const void * _Key,        const void * _Base,
             size_t _NumOfElements,      size_t _SizeOfElements,
             int (__cdecl * _PtFuncCompare)(const void *, const void *));
__declspec(dllimport) void __cdecl qsort_s(       void * _Base,
             rsize_t _NumOfElements,      rsize_t _SizeOfElements,
             int (__cdecl * _PtFuncCompare)(void *, const void *, const void *), void *_Context);

__declspec(dllimport) void __cdecl qsort(       void * _Base,
	     size_t _NumOfElements,      size_t _SizeOfElements,
             int (__cdecl * _PtFuncCompare)(const void *, const void *));

         unsigned short __cdecl _byteswap_ushort(     unsigned short _Short);
         unsigned long  __cdecl _byteswap_ulong (     unsigned long _Long);

         unsigned __int64 __cdecl _byteswap_uint64(unsigned __int64 _Int64);

__declspec(dllimport)  div_t  __cdecl div(     int _Numerator,      int _Denominator);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_dupenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  char * __cdecl getenv(       const char * _VarName);

__declspec(dllimport)  errno_t __cdecl getenv_s(     size_t * _ReturnSize,        char * _DstBuf,      rsize_t _DstSize,        const char * _VarName);

extern "C++" { template <size_t _Size> inline errno_t __cdecl getenv_s(     size_t * _ReturnSize,      char (&_Dest)[_Size],        const char * _VarName) { return getenv_s(_ReturnSize, _Dest, _Size, _VarName); } }
__declspec(dllimport)  errno_t __cdecl _dupenv_s(                     char **_PBuffer,        size_t * _PBufferSizeInBytes,        const char * _VarName);
__declspec(dllimport)  errno_t __cdecl _itoa_s(     int _Value,        char * _DstBuf,      size_t _Size,      int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _itoa_s(     int _Value,      char (&_Dest)[_Size],      int _Radix) { return _itoa_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_itoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _itoa( int _Value,  char *_Dest,  int _Radix);

__declspec(dllimport)  errno_t __cdecl _i64toa_s(     __int64 _Val,        char * _DstBuf,      size_t _Size,      int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_i64toa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) char * __cdecl _i64toa(     __int64 _Val,      char * _DstBuf,      int _Radix);
__declspec(dllimport)  errno_t __cdecl _ui64toa_s(     unsigned __int64 _Val,        char * _DstBuf,      size_t _Size,      int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ui64toa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) char * __cdecl _ui64toa(     unsigned __int64 _Val,      char * _DstBuf,      int _Radix);
__declspec(dllimport)  __int64 __cdecl _atoi64(       const char * _String);
__declspec(dllimport)  __int64 __cdecl _atoi64_l(       const char * _String,        _locale_t _Locale);
__declspec(dllimport)  __int64 __cdecl _strtoi64(       const char * _String,                    char ** _EndPtr,      int _Radix);
__declspec(dllimport)  __int64 __cdecl _strtoi64_l(       const char * _String,                    char ** _EndPtr,      int _Radix,        _locale_t _Locale);
__declspec(dllimport)  unsigned __int64 __cdecl _strtoui64(       const char * _String,                    char ** _EndPtr,      int _Radix);
__declspec(dllimport)  unsigned __int64 __cdecl _strtoui64_l(       const char * _String,                    char ** _EndPtr,      int  _Radix,        _locale_t _Locale);

__declspec(dllimport)  ldiv_t __cdecl ldiv(     long _Numerator,      long _Denominator);

extern "C++"
{
    inline ldiv_t  div(     long _A1,      long _A2)
    {
        return ldiv(_A1, _A2);
    }
}

__declspec(dllimport)  errno_t __cdecl _ltoa_s(     long _Val,        char * _DstBuf,      size_t _Size,      int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ltoa_s(     long _Value,      char (&_Dest)[_Size],      int _Radix) { return _ltoa_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ltoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _ltoa( long _Value,  char *_Dest,  int _Radix);
__declspec(dllimport)  int    __cdecl mblen(           const char * _Ch,      size_t _MaxCount);
__declspec(dllimport)  int    __cdecl _mblen_l(           const char * _Ch,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbstrlen(       const char * _Str);
__declspec(dllimport)  size_t __cdecl _mbstrlen_l(       const char *_Str,        _locale_t _Locale);
__declspec(dllimport)  size_t __cdecl _mbstrnlen(         const char *_Str,      size_t _MaxCount);
__declspec(dllimport)  size_t __cdecl _mbstrnlen_l(         const char *_Str,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport) int    __cdecl mbtowc(     wchar_t * _DstCh,            const char * _SrcCh,      size_t _SrcSizeInBytes);
__declspec(dllimport) int    __cdecl _mbtowc_l(     wchar_t * _DstCh,            const char * _SrcCh,      size_t _SrcSizeInBytes,        _locale_t _Locale);
__declspec(dllimport)  errno_t __cdecl mbstowcs_s(       size_t * _PtNumOfCharConverted,          wchar_t * _DstBuf,      size_t _SizeInWords,          const char * _SrcBuf,      size_t _MaxCount );
extern "C++" { template <size_t _Size> inline errno_t __cdecl mbstowcs_s(       size_t * _PtNumOfCharConverted,        wchar_t (&_Dest)[_Size],        const char * _Source,      size_t _MaxCount) { return mbstowcs_s(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "mbstowcs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl mbstowcs( wchar_t *_Dest,  const char * _Source,  size_t _MaxCount);

__declspec(dllimport)  errno_t __cdecl _mbstowcs_s_l(       size_t * _PtNumOfCharConverted,          wchar_t * _DstBuf,      size_t _SizeInWords,          const char * _SrcBuf,      size_t _MaxCount,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbstowcs_s_l(       size_t * _PtNumOfCharConverted,      wchar_t (&_Dest)[_Size],        const char * _Source,      size_t _MaxCount,        _locale_t _Locale) { return _mbstowcs_s_l(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbstowcs_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl _mbstowcs_l(       wchar_t *_Dest,        const char * _Source,      size_t _MaxCount,        _locale_t _Locale);

__declspec(dllimport)  int    __cdecl rand(void);
__declspec(dllimport)  int    __cdecl _set_error_mode(     int _Mode);

__declspec(dllimport) void   __cdecl srand(     unsigned int _Seed);
__declspec(dllimport)  double __cdecl strtod(       const char * _Str,                    char ** _EndPtr);
__declspec(dllimport)  double __cdecl _strtod_l(       const char * _Str,                    char ** _EndPtr,        _locale_t _Locale);
__declspec(dllimport)  long   __cdecl strtol(       const char * _Str,                    char ** _EndPtr,      int _Radix );
__declspec(dllimport)  long   __cdecl _strtol_l(       const char *_Str,                    char **_EndPtr,      int _Radix,        _locale_t _Locale);
__declspec(dllimport)  unsigned long __cdecl strtoul(       const char * _Str,                    char ** _EndPtr,      int _Radix);
__declspec(dllimport)  unsigned long __cdecl _strtoul_l(const char * _Str,                    char **_EndPtr,      int _Radix,        _locale_t _Locale);
__declspec(dllimport) int __cdecl system(         const char * _Command);

__declspec(dllimport)  errno_t __cdecl _ultoa_s(     unsigned long _Val,        char * _DstBuf,      size_t _Size,      int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ultoa_s(     unsigned long _Value,      char (&_Dest)[_Size],      int _Radix) { return _ultoa_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ultoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) char * __cdecl _ultoa( unsigned long _Value,  char *_Dest,  int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "wctomb_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) int    __cdecl wctomb(         char * _MbCh,        wchar_t _WCh);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wctomb_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) int    __cdecl _wctomb_l(       char * _MbCh,        wchar_t _WCh,        _locale_t _Locale);

__declspec(dllimport)  errno_t __cdecl wctomb_s(       int * _SizeConverted,          char * _MbCh,      rsize_t _SizeInBytes,        wchar_t _WCh);

__declspec(dllimport)  errno_t __cdecl _wctomb_s_l(       int * _SizeConverted,          char * _MbCh,      size_t _SizeInBytes,        wchar_t _WCh,        _locale_t _Locale);
__declspec(dllimport)  errno_t __cdecl wcstombs_s(       size_t * _PtNumOfCharConverted,          char * _Dst,      size_t _DstSizeInBytes,        const wchar_t * _Src,      size_t _MaxCountInBytes);
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcstombs_s(       size_t * _PtNumOfCharConverted,        char (&_Dest)[_Size],        const wchar_t * _Source,      size_t _MaxCount) { return wcstombs_s(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcstombs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl wcstombs( char *_Dest,  const wchar_t * _Source,  size_t _MaxCount);
__declspec(dllimport)  errno_t __cdecl _wcstombs_s_l(       size_t * _PtNumOfCharConverted,          char * _Dst,      size_t _DstSizeInBytes,        const wchar_t * _Src,      size_t _MaxCountInBytes,        _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcstombs_s_l(       size_t * _PtNumOfCharConverted,        char (&_Dest)[_Size],        const wchar_t * _Source,      size_t _MaxCount,        _locale_t _Locale) { return _wcstombs_s_l(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcstombs_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl _wcstombs_l(       char *_Dest,        const wchar_t * _Source,      size_t _MaxCount,        _locale_t _Locale);
__declspec(dllimport)   __declspec(noalias) __declspec(restrict)         void * __cdecl calloc(     size_t _NumOfElements,      size_t _SizeOfElements);
__declspec(dllimport)                     __declspec(noalias)                                                                             void   __cdecl free(       void * _Memory);
__declspec(dllimport)   __declspec(noalias) __declspec(restrict)                                   void * __cdecl malloc(     size_t _Size);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                                void * __cdecl realloc(       void * _Memory,      size_t _NewSize);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                            void * __cdecl _recalloc(       void * _Memory,      size_t _Count,      size_t _Size);
__declspec(dllimport)                     __declspec(noalias)                                                                             void   __cdecl _aligned_free(       void * _Memory);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                                   void * __cdecl _aligned_malloc(     size_t _Size,      size_t _Alignment);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                                   void * __cdecl _aligned_offset_malloc(     size_t _Size,      size_t _Alignment,      size_t _Offset);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                                   void * __cdecl _aligned_realloc(       void * _Memory,      size_t _Size,      size_t _Alignment);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                            void * __cdecl _aligned_recalloc(       void * _Memory,      size_t _Count,      size_t _Size,      size_t _Alignment);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                                   void * __cdecl _aligned_offset_realloc(       void * _Memory,      size_t _Size,      size_t _Alignment,      size_t _Offset);
__declspec(dllimport)                     __declspec(noalias) __declspec(restrict)                            void * __cdecl _aligned_offset_recalloc(       void * _Memory,      size_t _Count,      size_t _Size,      size_t _Alignment,      size_t _Offset);
__declspec(dllimport)  errno_t __cdecl _itow_s (     int _Val,        wchar_t * _DstBuf,      size_t _SizeInWords,      int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _itow_s(     int _Value,      wchar_t (&_Dest)[_Size],      int _Radix) { return _itow_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_itow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _itow( int _Value,  wchar_t *_Dest,  int _Radix);
__declspec(dllimport)  errno_t __cdecl _ltow_s (     long _Val,        wchar_t * _DstBuf,      size_t _SizeInWords,      int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ltow_s(     long _Value,      wchar_t (&_Dest)[_Size],      int _Radix) { return _ltow_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ltow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _ltow( long _Value,  wchar_t *_Dest,  int _Radix);
__declspec(dllimport)  errno_t __cdecl _ultow_s (     unsigned long _Val,        wchar_t * _DstBuf,      size_t _SizeInWords,      int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ultow_s(     unsigned long _Value,      wchar_t (&_Dest)[_Size],      int _Radix) { return _ultow_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ultow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _ultow( unsigned long _Value,  wchar_t *_Dest,  int _Radix);
__declspec(dllimport)  double __cdecl wcstod(       const wchar_t * _Str,                    wchar_t ** _EndPtr);
__declspec(dllimport)  double __cdecl _wcstod_l(       const wchar_t *_Str,                    wchar_t ** _EndPtr,        _locale_t _Locale);
__declspec(dllimport)  long   __cdecl wcstol(       const wchar_t *_Str,                    wchar_t ** _EndPtr, int _Radix);
__declspec(dllimport)  long   __cdecl _wcstol_l(       const wchar_t *_Str,                    wchar_t **_EndPtr, int _Radix,        _locale_t _Locale);
__declspec(dllimport)  unsigned long __cdecl wcstoul(       const wchar_t *_Str,                    wchar_t ** _EndPtr, int _Radix);
__declspec(dllimport)  unsigned long __cdecl _wcstoul_l(       const wchar_t *_Str,                    wchar_t **_EndPtr, int _Radix,        _locale_t _Locale);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wdupenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  wchar_t * __cdecl _wgetenv(       const wchar_t * _VarName);
__declspec(dllimport)  errno_t __cdecl _wgetenv_s(     size_t * _ReturnSize,        wchar_t * _DstBuf,      size_t _DstSizeInWords,        const wchar_t * _VarName);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wgetenv_s(     size_t * _ReturnSize,      wchar_t (&_Dest)[_Size],        const wchar_t * _VarName) { return _wgetenv_s(_ReturnSize, _Dest, _Size, _VarName); } }
__declspec(dllimport)  errno_t __cdecl _wdupenv_s(                     wchar_t **_Buffer,        size_t *_BufferSizeInWords,        const wchar_t *_VarName);
__declspec(dllimport) int __cdecl _wsystem(         const wchar_t * _Command);

__declspec(dllimport)  double __cdecl _wtof(       const wchar_t *_Str);
__declspec(dllimport)  double __cdecl _wtof_l(       const wchar_t *_Str,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl _wtoi(       const wchar_t *_Str);
__declspec(dllimport)  int __cdecl _wtoi_l(       const wchar_t *_Str,        _locale_t _Locale);
__declspec(dllimport)  long __cdecl _wtol(       const wchar_t *_Str);
__declspec(dllimport)  long __cdecl _wtol_l(       const wchar_t *_Str,        _locale_t _Locale);
__declspec(dllimport)  errno_t __cdecl _i64tow_s(     __int64 _Val,        wchar_t * _DstBuf,      size_t _SizeInWords,      int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_i65tow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) wchar_t * __cdecl _i64tow(     __int64 _Val,      wchar_t * _DstBuf,      int _Radix);
__declspec(dllimport)  errno_t __cdecl _ui64tow_s(     unsigned __int64 _Val,        wchar_t * _DstBuf,      size_t _SizeInWords,      int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ui64tow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) wchar_t * __cdecl _ui64tow(     unsigned __int64 _Val,      wchar_t * _DstBuf,      int _Radix);
__declspec(dllimport)  __int64   __cdecl _wtoi64(       const wchar_t *_Str);
__declspec(dllimport)  __int64   __cdecl _wtoi64_l(       const wchar_t *_Str,        _locale_t _Locale);
__declspec(dllimport)  __int64   __cdecl _wcstoi64(       const wchar_t * _Str,                    wchar_t ** _EndPtr,      int _Radix);
__declspec(dllimport)  __int64   __cdecl _wcstoi64_l(       const wchar_t * _Str,                    wchar_t ** _EndPtr,      int _Radix,        _locale_t _Locale);
__declspec(dllimport)  unsigned __int64  __cdecl _wcstoui64(       const wchar_t * _Str,                    wchar_t ** _EndPtr,      int _Radix);
__declspec(dllimport)  unsigned __int64  __cdecl _wcstoui64_l(       const wchar_t *_Str ,                    wchar_t ** _EndPtr,      int _Radix,        _locale_t _Locale);
__declspec(dllimport)  char * __cdecl _fullpath(         char * _FullPath,        const char * _Path,      size_t _SizeInBytes);

__declspec(dllimport)  errno_t __cdecl _ecvt_s(       char * _DstBuf,      size_t _Size,      double _Val,      int _NumOfDights,      int * _PtDec,      int * _PtSign);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ecvt_s(     char (&_Dest)[_Size],      double _Value,      int _NumOfDigits,      int * _PtDec,      int * _PtSign) { return _ecvt_s(_Dest, _Size, _Value, _NumOfDigits, _PtDec, _PtSign); } }
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ecvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  char * __cdecl _ecvt(     double _Val,      int _NumOfDigits,      int * _PtDec,      int * _PtSign);
__declspec(dllimport)  errno_t __cdecl _fcvt_s(       char * _DstBuf,      size_t _Size,      double _Val,      int _NumOfDec,      int * _PtDec,      int * _PtSign);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _fcvt_s(     char (&_Dest)[_Size],      double _Value,      int _NumOfDigits,      int * _PtDec,      int * _PtSign) { return _fcvt_s(_Dest, _Size, _Value, _NumOfDigits, _PtDec, _PtSign); } }
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))  char * __cdecl _fcvt(     double _Val,      int _NumOfDec,      int * _PtDec,      int * _PtSign);
__declspec(dllimport) errno_t __cdecl _gcvt_s(       char * _DstBuf,      size_t _Size,      double _Val,      int _NumOfDigits);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _gcvt_s(     char (&_Dest)[_Size],      double _Value,      int _NumOfDigits) { return _gcvt_s(_Dest, _Size, _Value, _NumOfDigits); } }
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_gcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) char * __cdecl _gcvt(     double _Val,      int _NumOfDigits,      char * _DstBuf);

__declspec(dllimport)  int __cdecl _atodbl(     _CRT_DOUBLE * _Result,        char * _Str);
__declspec(dllimport)  int __cdecl _atoldbl(     _LDOUBLE * _Result,        char * _Str);
__declspec(dllimport)  int __cdecl _atoflt(     _CRT_FLOAT * _Result,        char * _Str);
__declspec(dllimport)  int __cdecl _atodbl_l(     _CRT_DOUBLE * _Result,        char * _Str,        _locale_t _Locale);
__declspec(dllimport) int __cdecl _atoldbl_l(     _LDOUBLE * _Result,        char * _Str,        _locale_t _Locale);
__declspec(dllimport) int __cdecl _atoflt_l(     _CRT_FLOAT * _Result,        char * _Str,        _locale_t _Locale);
         unsigned long __cdecl _lrotl(     unsigned long _Val,      int _Shift);
         unsigned long __cdecl _lrotr(     unsigned long _Val,      int _Shift);
__declspec(dllimport)  errno_t   __cdecl _makepath_s(       char * _PathResult,        size_t _Size,          const char * _Drive,          const char * _Dir,          const char * _Filename,
                 const char * _Ext);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _makepath_s(     char (&_Path)[_Size],          const char * _Drive,          const char * _Dir,          const char * _Filename,          const char * _Ext) { return _makepath_s(_Path, _Size, _Drive, _Dir, _Filename, _Ext); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_makepath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void __cdecl _makepath( char *_Path,  const char * _Drive,  const char * _Dir,  const char * _Filename,  const char * _Ext);
        _onexit_t __cdecl _onexit(       _onexit_t _Func);
__declspec(dllimport)  int    __cdecl _putenv(       const char * _EnvString);
__declspec(dllimport)  errno_t __cdecl _putenv_s(       const char * _Name,        const char * _Value);
         unsigned int __cdecl _rotl(     unsigned int _Val,      int _Shift);

         unsigned __int64 __cdecl _rotl64(     unsigned __int64 _Val,      int _Shift);

         unsigned int __cdecl _rotr(     unsigned int _Val,      int _Shift);

         unsigned __int64 __cdecl _rotr64(     unsigned __int64 _Val,      int _Shift);

__declspec(dllimport) errno_t __cdecl _searchenv_s(       const char * _Filename,        const char * _EnvVar,        char * _ResultPath,      size_t _SizeInBytes);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _searchenv_s(       const char * _Filename,        const char * _EnvVar,      char (&_ResultPath)[_Size]) { return _searchenv_s(_Filename, _EnvVar, _ResultPath, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_searchenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void __cdecl _searchenv( const char * _Filename,  const char * _EnvVar,  char *_ResultPath);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_splitpath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void   __cdecl _splitpath(       const char * _FullPath,        char * _Drive,        char * _Dir,        char * _Filename,        char * _Ext);
__declspec(dllimport)  errno_t  __cdecl _splitpath_s(       const char * _FullPath,
		         char * _Drive,      size_t _DriveSize,
		         char * _Dir,      size_t _DirSize,
		         char * _Filename,      size_t _FilenameSize,
		         char * _Ext,      size_t _ExtSize);
extern "C++" { template <size_t _DriveSize, size_t _DirSize, size_t _NameSize, size_t _ExtSize> inline errno_t __cdecl _splitpath_s(     const char *_Dest,        char (&_Drive)[_DriveSize],        char (&_Dir)[_DirSize],        char (&_Name)[_NameSize],        char (&_Ext)[_ExtSize]) { return _splitpath_s(_Dest, _Drive, _DriveSize, _Dir, _DirSize, _Name, _NameSize, _Ext, _ExtSize); } }

__declspec(dllimport) void   __cdecl _swab(           char * _Buf1,            char * _Buf2, int _SizeInBytes);
__declspec(dllimport)  wchar_t * __cdecl _wfullpath(         wchar_t * _FullPath,        const wchar_t * _Path,      size_t _SizeInWords);

__declspec(dllimport)  errno_t __cdecl _wmakepath_s(       wchar_t * _PathResult,        size_t _SizeInWords,          const wchar_t * _Drive,          const wchar_t * _Dir,          const wchar_t * _Filename,
                 const wchar_t * _Ext);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wmakepath_s(     wchar_t (&_ResultPath)[_Size],          const wchar_t * _Drive,          const wchar_t * _Dir,          const wchar_t * _Filename,          const wchar_t * _Ext) { return _wmakepath_s(_ResultPath, _Size, _Drive, _Dir, _Filename, _Ext); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wmakepath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void __cdecl _wmakepath( wchar_t *_ResultPath,  const wchar_t * _Drive,  const wchar_t * _Dir,  const wchar_t * _Filename,  const wchar_t * _Ext);
__declspec(dllimport)  int    __cdecl _wputenv(       const wchar_t * _EnvString);
__declspec(dllimport)  errno_t __cdecl _wputenv_s(       const wchar_t * _Name,        const wchar_t * _Value);
__declspec(dllimport) errno_t __cdecl _wsearchenv_s(       const wchar_t * _Filename,        const wchar_t * _EnvVar,        wchar_t * _ResultPath,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wsearchenv_s(       const wchar_t * _Filename,        const wchar_t * _EnvVar,      wchar_t (&_ResultPath)[_Size]) { return _wsearchenv_s(_Filename, _EnvVar, _ResultPath, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsearchenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void __cdecl _wsearchenv( const wchar_t * _Filename,  const wchar_t * _EnvVar,  wchar_t *_ResultPath);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsplitpath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) void   __cdecl _wsplitpath(       const wchar_t * _FullPath,        wchar_t * _Drive,        wchar_t * _Dir,        wchar_t * _Filename,        wchar_t * _Ext);
__declspec(dllimport) errno_t __cdecl _wsplitpath_s(       const wchar_t * _FullPath,
		         wchar_t * _Drive,      size_t _DriveSizeInWords,
		         wchar_t * _Dir,      size_t _DirSizeInWords,
		         wchar_t * _Filename,      size_t _FilenameSizeInWords,
		         wchar_t * _Ext,      size_t _ExtSizeInWords);
extern "C++" { template <size_t _DriveSize, size_t _DirSize, size_t _NameSize, size_t _ExtSize> inline errno_t __cdecl _wsplitpath_s(     const wchar_t *_Path,        wchar_t (&_Drive)[_DriveSize],        wchar_t (&_Dir)[_DirSize],        wchar_t (&_Name)[_NameSize],        wchar_t (&_Ext)[_ExtSize]) { return _wsplitpath_s(_Path, _Drive, _DriveSize, _Dir, _DirSize, _Name, _NameSize, _Ext, _ExtSize); } }

__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "SetErrorMode" "instead. See online help for details.")) __declspec(dllimport) void __cdecl _seterrormode(     int _Mode);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "Beep" "instead. See online help for details.")) __declspec(dllimport) void __cdecl _beep(     unsigned _Frequency,      unsigned _Duration);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "Sleep" "instead. See online help for details.")) __declspec(dllimport) void __cdecl _sleep(     unsigned long _Duration);
#pragma warning(push)
#pragma warning(disable: 4141)
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_ecvt" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ecvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))		__declspec(dllimport)  char * __cdecl ecvt(     double _Val,      int _NumOfDigits,      int * _PtDec,      int * _PtSign);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fcvt" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))		__declspec(dllimport)  char * __cdecl fcvt(     double _Val,      int _NumOfDec,      int * _PtDec,      int * _PtSign);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_gcvt" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))		__declspec(dllimport) char * __cdecl gcvt(     double _Val,      int _NumOfDigits,      char * _DstBuf);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_itoa" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_itoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))		__declspec(dllimport) char * __cdecl itoa(     int _Val,      char * _DstBuf,      int _Radix);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_ltoa" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ltoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))		__declspec(dllimport) char * __cdecl ltoa(     long _Val,      char * _DstBuf,      int _Radix);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_putenv" ". See online help for details.")) 									__declspec(dllimport)  int    __cdecl putenv(       const char * _EnvString);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_swab" ". See online help for details."))										__declspec(dllimport) void   __cdecl swab(           char * _Buf1,           char * _Buf2,      int _SizeInBytes);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_ultoa" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ultoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details."))	__declspec(dllimport) char * __cdecl ultoa(     unsigned long _Val,      char * _Dstbuf,      int _Radix);
#pragma warning(pop)
_onexit_t __cdecl onexit(       _onexit_t _Func);
}
#pragma pack(pop)

namespace std {
using ::size_t; using ::div_t; using ::ldiv_t;

using ::abort; using ::abs; using ::atexit;
using ::atof; using ::atoi; using ::atol;
using ::bsearch; using ::calloc; using ::div;
using ::exit; using ::free; using ::getenv;
using ::labs; using ::ldiv; using ::malloc;
using ::mblen; using ::mbstowcs; using ::mbtowc;
using ::qsort; using ::rand; using ::realloc;
using ::srand; using ::strtod; using ::strtol;
using ::strtoul; using ::system;
using ::wcstombs; using ::wctomb;
}

#pragma once

#pragma once

#pragma once
#pragma once
namespace std {
using ::size_t; using ::memchr; using ::memcmp;
using ::memcpy; using ::memmove; using ::memset;
using ::strcat; using ::strchr; using ::strcmp;
using ::strcoll; using ::strcpy; using ::strcspn;
using ::strerror; using ::strlen; using ::strncat;
using ::strncmp; using ::strncpy; using ::strpbrk;
using ::strrchr; using ::strspn; using ::strstr;
using ::strtok; using ::strxfrm;
}
#pragma once

#pragma once
#pragma once

#pragma once
#pragma once
extern "C" {
__declspec(dllimport) extern unsigned long  __cdecl __threadid(void);

__declspec(dllimport) extern uintptr_t __cdecl __threadhandle(void);
}
namespace std {
using ::ptrdiff_t; using ::size_t;
}

#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		

		

		
		
enum _Uninitialized
	{	
	_Noinit};
}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {
 }
#pragma once
#pragma pack(push,8)
typedef void (__cdecl *terminate_function)();
typedef void (__cdecl *terminate_handler)();
typedef void (__cdecl *unexpected_function)();
typedef void (__cdecl *unexpected_handler)();
struct _EXCEPTION_POINTERS;

typedef void (__cdecl *_se_translator_function)(unsigned int, struct _EXCEPTION_POINTERS*);
__declspec(dllimport) __declspec(noreturn) void __cdecl terminate(void);
__declspec(dllimport) void __cdecl unexpected(void);

__declspec(dllimport) int __cdecl _is_exception_typeof(     const type_info &_Type,      struct _EXCEPTION_POINTERS * _ExceptionPtr);
__declspec(dllimport) terminate_function __cdecl set_terminate(       terminate_function _NewPtFunc);
extern "C" __declspec(dllimport) terminate_function __cdecl _get_terminate(void);
__declspec(dllimport) unexpected_function __cdecl set_unexpected(       unexpected_function _NewPtFunc);
extern "C" __declspec(dllimport) unexpected_function __cdecl _get_unexpected(void);
__declspec(dllimport) _se_translator_function __cdecl _set_se_translator(       _se_translator_function _NewPtFunc);

__declspec(dllimport) bool __cdecl __uncaught_exception();
#pragma pack(pop)

#pragma once
#pragma pack(push,8)
extern "C" {
typedef struct _heapinfo {
        int * _pentry;
        size_t _size;
        int _useflag;
        } _HEAPINFO;
extern __declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_amblksiz" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) unsigned int _amblksiz;
__declspec(dllimport) int     __cdecl _resetstkoflw (void);
__declspec(dllimport) unsigned long __cdecl _set_malloc_crt_max_wait(     unsigned long _NewValue);
__declspec(dllimport)      void *  __cdecl _expand(     void * _Memory,      size_t _NewSize);
__declspec(dllimport)  size_t  __cdecl _msize(     void * _Memory);
   void *          __cdecl _alloca(     size_t _Size);
__declspec(dllimport)  size_t  __cdecl _get_sbh_threshold(void);
__declspec(dllimport) int     __cdecl _set_sbh_threshold(     size_t _NewValue);
__declspec(dllimport) errno_t __cdecl _set_amblksiz(     size_t _Value);
__declspec(dllimport) errno_t __cdecl _get_amblksiz(     size_t * _Value);
__declspec(dllimport)  int     __cdecl _heapadd(     void * _Memory,      size_t _Size);
__declspec(dllimport)  int     __cdecl _heapchk(void);
__declspec(dllimport)  int     __cdecl _heapmin(void);
__declspec(dllimport) int     __cdecl _heapset(     unsigned int _Fill);
__declspec(dllimport)  int     __cdecl _heapwalk(     _HEAPINFO * _EntryInfo);
__declspec(dllimport) size_t  __cdecl _heapused(size_t * _Used, size_t * _Commit);

__declspec(dllimport) intptr_t __cdecl _get_heap_handle(void);

typedef char __static_assert_t[ (sizeof(unsigned int) <= 8) ];
__inline void *_MarkAllocaS(        void *_Ptr, unsigned int _Marker)
{
    if (_Ptr)
    {
        *((unsigned int*)_Ptr) = _Marker;
        _Ptr = (char*)_Ptr + 8;
    }
    return _Ptr;
}

__declspec(noalias) __inline void __cdecl _freea(       void * _Memory)
{
    unsigned int _Marker;
    if (_Memory)
    {
        _Memory = (char*)_Memory - 8;
        _Marker = *(unsigned int *)_Memory;
        if (_Marker == 0xDDDD)
        {
            free(_Memory);
        }
    }
}
}
#pragma pack(pop)
typedef const char *__exString;
extern "C" size_t __cdecl strlen(const char *);

extern "C" __declspec(dllimport) errno_t __cdecl strcpy_s(       char * _Dst,      size_t _DstSize,        const char * _Src);
 namespace std {

class __declspec(dllimport) exception
	{	
public:
     exception();
     exception(const char *const&);
     exception(const char *const&, int);
     exception(const exception&);
    exception&  operator=(const exception&);
    virtual  ~exception();
    virtual const char *  what() const;

private:
	const char *_m_what;
	int _m_doFree;
	};

using ::set_terminate; using ::terminate_handler; using ::terminate; using ::set_unexpected; using ::unexpected_handler; using ::unexpected;

typedef void (__cdecl *_Prhand)(const exception&);

__declspec(dllimport) bool __cdecl uncaught_exception();

		
class bad_exception : public exception
	{	
public:
	 bad_exception(const char *_Message = "bad exception")
		throw ()
		: exception(_Message)
		{	
		}

	virtual  ~bad_exception() throw ()
		{	
		}
	};
static const char * _bad_alloc_Message = "bad allocation";

		
class bad_alloc : public exception
	{	
public:
	 bad_alloc(const char *_Message) throw ()
		: exception(_Message)
		{	
		}

	 bad_alloc() throw ()
		: exception(_bad_alloc_Message, 1)
		{	
		}

	virtual  ~bad_alloc() throw ()
		{	
		}
	};

}
#pragma warning(pop)
#pragma pack(pop)

#pragma once

#pragma once
#pragma once
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		

typedef void (__cdecl * new_handler) ();

struct nothrow_t
	{	
	};

extern const nothrow_t nothrow;	
		
__declspec(dllimport) new_handler __cdecl set_new_handler(new_handler)
	throw ();	
}

		
void __cdecl operator delete(void *) throw ();
  void *__cdecl operator new(size_t _Size) throw (...);
inline void *__cdecl operator new(size_t, void *_Where) throw ()
	{	
	return (_Where);
	}

inline void __cdecl operator delete(void *, void *) throw ()
	{	
	}

inline void *__cdecl operator new[](size_t, void *_Where) throw ()
	{	
	return (_Where);
	}

inline void __cdecl operator delete[](void *, void *) throw ()
	{	
	}
void __cdecl operator delete[](void *) throw ();	

  void *__cdecl operator new[](size_t _Size)
	throw (...);	
    void *__cdecl operator new(size_t _Size, const std::nothrow_t&)
	throw ();

    void *__cdecl operator new[](size_t _Size, const std::nothrow_t&)
	throw ();	

void __cdecl operator delete(void *, const std::nothrow_t&)
	throw ();	

void __cdecl operator delete[](void *, const std::nothrow_t&)
	throw ();	
using std::new_handler;
#pragma warning(pop)
#pragma pack(pop)
#pragma once
#pragma once

#pragma once
#pragma once
#pragma once

#pragma pack(push,8)
extern "C" {
typedef unsigned long _fsize_t;

struct _wfinddata32_t {
        unsigned    attrib;
        __time32_t  time_create;
        __time32_t  time_access;
        __time32_t  time_write;
        _fsize_t    size;
        wchar_t     name[260];
};
struct _wfinddata32i64_t {
        unsigned    attrib;
        __time32_t  time_create;
        __time32_t  time_access;
        __time32_t  time_write;
        __int64     size;
        wchar_t     name[260];
};

struct _wfinddata64i32_t {
        unsigned    attrib;
        __time64_t  time_create;
        __time64_t  time_access;
        __time64_t  time_write;
        _fsize_t    size;
        wchar_t     name[260];
};

struct _wfinddata64_t {
        unsigned    attrib;
        __time64_t  time_create;
        __time64_t  time_access;
        __time64_t  time_write;
        __int64     size;
        wchar_t     name[260];
};
__declspec(dllimport) const unsigned short * __cdecl __pctype_func(void);

__declspec(dllimport) extern const unsigned short *_pctype;
__declspec(dllimport) extern const unsigned short _wctype[];
__declspec(dllimport) const wctype_t * __cdecl __pwctype_func(void);

__declspec(dllimport) extern const wctype_t *_pwctype;

__declspec(dllimport)  int __cdecl iswalpha(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswalpha_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswupper(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswupper_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswlower(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswlower_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswdigit(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswdigit_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswxdigit(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswxdigit_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswspace(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswspace_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswpunct(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswpunct_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswalnum(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswalnum_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswprint(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswprint_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswgraph(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswgraph_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswcntrl(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswcntrl_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswascii(     wint_t _C);
__declspec(dllimport)  int __cdecl isleadbyte(     int _C);
__declspec(dllimport)  int __cdecl _isleadbyte_l(     int _C,        _locale_t _Locale);

__declspec(dllimport)  wint_t __cdecl towupper(     wint_t _C);
__declspec(dllimport)  wint_t __cdecl _towupper_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  wint_t __cdecl towlower(     wint_t _C);
__declspec(dllimport)  wint_t __cdecl _towlower_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iswctype(     wint_t _C,      wctype_t _Type);
__declspec(dllimport)  int __cdecl _iswctype_l(     wint_t _C,      wctype_t _Type,        _locale_t _Locale);

__declspec(dllimport)  int __cdecl __iswcsymf(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswcsymf_l(     wint_t _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl __iswcsym(     wint_t _C);
__declspec(dllimport)  int __cdecl _iswcsym_l(     wint_t _C,        _locale_t _Locale);

__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "iswctype" "instead. See online help for details.")) __declspec(dllimport) int __cdecl is_wctype(     wint_t _C,      wctype_t _Type);

__declspec(dllimport)         wchar_t * __cdecl _wgetcwd(       wchar_t * _DstBuf,      int _SizeInWords);
__declspec(dllimport)         wchar_t * __cdecl _wgetdcwd(     int _Drive,        wchar_t * _DstBuf,      int _SizeInWords);
        wchar_t * __cdecl _wgetdcwd_nolock(     int _Drive,        wchar_t * _DstBuf,      int _SizeInWords);
__declspec(dllimport)  int __cdecl _wchdir(       const wchar_t * _Path);
__declspec(dllimport)  int __cdecl _wmkdir(       const wchar_t * _Path);
__declspec(dllimport)  int __cdecl _wrmdir(       const wchar_t * _Path);
__declspec(dllimport)  int __cdecl _waccess(       const wchar_t * _Filename,      int _AccessMode);
__declspec(dllimport)  errno_t __cdecl _waccess_s(       const wchar_t * _Filename,      int _AccessMode);
__declspec(dllimport)  int __cdecl _wchmod(       const wchar_t * _Filename,      int _Mode);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _wcreat(       const wchar_t * _Filename,      int _PermissionMode);
__declspec(dllimport)  intptr_t __cdecl _wfindfirst32(       const wchar_t * _Filename,      struct _wfinddata32_t * _FindData);
__declspec(dllimport)  int __cdecl _wfindnext32(     intptr_t _FindHandle,      struct _wfinddata32_t * _FindData);
__declspec(dllimport)  int __cdecl _wunlink(       const wchar_t * _Filename);
__declspec(dllimport)  int __cdecl _wrename(       const wchar_t * _NewFilename,        const wchar_t * _OldFilename);
__declspec(dllimport) errno_t __cdecl _wmktemp_s(           wchar_t * _TemplateName,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wmktemp_s(       wchar_t (&_TemplateName)[_Size]) { return _wmktemp_s(_TemplateName, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wmktemp_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wmktemp( wchar_t *_TemplateName);
__declspec(dllimport)  intptr_t __cdecl _wfindfirst32i64(       const wchar_t * _Filename,      struct _wfinddata32i64_t * _FindData);
__declspec(dllimport)  intptr_t __cdecl _wfindfirst64i32(       const wchar_t * _Filename,      struct _wfinddata64i32_t * _FindData);
__declspec(dllimport)  intptr_t __cdecl _wfindfirst64(       const wchar_t * _Filename,      struct _wfinddata64_t * _FindData);
__declspec(dllimport)  int __cdecl _wfindnext32i64(     intptr_t _FindHandle,      struct _wfinddata32i64_t * _FindData);
__declspec(dllimport)  int __cdecl _wfindnext64i32(     intptr_t _FindHandle,      struct _wfinddata64i32_t * _FindData);
__declspec(dllimport)  int __cdecl _wfindnext64(     intptr_t _FindHandle,      struct _wfinddata64_t * _FindData);
__declspec(dllimport)  errno_t __cdecl _wsopen_s(     int * _FileHandle,        const wchar_t * _Filename,      int _OpenFlag,      int _ShareFlag,      int _PermissionFlag);

extern "C++" __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl _wopen(       const wchar_t * _Filename,      int _OpenFlag,      int _PermissionMode = 0);
extern "C++" __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) int __cdecl _wsopen(       const wchar_t * _Filename,      int _OpenFlag,      int _ShareFlag, int _PermissionMode = 0);
__declspec(dllimport)  wchar_t * __cdecl _wsetlocale(     int _Category,          const wchar_t * _Locale);
__declspec(dllimport) intptr_t __cdecl _wexecl(       const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexecle(       const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexeclp(       const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexeclpe(       const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexecv(       const wchar_t * _Filename,        const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wexecve(       const wchar_t * _Filename,        const wchar_t * const * _ArgList,
                 const wchar_t * const * _Env);
__declspec(dllimport) intptr_t __cdecl _wexecvp(       const wchar_t * _Filename,        const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wexecvpe(       const wchar_t * _Filename,        const wchar_t * const * _ArgList,
                 const wchar_t * const * _Env);
__declspec(dllimport) intptr_t __cdecl _wspawnl(     int _Mode,        const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnle(     int _Mode,        const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnlp(     int _Mode,        const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnlpe(     int _Mode,        const wchar_t * _Filename,        const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnv(     int _Mode,        const wchar_t * _Filename,        const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wspawnve(     int _Mode,        const wchar_t * _Filename,        const wchar_t * const * _ArgList,
                 const wchar_t * const * _Env);
__declspec(dllimport) intptr_t __cdecl _wspawnvp(     int _Mode,        const wchar_t * _Filename,        const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wspawnvpe(     int _Mode,        const wchar_t * _Filename,        const wchar_t * const * _ArgList,
                 const wchar_t * const * _Env);
typedef unsigned short _ino_t;
typedef unsigned short ino_t;

typedef unsigned int _dev_t;
typedef unsigned int dev_t;

typedef long _off_t;
typedef long off_t;
struct _stat32 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        _off_t     st_size;
        __time32_t st_atime;
        __time32_t st_mtime;
        __time32_t st_ctime;
        };
struct stat {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        _off_t     st_size;
        time_t st_atime;
        time_t st_mtime;
        time_t st_ctime;
        };

struct _stat32i64 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        __int64    st_size;
        __time32_t st_atime;
        __time32_t st_mtime;
        __time32_t st_ctime;
        };

struct _stat64i32 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        _off_t     st_size;
        __time64_t st_atime;
        __time64_t st_mtime;
        __time64_t st_ctime;
        };

struct _stat64 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        __int64    st_size;
        __time64_t st_atime;
        __time64_t st_mtime;
        __time64_t st_ctime;
        };
__declspec(dllimport) int __cdecl _wstat32(       const wchar_t * _Name,      struct _stat32 * _Stat);
__declspec(dllimport) int __cdecl _wstat32i64(       const wchar_t * _Name,      struct _stat32i64 * _Stat);
__declspec(dllimport) int __cdecl _wstat64i32(       const wchar_t * _Name,      struct _stat64i32 * _Stat);
__declspec(dllimport) int __cdecl _wstat64(       const wchar_t * _Name,      struct _stat64 * _Stat);
__declspec(dllimport)  errno_t __cdecl _cgetws_s(       wchar_t * _Buffer, size_t _SizeInWords,      size_t * _SizeRead);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _cgetws_s(       wchar_t (&_Buffer)[_Size], size_t * _Size) { return _cgetws_s(_Buffer, _Size, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_cgetws_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _cgetws(         wchar_t *_Buffer);
__declspec(dllimport)  wint_t __cdecl _getwch(void);
__declspec(dllimport)  wint_t __cdecl _getwche(void);
__declspec(dllimport)  wint_t __cdecl _putwch(wchar_t _WCh);
__declspec(dllimport)  wint_t __cdecl _ungetwch(wint_t _WCh);
__declspec(dllimport)  int __cdecl _cputws(       const wchar_t * _String);
__declspec(dllimport)  int __cdecl _cwprintf(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _cwprintf_s(        const wchar_t * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_cwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _cwscanf(        const wchar_t * _Format, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_cwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport)  int __cdecl _cwscanf_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _cwscanf_s(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _cwscanf_s_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport)  int __cdecl _vcwprintf(        const wchar_t *_Format, va_list _ArgList);
__declspec(dllimport)  int __cdecl _vcwprintf_s(        const wchar_t *_Format, va_list _ArgList);

__declspec(dllimport)  int __cdecl _cwprintf_p(        const wchar_t * _Format, ...);
__declspec(dllimport)  int __cdecl _vcwprintf_p(        const wchar_t*  _Format, va_list _ArgList);

__declspec(dllimport) int __cdecl _cwprintf_l(       const  wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport) int __cdecl _cwprintf_s_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport) int __cdecl _vcwprintf_l(        const wchar_t *_Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport) int __cdecl _vcwprintf_s_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);
__declspec(dllimport) int __cdecl _cwprintf_p_l(        const wchar_t * _Format,        _locale_t _Locale, ...);
__declspec(dllimport) int __cdecl _vcwprintf_p_l(        const wchar_t * _Format,        _locale_t _Locale, va_list _ArgList);

 wint_t __cdecl _putwch_nolock(wchar_t _WCh);
 wint_t __cdecl _getwch_nolock(void);
 wint_t __cdecl _getwche_nolock(void);
 wint_t __cdecl _ungetwch_nolock(wint_t _WCh);
struct tm {
        int tm_sec;
        int tm_min;
        int tm_hour;
        int tm_mday;
        int tm_mon;
        int tm_year;
        int tm_wday;
        int tm_yday;
        int tm_isdst;
        };
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wasctime_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wasctime(     const struct tm * _Tm);
__declspec(dllimport) errno_t __cdecl _wasctime_s(       wchar_t *_Buf,      size_t _SizeInWords,      const struct tm * _Tm);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wasctime_s(       wchar_t (&_Buffer)[_Size],      const struct tm * _Time) { return _wasctime_s(_Buffer, _Size, _Time); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wctime32_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wctime32(     const __time32_t *_Time);
__declspec(dllimport) errno_t __cdecl _wctime32_s(       wchar_t* _Buf,      size_t _SizeInWords,      const __time32_t * _Time);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wctime32_s(       wchar_t (&_Buffer)[_Size],      const __time32_t * _Time) { return _wctime32_s(_Buffer, _Size, _Time); } }

__declspec(dllimport) size_t __cdecl wcsftime(       wchar_t * _Buf,      size_t _SizeInWords,         const wchar_t * _Format,       const struct tm * _Tm);
__declspec(dllimport) size_t __cdecl _wcsftime_l(       wchar_t * _Buf,      size_t _SizeInWords,         const wchar_t *_Format,      const struct tm *_Tm,        _locale_t _Locale);

__declspec(dllimport) errno_t __cdecl _wstrdate_s(       wchar_t * _Buf,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wstrdate_s(       wchar_t (&_Buffer)[_Size]) { return _wstrdate_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wstrdate_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wstrdate( wchar_t *_Buffer);

__declspec(dllimport) errno_t __cdecl _wstrtime_s(       wchar_t * _Buf,      size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wstrtime_s(       wchar_t (&_Buffer)[_Size]) { return _wstrtime_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wstrtime_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wstrtime( wchar_t *_Buffer);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wctime64_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wctime64(     const __time64_t * _Time);
__declspec(dllimport) errno_t __cdecl _wctime64_s(       wchar_t* _Buf,      size_t _SizeInWords,      const __time64_t *_Time);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wctime64_s(       wchar_t (&_Buffer)[_Size],      const __time64_t * _Time) { return _wctime64_s(_Buffer, _Size, _Time); } }

#pragma once
#pragma warning(push)
#pragma warning(disable:4996)
static __inline wchar_t * __cdecl _wctime(const time_t * _Time)
{
#pragma warning( push )
#pragma warning( disable : 4996 )
    return _wctime64(_Time);
#pragma warning( pop )
}

static __inline errno_t __cdecl _wctime_s(wchar_t *_Buffer, size_t _SizeInWords, const time_t * _Time)
{
    return _wctime64_s(_Buffer, _SizeInWords, _Time);
}
#pragma warning(pop)
typedef int mbstate_t;
typedef wchar_t _Wint_t;

__declspec(dllimport) wint_t __cdecl btowc(int);
__declspec(dllimport) size_t __cdecl mbrlen(           const char * _Ch,      size_t _SizeInBytes,
                                     mbstate_t * _State);
__declspec(dllimport) size_t __cdecl mbrtowc(       wchar_t * _DstCh,            const char * _SrcCh,
                                    size_t _SizeInBytes,        mbstate_t * _State);
__declspec(dllimport) errno_t __cdecl mbsrtowcs_s(       size_t* _Retval,          wchar_t * _Dst,      size_t _SizeInWords,                  const char ** _PSrc,      size_t _N,        mbstate_t * _State);
extern "C++" { template <size_t _Size> inline errno_t __cdecl mbsrtowcs_s(       size_t * _Retval,        wchar_t (&_Dest)[_Size],                  const char ** _PSource,      size_t _Count,        mbstate_t * _State) { return mbsrtowcs_s(_Retval, _Dest, _Size, _PSource, _Count, _State); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "mbsrtowcs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl mbsrtowcs( wchar_t *_Dest,  const char ** _PSrc,  size_t _Count,  mbstate_t * _State);

__declspec(dllimport) errno_t __cdecl wcrtomb_s(       size_t * _Retval,          char * _Dst,
             size_t _SizeInBytes,        wchar_t _Ch,        mbstate_t * _State);
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcrtomb_s(       size_t * _Retval,          char (&_Dest)[_Size],        wchar_t _Source,        mbstate_t * _State) { return wcrtomb_s(_Retval, _Dest, _Size, _Source, _State); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcrtomb_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl wcrtomb( char *_Dest,  wchar_t _Source,  mbstate_t * _State);
__declspec(dllimport) errno_t __cdecl wcsrtombs_s(       size_t * _Retval,          char * _Dst,
             size_t _SizeInBytes,                const wchar_t ** _Src,      size_t _Size,        mbstate_t * _State);
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcsrtombs_s(       size_t * _Retval,          char (&_Dest)[_Size],                const wchar_t ** _PSrc,      size_t _Count,        mbstate_t * _State) { return wcsrtombs_s(_Retval, _Dest, _Size, _PSrc, _Count, _State); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcsrtombs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help for details.")) __declspec(dllimport) size_t __cdecl wcsrtombs( char *_Dest,  const wchar_t ** _PSource,  size_t _Count,  mbstate_t * _State);
__declspec(dllimport) int __cdecl wctob(     wint_t _WCh);
__declspec(dllimport)  void *  __cdecl memmove(         void * _Dst,          const void * _Src,      size_t _MaxCount);

 void *  __cdecl memcpy(         void * _Dst,          const void * _Src,      size_t _MaxCount);

__declspec(dllimport) errno_t __cdecl memcpy_s(         void * _Dst,      rsize_t _DstSize,          const void * _Src,      rsize_t _MaxCount);
__declspec(dllimport) errno_t __cdecl memmove_s(         void * _Dst,      rsize_t _DstSize,          const void * _Src,      rsize_t _MaxCount);

__inline int __cdecl fwide(       FILE * _F, int _M)
        {(void)_F; return (_M); }
__inline int __cdecl mbsinit(       const mbstate_t *_P)
        {return (_P == 0 || *_P == 0); }
__inline const wchar_t * __cdecl wmemchr(       const wchar_t *_S,        wchar_t _C,      size_t _N)
        {for (; 0 < _N; ++_S, --_N)
                if (*_S == _C)
                        return (const wchar_t *)(_S);
        return (0); }
__inline int __cdecl wmemcmp(       const wchar_t *_S1,        const wchar_t *_S2,      size_t _N)
        {for (; 0 < _N; ++_S1, ++_S2, --_N)
                if (*_S1 != *_S2)
                        return (*_S1 < *_S2 ? -1 : +1);
        return (0); }

__inline  wchar_t * __cdecl wmemcpy(       wchar_t *_S1,          const wchar_t *_S2,      size_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 4996 6386 )
            return (wchar_t *)memcpy(_S1, _S2, _N*sizeof(wchar_t));
#pragma warning( pop )
        }
__inline errno_t __cdecl wmemcpy_s(         wchar_t *_S1,      rsize_t _N1,          const wchar_t *_S2, rsize_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 6386 )
            return memcpy_s(_S1, _N1*sizeof(wchar_t), _S2, _N*sizeof(wchar_t));
        }
#pragma warning( pop )
__inline  wchar_t * __cdecl wmemmove(         wchar_t *_S1,          const wchar_t *_S2,      size_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 4996 6386 )
#pragma warning( disable : 6387)
			
            return (wchar_t *)memmove(_S1, _S2, _N*sizeof(wchar_t));
#pragma warning( pop )
        }
__inline errno_t __cdecl wmemmove_s(         wchar_t *_S1,      rsize_t _N1,          const wchar_t *_S2,      rsize_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 6386 )
            return memmove_s(_S1, _N1*sizeof(wchar_t), _S2, _N*sizeof(wchar_t));
#pragma warning( pop )
        }
__inline wchar_t * __cdecl wmemset(       wchar_t *_S,        wchar_t _C,      size_t _N)
        {
            wchar_t *_Su = _S;
            for (; 0 < _N; ++_Su, --_N)
            {
                *_Su = _C;
            }
            return (_S);
        }
extern "C++" {
inline wchar_t * __cdecl wmemchr(       wchar_t *_S,        wchar_t _C,      size_t _N)
        { return (wchar_t *)wmemchr((const wchar_t *)_S, _C, _N); }
}
}
#pragma pack(pop)
typedef mbstate_t _Mbstatet;
namespace std {
using ::mbstate_t; using ::size_t; using ::tm; using ::wint_t;

using ::btowc; using ::fgetwc; using ::fgetws; using ::fputwc;
using ::fputws; using ::fwide; using ::fwprintf;
using ::fwscanf; using ::getwc; using ::getwchar;
using ::mbrlen; using ::mbrtowc; using ::mbsrtowcs;
using ::mbsinit; using ::putwc; using ::putwchar;
using ::swprintf; using ::swscanf; using ::ungetwc;
using ::vfwprintf; using ::vswprintf; using ::vwprintf;
using ::wcrtomb; using ::wprintf; using ::wscanf;
using ::wcsrtombs; using ::wcstol; using ::wcscat;
using ::wcschr; using ::wcscmp; using ::wcscoll;
using ::wcscpy; using ::wcscspn; using ::wcslen;
using ::wcsncat; using ::wcsncmp; using ::wcsncpy;
using ::wcspbrk; using ::wcsrchr; using ::wcsspn;
using ::wcstod; using ::wcstoul; using ::wcsstr;
using ::wcstok; using ::wcsxfrm; using ::wctob;
using ::wmemchr; using ::wmemcmp; using ::wmemcpy;
using ::wmemmove; using ::wmemset; using ::wcsftime;
}
#pragma once
#pragma pack(push,8)

extern "C" {

typedef void *_HFILE;
typedef int (__cdecl * _CRT_REPORT_HOOK)(int, char *, int *);
typedef int (__cdecl * _CRT_REPORT_HOOKW)(int, wchar_t *, int *);
typedef int (__cdecl * _CRT_ALLOC_HOOK)(int, void *, size_t, int, long, const unsigned char *, int);
typedef void (__cdecl * _CRT_DUMP_CLIENT)(void *, size_t);
struct _CrtMemBlockHeader;
typedef struct _CrtMemState
{
        struct _CrtMemBlockHeader * pBlockHeader;
        size_t lCounts[5];
        size_t lSizes[5];
        size_t lHighWaterCount;
        size_t lTotalCount;
} _CrtMemState;
}
extern "C++" {
  void * __cdecl operator new[](size_t _Size);
inline   void * __cdecl operator new(size_t _Size, int, const char *, int)
        { return ::operator new(_Size); }

inline   void* __cdecl operator new[](size_t _Size, int, const char *, int)
        { return ::operator new[](_Size); }
void __cdecl operator delete[](void *);

inline void __cdecl operator delete(void * _P, int, const char *, int)
        { ::operator delete(_P); }
inline void __cdecl operator delete[](void * _P, int, const char *, int)
        { ::operator delete[](_P); }
}
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
typedef long streamoff;
typedef int streamsize;
extern __declspec(dllimport)  fpos_t _Fpz;
extern __declspec(dllimport)  const streamoff _BADOFF;
		
template<class _Statetype>
	class fpos
	{	
	typedef fpos<_Statetype> _Myt;

public:
	 fpos(streamoff _Off = 0)
		: _Myoff(_Off), _Fpos(0), _Mystate(_Stz)
		{	
		}

	 fpos(_Statetype _State, fpos_t _Fileposition)
		: _Myoff(0), _Fpos(_Fileposition), _Mystate(_State)
		{	
		}

	_Statetype  state() const
		{	
		return (_Mystate);
		}

	void  state(_Statetype _State)
		{	
		_Mystate = _State;
		}

	fpos_t  seekpos() const
		{	
		return (_Fpos);
		}

	 operator streamoff() const
		{	
		return (_Myoff + ((long)(_Fpos)));
		}

	streamoff  operator-(const _Myt& _Right) const
		{	
		return ((streamoff)*this - (streamoff)_Right);
		}

	_Myt&  operator+=(streamoff _Off)
		{	
		_Myoff += _Off;
		return (*this);
		}

	_Myt&  operator-=(streamoff _Off)
		{	
		_Myoff -= _Off;
		return (*this);
		}

	_Myt  operator+(streamoff _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt  operator-(streamoff _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	bool  operator==(const _Myt& _Right) const
		{	
		return ((streamoff)*this == (streamoff)_Right);
		}

	bool  operator!=(const _Myt& _Right) const
		{	
		return (!(*this == _Right));
		}

private:
	 static const _Statetype _Stz;	
	streamoff _Myoff;	
	fpos_t _Fpos;	
	_Statetype _Mystate;	
	};

	
template<class _Statetype>
	 const _Statetype fpos<_Statetype>::_Stz = _Statetype();
typedef fpos<_Mbstatet> streampos;
typedef streampos wstreampos;

		
struct _Unsecure_char_traits_tag
	{
	};
struct _Secure_char_traits_tag
	{
	};

		
		
		
		
		
struct _Char_traits_base
	{
	typedef _Unsecure_char_traits_tag _Secure_char_traits;
	};

		
		
		
template<class _Elem>
	struct char_traits:
		public _Char_traits_base
	{	
	typedef _Elem char_type;
	typedef long int_type;
	typedef streampos pos_type;
	typedef streamoff off_type;
	typedef _Mbstatet state_type;

	static void __cdecl assign(_Elem& _Left, const _Elem& _Right)
		{	
		_Left = _Right;
		}

	static bool __cdecl eq(const _Elem& _Left, const _Elem& _Right)
		{	
		return (_Left == _Right);
		}

	static bool __cdecl lt(const _Elem& _Left, const _Elem& _Right)
		{	
		return (_Left < _Right);
		}

	static int __cdecl compare(const _Elem *_First1,
		const _Elem *_First2, size_t _Count)
		{	
		for (; 0 < _Count; --_Count, ++_First1, ++_First2)
			if (!eq(*_First1, *_First2))
				return (lt(*_First1, *_First2) ? -1 : +1);
		return (0);
		}

	static size_t __cdecl length(const _Elem *_First)
		{	

		size_t _Count;
		for (_Count = 0; !eq(*_First, _Elem()); ++_First)
			++_Count;
		return (_Count);
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	static _Elem *__cdecl copy(_Elem *_First1,
		const _Elem *_First2, size_t _Count)
		{	
		
		return _Copy_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Copy_s(_Elem *_First1, size_t _Dest_size,
		const _Elem *_First2, size_t _Count)
		{	
		{ if (!(_Dest_size >= _Count)) { ((void)0); ::_invalid_parameter_noinfo(); return (0); } };
		_Elem *_Next = _First1;
		for (; 0 < _Count; --_Count, ++_Next, ++_First2)
			assign(*_Next, *_First2);
		return (_First1);
		}

	static const _Elem *__cdecl find(const _Elem *_First,
		size_t _Count, const _Elem& _Ch)
		{	

		for (; 0 < _Count; --_Count, ++_First)
			if (eq(*_First, _Ch))
				return (_First);
		return (0);
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	static _Elem *__cdecl move(_Elem *_First1,
		const _Elem *_First2, size_t _Count)
		{	
		
		return _Move_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Move_s(_Elem *_First1, size_t _Dest_size,
		const _Elem *_First2, size_t _Count)
		{	
		{ if (!(_Dest_size >= _Count)) { ((void)0); ::_invalid_parameter_noinfo(); return (0); } };
		_Elem *_Next = _First1;
		if (_First2 < _Next && _Next < _First2 + _Count)
			for (_Next += _Count, _First2 += _Count; 0 < _Count; --_Count)
				assign(*--_Next, *--_First2);
		else
			for (; 0 < _Count; --_Count, ++_Next, ++_First2)
				assign(*_Next, *_First2);
		return (_First1);
		}

	static _Elem *__cdecl assign(_Elem *_First,
		size_t _Count, _Elem _Ch)
		{	

		_Elem *_Next = _First;
		for (; 0 < _Count; --_Count, ++_Next)
			assign(*_Next, _Ch);
		return (_First);
		}

	static _Elem __cdecl to_char_type(const int_type& _Meta)
		{	
		return ((_Elem)_Meta);
		}

	static int_type __cdecl to_int_type(const _Elem& _Ch)
		{	
		return ((int_type)_Ch);
		}

	static bool __cdecl eq_int_type(const int_type& _Left,
		const int_type& _Right)
		{	
		return (_Left == _Right);
		}

	static int_type __cdecl eof()
		{	
		return ((int_type)(-1));
		}

	static int_type __cdecl not_eof(const int_type& _Meta)
		{	
		return (_Meta != eof() ? (int_type)_Meta : (int_type)!eof());
		}
	};

		
template<> struct __declspec(dllimport) char_traits<wchar_t>:
	public _Char_traits_base
	{	
	typedef wchar_t _Elem;
	typedef _Elem char_type;	
	typedef wint_t int_type;
	typedef streampos pos_type;
	typedef streamoff off_type;
	typedef _Mbstatet state_type;

	static void __cdecl assign(_Elem& _Left, const _Elem& _Right)
		{	
		_Left = _Right;
		}

	static bool __cdecl eq(const _Elem& _Left, const _Elem& _Right)
		{	
		return (_Left == _Right);
		}

	static bool __cdecl lt(const _Elem& _Left, const _Elem& _Right)
		{	
		return (_Left < _Right);
		}

	static int __cdecl compare(const _Elem *_First1, const _Elem *_First2,
		size_t _Count)
		{	
		return (::wmemcmp(_First1, _First2, _Count));
		}

	static size_t __cdecl length(const _Elem *_First)
		{	

		return (::wcslen(_First));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	static _Elem *__cdecl copy(_Elem *_First1, const _Elem *_First2,
		size_t _Count)
		{	
		
		return _Copy_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Copy_s(_Elem *_First1, size_t _Size_in_words, const _Elem *_First2,
		size_t _Count)
		{	
		::wmemcpy_s((_First1), (_Size_in_words), (_First2), (_Count));
		return _First1;
		}

	static const _Elem *__cdecl find(const _Elem *_First, size_t _Count,
		const _Elem& _Ch)
		{	

		return ((const _Elem *)::wmemchr(_First, _Ch, _Count));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	static _Elem *__cdecl move(_Elem *_First1, const _Elem *_First2,
		size_t _Count)
		{	
		
		return _Move_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Move_s(_Elem *_First1, size_t _Size_in_words, const _Elem *_First2,
		size_t _Count)
		{	
		::wmemmove_s((_First1), (_Size_in_words), (_First2), (_Count));
		return (_Elem *)_First1;
		}

	static _Elem *__cdecl assign(_Elem *_First, size_t _Count, _Elem _Ch)
		{	

		return ((_Elem *)::wmemset(_First, _Ch, _Count));
		}

	static _Elem __cdecl to_char_type(const int_type& _Meta)
		{	
		return (_Meta);
		}

	static int_type __cdecl to_int_type(const _Elem& _Ch)
		{	
		return (_Ch);
		}

	static bool __cdecl eq_int_type(const int_type& _Left,
		const int_type& _Right)
		{	
		return (_Left == _Right);
		}

	static int_type __cdecl eof()
		{	
		return ((wint_t)(0xFFFF));
		}

	static int_type __cdecl not_eof(const int_type& _Meta)
		{	
		return (_Meta != eof() ? _Meta : !eof());
		}
	};
		
template<> struct __declspec(dllimport) char_traits<char>:
	public _Char_traits_base
	{	
	typedef char _Elem;
	typedef _Elem char_type;
	typedef int int_type;
	typedef streampos pos_type;
	typedef streamoff off_type;
	typedef _Mbstatet state_type;

	static void __cdecl assign(_Elem& _Left, const _Elem& _Right)
		{	
		_Left = _Right;
		}

	static bool __cdecl eq(const _Elem& _Left, const _Elem& _Right)
		{	
		return (_Left == _Right);
		}

	static bool __cdecl lt(const _Elem& _Left, const _Elem& _Right)
		{	
		return (_Left < _Right);
		}

	static int __cdecl compare(const _Elem *_First1, const _Elem *_First2,
		size_t _Count)
		{	
		return (::memcmp(_First1, _First2, _Count));
		}

	static size_t __cdecl length(const _Elem *_First)
		{	

		return (::strlen(_First));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	static _Elem *__cdecl copy(_Elem *_First1, const _Elem *_First2,
		size_t _Count)
		{	
		
		return _Copy_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Copy_s(_Elem *_First1, size_t _Size_in_bytes, const _Elem *_First2,
		size_t _Count)
		{	
		::memcpy_s((_First1), (_Size_in_bytes), (_First2), (_Count));
		return _First1;
		}

	static const _Elem *__cdecl find(const _Elem *_First, size_t _Count,
		const _Elem& _Ch)
		{	

		return ((const _Elem *)::memchr(_First, _Ch, _Count));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	static _Elem *__cdecl move(_Elem *_First1, const _Elem *_First2,
		size_t _Count)
		{	
		
		return _Move_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Move_s(_Elem *_First1, size_t _Size_in_bytes, const _Elem *_First2,
		size_t _Count)
		{	
		::memmove_s((_First1), (_Size_in_bytes), (_First2), (_Count));
		return _First1;
		}

	static _Elem *__cdecl assign(_Elem *_First, size_t _Count, _Elem _Ch)
		{	

		return ((_Elem *)::memset(_First, _Ch, _Count));
		}

	static _Elem __cdecl to_char_type(const int_type& _Meta)
		{	
		return ((_Elem)_Meta);
		}

	static int_type __cdecl to_int_type(const _Elem& _Ch)
		{	
		return ((unsigned char)_Ch);
		}

	static bool __cdecl eq_int_type(const int_type& _Left,
		const int_type& _Right)
		{	
		return (_Left == _Right);
		}

	static int_type __cdecl eof()
		{	
		return ((-1));
		}

	static int_type __cdecl not_eof(const int_type& _Meta)
		{	
		return (_Meta != eof() ? _Meta : !eof());
		}
	};

		
	template <class _Traits>
	class _Inherits_from_char_traits_base
	{
		typedef char _True;
		class _False { char _Dummy[2]; };
		static _True _Inherits(_Char_traits_base);
		static _False _Inherits(...);
		static _Traits _Make_traits();

	public:
		enum { _Exists = sizeof(_Inherits(_Make_traits())) == sizeof(_True) };
	};

	template <class _Traits, bool _Inherits_from_char_traits_base>
	class _Char_traits_category_helper
	{
	public:
		typedef _Unsecure_char_traits_tag _Secure_char_traits;
	};

	
	
	template <class _Elem>
	class _Char_traits_category_helper< char_traits<_Elem> , true>
	{
	public:
		typedef _Secure_char_traits_tag _Secure_char_traits;
	};

	template <class _Traits>
	class _Char_traits_category_helper<_Traits, true>
	{
	public:
		typedef typename _Traits::_Secure_char_traits _Secure_char_traits;
	};

	template <class _Traits>
	class _Char_traits_category
	{
	public:
		typedef typename _Char_traits_category_helper<_Traits, _Inherits_from_char_traits_base<_Traits>::_Exists>::_Secure_char_traits _Secure_char_traits;
	};

	
	
	template<class _Traits>
	inline
	typename _Char_traits_category<_Traits>::_Secure_char_traits _Char_traits_cat()
	{
		typename _Char_traits_category<_Traits>::_Secure_char_traits _Secure;
		return (_Secure);
	}

	namespace _Traits_helper
	{

		
	template<class _Traits>
	inline
	typename _Traits::char_type *copy_s(typename _Traits::char_type *_First1, size_t _Size,
		const typename _Traits::char_type *_First2, size_t _Count)
	{
		return copy_s<_Traits>(_First1, _Size, _First2, _Count, _Char_traits_cat<_Traits>());
	}

	template<class _Traits>
	inline
	typename _Traits::char_type *copy_s(typename _Traits::char_type *_First1, size_t _Size,
		const typename _Traits::char_type *_First2, size_t _Count, _Secure_char_traits_tag)
	{
		return _Traits::_Copy_s(_First1, _Size, _First2, _Count);
	}

	
	template<class _Traits>
	inline
	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	typename _Traits::char_type *copy_s(typename _Traits::char_type *_First1, size_t _Size,
		const typename _Traits::char_type *_First2, size_t _Count, _Unsecure_char_traits_tag)
	{
		return _Traits::copy(_First1, _First2, _Count);
	}

		
	template<class _Traits>
	inline
	typename _Traits::char_type *move_s(typename _Traits::char_type *_First1, size_t _Size,
		const typename _Traits::char_type *_First2, size_t _Count)
	{
		return move_s<_Traits>(_First1, _Size, _First2, _Count, _Char_traits_cat<_Traits>());
	}

	template<class _Traits>
	inline
	typename _Traits::char_type *move_s(typename _Traits::char_type *_First1, size_t _Size,
		const typename _Traits::char_type *_First2, size_t _Count, _Secure_char_traits_tag)
	{
		return _Traits::_Move_s(_First1, _Size, _First2, _Count);
	}

	
	template<class _Traits>
	inline
	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	typename _Traits::char_type *move_s(typename _Traits::char_type *_First1, size_t _Size,
		const typename _Traits::char_type *_First2, size_t _Count, _Unsecure_char_traits_tag)
	{
		return _Traits::move(_First1, _First2, _Count);
	}

	}

		
template<class _Ty>
	class allocator;
class ios_base;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ios;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class istreambuf_iterator;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class ostreambuf_iterator;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_streambuf;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_istream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ostream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_iostream;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_stringbuf;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_istringstream;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_ostringstream;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_stringstream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_filebuf;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ifstream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ofstream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_fstream;
template<class _Elem,
	class _InIt >
    class num_get;
template<class _Elem,
	class _OutIt >
    class num_put;
template<class _Elem>
    class collate;
		
typedef basic_ios<char, char_traits<char> > ios;
typedef basic_streambuf<char, char_traits<char> > streambuf;
typedef basic_istream<char, char_traits<char> > istream;
typedef basic_ostream<char, char_traits<char> > ostream;
typedef basic_iostream<char, char_traits<char> > iostream;
typedef basic_stringbuf<char, char_traits<char>,
	allocator<char> > stringbuf;
typedef basic_istringstream<char, char_traits<char>,
	allocator<char> > istringstream;
typedef basic_ostringstream<char, char_traits<char>,
	allocator<char> > ostringstream;
typedef basic_stringstream<char, char_traits<char>,
	allocator<char> > stringstream;
typedef basic_filebuf<char, char_traits<char> > filebuf;
typedef basic_ifstream<char, char_traits<char> > ifstream;
typedef basic_ofstream<char, char_traits<char> > ofstream;
typedef basic_fstream<char, char_traits<char> > fstream;

		
typedef basic_ios<wchar_t, char_traits<wchar_t> > wios;
typedef basic_streambuf<wchar_t, char_traits<wchar_t> >
	wstreambuf;
typedef basic_istream<wchar_t, char_traits<wchar_t> > wistream;
typedef basic_ostream<wchar_t, char_traits<wchar_t> > wostream;
typedef basic_iostream<wchar_t, char_traits<wchar_t> > wiostream;
typedef basic_stringbuf<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wstringbuf;
typedef basic_istringstream<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wistringstream;
typedef basic_ostringstream<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wostringstream;
typedef basic_stringstream<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wstringstream;
typedef basic_filebuf<wchar_t, char_traits<wchar_t> > wfilebuf;
typedef basic_ifstream<wchar_t, char_traits<wchar_t> > wifstream;
typedef basic_ofstream<wchar_t, char_traits<wchar_t> > wofstream;
typedef basic_fstream<wchar_t, char_traits<wchar_t> > wfstream;

typedef num_get<char, istreambuf_iterator<char, char_traits<char> > >
	numget;
typedef num_get<wchar_t, istreambuf_iterator<wchar_t, char_traits<wchar_t> > >
	wnumget;
typedef num_put<char, ostreambuf_iterator<char, char_traits<char> > >
	numput;
typedef num_put<wchar_t, ostreambuf_iterator<wchar_t, char_traits<wchar_t> > >
	wnumput;
typedef collate<char> ncollate;
typedef collate<wchar_t> wcollate;
}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {
		
template<class _Ty> inline
	void swap(_Ty& _Left, _Ty& _Right)
	{	
	_Ty _Tmp = _Left;
	_Left = _Right, _Right = _Tmp;
	}

		
template<class _Ty1,
	class _Ty2> struct pair
	{	
	typedef pair<_Ty1, _Ty2> _Myt;
	typedef _Ty1 first_type;
	typedef _Ty2 second_type;

	pair()
		: first(_Ty1()), second(_Ty2())
		{	
		}

	pair(const _Ty1& _Val1, const _Ty2& _Val2)
		: first(_Val1), second(_Val2)
		{	
		}

	template<class _Other1,
		class _Other2>
		pair(const pair<_Other1, _Other2>& _Right)
		: first(_Right.first), second(_Right.second)
		{	
		}

	void swap(_Myt& _Right)
		{	
		std::swap(first, _Right.first);
		std::swap(second, _Right.second);
		}

	_Ty1 first;	
	_Ty2 second;	
	};

		
template<class _Ty1,
	class _Ty2> inline
	bool operator==(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	
	return (_Left.first == _Right.first && _Left.second == _Right.second);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator!=(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator<(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	
	return (_Left.first < _Right.first ||
		!(_Right.first < _Left.first) && _Left.second < _Right.second);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator>(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator<=(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator>=(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	
	return (!(_Left < _Right));
	}

template<class _Ty1,
	class _Ty2> inline
	pair<_Ty1, _Ty2> make_pair(_Ty1 _Val1, _Ty2 _Val2)
	{	
	return (pair<_Ty1, _Ty2>(_Val1, _Val2));
	}

template<class _Ty1,
	class _Ty2> inline
	void swap(pair<_Ty1, _Ty2>& _Left, pair<_Ty1, _Ty2>& _Right)
	{	
	_Left.swap(_Right);
	}

		
	namespace rel_ops
		{	
template<class _Ty> inline
	bool  operator!=(const _Ty& _Left, const _Ty& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Ty> inline
	bool operator>(const _Ty& _Left, const _Ty& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Ty> inline
	bool operator<=(const _Ty& _Left, const _Ty& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Ty> inline
	bool operator>=(const _Ty& _Left, const _Ty& _Right)
	{	
	return (!(_Left < _Right));
	}
		}
}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
struct _Unchecked_iterator_tag
	{
	};
struct _Range_checked_iterator_tag
	{
	};

		
struct _Unchanged_checked_iterator_base_type_tag
	{
	};

struct _Different_checked_iterator_base_type_tag
	{
	};

		
struct _Undefined_inner_type_tag
	{
	};

		
struct _Undefined_move_tag
	{
	};

struct _Swap_move_tag
	{
	};

		
		
		
struct _Container_base
	{	
	};
struct _Iterator_base
	{	
	typedef _Unchecked_iterator_tag _Checked_iterator_category;
	typedef _Unchanged_checked_iterator_base_type_tag _Checked_iterator_base_type;
	typedef _Undefined_inner_type_tag _Inner_type;

	
	 _Iterator_base()
		: _Mycont(0)
		{
		}

	const _Container_base *_Mycont;

	};
typedef _Iterator_base _Iterator_base_secure;
		
struct input_iterator_tag
	{	
	};

struct output_iterator_tag
	{	
	};

struct forward_iterator_tag
	: public input_iterator_tag
	{	
	};

struct bidirectional_iterator_tag
	: public forward_iterator_tag
	{	
	};

struct random_access_iterator_tag
	: public bidirectional_iterator_tag
	{	
	};

struct _Int_iterator_tag
	{	
	};

struct _Float_iterator_tag
	{	
	};

		
struct _Nonscalar_ptr_iterator_tag
	{	
	};
struct _Scalar_ptr_iterator_tag
	{	
	};

		
template<class _Category,
	class _Ty,
	class _Diff = ptrdiff_t,
	class _Pointer = _Ty *,
	class _Reference = _Ty&>
		struct iterator
			: public _Iterator_base

	{	
	typedef _Category iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

template<class _Category,
	class _Ty,
	class _Diff = ptrdiff_t,
	class _Pointer = _Ty *,
	class _Reference = _Ty&,
	class _Base_class = _Iterator_base>
		struct _Iterator_with_base
			: public _Base_class

	{	
	typedef _Category iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

template<class _Ty,
	class _Diff,
	class _Pointer,
	class _Reference>
	struct _Bidit
		: public _Iterator_base

	{	
	typedef bidirectional_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

template<class _Ty,
	class _Diff,
	class _Pointer,
	class _Reference>
	struct _Ranit
		: public _Iterator_base

	{	
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

template<class _Ty,
	class _Diff,
	class _Pointer,
	class _Reference,
	class _Base_class>
	struct _Ranit_base
		: public _Base_class

	{	
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

struct _Outit
	: public iterator<output_iterator_tag, void, void,
		void, void>
	{	
	};

template <class _Base_class>
struct _Outit_with_base
	: public _Iterator_with_base<output_iterator_tag, void, void,
		void, void, _Base_class>
	{	
	};

		
template<class _Iter>
	struct iterator_traits
	{	
	typedef typename _Iter::iterator_category iterator_category;
	typedef typename _Iter::value_type value_type;
	typedef typename _Iter::difference_type difference_type;
	typedef difference_type distance_type;	
	typedef typename _Iter::pointer pointer;
	typedef typename _Iter::reference reference;
	};

template<class _Ty>
	struct iterator_traits<_Ty *>
	{	
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef ptrdiff_t difference_type;
	typedef ptrdiff_t distance_type;	
	typedef _Ty *pointer;
	typedef _Ty& reference;
	};

template<class _Ty>
	struct iterator_traits<const _Ty *>
	{	
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef ptrdiff_t difference_type;
	typedef ptrdiff_t distance_type;	
	typedef const _Ty *pointer;
	typedef const _Ty& reference;
	};

template<> struct iterator_traits<_Bool>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef _Bool value_type;
	typedef _Bool difference_type;
	typedef _Bool distance_type;
	typedef _Bool * pointer;
	typedef _Bool& reference;
	};

template<> struct iterator_traits<char>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef char value_type;
	typedef char difference_type;
	typedef char distance_type;
	typedef char * pointer;
	typedef char& reference;
	};

template<> struct iterator_traits<signed char>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef signed char value_type;
	typedef signed char difference_type;
	typedef signed char distance_type;
	typedef signed char * pointer;
	typedef signed char& reference;
	};

template<> struct iterator_traits<unsigned char>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned char value_type;
	typedef unsigned char difference_type;
	typedef unsigned char distance_type;
	typedef unsigned char * pointer;
	typedef unsigned char& reference;
	};
template<> struct iterator_traits<wchar_t>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef wchar_t value_type;
	typedef wchar_t difference_type;
	typedef wchar_t distance_type;
	typedef wchar_t * pointer;
	typedef wchar_t& reference;
	};
template<> struct iterator_traits<short>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef short value_type;
	typedef short difference_type;
	typedef short distance_type;
	typedef short * pointer;
	typedef short& reference;
	};

template<> struct iterator_traits<unsigned short>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned short value_type;
	typedef unsigned short difference_type;
	typedef unsigned short distance_type;
	typedef unsigned short * pointer;
	typedef unsigned short& reference;
	};

template<> struct iterator_traits<int>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef int value_type;
	typedef int difference_type;
	typedef int distance_type;	
	typedef int * pointer;
	typedef int& reference;
	};

template<> struct iterator_traits<unsigned int>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned int value_type;
	typedef unsigned int difference_type;
	typedef unsigned int distance_type;	
	typedef unsigned int * pointer;
	typedef unsigned int& reference;
	};

template<> struct iterator_traits<long>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef long value_type;
	typedef long difference_type;
	typedef long distance_type;	
	typedef long * pointer;
	typedef long& reference;
	};

template<> struct iterator_traits<unsigned long>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned long value_type;
	typedef unsigned long difference_type;
	typedef unsigned long distance_type;	
	typedef unsigned long * pointer;
	typedef unsigned long& reference;
	};

template<> struct iterator_traits<double>
	{
	typedef _Float_iterator_tag iterator_category;
	typedef double value_type;
	typedef double difference_type;
	typedef double distance_type;	
	typedef double * pointer;
	typedef double& reference;
	};

template<> struct iterator_traits<float>
	{
	typedef _Float_iterator_tag iterator_category;
	typedef float value_type;
	typedef float difference_type;
	typedef float distance_type;	
	typedef float * pointer;
	typedef float& reference;
	};
template<> struct iterator_traits<__int64>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef __int64 value_type;
	typedef __int64 difference_type;
	typedef __int64 distance_type;	
	typedef __int64 * pointer;
	typedef __int64& reference;
	};

template<> struct iterator_traits<unsigned __int64>
	{	
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned __int64 value_type;
	typedef unsigned __int64 difference_type;
	typedef unsigned __int64 distance_type;	
	typedef unsigned __int64 * pointer;
	typedef unsigned __int64& reference;
	};
		
template<class _Iter> inline
	typename iterator_traits<_Iter>::iterator_category
		__cdecl _Iter_cat(const _Iter&)
	{	
	typename iterator_traits<_Iter>::iterator_category _Cat;
	return (_Cat);
	}

		
		
		
template<class _Cat1, class _Cat2>
	class _Iter_random_helper
	{
	public:
		typedef forward_iterator_tag _Iter_random_cat;
	};

template<>
	class _Iter_random_helper<random_access_iterator_tag, random_access_iterator_tag>
	{
	public:
		typedef random_access_iterator_tag _Iter_random_cat;
	};

template<class _Cat1, class _Cat2, class _Cat3>
	class _Iter_random_helper3
	{
	public:
		typedef forward_iterator_tag _Iter_random_cat;
	};

template<>
	class _Iter_random_helper3<random_access_iterator_tag, random_access_iterator_tag, random_access_iterator_tag>
	{
	public:
		typedef random_access_iterator_tag _Iter_random_cat;
	};

template<class _Iter1, class _Iter2> inline
	typename _Iter_random_helper<
		typename iterator_traits<_Iter1>::iterator_category,
		typename iterator_traits<_Iter2>::iterator_category>::_Iter_random_cat
		__cdecl _Iter_random(const _Iter1&, const _Iter2&)
	{	
	typename _Iter_random_helper<
		iterator_traits<_Iter1>::iterator_category,
		iterator_traits<_Iter2>::iterator_category>::_Iter_random_cat _Cat;
	return (_Cat);
	}

template<class _Iter1, class _Iter2, class _Iter3> inline
	typename _Iter_random_helper3<
		typename iterator_traits<_Iter1>::iterator_category,
		typename iterator_traits<_Iter2>::iterator_category,
		typename iterator_traits<_Iter3>::iterator_category>::_Iter_random_cat
		__cdecl _Iter_random(const _Iter1&, const _Iter2&, const _Iter3&)
	{	
	typename _Iter_random_helper3<
		iterator_traits<_Iter1>::iterator_category,
		iterator_traits<_Iter2>::iterator_category,
		iterator_traits<_Iter3>::iterator_category>::_Iter_random_cat _Cat;
	return (_Cat);
	}

		
		
	template <bool _Cond, class _Ty1, class _Ty2>
	class _If
	{
	public:
		typedef _Ty2 _Result;
	};

	template <class _Ty1, class _Ty2>
	class _If<true, _Ty1, _Ty2>
	{
	public:
		typedef _Ty1 _Result;
	};

		
	template <bool _Secure_validation>
	class _Secure_validation_helper
	{
	public:
		typedef _Unchecked_iterator_tag _Checked_iterator_category;
	};

	template <>
	class _Secure_validation_helper<true>
	{
	public:
		typedef _Range_checked_iterator_tag _Checked_iterator_category;
	};
		
	template <class _Iter, bool _Inherits_from_iterator_base>
	class _Checked_iterator_category_helper
	{
	public:
		typedef _Unchecked_iterator_tag _Checked_cat;
	};

	template <class _Iter>
	class _Checked_iterator_category_helper<_Iter, true>
	{
	public:
		typedef typename _Iter::_Checked_iterator_category _Checked_cat;
	};

	template <class _Iter>
	class _Checked_iterator_category
	{
	public:
		typedef typename _Checked_iterator_category_helper<_Iter, __is_base_of(_Iterator_base, _Iter)>::_Checked_cat _Checked_cat;
	};

	template<class _Iter>
	inline
	typename _Checked_iterator_category<_Iter>::_Checked_cat _Checked_cat(const _Iter&)
	{
		typename _Checked_iterator_category<_Iter>::_Checked_cat _Cat;
		return (_Cat);
	}

		
	template <class _Iter, bool _Inherits_from_iterator_base>
	class _Checked_iterator_base_helper2
	{
	public:
		typedef _Unchanged_checked_iterator_base_type_tag _Checked_iterator_base_type;
	};

	template <class _Iter>
	class _Checked_iterator_base_helper2<_Iter, true>
	{
	public:
		typedef typename _Iter::_Checked_iterator_base_type _Checked_iterator_base_type;
	};

	template <class _Iter, class _Base_type>
	class _Checked_iterator_base_helper1
	{
	public:
		typedef _Different_checked_iterator_base_type_tag _Base_type_tag;
		typedef _Base_type _Checked_iterator_base_type;
	};

	template <class _Iter>
	class _Checked_iterator_base_helper1<_Iter, _Unchanged_checked_iterator_base_type_tag>
	{
	public:
		typedef _Unchanged_checked_iterator_base_type_tag _Base_type_tag;
		typedef _Iter _Checked_iterator_base_type;
	};

	template <class _Iter>
	class _Checked_iterator_base_helper
	{
	public:
		typedef _Checked_iterator_base_helper2<_Iter, __is_base_of(_Iterator_base, _Iter)> _Base_helper2;
		typedef _Checked_iterator_base_helper1<_Iter, typename  _Base_helper2::_Checked_iterator_base_type > _Base_helper1;

		typedef typename _Base_helper1::_Base_type_tag _Checked_iterator_base_type_tag;
		typedef typename _Base_helper1::_Checked_iterator_base_type _Checked_iterator_base_type;
	};

	template<class _Iter, class _Base_tag>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(const _Iter &_It, _Base_tag)
	{
		return _It._Checked_iterator_base();
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(const _Iter &_It, _Unchanged_checked_iterator_base_type_tag)
	{
		return _It;
	}

	template<class _Iter, class _Base_tag>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(_Iter &_It, _Base_tag)
	{
		return _It._Checked_iterator_base();
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(_Iter &_It, _Unchanged_checked_iterator_base_type_tag)
	{
		return _It;
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(const _Iter &_It)
	{
		typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type_tag _Base_tag;
		return _Checked_base(_It, _Base_tag);
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(_Iter &_It)
	{
		typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type_tag _Base_tag;
		return _Checked_base(_It, _Base_tag);
	}

		

	template<class _DstIter, class _BaseIter>
	inline
	void __cdecl _Checked_assign_from_base(_DstIter &_Dest, const _BaseIter &_Src)
	{
		_Dest._Checked_iterator_assign_from_base(_Src);
	}

	template<class _Iter>
	inline
	void __cdecl _Checked_assign_from_base(_Iter &_Dest, const _Iter &_Src)
	{
		_Dest = _Src;
	}

		

	
	template <class _Value>
	class _Move_operation_category
	{
	public:
		typedef _Undefined_move_tag _Move_cat;
	};

	template<class _Iter>
	inline
		typename _Move_operation_category<typename iterator_traits<_Iter>::value_type>::_Move_cat _Move_cat(const _Iter&)
	{
		typename _Move_operation_category<typename iterator_traits<_Iter>::value_type>::_Move_cat _Cat;
		return (_Cat);
	}

		
template<class _T1, class _T2, class _Checked_Cat1, class _Checked_Cat2>
struct _Ptr_cat_with_checked_cat_helper
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _T1,	class _T2>
struct _Ptr_cat_helper
	{
	typedef typename _Ptr_cat_with_checked_cat_helper<_T1, _T2,
		typename _Checked_iterator_category<_T1>::_Checked_cat,
		typename _Checked_iterator_category<_T2>::_Checked_cat>::_Ptr_cat _Ptr_cat;
	};

template<class _T1,	class _T2, class _Checked_Cat1>
struct _Ptr_cat_with_checked_cat_helper<_T1, _T2, _Checked_Cat1, _Range_checked_iterator_tag>
	{
	typedef typename _Ptr_cat_helper<_T1, typename _T2::_Inner_type>::_Ptr_cat _Ptr_cat;
	};

template<class _T1,	class _T2, class _Checked_Cat2>
struct _Ptr_cat_with_checked_cat_helper<_T1, _T2, _Range_checked_iterator_tag, _Checked_Cat2>
	{
	typedef typename _Ptr_cat_helper<typename _T1::_Inner_type, _T2>::_Ptr_cat _Ptr_cat;
	};

template<class _T1,	class _T2>
struct _Ptr_cat_with_checked_cat_helper<_T1, _T2, _Range_checked_iterator_tag, _Range_checked_iterator_tag>
	{
	typedef typename _Ptr_cat_helper<typename _T1::_Inner_type, typename _T2::_Inner_type>::_Ptr_cat _Ptr_cat;
	};

template<class _T1>
struct _Ptr_cat_helper<_T1, _Undefined_inner_type_tag>
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _T2>
struct _Ptr_cat_helper<_Undefined_inner_type_tag, _T2>
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<_Undefined_inner_type_tag, _Undefined_inner_type_tag>
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

		
template<>
struct _Ptr_cat_helper<_Bool *, _Bool *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const _Bool *, _Bool *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<char *, char *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const char *, char *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<signed char *, signed char *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const signed char *, signed char *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned char *, unsigned char *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned char *, unsigned char *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};
template<>
struct _Ptr_cat_helper<wchar_t *, wchar_t *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const wchar_t *, wchar_t *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};
template<>
struct _Ptr_cat_helper<short *, short *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const short *, short *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned short *, unsigned short *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned short *, unsigned short *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<int *, int *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const int *, int *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned int *, unsigned int *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned int *, unsigned int *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<long *, long *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const long *, long *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned long *, unsigned long *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned long *, unsigned long *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<float *, float *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const float *, float *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<double *, double *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const double *, double *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<long double *, long double *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const long double *, long double *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};
template<>
struct _Ptr_cat_helper<__int64 *, __int64 *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const __int64 *, __int64 *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned __int64 *, unsigned __int64 *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned __int64 *, unsigned __int64 *>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};
template<class _Ty>
struct _Ptr_cat_helper<_Ty **, _Ty **>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _Ty>
struct _Ptr_cat_helper<_Ty **, const _Ty **>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _Ty>
struct _Ptr_cat_helper<_Ty *const *, _Ty **>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _Ty>
struct _Ptr_cat_helper<_Ty *const *, const _Ty **>
	{	
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};
template<class _T1, class _T2> inline
typename _Ptr_cat_helper<_T1, _T2>::_Ptr_cat __cdecl _Ptr_cat(_T1&, _T2&)
	{
	typename _Ptr_cat_helper<_T1, _T2>::_Ptr_cat _Cat;
	return (_Cat);
	}
		

		

template<class _Iter> inline
	typename iterator_traits<_Iter>::value_type *__cdecl _Val_type(_Iter)
	{	
	return (0);
	}

		
template<class _InIt,
	class _Diff> inline
	void __cdecl advance(_InIt& _Where, _Diff _Off)
	{	
	_Advance(_Where, _Off, _Iter_cat(_Where));
	}

template<class _InIt,
	class _Diff> inline
	void __cdecl _Advance(_InIt& _Where, _Diff _Off, input_iterator_tag)
	{	
	for (; 0 < _Off; --_Off)
		++_Where;
	}

template<class _FI,
	class _Diff> inline
	void __cdecl _Advance(_FI& _Where, _Diff _Off, forward_iterator_tag)
	{	
	for (; 0 < _Off; --_Off)
		++_Where;
	}

#pragma warning(push)
#pragma warning(disable: 6295)
template<class _BI,
	class _Diff> inline
	void __cdecl _Advance(_BI& _Where, _Diff _Off, bidirectional_iterator_tag)
	{	
	for (; 0 < _Off; --_Off)
		++_Where;
	for (; _Off < 0; ++_Off)
		--_Where;
	}
#pragma warning(pop)

template<class _RI,
	class _Diff> inline
	void __cdecl _Advance(_RI& _Where, _Diff _Off, random_access_iterator_tag)
	{	
	_Where += _Off;
	}

		

template<class _Iter> inline
	typename iterator_traits<_Iter>::difference_type
		* __cdecl _Dist_type(_Iter)
	{	
	return (0);
	}

		
template<class _InIt,
	class _Diff> inline
		void __cdecl _Distance2(_InIt _First, _InIt _Last, _Diff& _Off,
			input_iterator_tag)
	{	
	for (; _First != _Last; ++_First)
		++_Off;
	}

template<class _FwdIt,
	class _Diff> inline
		void __cdecl _Distance2(_FwdIt _First, _FwdIt _Last, _Diff& _Off,
			forward_iterator_tag)
	{	
	for (; _First != _Last; ++_First)
		++_Off;
	}

template<class _BidIt,
	class _Diff> inline
		void __cdecl _Distance2(_BidIt _First, _BidIt _Last, _Diff& _Off,
			bidirectional_iterator_tag)
	{	
	for (; _First != _Last; ++_First)
		++_Off;
	}

template<class _RanIt,
	class _Diff> inline
		void __cdecl _Distance2(_RanIt _First, _RanIt _Last, _Diff& _Off,
			random_access_iterator_tag)
	{	
	_Off += _Last - _First;
	}

template<class _InIt> inline
	typename iterator_traits<_InIt>::difference_type
		__cdecl distance(_InIt _First, _InIt _Last)
	{	
	typename iterator_traits<_InIt>::difference_type _Off = 0;
	_Distance2(_First, _Last, _Off, _Iter_cat(_First));
	return (_Off);
	}
template<class _InIt,
	class _Diff> inline
		void __cdecl _Distance(_InIt _First, _InIt _Last, _Diff& _Off)
	{	
	_Distance2(_First, _Last, _Off, _Iter_cat(_First));
	}

		
template<class _RanIt>
	class reverse_iterator
		: public _Iterator_base_secure
	{	
public:
	typedef reverse_iterator<_RanIt> _Myt;
	typedef typename iterator_traits<_RanIt>::iterator_category iterator_category;
	typedef typename iterator_traits<_RanIt>::value_type value_type;
	typedef typename iterator_traits<_RanIt>::difference_type difference_type;
	typedef typename iterator_traits<_RanIt>::difference_type distance_type;	
	typedef typename iterator_traits<_RanIt>::pointer pointer;
	typedef typename iterator_traits<_RanIt>::reference reference;
	typedef _RanIt iterator_type;

	 reverse_iterator()
		{	
		}

	explicit  reverse_iterator(_RanIt _Right)
		: current(_Right)
		{	
		}

	template<class _Other>
		 reverse_iterator(const reverse_iterator<_Other>& _Right)
		: current(_Right.base())
		{	
		}

	_RanIt  base() const
		{	
		return (current);
		}
	typedef typename ::std:: _Checked_iterator_category<_RanIt>::_Checked_cat _Checked_iterator_category;
	typedef reverse_iterator<typename _Checked_iterator_base_helper<_RanIt>::_Checked_iterator_base_type> _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		typename _Checked_iterator_base_type _Base(::std:: _Checked_base(current));
		return _Base;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		::std:: _Checked_assign_from_base(current, _Base.base());
	}
	reference  operator*() const
		{	
		_RanIt _Tmp = current;
		return (*--_Tmp);
		}

	pointer  operator->() const
		{	
		return (&**this);
		}

	_Myt&  operator++()
		{	
		--current;
		return (*this);
		}

	_Myt  operator++(int)
		{	
		_Myt _Tmp = *this;
		--current;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	
		++current;
		return (*this);
		}

	_Myt  operator--(int)
		{	
		_Myt _Tmp = *this;
		++current;
		return (_Tmp);
		}

	template<class _Other>
		bool  _Equal(const reverse_iterator<_Other>& _Right) const
		{	
		return (current == _Right.base());
		}
	_Myt&  operator+=(difference_type _Off)
		{	
		current -= _Off;
		return (*this);
		}

	_Myt  operator+(difference_type _Off) const
		{	
		return (_Myt(current - _Off));
		}

	_Myt&  operator-=(difference_type _Off)
		{	
		current += _Off;
		return (*this);
		}

	_Myt  operator-(difference_type _Off) const
		{	
		return (_Myt(current + _Off));
		}

	reference  operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}

	template<class _Other>
		bool  _Less(const reverse_iterator<_Other>& _Right) const
		{	
		return (_Right.base() < current);
		}

	template<class _Other>
		difference_type  _Minus(const reverse_iterator<_Other>& _Right) const
		{	
		return (_Right.base() - current);
		}

protected:
	_RanIt current;	
	};

		
template<class _RanIt,
	class _Diff> inline
	reverse_iterator<_RanIt> __cdecl operator+(_Diff _Off,
		const reverse_iterator<_RanIt>& _Right)
	{	
	return (_Right + _Off);
	}

template<class _RanIt1,
	class _RanIt2> inline
	typename reverse_iterator<_RanIt1>::difference_type
		__cdecl operator-(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (_Left._Minus(_Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator==(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (_Left._Equal(_Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator!=(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator<(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (_Left._Less(_Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator>(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator<=(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator>=(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	
	return (!(_Left < _Right));
	}

		
template<class _BidIt,
	class _Ty,
	class _Reference = _Ty&,
	class _Pointer = _Ty *,
	class _Diff = ptrdiff_t>
	class reverse_bidirectional_iterator
		: public iterator<bidirectional_iterator_tag, _Ty, _Diff,
			_Pointer, _Reference>
	{	
public:
	typedef reverse_bidirectional_iterator<_BidIt, _Ty, _Reference,
		_Pointer, _Diff> _Myt;
	typedef _BidIt iterator_type;

	 reverse_bidirectional_iterator()
		{	
		}

	explicit  reverse_bidirectional_iterator(_BidIt _Right)
		: current(_Right)
		{	
		}

	_BidIt  base() const
		{	
		return (current);
		}

	_Reference  operator*() const
		{	
		_BidIt _Tmp = current;
		return (*--_Tmp);
		}

	_Pointer  operator->() const
		{
		_Reference _Tmp = **this;
		return (&_Tmp);
		}

	_Myt&  operator++()
		{	
		--current;
		return (*this);
		}

	_Myt  operator++(int)
		{	
		_Myt _Tmp = *this;
		--current;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	
		++current;
		return (*this);
		}

	_Myt  operator--(int)
		{	
		_Myt _Tmp = *this;
		++current;
		return (_Tmp);
		}

	bool  operator==(const _Myt& _Right) const
		{	
		return (current == _Right.current);
		}

	bool  operator!=(const _Myt& _Right) const
		{	
		return (!(*this == _Right));
		}

protected:
	_BidIt current;	
	};

		
template<class _BidIt,
	class _BidIt2 = _BidIt>
	class _Revbidit
		: public iterator<
			typename iterator_traits<_BidIt>::iterator_category,
			typename iterator_traits<_BidIt>::value_type,
			typename iterator_traits<_BidIt>::difference_type,
			typename iterator_traits<_BidIt>::pointer,
			typename iterator_traits<_BidIt>::reference>
	{	
public:
	typedef _Revbidit<_BidIt, _BidIt2> _Myt;
	typedef typename iterator_traits<_BidIt>::difference_type _Diff;
	typedef typename iterator_traits<_BidIt>::pointer _Pointer;
	typedef typename iterator_traits<_BidIt>::reference _Reference;
	typedef _BidIt iterator_type;

	 _Revbidit()
		{	
		}

	explicit  _Revbidit(_BidIt _Right)
		: current(_Right)
		{	
		}

	 _Revbidit(const _Revbidit<_BidIt2>& _Other)
		: current (_Other.base())
		{	
		}

	_BidIt  base() const
		{	
		return (current);
		}

	_Reference  operator*() const
		{	
		_BidIt _Tmp = current;
		return (*--_Tmp);
		}

	_Pointer  operator->() const
		{	
		_Reference _Tmp = **this;
		return (&_Tmp);
		}

	_Myt&  operator++()
		{	
		--current;
		return (*this);
		}

	_Myt  operator++(int)
		{	
		_Myt _Tmp = *this;
		--current;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	
		++current;
		return (*this);
		}

	_Myt  operator--(int)
		{	
		_Myt _Tmp = *this;
		++current;
		return (_Tmp);
		}

	bool  operator==(const _Myt& _Right) const
		{	
		return (current == _Right.current);
		}

	bool  operator!=(const _Myt& _Right) const
		{	
		return (!(*this == _Right));
		}

protected:
	_BidIt current;
	};

		
template<class _Elem,
	class _Traits>
	class istreambuf_iterator
		: public _Iterator_with_base<input_iterator_tag,
			_Elem, typename _Traits::off_type, _Elem *, _Elem&, _Iterator_base_secure>
	{	
	typedef istreambuf_iterator<_Elem, _Traits> _Myt;
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef basic_streambuf<_Elem, _Traits> streambuf_type;
	typedef basic_istream<_Elem, _Traits> istream_type;
	typedef typename traits_type::int_type int_type;

	 istreambuf_iterator(streambuf_type *_Sb = 0) throw ()
		: _Strbuf(_Sb), _Got(_Sb == 0)
		{	
		}

	 istreambuf_iterator(istream_type& _Istr) throw ()
		: _Strbuf(_Istr.rdbuf()), _Got(_Istr.rdbuf() == 0)
		{	
		}

	_Elem  operator*() const
		{	
		if (!_Got)
			((_Myt *)this)->_Peek();
		return (_Val);
		}

	_Myt&  operator++()
		{	
		_Inc();
		return (*this);
		}

	_Myt  operator++(int)
		{	
		if (!_Got)
			_Peek();
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	bool  equal(const _Myt& _Right) const
		{	
		if (!_Got)
			((_Myt *)this)->_Peek();
		if (!_Right._Got)
			((_Myt *)&_Right)->_Peek();
		return (_Strbuf == 0 && _Right._Strbuf == 0
			|| _Strbuf != 0 && _Right._Strbuf != 0);
		}

private:
	void  _Inc()
		{	
		if (_Strbuf == 0
			|| traits_type::eq_int_type(traits_type::eof(),
				_Strbuf->sbumpc()))
			_Strbuf = 0, _Got = true;
		else
			_Got = false;
		}

	_Elem  _Peek()
		{	
		int_type _Meta;
		if (_Strbuf == 0
			|| traits_type::eq_int_type(traits_type::eof(),
				_Meta = _Strbuf->sgetc()))
			_Strbuf = 0;
		else
			_Val = traits_type::to_char_type(_Meta);
		_Got = true;
		return (_Val);
		}

	streambuf_type *_Strbuf;	
	bool _Got;	
	_Elem _Val;	
	};

		
template<class _Elem,
	class _Traits> inline
	bool __cdecl operator==(
		const istreambuf_iterator<_Elem, _Traits>& _Left,
		const istreambuf_iterator<_Elem, _Traits>& _Right)
	{	
	return (_Left.equal(_Right));
	}

template<class _Elem,
	class _Traits> inline
	bool __cdecl operator!=(
		const istreambuf_iterator<_Elem, _Traits>& _Left,
		const istreambuf_iterator<_Elem, _Traits>& _Right)
	{	
	return (!(_Left == _Right));
	}

		
template<class _Elem,
	class _Traits>
	class ostreambuf_iterator
		: public _Outit_with_base<_Iterator_base_secure>
	{	
	typedef ostreambuf_iterator<_Elem, _Traits> _Myt;
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef basic_streambuf<_Elem, _Traits> streambuf_type;
	typedef basic_ostream<_Elem, _Traits> ostream_type;

	typedef _Range_checked_iterator_tag _Checked_iterator_category;

	 ostreambuf_iterator(streambuf_type *_Sb) throw ()
		: _Failed(false), _Strbuf(_Sb)
		{	
		}

	 ostreambuf_iterator(ostream_type& _Ostr) throw ()
		: _Failed(false), _Strbuf(_Ostr.rdbuf())
		{	
		}

	_Myt&  operator=(_Elem _Right)
		{	
		if (_Strbuf == 0
			|| traits_type::eq_int_type(_Traits::eof(),
				_Strbuf->sputc(_Right)))
			_Failed = true;
		return (*this);
		}

	_Myt&  operator*()
		{	
		return (*this);
		}

	_Myt&  operator++()
		{	
		return (*this);
		}

	_Myt&  operator++(int)
		{	
		return (*this);
		}

	bool  failed() const throw ()
		{	
		return (_Failed);
		}

private:
	bool _Failed;	
	streambuf_type *_Strbuf;	
	};
		
template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	;
	for (; _First != _Last; ++_Dest, ++_First)
		*_Dest = *_First;
	return (_Dest);
	}
template<class _InIt, class _OutIt>
inline
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		random_access_iterator_tag, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	
	_OutIt _Result = _Dest + (_Last - _First);
	_Copy_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Nonscalar_ptr_iterator_tag(), _Range_checked_iterator_tag());
	return _Result;
	}
template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	ptrdiff_t _Off = _Last - _First;	
	
	_OutIt _Result = _Dest + _Off;
	if (_Off > 0)
		::memmove_s((&*_Dest), (_Off * sizeof (*_First)), (&*_First), (_Off * sizeof (*_First)));
	return _Result;
	}
template<class _InIt, class _OutIt, class _InOutItCat, class _Ty>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat _First_dest_cat, _Ty _PtrCat, _Unchecked_iterator_tag)
	{
	return _Copy_opt(_First, _Last, _Dest, _First_dest_cat, _PtrCat, _Range_checked_iterator_tag());
	}
template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	
	return (_Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

		
template<class _InIt, class _OutIt, class _InOutItCat, class _MoveCatTy>
inline
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat _First_dest_cat, _MoveCatTy, _Range_checked_iterator_tag)
	{	
	return _Copy_opt(_First, _Last, _Dest,
		_First_dest_cat, _Ptr_cat(_First, _Dest), _Range_checked_iterator_tag());
	}

template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Swap_move_tag, _Range_checked_iterator_tag)
	{	
	;
	for (; _First != _Last; ++_Dest, ++_First)
		::std:: swap(*_Dest, *_First);
	return (_Dest);
	}
template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		random_access_iterator_tag, _Swap_move_tag _Move_cat, _Range_checked_iterator_tag)
	{	
	
	_OutIt _Result = _Dest + (_Last - _First);
	_Move_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Move_cat, _Range_checked_iterator_tag());
	return _Result;
	}
template<class _InIt, class _OutIt, class _InOutItCat, class _MoveCatTy>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat _First_dest_cat, _MoveCatTy _Move_cat, _Unchecked_iterator_tag)
	{
	return _Move_opt(_First, _Last, _Dest, _First_dest_cat, _Move_cat, _Range_checked_iterator_tag());
	}
template<class _InIt, class _OutIt>
inline
	_OutIt __cdecl _Move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	
	return _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Move_cat(_Dest), ::std:: _Checked_cat(_Dest));
	}

		
template<class _BidIt1, class _BidIt2, class _InOutItCat>
inline
	_BidIt2 __cdecl _Copy_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	;
	while (_First != _Last)
		*--_Dest = *--_Last;
	return (_Dest);
	}
template<class _InIt, class _OutIt>
inline
	_OutIt __cdecl _Copy_backward_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		random_access_iterator_tag, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	
	_OutIt _Result = _Dest - (_Last - _First);
	_Copy_backward_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Nonscalar_ptr_iterator_tag(), _Range_checked_iterator_tag());
	return _Result;
	}
template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Copy_backward_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	ptrdiff_t _Off = _Last - _First;	
	
	_OutIt _Result = _Dest - _Off;
	if (_Off > 0)
		::memmove_s((&*_Result), (_Off * sizeof (*_First)), (&*_First), (_Off * sizeof (*_First)));
	return _Result;
	}
template<class _BidIt1, class _BidIt2, class _InOutItCat, class _Ty>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_BidIt2 __cdecl _Copy_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat _First_dest_cat, _Ty _PtrCat, _Unchecked_iterator_tag)
	{
	return _Copy_backward_opt(_First, _Last, _Dest,
		_First_dest_cat, _PtrCat, _Range_checked_iterator_tag());
	}
template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	
	return _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest));
	}

		
template<class _BidIt1, class _BidIt2, class _InOutItCat, class _MoveCatTy>
inline
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat _First_dest_cat, _MoveCatTy, _Range_checked_iterator_tag)
	{	
	return _Copy_backward_opt(_First, _Last, _Dest,
		_First_dest_cat, _Ptr_cat(_First, _Dest), _Range_checked_iterator_tag());
	}

template<class _BidIt1, class _BidIt2, class _InOutItCat>
inline
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat, _Swap_move_tag, _Range_checked_iterator_tag)
	{	
	;
	while (_First != _Last)
		::std:: swap(*--_Dest, *--_Last);
	return (_Dest);
	}
template<class _BidIt1, class _BidIt2>
inline
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		random_access_iterator_tag, _Swap_move_tag _Move_cat, _Range_checked_iterator_tag)
	{	
	
	_BidIt2 _Result = _Dest - (_Last - _First);
	_Move_backward_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Move_cat, _Range_checked_iterator_tag());
	return _Result;
	}
template<class _BidIt1, class _BidIt2, class _InOutItCat, class _MoveCatTy>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat _First_dest_cat, _MoveCatTy _Move_cat, _Unchecked_iterator_tag)
	{
	return _Move_backward_opt(_First, _Last, _Dest,
		_First_dest_cat, _Move_cat, _Range_checked_iterator_tag());
	}
template<class _BidIt1, class _BidIt2>
inline
	_BidIt2 __cdecl _Move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	
	return _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Move_cat(_Dest), ::std:: _Checked_cat(_Dest));
	}

		
template<class _InIt1, class _InIt2, class _InItCats>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
			_InItCats, _Range_checked_iterator_tag)
	{	
	for (; _First1 != _Last1 && *_First1 == *_First2; )
		++_First1, ++_First2;
	return (pair<_InIt1, _InIt2>(_First1, _First2));
	}
template<class _InIt1, class _InIt2>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
			random_access_iterator_tag, _Range_checked_iterator_tag)
	{	
	
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	pair<_InIt1, typename ::std:: _Checked_iterator_base_helper<_InIt2>::_Checked_iterator_base_type> _Result =
		_Mismatch(_First1, _Last1, ::std:: _Checked_base(_First2),
			forward_iterator_tag(), _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First2, _Result.second);
	return (pair<_InIt1, _InIt2>(_Result.first, _First2));
	}
template<class _InIt1, class _InIt2, class _InItCats>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
			_InItCats _InIt_cats, _Unchecked_iterator_tag)
	{
	return _Mismatch(_First1, _Last1, _First2,
		_InIt_cats, _Range_checked_iterator_tag());
	}
template<class _InIt1, class _InIt2>
inline
	pair<_InIt1, _InIt2>
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	

	pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		_Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			_Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

		
template<class _InIt1, class _InIt2, class _Pr, class _InItCats>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
			_InItCats, _Range_checked_iterator_tag)
	{	

	for (; _First1 != _Last1 && _Pred(*_First1, *_First2); )
		++_First1, ++_First2;
	return (pair<_InIt1, _InIt2>(_First1, _First2));
	}
template<class _InIt1, class _InIt2, class _Pr>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
			random_access_iterator_tag, _Range_checked_iterator_tag)
	{	
	
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	pair<_InIt1, typename ::std:: _Checked_iterator_base_helper<_InIt2>::_Checked_iterator_base_type> _Result =
		_Mismatch(_First1, _Last1, ::std:: _Checked_base(_First2), _Pred,
			forward_iterator_tag(), _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First2, _Result.second);
	return (pair<_InIt1, _InIt2>(_Result.first, _First2));
	}
template<class _InIt1, class _InIt2, class _Pr, class _InItCats>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
			_InItCats _InIt_cats, _Unchecked_iterator_tag)
	{
	return _Mismatch(_First1, _Last1, _First2, _Pred,
		_InIt_cats, _Range_checked_iterator_tag());
	}
template<class _InIt1, class _InIt2, class _Pr>
inline
	pair<_InIt1, _InIt2>
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	

	pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		_Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			_Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

		
template<class _InIt1, class _InIt2, class _InItCats>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
		_InItCats, _Range_checked_iterator_tag)
	{	
	return (_Mismatch(_First1, _Last1, _First2,
		forward_iterator_tag(), _Range_checked_iterator_tag()).first == _Last1);
	}

inline bool __cdecl _Equal(const char *_First1,
	const char *_Last1, const char *_First2,
	random_access_iterator_tag, _Range_checked_iterator_tag)
	{	
	return (::memcmp(_First1, _First2, _Last1 - _First1) == 0);
	}

inline bool __cdecl _Equal(const signed char *_First1,
	const signed char *_Last1, const signed char *_First2,
	random_access_iterator_tag, _Range_checked_iterator_tag)
	{	
	return (::memcmp(_First1, _First2, _Last1 - _First1) == 0);
	}

inline bool __cdecl _Equal(const unsigned char *_First1,
	const unsigned char *_Last1, const unsigned char *_First2,
	random_access_iterator_tag, _Range_checked_iterator_tag)
	{	
	return (::memcmp(_First1, _First2, _Last1 - _First1) == 0);
	}
template<class _InIt1, class _InIt2>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
		random_access_iterator_tag, _Range_checked_iterator_tag)
	{
	
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	return _Equal(_First1, _Last1, ::std:: _Checked_base(_First2),
		forward_iterator_tag(), _Range_checked_iterator_tag());
	}
template<class _InIt1, class _InIt2, class _InItCats>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
		_InItCats _InIt_cats,_Unchecked_iterator_tag)
	{
	return _Equal(_First1, _Last1, _First2,
		_InIt_cats, _Range_checked_iterator_tag());
	}
template<class _InIt1, class _InIt2>
inline
	bool __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	
	return _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		_Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	}

		
template<class _InIt1, class _InIt2, class _Pr, class _InItCats>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
		_InItCats, _Range_checked_iterator_tag)
	{	
	return (_Mismatch(_First1, _Last1, _First2, _Pred,
		forward_iterator_tag(), _Range_checked_iterator_tag()).first == _Last1);
	}
template<class _InIt1, class _InIt2, class _Pr>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
		random_access_iterator_tag, _Range_checked_iterator_tag)
	{
	
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	return _Equal(_First1, _Last1, ::std:: _Checked_base(_First2), _Pred,
		forward_iterator_tag(), _Range_checked_iterator_tag());
	}
template<class _InIt1, class _InIt2, class _Pr, class _InItCats>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
		_InItCats _InIt_cats,_Unchecked_iterator_tag)
	{
	return _Equal(_First1, _Last1, _First2, _Pred,
		_InIt_cats, _Range_checked_iterator_tag());
	}
template<class _InIt1, class _InIt2, class _Pr>
inline
	bool __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	
	return _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		_Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	}

		
template<class _FwdIt, class _Ty> inline
	void __cdecl _Fill(_FwdIt _First, _FwdIt _Last, const _Ty& _Val)
	{	
	;
	for (; _First != _Last; ++_First)
		*_First = _Val;
	}

inline void __cdecl _Fill(       char *_First,
	       char *_Last, int _Val)
	{	
	;
	::memset(_First, _Val, _Last - _First);
	}

inline void __cdecl _Fill(       signed char *_First,
	       signed char *_Last, int _Val)
	{	
	;
	::memset(_First, _Val, _Last - _First);
	}

inline void __cdecl _Fill(
	       unsigned char *_First,
	       unsigned char *_Last, int _Val)
	{	
	;
	::memset(_First, _Val, _Last - _First);
	}

template<class _FwdIt, class _Ty> inline
	void __cdecl fill(_FwdIt _First, _FwdIt _Last, const _Ty& _Val)
	{	
	_Fill(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Val);
	}

		
template<class _OutIt,
	class _Diff,
	class _Ty> inline
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		_Range_checked_iterator_tag)
	{	
	for (; 0 < _Count; --_Count, ++_First)
		*_First = _Val;
	}

inline void __cdecl _Fill_n(         char *_First,
		size_t _Count, int _Val, _Range_checked_iterator_tag)
	{	
	::memset(_First, _Val, _Count);
	}

inline void __cdecl _Fill_n(         signed char *_First,
		size_t _Count, int _Val, _Range_checked_iterator_tag)
	{	
	::memset(_First, _Val, _Count);
	}

inline void __cdecl _Fill_n(         unsigned char *_First,
		size_t _Count, int _Val, _Range_checked_iterator_tag)
	{	
	::memset(_First, _Val, _Count);
	}

template<class _OutIt, class _Diff, class _Ty, class _OutCat>
inline
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		_OutCat, _Range_checked_iterator_tag)
	{
		_Fill_n(_First, _Count, _Val, _Range_checked_iterator_tag());
	}
template<class _OutIt, class _Diff, class _Ty>
inline
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		random_access_iterator_tag, _Range_checked_iterator_tag)
	{
		
		_OutIt _Last = _First + _Count; (_Last);
		_Fill_n(::std:: _Checked_base(_First), _Count, _Val,
			_Range_checked_iterator_tag());
	}
template<class _OutIt, class _Diff, class _Ty, class _OutCat>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		_OutCat _First_cat, _Unchecked_iterator_tag)
	{
		_Fill_n(_First, _Count, _Val, _First_cat, _Range_checked_iterator_tag());
	}
template<class _OutIt,
	class _Diff,
	class _Ty> inline
	void __cdecl fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	
		_Fill_n(_First, _Count, _Val, _Iter_cat(_First), ::std:: _Checked_cat(_First));
	}

		
template<class _InIt1, class _InIt2> inline
	bool __cdecl _Lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2)
	{	
	;
	;
	for (; _First1 != _Last1 && _First2 != _Last2; ++_First1, ++_First2)
		if (((*_First1) < (*_First2)))
			return (true);
		else if (*_First2 < *_First1)
			return (false);
	return (_First1 == _Last1 && _First2 != _Last2);
	}

template<class _InIt1, class _InIt2> inline
	bool __cdecl lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2)
	{	
	return _Lexicographical_compare(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1),
		::std:: _Checked_base(_First2), ::std:: _Checked_base(_Last2));
	}

inline bool __cdecl lexicographical_compare(
	const unsigned char *_First1, const unsigned char *_Last1,
	const unsigned char *_First2, const unsigned char *_Last2)
	{	
	;
	;
	ptrdiff_t _Num1 = _Last1 - _First1;
	ptrdiff_t _Num2 = _Last2 - _First2;
	int _Ans = ::memcmp(_First1, _First2, _Num1 < _Num2 ? _Num1 : _Num2);
	return (_Ans < 0 || _Ans == 0 && _Num1 < _Num2);
	}
		
template<class _InIt1,
	class _InIt2,
	class _Pr> inline
	bool __cdecl _Lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2, _Pr _Pred)
	{	
	;
	;
	;
	for (; _First1 != _Last1 && _First2 != _Last2; ++_First1, ++_First2)
		if (_Pred(*_First1, *_First2))
			return (true);
		else if (_Pred(*_First2, *_First1))
			return (false);
	return (_First1 == _Last1 && _First2 != _Last2);
	}

template<class _InIt1, class _InIt2, class _Pr> inline
	bool __cdecl lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2, _Pr _Pred)
	{	
	return _Lexicographical_compare(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1),
		::std:: _Checked_base(_First2), ::std:: _Checked_base(_Last2), _Pred);
	}
		
template<class _Ty> inline
	const _Ty& (__cdecl max)(const _Ty& _Left, const _Ty& _Right)
	{	
	return (((_Left) < (_Right)) ? _Right : _Left);
	}

		
template<class _Ty,
	class _Pr> inline
	const _Ty& (__cdecl max)(const _Ty& _Left, const _Ty& _Right, _Pr _Pred)
	{	
	return (_Pred(_Left, _Right) ? _Right : _Left);
	}

		
template<class _Ty> inline
	const _Ty& (__cdecl min)(const _Ty& _Left, const _Ty& _Right)
	{	
	return (((_Right) < (_Left)) ? _Right : _Left);
	}

		
template<class _Ty,
	class _Pr> inline
	const _Ty& (__cdecl min)(const _Ty& _Left, const _Ty& _Right, _Pr _Pred)
	{	
	return (_Pred(_Right, _Left) ? _Right : _Left);
	}

}

namespace stdext {

template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl unchecked_copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	
		return (::std:: _Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl checked_copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	
		return (::std:: _Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl unchecked_copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	
		return (::std:: _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl checked_copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	
		return (::std:: _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl _Unchecked_move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	
		return (::std:: _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl _Checked_move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	
		return (::std:: _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl _Unchecked_move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	
		return (::std:: _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl _Checked_move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	
		return (::std:: _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _OutIt,
	class _Diff,
	class _Ty> inline
	void __cdecl unchecked_fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	
		::std:: _Fill_n(_First, _Count, _Val, ::std:: _Iter_cat(_First), ::std:: _Range_checked_iterator_tag());
	}

template<class _OutIt,
	class _Diff,
	class _Ty> inline
	void __cdecl checked_fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	
		::std:: _Fill_n(_First, _Count, _Val, ::std:: _Iter_cat(_First), ::std:: _Checked_cat(_Dest));
	}

template<class _InIt1, class _InIt2>
inline
	::std:: pair<_InIt1, _InIt2>
		__cdecl unchecked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	

	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InIt2>
inline
	::std:: pair<_InIt1, _InIt2>
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	

	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			::std:: _Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
	::std:: pair<_InIt1, _InIt2>
		__cdecl unchecked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	

	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
	::std:: pair<_InIt1, _InIt2>
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	

	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			::std:: _Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InIt2>
inline
	bool __cdecl unchecked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InIt2>
inline
	bool __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		::std:: _Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
	bool __cdecl unchecked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
	bool __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		::std:: _Iter_random(_First1, _First2), ::std:: _Checked_cat(_First2));
	}

}
extern "C"
__declspec(dllimport) void __cdecl _invalid_parameter_noinfo(void);

#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)

 #pragma warning(disable: 4100)
namespace std {
		
template<class _Ty> inline
	_Ty  *_Allocate(size_t _Count, _Ty  *)
	{	
	if (_Count <= 0)
		_Count = 0;
	else if (((size_t)(-1) / _Count) < sizeof (_Ty))
		throw std::bad_alloc(0);

		
	return ((_Ty  *)::operator new(_Count * sizeof (_Ty)));
	}

		
template<class _T1,
	class _T2> inline
	void _Construct(_T1  *_Ptr, const _T2& _Val)
	{	
	void  *_Vptr = _Ptr;
	::new (_Vptr) _T1(_Val);
	}

		
template<class _Ty> inline
	void _Destroy(_Ty  *_Ptr)
	{	
	(_Ptr)->~_Ty();
	}

template<> inline
	void _Destroy(char  *)
	{	
	}

template<> inline
	void _Destroy(wchar_t  *)
	{	
	}
		
template<class _Ty>
	struct _Allocator_base
	{	
	typedef _Ty value_type;
	};

		
template<class _Ty>
	struct _Allocator_base<const _Ty>
	{	
	typedef _Ty value_type;
	};

		
template<class _Ty>
	class allocator
		: public _Allocator_base<_Ty>
	{	
public:
	typedef _Allocator_base<_Ty> _Mybase;
	typedef typename _Mybase::value_type value_type;
	typedef value_type  *pointer;
	typedef value_type & reference;
	typedef const value_type  *const_pointer;
	typedef const value_type & const_reference;

	typedef size_t size_type;
	typedef ptrdiff_t difference_type;

	template<class _Other>
		struct rebind
		{	
		typedef allocator<_Other> other;
		};

	pointer address(reference _Val) const
		{	
		return (&_Val);
		}

	const_pointer address(const_reference _Val) const
		{	
		return (&_Val);
		}

	allocator() throw ()
		{	
		}

	allocator(const allocator<_Ty>&) throw ()
		{	
		}

	template<class _Other>
		allocator(const allocator<_Other>&) throw ()
		{	
		}

	template<class _Other>
		allocator<_Ty>& operator=(const allocator<_Other>&)
		{	
		return (*this);
		}

	void deallocate(pointer _Ptr, size_type)
		{	
		::operator delete(_Ptr);
		}

	pointer allocate(size_type _Count)
		{	
		return (_Allocate(_Count, (pointer)0));
		}

	pointer allocate(size_type _Count, const void  *)
		{	
		return (allocate(_Count));
		}

	void construct(pointer _Ptr, const _Ty& _Val)
		{	
		_Construct(_Ptr, _Val);
		}

	void destroy(pointer _Ptr)
		{	
		_Destroy(_Ptr);
		}

	size_t max_size() const throw ()
		{	
		size_t _Count = (size_t)(-1) / sizeof (_Ty);
		return (0 < _Count ? _Count : 1);
		}
	};

		
template<class _Ty,
	class _Other> inline
	bool operator==(const allocator<_Ty>&, const allocator<_Other>&) throw ()
	{	
	return (true);
	}

template<class _Ty,
	class _Other> inline
	bool operator!=(const allocator<_Ty>&, const allocator<_Other>&) throw ()
	{	
	return (false);
	}

		
template<> class __declspec(dllimport) allocator<void>
	{	
public:
	typedef void _Ty;
	typedef _Ty  *pointer;
	typedef const _Ty  *const_pointer;
	typedef _Ty value_type;

	template<class _Other>
		struct rebind
		{	
		typedef allocator<_Other> other;
		};

	allocator() throw ()
		{	
		}

	allocator(const allocator<_Ty>&) throw ()
		{	
		}

	template<class _Other>
		allocator(const allocator<_Other>&) throw ()
		{	
		}

	template<class _Other>
		allocator<_Ty>& operator=(const allocator<_Other>&)
		{	
		return (*this);
		}
	};

		
template<class _Ty,
	class _Alloc> inline
	void _Destroy_range(_Ty *_First, _Ty *_Last, _Alloc& _Al)
	{	
	_Destroy_range(_First, _Last, _Al, _Ptr_cat(_First, _Last));
	}

template<class _Ty,
	class _Alloc> inline
	void _Destroy_range(_Ty *_First, _Ty *_Last, _Alloc& _Al,
		_Nonscalar_ptr_iterator_tag)
	{	
	for (; _First != _Last; ++_First)
		_Al.destroy(_First);
	}

template<class _Ty,
	class _Alloc> inline
	void _Destroy_range(_Ty *_First, _Ty *_Last, _Alloc& _Al,
		_Scalar_ptr_iterator_tag)
	{	
	}
}
  #pragma warning(default: 4100)

#pragma warning(pop)
#pragma pack(pop)

#pragma pack(push,8)
#pragma warning(push,3)
#pragma warning(disable:4412)
namespace std {

  #pragma warning(disable:4251)

template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Ax = allocator<_Elem> >
	class basic_string;

		
template<class _Elem,
	class _Traits,
	class _Alloc>
	class _String_const_iterator
		: public _Ranit_base<_Elem, typename _Alloc::difference_type,
			typename _Alloc::const_pointer, typename _Alloc::const_reference, _Iterator_base_secure>
	{	
public:
	typedef _String_const_iterator<_Elem, _Traits, _Alloc> _Myt;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystring;

	typedef random_access_iterator_tag iterator_category;
	typedef _Elem value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::const_pointer pointer;
	typedef typename _Alloc::const_reference reference;
	typedef _Range_checked_iterator_tag _Checked_iterator_category;
	typedef pointer _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return _Myptr;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		this->_Myptr = _Base;
	}
	 _String_const_iterator()
		{	
		_Myptr = 0;
		}

		 _String_const_iterator(pointer _Ptr, const _Container_base *_Pstring)
			{	
			{ if (!(_Pstring != 0 && _Ptr != 0 && ((_Mystring *)_Pstring)->_Myptr() <= _Ptr && _Ptr <= (((_Mystring *)_Pstring)->_Myptr() + ((_Mystring *)_Pstring)->_Mysize))) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			this->_Mycont = _Pstring;
			_Myptr = _Ptr;
			}
	reference  operator*() const
		{	
		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(_Myptr < (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)(this->_Mycont))->_Mysize))) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		return (*_Myptr);
		}

	pointer  operator->() const
		{	
		return (&**this);
		}

	_Myt&  operator++()
		{	
		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(_Myptr < (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize))) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		++_Myptr;
		return (*this);
		}

	_Myt  operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	
		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(_Myptr > ((_Mystring *)this->_Mycont)->_Myptr())) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		--_Myptr;
		return (*this);
		}

	_Myt  operator--(int)
		{	
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt&  operator+=(difference_type _Off)
		{	
		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(_Myptr + _Off <= (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize) && _Myptr + _Off >= ((_Mystring *)this->_Mycont)->_Myptr())) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		_Myptr += _Off;
		return (*this);
		}

	_Myt  operator+(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt&  operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Myt  operator-(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type  operator-(const _Myt& _Right) const
		{	

		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		return (_Myptr - _Right._Myptr);
		}

	reference  operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}

	bool  operator==(const _Myt& _Right) const
		{	

		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		return (_Myptr == _Right._Myptr);
		}

	bool  operator!=(const _Myt& _Right) const
		{	
		return (!(*this == _Right));
		}

	bool  operator<(const _Myt& _Right) const
		{	

		if (this->_Mycont != ((const _Container_base *)-2))
		{
			{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		}
		return (_Myptr < _Right._Myptr);
		}

	bool  operator>(const _Myt& _Right) const
		{	
		return (_Right < *this);
		}

	bool  operator<=(const _Myt& _Right) const
		{	
		return (!(_Right < *this));
		}

	bool  operator>=(const _Myt& _Right) const
		{	
		return (!(*this < _Right));
		}

	static void __cdecl _Xlen()
		{
		_Mystring::_Xlen();
		}

	static void __cdecl _Xran()
		{
		_Mystring::_Xran();
		}

	static void __cdecl _Xinvarg()
		{
		_Mystring::_Xinvarg();
		}

	pointer _Myptr;	
	};

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	_String_const_iterator<_Elem, _Traits, _Alloc> __cdecl operator+(
		typename _String_const_iterator<_Elem, _Traits, _Alloc>
			::difference_type _Off,
		_String_const_iterator<_Elem, _Traits, _Alloc> _Next)
	{	
	return (_Next += _Off);
	}

		
template<class _Elem,
	class _Traits,
	class _Alloc>
	class _String_iterator
		: public _String_const_iterator<_Elem, _Traits, _Alloc>
	{	
public:
	typedef _String_iterator<_Elem, _Traits, _Alloc> _Myt;
	typedef _String_const_iterator<_Elem, _Traits, _Alloc> _Mybase;

	typedef random_access_iterator_tag iterator_category;
	typedef _Elem value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::pointer pointer;
	typedef typename _Alloc::reference reference;

	 _String_iterator()
		{	
		}
		 _String_iterator(pointer _Ptr, const _Container_base *_Pstring)
			: _Mybase(_Ptr, _Pstring)
			{	
			}
	typedef pointer _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return const_cast<pointer>(this->_Myptr);
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		this->_Myptr = _Base;
	}
	reference  operator*() const
		{	
		return ((reference)**(_Mybase *)this);
		}

	pointer  operator->() const
		{	
		return (&**this);
		}

	_Myt&  operator++()
		{	
		++(*(_Mybase *)this);
		return (*this);
		}

	_Myt  operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	
		--(*(_Mybase *)this);
		return (*this);
		}

	_Myt  operator--(int)
		{	
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt&  operator+=(difference_type _Off)
		{	
		(*(_Mybase *)this) += _Off;
		return (*this);
		}

	_Myt  operator+(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt&  operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Myt  operator-(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type  operator-(const _Mybase& _Right) const
		{	
		return ((_Mybase)*this - _Right);
		}

	reference  operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}
	};

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	_String_iterator<_Elem, _Traits, _Alloc>  operator+(
		typename _String_iterator<_Elem, _Traits, _Alloc>
			::difference_type _Off,
		_String_iterator<_Elem, _Traits, _Alloc> _Next)
	{	
	return (_Next += _Off);
	}

		
class __declspec(dllimport) _String_base
		: public _Container_base
	{	
public:
	 static void __cdecl _Xlen();	

	 static void __cdecl _Xran();	

	 static void __cdecl _Xinvarg();
	};

		
template<class _Ty,
	class _Alloc>
	class _String_val
		: public _String_base
	{	
protected:
	typedef typename _Alloc::template
		rebind<_Ty>::other _Alty;

	 _String_val(_Alty _Al = _Alty())
		: _Alval(_Al)
		{	
		}

	_Alty _Alval;	
	};

		
template<class _Elem,
	class _Traits,
	class _Ax>
	class basic_string
		: public _String_val<_Elem, _Ax>
	{	
public:
	typedef basic_string<_Elem, _Traits, _Ax> _Myt;
	typedef _String_val<_Elem, _Ax> _Mybase;
	typedef typename _Mybase::_Alty _Alloc;
	typedef typename _Alloc::size_type size_type;
	typedef typename _Alloc::difference_type _Dift;
	typedef _Dift difference_type;
	typedef typename _Alloc::pointer _Tptr;
	typedef typename _Alloc::const_pointer _Ctptr;
	typedef _Tptr pointer;
	typedef _Ctptr const_pointer;
	typedef typename _Alloc::reference _Reft;
	typedef _Reft reference;
	typedef typename _Alloc::const_reference const_reference;
	typedef typename _Alloc::value_type value_type;
	typedef _String_iterator<_Elem, _Traits, _Alloc> iterator;
	typedef _String_const_iterator<_Elem, _Traits, _Alloc> const_iterator;
	friend class _String_const_iterator<_Elem, _Traits, _Alloc>;

	typedef std::reverse_iterator<iterator> reverse_iterator;
	typedef std::reverse_iterator<const_iterator> const_reverse_iterator;

	 basic_string()
		: _Mybase()
		{	
		_Tidy();
		}
	explicit  basic_string(const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Tidy();
		}

	 basic_string(const _Myt& _Right)
		: _Mybase(_Right._Alval)
		{	
		_Tidy();
		assign(_Right, 0, npos);
		}

	 basic_string(const _Myt& _Right, size_type _Roff,
		size_type _Count = npos)
		: _Mybase()
		{	
		_Tidy();
		assign(_Right, _Roff, _Count);
		}

	 basic_string(const _Myt& _Right, size_type _Roff, size_type _Count,
		const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Tidy();
		assign(_Right, _Roff, _Count);
		}

	 basic_string(const _Elem *_Ptr, size_type _Count)
		: _Mybase()
		{	
		_Tidy();
		assign(_Ptr, _Count);
		}

	 basic_string(const _Elem *_Ptr, size_type _Count, const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Tidy();
		assign(_Ptr, _Count);
		}

	 basic_string(const _Elem *_Ptr)
		: _Mybase()
		{	
		_Tidy();
		assign(_Ptr);
		}

	 basic_string(const _Elem *_Ptr, const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Tidy();
		assign(_Ptr);
		}

	 basic_string(size_type _Count, _Elem _Ch)
		: _Mybase()
		{	
		_Tidy();
		assign(_Count, _Ch);
		}

	 basic_string(size_type _Count, _Elem _Ch, const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Tidy();
		assign(_Count, _Ch);
		}

	template<class _It>
		 basic_string(_It _First, _It _Last)
		: _Mybase()
		{	
		_Tidy();
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		 basic_string(_It _First, _It _Last, const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Tidy();
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		void  _Construct(_It _Count,
			_It _Ch, _Int_iterator_tag)
		{	
		assign((size_type)_Count, (_Elem)_Ch);
		}

	template<class _It>
		void  _Construct(_It _First,
			_It _Last, input_iterator_tag)
		{	
		try {
		for (; _First != _Last; ++_First)
			append((size_type)1, (_Elem)*_First);
		} catch (...) {
		_Tidy(true);
		throw;
		}
		}

	template<class _It>
		void  _Construct(_It _First,
			_It _Last, forward_iterator_tag)
		{	
		size_type _Count = 0;
		_Distance(_First, _Last, _Count);
		reserve(_Count);

		try {
		for (; _First != _Last; ++_First)
			append((size_type)1, (_Elem)*_First);
		} catch (...) {
		_Tidy(true);
		throw;
		}
		}

	 basic_string(const_pointer _First, const_pointer _Last)
		: _Mybase()
		{	
		_Tidy();
		if (_First != _Last)
			assign(&*_First, _Last - _First);
		}

	 basic_string(const_iterator _First, const_iterator _Last)
		: _Mybase()
		{	
		_Tidy();
		if (_First != _Last)
			assign(&*_First, _Last - _First);
		}

	 ~basic_string()
		{	
		_Tidy(true);
		}

	typedef _Traits traits_type;
	typedef _Alloc allocator_type;

	 static const size_type npos;	

	_Myt&  operator=(const _Myt& _Right)
		{	
		return (assign(_Right));
		}

	_Myt&  operator=(const _Elem *_Ptr)
		{	
		return (assign(_Ptr));
		}

	_Myt&  operator=(_Elem _Ch)
		{	
		return (assign(1, _Ch));
		}

	_Myt&  operator+=(const _Myt& _Right)
		{	
		return (append(_Right));
		}

	_Myt&  operator+=(const _Elem *_Ptr)
		{	
		return (append(_Ptr));
		}

	_Myt&  operator+=(_Elem _Ch)
		{	
		return (append((size_type)1, _Ch));
		}

	_Myt&  append(const _Myt& _Right)
		{	
		return (append(_Right, 0, npos));
		}

	_Myt&  append(const _Myt& _Right,
		size_type _Roff, size_type _Count)
		{	
		if (_Right.size() < _Roff)
			_String_base::_Xran();	
		size_type _Num = _Right.size() - _Roff;
		if (_Num < _Count)
			_Count = _Num;	
		if (npos - _Mysize <= _Count || _Mysize + _Count < _Mysize)
			_String_base::_Xlen();	

		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Mysize, _Myres - _Mysize,
				_Right._Myptr() + _Roff, _Count);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  append(const _Elem *_Ptr, size_type _Count)
		{	
		if (_Inside(_Ptr))
			return (append(*this, _Ptr - _Myptr(), _Count));	
		if (npos - _Mysize <= _Count || _Mysize + _Count < _Mysize)
			_String_base::_Xlen();	

		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Mysize, _Myres - _Mysize, _Ptr, _Count);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  append(const _Elem *_Ptr)
		{	
		return (append(_Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  append(size_type _Count, _Elem _Ch)
		{	
			if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	

		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	
			_Chassign(_Mysize, _Count, _Ch);
			_Eos(_Num);
			}
		return (*this);
		}

	template<class _It>
		_Myt&  append(_It _First, _It _Last)
		{	
		return (_Append(_First, _Last, _Iter_cat(_First)));
		}

	template<class _It>
		_Myt&  _Append(_It _Count, _It _Ch, _Int_iterator_tag)
		{	
		return (append((size_type)_Count, (_Elem)_Ch));
		}

	template<class _It>
		_Myt&  _Append(_It _First, _It _Last, input_iterator_tag)
		{	
		return (replace(end(), end(), _First, _Last));
		}

	_Myt&  append(const_pointer _First, const_pointer _Last)
		{	
		return (replace(end(), end(), _First, _Last));
		}

	_Myt&  append(const_iterator _First, const_iterator _Last)
		{	
		return (replace(end(), end(), _First, _Last));
		}

	_Myt&  assign(const _Myt& _Right)
		{	
		return (assign(_Right, 0, npos));
		}

	_Myt&  assign(const _Myt& _Right,
		size_type _Roff, size_type _Count)
		{	
		if (_Right.size() < _Roff)
			_String_base::_Xran();	
		size_type _Num = _Right.size() - _Roff;
		if (_Count < _Num)
			_Num = _Count;	

		if (this == &_Right)
			erase((size_type)(_Roff + _Num)), erase(0, _Roff);	
		else if (_Grow(_Num))
			{	
			_Traits_helper::copy_s<_Traits>(_Myptr(), _Myres, _Right._Myptr() + _Roff, _Num);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  assign(const _Elem *_Ptr, size_type _Num)
		{	
		if (_Inside(_Ptr))
			return (assign(*this, _Ptr - _Myptr(), _Num));	

		if (_Grow(_Num))
			{	
			_Traits_helper::copy_s<_Traits>(_Myptr(), _Myres, _Ptr, _Num);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  assign(const _Elem *_Ptr)
		{	
		return (assign(_Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  assign(size_type _Count, _Elem _Ch)
		{	
		if (_Count == npos)
			_String_base::_Xlen();	

		if (_Grow(_Count))
			{	
			_Chassign(0, _Count, _Ch);
			_Eos(_Count);
			}
		return (*this);
		}

	template<class _It>
		_Myt&  assign(_It _First, _It _Last)
		{	
		return (_Assign(_First, _Last, _Iter_cat(_First)));
		}

	template<class _It>
		_Myt&  _Assign(_It _Count, _It _Ch, _Int_iterator_tag)
		{	
		return (assign((size_type)_Count, (_Elem)_Ch));
		}

	template<class _It>
		_Myt&  _Assign(_It _First, _It _Last, input_iterator_tag)
		{	
		return (replace(begin(), end(), _First, _Last));
		}

	_Myt&  assign(const_pointer _First, const_pointer _Last)
		{	
		return (replace(begin(), end(), _First, _Last));
		}

	_Myt&  assign(const_iterator _First, const_iterator _Last)
		{	
		return (replace(begin(), end(), _First, _Last));
		}

	_Myt&  insert(size_type _Off, const _Myt& _Right)
		{	
		return (insert(_Off, _Right, 0, npos));
		}

	_Myt&  insert(size_type _Off,
		const _Myt& _Right, size_type _Roff, size_type _Count)
		{	
		if (_Mysize < _Off || _Right.size() < _Roff)
			_String_base::_Xran();	
		size_type _Num = _Right.size() - _Roff;
		if (_Num < _Count)
			_Count = _Num;	
		if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	

		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off, _Mysize - _Off);	
			if (this == &_Right)
				_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
					_Myptr() + (_Off < _Roff ? _Roff + _Count : _Roff),
						_Count);	
			else
				_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
					_Right._Myptr() + _Roff, _Count);	
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  insert(size_type _Off,
		const _Elem *_Ptr, size_type _Count)
		{	
		if (_Inside(_Ptr))
			return (insert(_Off, *this,
				_Ptr - _Myptr(), _Count));	
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	
		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off, _Mysize - _Off);	
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off, _Ptr, _Count);	
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  insert(size_type _Off, const _Elem *_Ptr)
		{	
		return (insert(_Off, _Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  insert(size_type _Off,
		size_type _Count, _Elem _Ch)
		{	
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	
		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off, _Mysize - _Off);	
			_Chassign(_Off, _Count, _Ch);	
			_Eos(_Num);
			}
		return (*this);
		}

	iterator  insert(iterator _Where)
		{	
		return (insert(_Where, _Elem()));
		}

	iterator  insert(iterator _Where, _Elem _Ch)
		{	
		size_type _Off = _Pdif(_Where, begin());
		insert(_Off, 1, _Ch);
		return (begin() + _Off);
		}

	void  insert(iterator _Where, size_type _Count, _Elem _Ch)
		{	
		size_type _Off = _Pdif(_Where, begin());
		insert(_Off, _Count, _Ch);
		}

	template<class _It>
		void  insert(iterator _Where, _It _First, _It _Last)
		{	
		_Insert(_Where, _First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		void  _Insert(iterator _Where, _It _Count, _It _Ch,
			_Int_iterator_tag)
		{	
		insert(_Where, (size_type)_Count, (_Elem)_Ch);
		}

	template<class _It>
		void  _Insert(iterator _Where, _It _First, _It _Last,
			input_iterator_tag)
		{	
		replace(_Where, _Where, _First, _Last);
		}

	void  insert(iterator _Where, const_pointer _First, const_pointer _Last)
		{	
		replace(_Where, _Where, _First, _Last);
		}

	void  insert(iterator _Where, const_iterator _First, const_iterator _Last)
		{	
		replace(_Where, _Where, _First, _Last);
		}

	_Myt&  erase(size_type _Off = 0,
		size_type _Count = npos)
		{	
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (_Mysize - _Off < _Count)
			_Count = _Mysize - _Off;	
		if (0 < _Count)
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off, _Myptr() + _Off + _Count,
				_Mysize - _Off - _Count);
			size_type _Newsize = _Mysize - _Count;
			_Eos(_Newsize);
			}
		return (*this);
		}

	iterator  erase(iterator _Where)
		{	
		size_type _Count = _Pdif(_Where, begin());
		erase(_Count, 1);
		return (iterator(_Myptr() + _Count, this));
		}

	iterator  erase(iterator _First, iterator _Last)
		{	
		size_type _Count = _Pdif(_First, begin());
		erase(_Count, _Pdif(_Last, _First));
		return (iterator(_Myptr() + _Count, this));
		}

	void  clear()
		{	
		erase(begin(), end());
		}

	_Myt&  replace(size_type _Off, size_type _N0, const _Myt& _Right)
		{	
		return (replace(_Off, _N0, _Right, 0, npos));
		}

	_Myt&  replace(size_type _Off,
		size_type _N0, const _Myt& _Right, size_type _Roff, size_type _Count)
		{	
		if (_Mysize < _Off || _Right.size() < _Roff)
			_String_base::_Xran();	
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	
		size_type _Num = _Right.size() - _Roff;
		if (_Num < _Count)
			_Count = _Num;	
		if (npos - _Count <= _Mysize - _N0)
			_String_base::_Xlen();	

		size_type _Nm = _Mysize - _N0 - _Off;	
		size_type _Newsize = _Mysize + _Count - _N0;
		if (_Mysize < _Newsize)
			_Grow(_Newsize);

		if (this != &_Right)
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Right._Myptr() + _Roff, _Count);	
			}
		else if (_Count <= _N0)
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + _Roff, _Count);	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
			}
		else if (_Roff <= _Off)
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + _Roff, _Count);	
			}
		else if (_Off + _N0 <= _Roff)
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + (_Roff + _Count - _N0), _Count);	
			}
		else
			{	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + _Roff, _N0);	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _N0, _Myres - _Off - _N0, _Myptr() + _Roff + _Count,
				_Count - _N0);	
			}

		_Eos(_Newsize);
		return (*this);
		}

	_Myt&  replace(size_type _Off,
		size_type _N0, const _Elem *_Ptr, size_type _Count)
		{	
		if (_Inside(_Ptr))
			return (replace(_Off, _N0, *this,
				_Ptr - _Myptr(), _Count));	
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	
		if (npos - _Count <= _Mysize - _N0)
			_String_base::_Xlen();	
		size_type _Nm = _Mysize - _N0 - _Off;

		if (_Count < _N0)
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
		size_type _Num;
		if ((0 < _Count || 0 < _N0) && _Grow(_Num = _Mysize + _Count - _N0))
			{	
			if (_N0 < _Count)
				_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
					_Myptr() + _Off + _N0, _Nm);	
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off, _Ptr, _Count);	
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  replace(size_type _Off, size_type _N0, const _Elem *_Ptr)
		{	
		return (replace(_Off, _N0, _Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  replace(size_type _Off,
		size_type _N0, size_type _Count, _Elem _Ch)
		{	
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	
		if (npos - _Count <= _Mysize - _N0)
			_String_base::_Xlen();	
		size_type _Nm = _Mysize - _N0 - _Off;

		if (_Count < _N0)
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	
		size_type _Num;
		if ((0 < _Count || 0 < _N0) && _Grow(_Num = _Mysize + _Count - _N0))
			{	
			if (_N0 < _Count)
				_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
					_Myptr() + _Off + _N0, _Nm);	
			_Chassign(_Off, _Count, _Ch);	
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  replace(iterator _First, iterator _Last, const _Myt& _Right)
		{	
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Right));
		}

	_Myt&  replace(iterator _First, iterator _Last, const _Elem *_Ptr,
		size_type _Count)
		{	
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Ptr, _Count));
		}

	_Myt&  replace(iterator _First, iterator _Last, const _Elem *_Ptr)
		{	
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Ptr));
		}

	_Myt&  replace(iterator _First, iterator _Last,
		size_type _Count, _Elem _Ch)
		{	
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Count, _Ch));
		}

	template<class _It>
		_Myt&  replace(iterator _First, iterator _Last,
			_It _First2, _It _Last2)
		{	
		return (_Replace(_First, _Last,
			_First2, _Last2, _Iter_cat(_First2)));
		}

	template<class _It>
		_Myt&  _Replace(iterator _First, iterator _Last,
			_It _Count, _It _Ch, _Int_iterator_tag)
		{	
		return (replace(_First, _Last, (size_type)_Count, (_Elem)_Ch));
		}

	template<class _It>
		_Myt&  _Replace(iterator _First, iterator _Last,
			_It _First2, _It _Last2, input_iterator_tag)
		{	
		_Myt _Right(_First2, _Last2);
		replace(_First, _Last, _Right);
		return (*this);
		}

	_Myt&  replace(iterator _First, iterator _Last,
		const_pointer _First2, const_pointer _Last2)
		{	
		if (_First2 == _Last2)
			erase(_Pdif(_First, begin()), _Pdif(_Last, _First));
		else
			replace(_Pdif(_First, begin()), _Pdif(_Last, _First),
				&*_First2, _Last2 - _First2);
		return (*this);
		}

	_Myt&  replace(iterator _First, iterator _Last,
		const_iterator _First2, const_iterator _Last2)
		{	
		if (_First2 == _Last2)
			erase(_Pdif(_First, begin()), _Pdif(_Last, _First));
		else
			replace(_Pdif(_First, begin()), _Pdif(_Last, _First),
				&*_First2, _Last2 - _First2);
		return (*this);
		}

	iterator  begin()
		{	
		return (iterator(_Myptr(), this));
		}

	const_iterator  begin() const
		{	
		return (const_iterator(_Myptr(), this));
		}

	iterator  end()
		{	
		return (iterator(_Myptr() + _Mysize, this));
		}

	const_iterator  end() const
		{	
		return (const_iterator(_Myptr() + _Mysize, this));
		}

	reverse_iterator  rbegin()
		{	
		return (reverse_iterator(end()));
		}

	const_reverse_iterator  rbegin() const
		{	
		return (const_reverse_iterator(end()));
		}

	reverse_iterator  rend()
		{	
		return (reverse_iterator(begin()));
		}

	const_reverse_iterator  rend() const
		{	
		return (const_reverse_iterator(begin()));
		}

	reference  at(size_type _Off)
		{	
		if (_Mysize <= _Off)
			_String_base::_Xran();	
		return (_Myptr()[_Off]);
		}

	const_reference  at(size_type _Off) const
		{	
		if (_Mysize <= _Off)
			_String_base::_Xran();	
		return (_Myptr()[_Off]);
		}
	reference  operator[](size_type _Off)
		{	

		{ if (!(_Off <= _Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (_Myptr()[_Off]);
		}

	const_reference  operator[](size_type _Off) const
		{	

		{ if (!(_Off <= _Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (_Myptr()[_Off]);
		}
	void  push_back(_Elem _Ch)
		{	
		insert(end(), _Ch);
		}

	const _Elem * c_str() const
		{	
		return (_Myptr());
		}

	const _Elem * data() const
		{	
		return (c_str());
		}

	size_type  length() const
		{	
		return (_Mysize);
		}

	size_type  size() const
		{	
		return (_Mysize);
		}

	size_type  max_size() const
		{	
		size_type _Num = _Mybase::_Alval.max_size();
		return (_Num <= 1 ? 1 : _Num - 1);
		}

	void  resize(size_type _Newsize)
		{	
		resize(_Newsize, _Elem());
		}

	void  resize(size_type _Newsize, _Elem _Ch)
		{	
		if (_Newsize <= _Mysize)
			erase(_Newsize);
		else
			append(_Newsize - _Mysize, _Ch);
		}

	size_type  capacity() const
		{	
		return (_Myres);
		}

	void  reserve(size_type _Newcap = 0)
		{	
		if (_Mysize <= _Newcap && _Myres != _Newcap)
			{	
			size_type _Size = _Mysize;
			if (_Grow(_Newcap, true))
				_Eos(_Size);
			}
		}

	bool  empty() const
		{	
		return (_Mysize == 0);
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	size_type  copy(_Elem *_Dest,
		size_type _Count, size_type _Off = 0) const
		{	
		
		return _Copy_s(_Dest, _Count, _Count, _Off);
		}

	size_type  _Copy_s(_Elem *_Dest, size_type _Dest_size,
		size_type _Count, size_type _Off = 0) const
		{	
		;
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (_Mysize - _Off < _Count)
			_Count = _Mysize - _Off;
		_Traits_helper::copy_s<_Traits>(_Dest, _Dest_size, _Myptr() + _Off, _Count);
		return (_Count);
		}

	void  swap(_Myt& _Right)
		{	
		if (_Mybase::_Alval == _Right._Alval)
			{	
			_Bxty _Tbx = _Bx;
			_Bx = _Right._Bx, _Right._Bx = _Tbx;

			size_type _Tlen = _Mysize;
			_Mysize = _Right._Mysize, _Right._Mysize = _Tlen;

			size_type _Tres = _Myres;
			_Myres = _Right._Myres, _Right._Myres = _Tres;
			}
		else
			{	
			_Myt _Tmp = *this; *this = _Right, _Right = _Tmp;
			}
		}

	size_type  find(const _Myt& _Right, size_type _Off = 0) const
		{	
		return (find(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	
		;
		if (_Count == 0 && _Off <= _Mysize)
			return (_Off);	

		size_type _Nm;
		if (_Off < _Mysize && _Count <= (_Nm = _Mysize - _Off))
			{	
			const _Elem *_Uptr, *_Vptr;
			for (_Nm -= _Count - 1, _Vptr = _Myptr() + _Off;
				(_Uptr = _Traits::find(_Vptr, _Nm, *_Ptr)) != 0;
				_Nm -= _Uptr - _Vptr + 1, _Vptr = _Uptr + 1)
				if (_Traits::compare(_Uptr, _Ptr, _Count) == 0)
					return (_Uptr - _Myptr());	
			}

		return (npos);	
		}

	size_type  find(const _Elem *_Ptr, size_type _Off = 0) const
		{	
		return (find(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find(_Elem _Ch, size_type _Off = 0) const
		{	
		return (find((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  rfind(const _Myt& _Right, size_type _Off = npos) const
		{	
		return (rfind(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  rfind(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	
		;
		if (_Count == 0)
			return (_Off < _Mysize ? _Off : _Mysize);	
		if (_Count <= _Mysize)
			{	
			const _Elem *_Uptr = _Myptr() +
				(_Off < _Mysize - _Count ? _Off : _Mysize - _Count);
			for (; ; --_Uptr)
				if (_Traits::eq(*_Uptr, *_Ptr)
					&& _Traits::compare(_Uptr, _Ptr, _Count) == 0)
					return (_Uptr - _Myptr());	
				else if (_Uptr == _Myptr())
					break;	
			}

		return (npos);	
		}

	size_type  rfind(const _Elem *_Ptr, size_type _Off = npos) const
		{	
		return (rfind(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  rfind(_Elem _Ch, size_type _Off = npos) const
		{	
		return (rfind((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_first_of(const _Myt& _Right,
		size_type _Off = 0) const
		{	
		return (find_first_of(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find_first_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	
		;
		if (0 < _Count && _Off < _Mysize)
			{	
			const _Elem *const _Vptr = _Myptr() + _Mysize;
			for (const _Elem *_Uptr = _Myptr() + _Off; _Uptr < _Vptr; ++_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) != 0)
					return (_Uptr - _Myptr());	
			}

		return (npos);	
		}

	size_type  find_first_of(const _Elem *_Ptr, size_type _Off = 0) const
		{	
		return (find_first_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_first_of(_Elem _Ch, size_type _Off = 0) const
		{	
		return (find((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_last_of(const _Myt& _Right,
		size_type _Off = npos) const
		{	
		return (find_last_of(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find_last_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	
		;
		if (0 < _Count && 0 < _Mysize)
			for (const _Elem *_Uptr = _Myptr()
				+ (_Off < _Mysize ? _Off : _Mysize - 1); ; --_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) != 0)
					return (_Uptr - _Myptr());	
				else if (_Uptr == _Myptr())
					break;	

		return (npos);	
		}

	size_type  find_last_of(const _Elem *_Ptr,
		size_type _Off = npos) const
		{	
		return (find_last_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_last_of(_Elem _Ch, size_type _Off = npos) const
		{	
		return (rfind((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_first_not_of(const _Myt& _Right,
		size_type _Off = 0) const
		{	
		return (find_first_not_of(_Right._Myptr(), _Off,
			_Right.size()));
		}

	size_type  find_first_not_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	
		;
		if (_Off < _Mysize)
			{	
			const _Elem *const _Vptr = _Myptr() + _Mysize;
			for (const _Elem *_Uptr = _Myptr() + _Off; _Uptr < _Vptr; ++_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) == 0)
					return (_Uptr - _Myptr());
			}
		return (npos);
		}

	size_type  find_first_not_of(const _Elem *_Ptr,
		size_type _Off = 0) const
		{	
		return (find_first_not_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_first_not_of(_Elem _Ch, size_type _Off = 0) const
		{	
		return (find_first_not_of((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_last_not_of(const _Myt& _Right,
		size_type _Off = npos) const
		{	
		return (find_last_not_of(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find_last_not_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	
		;
		if (0 < _Mysize)
			for (const _Elem *_Uptr = _Myptr()
				+ (_Off < _Mysize ? _Off : _Mysize - 1); ; --_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) == 0)
					return (_Uptr - _Myptr());
				else if (_Uptr == _Myptr())
					break;
		return (npos);
		}

	size_type  find_last_not_of(const _Elem *_Ptr,
		size_type _Off = npos) const
		{	
		return (find_last_not_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_last_not_of(_Elem _Ch, size_type _Off = npos) const
		{	
		return (find_last_not_of((const _Elem *)&_Ch, _Off, 1));
		}

	_Myt  substr(size_type _Off = 0, size_type _Count = npos) const
		{	
		return (_Myt(*this, _Off, _Count));
		}

	int  compare(const _Myt& _Right) const
		{	
		return (compare(0, _Mysize, _Right._Myptr(), _Right.size()));
		}

	int  compare(size_type _Off, size_type _N0,
		const _Myt& _Right) const
		{	
		return (compare(_Off, _N0, _Right, 0, npos));
		}

	int  compare(size_type _Off,
		size_type _N0, const _Myt& _Right,
		size_type _Roff, size_type _Count) const
		{	
		if (_Right.size() < _Roff)
			_String_base::_Xran();	
		if (_Right._Mysize - _Roff < _Count)
			_Count = _Right._Mysize - _Roff;	
		return (compare(_Off, _N0, _Right._Myptr() + _Roff, _Count));
		}

	int  compare(const _Elem *_Ptr) const
		{	
		return (compare(0, _Mysize, _Ptr, _Traits::length(_Ptr)));
		}

	int  compare(size_type _Off, size_type _N0, const _Elem *_Ptr) const
		{	
		return (compare(_Off, _N0, _Ptr, _Traits::length(_Ptr)));
		}

	int  compare(size_type _Off,
		size_type _N0, const _Elem *_Ptr, size_type _Count) const
		{	
		;
		if (_Mysize < _Off)
			_String_base::_Xran();	
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	

		size_type _Ans = _Traits::compare(_Myptr() + _Off, _Ptr,
			_N0 < _Count ? _N0 : _Count);
		return (_Ans != 0 ? (int)_Ans : _N0 < _Count ? -1
			: _N0 == _Count ? 0 : +1);
		}

	allocator_type  get_allocator() const
		{	
		return (_Mybase::_Alval);
		}

	enum
		{	
		_BUF_SIZE = 16 / sizeof (_Elem) < 1 ? 1
			: 16 / sizeof(_Elem)};

protected:
	enum
		{	
		_ALLOC_MASK = sizeof (_Elem) <= 1 ? 15
			: sizeof (_Elem) <= 2 ? 7
			: sizeof (_Elem) <= 4 ? 3
			: sizeof (_Elem) <= 8 ? 1 : 0};

	void  _Chassign(size_type _Off, size_type _Count, _Elem _Ch)
		{	
		if (_Count == 1)
			_Traits::assign(*(_Myptr() + _Off), _Ch);
		else
			_Traits::assign(_Myptr() + _Off, _Count, _Ch);
		}

	void  _Copy(size_type _Newsize, size_type _Oldlen)
		{	
		size_type _Newres = _Newsize | _ALLOC_MASK;
		if (max_size() < _Newres)
			_Newres = _Newsize;	
		else if (_Newres / 3 < _Myres / 2
			&& _Myres <= max_size() - _Myres / 2)
			_Newres = _Myres + _Myres / 2;	
		_Elem *_Ptr = 0;

		try {
			_Ptr = _Mybase::_Alval.allocate(_Newres + 1);
		} catch (...) {
			_Newres = _Newsize;	
			try {
				_Ptr = _Mybase::_Alval.allocate(_Newres + 1);
			} catch (...) {
			_Tidy(true);	
			throw;
			}
		}

		if (0 < _Oldlen)
			_Traits_helper::copy_s<_Traits>(_Ptr, _Newres + 1, _Myptr(), _Oldlen);	
		_Tidy(true);
		_Bx._Ptr = _Ptr;
		_Myres = _Newres;
		_Eos(_Oldlen);
		}

	void  _Eos(size_type _Newsize)
		{	
		_Traits::assign(_Myptr()[_Mysize = _Newsize], _Elem());
		}

	bool  _Grow(size_type _Newsize,
		bool _Trim = false)
		{	
			if (max_size() < _Newsize)
			_String_base::_Xlen();	
		if (_Myres < _Newsize)
			_Copy(_Newsize, _Mysize);	
		else if (_Trim && _Newsize < _BUF_SIZE)
			_Tidy(true,	
				_Newsize < _Mysize ? _Newsize : _Mysize);
		else if (_Newsize == 0)
			_Eos(0);	
		return (0 < _Newsize);	
		}

	bool  _Inside(const _Elem *_Ptr)
		{	
		;
		if (_Ptr < _Myptr() || _Myptr() + _Mysize <= _Ptr)
			return (false);	
		else
			return (true);
		}

	static size_type __cdecl _Pdif(const_iterator _P2,
		const_iterator _P1)
		{	
		return ((_P2)._Myptr == 0 ? 0 : _P2 - _P1);
		}

	void  _Tidy(bool _Built = false,
		size_type _Newsize = 0)
		{	
		if (!_Built)
			;
		else if (_BUF_SIZE <= _Myres)
			{	
			_Elem *_Ptr = _Bx._Ptr;
			if (0 < _Newsize)
				_Traits_helper::copy_s<_Traits>(_Bx._Buf, _BUF_SIZE, _Ptr, _Newsize);
			_Mybase::_Alval.deallocate(_Ptr, _Myres + 1);
			}
		_Myres = _BUF_SIZE - 1;
		_Eos(_Newsize);
		}

	union _Bxty
		{	
		_Elem _Buf[_BUF_SIZE];
		_Elem *_Ptr;
		} _Bx;

	_Elem * _Myptr()
		{	
		return (_BUF_SIZE <= _Myres ? _Bx._Ptr : _Bx._Buf);
		}

	const _Elem * _Myptr() const
		{	
		return (_BUF_SIZE <= _Myres ? _Bx._Ptr : _Bx._Buf);
		}

	size_type _Mysize;	
	size_type _Myres;	
	};

	
template<class _Elem, class _Traits, class _Ax>
	class _Move_operation_category<basic_string<_Elem, _Traits, _Ax> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

		
template<class _Elem,
	class _Traits,
	class _Alloc>
	 const typename basic_string<_Elem, _Traits, _Alloc>::size_type
		basic_string<_Elem, _Traits, _Alloc>::npos =
			(typename basic_string<_Elem, _Traits, _Alloc>::size_type)(-1);

		

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	void __cdecl swap(basic_string<_Elem, _Traits, _Alloc>& _Left,
		basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	_Left.swap(_Right);
	}

typedef basic_string<char, char_traits<char>, allocator<char> >
	string;
typedef basic_string<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wstring;
template class __declspec(dllimport) allocator<char>;
template class __declspec(dllimport) allocator<wchar_t>;
template class __declspec(dllimport) _String_val<char, allocator<char> >;
template class __declspec(dllimport) _String_val<wchar_t, allocator<wchar_t> >;
template class __declspec(dllimport) basic_string<char, char_traits<char>,
	allocator<char> >;
template class __declspec(dllimport) basic_string<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> >;

}

 #pragma warning(default: 4251)
#pragma warning(pop)
#pragma pack(pop)

#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
class logic_error
	: public std:: exception
	{	
public:
	explicit  logic_error(const string& _Message)
		: _Str(_Message)
		{	
		}

	virtual  ~logic_error() throw ()
		{	
		}

	virtual const char * what() const throw ()
		{	
		return (_Str.c_str());
		}
private:
	string _Str;	
	};

		
class domain_error
	: public logic_error
	{	
public:
	explicit  domain_error(const string& _Message)
		: logic_error(_Message)
		{	
		}

	virtual  ~domain_error() throw ()
		{	
		}
	};

		
class invalid_argument
	: public logic_error
	{	
public:
	explicit  invalid_argument(const string& _Message)
		: logic_error(_Message)
		{	
		}

	virtual  ~invalid_argument() throw ()
		{	
		}
	};

		
class length_error
	: public logic_error
	{	
public:
	explicit  length_error(const string& _Message)
		: logic_error(_Message)
		{	
		}

	virtual  ~length_error() throw ()
		{	
		}
	};

		
class out_of_range
	: public logic_error
	{	
public:
	explicit  out_of_range(const string& _Message)
		: logic_error(_Message)
		{	
		}

	virtual  ~out_of_range() throw ()
		{	
		}
	};

		
class runtime_error
	: public std:: exception
	{	
public:
	explicit  runtime_error(const string& _Message)
		: _Str(_Message)
		{	
		}

	virtual  ~runtime_error() throw ()
		{	
		}

	virtual const char * what() const throw ()
		{	
		return (_Str.c_str());
		}
private:
	string _Str;	
	};

		
class overflow_error
	: public runtime_error
	{	
public:
	explicit  overflow_error(const string& _Message)
		: runtime_error(_Message)
		{	
		}

	virtual  ~overflow_error() throw ()
		{	
		}
	};

		
class underflow_error
	: public runtime_error
	{	
public:
	explicit  underflow_error(const string& _Message)
		: runtime_error(_Message)
		{	
		}

	virtual  ~underflow_error() throw ()
		{	
		}
	};

		
class range_error
	: public runtime_error
	{	
public:
	explicit  range_error(const string& _Message)
		: runtime_error(_Message)
		{	
		}

	virtual  ~range_error() throw ()
		{	
		}
	};
}
#pragma warning(pop)
#pragma pack(pop)
#pragma once
#pragma pack(push,8)

struct __type_info_node {
    void *memPtr;
    __type_info_node* next;
};

extern __type_info_node __type_info_root_node;

class type_info {
public:
    virtual ~type_info();
    __declspec(dllimport) bool  operator==(const type_info& rhs) const;
    __declspec(dllimport) bool  operator!=(const type_info& rhs) const;
    __declspec(dllimport) int  before(const type_info& rhs) const;
    __declspec(dllimport) const char*  name(__type_info_node* __ptype_info_node = &__type_info_root_node) const;
    __declspec(dllimport) const char*  raw_name() const;
private:
    void *_m_data;
    char _m_d_name[1];
     type_info(const type_info& rhs);
    type_info&  operator=(const type_info& rhs);
    __declspec(dllimport) static const char *__cdecl _Name_base(const type_info *,__type_info_node* __ptype_info_node);
    __declspec(dllimport) static void __cdecl _Type_info_dtor(type_info *);
};
 namespace std {

using ::type_info;

 }

 namespace std {

class __declspec(dllimport) bad_cast : public exception {
public:
     bad_cast(const char * _Message = "bad cast");
     bad_cast(const bad_cast &);
    virtual  ~bad_cast();

};

class __declspec(dllimport) bad_typeid : public exception {
public:
     bad_typeid(const char * _Message = "bad typeid");
     bad_typeid(const bad_typeid &);
    virtual  ~bad_typeid();
};

class __declspec(dllimport) __non_rtti_object : public bad_typeid {
public:
     __non_rtti_object(const char * _Message);
     __non_rtti_object(const __non_rtti_object &);
    virtual  ~__non_rtti_object();

};

 }

#pragma pack(pop)

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {
struct _DebugHeapTag_t
	{	
	int _Type;
	};
}

		
#pragma warning(pop)
#pragma pack(pop)

#pragma once

#pragma once

#pragma once
extern "C" {
__declspec(dllimport)  int __cdecl _isctype(     int _C,      int _Type);
__declspec(dllimport)  int __cdecl _isctype_l(     int _C,      int _Type,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl isalpha(     int _C);
__declspec(dllimport)  int __cdecl _isalpha_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl isupper(     int _C);
__declspec(dllimport)  int __cdecl _isupper_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl islower(     int _C);
__declspec(dllimport)  int __cdecl _islower_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl isdigit(     int _C);
__declspec(dllimport)  int __cdecl _isdigit_l(     int _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl isxdigit(     int _C);
__declspec(dllimport)  int __cdecl _isxdigit_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl isspace(     int _C);
__declspec(dllimport)  int __cdecl _isspace_l(     int _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl ispunct(     int _C);
__declspec(dllimport)  int __cdecl _ispunct_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl isalnum(     int _C);
__declspec(dllimport)  int __cdecl _isalnum_l(     int _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl isprint(     int _C);
__declspec(dllimport)  int __cdecl _isprint_l(     int _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl isgraph(     int _C);
__declspec(dllimport)  int __cdecl _isgraph_l(     int _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl iscntrl(     int _C);
__declspec(dllimport)  int __cdecl _iscntrl_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl toupper(     int _C);
 __declspec(dllimport)  int __cdecl tolower(     int _C);
 __declspec(dllimport)  int __cdecl _tolower(     int _C);
__declspec(dllimport)  int __cdecl _tolower_l(     int _C,        _locale_t _Locale);
 __declspec(dllimport)  int __cdecl _toupper(     int _C);
__declspec(dllimport)  int __cdecl _toupper_l(     int _C,        _locale_t _Locale);
__declspec(dllimport)  int __cdecl __isascii(     int _C);
__declspec(dllimport)  int __cdecl __toascii(     int _C);
__declspec(dllimport)  int __cdecl __iscsymf(     int _C);
__declspec(dllimport)  int __cdecl __iscsym(     int _C);

}
#pragma once
#pragma pack(push,8)
extern "C" {
struct lconv {
        char *decimal_point;
        char *thousands_sep;
        char *grouping;
        char *int_curr_symbol;
        char *currency_symbol;
        char *mon_decimal_point;
        char *mon_thousands_sep;
        char *mon_grouping;
        char *positive_sign;
        char *negative_sign;
        char int_frac_digits;
        char frac_digits;
        char p_cs_precedes;
        char p_sep_by_space;
        char n_cs_precedes;
        char n_sep_by_space;
        char p_sign_posn;
        char n_sign_posn;
        };
__declspec(dllimport)  int __cdecl _configthreadlocale(     int _Flag);
__declspec(dllimport)  char * __cdecl setlocale(     int _Category,          const char * _Locale);
__declspec(dllimport)  struct lconv * __cdecl localeconv(void);
__declspec(dllimport)  _locale_t __cdecl _get_current_locale(void);
__declspec(dllimport)  _locale_t __cdecl _create_locale(     int _Category,        const char * _Locale);
__declspec(dllimport) void __cdecl _free_locale(       _locale_t _Locale);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "_get_current_locale" "instead. See online help for details.")) __declspec(dllimport)  _locale_t __cdecl __get_current_locale(void);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "_create_locale" "instead. See online help for details.")) __declspec(dllimport)  _locale_t __cdecl __create_locale(     int _Category,        const char * _Locale);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using" "_free_locale" "instead. See online help for details.")) __declspec(dllimport) void __cdecl __free_locale(       _locale_t _Locale);
}
#pragma pack(pop)
#pragma pack(push,8)
extern "C" {
		
		
typedef struct _Collvec
	{	
	unsigned long _Hand;	
	unsigned int _Page;		
	} _Collvec;

typedef struct _Ctypevec
	{	
	unsigned long _Hand;	
	unsigned int _Page;		
	const short *_Table;
	int _Delfl;
	} _Ctypevec;

typedef struct _Cvtvec
	{	
	unsigned long _Hand;	
	unsigned int _Page;		
	} _Cvtvec;

		
__declspec(dllimport) _Collvec __cdecl _Getcoll();
__declspec(dllimport) _Ctypevec __cdecl _Getctype();
__declspec(dllimport) _Cvtvec __cdecl _Getcvt();

__declspec(dllimport) int __cdecl _Getdateorder();

__declspec(dllimport) int __cdecl _Mbrtowc(       wchar_t *, const char *, size_t,
	mbstate_t *, const _Cvtvec *);
__declspec(dllimport) float __cdecl _Stof(const char *,                     char **, long);
__declspec(dllimport) double __cdecl _Stod(const char *,                     char **, long);
__declspec(dllimport) long double __cdecl _Stold(const char *,                     char **,
  long);
__declspec(dllimport) int __cdecl _Strcoll(const char *, const char *,
	const char *, const char *, const _Collvec *);
__declspec(dllimport) size_t __cdecl _Strxfrm(
         char * _String1,
         char * _End1, const char *, const char *, const _Collvec *);
__declspec(dllimport) int __cdecl _Tolower(int, const _Ctypevec *);
__declspec(dllimport) int __cdecl _Toupper(int, const _Ctypevec *);
__declspec(dllimport) int __cdecl _Wcrtomb(     char *, wchar_t, mbstate_t *,
	const _Cvtvec *);
__declspec(dllimport) int __cdecl _Wcscoll(const wchar_t *, const wchar_t *,
	const wchar_t *, const wchar_t *, const _Collvec *);
__declspec(dllimport) size_t __cdecl _Wcsxfrm(
         wchar_t *_String1,
         wchar_t *_End1, const wchar_t *, const wchar_t *, const _Collvec *);

__declspec(dllimport) short __cdecl _Getwctype(wchar_t, const _Ctypevec *);
__declspec(dllimport) const wchar_t * __cdecl _Getwctypes(const wchar_t *, const wchar_t *,
	short*, const _Ctypevec*);
__declspec(dllimport) wchar_t __cdecl _Towlower(wchar_t, const _Ctypevec *);
__declspec(dllimport) wchar_t __cdecl _Towupper(wchar_t, const _Ctypevec *);

}
extern "C" {
__declspec(dllimport) void *__cdecl _Gettnames();
__declspec(dllimport) char *__cdecl _Getdays();
__declspec(dllimport) char *__cdecl _Getmonths();
__declspec(dllimport) size_t __cdecl _Strftime(
       char *,      size_t _Maxsize,
          const char *,      const struct tm *, void *);
}

extern "C" {
_locale_t __cdecl _GetLocaleForCP(unsigned int);
}
#pragma pack(pop)

#pragma pack(push,8)
#pragma warning(push,3)
#pragma warning(disable:4412)
namespace std {

		
class __declspec(dllimport) _Timevec
	{	
public:
	 _Timevec(void *_Ptr = 0)
		: _Timeptr(_Ptr)
		{	
		}

	 _Timevec(const _Timevec& _Right)
		{	
		*this = _Right;
		}

	 ~_Timevec()
		{	
		free(_Timeptr);
		}

	_Timevec&  operator=(const _Timevec& _Right)
		{	
		_Timeptr = _Right._Timeptr;
		((_Timevec *)&_Right)->_Timeptr = 0;
		return (*this);
		}

	void * _Getptr() const
		{	
		return (_Timeptr);
		}

private:
	void *_Timeptr;	
	};

		
#pragma warning(push)
#pragma warning(disable:4412)
class __declspec(dllimport) _Locinfo
	{	
public:
	typedef ::_Collvec _Collvec;
	typedef ::_Ctypevec _Ctypevec;
	typedef ::_Cvtvec _Cvtvec;
	typedef std::_Timevec _Timevec;

    static  void __cdecl _Locinfo_ctor(_Locinfo *, const char *);
    static  void __cdecl _Locinfo_ctor(_Locinfo *, int, const char *);
    static  void __cdecl _Locinfo_dtor(_Locinfo *);
    static  _Locinfo& __cdecl _Locinfo_Addcats(_Locinfo *, int, const char *);

	 _Locinfo(const char *_Pch = "C")

        : _Lock(0)

        {
        if (_Pch == 0)
            throw runtime_error("bad locale name");
        _Locinfo_ctor(this, _Pch);
        }

	 _Locinfo(int _I, const char *_Pch)

        : _Lock(0)

        {
        if (_Pch == 0)
            throw runtime_error("bad locale name");
        _Locinfo_ctor(this, _I, _Pch);
        }

	 ~_Locinfo()
        {
        _Locinfo_dtor(this);
        }

	_Locinfo&  _Addcats(int _I, const char *_Pch)
		{
		if (_Pch == 0)
			throw runtime_error("bad locale name");
		return _Locinfo_Addcats(this, _I, _Pch);
		}

	string  _Getname() const
		{	
		return (_Newlocname);
		}

	_Collvec  _Getcoll() const
		{	
		return (::_Getcoll());
		}

	_Ctypevec  _Getctype() const
		{	
		return (::_Getctype());
		}

	_Cvtvec  _Getcvt() const
		{	
		return (::_Getcvt());
		}

	const lconv * _Getlconv() const
		{	
		return (localeconv());
		}

	_Timevec  _Gettnames() const
		{	
		return (_Timevec(::_Gettnames()));
		}

	const char * _Getdays() const
		{	
		const char *_Ptr = ::_Getdays();
		if (_Ptr != 0)
			{	
			((_Locinfo *)this)->_Days = _Ptr;
			free((void *)_Ptr);
			}
		return (_Days.size() != 0 ? _Days.c_str()
			: ":Sun:Sunday:Mon:Monday:Tue:Tuesday:Wed:Wednesday"
				":Thu:Thursday:Fri:Friday:Sat:Saturday");
		}

	const char * _Getmonths() const
		{	
		const char *_Ptr = ::_Getmonths();
		if (_Ptr != 0)
			{	
			((_Locinfo *)this)->_Months = _Ptr;
			free((void *)_Ptr);
			}
		return (_Months.size() != 0 ? _Months.c_str()
			: ":Jan:January:Feb:February:Mar:March"
				":Apr:April:May:May:Jun:June"
				":Jul:July:Aug:August:Sep:September"
				":Oct:October:Nov:November:Dec:December");
		}

	const char * _Getfalse() const
		{	
		return ("false");
		}

	const char * _Gettrue() const
		{	
		return ("true");
		}

	int  _Getdateorder() const
		{	
		return ::_Getdateorder();
		}

private:

	_Lockit _Lock;	

	string _Days;	
	string _Months;	
	string _Oldlocname;	
	string _Newlocname;	
	};
#pragma warning(pop)

		
template<class _Elem> inline
	int __cdecl _LStrcoll(const _Elem *_First1, const _Elem *_Last1,
		const _Elem *_First2, const _Elem *_Last2,
			const _Locinfo::_Collvec *)
	{	
	for (; _First1 != _Last1 && _First2 != _Last2; ++_First1, ++_First2)
		if (*_First1 < *_First2)
			return (-1);	
		else if (*_First2 < *_First1)
			return (+1);	
	return (_First2 != _Last2 ? -1 : _First1 != _Last1 ? +1 : 0);
	}

template<> inline
	int __cdecl _LStrcoll(const char *_First1, const char *_Last1,
		const char *_First2, const char *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	
	return (_Strcoll(_First1, _Last1, _First2, _Last2, _Vector));
	}

template<> inline
	int __cdecl _LStrcoll(const wchar_t *_First1, const wchar_t *_Last1,
		const wchar_t *_First2, const wchar_t *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	
	return (_Wcscoll(_First1, _Last1, _First2, _Last2, _Vector));
	}

		
template<class _Elem> inline
	size_t __cdecl _LStrxfrm(_Elem *_First1, _Elem *_Last1,
		const _Elem *_First2, const _Elem *_Last2,
			const _Locinfo::_Collvec *)
	{	
	size_t _Count = _Last2 - _First2;
	if (_Count <= (size_t)(_Last1 - _First1))
		::memcpy_s((_First1), ((_Last1 - _First1)* sizeof(_Elem)), (_First2), (_Count * sizeof (_Elem)));
	return (_Count);
	}

template<> inline
	size_t __cdecl _LStrxfrm(
		       char *_First1,
		       char *_Last1,
		const char *_First2, const char *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	
	return (_Strxfrm(_First1, _Last1, _First2, _Last2, _Vector));
	}

template<> inline
	size_t __cdecl _LStrxfrm(
		       wchar_t *_First1,
		       wchar_t *_Last1,
		const wchar_t *_First2, const wchar_t *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	
	return (_Wcsxfrm(_First1, _Last1, _First2, _Last2, _Vector));
	}
}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
#pragma warning(disable:4412)
namespace std {

		
template<class _Dummy>
	class _Locbase
	{	
public:
	 static const int collate = ((1 << (1)) >> 1);
	 static const int ctype = ((1 << (2)) >> 1);
	 static const int monetary = ((1 << (3)) >> 1);
	 static const int numeric = ((1 << (4)) >> 1);
	 static const int time = ((1 << (5)) >> 1);
	 static const int messages = ((1 << (6)) >> 1);
	 static const int all = (((1 << (7)) >> 1) - 1);
	 static const int none = 0;
	};

template<class _Dummy>
	const int _Locbase<_Dummy>::collate;
template<class _Dummy>
	const int _Locbase<_Dummy>::ctype;
template<class _Dummy>
	const int _Locbase<_Dummy>::monetary;
template<class _Dummy>
	const int _Locbase<_Dummy>::numeric;
template<class _Dummy>
	const int _Locbase<_Dummy>::time;
template<class _Dummy>
	const int _Locbase<_Dummy>::messages;
template<class _Dummy>
	const int _Locbase<_Dummy>::all;
template<class _Dummy>
	const int _Locbase<_Dummy>::none;

		
class locale;
template<class _Facet>
	const _Facet& __cdecl use_facet(const locale&);
#pragma warning(push)
#pragma warning(disable:4412)
class __declspec(dllimport) locale
	: public _Locbase<int>
	{	
public:
	typedef int category;

			
	class __declspec(dllimport) id
		{	
	public:
		 id(size_t _Val = 0)
			: _Id(_Val)
			{	
			}

		 operator size_t()
			{	
			if (_Id == 0)
				{	
				{ ::std:: _Lockit _Lock(0);
					if (_Id == 0)
						_Id = ++_Id_cnt;
				}
				}
			return (_Id);
			}

	private:
		 id(const id&);	
		id&  operator=(const id&);	

		size_t _Id;	
		static  int& __cdecl _Id_cnt_func();
		 static int _Id_cnt;	

		};

	class _Locimp;

			
	class __declspec(dllimport) facet
		{	
		friend class locale;
		friend class _Locimp;

	public:
		static size_t __cdecl _Getcat(const facet ** = 0)
			{	
			return ((size_t)(-1));
			}

		void  _Incref()
			{	
			{ ::std:: _Lockit _Lock(0);
				if (_Refs < (size_t)(-1))
					++_Refs;
			}
			}

		facet * _Decref()
			{	
			{ ::std:: _Lockit _Lock(0);
				if (0 < _Refs && _Refs < (size_t)(-1))
					--_Refs;
				return (_Refs == 0 ? this : 0);
			}
			}

		void  _Register()
			{
			facet_Register(this);
			}

		virtual  ~facet()
			{	
			}

	protected:
		explicit  facet(size_t _Initrefs = 0)
			: _Refs(_Initrefs)
			{	
			}

	private:
		 static void __cdecl facet_Register(facet *);	

		 facet(const facet&);	
		facet&  operator=(const facet&);	

		size_t _Refs;	
		};

			
	class __declspec(dllimport) _Locimp
		: public facet
		{	
	protected:
		 ~_Locimp()
			{
			_Locimp_dtor(this);
			}

	private:
		static  void __cdecl _Locimp_dtor(_Locimp *);
		static  void __cdecl _Locimp_ctor(_Locimp *,const _Locimp&);	
		static  void __cdecl _Locimp_Addfac(_Locimp *,facet *, size_t);	
		friend class locale;

		 _Locimp(bool _Transparent = false)
			: locale::facet(1), _Facetvec(0), _Facetcount(0),
				_Catmask(none), _Xparent(_Transparent), _Name("*")
			{ }
		
		 _Locimp(const _Locimp& _Right)
			: locale::facet(1), _Facetvec(0), _Facetcount(_Right._Facetcount),
				_Catmask(_Right._Catmask), _Xparent(_Right._Xparent), _Name(_Right._Name)
			{
			_Locimp_ctor(this, _Right);
			}
		
		void  _Addfac(facet *_Pfacet, size_t _Id)
			{
			_Locimp_Addfac(this, _Pfacet, _Id);
			}

		static  _Locimp *__cdecl _Makeloc(const _Locinfo&,
			category, _Locimp *, const locale *);	

		static  void __cdecl _Makewloc(const _Locinfo&,
			category, _Locimp *, const locale *);	
		static  void __cdecl _Makeushloc(const _Locinfo&,
			category, _Locimp *, const locale *);	
		static  void __cdecl _Makexloc(const _Locinfo&,
			category, _Locimp *, const locale *);	

		facet **_Facetvec;	
		size_t _Facetcount;	
		category _Catmask;	
		bool _Xparent;	
		string _Name;	

		static  _Locimp *& __cdecl _Clocptr_func();	
		 static _Locimp *_Clocptr;	

private:
		_Locimp&  operator=(const _Locimp&);	
	
		};

	__declspec(deprecated("This is an obsolete part of the Standard C++ Library Implementation. Do not use it.")) locale&  _Addfac(facet *_Fac, size_t _Id,
		size_t _Catmask)
		{
		if (1 < this->_Ptr->_Refs)
			{	
			this->_Ptr->_Decref();
			this->_Ptr = new _Locimp(*this->_Ptr);
			}
		this->_Ptr->_Addfac(_Fac, _Id);

		if (_Catmask != 0)
			this->_Ptr->_Name = "*";
		return (*this);
		}

	template<class _Elem,
		class _Traits,
		class _Alloc>
		bool  operator()(const basic_string<_Elem, _Traits, _Alloc>& _Left,
			const basic_string<_Elem, _Traits, _Alloc>& _Right) const
		{	
		const std::collate<_Elem>& _Coll_fac =
			std::use_facet<std::collate<_Elem> >(*this);

		return (_Coll_fac.compare(_Left.c_str(), _Left.c_str() + _Left.size(),
			_Right.c_str(), _Right.c_str() + _Right.size()) < 0);
		}

	template<class _Facet>
		locale  combine(const locale& _Loc) const
		{	
		_Facet *_Facptr;

		try {
			_Facptr = (_Facet *)&std::use_facet<_Facet>(_Loc);
		} catch (...) {
			throw runtime_error("locale::combine facet missing");
		}

		_Locimp *_Newimp = new _Locimp(*_Ptr);
		_Newimp->_Addfac(_Facptr, _Facet::id);
		_Newimp->_Catmask = 0;
		_Newimp->_Name = "*";
		return (locale(_Newimp));
		}

	template<class _Facet>
		 locale(const locale& _Loc, const _Facet *_Facptr)
			: _Ptr(new _Locimp(*_Loc._Ptr))
		{	
		if (_Facptr != 0)
			{	
			_Ptr->_Addfac((_Facet *)_Facptr, _Facet::id);
			if (_Facet::_Getcat() != (size_t)(-1))
				_Ptr->_Catmask = 0, _Ptr->_Name = "*";	
			}
		}
	 locale() throw ()
		: _Ptr(_Init())
		{	
		_Getgloballocale()->_Incref();
		}

	 locale(_Uninitialized)
		{	
		}

	 locale(const locale& _Right) throw ()
		: _Ptr(_Right._Ptr)
		{	
		_Ptr->_Incref();
		}

	 locale(const locale& _Loc, const locale& _Other,
		category _Cat) 	
		: _Ptr(new _Locimp(*_Loc._Ptr))
		{	
		try {
			{ _Locinfo _Lobj(_Loc._Ptr->_Catmask, _Loc._Ptr->_Name.c_str());
				_Locimp::_Makeloc(_Lobj._Addcats(_Cat & _Other._Ptr->_Catmask,
					_Other._Ptr->_Name.c_str()), _Cat, _Ptr, &_Other);
			}
		} catch (...) {
			delete (_Ptr->_Decref());
			throw;
		}
		}

	explicit  locale(const char *_Locname,
		category _Cat = all) 	
		: _Ptr(new _Locimp)
		{	
		try {
		_Init();
		{ _Locinfo _Lobj(_Cat, _Locname);
			if (_Lobj._Getname().compare("*") == 0)
				throw runtime_error("bad locale name");
			_Locimp::_Makeloc(_Lobj, _Cat, _Ptr, 0);
		}
		} catch (...) {
		delete (_Ptr->_Decref());
		throw;
		}
		}

	 locale(const locale& _Loc, const char * _Locname,
		category _Cat) 	
		: _Ptr(new _Locimp(*_Loc._Ptr))
		{	
		try {
		{ _Locinfo _Lobj(_Loc._Ptr->_Catmask, _Loc._Ptr->_Name.c_str());
			bool _Hadname = _Lobj._Getname().compare("*") != 0;
			_Lobj._Addcats(_Cat, _Locname);

			if (_Hadname && _Lobj._Getname().compare("*") == 0)
				throw runtime_error("bad locale name");
			_Locimp::_Makeloc(_Lobj, _Cat, _Ptr, 0);
		}
		} catch (...) {
		delete (_Ptr->_Decref());
		throw;
		}
		}

	 ~locale() throw ()
		{	
		if (_Ptr != 0)
			delete (_Ptr->_Decref());
		}

	locale&  operator=(const locale& _Right) throw ()
		{	
		if (_Ptr != _Right._Ptr)
			{	
			delete (_Ptr->_Decref());
			_Ptr = _Right._Ptr;
			_Ptr->_Incref();
			}
		return (*this);
		}

	string  name() const
		{	
		return (_Ptr->_Name);
		}

	const facet * _Getfacet(size_t _Id) const 	
		{	
		const facet *_Facptr = _Id < _Ptr->_Facetcount
			? _Ptr->_Facetvec[_Id] : 0;	
		if (_Facptr != 0 || !_Ptr->_Xparent)
			return (_Facptr);	
		else
			{	
			locale::_Locimp *_Ptr = _Getgloballocale();
			return (_Id < _Ptr->_Facetcount
				? _Ptr->_Facetvec[_Id]	
				: 0);	
			}
		}
	bool  operator==(const locale& _Loc) const
		{	
		return (_Ptr == _Loc._Ptr
			|| name().compare("*") != 0 && name().compare(_Loc.name()) == 0);
		}

	bool  operator!=(const locale& _Right) const
		{	
		return (!(*this == _Right));
		}

	static  const locale& __cdecl classic();	

	static  locale __cdecl global(const locale&);	

	static  locale __cdecl empty();	

private:
	locale(_Locimp *_Ptrimp)
		: _Ptr(_Ptrimp)
		{	
		}

	static  _Locimp *__cdecl _Getgloballocale();
	static  _Locimp *__cdecl _Init();	
	static  void __cdecl _Setgloballocale(void *);

	_Locimp *_Ptr;	
	};
#pragma warning(pop)

		
template<class _Facet>
	struct _Facetptr
	{	
	 static const locale::facet *_Psave;
	};

template<class _Facet>
	 const locale::facet *_Facetptr<_Facet>::_Psave = 0;

template<class _Facet> inline __declspec(deprecated("This is an obsolete part of the Standard C++ Library Implementation. Do not use it."))
	locale _Addfac(locale _Loc, const _Facet *_Facptr)
		{	
		return (_Loc._Addfac((_Facet *)_Facptr, _Facet::id,
			_Facet::_Getcat()));
		}
template<class _Facet> inline
	const _Facet& __cdecl use_facet(const locale& _Loc)
	{	
	{ ::std:: _Lockit _Lock(0);	
		const locale::facet *_Psave =
			_Facetptr<_Facet>::_Psave;	

		size_t _Id = _Facet::id;
		const locale::facet *_Pf = _Loc._Getfacet(_Id);

		if (_Pf != 0)
			;	
		else if (_Psave != 0)
			_Pf = _Psave;	
		else if (_Facet::_Getcat(&_Psave) == (size_t)(-1))
		throw bad_cast();	

	
		else
			{	
			_Pf = _Psave;
			_Facetptr<_Facet>::_Psave = _Psave;

			locale::facet *_Pfmod = (_Facet *)_Psave;
			_Pfmod->_Incref();
			_Pfmod->_Register();
			}

		return ((const _Facet&)(*_Pf));	
	}
	}

template<class _Facet> inline __declspec(deprecated("This is an obsolete part of the Standard C++ Library Implementation. Do not use it."))
	const _Facet& __cdecl use_facet(const locale& _Loc, const _Facet *,
		bool = false)
	{	
	return use_facet<_Facet>(_Loc);
	}

		
template<class _Elem,
	class _InIt> inline
	int __cdecl _Getloctxt(_InIt& _First, _InIt& _Last, size_t _Numfields,
		const _Elem *_Ptr)
	{	
	for (size_t _Off = 0; _Ptr[_Off] != (_Elem)0; ++_Off)
		if (_Ptr[_Off] == _Ptr[0])
			++_Numfields;	
	string _Str(_Numfields, '\0');	

	int _Ans = -2;	
	for (size_t _Column = 1; ; ++_Column, ++_First, _Ans = -1)
		{	
		bool  _Prefix = false;	
		size_t _Off = 0;	
		size_t _Field = 0;	

		for (; _Field < _Numfields; ++_Field)
			{	
			for (; _Ptr[_Off] != (_Elem)0 && _Ptr[_Off] != _Ptr[0]; ++_Off)
				;	

			if (_Str[_Field] != '\0')
				_Off += _Str[_Field];	
			else if (_Ptr[_Off += _Column] == _Ptr[0]
				|| _Ptr[_Off] == (_Elem)0)
				{	
				_Str[_Field] = (char)(_Column < 127
					? _Column : 127);	
				_Ans = (int)_Field;	
				}
			else if (_First == _Last || _Ptr[_Off] != *_First)
				_Str[_Field] = (char)(_Column < 127
					? _Column : 127);	
			else
				_Prefix = true;	
			}

		if (!_Prefix || _First == _Last)
			break;	
		}
	return (_Ans);	
	}

		
template<class _Elem> inline
	char __cdecl _Maklocbyte(_Elem _Char,
		const _Locinfo::_Cvtvec&)
	{	
	return ((char)(unsigned char)_Char);
	}

template<> inline
	char __cdecl _Maklocbyte(wchar_t _Char,
		const _Locinfo::_Cvtvec& _Cvt)
	{	
	char _Byte = '\0';
	mbstate_t _Mbst1 = {0};
	_Wcrtomb(&_Byte, _Char, &_Mbst1, &_Cvt);
	return (_Byte);
	}
		
template<class _Elem> inline
	_Elem __cdecl _Maklocchr(char _Byte, _Elem *,
		const _Locinfo::_Cvtvec&)
	{	
	return ((_Elem)(unsigned char)_Byte);
	}

template<> inline
	wchar_t __cdecl _Maklocchr(char _Byte,          wchar_t *,
		const _Locinfo::_Cvtvec& _Cvt)
	{	
	wchar_t _Wc = L'\0';
	mbstate_t _Mbst1 = {0};
	_Mbrtowc(&_Wc, &_Byte, 1, &_Mbst1, &_Cvt);
	return (_Wc);
	}
		
template<class _Elem> inline
	_Elem *__cdecl _Maklocstr(const char *_Ptr, _Elem *,
		const _Locinfo::_Cvtvec&)
	{	
	size_t _Count = ::strlen(_Ptr) + 1;
	_Elem *_Ptrdest = new _Elem[_Count];

#pragma warning(push)
#pragma warning(disable: 6011)
	
	for (_Elem *_Ptrnext = _Ptrdest; 0 < _Count; --_Count, ++_Ptrnext, ++_Ptr)
		*_Ptrnext = (_Elem)(unsigned char)*_Ptr;
	return (_Ptrdest);
#pragma warning(pop)
	}

template<> inline
	wchar_t *__cdecl _Maklocstr(const char *_Ptr,          wchar_t *,
		const _Locinfo::_Cvtvec& _Cvt)
	{	
	size_t _Count, _Count1;
	size_t _Wchars;
	const char *_Ptr1;
	int _Bytes;
	wchar_t _Wc;
	mbstate_t _Mbst1 = {0};

	_Count1 = ::strlen(_Ptr) + 1;
	for (_Count = _Count1, _Wchars = 0, _Ptr1 = _Ptr; 0 < _Count;
		_Count -= _Bytes, _Ptr1 += _Bytes, ++_Wchars)
		if ((_Bytes = _Mbrtowc(&_Wc, _Ptr1, _Count, &_Mbst1, &_Cvt)) <= 0)
			break;
	++_Wchars;	

	wchar_t *_Ptrdest = new wchar_t[_Wchars];
	wchar_t *_Ptrnext = _Ptrdest;
	mbstate_t _Mbst2 = {0};
#pragma warning(push)
#pragma warning(disable: 6011)
	
	for (; 0 < _Wchars;
		_Count -= _Bytes, _Ptr += _Bytes, --_Wchars, ++_Ptrnext)
		if ((_Bytes = _Mbrtowc(_Ptrnext, _Ptr, _Count1, &_Mbst2, &_Cvt)) <= 0)
			break;
	*_Ptrnext = L'\0';
#pragma warning(pop)
	return (_Ptrdest);
	}
		
class __declspec(dllimport) codecvt_base
	: public locale::facet
	{	
public:
	enum
		{	
		ok, partial, error, noconv};
	typedef int result;

	 codecvt_base(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		}

	bool  always_noconv() const throw ()
		{	
		return (do_always_noconv());
		}

	int  max_length() const throw ()
		{	
		return (do_max_length());
		}

	int  encoding() const throw ()
		{	
		return (do_encoding());
		}

	 ~codecvt_base()
		{	
		}

protected:
	virtual bool  do_always_noconv() const throw ()
		{	
		return (true);
		}

	virtual int  do_max_length() const throw ()
		{	
		return (1);
		}

	virtual int  do_encoding() const throw ()
		{	
		return (1);	
		}
	};

		
template<class _Elem,
	class _Byte,
	class _Statype>
	class codecvt
		: public codecvt_base
	{	
public:
	typedef _Elem intern_type;
	typedef _Byte extern_type;
	typedef _Statype state_type;

	result  in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	
		return (do_in(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		return (do_out(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		return (do_unshift(_State, _First2, _Last2, _Mid2));
		}

	int  length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	
		return (do_length(_State, _First1, _Last1, _Count));
		}

	 static locale::id id;	

	explicit  codecvt(size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 codecvt(const _Locinfo& _Lobj, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new codecvt<_Elem, _Byte, _Statype>;
		return (2);
		}

protected:
	virtual  ~codecvt()
		{	
		}

protected:
	void  _Init(const _Locinfo&)
		{	
		}

	virtual result  do_in(_Statype&,
		const _Byte *_First1, const _Byte *, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *, _Elem *& _Mid2) const
		{	
		_Mid1 = _First1, _Mid2 = _First2;
		return (noconv);	
		}

	virtual result  do_out(_Statype&,
		const _Elem *_First1, const _Elem *, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *, _Byte *& _Mid2) const
		{	
		_Mid1 = _First1, _Mid2 = _First2;
		return (noconv);	
		}

	virtual result  do_unshift(_Statype&,
		_Byte *_First2, _Byte *, _Byte *&_Mid2) const
		{	
		_Mid2 = _First2;
		return (noconv);	
		}

	virtual int  do_length(const _Statype&, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	
		return ((int)(_Count < (size_t)(_Last1 - _First1)
			? _Count : _Last1 - _First1));	
		}
	};

		
template<class _Elem,
	class _Byte,
	class _Statype>
	 locale::id codecvt<_Elem, _Byte, _Statype>::id;

		
template<> class __declspec(dllimport) codecvt<wchar_t, char, _Mbstatet>
	: public codecvt_base
	{	
public:
	typedef wchar_t _Elem;
	typedef char _Byte;
	typedef _Mbstatet _Statype;
	typedef _Elem intern_type;
	typedef _Byte extern_type;
	typedef _Statype state_type;

	result  in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	
		return (do_in(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		return (do_out(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		return (do_unshift(_State,
			_First2, _Last2, _Mid2));
		}

	int  length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	
		return (do_length(_State, _First1, _Last1, _Count));
		}

	static  locale::id& __cdecl _Id_func();
	 static locale::id id;	
	explicit  codecvt(size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 codecvt(const _Locinfo& _Lobj, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new codecvt<_Elem, _Byte, _Statype>;
		return (2);
		}

protected:
	virtual  ~codecvt()
		{	
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	
		_Cvt = _Lobj._Getcvt();
		}

	virtual result  do_in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
			_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	
		;
		;
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			switch (_Bytes = _Mbrtowc(_Mid2, _Mid1, _Last1 - _Mid1,
				&_State, &_Cvt))
			{	
			case -2:	
				_Mid1 = _Last1;
				return (_Ans);

			case -1:	
				return (error);

			case 0:	
				if (*_Mid2 == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				

			default:	
				if (_Bytes == -3)
					_Bytes = 0;	
				_Mid1 += _Bytes;
				++_Mid2;
				_Ans = ok;
			}
		return (_Ans);
		}

	virtual result  do_out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
			_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		;
		;
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			if (5 <= _Last2 - _Mid2)
				if ((_Bytes = _Wcrtomb(_Mid2, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	
				else
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
			else
				{	
				_Byte _Buf[5];
				_Statype _Stsave = _State;

				if ((_Bytes = _Wcrtomb(_Buf, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	
				else if (_Last2 - _Mid2 < _Bytes)
					{	
					_State = _Stsave;
					return (_Ans);
					}
				else
					{	
					::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
					}
				}
		return (_Ans);
		}

	virtual result  do_unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		;
		_Mid2 = _First2;
		result _Ans = ok;
		int _Bytes;
		_Byte _Buf[5];
		_Statype _Stsave = _State;

		if ((_Bytes = _Wcrtomb(_Buf, L'\0', &_State, &_Cvt)) <= 0)
			_Ans = error;	
		else if (_Last2 - _Mid2 < --_Bytes)
			{	
			_State = _Stsave;
			_Ans = partial;
			}
		else if (0 < _Bytes)
			{	
			::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
			_Mid2 += _Bytes;
			}
		return (_Ans);
		}

	virtual int  do_length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	
		;
		int _Wchars;
		const _Byte *_Mid1;
		_Statype _Mystate = _State;

		for (_Wchars = 0, _Mid1 = _First1;
			(size_t)_Wchars < _Count && _Mid1 != _Last1; )
			{	
			int _Bytes;
			_Elem _Ch;

			switch (_Bytes = _Mbrtowc(&_Ch, _Mid1, _Last1 - _Mid1,
				&_Mystate, &_Cvt))
				{	
			case -2:	
				return (_Wchars);

			case -1:	
				return (_Wchars);

			case 0:	
				if (_Ch == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				

			default:	
				if (_Bytes == -3)
					_Bytes = 0;	
				_Mid1 += _Bytes;
				++_Wchars;
				}
			}
		return (_Wchars);
		}

	virtual bool  do_always_noconv() const throw ()
		{	
		return (false);
		}

	virtual int  do_max_length() const throw ()
		{	
		return (5);
		}

	virtual int  do_encoding() const throw ()
		{	
		return (0);
		}

private:
	_Locinfo::_Cvtvec _Cvt;	
	};
		
template<> class __declspec(dllimport) codecvt<unsigned short, char, _Mbstatet>
	: public codecvt_base
	{	
public:
	typedef unsigned short _Elem;
	typedef char _Byte;
	typedef _Mbstatet _Statype;
	typedef _Elem intern_type;
	typedef _Byte extern_type;
	typedef _Statype state_type;

	result  in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	
		return (do_in(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		return (do_out(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		return (do_unshift(_State,
			_First2, _Last2, _Mid2));
		}

	int  length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	
		return (do_length(_State, _First1, _Last1, _Count));
		}

	static  locale::id& __cdecl _Id_func();
	 static locale::id id;	
	explicit  codecvt(size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 codecvt(const _Locinfo& _Lobj, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new codecvt<_Elem, _Byte, _Statype>;
		return (2);
		}

protected:
	virtual  ~codecvt()
		{	
		}

protected:
	 codecvt(const char *_Locname, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	
		{ _Locinfo _Lobj(_Locname);
			_Init(_Lobj);
		}
		}

	void  _Init(const _Locinfo& _Lobj)
		{	
		_Cvt = _Lobj._Getcvt();
		}

	virtual result  do_in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
			_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	
		;
		;
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			switch (_Bytes = _Mbrtowc((wchar_t *)_Mid2, _Mid1, _Last1 - _Mid1,
				&_State, &_Cvt))
			{	
			case -2:	
				_Mid1 = _Last1;
				return (_Ans);

			case -1:	
				return (error);

			case 0:	
				if (*_Mid2 == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				

			default:	
				if (_Bytes == -3)
					_Bytes = 0;	
				_Mid1 += _Bytes;
				++_Mid2;
				_Ans = ok;
			}
		return (_Ans);
		}

	virtual result  do_out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
			_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		;
		;
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			if (5 <= _Last2 - _Mid2)
				if ((_Bytes = _Wcrtomb(_Mid2, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	
				else
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
			else
				{	
				_Byte _Buf[5];
				_Statype _Stsave = _State;

				if ((_Bytes = _Wcrtomb(_Buf, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	
				else if (_Last2 - _Mid2 < _Bytes)
					{	
					_State = _Stsave;
					return (_Ans);
					}
				else
					{	
					::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
					}
				}
		return (_Ans);
		}

	virtual result  do_unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	
		;
		_Mid2 = _First2;
		result _Ans = ok;
		int _Bytes;
		_Byte _Buf[5];
		_Statype _Stsave = _State;

		if ((_Bytes = _Wcrtomb(_Buf, L'\0', &_State, &_Cvt)) <= 0)
			_Ans = error;	
		else if (_Last2 - _Mid2 < --_Bytes)
			{	
			_State = _Stsave;
			_Ans = partial;
			}
		else if (0 < _Bytes)
			{	
			::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
			_Mid2 += _Bytes;
			}
		return (_Ans);
		}

	virtual int  do_length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	
		;
		int _Wchars;
		const _Byte *_Mid1;
		_Statype _Mystate = _State;

		for (_Wchars = 0, _Mid1 = _First1;
			(size_t)_Wchars < _Count && _Mid1 != _Last1; )
			{	
			int _Bytes;
			_Elem _Ch;

			switch (_Bytes = _Mbrtowc((wchar_t *)&_Ch, _Mid1, _Last1 - _Mid1,
				&_Mystate, &_Cvt))
				{	
			case -2:	
				return (_Wchars);

			case -1:	
				return (_Wchars);

			case 0:	
				if (_Ch == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				

			default:	
				if (_Bytes == -3)
					_Bytes = 0;	
				_Mid1 += _Bytes;
				++_Wchars;
				}
			}
		return (_Wchars);
		}

	virtual bool  do_always_noconv() const throw ()
		{	
		return (false);
		}

	virtual int  do_max_length() const throw ()
		{	
		return (5);
		}

	virtual int  do_encoding() const throw ()
		{	
		return (0);
		}

private:
	_Locinfo::_Cvtvec _Cvt;	
	};
		
template<class _Elem,
	class _Byte,
	class _Statype>
	class codecvt_byname
		: public codecvt<_Elem, _Byte, _Statype>
	{	
public:
	explicit  codecvt_byname(const char *_Locname, size_t _Refs = 0)
		: codecvt<_Elem, _Byte, _Statype>(_Locname, _Refs)
		{	
		}

protected:
	virtual  ~codecvt_byname()
		{	
		}
	};

		
struct __declspec(dllimport) ctype_base
	: public locale::facet
	{	
	enum
		{	
		alnum = 0x4|0x2|0x1|0x100, alpha = 0x2|0x1|0x100,
		cntrl = 0x20, digit = 0x4, graph = 0x4|0x2|0x10|0x1|0x100,
		lower = 0x2, print = 0x4|0x2|0x10|0x40|0x1|0x100|0x80,
		punct = 0x10, space = 0x8|0x40|0x000, upper = 0x1,
		xdigit = 0x80};
	typedef short mask;	

	 ctype_base(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		}

	 ~ctype_base()
		{	
		}

protected:
	static void __cdecl _Xran()
		{	
		throw out_of_range("out_of_range in ctype<T>");
		}
	};

		
template<class _Elem>
	class ctype
		: public ctype_base
	{	
public:
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	
		return (do_is(_Maskval, _Ch));
		}

	const _Elem * is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	
		return (do_is(_First, _Last, _Dest));
		}

	const _Elem * scan_is(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	
		return (do_scan_is(_Maskval, _First, _Last));
		}

	const _Elem * scan_not(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	
		return (do_scan_not(_Maskval, _First, _Last));
		}

	_Elem  tolower(_Elem _Ch) const
		{	
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	
		return (do_widen(_Byte));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const char * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const char * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt,      char *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt,        char *_Dest, size_t _Dest_size) const
		{	
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	 static locale::id id;	

	explicit  ctype(size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new ctype<_Elem>;
		return (2);
		}

protected:
	virtual  ~ctype()
		{	
		if (_Ctype._Delfl)
			free((void *)_Ctype._Table);
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	
		_Ctype = _Lobj._Getctype();
		}

	virtual bool  do_is(mask _Maskval, _Elem _Ch) const
		{	
		return ((_Ctype._Table[(unsigned char)narrow(_Ch)]
			& _Maskval) != 0);
		}

	virtual const _Elem * do_is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	
		;
		;
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Ctype._Table[(unsigned char)narrow(*_First)];
		return (_First);
		}

	virtual const _Elem * do_scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual const _Elem * do_scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	
		unsigned char _Byte = (unsigned char)narrow(_Ch, '\0');
		if (_Byte == '\0')
			return (_Ch);
		else
			return (widen((char)_Tolower(_Byte, &_Ctype)));
		}

	virtual const _Elem * do_tolower(_Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			{	
			unsigned char _Byte = (unsigned char)narrow(*_First, '\0');
			if (_Byte != '\0')
				*_First = (widen((char)_Tolower(_Byte, &_Ctype)));
			}
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	
		unsigned char _Byte = (unsigned char)narrow(_Ch, '\0');
		if (_Byte == '\0')
			return (_Ch);
		else
			return (widen((char)_Toupper(_Byte, &_Ctype)));
		}

	virtual const _Elem * do_toupper(_Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			{	
			unsigned char _Byte = (unsigned char)narrow(*_First, '\0');
			if (_Byte != '\0')
				*_First = (widen((char)_Toupper(_Byte, &_Ctype)));
			}
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	
		return (_Maklocchr(_Byte, (_Elem *)0, _Cvt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const char * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	
		
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const char * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Maklocchr(*_First, (_Elem *)0, _Cvt);
		return (_First);
		}

	char  _Donarrow(_Elem _Ch, char _Dflt) const
		{	
		char _Byte;
		if (_Ch == (_Elem)0)
			return ('\0');
		else if ((_Byte = _Maklocbyte((_Elem)_Ch, _Cvt)) == '\0')
			return (_Dflt);
		else
			return (_Byte);
		}

	virtual char  do_narrow(_Elem _Ch, char _Dflt) const
		{	
		return (_Donarrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt,      char *_Dest) const
		{	
		
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char _Dflt,
		       char *_Dest,
		size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Donarrow(*_First, _Dflt);
		return (_First);
		}

private:
	_Locinfo::_Ctypevec _Ctype;	
	_Locinfo::_Cvtvec _Cvt;		
	};

		
template<class _Elem>
	 locale::id ctype<_Elem>::id;

		
template<> class __declspec(dllimport) ctype<char>
	: public ctype_base
	{	
	typedef ctype<char> _Myt;

public:
	typedef char _Elem;
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	
		return ((_Ctype._Table[(unsigned char)_Ch] & _Maskval) != 0);
		}

	const _Elem * is(const _Elem *_First,
		const _Elem *_Last, mask *_Dest) const
		{	
		;
		;
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Ctype._Table[(unsigned char)*_First];
		return (_First);
		}

	const _Elem * scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	const _Elem * scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	_Elem  tolower(_Elem _Ch) const
		{	
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	
		return (do_widen(_Byte));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const _Elem * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	_Elem  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt,      char *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt,        char *_Dest,
		size_t _Dest_size) const
		{	
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	static  locale::id& __cdecl _Id_func();
	 static locale::id id;	
	explicit  ctype(const mask *_Table = 0,
		bool _Deletetable = false,
		size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		if (_Table != 0)
			{	
			_Tidy();
			_Ctype._Table = _Table;
			_Ctype._Delfl = _Deletetable ? -1 : 0;
			}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new ctype<_Elem>;
		return (2);
		}

	 static const size_t table_size = 1 << 8;	

protected:
	virtual  ~ctype()
		{	
		_Tidy();
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	
		_Ctype = _Lobj._Getctype();
		}

	void  _Tidy()
		{	
		if (0 < _Ctype._Delfl)
			free((void *)_Ctype._Table);
		else if (_Ctype._Delfl < 0)
			delete[] (void *)_Ctype._Table;
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	
		return ((_Elem)_Tolower((unsigned char)_Ch, &_Ctype));
		}

	virtual const _Elem * do_tolower(_Elem *_First,
		const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			*_First = (_Elem)_Tolower((unsigned char)*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	
		return ((_Elem)_Toupper((unsigned char)_Ch, &_Ctype));
		}

	virtual const _Elem * do_toupper(_Elem *_First,
		const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			*_First = (_Elem)_Toupper((unsigned char)*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	
		return (_Byte);
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const _Elem * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	
		
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		::memcpy_s((_Dest), (_Dest_size), (_First), (_Last - _First));
		return (_Last);
		}

	virtual _Elem  do_narrow(_Elem _Ch, char) const
		{	
		return (_Ch);
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt,
		     char *_Dest) const
		{	
		
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char,        char *_Dest,
		size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		::memcpy_s((_Dest), (_Dest_size), (_First), (_Last - _First));
		return (_Last);
		}

	const mask * table() const throw ()
		{	
		return (_Ctype._Table);
		}

	static const mask *__cdecl classic_table() throw ()
		{	
		const _Myt& _Ctype_fac = use_facet<_Myt >(locale::classic());
		return (_Ctype_fac.table());
		}

private:
	_Locinfo::_Ctypevec _Ctype;	
	};

		
template<> class __declspec(dllimport) ctype<wchar_t>
	: public ctype_base
	{	
	typedef ctype<wchar_t> _Myt;

public:
	typedef wchar_t _Elem;
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	
		return (do_is(_Maskval, _Ch));
		}

	const _Elem * is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	
		return (do_is(_First, _Last, _Dest));
		}

	const _Elem * scan_is(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	
		return (do_scan_is(_Maskval, _First, _Last));
		}

	const _Elem * scan_not(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	
		return (do_scan_not(_Maskval, _First, _Last));
		}

	_Elem  tolower(_Elem _Ch) const
		{	
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	
		return (do_widen(_Byte));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const char * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const char * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt,      char *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt,        char *_Dest,
		size_t _Dest_size) const
		{	
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	static  locale::id& __cdecl _Id_func();
	 static locale::id id;	
	explicit  ctype(size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new ctype<_Elem>;
		return (2);
		}

protected:
	virtual  ~ctype()
		{	
		if (_Ctype._Delfl)
			free((void *)_Ctype._Table);
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	
		_Ctype = _Lobj._Getctype();
		_Cvt = _Lobj._Getcvt();
		}

	virtual bool  do_is(mask _Maskval, _Elem _Ch) const
		{	
		return ((::_Getwctype(_Ch, &_Ctype) & _Maskval) != 0);
		}

	virtual const wchar_t * do_is(const _Elem *_First,
		const _Elem *_Last, mask *_Dest) const
		{	
		;
		;
		return (::_Getwctypes(_First, _Last, _Dest, &_Ctype));
		}

	virtual const _Elem * do_scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual const _Elem * do_scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	
		return (_Towlower(_Ch, &_Ctype));
		}

	virtual const _Elem * do_tolower(_Elem *_First,
		const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			*_First = _Towlower(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	
		return (_Towupper(_Ch, &_Ctype));
		}

	virtual const _Elem * do_toupper(_Elem *_First,
		const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			*_First = _Towupper(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	_Elem  _Dowiden(char _Byte) const
		{	
		mbstate_t _Mbst = {0};
		wchar_t _Wc;
		return (_Mbrtowc(&_Wc, &_Byte, 1, &_Mbst, &_Cvt) < 0
			? (wchar_t)(wint_t)(0xFFFF) : _Wc);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	
		return (_Dowiden(_Byte));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const char * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	
		
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const char * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Dowiden(*_First);
		return (_First);
		}

	char  _Donarrow(_Elem _Ch, char _Dflt) const
		{	
		char _Buf[5];
		mbstate_t _Mbst = {0};
		return (_Wcrtomb(_Buf, _Ch, &_Mbst, &_Cvt) != 1
			? _Dflt : _Buf[0]);
		}

	virtual char  do_narrow(_Elem _Ch, char _Dflt) const
		{	
		return (_Donarrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt,
		     char *_Dest) const
		{	
		
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char _Dflt,
		       char *_Dest,
		size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Donarrow(*_First, _Dflt);
		return (_First);
		}

private:
	_Locinfo::_Ctypevec _Ctype;	
	_Locinfo::_Cvtvec _Cvt;		
	};
		
template<> class __declspec(dllimport) ctype<unsigned short>
	: public ctype_base
	{	
	typedef ctype<unsigned short> _Myt;

public:
	typedef unsigned short _Elem;
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	
		return (do_is(_Maskval, _Ch));
		}

	const _Elem * is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	
		return (do_is(_First, _Last, _Dest));
		}

	const _Elem * scan_is(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	
		return (do_scan_is(_Maskval, _First, _Last));
		}

	const _Elem * scan_not(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	
		return (do_scan_not(_Maskval, _First, _Last));
		}

	_Elem  tolower(_Elem _Ch) const
		{	
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	
		return (do_widen(_Byte));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const char * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const char * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt,      char *_Dest) const
		{	
		
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt,        char *_Dest,
		size_t _Dest_size) const
		{	
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	static  locale::id& __cdecl _Id_func();
	 static locale::id id;	
	explicit  ctype(size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new ctype<_Elem>;
		return (2);
		}

protected:
	virtual  ~ctype()
		{	
		if (_Ctype._Delfl)
			free((void *)_Ctype._Table);
		}

protected:
	 ctype(const char *_Locname, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	
		{ _Locinfo _Lobj(_Locname);
			_Init(_Lobj);
		}
		}

	void  _Init(const _Locinfo& _Lobj)
		{	
		_Ctype = _Lobj._Getctype();
		_Cvt = _Lobj._Getcvt();
		}

	virtual bool  do_is(mask _Maskval, _Elem _Ch) const
		{	
		return ((::_Getwctype(_Ch, &_Ctype) & _Maskval) != 0);
		}

	virtual const _Elem * do_is(const _Elem *_First,
		const _Elem *_Last, mask *_Dest) const
		{	
		;
		;
		return ((const _Elem *)::_Getwctypes((const wchar_t *)_First,
			(const wchar_t *)_Last, _Dest, &_Ctype));
		}

	virtual const _Elem * do_scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual const _Elem * do_scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	
		;
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	
		return (_Towlower(_Ch, &_Ctype));
		}

	virtual const _Elem * do_tolower(_Elem *_First,
		const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			*_First = _Towlower(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	
		return (_Towupper(_Ch, &_Ctype));
		}

	virtual const _Elem * do_toupper(_Elem *_First,
		const _Elem *_Last) const
		{	
		;
		for (; _First != _Last; ++_First)
			*_First = _Towupper(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	_Elem  _Dowiden(char _Byte) const
		{	
		mbstate_t _Mbst = {0};
		unsigned short _Wc;
		return (_Mbrtowc((wchar_t *)&_Wc, &_Byte, 1, &_Mbst, &_Cvt) < 0
			? (unsigned short)(wint_t)(0xFFFF) : _Wc);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	
		return (_Dowiden(_Byte));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const char * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	
		
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const char * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Dowiden(*_First);
		return (_First);
		}

	char  _Donarrow(_Elem _Ch, char _Dflt) const
		{	
		char _Buf[5];
		mbstate_t _Mbst = {0};
		return (_Wcrtomb(_Buf, _Ch, &_Mbst, &_Cvt) != 1
			? _Dflt : _Buf[0]);
		}

	virtual char  do_narrow(_Elem _Ch, char _Dflt) const
		{	
		return (_Donarrow(_Ch, _Dflt));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt,      char *_Dest) const
		{	
		
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char _Dflt,
		       char *_Dest,
		size_t _Dest_size) const
		{	
		;
		;
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { ((void)0); ::_invalid_parameter_noinfo(); } };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Donarrow(*_First, _Dflt);
		return (_First);
		}

private:
	_Locinfo::_Ctypevec _Ctype;	
	_Locinfo::_Cvtvec _Cvt;		
	};
		
template<class _Elem>
	class ctype_byname
	: public ctype<_Elem>
	{	
public:
	explicit  ctype_byname(const char *_Locname, size_t _Refs = 0)
		: ctype<_Elem>(_Locname, _Refs)
		{	
		}

protected:
	virtual  ~ctype_byname()
		{	
		}
	};

		
template<> class ctype_byname<char>
	: public ctype<char>
	{	
public:
	explicit  ctype_byname(const char *_Locname, size_t _Refs = 0)
		: ctype<char>(_Locname, _Refs)
		{	
		}

protected:
	virtual  ~ctype_byname()
		{	
		}
	};
template class __declspec(dllimport) codecvt<char, char, _Mbstatet>;
}
#pragma warning(pop)
#pragma pack(pop)

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)
#pragma warning(disable:4412)
namespace std {

		
template<class _Dummy>
	class _Iosb
	{	
public:
	enum _Dummy_enum {_Dummy_enum_val = 1};	

	enum _Fmtflags
		{	
		_Fmtmask = 0xffff, _Fmtzero = 0};

	static const _Fmtflags skipws = (_Fmtflags)0x0001;
	static const _Fmtflags unitbuf = (_Fmtflags)0x0002;
	static const _Fmtflags uppercase = (_Fmtflags)0x0004;
	static const _Fmtflags showbase = (_Fmtflags)0x0008;
	static const _Fmtflags showpoint = (_Fmtflags)0x0010;
	static const _Fmtflags showpos = (_Fmtflags)0x0020;
	static const _Fmtflags left = (_Fmtflags)0x0040;
	static const _Fmtflags right = (_Fmtflags)0x0080;
	static const _Fmtflags internal = (_Fmtflags)0x0100;
	static const _Fmtflags dec = (_Fmtflags)0x0200;
	static const _Fmtflags oct = (_Fmtflags)0x0400;
	static const _Fmtflags hex = (_Fmtflags)0x0800;
	static const _Fmtflags scientific = (_Fmtflags)0x1000;
	static const _Fmtflags fixed = (_Fmtflags)0x2000;
	static const _Fmtflags boolalpha = (_Fmtflags)0x4000;
	static const _Fmtflags _Stdio = (_Fmtflags)0x8000;
	static const _Fmtflags adjustfield = (_Fmtflags)(0x0040
		| 0x0080 | 0x0100);
	static const _Fmtflags basefield = (_Fmtflags)(0x0200
		| 0x0400 | 0x0800);
	static const _Fmtflags floatfield = (_Fmtflags)(0x1000
		| 0x2000);

	enum _Iostate
		{	
		_Statmask = 0x17};

	static const _Iostate goodbit = (_Iostate)0x0;
	static const _Iostate eofbit = (_Iostate)0x1;
	static const _Iostate failbit = (_Iostate)0x2;
	static const _Iostate badbit = (_Iostate)0x4;
	static const _Iostate _Hardfail = (_Iostate)0x10;

	enum _Openmode
		{	
		_Openmask = 0xff};

	static const _Openmode in = (_Openmode)0x01;
	static const _Openmode out = (_Openmode)0x02;
	static const _Openmode ate = (_Openmode)0x04;
	static const _Openmode app = (_Openmode)0x08;
	static const _Openmode trunc = (_Openmode)0x10;
	static const _Openmode _Nocreate = (_Openmode)0x40;
	static const _Openmode _Noreplace = (_Openmode)0x80;
	static const _Openmode binary = (_Openmode)0x20;

	enum _Seekdir
		{	
		_Seekmask = 0x3};
	static const _Seekdir beg = (_Seekdir)0;
	static const _Seekdir cur = (_Seekdir)1;
	static const _Seekdir end = (_Seekdir)2;

	enum
		{	
		_Openprot = 0x40};
	};

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::skipws;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::unitbuf;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::uppercase;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::showbase;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::showpoint;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::showpos;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::left;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::right;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::internal;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::dec;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::oct;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::hex;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::scientific;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::fixed;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::boolalpha;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::_Stdio;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::adjustfield;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::basefield;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::floatfield;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::goodbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::eofbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::failbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::badbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::_Hardfail;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::in;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::out;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::ate;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::app;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::trunc;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::_Nocreate;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::_Noreplace;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::binary;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Seekdir _Iosb<_Dummy>::beg;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Seekdir _Iosb<_Dummy>::cur;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Seekdir _Iosb<_Dummy>::end;

		
class __declspec(dllimport) ios_base
	: public _Iosb<int>
	{	
public:
	typedef int fmtflags;
	typedef int iostate;
	typedef int openmode;
	typedef int seekdir;

	typedef std::streamoff streamoff;
	typedef std::streampos streampos;

	enum event
		{	
		erase_event, imbue_event, copyfmt_event};

	typedef void (__cdecl *event_callback)(event, ios_base&, int);
	typedef unsigned int io_state, open_mode, seek_dir;

			
	class failure
		: public runtime_error
		{	
	public:
		explicit  failure(const string &_Message)
			: runtime_error(_Message)
			{	
			}

		virtual  ~failure() throw ()
			{	
			}
		};

			
	class __declspec(dllimport) Init
		{	
	public:
		 Init()
            {
            _Init_ctor(this);
            }

		 ~Init()
            {
            _Init_dtor(this);
            }

	private:
        static  void __cdecl _Init_ctor(Init *);
        static  void __cdecl _Init_dtor(Init *);

		 static int& __cdecl _Init_cnt_func();	
		 static int _Init_cnt;	

		};

	ios_base&  operator=(const ios_base& _Right)
		{	
		if (this != &_Right)
			{	
			_Mystate = _Right._Mystate;
			copyfmt(_Right);
			}
		return (*this);
		}

	 operator void *() const
		{	
		return (fail() ? 0 : (void *)this);
		}

	bool  operator!() const
		{	
		return (fail());
		}

    void  clear(iostate _State, bool _Reraise)
        {	
        _Mystate = (iostate)(_State & _Statmask);
        if ((_Mystate & _Except) == 0)
            ;
        else if (_Reraise)
            throw;
        else if (_Mystate & _Except & badbit)
            throw failure("ios_base::badbit set");
        else if (_Mystate & _Except & failbit)
            throw failure("ios_base::failbit set");
        else
            throw failure("ios_base::eofbit set");
        }

	void  clear(iostate _State = goodbit)
		{	
		clear(_State, false);
		}

	void  clear(io_state _State)
		{	
		clear((iostate)_State);
		}

	iostate  rdstate() const
		{	
		return (_Mystate);
		}
	void  setstate(iostate _State, bool _Exreraise)
		{	
		if (_State != goodbit)
			clear((iostate)((int)rdstate() | (int)_State), _Exreraise);
		}

	void  setstate(iostate _State)
		{	
		if (_State != goodbit)
			clear((iostate)((int)rdstate() | (int)_State), false);
		}

	void  setstate(io_state _State)
		{	
		setstate((iostate)_State);
		}

	bool  good() const
		{	
		return (rdstate() == goodbit);
		}

	bool  eof() const
		{	
		return ((int)rdstate() & (int)eofbit);
		}

	bool  fail() const
		{	
		return (((int)rdstate()
			& ((int)badbit | (int)failbit)) != 0);
		}

	bool  bad() const
		{	
		return (((int)rdstate() & (int)badbit) != 0);
		}

	
	
	
	iostate  exceptions() const
		{	
		return (_Except);
		}

	void  exceptions(iostate _Newexcept)
		{	
		_Except = (iostate)((int)_Newexcept & (int)_Statmask);
		clear(_Mystate);
		}

	void  exceptions(io_state _State)
		{	
		exceptions((iostate)_State);
		}

	fmtflags  flags() const
		{	
		return (_Fmtfl);
		}

	fmtflags  flags(fmtflags _Newfmtflags)
		{	
		fmtflags _Oldfmtflags = _Fmtfl;
		_Fmtfl = (fmtflags)((int)_Newfmtflags & (int)_Fmtmask);
		return (_Oldfmtflags);
		}

	fmtflags  setf(fmtflags _Newfmtflags)
		{	
		ios_base::fmtflags _Oldfmtflags = _Fmtfl;
		_Fmtfl = (fmtflags)((int)_Fmtfl
			| (int)_Newfmtflags & (int)_Fmtmask);
		return (_Oldfmtflags);
		}

	fmtflags  setf(fmtflags _Newfmtflags, fmtflags _Mask)
		{	
		ios_base::fmtflags _Oldfmtflags = _Fmtfl;
		_Fmtfl = (fmtflags)(((int)_Fmtfl & (int)~_Mask)
			| ((int)_Newfmtflags & (int)_Mask & (int)_Fmtmask));
		return (_Oldfmtflags);
		}

	void  unsetf(fmtflags _Mask)
		{	
		_Fmtfl = (fmtflags)((int)_Fmtfl & (int)~_Mask);
		}

	streamsize  precision() const
		{	
		return (_Prec);
		}

	streamsize  precision(streamsize _Newprecision)
		{	
		streamsize _Oldprecision = _Prec;
		_Prec = _Newprecision;
		return (_Oldprecision);
		}

	streamsize  width() const
		{	
		return (_Wide);
		}

	streamsize  width(streamsize _Newwidth)
		{	
		streamsize _Oldwidth = _Wide;
		_Wide = _Newwidth;
		return (_Oldwidth);
		}

	locale  getloc() const
		{	
		return (*_Ploc);
		}

	locale  imbue(const locale& _Loc)
        {	
        locale _Oldlocale = *_Ploc;
        *_Ploc = _Loc;
        _Callfns(imbue_event);
        return (_Oldlocale);
        }

	static int __cdecl xalloc()
		{	
		{ ::std:: _Lockit _Lock(2);	
			return (_Index++);
		}
		}

	long&  iword(int _Idx)
		{	
		return (_Findarr(_Idx)._Lo);
		}

	void *&  pword(int _Idx)
		{	
		return (_Findarr(_Idx)._Vp);
		}

	void  register_callback(event_callback _Pfn, int _Idx)
        {	
        _Calls = new _Fnarray(_Idx, _Pfn, _Calls);
        }

	ios_base&  copyfmt(const ios_base& _Other)
        {	
        if (this != &_Other)
            {	
            _Tidy();
            *_Ploc = *_Other._Ploc;
            _Fmtfl = _Other._Fmtfl;
            _Prec = _Other._Prec;
            _Wide = _Other._Wide;
            _Iosarray *_Ptr = _Other._Arr;

            for (_Arr = 0; _Ptr != 0; _Ptr = _Ptr->_Next)
                if (_Ptr->_Lo != 0 || _Ptr->_Vp != 0)
                    {	
                    iword(_Ptr->_Index) = _Ptr->_Lo;
                    pword(_Ptr->_Index) = _Ptr->_Vp;
                    }

            for (_Fnarray *_Q = _Other._Calls; _Q != 0; _Q = _Q->_Next)
                register_callback(_Q->_Pfn, _Q->_Index);	

            _Callfns(copyfmt_event);	
            exceptions(_Other._Except);	
            }
        return (*this);
        }
	virtual  ~ios_base()
        {
        _Ios_base_dtor(this);
        }

	static bool __cdecl sync_with_stdio(bool _Newsync = true)
		{	
		{ ::std:: _Lockit _Lock(2);	
			const bool _Oldsync = _Sync;
			_Sync = _Newsync;
			return (_Oldsync);
		}
		}

	static  void __cdecl _Addstd(ios_base *);
	size_t _Stdstr;	

protected:
	 ios_base()
		{	
		}

	void  _Init()
        {	
        _Ploc = 0;
        _Except = goodbit;
        _Fmtfl = skipws | dec;
        _Prec = 6;
        _Wide = 0;
        _Arr = 0;
        _Calls = 0;
        clear(goodbit);
        _Ploc = new locale;
        }

private:
			
	struct _Iosarray
		{	
	public:
		 _Iosarray(int _Idx, _Iosarray *_Link)
			: _Next(_Link), _Index(_Idx), _Lo(0), _Vp(0)
			{	
			}

		_Iosarray *_Next;	
		int _Index;	
		long _Lo;	
		void *_Vp;	
		};

			
	struct _Fnarray
		{	
		 _Fnarray(int _Idx, event_callback _Pnew, _Fnarray *_Link)
			: _Next(_Link), _Index(_Idx), _Pfn(_Pnew)
			{	
			}

		_Fnarray *_Next;	
		int _Index;	
		event_callback _Pfn;	
		};

	void  _Callfns(event _Ev)
        {	
        for (_Fnarray *_Ptr = _Calls; _Ptr != 0; _Ptr = _Ptr->_Next)
            (*_Ptr->_Pfn)(_Ev, *this, _Ptr->_Index);
        }

	_Iosarray&  _Findarr(int _Idx)
        {	
        _Iosarray *_Ptr, *_Q;

        for (_Ptr = _Arr, _Q = 0; _Ptr != 0; _Ptr = _Ptr->_Next)
            if (_Ptr->_Index == _Idx)
                return (*_Ptr);	
            else if (_Q == 0 && _Ptr->_Lo == 0 && _Ptr->_Vp == 0)
                _Q = _Ptr;	

        if (_Q != 0)
            {	
            _Q->_Index = _Idx;
            return (*_Q);
            }

        _Arr = new _Iosarray(_Idx, _Arr);	
        return (*_Arr);
        }

	void __cdecl _Tidy()
        {	
        _Callfns(erase_event);
        _Iosarray *_Q1, *_Q2;

        for (_Q1 = _Arr; _Q1 != 0; _Q1 = _Q2)
            _Q2 = _Q1->_Next, delete (_Q1);	
        _Arr = 0;

        _Fnarray *_Q3, *_Q4;
        for (_Q3 = _Calls; _Q3 != 0; _Q3 = _Q4)
            _Q4 = _Q3->_Next, delete (_Q3);	
        _Calls = 0;
        }

    static  void __cdecl _Ios_base_dtor(ios_base *);

	iostate _Mystate;	
	iostate _Except;	
	fmtflags _Fmtfl;	
	streamsize _Prec;	
	streamsize _Wide;	
	_Iosarray *_Arr;	
	_Fnarray *_Calls;	
	locale *_Ploc;	

	 static int _Index;	
	 static bool _Sync;	

    static  int& __cdecl _Index_func();
    static  bool& __cdecl _Sync_func();
	};

}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Elem,
	class _Traits>
	class basic_streambuf
	{	

	basic_streambuf(const basic_streambuf<_Elem, _Traits>&);	
	basic_streambuf<_Elem, _Traits>&
		operator=(const basic_streambuf<_Elem, _Traits>&);	
protected:
	basic_streambuf()
		: _Plocale(new(locale))
		{	
		_Init();
		}

	basic_streambuf(_Uninitialized)
		{	
		}

public:
	typedef basic_streambuf<_Elem, _Traits> _Myt;
	typedef _Elem char_type;
	typedef _Traits traits_type;

	virtual  ~basic_streambuf()
		{	
		delete (_Plocale);
		}

	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	pos_type pubseekoff(off_type _Off, ios_base::seekdir _Way,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		{	
		return (seekoff(_Off, _Way, _Mode));
		}

	pos_type pubseekoff(off_type _Off, ios_base::seek_dir _Way,
		ios_base::open_mode _Mode)
		{	
		return (pubseekoff(_Off, (ios_base::seekdir)_Way,
			(ios_base::openmode)_Mode));
		}

	pos_type pubseekpos(pos_type _Pos,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		{	
		return (seekpos(_Pos, _Mode));
		}

	pos_type pubseekpos(pos_type _Pos, ios_base::open_mode _Mode)
		{	
		return (seekpos(_Pos, (ios_base::openmode)_Mode));
		}

	_Myt *pubsetbuf(_Elem *_Buffer, streamsize _Count)
		{	
		return (setbuf(_Buffer, _Count));
		}

	locale pubimbue(const locale &_Newlocale)
		{	
		locale _Oldlocale = *_Plocale;
		imbue(_Newlocale);
		*_Plocale = _Newlocale;
		return (_Oldlocale);
		}

	locale getloc() const
		{	
		return (*_Plocale);
		}

	streamsize in_avail()
		{	
		streamsize _Res = _Gnavail();
		return (0 < _Res ? _Res : showmanyc());
		}

	int pubsync()
		{	
		return (sync());
		}

	int_type sbumpc()
		{	
		return (0 < _Gnavail()
			? _Traits::to_int_type(*_Gninc()) : uflow());
		}

	int_type sgetc()
		{	
		return (0 < _Gnavail()
			? _Traits::to_int_type(*gptr()) : underflow());
		}

	streamsize _Sgetn_s(_Elem *_Ptr, size_t _Ptr_size, streamsize _Count)
		{	
		return _Xsgetn_s(_Ptr, _Ptr_size, _Count);
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	streamsize sgetn(_Elem *_Ptr, streamsize _Count)
		{	
#pragma warning(push)
#pragma warning(disable:4996)
		return xsgetn(_Ptr, _Count);
#pragma warning(pop)
		}

	int_type snextc()
		{	
		return (1 < _Gnavail()
			? _Traits::to_int_type(*_Gnpreinc())
			: _Traits::eq_int_type(_Traits::eof(), sbumpc())
				? _Traits::eof() : sgetc());
		}

	int_type sputbackc(_Elem _Ch)
		{	
		return (gptr() != 0 && eback() < gptr()
			&& _Traits::eq(_Ch, gptr()[-1])
			? _Traits::to_int_type(*_Gndec())
			: pbackfail(_Traits::to_int_type(_Ch)));
		}

	void stossc()
		{	
		if (0 < _Gnavail())
			_Gninc();
		else
			uflow();
		}

	int_type sungetc()
		{	
		return (gptr() != 0 && eback() < gptr()
			? _Traits::to_int_type(*_Gndec()) : pbackfail());
		}

	int_type sputc(_Elem _Ch)
		{	
		return (0 < _Pnavail()
			? _Traits::to_int_type(*_Pninc() = _Ch)
			: overflow(_Traits::to_int_type(_Ch)));
		}

	streamsize sputn(const _Elem *_Ptr, streamsize _Count)
		{	
		return (xsputn(_Ptr, _Count));
		}

	void _Lock()
		{	
		_Mylock._Lock();
		}

	void _Unlock()
		{	
		_Mylock._Unlock();
		}
protected:
	_Elem *eback() const
		{	
		return (*_IGfirst);
		}

	_Elem *gptr() const
		{	
		return (*_IGnext);
		}

	_Elem *pbase() const
		{	
		return (*_IPfirst);
		}

	_Elem *pptr() const
		{	
		return (*_IPnext);
		}

	_Elem *egptr() const
		{	
		return (*_IGnext + *_IGcount);
		}

	void gbump(int _Off)
		{	
		*_IGcount -= _Off;
		*_IGnext += _Off;
		}

	void setg(_Elem *_First, _Elem *_Next, _Elem *_Last)
		{	
		*_IGfirst = _First;
		*_IGnext = _Next;
		*_IGcount = (int)(_Last - _Next);
		}

	_Elem *epptr() const
		{	
		return (*_IPnext + *_IPcount);
		}

	_Elem *_Gndec()
		{	
		++*_IGcount;
		return (--*_IGnext);
		}

	_Elem *_Gninc()
		{	
		--*_IGcount;
		return ((*_IGnext)++);
		}

	_Elem *_Gnpreinc()
		{	
		--*_IGcount;
		return (++(*_IGnext));
		}

	streamsize _Gnavail() const
		{	
		return (*_IGnext != 0 ? *_IGcount : 0);
		}

	void pbump(int _Off)
		{	
		*_IPcount -= _Off;
		*_IPnext += _Off;
		}

	void setp(_Elem *_First, _Elem *_Last)
		{	
		*_IPfirst = _First;
		*_IPnext = _First;
		*_IPcount = (int)(_Last - _First);
		}

	void setp(_Elem *_First, _Elem *_Next, _Elem *_Last)
		{	
		*_IPfirst = _First;
		*_IPnext = _Next;
		*_IPcount = (int)(_Last - _Next);
		}

	_Elem *_Pninc()
		{	
		--*_IPcount;
		return ((*_IPnext)++);
		}

	streamsize _Pnavail() const
		{	
		return (*_IPnext != 0 ? *_IPcount : 0);
		}

	void _Init()
		{	
		_IGfirst = &_Gfirst, _IPfirst = &_Pfirst;
		_IGnext = &_Gnext, _IPnext = &_Pnext;
		_IGcount = &_Gcount, _IPcount = &_Pcount;
		setp(0, 0), setg(0, 0, 0);
		}

	void _Init(_Elem **_Gf, _Elem **_Gn, int *_Gc,
		_Elem **_Pf, _Elem **_Pn, int *_Pc)
		{	
		_IGfirst = _Gf, _IPfirst = _Pf;
		_IGnext = _Gn, _IPnext = _Pn;
		_IGcount = _Gc, _IPcount = _Pc;
		}

	virtual int_type  overflow(int_type = _Traits::eof())
		{	
		return (_Traits::eof());
		}

	virtual int_type  pbackfail(int_type = _Traits::eof())
		{	
		return (_Traits::eof());
		}

	virtual streamsize  showmanyc()
		{	
		return (0);
		}

	virtual int_type  underflow()
		{	
		return (_Traits::eof());
		}

	virtual int_type  uflow()
		{	
		return (_Traits::eq_int_type(_Traits::eof(), underflow())
			? _Traits::eof() : _Traits::to_int_type(*_Gninc()));
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	virtual streamsize  xsgetn(_Elem * _Ptr,
		streamsize _Count)
		{	
		
		return _Xsgetn_s(_Ptr, (size_t)-1, _Count);
		}

	virtual streamsize  _Xsgetn_s(_Elem * _Ptr,
		size_t _Ptr_size, streamsize _Count)
		{	
		int_type _Meta;
		streamsize _Stream_size, _Size, _Copied;

		for (_Copied = 0; 0 < _Count; )
			if (0 < (_Stream_size = _Gnavail()))
				{	
				_Size = _Stream_size;
				if (_Count < _Size)
					_Size = _Count;
				_Traits_helper::copy_s<_Traits>(_Ptr, _Ptr_size, gptr(), _Size);
				_Ptr += _Size;
				_Copied += _Size;
				_Count -= _Size;
				gbump((int)_Size);
				}
			else if (_Traits::eq_int_type(_Traits::eof(), _Meta = uflow()))
				break;	
			else
				{	
				*_Ptr++ = _Traits::to_char_type(_Meta);
				++_Copied;
				--_Count;
				}

		return (_Copied);
		}

	virtual streamsize  xsputn(const _Elem *_Ptr,
		streamsize _Count)
		{	
		streamsize _Stream_size, _Size, _Copied;

		for (_Copied = 0; 0 < _Count; )
			if (0 < (_Stream_size = _Pnavail()))
				{	
				_Size = _Stream_size;
				if (_Count < _Size)
					_Size = _Count;
				_Traits_helper::copy_s<_Traits>(pptr(), _Stream_size, _Ptr, _Size);
				_Ptr += _Size;
				_Copied += _Size;
				_Count -= _Size;
				pbump((int)_Size);
				}
			else if (_Traits::eq_int_type(_Traits::eof(),
				overflow(_Traits::to_int_type(*_Ptr))))
				break;	
			else
				{	
				++_Ptr;
				++_Copied;
				--_Count;
				}

		return (_Copied);
		}

	virtual pos_type  seekoff(off_type, ios_base::seekdir,
		ios_base::openmode = ios_base::in | ios_base::out)
		{	
		return (streampos(_BADOFF));
		}

	virtual pos_type  seekpos(pos_type,
		ios_base::openmode = ios_base::in | ios_base::out)
		{	
		return (streampos(_BADOFF));
		}

	virtual _Myt * setbuf(_Elem *, streamsize)
		{	
		return (this);
		}

	virtual int  sync()
		{	
		return (0);
		}

	virtual void  imbue(const locale&)
		{	
		}

private:
	_Mutex _Mylock;	
	_Elem *_Gfirst;	
	_Elem *_Pfirst;	
	_Elem **_IGfirst;	
	_Elem **_IPfirst;	
	_Elem *_Gnext;	
	_Elem *_Pnext;	
	_Elem **_IGnext;	
	_Elem **_IPnext;	
	int _Gcount;	
	int _Pcount;	
	int *_IGcount;	
	int *_IPcount;	
	locale *_Plocale;	
	};
template class __declspec(dllimport) basic_streambuf<char, char_traits<char> >;
template class __declspec(dllimport) basic_streambuf<wchar_t, char_traits<wchar_t> >;

}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
		
extern "C" {

extern __declspec(dllimport) long __cdecl _Stolx(const char *,                     char **,
	int, int *);
extern __declspec(dllimport) unsigned long __cdecl _Stoulx(const char *,
	                    char **, int, int *);
extern __declspec(dllimport) float __cdecl _Stofx(const char *,                     char **,
	long, int *);
extern __declspec(dllimport) double __cdecl _Stodx(const char *,                     char **,
	long, int *);
extern __declspec(dllimport) long double __cdecl _Stoldx(const char *,
	                    char **, long, int *);

}
namespace std {
		
template<class _Elem>
	class numpunct
		: public locale::facet
	{	
public:
	typedef basic_string<_Elem, char_traits<_Elem>, allocator<_Elem> >
		string_type;
	typedef _Elem char_type;

	 static locale::id id;	

	_Elem  decimal_point() const
		{	
		return (do_decimal_point());
		}

	_Elem  thousands_sep() const
		{	
		return (do_thousands_sep());
		}

	string  grouping() const
		{	
		return (do_grouping());
		}

	string_type  falsename() const
		{	
		return (do_falsename());
		}

	string_type  truename() const
		{	
		return (do_truename());
		}

	explicit  numpunct(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
			if (_Kseparator == 0)
				_Kseparator =	
					_Maklocchr(',', (_Elem *)0, _Lobj._Getcvt());
		}
		}

	 numpunct(const _Locinfo& _Lobj, size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new numpunct<_Elem>;
		return (4);
		}

protected:
	virtual  ~numpunct()
		{	
		_Tidy();
		}

protected:
	 numpunct(const char *_Locname, size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		{ _Locinfo _Lobj(_Locname);
			_Init(_Lobj);
		}
		}

	void  _Init(const _Locinfo& _Lobj)
		{	
		const lconv *_Ptr = _Lobj._Getlconv();

		_Grouping = 0;
		_Falsename = 0;
		_Truename = 0;

		try {
		_Grouping = _Maklocstr(_Ptr->grouping, (char *)0, _Lobj._Getcvt());
		_Falsename = _Maklocstr(_Lobj._Getfalse(), (_Elem *)0, _Lobj._Getcvt());
		_Truename = _Maklocstr(_Lobj._Gettrue(), (_Elem *)0, _Lobj._Getcvt());
		} catch (...) {
		_Tidy();
		throw;
		}

		_Dp = _Maklocchr(_Ptr->decimal_point[0], (_Elem *)0, _Lobj._Getcvt());
		_Kseparator =
			_Maklocchr(_Ptr->thousands_sep[0], (_Elem *)0, _Lobj._Getcvt());
		}

	virtual _Elem  do_decimal_point() const
		{	
		return (_Dp);
		}

	virtual _Elem  do_thousands_sep() const
		{	
		return (_Kseparator);
		}

	virtual string  do_grouping() const
		{	
		return (string(_Grouping));
		}

	virtual string_type  do_falsename() const
		{	
		return (string_type(_Falsename));
		}

	virtual string_type  do_truename() const
		{	
		return (string_type(_Truename));
		}

private:
	void  _Tidy()
		{	
		delete[] ((void *)_Grouping);
		delete[] ((void *)_Falsename);
		delete[] ((void *)_Truename);
		}

	const char *_Grouping;	
	_Elem _Dp;	
	_Elem _Kseparator;	
	const _Elem *_Falsename;	
	const _Elem *_Truename;	
	};

typedef numpunct<char> _Npc;
typedef numpunct<wchar_t> _Npwc;

		
template<class _Elem>
	class numpunct_byname
		: public numpunct<_Elem>
	{	
public:
	explicit  numpunct_byname(const char *_Locname, size_t _Refs = 0)
		: numpunct<_Elem>(_Locname, _Refs)
		{	
		}

protected:
	virtual  ~numpunct_byname()
		{	
		}
	};

		
template<class _Elem>
	 locale::id numpunct<_Elem>::id;

		
template<class _Elem,
	class _InIt = istreambuf_iterator<_Elem, char_traits<_Elem> > >
	class num_get
		: public locale::facet
	{	
public:
	typedef numpunct<_Elem> _Mypunct;
	typedef basic_string<_Elem, char_traits<_Elem>, allocator<_Elem> >
		_Mystr;

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new num_get<_Elem, _InIt>;
		return (4);
		}

	 static locale::id id;	

protected:
	virtual  ~num_get()
		{	
		}

protected:
	void _Init(const _Locinfo& _Lobj)
		{	
		_Cvt = _Lobj._Getcvt();
		}

	_Locinfo::_Cvtvec _Cvt;		

public:
	explicit  num_get(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 num_get(const _Locinfo& _Lobj, size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		_Init(_Lobj);
		}

	typedef _Elem char_type;
	typedef _InIt iter_type;

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase,	ios_base::iostate& _State,
			_Bool& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase,	ios_base::iostate& _State,
			unsigned short& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase,	ios_base::iostate& _State,
			unsigned int& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned long& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}
	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			__int64& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned __int64& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}
	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			float& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			double& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long double& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			void *& _Val) const
		{	
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

protected:
	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			_Bool& _Val) const
		{	
		;
		int _Ans = -1;	

		if (_Iosbase.flags() & ios_base::boolalpha)
			{	
			typedef typename _Mystr::size_type _Mystrsize;
			const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
			_Mystr _Str((_Mystrsize)1, (char_type)0);
			_Str += _Punct_fac.falsename();
			_Str += (char_type)0;
			_Str += _Punct_fac.truename();	
			_Ans = _Getloctxt(_First, _Last, (size_t)2, _Str.c_str());
			}
		else
			{	
			char _Ac[32], *_Ep;
			int _Errno = 0;
			const unsigned long _Ulo = ::_Stoulx(_Ac, &_Ep,
				_Getifld(_Ac, _First, _Last, _Iosbase.flags(),
					_Iosbase.getloc()), &_Errno);
			if (_Ep != _Ac && _Errno == 0 && _Ulo <= 1)
				_Ans = _Ulo;
			}

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ans < 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans != 0;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned short& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		int _Base = _Getifld(_Ac, _First, _Last, _Iosbase.flags(),
			_Iosbase.getloc());	
		char *_Ptr = _Ac[0] == '-' ? _Ac + 1 : _Ac;	
		const unsigned long _Ans =
			::_Stoulx(_Ptr, &_Ep, _Base, &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ptr || _Errno != 0 || 0xffff < _Ans)
			_State |= ios_base::failbit;
		else
			_Val = (unsigned short)(_Ac[0] == '-'
				? 0 -_Ans : _Ans);	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned int& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		int _Base = _Getifld(_Ac, _First, _Last, _Iosbase.flags(),
			_Iosbase.getloc());	
		char *_Ptr = _Ac[0] == '-' ? _Ac + 1 : _Ac;	
		const unsigned long _Ans =
			::_Stoulx(_Ptr, &_Ep, _Base, &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ptr || _Errno != 0 || 0xffffffff < _Ans)
			_State |= ios_base::failbit;
		else
			_Val = _Ac[0] == '-' ? 0 -_Ans : _Ans;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const long _Ans = ::_Stolx(_Ac, &_Ep,
			_Getifld(_Ac, _First, _Last, _Iosbase.flags(),
				_Iosbase.getloc()), &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned long& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const unsigned long _Ans = ::_Stoulx(_Ac, &_Ep,
			_Getifld(_Ac, _First, _Last, _Iosbase.flags(),
				_Iosbase.getloc()), &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}
	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			__int64& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const __int64 _Ans = ::_strtoi64(_Ac, &_Ep, _Getifld(_Ac, _First, _Last, _Iosbase.flags(), _Iosbase.getloc()));	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned __int64& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const unsigned __int64 _Ans = ::_strtoui64(_Ac, &_Ep, _Getifld(_Ac, _First, _Last, _Iosbase.flags(), _Iosbase.getloc()));	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}
	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			float& _Val) const
		{	
		;
		char _Ac[8 + 36 + 16], *_Ep;
		int _Errno = 0;
		const float _Ans = ::_Stofx(_Ac, &_Ep,
			_Getffld(_Ac, _First, _Last,
				_Iosbase.getloc()), &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			double& _Val) const
		{	
		;
		char _Ac[8 + 36 + 16], *_Ep;
		int _Errno = 0;
		const double _Ans = ::_Stodx(_Ac, &_Ep,
			_Getffld(_Ac, _First, _Last,
				_Iosbase.getloc()), &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long double& _Val) const
		{	
		;
		char _Ac[8 + 36 + 16], *_Ep;
		int _Errno = 0;
		const long double _Ans = ::_Stoldx(_Ac, &_Ep,
			_Getffld(_Ac, _First, _Last,
				_Iosbase.getloc()), &_Errno);	

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			void *& _Val) const
		{	
		;
		char _Ac[32], *_Ep;
		int _Errno = 0;
		int _Base = _Getifld(_Ac, _First, _Last, ios_base::hex,
			_Iosbase.getloc());	
		const unsigned __int64 _Ans =
			(sizeof (void *) == sizeof (unsigned long))
				? (unsigned __int64)::_Stoulx(_Ac, &_Ep, _Base, &_Errno)
				: ::_strtoui64(_Ac, &_Ep, _Base);
		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = (void *)(uintptr_t)_Ans;	
		return (_First);
		}

private:
	int __cdecl _Getifld(     char *_Ac,
		_InIt& _First, _InIt& _Last, ios_base::fmtflags _Basefield,
			const locale& _Loc) const
		{	
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Loc);
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _Kseparator = _Punct_fac.thousands_sep();
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		char *_Ptr = _Ac;

		if (_First == _Last)
			;	
		else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
			*_Ptr++ = '+', ++_First;	
		else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
			*_Ptr++ = '-', ++_First;	

		_Basefield &= ios_base::basefield;
		int _Base = _Basefield == ios_base::oct ? 8
			: _Basefield == ios_base::hex ? 16
			: _Basefield == ios_base::_Fmtzero ? 0 : 10;

		bool _Seendigit = false;	
		bool _Nonzero = false;	

		if (_First != _Last && *_First == _E0)
			{	
			_Seendigit = true, ++_First;
			if (_First != _Last && (*_First == _Maklocchr('x', (_Elem *)0, _Cvt)
					|| *_First == _Maklocchr('X', (_Elem *)0, _Cvt))
				&& (_Base == 0 || _Base == 16))
				_Base = 16, _Seendigit = false, ++_First;
			else if (_Base == 0)
				_Base = 8;
			}

		int _Dlen = _Base == 0 || _Base == 10 ? 10
			: _Base == 8 ? 8 : 16 + 6;
		string _Groups((size_t)1, (char)_Seendigit);
		size_t _Group = 0;

		for (char *const _Pe = &_Ac[32 - 1];
			_First != _Last; ++_First)
			if (::memchr("0123456789abcdefABCDEF",
				*_Ptr = _Maklocbyte((_Elem)*_First, _Cvt), _Dlen) != 0)
				{	
				if ((_Nonzero || *_Ptr != '0') && _Ptr < _Pe)
					++_Ptr, _Nonzero = true;
				_Seendigit = true;
				if (_Groups[_Group] != 127)
					++_Groups[_Group];
				}
			else if (_Groups[_Group] == '\0'
				|| _Kseparator == (_Elem)0
				|| *_First != _Kseparator)
				break;	
			else
				{	
				_Groups.append((string::size_type)1, '\0');
				++_Group;
				}

		if (_Group == 0)
			;	
		else if ('\0' < _Groups[_Group])
			++_Group;	
		else
			_Seendigit = false;	

		for (const char *_Pg = _Grouping.c_str(); _Seendigit && 0 < _Group; )
			if (*_Pg == 127)
				break;	
			else if (0 < --_Group && *_Pg != _Groups[_Group]
				|| 0 == _Group && *_Pg < _Groups[_Group])
				_Seendigit = false;	
			else if ('\0' < _Pg[1])
				++_Pg;	

		if (_Seendigit && !_Nonzero)
			*_Ptr++ = '0';	
		else if (!_Seendigit)
			_Ptr = _Ac;	
		*_Ptr = '\0';
		return (_Base);
		}

	int __cdecl _Getffld(     char *_Ac,
		_InIt& _First, _InIt &_Last, const locale& _Loc) const
		{	
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Loc);
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		char *_Ptr = _Ac;
		bool _Bad = false;

		if (_First == _Last)
			;	
		else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
			*_Ptr++ = '+', ++_First;	
		else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
			*_Ptr++ = '-', ++_First;	

		bool _Seendigit = false;	
		int _Significant = 0;	
		int _Pten = 0;	

		if (*_Grouping.c_str() == 127 || *_Grouping.c_str() <= '\0')
			for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
					_Seendigit = true, ++_First)
				if (36 <= _Significant)
					++_Pten;	
				else if (*_First == _E0 && _Significant == 0)
					;	
				else
					{	
					*_Ptr++ = (char)((*_First - _E0) + '0');
					++_Significant;
					}
		else
			{	
			const _Elem _Kseparator = _Punct_fac.thousands_sep();
			string _Groups((size_t)1, '\0');
			size_t _Group = 0;

			for (; _First != _Last; ++_First)
				if (_E0 <= *_First && *_First <= _E0 + 9)
					{	
					_Seendigit = true;
					if (36 <= _Significant)
						++_Pten;	
					else if (*_First == _E0 && _Significant == 0)
						;	
					else
						{	
						*_Ptr++ = (char)((*_First - _E0) + '0');
						++_Significant;
						}
					if (_Groups[_Group] != 127)
						++_Groups[_Group];
					}
				else if (_Groups[_Group] == '\0'
					|| _Kseparator == (_Elem)0
					|| *_First != _Kseparator)
					break;	
				else
					{	
					_Groups.append((size_t)1, '\0');
					++_Group;
					}
			if (_Group == 0)
				;	
			else if ('\0' < _Groups[_Group])
				++_Group;	
			else
				_Bad = true;	

			for (const char *_Pg = _Grouping.c_str();
				!_Bad && 0 < _Group; )
				if (*_Pg == 127)
					break;	
				else if (0 < --_Group && *_Pg != _Groups[_Group]
					|| 0 == _Group && *_Pg < _Groups[_Group])
					_Bad = true;	
				else if ('\0' < _Pg[1])
					++_Pg;	
			}

		if (_Seendigit && _Significant == 0)
			*_Ptr++ = '0';	

		if (_First != _Last && *_First == _Punct_fac.decimal_point())
			*_Ptr++ = localeconv()->decimal_point[0], ++_First;	

		if (_Significant == 0)
			{	
			for (; _First != _Last && *_First == _E0;
				_Seendigit = true, ++_First)
				--_Pten;	
			if (_Pten < 0)
				*_Ptr++ = '0', ++_Pten;	
			}

		for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
				_Seendigit = true, ++_First)
			if (_Significant < 36)
				{	
				*_Ptr++ = (char)((*_First - _E0) + '0');
				++_Significant;
				}

		if (_Seendigit && _First != _Last
			&& (*_First == _Maklocchr('e', (_Elem *)0, _Cvt)
				|| *_First == _Maklocchr('E', (_Elem *)0, _Cvt)))
			{	
			*_Ptr++ = 'e', ++_First;
			_Seendigit = false, _Significant = 0;

			if (_First == _Last)
				;	
			else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
				*_Ptr++ = '+', ++_First;	
			else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
				*_Ptr++ = '-', ++_First;	
			for (; _First != _Last && *_First == _E0; )
				_Seendigit = true, ++_First;	
			if (_Seendigit)
				*_Ptr++ = '0';	
			for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
				_Seendigit = true, ++_First)
				if (_Significant < 8)
					{	
					*_Ptr++ = (char)((*_First - _E0) + '0');
					++_Significant;
					}
			}

		if (_Bad || !_Seendigit)
			_Ptr = _Ac;	
		*_Ptr = '\0';
		return (_Pten);
		}
	};

		
template<class _Elem,
	class _InIt>
	 locale::id num_get<_Elem, _InIt>::id;

		
template<class _Elem,
	class _OutIt = ostreambuf_iterator<_Elem, char_traits<_Elem> > >
	class num_put
		: public locale::facet
	{	
public:
	typedef numpunct<_Elem> _Mypunct;
	typedef basic_string<_Elem, char_traits<_Elem>, allocator<_Elem> >
		_Mystr;

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0)
		{	
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new num_put<_Elem, _OutIt>;
		return (4);
		}

	 static locale::id id;	

protected:
	virtual  ~num_put()
		{	
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	
		_Cvt = _Lobj._Getcvt();
		}

	_Locinfo::_Cvtvec _Cvt;		

public:
	explicit  num_put(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 num_put(const _Locinfo& _Lobj, size_t _Refs = 0)
		: locale::facet(_Refs)
		{	
		_Init(_Lobj);
		}

	typedef _Elem char_type;
	typedef _OutIt iter_type;

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, _Bool _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned long _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}
	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, __int64 _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned __int64 _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}
	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, double _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long double _Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, const void *_Val) const
		{	
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

protected:
	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, _Bool _Val) const
		{	
		;
		if (!(_Iosbase.flags() & ios_base::boolalpha))
			return (do_put(_Dest, _Iosbase, _Fill, (long)_Val));
		else
			{	
			const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
			_Mystr _Str;
			if (_Val)
				_Str.assign(_Punct_fac.truename());
			else
				_Str.assign(_Punct_fac.falsename());

			size_t _Fillcount = _Iosbase.width() <= 0
				|| (size_t)_Iosbase.width() <= _Str.size()
					? 0 : (size_t)_Iosbase.width() - _Str.size();

			if ((_Iosbase.flags() & ios_base::adjustfield) != ios_base::left)
				{	
				_Dest = _Rep(_Dest, _Fill, _Fillcount);
				_Fillcount = 0;
				}
			_Dest = _Put(_Dest, _Str.c_str(), _Str.size());	
			_Iosbase.width(0);
			return (_Rep(_Dest, _Fill, _Fillcount));	
			}
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long _Val) const
		{	
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[6];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "ld",
				_Iosbase.flags()), _Val)));
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned long _Val) const
		{	
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[6];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "lu",
				_Iosbase.flags()), _Val)));
		}
	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, __int64 _Val) const
		{	
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[8];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "Ld",
				_Iosbase.flags()), _Val)));
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned __int64 _Val) const
		{	
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[8];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "Lu",
				_Iosbase.flags()), _Val)));
		}
	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, double _Val) const
		{	
		const size_t _Buf_size = 8 + 36 + 64;
		char _Buf[_Buf_size], _Fmt[8];
		streamsize _Precision = _Iosbase.precision() <= 0
			&& !(_Iosbase.flags() & ios_base::fixed)
				? 6 : _Iosbase.precision();	
		int _Significance = 36 < _Precision
			? 36 : (int)_Precision;	
		_Precision -= _Significance;
		size_t _Beforepoint = 0;	
		size_t _Afterpoint = 0;	

		if ((_Iosbase.flags() & ios_base::floatfield) == ios_base::fixed)
			{	
			bool _Signed = _Val < 0;
			if (_Signed)
				_Val = -_Val;

			for (; 1e35 <= _Val && _Beforepoint < 5000; _Beforepoint += 10)
				_Val /= 1e10;	

			if (0 < _Val)
				for (; 10 <= _Precision && _Val <= 1e-35
					&& _Afterpoint < 5000; _Afterpoint += 10)
					{	
					_Val *= 1e10;
					_Precision -= 10;
					}

			if (_Signed)
				_Val = -_Val;
			}

		return (_Fput(_Dest, _Iosbase, _Fill, _Buf,
			_Beforepoint, _Afterpoint, _Precision,
				::sprintf_s(_Buf, _Buf_size, _Ffmt(_Fmt, 0, _Iosbase.flags()),
					_Significance, _Val)));	
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long double _Val) const
		{	
		const size_t _Buf_size = 8 + 36 + 64;
		char _Buf[_Buf_size], _Fmt[8];
		streamsize _Precision = _Iosbase.precision() <= 0
			&& !(_Iosbase.flags() & ios_base::fixed)
				? 6 : _Iosbase.precision();	
		int _Significance = 36 < _Precision
			? 36 : (int)_Precision;	
		_Precision -= _Significance;
		size_t _Beforepoint = 0;	
		size_t _Afterpoint = 0;	

		if ((_Iosbase.flags() & ios_base::floatfield) == ios_base::fixed)
			{	
			bool _Signed = _Val < 0;
			if (_Signed)
				_Val = -_Val;

			for (; 1e35 <= _Val && _Beforepoint < 5000; _Beforepoint += 10)
				_Val /= 1e10;	

			if (0 < _Val)
				for (; 10 <= _Precision && _Val <= 1e-35
					&& _Afterpoint < 5000; _Afterpoint += 10)
					{	
					_Val *= 1e10;
					_Precision -= 10;
					}

			if (_Signed)
				_Val = -_Val;
			}

		return (_Fput(_Dest, _Iosbase, _Fill, _Buf,
			_Beforepoint, _Afterpoint, _Precision,
				::sprintf_s(_Buf, _Buf_size, _Ffmt(_Fmt, 'L', _Iosbase.flags()),
					_Significance, _Val)));	
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, const void *_Val) const
		{	
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, "%p", _Val)));
		}

private:
	char *__cdecl _Ffmt(     char *_Fmt,
		char _Spec, ios_base::fmtflags _Flags) const
		{	
		char *_Ptr = _Fmt;
		*_Ptr++ = '%';

		if (_Flags & ios_base::showpos)
			*_Ptr++ = '+';
		if (_Flags & ios_base::showpoint)
			*_Ptr++ = '#';
		*_Ptr++ = '.';
		*_Ptr++ = '*';	
		if (_Spec != '\0')
			*_Ptr++ = _Spec;	

		ios_base::fmtflags _Ffl = _Flags & ios_base::floatfield;
		*_Ptr++ = _Ffl == ios_base::fixed ? 'f'
			: _Ffl == ios_base::scientific ? 'e' : 'g';	
		*_Ptr = '\0';
		return (_Fmt);
		}

	_OutIt __cdecl _Fput(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, const char *_Buf,
			size_t _Beforepoint, size_t _Afterpoint,
				size_t _Trailing, size_t _Count) const
		{	
		;
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _Kseparator = _Punct_fac.thousands_sep();
		string _Groupstring;
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		size_t _Prefix = _Buf[0] == '+' || _Buf[0] == '-' ? 1 : 0;

		char _Enders[3];
		_Enders[0] = ::localeconv()->decimal_point[0];
		_Enders[1] = 'e';
		_Enders[2] = '\0';

		const char *_Eptr = (const char *)::memchr(_Buf,
			'e', _Count);	
		const char *_Pointptr = (const char *)::memchr(_Buf,
			_Enders[0], _Count);	
		if (_Pointptr == 0)
			_Trailing = 0;

		if (*_Grouping.c_str() != 127 && '\0' < *_Grouping.c_str())
			{	
			_Groupstring.append(_Buf, _Count);	
			if (_Eptr == 0)
				_Groupstring.append(_Trailing, '0');
			else
				{	
				if (_Pointptr == 0)
					{	
					_Groupstring.append(_Beforepoint, '0');
					_Beforepoint = 0;
					}
				_Groupstring.insert(_Eptr - _Buf, _Trailing, '0');
				}
			_Trailing = 0;

			if (_Pointptr == 0)
				_Groupstring.append(_Beforepoint, '0');
			else
				{	
				_Groupstring.insert(_Pointptr - _Buf + 1, _Afterpoint, '0');
				_Groupstring.insert(_Pointptr - _Buf, _Beforepoint, '0');
				_Afterpoint = 0;
				}
			_Beforepoint = 0;

			const char *_Pg = _Grouping.c_str();
			size_t _Off = ::strcspn(&_Groupstring[0], &_Enders[0]);
			while (*_Pg != 127 && '\0' < *_Pg
				&& (size_t)*_Pg < _Off - _Prefix)
				{	
				_Groupstring.insert(_Off -= *_Pg, (size_t)1, '\0');
				if ('\0' < _Pg[1])
					++_Pg;	
				}

			_Buf = &_Groupstring[0];
			_Trailing = 0;
			_Count = _Groupstring.size();
			}

		size_t _Fillcount = _Beforepoint + _Afterpoint + _Trailing + _Count;
		_Fillcount = _Iosbase.width() <= 0
			|| (size_t)_Iosbase.width() <= _Fillcount
				? 0 : (size_t)_Iosbase.width() - _Fillcount;
		ios_base::fmtflags _Adjustfield =
			_Iosbase.flags() & ios_base::adjustfield;
		if (_Adjustfield != ios_base::left
			&& _Adjustfield != ios_base::internal)
			{	
			_Dest = _Rep(_Dest, _Fill, _Fillcount);
			_Fillcount = 0;
			}
		else if (_Adjustfield == ios_base::internal)
			{	
			if (0 < _Prefix)
				{	
				_Dest = _Putc(_Dest, _Buf, 1);
				++_Buf, --_Count;
				}
			_Dest = _Rep(_Dest, _Fill, _Fillcount);
			_Fillcount = 0;
			}

		_Pointptr = (const char *)::memchr(_Buf,
			_Enders[0], _Count);	
		if (_Pointptr != 0)
			{	
			size_t _Fracoffset = _Pointptr - _Buf + 1;
			_Dest = _Putgrouped(_Dest, _Buf, _Fracoffset - 1, _Kseparator);
			_Dest = _Rep(_Dest, _E0, _Beforepoint);
			_Dest = _Rep(_Dest, _Punct_fac.decimal_point(), 1);
			_Dest = _Rep(_Dest, _E0, _Afterpoint);
			_Buf += _Fracoffset, _Count -= _Fracoffset;
			}

		_Eptr = (const char *)::memchr(_Buf,
			'e', _Count);	
		if (_Eptr != 0)
			{	
			size_t _Expoffset = _Eptr - _Buf + 1;
			_Dest = _Putgrouped(_Dest, _Buf, _Expoffset - 1, _Kseparator);
			_Dest = _Rep(_Dest, _E0, _Trailing), _Trailing = 0;
			_Dest = _Putc(_Dest, _Iosbase.flags() & ios_base::uppercase
				? "E" : "e", 1);
			_Buf += _Expoffset, _Count -= _Expoffset;
			}

		_Dest = _Putgrouped(_Dest, _Buf, _Count,
			_Kseparator);	
		_Dest = _Rep(_Dest, _E0, _Trailing);	
		_Iosbase.width(0);
		return (_Rep(_Dest, _Fill, _Fillcount));	
		}

	char *__cdecl _Ifmt(     char *_Fmt,
		const char *_Spec, ios_base::fmtflags _Flags) const
		{	
		char *_Ptr = _Fmt;
		*_Ptr++ = '%';

		if (_Flags & ios_base::showpos)
			*_Ptr++ = '+';
		if (_Flags & ios_base::showbase)
			*_Ptr++ = '#';
		if (_Spec[0] != 'L')
			*_Ptr++ = _Spec[0];	
		else
			{	
			*_Ptr++ = 'I';
			*_Ptr++ = '6';
			*_Ptr++ = '4';
			}

		ios_base::fmtflags _Basefield = _Flags & ios_base::basefield;
		*_Ptr++ = _Basefield == ios_base::oct ? 'o'
			: _Basefield != ios_base::hex ? _Spec[1]	
			: _Flags & ios_base::uppercase ? 'X' : 'x';
		*_Ptr = '\0';
		return (_Fmt);
		}

	_OutIt __cdecl _Iput(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill,        char *_Buf, size_t _Count) const
		{	
		;
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
		const string _Grouping = _Punct_fac.grouping();
		const size_t _Prefix = *_Buf == '+' || *_Buf == '-' ? 1
			: *_Buf == '0' && (_Buf[1] == 'x' || _Buf[1] == 'X') ? 2
			: 0;

		if (*_Grouping.c_str() != 127 && '\0' < *_Grouping.c_str())
			{	
			const char *_Pg = _Grouping.c_str();
			size_t _Off = _Count;
			while (*_Pg != 127 && '\0' < *_Pg
				&& (size_t)*_Pg < _Off - _Prefix)
				{	
				_Off -= *_Pg;
				::memmove_s((&_Buf[_Off + 1]), (_Count + 1 - _Off), (&_Buf[_Off]), (_Count + 1 - _Off));
				_Buf[_Off] = '\0', ++_Count;
				if ('\0' < _Pg[1])
					++_Pg;	
				}
			}

		size_t _Fillcount = _Iosbase.width() <= 0
			|| (size_t)_Iosbase.width() <= _Count
				? 0 : (size_t)_Iosbase.width() - _Count;

		ios_base::fmtflags _Adjustfield =
			_Iosbase.flags() & ios_base::adjustfield;
		if (_Adjustfield != ios_base::left
			&& _Adjustfield != ios_base::internal)
			{	
			_Dest = _Rep(_Dest, _Fill, _Fillcount);
			_Fillcount = 0;
			}
		else if (_Adjustfield == ios_base::internal)
			{	
			_Dest = _Putc(_Dest, _Buf, _Prefix);	
			_Buf += _Prefix, _Count -= _Prefix;
			_Dest = _Rep(_Dest, _Fill, _Fillcount), _Fillcount = 0;
			}

		_Dest = _Putgrouped(_Dest, _Buf, _Count,
			_Punct_fac.thousands_sep());	
		_Iosbase.width(0);
		return (_Rep(_Dest, _Fill, _Fillcount));	
		}

	_OutIt __cdecl _Put(_OutIt _Dest,
		const _Elem *_Ptr, size_t _Count) const
		{	
		for (; 0 < _Count; --_Count, ++_Dest, ++_Ptr)
			*_Dest = *_Ptr;
		return (_Dest);
		}

	_OutIt __cdecl _Putc(_OutIt _Dest,
		const char *_Ptr, size_t _Count) const
		{	
		for (; 0 < _Count; --_Count, ++_Dest, ++_Ptr)
			*_Dest = _Maklocchr(*_Ptr, (_Elem *)0, _Cvt);
		return (_Dest);
		}

	_OutIt __cdecl _Putgrouped(_OutIt _Dest,
		const char *_Ptr, size_t _Count, _Elem _Kseparator) const
		{	
		for (; ; ++_Ptr, --_Count)
			{	
			const char *_Pend =
				(const char *)::memchr(_Ptr, '\0', _Count);
			size_t _Groupsize = _Pend != 0 ? _Pend - _Ptr : _Count;

			_Dest = _Putc(_Dest, _Ptr, _Groupsize);
			_Ptr += _Groupsize, _Count -= _Groupsize;
			if (_Count == 0)
				break;
			if (_Kseparator != (_Elem)0)
				_Dest = _Rep(_Dest, _Kseparator, 1);
			}
		return (_Dest);
		}

	_OutIt __cdecl _Rep(_OutIt _Dest,
		_Elem _Ch, size_t _Count) const
		{	
		for (; 0 < _Count; --_Count, ++_Dest)
			*_Dest = _Ch;
		return (_Dest);
		}
	};

		
template<class _Elem,
	class _OutIt>
	 locale::id num_put<_Elem, _OutIt>::id;
template class __declspec(dllimport) numpunct<char>;
template class __declspec(dllimport) num_get<char,
	istreambuf_iterator<char, char_traits<char> > >;
template class __declspec(dllimport) num_put<char,
	ostreambuf_iterator<char, char_traits<char> > >;

template class __declspec(dllimport) numpunct<wchar_t>;
template class __declspec(dllimport) num_get<wchar_t,
	istreambuf_iterator<wchar_t, char_traits<wchar_t> > >;
template class __declspec(dllimport) num_put<wchar_t,
	ostreambuf_iterator<wchar_t, char_traits<wchar_t> > >;

}
#pragma warning(pop)
#pragma pack(pop)

#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Elem,
	class _Traits>
	class basic_ios
		: public ios_base
	{	
public:
	typedef basic_ios<_Elem, _Traits> _Myt;
	typedef basic_ostream<_Elem, _Traits> _Myos;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef ctype<_Elem> _Ctype;
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	explicit  basic_ios(_Mysb *_Strbuf)
		{	
		init(_Strbuf);
		}

	virtual  ~basic_ios()
		{	
		}

	void  clear(iostate _State = goodbit, bool _Reraise = false)
		{	
		ios_base::clear((iostate)(_Mystrbuf == 0
			? (int)_State | (int)badbit : (int)_State), _Reraise);
		}

	void  clear(io_state _State)
		{	
		clear((iostate)_State);
		}

	void  setstate(iostate _State, bool _Reraise = false)
		{	
		if (_State != goodbit)
			clear((iostate)((int)rdstate() | (int)_State), _Reraise);
		}

	void  setstate(io_state _State)
		{	
		setstate((iostate)_State);
		}

	_Myt&  copyfmt(const _Myt& _Right)
		{	
		_Tiestr = _Right.tie();
		_Fillch = _Right.fill();
		ios_base::copyfmt(_Right);
		return (*this);
		}

	_Myos * tie() const
		{	
		return (_Tiestr);
		}

	_Myos * tie(_Myos *_Newtie)
		{	
		_Myos *_Oldtie = _Tiestr;
		_Tiestr = _Newtie;
		return (_Oldtie);
		}

	_Mysb * rdbuf() const
		{	
		return (_Mystrbuf);
		}

	_Mysb * rdbuf(_Mysb *_Strbuf)
		{	
		_Mysb *_Oldstrbuf = _Mystrbuf;
		_Mystrbuf = _Strbuf;
		clear();
		return (_Oldstrbuf);
		}

	locale  imbue(const locale& _Loc)
		{	
		locale _Oldlocale = ios_base::imbue(_Loc);
		if (rdbuf() != 0)
			rdbuf()->pubimbue(_Loc);
		return (_Oldlocale);
		}

	_Elem  fill() const
		{	
		return (_Fillch);
		}

	_Elem  fill(_Elem _Newfill)
		{	
		_Elem _Oldfill = _Fillch;
		_Fillch = _Newfill;
		return (_Oldfill);
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	
		const _Ctype& _Ctype_fac = use_facet<_Ctype >(getloc());
		return (_Ctype_fac.narrow(_Ch, _Dflt));
		}

	_Elem  widen(char _Byte) const
		{	
		const _Ctype& _Ctype_fac = use_facet<_Ctype >(getloc());
		return (_Ctype_fac.widen(_Byte));
		}

protected:
	void  init(_Mysb *_Strbuf = 0,
		bool _Isstd = false)
		{	
		_Init();	
		_Mystrbuf = _Strbuf;
		_Tiestr = 0;
		_Fillch = widen(' ');

		if (_Mystrbuf == 0)
			setstate(badbit);

		if (_Isstd)
			_Addstd(this);	
		else
			_Stdstr = 0;
		}

	 basic_ios()
		{	
		}

private:
	 basic_ios(const _Myt&);	
	_Myt&  operator=(const _Myt&);	

	_Mysb *_Mystrbuf;	
	_Myos *_Tiestr;	
	_Elem _Fillch;	
	};
template class __declspec(dllimport) basic_ios<char,
	char_traits<char> >;
template class __declspec(dllimport) basic_ios<wchar_t,
	char_traits<wchar_t> >;
		
inline ios_base& __cdecl boolalpha(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::boolalpha);
	return (_Iosbase);
	}

inline ios_base& __cdecl dec(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::dec, ios_base::basefield);
	return (_Iosbase);
	}

inline ios_base& __cdecl fixed(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::fixed, ios_base::floatfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl hex(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::hex, ios_base::basefield);
	return (_Iosbase);
	}

inline ios_base& __cdecl internal(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::internal, ios_base::adjustfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl left(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::left, ios_base::adjustfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl noboolalpha(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::boolalpha);
	return (_Iosbase);
	}

inline ios_base& __cdecl noshowbase(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::showbase);
	return (_Iosbase);
	}

inline ios_base& __cdecl noshowpoint(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::showpoint);
	return (_Iosbase);
	}

inline ios_base& __cdecl noshowpos(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::showpos);
	return (_Iosbase);
	}

inline ios_base& __cdecl noskipws(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::skipws);
	return (_Iosbase);
	}

inline ios_base& __cdecl nounitbuf(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::unitbuf);
	return (_Iosbase);
	}

inline ios_base& __cdecl nouppercase(ios_base& _Iosbase)
	{	
	_Iosbase.unsetf(ios_base::uppercase);
	return (_Iosbase);
	}

inline ios_base& __cdecl oct(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::oct, ios_base::basefield);
	return (_Iosbase);
	}

inline ios_base& __cdecl right(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::right, ios_base::adjustfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl scientific(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::scientific, ios_base::floatfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl showbase(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::showbase);
	return (_Iosbase);
	}

inline ios_base& __cdecl showpoint(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::showpoint);
	return (_Iosbase);
	}

inline ios_base& __cdecl showpos(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::showpos);
	return (_Iosbase);
	}

inline ios_base& __cdecl skipws(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::skipws);
	return (_Iosbase);
	}

inline ios_base& __cdecl unitbuf(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::unitbuf);
	return (_Iosbase);
	}

inline ios_base& __cdecl uppercase(ios_base& _Iosbase)
	{	
	_Iosbase.setf(ios_base::uppercase);
	return (_Iosbase);
	}
}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		

		
template<class _Elem,
	class _Traits>
	class basic_ostream
		: virtual public basic_ios<_Elem, _Traits>
	{	
public:
	typedef basic_ostream<_Elem, _Traits> _Myt;
	typedef basic_ios<_Elem, _Traits> _Myios;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef ostreambuf_iterator<_Elem, _Traits> _Iter;
	typedef num_put<_Elem, _Iter> _Nput;

	explicit  basic_ostream(basic_streambuf<_Elem, _Traits> *_Strbuf,
		bool _Isstd = false)
		{	
		_Myios::init(_Strbuf, _Isstd);
		}

	 basic_ostream(_Uninitialized)
		{	
		ios_base::_Addstd(this);
		}

	virtual  ~basic_ostream()
		{	
		}

	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	class _Sentry_base
		{	
	public:
		 _Sentry_base(_Myt& _Ostr)
			: _Myostr(_Ostr)
			{	
			if (_Myostr.rdbuf() != 0)
				_Myostr.rdbuf()->_Lock();
			}

		 ~_Sentry_base()
			{	
			if (_Myostr.rdbuf() != 0)
				_Myostr.rdbuf()->_Unlock();
			}

		_Myt& _Myostr;	
		};

	class sentry
		: public _Sentry_base
		{	
	public:
		explicit  sentry(_Myt& _Ostr)
			: _Sentry_base(_Ostr)
			{	
			if (_Ostr.good() && _Ostr.tie() != 0)
				_Ostr.tie()->flush();
			_Ok = _Ostr.good();	
			}

		 ~sentry()
			{	
			if (!std:: uncaught_exception())
				this->_Myostr._Osfx();
			}
		 operator bool() const
			{	
			return (_Ok);
			}

	private:
		 sentry(const sentry&);	
		sentry&  operator=(const sentry&);	

		bool _Ok;	
		};

	bool  opfx()
		{	
		if (ios_base::good() && _Myios::tie() != 0)
			_Myios::tie()->flush();
		return (ios_base::good());
		}

	void  osfx()
		{	
		_Osfx();
		}

	void  _Osfx()
		{	
		try {
		if (ios_base::flags() & ios_base::unitbuf)
			flush();	
		} catch (...) {
		}
		}
	_Myt&  operator<<(_Myt& (__cdecl *_Pfn)(_Myt&))
		{	
		;
		return ((*_Pfn)(*this));
		}

	_Myt&  operator<<(_Myios& (__cdecl *_Pfn)(_Myios&))
		{	
		;
		(*_Pfn)(*(_Myios *)this);
		return (*this);
		}

	_Myt&  operator<<(ios_base& (__cdecl *_Pfn)(ios_base&))
		{	
		;
		(*_Pfn)(*(ios_base *)this);
		return (*this);
		}

	_Myt&  operator<<(_Bool _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(short _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());
			ios_base::fmtflags _Bfl =
				ios_base::flags() & ios_base::basefield;
			long _Tmp = (_Bfl == ios_base::oct
				|| _Bfl == ios_base::hex)
				? (long)(unsigned short)_Val : (long)_Val;

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Tmp).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}
	_Myt&  operator<<(unsigned short _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (unsigned long)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(int _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());
			ios_base::fmtflags _Bfl =
				ios_base::flags() & ios_base::basefield;
			long _Tmp = (_Bfl == ios_base::oct
				|| _Bfl == ios_base::hex)
				? (long)(unsigned int)_Val : (long)_Val;

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Tmp).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(unsigned int __w64 _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (unsigned long)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(long _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(unsigned long __w64 _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (unsigned long)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}
	_Myt&  operator<<(__int64 _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(unsigned __int64 _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}
	_Myt&  operator<<(float _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (double)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(double _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(long double _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(const void *_Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(_Mysb *_Strbuf)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		bool _Copied = false;
		const sentry _Ok(*this);

		if (_Ok && _Strbuf != 0)
			for (int_type _Meta = _Traits::eof(); ; _Copied = true)
				{	
				try {
				_Meta = _Traits::eq_int_type(_Traits::eof(), _Meta)
					? _Strbuf->sgetc() : _Strbuf->snextc();
				} catch (...) {
					_Myios::setstate(ios_base::failbit);
					throw;
				}

				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					break;	

				try {
					if (_Traits::eq_int_type(_Traits::eof(),
						_Myios::rdbuf()->sputc(
							_Traits::to_char_type(_Meta))))
						{	
						_State |= ios_base::badbit;
						break;
						}
				} catch (...) { _Myios::setstate(ios_base::badbit, true); }
				}

		ios_base::width(0);
		_Myios::setstate(_Strbuf == 0 ? ios_base::badbit
			: !_Copied ? _State | ios_base::failbit : _State);
		return (*this);
		}

	_Myt&  put(_Elem _Ch)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (!_Ok)
			_State |= ios_base::badbit;
		else
			{	
			try {
			if (_Traits::eq_int_type(_Traits::eof(),
				_Myios::rdbuf()->sputc(_Ch)))
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  write(const _Elem *_Str,
		streamsize _Count)
		{	
		;
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (!_Ok)
			_State |= ios_base::badbit;
		else
			{	
			try {
			if (_Myios::rdbuf()->sputn(_Str, _Count) != _Count)
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  flush()
		{	
		ios_base::iostate _State = ios_base::goodbit;
		if (!ios_base::fail() && _Myios::rdbuf()->pubsync() == -1)
			_State |= ios_base::badbit;	
		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  seekp(pos_type _Pos)
		{	
		if (!ios_base::fail()
			&& (off_type)_Myios::rdbuf()->pubseekpos(_Pos,
				ios_base::out) == _BADOFF)
			_Myios::setstate(ios_base::failbit);
		return (*this);
		}

	_Myt&  seekp(off_type _Off, ios_base::seekdir _Way)
		{	
		if (!ios_base::fail()
			&& (off_type)_Myios::rdbuf()->pubseekoff(_Off, _Way,
				ios_base::out) == _BADOFF)
			_Myios::setstate(ios_base::failbit);
		return (*this);
		}

	pos_type  tellp()
		{	
		if (!ios_base::fail())
			return (_Myios::rdbuf()->pubseekoff(0,
				ios_base::cur, ios_base::out));
		else
			return (pos_type(_BADOFF));
		}
	};
template class __declspec(dllimport) basic_ostream<char, char_traits<char> >;
template class __declspec(dllimport) basic_ostream<wchar_t, char_traits<wchar_t> >;
		

 template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr, const char *_Val)
	{	
	ios_base::iostate _State = ios_base::goodbit;
	streamsize _Count = (streamsize)::strlen(_Val);	
	streamsize _Pad = _Ostr.width() <= 0 || _Ostr.width() <= _Count
		? 0 : _Ostr.width() - _Count;
	const typename basic_ostream<_Elem, _Traits>::sentry _Ok(_Ostr);

	if (!_Ok)
		_State |= ios_base::badbit;
	else
		{	
		try {
		const ctype<_Elem>& _Ctype_fac = use_facet<ctype<_Elem> >(_Ostr.getloc());
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}

		for (; _State == ios_base::goodbit && 0 < _Count; --_Count, ++_Val)
			if (_Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ctype_fac.widen(*_Val))))
					_State |= ios_base::badbit;

		if (_State == ios_base::goodbit)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}
		_Ostr.width(0);
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr, char _Ch)
	{	
	ios_base::iostate _State = ios_base::goodbit;
	const typename basic_ostream<_Elem, _Traits>::sentry _Ok(_Ostr);

	if (_Ok)
		{	
		const ctype<_Elem>& _Ctype_fac = use_facet<ctype<_Elem> >(_Ostr.getloc());
		streamsize _Pad = _Ostr.width() <= 1 ? 0 : _Ostr.width() - 1;

		try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; _State == ios_base::goodbit && 0 < _Pad;
				--_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					_State |= ios_base::badbit;

		if (_State == ios_base::goodbit
			&& _Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ctype_fac.widen(_Ch))))
			_State |= ios_base::badbit;

		for (; _State == ios_base::goodbit && 0 < _Pad;
			--_Pad)	
			if (_Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ostr.fill())))
				_State |= ios_base::badbit;
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.width(0);
	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Traits> inline
	basic_ostream<char, _Traits>& __cdecl operator<<(
		basic_ostream<char, _Traits>& _Ostr,
		const char *_Val)
	{	
	typedef char _Elem;
	typedef basic_ostream<_Elem, _Traits> _Myos;
	ios_base::iostate _State = ios_base::goodbit;
	streamsize _Count = (streamsize)_Traits::length(_Val);	
	streamsize _Pad = _Ostr.width() <= 0 || _Ostr.width() <= _Count
		? 0 : _Ostr.width() - _Count;
	const typename _Myos::sentry _Ok(_Ostr);

	if (!_Ok)
		_State |= ios_base::badbit;
	else
		{	
		try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}

		if (_State == ios_base::goodbit
			&& _Ostr.rdbuf()->sputn(_Val, _Count) != _Count)
			_State |= ios_base::badbit;

		if (_State == ios_base::goodbit)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}
		_Ostr.width(0);
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Traits> inline
	basic_ostream<char, _Traits>& __cdecl operator<<(
		basic_ostream<char, _Traits>& _Ostr, char _Ch)
	{	
	typedef char _Elem;
	typedef basic_ostream<_Elem, _Traits> _Myos;
	ios_base::iostate _State = ios_base::goodbit;
	const typename _Myos::sentry _Ok(_Ostr);

	if (_Ok)
		{	
		streamsize _Pad = _Ostr.width() <= 1 ? 0 : _Ostr.width() - 1;

		try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; _State == ios_base::goodbit && 0 < _Pad;
				--_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					_State |= ios_base::badbit;

		if (_State == ios_base::goodbit
			&& _Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ch)))
			_State |= ios_base::badbit;

		for (; _State == ios_base::goodbit && 0 < _Pad;
			--_Pad)	
			if (_Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ostr.fill())))
				_State |= ios_base::badbit;
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.width(0);
	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr, const _Elem *_Val)
	{	
	typedef basic_ostream<_Elem, _Traits> _Myos;
	ios_base::iostate _State = ios_base::goodbit;
	streamsize _Count = (streamsize)_Traits::length(_Val);	
	streamsize _Pad = _Ostr.width() <= 0 || _Ostr.width() <= _Count
		? 0 : _Ostr.width() - _Count;
	const typename _Myos::sentry _Ok(_Ostr);

	if (!_Ok)
		_State |= ios_base::badbit;
	else
		{	
		try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}

		if (_State == ios_base::goodbit
			&& _Ostr.rdbuf()->sputn(_Val, _Count) != _Count)
			_State |= ios_base::badbit;

		if (_State == ios_base::goodbit)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}
		_Ostr.width(0);
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr, _Elem _Ch)
	{	
	typedef basic_ostream<_Elem, _Traits> _Myos;
	ios_base::iostate _State = ios_base::goodbit;
	const typename _Myos::sentry _Ok(_Ostr);

	if (_Ok)
		{	
		streamsize _Pad = _Ostr.width() <= 1 ? 0 : _Ostr.width() - 1;

		try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; _State == ios_base::goodbit && 0 < _Pad;
				--_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					_State |= ios_base::badbit;

		if (_State == ios_base::goodbit
			&& _Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ch)))
			_State |= ios_base::badbit;

		for (; _State == ios_base::goodbit && 0 < _Pad;
			--_Pad)	
			if (_Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ostr.fill())))
				_State |= ios_base::badbit;
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.width(0);
	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Traits> inline
	basic_ostream<char, _Traits>& __cdecl operator<<(
		basic_ostream<char, _Traits>& _Ostr, const signed char *_Val)
	{	
	return (_Ostr << (const char *)_Val);
	}

template<class _Traits> inline
	basic_ostream<char, _Traits>& __cdecl operator<<(
		basic_ostream<char, _Traits>& _Ostr, signed char _Ch)
	{	
	return (_Ostr << (char)_Ch);
	}

template<class _Traits> inline
	basic_ostream<char, _Traits>& __cdecl operator<<(
		basic_ostream<char, _Traits>& _Ostr, const unsigned char *_Val)
	{	
	return (_Ostr << (const char *)_Val);
	}

template<class _Traits> inline
	basic_ostream<char, _Traits>& __cdecl operator<<(
		basic_ostream<char, _Traits>& _Ostr, unsigned char _Ch)
	{	
	return (_Ostr << (char)_Ch);
	}

		
template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>&
		__cdecl endl(basic_ostream<_Elem, _Traits>& _Ostr)
	{	
	_Ostr.put(_Ostr.widen('\n'));
	_Ostr.flush();
	return (_Ostr);
	}

template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>&
		__cdecl ends(basic_ostream<_Elem, _Traits>& _Ostr)
	{	
	_Ostr.put(_Elem());
	return (_Ostr);
	}

template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>&
		__cdecl flush(basic_ostream<_Elem, _Traits>& _Ostr)
	{	
	_Ostr.flush();
	return (_Ostr);
	}

__declspec(dllimport) inline basic_ostream<char, char_traits<char> >&
	__cdecl endl(basic_ostream<char, char_traits<char> >& _Ostr)
	{	
	_Ostr.put('\n');
	_Ostr.flush();
	return (_Ostr);
	}

__declspec(dllimport) inline basic_ostream<wchar_t, char_traits<wchar_t> >&
	__cdecl endl(basic_ostream<wchar_t,
		char_traits<wchar_t> >& _Ostr)
	{	
	_Ostr.put('\n');
	_Ostr.flush();
	return (_Ostr);
	}
__declspec(dllimport) inline basic_ostream<char, char_traits<char> >&
	__cdecl ends(basic_ostream<char, char_traits<char> >& _Ostr)
	{	
	_Ostr.put('\0');
	return (_Ostr);
	}

__declspec(dllimport) inline basic_ostream<wchar_t, char_traits<wchar_t> >&
	__cdecl ends(basic_ostream<wchar_t,
		char_traits<wchar_t> >& _Ostr)
	{	
	_Ostr.put('\0');
	return (_Ostr);
	}
__declspec(dllimport) inline basic_ostream<char, char_traits<char> >&
	__cdecl flush(basic_ostream<char, char_traits<char> >& _Ostr)
	{	
	_Ostr.flush();
	return (_Ostr);
	}

__declspec(dllimport) inline basic_ostream<wchar_t, char_traits<wchar_t> >&
	__cdecl flush(basic_ostream<wchar_t,
		char_traits<wchar_t> >& _Ostr)
	{	
	_Ostr.flush();
	return (_Ostr);
	}
}
#pragma warning(pop)
#pragma pack(pop)

#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Elem,
	class _Traits>
	class basic_istream
		: virtual public basic_ios<_Elem, _Traits>
	{	
public:
	typedef basic_istream<_Elem, _Traits> _Myt;
	typedef basic_ios<_Elem, _Traits> _Myios;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef istreambuf_iterator<_Elem, _Traits> _Iter;
	typedef ctype<_Elem> _Ctype;
	typedef num_get<_Elem, _Iter> _Nget;
	explicit  basic_istream(_Mysb *_Strbuf, bool _Isstd = false)
		: _Chcount(0)
		{	
		_Myios::init(_Strbuf, _Isstd);
		}

	 basic_istream(_Uninitialized)
		{	
		ios_base::_Addstd(this);
		}

	virtual  ~basic_istream()
		{	
		}

	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

		
	class _Sentry_base
		{	
	public:
		 _Sentry_base(_Myt& _Istr)
			: _Myistr(_Istr)
			{	
			if (_Myistr.rdbuf() != 0)
				_Myistr.rdbuf()->_Lock();
			}

		 ~_Sentry_base()
			{	
			if (_Myistr.rdbuf() != 0)
				_Myistr.rdbuf()->_Unlock();
			}

		_Myt& _Myistr;	
		};

	class sentry
		: public _Sentry_base
		{	
	public:
		explicit  sentry(_Myt& _Istr, bool _Noskip = false)
			: _Sentry_base(_Istr)
			{	
			_Ok = this->_Myistr._Ipfx(_Noskip);
			}

		 operator bool() const
			{	
			return (_Ok);
			}

	private:
		 sentry(const sentry&);	
		sentry&  operator=(const sentry&);	

		bool _Ok;	
		};

	bool  _Ipfx(bool _Noskip = false)
		{	
		if (ios_base::good())
			{	
			if (_Myios::tie() != 0)
				_Myios::tie()->flush();

			if (!_Noskip && ios_base::flags() & ios_base::skipws)
				{	
				const _Ctype& _Ctype_fac = use_facet<_Ctype >(ios_base::getloc());

				try {
				int_type _Meta = _Myios::rdbuf()->sgetc();

				for (; ; _Meta = _Myios::rdbuf()->snextc())
					if (_Traits::eq_int_type(_Traits::eof(), _Meta))
						{	
						_Myios::setstate(ios_base::eofbit);
						break;
						}
					else if (!_Ctype_fac.is(_Ctype::space,
						_Traits::to_char_type(_Meta)))
						break;	
				} catch (...) { _Myios::setstate(ios_base::badbit, true); }
				}

			if (ios_base::good())
				return (true);
			}
		_Myios::setstate(ios_base::failbit);
		return (false);
		}

	bool  ipfx(bool _Noskip = false)
		{	
		return _Ipfx(_Noskip);
		}

	void  isfx()
		{	
		}
	_Myt&  operator>>(_Myt& (__cdecl *_Pfn)(_Myt&))
		{	
		;
		return ((*_Pfn)(*this));
		}

	_Myt&  operator>>(_Myios& (__cdecl *_Pfn)(_Myios&))
		{	
		;
		(*_Pfn)(*(_Myios *)this);
		return (*this);
		}

	_Myt&  operator>>(ios_base& (__cdecl *_Pfn)(ios_base&))
		{	
		;
		(*_Pfn)(*(ios_base *)this);
		return (*this);
		}

	_Myt&  operator>>(_Bool& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(short& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			long _Tmp = 0;
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Tmp);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }

			if (_State & ios_base::failbit
				|| _Tmp < (-32768) || 32767 < _Tmp)
				_State |= ios_base::failbit;
			else
				_Val = (short)_Tmp;
			}

		_Myios::setstate(_State);
		return (*this);
		}
	_Myt&  operator>>(unsigned short& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(int& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			long _Tmp = 0;
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Tmp);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }

			if (_State & ios_base::failbit
				|| _Tmp < (-2147483647 - 1) || 2147483647 < _Tmp)
				_State |= ios_base::failbit;
			else
				_Val = _Tmp;
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(unsigned int& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);
		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(long& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());
			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(unsigned long __w64& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, (unsigned long)_Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}
	_Myt&  operator>>(__int64& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(unsigned __int64& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);
		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}
	_Myt&  operator>>(float& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(double& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);
		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(long double& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());
			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(void *& _Val)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	
			const _Nget& _Nget_fac = use_facet<_Nget >(ios_base::getloc());

			try {
			_Nget_fac.get(_Iter(_Myios::rdbuf()), _Iter(0),
				*this, _State, _Val);
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator>>(_Mysb *_Strbuf)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		bool _Copied = false;
		const sentry _Ok(*this);

		if (_Ok && _Strbuf != 0)
			{	
			try {
			int_type _Meta = _Myios::rdbuf()->sgetc();

			for (; ; _Meta = _Myios::rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else
					{	
					try {
						if (_Traits::eq_int_type(_Traits::eof(),
							_Strbuf->sputc(_Traits::to_char_type(_Meta))))
							break;
					} catch (...) {
						break;
					}
					_Copied = true;
					}
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(!_Copied ? _State | ios_base::failbit : _State);
		return (*this);
		}

	int_type  get()
		{	
		int_type _Meta = 0;
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (!_Ok)
			_Meta = _Traits::eof();	
		else
			{	
			try {
			_Meta = _Myios::rdbuf()->sbumpc();

			if (_Traits::eq_int_type(_Traits::eof(), _Meta))
				_State |= ios_base::eofbit | ios_base::failbit;	
			else
				++_Chcount;	
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (_Meta);
		}

	_Myt&  get(_Elem *_Str, streamsize _Count)
		{	
		return (get(_Str, _Count, _Myios::widen('\n')));
		}

	_Myt&  get(_Elem *_Str,
		streamsize _Count, _Elem _Delim)
		{	
		;
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok && 0 < _Count)
			{	
			try {
			int_type _Meta = _Myios::rdbuf()->sgetc();

			for (; 0 < --_Count; _Meta = _Myios::rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else if (_Traits::to_char_type(_Meta) == _Delim)
					break;	
				else
					{	
					*_Str++ = _Traits::to_char_type(_Meta);
					++_Chcount;
					}
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_Chcount == 0
			? _State | ios_base::failbit : _State);
		*_Str = _Elem();	
		return (*this);
		}

	_Myt&  get(_Elem& _Ch)
		{	
		int_type _Meta = get();
		if (!_Traits::eq_int_type(_Traits::eof(), _Meta))
			_Ch = _Traits::to_char_type(_Meta);
		return (*this);
		}

	_Myt&  get(_Mysb& _Strbuf)
		{	
		return (get(_Strbuf, _Myios::widen('\n')));
		}

	_Myt&  get(_Mysb& _Strbuf, _Elem _Delim)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok)
			{	
			try {
			int_type _Meta = _Myios::rdbuf()->sgetc();

			for (; ; _Meta = _Myios::rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else
					{	
					try {
						_Elem _Ch = _Traits::to_char_type(_Meta);
						if (_Ch == _Delim
							|| _Traits::eq_int_type(_Traits::eof(),
								_Strbuf.sputc(_Ch)))
							break;
					} catch (...) {
						break;
					}
					++_Chcount;
					}
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		if (_Chcount == 0)
			_State |= ios_base::failbit;
		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  getline(_Elem *_Str, streamsize _Count)
		{	
		return (getline(_Str, _Count, _Myios::widen('\n')));
		}

	_Myt&  getline(_Elem *_Str,
		streamsize _Count, _Elem _Delim)
		{	
		;
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok && 0 < _Count)
			{	
			int_type _Metadelim = _Traits::to_int_type(_Delim);

			try {
			int_type _Meta = _Myios::rdbuf()->sgetc();

			for (; ; _Meta = _Myios::rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else if (_Meta == _Metadelim)
					{	
					++_Chcount;
					_Myios::rdbuf()->sbumpc();
					break;
					}
				else if (--_Count <= 0)
					{	
					_State |= ios_base::failbit;
					break;
					}
				else
					{	
					++_Chcount;
					*_Str++ = _Traits::to_char_type(_Meta);
					}
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		*_Str = _Elem();	
		_Myios::setstate(_Chcount == 0 ? _State | ios_base::failbit : _State);
		return (*this);
		}

	_Myt&  ignore(streamsize _Count = 1,
		int_type _Metadelim = _Traits::eof())
		{	
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok && 0 < _Count)
			{	
			try {
			for (; ; )
				{	
				int_type _Meta;
				if (_Count != 2147483647 && --_Count < 0)
					break;	
				else if (_Traits::eq_int_type(_Traits::eof(),
					_Meta = _Myios::rdbuf()->sbumpc()))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else
					{	
					++_Chcount;
					if (_Meta == _Metadelim)
						break;	
					}
				}
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  _Read_s(_Elem *_Str, size_t _Str_size, streamsize _Count)
		{	
		;
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok)
			{	
			try {
			const streamsize _Num = _Myios::rdbuf()->_Sgetn_s(_Str, _Str_size, _Count);
			_Chcount += _Num;
			if (_Num != _Count)
				_State |= ios_base::eofbit | ios_base::failbit;	
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  read(_Elem *_Str, streamsize _Count)
		{
		return _Read_s(_Str, (size_t)-1, _Count);
		}

	streamsize  _Readsome_s(_Elem *_Str, size_t _Str_size, streamsize _Count)
		{	
		;
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);
		streamsize _Num;

		if (!_Ok)
			_State |= ios_base::failbit;	
		else if ((_Num = _Myios::rdbuf()->in_avail()) < 0)
			_State |= ios_base::eofbit;	
		else if (0 < _Num)
			_Read_s(_Str, _Str_size, _Num < _Count ? _Num : _Count);	

		_Myios::setstate(_State);
		return (gcount());
		}

	__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	streamsize  readsome(_Elem *_Str, streamsize _Count)
		{
		return _Readsome_s(_Str, (size_t)-1, _Count);
		}

	int_type  peek()
		{	
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		int_type _Meta = 0;
		const sentry _Ok(*this, true);

		if (!_Ok)
			_Meta = _Traits::eof();	
		else
			{	
			try {
			if (_Traits::eq_int_type(_Traits::eof(),
				_Meta = _Myios::rdbuf()->sgetc()))
				_State |= ios_base::eofbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (_Meta);
		}

	_Myt&  putback(_Elem _Ch)
		{	
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok)
			{	
			try {
			if (_Traits::eq_int_type(_Traits::eof(),
				_Myios::rdbuf()->sputbackc(_Ch)))
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  unget()
		{	
		ios_base::iostate _State = ios_base::goodbit;
		_Chcount = 0;
		const sentry _Ok(*this, true);

		if (_Ok)
			{	
			try {
			if (_Traits::eq_int_type(_Traits::eof(),
				_Myios::rdbuf()->sungetc()))
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	streamsize  gcount() const
		{	
		return (_Chcount);
		}

	int  sync()
		{	
		ios_base::iostate _State = ios_base::goodbit;
		int _Ans;

		if (_Myios::rdbuf() == 0)
			_Ans = -1;	
		else if (_Myios::rdbuf()->pubsync() == -1)
			{	
			_State |= ios_base::badbit;
			_Ans = -1;
			}
		else
			_Ans = 0;	

		_Myios::setstate(_State);
		return (_Ans);
		}

	_Myt&  seekg(pos_type _Pos)
		{	
		if (!ios_base::fail()
			&& (off_type)_Myios::rdbuf()->pubseekpos(_Pos,
				ios_base::in) == _BADOFF)
			_Myios::setstate(ios_base::failbit);
		return (*this);
		}

	_Myt&  seekg(off_type _Off, ios_base::seekdir _Way)
		{	
		if (!ios_base::fail()
			&& (off_type)_Myios::rdbuf()->pubseekoff(_Off, _Way,
				ios_base::in) == _BADOFF)
			_Myios::setstate(ios_base::failbit);
		return (*this);
		}

	pos_type  tellg()
		{	
		if (!ios_base::fail())
			return (_Myios::rdbuf()->pubseekoff(0,
				ios_base::cur, ios_base::in));
		else
			return (pos_type(_BADOFF));
		}

private:
	streamsize _Chcount;	
	};
template class __declspec(dllimport) basic_istream<char, char_traits<char> >;
template class __declspec(dllimport) basic_istream<wchar_t, char_traits<wchar_t> >;
		
template<class _Elem,
	class _Traits>
	class basic_iostream
	: public basic_istream<_Elem, _Traits>,
		public basic_ostream<_Elem, _Traits>
	{	
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	explicit  basic_iostream(basic_streambuf<_Elem, _Traits> *_Strbuf)
		: basic_istream<_Elem, _Traits>(_Strbuf, false),
			basic_ostream<_Elem, _Traits>(_Strbuf)
		{	
		}

	virtual  ~basic_iostream()
		{	
		}
	};
template class __declspec(dllimport) basic_iostream<char, char_traits<char> >;
template class __declspec(dllimport) basic_iostream<wchar_t, char_traits<wchar_t> >;
		
template<class _Elem,
	class _Traits> inline
	basic_istream<_Elem, _Traits>& __cdecl operator>>(
		basic_istream<_Elem, _Traits>& _Istr, _Elem *_Str)
	{	
	;
	typedef basic_istream<_Elem, _Traits> _Myis;
	typedef ctype<_Elem> _Ctype;
	ios_base::iostate _State = ios_base::goodbit;
	_Elem *_Str0 = _Str;
	const typename _Myis::sentry _Ok(_Istr);

	if (_Ok)
		{	
		const _Ctype& _Ctype_fac = use_facet<_Ctype >(_Istr.getloc());

		try {
		streamsize _Count = 0 < _Istr.width() ? _Istr.width() : 2147483647;
		typename _Myis::int_type _Meta = _Istr.rdbuf()->sgetc();
		_Elem _Ch;
		for (; 0 < --_Count; _Meta = _Istr.rdbuf()->snextc())
			if (_Traits::eq_int_type(_Traits::eof(), _Meta))
				{	
				_State |= ios_base::eofbit;
				break;
				}
			else if (_Ctype_fac.is(_Ctype::space,
				_Ch = _Traits::to_char_type(_Meta))
					|| _Ch == _Elem())
				break;	
			else
				*_Str++ = _Traits::to_char_type(_Meta);	
		} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
		}

	*_Str = _Elem();	
	_Istr.width(0);
	_Istr.setstate(_Str == _Str0 ? _State | ios_base::failbit : _State);
	return (_Istr);
	}

template<class _Elem,
	class _Traits> inline
	basic_istream<_Elem, _Traits>& __cdecl  operator>>(
		basic_istream<_Elem, _Traits>& _Istr, _Elem& _Ch)
	{	
	typedef basic_istream<_Elem, _Traits> _Myis;
	typename _Myis::int_type _Meta;
	ios_base::iostate _State = ios_base::goodbit;
	const typename _Myis::sentry _Ok(_Istr);

	if (_Ok)
		{	
		try {
		_Meta = _Istr.rdbuf()->sbumpc();
		if (_Traits::eq_int_type(_Traits::eof(), _Meta))
			_State |= ios_base::eofbit | ios_base::failbit;	
		else
			_Ch = _Traits::to_char_type(_Meta);	
		} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
		}

	_Istr.setstate(_State);
	return (_Istr);
	}

template<class _Traits> inline
	basic_istream<char, _Traits>& __cdecl  operator>>(
		basic_istream<char, _Traits>& _Istr, signed char *_Str)
	{	
	return (_Istr >> (char *)_Str);
	}

template<class _Traits> inline
	basic_istream<char, _Traits>& __cdecl  operator>>(
		basic_istream<char, _Traits>& _Istr, signed char& _Ch)
	{	
	return (_Istr >> (char&)_Ch);
	}

template<class _Traits> inline
	basic_istream<char, _Traits>& __cdecl  operator>>(
		basic_istream<char, _Traits>& _Istr, unsigned char *_Str)
	{	
	return (_Istr >> (char *)_Str);
	}

template<class _Traits> inline
	basic_istream<char, _Traits>& __cdecl  operator>>(
		basic_istream<char, _Traits>& _Istr, unsigned char& _Ch)
	{	
	return (_Istr >> (char&)_Ch);
	}

		
template<class _Elem,
	class _Traits> inline
	basic_istream<_Elem, _Traits>&
		__cdecl ws(basic_istream<_Elem, _Traits>& _Istr)
	{	
	typedef basic_istream<_Elem, _Traits> _Myis;
	typedef ctype<_Elem> _Ctype;

	if (!_Istr.eof())
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const typename _Myis::sentry _Ok(_Istr, true);

		if (_Ok)
			{	
			const _Ctype& _Ctype_fac = use_facet<_Ctype >(_Istr.getloc());

			try {
			for (typename _Traits::int_type _Meta = _Istr.rdbuf()->sgetc(); ;
				_Meta = _Istr.rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else if (!_Ctype_fac.is(_Ctype::space,
					_Traits::to_char_type(_Meta)))
					break;	
			} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
			}

		_Istr.setstate(_State);
		}
	return (_Istr);
	}

__declspec(dllimport) inline basic_istream<char, char_traits<char> >&
	__cdecl ws(basic_istream<char, char_traits<char> >& _Istr)
	{	
	typedef char _Elem;
	typedef char_traits<_Elem> _Traits;

	if (!_Istr.eof())
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const basic_istream<_Elem, _Traits>::sentry _Ok(_Istr, true);

		if (_Ok)
			{	
			const ctype<_Elem>& _Ctype_fac =
				use_facet<ctype<_Elem> >(_Istr.getloc());

			try {
			for (_Traits::int_type _Meta = _Istr.rdbuf()->sgetc(); ;
				_Meta = _Istr.rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else if (!_Ctype_fac.is(ctype<_Elem>::space,
					_Traits::to_char_type(_Meta)))
					break;	
			} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
			}

		_Istr.setstate(_State);
		}
	return (_Istr);
	}

__declspec(dllimport) inline basic_istream<wchar_t, char_traits<wchar_t> >&
	__cdecl ws(basic_istream<wchar_t, char_traits<wchar_t> >& _Istr)
	{	
	typedef wchar_t _Elem;
	typedef char_traits<_Elem> _Traits;

	if (!_Istr.eof())
		{	
		ios_base::iostate _State = ios_base::goodbit;
		const basic_istream<_Elem, _Traits>::sentry _Ok(_Istr, true);

		if (_Ok)
			{	
			const ctype<_Elem>& _Ctype_fac =
				use_facet<ctype<_Elem> >(_Istr.getloc());

			try {
			for (_Traits::int_type _Meta = _Istr.rdbuf()->sgetc(); ;
				_Meta = _Istr.rdbuf()->snextc())
				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					{	
					_State |= ios_base::eofbit;
					break;
					}
				else if (!_Ctype_fac.is(ctype<_Elem>::space,
					_Traits::to_char_type(_Meta)))
					break;	
			} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
			}

		_Istr.setstate(_State);
		}
	return (_Istr);
	}

template __declspec(dllimport) basic_istream<char, char_traits<char> >& __cdecl
	operator>>(basic_istream<char, char_traits<char> >&, char *);
template __declspec(dllimport) basic_istream<char, char_traits<char> >& __cdecl
	operator>>(basic_istream<char, char_traits<char> >&, char&);
template __declspec(dllimport) basic_istream<char, char_traits<char> >& __cdecl
	operator>>(basic_istream<char, char_traits<char> >&, signed char *);
template __declspec(dllimport) basic_istream<char, char_traits<char> >& __cdecl
	operator>>(basic_istream<char, char_traits<char> >&, signed char&);
template __declspec(dllimport) basic_istream<char, char_traits<char> >& __cdecl
	operator>>(basic_istream<char, char_traits<char> >&, unsigned char *);
template __declspec(dllimport) basic_istream<char, char_traits<char> >& __cdecl
	operator>>(basic_istream<char, char_traits<char> >&, unsigned char&);
template __declspec(dllimport) basic_istream<wchar_t, char_traits<wchar_t> >& __cdecl
	operator>>(basic_istream<wchar_t, char_traits<wchar_t> >&, wchar_t *);
template __declspec(dllimport) basic_istream<wchar_t, char_traits<wchar_t> >& __cdecl
	operator>>(basic_istream<wchar_t, char_traits<wchar_t> >&, wchar_t&);

}
#pragma warning(pop)
#pragma pack(pop)

#pragma pack(push,8)
#pragma warning(push,3)

 #pragma warning(disable: 4189)
namespace std {

		
template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_string<_Elem, _Traits, _Alloc> __cdecl operator+(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (basic_string<_Elem, _Traits, _Alloc>(_Left) += _Right);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_string<_Elem, _Traits, _Alloc> __cdecl operator+(
		const _Elem *_Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (basic_string<_Elem, _Traits, _Alloc>(_Left) += _Right);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_string<_Elem, _Traits, _Alloc> __cdecl operator+(
		const _Elem _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (basic_string<_Elem, _Traits, _Alloc>(1, _Left) += _Right);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_string<_Elem, _Traits, _Alloc> __cdecl operator+(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (basic_string<_Elem, _Traits, _Alloc>(_Left) += _Right);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_string<_Elem, _Traits, _Alloc> __cdecl operator+(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem _Right)
	{	
	return (basic_string<_Elem, _Traits, _Alloc>(_Left) += _Right);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator==(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (_Left.compare(_Right) == 0);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator==(
		const _Elem * _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (_Right.compare(_Left) == 0);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator==(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (_Left.compare(_Right) == 0);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator!=(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator!=(
		const _Elem *_Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator!=(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator<(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (_Left.compare(_Right) < 0);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator<(
		const _Elem * _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (_Right.compare(_Left) > 0);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator<(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (_Left.compare(_Right) < 0);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator>(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator>(
		const _Elem * _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator>(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (_Right < _Left);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator<=(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator<=(
		const _Elem * _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator<=(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator>=(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (!(_Left < _Right));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator>=(
		const _Elem * _Left,
		const basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	
	return (!(_Left < _Right));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	bool __cdecl operator>=(
		const basic_string<_Elem, _Traits, _Alloc>& _Left,
		const _Elem *_Right)
	{	
	return (!(_Left < _Right));
	}
template __declspec(dllimport) basic_string<char,
	char_traits<char>, allocator<char> > __cdecl operator+(
		const basic_string<char, char_traits<char>, allocator<char> >&,
		const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) basic_string<char,
	char_traits<char>, allocator<char> > __cdecl operator+(
		const char *,
		const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) basic_string<char,
	char_traits<char>, allocator<char> > __cdecl operator+(
		const char,
		const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) basic_string<char,
	char_traits<char>, allocator<char> > __cdecl operator+(
		const basic_string<char, char_traits<char>, allocator<char> >&,
		const char *);
template __declspec(dllimport) basic_string<char,
	char_traits<char>, allocator<char> > __cdecl operator+(
		const basic_string<char, char_traits<char>, allocator<char> >&,
		const char);

template __declspec(dllimport) bool __cdecl operator==(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator==(
	const char *,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator==(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const char *);

template __declspec(dllimport) bool __cdecl operator!=(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator!=(
	const char *,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator!=(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const char *);

template __declspec(dllimport) bool __cdecl operator<(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator<(
	const char *,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator<(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const char *);

template __declspec(dllimport) bool __cdecl operator>(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator>(
	const char *,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator>(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const char *);

template __declspec(dllimport) bool __cdecl operator<=(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator<=(
	const char *,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator<=(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const char *);

template __declspec(dllimport) bool __cdecl operator>=(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator>=(
	const char *,
	const basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) bool __cdecl operator>=(
	const basic_string<char, char_traits<char>, allocator<char> >&,
	const char *);

template __declspec(dllimport) basic_string<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> > __cdecl operator+(
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&,
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&);
template __declspec(dllimport) basic_string<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> > __cdecl operator+(
		const wchar_t *,
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&);
template __declspec(dllimport) basic_string<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> > __cdecl operator+(
		const wchar_t,
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&);
template __declspec(dllimport) basic_string<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> > __cdecl operator+(
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&,
		const wchar_t *);
template __declspec(dllimport) basic_string<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> > __cdecl operator+(
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&,
		const wchar_t);

template __declspec(dllimport) bool __cdecl operator==(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator==(
	const wchar_t *,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator==(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const wchar_t *);

template __declspec(dllimport) bool __cdecl operator!=(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator!=(
	const wchar_t *,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator!=(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const wchar_t *);

template __declspec(dllimport) bool __cdecl operator<(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator<(
	const wchar_t *,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator<(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const wchar_t *);

template __declspec(dllimport) bool __cdecl operator>(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator>(
	const wchar_t *,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator>(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const wchar_t *);

template __declspec(dllimport) bool __cdecl operator<=(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator<=(
	const wchar_t *,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator<=(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const wchar_t *);

template __declspec(dllimport) bool __cdecl operator>=(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator>=(
	const wchar_t *,
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) bool __cdecl operator>=(
	const basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
	const wchar_t *);
		
template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_istream<_Elem, _Traits>& __cdecl operator>>(
		basic_istream<_Elem, _Traits>& _Istr,
		basic_string<_Elem, _Traits, _Alloc>& _Str)
	{	
	typedef ctype<_Elem> _Ctype;
	typedef basic_istream<_Elem, _Traits> _Myis;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystr;
	typedef typename _Mystr::size_type _Mysizt;

	ios_base::iostate _State = ios_base::goodbit;
	bool _Changed = false;
	const typename _Myis::sentry _Ok(_Istr);

	if (_Ok)
		{	
		const _Ctype& _Ctype_fac = use_facet<_Ctype >(_Istr.getloc());
		_Str.erase();

		try {
		_Mysizt _Size = 0 < _Istr.width()
			&& (_Mysizt)_Istr.width() < _Str.max_size()
				? (_Mysizt)_Istr.width() : _Str.max_size();
		typename _Traits::int_type _Meta = _Istr.rdbuf()->sgetc();

		for (; 0 < _Size; --_Size, _Meta = _Istr.rdbuf()->snextc())
			if(_Traits::eq_int_type(_Traits::eof(), _Meta))
				{	
				_State |= ios_base::eofbit;
				break;
				}
			else if (_Ctype_fac.is(_Ctype::space,
				_Traits::to_char_type(_Meta)))
				break;	
			else
				{	
				_Str.append(1, _Traits::to_char_type(_Meta));
				_Changed = true;
				}
		} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
		}

	_Istr.width(0);
	if (!_Changed)
		_State |= ios_base::failbit;
	_Istr.setstate(_State);
	return (_Istr);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_istream<_Elem, _Traits>& __cdecl getline(
		basic_istream<_Elem, _Traits>& _Istr,
		basic_string<_Elem, _Traits, _Alloc>& _Str,
		const _Elem _Delim)
	{	
	typedef basic_istream<_Elem, _Traits> _Myis;
	ios_base::iostate _State = ios_base::goodbit;
	bool _Changed = false;
	const typename _Myis::sentry _Ok(_Istr, true);

	if (_Ok)
		{	
		try {
		_Str.erase();
		const typename _Traits::int_type _Metadelim =
			_Traits::to_int_type(_Delim);
		typename _Traits::int_type _Meta = _Istr.rdbuf()->sgetc();

		for (; ; _Meta = _Istr.rdbuf()->snextc())
			if (_Traits::eq_int_type(_Traits::eof(), _Meta))
				{	
				_State |= ios_base::eofbit;
				break;
				}
			else if (_Traits::eq_int_type(_Meta, _Metadelim))
				{	
				_Changed = true;
				_Istr.rdbuf()->sbumpc();
				break;
				}
			else if (_Str.max_size() <= _Str.size())
				{	
				_State |= ios_base::failbit;
				break;
				}
			else
				{	
				_Str += _Traits::to_char_type(_Meta);
				_Changed = true;
				}
		} catch (...) { (_Istr).setstate(ios_base::badbit, true); }
		}

	if (!_Changed)
		_State |= ios_base::failbit;
	_Istr.setstate(_State);
	return (_Istr);
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_istream<_Elem, _Traits>& __cdecl getline(
		basic_istream<_Elem, _Traits>& _Istr,
		basic_string<_Elem, _Traits, _Alloc>& _Str)
	{	
	return (getline(_Istr, _Str, _Istr.widen('\n')));
	}

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr,
		const basic_string<_Elem, _Traits, _Alloc>& _Str)
	{	
	typedef basic_ostream<_Elem, _Traits> _Myos;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystr;
	typedef typename _Mystr::size_type _Mysizt;

	ios_base::iostate _State = ios_base::goodbit;
	_Mysizt _Size = _Str.size();
	_Mysizt _Pad = _Ostr.width() <= 0 || (_Mysizt)_Ostr.width() <= _Size
			? 0 : (_Mysizt)_Ostr.width() - _Size;
	const typename _Myos::sentry _Ok(_Ostr);

	if (!_Ok)
		_State |= ios_base::badbit;
	else
		{	
	try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}

		if (_State == ios_base::goodbit)
			for (_Mysizt _Count = 0; _Count < _Size; ++_Count)
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Str[_Count])))
					{	
					_State |= ios_base::badbit;
					break;
					}

		if (_State == ios_base::goodbit)
			for (; 0 < _Pad; --_Pad)	
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	
					_State |= ios_base::badbit;
					break;
					}
		_Ostr.width(0);
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.setstate(_State);
	return (_Ostr);
	}
template __declspec(dllimport) basic_istream<char,
	char_traits<char> >& __cdecl operator>>(
		basic_istream<char, char_traits<char> >&,
		basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) basic_istream<char,
	char_traits<char> >& __cdecl getline(
		basic_istream<char, char_traits<char> >&,
		basic_string<char, char_traits<char>, allocator<char> >&);
template __declspec(dllimport) basic_istream<char,
	char_traits<char> >& __cdecl getline(
		basic_istream<char, char_traits<char> >&,
		basic_string<char, char_traits<char>, allocator<char> >&,
		const char);
template __declspec(dllimport) basic_ostream<char,
	char_traits<char> >& __cdecl operator<<(
		basic_ostream<char, char_traits<char> >&,
		const basic_string<char, char_traits<char>, allocator<char> >&);

template __declspec(dllimport) basic_istream<wchar_t,
	char_traits<wchar_t> >& __cdecl operator>>(
		basic_istream<wchar_t, char_traits<wchar_t> >&,
		basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) basic_istream<wchar_t,
	char_traits<wchar_t> >& __cdecl getline(
		basic_istream<wchar_t, char_traits<wchar_t> >&,
		basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&);
template __declspec(dllimport) basic_istream<wchar_t,
	char_traits<wchar_t> >& __cdecl getline(
		basic_istream<wchar_t, char_traits<wchar_t> >&,
		basic_string<wchar_t, char_traits<wchar_t>, allocator<wchar_t> >&,
		const wchar_t);
template __declspec(dllimport) basic_ostream<wchar_t,
	char_traits<wchar_t> >& __cdecl operator<<(
		basic_ostream<wchar_t, char_traits<wchar_t> >&,
		const basic_string<wchar_t, char_traits<wchar_t>,
			allocator<wchar_t> >&);

}
 #pragma warning(default: 4189)
#pragma warning(pop)
#pragma pack(pop)
#pragma once

#pragma once

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Container>
	class back_insert_iterator
		: public _Outit
	{	
public:
	typedef _Container container_type;
	typedef typename _Container::reference reference;

	typedef _Range_checked_iterator_tag _Checked_iterator_category;

	explicit back_insert_iterator(_Container& _Cont)
		: container(&_Cont)
		{	
		}

	back_insert_iterator<_Container>& operator=(
		typename _Container::const_reference _Val)
		{	
		container->push_back(_Val);
		return (*this);
		}

	back_insert_iterator<_Container>& operator*()
		{	
		return (*this);
		}

	back_insert_iterator<_Container>& operator++()
		{	
		return (*this);
		}

	back_insert_iterator<_Container> operator++(int)
		{	
		return (*this);
		}

protected:
	_Container *container;	
	};

		
template<class _Container> inline
	back_insert_iterator<_Container> back_inserter(_Container& _Cont)
	{	
	return (std::back_insert_iterator<_Container>(_Cont));
	}

		
template<class _Container>
	class front_insert_iterator
		: public _Outit
	{	
public:
	typedef _Container container_type;
	typedef typename _Container::reference reference;

	typedef _Range_checked_iterator_tag _Checked_iterator_category;

	explicit front_insert_iterator(_Container& _Cont)
		: container(&_Cont)
		{	
		}

	front_insert_iterator<_Container>& operator=(
		typename _Container::const_reference _Val)
		{	
		container->push_front(_Val);
		return (*this);
		}

	front_insert_iterator<_Container>& operator*()
		{	
		return (*this);
		}

	front_insert_iterator<_Container>& operator++()
		{	
		return (*this);
		}

	front_insert_iterator<_Container> operator++(int)
		{	
		return (*this);
		}

protected:
	_Container *container;	
	};

		
template<class _Container> inline
	front_insert_iterator<_Container> front_inserter(_Container& _Cont)
	{	
	return (std::front_insert_iterator<_Container>(_Cont));
	}

		
template<class _Container>
	class insert_iterator
		: public _Outit
	{	
public:
	typedef _Container container_type;
	typedef typename _Container::reference reference;

	typedef _Range_checked_iterator_tag _Checked_iterator_category;

	insert_iterator(_Container& _Cont, typename _Container::iterator _Where)
		: container(&_Cont), iter(_Where)
		{	
		}

	insert_iterator<_Container>& operator=(
		typename _Container::const_reference _Val)
		{	
		iter = container->insert(iter, _Val);
		++iter;
		return (*this);
		}

	insert_iterator<_Container>& operator*()
		{	
		return (*this);
		}

	insert_iterator<_Container>& operator++()
		{	
		return (*this);
		}

	insert_iterator<_Container>& operator++(int)
		{	
		return (*this);
		}

protected:
	_Container *container;	
	typename _Container::iterator iter;	
	};

		
template<class _Container,
	class _Iter> inline
	insert_iterator<_Container> inserter(_Container& _Cont, _Iter _Where)
	{	
	return (std::insert_iterator<_Container>(_Cont, _Where));
	}

		
template<class _Ty,
	class _Elem = char,
	class _Traits = char_traits<_Elem>,
	class _Diff = ptrdiff_t>
	class istream_iterator
		: public iterator<input_iterator_tag, _Ty, _Diff,
			const _Ty *, const _Ty&>
	{	
	typedef istream_iterator<_Ty, _Elem, _Traits, _Diff> _Myt;
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef basic_istream<_Elem, _Traits> istream_type;
	typedef _Range_checked_iterator_tag _Checked_iterator_category;
	istream_iterator()
		: _Myistr(0)
		{	
		}

	istream_iterator(istream_type& _Istr)
		: _Myistr(&_Istr)
		{	
		_Getval();
		}

	const _Ty& operator*() const
		{	

		{ if (!(_Myistr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (_Myval);
		}

	const _Ty *operator->() const
		{	
		return (&**this);
		}

	_Myt& operator++()
		{	

		{ if (!(_Myistr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		_Getval();
		return (*this);
		}

	_Myt operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	bool _Equal(const _Myt& _Right) const
		{	
		return (_Myistr == _Right._Myistr);
		}

protected:
	void _Getval()
		{	
		if (_Myistr != 0 && !(*_Myistr >> _Myval))
			_Myistr = 0;
		}

	static void _Xran()
		{	
		throw out_of_range("invalid istream_iterator");
		}

	istream_type *_Myistr;	
	_Ty _Myval;	
	};

		
template<class _Ty,
	class _Elem,
	class _Traits,
	class _Diff> inline
	bool operator==(
		const istream_iterator<_Ty, _Elem, _Traits, _Diff>& _Left,
		const istream_iterator<_Ty, _Elem, _Traits, _Diff>& _Right)
	{	
	return (_Left._Equal(_Right));
	}

template<class _Ty,
	class _Elem,
	class _Traits,
	class _Diff> inline
	bool operator!=(
		const istream_iterator<_Ty, _Elem, _Traits, _Diff>& _Left,
		const istream_iterator<_Ty, _Elem, _Traits, _Diff>& _Right)
	{	
	return (!(_Left == _Right));
	}

		
template<class _Ty,
	class _Elem = char,
	class _Traits = char_traits<_Elem> >
	class ostream_iterator
		: public _Outit
	{	
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef basic_ostream<_Elem, _Traits> ostream_type;
	typedef _Range_checked_iterator_tag _Checked_iterator_category;
	ostream_iterator(ostream_type& _Ostr,
		const _Elem *_Delim = 0)
		: _Myostr(&_Ostr), _Mydelim(_Delim)
		{	
		}

	ostream_iterator<_Ty, _Elem, _Traits>& operator=(const _Ty& _Val)
		{	
		*_Myostr << _Val;
		if (_Mydelim != 0)
			*_Myostr << _Mydelim;

		{ if (!(*_Myostr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (*this);
		}

	ostream_iterator<_Ty, _Elem, _Traits>& operator*()
		{	
		return (*this);
		}

	ostream_iterator<_Ty, _Elem, _Traits>& operator++()
		{	
		return (*this);
		}

	ostream_iterator<_Ty, _Elem, _Traits> operator++(int)
		{	
		return (*this);
		}

protected:
	static void _Xran()
		{	
		throw out_of_range("invalid ostream_iterator");
		}

	const _Elem *_Mydelim;	
	ostream_type *_Myostr;	
	};

}

namespace stdext {
template <class _Cont, class _Iter = typename _Cont::iterator>
	class checked_iterator
		: public ::std:: iterator<
			typename ::std:: iterator_traits<_Iter>::iterator_category,
			typename ::std:: iterator_traits<_Iter>::value_type,
			typename ::std:: iterator_traits<_Iter>::difference_type,
			typename ::std:: iterator_traits<_Iter>::pointer,
			typename ::std:: iterator_traits<_Iter>::reference>
	{
	friend class checked_iterator;
public:
	typedef checked_iterator<_Cont, _Iter> _Myt;
	typedef typename ::std:: iterator_traits<_Iter>::difference_type difference_type;
	typedef typename ::std:: iterator_traits<_Iter>::pointer pointer;
	typedef typename ::std:: iterator_traits<_Iter>::reference reference;

	typedef ::std:: _Range_checked_iterator_tag _Checked_iterator_category;
	typedef _Iter _Inner_type;

	typedef _Iter _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return _Current;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		_Current = _Base;
	}

	

	checked_iterator()
		: _Mycont(0)
	{
	}

	checked_iterator(_Cont& _C, _Iter _Ptr)
		: _Mycont(&_C), _Current(_Ptr)
	{
	}

	checked_iterator(const _Myt &_Right)
		: _Mycont(_Right._Mycont), _Current(_Right._Current)
	{
	}

	template <class Iter2>
	checked_iterator(const checked_iterator<_Cont, Iter2> &_Right)
		: _Mycont(_Right._Mycont), _Current(_Right._Current)
	{
	}

	_Iter base() const
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current;
	}

	template <class Iter2>
	bool operator==(const checked_iterator<_Cont, Iter2>& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current == _Right._Current;
	}

	template <class Iter2>
	bool operator!=(const checked_iterator<_Cont, Iter2>& _Right) const
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return !(*this == _Right);
	}

	template <class Iter2>
	bool operator<(const checked_iterator<_Cont, Iter2>& _Right) const
	{
		{ if (!(_Mycont != 0 && _Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current < _Right._Current;
	}

	template <class Iter2>
	bool operator>(const checked_iterator<_Cont, Iter2>& _Right) const
	{
		return _Right < *this;
	}

	template <class Iter2>
	bool operator<=(const checked_iterator<_Cont, Iter2>& _Right) const
	{
		return !(_Right < *this);
	}

	template <class Iter2>
	bool operator>=(const checked_iterator<_Cont, Iter2>& _Right) const
	{
		return !(*this < _Right);
	}

	reference operator*() const
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		{ if (!(_Current != _Mycont->end())) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return *_Current;
	}

	pointer operator->() const
	{
		return (&**this);
	}

	_Myt& operator++()
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		{ if (!(_Current != _Mycont->end())) { ((void)0); ::_invalid_parameter_noinfo(); } };
		++_Current;
		return *this;
	}

	_Myt operator++(int)
	{
		_Myt _Tmp = *this;
		++*this;
		return _Tmp;
	}

	_Myt& operator--()
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		{ if (!(_Current != _Mycont->begin())) { ((void)0); ::_invalid_parameter_noinfo(); } };
		--_Current;
		return *this;
	}

	_Myt operator--(int)
	{
		_Myt _Tmp = *this;
		--*this;
		return _Tmp;
	}

	

	_Myt& operator+=(difference_type _Off)
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		{ if (!((_Mycont->end() - _Current) >= _Off && (_Mycont->begin() - _Current) <= _Off)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		_Current += _Off;
		return *this;
	}

	_Myt operator+(difference_type _Off) const
	{
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
	}

	_Myt& operator-=(difference_type _Off)
	{
		return (*this += -_Off);
	}

	_Myt operator-(difference_type _Off) const
	{
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
	}

	difference_type operator-(const _Myt& _Right) const
	{
		{ if (!(_Mycont != 0 && _Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current - _Right._Current;
	}

	reference operator[](difference_type _Off) const
	{
		{ if (!(_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		{ if (!((_Mycont->end() - _Current) > _Off && (_Mycont->begin() - _Current) <= _Off)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current[_Off];
	}

protected:
	void _Xran() const
	{	
		throw ::std:: out_of_range("invalid checked_iterator<T> subscript");
	}

	void _Xinvarg() const
	{	
		throw ::std:: invalid_argument("invalid checked_iterator<T> argument");
	}

	_Cont *_Mycont;
	_Iter _Current;
	};
template <class _Iterator>
	class checked_array_iterator
		: public ::std:: iterator<
			typename ::std:: iterator_traits<_Iterator>::iterator_category,
			typename ::std:: iterator_traits<_Iterator>::value_type,
			typename ::std:: iterator_traits<_Iterator>::difference_type,
			typename ::std:: iterator_traits<_Iterator>::pointer,
			typename ::std:: iterator_traits<_Iterator>::reference>
	{
public:
	typedef checked_array_iterator<_Iterator> _Myt;
	typedef typename ::std:: iterator_traits<_Iterator>::difference_type difference_type;
	typedef typename ::std:: iterator_traits<_Iterator>::pointer pointer;
	typedef typename ::std:: iterator_traits<_Iterator>::reference reference;

	typedef ::std:: _Range_checked_iterator_tag _Checked_iterator_category;
	typedef _Iterator _Inner_type;

	typedef _Iterator _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return _Mycont + _Current;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		_Current = _Base - _Mycont;
	}

	

	checked_array_iterator():
		_Size(0), _Current(0)
	{
	}

	checked_array_iterator(_Iterator _Cont, size_t _S, size_t _Index = 0)
	{
		{ if (!(_Index <= _S)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		_Mycont = _Cont;
		_Size = _S;
		_Current =_Index;
	}

	_Iterator base() const
	{
		return _Mycont + _Current;
	}

	size_t __Size() const
	{
		return _Size;
	}

	bool operator==(const _Myt& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current == _Right._Current;
	}

	bool operator!=(const _Myt& _Right) const
	{
		return !(*this == _Right);
	}

	bool operator<(const _Myt& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current < _Right._Current;
	}

	bool operator>(const _Myt& _Right) const
	{
		return _Right < *this;
	}

	bool operator<=(const _Myt& _Right) const
	{
		return !(_Right < *this);
	}

	bool operator>=(const _Myt& _Right) const
	{
		return !(*this < _Right);
	}

	reference operator*() const
	{
		{ if (!(_Current < _Size)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return *(_Mycont + _Current);
	}

	pointer operator->() const
	{
		return (&**this);
	}

	checked_array_iterator& operator++()
	{
		{ if (!(_Current < _Size)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		++_Current;
		return *this;
	}

	_Myt operator++(int)
	{
		checked_array_iterator _Tmp = *this;
		++*this;
		return _Tmp;
	}

	_Myt& operator--()
	{
		{ if (!(_Current > 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		--_Current;
		return *this;
	}

	_Myt operator--(int)
	{
		checked_array_iterator _Tmp = *this;
		--*this;
		return _Tmp;
	}

	

	_Myt& operator+=(difference_type _Off)
	{
		{ if (!(_Current + _Off <= _Size && _Current + _Off >= 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		_Current += _Off;
		return *this;
	}

	_Myt operator+(difference_type _Off) const
	{
		checked_array_iterator _Tmp = *this;
		return (_Tmp += _Off);
	}

	_Myt& operator-=(difference_type _Off)
	{
		return (*this += -_Off);
	}

	_Myt operator-(difference_type _Off) const
	{
		checked_array_iterator _Tmp = *this;
		return (_Tmp -= _Off);
	}

	difference_type operator-(const checked_array_iterator& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return _Current - _Right._Current;
	}

	reference operator[](difference_type _Off) const
	{
		{ if (!(_Current + _Off < _Size && _Current + _Off > 0)) { ((void)0); ::_invalid_parameter_noinfo(); } };
		return *(_Mycont + _Current + _Off);
	}

protected:
	void _Xran() const
	{	
		throw ::std:: out_of_range("invalid checked_array_iterator<T> subscript");
	}

	void _Xinvarg() const
	{	
		throw ::std:: invalid_argument("invalid checked_array_iterator<T> argument");
	}

	_Iterator _Mycont;
	size_t _Current;
	size_t _Size;
	};

}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Ty> inline
	pair<_Ty  *, ptrdiff_t>
		get_temporary_buffer(ptrdiff_t _Count)
	{	
	_Ty  *_Pbuf;

	if (_Count <= 0)
		_Count = 0;
	else if (((size_t)(-1) / _Count) < sizeof (_Ty))
		throw std::bad_alloc(0);

	for (_Pbuf = 0; 0 < _Count; _Count /= 2)
		if ((_Pbuf = (_Ty  *)operator new(
			(size_t)_Count * sizeof (_Ty), nothrow)) != 0)
			break;

	return (pair<_Ty  *, ptrdiff_t>(_Pbuf, _Count));
	}

		
template<class _Ty> inline
	void return_temporary_buffer(_Ty *_Pbuf)
	{	
	operator delete(_Pbuf);
	}

		
template<class _InIt,
	class _FwdIt> inline
	_FwdIt _Uninit_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	;
	;
	_FwdIt _Next = _Dest;

	try {
	for (; _First != _Last; ++_Dest, ++_First)
		_Construct(&*_Dest, *_First);
	} catch (...) {
	for (; _Next != _Dest; ++_Next)
		_Destroy(&*_Next);
	throw;
	}
	return (_Dest);
	}

template<class _Ty1,
	class _Ty2> inline
	_Ty2 _Uninit_copy(_Ty1 _First, _Ty1 _Last, _Ty2 _Dest,
		_Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	;
	;
	size_t _Count = (size_t)(_Last - _First);
	_Ty2 _Result = _Dest + _Count;
	if (_Count > 0)
		::memmove_s((&*_Dest), (_Count * sizeof (*_First)), (&*_First), (_Count * sizeof (*_First)));	
	return _Result;
	}
template<class _Ty1, class _Ty2, class _Ty3>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_Ty2 _Uninit_copy(_Ty1 _First, _Ty1 _Last, _Ty2 _Dest, _Ty3 _Ptr_cat, _Unchecked_iterator_tag)
	{
	return _Uninit_copy(_First, _Last, _Dest, _Ptr_cat, _Range_checked_iterator_tag());
	}
template<class _InIt,
	class _FwdIt> inline
	_FwdIt uninitialized_copy(_InIt _First, _InIt _Last, _FwdIt _Dest)
	{	
	return (_Uninit_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

		
template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt _Uninit_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	;
	;
	_FwdIt _Next = _Dest;

	try {
	for (; _First != _Last; ++_Dest, ++_First)
		_Al.construct(_Dest, *_First);
	} catch (...) {
	for (; _Next != _Dest; ++_Next)
		_Al.destroy(_Next);
	throw;
	}
	return (_Dest);
	}

template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt _Uninit_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc&, _Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	;
	;
	size_t _Count = (size_t)(_Last - _First);
	_FwdIt _Result = _Dest + _Count;
	if (_Count > 0)
		::memmove_s((&*_Dest), (_Count * sizeof (*_First)), (&*_First), (_Count * sizeof (*_First)));	
	return _Result;
	}
template<class _InIt, class _FwdIt, class _Alloc, class _Ty>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_FwdIt _Uninit_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc _Al, _Ty _Ptr_cat, _Unchecked_iterator_tag)
	{
	return _Uninit_copy(_First, _Last, _Dest, _Al, _Ptr_cat, _Range_checked_iterator_tag());
	}
template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt _Uninitialized_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al)
	{	
	return (_Uninit_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, _Al,
		_Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

		
template<class _InIt, class _FwdIt, class _Alloc, class _MoveCatTy>
inline
	_FwdIt _Uninit_move(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al, _MoveCatTy, _Range_checked_iterator_tag)
	{	
	return ::stdext:: unchecked_uninitialized_copy(_First, _Last, _Dest, _Al);
	}

template<class _InIt, class _FwdIt, class _Alloc>
inline
	_FwdIt _Uninit_move(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al, _Swap_move_tag, _Range_checked_iterator_tag)
	{	
	;
	;
	_FwdIt _Next = _Dest;
	
	typename _Alloc::value_type _Val;

	try {
	for (; _First != _Last; ++_Dest, ++_First)
		{
		_Al.construct(_Dest, _Val);
		::std:: swap(*_Dest, *_First);
		}
	} catch (...) {
	for (; _Next != _Dest; ++_Next)
		_Al.destroy(_Next);
	throw;
	}
	return (_Dest);
	}
template<class _InIt, class _FwdIt, class _Alloc, class _MoveCatTy>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	_FwdIt _Uninit_move(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc _Al, _MoveCatTy _Move_cat, _Unchecked_iterator_tag)
	{
	return _Uninit_move(_First, _Last, _Dest, _Al, _Move_cat, _Range_checked_iterator_tag());
	}
template<class _InIt, class _FwdIt, class _Alloc>
inline
	_FwdIt _Uninitialized_move(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al)
	{	
	return (_Uninit_move(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, _Al,
		_Move_cat(_Dest), ::std:: _Checked_cat(_Dest)));
	}
template<class _FwdIt,
	class _Tval> inline
	void _Uninit_fill(_FwdIt _First, _FwdIt _Last, const _Tval& _Val,
		_Nonscalar_ptr_iterator_tag)
	{	
	;
	_FwdIt _Next = _First;

	try {
	for (; _First != _Last; ++_First)
		_Construct(&*_First, _Val);
	} catch (...) {
	for (; _Next != _First; ++_Next)
		_Destroy(&*_Next);
	throw;
	}
	}

template<class _Ty,
	class _Tval> inline
	void _Uninit_fill(_Ty *_First, _Ty *_Last, const _Tval& _Val,
		_Scalar_ptr_iterator_tag)
	{	
	std::fill(_First, _Last, _Val);
	}

template<class _FwdIt,
	class _Tval> inline
	void uninitialized_fill(_FwdIt _First, _FwdIt _Last, const _Tval& _Val)
	{	
	_Uninit_fill(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Val, _Ptr_cat(_First, _First));
	}

		
template<class _FwdIt,
	class _Diff,
	class _Tval> inline
	void _Uninit_fill_n(_FwdIt _First, _Diff _Count, const _Tval& _Val,
		_Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	_FwdIt _Next = _First;

	try {
	for (; 0 < _Count; --_Count, ++_First)
		_Construct(&*_First, _Val);
	} catch (...) {
	for (; _Next != _First; ++_Next)
		_Destroy(&*_Next);
	throw;
	}
	}

template<class _Ty,
	class _Diff,
	class _Tval> inline
	void _Uninit_fill_n(_Ty *_First, _Diff _Count, const _Tval& _Val,
		_Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	::stdext:: unchecked_fill_n(_First, _Count, _Val);
	}
template<class _FwdIt, class _Diff, class _Tval, class _Ty2>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	void _Uninit_fill_n(_FwdIt _First, _Diff _Count, const _Tval& _Val,
		_Ty2 _Ptr_cat, _Unchecked_iterator_tag)
	{
	_Uninit_fill_n(_First, _Count, _Val, _Ptr_cat, _Range_checked_iterator_tag());
	}
template<class _FwdIt,
	class _Diff,
	class _Tval> inline
	void uninitialized_fill_n(_FwdIt _First, _Diff _Count, const _Tval& _Val)
	{	
	_Uninit_fill_n(_First, _Count, _Val, _Ptr_cat(_First, _First), ::std:: _Checked_cat(_First));
	}

		
template<class _FwdIt,
	class _Diff,
	class _Tval,
	class _Alloc> inline
	void _Uninit_fill_n(_FwdIt _First, _Diff _Count,
		const _Tval& _Val, _Alloc& _Al, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
	_FwdIt _Next = _First;

	try {
	for (; 0 < _Count; --_Count, ++_First)
		_Al.construct(_First, _Val);
	} catch (...) {
	for (; _Next != _First; ++_Next)
		_Al.destroy(_Next);
	throw;
	}
	}

template<class _FwdIt,
	class _Diff,
	class _Tval,
	class _Alloc> inline
	void _Uninit_fill_n(_FwdIt _First, _Diff _Count,
		const _Tval& _Val, _Alloc&, _Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	
		::stdext:: unchecked_fill_n(_First, _Count, _Val);
	}
template<class _FwdIt, class _Diff, class _Tval, class _Alloc, class _Ty>
inline
__declspec(deprecated("You have used a std:: construct that is not safe. See documentation on how to use the Safe Standard C++ Library"))
	void _Uninit_fill_n(_FwdIt _First, _Diff _Count,
		const _Tval& _Val, _Alloc& _Al, _Ty _Ptr_cat, _Unchecked_iterator_tag)
	{
	_Uninit_fill_n(_First, _Count, _Val, _Al, _Ptr_cat, _Range_checked_iterator_tag());
	}
template<class _FwdIt,
	class _Diff,
	class _Tval,
	class _Alloc> inline
	void _Uninitialized_fill_n(_FwdIt _First, _Diff _Count,
		const _Tval& _Val, _Alloc& _Al)
	{	
	_Uninit_fill_n(_First, _Count, _Val, _Al,
		_Ptr_cat(_First, _First), ::std:: _Checked_cat(_First));
	}

		
template<class _FwdIt,
	class _Ty>
	class raw_storage_iterator
		: public _Outit
	{	
public:
	typedef _FwdIt iterator_type;	
	typedef _FwdIt iter_type;	
	typedef _Ty element_type;	

	explicit raw_storage_iterator(_FwdIt _First)
		: _Next(_First)
		{	
		}

	raw_storage_iterator<_FwdIt, _Ty>& operator*()
		{	
		return (*this);
		}

	raw_storage_iterator<_FwdIt, _Ty>& operator=(const _Ty& _Val)
		{	
		_Construct(&*_Next, _Val);
		return (*this);
		}

	raw_storage_iterator<_FwdIt, _Ty>& operator++()
		{	
		++_Next;
		return (*this);
		}

	raw_storage_iterator<_FwdIt, _Ty> operator++(int)
		{	
		raw_storage_iterator<_FwdIt, _Ty> _Ans = *this;
		++_Next;
		return (_Ans);
		}

private:
	_FwdIt _Next;	
	};

		
template<class _Ty>
	class _Temp_iterator
		: public _Outit
	{	
public:
	typedef _Ty  *_Pty;
	typedef _Range_checked_iterator_tag _Checked_iterator_category;
	_Temp_iterator(ptrdiff_t _Count = 0)
		{	
		_Buf._Begin = 0;
		_Buf._Current = 0;
		_Buf._Hiwater = 0;
		_Buf._Size = _Count;	
		_Pbuf = &_Buf;
		}

	_Temp_iterator(const _Temp_iterator<_Ty>& _Right)
		{	
		_Buf._Begin = 0;	
		_Buf._Current = 0;
		_Buf._Hiwater = 0;
		_Buf._Size = 0;
		*this = _Right;
		}

	~_Temp_iterator()
		{	
		if (_Buf._Begin != 0)
			{	
			for (_Pty _Next = _Buf._Begin;
				_Next != _Buf._Hiwater; ++_Next)
				_Destroy(&*_Next);
			std::return_temporary_buffer(_Buf._Begin);
			}
		}

	_Temp_iterator<_Ty>& operator=(const _Temp_iterator<_Ty>& _Right)
		{	
		_Pbuf = _Right._Pbuf;
		return (*this);
		}

	_Temp_iterator<_Ty>& operator=(const _Ty& _Val)
		{	
		if (_Pbuf->_Current < _Pbuf->_Hiwater)
			*_Pbuf->_Current++ = _Val;	
		else
			{	
			{ if (!((_Pbuf->_Current - _Pbuf->_Begin) < _Pbuf->_Size)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			_Pty _Ptr = &*_Pbuf->_Current;
			_Construct(_Ptr, _Val);
			_Pbuf->_Hiwater = ++_Pbuf->_Current;
			}
		return (*this);
		}

	_Temp_iterator<_Ty>& operator*()
		{	
		return (*this);
		}

	_Temp_iterator<_Ty>& operator++()
		{	
		return (*this);
		}

	_Temp_iterator<_Ty>& operator++(int)
		{	
		return (*this);
		}

	_Temp_iterator<_Ty>& _Init()
		{	
		_Pbuf->_Current = _Pbuf->_Begin;
		return (*this);
		}

	_Pty _First() const
		{	
		return (_Pbuf->_Begin);
		}

	_Pty _Last() const
		{	
		return (_Pbuf->_Current);
		}

	ptrdiff_t _Maxlen()
		{	
		if (_Pbuf->_Begin == 0 && 0 < _Pbuf->_Size)
			{	
			pair<_Pty, ptrdiff_t> _Pair =
				std::get_temporary_buffer<_Ty>(_Pbuf->_Size);

			_Pbuf->_Begin = _Pair.first;
			_Pbuf->_Current = _Pair.first;
			_Pbuf->_Hiwater = _Pair.first;
			_Pbuf->_Size = _Pair.second;
			}
		return (_Pbuf->_Size);
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid _Temp_iterator<T> argument");
		}

private:
	struct _Bufpar
		{	
		_Pty _Begin;	
		_Pty _Current;	
		_Pty _Hiwater;	
		ptrdiff_t _Size;	
		};
	_Bufpar _Buf;	
	_Bufpar *_Pbuf;	
	};

		
template<class _Ty>
	class auto_ptr;

template<class _Ty>
	struct auto_ptr_ref
		{	
	auto_ptr_ref(void *_Right)
		: _Ref(_Right)
		{	
		}

	void *_Ref;	
	};

template<class _Ty>
	class auto_ptr
		{	
public:
	typedef _Ty element_type;

	explicit auto_ptr(_Ty *_Ptr = 0) throw ()
		: _Myptr(_Ptr)
		{	
		}

	auto_ptr(auto_ptr<_Ty>& _Right) throw ()
		: _Myptr(_Right.release())
		{	
		}

	auto_ptr(auto_ptr_ref<_Ty> _Right) throw ()
		{	
		_Ty **_Pptr = (_Ty **)_Right._Ref;
		_Ty *_Ptr = *_Pptr;
		*_Pptr = 0;	
		_Myptr = _Ptr;	
		}

	template<class _Other>
		operator auto_ptr<_Other>() throw ()
		{	
		return (auto_ptr<_Other>(*this));
		}

	template<class _Other>
		operator auto_ptr_ref<_Other>() throw ()
		{	
		_Other *_Testptr = (_Ty *)_Myptr;	
		auto_ptr_ref<_Other> _Ans(&_Myptr);
		return (_Testptr != 0 ? _Ans : _Ans);
		}

	template<class _Other>
		auto_ptr<_Ty>& operator=(auto_ptr<_Other>& _Right) throw ()
		{	
		reset(_Right.release());
		return (*this);
		}

	template<class _Other>
		auto_ptr(auto_ptr<_Other>& _Right) throw ()
		: _Myptr(_Right.release())
		{	
		}

	auto_ptr<_Ty>& operator=(auto_ptr<_Ty>& _Right) throw ()
		{	
		reset(_Right.release());
		return (*this);
		}

	auto_ptr<_Ty>& operator=(auto_ptr_ref<_Ty> _Right) throw ()
		{	
		_Ty **_Pptr = (_Ty **)_Right._Ref;
		_Ty *_Ptr = *_Pptr;
		*_Pptr = 0;	
		reset(_Ptr);	
		return (*this);
		}

	~auto_ptr()
		{	
		delete (_Ty *)_Myptr;
		}

	_Ty& operator*() const throw ()
		{	
		;

		return (*(_Ty *)_Myptr);
		}

	_Ty *operator->() const throw ()
		{	
		return (&**this);
		}

	_Ty *get() const throw ()
		{	
		return ((_Ty *)_Myptr);
		}

	_Ty *release() throw ()
		{	
		_Ty *_Tmp = (_Ty *)_Myptr;
		_Myptr = 0;
		return (_Tmp);
		}

	void reset(_Ty* _Ptr = 0)
		{	
		if (_Ptr != _Myptr)
			delete (_Ty *)_Myptr;
		_Myptr = _Ptr;
		}

private:
	const _Ty *_Myptr;	
	};
}

namespace stdext {

template<class _InIt,
	class _FwdIt> inline
	_FwdIt unchecked_uninitialized_copy(_InIt _First, _InIt _Last, _FwdIt _Dest)
	{	
		return (::std:: _Uninit_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt,
	class _FwdIt> inline
	_FwdIt checked_uninitialized_copy(_InIt _First, _InIt _Last, _FwdIt _Dest)
	{	
		return (::std:: _Uninit_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt unchecked_uninitialized_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al)
	{	
		return (::std:: _Uninit_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, _Al,
			::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt checked_uninitialized_copy(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al)
	{	
		return (::std:: _Uninit_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, _Al,
			::std:: _Ptr_cat(_First, _Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt _Unchecked_uninitialized_move(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al)
	{	
		return (::std:: _Uninit_move(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, _Al,
			::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt,
	class _FwdIt,
	class _Alloc> inline
	_FwdIt _Checked_uninitialized_move(_InIt _First, _InIt _Last, _FwdIt _Dest,
		_Alloc& _Al)
	{	
		return (::std:: _Uninit_move(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, _Al,
			::std:: _Move_cat(_Dest), ::std:: _Checked_cat(_Dest)));
	}

template<class _FwdIt,
	class _Diff,
	class _Tval> inline
	void unchecked_uninitialized_fill_n(_FwdIt _First, _Diff _Count, const _Tval& _Val)
	{	
		::std:: _Uninit_fill_n(_First, _Count, _Val, ::std:: _Ptr_cat(_First, _First), ::std:: _Range_checked_iterator_tag());
	}

template<class _FwdIt,
	class _Diff,
	class _Tval> inline
	void checked_uninitialized_fill_n(_FwdIt _First, _Diff _Count, const _Tval& _Val)
	{	
		::std:: _Uninit_fill_n(_First, _Count, _Val, ::std:: _Ptr_cat(_First, _First), ::std:: _Checked_cat(_First));
	}

template<class _FwdIt,
	class _Diff,
	class _Tval,
	class _Alloc> inline
	void unchecked_uninitialized_fill_n(_FwdIt _First, _Diff _Count,
		const _Tval& _Val, _Alloc& _Al)
	{	
		::std:: _Uninit_fill_n(_First, _Count, _Val, _Al,
			::std:: _Ptr_cat(_First, _First), ::std:: _Range_checked_iterator_tag());
	}

template<class _FwdIt,
	class _Diff,
	class _Tval,
	class _Alloc> inline
	void checked_uninitialized_fill_n(_FwdIt _First, _Diff _Count,
		const _Tval& _Val, _Alloc& _Al)
	{	
		::std:: _Uninit_fill_n(_First, _Count, _Val, _Al,
			::std:: _Ptr_cat(_First, _First), ::std:: _Checked_cat(_First));
	}

}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)

 #pragma warning(disable: 4244)
namespace std {
template<class _Ty,
	class _Ax = allocator<_Ty> >
	class vector;

		
template<class _Ty,
	class _Alloc>
	class _Vector_const_iterator
		: public _Ranit<_Ty, typename _Alloc::difference_type,
			typename _Alloc::const_pointer, typename _Alloc::const_reference>
	{	
public:
	typedef _Vector_const_iterator<_Ty, _Alloc> _Myt;
	typedef vector<_Ty, _Alloc> _Myvec;
	typedef typename _Alloc::pointer _Tptr;

	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::const_pointer pointer;
	typedef typename _Alloc::const_reference reference;
	typedef _Range_checked_iterator_tag _Checked_iterator_category;
	typedef pointer _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return _Myptr;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		this->_Myptr = const_cast<_Tptr>(_Base);
	}
	
	
	
	
	typedef _Tptr _Inner_type;

	_Vector_const_iterator()
		{	
		_Myptr = 0;
		}
	_Vector_const_iterator(_Tptr _Ptr, const _Container_base *_Pvector)
		{	
		{ if (!(_Pvector != 0 && ((_Myvec *)_Pvector)->_Myfirst <= _Ptr && _Ptr <= ((_Myvec *)_Pvector)->_Mylast)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		this->_Mycont = _Pvector;
		_Myptr = _Ptr;
		}

	reference operator*() const
		{	
 		{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		{ if (!(_Myptr < ((_Myvec *)(this->_Mycont))->_Mylast)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (*_Myptr);
		}

	pointer operator->() const
		{	
		return (&**this);
		}

	_Myt& operator++()
		{	
		{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		{ if (!(_Myptr < ((_Myvec *)(this->_Mycont))->_Mylast)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		++_Myptr;
		return (*this);
		}

	_Myt operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt& operator--()
		{	
		{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		{ if (!(_Myptr > ((_Myvec *)(this->_Mycont))->_Myfirst)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		--_Myptr;
		return (*this);
		}

	_Myt operator--(int)
		{	
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt& operator+=(difference_type _Off)
		{	
		{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		{ if (!(_Myptr + _Off <= ((_Myvec *)(this->_Mycont))->_Mylast && _Myptr + _Off >= ((_Myvec *)(this->_Mycont))->_Myfirst)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		_Myptr += _Off;
		return (*this);
		}

	_Myt operator+(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt& operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Myt operator-(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type operator-(const _Myt& _Right) const
		{	

		{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (_Myptr - _Right._Myptr);
		}

	reference operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}

	bool operator==(const _Myt& _Right) const
		{	

		{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (_Myptr == _Right._Myptr);
		}

	bool operator!=(const _Myt& _Right) const
		{	
		return (!(*this == _Right));
		}

	bool operator<(const _Myt& _Right) const
		{	

		{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (_Myptr < _Right._Myptr);
		}

	bool operator>(const _Myt& _Right) const
		{	
		return (_Right < *this);
		}

	bool operator<=(const _Myt& _Right) const
		{	
		return (!(_Right < *this));
		}

	bool operator>=(const _Myt& _Right) const
		{	
		return (!(*this < _Right));
		}

	static void _Xlen()
		{	
		throw length_error("vector<T> too long");
		}

	static void _Xran()
		{	
		throw out_of_range("invalid vector<T> subscript");
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid vector<T> argument");
		}

	_Tptr _Myptr;	
	};

template<class _Ty,
	class _Alloc> inline
	_Vector_const_iterator<_Ty, _Alloc> operator+(
		typename _Vector_const_iterator<_Ty, _Alloc>::difference_type _Off,
		_Vector_const_iterator<_Ty, _Alloc> _Next)
	{	
	return (_Next += _Off);
	}

		
template<class _Ty,
	class _Alloc>
	class _Vector_iterator
		: public _Vector_const_iterator<_Ty, _Alloc>
		{	
public:
	typedef _Vector_iterator<_Ty, _Alloc> _Myt;
	typedef _Vector_const_iterator<_Ty, _Alloc> _Mybase;

	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::pointer pointer;
	typedef typename _Alloc::reference reference;
	typedef pointer _Checked_iterator_base_type;

	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return this->_Myptr;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		this->_Myptr = _Base;
	}
	_Vector_iterator()
		{	
		}

	_Vector_iterator(pointer _Ptr, const _Container_base *_Pvector)
		: _Mybase(_Ptr, _Pvector)
		{	
		}

	reference operator*() const
		{	
		return ((reference)**(_Mybase *)this);
		}

	pointer operator->() const
		{	
		return (&**this);
		}

	_Myt& operator++()
		{	
		++(*(_Mybase *)this);
		return (*this);
		}

	_Myt operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt& operator--()
		{	
		--(*(_Mybase *)this);
		return (*this);
		}

	_Myt operator--(int)
		{	
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt& operator+=(difference_type _Off)
		{	
		(*(_Mybase *)this) += _Off;
		return (*this);
		}

	_Myt operator+(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt& operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Myt operator-(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type operator-(const _Mybase& _Right) const
		{	
		return (*(_Mybase *)this - _Right);
		}

	reference operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}
	};

template<class _Ty,
	class _Alloc> inline
	_Vector_iterator<_Ty, _Alloc> operator+(
		typename _Vector_iterator<_Ty, _Alloc>::difference_type _Off,
		_Vector_iterator<_Ty, _Alloc> _Next)
	{	
	return (_Next += _Off);
	}

		
template<class _Ty,
	class _Alloc>
	class _Vector_val
		: public _Container_base
	{	
protected:
	_Vector_val(_Alloc _Al = _Alloc())
		: _Alval(_Al)
		{	
		}

	typedef typename _Alloc::template
		rebind<_Ty>::other _Alty;

	_Alty _Alval;	
	};

		
template<class _Ty,
	class _Ax>
	class vector
		: public _Vector_val<_Ty, _Ax>
	{	
public:
	typedef vector<_Ty, _Ax> _Myt;
	typedef _Vector_val<_Ty, _Ax> _Mybase;
	typedef typename _Mybase::_Alty _Alloc;
	typedef _Alloc allocator_type;
	typedef typename _Alloc::size_type size_type;
	typedef typename _Alloc::difference_type _Dift;
	typedef _Dift difference_type;
	typedef typename _Alloc::pointer _Tptr;
	typedef typename _Alloc::const_pointer _Ctptr;
	typedef _Tptr pointer;
	typedef _Ctptr const_pointer;
	typedef typename _Alloc::reference _Reft;
	typedef _Reft reference;
	typedef typename _Alloc::const_reference const_reference;
	typedef typename _Alloc::value_type value_type;
	typedef _Vector_iterator<_Ty, _Alloc> iterator;
	typedef _Vector_const_iterator<_Ty, _Alloc> const_iterator;
	friend class _Vector_const_iterator<_Ty, _Alloc>;

	typedef std::reverse_iterator<iterator> reverse_iterator;
	typedef std::reverse_iterator<const_iterator> const_reverse_iterator;

	vector()
		: _Mybase()
		{	
		_Buy(0);
		}

	explicit vector(const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Buy(0);
		}

	explicit vector(size_type _Count)
		: _Mybase()
		{	
		_Construct_n(_Count, _Ty());
		}

	vector(size_type _Count, const _Ty& _Val)
		: _Mybase()
		{	
		_Construct_n(_Count, _Val);
		}

	vector(size_type _Count, const _Ty& _Val, const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Construct_n(_Count, _Val);
		}

	vector(const _Myt& _Right)
		: _Mybase(_Right._Alval)
		{	
		if (_Buy(_Right.size()))
			try {
			_Mylast = _Ucopy(_Right.begin(), _Right.end(), _Myfirst);
			} catch (...) {
			_Tidy();
			throw;
			}
		}

	template<class _Iter>
		vector(_Iter _First, _Iter _Last)
		: _Mybase()
		{	
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		vector(_Iter _First, _Iter _Last, const _Alloc& _Al)
		: _Mybase(_Al)
		{	
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		void _Construct(_Iter _Count, _Iter _Val, _Int_iterator_tag)
		{	
		size_type _Size = (size_type)_Count;
		_Construct_n(_Size, (_Ty)_Val);
		}

	template<class _Iter>
		void _Construct(_Iter _First,
			_Iter _Last, input_iterator_tag)
		{	
		_Buy(0);
		try {
		insert(begin(), _First, _Last);
		} catch (...) {
		_Tidy();
		throw;
		}
		}

	void _Construct_n(size_type _Count, const _Ty& _Val)
		{	
		if (_Buy(_Count))
			{	
			try {
			_Mylast = _Ufill(_Myfirst, _Count, _Val);
			} catch (...) {
			_Tidy();
			throw;
			}
			}
		}

	~vector()
		{	
		_Tidy();
		}

	_Myt& operator=(const _Myt& _Right)
		{	
		if (this != &_Right)
			{	
			if (_Right.size() == 0)
				clear();	
			else if (_Right.size() <= size())
				{	
				pointer _Ptr = ::stdext:: unchecked_copy(_Right._Myfirst, _Right._Mylast,
					_Myfirst);	
				_Destroy(_Ptr, _Mylast);	
				_Mylast = _Myfirst + _Right.size();
				}
			else if (_Right.size() <= capacity())
				{	
				pointer _Ptr = _Right._Myfirst + size();
				::stdext:: unchecked_copy(_Right._Myfirst, _Ptr, _Myfirst);
				_Mylast = _Ucopy(_Ptr, _Right._Mylast, _Mylast);
				}
			else
				{	
				if (_Myfirst != 0)
					{	
					_Destroy(_Myfirst, _Mylast);
					this->_Alval.deallocate(_Myfirst, _Myend - _Myfirst);
					}
				if (_Buy(_Right.size()))
					_Mylast = _Ucopy(_Right._Myfirst, _Right._Mylast,
						_Myfirst);
				}
			}
		return (*this);
		}

	void reserve(size_type _Count)
		{	
		if (max_size() < _Count)
			_Xlen();	
		else if (capacity() < _Count)
			{	
			pointer _Ptr = this->_Alval.allocate(_Count);

			try {
			_Umove(begin(), end(), _Ptr);
			} catch (...) {
			this->_Alval.deallocate(_Ptr, _Count);
			throw;
			}

			size_type _Size = size();
			if (_Myfirst != 0)
				{	
				_Destroy(_Myfirst, _Mylast);
				this->_Alval.deallocate(_Myfirst, _Myend - _Myfirst);
				}
			_Myend = _Ptr + _Count;
			_Mylast = _Ptr + _Size;
			_Myfirst = _Ptr;
			}
		}

	size_type capacity() const
		{	
		return (_Myfirst == 0 ? 0 : _Myend - _Myfirst);
		}
	iterator begin()
		{	
		return (iterator(_Myfirst, this));
		}

	const_iterator begin() const
		{	
		return (const_iterator(_Myfirst, this));
		}

	iterator end()
		{	
		return (iterator(_Mylast, this));
		}

	const_iterator end() const
		{	
		return (const_iterator(_Mylast, this));
		}
	reverse_iterator rbegin()
		{	
		return (reverse_iterator(end()));
		}

	const_reverse_iterator rbegin() const
		{	
		return (const_reverse_iterator(end()));
		}

	reverse_iterator rend()
		{	
		return (reverse_iterator(begin()));
		}

	const_reverse_iterator rend() const
		{	
		return (const_reverse_iterator(begin()));
		}

	void resize(size_type _Newsize)
		{	
		resize(_Newsize, _Ty());
		}

	void resize(size_type _Newsize, _Ty _Val)
		{	
		if (size() < _Newsize)
			_Insert_n(end(), _Newsize - size(), _Val);
		else if (_Newsize < size())
			erase(begin() + _Newsize, end());
		}

	size_type size() const
		{	
		return (_Myfirst == 0 ? 0 : _Mylast - _Myfirst);
		}

	size_type max_size() const
		{	
		return (this->_Alval.max_size());
		}

	bool empty() const
		{	
		return (size() == 0);
		}

	_Alloc get_allocator() const
		{	
		return (this->_Alval);
		}

	const_reference at(size_type _Pos) const
		{	
		if (size() <= _Pos)
			_Xran();
		return (*(begin() + _Pos));
		}

	reference at(size_type _Pos)
		{	
		if (size() <= _Pos)
			_Xran();
		return (*(begin() + _Pos));
		}

	const_reference operator[](size_type _Pos) const
		{	

		{ if (!(_Pos < size())) { ((void)0); ::_invalid_parameter_noinfo(); } ; };

		return (*(_Myfirst + _Pos));
		}

	reference operator[](size_type _Pos)
		{	

		{ if (!(_Pos < size())) { ((void)0); ::_invalid_parameter_noinfo(); } ; };

		return (*(_Myfirst + _Pos));
		}

	reference front()
		{	
		return (*begin());
		}

	const_reference front() const
		{	
		return (*begin());
		}

	reference back()
		{	
		return (*(end() - 1));
		}

	const_reference back() const
		{	
		return (*(end() - 1));
		}

	void push_back(const _Ty& _Val)
		{	
		if (size() < capacity())

			_Mylast = _Ufill(_Mylast, 1, _Val);
		else
			insert(end(), _Val);
		}
	void pop_back()
		{	
		if (!empty())
			{	
			_Destroy(_Mylast - 1, _Mylast);
			--_Mylast;
			}
		}
	template<class _Iter>
		void assign(_Iter _First, _Iter _Last)
		{	
		_Assign(_First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		void _Assign(_Iter _Count, _Iter _Val, _Int_iterator_tag)
		{	
		_Assign_n((size_type)_Count, (_Ty)_Val);
		}

	template<class _Iter>
		void _Assign(_Iter _First, _Iter _Last, input_iterator_tag)
		{	
		erase(begin(), end());
		insert(begin(), _First, _Last);
		}

	void assign(size_type _Count, const _Ty& _Val)
		{	
		_Assign_n(_Count, _Val);
		}

	iterator insert(iterator _Where, const _Ty& _Val)
		{	
		size_type _Off = size() == 0 ? 0 : _Where - begin();
		_Insert_n(_Where, (size_type)1, _Val);
		return (begin() + _Off);
		}

	void insert(iterator _Where, size_type _Count, const _Ty& _Val)
		{	
		_Insert_n(_Where, _Count, _Val);
		}

	template<class _Iter>
		void insert(iterator _Where, _Iter _First, _Iter _Last)
		{	
		_Insert(_Where, _First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		void _Insert(iterator _Where, _Iter _First, _Iter _Last,
			_Int_iterator_tag)
		{	
		_Insert_n(_Where, (size_type)_First, (_Ty)_Last);
		}

	template<class _Iter>
		void _Insert(iterator _Where, _Iter _First, _Iter _Last,
			input_iterator_tag)
		{	
		for (; _First != _Last; ++_First, ++_Where)
			_Where = insert(_Where, *_First);
		}

	template<class _Iter>
		void _Insert(iterator _Where,
			_Iter _First, _Iter _Last, forward_iterator_tag)
		{	
		size_type _Count = 0;
		_Distance(_First, _Last, _Count);
		size_type _Capacity = capacity();

		if (_Count == 0)
			;
		else if (max_size() - size() < _Count)
			_Xlen();	
		else if (_Capacity < size() + _Count)
			{	
			_Capacity = max_size() - _Capacity / 2 < _Capacity
				? 0 : _Capacity + _Capacity / 2;	
			if (_Capacity < size() + _Count)
				_Capacity = size() + _Count;
			pointer _Newvec = this->_Alval.allocate(_Capacity);
			pointer _Ptr = _Newvec;

			try {
			_Ptr = _Umove(_Myfirst, (_Where)._Myptr,
				_Newvec);	
			_Ptr = _Ucopy(_First, _Last, _Ptr);	
			_Umove((_Where)._Myptr, _Mylast, _Ptr);	
			} catch (...) {
			_Destroy(_Newvec, _Ptr);
			this->_Alval.deallocate(_Newvec, _Capacity);
			throw;
			}

			_Count += size();
			if (_Myfirst != 0)
				{	
				_Destroy(_Myfirst, _Mylast);
				this->_Alval.deallocate(_Myfirst, _Myend - _Myfirst);
				}
			_Myend = _Newvec + _Capacity;
			_Mylast = _Newvec + _Count;
			_Myfirst = _Newvec;
			}
		else if ((size_type)(end() - _Where) < _Count)
			{	
			_Umove((_Where)._Myptr, _Mylast,
				(_Where)._Myptr + _Count);	
			_Iter _Mid = _First;
			advance(_Mid, end() - _Where);

			try {
			_Ucopy(_Mid, _Last, _Mylast);	
			} catch (...) {
			_Destroy((_Where)._Myptr + _Count, _Mylast + _Count);
			throw;
			}

			_Mylast += _Count;
			::stdext:: unchecked_copy(_First, _Mid,
				(_Where)._Myptr);	
			}
		else
			{	
			pointer _Oldend = _Mylast;
			_Mylast = _Umove(_Oldend - _Count, _Oldend,
				_Mylast);	
			::stdext:: _Unchecked_move_backward((_Where)._Myptr, _Oldend - _Count,
				_Oldend);	
			::stdext:: unchecked_copy(_First, _Last,
				(_Where)._Myptr);	
			}
		}
	iterator erase(iterator _Where)
		{	
		::stdext:: unchecked_copy((_Where)._Myptr + 1, _Mylast,
			(_Where)._Myptr);
		_Destroy(_Mylast - 1, _Mylast);
		--_Mylast;
		return (_Where);
		}
	iterator erase(iterator _First, iterator _Last)
		{	
		if (_First != _Last)
			{	
			pointer _Ptr = ::stdext:: unchecked_copy((_Last)._Myptr, _Mylast,
				(_First)._Myptr);
			_Destroy(_Ptr, _Mylast);
			_Mylast = _Ptr;
			}
		return (_First);

		}

	void clear()
		{	
		erase(begin(), end());
		}

	void swap(_Myt& _Right)
		{	
		if (this->_Alval == _Right._Alval)
			{	
			std::swap(_Myfirst, _Right._Myfirst);
			std::swap(_Mylast, _Right._Mylast);
			std::swap(_Myend, _Right._Myend);
			}
		else
			{	
			_Myt _Ts = *this; *this = _Right, _Right = _Ts;
			}
		}

protected:
	void _Assign_n(size_type _Count, const _Ty& _Val)
		{	
		_Ty _Tmp = _Val;	
		erase(begin(), end());
		insert(begin(), _Count, _Tmp);
		}

	bool _Buy(size_type _Capacity)
		{	
		_Myfirst = 0, _Mylast = 0, _Myend = 0;
		if (_Capacity == 0)
			return (false);
		else if (max_size() < _Capacity)
			_Xlen();	
		else
			{	
			_Myfirst = this->_Alval.allocate(_Capacity);
			_Mylast = _Myfirst;
			_Myend = _Myfirst + _Capacity;
			}
		return (true);
		}

	void _Destroy(pointer _First, pointer _Last)
		{	
		_Destroy_range(_First, _Last, this->_Alval);
		}

	void _Tidy()
		{	
		if (_Myfirst != 0)
			{	
			_Destroy(_Myfirst, _Mylast);
			this->_Alval.deallocate(_Myfirst, _Myend - _Myfirst);
			}
		_Myfirst = 0, _Mylast = 0, _Myend = 0;
		}

	template<class _Iter>
		pointer _Ucopy(_Iter _First, _Iter _Last, pointer _Ptr)
		{	
		return (::stdext:: unchecked_uninitialized_copy(_First, _Last,
			_Ptr, this->_Alval));
		}

	template<class _Iter>
		pointer _Umove(_Iter _First, _Iter _Last, pointer _Ptr)
		{	
		return (::stdext:: _Unchecked_uninitialized_move(_First, _Last,
			_Ptr, this->_Alval));
		}

	void _Insert_n(iterator _Where,
		size_type _Count, const _Ty& _Val)
		{	
		_Ty _Tmp = _Val;	
		size_type _Capacity = capacity();

		if (_Count == 0)
			;
		else if (max_size() - size() < _Count)
			_Xlen();	
		else if (_Capacity < size() + _Count)
			{	
			_Capacity = max_size() - _Capacity / 2 < _Capacity
				? 0 : _Capacity + _Capacity / 2;	
			if (_Capacity < size() + _Count)
				_Capacity = size() + _Count;
			pointer _Newvec = this->_Alval.allocate(_Capacity);
			pointer _Ptr = _Newvec;

			try {
			_Ptr = _Umove(_Myfirst, (_Where)._Myptr,
				_Newvec);	
			_Ptr = _Ufill(_Ptr, _Count, _Tmp);	
			_Umove((_Where)._Myptr, _Mylast, _Ptr);	
			} catch (...) {
			_Destroy(_Newvec, _Ptr);
			this->_Alval.deallocate(_Newvec, _Capacity);
			throw;
			}

			_Count += size();
			if (_Myfirst != 0)
				{	
				_Destroy(_Myfirst, _Mylast);
				this->_Alval.deallocate(_Myfirst, _Myend - _Myfirst);
				}
			_Myend = _Newvec + _Capacity;
			_Mylast = _Newvec + _Count;
			_Myfirst = _Newvec;
			}
		else if ((size_type)(_Mylast - (_Where)._Myptr) < _Count)
			{	
			_Umove((_Where)._Myptr, _Mylast,
				(_Where)._Myptr + _Count);	

			try {
			_Ufill(_Mylast, _Count - (_Mylast - (_Where)._Myptr),
				_Tmp);	
			} catch (...) {
			_Destroy((_Where)._Myptr + _Count, _Mylast + _Count);
			throw;
			}

			_Mylast += _Count;
			fill((_Where)._Myptr, _Mylast - _Count,
				_Tmp);	
			}
		else
			{	
			pointer _Oldend = _Mylast;
			_Mylast = _Umove(_Oldend - _Count, _Oldend,
				_Mylast);	
			::stdext:: _Unchecked_move_backward((_Where)._Myptr, _Oldend - _Count,
				_Oldend);	
			fill((_Where)._Myptr, (_Where)._Myptr + _Count,
				_Tmp);	
			}
		}

	pointer _Ufill(pointer _Ptr, size_type _Count, const _Ty &_Val)
		{	
		::stdext:: unchecked_uninitialized_fill_n(_Ptr, _Count, _Val, this->_Alval);
		return (_Ptr + _Count);
		}

	static void _Xlen()
		{	
		throw length_error("vector<T> too long");
		}

	static void _Xran()
		{	
		throw out_of_range("invalid vector<T> subscript");
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid vector<T> argument");
		}
	pointer _Myfirst;	
	pointer _Mylast;	
	pointer _Myend;	
	};

	
template <class _Ty, class _Ax>
	class _Move_operation_category<vector<_Ty, _Ax> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

		
template<class _Ty,
	class _Alloc> inline
	bool operator==(const vector<_Ty, _Alloc>& _Left,
		const vector<_Ty, _Alloc>& _Right)
	{	
	return (_Left.size() == _Right.size()
		&& equal(_Left.begin(), _Left.end(), _Right.begin()));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator!=(const vector<_Ty, _Alloc>& _Left,
		const vector<_Ty, _Alloc>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator<(const vector<_Ty, _Alloc>& _Left,
		const vector<_Ty, _Alloc>& _Right)
	{	
	return (lexicographical_compare(_Left.begin(), _Left.end(),
		_Right.begin(), _Right.end()));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator>(const vector<_Ty, _Alloc>& _Left,
		const vector<_Ty, _Alloc>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Ty,
	class _Alloc> inline
	bool operator<=(const vector<_Ty, _Alloc>& _Left,
		const vector<_Ty, _Alloc>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator>=(const vector<_Ty, _Alloc>& _Left,
		const vector<_Ty, _Alloc>& _Right)
	{	
	return (!(_Left < _Right));
	}

template<class _Ty,
	class _Alloc> inline
	void swap(vector<_Ty, _Alloc>& _Left, vector<_Ty, _Alloc>& _Right)
	{	
	_Left.swap(_Right);
	}
typedef unsigned _Vbase;	
const int _VBITS = 8 * sizeof (_Vbase);	

		
template<class _MycontTy>
	class _Vb_iter_base
		: public _Ranit<_Bool, typename _MycontTy::difference_type,
			bool *, bool>
	{	
public:

	typedef _Range_checked_iterator_tag _Checked_iterator_category;
	_Vb_iter_base()
		: _Myptr(0), _Myoff(0)
		{	
		}
	_Vb_iter_base(const _Vb_iter_base<_MycontTy>& _Right)
		: _Myptr(_Right._Myptr), _Myoff(_Right._Myoff)
		{	
		{ if (!(_Right._Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		this->_Mycont = _Right._Mycont;
		}

	_Vb_iter_base(_Vbase *_Ptr, _MycontTy *_Mypvbool)
		: _Myptr(_Ptr), _Myoff(0)
		{	
		{ if (!(_Mypvbool != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		this->_Mycont = _Mypvbool;
		}
	_Vbase *_Myptr;
	typename _MycontTy::size_type _Myoff;

	static void _Xlen()
		{	
		throw length_error("vector<bool> too long");
			}

	static void _Xran()
		{	
		throw out_of_range("invalid vector<bool> subscript");
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid vector<bool> argument");
		}
	_Vbase * _My_cont_begin() const
		{
			return (((_MycontTy *)this->_Mycont)->_Myvec.begin())._Myptr;
		}

	typename _MycontTy::size_type _My_actual_offset() const
		{
		_MycontTy::size_type _Off = this->_Myoff;
		_Off += _VBITS * (this->_Myptr - _My_cont_begin());
		return _Off;
		}

	};

		
template<class _MycontTy>
	class _Vb_reference
		: public _Vb_iter_base<_MycontTy>
	{	
public:
	_Vb_reference()
		{	
		}

	_Vb_reference(const _Vb_iter_base<_MycontTy>& _Right)
		: _Vb_iter_base<_MycontTy>(_Right)
		{	
		}

	_Vb_reference& operator=(const _Vb_reference<_MycontTy>& _Right)
		{	
		return (*this = bool(_Right));
		}

	_Vb_reference<_MycontTy>& operator=(bool _Val)
		{	
		if (_Val)
			*_Getptr() |= _Mask();
		else
			*_Getptr() &= ~_Mask();
		return (*this);
		}

	void flip()
		{	
		*_Getptr() ^= _Mask();
		}

	bool operator~() const
		{	
		return (!bool(*this));
		}

	operator bool() const
		{	
		return ((*_Getptr() & _Mask()) != 0);
		}

	_Vbase *_Getptr() const
		{	
 		{ if (!(this->_Mycont != 0 && this->_Myptr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		{ if (!(this->_My_actual_offset() < ((_MycontTy *)this->_Mycont)->_Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		return (this->_Myptr);
		}

protected:
	_Vbase _Mask() const
		{	
		return ((_Vbase)(1 << this->_Myoff));
		}
	};

template<class _MycontTy>
	void swap(_Vb_reference<_MycontTy> _Left, _Vb_reference<_MycontTy> _Right)
	{	
	bool _Val = _Left;
	_Left = _Right;
	_Right = _Val;
	}

		
template<class _MycontTy>
	class _Vb_const_iterator
		: public _Vb_iter_base<_MycontTy>
	{	
public:
	typedef _Vb_reference<_MycontTy> _Reft;
	typedef bool const_reference;

	typedef random_access_iterator_tag iterator_category;
	typedef _Bool value_type;
	typedef typename _MycontTy::size_type size_type;
	typedef typename _MycontTy::difference_type difference_type;
	typedef const_reference *pointer;
	typedef const_reference reference;

	_Vb_const_iterator()
		{	
		}
	_Vb_const_iterator(const _Vbase *_Ptr, const _MycontTy *_Mypvbool)
		: _Vb_iter_base<_MycontTy>((_Vbase *)_Ptr, (_MycontTy *)_Mypvbool)
		{	
		}

	const_reference operator*() const
		{	
		return (_Reft(*this));
		}

	_Vb_const_iterator<_MycontTy>& operator++()
		{	
		_Inc();
		return (*this);
		}

	_Vb_const_iterator<_MycontTy> operator++(int)
		{	
		_Vb_const_iterator<_MycontTy> _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Vb_const_iterator<_MycontTy>& operator--()
		{	
		_Dec();
		return (*this);
		}

	_Vb_const_iterator<_MycontTy> operator--(int)
		{	
		_Vb_const_iterator<_MycontTy> _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Vb_const_iterator<_MycontTy>& operator+=(difference_type _Off)
		{	
		if (_Off == 0)
			return (*this);
		{ if (!(this->_Mycont != 0 && this->_Myptr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		if (_Off < 0)
			{
			{ if (!(this->_My_actual_offset() >= ((size_type)-_Off))) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			}
		else
			{
			{ if (!((this->_My_actual_offset() + _Off) <= ((_MycontTy *)this->_Mycont)->_Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			}
		if (_Off < 0 && this->_Myoff < 0 - (size_type)_Off)
			{	
			this->_Myoff += _Off;
			this->_Myptr -= 1 + ((size_type)(-1) - this->_Myoff) / _VBITS;
			this->_Myoff %= _VBITS;
			}
		else
			{	
			this->_Myoff += _Off;
			this->_Myptr += this->_Myoff / _VBITS;
			this->_Myoff %= _VBITS;
			}
		return (*this);
		}

	_Vb_const_iterator<_MycontTy> operator+(difference_type _Off) const
		{	
		_Vb_const_iterator<_MycontTy> _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Vb_const_iterator<_MycontTy>& operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Vb_const_iterator<_MycontTy> operator-(difference_type _Off) const
		{	
		_Vb_const_iterator<_MycontTy> _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type operator-(
		const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (_VBITS * (this->_Myptr - _Right._Myptr)
			+ (difference_type)this->_Myoff
			- (difference_type)_Right._Myoff);
		}

	const_reference operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}

	bool operator==(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (this->_Myptr == _Right._Myptr
			&& this->_Myoff == _Right._Myoff);
		}

	bool operator!=(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (!(*this == _Right));
		}

	bool operator<(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (this->_Myptr < _Right._Myptr
			|| this->_Myptr == _Right._Myptr
				&& this->_Myoff < _Right._Myoff);
		}

	bool operator>(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (_Right < *this);
		}

	bool operator<=(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (!(_Right < *this));
		}

	bool operator>=(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (!(*this < _Right));
		}

protected:
	void _Dec()
		{	
		if (this->_Myoff != 0)
			{
			--this->_Myoff;
			}
		else
			{
			{ if (!(this->_Mycont != 0 && this->_Myptr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(this->_Myptr > this->_My_cont_begin())) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			--this->_Myptr;
			this->_Myoff = _VBITS - 1;
			}
		}

	void _Inc()
		{	
		{ if (!(this->_Mycont != 0 && this->_Myptr != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		{ if (!((this->_My_actual_offset() + 1) <= ((_MycontTy *)this->_Mycont)->_Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		if (this->_Myoff < _VBITS - 1)
			++this->_Myoff;
		else
			this->_Myoff = 0, ++this->_Myptr;
		}
	};

template<class _MycontTy>
	_Vb_const_iterator<_MycontTy> operator+(
		typename _Vb_const_iterator<_MycontTy>::difference_type _Off,
		_Vb_const_iterator<_MycontTy> _Right)
		{	
		return (_Right += _Off);
		}

	
template<class _MycontTy>
	class _Vb_iterator
		: public _Vb_const_iterator<_MycontTy>
	{	
public:
	typedef _Vb_reference<_MycontTy> _Reft;
	typedef bool const_reference;

	typedef random_access_iterator_tag iterator_category;
	typedef _Bool value_type;
	typedef typename _MycontTy::size_type size_type;
	typedef typename _MycontTy::difference_type difference_type;
	typedef _Reft *pointer;
	typedef _Reft reference;

	_Vb_iterator()
		{	
		}
	_Vb_iterator(_Vbase *_Ptr, _MycontTy *_Mypvbool)
		: _Vb_const_iterator<_MycontTy>(_Ptr, _Mypvbool)
		{	
		}

	reference operator*() const
		{	
		return (_Reft(*this));
		}

	_Vb_iterator<_MycontTy>& operator++()
		{	
		++*(_Vb_const_iterator<_MycontTy> *)this;
		return (*this);
		}

	_Vb_iterator<_MycontTy> operator++(int)
		{	
		_Vb_iterator<_MycontTy> _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Vb_iterator<_MycontTy>& operator--()
		{	
		--*(_Vb_const_iterator<_MycontTy> *)this;
		return (*this);
		}

	_Vb_iterator<_MycontTy> operator--(int)
		{	
		_Vb_iterator<_MycontTy> _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Vb_iterator<_MycontTy>& operator+=(difference_type _Off)
		{	
		*(_Vb_const_iterator<_MycontTy> *)this += _Off;
		return (*this);
		}

	_Vb_iterator<_MycontTy> operator+(difference_type _Off) const
		{	
		_Vb_iterator<_MycontTy> _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Vb_iterator<_MycontTy>& operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Vb_iterator<_MycontTy> operator-(difference_type _Off) const
		{	
		_Vb_iterator<_MycontTy> _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type operator-(const _Vb_const_iterator<_MycontTy>& _Right) const
		{	
		return (*(_Vb_const_iterator<_MycontTy> *)this - _Right);
		}

	reference operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}
	};

template<class _MycontTy>
	_Vb_iterator<_MycontTy> operator+(
		typename _Vb_iterator<_MycontTy>::difference_type _Off,
		_Vb_iterator<_MycontTy> _Right)
		{	
		return (_Right += _Off);
		}

		
template<class _Alloc>
	class vector<_Bool, _Alloc>
		: public _Container_base
	{	
public:
	typedef typename _Alloc::size_type size_type;
	typedef typename _Alloc::difference_type _Dift;
	typedef std::vector<_Vbase,
		typename _Alloc::template rebind<_Vbase>::other>
			_Vbtype;
	typedef std::vector<_Bool, _Alloc> _Myt;
	typedef _Dift difference_type;
	typedef _Bool _Ty;
	typedef _Alloc allocator_type;

	typedef _Vb_reference<_Myt> reference;
	typedef bool const_reference;
	typedef bool value_type;

	typedef reference _Reft;
	typedef _Vb_const_iterator<_Myt> const_iterator;
	typedef _Vb_iterator<_Myt> iterator;

	friend class _Vb_reference<_Myt>;
	friend class _Vb_iter_base<_Myt>;
	friend class _Vb_const_iterator<_Myt>;

	typedef iterator pointer;
	typedef const_iterator const_pointer;
	typedef std::reverse_iterator<iterator> reverse_iterator;
	typedef std::reverse_iterator<const_iterator> const_reverse_iterator;

	vector()
		: _Mysize(0), _Myvec()
		{	
		}

	explicit vector(const _Alloc& _Al)
		: _Mysize(0), _Myvec(_Al)
		{	
		}

	explicit vector(size_type _Count, bool _Val = false)
		: _Mysize(0), _Myvec(_Nw(_Count), (_Vbase)(_Val ? -1 : 0))
		{	
		_Trim(_Count);
		}

	vector(size_type _Count, bool _Val, const _Alloc& _Al)
		: _Mysize(0), _Myvec(_Nw(_Count), (_Vbase)(_Val ? -1 : 0), _Al)
		{	
		_Trim(_Count);
		}

	template<class _Iter>
		vector(_Iter _First, _Iter _Last)
		: _Mysize(0), _Myvec()
		{	
		_BConstruct(_First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		vector(_Iter _First, _Iter _Last, const _Alloc& _Al)
		: _Mysize(0), _Myvec(_Al)
		{	
		_BConstruct(_First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		void _BConstruct(_Iter _Count, _Iter _Val, _Int_iterator_tag)
		{	
		size_type _Num = (size_type)_Count;
		_Myvec.assign(_Num, (_Ty)_Val ? -1 : 0);
		_Trim(_Num);
		}

	template<class _Iter>
		void _BConstruct(_Iter _First, _Iter _Last, input_iterator_tag)
		{	
		insert(begin(), _First, _Last);
		}

	~vector()
		{	
		_Mysize = 0;
		}

	void reserve(size_type _Count)
		{	
		_Myvec.reserve(_Nw(_Count));
		}

	size_type capacity() const
		{	
		return (_Myvec.capacity() * _VBITS);
		}
	iterator begin()
		{	
		return (iterator((_Myvec.begin())._Myptr, this));
		}

	const_iterator begin() const
		{	
		return (const_iterator((_Myvec.begin())._Myptr, this));
		}
	iterator end()
		{	
		iterator _Tmp = begin();
		if (0 < _Mysize)
			_Tmp += _Mysize;
		return (_Tmp);
		}

	const_iterator end() const
		{	
		const_iterator _Tmp = begin();
		if (0 < _Mysize)
			_Tmp += _Mysize;
		return (_Tmp);
		}

	reverse_iterator rbegin()
		{	
		return (reverse_iterator(end()));
		}

	const_reverse_iterator rbegin() const
		{	
		return (const_reverse_iterator(end()));
		}

	reverse_iterator rend()
		{	
		return (reverse_iterator(begin()));
		}

	const_reverse_iterator rend() const
		{	
		return (const_reverse_iterator(begin()));
		}

	void resize(size_type _Newsize, bool _Val = false)
		{	
		if (size() < _Newsize)
			_Insert_n(end(), _Newsize - size(), _Val);
		else if (_Newsize < size())
			erase(begin() + _Newsize, end());
		}

	size_type size() const
		{	
		return (_Mysize);
		}

	size_type max_size() const
		{	
		const size_type _Maxsize = _Myvec.max_size();
		return (_Maxsize < (size_type)(-1) / _VBITS
			? _Maxsize * _VBITS : (size_type)(-1));
		}

	bool empty() const
		{	
		return (size() == 0);
		}

	_Alloc get_allocator() const
		{	
		return (_Myvec.get_allocator());
		}

	const_reference at(size_type _Off) const
		{	
		if (size() <= _Off)
			_Xran();
		return (*(begin() + _Off));
		}

	reference at(size_type _Off)
		{	
		if (size() <= _Off)
			_Xran();
		return (*(begin() + _Off));
		}

	const_reference operator[](size_type _Off) const
		{	
		return (*(begin() + _Off));
		}

	reference operator[](size_type _Off)
		{	
		return (*(begin() + _Off));
		}

	reference front()
		{	
		return (*begin());
		}

	const_reference front() const
		{	
		return (*begin());
		}

	reference back()
		{	
		return (*(end() - 1));
		}

	const_reference back() const
		{	
		return (*(end() - 1));
		}

	void push_back(bool _Val)
		{	
		insert(end(), _Val);
		}

	void pop_back()
		{	
		if (!empty())
			erase(end() - 1);
		}

	template<class _Iter>
		void assign(_Iter _First, _Iter _Last)
		{	
		_Assign(_First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		void _Assign(_Iter _Count, _Iter _Val, _Int_iterator_tag)
		{	
		_Assign_n((size_type)_Count, (bool)_Val);
		}

	template<class _Iter>
		void _Assign(_Iter _First, _Iter _Last, input_iterator_tag)
		{	
		erase(begin(), end());
		insert(begin(), _First, _Last);
		}

	void assign(size_type _Count, bool _Val)
		{	
		_Assign_n(_Count, _Val);
		}

	iterator insert(iterator _Where, bool _Val)
		{	
		size_type _Off = _Where - begin();
		_Insert_n(_Where, (size_type)1, _Val);
		return (begin() + _Off);
		}

	void insert(iterator _Where, size_type _Count, bool _Val)
		{	
		_Insert_n(_Where, _Count, _Val);
		}

	template<class _Iter>
		void insert(iterator _Where, _Iter _First, _Iter _Last)
		{	
		_Insert(_Where, _First, _Last, _Iter_cat(_First));
		}

	template<class _Iter>
		void _Insert(iterator _Where, _Iter _Count, _Iter _Val,
			_Int_iterator_tag)
		{	
		_Insert_n(_Where, (size_type)_Count, (bool)_Val);
		}

	template<class _Iter>
		void _Insert(iterator _Where, _Iter _First, _Iter _Last,
			input_iterator_tag)
		{	
		size_type _Off = _Where - begin();

		for (; _First != _Last; ++_First, ++_Off)
			insert(begin() + _Off, *_First);
		}

	template<class _Iter>
		void _Insert(iterator _Where,
			_Iter _First, _Iter _Last,
			forward_iterator_tag)
		{	
		size_type _Count = 0;
		_Distance(_First, _Last, _Count);

		size_type _Off = _Insert_x(_Where, _Count);
		std::copy(_First, _Last, begin() + _Off);
		}

	iterator erase(iterator _Where)
		{	
		size_type _Off = _Where - begin();

		std::copy(_Where + 1, end(), _Where);
		_Trim(_Mysize - 1);
		return (begin() + _Off);
		}

	iterator erase(iterator _First, iterator _Last)
		{	
		size_type _Off = _First - begin();
		iterator _Next = std::copy(_Last, end(), _First);
		_Trim(_Next - begin());
		return (begin() + _Off);
		}

	void clear()
		{	
		erase(begin(), end());
		}

	void flip()
		{	
		for (_Vbtype::iterator _Next = _Myvec.begin();
			_Next != _Myvec.end(); ++_Next)
			*_Next = (_Vbase)~*_Next;
		_Trim(_Mysize);
		}

	void swap(_Myt& _Right)
		{	
		std::swap(_Mysize, _Right._Mysize);
		_Myvec.swap(_Right._Myvec);
		}

	static void swap(reference _Left, reference _Right)
		{	
		bool _Val = _Left;
		_Left = _Right;
		_Right = _Val;
		}
protected:
	void _Assign_n(size_type _Count, bool _Val)
		{	
		erase(begin(), end());
		_Insert_n(begin(), _Count, _Val);
		}

	void _Insert_n(iterator _Where,
		size_type _Count, bool _Val)
		{	
		size_type _Off = _Insert_x(_Where, _Count);
		fill(begin() + _Off, begin() + (_Off + _Count), _Val);
		}

	size_type _Insert_x(iterator _Where, size_type _Count)
		{	
		size_type _Off = _Where - begin();
		if (_Count == 0)
			;
		else if (max_size() - size() < _Count)
			_Xlen();	
		else
			{	
			_Myvec.resize(_Nw(size() + _Count), 0);
			if (size() == 0)
				_Mysize += _Count;
			else
				{	
				iterator _Oldend = end();
				_Mysize += _Count;
				copy_backward(begin() + _Off, _Oldend, end());
				}
			}
		return (_Off);
		}

	static size_type _Nw(size_type _Count)
		{	
		return ((_Count + _VBITS - 1) / _VBITS);
		}

	void _Trim(size_type _Size)
		{	
		if (max_size() < _Size)
			_Xlen();	
		size_type _Words = _Nw(_Size);

		if (_Words < _Myvec.size())
			_Myvec.erase(_Myvec.begin() + _Words, _Myvec.end());
		_Mysize = _Size;
		_Size %= _VBITS;
		if (0 < _Size)
			_Myvec[_Words - 1] &= (_Vbase)((1 << _Size) - 1);
		}

	void _Xlen() const
		{	
		throw length_error("vector<bool> too long");
		}

	void _Xran() const
		{	
		throw out_of_range("invalid vector<bool> subscript");
		}

	size_type _Mysize;	
	_Vbtype _Myvec;	
	};

typedef vector<bool, allocator<bool> > _Bvector;
}
  #pragma warning(default: 4244)
#pragma warning(pop)
#pragma pack(pop)
#pragma once

#pragma once

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)

 #pragma warning(disable: 4244)
namespace std {

		
template<class _Arg,
	class _Result>
	struct unary_function
	{	
	typedef _Arg argument_type;
	typedef _Result result_type;
	};

		
template<class _Arg1,
	class _Arg2,
	class _Result>
	struct binary_function
	{	
	typedef _Arg1 first_argument_type;
	typedef _Arg2 second_argument_type;
	typedef _Result result_type;
	};

		
template<class _Ty>
	struct plus
		: public binary_function<_Ty, _Ty, _Ty>
	{	
	_Ty operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left + _Right);
		}
	};

		
template<class _Ty>
	struct minus
		: public binary_function<_Ty, _Ty, _Ty>
	{	
	_Ty operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left - _Right);
		}
	};

		
template<class _Ty>
	struct multiplies
		: public binary_function<_Ty, _Ty, _Ty>
	{	
	_Ty operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left * _Right);
		}
	};

		
template<class _Ty>
	struct divides
		: public binary_function<_Ty, _Ty, _Ty>
	{	
	_Ty operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left / _Right);
		}
	};

		
template<class _Ty>
	struct modulus
		: public binary_function<_Ty, _Ty, _Ty>
	{	
	_Ty operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left % _Right);
		}
	};

		
template<class _Ty>
	struct negate
		: public unary_function<_Ty, _Ty>
	{	
	_Ty operator()(const _Ty& _Left) const
		{	
		return (-_Left);
		}
	};

		
template<class _Ty>
	struct equal_to
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left == _Right);
		}
	};

		
template<class _Ty>
	struct not_equal_to
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left != _Right);
		}
	};

		
template<class _Ty>
	struct greater
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left > _Right);
		}
	};

		
template<class _Ty>
	struct less
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left < _Right);
		}
	};

		
template<class _Ty>
	struct greater_equal
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left >= _Right);
		}
	};

		
template<class _Ty>
	struct less_equal
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left <= _Right);
		}
	};

		
template<class _Ty>
	struct logical_and
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left && _Right);
		}
	};

		
template<class _Ty>
	struct logical_or
		: public binary_function<_Ty, _Ty, bool>
	{	
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
		{	
		return (_Left || _Right);
		}
	};

		
template<class _Ty>
	struct logical_not
		: public unary_function<_Ty, bool>
	{	
	bool operator()(const _Ty& _Left) const
		{	
		return (!_Left);
		}
	};

		
template<class _Fn1>
	class unary_negate
	: public unary_function<typename _Fn1::argument_type, bool>
	{	
public:
	explicit unary_negate(const _Fn1& _Func)
		: _Functor(_Func)
		{	
		}

	bool operator()(const typename _Fn1::argument_type& _Left) const
		{	
		return (!_Functor(_Left));
		}

protected:
	_Fn1 _Functor;	
	};

		
template<class _Fn1> inline
	unary_negate<_Fn1> not1(const _Fn1& _Func)
	{	
	return (std::unary_negate<_Fn1>(_Func));
	}

		
template<class _Fn2>
	class binary_negate
		: public binary_function<typename _Fn2::first_argument_type,
			typename _Fn2::second_argument_type, bool>
	{	
public:
	explicit binary_negate(const _Fn2& _Func)
		: _Functor(_Func)
		{	
		}

	bool operator()(const typename _Fn2::first_argument_type& _Left,
		const typename _Fn2::second_argument_type& _Right) const
		{	
		return (!_Functor(_Left, _Right));
		}

protected:
	_Fn2 _Functor;	
	};

		
template<class _Fn2> inline
	binary_negate<_Fn2> not2(const _Fn2& _Func)
	{	
	return (std::binary_negate<_Fn2>(_Func));
	}

		
template<class _Fn2>
	class binder1st
		: public unary_function<typename _Fn2::second_argument_type,
			typename _Fn2::result_type>
	{	
public:
	typedef unary_function<typename _Fn2::second_argument_type,
		typename _Fn2::result_type> _Base;
	typedef typename _Base::argument_type argument_type;
	typedef typename _Base::result_type result_type;

	binder1st(const _Fn2& _Func,
		const typename _Fn2::first_argument_type& _Left)
		: op(_Func), value(_Left)
		{	
		}

	result_type operator()(const argument_type& _Right) const
		{	
		return (op(value, _Right));
		}

	result_type operator()(argument_type& _Right) const
		{	
		return (op(value, _Right));
		}

protected:
	_Fn2 op;	
	typename _Fn2::first_argument_type value;	
	};

		
template<class _Fn2,
	class _Ty> inline
	binder1st<_Fn2> bind1st(const _Fn2& _Func, const _Ty& _Left)
		{	
		typename _Fn2::first_argument_type _Val(_Left);
		return (std::binder1st<_Fn2>(_Func, _Val));
		}

		
template<class _Fn2>
	class binder2nd
		: public unary_function<typename _Fn2::first_argument_type,
			typename _Fn2::result_type>
	{	
public:
	typedef unary_function<typename _Fn2::first_argument_type,
		typename _Fn2::result_type> _Base;
	typedef typename _Base::argument_type argument_type;
	typedef typename _Base::result_type result_type;

	binder2nd(const _Fn2& _Func,
		const typename _Fn2::second_argument_type& _Right)
		: op(_Func), value(_Right)
		{	
		}

	result_type operator()(const argument_type& _Left) const
		{	
		return (op(_Left, value));
		}

	result_type operator()(argument_type& _Left) const
		{	
		return (op(_Left, value));
		}

protected:
	_Fn2 op;	
	typename _Fn2::second_argument_type value;	
	};

		
template<class _Fn2,
	class _Ty> inline
	binder2nd<_Fn2> bind2nd(const _Fn2& _Func, const _Ty& _Right)
	{	
	typename _Fn2::second_argument_type _Val(_Right);
	return (std::binder2nd<_Fn2>(_Func, _Val));
	}

		
template<class _Arg,
	class _Result,
	class _Fn = _Result (*)(_Arg)>
	class pointer_to_unary_function
		: public unary_function<_Arg, _Result>
	{	
public:
	explicit pointer_to_unary_function(_Fn _Left)
		: _Pfun(_Left)
		{	
		}

	_Result operator()(_Arg _Left) const
		{	
		return (_Pfun(_Left));
		}

protected:
	_Fn _Pfun;	
	};

		
template<class _Arg1,
	class _Arg2,
	class _Result,
	class _Fn = _Result (*)(_Arg1, _Arg2)>
	class pointer_to_binary_function
		: public binary_function<_Arg1, _Arg2, _Result>
	{	
public:
	explicit pointer_to_binary_function(_Fn _Left)
		: _Pfun(_Left)
		{	
		}

	_Result operator()(_Arg1 _Left, _Arg2 _Right) const
		{	
		return (_Pfun(_Left, _Right));
		}

protected:
	_Fn _Pfun;	
	};

		
template<class _Arg,
	class _Result> inline
	pointer_to_unary_function<_Arg, _Result, _Result (__cdecl *)(_Arg)>
		ptr_fun(_Result (__cdecl *_Left)(_Arg))
	{	
	return (std::pointer_to_unary_function<_Arg, _Result, _Result (__cdecl *)(_Arg)>(_Left));
	}
template<class _Arg,
	class _Result> inline
	pointer_to_unary_function<_Arg, _Result,
		_Result (__stdcall *)(_Arg)>
			ptr_fun(_Result (__stdcall *_Left)(_Arg))
	{	
	return (std::pointer_to_unary_function<_Arg, _Result, _Result (__stdcall *)(_Arg)>(_Left));
	}
template<class _Arg,
	class _Result> inline
	pointer_to_unary_function<_Arg, _Result,
		_Result (__fastcall *)(_Arg)>
			ptr_fun(_Result (__fastcall *_Left)(_Arg))
	{	
	return (std::pointer_to_unary_function<_Arg, _Result, _Result (__fastcall *)(_Arg)>(_Left));
	}
template<class _Arg1,
	class _Arg2,
	class _Result> inline
	pointer_to_binary_function<_Arg1, _Arg2, _Result, _Result(__cdecl *)(_Arg1, _Arg2)>
		ptr_fun(_Result (__cdecl *_Left)(_Arg1, _Arg2))
	{	
	return (std::pointer_to_binary_function<_Arg1, _Arg2, _Result, _Result (__cdecl *)(_Arg1, _Arg2)>(_Left));
	}
template<class _Arg1,
	class _Arg2,
	class _Result> inline
	pointer_to_binary_function<_Arg1, _Arg2, _Result,
		_Result(__stdcall *)(_Arg1, _Arg2)>
			ptr_fun(_Result (__stdcall *_Left)(_Arg1, _Arg2))
	{	
	return (std::pointer_to_binary_function<_Arg1, _Arg2, _Result,
		_Result (__stdcall *)(_Arg1, _Arg2)>(_Left));
	}
template<class _Arg1,
	class _Arg2,
	class _Result> inline
	pointer_to_binary_function<_Arg1, _Arg2, _Result,
		_Result(__fastcall *)(_Arg1, _Arg2)>
			ptr_fun(_Result (__fastcall *_Left)(_Arg1, _Arg2))
	{	
	return (std::pointer_to_binary_function<_Arg1, _Arg2, _Result,
		_Result (__fastcall *)(_Arg1, _Arg2)>(_Left));
	}
		
template<class _Result,
	class _Ty>
	class mem_fun_t
		: public unary_function<_Ty *, _Result>
	{	
public:
	explicit mem_fun_t(_Result (_Ty::*_Pm)())
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(_Ty *_Pleft) const
		{	
		return ((_Pleft->*_Pmemfun)());
		}

private:
	_Result (_Ty::*_Pmemfun)();	
	};

		
template<class _Result,
	class _Ty,
	class _Arg>
	class mem_fun1_t
		: public binary_function<_Ty *, _Arg, _Result>
	{	
public:
	explicit mem_fun1_t(_Result (_Ty::*_Pm)(_Arg))
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(_Ty *_Pleft, _Arg _Right) const
		{	
		return ((_Pleft->*_Pmemfun)(_Right));
		}

private:
	_Result (_Ty::*_Pmemfun)(_Arg);	
	};

		
template<class _Result,
	class _Ty>
	class const_mem_fun_t
		: public unary_function<const _Ty *, _Result>
	{	
public:
	explicit const_mem_fun_t(_Result (_Ty::*_Pm)() const)
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(const _Ty *_Pleft) const
		{	
		return ((_Pleft->*_Pmemfun)());
		}

private:
	_Result (_Ty::*_Pmemfun)() const;	
	};

		
template<class _Result,
	class _Ty,
	class _Arg>
	class const_mem_fun1_t
		: public binary_function<const _Ty *, _Arg, _Result>
	{	
public:
	explicit const_mem_fun1_t(_Result (_Ty::*_Pm)(_Arg) const)
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(const _Ty *_Pleft, _Arg _Right) const
		{	
		return ((_Pleft->*_Pmemfun)(_Right));
		}

private:
	_Result (_Ty::*_Pmemfun)(_Arg) const;	
	};

		
template<class _Result,
	class _Ty> inline
	mem_fun_t<_Result, _Ty> mem_fun(_Result (_Ty::*_Pm)())
	{	
	return (std::mem_fun_t<_Result, _Ty>(_Pm));
	}

template<class _Result,
	class _Ty,
	class _Arg> inline
	mem_fun1_t<_Result, _Ty, _Arg> mem_fun(_Result (_Ty::*_Pm)(_Arg))
	{	
	return (std::mem_fun1_t<_Result, _Ty, _Arg>(_Pm));
	}

template<class _Result,
	class _Ty> inline
	const_mem_fun_t<_Result, _Ty>
		mem_fun(_Result (_Ty::*_Pm)() const)
	{	
	return (std::const_mem_fun_t<_Result, _Ty>(_Pm));
	}

template<class _Result,
	class _Ty,
	class _Arg> inline
	const_mem_fun1_t<_Result, _Ty, _Arg>
		mem_fun(_Result (_Ty::*_Pm)(_Arg) const)
	{	
	return (std::const_mem_fun1_t<_Result, _Ty, _Arg>(_Pm));
	}

		
template<class _Result,
	class _Ty,
	class _Arg> inline
	mem_fun1_t<_Result, _Ty, _Arg> mem_fun1(_Result (_Ty::*_Pm)(_Arg))
	{	
	return (std::mem_fun1_t<_Result, _Ty, _Arg>(_Pm));
	}

		
template<class _Result,
	class _Ty>
	class mem_fun_ref_t
		: public unary_function<_Ty, _Result>
	{	
public:
	explicit mem_fun_ref_t(_Result (_Ty::*_Pm)())
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(_Ty& _Left) const
		{	
		return ((_Left.*_Pmemfun)());
		}

private:
	_Result (_Ty::*_Pmemfun)();	
	};

		
template<class _Result,
	class _Ty,
	class _Arg>
	class mem_fun1_ref_t
		: public binary_function<_Ty, _Arg, _Result>
	{	
public:
	explicit mem_fun1_ref_t(_Result (_Ty::*_Pm)(_Arg))
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(_Ty& _Left, _Arg _Right) const
		{	
		return ((_Left.*_Pmemfun)(_Right));
		}

private:
	_Result (_Ty::*_Pmemfun)(_Arg);	
	};

		
template<class _Result,
	class _Ty>
	class const_mem_fun_ref_t
		: public unary_function<_Ty, _Result>
	{	
public:
	explicit const_mem_fun_ref_t(_Result (_Ty::*_Pm)() const)
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(const _Ty& _Left) const
		{	
		return ((_Left.*_Pmemfun)());
		}

private:
	_Result (_Ty::*_Pmemfun)() const;	
	};

		
template<class _Result,
	class _Ty,
	class _Arg>
	class const_mem_fun1_ref_t
		: public binary_function<_Ty, _Arg, _Result>
	{	
public:
	explicit const_mem_fun1_ref_t(_Result (_Ty::*_Pm)(_Arg) const)
		: _Pmemfun(_Pm)
		{	
		}

	_Result operator()(const _Ty& _Left, _Arg _Right) const
		{	
		return ((_Left.*_Pmemfun)(_Right));
		}

private:
	_Result (_Ty::*_Pmemfun)(_Arg) const;	
	};

		
template<class _Result,
	class _Ty> inline
	mem_fun_ref_t<_Result, _Ty> mem_fun_ref(_Result (_Ty::*_Pm)())
	{	
	return (std::mem_fun_ref_t<_Result, _Ty>(_Pm));
	}

template<class _Result,
	class _Ty,
	class _Arg> inline
	mem_fun1_ref_t<_Result, _Ty, _Arg>
		mem_fun_ref(_Result (_Ty::*_Pm)(_Arg))
	{	
	return (std::mem_fun1_ref_t<_Result, _Ty, _Arg>(_Pm));
	}

template<class _Result,
	class _Ty> inline
	const_mem_fun_ref_t<_Result, _Ty>
		mem_fun_ref(_Result (_Ty::*_Pm)() const)
	{	
	return (std::const_mem_fun_ref_t<_Result, _Ty>(_Pm));
	}

template<class _Result,
	class _Ty,
	class _Arg> inline
	const_mem_fun1_ref_t<_Result, _Ty, _Arg>
		mem_fun_ref(_Result (_Ty::*_Pm)(_Arg) const)
	{	
	return (std::const_mem_fun1_ref_t<_Result, _Ty, _Arg>(_Pm));
	}

		
template<class _Result,
	class _Ty,
	class _Arg> inline
	mem_fun1_ref_t<_Result, _Ty, _Arg> mem_fun1_ref(_Result (_Ty::*_Pm)(_Arg))
	{	
	return (std::mem_fun1_ref_t<_Result, _Ty, _Arg>(_Pm));
	}
}
  #pragma warning(default: 4244)

#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)

 #pragma warning(disable:4127)
namespace std {

		
template<class _Traits>
	class _Tree_nod
		: public _Traits	
	{	
protected:
	struct _Node;
	friend struct _Node;

	typedef typename _Traits::allocator_type allocator_type;
	typedef typename _Traits::key_compare key_compare;
	typedef typename _Traits::value_type value_type;
	typedef typename allocator_type::template
		rebind<_Node>::other::pointer _Genptr;

	struct _Node
		{	
		_Node(_Genptr _Larg, _Genptr _Parg, _Genptr _Rarg,
			const value_type& _Val, char _Carg)
			: _Left(_Larg), _Parent(_Parg), _Right(_Rarg),
				_Myval(_Val), _Color(_Carg), _Isnil(false)
			{	
			}

		_Genptr _Left;	
		_Genptr _Parent;	
		_Genptr _Right;	
		value_type _Myval;	
		char _Color;	
		char _Isnil;	
		};

	_Tree_nod(const key_compare& _Parg,
		allocator_type _Al)
		: _Traits(_Parg), _Alnod(_Al)
		{	
		}

	typename allocator_type::template rebind<_Node>::other
		_Alnod;	
	};

		
template<class _Traits>
	class _Tree_ptr
		: public _Tree_nod<_Traits>
	{	
protected:

	typedef typename _Tree_nod<_Traits>::_Node _Node;
	typedef typename _Traits::allocator_type allocator_type;
	typedef typename _Traits::key_compare key_compare;
	typedef typename allocator_type::template
		rebind<_Node>::other::pointer _Nodeptr;

	_Tree_ptr(const key_compare& _Parg,
		allocator_type _Al)
		: _Tree_nod<_Traits>(_Parg, _Al), _Alptr(_Al)
		{	
		}

	typename allocator_type::template rebind<_Nodeptr>::other
		_Alptr;	
	};

		
template<class _Traits>
	class _Tree_val
		: public _Tree_ptr<_Traits>
	{	
protected:
	typedef typename _Traits::allocator_type allocator_type;
	typedef typename _Traits::key_compare key_compare;

	_Tree_val(const key_compare& _Parg,
		allocator_type _Al)
		: _Tree_ptr<_Traits>(_Parg, _Al), _Alval(_Al)
		{	
		}

	allocator_type _Alval;	
	};

		
template<class _Traits>
	class _Tree
		: public _Tree_val<_Traits>
	{	
public:
	typedef _Tree<_Traits> _Myt;
	typedef _Tree_val<_Traits> _Mybase;
	typedef typename _Traits::key_type key_type;
	typedef typename _Traits::key_compare key_compare;
	typedef typename _Traits::value_compare value_compare;
	typedef typename _Traits::value_type value_type;
	typedef typename _Traits::allocator_type allocator_type;
	typedef typename _Traits::_ITptr _ITptr;
	typedef typename _Traits::_IReft _IReft;

protected:

	typedef typename _Tree_nod<_Traits>::_Genptr _Genptr;

	typedef typename _Tree_nod<_Traits>::_Node _Node;

	enum _Redbl
		{	
		_Red, _Black};
	typedef typename allocator_type::template rebind<_Node>::other::pointer _Nodeptr;
	typedef typename allocator_type::template rebind<_Nodeptr>::other::reference _Nodepref;
	typedef typename allocator_type::template rebind<key_type>::other::const_reference _Keyref;
	typedef typename allocator_type::template rebind<char>::other::reference _Charref;
	typedef typename allocator_type::template rebind<value_type>::other::reference _Vref;

	static _Charref _Color(_Nodeptr _Pnode)
		{	
		return ((_Charref)(*_Pnode)._Color);
		}

	static _Charref _Isnil(_Nodeptr _Pnode)
		{	
		return ((_Charref)(*_Pnode)._Isnil);
		}

	static _Keyref _Key(_Nodeptr _Pnode)
		{	
		return (_Mybase::_Kfn(_Myval(_Pnode)));
		}

	static _Nodepref _Left(_Nodeptr _Pnode)
		{	
		return ((_Nodepref)(*_Pnode)._Left);
		}

	static _Nodepref _Parent(_Nodeptr _Pnode)
		{	
		return ((_Nodepref)(*_Pnode)._Parent);
		}

	static _Nodepref _Right(_Nodeptr _Pnode)
		{	
		return ((_Nodepref)(*_Pnode)._Right);
		}

	static _Vref _Myval(_Nodeptr _Pnode)
		{	
		return ((_Vref)(*_Pnode)._Myval);
		}

public:
	typedef typename allocator_type::size_type size_type;
	typedef typename allocator_type::difference_type _Dift;
	typedef _Dift difference_type;
	typedef typename allocator_type::template rebind<value_type>::other::pointer _Tptr;
	typedef typename allocator_type::template rebind<value_type>::other::const_pointer _Ctptr;
	typedef typename allocator_type::template rebind<value_type>::other::reference _Reft;
	typedef _Tptr pointer;
	typedef _Ctptr const_pointer;
	typedef _Reft reference;
	typedef typename allocator_type::template rebind<value_type>::other::const_reference
		const_reference;

		
	class const_iterator;
	friend class const_iterator;

	class const_iterator
		: public _Bidit<value_type, _Dift, _Ctptr, const_reference>
	{	
	public:
		friend class _Tree<_Traits>;
		typedef bidirectional_iterator_tag iterator_category;
		typedef _Dift difference_type;
		typedef _Ctptr pointer;
		typedef const_reference reference;
		typedef _Range_checked_iterator_tag _Checked_iterator_category;
		const_iterator()
			: _Ptr(0)
			{	
			}
		const_iterator(_Nodeptr _Pnode, const _Myt *_Plist)
			: _Ptr(_Pnode)
			{	
			{ if (!(_Plist != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			this->_Mycont =_Plist;
			}
		const_reference operator*() const
			{	
			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(_Ptr != ((_Myt *)(this->_Mycont))->_Myhead)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			return (_Myval(_Ptr));
			}

		_Ctptr operator->() const
			{	
			return (&**this);
			}

		const_iterator& operator++()
			{	
			_Inc();
			return (*this);
			}

		const_iterator operator++(int)
			{	
			const_iterator _Tmp = *this;
			++*this;
			return (_Tmp);
			}

		const_iterator& operator--()
			{	
			_Dec();
			return (*this);
			}

		const_iterator operator--(int)
			{	
			const_iterator _Tmp = *this;
			--*this;
			return (_Tmp);
			}

		bool operator==(const const_iterator& _Right) const
			{	

			{ if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			return (_Ptr == _Right._Ptr);
			}

		bool operator!=(const const_iterator& _Right) const
			{	
			return (!(*this == _Right));
			}

		void _Dec()
			{	

			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			if (_Isnil(_Ptr))
			{
				_Ptr = _Right(_Ptr);	
   				if (_Isnil(_Ptr))
				{
    				{ ((void)0); ::_invalid_parameter_noinfo(); };
				}
			}
			else if (!_Isnil(_Left(_Ptr)))
				_Ptr = _Max(_Left(_Ptr));	
			else
				{	
				_Nodeptr _Pnode;
				while (!_Isnil(_Pnode = _Parent(_Ptr))
					&& _Ptr == _Left(_Pnode))
					_Ptr = _Pnode;	
				if (_Isnil(_Ptr))
					{
					{ ((void)0); ::_invalid_parameter_noinfo(); };
					}
				else
					_Ptr = _Pnode;	
				}
			}

		void _Inc()
			{	

			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			if (_Isnil(_Ptr))
				{
				{ ((void)0); ::_invalid_parameter_noinfo(); };
				
				}
			else if (!_Isnil(_Right(_Ptr)))
				_Ptr = _Min(_Right(_Ptr));	
			else
				{	
				_Nodeptr _Pnode;
				while (!_Isnil(_Pnode = _Parent(_Ptr))
					&& _Ptr == _Right(_Pnode))
					_Ptr = _Pnode;	
				_Ptr = _Pnode;	
				}
			}

		_Nodeptr _Mynode() const
			{	
			return (_Ptr);
			}

	protected:

		_Nodeptr _Ptr;	
		};

		
	class iterator;
	friend class iterator;

	class iterator
		: public const_iterator
	{	
	public:
		typedef bidirectional_iterator_tag iterator_category;
		typedef _Dift difference_type;
		typedef _ITptr pointer;
		typedef _IReft reference;

		iterator()
			{	
			}

		iterator(_Nodeptr _Pnode, const _Myt *_Plist)
			: const_iterator(_Pnode, _Plist)
			{	
			}
		reference operator*() const
			{	
			return ((reference)**(const_iterator *)this);
			}

		pointer operator->() const
			{	
			return (&**this);
			}

		iterator& operator++()
			{	
			++(*(const_iterator *)this);
			return (*this);
			}

		iterator operator++(int)
			{	
			iterator _Tmp = *this;
			++*this;
			return (_Tmp);
			}

		iterator& operator--()
			{	
			--(*(const_iterator *)this);
			return (*this);
			}

		iterator operator--(int)
			{	
			iterator _Tmp = *this;
			--*this;
			return (_Tmp);
			}
		};

	typedef std::reverse_iterator<iterator> reverse_iterator;
	typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
	typedef pair<iterator, bool> _Pairib;
	typedef pair<iterator, iterator> _Pairii;
	typedef pair<const_iterator, const_iterator> _Paircc;

	explicit _Tree(const key_compare& _Parg,
		const allocator_type& _Al)
		: _Mybase(_Parg, _Al)
		{	
		_Init();
		}

	_Tree(const value_type *_First, const value_type *_Last,
		const key_compare& _Parg, const allocator_type& _Al)
		: _Mybase(_Parg, _Al)
		{	
		_Init();
		try {
		insert(_First, _Last);
		} catch (...) {
		_Tidy();
		throw;
		}
		}

	_Tree(const _Myt& _Right)
		: _Mybase(_Right.key_comp(), _Right.get_allocator())
		{	
		_Init();
		try {
		_Copy(_Right);
		} catch (...) {
		_Tidy();
		throw;
		}
		}

	~_Tree()
		{	
		_Tidy();
		}

	_Myt& operator=(const _Myt& _Right)
		{	
		if (this != &_Right)
			{	
			erase(begin(), end());
			this->comp = _Right.comp;
			_Copy(_Right);
			}
		return (*this);
		}

	iterator begin()
		{	
		return (iterator(_Lmost(), this));
		}

	const_iterator begin() const
		{	
		return (const_iterator(_Lmost(), this));
		}

	iterator end()
		{	
		return (iterator(_Myhead, this));
		}

	const_iterator end() const
		{	
		return (const_iterator(_Myhead, this));
		}

	reverse_iterator rbegin()
		{	
		return (reverse_iterator(end()));
		}

	const_reverse_iterator rbegin() const
		{	
		return (const_reverse_iterator(end()));
		}

	reverse_iterator rend()
		{	
		return (reverse_iterator(begin()));
		}

	const_reverse_iterator rend() const
		{	
		return (const_reverse_iterator(begin()));
		}

	size_type size() const
		{	
		return (_Mysize);
		}

	size_type max_size() const
		{	
		return (this->_Alval.max_size());
		}

	bool empty() const
		{	
		return (size() == 0);
		}

	allocator_type get_allocator() const
		{	
		return (this->_Alval);
		}

	key_compare key_comp() const
		{	
		return (this->comp);
		}

	value_compare value_comp() const
		{	
		return (value_compare(key_comp()));
		}

	_Pairib insert(const value_type& _Val)
		{	
		_Nodeptr _Trynode = _Root();
		_Nodeptr _Wherenode = _Myhead;
		bool _Addleft = true;	
		while (!_Isnil(_Trynode))
			{	
			_Wherenode = _Trynode;
			_Addleft = this->comp(this->_Kfn(_Val), _Key(_Trynode));
			_Trynode = _Addleft ? _Left(_Trynode) : _Right(_Trynode);
			}

		if (this->_Multi)
			return (_Pairib(_Insert(_Addleft, _Wherenode, _Val), true));
		else
			{	
			iterator _Where = iterator(_Wherenode, this);
			if (!_Addleft)
				;	
			else if (_Where == begin())
				return (_Pairib(_Insert(true, _Wherenode, _Val), true));
			else
				--_Where;	

			if (this->comp(_Key(_Where._Mynode()), this->_Kfn(_Val)))
				return (_Pairib(_Insert(_Addleft, _Wherenode, _Val), true));
			else
				return (_Pairib(_Where, false));
			}
		}

	iterator insert(iterator _Where,
		const value_type& _Val)
		{	
		iterator _Next;

		if (size() == 0)
			return (_Insert(true, _Myhead, _Val));	
		else if (this->_Multi)
			{	
			if (_Where == begin())
				{	
				if (!this->comp(_Key(_Where._Mynode()), this->_Kfn(_Val)))
					return (_Insert(true, _Where._Mynode(), _Val));
				}
			else if (_Where == end())
				{	
				if (!this->comp(this->_Kfn(_Val), _Key(_Rmost())))
					return (_Insert(false, _Rmost(), _Val));
				}
			else if (!this->comp(_Key(_Where._Mynode()), this->_Kfn(_Val))
				&& !this->comp(this->_Kfn(_Val), _Key((--(_Next = _Where))._Mynode())))
				{	
				if (_Isnil(_Right(_Next._Mynode())))
					return (_Insert(false, _Next._Mynode(), _Val));
				else
					return (_Insert(true, _Where._Mynode(), _Val));
				}
			else if (!this->comp(this->_Kfn(_Val), _Key(_Where._Mynode()))
				&& (++(_Next = _Where) == end()
					|| !this->comp(_Key(_Next._Mynode()), this->_Kfn(_Val))))
				{	
				if (_Isnil(_Right(_Where._Mynode())))
					return (_Insert(false, _Where._Mynode(), _Val));
				else
					return (_Insert(true, _Next._Mynode(), _Val));
				}
			}
		else
			{	
			if (_Where == begin())
				{	
				if (this->comp(this->_Kfn(_Val), _Key(_Where._Mynode())))
					return (_Insert(true, _Where._Mynode(), _Val));
				}
			else if (_Where == end())
				{	
				if (this->comp(_Key(_Rmost()), this->_Kfn(_Val)))
					return (_Insert(false, _Rmost(), _Val));
				}
			else if (this->comp(this->_Kfn(_Val), _Key(_Where._Mynode()))
				&& this->comp(_Key((--(_Next = _Where))._Mynode()), this->_Kfn(_Val)))
				{	
				if (_Isnil(_Right(_Next._Mynode())))
					return (_Insert(false, _Next._Mynode(), _Val));
				else
					return (_Insert(true, _Where._Mynode(), _Val));
				}
			else if (this->comp(_Key(_Where._Mynode()), this->_Kfn(_Val))
				&& (++(_Next = _Where) == end()
					|| this->comp(this->_Kfn(_Val), _Key(_Next._Mynode()))))
				{	
				if (_Isnil(_Right(_Where._Mynode())))
					return (_Insert(false, _Where._Mynode(), _Val));
				else
					return (_Insert(true, _Next._Mynode(), _Val));
				}
			}

		return (insert(_Val).first);	
		}

	template<class _Iter>
		void insert(_Iter _First, _Iter _Last)
		{	
		for (; _First != _Last; ++_First)
			insert(*_First);
		}

	iterator erase(iterator _Where)
		{	
		if (_Isnil(_Where._Mynode()))
			throw out_of_range("invalid map/set<T> iterator");
		_Nodeptr _Erasednode = _Where._Mynode();	
		++_Where;	
		_Nodeptr _Fixnode;	
		_Nodeptr _Fixnodeparent;	
		_Nodeptr _Pnode = _Erasednode;

		if (_Isnil(_Left(_Pnode)))
			_Fixnode = _Right(_Pnode);	
		else if (_Isnil(_Right(_Pnode)))
			_Fixnode = _Left(_Pnode);	
		else
			{	
			_Pnode = _Where._Mynode();	
			_Fixnode = _Right(_Pnode);	
			}

		if (_Pnode == _Erasednode)
			{	
			_Fixnodeparent = _Parent(_Erasednode);
			if (!_Isnil(_Fixnode))
				_Parent(_Fixnode) = _Fixnodeparent;	

			if (_Root() == _Erasednode)
				_Root() = _Fixnode;	
			else if (_Left(_Fixnodeparent) == _Erasednode)
				_Left(_Fixnodeparent) = _Fixnode;	
			else
				_Right(_Fixnodeparent) = _Fixnode;	

			if (_Lmost() == _Erasednode)
				_Lmost() = _Isnil(_Fixnode)
					? _Fixnodeparent	
					: _Min(_Fixnode);	

			if (_Rmost() == _Erasednode)
				_Rmost() = _Isnil(_Fixnode)
					? _Fixnodeparent	
					: _Max(_Fixnode);	
			}
		else
			{	
			_Parent(_Left(_Erasednode)) = _Pnode;	
			_Left(_Pnode) = _Left(_Erasednode);	

			if (_Pnode == _Right(_Erasednode))
				_Fixnodeparent = _Pnode;	
			else
				{	
				_Fixnodeparent = _Parent(_Pnode);	
				if (!_Isnil(_Fixnode))
					_Parent(_Fixnode) = _Fixnodeparent;	
				_Left(_Fixnodeparent) = _Fixnode;	
				_Right(_Pnode) = _Right(_Erasednode);	
				_Parent(_Right(_Erasednode)) = _Pnode;	
				}

			if (_Root() == _Erasednode)
				_Root() = _Pnode;	
			else if (_Left(_Parent(_Erasednode)) == _Erasednode)
				_Left(_Parent(_Erasednode)) = _Pnode;	
			else
				_Right(_Parent(_Erasednode)) = _Pnode;	

			_Parent(_Pnode) = _Parent(_Erasednode);	
			std::swap(_Color(_Pnode), _Color(_Erasednode));	
			}

		if (_Color(_Erasednode) == _Black)
			{	
			for (; _Fixnode != _Root() && _Color(_Fixnode) == _Black;
				_Fixnodeparent = _Parent(_Fixnode))
				if (_Fixnode == _Left(_Fixnodeparent))
					{	
					_Pnode = _Right(_Fixnodeparent);
					if (_Color(_Pnode) == _Red)
						{	
						_Color(_Pnode) = _Black;
						_Color(_Fixnodeparent) = _Red;
						_Lrotate(_Fixnodeparent);
						_Pnode = _Right(_Fixnodeparent);
						}

					if (_Isnil(_Pnode))
						_Fixnode = _Fixnodeparent;	
					else if (_Color(_Left(_Pnode)) == _Black
						&& _Color(_Right(_Pnode)) == _Black)
						{	
						_Color(_Pnode) = _Red;
						_Fixnode = _Fixnodeparent;
						}
					else
						{	
						if (_Color(_Right(_Pnode)) == _Black)
							{	
							_Color(_Left(_Pnode)) = _Black;
							_Color(_Pnode) = _Red;
							_Rrotate(_Pnode);
							_Pnode = _Right(_Fixnodeparent);
							}

						_Color(_Pnode) = _Color(_Fixnodeparent);
						_Color(_Fixnodeparent) = _Black;
						_Color(_Right(_Pnode)) = _Black;
						_Lrotate(_Fixnodeparent);
						break;	
						}
					}
				else
					{	
					_Pnode = _Left(_Fixnodeparent);
					if (_Color(_Pnode) == _Red)
						{	
						_Color(_Pnode) = _Black;
						_Color(_Fixnodeparent) = _Red;
						_Rrotate(_Fixnodeparent);
						_Pnode = _Left(_Fixnodeparent);
						}
					if (_Isnil(_Pnode))
						_Fixnode = _Fixnodeparent;	
					else if (_Color(_Right(_Pnode)) == _Black
						&& _Color(_Left(_Pnode)) == _Black)
						{	
						_Color(_Pnode) = _Red;
						_Fixnode = _Fixnodeparent;
						}
					else
						{	
						if (_Color(_Left(_Pnode)) == _Black)
							{	
							_Color(_Right(_Pnode)) = _Black;
							_Color(_Pnode) = _Red;
							_Lrotate(_Pnode);
							_Pnode = _Left(_Fixnodeparent);
							}

						_Color(_Pnode) = _Color(_Fixnodeparent);
						_Color(_Fixnodeparent) = _Black;
						_Color(_Left(_Pnode)) = _Black;
						_Rrotate(_Fixnodeparent);
						break;	
						}
					}

			_Color(_Fixnode) = _Black;	
			}

		this->_Alnod.destroy(_Erasednode);	
		this->_Alnod.deallocate(_Erasednode, 1);

		if (0 < _Mysize)
			--_Mysize;

		return (_Where);	
		}

	iterator erase(iterator _First, iterator _Last)
		{	
		if (_First == begin() && _Last == end())
			{	
			clear();
			return (begin());
			}
		else
			{	
			while (_First != _Last)
				erase(_First++);
			return (_First);
			}
		}

	size_type erase(const key_type& _Keyval)
		{	
		_Pairii _Where = equal_range(_Keyval);
		size_type _Num = 0;
		_Distance(_Where.first, _Where.second, _Num);
		erase(_Where.first, _Where.second);
		return (_Num);
		}

	void erase(const key_type *_First, const key_type *_Last)
		{	
		;
		while (_First != _Last)
			erase(*_First++);
		}

	void clear()
		{	
		_Erase(_Root());
		_Root() = _Myhead, _Mysize = 0;
		_Lmost() = _Myhead, _Rmost() = _Myhead;
		}

	iterator find(const key_type& _Keyval)
		{	
		iterator _Where = lower_bound(_Keyval);
		return (_Where == end()
			|| this->comp(_Keyval, _Key(_Where._Mynode()))
					? end() : _Where);
		}

	const_iterator find(const key_type& _Keyval) const
		{	
		const_iterator _Where = lower_bound(_Keyval);
		return (_Where == end()
			|| this->comp(_Keyval, _Key(_Where._Mynode()))
					? end() : _Where);
		}

	size_type count(const key_type& _Keyval) const
		{	
		_Paircc _Ans = equal_range(_Keyval);
		size_type _Num = 0;
		_Distance(_Ans.first, _Ans.second, _Num);
		return (_Num);
		}

	iterator lower_bound(const key_type& _Keyval)
		{	
		return (iterator(_Lbound(_Keyval), this));
		}

	const_iterator lower_bound(const key_type& _Keyval) const
		{	
		return (const_iterator(_Lbound(_Keyval), this));
		}

	iterator upper_bound(const key_type& _Keyval)
		{	
		return (iterator(_Ubound(_Keyval), this));
		}

	const_iterator upper_bound(const key_type& _Keyval) const
		{	
		return (const_iterator(_Ubound(_Keyval), this));
		}

	_Pairii equal_range(const key_type& _Keyval)
		{	
		return (_Pairii(lower_bound(_Keyval), upper_bound(_Keyval)));
		}

	_Paircc equal_range(const key_type& _Keyval) const
		{	
		return (_Paircc(lower_bound(_Keyval), upper_bound(_Keyval)));
		}

	void swap(_Myt& _Right)
		{	
		if (get_allocator() == _Right.get_allocator())
			{	
			std::swap(this->comp, _Right.comp);
			std::swap(_Myhead, _Right._Myhead);
			std::swap(_Mysize, _Right._Mysize);
			}
		else
			{	
			_Myt _Tmp = *this; *this = _Right, _Right = _Tmp;
			}
		}

protected:
	void _Copy(const _Myt& _Right)
		{	
		_Root() = _Copy(_Right._Root(), _Myhead);
		_Mysize = _Right.size();
		if (!_Isnil(_Root()))
			{	
			_Lmost() = _Min(_Root());
			_Rmost() = _Max(_Root());
			}
		else
			_Lmost() = _Myhead, _Rmost() = _Myhead;	
		}

	_Nodeptr _Copy(_Nodeptr _Rootnode, _Nodeptr _Wherenode)
		{	
		_Nodeptr _Newroot = _Myhead;	

		if (!_Isnil(_Rootnode))
			{	
			_Nodeptr _Pnode = _Buynode(_Myhead, _Wherenode, _Myhead,
				_Myval(_Rootnode), _Color(_Rootnode));
			if (_Isnil(_Newroot))
				_Newroot = _Pnode;	

			try {
			_Left(_Pnode) = _Copy(_Left(_Rootnode), _Pnode);
			_Right(_Pnode) = _Copy(_Right(_Rootnode), _Pnode);
			} catch (...) {
			_Erase(_Newroot);	
			throw;
			}
			}

		return (_Newroot);	
		}

	void _Erase(_Nodeptr _Rootnode)
		{	
		for (_Nodeptr _Pnode = _Rootnode; !_Isnil(_Pnode); _Rootnode = _Pnode)
			{	
			_Erase(_Right(_Pnode));
			_Pnode = _Left(_Pnode);
			this->_Alnod.destroy(_Rootnode);	
			this->_Alnod.deallocate(_Rootnode, 1);
			}
		}

	void _Init()
		{	
		_Myhead = _Buynode();
		_Isnil(_Myhead) = true;
		_Root() = _Myhead;
		_Lmost() = _Myhead, _Rmost() = _Myhead;
		_Mysize = 0;
		}

	iterator _Insert(bool _Addleft, _Nodeptr _Wherenode,
		const value_type& _Val)
		{	
		if (max_size() - 1 <= _Mysize)
			throw length_error("map/set<T> too long");
		_Nodeptr _Newnode = _Buynode(_Myhead, _Wherenode, _Myhead,
			_Val, _Red);

		++_Mysize;
		if (_Wherenode == _Myhead)
			{	
			_Root() = _Newnode;
			_Lmost() = _Newnode, _Rmost() = _Newnode;
			}
		else if (_Addleft)
			{	
			_Left(_Wherenode) = _Newnode;
			if (_Wherenode == _Lmost())
				_Lmost() = _Newnode;
			}
		else
			{	
			_Right(_Wherenode) = _Newnode;
			if (_Wherenode == _Rmost())
				_Rmost() = _Newnode;
			}

		for (_Nodeptr _Pnode = _Newnode; _Color(_Parent(_Pnode)) == _Red; )
			if (_Parent(_Pnode) == _Left(_Parent(_Parent(_Pnode))))
				{	
				_Wherenode = _Right(_Parent(_Parent(_Pnode)));
				if (_Color(_Wherenode) == _Red)
					{	
					_Color(_Parent(_Pnode)) = _Black;
					_Color(_Wherenode) = _Black;
					_Color(_Parent(_Parent(_Pnode))) = _Red;
					_Pnode = _Parent(_Parent(_Pnode));
					}
				else
					{	
					if (_Pnode == _Right(_Parent(_Pnode)))
						{	
						_Pnode = _Parent(_Pnode);
						_Lrotate(_Pnode);
						}
					_Color(_Parent(_Pnode)) = _Black;	
					_Color(_Parent(_Parent(_Pnode))) = _Red;
					_Rrotate(_Parent(_Parent(_Pnode)));
					}
				}
			else
				{	
				_Wherenode = _Left(_Parent(_Parent(_Pnode)));
				if (_Color(_Wherenode) == _Red)
					{	
					_Color(_Parent(_Pnode)) = _Black;
					_Color(_Wherenode) = _Black;
					_Color(_Parent(_Parent(_Pnode))) = _Red;
					_Pnode = _Parent(_Parent(_Pnode));
					}
				else
					{	
					if (_Pnode == _Left(_Parent(_Pnode)))
						{	
						_Pnode = _Parent(_Pnode);
						_Rrotate(_Pnode);
						}
					_Color(_Parent(_Pnode)) = _Black;	
					_Color(_Parent(_Parent(_Pnode))) = _Red;
					_Lrotate(_Parent(_Parent(_Pnode)));
					}
				}

		_Color(_Root()) = _Black;	
		return (iterator(_Newnode, this));
		}

	_Nodeptr _Lbound(const key_type& _Keyval) const
		{	
		_Nodeptr _Pnode = _Root();
		_Nodeptr _Wherenode = _Myhead;	

		while (!_Isnil(_Pnode))
			if (this->comp(_Key(_Pnode), _Keyval))
				_Pnode = _Right(_Pnode);	
			else
				{	
				_Wherenode = _Pnode;
				_Pnode = _Left(_Pnode);	
				}

		return (_Wherenode);	
		}

	_Nodeptr& _Lmost() const
		{	
		return (_Left(_Myhead));
		}

	void _Lrotate(_Nodeptr _Wherenode)
		{	
		_Nodeptr _Pnode = _Right(_Wherenode);
		_Right(_Wherenode) = _Left(_Pnode);

		if (!_Isnil(_Left(_Pnode)))
			_Parent(_Left(_Pnode)) = _Wherenode;
		_Parent(_Pnode) = _Parent(_Wherenode);

		if (_Wherenode == _Root())
			_Root() = _Pnode;
		else if (_Wherenode == _Left(_Parent(_Wherenode)))
			_Left(_Parent(_Wherenode)) = _Pnode;
		else
			_Right(_Parent(_Wherenode)) = _Pnode;

		_Left(_Pnode) = _Wherenode;
		_Parent(_Wherenode) = _Pnode;
		}

	static _Nodeptr _Max(_Nodeptr _Pnode)
		{	
		while (!_Isnil(_Right(_Pnode)))
			_Pnode = _Right(_Pnode);
		return (_Pnode);
		}

	static _Nodeptr _Min(_Nodeptr _Pnode)
		{	
		while (!_Isnil(_Left(_Pnode)))
			_Pnode = _Left(_Pnode);
		return (_Pnode);
		}

	_Nodeptr& _Rmost() const
		{	
		return (_Right(_Myhead));
		}

	_Nodeptr& _Root() const
		{	
		return (_Parent(_Myhead));
		}

	void _Rrotate(_Nodeptr _Wherenode)
		{	
		_Nodeptr _Pnode = _Left(_Wherenode);
		_Left(_Wherenode) = _Right(_Pnode);

		if (!_Isnil(_Right(_Pnode)))
			_Parent(_Right(_Pnode)) = _Wherenode;
		_Parent(_Pnode) = _Parent(_Wherenode);

		if (_Wherenode == _Root())
			_Root() = _Pnode;
		else if (_Wherenode == _Right(_Parent(_Wherenode)))
			_Right(_Parent(_Wherenode)) = _Pnode;
		else
			_Left(_Parent(_Wherenode)) = _Pnode;

		_Right(_Pnode) = _Wherenode;
		_Parent(_Wherenode) = _Pnode;
		}

	_Nodeptr _Ubound(const key_type& _Keyval) const
		{	
		_Nodeptr _Pnode = _Root();
		_Nodeptr _Wherenode = _Myhead;	

		while (!_Isnil(_Pnode))
			if (this->comp(_Keyval, _Key(_Pnode)))
				{	
				_Wherenode = _Pnode;
				_Pnode = _Left(_Pnode);	
				}
			else
				_Pnode = _Right(_Pnode);	

		return (_Wherenode);	
		}
	_Nodeptr _Buynode()
		{	
		_Nodeptr _Wherenode = this->_Alnod.allocate(1);
		int _Linkcnt = 0;

		try {
		this->_Alptr.construct(&_Left(_Wherenode), 0);
		++_Linkcnt;
		this->_Alptr.construct(&_Parent(_Wherenode), 0);
		++_Linkcnt;
		this->_Alptr.construct(&_Right(_Wherenode), 0);
		} catch (...) {
		if (1 < _Linkcnt)
			this->_Alptr.destroy(&_Parent(_Wherenode));
		if (0 < _Linkcnt)
			this->_Alptr.destroy(&_Left(_Wherenode));
		this->_Alnod.deallocate(_Wherenode, 1);
		throw;
		}
		_Color(_Wherenode) = _Black;
		_Isnil(_Wherenode) = false;
		return (_Wherenode);
		}

	_Nodeptr _Buynode(_Nodeptr _Larg, _Nodeptr _Parg,
		_Nodeptr _Rarg, const value_type& _Val, char _Carg)
		{	
		_Nodeptr _Wherenode = this->_Alnod.allocate(1);
		try {
		new (_Wherenode) _Node(_Larg, _Parg, _Rarg, _Val, _Carg);
		} catch (...) {
		this->_Alnod.deallocate(_Wherenode, 1);
		throw;
		}
		return (_Wherenode);
		}

	void _Tidy()
		{	
		erase(begin(), end());
		this->_Alptr.destroy(&_Left(_Myhead));
		this->_Alptr.destroy(&_Parent(_Myhead));
		this->_Alptr.destroy(&_Right(_Myhead));
		this->_Alnod.deallocate(_Myhead, 1);
		_Myhead = 0, _Mysize = 0;
		}

	static void _Xran()
		{	
		throw out_of_range("invalid map/set<T> iterator");
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid map/set<T> argument");
		}

	_Nodeptr _Myhead;	
	size_type _Mysize;	
	};

	
template <class _Traits>
	class _Move_operation_category<_Tree<_Traits> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

		
template<class _Traits> inline
	bool operator==(const _Tree<_Traits>& _Left, const _Tree<_Traits>& _Right)
	{	
	return (_Left.size() == _Right.size()
		&& equal(_Left.begin(), _Left.end(), _Right.begin()));
	}

template<class _Traits> inline
	bool operator!=(const _Tree<_Traits>& _Left, const _Tree<_Traits>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Traits> inline
	bool operator<(const _Tree<_Traits>& _Left, const _Tree<_Traits>& _Right)
	{	
	return (lexicographical_compare(_Left.begin(), _Left.end(),
		_Right.begin(), _Right.end()));
	}

template<class _Traits> inline
	bool operator>(const _Tree<_Traits>& _Left, const _Tree<_Traits>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Traits> inline
	bool operator<=(const _Tree<_Traits>& _Left, const _Tree<_Traits>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Traits> inline
	bool operator>=(const _Tree<_Traits>& _Left, const _Tree<_Traits>& _Right)
	{	
	return (!(_Left < _Right));
	}
}
  #pragma warning(default:4127)

#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Kty,	
	class _Ty,	
	class _Pr,	
	class _Alloc,	
	bool _Mfl>	
	class _Tmap_traits
		: public _Container_base
	{	
public:
	typedef _Kty key_type;
	typedef pair<const _Kty, _Ty> value_type;
	typedef _Pr key_compare;
	typedef typename _Alloc::template rebind<value_type>::other
		allocator_type;
	typedef typename allocator_type::template rebind<value_type>::other::pointer _ITptr;
	typedef typename allocator_type::template rebind<value_type>::other::reference _IReft;
	enum
		{	
		_Multi = _Mfl};

	_Tmap_traits()
		: comp()
		{	
		}

	_Tmap_traits(_Pr _Parg)
		: comp(_Parg)
		{	
		}

	class value_compare
		: public binary_function<value_type, value_type, bool>
		{	
		friend class _Tmap_traits<_Kty, _Ty, _Pr, _Alloc, _Mfl>;

	public:
		bool operator()(const value_type& _Left,
			const value_type& _Right) const
			{	
			return (comp(_Left.first, _Right.first));
			}

		value_compare(key_compare _Pred)
			: comp(_Pred)
			{	
			}

	protected:
		key_compare comp;	
		};

	static const _Kty& _Kfn(const value_type& _Val)
		{	
		return (_Val.first);
		}

	_Pr comp;	
	};

		
template<class _Kty,
	class _Ty,
	class _Pr = less<_Kty>,
	class _Alloc = allocator<pair<const _Kty, _Ty> > >
	class map
		: public _Tree<_Tmap_traits<_Kty, _Ty, _Pr, _Alloc, false> >
	{	
public:
	typedef map<_Kty, _Ty, _Pr, _Alloc> _Myt;
	typedef _Tree<_Tmap_traits<_Kty, _Ty, _Pr, _Alloc, false> > _Mybase;
	typedef _Kty key_type;
	typedef _Ty mapped_type;
	typedef _Ty referent_type;	
	typedef _Pr key_compare;
	typedef typename _Mybase::value_compare value_compare;
	typedef typename _Mybase::allocator_type allocator_type;
	typedef typename _Mybase::size_type size_type;
	typedef typename _Mybase::difference_type difference_type;
	typedef typename _Mybase::pointer pointer;
	typedef typename _Mybase::const_pointer const_pointer;
	typedef typename _Mybase::reference reference;
	typedef typename _Mybase::const_reference const_reference;
	typedef typename _Mybase::iterator iterator;
	typedef typename _Mybase::const_iterator const_iterator;
	typedef typename _Mybase::reverse_iterator reverse_iterator;
	typedef typename _Mybase::const_reverse_iterator
		const_reverse_iterator;
	typedef typename _Mybase::value_type value_type;

	map()
		: _Mybase(key_compare(), allocator_type())
		{	
		}

	explicit map(const key_compare& _Pred)
		: _Mybase(_Pred, allocator_type())
		{	
		}

	map(const key_compare& _Pred, const allocator_type& _Al)
		: _Mybase(_Pred, _Al)
		{	
		}

	template<class _Iter>
		map(_Iter _First, _Iter _Last)
		: _Mybase(key_compare(), allocator_type())
		{	
		;
		for (; _First != _Last; ++_First)
			this->insert(*_First);
		}

	template<class _Iter>
		map(_Iter _First, _Iter _Last,
			const key_compare& _Pred)
		: _Mybase(_Pred, allocator_type())
		{	
		;
		for (; _First != _Last; ++_First)
			this->insert(*_First);
		}

	template<class _Iter>
		map(_Iter _First, _Iter _Last,
			const key_compare& _Pred, const allocator_type& _Al)
		: _Mybase(_Pred, _Al)
		{	
		;
		for (; _First != _Last; ++_First)
			this->insert(*_First);
		}
	mapped_type& operator[](const key_type& _Keyval)
		{	
		iterator _Where = this->lower_bound(_Keyval);
		if (_Where == this->end()
			|| this->comp(_Keyval, this->_Key(_Where._Mynode())))
			_Where = this->insert(_Where,
				value_type(_Keyval, mapped_type()));
		return ((*_Where).second);
		}
	};

	
template<class _Kty, class _Ty, class _Pr, class _Alloc>
	class _Move_operation_category<map<_Kty, _Ty, _Pr, _Alloc> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

template<class _Kty,
	class _Ty,
	class _Pr,
	class _Alloc> inline
	void swap(map<_Kty, _Ty, _Pr, _Alloc>& _Left,
		map<_Kty, _Ty, _Pr, _Alloc>& _Right)
	{	
	_Left.swap(_Right);
	}

		
template<class _Kty,
	class _Ty,
	class _Pr = less<_Kty>,
	class _Alloc = allocator<pair<const _Kty, _Ty> > >
	class multimap
		: public _Tree<_Tmap_traits<_Kty, _Ty, _Pr, _Alloc, true> >
	{	
public:
	typedef multimap<_Kty, _Ty, _Pr, _Alloc> _Myt;
	typedef _Tree<_Tmap_traits<_Kty, _Ty, _Pr, _Alloc, true> > _Mybase;
	typedef _Kty key_type;
	typedef _Ty mapped_type;
	typedef _Ty referent_type;	
	typedef _Pr key_compare;
	typedef typename _Mybase::value_compare value_compare;
	typedef typename _Mybase::allocator_type allocator_type;
	typedef typename _Mybase::size_type size_type;
	typedef typename _Mybase::difference_type difference_type;
	typedef typename _Mybase::pointer pointer;
	typedef typename _Mybase::const_pointer const_pointer;
	typedef typename _Mybase::reference reference;
	typedef typename _Mybase::const_reference const_reference;
	typedef typename _Mybase::iterator iterator;
	typedef typename _Mybase::const_iterator const_iterator;
	typedef typename _Mybase::reverse_iterator reverse_iterator;
	typedef typename _Mybase::const_reverse_iterator
		const_reverse_iterator;
	typedef typename _Mybase::value_type value_type;

	multimap()
		: _Mybase(key_compare(), allocator_type())
		{	
		}

	explicit multimap(const key_compare& _Pred)
		: _Mybase(_Pred, allocator_type())
		{	
		}
	multimap(const key_compare& _Pred, const allocator_type& _Al)
		: _Mybase(_Pred, _Al)
		{	
		}

	template<class _Iter>
		multimap(_Iter _First, _Iter _Last)
		: _Mybase(key_compare(), allocator_type())
		{	
		;
		for (; _First != _Last; ++_First)
			insert(*_First);
		}

	template<class _Iter>
		multimap(_Iter _First, _Iter _Last,
			const key_compare& _Pred)
		: _Mybase(_Pred, allocator_type())
		{	
		;
		for (; _First != _Last; ++_First)
			insert(*_First);
		}

	template<class _Iter>
		multimap(_Iter _First, _Iter _Last,
			const key_compare& _Pred, const allocator_type& _Al)
		: _Mybase(_Pred, _Al)
		{	
		;
		for (; _First != _Last; ++_First)
			insert(*_First);
		}

	iterator insert(const value_type& _Val)
		{	
		return (_Mybase::insert(_Val).first);
		}

	iterator insert(iterator _Where, const value_type& _Val)
		{	
		return (_Mybase::insert(_Where, _Val));
		}
	template<class _Iter>
		void insert(_Iter _First, _Iter _Last)
		{	
		for (; _First != _Last; ++_First)
			insert(*_First);
		}
	};

	
template<class _Kty, class _Ty, class _Pr, class _Alloc>
	class _Move_operation_category<multimap<_Kty, _Ty, _Pr, _Alloc> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

template<class _Kty,
	class _Ty,
	class _Pr,
	class _Alloc> inline
	void swap(multimap<_Kty, _Ty, _Pr, _Alloc>& _Left,
		multimap<_Kty, _Ty, _Pr, _Alloc>& _Right)
	{	
	_Left.swap(_Right);
	}

}
#pragma warning(pop)
#pragma pack(pop)
#pragma once

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {
	
template<class _Ty,
	class _Ax = allocator<_Ty> >
	class deque;

		
template<class _Ty, class _Alloc, bool _Secure_validation>
	class _Deque_const_iterator
		: public _Ranit<_Ty, typename _Alloc::difference_type,
			typename _Alloc::const_pointer, typename _Alloc::const_reference>
	{	
public:
	typedef _Deque_const_iterator<_Ty, _Alloc, _Secure_validation> _Myt;
	typedef deque<_Ty, _Alloc> _Mydeque;

	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::const_pointer pointer;
	typedef typename _Alloc::const_reference reference;

	typedef typename _Alloc::size_type size_type;
	typedef typename _Secure_validation_helper<_Secure_validation>::_Checked_iterator_category _Checked_iterator_category;
	typedef typename _If<_Secure_validation,
		_Deque_const_iterator<_Ty, _Alloc, false>,
		_Unchanged_checked_iterator_base_type_tag>::_Result _Checked_iterator_base_type;

	friend _Deque_const_iterator<_Ty, _Alloc, false>;
	friend _Deque_const_iterator<_Ty, _Alloc, true>;

	_Deque_const_iterator<_Ty, _Alloc, false> _Checked_iterator_base() const
	{
		_Deque_const_iterator<_Ty, _Alloc, false> _Base(this->_Myoff, this->_Mycont);
		return _Base;
	}

	void _Checked_iterator_assign_from_base(_Deque_const_iterator<_Ty, _Alloc, false> _Base)
	{
		{ if (!(this->_Mycont == _Base._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
		this->_Myoff = _Base._Myoff;
	}
		_Deque_const_iterator()
			{	
			this->_Mycont = 0;
			_Myoff = 0;
			}

		_Deque_const_iterator(const _Myt& _Right)
			: _Mycont(_Right._Mycont), _Myoff(_Right._Myoff)
			{	
			}

		_Deque_const_iterator(size_type _Off, const _Container_base *_Pdeque)
			{	
			{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(_Pdeque != 0 && ((_Mydeque *)_Pdeque)->_Myoff <= _Off && _Off <= (((_Mydeque *)_Pdeque)->_Myoff + ((_Mydeque *)_Pdeque)->_Mysize))) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
				
			this->_Mycont = (const _Mydeque *)_Pdeque;
			_Myoff = _Off;
			}

		reference operator*() const
			{	
			size_type _Block = _Myoff / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
			size_type _Off = _Myoff & ((sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) - 1);	
			{ if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			{ if (!(_Myoff < ((_Mydeque *)(this->_Mycont))->_Myoff + ((_Mydeque *)(this->_Mycont))->_Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; };
			if (this->_Mycont->_Mapsize <= _Block)
				_Block -= this->_Mycont->_Mapsize;
			return ((this->_Mycont->_Map)[_Block][_Off]);
			}
	pointer operator->() const
		{	
		return (&**this);
		}

	_Myt& operator++()
		{	
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(_Myoff < ((_Mydeque *)(this->_Mycont))->_Myoff + ((_Mydeque *)(this->_Mycont))->_Mysize)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		++_Myoff;
		return (*this);
		}

	_Myt operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt& operator--()
		{	
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(_Myoff > ((_Mydeque *)(this->_Mycont))->_Myoff)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		--_Myoff;
		return (*this);
		}

	_Myt operator--(int)
		{	
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt& operator+=(difference_type _Off)
		{	
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(this->_Mycont != 0)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(_Myoff + _Off <= ((_Mydeque *)(this->_Mycont))->_Myoff + ((_Mydeque *)(this->_Mycont))->_Mysize && _Myoff + _Off >= ((_Mydeque *)(this->_Mycont))->_Myoff)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		_Myoff += _Off;
		return (*this);
		}

	_Myt operator+(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt& operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Myt operator-(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type operator-(const _Myt& _Right) const
		{	

		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		return (_Right._Myoff <= _Myoff ? _Myoff - _Right._Myoff
			: -(difference_type)(_Right._Myoff - _Myoff));
		}

	reference operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}

	bool operator==(const _Myt& _Right) const
		{	
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		return (_Myoff == _Right._Myoff);
		}
			
	bool operator!=(const _Myt& _Right) const
		{	
		return (!(*this == _Right));
		}

	bool operator<(const _Myt& _Right) const
		{	
		{ __pragma(warning(push)); __pragma(warning(disable: 4127)); if (_Secure_validation) { { if (!(this->_Mycont != 0 && this->_Mycont == _Right._Mycont)) { ((void)0); ::_invalid_parameter_noinfo(); } ; } } __pragma(warning(pop)); };
		return (_Myoff < _Right._Myoff);
		}
			
	bool operator>(const _Myt& _Right) const
		{	
		return (_Right < *this);
		}

	bool operator<=(const _Myt& _Right) const
		{	
		return (!(_Right < *this));
		}

	bool operator>=(const _Myt& _Right) const
		{	
		return (!(*this < _Right));
		}

	static void _Xlen()
		{	
		throw length_error("deque<T> too long");
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid deque <T> argument");
		}

	static void _Xran()
		{	
		throw out_of_range("invalid deque <T> subscript");
		}

protected:
	const _Mydeque *_Mycont;	
	size_type _Myoff;	
	};

template<class _Ty, class _Alloc, bool _Secure_validation>
	inline
	_Deque_const_iterator<_Ty, _Alloc, _Secure_validation> operator+(
		typename _Deque_const_iterator<_Ty, _Alloc, _Secure_validation>::difference_type _Off,
		_Deque_const_iterator<_Ty, _Alloc, _Secure_validation> _Next)
	{	
	return (_Next += _Off);
	}

		
template<class _Ty, class _Alloc, bool _Secure_validation>
	class _Deque_iterator
		: public _Deque_const_iterator<_Ty, _Alloc, _Secure_validation>
		{	
public:
	typedef _Deque_iterator<_Ty, _Alloc, _Secure_validation> _Myt;
	typedef _Deque_const_iterator<_Ty, _Alloc, _Secure_validation> _Mybase;
	typedef deque<_Ty, _Alloc> _Mydeque;

	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::pointer pointer;
	typedef typename _Alloc::reference reference;

	typedef typename _Alloc::size_type size_type;
	typedef typename _If<_Secure_validation,
		_Deque_iterator<_Ty, _Alloc, false>,
		_Unchanged_checked_iterator_base_type_tag>::_Result _Checked_iterator_base_type;

	friend _Deque_iterator<_Ty, _Alloc, false>;
	friend _Deque_iterator<_Ty, _Alloc, true>;

	_Deque_iterator<_Ty, _Alloc, false> _Checked_iterator_base() const
	{
		_Deque_iterator<_Ty, _Alloc, false> _Base(this->_Myoff, this->_Mycont);
		return _Base;
	}

	void _Checked_iterator_assign_from_base(_Deque_iterator<_Ty, _Alloc, false> _Base)
	{
		this->_Myoff = _Base._Myoff;
		this->_Mycont = _Base._Mycont;
	}
	_Deque_iterator()
		{	
		}

	_Deque_iterator(size_type _Off, const _Container_base *_Pdeque)
		: _Mybase(_Off, _Pdeque)
		{	
		}

	reference operator*() const
		{	
		return ((reference)**(_Mybase *)this);
		}

	pointer operator->() const
		{	
		return (&**this);
		}

	_Myt& operator++()
		{	
		++*(_Mybase *)this;
		return (*this);
		}

	_Myt operator++(int)
		{	
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt& operator--()
		{	
		--*(_Mybase *)this;
		return (*this);
		}

	_Myt operator--(int)
		{	
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt& operator+=(difference_type _Off)
		{	
		*(_Mybase *)this += _Off;
		return (*this);
		}

	_Myt operator+(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt& operator-=(difference_type _Off)
		{	
		return (*this += -_Off);
		}

	_Myt operator-(difference_type _Off) const
		{	
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type operator-(const _Mybase& _Right) const
		{	
		return (*(_Mybase *)this - _Right);
		}

	reference operator[](difference_type _Off) const
		{	
		return (*(*this + _Off));
		}
	};

template<class _Ty, class _Alloc, bool _Secure_validation>
	inline
	_Deque_iterator<_Ty, _Alloc, _Secure_validation> operator+(
		typename _Deque_iterator<_Ty, _Alloc, _Secure_validation>::difference_type _Off,
		_Deque_iterator<_Ty, _Alloc, _Secure_validation> _Next)
	{	
	return (_Next += _Off);
	}

		
template<class _Ty,
	class _Alloc>
	class _Deque_map
		: public _Container_base
	{	
protected:
	_Deque_map(_Alloc _Al)
		: _Almap(_Al)
		{	
		}

	typedef typename _Alloc::template rebind<_Ty>::other::pointer _Tptr;
	typedef typename _Alloc::template rebind<_Tptr>::other _Talmap;

	_Talmap _Almap;	
	};

		
template<class _Ty,
	class _Alloc>
	class _Deque_val
		: public _Deque_map<_Ty, _Alloc>
	{	
protected:
	_Deque_val(_Alloc _Al = _Alloc())
		: _Deque_map<_Ty, _Alloc>(_Al), _Alval(_Al)
		{	
		}

	typedef _Deque_map<_Ty, _Alloc> _Mybase;
	typedef typename _Alloc::template rebind<_Ty>::other _Alty;

	_Alty _Alval;	
	};

		
template<class _Ty,
	class _Ax>
	class deque
		: public _Deque_val<_Ty, _Ax>
	{	
public:

	
	static const int _EEM_DS = (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
	enum { _EEN_DS = (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) };

	typedef deque<_Ty, _Ax> _Myt;
	typedef _Deque_val<_Ty, _Ax> _Mybase;
	typedef typename _Mybase::_Alty _Alloc;
	typedef _Alloc allocator_type;
	typedef typename _Mybase::_Talmap _Talmap;
	typedef typename _Alloc::size_type size_type;
	typedef typename _Alloc::difference_type _Dift;
	typedef _Dift difference_type;
	typedef typename _Alloc::pointer _Tptr;
	typedef typename _Alloc::const_pointer _Ctptr;
	typedef _Tptr pointer;
	typedef _Ctptr const_pointer;
	typedef typename _Alloc::template rebind<_Tptr>::other::pointer _Mapptr;
	typedef typename _Alloc::reference _Reft;
	typedef _Reft reference;
	typedef typename _Alloc::const_reference const_reference;
	typedef typename _Alloc::value_type value_type;

	typedef _Deque_iterator<_Ty, _Alloc, true> iterator;
	typedef _Deque_const_iterator<_Ty, _Alloc, true> const_iterator;
	friend class _Deque_const_iterator<_Ty, _Alloc, false>;

	friend class _Deque_const_iterator<_Ty, _Alloc, true>;
	typedef std::reverse_iterator<iterator> reverse_iterator;
	typedef std::reverse_iterator<const_iterator> const_reverse_iterator;

	deque()
		: _Mybase(), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		}

	explicit deque(const _Alloc& _Al)
		: _Mybase(_Al), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		}

	explicit deque(size_type _Count)
		: _Mybase(), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		_Construct_n(_Count, _Ty());
		}

	deque(size_type _Count, const _Ty& _Val)
		: _Mybase(), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		_Construct_n(_Count, _Val);
		}

	deque(size_type _Count, const _Ty& _Val, const _Alloc& _Al)
		: _Mybase(_Al), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		_Construct_n(_Count, _Val);
		}

	deque(const _Myt& _Right)
		: _Mybase(_Right._Alval), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		try {
		insert(begin(), _Right.begin(), _Right.end());
		} catch (...) {
		_Tidy();
		throw;
		}
		}

	template<class _It>
		deque(_It _First, _It _Last)
		: _Mybase(), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		deque(_It _First, _It _Last, const _Alloc& _Al)
		: _Mybase(_Al), _Map(0),
			_Mapsize(0), _Myoff(0), _Mysize(0)
		{	
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		void _Construct(_It _Count, _It _Val, _Int_iterator_tag)
		{	
		_Construct_n((size_type)_Count, (_Ty)_Val);
		}

	template<class _It>
		void _Construct(_It _First, _It _Last, input_iterator_tag)
		{	
		try {
		insert(begin(), _First, _Last);
		} catch (...) {
		_Tidy();
		throw;
		}
		}

	void _Construct_n(size_type _Count, const _Ty& _Val)
		{	
		try {
		_Insert_n(begin(), _Count, _Val);
		} catch (...) {
		_Tidy();
		throw;
		}
		}

	~deque()
		{	
		_Tidy();
		}

	_Myt& operator=(const _Myt& _Right)
		{	
		if (this == &_Right)
			;
		else if (_Right._Mysize == 0)
			clear();
		else if (_Right._Mysize <= _Mysize)
			{	
			iterator _Mid = std::copy(_Right.begin(), _Right.end(), begin());
			erase(_Mid, end());
			}
		else
			{	
			const_iterator _Mid = _Right.begin() + _Mysize;
			std::copy(_Right.begin(), _Mid, begin());
			insert(end(), _Mid, _Right.end());
			}
		return (*this);
		}

	iterator begin()
		{	
		return (iterator(_Myoff, this));
		}

	const_iterator begin() const
		{	
		return (const_iterator(_Myoff, this));
		}

	iterator end()
		{	
		return (iterator(_Myoff + _Mysize, this));
		}

	const_iterator end() const
		{	
		return (const_iterator(_Myoff + _Mysize, this));
		}

	reverse_iterator rbegin()
		{	
		return (reverse_iterator(end()));
		}

	const_reverse_iterator rbegin() const
		{	
		return (const_reverse_iterator(end()));
		}

	reverse_iterator rend()
		{	
		return (reverse_iterator(begin()));
		}

	const_reverse_iterator rend() const
		{	
		return (const_reverse_iterator(begin()));
		}

	void resize(size_type _Newsize)
		{	
		resize(_Newsize, _Ty());
		}

	void resize(size_type _Newsize, _Ty _Val)
		{	
		if (_Mysize < _Newsize)
			_Insert_n(end(), _Newsize - _Mysize, _Val);
		else if (_Newsize < _Mysize)
			erase(begin() + _Newsize, end());
		}

	size_type size() const
		{	
		return (_Mysize);
		}

	size_type max_size() const
		{	
		return (this->_Alval.max_size());
		}

	bool empty() const
		{	
		return (_Mysize == 0);
		}

	allocator_type get_allocator() const
		{	
		return (this->_Alval);
		}

	const_reference at(size_type _Pos) const
		{	
		if (_Mysize <= _Pos)
			_Xran();
		return (*(begin() + _Pos));
		}

	reference at(size_type _Pos)
		{	
		if (_Mysize <= _Pos)
			_Xran();
		return (*(begin() + _Pos));
		}

	const_reference operator[](size_type _Pos) const
		{	
		return (*(begin() + _Pos));
		}

	reference operator[](size_type _Pos)
		{	
		return (*(begin() + _Pos));
		}

	reference front()
		{	
		return (*begin());
		}

	const_reference front() const
		{	
		return (*begin());
		}

	reference back()
		{	
		return (*(end() - 1));
		}

	const_reference back() const
		{	
		return (*(end() - 1));
		}

	void push_front(const _Ty& _Val)
		{	
		if (_Myoff % (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) == 0
			&& _Mapsize <= (_Mysize + (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1)) / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1))
			_Growmap(1);
		size_type _Newoff = _Myoff != 0 ? _Myoff
			: _Mapsize * (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
		size_type _Block = --_Newoff / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
		if (_Map[_Block] == 0)
			_Map[_Block] = this->_Alval.allocate((sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1));
		this->_Alval.construct(_Map[_Block] + _Newoff % (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1), _Val);
		_Myoff = _Newoff;
		++_Mysize;
		}

	void pop_front()
		{	
		if (!empty())
			{	
			size_type _Block = _Myoff / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
			this->_Alval.destroy(_Map[_Block] + _Myoff % (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1));
			if (_Mapsize * (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) <= ++_Myoff)
				_Myoff = 0;
			if (--_Mysize == 0)
				_Myoff = 0;
			}
			}

	void push_back(const _Ty& _Val)
		{	
		if ((_Myoff + _Mysize) % (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) == 0
			&& _Mapsize <= (_Mysize + (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1)) / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1))
			_Growmap(1);
		size_type _Newoff = _Myoff + _Mysize;
		size_type _Block = _Newoff / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
		if (_Mapsize <= _Block)
			_Block -= _Mapsize;
		if (_Map[_Block] == 0)
			_Map[_Block] = this->_Alval.allocate((sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1));
		this->_Alval.construct(_Map[_Block] + _Newoff % (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1), _Val);
		++_Mysize;
		}

	void pop_back()
		{	
		if (!empty())
			{	
			size_type _Newoff = _Mysize + _Myoff - 1;
			size_type _Block = _Newoff / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
			if (_Mapsize <= _Block)
				_Block -= _Mapsize;
			this->_Alval.destroy(_Map[_Block] + _Newoff % (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1));
			if (--_Mysize == 0)
				_Myoff = 0;
			}
			}

	template<class _It>
		void assign(_It _First, _It _Last)
		{	
		_Assign(_First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		void _Assign(_It _Count, _It _Val, _Int_iterator_tag)
		{	
		_Assign_n((size_type)_Count, (_Ty)_Val);
		}

	template<class _It>
		void _Assign(_It _First, _It _Last, input_iterator_tag)
		{	
		erase(begin(), end());
		insert(begin(), _First, _Last);
		}

	void assign(size_type _Count, const _Ty& _Val)
		{	
		_Assign_n(_Count, _Val);
		}

	iterator insert(iterator _Where, const _Ty& _Val)
		{	
		if (_Where == begin())
			{	
			push_front(_Val);
			return (begin());
			}
		else if (_Where == end())
			{	
			push_back(_Val);
			return (end() - 1);
			}
		else
			{	
			iterator _Mid;
			size_type _Off = _Where - begin();
			_Ty _Tmp = _Val;	
			if (_Off < _Mysize / 2)
				{	
				push_front(front());
				_Mid = begin() + _Off;
				std::copy(begin() + 2, _Mid + 1, begin() + 1);
				}
			else
				{	
				push_back(back());
				_Mid = begin() + _Off;
				copy_backward(_Mid, end() - 2, end() - 1);
				}

			*_Mid = _Tmp;	
			return (_Mid);
			}
		}

	void insert(iterator _Where, size_type _Count, const _Ty& _Val)
		{	
		_Insert_n(_Where, _Count, _Val);
		}

	template<class _It>
		void insert(iterator _Where, _It _First, _It _Last)
		{	
		_Insert(_Where, _First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		void _Insert(iterator _Where, _It _Count, _It _Val,
			_Int_iterator_tag)
		{	
		_Insert_n(_Where, (size_type)_Count, (_Ty)_Val);
		}

	template<class _It>
		void _Insert(iterator _Where, _It _First, _It _Last,
			input_iterator_tag)
		{	
		size_type _Off = _Where - begin();
		for (; _First != _Last; ++_First, ++_Off)
			insert(begin() + _Off, *_First);
		}

	template<class _It>
		void _Insert(iterator _Where,
			_It _First, _It _Last, bidirectional_iterator_tag)
		{	
		size_type _Off = _Where - begin();
		size_type _Rem = _Mysize - _Off;
		size_type _Oldsize = _Mysize;
		size_type _Count = 0;
		_Distance(_First, _Last, _Count);
		size_type _Num;

		if (_Off < _Rem)
			{	
			try {
			if (_Off < _Count)
				{	
				_It _Mid = _First;
				advance(_Mid, _Count - _Off);

				for (_It _Next = _Mid; _First != _Next; )
					push_front(*--_Next);	
				for (_Num = _Off; 0 < _Num; --_Num)
					push_front(begin()[_Count - 1]);	
				std::copy(_Mid, _Last,
					begin() + _Count);	
				}
			else
				{	
				for (_Num = _Count; 0 < _Num; --_Num)
					push_front(begin()[_Count - 1]);	

				iterator _Mid = begin() + _Count;
				std::copy(_Mid + _Count, _Mid + _Off,
					_Mid);	
				std::copy(_First, _Last,
					begin() + _Off);	
				}
			} catch (...) {
			for (; _Oldsize < _Mysize; )
				pop_front();	
			throw;
			}
			}
		else
			{	
			try {
			if (_Rem < _Count)
				{	
				_It _Mid = _First;
				advance(_Mid, _Rem);

				for (_It _Next = _Mid; _Next != _Last; ++_Next)
					push_back(*_Next);	
				for (_Num = 0; _Num < _Rem; ++_Num)
					push_back(begin()[_Off + _Num]);	

				std::copy(_First, _Mid,
					begin() + _Off);	
				}
			else
				{	
				for (_Num = 0; _Num < _Count; ++_Num)
					push_back(begin()[_Off + _Rem
						- _Count + _Num]);	

				iterator _Mid = begin() + _Off;
				copy_backward(_Mid, _Mid + _Rem - _Count,
					_Mid + _Rem);	
				std::copy(_First, _Last, _Mid);	
				}
			} catch (...) {
			for (; _Oldsize < _Mysize; )
				pop_back();	
			throw;
			}
			}
		}

	iterator erase(iterator _Where)
		{	
		return (erase(_Where, _Where + 1));
		}

	iterator erase(iterator _First, iterator _Last)
		{	

		size_type _Off = _First - begin();
		size_type _Count = _Last - _First;
		if (_Off < (size_type)(end() - _Last))
			{	
			copy_backward(begin(), _First, _Last);	
			for (; 0 < _Count; --_Count)
				pop_front();	
			}
		else
			{	
			std::copy(_Last, end(), _First);	
			for (; 0 < _Count; --_Count)
				pop_back();	
			}
		return (begin() + _Off);
		}

	void clear()
		{	
		_Tidy();
		}

	void swap(_Myt& _Right)
		{	
		if (this->_Alval == _Right._Alval)
			{	
			std::swap(_Map, _Right._Map);
			std::swap(_Mapsize, _Right._Mapsize);
			std::swap(_Myoff, _Right._Myoff);
			std::swap(_Mysize, _Right._Mysize);
			}
		else
			{	
			_Myt _Ts = *this; *this = _Right, _Right = _Ts;
			}
		}

protected:
	void _Assign_n(size_type _Count, const _Ty& _Val)
		{	
		_Ty _Tmp = _Val;	
		erase(begin(), end());
		_Insert_n(begin(), _Count, _Tmp);
		}

	void _Insert_n(iterator _Where,
		size_type _Count, const _Ty& _Val)
		{	
		iterator _Mid;
		size_type _Num;
		size_type _Off = _Where - begin();
		size_type _Rem = _Mysize - _Off;
		size_type _Oldsize = _Mysize;
		if (_Off < _Rem)
			{	
			try {
			if (_Off < _Count)
				{	
				for (_Num = _Count - _Off; 0 < _Num; --_Num)
					push_front(_Val);	
				for (_Num = _Off; 0 < _Num; --_Num)
					push_front(begin()[_Count - 1]);	

				_Mid = begin() + _Count;
				fill(_Mid, _Mid + _Off, _Val);	
				}
			else
				{	
				for (_Num = _Count; 0 < _Num; --_Num)
					push_front(begin()[_Count - 1]);	

				_Mid = begin() + _Count;
				_Ty _Tmp = _Val;	
				std::copy(_Mid + _Count, _Mid + _Off,
					_Mid);	
				fill(begin() + _Off, _Mid + _Off, _Tmp);	
				}
			} catch (...) {
			for (; _Oldsize < _Mysize; )
				pop_front();	
			throw;
			}
			}
		else
			{		
			try {
			if (_Rem < _Count)
				{	
				for (_Num = _Count - _Rem; 0 < _Num; --_Num)
					push_back(_Val);	
				for (_Num = 0; _Num < _Rem; ++_Num)
					push_back(begin()[_Off + _Num]);	

				_Mid = begin() + _Off;
				fill(_Mid, _Mid + _Rem, _Val);	
				}
			else
				{	
				for (_Num = 0; _Num < _Count; ++_Num)
					push_back(begin()[_Off + _Rem
						- _Count + _Num]);	

				_Mid = begin() + _Off;
				_Ty _Tmp = _Val;	
				copy_backward(_Mid, _Mid + _Rem - _Count,
					_Mid + _Rem);	
				fill(_Mid, _Mid + _Count, _Tmp);	
				}
			} catch (...) {
			for (; _Oldsize < _Mysize; )
				pop_back();	
			throw;
			}
			}
		}

	static void _Xlen()
		{	
		throw length_error("deque<T> too long");
		}

	static void _Xinvarg()
		{	
		throw invalid_argument("invalid deque <T> argument");
		}

	static void _Xran()
		{	
		throw out_of_range("invalid deque <T> subscript");
		}

	void _Growmap(size_type _Count)
		{	
		if (max_size() / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) - _Mapsize < _Count)
			_Xlen();	

		size_type _Inc = _Mapsize / 2;	
		if (_Inc < 8)
			_Inc = 8;
		if (_Count < _Inc && _Mapsize <= max_size() / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1) - _Inc)
			_Count = _Inc;
		size_type _Myboff = _Myoff / (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1);
		_Mapptr _Newmap = this->_Almap.allocate(_Mapsize + _Count);
		_Mapptr _Myptr = _Newmap + _Myboff;

		_Myptr = ::stdext:: unchecked_uninitialized_copy(_Map + _Myboff,
			_Map + _Mapsize, _Myptr, this->_Almap);	
		if (_Myboff <= _Count)
			{	
			_Myptr = ::stdext:: unchecked_uninitialized_copy(_Map,
				_Map + _Myboff, _Myptr, this->_Almap);	
			::stdext:: unchecked_uninitialized_fill_n(_Myptr, _Count - _Myboff,
				(_Tptr)0, this->_Almap);	
			::stdext:: unchecked_uninitialized_fill_n(_Newmap, _Myboff,
				(_Tptr)0, this->_Almap);	
			}
		else
			{	
			::stdext:: unchecked_uninitialized_copy(_Map,
				_Map + _Count, _Myptr, this->_Almap);	
			_Myptr = ::stdext:: unchecked_uninitialized_copy(_Map + _Count,
				_Map + _Myboff, _Newmap, this->_Almap);	
			::stdext:: unchecked_uninitialized_fill_n(_Myptr, _Count,
				(_Tptr)0, this->_Almap);	
			}

		_Destroy_range(_Map + _Myboff, _Map + _Mapsize, this->_Almap);
		if (_Map)
			this->_Almap.deallocate(_Map, _Mapsize);	

		_Map = _Newmap;	
		_Mapsize += _Count;
		}

	void _Tidy()
		{	
		while (!empty())
			pop_back();
		for (size_type _Count = _Mapsize; 0 < _Count; )
			{	
			if (*(_Map + --_Count) != 0)
				this->_Alval.deallocate(*(_Map + _Count), (sizeof (_Ty) <= 1 ? 16 : sizeof (_Ty) <= 2 ? 8 : sizeof (_Ty) <= 4 ? 4 : sizeof (_Ty) <= 8 ? 2 : 1));
			this->_Almap.destroy(_Map + _Count);
			}

		if (_Map)
			this->_Almap.deallocate(_Map, _Mapsize);	
		_Mapsize = 0;
		_Map = 0;
		}

	_Mapptr _Map;	
	size_type _Mapsize;	
	size_type _Myoff;	
	size_type _Mysize;	
	};

	
template <class _Ty, class _Ax>
	class _Move_operation_category<deque<_Ty, _Ax> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

	
template<class _Ty,
	class _Alloc> inline
	void swap(deque<_Ty, _Alloc>& _Left, deque<_Ty, _Alloc>& _Right)
	{	
	_Left.swap(_Right);
	}

template<class _Ty,
	class _Alloc> inline
	bool operator==(const deque<_Ty, _Alloc>& _Left,
		const deque<_Ty, _Alloc>& _Right)
	{	
	return (_Left.size() == _Right.size()
		&& equal(_Left.begin(), _Left.end(), _Right.begin()));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator!=(const deque<_Ty, _Alloc>& _Left,
		const deque<_Ty, _Alloc>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator<(const deque<_Ty, _Alloc>& _Left,
		const deque<_Ty, _Alloc>& _Right)
	{	
	return (lexicographical_compare(_Left.begin(), _Left.end(),
		_Right.begin(), _Right.end()));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator<=(const deque<_Ty, _Alloc>& _Left,
		const deque<_Ty, _Alloc>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Ty,
	class _Alloc> inline
	bool operator>(const deque<_Ty, _Alloc>& _Left,
		const deque<_Ty, _Alloc>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Ty,
	class _Alloc> inline
	bool operator>=(const deque<_Ty, _Alloc>& _Left,
		const deque<_Ty, _Alloc>& _Right)
	{	
	return (!(_Left < _Right));
	}
}
#pragma warning(pop)
#pragma pack(pop)
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

		
template<class _Ty,
	class _Container = deque<_Ty> >
	class stack
	{	
public:
	typedef _Container container_type;
	typedef typename _Container::value_type value_type;
	typedef typename _Container::size_type size_type;
	typedef typename _Container::reference reference;
	typedef typename _Container::const_reference const_reference;

	stack()
		: c()
		{	
		}

	explicit stack(const _Container& _Cont)
		: c(_Cont)
		{	
		}

	bool empty() const
		{	
		return (c.empty());
		}

	size_type size() const
		{	
		return (c.size());
		}

	reference top()
		{	
		return (c.back());
		}

	const_reference top() const
		{	
		return (c.back());
		}

	void push(const value_type& _Val)
		{	
		c.push_back(_Val);
		}

	void pop()
		{	
		c.pop_back();
		}
	_Container c;	
	};

		
template<class _Ty,
	class _Container> inline
	bool operator==(const stack<_Ty, _Container>& _Left,
		const stack<_Ty, _Container>& _Right)
	{	
	return (_Left.c == _Right.c);
	}

template<class _Ty,
	class _Container> inline
	bool operator!=(const stack<_Ty, _Container>& _Left,
		const stack<_Ty, _Container>& _Right)
	{	
	return (!(_Left == _Right));
	}

template<class _Ty,
	class _Container> inline
	bool operator<(const stack<_Ty, _Container>& _Left,
		const stack<_Ty, _Container>& _Right)
	{	
	return (_Left.c < _Right.c);
	}

template<class _Ty,
	class _Container> inline
	bool operator>(const stack<_Ty, _Container>& _Left,
		const stack<_Ty, _Container>& _Right)
	{	
	return (_Right < _Left);
	}

template<class _Ty,
	class _Container> inline
	bool operator<=(const stack<_Ty, _Container>& _Left,
		const stack<_Ty, _Container>& _Right)
	{	
	return (!(_Right < _Left));
	}

template<class _Ty,
	class _Container> inline
	bool operator>=(const stack<_Ty, _Container>& _Left,
		const stack<_Ty, _Container>& _Right)
	{	
	return (!(_Left < _Right));
	}
}
#pragma warning(pop)
#pragma pack(pop)

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)
namespace std {

  #pragma warning(disable:4251)

		
template<class _Elem,
	class _Traits,
	class _Alloc>
	class basic_stringbuf
		: public basic_streambuf<_Elem, _Traits>
	{	
public:
	typedef _Alloc allocator_type;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystr;

	explicit  basic_stringbuf(ios_base::openmode _Mode =
		ios_base::in | ios_base::out)
		{	
		_Init(0, 0, _Getstate(_Mode));
		}

	explicit  basic_stringbuf(const _Mystr& _Str,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		{	
		_Init(_Str.c_str(), _Str.size(), _Getstate(_Mode));
		}

	virtual  ~basic_stringbuf()
		{	
		_Tidy();
		}

	enum
		{	
		_Allocated = 1,	
		_Constant = 2,	
		_Noread = 4,	
		_Append = 8,	
		_Atend = 16};	
	typedef int _Strstate;

	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	_Mystr  str() const
		{	
		if (!(_Mystate & _Constant) && _Mysb::pptr() != 0)
			{	
			_Mystr _Str(_Mysb::pbase(), (_Seekhigh < _Mysb::pptr()
				? _Mysb::pptr() : _Seekhigh) - _Mysb::pbase());
			return (_Str);
			}
		else if (!(_Mystate & _Noread) && _Mysb::gptr() != 0)
			{	
			_Mystr _Str(_Mysb::eback(), _Mysb::egptr() - _Mysb::eback());
			return (_Str);
			}
		else
			{	
			_Mystr _Nul;
			return (_Nul);
			}
		}

	void  str(const _Mystr& _Newstr)
		{	
		_Tidy();
		_Init(_Newstr.c_str(), _Newstr.size(), _Mystate);
		}

protected:
	virtual int_type  overflow(int_type _Meta = _Traits::eof())
		{	
		if (_Mystate & _Append
			&& _Mysb::pptr() != 0 && _Mysb::pptr() < _Seekhigh)
			_Mysb::setp(_Mysb::pbase(), _Seekhigh, _Mysb::epptr());

		if (_Traits::eq_int_type(_Traits::eof(), _Meta))
			return (_Traits::not_eof(_Meta));	
		else if (_Mysb::pptr() != 0
			&& _Mysb::pptr() < _Mysb::epptr())
			{	
			*_Mysb::_Pninc() = _Traits::to_char_type(_Meta);
			return (_Meta);
			}
		else if (_Mystate & _Constant)
			return (_Traits::eof());	
		else
			{	
			size_t _Oldsize = _Mysb::pptr() == 0
				? 0 : _Mysb::epptr() - _Mysb::eback();
			size_t _Newsize = _Oldsize;
			size_t _Inc = _Newsize / 2 < _MINSIZE
				? _MINSIZE : _Newsize / 2;	
			_Elem *_Ptr = 0;

			while (0 < _Inc && 2147483647 - _Inc < _Newsize)
				_Inc /= 2;	
			if (0 < _Inc)
				{	
				_Newsize += _Inc;
				_Ptr = _Al.allocate(_Newsize);
				}

			if (0 < _Oldsize)
				_Traits_helper::copy_s<_Traits>(_Ptr, _Newsize, _Mysb::eback(), _Oldsize);
			if (_Mystate & _Allocated)
				_Al.deallocate(_Mysb::eback(), _Oldsize);
			_Mystate |= _Allocated;

			if (_Oldsize == 0)
				{	
				_Seekhigh = _Ptr;
				_Mysb::setp(_Ptr, _Ptr + _Newsize);
				if (_Mystate & _Noread)
					_Mysb::setg(_Ptr, 0, _Ptr);
				else
					_Mysb::setg(_Ptr, _Ptr, _Ptr + 1);
				}
			else
				{	
				_Seekhigh = _Seekhigh - _Mysb::eback() + _Ptr;
				_Mysb::setp(_Mysb::pbase() - _Mysb::eback() + _Ptr,
					_Mysb::pptr() - _Mysb::eback() + _Ptr, _Ptr + _Newsize);
				if (_Mystate & _Noread)
					_Mysb::setg(_Ptr, 0, _Ptr);
				else
					_Mysb::setg(_Ptr,
						_Mysb::gptr() - _Mysb::eback() + _Ptr,
						_Mysb::pptr() + 1);
				}

			*_Mysb::_Pninc() = _Traits::to_char_type(_Meta);
			return (_Meta);
			}
		}

	virtual int_type  pbackfail(int_type _Meta = _Traits::eof())
		{	
		if (_Mysb::gptr() == 0
			|| _Mysb::gptr() <= _Mysb::eback()
			|| !_Traits::eq_int_type(_Traits::eof(), _Meta)
			&& !_Traits::eq(_Traits::to_char_type(_Meta), _Mysb::gptr()[-1])
			&& _Mystate & _Constant)
			return (_Traits::eof());	
		else
			{	
			_Mysb::gbump(-1);
			if (!_Traits::eq_int_type(_Traits::eof(), _Meta))
				*_Mysb::gptr() = _Traits::to_char_type(_Meta);
			return (_Traits::not_eof(_Meta));
			}
		}

	virtual int_type  underflow()
		{	
		if (_Mysb::gptr() == 0)
			return (_Traits::eof());	
		else if (_Mysb::gptr() < _Mysb::egptr())
			return (_Traits::to_int_type(*_Mysb::gptr()));	
		else if (_Mystate & _Noread || _Mysb::pptr() == 0
			|| _Mysb::pptr() <= _Mysb::gptr() && _Seekhigh <= _Mysb::gptr())
			return (_Traits::eof());	
		else
			{	
			if (_Seekhigh < _Mysb::pptr())
				_Seekhigh = _Mysb::pptr();
			_Mysb::setg(_Mysb::eback(), _Mysb::gptr(), _Seekhigh);
			return (_Traits::to_int_type(*_Mysb::gptr()));
			}
		}

	virtual pos_type  seekoff(off_type _Off,
		ios_base::seekdir _Way,
		ios_base::openmode _Which = ios_base::in | ios_base::out)
		{	
		if (_Mysb::pptr() != 0 && _Seekhigh < _Mysb::pptr())
			_Seekhigh = _Mysb::pptr();	

		if (_Which & ios_base::in && _Mysb::gptr() != 0)
			{	
			if (_Way == ios_base::end)
				_Off += (off_type)(_Seekhigh - _Mysb::eback());
			else if (_Way == ios_base::cur
				&& (_Which & ios_base::out) == 0)
				_Off += (off_type)(_Mysb::gptr() - _Mysb::eback());
			else if (_Way != ios_base::beg)
				_Off = _BADOFF;

			if (0 <= _Off && _Off <= _Seekhigh - _Mysb::eback())
				{	
				_Mysb::gbump((int)(_Mysb::eback() - _Mysb::gptr() + _Off));
				if (_Which & ios_base::out && _Mysb::pptr() != 0)
					_Mysb::setp(_Mysb::pbase(), _Mysb::gptr(),
						_Mysb::epptr());	
				}
			else
				_Off = _BADOFF;
			}
		else if (_Which & ios_base::out && _Mysb::pptr() != 0)
			{	
			if (_Way == ios_base::end)
				_Off += (off_type)(_Seekhigh - _Mysb::eback());
			else if (_Way == ios_base::cur)
				_Off += (off_type)(_Mysb::pptr() - _Mysb::eback());
			else if (_Way != ios_base::beg)
				_Off = _BADOFF;

			if (0 <= _Off && _Off <= _Seekhigh - _Mysb::eback())
				_Mysb::pbump((int)(_Mysb::eback()
					- _Mysb::pptr() + _Off));	
			else
				_Off = _BADOFF;
			}
		else
			_Off = _BADOFF;	
		return (pos_type(_Off));
		}

	virtual pos_type  seekpos(pos_type _Ptr,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		{	
		streamoff _Off = (streamoff)_Ptr;
		if (_Mysb::pptr() != 0 && _Seekhigh < _Mysb::pptr())
			_Seekhigh = _Mysb::pptr();	

		if (_Off == _BADOFF)
			;
		else if (_Mode & ios_base::in && _Mysb::gptr() != 0)
			{	
			if (0 <= _Off && _Off <= _Seekhigh - _Mysb::eback())
				{	
				_Mysb::gbump((int)(_Mysb::eback() - _Mysb::gptr() + _Off));
				if (_Mode & ios_base::out && _Mysb::pptr() != 0)
					_Mysb::setp(_Mysb::pbase(), _Mysb::gptr(),
						_Mysb::epptr());	
				}
			else
				_Off = _BADOFF;
			}
		else if (_Mode & ios_base::out && _Mysb::pptr() != 0)
			{	
			if (0 <= _Off && _Off <= _Seekhigh - _Mysb::eback())
				_Mysb::pbump((int)(_Mysb::eback()
					- _Mysb::pptr() + _Off));	
			else
				_Off = _BADOFF;
			}
		else
			_Off = _BADOFF;
		return (streampos(_Off));
		}

	void  _Init(const _Elem *_Ptr,
		size_t _Count, _Strstate _State)
		{	
		_Seekhigh = 0;
		_Mystate = _State;

		if (_Count != 0
			&& (_Mystate & (_Noread | _Constant)) != (_Noread | _Constant))
			{	
			_Elem *_Pnew = _Al.allocate(_Count);
			_Traits_helper::copy_s<_Traits>(_Pnew, _Count, _Ptr, _Count);
			_Seekhigh = _Pnew + _Count;

			if (!(_Mystate & _Noread))
				_Mysb::setg(_Pnew, _Pnew,
					_Pnew + _Count);	
			if (!(_Mystate & _Constant))
				{	
				_Mysb::setp(_Pnew,
					(_Mystate & _Atend) ? _Pnew + _Count : _Pnew,
					_Pnew + _Count);
				if (_Mysb::gptr() == 0)
					_Mysb::setg(_Pnew, 0, _Pnew);
				}
			_Mystate |= _Allocated;
			}
		}

	void  _Tidy()
		{	
		if (_Mystate & _Allocated)
			_Al.deallocate(_Mysb::eback(),
				(_Mysb::pptr() != 0 ? _Mysb::epptr()
					: _Mysb::egptr()) - _Mysb::eback());
		_Mysb::setg(0, 0, 0);
		_Mysb::setp(0, 0);
		_Seekhigh = 0;
		_Mystate &= ~_Allocated;
		}

private:
	enum
		{	
		_MINSIZE = 32};

	_Strstate  _Getstate(ios_base::openmode _Mode)
		{	
		_Strstate _State = (_Strstate)0;
		if (!(_Mode & ios_base::in))
			_State |= _Noread;
		if (!(_Mode & ios_base::out))
			_State |= _Constant;
		if (_Mode & ios_base::app)
			_State |= _Append;
		if (_Mode & ios_base::ate)
			_State |= _Atend;
		return (_State);
		}

	_Elem *_Seekhigh;	
	_Strstate _Mystate;	
	allocator_type _Al;	
	};
template class __declspec(dllimport) basic_stringbuf<char,
	char_traits<char>, allocator<char> >;
template class __declspec(dllimport) basic_stringbuf<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> >;
		
template<class _Elem,
	class _Traits,
	class _Alloc>
	class basic_istringstream
		: public basic_istream<_Elem, _Traits>
	{	
public:
	typedef _Alloc allocator_type;
	typedef basic_stringbuf<_Elem, _Traits, _Alloc> _Mysb;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystr;

	explicit  basic_istringstream(ios_base::openmode _Mode = ios_base::in)
		: basic_istream<_Elem, _Traits>(&_Stringbuffer),
			_Stringbuffer(_Mode | ios_base::in)
		{	
		}

	explicit  basic_istringstream(const _Mystr& _Str,
		ios_base::openmode _Mode = ios_base::in)
		: basic_istream<_Elem, _Traits>(&_Stringbuffer),
			_Stringbuffer(_Str, _Mode | ios_base::in)
		{	
		}

	virtual  ~basic_istringstream()
		{	
		}

	_Mysb * rdbuf() const
		{	
		return ((_Mysb *)&_Stringbuffer);
		}

	_Mystr  str() const
		{	
		return (_Stringbuffer.str());
		}

	void  str(const _Mystr& _Newstr)
		{	
		_Stringbuffer.str(_Newstr);
		}

private:
	_Mysb _Stringbuffer;	
	};
template class __declspec(dllimport) basic_istringstream<char,
	char_traits<char>, allocator<char> >;
template class __declspec(dllimport) basic_istringstream<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> >;
		
template<class _Elem,
	class _Traits,
	class _Alloc>
	class basic_ostringstream
		: public basic_ostream<_Elem, _Traits>
	{	
public:
	typedef _Alloc allocator_type;
	typedef basic_stringbuf<_Elem, _Traits, _Alloc> _Mysb;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystr;

	explicit  basic_ostringstream(ios_base::openmode _Mode = ios_base::out)
		: basic_ostream<_Elem, _Traits>(&_Stringbuffer),
			_Stringbuffer(_Mode | ios_base::out)
		{	
		}

	explicit  basic_ostringstream(const _Mystr& _Str,
		ios_base::openmode _Mode = ios_base::out)
		: basic_ostream<_Elem, _Traits>(&_Stringbuffer),
			_Stringbuffer(_Str, _Mode | ios_base::out)
		{	
		}

	virtual  ~basic_ostringstream()
		{	
		}

	_Mysb * rdbuf() const
		{	
		return ((_Mysb *)&_Stringbuffer);
		}

	_Mystr  str() const
		{	
		return (_Stringbuffer.str());
		}

	void  str(const _Mystr& _Newstr)
		{	
		_Stringbuffer.str(_Newstr);
		}

private:
	_Mysb _Stringbuffer;	
	};
template class __declspec(dllimport) basic_ostringstream<char,
	char_traits<char>, allocator<char> >;
template class __declspec(dllimport) basic_ostringstream<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> >;
		
template<class _Elem,
	class _Traits,
	class _Alloc>
	class basic_stringstream
		: public basic_iostream<_Elem, _Traits>
	{	
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef _Alloc allocator_type;
	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystr;

	explicit  basic_stringstream(ios_base::openmode _Mode =
		ios_base::in | ios_base::out)
		: basic_iostream<_Elem, _Traits>(&_Stringbuffer),
			_Stringbuffer(_Mode)
		{	
		}

	explicit  basic_stringstream(const _Mystr& _Str,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		: basic_iostream<_Elem, _Traits>(&_Stringbuffer),
			_Stringbuffer(_Str, _Mode)
		{	
		}

	virtual  ~basic_stringstream()
		{	
		}

	basic_stringbuf<_Elem, _Traits, _Alloc> * rdbuf() const
		{	
		return ((basic_stringbuf<_Elem, _Traits, _Alloc> *)&_Stringbuffer);
		}

	_Mystr  str() const
		{	
		return (_Stringbuffer.str());
		}

	void  str(const _Mystr& _Newstr)
		{	
		_Stringbuffer.str(_Newstr);
		}

private:
	basic_stringbuf<_Elem, _Traits, _Alloc>
		_Stringbuffer;	
	};
template class __declspec(dllimport) basic_stringstream<char,
	char_traits<char>, allocator<char> >;
template class __declspec(dllimport) basic_stringstream<wchar_t,
	char_traits<wchar_t>, allocator<wchar_t> >;

}
#pragma warning(pop)
#pragma pack(pop)
#pragma once
#pragma pack(push,8)
#pragma warning(push,3)

 #pragma warning(disable: 4127)
namespace std {

extern __declspec(dllimport) _iobuf *__cdecl _Fiopen(const char *,
	ios_base::openmode, int);
extern __declspec(dllimport) _iobuf *__cdecl _Fiopen(const wchar_t *,
	ios_base::openmode, int);
extern __declspec(dllimport) _iobuf *__cdecl _Fiopen(const unsigned short *,
	ios_base::openmode, int);
		
template<class _Elem> inline
	bool _Fgetc(_Elem& _Ch, _iobuf *_File)
	{	
	return (fread(&_Ch, sizeof (_Elem), 1, _File) == 1);
	}

template<> inline bool _Fgetc(char& _Byte, _iobuf *_File)
	{	
	int _Meta;
	if ((_Meta = fgetc(_File)) == (-1))
		return (false);
	else
		{	
		_Byte = (char)_Meta;
		return (true);
		}
	}

template<> inline bool _Fgetc(wchar_t& _Wchar, _iobuf *_File)
	{	
	wint_t _Meta;
	if ((_Meta = ::fgetwc(_File)) == (wint_t)(0xFFFF))
		return (false);
	else
		{	
		_Wchar = (wchar_t)_Meta;
		return (true);
		}
	}
		
template<class _Elem> inline
	bool _Fputc(_Elem _Ch, _iobuf *_File)
	{	
	return (fwrite(&_Ch, 1, sizeof (_Elem), _File) == sizeof (_Elem));
	}

template<> inline bool _Fputc(char _Byte, _iobuf *_File)
	{	
	return (fputc(_Byte, _File) != (-1));
	}

template<> inline bool _Fputc(wchar_t _Wchar, _iobuf *_File)
	{	
	return (::fputwc(_Wchar, _File) != (wint_t)(0xFFFF));
	}
		
template<class _Elem> inline
	bool _Ungetc(const _Elem& _Ch, _iobuf *_File)
	{	
	return (false);
	}

template<> inline bool _Ungetc(const char& _Byte, _iobuf *_File)
	{	
	return (ungetc((unsigned char)_Byte, _File) != (-1));
	}

template<> inline bool _Ungetc(const signed char& _Byte, _iobuf *_File)
	{	
	return (ungetc((unsigned char)_Byte, _File) != (-1));
	}

template<> inline bool _Ungetc(const unsigned char& _Byte, _iobuf *_File)
	{	
	return (ungetc(_Byte, _File) != (-1));
	}

template<> inline bool _Ungetc(const wchar_t& _Wchar, _iobuf *_File)
	{	
	return (::ungetwc(_Wchar, _File) != (wint_t)(0xFFFF));
	}
		
template<class _Elem,
	class _Traits>
	class basic_filebuf
		: public basic_streambuf<_Elem, _Traits>
	{	
public:
	typedef basic_filebuf<_Elem, _Traits> _Myt;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef typename _Traits::state_type _Myst;
	typedef codecvt<_Elem, char, typename _Traits::state_type> _Cvt;

	virtual  ~basic_filebuf()
		{	
		if (_Closef)
			close();
		}

	 basic_filebuf(_iobuf *_File = 0)
		: _Mysb()
		{	
		_Init(_File, _Newfl);
		}

	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	 basic_filebuf(_Uninitialized)
		: _Mysb(_Noinit)
		{	
		}

	enum _Initfl
		{	
		_Newfl, _Openfl, _Closefl};

	bool  is_open() const
		{	
		return (_Myfile != 0);
		}

	_Myt * open(const char *_Filename,
		ios_base::openmode _Mode,
		int _Prot = (int)ios_base::_Openprot)
		{	
		_iobuf *_File;
		if (_Myfile != 0 || (_File = _Fiopen(_Filename, _Mode, _Prot)) == 0)
			return (0);	

		_Init(_File, _Openfl);
		_Initcvt((_Cvt *)&use_facet<_Cvt >(_Mysb::getloc()));
		return (this);	
		}

	_Myt * open(const char *_Filename, ios_base::open_mode _Mode)
		{	
		return (open(_Filename, (ios_base::openmode)_Mode));
		}

	_Myt * open(const wchar_t *_Filename,
		ios_base::openmode _Mode,
		int _Prot = (int)ios_base::_Openprot)
		{	
		_iobuf *_File;
		if (_Myfile != 0 || (_File = _Fiopen(_Filename, _Mode, _Prot)) == 0)
			return (0);	

		_Init(_File, _Openfl);
		_Initcvt((_Cvt *)&use_facet<_Cvt >(_Mysb::getloc()));
		return (this);	
		}

	_Myt * open(const wchar_t *_Filename, ios_base::open_mode _Mode)
		{	
		return (open(_Filename, (ios_base::openmode)_Mode));
		}
	_Myt *  open(const unsigned short *_Filename,
		ios_base::openmode _Mode,
		int _Prot = (int)ios_base::_Openprot)
		{	
		_iobuf *_File;
		if (_Myfile != 0 || (_File = _Fiopen(_Filename, _Mode, _Prot)) == 0)
			return (0);	

		_Init(_File, _Openfl);
		_Initcvt((_Cvt *)&use_facet<_Cvt >(_Mysb::getloc()));
		return (this);	
		}

	_Myt *  open(const unsigned short *_Filename, ios_base::open_mode _Mode)
		{	
		return (open(_Filename, (ios_base::openmode)_Mode));
		}
	_Myt * close()
		{	
		_Myt *_Ans = this;
		if (_Myfile == 0)
			_Ans = 0;
		else
			{	
			if (!_Endwrite())
				_Ans = 0;
			if (fclose(_Myfile) != 0)
				_Ans = 0;
			}
		_Init(0, _Closefl);
		return (_Ans);
		}

protected:
	virtual int_type  overflow(int_type _Meta = _Traits::eof())
		{	
		if (_Traits::eq_int_type(_Traits::eof(), _Meta))
			return (_Traits::not_eof(_Meta));	
		else if (_Mysb::pptr() != 0
			&& _Mysb::pptr() < _Mysb::epptr())
			{	
			*_Mysb::_Pninc() = _Traits::to_char_type(_Meta);
			return (_Meta);
			}
		else if (_Myfile == 0)
			return (_Traits::eof());	
		else if (_Pcvt == 0)
			return (_Fputc(_Traits::to_char_type(_Meta), _Myfile)
				? _Meta : _Traits::eof());	
		else
			{	
			const int _STRING_INC = 8;
			const _Elem _Ch = _Traits::to_char_type(_Meta);
			const _Elem *_Src;
			char *_Dest;

			string _Str(_STRING_INC, '\0');
			for (; ; )
				switch (_Pcvt->out(_State,
					&_Ch, &_Ch + 1, _Src,
					&*_Str.begin(), &*_Str.begin() + _Str.size(), _Dest))
				{	
				case codecvt_base::partial:
				case codecvt_base::ok:
					{	
					size_t _Count = _Dest - &*_Str.begin();
					if (0 < _Count && _Count !=
						fwrite(&*_Str.begin(), 1, _Count, _Myfile))
						return (_Traits::eof());	

					_Wrotesome = true;	
					if (_Src != &_Ch)
						return (_Meta);	

					if (0 < _Count)
						;
					else if (_Str.size() < 4 * _STRING_INC)
						_Str.append(_STRING_INC, '\0');	
					else
						return (_Traits::eof());	
					break;
					}

				case codecvt_base::noconv:
					return (_Fputc(_Ch, _Myfile) ? _Meta
						: _Traits::eof());	

				default:
					return (_Traits::eof());	
				}
			}
		}

	virtual int_type  pbackfail(int_type _Meta = _Traits::eof())
		{	
		if (_Mysb::gptr() != 0
			&& _Mysb::eback() < _Mysb::gptr()
			&& (_Traits::eq_int_type(_Traits::eof(), _Meta)
			|| _Traits::eq_int_type(_Traits::to_int_type(_Mysb::gptr()[-1]),
				_Meta)))
			{	
			_Mysb::_Gndec();
			return (_Traits::not_eof(_Meta));
			}
		else if (_Myfile == 0 || _Traits::eq_int_type(_Traits::eof(), _Meta))
			return (_Traits::eof());	
		else if (_Pcvt == 0 && _Ungetc(_Traits::to_char_type(_Meta), _Myfile))
			return (_Meta);	
#pragma warning(push)
#pragma warning(disable: 6237 6239)
		
		else if (1 < sizeof (_Elem) && _Mysb::gptr() != &_Mychar)
#pragma warning(pop)
			{	
			_Mychar = _Traits::to_char_type(_Meta);
			_Mysb::setg(&_Mychar, &_Mychar, &_Mychar + 1);
			return (_Meta);
			}
		else
			return (_Traits::eof());	
		}

	virtual int_type  underflow()
		{	
		int_type _Meta;
		if (_Mysb::gptr() != 0
			&& _Mysb::gptr() < _Mysb::egptr())
			return (_Traits::to_int_type(*_Mysb::gptr()));	
		else if (_Traits::eq_int_type(_Traits::eof(), _Meta = uflow()))
			return (_Meta);	
		else
			{	
			pbackfail(_Meta);
			return (_Meta);
			}
		}

	virtual int_type  uflow()
		{	
		if (_Mysb::gptr() != 0
			&& _Mysb::gptr() < _Mysb::egptr())
			return (_Traits::to_int_type(
				*_Mysb::_Gninc()));	
		else if (_Myfile == 0)
			return (_Traits::eof());	
		else if (_Pcvt == 0)
			{	
			_Elem _Ch;
			return (_Fgetc(_Ch, _Myfile) ? _Traits::to_int_type(_Ch)
				: _Traits::eof());
			}
		else
			{	
			string _Str;

			for (; ; )
				{	
				_Elem _Ch, *_Dest;
				const char *_Src;
				ptrdiff_t _Nleft;
				int _Meta = fgetc(_Myfile);

				if (_Meta == (-1))
					return (_Traits::eof());	

				_Str.append(1, (char)_Meta);	
				switch (_Pcvt->in(_State,
					&*_Str.begin(), &*_Str.begin() + _Str.size(), _Src,
					&_Ch, &_Ch + 1, _Dest))
					{	
				case codecvt_base::partial:
				case codecvt_base::ok:
					if (_Dest != &_Ch)
						{	
						for (_Nleft = &*_Str.begin() + _Str.size() - _Src;
							0 < _Nleft; )
							ungetc(_Src[--_Nleft], _Myfile);
						return (_Traits::to_int_type(_Ch));
						}
					else
						_Str.erase((size_t)0,	
							(size_t)(_Src - &*_Str.begin()));
					break;

				case codecvt_base::noconv:
					if (_Str.size() < sizeof (_Elem))
						break;	

					::memcpy_s((&_Ch), (sizeof (_Elem)), (&*_Str.begin()), (sizeof (_Elem)));	
					return (_Traits::to_int_type(_Ch));	

				default:
					return (_Traits::eof());	
					}
				}
			}
		}

	virtual pos_type  seekoff(off_type _Off,
		ios_base::seekdir _Way,
		ios_base::openmode =
			(ios_base::openmode)(ios_base::in | ios_base::out))
		{	
		fpos_t _Fileposition;

		if (_Mysb::gptr() == &_Mychar	
			&& _Way == ios_base::cur	
			&& _Pcvt == 0)	
			_Off -= (off_type)sizeof (_Elem);	

		if (_Myfile == 0 || !_Endwrite()
			|| (_Off != 0 || _Way != ios_base::cur)
				&& fseek(_Myfile, (long)_Off, _Way) != 0
			|| fgetpos(_Myfile, &_Fileposition) != 0)
			return (pos_type(_BADOFF));	

		if (_Mysb::gptr() == &_Mychar)
			_Mysb::setg(&_Mychar, &_Mychar + 1,
				&_Mychar + 1);	
		return (pos_type(_State, _Fileposition));	
		}

	virtual pos_type  seekpos(pos_type _Pos,
		ios_base::openmode =
			(ios_base::openmode)(ios_base::in | ios_base::out))
		{	
		fpos_t _Fileposition = _Pos.seekpos();
		off_type _Off = (off_type)_Pos - ((long)(_Fileposition));

		if (_Myfile == 0 || !_Endwrite()
			|| fsetpos(_Myfile, &_Fileposition) != 0
			|| _Off != 0 && fseek(_Myfile, (long)_Off, 1) != 0
			|| fgetpos(_Myfile, &_Fileposition) != 0)
			return (pos_type(_BADOFF));	

		_State = _Pos.state();

		if (_Mysb::gptr() == &_Mychar)
			_Mysb::setg(&_Mychar, &_Mychar + 1,
				&_Mychar + 1);	
		return (pos_type(_State, _Fileposition));	
		}

	virtual _Mysb * setbuf(_Elem *_Buffer, streamsize _Count)
		{	
		if (_Myfile == 0 || setvbuf(_Myfile, (char *)_Buffer,
			_Buffer == 0 && _Count == 0 ? 0x0004 : 0x0000,
			_Count * sizeof (_Elem)) != 0)
			return (0);	
		else
			{	
			_Init(_Myfile, _Openfl);
			return (this);
			}
		}

	virtual int  sync()
		{	
		return (_Myfile == 0
			|| _Traits::eq_int_type(_Traits::eof(), overflow())
			|| 0 <= fflush(_Myfile) ? 0 : -1);
		}

	virtual void  imbue(const locale& _Loc)
		{	
		_Initcvt((_Cvt *)&use_facet<_Cvt >(_Loc));
		}

	void  _Init(_iobuf *_File, _Initfl _Which)
		{	
		 static _Myst _Stinit;	
		_Closef = _Which == _Openfl;
		_Wrotesome = false;

		_Mysb::_Init();	
#pragma warning(push)
#pragma warning(disable: 6240)
		
		if (_File != 0 && sizeof (_Elem) == 1)
#pragma warning(pop)
			{	
			_Elem **_Pb = (_Elem **)&_File->_base;
			_Elem **_Pn = (_Elem **)&_File->_ptr;
			int *_Nr = (int *)&_File->_cnt;
			int *_Nw = (int *)&_File->_cnt;
			_Mysb::_Init(_Pb, _Pn, _Nr, _Pb, _Pn, _Nw);
			}
		_Myfile = _File;
		_State = _Stinit;
		_Pcvt = 0;	
		}

	bool  _Endwrite()
		{	
		if (_Pcvt == 0 || !_Wrotesome)
			return (true);
		else
			{	
			const int _STRING_INC = 8;
			char *_Dest;
			if (_Traits::eq_int_type(_Traits::eof(), overflow()))
				return (false);

			string _Str(_STRING_INC, '\0');
			for (; ; )
				switch (_Pcvt->unshift(_State,
					&*_Str.begin(), &*_Str.begin() + _Str.size(), _Dest))
				{	
				case codecvt_base::ok:
					_Wrotesome = false;	

				case codecvt_base::partial:	
					{	
					size_t _Count = _Dest - &*_Str.begin();
					if (0 < _Count && _Count !=
						fwrite(&*_Str.begin(), 1, _Count, _Myfile))
						return (false);	
					if (!_Wrotesome)
						return (true);
					if (_Count == 0)
						_Str.append(_STRING_INC, '\0');	
					break;
					}

				case codecvt_base::noconv:
					return (true);	

				default:
					return (false);	
				}
			}
		}

	void  _Initcvt(_Cvt *_Newpcvt)
		{	
		if (_Newpcvt->always_noconv())
			_Pcvt = 0;	
		else
			{	
			_Pcvt = _Newpcvt;
			_Mysb::_Init();	
			}
		}

private:
	_Cvt *_Pcvt;	
	_Elem _Mychar;	
	bool _Wrotesome;	
	typename _Traits::state_type _State;	
	bool _Closef;	
	_iobuf *_Myfile;	
	};

template class __declspec(dllimport) basic_filebuf<char,
	char_traits<char> >;
template class __declspec(dllimport) basic_filebuf<wchar_t,
	char_traits<wchar_t> >;
		
template<class _Elem,
	class _Traits>
	class basic_ifstream
		: public basic_istream<_Elem, _Traits>
	{	
public:
	typedef basic_ifstream<_Elem, _Traits> _Myt;
	typedef basic_filebuf<_Elem, _Traits> _Myfb;
	typedef basic_ios<_Elem, _Traits> _Myios;

	 basic_ifstream()
		: basic_istream<_Elem, _Traits>(&_Filebuffer)
		{	
		}

	explicit  basic_ifstream(const char *_Filename,
		ios_base::openmode _Mode = ios_base::in,
		int _Prot = (int)ios_base::_Openprot)
		: basic_istream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::in, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	explicit  basic_ifstream(const wchar_t *_Filename,
		ios_base::openmode _Mode = ios_base::in,
		int _Prot = (int)ios_base::_Openprot)
		: basic_istream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::in, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}
	explicit  basic_ifstream(const unsigned short *_Filename,
		ios_base::openmode _Mode = ios_base::in,
		int _Prot = (int)ios_base::_Openprot)
		: basic_istream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::in, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}
	explicit  basic_ifstream(_iobuf *_File)
		: basic_istream<_Elem, _Traits>(&_Filebuffer),
			_Filebuffer(_File)
		{	
		}
	void  open(const wchar_t *_Filename,
		ios_base::openmode _Mode = ios_base::in,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::in, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const wchar_t *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}
	void  open(const unsigned short *_Filename,
		ios_base::openmode _Mode = ios_base::in,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::in, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const unsigned short *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}
	virtual  ~basic_ifstream()
		{	
		}

	_Myfb * rdbuf() const
		{	
		return ((_Myfb *)&_Filebuffer);
		}

	bool  is_open() const
		{	
		return (_Filebuffer.is_open());
		}

	void  open(const char *_Filename,
		ios_base::openmode _Mode = ios_base::in,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::in, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const char *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}

	void  close()
		{	
		if (_Filebuffer.close() == 0)
			_Myios::setstate(ios_base::failbit);
		}

private:
	_Myfb _Filebuffer;	
	};
template class __declspec(dllimport) basic_ifstream<char,
	char_traits<char> >;
template class __declspec(dllimport) basic_ifstream<wchar_t,
	char_traits<wchar_t> >;
		
template<class _Elem,
	class _Traits>
	class basic_ofstream
		: public basic_ostream<_Elem, _Traits>
	{	
public:
	typedef basic_ofstream<_Elem, _Traits> _Myt;
	typedef basic_filebuf<_Elem, _Traits> _Myfb;
	typedef basic_ios<_Elem, _Traits> _Myios;

	 basic_ofstream()
		: basic_ostream<_Elem, _Traits>(&_Filebuffer)
		{	
		}

	explicit  basic_ofstream(const char *_Filename,
		ios_base::openmode _Mode = ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		: basic_ostream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::out, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	explicit  basic_ofstream(const wchar_t *_Filename,
		ios_base::openmode _Mode = ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		: basic_ostream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::out, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}
	explicit  basic_ofstream(const unsigned short *_Filename,
		ios_base::openmode _Mode = ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		: basic_ostream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::out, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}
	explicit  basic_ofstream(_iobuf *_File)
		: basic_ostream<_Elem, _Traits>(&_Filebuffer),
			_Filebuffer(_File)
		{	
		}

	virtual  ~basic_ofstream()
		{	
		}

	_Myfb * rdbuf() const
		{	
		return ((_Myfb *)&_Filebuffer);
		}

	bool  is_open() const
		{	
		return (_Filebuffer.is_open());
		}

	void  open(const wchar_t *_Filename,
		ios_base::openmode _Mode = ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::out, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const wchar_t *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}
	void  open(const unsigned short *_Filename,
		ios_base::openmode _Mode = ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::out, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const unsigned short *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}
	void  open(const char *_Filename,
		ios_base::openmode _Mode = ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode | ios_base::out, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const char *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}

	void  close()
		{	
		if (_Filebuffer.close() == 0)
			_Myios::setstate(ios_base::failbit);
		}

private:
	_Myfb _Filebuffer;	
	};
template class __declspec(dllimport) basic_ofstream<char,
	char_traits<char> >;
template class __declspec(dllimport) basic_ofstream<wchar_t,
	char_traits<wchar_t> >;
		
template<class _Elem,
	class _Traits>
	class basic_fstream
		: public basic_iostream<_Elem, _Traits>
	{	
public:
	typedef basic_fstream<_Elem, _Traits> _Myt;
	typedef basic_ios<_Elem, _Traits> _Myios;
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	 basic_fstream()
		: basic_iostream<_Elem, _Traits>(&_Filebuffer)
		{	
		}

	explicit  basic_fstream(const char *_Filename,
		ios_base::openmode _Mode = ios_base::in | ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		: basic_iostream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	explicit  basic_fstream(const wchar_t *_Filename,
		ios_base::openmode _Mode = ios_base::in | ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		: basic_iostream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}
	explicit  basic_fstream(const unsigned short *_Filename,
		ios_base::openmode _Mode = ios_base::in | ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		: basic_iostream<_Elem, _Traits>(&_Filebuffer)
		{	
		if (_Filebuffer.open(_Filename, _Mode, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}
	explicit  basic_fstream(_iobuf *_File)
		: basic_iostream<_Elem, _Traits>(&_Filebuffer),
			_Filebuffer(_File)
		{	
		}

	void  open(const wchar_t *_Filename,
		ios_base::openmode _Mode = ios_base::in | ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const wchar_t *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}
	void  open(const unsigned short *_Filename,
		ios_base::openmode _Mode = ios_base::in | ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const unsigned short *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}
	virtual  ~basic_fstream()
		{	
		}

	basic_filebuf<_Elem, _Traits> * rdbuf() const
		{	
		return ((basic_filebuf<_Elem, _Traits> *)&_Filebuffer);
		}

	bool  is_open() const
		{	
		return (_Filebuffer.is_open());
		}

	void  open(const char *_Filename,
		ios_base::openmode _Mode = ios_base::in | ios_base::out,
		int _Prot = (int)ios_base::_Openprot)
		{	
		if (_Filebuffer.open(_Filename, _Mode, _Prot) == 0)
			_Myios::setstate(ios_base::failbit);
		}

	void  open(const char *_Filename, ios_base::open_mode _Mode)
		{	
		open(_Filename, (ios_base::openmode)_Mode);
		}

	void  close()
		{	
		if (_Filebuffer.close() == 0)
			_Myios::setstate(ios_base::failbit);
		}

private:
	basic_filebuf<_Elem, _Traits> _Filebuffer;	
	};
template class __declspec(dllimport) basic_fstream<char,
	char_traits<char> >;
template class __declspec(dllimport) basic_fstream<wchar_t,
	char_traits<wchar_t> >;

}
  #pragma warning(default: 4127)

#pragma warning(pop)
#pragma pack(pop)

#pragma once
#pragma pack(push,8)
#pragma warning(push,3)

namespace std {

		

 extern __declspec(dllimport) istream *_Ptr_cin;
 extern __declspec(dllimport) ostream *_Ptr_cout;
 extern __declspec(dllimport) ostream *_Ptr_cerr;
 extern __declspec(dllimport) ostream *_Ptr_clog;
		
class __declspec(dllimport) _Winit {
public:
	__thiscall _Winit();
	__thiscall ~_Winit();
private:
	 static int _Init_cnt;
	};
		

 extern __declspec(dllimport) wistream *_Ptr_wcin;
 extern __declspec(dllimport) wostream *_Ptr_wcout;
 extern __declspec(dllimport) wostream *_Ptr_wcerr;
 extern __declspec(dllimport) wostream *_Ptr_wclog;

 extern __declspec(dllimport) istream cin;
 extern __declspec(dllimport) ostream cout;
 extern __declspec(dllimport) ostream cerr;
 extern __declspec(dllimport) ostream clog;

 extern __declspec(dllimport) wistream wcin;
 extern __declspec(dllimport) wostream wcout;
 extern __declspec(dllimport) wostream wcerr;
 extern __declspec(dllimport) wostream wclog;

}
#pragma warning(pop)
#pragma pack(pop)
const int STRINGMEMBLOCK_SIZE = 64 * 1024;

class cStringMemBlock
{
public:
  cStringMemBlock(int nSize = STRINGMEMBLOCK_SIZE, cStringMemBlock* pNext = 0);
  ~cStringMemBlock();

  char* Alloc(int nSize);

private:
  char* m_pBlock;
  int m_nCrsr;
  int m_nSize;
  cStringMemBlock* m_pNext;
};

class cStringMem
{
public:
  cStringMem();
  ~cStringMem();

  void Reset();
  char* Alloc(int nSize);

private:
  cStringMemBlock* m_pBlock;
};
enum eToken
{
  TOKEN_UNKNOWN = 0,
  TOKEN_COMMENT,
  TOKEN_LINECOMMENT,
  TOKEN_NEWLINE,
  TOKEN_WHITESPACE,
  TOKEN_PREPROC,
  TOKEN_LABEL,
  TOKEN_LITERAL,
  TOKEN_STRING,
  TOKEN_MULTILINE_STRING,
  TOKEN_CHAR,
  TOKEN_OPERATOR,
  TOKEN_BLOCK_BEGIN,
  TOKEN_BLOCK_END,
  TOKEN_KEYWORD,
  TOKEN_TEXT,
  TOKEN_MAX
};

struct tKeyword
{
  const char* m_strKeyword;
  int m_Type;
};

typedef std::map<std::string, int> tKeywordMap;

class cStringMem;

struct tToken
{
  int m_Token;

  union
  {
    char* m_strName;
    int m_Type;
    char m_cChar;
  };

  tToken();
  tToken(const char* strLabel);
  tToken(const tToken& token);
  tToken(int nToken, int nType);
  tToken(int nToken, const char* strName);
  ~tToken();

  void SetName(const char* strName);
  void SetName(const char* strName, int iLen);
  tToken& operator=(const tToken& token);
  bool IsToken(eToken nToken) const;
  bool IsToken(eToken nToken, int nType) const;

  static void SetStringMem(cStringMem* pStringMem);
  static cStringMem* s_pStringMem;
};

typedef std::vector<tToken> tTokenList;

class ITokenizer
{
public:
  virtual const char* GetTokenString(int nToken) = 0;
  virtual const char* GetKeywordString(int nKeyword) = 0;
  virtual const char* GetOperatorString(int type) = 0;
  virtual bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false) = 0;
  virtual void Reset() = 0;
};
class ITokenHandler
{
public:
  virtual bool HandleToken(tToken& oToken) = 0;
  virtual void HandleError(const char* strError, int iLine) = 0;
  virtual void LogEntry(const char* strLog) = 0;
  virtual int GetTokenCount() = 0;
};

class cTokenizer: public ITokenizer
{
public:
  cTokenizer();
  virtual ~cTokenizer();

  void Reset();

  const char* GetTokenString(int nToken);
  const char* GetKeywordString(int type);
  const char* GetOperatorString(int type);

  void SetTokenHandler(ITokenHandler* pTokenHandler);
  ITokenHandler* GetTokenHandler();

  int GetLine() const;

protected:

  int IncLine(int nOffset = 1);
  void LogLine(const char* strLine);

  void PushToken(int nToken);
  void PushToken(tToken& token);
  void PushToken(int nTokenType, int opType);
  void PushToken(int nTokenType, char cChar);
  void PushToken(int nTokenType, const char* strName, int iLen = 0);
  virtual void PushKeyword(int nKeyword);

  virtual const char* HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces);
  virtual const char* ParseLabel(const char* strLine);
  void AddKeywords(tKeyword* pKeywords, int nUnknown);
  void AddOperators(tKeyword* pKeywords, int nUnknown);
  virtual int IsKeyword(const char* strLabel);

private:
  tKeywordMap m_Keywords;
  tKeywordMap m_Operators;

  typedef std::map<int, std::string> tKeywordStringMap;
  tKeywordStringMap m_KeywordStrings;
  tKeywordStringMap m_OperatorStrings;
  int m_nUnkownKeyword;
  int m_nUnknownOperator;

  ITokenHandler* m_pTokenHandler;
  cStringMem* m_pStringMem;
  int m_iLine;
};

enum eCPPTokenType
{
  CPP_OP_UNKNOWN = 0,
  CPP_OP_MEMBER_ACCESS,
  CPP_OP_LIST,
  CPP_OP_COMMAND_END,
  CPP_OP_CONDITIONAL,
  CPP_OP_BRACKET_OPEN,
  CPP_OP_BRACKET_CLOSE,
  CPP_OP_INDEX_OPEN,
  CPP_OP_INDEX_CLOSE,
  CPP_OP_ASTERISK,
  CPP_OP_INCREMENT,
  CPP_OP_DIVIDE,
  CPP_OP_SUM_ASSIGNMENT,
  CPP_OP_ADDITION,
  CPP_OP_DECREMENT,
  CPP_OP_DIFFERENCE_ASSIGNMENT,
  CPP_OP_SUBTRACTION,
  CPP_OP_POINTER,
  CPP_OP_REMAINDER_ASSIGNMENT,
  CPP_OP_MODULUS,
  CPP_OP_EQUAL,
  CPP_OP_ASSIGNMENT,
  CPP_OP_NOT_EQUAL,
  CPP_OP_LOGICAL_NOT,
  CPP_OP_SMALLER_OR_EQUAL,
  CPP_OP_SHIFT_LEFT,
  CPP_OP_SMALLER,
  CPP_OP_SHIFT_LEFT_ASSIGNMENT,
  CPP_OP_BIGGER_OR_EQUAL,
  CPP_OP_SHIFT_RIGHT_ASSIGNMENT,
  CPP_OP_SHIFT_RIGHT,
  CPP_OP_BIGGER,
  CPP_OP_AND_ASSIGNMENT,
  CPP_OP_LOGICAL_AND,
  CPP_OP_BITWISE_AND,
  CPP_OP_OR_ASSIGNMENT,
  CPP_OP_LOGICAL_OR,
  CPP_OP_BITWISE_OR,
  CPP_OP_XOR_ASSIGNMENT,
  CPP_OP_BITWISE_XOR,
  CPP_OP_COMPLEMENT,
  CPP_OP_COLON,
  CPP_OP_SCOPE,
  CPP_OP_PRODUCT_ASSIGNMENT,
  CPP_OP_QUOTIENT_ASSIGNMENT,
  CPP_OP_POINTER_DEREFERNCE,
  CPP_OP_MEMBER_ACCESS_DEREFERENCE,
  CPP_OP_ELLIPSIS,
  CPP_OP_MAX,

  CPP_KW_UNKNOWN,
  CPP_KW_TYPE_INT64,
  CPP_KW_11_ALIGNAS,
  CPP_KW_11_ALIGNOF,
  CPP_KW_ASM,
  CPP_KW_AUTO,
  CPP_KW_TYPE_BOOL,
  CPP_KW_BREAK,
  CPP_KW_CASE,
  CPP_KW_CATCH,
  CPP_KW_TYPE_CHAR,
  CPP_KW_11_CHAR16_T,
  CPP_KW_11_CHAR32_T,
  CPP_KW_CLASS,
  CPP_KW_TYPE_CONST,
  CPP_KW_11_CONSTEXPR,
  CPP_KW_CONST_CAST,
  CPP_KW_CONTINUE,
  CPP_KW_11_DECLTYPE,
  CPP_KW_DEFAULT,
  CPP_KW_DELETE,
  CPP_KW_DO,
  CPP_KW_TYPE_DOUBLE,
  CPP_KW_DYNAMIC_CAST,
  CPP_KW_ELSE,
  CPP_KW_ENUM,
  CPP_KW_EXTERN,
  CPP_KW_EXPLICIT,
  CPP_KW_EXPORT,
  CPP_KW_FALSE,
  CPP_KW_11_FINAL,
  CPP_KW_TYPE_FLOAT,
  CPP_KW_FOR,
  CPP_KW_FRIEND,
  CPP_KW_GOTO,
  CPP_KW_IF,
  CPP_KW_INLINE,
  CPP_KW_TYPE_INT,
  CPP_KW_TYPE_LONG,
  CPP_KW_MUTABLE,
  CPP_KW_NAMESPACE,
  CPP_KW_NEW,
  CPP_KW_11_NOEXCEPT,
  CPP_KW_11_NULLPTR,
  CPP_KW_OPERATOR,
  CPP_KW_11_OVERRIDE,
  CPP_KW_PRIVATE,
  CPP_KW_PROTECTED,
  CPP_KW_PUBLIC,
  CPP_KW_REGISTER,
  CPP_KW_REINTERPRET_CAST,
  CPP_KW_RETURN,
  CPP_KW_TYPE_SHORT,
  CPP_KW_TYPE_SIGNED,
  CPP_KW_SIZEOF,
  CPP_KW_STATIC,
  CPP_KW_11_STATIC_ASSERT,
  CPP_KW_STATIC_CAST,
  CPP_KW_STRUCT,
  CPP_KW_SWITCH,
  CPP_KW_TEMPLATE,
  CPP_KW_THIS,
  CPP_KW_11_THREAD_LOCAL,
  CPP_KW_THROW,
  CPP_KW_TRUE,
  CPP_KW_TRY,
  CPP_KW_TYPEDEF,
  CPP_KW_TYPEID,
  CPP_KW_TYPENAME,
  CPP_KW_UNION,
  CPP_KW_TYPE_UNSIGNED,
  CPP_KW_USING,
  CPP_KW_VIRTUAL,
  CPP_KW_TYPE_VOID,
  CPP_KW_VOLATILE,
  CPP_KW_TYPE_WCHAR_T,
  CPP_KW_WHILE,

  CPP_KW_USER,
};

class cCPPTokenizer: public cTokenizer
{
public:
  cCPPTokenizer();
  ~cCPPTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void LogToken(tToken& token);

protected:
  const char* HandleBlockComment(const char* strLine, bool bSkipComments = false);
  const char* AppendBlockComment(const char* strLine, bool bSkipComments = false);
  const char* HandleLineComment(const char* strLine, bool bSkipComments = false);
  const char* HandleString(const char* strLine, char cDelimiter, int token);
  const char* AppendString(const char* strLine);
  const char* HandlePreProc(const char* strLine);
  const char* AppendPreProc(const char* strLine);
  const char* ParseLiteral(const char* strLine);

private:
  bool m_bBlockComment;
  bool m_bLineComment;
  bool m_bMultiLineString;
  bool m_bConcatPreProc;

  std::string m_strBuffer;
};

enum ePASTokenType
{
  PAS_OP_UNKNOWN = 0,
  PAS_OP_ADDITION,
  PAS_OP_SUBTRACTION,
  PAS_OP_MULTIPLICATION,
  PAS_OP_DIVISION,
  PAS_OP_ASSIGNMENT,
  PAS_OP_EQUAL,
  PAS_OP_NOT_EQUAL,
  PAS_OP_SMALLER,
  PAS_OP_SMALLER_OR_EQUAL,
  PAS_OP_BIGGER,
  PAS_OP_BIGGER_OR_EQUAL,
  PAS_OP_DEREFERENCE,
  PAS_OP_ADDRESS,
  PAS_OP_MEMBER_ACCESS,
  PAS_OP_LIST,
  PAS_OP_COMMAND_SEPARATOR,
  PAS_OP_RANGE,
  PAS_OP_ISTYPE,
  PAS_OP_BRACKET_OPEN,
  PAS_OP_BRACKET_CLOSE,
  PAS_OP_INDEX_OPEN,
  PAS_OP_INDEX_CLOSE,
  PAS_OP_AMPERSAND,
  PAS_OP_MAX,

  PAS_KW_UNKNOWN,
  PAS_KW_TYPE_ANSICHAR,
  PAS_KW_TYPE_ANSISTRING,
  PAS_KW_TYPE_ARRAY,
  PAS_KW_TYPE_BOOLEAN,
  PAS_KW_TYPE_BYTE,
  PAS_KW_TYPE_BYTEBOOL,
  PAS_KW_TYPE_CARDINAL,
  PAS_KW_TYPE_CHAR,
  PAS_KW_TYPE_COMP,
  PAS_KW_TYPE_CURRENCY,
  PAS_KW_TYPE_DOUBLE,
  PAS_KW_TYPE_EXTENDED,
  PAS_KW_TYPE_INT64,
  PAS_KW_TYPE_INTEGER,
  PAS_KW_TYPE_LONGBOOL,
  PAS_KW_TYPE_LONGINT,
  PAS_KW_TYPE_LONGWORD,
  PAS_KW_TYPE_OLEVARIANT,
  PAS_KW_TYPE_POINTER,
  PAS_KW_TYPE_RAWBYTESTRING,
  PAS_KW_TYPE_REAL,
  PAS_KW_TYPE_REAL48,
  PAS_KW_TYPE_RECORD,
  PAS_KW_TYPE_SHORTINT,
  PAS_KW_TYPE_SHORTSTRING,
  PAS_KW_TYPE_SINGLE,
  PAS_KW_TYPE_SMALLINT,
  PAS_KW_TYPE_STRING,
  PAS_KW_TYPE_UINT64,
  PAS_KW_TYPE_UNICODESTRING,
  PAS_KW_TYPE_VARIANT,
  PAS_KW_TYPE_WIDECHAR,
  PAS_KW_TYPE_WIDESTRING,
  PAS_KW_TYPE_WORD,
  PAS_KW_TYPE_WORDBOOL,
  PAS_KW_ABSOLUTE,
  PAS_KW_ABSTRACT,
  PAS_KW_ADD,
  PAS_KW_AND,
  PAS_KW_AS,
  PAS_KW_ASM,
  PAS_KW_ASSEMBLER,
  PAS_KW_AT,
  PAS_KW_AUTOMATED,
  PAS_KW_BEGIN,
  PAS_KW_CASE,
  PAS_KW_CDECL,
  PAS_KW_CLASS,
  PAS_KW_CONST,
  PAS_KW_CONSTRUCTOR,
  PAS_KW_CONTAINS,
  PAS_KW_DEFAULT,
  PAS_KW_DEPRECATED,
  PAS_KW_DESTRUCTOR,
  PAS_KW_DISPID,
  PAS_KW_DISPINTERFACE,
  PAS_KW_DIV,
  PAS_KW_DO,
  PAS_KW_DOWNTO,
  PAS_KW_DYNAMIC,
  PAS_KW_ELSE,
  PAS_KW_END,
  PAS_KW_EXCEPT,
  PAS_KW_EXPORT,
  PAS_KW_EXPORTS,
  PAS_KW_EXTERNAL,
  PAS_KW_FALSE,
  PAS_KW_FILE,
  PAS_KW_FINAL,
  PAS_KW_FINALIZATION,
  PAS_KW_FINALLY,
  PAS_KW_FOR,
  PAS_KW_FORWARD,
  PAS_KW_FUNCTION,
  PAS_KW_GOTO,
  PAS_KW_HELPER,
  PAS_KW_IF,
  PAS_KW_IMPLEMENTATION,
  PAS_KW_IMPLEMENTS,
  PAS_KW_IN,
  PAS_KW_INDEX,
  PAS_KW_INHERITED,
  PAS_KW_INITIALIZATION,
  PAS_KW_INLINE,
  PAS_KW_INTERFACE,
  PAS_KW_IS,
  PAS_KW_LABEL,
  PAS_KW_LIBRARY,
  PAS_KW_LOCAL,
  PAS_KW_MESSAGE,
  PAS_KW_MOD,
  PAS_KW_NAME,
  PAS_KW_NEAR,
  PAS_KW_NIL,
  PAS_KW_NODEFAULT,
  PAS_KW_NOT,
  PAS_KW_OF,
  PAS_KW_ON,
  PAS_KW_OPERATOR,
  PAS_KW_OR,
  PAS_KW_OUT,
  PAS_KW_OVERLOAD,
  PAS_KW_OVERRIDE,
  PAS_KW_PACKAGE,
  PAS_KW_PACKED,
  PAS_KW_PASCAL,
  PAS_KW_PLATFORM,
  PAS_KW_POINTERMATH,
  PAS_KW_PRIVATE,
  PAS_KW_PROCEDURE,
  PAS_KW_PROGRAM,
  PAS_KW_PROPERTY,
  PAS_KW_PROTECTED,
  PAS_KW_PUBLIC,
  PAS_KW_PUBLISHED,
  PAS_KW_RAISE,
  PAS_KW_READ,
  PAS_KW_READONLY,
  PAS_KW_REGISTER,
  PAS_KW_REINTRODUCE,
  PAS_KW_REMOVE,
  PAS_KW_REPEAT,
  PAS_KW_REQUIRES,
  PAS_KW_RESIDENT,
  PAS_KW_RESOURCESTRING,
  PAS_KW_RESULT,
  PAS_KW_SAFECALL,
  PAS_KW_SCOPEDENUMS,
  PAS_KW_SEALED,
  PAS_KW_SET,
  PAS_KW_SHL,
  PAS_KW_SHR,
  PAS_KW_STATIC,
  PAS_KW_STDCALL,
  PAS_KW_STORED,
  PAS_KW_STRICT,
  PAS_KW_THEN,
  PAS_KW_THREADVAR,
  PAS_KW_TO,
  PAS_KW_TRUE,
  PAS_KW_TRY,
  PAS_KW_TYPE,
  PAS_KW_UNIT,
  PAS_KW_UNSAFE,
  PAS_KW_UNTIL,
  PAS_KW_USES,
  PAS_KW_VAR,
  PAS_KW_VARARGS,
  PAS_KW_VIRTUAL,
  PAS_KW_WHILE,
  PAS_KW_WITH,
  PAS_KW_WRITE,
  PAS_KW_WRITEONLY,
  PAS_KW_XOR,

  PAS_KW_USER
};

class cPasTokenizer: public cTokenizer
{
public:
  cPasTokenizer();
  ~cPasTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);

protected:
  const char* HandleBlockComment(const char* strLine, bool bSkipComments);
  const char* AppendBlockComment(const char* strLine, bool bSkipComments);
  const char* HandleString(const char* strLine);

  const char* ParseLiteral(const char* strLine, int nToken);

  int IsKeyword(const char* strLabel);
  void PushKeyword(int nKeyword);

private:
  bool m_bBlockComment;

  std::string m_strBuffer;
};

enum ePHPTokenType
{
  PHP_OP_UNKNOWN = 0,
  PHP_OP_MEMBER_ACCESS,
  PHP_OP_LIST,
  PHP_OP_COMMAND_SEPARATOR,
  PHP_OP_CONDITIONAL,
  PHP_OP_BRACKET_OPEN,
  PHP_OP_BRACKET_CLOSE,
  PHP_OP_INDEX_OPEN,
  PHP_OP_INDEX_CLOSE,
  PHP_OP_MULTIPLICATION,
  PHP_OP_INCREMENT,
  PHP_OP_DIVISION,
  PHP_OP_SUM_ASSIGNMENT,
  PHP_OP_ADDITION,
  PHP_OP_DECREMENT,
  PHP_OP_DIFFERENCE_ASSIGNMENT,
  PHP_OP_SUBTRACTION,
  PHP_OP_MODULUS,
  PHP_OP_MODULUS_ASSIGNMENT,
  PHP_OP_EQUAL,
  PHP_OP_NOT_EQUAL,
  PHP_OP_IDENTICAL,
  PHP_OP_NOT_IDENTICAL,
  PHP_OP_ASSIGNMENT,
  PHP_OP_LOGICAL_NOT,
  PHP_OP_SMALLER_OR_EQUAL,
  PHP_OP_SHIFT_LEFT,
  PHP_OP_SMALLER,
  PHP_OP_SHIFT_LEFT_ASSIGNMENT,
  PHP_OP_BIGGER_OR_EQUAL,
  PHP_OP_SHIFT_RIGHT_ASSIGNMENT,
  PHP_OP_SHIFT_RIGHT,
  PHP_OP_BIGGER,
  PHP_OP_AND_ASSIGNMENT,
  PHP_OP_LOGICAL_AND,
  PHP_OP_AMPERSAND,
  PHP_OP_OR_ASSIGNMENT,
  PHP_OP_LOGICAL_OR,
  PHP_OP_BITWISE_OR,
  PHP_OP_XOR_ASSIGNMENT,
  PHP_OP_BITWISE_XOR,
  PHP_OP_COMPLEMENT,
  PHP_OP_COMPLEMENT_ASSIGNMENT,
  PHP_OP_COLON,
  PHP_OP_SCOPE,
  PHP_OP_PRODUCT_ASSIGNMENT,
  PHP_OP_QUOTIENT_ASSIGNMENT,
  PHP_OP_BACKTICK,
  PHP_OP_CONCATENATION_ASSIGNMENT,
  PHP_OP_POINTER,
  PHP_OP_ASSOCIATION,
  PHP_OP_VARIABLE,
  PHP_OP_HEREDOC,
  PHP_OP_MAX,

  PHP_KW_UNKNOWN,
  PHP_KW_CAST_BOOL,
  PHP_KW_CAST_BOOLEAN,
  PHP_KW_CAST_INT,
  PHP_KW_CAST_INTEGER,
  PHP_KW_CAST_FLOAT,
  PHP_KW_CAST_DOUBLE,
  PHP_KW_CAST_STRING,
  PHP_KW_CAST_ARRAY,
  PHP_KW_CAST_OBJECT,
  PHP_KW_CAST_BINARY,

  PHP_KW_NULL,
  PHP_KW_HALT_COMPILER,
  PHP_KW_ABSTRACT,
  PHP_KW_AND,
  PHP_KW_AS,
  PHP_KW_BREAK,
  PHP_KW_CALLABLE,
  PHP_KW_CASE,
  PHP_KW_CATCH,
  PHP_KW_CLASS,
  PHP_KW_CLONE,
  PHP_KW_CONST,
  PHP_KW_CONTINUE,
  PHP_KW_DECLARE,
  PHP_KW_DEFAULT,
  PHP_KW_DIE,
  PHP_KW_DO,
  PHP_KW_ECHO,
  PHP_KW_ELSE,
  PHP_KW_ELSEIF,
  PHP_KW_EMPTY,
  PHP_KW_ENDDECLARE,
  PHP_KW_ENDFOR,
  PHP_KW_ENDFOREACH,
  PHP_KW_ENDIF,
  PHP_KW_ENDSWITCH,
  PHP_KW_ENDWHILE,
  PHP_KW_EVAL,
  PHP_KW_EXIT,
  PHP_KW_EXTENDS,
  PHP_KW_FINAL,
  PHP_KW_FOR,
  PHP_KW_FOREACH,
  PHP_KW_FUNCTION,
  PHP_KW_GLOBAL,
  PHP_KW_GOTO,
  PHP_KW_IF,
  PHP_KW_IMPLEMENTS,
  PHP_KW_INCLUDE,
  PHP_KW_INCLUDE_ONCE,
  PHP_KW_INSTANCEOF,
  PHP_KW_INSTEADOF,
  PHP_KW_INTERFACE,
  PHP_KW_ISSET,
  PHP_KW_LIST,
  PHP_KW_NAMESPACE,
  PHP_KW_NEW,
  PHP_KW_OR,
  PHP_KW_PRINT,
  PHP_KW_PRIVATE,
  PHP_KW_PROTECTED,
  PHP_KW_PUBLIC,
  PHP_KW_REQUIRE,
  PHP_KW_REQUIRE_ONCE,
  PHP_KW_RETURN,
  PHP_KW_STATIC,
  PHP_KW_SWITCH,
  PHP_KW_THROW,
  PHP_KW_TRAIT,
  PHP_KW_TRY,
  PHP_KW_UNSET,
  PHP_KW_USE,
  PHP_KW_VAR,
  PHP_KW_WHILE,
  PHP_KW_XOR,
  PHP_KW_USER,
};

class cPHPTokenizer: public cTokenizer
{
public:
  cPHPTokenizer();
  ~cPHPTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);

protected:
  const char* HandleBlockComment(const char* strLine, bool bSkipComments = false);
  const char* AppendBlockComment(const char* strLine, bool bSkipComments = false);
  const char* HandleString(const char* strLine, char cDelimiter, int nToken);
  const char* HandleHereDoc(const char* strLine, bool bSkipWhiteSpaces);
  const char* AppendHereDoc(const char* strLine);
  const char* AppendPreProc(const char* strLine);
  const char* AppendString(const char* strLine);
  const char* ParseLiteral(const char* strLine);
  void PushKeyword(int nKeyword);
  int IsKeyword(const char* strLabel);

private:
  bool m_bBlockComment;
  bool m_bHereDocMode;

  std::string m_strBuffer;
  std::string m_strHereDocLabel;
};

enum ePPTokenType
{
  PP_OP_UNKNOWN = 0,
  PP_OP_PREPROC,
  PP_OP_PREPROC_END,
  PP_OP_BRACKET_OPEN,
  PP_OP_BRACKET_CLOSE,
  PP_OP_COMMA,
  PP_OP_ELLIPSIS,
  PP_OP_STRINGIFICATION,
  PP_OP_CONCATENATION,
  PP_OP_ADDITION,
  PP_OP_SUBTRACTION,
  PP_OP_MULTIPLICATION,
  PP_OP_DIVISION,
  PP_OP_MODULUS,
  PP_OP_LOGICAL_AND,
  PP_OP_LOGICAL_OR,
  PP_OP_LOGICAL_NOT,
  PP_OP_BITWISE_AND,
  PP_OP_BITWISE_OR,
  PP_OP_BITWISE_XOR,
  PP_OP_BITWISE_NOT,
  PP_OP_SHL,
  PP_OP_SHR,
  PP_OP_EQUAL,
  PP_OP_NOT_EQUAL,
  PP_OP_SMALLER,
  PP_OP_SMALLER_OR_EQUAL,
  PP_OP_BIGGER,
  PP_OP_BIGGER_OR_EQUAL,
  PP_OP_CONDITIONAL,
  PP_OP_CONDITIONAL_ELSE,
  PP_OP_MAX,

  PP_KW_UNKNOWN,
  PP_KW_NULL,
  PP_KW_INCLUDE,
  PP_KW_INCLUDE_NEXT,
  PP_KW_IMPORT,
  PP_KW_DEFINE,
  PP_KW_UNDEF,
  PP_KW_IFDEF,
  PP_KW_IFNDEF,
  PP_KW_IF,
  PP_KW_DEFINED,
  PP_KW_ELSE,
  PP_KW_ELIF,
  PP_KW_ENDIF,
  PP_KW_ERROR,
  PP_KW_WARNING,
  PP_KW_LINE,
  PP_KW_PRAGMA,
  PP_KW_IDENT,
  PP_KW_SCCS,
  PP_KW_ASSERT,
  PP_KW_UNASSERT,
  PP_KW_USER,
};

class cPPTokenizer: public cTokenizer
{
public:
  cPPTokenizer();
  ~cPPTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void LogToken(tToken& token);
  void Stop(bool bFlag = true);

protected:
  const char* HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces);
  const char* HandleBlockComment(const char* strLine);
  const char* AppendBlockComment(const char* strLine);
  const char* HandleLineComment(const char* strLine);
  const char* HandleString(const char* strLine, char cDelimiter, int token);
  const char* HandleMessage(const char* strLine);
  const char* AppendString(const char* strLine);
  const char* ParseLiteral(const char* strLine);
  const char* ParseLabel(const char* strLine);

  int IsKeyword(const char* strLabel);
  void PushKeyword(int nKeyword);
  bool PushPreProcEnd();
  void PushTokenIfPreProcMode(int nToken, int nType, const char* strText);

private:
  bool m_bBlockComment;
  bool m_bLineComment;
  bool m_bMultiLineString;
  bool m_bPreProcMode;
  bool m_bInclude;
  bool m_bMessage;
  bool m_bPragma;
  bool m_bStop;

  std::string m_strBuffer;
  std::string m_strMessage;
};
class cPreprocessorMacro
{
  public:
    cPreprocessorMacro();
    ~cPreprocessorMacro();

    bool HandleToken(tToken& oToken);
    bool IsReady();
    int GetParamCount();
    const char* GetParam(int nIndex);
    const char* GetName();
    tTokenList& GetMacroText();
    void Debug();

  private:
    enum eMacroState
    {
      eError = -1,
      eInit = 0,
      eName,
      eParam,
      eMacro,
      eReady
    } m_eState;

    std::string m_strName;
    tTokenList m_vParamList;
    tTokenList m_vMacroText;
};
class cLogger
{
public:
  cLogger();
  ~cLogger();

  void Log(const char* strFile, int nLine, const char* strFunction, const char* strEntry, ...);

  static cLogger* GetInstance();

private:
  FILE* m_File;
};
template<class T>
class cTestClassRegistrator
{
public:
  cTestClassRegistrator()
  : pTester(new T)
  {
    cTestSuite::GetTestSuite()->AddTest(pTester);
  }
  ~cTestClassRegistrator()
  {
    delete pTester;
    pTester = 0;
  }
private:
  T* pTester;
};

class ITester
{
public:
  virtual int RunTests() = 0;
  virtual int GetTestCount() = 0;
};

class cTestSuite
{
  public:
    cTestSuite();
    virtual ~cTestSuite();

    void AddTest(ITester* pTester);
    void RunTests();

    static cTestSuite* cTestSuite::GetTestSuite();

  private:
    std::vector<ITester*> m_Tests;
};
const int IGNORE_TOKEN_COUNT = -2;

struct tTestData
{
  const char* m_strCode[128];
  const int m_nExpectedTokens;
  const bool m_bIgnoreWhitespace;
  const char* m_pNameList[128];
  const int m_pTokenList[128];
  const int m_pTokenTypeList[128];
};

class cTestTokenHandler: public ITokenHandler, public ITester
{
public:
  cTestTokenHandler(cTokenizer* pTokenizer, tTestData pTestData[]);
  virtual ~cTestTokenHandler();

  virtual void InitTest(tTestData* pTestData);
  virtual bool Test(tTestData* pTestData);
  virtual int RunTests();

  int GetTestCount(){ return m_nTestCount; }
  void IncTestCount(){ m_nTestCount++; };
  int GetTokenCount(){ return m_nTokenCount; }
  void IncTokenCount(){ m_nTokenCount++; }
  tTestData* GetTestEntry(){ return m_pCurrentTestEntry; }

  bool GetResult(){ return m_bResult; }
  void SetResult(bool bResult){ m_bResult = bResult; }

  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);

private:
  cTokenizer* m_pTokenizer;
  tTestData* m_pCurrentTestEntry;
  tTestData* m_pTestData;

  int m_nTestCount;
  int m_nTokenCount;
  bool m_bResult;
};

typedef std::map<std::string, tTokenList> tParamMap;
typedef std::pair<std::string, tTokenList> tParamMapEntry;

class cMacroResolver
{
public:
  cMacroResolver(cPreprocessorMacro* pMacro);
  ~cMacroResolver();

  bool HandleToken(tToken& oToken);
  bool IsReady();
  bool ExpandMacro(ITokenHandler* pHandler);

protected:
  void FinishParam();
  void InsertParamText(ITokenHandler* pHandler, tTokenList& tokenList);
  bool IsParam(const char* strLabel);
  void CallTokenHandler(ITokenHandler* pHandler, tToken& oToken);

private:
  enum eResolveState
  {
    eError = -1,
    eInit = 0,
    eParam,
    eMacro,
    eReady
  } m_eState;

  cPreprocessorMacro* m_pMacro;
  tParamMap m_Params;
  tParamMap::iterator m_itCurrentParam;
  tTokenList m_Output;
  int m_nBracketDepth;
  int m_nParamIndex;
  bool m_bEllipsis;
};
class IMacroMap
{
public:
  virtual bool IsDefined(const char* strMacro) = 0;
  virtual cPreprocessorMacro* GetMacro(const char* strMacro) = 0;
};

class cPreprocessorExpression: public ITokenHandler
{
public:
  cPreprocessorExpression(IMacroMap* pMacroMap);
  ~cPreprocessorExpression();

  bool HandleToken(tToken& oToken);
  bool IsReady();
  int Evaluate();
  void Negate();

protected:
  int ParseInteger(const char* strLiteral);
  int GetLiteral();
  int GetUnaryExpression();
  int GetFunctionCallExpression();
  int GetParenthesisExpression();
  int GetFactorExpression();
  int GetSummaryExpression();
  int GetShiftExpression();
  int GetComparisonExpression();
  int GetEqualityExpression();
  int GetBitwiseAndExpression();
  int GetBitwiseXorExpression();
  int GetBitwiseOrExpression();
  int GetLogicalAndExpresssion();
  int GetLogicalOrExpression();
  int GetConditionalExpression();
  int GetCommaExpression();

  int GetParenthesizedMacroExpression();

  void ResolveMacro(tToken& oToken);

  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);
  int GetTokenCount();

  void PushToken(tToken& oToken);

private:
  enum eMacroState
  {
    eError = -1,
    eInit = 0,
    eName,
    eParam,
    eMacro,
    eReady
  } m_eState;

  tTokenList m_Expression;
  IMacroMap* m_pMacroMap;
  cMacroResolver* m_pMacroResolver;
  tTokenList::const_iterator m_itCursor;
  bool m_bExpectLabel;
  bool m_bNegateResult;
};
enum ePragmaTokenType
{
  PP_PRAGMA_NULL,
  PP_PRAGMA_ALLOC_TEXT,
  PP_PRAGMA_AUTO_INLINE,
  PP_PRAGMA_BSS_SEG,
  PP_PRAGMA_CHECK_STACK,
  PP_PRAGMA_CODE_SEG,
  PP_PRAGMA_COMMENT,
  PP_PRAGMA_COMPONENT,
  PP_PRAGMA_CONFORM,
  PP_PRAGMA_CONST_SEG,
  PP_PRAGMA_DATA_SEG,
  PP_PRAGMA_DEPRECATED,
  PP_PRAGMA_FUNCTION,
  PP_PRAGMA_HDRSTOP,
  PP_PRAGMA_INCLUDE_ALIAS,
  PP_PRAGMA_INIT_SEG,
  PP_PRAGMA_INLINE_DEPTH,
  PP_PRAGMA_INLINE_RECURSION,
  PP_PRAGMA_INTRINSIC,
  PP_PRAGMA_MANAGED,
  PP_PRAGMA_MESSAGE,
  PP_PRAGMA_ONCE,
  PP_PRAGMA_OPTIMIZE,
  PP_PRAGMA_PACK,
  PP_PRAGMA_POINTERS_TO_MEMBERS,
  PP_PRAGMA_POP_MACRO,
  PP_PRAGMA_PUSH_MACRO,
  PP_PRAGMA_RUNTIME_CHECKS,
  PP_PRAGMA_SECTION,
  PP_PRAGMA_SETLOCALE,
  PP_PRAGMA_UNMANAGED,
  PP_PRAGMA_VTORDISP,
  PP_PRAGMA_WARNING,
  PP_PRAGMA_UNKNOWN
};

class cPragmaHandler: public ITokenHandler
{
public:
  cPragmaHandler();
  ~cPragmaHandler();

  bool HandleToken(tToken& oToken);
  bool IsReady();
  int GetPragma();
  tTokenList& GetParams();

  void HandleError(const char* strError, int iLine){};
  void LogEntry(const char* strLog){};
  int GetTokenCount();
  bool IsKeyword(const char* strLabel);

private:
  enum eMacroState
  {
    eError = -1,
    eInit = 0,
    eName,
    eParam,
    eReady
  } m_eState;

  int m_nKeyword;
  tKeywordMap m_Keywords;
  tTokenList m_vParamList;
};
class ICodeHandler
{
public:
  virtual void HandleCode(char strCode) = 0;
  virtual void HandleCode(const char* strCode) = 0;
};

class cNestingLevel
{
public:
  enum eNestingLevelType
  {
    NLTYPE_NONE,
    NLTYPE_IF,
    NLTYPE_ELSE,
    NLTYPE_INCLUDE,
  };

public:
  cNestingLevel(eNestingLevelType eType = NLTYPE_NONE, bool bOutputAllowed = true);
  cNestingLevel(const cNestingLevel& NestingLevel);
  ~cNestingLevel();

  bool IsOutputAllowed();
  eNestingLevelType GetType();
  void DoElse();

private:
  bool m_bOutputAllowed;
  bool m_bWasTrue;
  eNestingLevelType m_eType;
};

struct tFileInfo
{
  std::string m_strFile;
  int m_iLine;

  tFileInfo()
  : m_strFile()
  , m_iLine(0)
  {
  }

  tFileInfo(std::string strFile, int iLine)
  : m_strFile(strFile)
  , m_iLine(iLine)
  {
  }
};

typedef std::vector<std::string> tIncludeList;
typedef std::map<std::string, cPreprocessorMacro*> tMacroMap;
typedef std::pair<std::string, cPreprocessorMacro*> tMacroMapEntry;
typedef std::stack<cNestingLevel> tConditionStack;
typedef std::stack<tFileInfo> tFileInfoStack;

class cPreProcessor: public ITokenHandler, IMacroMap
{
public:
  cPreProcessor(ICodeHandler* m_pCodeHandler);
  ~cPreProcessor();
  bool HandleToken(tToken& oToken);
  void HandleError(const char* strError, int iLine);

  void LogEntry(const char* strLog);
  int GetTokenCount(){ return 0; }
  void AddStandardInclude(const char* strPath);
  void AddProjectInclude(const char* strPath);
  bool Process(const char* strFile);
  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void Include(const char* strFile);
  cPreprocessorMacro* Define(const char* strMacro, const char* strText = 0);
  bool IsDefined(const char* strMacro);
  void Undef(const char* strMacro);
  void Endif();
  cPreprocessorMacro* GetMacro(const char* strMacro);
  int GetDepth(){return m_ConditionStack.size();}
  void Reset();

protected:
  void OutputCode(char cCode);
  void OutputCode(const char* strCode);
  bool FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath);
  bool FileExists(const char* strFile);
  void HandleMacro(tToken& oToken);
  void ResolveMacro(tToken& oToken);
  void HandleExpression(tToken& oToken);
  void HandlePragma(tToken& oToken);

  void ProcessPragma(cPragmaHandler* pPragmaHandler);

  bool IsOutputAllowed();
  void SetLineMacro(int iLine);
  void SetFileMacro(const char* strFile);

  void LogMacros();

private:
  cPPTokenizer m_Tokenizer;
  tIncludeList m_vStdIncludes;
  tIncludeList m_vPrjIncludes;
  tMacroMap m_MacroMap;

  bool m_bPreProc;
  bool m_bInclude;
  bool m_bUndefNext;
  bool m_bStringify;
  bool m_bLogMessage;

  cPreprocessorMacro* m_pCurrentMacro;
  cMacroResolver* m_pMacroResolver;
  cPreprocessorExpression* m_pExpression;
  cPragmaHandler* m_pPragmaHandler;

  tConditionStack m_ConditionStack;
  tFileInfoStack m_FileInfoStack;
  ICodeHandler* m_pCodeHandler;

  cPreprocessorMacro* m_pLineMacro;
  cPreprocessorMacro* m_pFileMacro;
};

class cCPPCode
: public cCPPTokenizer
, public ICodeHandler
{
public:
  cCPPCode();
  ~cCPPCode();

  void HandleCode(char strCode);
  void HandleCode(const char* strCode);

private:
  std::stringstream m_strLine;
};

cCPPCode::cCPPCode()
{
}

cCPPCode::~cCPPCode()
{
}

void cCPPCode::HandleCode(char strCode)
{
  if (strCode == '\n')
  {

    if (strlen(m_strLine.str().c_str()) > 0)
    {
      std::cout << m_strLine.str().c_str() << std::endl;
      ;
    }
    m_strLine.str(std::string());
  }
  else
  {
    m_strLine << strCode;
  }
}

void cCPPCode::HandleCode(const char* strCode)
{
  m_strLine << strCode;
}
int main(int argc, char* argv[])
{
  cCPPCode cppCode;
  cPreProcessor pp(&cppCode);
  pp.AddStandardInclude("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include");
  pp.AddProjectInclude("D:/Projekte/parseus");
  pp.AddProjectInclude("D:/Projekte/parseus/parseus");
  pp.Define("__cplusplus", "199711L");
  pp.Define("_WIN32");
  pp.Define("WIN32");
  pp.Define("_MSC_VER", "1400");
  pp.Define("_WINDOWS");
  pp.Define("NDEBUG");
  pp.Define("_CRT_MANIFEST_RETAIL");
  pp.Define("CMAKE_INTDIR","Release");

  pp.Process("parser_test.cpp");

}
