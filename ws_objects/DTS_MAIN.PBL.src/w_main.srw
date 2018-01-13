$PBExportHeader$w_main.srw
$PBExportComments$Main MDI window for the sample application.
forward
global type w_main from window
end type
type mdi_1 from mdiclient within w_main
end type
end forward

shared variables

end variables

global type w_main from window
boolean visible = false
integer y = 4
integer width = 2894
integer height = 1916
boolean titlebar = true
string title = "[Hotel Expert] - Dispatch Tracking System for Windows"
string menuname = "m_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 33086168
string icon = "RUN02.ICO"
event ue_menu_set pbm_custom01
mdi_1 mdi_1
end type
global w_main w_main

event ue_menu_set;m_main.m_file.m_close.enabled = isvalid(this.getactivesheet())
m_main.m_file.m_print.enabled = isvalid(this.getactivesheet())
m_main.m_file.m_printscreen.enabled = isvalid(this.getactivesheet())

end event

event closequery;int nCallLevel = 0, nTimerLevel = 0, nMainLevel = 0

nMainLevel 	= Get_Event_Security( "1X" )
// initially set to 0 (don't even password prompt) we'll set if open to
// avoid double prompting to close all potential password windows...check 
// for highest necessary.
//If IsValid( w_call_de ) Then
//	nCallLevel 	= Get_Event_Security( "CX" )
//End If
If IsValid( w_timer_calls ) Then
	nTimerLevel = Get_Event_Security( "TX" )
End If


// now check for the highest password needed
// message.DoubleParm = si_process added to u_dw_maint.ue_closequery()
If Is_PassWordOK( Max( nCallLevel, Max( nTimerLevel, nMainLevel ) ) ) &
   Then
	If IsValid( w_timer_calls ) Then
		w_timer_calls.lPasswordNeeded2Close = False
	End If
//	If IsValid( w_call_de ) Then
//		message.DoubleParm = 0	// just in case
//		w_call_de.lPasswordNeeded2Close = False
//	Else
//		Message.ReturnValue = 0	// Allow Close
//	End If
	
Else
//	If IsValid( w_call_de ) Then
//		w_call_de.lPasswordNeeded2Close = True
//	End If
	If IsValid( w_timer_calls ) Then
		w_timer_calls.lPasswordNeeded2Close = True
	End If
	Message.ReturnValue = 1	// Disallow Close
End If

end event

on timer;// Set Window title w/time that Window Timer will update
This.title = cMainTitle + " - " + String( Now(), "hh:mm:ssam/pm")
If This.WindowState = Maximized! Then
 	nScreenWidth = This.Width
	nScreenHeight = This.Height
End If



end on

event open;//string cCommandParm
//long var
// prevents main window from maximizing
//var = SetWindowLong(Handle(this), -16, 1456340992)
gnv_appman.event ue_getsysoptions() 
gnv_appman.iw_frame = this 

// Read INI file for toolbar profile
Get_ToolBar_Profile("W_Main", w_main)
cMainTitle = "["+cSysName+"] "+cAppNAme+" for "+cOSName

// For a floating toolbar, set the title of the floating window to
// be the same as the title of the frame window. Otherwise, the
// title will default to "FrameBar"

dispatch_tracking_system.toolbarframetitle = w_main.title

// for now, we'll set what was used in painter
w_openlog1.cb_2.Enabled=True
Close( w_openlog1 )

// initial login to control menu icon display **m.n. 5/20/07
Open(w_init_login)
if init_user_right = 0 then Halt Close

f_set_toolbar_icons(init_user_right)
//end initial login to control menu icon display **m.n. 5/20/07

// this same line occurs in the timer for ths function
This.title = cMainTitle + " - " + String( Now(), "hh:mm:ssam/pm" )
cOrigAppIcon=w_main.Icon
dispatch_tracking_system.MicroHelpDefault = "{"+cAppName+"}"+"  Ready "


//ToolbarFrameTitle = cAppName + " main toolbar"

// Timer updates time in window title et. al.
Timer( 1, w_main )

// Now show window
This.Visible = True
cCommandParm = CommandParm()
cCommandParm = cCommandParm + ProfileString( cINIPath +&
							"he_dts.ini", "Application", "CommandParm", "" ) + " "
cInitLoadQA = ProfileString (cINIPath +&
							"he_dts.ini","Q&A - Query", "InitLoadQA", "")
cInitLoadQAFile = ProfileString (cINIPath +&
							"he_dts.ini","Q&A - Query", "InitLoadQAFile", "")
cInitLoadQAFile2 = ProfileString (cINIPath +&
							"he_dts.ini","Q&A - Query", "InitLoadQAFile2", "")
cSoundCard = ProfileString (cINIPath + cINIFile,&
							"Application","SoundCArd", "Y")
							
//cDupCallException = ProfileString (cINIPath + cINIFile,&
//							"Call Screen - Data Entry","dupcallexecption", "")
gnv_appman.cDupCallException = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "Dupcallexecption", '' )
gnv_appman.cRoomAllowDup = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "RoomAllowDup", '' )
												
// add for pager update 10/23/00
cPageSysCd 	   = ProfileString(cINIPath + cINIFile,"Paging Systems", "PagingSysCd","<?>")		
nPagerIdDigit  = ProfileInt (cINIPath + cINIFile,"Paging Systems", "PagerIdDigit",7)

Idle( nDataEntryTimeout )	
If Pos( Upper( cCommandParm ), "CALLS " ) > 0 Then
	m_main.m_data.m_opencalls1.TriggerEvent( Clicked! )
End If
If Pos( Upper( cCommandParm ), "TIMER " ) > 0 Then
	m_main.m_view.m_timercalls.TriggerEvent( Clicked! )
End If
If Pos( Upper( cCommandParm ), "QA " ) > 0 Then
	m_main.m_data.m_graphics.TriggerEvent( Clicked! )
End If
If Pos( Upper( cCommandParm ), "ALL " ) > 0 Then
	m_main.m_view.m_allcalls.TriggerEvent( Clicked! )
End If
If Pos( Upper( cCommandParm ), "PENDING " ) > 0 Then
	m_main.m_view.m_pendingcalls.TriggerEvent( Clicked! )
End If

postevent("ue_post_open")
end event

event close;// Read INI file for toolbar profile
Save_ToolBar_Profile( "W_Main", w_main )
If This.WindowState = Maximized! Then
	SetProfileString( cINIPath + cINIFile, "Application", &
					"ScreenWidth", String(This.Width) )
	SetProfileString( cINIPath + cINIFile, "Application", &
					"ScreenHeight", String(This.Height) )
End If

end event

on w_main.create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_main
long BackColor=268435456
end type

