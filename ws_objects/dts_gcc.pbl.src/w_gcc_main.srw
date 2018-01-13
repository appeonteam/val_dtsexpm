$PBExportHeader$w_gcc_main.srw
forward
global type w_gcc_main from window
end type
type mdi_1 from mdiclient within w_gcc_main
end type
end forward

shared variables

end variables

global type w_gcc_main from window
boolean visible = false
integer y = 4
integer width = 2894
integer height = 1916
boolean titlebar = true
string title = "[Hotel Expert] - Dispatch Tracking System for Windows v2.0"
string menuname = "m_gcc_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 16777215
string icon = "gcc1.ico"
event ue_menu_set pbm_custom01
mdi_1 mdi_1
end type
global w_gcc_main w_gcc_main

event ue_menu_set;m_gcc_main.m_file.m_close.enabled = isvalid(this.getactivesheet())
m_gcc_main.m_file.m_print.enabled = isvalid(this.getactivesheet())
m_gcc_main.m_file.m_printscreen.enabled = isvalid(this.getactivesheet())

end event

event closequery;//int nCallLevel = 0, nTimerLevel = 0, nMainLevel = 0
//
//nMainLevel 	= Get_Event_Security( "1X" )
//// initially set to 0 (don't even password prompt) we'll set if open to
//// avoid double prompting to close all potential password windows...check 
//// for highest necessary.
////If IsValid( w_call_de ) Then
////	nCallLevel 	= Get_Event_Security( "CX" )
////End If
//If IsValid( w_timer_calls ) Then
//	nTimerLevel = Get_Event_Security( "TX" )
//End If
//
//// now check for the highest password needed
//// message.DoubleParm = si_process added to u_dw_maint.ue_closequery()
//If Is_PassWordOK( Max( nCallLevel, Max( nTimerLevel, nMainLevel ) ) ) &
//   Then
//	If IsValid( w_timer_calls ) Then
//		w_timer_calls.lPasswordNeeded2Close = False
//	End If
//	
//Else
//
//	If IsValid( w_timer_calls ) Then
//		w_timer_calls.lPasswordNeeded2Close = True
//	End If
//	Message.ReturnValue = 1	// Disallow Close
//End If
//
end event

on timer;// Set Window title w/time that Window Timer will update
This.title = cMainTitle + " - " + String( Now(), "hh:mm:ssam/pm")
If This.WindowState = Maximized! Then
 	nScreenWidth = This.Width
	nScreenHeight = This.Height
End If



end on

event open;
//w_main = this // for compatibility // VZ
//m_main = this.menuid // for compatibility // VZ

gnv_appman.iw_frame = this 

// Read INI file for toolbar profile
Get_ToolBar_Profile("W_gcc_Main", w_gcc_main)
cMainTitle = 'Commentator [GCC Tracking for HotelEXPERT]'
//cMainTitle = "["+cSysName+"] "+'Guest Comment Card'+" for "+cOSName

// For a floating toolbar, set the title of the floating window to
// be the same as the title of the frame window. Otherwise, the
// title will default to "FrameBar"

dispatch_tracking_system.toolbarframetitle = this.title

// for now, we'll set what was used in painter
w_gcc_openlog1.cb_2.Enabled=True
Close( w_gcc_openlog1 )

// this same line occurs in the timer for ths function
This.title = cMainTitle + " - " + String( Now(), "hh:mm:ssam/pm" )
cOrigAppIcon=this.Icon
dispatch_tracking_system.MicroHelpDefault = "{"+cAppName+"}"+"  Ready "

//ToolbarFrameTitle = cAppName + " main toolbar"

// Timer updates time in window title et. al.
Timer( 1, w_gcc_main )

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

Idle( nDataEntryTimeout )	
//If Pos( Upper( cCommandParm ), "CALLS " ) > 0 Then
//	m_gcc_main.m_data.m_opencalls1.TriggerEvent( Clicked! )
//End If
//If Pos( Upper( cCommandParm ), "TIMER " ) > 0 Then
//	m_gcc_main.m_view.m_timercalls.TriggerEvent( Clicked! )
//End If
//If Pos( Upper( cCommandParm ), "QA " ) > 0 Then
//	m_gcc_main.m_data.m_graphics.TriggerEvent( Clicked! )
//End If
//If Pos( Upper( cCommandParm ), "ALL " ) > 0 Then
//	m_gcc_main.m_view.m_allcalls.TriggerEvent( Clicked! )
//End If
//If Pos( Upper( cCommandParm ), "PENDING " ) > 0 Then
//	m_gcc_main.m_view.m_pendingcalls.TriggerEvent( Clicked! )
//End If

postevent("ue_post_open")
end event

event close;// Read INI file for toolbar profile
Save_ToolBar_Profile( "W_gcc_Main", w_main )
If This.WindowState = Maximized! Then
	SetProfileString( cINIPath + cINIFile, "Application", &
					"ScreenWidth", String(This.Width) )
	SetProfileString( cINIPath + cINIFile, "Application", &
					"ScreenHeight", String(This.Height) )
End If

end event

on w_gcc_main.create
if this.MenuName = "m_gcc_main" then this.MenuID = create m_gcc_main
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_gcc_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_gcc_main
long BackColor=276856960
end type

