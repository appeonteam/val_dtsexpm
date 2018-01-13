$PBExportHeader$dispatch_tracking_system.sra
$PBExportComments$Hotel Expert - Dispatch for Windows v4.05(with zoning & response reports)
forward
global type dispatch_tracking_system from application
end type
global n_cst_vzt_tran sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global n_cst_vzt_error error
global message message
end forward

global variables
nvo_vzt_appman 	gnv_appman
string gs_pw

boolean lPassWordOK = False
string cPassUserName = ""
integer nPassUserRights = 0
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
string cHelpFile = ""
string cHelpPath = ""
string cDateFormat = ""
string cTimeFormat = ""
string cMainTitle = ""
string cOrigAppIcon="RUN02.ICO"
long nDataEntryTimeout=0
integer nExitAppMode=0
string cScreenSettingPath = ""
string cScreenSettingFile = "ScrnSetting.dat"
//Window awDEWindows[] = { w_call_de, w_tables1, w_admin, w_probsubprob }
string cDBErrorMessage = ""
string cSysErrorMessage = ""
string cSQLErrorMessage = ""
string cDBErrorFile = ""
string cSysErrorFile = ""
string cSQLErrorFile=""
string cGenFind=""
integer nScreenWidth, nScreenHeight
integer gi_user_rights
integer iJob
string cCommandParm
string cInitLoadQA="N"
string cInitLoadQAFile=""
string cInitLoadQAFile2=""
integer InitLoadCnt=1
//string cDupCallException=""
string cSoundCard=""
//string cRoomAllowDup=""

// 10/23/00 added for pager update screen 
string cPageSysCd
integer nPagerIdDigit
// 04/13/06 added for quickcall
string cQuickCallDept
string cQuickCallTime

// 11/07/97 DB settings
String  cAppDBms,cAppServerName,cAppLogpass
String cAppDBpass , cAppDBparm,cAppDBUserid
String cAppDBLogid , cAppDBtype

// date/time format setting
string cDateFormatStr=""
string cDateTimeFormatStr=""
string cTimeFormatStr=""
string cReportDateTimeFormatStr=""
string cReportDateFormatStr=""
string cReportLongDateFormatStr=""
string cReportLongDateFormatStr1=""
string cReportLongDateFormatStr2=""

integer init_user_right
end variables

global type dispatch_tracking_system from application
string appname = "dispatch_tracking_system"
end type
global dispatch_tracking_system dispatch_tracking_system

type prototypes
// These are Window's SDK Functions

// This function returns the RGB value of the default window color
FUNCTION long GetSysColor (int color) LIBRARY "user32.dll"

//   This function "flashes" a given window once. Flashing a window means
//   changing the appearance of its caption bar as if the window were changing
//   from inactive to active status, or vice versa.
FUNCTION boolean FlashWindow (int hWnd, boolean bInvert) LIBRARY "user32.dll"

//   This function scans global memory and returns the number of bytes
//   currently available. wFlags should be passed as 0.
FUNCTION long GetFreeSpace (int wFlags) LIBRARY "kernel32.dll"


//   This function retrieves a handle to the menu of the specified window.
FUNCTION int GetMenu (int hWnd) LIBRARY "user32.dll"

//   This function determines the number of items in the menu identified
//   by the hMenu parameter.
FUNCTION uint GetMenuItemCount (int hMenu) LIBRARY "user32.dll"

//   This function determines whether or not a window has been maximized.
FUNCTION boolean IsZoomed (int hWnd) LIBRARY "user32.dll"

// This function creates a system timer event
FUNCTION int SetTimer (int hWnd, int nIDEvent, uint wElapse, long lpTimerFunc) LIBRARY "user32.dll"

// This function kills a timer event
FUNCTION boolean KillTimer (int hWnd, int nIDEvent) LIBRARY "user32.dll"

// This function checks to see if an application is currently running
Function int GetModuleHandle (string modulename) Library "kernel32.dll" alias for "GetModuleHandle;Ansi"

// This function Used with GetModuleHandle will tell how many times an
// Application is running
Function int GetModuleUsage (long hWnd) Library "kernel32.dll"

// This function exits windows from an app
Function boolean ExitWindows( long rc, uint mbz ) library "user32.dll"

// This is my best shot
//Function long SetWindowLong( long hWnd, int 1a, uint 2b ) library "user32.dll"

// This lil' ditty gets the path of Win.com and the *.INI's
Function uint GetWindowsDirectoryA( REF STRING WinDir, INT cbSysPath ) library "kernel32.dll" alias for "GetWindowsDirectoryA;Ansi"

//set directory
FUNCTION boolean SetCurrentDirectoryA(ref string cdir) LIBRARY "kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"

//playsound

FUNCTION boolean sndPlaySoundA (string SoundName, uint Flags) LIBRARY "WINMM.DLL" alias for "sndPlaySoundA;Ansi"

FUNCTION uint waveOutGetNumDevs () LIBRARY "WINMM.DLL"

//create file
//FUNCTION long CreateFileA(string cfileNm, int iAccess, long iShare, attr, ) LIBRARY "kernel32.dll"

end prototypes

event open;int nWinHandle, nIdleStat

nExitAppMode = -1	// wouldn't want a 2nd instance abandonment to &
						// close OS if set that way in *.INI = -1 just shut app
						// (see *.INI file for values and results)

nWinHandle = handle( this, TRUE )
cAppName = ProfileString( cINIPath + cINIFile, "Application", "AppName", "<?>")
							
ToolbarFrameTitle = cAppName + " Main Toolbar"

//-----------------------------------------------------------------------
gnv_appman 					= CREATE nvo_vzt_appman
application 				la_app
la_app 						= this 
//gnv_appman.uf_initialize( la_app , '' )
gnv_appman.event ue_getsysoptions() 
gnv_appman.is_apptitle		= 'HotelEXPERT'
gnv_appman.id_last_updated = date( '2003 April 01') 
gnv_appman.is_version		= '4.06'
//-----------------------------------------------------------------------


//ToolbarSheetTitle = cAppName + " Main Toolbar"
If nWinHandle > 0 Then
	nWinHandle = MessageBox("WARNING", &
						cAppNAme + " already running, " +&
						"would you like to run ANOTHER copy of "+cAppName+"?", &
						StopSign!, OKCancel!, 2 )
	If nWinHandle = 1 Then
		nIdleStat = Idle(5)
		Open( w_openlog1 )
	Else
		Halt Close
	End If
Else
	nIdleStat = Idle(5)
	Open( w_openlog1 )
End If

end event

on systemerror;boolean lb_display = true
boolean lb_halt = true
int li_handle
string ls_errtext
string ls_cr_lf = Char( 13 ) + Char( 10 )
messagebox("System Error","systemerror event" + '  ' + string(error.number))

Choose Case error.number
	Case 1 	// divide by zero
		lb_display = False
		lb_halt    = False
	Case 2	// Null object reference
		lb_display = True
		lb_halt    = False
	Case 3, 4, 5, 6	// Array boundary exceeded, Enumerated value is out of range for function,
				// Negative value encountered in fuction, Invalid datawindow row/column specified
		lb_display = True
		lb_halt    = True
	Case 7	// Unresolvable external when linking reference
		lb_display = True
		lb_halt    = False
	Case 8, 9, 10, 12	// Reference of array with NULL subscript, DLL function not found in curr app
				// Unsupported argument type in DLL function, Datawindow column type 
				// doesn't match GetItem type
		lb_display = True
		lb_halt    = True
	Case 13, 14, 15, 16	// Unresolved attribute ref, Error opening DLL Lib for external func
				// Error calling external function, Maximum string size exceeded
		lb_display = True
		lb_halt    = True
	Case 17, 50, 51		// Datawindow referenced in datawindow object doesn't exist
				// Application reference could not be resolved, failure loading dynamic library
		lb_display = True
		lb_halt    = True
	Case Else
		lb_display = True
		lb_halt    = True
End Choose

// Log error to disk
// construct the error message
ls_errtext =String( Today() ) + " " + &
				String( Now() ) + ls_cr_lf + &
				"Error Number: " + String( error.number ) + ", " + &
				error.text + ls_cr_lf + &
				"Occurred in window : " + error.windowmenu + ls_cr_lf + &
				"         in object : " + error.object + ls_cr_lf + &
				"         in event  : " + error.objectevent + ls_cr_lf + &
				"         on line   : " + String( error.line ) + ls_cr_lf

// Open error file
If lb_display Then 
	MessageBox( "Execution Error", &
					cSysErrorMessage )
End If
li_handle = FileOpen( cSysErrorFile, &
								linemode!, write! )
If li_handle >= 0 Then

	// write the message into the text file
	FileWrite( li_handle, &
			"*---Execution Error-------------------------" + ls_cr_lf + &
			ls_errtext + &
			"*-------------------------------------------" + ls_cr_lf )
	// close the text file
	FileClose( li_handle )
Else
	MessageBox( "!!! ERROR ERROR...CANNOT RECORD ERROR INFORMATION !!!", &
					"Unable to record Error Info to File: "+cSYSErrorFile + "  " + &
					"Because " + cAppName + " is unable to record the following " + &
					"error information, please WRITE THE FOLLOWING MESSAGE DOWN " + &
					"WORD-FOR-WORD and give it to your supervisor so " + &
					"support personnel have the required information to resolve " + &
					"the problem." )

	MessageBox( "Execution Error...WRITE THIS DOWN!", &
					ls_errtext )
End If


//***-----

If lb_halt Then 
	HALT CLOSE
End If
end on

event close;
If IsValid( gnv_appman) Then destroy gnv_appman 
// The connection from the database should be dropped when execution stops

DISCONNECT ;

// set in *.INI file, may be used to for security purposes
// to close windows and/or boot machine from app
// (see *.INI file for values and results)
If nExitAppMode >= 0 Then
	ExitWindows( nExitAppMode, 0 )
End If


end event

event idle;integer niCtr = 0, niCtr2 = 0
boolean lClosedOne = False

IF IsValid( w_tables1 ) Then
	If w_tables1.dw_1.ModifiedCount() + &
		w_tables1.dw_2.ModifiedCount() + &
		w_tables1.dw_3.ModifiedCount() + &
		w_tables1.dw_4.ModifiedCount() + &
		w_tables1.dw_5.ModifiedCount() > 0 Then
		For niCtr = 1 TO 100
			FlashWindow( Handle( w_tables1 ), True )
			FlashWindow( Handle( w_main ), True )
			Beep(1)
		Next
		lClosedOne = True	
		ROLLBACK;
//		w_tables1.Set_Buttons(False)
		w_tables1.dw_1.Retrieve()
		w_tables1.dw_2.Retrieve()
		w_tables1.dw_3.Retrieve()
		w_tables1.dw_4.Retrieve()
		w_tables1.dw_5.Retrieve()
//		FlashWindow( Handle( w_call_de ), False )
		FlashWindow( Handle( w_main ), False )
	End If
End If

IF IsValid( w_admin ) Then
	If w_admin.lEditMode Then
		For niCtr = 1 TO 100
			FlashWindow( Handle( w_admin ), True )
			FlashWindow( Handle( w_main ), True )
			Beep(1)
		Next
		lClosedOne = True	
		ROLLBACK;
		w_admin.Set_Buttons(False)
		w_admin.dw_1.Retrieve()
		FlashWindow( Handle( w_admin ), False )
		FlashWindow( Handle( w_main ), False )
	End If
End If

IF IsValid( w_probsubprob ) Then
	If w_probsubprob.lEditMode Then
		For niCtr = 1 TO 100
			FlashWindow( Handle( w_probsubprob ), True )
			FlashWindow( Handle( w_main ), True )
			Beep(1)
		Next
		lClosedOne = True	
		ROLLBACK;
		w_probsubprob.Set_Buttons(False)
		w_probsubprob.dw_1.Retrieve()
		FlashWindow( Handle( w_probsubprob ), False )
		FlashWindow( Handle( w_main ), False )
	End If
End If

IF IsValid( w_Tables1 ) Then
	If  w_tables1.dw_1.ModifiedCount()+ &
			w_tables1.dw_2.ModifiedCount()+ &
			w_tables1.dw_3.ModifiedCount()+ &
			w_tables1.dw_4.ModifiedCount()+ &
			w_tables1.dw_5.ModifiedCount() > 0 Then
		For niCtr = 1 TO 100
			FlashWindow( Handle( w_tables1 ), True )
			FlashWindow( Handle( w_main ), True )
			Beep(1)
		Next
		lClosedOne = True	
		ROLLBACK;
		w_tables1.dw_1.Retrieve()
		w_tables1.dw_2.Retrieve()
		w_tables1.dw_3.Retrieve()
		w_tables1.dw_4.Retrieve()
		w_tables1.dw_5.Retrieve()
		FlashWindow( Handle( w_tables1 ), False )
		FlashWindow( Handle( w_main ), False )
	End If
End If

IF IsValid( w_call_upd ) Then
	If w_call_upd.dw_1.ModifiedCount() > 0 then
		For niCtr = 1 TO 100
			FlashWindow( Handle( w_call_upd ), True )
			FlashWindow( Handle( w_main ), True )
			Beep(1)
		Next
		lClosedOne = True	
		ROLLBACK;
		if w_call_upd.st_mode.text = 'Add' then
			w_call_upd.cb_add.TriggerEvent("Clicked")
		else
			w_call_upd.cb_reset.TriggerEvent("Clicked")
		end if
		FlashWindow( Handle( w_call_upd ), False )
		FlashWindow( Handle( w_main ), False )
	else
		if w_call_upd.st_mode.text = 'Add' then
			w_call_upd.cb_add.TriggerEvent("Clicked")	
		end if
	End If
	
End If

IF IsValid( w_callback_upd ) Then
	If w_callback_upd.dw_1.ModifiedCount() > 0 then
		For niCtr = 1 TO 100
			FlashWindow( Handle( w_callback_upd ), True )
			FlashWindow( Handle( w_main ), True )
			Beep(1)
		Next
		lClosedOne = True	
		ROLLBACK;
		w_callback_upd.cb_add.TriggerEvent("Clicked")
		FlashWindow( Handle( w_callback_upd ), False )
		FlashWindow( Handle( w_main ), False )

	End If
End If

If lClosedOne Then
	MessageBox("Changes Aborted", "You left the computer IDLE with " +&
					"changes UN-SAVED!  They were abandoned in order to "+&
					"free resources.", StopSign! )
End If

end event

on dispatch_tracking_system.create
appname="dispatch_tracking_system"
message=create message
sqlca=create n_cst_vzt_tran
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create n_cst_vzt_error
end on

on dispatch_tracking_system.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

