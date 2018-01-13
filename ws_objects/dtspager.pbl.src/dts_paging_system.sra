$PBExportHeader$dts_paging_system.sra
$PBExportComments$HotelExpert Paging System 1.0
forward
global type dts_paging_system from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global n_cst_vzt_error error
global message message
end forward

global variables
nvo_vzt_appman     gnv_appman
string	gs_debugmode = 'N',  gs_trace = 'N'
string 	gs_snpp_addr, gs_snpp_port

//string cPassUserName
//string cdberrormessage
//string csqlerrorfile
//string cdberrorfile
//string cappname
//General Error variables
string cDBErrorMessage = ""
string cSysErrorMessage = ""
string cSQLErrorMessage = ""
string cDBErrorFile = ""
string cSysErrorFile = ""
string cSQLErrorFile=""
string cGenFind=""
string cDupCallException=""

//System Setting Variables
string cAppDB = ""
string cRegCompany = ""
string cRegSite = ""
string cRegName = ""
string cRegSerNumber = ""
string cSysName = ""
string cSysVersion = ""
string cAppName = ""
string cAppVersion = ""
string cAppPath = ""
string cOSName = ""
string cOSVersion = ""
string cINIPath = ""
string cINIFile = "he_dts.ini"
string cHelpFile = "dtspage.hlp"
string cHelpPath = ""
string cDateFormat = ""
string cTimeFormat = ""
string cMainTitle = ""
string cOrigAppIcon=""
string cAppDBms
string cAppServerName
string cAppLogpass
string cAppDbpass
string cAppDBparm
string cAppDBUserid
string cAppDBtype
string cAppDBLogid
integer errFileNo
string usrErrFileNm
string sysErrFileNm
string phoneLineParm
integer nScreenWidth, nScreenHeight
boolean lPassWordOK = False
string cPassUserName = ""
integer nPassUserRights = 0
long nDataEntryTimeout=0
integer nExitAppMode=0
integer gi_user_rights
integer nPagingRefresh
integer gi_comPort 			//  comport
string cPageSysCd
string cPageSysCdIni
integer nPagerIdDigit
string hiddenDialupBox
string cScreenSettingPath = ""
string cScreenSettingFile = "ScrnSetting.dat"
string cRoomAllowDup

// TAP Dialup variables
string port // use comport instead
string baud 
string modem_init_str
string modem_dial_str
string access_number
string pager_id 
string max_chars_per_blk
string msgStr
string debug_file
char retmsg[100]


// Global Constants for TAP
string	gs_settings="9600,N,8,1"

integer MAX_RETRIES =8  //visplex is 3
integer MAX_NAKRETRIES =8  //visplex is 3
integer MAX_DELAY =50     //visplex is 40

integer CODE_SOH = 1
integer CODE_STX = 2
integer CODE_ETX = 3
integer CODE_EOT = 4
integer CODE_ENQ = 5
integer CODE_ACK = 6
integer CODE_NAK = 21 // 15 HEX !!!!!!
integer CODE_CR = 13
integer CODE_LF = 10

integer CODE_BS = 8
integer CODE_HT = 9
integer CODE_NL = 10
integer CODE_VT = 11
integer CODE_SO = 14

integer CODE_SYN = 22
integer CODE_ETB = 23
integer CODE_CAN = 24
integer CODE_EM = 25
integer CODE_SUB = 26
integer CODE_ESC = 27
integer CODE_FS = 28
integer CODE_GS = 29
integer CODE_RS = 30
integer CODE_US = 31

// Current Stage codes
integer sndCheck 		= 1
integer sndSendCR 		= 2
integer sndWaitID 		= 3
integer sndSendPG1 	= 4
integer sndWaitAck1 	= 5
integer sndSendMessage 	= 6
integer sndWaitAck2 	= 7
integer sndSendEOT 	= 8

// ESPA Stages
integer snd_ESPA_SendEOT 			= 8
integer snd_ESPA_PollENQ 			= 9
integer snd_ESPA_SelectENQ 		= 91
integer snd_ESPA_Wait_Select_ACK		= 10
integer snd_ESPA_Received_Select_ACK	= 11
integer snd_ESPA_Received_Select_NACK	= 12
integer snd_ESPA_Wait_DATA_ACK01		= 14
integer snd_ESPA_Received_DATA_ACK01	= 15
integer snd_ESPA_Received_DATA_NACK01	= 16
integer snd_ESPA_Wait_DATA_ACK02		= 17
integer snd_ESPA_Received_DATA_ACK02	= 18
integer snd_ESPA_Received_DATA_NACK02	= 19



integer errNoError 		= 0
integer errCheck 		= 1
integer errSendCR 		= 2
integer errWaitID 		= 3
integer errSendPG1		= 4
integer errWaitAck1		= 5
integer errSend 		= 6
integer errWaitAck2		= 7

//ESPA errors
integer errWaitAck		= 8 // any ack
/////////////////////////////////////////////

// date/time format setting
string cDateFormatStr=""
string cDateTimeFormatStr=""
string cTimeFormatStr=""
string cReportDateTimeFormatStr=""
string cReportDateFormatStr=""
string cReportLongDateFormatStr=""
string cReportLongDateFormatStr1=""
string cReportLongDateFormatStr2=""


end variables

global type dts_paging_system from application
string appname = "dts_paging_system"
end type
global dts_paging_system dts_paging_system

type prototypes
//Function int GetWindowsDirectory( REF STRING WinDir, INT cbSysPath ) library "krnl386.exel"
Function uint GetWindowsDirectoryA( REF STRING WinDir, INT cbSysPath ) library "kernel32.dll" alias for "GetWindowsDirectoryA;Ansi"
Function int send_alpha_page(ref string iport, ref string ibaud, ref string imodem_init_str, ref string imodem_dial_str, ref string iaccess_number, ref string ipager_id, ref string imax_chars_per_blk, ref string imsg, ref string idebug_file, ref char iretmsg[100]) LIBRARY "powerp32.dll" alias for "send_alpha_page;Ansi"
Function int PowerPage(ref string iport, ref string ibaud, ref string imodem_init_str,& 
ref string imodem_dial_str, ref string iaccess_number, ref string ipager_id, &
ref string imax_chars_per_blk, ref string imsg, ref string idebug_file, ref char iretmsg[100],&
ref string line1, ref string line2, ref string line3,ref string minimize) LIBRARY "powerp32.dll" alias for "PowerPage;Ansi"
end prototypes

on dts_paging_system.create
appname="dts_paging_system"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create n_cst_vzt_error
end on

on dts_paging_system.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_openlog)
if lower(Message.StringParm) = 'cancel' then return
string ls_ini
ls_ini = cINIPath + cINIFile // use ini file from windows directory
//ls_ini = cINIFile // use ini file from HotelExpert directory
//MessageBox("AppName",ProfileString (ls_ini,"Application", "AppName", "<?>"))
cAppName 			= ProfileString (ls_ini,"Application", "AppName", "<?>")
SysErrFileNm   	= cInIPath + ProfileString(ls_ini,"Paging Systems", "SysErrFile","<?>")
cPageSysCd 	   	= ProfileString (ls_ini,"Paging Systems", "PagingSysCd","TX")
cPageSysCdIni 	   = ProfileString (ls_ini,"Paging Systems", "PagingSysCd","TX")
nPagingRefresh 	= ProfileInt 	 (ls_ini,"Paging Systems", "ReadSeconds",60)
nPagerIdDigit  	= ProfileInt 	 (ls_ini,"Paging Systems", "PagerIdDigit",7)
access_number 		= ProfileString (ls_ini,"Paging Systems", "AccessNumber","<?>")
debug_file 			= ProfileString (ls_ini,"Paging Systems", "DebugFile","<?>")
baud 					= ProfileString (ls_ini,"Paging Systems", "ModemBaud","1200")
modem_init_str 	= ProfileString (ls_ini,"Paging Systems", "ModemInitStr","")
modem_dial_str 	= ProfileString (ls_ini,"Paging Systems", "ModemDialStr","")
max_chars_per_blk = ProfileString (ls_ini,"Paging Systems", "MaxCharsPerBlk","80")
hiddenDialupBox 	= ProfileString (ls_ini,"Paging Systems", "HiddenDialBox","N")

MAX_RETRIES 		= ProfileInt 	 (ls_ini,"Paging Systems", "MaxRetries",  8 )
MAX_NAKRETRIES 	= ProfileInt 	 (ls_ini,"Paging Systems", "MaxNakRetries",8 )
MAX_DELAY			= ProfileInt 	 (ls_ini,"Paging Systems", "MaxDelay", 50	)
gs_debugmode		= ProfileString (ls_ini,"Paging Systems", "Debug", 'N')
gs_trace				= ProfileString (ls_ini,"Paging Systems", "Trace", 'N')
gs_settings			= ProfileString (ls_ini,"Paging Systems", "Settings", '9600,N,8,1')
gs_snpp_addr		= ProfileString (ls_ini,"Paging Systems", "SNPPADDR", 'snpp.nextel.com')
gs_snpp_port		= ProfileString (ls_ini,"Paging Systems", "SNPPPORT", '444')

//MessageBox('snpp_addr',gs_snpp_addr)

string ls_comport
ls_comport 			= ProfileString (ls_ini,"Paging Systems", "CommPort","0")
If IsNumber (ls_comport ) then gi_comPort = integer ( ls_comport )

if CommandParm() = "" then 
	If gi_comPort = 0 then
//		gi_comPort = 3 //vz
		gi_comPort = 1 //mn
	end if
else
	gi_comPort = integer(CommandParm()) // overrides ini file !!!
end if

if CommandParm()  = "" and cPageSysCdIni = "DI" then // using dialup connection and test only
	port = "COM2"
else
	port = "COM"+string(gi_comPort) 
end if
//MessageBox('port',port)
cAppDB   		= ProfileString(ls_ini, "Database", "DBName", "<?>")
cAppDBms 		= ProfileString(ls_ini, "Database", "DBMS", "")
cAppServerName = ProfileString(ls_ini, "Database", "DBServerName", "")
cAppLogpass 	= ProfileString(ls_ini, "Database", "DBLogPass", "")
cAppDBpass  	= ProfileString(ls_ini, "Database", "DBPass", "")
cAppDBparm  	= ProfileString(ls_ini, "Database", "DBParm", "")
cAppDBUserid  	= ProfileString(ls_ini, "Database", "DBUserid", "")
cAppDBLogid  	= ProfileString(ls_ini, "Database", "DBLogid", "")
cAppDBtype   	= ProfileString(ls_ini, "Database", "DBType", "")

//sqlca.dbms 		= 'ODBC'
//sqlca.userid 	= 'dba'
//sqlca.logid 		= 'dba'
//sqlca.logpass 	= 'sql'
//sqlca.dbpass 	= 'sql'

sqlca.database 	= cAppDB
sqlca.servername 	= cAppServerName
sqlca.logid 		= cAppDBLogid
sqlca.userid 		= cAppDBUserid
sqlca.dbms 			= cAppDBms
sqlca.logpass 		= cAppLogpass 
sqlca.dbpass 		= cAppDBpass
sqlca.dbparm 		= cAppDBparm

CONNECT USING SQLCA;

IF SQLCA.SQLCode <> 0 THEN
	messagebox("Connect",sqlca.sqlerrtext)
	MessageBox( "Connect Error", "A connection to the " + cAppName+&
										  " database could not"+&
								        " be established!", StopSign! )
	HALT Close
END IF

gnv_appman 					= CREATE nvo_vzt_appman
application 				la_app
la_app 						= this 
//gnv_appman.uf_initialize( la_app , '' )
gnv_appman.event ue_getsysoptions() 

gnv_appman.is_apptitle		= 'SmartPaging'
gnv_appman.id_last_updated = date( '2002 Jan 30') 
gnv_appman.is_version		= '2.01'
//gnv_appman.uf_startsecurity() 

execute immediate "SET TEMPORARY OPTION CONNECTION_AUTHENTICATION='Company=Metromedia &
Software;Application=HotelEXPERT;Signature=000fa55157edb8e14d818eb4fe3db41447146f1571g0ee85a830235a7b1519fd17606a739db658a1037'" using SQLCA;
open(w_main)

end event

event close;if IsValid( gnv_appman ) then destroy gnv_appman 
disconnect;
end event

