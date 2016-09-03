{*******************************************************}
{                                                       }
{       xTool - Component Collection                    }
{                                                       }
{       Copyright (c) 1995 Stefan Böther                }
{                            stefc@fabula.com           }
{*******************************************************}
{
  Please look also for our xTools-Nails function toolkit or other
  components from us.

  xProcs is avialbe for the following languages :
    + Delphi 1.0
    + Delphi 2.0
    + Delphi 3.0
    + C++Builder 1.0
    + Java               (Preview)

  You'll find more information at
     http://www.fabula.com

  Any comments and suggestions are welcome; please send to:
     stefc@fabula.com.

  Look also for a Java Version of xProcs at http://www.javadelphi.com.
  It's the place where a porting tool exists that covers the problem
  how to port Delphi to Java. They use xProcs as a test for doing this
  job.

   21.02.96  added TMonth & TDay type                                Stefc
   22.02.96  added strFileLoad & strFileSave                         Stefc
   09.03.96  correct sysTempPath                                     Stefc
   09.03.96  added regXXXXX functions for access the registry        Stefc
   24.03.96  added IsWinNT constant                                  Stefc
   24.03.96  added SysMetric object                                  Stefc
   26.03.96  added dateQuicken for controling date input with keys   Stefc
   27.03.96  added TDesktopCanvas here                               Stefc
   28.03.96  added LoadDIBitmap                                      Stefc
   01.04.96  added Question function here                            Stefc
   09.04.96  added sysSaverRunning added                             Stefc
   12.04.96  added timeZoneOffset                                    Stefc
   12.04.96  added timeToInt                                         Stefc
   17.04.96  added strCmdLine                                        Stefc
   17.04.96  added rectBounds                                        Stefc
   17.04.96  added TPersistentRect class                             Stefc
   19.04.96  added strDebug method                                   Stefc
   21.04.96  changed TMonth added noneMonth                          km
   21.04.96  added licence callback                                  Stefc
   21.04.96  added strNiceDateDefault                                km
   21.04.96  added simple strEncrpyt & strDecrypt                    Stefc
   24.04.96  backport to 16 bit                                      Stefc
   24.04.96  added Information method                                Stefc
   24.04.96  use win messageBox with Win95 in Question & Information Stefc
   09.05.96  new function ExtractName                                Stefc
   10.05.96  Added TPersistentRegistry                               Stefc
   12.05.96  fileExec                                                Stefc
   14.05.96  New function Confirmation                               Stefc
   16.05.96  New function strChange                                  Stefc
   29.05.96  New functions comXXXXX                                  Stefc
   09.06.96  New function strSearchReplace                           km
   09.06.96  ported assembler strHash to plain pascal                Stefc
   15.06.96  new variables xLanguage & xLangOfs                      Stefc
   28.06.96  new method sysBeep                                      Stefc
   28.06.96  new method intPercent                                   Stefc
   10.07.96  make compatible with 16 Bit Delphi 1.0                  Stefc
   14.07.96  fileLongName & fileShortName defined                    Stefc
   15.07.96  Correct sysTempPath method                              Stefc
   21.07.96  New functions strContains & strContainsU                Stefc
   28.07.96  comIsCServe also check for xxx@compuServe.com           Stefc
   31.07.96  added strCapitalize after idea from Fred N. Read        Stefc
   04.08.96  strByteSize() now can also display Bytes                Stefc
   05.08.96  added regWriteShellExt()                                Stefc
   06.08.96  added sysColorDepth()                                   Stefc
   07.08.96  added strSoundex()                                      Stefc
   09.08.96  fixe some bugs in fileShellXXXX                         Stefc
   26.08.96  Added registry functions from David W. Yutzy            Stefc
   29.08.96  fileShellXXX now also aviable under 16 Bit              Stefc
   05.09.96  Added regDelValue                                       Stefc
   13.09.96  Added fltNegativ and fltPositiv                         Stefc
   29.09.96  Added strTokenToStrings & strTokenFromStrings           Stefc
   09.10.96  Added variant function                                  Stefc
   29.10.96  intPrime now can be used for negative numbers           Stefc
   29.10.96  fltEqualZero now returns true with FLTZERO              Stefc
   29.10.96  fltCalc now use Float for greater precision             Stefc
   29.10.96  correct strTokenCount                                   Stefc
   19.11.96  better Windows NT detecting                             Stefc
   28.11.96  correct above text (thanks to Clay Kollenborn-Shannon)  Stefc
   12.01.97  added fileCopy function                                 Stefc
   13.01.97  correct strProfile now it works also for 16-Bit         Stefc
   13.01.97  get English Quicken keys from George Boomer             Stefc
   14.01.97  make key in dateQuicken var to reset if on date change  Stefc
   17.01.97  New functions strPos and strChangeU                     Stefc
   19.01.97  new function fileTypeName after idea of P.Aschenbacher  Stefc
   19.01.97  new function fileRedirectExec                           Stefc
   01.02.97  new functions strEmpty & strBetween                     Stefc
   01.02.97  new function fileDate                                   Stefc
   11.02.97  bugfix by Ron Lambkin in dateBeginOfQuarter             Stefc
   18.02.97  new function htmlStrToColor                             km
   23.03.97  new functions htmlTagReadString & htmlTagReadInteger    km
   23.04.97  make xProcs Delphi 3.0 compatible                       Stefc
   24.04.97  new functions strWildcard & strMatch                    Stefc
   24.04.97  new functions fileProgramPath & fileProgramExt          Stefc
   07.05.97  Added strStripHtmlTags                                  Stefc
   07.05.97  Added strStripHtmlTags                                  Stefc
   24.06.97  correct IsWin95                                         Stefc
   04.08.97  new functions fileWindowsPath & fileSystemPath          Stefc
   13.08.97  new functions came from John Etheridge                  Stefc
   19.08.97  strToken function now can handle more seperators        Siegfried Penke
   05.11.97  change strFileLoad & strFileSave                        Stefc
   19-11-98  change StrDelSlash to accept empty string as parameter  HB
   TBlobStream
}

unit xProcs;

{$D+}

interface
{$IFDEF VER260} // Delphi XE5 UP
  {$DEFINE VER_XE5_UP}
{$ENDIF}
{$IFDEF VER290} // Delphi XE8 UP
  {$DEFINE VER_XE5_UP}
{$ENDIF}

// {.$DEFINE German}
// {.$DEFINE English}

uses
   {$IFDEF Win32}
   Windows, Registry,
   {$ELSE}
   WinTypes, WinProcs,
   {$ENDIF}
   ShellAPI, Messages, Classes, Graphics,variants,sysutils;

type
   Float = Extended; { our type for float arithmetic }

   {$IFDEF Win32} { our type for integer functions, Int_ is ever 32 bit }
   Int_ = Integer;
   {$ELSE}
   Int_ = Longint;
   {$ENDIF}

const
   XCOMPANY = 'Fabula Software';

const
   { several important ASCII codes }
   //Null                = #0;
   BACKSPACE             = #8;
   TAB                   = #9;
   LF                    = #10;
   CR                    = #13;
   EOF_                  = #26;                                         { 30.07.96 sb }
   ESC                   = #27;
   BLANK                 = #32;
   Space                 = BLANK;
   CRLF                  = CR + LF;

   { digits as chars }
   ZERO                  = '0';
   ONE                   = '1';
   TWO                   = '2';
   THREE                 = '3';
   FOUR                  = '4';
   FIVE                  = '5';
   SIX                   = '6';
   SEVEN                 = '7';
   EIGHT                 = '8';
   NINE                  = '9';

   { special codes }
   SLASH                 = '\';                                         { used in filenames }
   HEX_PREFIX            = '$';                                         { prefix for hexnumbers }

   { common computer sizes }
   KBYTE                 = Sizeof(Byte) shl 10;
   MBYTE                 = KBYTE shl 10;
   GBYTE                 = MBYTE shl 10;

   { 13.08.97 }
   BITS_PER_BYTE         = 8;
   BYTE_BIT_COUNT        = Sizeof(Byte) * BITS_PER_BYTE;
   WORD_BIT_COUNT        = Sizeof(Word) * BITS_PER_BYTE;
   LONGINT_BIT_COUNT     = Sizeof(Longint) * BITS_PER_BYTE;
   INTEGER_BIT_COUNT     = Sizeof(Integer) * BITS_PER_BYTE;


   { Low floating point value }
   FLTZERO: Float        = 0.00000001;

   Digits: set of AnsiChar   = [ZERO..NINE];

   { important registry keys / items }
   REG_CURRENT_VERSION   = 'Software\Microsoft\Windows\CurrentVersion';
   REG_CURRENT_USER      = 'RegisteredOwner';
   REG_CURRENT_COMPANY   = 'RegisteredOrganization';

   PRIME_16              = 65521;
   PRIME_32              = 2147483647;

   MINSHORTINT           = -128;                                        { 1.8.96 sb }
   MAXSHORTINT           = 127;
   MINBYTE               = 0;
   MAXBYTE               = 255;
   MINWORD               = 0;
   MAXWORD               = 65535;

   CsOpenOffice = 0;
   CsLibreOffice = 1;
   CsMsOffice = 2;

   CsTypeValueNumeric = 0;
   CsTypeValueString = 1;

type
   TMonth = (NoneMonth, January, February, March, April, May, June, July,
      August, September, October, November, December);

   TDayOfWeek = (Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday);

   { Online eMail Service Provider }
   TMailProvider = (mpCServe, mpInternet, mpNone);

   TLicCallback = function (var Code: Integer): Integer;

   TBit = 0..31;

   { Search and Replace options }
   TSROption = (srWord, srCase, srAll);
   TSROptions = set of TSROption;

   { Data types }
   TDataType = (dtInteger, dtBoolean, dtString, dtDate, dtTime,
      dtFloat, dtCurrency);

   TScreenColor = (scUnknown, scMonoChrome, sc16Color, sc256Color,
      scHiColor, scTrueColor);

var
   IsWin95,IsWinNT,isWin7: Boolean;
   IsFabula  : TLicCallback;
   xLanguage : Integer;
   xLangOfs  : Integer;


{$ifndef VER_XE5_UP}
function CharInSet(C: AnsiChar; const CharSet: TSysCharSet): Boolean; inline;
{$endif}

function IntToAnsiStr(X: Integer; Width: Integer = 0): AnsiString;
function AnsiChr(X: Integer): AnsiChar;

   { bit manipulating }
function bitSet(const Value: Int_; const TheBit: TBit): Boolean;
function bitOn(const Value: Int_; const TheBit: TBit): Int_;
function bitOff(const Value: Int_; const TheBit: TBit): Int_;
function bitToggle(const Value: Int_; const TheBit: TBit): Int_;

{ String functions }
function strHash(const S: string; LastBucket: Int_): Int_;
function strCut(const S: string; len: Integer): string;
function strTrim(const S: string): string;overload;
function strTrimA(const S: string): string;
function strTrimChA(const S: string; C: Char): string;
function strTrimChL(const S: string; C: Char): string; overload;
function strTrimChR(const S: string; C: Char): string; overload;
function strLeft(const S: string; len: Integer): string; overload;
function StrLower(const S: string): string; overload;
function strMake(C: Char; len: Integer): string; Overload;
function strPadChL(const S: string; C: Char; len: Integer): string; overload;
function strPadChR(const S: string; C: Char; len: Integer): string;
function strPadChC(const S: string; C: Char; len: Integer): string;
function strPadL(const S: string; len: Integer): string;
function strPadR(const S: string; len: Integer): string;
function strPadC(const S: string; len: Integer): string;
function strPadZeroL(const S: string; len: Integer): string;
function StrPos(const aSubstr, S: string; aOfs: Integer): Integer;
procedure strChange(var S: string; const Src, Dest: string);
function strChangeU(const S, Source, Dest: string): string;
function strRight(const S: string; len: Integer): string;
function strAddSlash(const S: string): string;
function strDelSlash(const S: string): string;
function strSpace(len: Integer): string;
function strToken(var S: string; SEPARATOR: string): string; overload;
function strTokenCount(S: string; SEPARATOR: string): Integer;
function strTokenAt(const S: string; SEPARATOR: string; at: Integer; IgnoreDuplicatedSEPARATOR : boolean = false): string;
procedure strTokenToStrings(S: string; SEPARATOR: string; List: TStrings);
function strTokenFromStrings(Seperator: Char; List: TStrings): string;

function StrUpper(const S: string): string; overload;
function strOemAnsi(const S: string): string; overload;
function strAnsiOem(const S: string): string; overload;
function strEqual(const S1, S2: string): Boolean;
function StrComp(const S1, S2: string): Boolean;
function strCompU(const S1, S2: string): Boolean;
function strContains(const S1, S2: string): Boolean;
function strContainsU(const S1, S2: string): Boolean;

{$ifdef VER_XE5_UP}
function strTrim(const S: Ansistring): Ansistring; overload;
function strTrimChL(const S: ansistring; C: AnsiChar): ansistring; overload;
function strPadChL(const S: AnsiString; C: AnsiChar; len: Integer): Ansistring; overload;
function strLeft(const S: Ansistring; len: Integer): Ansistring; overload;
function strMake(C: AnsiChar; len: Integer): AnsiString; overload;
function strOemAnsi(const S: ansistring): Ansistring; overload;
function strAnsiOem(const S: Ansistring): Ansistring; overload;
function strTrimChR(const S: Ansistring; C: AnsiChar): ansistring; overload;
function strToken(var S: Ansistring; SEPARATOR: Ansistring): Ansistring; overload;
function StrUpper(const S: Ansistring): Ansistring; overload;
function StrLower(const S: Ansistring): Ansistring; overload;
function strEmpty(const S: Ansistring): Boolean; overload;
{$endif}

{function strNiceNum(const S: string): string;
function strNiceDateDefault(const S, default: string): string;
function strNiceDate(const S: string): string;
function strNiceTime(const S: string): string;
function strNicePhone(const S: string): string;
}function strReplace(const S: string; C: Char; const Replace: string): string;
function strCmdLine: string;
function strEncrypt(const S: string; KEY: Word): string;
function strDecrypt(const S: string; KEY: Word): string;
function strLastCh(const S: string): Char;
procedure strStripLast(var S: string);
function strByteSize(Value: Longint): string;
function strSoundex(S: string): string;
procedure strSearchReplace(var S: string; const Source, Dest: string; Options: TSROptions);
function strProfile(const afile, aSection, aEntry, ADefault: string): string;
function strCapitalize(const S: string): string; { 31.07.96 sb }
function strBetween(const S, sLeft, sRight: string): string; { 1.2.96 sb }
function strEmpty(const S: string): Boolean; overload; { 1.2.96 }
function strWildcard(const S: string): Boolean; { 23.4.97 sb }
function strMatch(const aText, aPattern: string): Boolean; { 23.4.97 sb }
function strStripHtmlTags(S: string): string; { 7.5.97 sb }

{$IFDEF Win32}
procedure strDebug(const S: string);
function strFileLoad(const afile: string): string;
procedure strFileSave(const afile, AString: string);
{$ENDIF}

{ Integer functions }
function intCenter(A, B: Int_): Int_;
function intMax(A, B: Int_): Int_;
function intMin(A, B: Int_): Int_;
function intPow(Base, Expo: Integer): Int_;
function intPow10(Exponent: Integer): Int_;
function intSign(A: Int_): Integer;
function intZero(A: Int_; len: Integer): string;
function intPrime(Value: Integer): Boolean;
function intPercent(A, B: Int_): Int_;
{$IFDEF Win32}
function intToNumber(Value: Int_): string; { 13.08.97 }
{$ENDIF}


{ Floatingpoint functions }
function fltAdd(P1, P2: Float; Decimals: Integer): Float;
function fltDiv(P1, P2: Float; Decimals: Integer): Float;
function fltEqual(P1, P2: Float; Decimals: Integer): Boolean;
function fltEqualZero(P: Float): Boolean;
function fltGreaterZero(P: Float): Boolean;
function fltLessZero(P: Float): Boolean;
function fltNeg(P: Float; Negate: Boolean): Float;
function fltMul(P1, P2: Float; Decimals: Integer): Float;
function fltRound(P: Float; Decimals: Integer): Float;
function fltSub(P1, P2: Float; Decimals: Integer): Float;
function fltUnEqualZero(P: Float): Boolean;
function fltCalc(const Expr: string): Float;
function fltPower(A, N: Float): Float;
function fltPositiv(Value: Float): Float;
function fltNegativ(Value: Float): Float;

{ Rectangle functions from Golden Software }
function rectHeight(const R: TRect): Integer;
function rectWidth(const R: TRect): Integer;
procedure rectGrow(var R: TRect; Delta: Integer);
procedure rectRelativeMove(var R: TRect; Dx, dy: Integer);
procedure rectMoveTo(var R: TRect; X, Y: Integer);
function rectSet(Left, Top, Right, Bottom: Integer): TRect;
function rectInclude(const R1, R2: TRect): Boolean;
function rectPoint(const R: TRect; P: TPoint): Boolean;
function rectSetPoint(const TopLeft, BottomRight: TPoint): TRect;
function rectIntersection(const R1, R2: TRect): TRect;
function rectIsIntersection(const R1, R2: TRect): Boolean;
function rectIsValid(const R: TRect): Boolean;
function rectsAreValid(const Arr: array of TRect): Boolean;
function rectNull: TRect;
function rectIsNull(const R: TRect): Boolean;
function rectIsSquare(const R: TRect): Boolean;
function rectCentralPoint(const R: TRect): TPoint;
function rectBounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;

{$IFDEF Win32}
{ Variant functions }
function varIIF(aTest: Boolean; TrueValue, FalseValue: Variant): Variant;
procedure varDebug(const V: Variant);
function VarToStr(const V: Variant): string;
{$ENDIF}

{ date functions }
function dateYear(D: TDateTime): Integer;
function dateMonth(D: TDateTime): Integer;
function dateDay(D: TDateTime): Integer;
function dateBeginOfYear(D: TDateTime): TDateTime;
function dateEndOfYear(D: TDateTime): TDateTime;
function dateBeginOfMonth(D: TDateTime): TDateTime;
function dateEndOfMonth(D: TDateTime): TDateTime;
function dateWeekOfYear(D: TDateTime): Integer;
function dateDayOfYear(D: TDateTime): Integer;
function dateDayOfWeek(D: TDateTime): TDayOfWeek;
function dateLeapYear(D: TDateTime): Boolean;
function dateBeginOfQuarter(D: TDateTime): TDateTime;
function dateEndOfQuarter(D: TDateTime): TDateTime;
function dateBeginOfWeek(D: TDateTime; Weekday: Integer): TDateTime;
function dateDaysInMonth(D: TDateTime): Integer;
function dateQuicken(D: TDateTime; var KEY: Char): TDateTime;
{function  dateDiff(D1,D2: TDateTime): Integer;}

{ time functions }
function timeHour(T: TDateTime): Integer;
function timeMin(T: TDateTime): Integer;
function timeSec(T: TDateTime): Integer;
function timeToInt(T: TDateTime): Integer;

{$IFDEF Win32}
function timeZoneOffset: Integer;
{$ENDIF}

{ com Functions }
{function comIsCis(const S: string): Boolean;
function comIsInt(const S: string): Boolean;
function comCisToInt(const S: string): string;
function comIntToCis(const S: string): string;
function comFaxToCis(const S: string): string;
function comNormFax(const name, Fax: string): string;
function comNormPhone(const Phone: string): string;
function comNormInt(const name, Int: string): string;
function comNormCis(const name, CIS: string): string;
}
{ file functions }
procedure fileShredder(const Filename: string);
procedure FileDateSet(const Filename: string; aDate: TDateTime);
function fileSize(const Filename: string): Longint;
function fileWildcard(const Filename: string): Boolean;
function fileShellOpen(const afile: string): Boolean;
function fileShellPrint(const afile: string): Boolean;
function fileCopy(const SourceFile, TargetFile: string): Boolean;
function FileDate(const afile: string): TDateTime;
function fileProgramPath: string;
function fileProgramExt(aExt: string): string;
function fileWindowsPath: string;
function fileSystemPath: string;
function fileExec(const aCmdLine: string; aHide, aWait: Boolean): Boolean;
// HB 2016-03-05 : to allow the executable to be on the local machine
function setfileProgramPath(Path:string): string;

{$IFDEF Win32}
function fileTemp(const aExt: string): string;
function fileRedirectExec(const aCmdLine: string; Strings: TStrings): Boolean;
function fileLongName(const afile: string): string;
function fileShortName(const afile: string): string;
function fileTypeName(const afile: string): string;
{$ENDIF}

function ExtractName(const Filename: string): string;

{ system functions }
function sysTempPath: string;
procedure sysDelay(aMs: Cardinal);
procedure sysHardDelay(aMs: Cardinal); { 13.07.97 }
procedure sysBeep;
function sysColorDepth: Integer; { 06.08.96 sb }
function sysScreenColor: TScreenColor; { 13.08.97 }

{$IFDEF Win32}
procedure sysSaverRunning(Active: Boolean);
{$ENDIF}

{ registry functions }

{$IFDEF Win32}
function regReadString(aKey: HKEY; const Path: string): string;
procedure regWriteString(aKey: HKEY; const Path, Value: string);
procedure regDelValue(aKey: HKEY; const Path: string);
function regInfoString(const Value: string): string;
function regCurrentUser: string;
function regCurrentCompany: string;
procedure regWriteShellExt(const aExt, aCmd, aMenu, aExec: string);

{ The following five functions came from David W. Yutzy / Celeste Software Services
  Thanks for submitting us the methods !!
}
procedure regKeyList(aKey: HKEY; const Path: string; var aValue: TStringList);
function regValueExist(aKey: HKEY; const Path: string): Boolean;
function regWriteValue(aKey: HKEY; const Path: string; Value: Variant; Typ: TDataType): Boolean;
function regReadValue(aKey: HKEY; const Path: string; Typ: TDataType): Variant;
procedure regValueList(aKey: HKEY; const Path: string; var aValue: TStringList);
{$ENDIF}

{ html / internet functions }
function htmlTagReadString(const aPara, aText, ADefault: string): string;
function htmlTagReadInteger(const aPara, aText: string; ADefault: Integer): Integer;
function htmlStrToColor(S: string): tColor;

{ several functions }
function Question(const aMsg: string): Boolean;
procedure INFORMATION(const aMsg: string);
function Confirmation(const aMsg: string): Word;


{ other stuff }
function ptrToStr(const Value: Pointer): string;
function objToStr(const Value: TObject): string;
function colorPercent(aColor: tColor; aBy: Float): tColor;

{ fonctions CAC }
function IsNumeric(S: string): Boolean;
function FormatValueForTableur(TypeSuiteOffice : integer; ValStr: string; TypeValue: integer): string;
//Renvoi la valeur formatté en fonction du type de donnée utilisé

type
   { TRect that can be used persistent as property for components }
   TUnitConvertEvent = function (Sender: TObject;
      Value: Integer; Get: Boolean): Integer of object;
   
   TPersistentRect = class(TPersistent)
   private
      FRect: TRect;
      FOnConvert: TUnitConvertEvent;
      procedure SetLeft(Value: Integer);
      procedure SetTop(Value: Integer);
      procedure SetHeight(Value: Integer);
      procedure SetWidth(Value: Integer);
      function GetLeft: Integer;
      function GetTop: Integer;
      function GetHeight: Integer;
      function GetWidth: Integer;
   public
      constructor Create;
      procedure Assign(Source: TPersistent); override;
      property Rect: TRect read FRect;
      property OnConvert: TUnitConvertEvent read FOnConvert write FOnConvert;
   published
      property Left: Integer read GetLeft write SetLeft;
      property Top: Integer read GetTop write SetTop;
      property Height: Integer read GetHeight write SetHeight;
      property Width: Integer read GetWidth write SetWidth;
   end;

   {$IFDEF Win32}
   { Persistent access of components from the registry }
   TPersistentRegistry = class(tRegistry)
   public
      function ReadComponent(const name: string; Owner, Parent: TComponent): TComponent;
      procedure WriteComponent(const name: string; Component: TComponent);
   end;
   {$ENDIF}
      
     { easy access of the system metrics }
   TSystemMetric = class
   private
      FColorDepth,
         FMenuHeight,
         FCaptionHeight: Integer;
      FBorder,
         FFrame,
         FDlgFrame,
         FBitmap,
         FHScroll,
         FVScroll,
         FThumb,
         FFullScreen,
         FMin,
         FMinTrack,
         FCursor,
         fIcon,
         FDoubleClick,
         FIconSpacing: TPoint;
   protected
      constructor Create;
      procedure Update;
   public
      property MenuHeight: Integer read FMenuHeight;
      property CaptionHeight: Integer read FCaptionHeight;
      property Border: TPoint read FBorder;
      property Frame: TPoint read FFrame;
      property DlgFrame: TPoint read FDlgFrame;
      property Bitmap: TPoint read FBitmap;
      property HSCROLL: TPoint read FHScroll;
      property VScroll: TPoint read FVScroll;
      property Thumb: TPoint read FThumb;
      property FullScreen: TPoint read FFullScreen;
      property Min: TPoint read FMin;
      property MinTrack: TPoint read FMinTrack;
      property Cursor: TPoint read FCursor;
      property ICON: TPoint read fIcon;
      property DoubleClick: TPoint read FDoubleClick;
      property IconSpacing: TPoint read FIconSpacing;
      property ColorDepth: Integer read FColorDepth;
   end;

var
   SysMetric: TSystemMetric;

type
   TDesktopCanvas = class(TCanvas)
   private
      DC: HDC;
   public
      constructor Create;
      destructor Destroy; override;
   end;

implementation

uses
   Controls, Forms, Consts, Dialogs,iniFiles{$ifdef VER_XE5_UP},System.IOUtils,System.Types {$endif};

var
   CurrentFileProgramPath : string;

// XE5 Compatibility


{$ifndef VER_XE5_UP}
function CharInSet(C: AnsiChar; const CharSet: TSysCharSet): Boolean;
begin
  Result := C in CharSet;
end;
{$endif}

function IntToAnsiStr(X: Integer; Width: Integer = 0): AnsiString;
begin
   Str(X: Width, Result);
end;

function ansiChr(x:Integer) : AnsiChar;
begin
  result:=AnsiChar(chr(x));
end;
{ bit manipulating }
function bitSet(const Value: Int_; const TheBit: TBit): Boolean;
begin
   Result := (Value and (1 shl TheBit)) <> 0;
end;

function bitOn(const Value: Int_; const TheBit: TBit): Int_;
begin
   Result := Value or (1 shl TheBit);
end;

function bitOff(const Value: Int_; const TheBit: TBit): Int_;
begin
   Result := Value and ((1 shl TheBit) xor $FFFFFFFF);
end;

function bitToggle(const Value: Int_; const TheBit: TBit): Int_;
begin
   Result := Value xor (1 shl TheBit);
end;

{ string methods }

function strHash(const S: string; LastBucket: Int_): Int_;
var
   I: Integer;
begin
   Result := 0;
   for I := 1 to Length(S) do
      Result := ((Result shl 3) xor Ord(S[I])) mod LastBucket;
end;

function strTrim(const S: string): string; overload;
begin
   Result := strTrimChR(strTrimChL(S, BLANK), BLANK);
end;

function strTrimA(const S: string): string;
begin
   Result := strTrimChA(S, BLANK);
end;

function strTrimChA(const S: string; C: Char): string;
var
   I: Word;
begin
   Result := S;
   for I := Length(Result) downto 1 do
      if Result[I] = C then Delete(Result, I, 1);
end;

function strTrimChL(const S: string; C: Char): string; overload;
begin
   Result := S;
   while (Length(Result) > 0) and (Result[1] = C) do Delete(Result, 1, 1);
end;

function strTrimChR(const S: string; C: Char): string; overload;
begin
   Result := S;
   while (Length(Result) > 0) and (Result[Length(Result)] = C) do
      Delete(Result, Length(Result), 1);
end;

function strLeft(const S: string; len: Integer): string; overload;
begin
   Result := Copy(S, 1, len);
end;

function StrLower(const S: string): string;
begin
   Result := AnsiLowerCase(S);
end;

function strMake(C: Char; len: Integer): string; overload;
begin
   Result := strPadChL('', C, len);
end;

function strPadChL(const S: string; C: Char; len: Integer): string; overload;
begin
   Result := S;
   while Length(Result) < len do Result := C + Result;
end;

function strPadChR(const S: string; C: Char; len: Integer): string;
begin
   Result := S;
   while Length(Result) < len do Result := Result + C;
end;

function strPadChC(const S: string; C: Char; len: Integer): string;
begin
   Result := S;
   while Length(Result) < len do
   begin
      Result := Result + C;
      if Length(Result) < len then Result := C + Result;
   end;
end;

function strPadL(const S: string; len: Integer): string;
begin
   Result := strPadChL(S, BLANK, len);
end;

function strPadC(const S: string; len: Integer): string;
begin
   Result := strPadChC(S, BLANK, len);
end;


function strPadR(const S: string; len: Integer): string;
begin
   Result := strPadChR(S, BLANK, len);
end;

function strPadZeroL(const S: string; len: Integer): string;
begin
   Result := strPadChL(strTrim(S), ZERO, len);
end;

function strCut(const S: string; len: Integer): string;
begin
   Result := strLeft(strPadR(S, len), len);
end;

function strRight(const S: string; len: Integer): string;
begin
   if len >= Length(S) then
      Result := S
   else
      Result := Copy(S, Succ(Length(S)) - len, len);
end;

function strAddSlash(const S: string): string;
begin
   Result := S;
   if Result <> '' then
      if strLastCh(Result) <> SLASH then Result := Result + SLASH;
end;

function strDelSlash(const S: string): string;
begin
   Result := S;
   if Result <> '' then // HB le 19-11-1998
      if strLastCh(Result) = SLASH then Delete(Result, Length(Result), 1);
end;

function strSpace(len: Integer): string;
begin
   Result := strMake(BLANK, len);
end;

{ return the position of first found chars from I in S }
function CharsInString(S1, S2: string): Integer; overload;
var
   J, I: Integer;
begin
   Result := 0;
   for I := 1 to Length(S1) do
      for J := 1 to Length(S2) do
         if S1[I] = S2[J] then
         begin
            Result := I;
            exit;
         end;
end;

function strToken(var S: string; SEPARATOR: string): string; overload;
var
   I: Word;
begin
   I := CharsInString(S, SEPARATOR);

   if I <> 0 then
   begin
      if Length(S) = I then { letztes Wort...}
      begin
         Result := System.Copy(S, 1, I);
         if Pos(Result[Length(Result)], SEPARATOR) <> 0 then
            System.Delete(Result, Length(Result), 1);
      end else
         Result := System.Copy(S, 1, I - 1);
      System.Delete(S, 1, I);
   end else
   begin
      Result := S;
      S := '';
   end;
end;

function strTokenCount(S: string; SEPARATOR: string): Integer;
begin
   Result := 0;
   while S <> '' do
   begin { 29.10.96 sb }
      strToken(S, SEPARATOR);
      Inc(Result);
   end;
end;

function strTokenAt(const S: string; SEPARATOR: string; at: Integer; IgnoreDuplicatedSEPARATOR: boolean = false): string;
var
   J, I: Integer;
   isToken : boolean;
begin
   isToken := false;
   Result := '';
   J := 1;
   I := 0;

   while (I <= at) and (J <= Length(S)) do
   begin
      if Pos(S[J], SEPARATOR) <> 0 then
      begin
         if IgnoreDuplicatedSEPARATOR then
         begin
            if isToken then inc(I);
         end
         else
         begin
            Inc(I);
         end;
         isToken := false;
      end
      else
      begin
         if I = at then Result := Result + S[J];
         isToken := true;
      end;
      Inc(J);
   end;
end;

procedure strTokenToStrings(S: string; SEPARATOR: string; List: TStrings);
var
   Token      : string;
   loop, Count: Word;
begin
   List.Clear;
   Count := strTokenCount(S, SEPARATOR);
   if Count <> 0 then
      for loop := 0 to Count - 1 do
      begin
         Token := strTokenAt(S, SEPARATOR, loop);
         //if Token <> '' then
            List.Add(Token);
      end;
end;

function strTokenFromStrings(Seperator: Char; List: TStrings): string;
var
   I: Integer;
begin
   Result := '';
   for I := 0 to List.Count - 1 do
      if Result <> '' then
         Result := Result + Seperator + List[I]
      else
         Result := List[I];
end;

function StrUpper(const S: string): string; overload;
begin
   Result := AnsiUpperCase(S);
end;

function strOemAnsi(const S: string): string; Overload;
begin
	if length(s) >0 then
	begin
	{$IFDEF Win32}
	SetLength(Result, Length(S));
	{$ELSE}
	Result[0] := Chr(Length(S));
	{$ENDIF}
	OemToAnsiBuff(@S[1], @Result[1], Length(S));
	end
	else result:='';

end;


function strAnsiOem(const S: string): string; overload;
begin
	if length(s) >0 then
	begin
	{$IFDEF Win32}
	SetLength(Result, Length(S));
	{$ELSE}
	Result[0] := Chr(Length(S));
	{$ENDIF}
	AnsiToOemBuff(@S[1], @Result[1], Length(S));
	end
	else result:='';
end;


function strEqual(const S1, S2: string): Boolean;
begin
   Result := AnsiCompareText(S1, S2) = 0;
end;

function strCompU(const S1, S2: string): Boolean;
begin
   Result := strEqual(strLeft(S2, Length(S1)), S1);
end;

function StrComp(const S1, S2: string): Boolean;
begin
   Result := strLeft(S2, Length(S1)) = S1;
end;

function strContains(const S1, S2: string): Boolean;
begin
   Result := Pos(S1, S2) > 0;
end;

function strContainsU(const S1, S2: string): Boolean;
begin
   Result := strContains(StrUpper(S1), StrUpper(S2));
end;
{
function strNiceNum(const S: string): string;
var
   I   : Integer;    
   Seps: set of AnsiChar;
begin
   Seps := [FormatSettings.ThousandSeparator, FormatSettings.DecimalSeparator];
   Result := ZERO;
   for I := 1 to Length(S) do
      if CharInSet(S[I] ,Digits + Seps) then
      begin
         if S[I] = FormatSettings.ThousandSeparator then
            Result := Result + FormatSettings.DecimalSeparator
         else
            Result := Result + S[I];
         if CharInSet(S[I] ,Seps) then Seps := [];
      end
end;

{
function strNiceDate(const S: string): string;
begin
   Result := strNiceDateDefault(S, DateToStr(Date));
end;

function strNiceDateDefault(const S, default: string): string;
   (* sinn der Procedure:
   Irgendeinen String übergeben und in ein leidlich brauchbares Datum verwandeln.
   Im Wesentlichen zum Abfangen des Kommazeichens auf dem Zehnerfeld.
   eingabe 10 = Rückgabe 10 des Laufenden Monats
   eingabe 10.12 = Rückgabe des 10.12. des laufenden Jahres.
   eingabe 10.12.96 = Rückgabe des Strings
   eingabe 10,12,96 = Rückgabe 10.12.95 (wird dann won STRtoDATE() gefressen)
   Eine Plausbilitätskontrolle des Datums findet nicht Statt.
   Geplante Erweiterung:
   eingabe: +14  = Rückgabe 14 Tage Weiter
   eingabe: +3m  = Rückgabe 3 Monate ab Heute
   eingabe: +3w  = Rückgabe 3 Wochen (3*7 Tage) ab Heute
   Das gleiche auch Rückwärts mit  Minuszeichen
   eingabe: e oder E oder f  = Nächster Erster
   eingabe: e+1m Erster des übernächsten Monats
   Da läßt sich aber noch trefflich weiterspinnen
    *)
var
   A    : array[0..2] of string[4];
   heute: string;                  
   I, J : Integer;                 
begin
   A[0] := '';
   A[1] := '';
   A[2] := '';
   heute := default;
   
   J := 0;
   for I := 0 to Length(S) do
      if CharInSet(S[I] ,Digits) then
         A[J] := A[J] + S[I]
      else if CharInSet(S[I] ,[',', '.', ':', FormatSettings.DateSeparator]) then Inc(J); (* Changed KM 17.4.97 *)
   for I := 0 to 2 do
      if Length(A[I]) = 0 then
         if I = 2 then
            A[I] := Copy(heute, I * 3 + 1, 4)
         else
            A[I] := Copy(heute, I * 3 + 1, 2)
      else
         if Length(A[I]) = 1 then
            A[I] := '0' + A[I];

   Result := A[0] + FormatSettings.DateSeparator + A[1] + FormatSettings.DateSeparator + A[2];
   try
      StrToDate(Result);
   except
      Result := DateToStr(Date);
   end;
end;

function strNiceTime(const S: string): string;
var
   A   : array[0..2] of string[2];
   I, J: Integer;
begin
   J := 0;
   A[0] := '';
   A[1] := '';
   A[2] := '';
   for I := 1 to Length(S) do
   begin
      if CharInset(S[I] , Digits) then
      begin
         A[J] := A[J] + S[I];
      end
      else if CharInSet(S[I] , ['.', ',', ':']) then
         Inc(J);
      if J > 2 then exit;
   end;
   for J := 0 to 2 do
      if Length(A[J]) = 1 then A[J] := '0' + A[J] else
         if Length(A[J]) = 0 then A[J] := '00';
   Result := A[0] + FormatSettings.TimeSeparator + A[1] + FormatSettings.TimeSeparator + A[2];
end;

function strNicePhone(const S: string): string;
var
   L: Integer;
begin
   if Length(S) > 3 then
   begin
      L := (Length(S) + 1) div 2;
      Result := strNicePhone(strLeft(S, L)) + Space + strNicePhone(strRight(S, Length(S) - L));
   end else
      Result := S;
end;
}

function strReplace(const S: string; C: Char; const Replace: string): string;
var
   I: Integer;
begin
   Result := '';
   for I := Length(S) downto 1 do
      if S[I] = C then Result := Replace + Result
      else Result := S[I] + Result;
end;

function StrPos(const aSubstr, S: string; aOfs: Integer): Integer;
begin
   Result := Pos(aSubstr, Copy(S, aOfs, (Length(S) - aOfs) + 1));
   if (Result > 0) and (aOfs > 1) then Inc(Result, aOfs - 1);
end;

procedure strChange(var S: string; const Src, Dest: string);
var
   P: Integer;
begin
   P := Pos(Src, S);
   while P <> 0 do
   begin
      Delete(S, P, Length(Src));
      Insert(Dest, S, P);
      Inc(P, Length(Dest));
      P := StrPos(Src, S, P);
   end;
end;

function strChangeU(const S, Source, Dest: string): string;
var
   P   : Integer;
   aSrc: string; 
begin
   Result := S;
   aSrc := StrUpper(Source);
   P := Pos(aSrc, StrUpper(Result));
   while P <> 0 do
   begin
      Delete(Result, P, Length(Source));
      Insert(Dest, Result, P);
      Inc(P, Length(Dest));
      P := StrPos(aSrc, StrUpper(Result), P);
   end;
end;


function strCmdLine: string;
var
   I: Integer;
begin
   Result := '';
   for I := 1 to ParamCount do Result := Result + ParamStr(I) + ' ';
   Delete(Result, Length(Result), 1);
end;

{ sends a string to debug windows inside the IDE }
{$IFDEF Win32}
procedure strDebug(const S: string);
var
   P   : PChar;          
   CPS : TCopyDataStruct;
   aWnd: HWND;           
begin
   aWnd := FindWindow('TfrmDbgTerm', nil);
   if aWnd <> 0 then
   begin
      CPS.cbData := Length(S) + 2;
      GetMem(P, CPS.cbData);
      try
         StrPCopy(P, S + CR);
         CPS.lpData := P;
         SendMessage(aWnd, WM_COPYDATA, 0, LPARAM(@CPS));
      finally
         FreeMem(P, Length(S) + 2);
      end;
   end;
end;
{$ENDIF}

function strSoundex(S: string): string;
const
   CvTable: array['B'..'Z'] of Char = (
      '1', '2', '3', '0', '1', {'B' .. 'F'}
      '2', '0', '0', '2', '2', {'G' .. 'K'}
      '4', '5', '5', '0', '1', {'L' .. 'P'}
      '2', '6', '2', '3', '0', {'Q' .. 'U'}
      '1', '0', '2', '0', '2'); {'V' .. 'Z'}
var
   I, J      : Integer;
   aGroup, Ch: Char;   
   
   function Group(Ch: Char): Char;
   begin
      if CharInSet(Ch , ['B'..'Z']) and not CharInSet(Ch ,['E', 'H', 'I', 'O', 'U', 'W', 'Y']) then
         Result := CvTable[Ch]
      else
         Result := '0';
   end;
   
begin
   Result := '000';
   if S = '' then exit;
   
   S := StrUpper(S);
   I := 2;
   J := 1;
   while (I <= Length(S)) and (J <= 3) do
   begin
      Ch := S[I];
      aGroup := Group(Ch);
      if (aGroup <> '0') and (Ch <> S[I - 1]) and
         ((J = 1) or (aGroup <> Result[J - 1])) and
         ((I > 2) or (aGroup <> Group(S[1]))) then
      begin
         Result[J] := aGroup;
         Inc(J);
      end;
      Inc(I);
   end; {while}
   
   Result := S[1] + '-' + Result;
end;

function strByteSize(Value: Longint): string;
   
   function FltToStr(F: Extended): string;
   begin
      Result := FloatToStrF(Round(F), ffNumber, 6, 0);
   end;
   
begin
   if Value > GBYTE then
      Result := FltToStr(Value / GBYTE) + ' GB'
   else if Value > MBYTE then
      Result := FltToStr(Value / MBYTE) + ' MB'
   else if Value > KBYTE then
      Result := FltToStr(Value / KBYTE) + ' KB'
   else
      Result := FltToStr(Value) + ' Byte'; { 04.08.96 sb }
end;

const
   C1 = 52845;
   C2 = 22719;
   
function strEncrypt(const S: string; KEY: Word): string;
var
   I: Integer;
begin
   {$IFDEF Win32}
   SetLength(Result, Length(S));
   {$ELSE}
   Result[0] := Chr(Length(S));
   {$ENDIF}
   for I := 1 to Length(S) do
   begin
      Result[I] := Char(Ord(S[I]) xor (KEY shr 8));
      KEY := (Ord(Result[I]) + KEY) * C1 + C2;
   end;
end;

function strDecrypt(const S: string; KEY: Word): string;
var
   I: Integer;
begin
   {$IFDEF Win32}
   SetLength(Result, Length(S));
   {$ELSE}
   Result[0] := Chr(Length(S));
   {$ENDIF}
   for I := 1 to Length(S) do
   begin
      Result[I] := Char(Ord(S[I]) xor (KEY shr 8));
      KEY := (Ord(S[I]) + KEY) * C1 + C2;
   end;
end;

function strLastCh(const S: string): Char;
begin
   Result := S[Length(S)];
end;

procedure strStripLast(var S: string);
begin
   if Length(S) > 0 then Delete(S, Length(S), 1);
end;

procedure strSearchReplace(var S: string; const Source, Dest: string; Options: TSROptions);
var hs, hs1, hs2, hs3: string;
var I, J: Integer;
   
begin
   if srCase in Options then
   begin
      hs := S;
      hs3 := Source;
   end
   else
   begin
      hs := StrUpper(S);
      hs3 := StrUpper(Source);
   end;
   hs1 := '';
   I := Pos(hs3, hs);
   J := Length(hs3);
   while I > 0 do
   begin
      Delete(hs, 1, I + J - 1); {Anfang Rest geändert 8.7.96 KM}
      hs1 := hs1 + Copy(S, 1, I - 1); {Kopieren geändert 8.7.96 KM}
      Delete(S, 1, I - 1); {Löschen bis Anfang posgeändert 8.7.96 KM}
      hs2 := Copy(S, 1, J); {Bis ende pos Sichern}
      Delete(S, 1, J); {Löschen bis ende Pos}
      if (not (srWord in Options))
         or (Pos(S[1], ' .,:;-#''+*?=)(/&%$§"!{[]}\~<>|') > 0) then
      begin
         {Quelle durch ziel erstzen}
         hs1 := hs1 + Dest;
      end
      else
      begin
         hs1 := hs1 + hs2;
      end;
      if srAll in Options then
         I := Pos(hs3, hs)
      else
         I := 0;
   end;
   S := hs1 + S;
end;

(* function strProfile(const afile, aSection, aEntry, ADefault: string): string;
var
   aTmp    : array[0..255] of Char;
   {$IFNDEF Win32}
   pFile   : array[0..200] of Char;
   pSection: array[0..100] of Char;
   pEntry  : array[0..100] of Char;
   pDefault: array[0..100] of Char;
   {$ENDIF}
begin
   {$IFDEF Win32}
   GetPrivateProfileString(PChar(aSection), PChar(aEntry),
      PChar(ADefault), aTmp, Sizeof(aTmp) - 1, PChar(afile));
   Result := StrPas(aTmp);
   {$ELSE}
   GetPrivateProfileString(StrPCopy(pSection, aSection),
      StrPCopy(pEntry, aEntry), StrPCopy(pDefault, ADefault),
      aTmp, Sizeof(aTmp) - 1, StrPCopy(pFile, afile));
   Result := StrPas(aTmp);
   {$ENDIF}
end;
*)

function strProfile(const afile, aSection, aEntry, ADefault: string): string;
begin
   try
      with tmemIniFile.Create(aFile) do
      begin
         Result := ReadString(aSection, aEntry, aDefault);
         free;
      end;
   except
      result:=aDefault;
   end;
end;

function strCapitalize(const S: string): string; { 31.07.96 sb }
var
   S2   : string; 
   I    : Integer;
   Ch   : Char;   
   First: Boolean;
begin
   S2 := StrLower(S);
   First := True;
   Result := '';
   for I := 1 to Length(S2) do
   begin
      Ch := S2[I];
      if CharInSet(Ch ,[Space, '-', '.']) then
         First := True
      else if First then
      begin
         Ch := StrUpper(Ch)[1];
         First := False;
      end;
      Result := Result + Ch;
   end;
end;

function strBetween(const S, sLeft, sRight: string): string;
var
   i1, i2: Integer;
begin
   i1 := Pos(sLeft, S);
   Result := Copy(S, i1 + Length(sLeft), Length(S) - 1);
   i2 := Pos(sRight, Result);
   Result := Copy(Result, 1, i2 - 1);
end;

function strEmpty(const S: string): Boolean;
begin
   Result := Length(strTrim(S)) = 0;
end;

function strWildcard(const S: string): Boolean;
begin
   Result := (Pos('*', S) <> 0) or (Pos('?', S) <> 0);
end;

function strMatch(const aText, aPattern: string): Boolean;
var
   I, P, S: Integer;
   Failed,
      Many: Boolean;
begin
   I := 0;
   P := 0;
   S := 0;
   
   Failed := False;
   Many := False;
   
   while (I < Length(aPattern)) and (P < Length(aText)) and not Failed do
   begin
      Inc(I);
      Inc(P);
      case aPattern[I] of
         '?': Many := False;
         '*':
         begin
            S := I;
            Many := True;
            Inc(I);
            if I <= Length(aPattern) then
            begin
               while (P <= Length(aText)) and (aText[P] <> aPattern[I]) do
               begin
                  Inc(P);
                  if P > Length(aText) then
                     Failed := True;
               end;
            end else
               P := Length(aText);
         end;
         else if aPattern[I] <> aText[P] then
            if Many then I := Pred(S)
            else Failed := True;
      end; { case }
   end; { while }
   
   if not Failed then
      if not ((I = Pred(Length(aPattern))) and (aPattern[Length(aPattern)] = '*')) then
         if (I < Length(aPattern)) or (P <> Length(aText)) then
            Failed := True;
   
   Result := not Failed;
end;

function strStripHtmlTags(S: string): string;
var
   i1, i2: Integer;
begin
   while (strContains('<', S) and strContains('>', S)) do
   begin
      i1 := Pos('<', S);
      i2 := Pos('>', S);
      S := Copy(S, 1, i1 - 1) + Copy(S, i2 + 1, Length(S) - i2);
   end;
   Result := S;
end;



{$IFDEF Win32}
{$IFDEF VER_XE5_UP}
function strFileLoad(const afile: string): string;
var
  Taille: Integer;
  Buffer: TBytes;

begin
   with TFileStream.Create(afile, fmOpenRead + fmShareDenyNone) do
      try
         Taille:=Size;
         SetLength(Buffer, Taille);
         ReadBuffer(Pointer(Buffer)^, Taille);
         Result := TEncoding.Default.GetString(buffer);
      finally
         Free;
      end;
end;

procedure strFileSave(const afile, AString: string);
var
  buffer : tBytes;

begin
   with TFileStream.Create(afile, fmCreate) do
      try
        buffer := TEncoding.Default.GetBytes(aString);
         WriteBuffer(Pointer(buffer)^, Length(buffer));
      finally
         Free;
      end;
end;
{$ELSE}
function strFileLoad(const afile: string): string;
begin
   with TFileStream.Create(afile, fmOpenRead + fmShareDenyNone) do
      try
         SetLength(Result, Size);
         ReadBuffer(Pointer(Result)^, Length(Result));
      finally
         Free;
      end;
end;

procedure strFileSave(const afile, AString: string);
begin
   with TFileStream.Create(afile, fmCreate) do
      try
         WriteBuffer(Pointer(AString)^, Length(AString));
      finally
         Free;
      end;
end;
{$ENDIF}
{$ENDIF}

{ Integer stuff }

function intCenter(A, B: Int_): Int_;
begin
   Result := A div 2 - B div 2;
end;

function intMax(A, B: Int_): Int_;
begin
   if A > B then Result := A else Result := B;
end;

function intMin(A, B: Int_): Int_;
begin
   if A < B then Result := A else Result := B;
end;

function intPow(Base, Expo: Integer): Int_;
var
   loop: Word;
begin
   Result := 1;
   for loop := 1 to Expo do Result := Result * Base;
end;

function intPow10(Exponent: Integer): Int_;
begin
   Result := intPow(10, Exponent);
end;

function intSign(A: Int_): Integer;
begin
   if A < 0 then Result := -1 else if A > 0 then Result := + 1 else Result := 0;
end;

function intZero(A: Int_; len: Integer): string;
begin
   Result := strPadZeroL(IntToStr(A), len);
end;

function intPrime(Value: Integer): Boolean;
var
   I: Integer;
begin
   Result := False;
   Value := Abs(Value); { 29.10.96 sb }
   if Value mod 2 <> 0 then
   begin
      I := 1;
      repeat
         I := I + 2;
         Result := Value mod I = 0
         until Result or (I > Trunc(sqrt(Value)));
         Result := not Result;
      end;
   end;
   
function intPercent(A, B: Int_): Int_;
begin
   Result := Trunc((A / B) * 100);
end;

{$IFDEF Win32}
function intToNumber(Value: Int_): string;
begin
   Result := CurrToStrF(Value, ffNumber, 0);
end;
{$ENDIF}



{ Floating point stuff }

function fltAdd(P1, P2: Float; Decimals: Integer): Float;
begin
   P1 := fltRound(P1, Decimals);
   P2 := fltRound(P2, Decimals);
   Result := fltRound(P1 + P2, Decimals);
end;

function fltDiv(P1, P2: Float; Decimals: Integer): Float;
begin
   P1 := fltRound(P1, Decimals);
   P2 := fltRound(P2, Decimals);
   if P2 = 0.0 then P2 := FLTZERO; { provide division by zero }
   Result := fltRound(P1 / P2, Decimals);
end;

function fltEqual(P1, P2: Float; Decimals: Integer): Boolean;
var
   Diff: Float;
begin
   Diff := fltSub(P1, P2, Decimals);
   Result := fltEqualZero(Diff);
end;

function fltEqualZero(P: Float): Boolean;
begin
   Result := (P >= - FLTZERO) and (P <= FLTZERO); { 29.10.96 sb }
end;

function fltGreaterZero(P: Float): Boolean;
begin
   Result := P > FLTZERO;
end;

function fltLessZero(P: Float): Boolean;
begin
   Result := P < - FLTZERO;
end;

function fltNeg(P: Float; Negate: Boolean): Float;
begin
   if Negate then Result := - P else Result := P;
end;

function fltMul(P1, P2: Float; Decimals: Integer): Float;
begin
   P1 := fltRound(P1, Decimals);
   P2 := fltRound(P2, Decimals);
   Result := fltRound(P1 * P2, Decimals);
end;

function fltRound(P: Float; Decimals: Integer): Float;
var
   Factor: Longint;
   HELP  : Float;  
begin
   Factor := intPow10(Decimals);
   if P < 0 then HELP := -0.5 else HELP := 0.5;
   Result := Int(P * Factor + HELP) / Factor;
   if fltEqualZero(Result) then Result := 0.00;
end;

function fltSub(P1, P2: Float; Decimals: Integer): Float;
begin
   P1 := fltRound(P1, Decimals);
   P2 := fltRound(P2, Decimals);
   Result := fltRound(P1 - P2, Decimals);
end;

function fltUnEqualZero(P: Float): Boolean;
begin
   Result := (P < - FLTZERO) or (P > FLTZERO)
end;

function fltCalc(const Expr: string): Float;
const
   StackSize = 10;
var
   Stack  : array[0..StackSize] of Float; { 29.10.96 sb }
   oStack : array[0..StackSize] of Char; 
   Z, N   : Float;                       
   I, J, M: Integer;                     
   Bracket: Boolean;
begin
   Bracket := False; J := 0; N := 1; Z := 0; M := 1;
   for I := 1 to Length(Expr) do
   begin
      if not Bracket then
         case Expr[I] of
            '0'..'9':
            begin
               Z := Z * 10 + Ord(Expr[I]) - Ord('0');
               N := N * M;
            end;
            ',', #46: M := 10;
            '(': Bracket := True; {hier Klammeranfang merken, Zähler!!}
               '*', 'x',
                  'X',
                  '/', '+':
                  begin
                     Stack[J] := Z / N;
                     oStack[J] := Expr[I];
                     Inc(J);
                     M := 1; Z := 0; N := 1;
                  end;
         end {case}
      else
         Bracket := Expr[I] <> ')'; {hier Rekursiver Aufruf, Zähler !!};
   end;
   Stack[J] := Z / N;
   for I := 1 to J do
      case oStack[I - 1] of
         '*', 'x', 'X': Stack[I] := Stack[I - 1] * Stack[I];
         '/': Stack[I] := Stack[I - 1] / Stack[I];
         '+': Stack[I] := Stack[I - 1] + Stack[I];
      end;
   Result := Stack[J];
end;

function fltPower(A, N: Float): Float;
begin
   Result := Exp(N * Ln(A));
end;

function fltPositiv(Value: Float): Float;
begin
   Result := Value;
   if Value < 0.0 then Result := 0.0;
end;

function fltNegativ(Value: Float): Float;
begin
   Result := Value;
   if Value > 0.0 then Result := 0.0;
end;

{ Rectangle Calculations }

function rectHeight(const R: TRect): Integer;
begin
   Result := R.Bottom - R.Top;
end;

function rectWidth(const R: TRect): Integer;
begin
   Result := R.Right - R.Left;
end;

procedure rectGrow(var R: TRect; Delta: Integer);
begin
   with R do
   begin
      Dec(Left, Delta);
      Dec(Top, Delta);
      Inc(Right, Delta);
      Inc(Bottom, Delta);
   end;
end;

procedure rectRelativeMove(var R: TRect; Dx, dy: Integer);
begin
   with R do
   begin
      Inc(Left, Dx);
      Inc(Right, Dx);
      Inc(Top, dy);
      Inc(Bottom, dy);
   end;
end;

procedure rectMoveTo(var R: TRect; X, Y: Integer);
begin
   with R do
   begin
      Right := X + Right - Left;
      Bottom := Y + Bottom - Top;
      Left := X;
      Top := Y;
   end;
end;

function rectSet(Left, Top, Right, Bottom: Integer): TRect;
begin
   Result.Left := Left;
   Result.Top := Top;
   Result.Right := Right;
   Result.Bottom := Bottom;
end;

function rectSetPoint(const TopLeft, BottomRight: TPoint): TRect;
begin
   Result.TopLeft := TopLeft;
   Result.BottomRight := BottomRight;
end;

function rectInclude(const R1, R2: TRect): Boolean;
begin
   Result := (R1.Left >= R2.Left) and (R1.Top >= R2.Top)
      and (R1.Right <= R2.Right) and (R1.Bottom <= R2.Bottom);
end;

function rectPoint(const R: TRect; P: TPoint): Boolean;
begin
   Result := (P.X > R.Left) and (P.X < R.Right) and (P.Y > R.Top) and (P.Y < R.Bottom);
end;

function rectIntersection(const R1, R2: TRect): TRect;
begin
   with Result do
   begin
      Left := intMax(R1.Left, R2.Left);
      Top := intMax(R1.Top, R2.Top);
      Right := intMin(R1.Right, R2.Right);
      Bottom := intMin(R1.Bottom, R2.Bottom);
   end;
   
   if not rectIsValid(Result) then
      Result := rectSet(0, 0, 0, 0);
end;

function rectIsIntersection(const R1, R2: TRect): Boolean;
begin
   Result := not rectIsNull(rectIntersection(R1, R2));
end;

function rectIsValid(const R: TRect): Boolean;
begin
   with R do
      Result := (Left <= Right) and (Top <= Bottom);
end;

function rectsAreValid(const Arr: array of TRect): Boolean;
var
   I: Integer;
begin
   for I := Low(Arr) to High(Arr) do
      if not rectIsValid(Arr[I]) then
      begin
         Result := False;
         exit;
      end;
   Result := True;
end;

function rectNull: TRect;
begin
   Result := rectSet(0, 0, 0, 0);
end;

function rectIsNull(const R: TRect): Boolean;
begin
   with R do
      Result := (Left = 0) and (Right = 0) and (Top = 0) and (Bottom = 0);
end;

function rectIsSquare(const R: TRect): Boolean;
begin
   Result := rectHeight(R) = rectWidth(R);
end;

function rectCentralPoint(const R: TRect): TPoint;
begin
   Result.X := R.Left + (rectWidth(R) div 2);
   Result.Y := R.Top + (rectHeight(R) div 2);
end;

function rectBounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
begin
   Result := rectSet(ALeft, ATop, ALeft + AWidth, ATop + AHeight);
end;

{ variant functions }

{$IFDEF Win32}
function varIIF(aTest: Boolean; TrueValue, FalseValue: Variant): Variant;
begin
   if aTest then Result := TrueValue else Result := FalseValue;
end;

procedure varDebug(const V: Variant);
begin
//   strDebug(VarToStr(V));
end;

function VarToStr(const V: Variant): string;
begin
    result:=variants.vartostr(v);
//   case TVarData(V).VType of
//      varSmallint: Result := IntToStr(TVarData(V).VSmallint);
//      varInteger: Result := IntToStr(TVarData(V).VInteger);
//      varSingle: Result := FloatToStr(TVarData(V).VSingle);
//      varDouble: Result := FloatToStr(TVarData(V).VDouble);
//      varCurrency: Result := FloatToStr(TVarData(V).VCurrency);
//      varDate: Result := DateToStr(TVarData(V).VDate);
//      varBoolean: Result := varIIF(TVarData(V).VBoolean, 'True', 'False');
//      varByte: Result := IntToStr(TVarData(V).VByte);
//      varString: Result := StrPas(TVarData(V).VString);
//         varEmpty,
//            varNull,
//            varVariant,
//            varUnknown,
//            varTypeMask,
//            varArray,
//            varByRef,
//            varDispatch,
//            varError: Result := '';
//         end;
end;

   {$ENDIF}


   { file functions }

procedure fileShredder(const Filename: string);
var
   afile: Integer;
   aSize: Integer;
   P    : Pointer;
begin
   aSize := fileSize(Filename);
   afile := FileOpen(Filename, fmOpenReadWrite);
   try
      GetMem(P, aSize);
      fillchar(P^, aSize, 'X');
      FileWrite(afile, P^, aSize);
      FreeMem(P, aSize);
   finally
      FileClose(afile);
      DeleteFile(Filename);
   end;
end;

function fileSize(const Filename: string): Longint;
var
   SearchRec: TSearchRec;
begin { !Win32! -> GetFileSize }
   if FindFirst(Filename, faAnyFile, SearchRec) = 0
      then Result := SearchRec.Size
   else Result := 0;
   FindClose(SearchRec);
end;

function fileWildcard(const Filename: string): Boolean;
begin
   Result := (Pos('*', Filename) <> 0) or (Pos('?', Filename) <> 0);
end;

function fileShellOpen(const afile: string): Boolean;
var
   Tmp: array[0..100] of Char;
begin
   Result := ShellExecute(Application.Handle,
      'open', StrPCopy(Tmp, afile), nil, nil, SW_NORMAL) > 32;
end;

function fileShellPrint(const afile: string): Boolean;
var
   Tmp: array[0..100] of Char;
begin
   Result := ShellExecute(Application.Handle,
      'print', StrPCopy(Tmp, afile), nil, nil, SW_HIDE) > 32;
end;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

function fileCopy(const SourceFile, TargetFile: string): Boolean;
const
   BlockSize = 1024 * 16;
var
   FSource, FTarget: Integer;
   //FFileSize       : Longint;
   BRead, Bwrite   : Word;   
   Buffer          : Pointer;
begin
   Result := False;
   FSource := FileOpen(SourceFile, fmOpenRead + fmShareDenyNone); { Open Source }
   if FSource >= 0 then
      try
         //FFileSize := FileSeek(FSource, 0, soFromEnd);
         FTarget := FileCreate(TargetFile); { Open Target }
         try
            GetMem(Buffer, BlockSize);
            try
               FileSeek(FSource, 0, soFromBeginning);
               repeat
                  BRead := FileRead(FSource, Buffer^, BlockSize);
                  Bwrite := FileWrite(FTarget, Buffer^, BRead);
               until (BRead = 0) or (BRead <> Bwrite);
               if BRead = Bwrite then
                  Result := True;
            finally
               FreeMem(Buffer, BlockSize);
            end;
            FileSetDate(FTarget, FileGetDate(FSource));
         finally
            FileClose(FTarget);
         end;
      finally
         FileClose(FSource);
      end;
end;

function FileDate(const afile: string): TDateTime;
var
   SearchRec: TSearchRec;
begin
   if FindFirst(afile, faAnyFile, SearchRec) = 0 then
   {$ifdef VER_XE5_UP}
      Result := SearchRec.TimeStamp
   {$else}
      Result := FileDateToDateTime(SearchRec.Time)
   {$endif}
   else Result := 0;
   FindClose(SearchRec);
end;

procedure FileDateSet(const Filename: string; aDate: TDateTime);
begin
   try
      FileSetDate(Filename, DateTimeToFileDate(aDate));
   except
      //
   end;
end;

function setfileProgramPath(Path:string): string;
begin
   result:=CurrentFileProgramPath;
   CurrentFileProgramPath := Path;
   setCurrentDir(Path);
end;

function fileProgramPath: string;
begin
   if not StrEmpty(CurrentFileProgramPath) then
      result := CurrentFileProgramPath
   else
      Result := ExtractFilePath(ParamStr(0));
end;

function fileProgramExt(aExt: string): string;
begin
   Result := ChangeFileExt(ParamStr(0), aExt);
end;

function fileWindowsPath: string;
var
   aTmp: array[0..255] of Char;
begin
   GetWindowsDirectory(aTmp, Sizeof(aTmp) - 1);
   Result := strAddSlash(StrPas(aTmp));
end;

function fileSystemPath: string;
var
   aTmp: array[0..255] of Char;
begin
   GetSystemDirectory(aTmp, Sizeof(aTmp) - 1);
   Result := strAddSlash(StrPas(aTmp));
end;

{$IFDEF Win32}
function fileExec(const aCmdLine: string; aHide, aWait: Boolean): Boolean;
var
   StartupInfo: TStartupInfo;       
   ProcessInfo: TProcessInformation;
begin
   {setup the startup information for the application }
   fillchar(StartupInfo, Sizeof(TStartupInfo), 0);
   with StartupInfo do
   begin
      cb := Sizeof(TStartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
      if aHide then wShowWindow := SW_HIDE
      else wShowWindow := SW_SHOWNORMAL;
   end;
   
   Result := CreateProcess(nil, PChar(aCmdLine), nil, nil, False,
      NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
   if aWait then
      if Result then
      begin
         WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
         WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      end;
end;
{$ELSE}
function fileExec(const aCmdLine: string; aHide, aWait: Boolean): Boolean;
var
   aMode  : Integer;              
   aModule: Word;                 
   aTmp   : array[0..255] of Char;
begin
   if aHide then aMode := SW_HIDE else aMode := SW_SHOWNORMAL;
   aModule := WinExec(StrPCopy(aTmp, aCmdLine), aMode);
   if aWait then
      repeat
         Application.HandleMessage;
      until GetModuleUsage(aModule) = 0;
   Result := aModule > 31;
end;
{$ENDIF}

{$IFDEF Win32}

{$ifdef VER_XE5_UP}
function fileTemp(const aExt: string): string;
var
   //Buffer: array[0..1023] of Char;
   afile : string;
begin
   //GetTempPath(Sizeof(Buffer) - 1, Buffer);
   //GetTempFileName(Buffer, 'TMP', Random(1000), Buffer); // keine 0
   //SetString(afile, Buffer, StrLen(Buffer));
   aFile := TPath.GetTempFileName;
   if not strempty(aExt) then
   begin
     Result := ChangeFileExt(afile, aExt);
     RenameFile(afile, Result);
   end
   else
   begin
     result := aFile;
   end;
end;
{$else}
function fileTemp(const aExt: string): string;
var
   Buffer: array[0..1023] of Char;
   afile : string;
begin
   GetTempPath(Sizeof(Buffer) - 1, Buffer);
   GetTempFileName(Buffer, 'TMP', Random(1000), Buffer); // keine 0
   SetString(afile, Buffer, StrLen(Buffer));
   Result := ChangeFileExt(afile, aExt);
   RenameFile(afile, Result);
end;

{$endif}

function fileRedirectExec(const aCmdLine: string; Strings: TStrings): Boolean;
var
   StartupInfo: TStartupInfo;       
   ProcessInfo: TProcessInformation;
   aOutput    : Integer;            
   afile      : string;             
begin
   Strings.Clear;
   
   { Create temp. file for output }
   afile := fileTemp('.tmp');
   aOutput := FileCreate(afile);
   try
      {setup the startup information for the application }
      fillchar(StartupInfo, Sizeof(TStartupInfo), 0);
      with StartupInfo do
      begin
         cb := Sizeof(TStartupInfo);
         dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK or
            STARTF_USESTDHANDLES;
         wShowWindow := SW_HIDE;
         hStdInput := INVALID_HANDLE_VALUE;
         hStdOutput := aOutput;
         hStdError := INVALID_HANDLE_VALUE;
      end;

      Result := CreateProcess(nil, PChar(aCmdLine), nil, nil, False,
         NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
      if Result then
      begin
         WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
         WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      end;
   finally
      FileClose(aOutput);
      Strings.LOADFROMFILE(afile);
      DeleteFile(afile);
   end;
end;


function fileLongName(const afile: string): string;
var
   aInfo: TSHFileInfo;
begin
   if SHGetFileInfo(PChar(afile), 0, aInfo, Sizeof(aInfo), SHGFI_DISPLAYNAME) <> 0 then
      Result := StrPas(aInfo.szDisplayName)
   else
      Result := afile;
end;

function fileTypeName(const afile: string): string;
var
   aInfo: TSHFileInfo;
begin
   if SHGetFileInfo(PChar(afile), 0, aInfo, Sizeof(aInfo), SHGFI_TYPENAME) <> 0 then
      Result := StrPas(aInfo.szTypeName)
   else
   begin
      Result := ExtractFileExt(afile);
      Delete(Result, 1, 1);
      Result := StrUpper(Result) + ' File';
   end;
end;


function fileShortName(const afile: string): string;
var
   aTmp: array[0..255] of Char;
begin
   if GetShortPathName(PChar(afile), aTmp, Sizeof(aTmp) - 1) = 0 then
      Result := afile
   else
      Result := StrPas(aTmp);
end;

{$ENDIF}

function ExtractName(const Filename: string): string;
var
   aExt: string; 
   aPos: Integer;
begin
   aExt := ExtractFileExt(Filename);
   Result := ExtractFileName(Filename);
   if aExt <> '' then
   begin
      aPos := Pos(aExt, Result);
      if aPos > 0 then
         Delete(Result, aPos, Length(aExt));
   end;
end;


{ date calculations }

function dateYear(D: TDateTime): Integer;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := Year;
end;

function dateMonth(D: TDateTime): Integer;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := Month;
end;

function dateBeginOfYear(D: TDateTime): TDateTime;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := EncodeDate(Year, 1, 1);
end;

function dateEndOfYear(D: TDateTime): TDateTime;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := EncodeDate(Year, 12, 31);
end;

function dateBeginOfMonth(D: TDateTime): TDateTime;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := EncodeDate(Year, Month, 1);
end;

function dateEndOfMonth(D: TDateTime): TDateTime;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   if Month = 12 then
   begin
      Inc(Year);
      Month := 1;
   end else
      Inc(Month);
   Result := EncodeDate(Year, Month, 1) - 1;
end;

function dateWeekOfYear(D: TDateTime): Integer; { Armin Hanisch }
const
   t1: array[1..7] of Shortint = ( - 1, 0, 1, 2, 3, - 3, - 2);  
   t2: array[1..7] of Shortint = ( - 4, 2, 1, 0, - 1, - 2, - 3);
var
   doy1,
      doy2: Integer;  
   NewYear: TDateTime;
begin
   NewYear := dateBeginOfYear(D);
   doy1 := dateDayOfYear(D) + t1[DayOfWeek(NewYear)];
   doy2 := dateDayOfYear(D) + t2[DayOfWeek(D)];
   if doy1 <= 0 then
      Result := dateWeekOfYear(NewYear - 1)
   else if (doy2 >= dateDayOfYear(dateEndOfYear(NewYear))) then
      Result := 1
   else
      Result := (doy1 - 1) div 7 + 1;
   if (Result = 1) and (dateMonth(D) = 12) then Result := 52;
end;

function dateDayOfYear(D: TDateTime): Integer;
begin
   Result := Trunc(D - dateBeginOfYear(D)) + 1;
end;

function dateDayOfWeek(D: TDateTime): TDayOfWeek;
begin
   Result := TDayOfWeek(Pred(DayOfWeek(D)));
end;

function dateLeapYear(D: TDateTime): Boolean;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;

function dateBeginOfQuarter(D: TDateTime): TDateTime;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := EncodeDate(Year, (((Month - 1) div 3) * 3) + 1, 1); { sb 11.02.97 }
end;

function dateEndOfQuarter(D: TDateTime): TDateTime;
begin
   Result := dateBeginOfQuarter(dateBeginOfQuarter(D) + (3 * 31)) - 1;
end;

function dateBeginOfWeek(D: TDateTime; Weekday: Integer): TDateTime;
begin
   Result := D;
   while DayOfWeek(Result) <> Weekday do Result := Result - 1;
end;

function dateDaysInMonth(D: TDateTime): Integer;
const
   DaysPerMonth: array[1..12] of Byte = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var
   Month: Integer;
begin
   Month := dateMonth(D);
   Result := DaysPerMonth[Month];
   if (Month = 2) and dateLeapYear(D) then Inc(Result);
end;

function dateDay(D: TDateTime): Integer;
var
   Year, Month, Day: Word;
begin
   DecodeDate(D, Year, Month, Day);
   Result := Day;
end;

function dateQuicken(D: TDateTime; var KEY: Char): TDateTime;
const
   {$IFDEF German}
   _ToDay      = 'H';
   _PrevYear   = 'J';
   _NextYear   = 'R';
   _PrevMonth  = 'M';
   _NextMonth  = 'T';
   _BeginQuart = 'Q';
   _EndQuart   = 'U';
   {$ELSE}
   _ToDay      = 'T';
   _PrevYear   = 'Y';
   _NextYear   = 'R';
   _PrevMonth  = 'M';
   _NextMonth  = 'H';
   _BeginQuart = 'Q';
   _EndQuart   = 'U';
   {$ENDIF}
begin
   case UpCase(KEY) of { Quicken Date Fast Keys }
      '+': Result := D + 1;
      '-': Result := D - 1;
      _ToDay: Result := Date;
      _PrevYear: if D <> dateBeginOfYear(D) then Result := dateBeginOfYear(D)
      else Result := dateBeginOfYear(D - 1);
      _NextYear: if D <> dateEndOfYear(D) then Result := dateEndOfYear(D)
      else Result := dateEndOfYear(Date + 1);
      _PrevMonth: if D <> dateBeginOfMonth(D) then Result := dateBeginOfMonth(D)
      else Result := dateBeginOfMonth(D - 1);
      _NextMonth: if D <> dateEndOfMonth(D) then Result := dateEndOfMonth(D)
      else Result := dateEndOfMonth(D + 1);
      _BeginQuart: Result := dateBeginOfQuarter(D);
      _EndQuart: Result := dateEndOfQuarter(D);
      else
      begin
         Result := D;
         exit;
      end;
   end;
   KEY := #0;
end;

{ time functions }

function timeHour(T: TDateTime): Integer;
var
   Hour, Minute, Sec, Sec100: Word;
begin
   DecodeTime(T, Hour, Minute, Sec, Sec100);
   Result := Hour;
end;

function timeMin(T: TDateTime): Integer;
var
   Hour, Minute, Sec, Sec100: Word;
begin
   DecodeTime(T, Hour, Minute, Sec, Sec100);
   Result := Minute;
end;

function timeSec(T: TDateTime): Integer;
var
   Hour, Minute, Sec, Sec100: Word;
begin
   DecodeTime(T, Hour, Minute, Sec, Sec100);
   Result := Sec;
end;

function timeToInt(T: TDateTime): Integer;
begin
   Result := Trunc((MSecsPerDay * T) / 1000);
end;

{$IFDEF Win32}
function timeZoneOffset: Integer;
var
   aTimeZoneInfo: TTimeZoneInformation;
begin
   if GetTimeZoneInformation(aTimeZoneInfo) <> 0 then
      Result := aTimeZoneInfo.Bias
   else
      Result := 0;
end;
{$ENDIF}

{ Communications Functions }
(*
function comIsCis(const S: string): Boolean;
var
   aSt      : string;
   PreId,
      PostId: Integer;
begin
   Result := strContainsU('@compuserve.com', S); { 28.7.96 sb This is also on CIS }
   if not Result then
      if Pos(',', S) > 0 then
         try
            aSt := S;
            PreId := StrToInt(strToken(aSt, ','));
            PostId := StrToInt(aSt);
            Result := (PreId > 0) and (PostId > 0);
         except
            Result := False;
         end;
end;

function comIsInt(const S: string): Boolean;
var
   aSt      : string;
   PreId,
      PostId: string;
begin
   try
      aSt := S;
      PreId := strToken(aSt, '@');
      PostId := aSt;
      Result := (Length(PreId) > 0) and (Length(PostId) > 0);
   except
      Result := False;
   end;
end;

{ converts a CIS adress to a correct Internet adress }
function comCisToInt(const S: string): string;
var
   P: Integer;
begin
   P := Pos('INTERNET:', S);
   if P = 1 then
      Result := Copy(S, P + 1, Length(S))
   else
   begin
      Result := S;
      P := Pos(',', Result);
      if P > 0 then Result[P] := '.';
      Result := Result + '@compuserve.com'; { 22.07.96 sb  Error }
   end;
end;

{ converts a internet adress to a correct CServe adress }
function comIntToCis(const S: string): string;
var
   P: Integer;
begin
   P := Pos('@COMPUSERVE.COM', StrUpper(S));
   if P > 0 then
   begin
      Result := strLeft(S, P - 1);
      P := Pos('.', Result);
      if P > 0 then Result[P] := ',';
   end else
      Result := 'INTERNET:' + S;
end;

{ converts a fax adress to a correct CServe adress }
function comFaxToCis(const S: string): string;
begin
   Result := 'FAX:' + S;
end;

function comNormFax(const name, Fax: string): string;
begin
   if name <> '' then
      Result := name + '[fax: ' + name + '@' + strTrim(Fax) + ']'
   else
      Result := '[fax: ' + strTrim(Fax) + ']';
end;

function comNormInt(const name, Int: string): string;
begin
   Result := '';
   if comIsInt(Int) then
      if name <> '' then
         Result := name + '|smtp: ' + strTrim(Int)
      else
         Result := 'smtp: ' + strTrim(Int);
end;

function comNormCis(const name, CIS: string): string;
begin
   Result := '';
   if name <> '' then
      Result := name + '[compuserve: ' + strTrim(CIS) + ']'
   else
      Result := '[compuserve: ' + strTrim(CIS) + ']';
end;

function comNormPhone(const Phone: string): string;

   function strValueAt(const S: string; at: Integer): string;
   const
      Seperator = ',';
      Str       = '"';
   var
      J, I : Integer;
      FSkip: Boolean;
   begin
      Result := '';
      J := 1;
      I := 0;
      FSkip := False;
      while (I <= at) and (J <= Length(S)) do
      begin
         if (S[J] = Str) then
            FSkip := not FSkip
         else if (S[J] = Seperator) and not FSkip then
            Inc(I)
         else if I = at then
            Result := Result + S[J];
         Inc(J);
      end;
   end;
   
var
   aNumber,
      aCountry,
      aPrefix,
      ADefault,
      aLocation: string; 
   
   I           : Integer;
begin
   ADefault := '1,"Hamburg","","","40",49,0,0,0,"",1," "';
   aLocation := strProfile('telephon.ini', 'Locations', 'CurrentLocation', '');
   if aLocation <> '' then
   begin
      aLocation := strTokenAt(aLocation, ',', 0);
      if aLocation <> '' then
      begin
         aLocation := strProfile('telephon.ini', 'Locations', 'Location' + aLocation, '');
         if aLocation <> '' then
            ADefault := aLocation;
      end;
   end;

   Result := '';
   aNumber := strTrim(Phone);
   if aNumber <> '' then
      for I := Length(aNumber) downto 1 do
         if not CharInSet(aNumber[I] , Digits) then
         begin
            if aNumber[I] <> '+' then aNumber[I] := '-';
            if I < Length(aNumber) then { remove duplicate digits }
               if aNumber[I] = aNumber[I + 1] then
                  Delete(aNumber, I, 1);
         end;

   if aNumber <> '' then
   begin
      if aNumber[1] = '+' then
         aCountry := strToken(aNumber, '-')
      else
         aCountry := '+' + strValueAt(ADefault, 5);

      aNumber := strTrimChL(aNumber, '-');

      if aNumber <> '' then
      begin
         if strTokenCount(aNumber, '-') > 1 then
            aPrefix := strTrimChL(strToken(aNumber, '-'), '0')
         else
            aPrefix := strValueAt(ADefault, 4);

         aNumber := strNicePhone(strTrimChA(aNumber, '-'));
         Result := aCountry + ' (' + aPrefix + ') ' + aNumber;
      end;
   end;
end;
*)
{ system functions }

{$IFDEF Win32}
function sysTempPath: string;
var
   Buffer: array[0..1023] of Char;
begin
   SetString(Result, Buffer, GetTempPath(Sizeof(Buffer) - 1, Buffer));
end;
{$ELSE}
function sysTempPath: string;
var
   Buffer: array[0..255] of Char;
begin
   GetTempFileName(#0, 'TMP', 0, Buffer); { 15.07.96 sb }
   Result := StrPas(Buffer);
   DeleteFile(Result);
   Result := ExtractFilePath(Result);
end;
{$ENDIF}

procedure sysDelay(aMs: Cardinal);
var
   TickCount: Cardinal;
begin
   TickCount := GetTickCount;
   while (GetTickCount - TickCount) < aMs do Application.ProcessMessages;
end;

procedure sysHardDelay(aMs: Cardinal);
var
   TickCount: Cardinal;
begin
   TickCount := GetTickCount;
   while GetTickCount - TickCount < aMs do;
end;

procedure sysBeep;
begin
   MessageBeep($FFFF);
end;

function sysColorDepth: Integer;
var
   aDC: HDC;
begin
   aDC := 0;
   try
      aDC := GetDC(0);
      Result := 1 shl (GetDeviceCaps(aDC, PLANES) * GetDeviceCaps(aDC, BitsPixel));
   finally
      ReleaseDC(0, aDC);
   end;
end;

function sysScreenColor: TScreenColor; { 13.08.97 }
var
   aDC: HDC;
begin
   Result := scUnknown;
   aDC := GetDC(0);
   try
      case GetDeviceCaps(aDC, BitsPixel) of
         1: Result := scMonoChrome;
         4: Result := sc16Color;
         8: Result := sc256Color;
         16: Result := scHiColor;
         24: Result := scTrueColor;
      end;
   finally
      ReleaseDC(0, aDC);
   end;
end;

{$IFDEF Win32}
procedure sysSaverRunning(Active: Boolean);
var
   aParam: Longint;
begin
   SystemParametersInfo(SPI_SCREENSAVERRUNNING, Word(Active), @aParam, 0);
end;
{$ENDIF}

{ registry functions }

{$IFDEF Win32 }

procedure regParsePath(const Path: string; var aPath, aValue: string);
begin
   aPath := Path;
   aValue := '';
   while (Length(aPath) > 0) and (strLastCh(aPath) <> '\') do
   begin
      aValue := strLastCh(aPath) + aValue;
      strStripLast(aPath);
   end;
end;

function regReadString(aKey: HKEY; const Path: string): string;
var
   aRegistry: tRegistry;
   aPath    : string;   
   aValue   : string;
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         regParsePath(Path, aPath, aValue);
         OpenKey(aPath, True);
         Result := ReadString(aValue);
      end;
   finally
      aRegistry.Free;
   end;
end;

procedure regWriteString(aKey: HKEY; const Path, Value: string);
var
   aRegistry: tRegistry;
   aPath    : string;   
   aValue   : string;   
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         regParsePath(Path, aPath, aValue);
         OpenKey(aPath, True);
         WriteString(aValue, Value);
      end;
   finally
      aRegistry.Free;
   end;
end;

procedure regDelValue(aKey: HKEY; const Path: string);
var
   aRegistry: tRegistry;
   aPath    : string;   
   aValue   : string;   
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         regParsePath(Path, aPath, aValue);
         OpenKey(aPath, True);
         DeleteValue(aValue);
      end;
   finally
      aRegistry.Free;
   end;
end;

(*!!!
function regReadString(aKey: hKey; const Value: String): String;
var
  aTmp  : array[0..255] of char;
  aCb,
  aType : Integer;
begin
  Result:='';
  if aKey<> 0 then
  begin
    aCb:=Sizeof(aTmp)-1;
   { aData:=@aTmp; }
    if RegQueryValueEx(aKey,PChar(Value),nil,@aType,@aTmp,@aCb)=ERROR_SUCCESS then
       if aType=REG_SZ then Result:=String(aTmp);
  end;
end; *)

function regInfoString(const Value: string): string;
var
   aKey: HKEY;
begin
   Result := '';
   if RegOpenKey(HKEY_LOCAL_MACHINE, REG_CURRENT_VERSION, aKey) = ERROR_SUCCESS then
   begin
      Result := regReadString(aKey, Value);
      RegCloseKey(aKey);
   end;
end;

function regCurrentUser: string;
begin
   Result := regInfoString(REG_CURRENT_USER);
end;

function regCurrentCompany: string;
begin
   Result := regInfoString(REG_CURRENT_COMPANY);
end;

{ Add a shell extension to the registry }
procedure regWriteShellExt(const aExt, aCmd, aMenu, aExec: string);
var
   S, aPath: string;
begin
   with tRegistry.Create do
      try
         RootKey := HKEY_CLASSES_ROOT;
         aPath := aExt;
         if KeyExists(aPath) then
         begin
            OpenKey(aPath, False);
            S := ReadString('');
            CloseKey;
            if S <> '' then
               if KeyExists(S) then
                  aPath := S;
         end;
         
         OpenKey(aPath + '\Shell\' + aCmd, True);
         WriteString('', aMenu);
         CloseKey;
         
         OpenKey(aPath + '\Shell\' + aCmd + '\Command', True);
         WriteString('', aExec + ' %1');
         CloseKey;
      finally
         Free;
      end;
end;

procedure regValueList(aKey: HKEY; const Path: string; var aValue: TStringList);
var
   aRegistry: tRegistry;
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         OpenKey(Path, True);
         GetValueNames(aValue);
      end;
   finally
      aRegistry.Free;
   end;
end;

procedure regKeyList(aKey: HKEY; const Path: string; var aValue: TStringList);
var
   aRegistry: tRegistry;
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         OpenKey(Path, True);
         GetKeyNames(aValue);
      end;
   finally
      aRegistry.Free;
   end;
end;

function regValueExist(aKey: HKEY; const Path: string): Boolean;
var
   aRegistry: tRegistry;
   aPath    : string;   
   aValue   : string;
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         regParsePath(Path, aPath, aValue);
         OpenKey(aPath, True);
         Result := ValueExists(aValue)
      end;
   finally
      aRegistry.Free;
   end;
end;

function regReadValue(aKey: HKEY; const Path: string; Typ: TDataType): Variant;
var
   aRegistry: tRegistry;
   aPath    : string;   
   aValue   : string;   
begin
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         regParsePath(Path, aPath, aValue);
         if OpenKey(aPath, True) then
            if ValueExists(aValue) then
               case Typ of
                  dtInteger: Result := ReadInteger(aValue);
                  dtBoolean: Result := ReadBool(aValue);
                  dtString: Result := ReadString(aValue);
                  dtDate: Result := ReadDate(aValue);
                  dtFloat: Result := ReadFloat(aValue);
                  dtCurrency: Result := ReadCurrency(aValue);
                  dtTime: Result := REadTime(aValue);
               end;
      end;
   finally
      aRegistry.Free;
   end;
end;

function regWriteValue(aKey: HKEY; const Path: string; Value: Variant; Typ: TDataType): Boolean;
var
   aRegistry: tRegistry;
   aPath    : string;   
   aValue   : string;   
begin
   Result := true;
   aRegistry := tRegistry.Create;
   try
      with aRegistry do
      begin
         RootKey := aKey;
         regParsePath(Path, aPath, aValue);
         if OpenKey(aPath, True) then
            case Typ of
               dtInteger: WriteInteger(aValue, Value);
               dtBoolean: WriteBool(aValue, Value);
               dtString: WriteString(aValue, Value);
               dtDate: WriteDate(aValue, Value);
               dtFloat: WriteFloat(aValue, Value);
               dtCurrency: WriteCurrency(aValue, Value);
               dtTime: WriteTime(aValue, Value);
            end
         else
            Result := False;
      end;
   finally
      aRegistry.Free;
   end;
end;

{$ENDIF}

{ HTML functions }

function htmlTagReadString(const aPara, aText, ADefault: string): string;
var I, J: Integer;
begin
   I := Pos(StrUpper(aPara), StrUpper(aText));
   if I > 0 then
   begin
      while not CharInSet(aText[I] , ['=']) do Inc(I);
      Inc(I); { Skip '=' }
      while CharInSet(aText[I] , [' ']) do Inc(I);
      if aText[I] = '"' then
      begin
         Inc(I); J := I;
         while not CharInSet(aText[I] , ['"']) do Inc(I)
      end
      else
      begin
         J := I;
         while not CharInSet(aText[I] , ['<', '>', ' ']) do Inc(I);
      end;
      Result := Copy(aText, J, I - J);
   end else
      Result := ADefault;
end;

function htmlTagReadInteger(const aPara, aText: string; ADefault: Integer): Integer;
begin
   Result := StrToInt(htmlTagReadString(aPara, aText, IntToStr(ADefault)));
end;

function htmlStrToColor(S: string): tColor;
const
   Digits: string                = '0123456789ABCDEF';
   Order: array[1..6] of Integer = (5, 6, 3, 4, 1, 2);
var
   I: Integer;
begin
   Result := 0;
   S := StrUpper(S);
   for I := 1 to Length(S) do
      Result := Result shl 4 + Pos(S[Order[I]], Digits) - 1;
end;


{ other stuff }

function MsgBox(const aTitle, aMsg: string; aFlag: Integer): Integer;
var
   ActiveWindow: HWND;                 
   WindowList  : Pointer;              
   TmpA        : array[0..200] of Char;
   TmpB        : array[0..100] of Char;
begin
   ActiveWindow := GetActiveWindow;
   WindowList := DisableTaskWindows(0);
   try
      StrPCopy(TmpB, aTitle);
      StrPCopy(TmpA, aMsg);
      {$IFDEF Win32}
      Result := Windows.MESSAGEBOX(Application.Handle, TmpA, TmpB, aFlag);
      {$ELSE}
      Result := WinProcs.MESSAGEBOX(Application.Handle, TmpA, TmpB, aFlag);
      {$ENDIF}
   finally
      EnableTaskWindows(WindowList);
      SetActiveWindow(ActiveWindow);
   end;
end;

function Question(const aMsg: string): Boolean;
begin
   {  if IsWin95 or IsWinNT then }
   Result := MsgBox( SMsgDlgConfirm ,
      aMsg, MB_ICONQUESTION or MB_YESNO) = IDYES
      {  else
          Result:=messageDlg(aMsg,mtConfirmation,[mbYes,mbNo],0)=mrYes; }
end;

procedure INFORMATION(const aMsg: string);
begin
   {  if IsWin95 or IsWinNT then }
   MsgBox(SMsgdlgInformation ,
      aMsg, MB_ICONINFORMATION or MB_OK)
      {  else
           messageDlg(aMsg,mtInformation,[mbOk],0); }
end;

function Confirmation(const aMsg: string): Word;
begin
   {  if IsWin95 or IsWinNT then }
   case MsgBox(SMsgDlgConfirm ,
      aMsg, MB_ICONQUESTION or MB_YESNOCANCEL) of
         IDYES: Result := mrYes;
         IDNO: Result := mrNo;
         IDCANCEL: Result := mrCancel;
         else Result := mrCancel;
   end
      {  else
           Result:=MessageDlg(aMsg,mtConfirmation,[mbYes,mbNo,mbCancel],0); }
end;

{ other stuff }

{ accepts a pointer, returns it as string in $xxxxxxxx format }
function ptrToStr(const Value: Pointer): string;
begin
   Result := Format('$%p',[Value]);
end;

{ takes an object and returns as string in ClassName:$address format;
	if object is component, returns in ClassName.ObjectName:$address format }
function objToStr(const Value: TObject): string;
begin
   if (Value is TComponent) then
      Result := Format('%s.%s:$%p',[Value.ClassName, TComponent(Value).name, Pointer(Value)])
   else
      Result := Format('%s:$%p',[Value.ClassName, Pointer(Value)]);
end;

{ adjusts color value to a percentage }
function colorPercent(aColor: tColor; aBy: Float): tColor;
begin
   Result := RGB(Round(GetRValue(ColorToRGB(aColor)) * aBy),
      Round(GetGValue(ColorToRGB(aColor)) * aBy),
      Round(GetBValue(ColorToRGB(aColor)) * aBy));
end;


{ TPersistentRect }

constructor TPersistentRect.Create;
begin
   FRect := rectSet(10, 10, 100, 20);
end;

procedure TPersistentRect.Assign(Source: TPersistent);
var
   Value: TPersistentRect;
begin
   if (Source is TPersistentRect) then
   begin
      Value := Source as TPersistentRect;
      FRect := rectBounds(Value.Left, Value.Top, Value.Width, Value.Height);
      exit;
   end;
   inherited Assign(Source);
end;

procedure TPersistentRect.SetLeft(Value: Integer);
begin
   if Value <> Left then
   begin
      if Assigned(FOnConvert) then
         Value := FOnConvert(Self, Value, False);
      FRect := rectBounds(Value, Top, Width, Height);
   end;
end;

procedure TPersistentRect.SetTop(Value: Integer);
begin
   if Value <> Top then
   begin
      if Assigned(FOnConvert) then
         Value := FOnConvert(Self, Value, False);
      FRect := rectBounds(Left, Value, Width, Height);
   end;
end;

procedure TPersistentRect.SetHeight(Value: Integer);
begin
   if Value <> Height then
   begin
      if Assigned(FOnConvert) then
         Value := FOnConvert(Self, Value, False);
      FRect := rectBounds(Left, Top, Width, Value);
   end;
end;

procedure TPersistentRect.SetWidth(Value: Integer);
begin
   if Value <> Width then
   begin
      if Assigned(FOnConvert) then
         Value := FOnConvert(Self, Value, False);
      FRect := rectBounds(Left, Top, Value, Height);
   end;
end;

function TPersistentRect.GetLeft: Integer;
begin
   Result := FRect.Left;
   if Assigned(FOnConvert) then
      Result := FOnConvert(Self, Result, True);
end;

function TPersistentRect.GetTop: Integer;
begin
   Result := FRect.Top;
   if Assigned(FOnConvert) then
      Result := FOnConvert(Self, Result, True);
end;

function TPersistentRect.GetHeight: Integer;
begin
   Result := rectHeight(FRect);
   if Assigned(FOnConvert) then
      Result := FOnConvert(Self, Result, True);
end;

function TPersistentRect.GetWidth: Integer;
begin
   Result := rectWidth(FRect);
   if Assigned(FOnConvert) then
      Result := FOnConvert(Self, Result, True);
end;

{$IFDEF Win32}

{ TPersistentRegistry }

function TPersistentRegistry.ReadComponent(const name: string; Owner, Parent: TComponent): TComponent;
var
   DataSize : Integer;      
   MemStream: TMemoryStream;
   Reader   : TReader;      
begin
   //Result := nil;
   DataSize := GetDataSize(name);
   MemStream := TMemoryStream.Create;
   try
      MemStream.SetSize(DataSize);
      ReadBinaryData(name, MemStream.Memory^, DataSize);
      MemStream.Position := 0;
      
      Reader := TReader.Create(MemStream, 256);
      try
         Reader.Parent := Parent;
         Result := Reader.ReadRootComponent(nil);
         if Owner <> nil then
            try
               Owner.InsertComponent(Result);
            except
               Result.Free;
               raise;
            end;
      finally
         Reader.Free;
      end;
      
   finally
      MemStream.Free;
   end;
end;

procedure TPersistentRegistry.WriteComponent(const name: string; Component: TComponent);
var
   MemStream: TMemoryStream;
begin
   MemStream := TMemoryStream.Create;
   try
      MemStream.WriteComponent(Component);
      WriteBinaryData(name, MemStream.Memory^, MemStream.Size);
   finally
      MemStream.Free;
   end;
end;

{$ENDIF}

{ TSystemMetric }

constructor TSystemMetric.Create;
begin
   inherited Create;
   Update;
end;

procedure TSystemMetric.Update;
   
   function GetSystemPoint(AX, AY: Integer): TPoint;
   begin
      Result := Point(GetSystemMetrics(AX), GetSystemMetrics(AY));
   end;
   
begin
   FMenuHeight := GetSystemMetrics(SM_CYMENU);
   FCaptionHeight := GetSystemMetrics(SM_CYCAPTION);
   FBorder := GetSystemPoint(SM_CXBORDER, SM_CYBORDER);
   FFrame := GetSystemPoint(SM_CXFRAME, SM_CYFRAME);
   FDlgFrame := GetSystemPoint(SM_CXDLGFRAME, SM_CYDLGFRAME);
   FBitmap := GetSystemPoint(SM_CXSIZE, SM_CYSIZE);
   FHScroll := GetSystemPoint(SM_CXHSCROLL, SM_CYHSCROLL);
   FVScroll := GetSystemPoint(SM_CXVSCROLL, SM_CYVSCROLL);
   FThumb := GetSystemPoint(SM_CXHTHUMB, SM_CYVTHUMB);
   FFullScreen := GetSystemPoint(SM_CXFULLSCREEN, SM_CYFULLSCREEN);
   FMin := GetSystemPoint(SM_CXMIN, SM_CYMIN);
   FMinTrack := GetSystemPoint(SM_CXMINTRACK, SM_CYMINTRACK);
   FCursor := GetSystemPoint(SM_CXCURSOR, SM_CYCURSOR);
   fIcon := GetSystemPoint(SM_CXICON, SM_CYICON);
   FDoubleClick := GetSystemPoint(SM_CXDOUBLECLK, SM_CYDOUBLECLK);
   FIconSpacing := GetSystemPoint(SM_CXICONSPACING, SM_CYICONSPACING);
   FColorDepth := sysColorDepth;
end;

{ TDesktopCanvas }

constructor TDesktopCanvas.Create;
begin
   inherited Create;
   DC := GetDC(0);
   Handle := DC;
end;

destructor TDesktopCanvas.Destroy;
begin
   Handle := 0;
   ReleaseDC(0, DC);
   inherited Destroy;
end;

{$IFNDEF Win32}

procedure DoneXProcs; far;
begin
   SysMetric.Free;
end;

{$ENDIF}

{$IFDEF Win32}
function CheckNT: Boolean;
var
   aVersion: TOSVersionInfo;
begin
   aVersion.dwOSVersionInfoSize := Sizeof(aVersion);
   Result := GetVersionEx(aVersion) and (aVersion.dwPlatformId = VER_PLATFORM_WIN32_NT);
end;

function CheckWin95: Boolean;
var
   aVersion: TOSVersionInfo;
begin
   aVersion.dwOSVersionInfoSize := Sizeof(aVersion);
   Result := GetVersionEx(aVersion) and (aVersion.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS);
end;

function CheckWin7: Boolean;
var
   aVersion: TOSVersionInfo;
begin
   aVersion.dwOSVersionInfoSize := Sizeof(aVersion);
   Result := GetVersionEx(aVersion) and (aVersion.dwPlatformId = VER_PLATFORM_WIN32_NT) and (aVersion.dwMajorVersion>=6);
end;
{$ENDIF}

{ fonctions CAC }

function IsNumeric(S: string): Boolean;
var
   I: Integer;
begin
   Result := True;
   if Length(S) = 0 then
   begin
      Result := False;
   end
   else
   begin
      for I := 1 to Length(S) do
      begin
         if not CharInSet(S[I],['-', '.', '0'..'9']) then
         begin
            Result := False;
            Exit;
         end;
      end;
   end;
end;

function FormatValueForTableur(TypeSuiteOffice : integer; ValStr: string; TypeValue: integer): string;
//Renvoi la valeur formatté en fonction du type de donnée utilisé
begin
   Result := ValStr;
   if TypeValue = CsTypeValueString then
   begin
      ValStr := strReplace(ValStr, #34, #32);
      case TypeSuiteOffice of
         CsOpenOffice :
         begin
            if strEmpty(ValStr) then Result := #39 + #32 else Result := #39 + ValStr;
         end;
         CsLibreOffice :
         begin
            if strEmpty(ValStr) then
            begin
               Result := #32;
            end
            else
            begin
               //if IsNumeric(ValStr) then Result := #39 + ValStr;
               Result := #34 + ValStr + #34;
            end;
         end;
         CsMsOffice :
         begin
            if strEmpty(ValStr) then Result := #34 + #32 + #34 else Result := #34 + ValStr + #34;
         end;
      end;
   end
   else
   begin
      if (pos('%', ValStr) > 0) then
      begin
         case TypeSuiteOffice of
            CsOpenOffice, CsLibreOffice : Result := strReplace(ValStr, '.', ',');
            CsMsOffice : Result := ValStr;
         end;
      end
      else if IsNumeric(copy(ValStr, length(ValStr), 1)) then
      begin
         ValStr := strTrimA(ValStr);
         if IsNumeric(ValStr) then
         begin
            case TypeSuiteOffice of
               CsOpenOffice, CsLibreOffice : Result := strReplace(ValStr, '.', ',');
               CsMsOffice : Result := ValStr;
            end;
         end;
      end;
   end;
end;

{$ifdef VER_XE5_UP}
function strTrimChR(const S: Ansistring; C: AnsiChar): Ansistring; overload;
begin
   Result := S;
   while (Length(Result) > 0) and (Result[Length(Result)] = C) do
      Delete(Result, Length(Result), 1);
end;

function strLeft(const S: Ansistring; len: Integer): Ansistring; overload;
begin
   Result := Copy(S, 1, len);
end;

function strMake(C: AnsiChar; len: Integer): Ansistring; overload;
begin
   Result := strPadChL('', C, len);
end;

function strTrimChL(const S: ansistring; C: ansiChar): ansistring; overload;
begin
   Result := S;
   while (Length(Result) > 0) and (Result[1] = C) do Delete(Result, 1, 1);
end;

function strPadChL(const S: Ansistring; C: AnsiChar; len: Integer): AnsiString; Overload;
begin
   Result := S;
   while Length(Result) < len do Result := C + Result;
end;

function strTrim(const S: Ansistring): Ansistring; overload;
begin
   Result := strTrimChR(strTrimChL(S, BLANK), BLANK);
end;


function CharsInString(S1, S2: ansistring): Integer; overload;
var
   J, I: Integer;
begin
   Result := 0;
   for I := 1 to Length(S1) do
      for J := 1 to Length(S2) do
         if S1[I] = S2[J] then
         begin
            Result := I;
            exit;
         end;
end;

function strToken(var S: Ansistring; SEPARATOR: Ansistring): Ansistring; overload;
var
   I: Word;
begin
   I := CharsInString(S, SEPARATOR);

   if I <> 0 then
   begin
      if Length(S) = I then { letztes Wort...}
      begin
         Result := System.Copy(S, 1, I);
         if Pos(Result[Length(Result)], SEPARATOR) <> 0 then
            System.Delete(Result, Length(Result), 1);
      end else
         Result := System.Copy(S, 1, I - 1);
      System.Delete(S, 1, I);
   end else
   begin
      Result := S;
      S := '';
   end;
end;

function StrUpper(const S: Ansistring): Ansistring; overload;
begin
   Result := ansistring(AnsiUpperCase(string(S)));
end;

function StrLower(const S: Ansistring): Ansistring;
begin
   Result := ansistring(AnsiLowerCase(string(S)));
end;

function strOemAnsi(const S: Ansistring): Ansistring; Overload;
begin
	if length(s) >0 then
	begin
	{$IFDEF Win32}
	SetLength(Result, Length(S));
	{$ELSE}
	Result[0] := Chr(Length(S));
	{$ENDIF}
	OemToAnsiBuff(@S[1], @Result[1], Length(S));
	end
	else result:='';

end;

function strAnsiOem(const S: Ansistring): Ansistring; overload;
begin
	if length(s) >0 then
	begin
	{$IFDEF Win32}
	SetLength(Result, Length(S));
	{$ELSE}
	Result[0] := Chr(Length(S));
	{$ENDIF}
	AnsiToOemBuff(@S[1], @Result[1], Length(S));
	end
	else result:='';
end;

function strEmpty(const S: ansistring): Boolean overload;
begin
   Result := Length(strTrim(S)) = 0;
end;

{$endif}


initialization
   Randomize;

   SysMetric := TSystemMetric.Create;
   {$IFDEF Win32}
   IsWin95 := CheckWin95;
   IsWinNT := CheckNT;
   IsWin7  := CheckWin7;
   {$ELSE}
   IsWin95 := False;
   IsWinNT := False;
   {$ENDIF}

   IsFabula := nil;

   {$IFDEF Win32}
   xLanguage := (LOWORD(GetUserDefaultLangID) and $3FF);
   case xLanguage of
      LANG_GERMAN: xLangOfs := 70000;
      LANG_ENGLISH: xLangOfs := 71000;
      LANG_SPANISH: xLangOfs := 72000;
      LANG_RUSSIAN: xLangOfs := 73000;
      LANG_ITALIAN: xLangOfs := 74000;
      LANG_FRENCH: xLangOfs := 75000;
      LANG_PORTUGUESE: xLangOfs := 76000;
      else xLangOfs := 71000;
   end;
   {$ENDIF}
   CurrentFileProgramPath := '';


   {$IFDEF Win32}
finalization
   SysMetric.Free;
   {$ELSE}
   AddExitProc(DoneXProcs);
   {$ENDIF}
end.

