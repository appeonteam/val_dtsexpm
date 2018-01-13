$PBExportHeader$w_maint.srw
$PBExportComments$Base DE Window.  Slugged from w_maint_slug
forward
global type w_maint from window
end type
type dw_1 from u_dw_maint within w_maint
end type
type p_unselected from picture within w_maint
end type
type p_selected from picture within w_maint
end type
type dw_report from datawindow within w_maint
end type
type cb_reset from commandbutton within w_maint
end type
type dw_1a from u_dw_maint within w_maint
end type
type cb_close from commandbutton within w_maint
end type
type cb_save from commandbutton within w_maint
end type
type cb_sort from commandbutton within w_maint
end type
type cb_find from commandbutton within w_maint
end type
type cb_delete from commandbutton within w_maint
end type
type cb_add from commandbutton within w_maint
end type
end forward

global type w_maint from window
integer x = 457
integer y = 384
integer width = 2647
integer height = 1664
boolean titlebar = true
string title = "DTS for Windows v2.0"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 134217750
event ue_printreport pbm_custom40
event ue_printscreen pbm_custom41
dw_1 dw_1
p_unselected p_unselected
p_selected p_selected
dw_report dw_report
cb_reset cb_reset
dw_1a dw_1a
cb_close cb_close
cb_save cb_save
cb_sort cb_sort
cb_find cb_find
cb_delete cb_delete
cb_add cb_add
end type
global w_maint w_maint

type variables
//DataWindow dwCurrDW
u_dw_maint dwCurrDW
boolean lPasswordNeeded2Close=True
string cFindNext, cColumnName
long nRowCtr, nTotRows, nRowEvery

end variables

on ue_printreport;MessageBox( "Almost There...", "This option is available for " + &
				"only selected screens...soon to be implemented " + &
				"application-wide.", Information! )

end on

on ue_printscreen;// It's what a Print does
int niAnswer
Int li_job_num

niAnswer = MessageBox( "Print Data?", &
				"Do you wish to Print a listing of the data "+&
				"partially shown on-screen?", &
				Question!, YesNo!, 2 )

If niAnswer = 1 Then
	// It's what a Print does...
	li_job_num = dwCurrDW.Print()
	If li_job_num < 1 then
		MessageBox( "Print Failure", &
			"Unable to open print job.")
		RETURN
	End If
End if

end on

on closequery;// The control's "ue_closequery" event simulates the window closequery
// event. It will cause the datawindow to check if there are any 
// unsaved changes.

If IsValid( dwCurrDW ) Then     // in case we close()d from a constructor or something
	IF NOT dwCurrDW.uf_allowclose() THEN
		Message.ReturnValue = 1
	END IF
End If
end on

on activate;dispatch_tracking_system.toolbarsheettitle = This.title

end on

on open;// Automatically retrieve into the first datawindow control.
// The main control is assumed to have the name dw_1.
SetMicroHelp( "Opening " + This.Title + " window...please wait." )
//m_graph m_thisone
//m_thisone = create m_graph
Get_Toolbar_Profile( This.Title, This )
dispatch_tracking_system.toolbarsheettitle = This.title

// this allows multiple mutually exclusive user-objects
// share same window (2nd is dw_1a and is initially hidden)
dwCurrDW = dw_1a                // allows rowfocusindicator to disable for win start
dwCurrDW.SetFocus()
dwCurrDW = dw_1
dwCurrDW.SetFocus()


end on

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
	// If left button is down, then drag control across window
//      This.Move( Parent.PointerX(), Parent.PointerY() )
Else
	// left button is down, set MicroHelp()
//      SetMicroHelp( This.Tag )
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
End If

end on

on w_maint.create
this.dw_1=create dw_1
this.p_unselected=create p_unselected
this.p_selected=create p_selected
this.dw_report=create dw_report
this.cb_reset=create cb_reset
this.dw_1a=create dw_1a
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_sort=create cb_sort
this.cb_find=create cb_find
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.Control[]={this.dw_1,&
this.p_unselected,&
this.p_selected,&
this.dw_report,&
this.cb_reset,&
this.dw_1a,&
this.cb_close,&
this.cb_save,&
this.cb_sort,&
this.cb_find,&
this.cb_delete,&
this.cb_add}
end on

on w_maint.destroy
destroy(this.dw_1)
destroy(this.p_unselected)
destroy(this.p_selected)
destroy(this.dw_report)
destroy(this.cb_reset)
destroy(this.dw_1a)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_sort)
destroy(this.cb_find)
destroy(this.cb_delete)
destroy(this.cb_add)
end on

on close;Save_Toolbar_Profile( This.Title, This )
end on

type dw_1 from u_dw_maint within w_maint
event ue_mousemove pbm_mousemove
string tag = "Enter data for this record in this area."
integer x = 96
integer y = 76
integer width = 2112
integer height = 1252
integer taborder = 30
end type

event ue_mousemove;call super::ue_mousemove;string cObject, cTag

// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is not down, so set MicroHelp()
	cObject = this.GetObjectAtPointer()   // Get object name

	// this takes care of "!" (bad dwDescribe()) AND no object
	cObject = Left( cObject, Max( Pos( cObject, "	" ) - 1, 0 ) )

	// now a little 'where are we and what do we show' logic
	If Len( Trim( cObject ) ) > 0   Then                    // if object under pointer
		cTag = Describe( cObject+".Tag" )                     // use object tag
		If Trim( cTag ) = "!" Or Trim( cTag ) = "?" Then
			cTag = ""
		End If
	Else                                                                                                    // else use     
		cTag = This.Tag                                                                 // use datawindow tag
	End If

	// a little insurance
	If Len( Trim( cTag ) ) <= 0 Then                                // if sonehow empty
		cTag = This.Tag                                                                 // then use datawindow tag
	End If
	// a little insurance
	If Len( Trim( cTag ) ) <= 0 Then                                // if sonehow empty
		cTag = Parent.Tag                                                                       // then use Window tag
	End If
	SetMicroHelp( cTag )
End If

end event

event getfocus;call super::getfocus;boolean lSfsg

lSfsg = True
// Set Window Instance Var with pointer to current DataWindow
// since we need to know the last chosen when a button
// is pressed.
Parent.SetRedraw( False )
If dwCurrDW <> This Then
	If IsValid( dwCurrDW ) Then
		// make sure we want to leave last datawindow
		dwCurrDW.TriggerEvent( "ue_closequery" )
		If message.DoubleParm = -1      Then // user cancelled from ue_closequery
			lSfsg = False
		Else
			dwCurrDw.SetRowFocusIndicator( p_unselected )
		End If
	End If
	If lSfsg Then
		dwCurrDw = This
		dwCurrDw.SetRowFocusIndicator( p_selected, 50 )
		dwCurrDW.SetFocus()     // reset focus to last datawindow
	ElseIf IsValid( dwCurrDW ) Then // make sure it is valid
		dwCurrDW.SetFocus()     // reset focus to last datawindow
	End If
End If
Parent.SetRedraw( True )

end event

type p_unselected from picture within w_maint
boolean visible = false
integer x = 169
integer y = 232
integer width = 133
integer height = 92
string picturename = "hand02b.bmp"
boolean focusrectangle = false
end type

type p_selected from picture within w_maint
boolean visible = false
integer x = 165
integer y = 128
integer width = 133
integer height = 92
string picturename = "hand02a.bmp"
boolean focusrectangle = false
end type

type dw_report from datawindow within w_maint
boolean visible = false
integer x = 1033
integer y = 1392
integer width = 494
integer height = 360
integer taborder = 20
end type

on retrievestart;//nRowCtr = 0

end on

type cb_reset from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Abandon un-saved changes.  You will be prompted before this occurs."
integer x = 2286
integer y = 1060
integer width = 251
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Reset"
boolean cancel = true
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// It's what a Reset does
int niAnswer
niAnswer = MessageBox("Reset Data?", &
				"Do you wish to ABANDON any CHANGES made on this screen "+&
				"since last save?" &
				, Question!, YesNo!, 2 )

If niAnswer = 1 Then
	// It's what a Reset does...
	ROLLBACK ;
	dwCurrDW.Retrieve()
//      Set_Buttons(0)
End If

end on

type dw_1a from u_dw_maint within w_maint
event ue_mousemove pbm_mousemove
string tag = "Enter data for this record in this area."
boolean visible = false
integer x = 59
integer y = 1384
integer width = 398
integer height = 124
integer taborder = 10
end type

event ue_mousemove;string cObject, cTag

// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is not down, so set MicroHelp()
	cObject = this.GetObjectAtPointer()   // Get object name

	// this takes care of "!" (bad dwDescribe()) AND no object
	cObject = Left( cObject, Max( Pos( cObject, "	" ) - 1, 0 ) )

	// now a little 'where are we and what do we show' logic
	If Len( Trim( cObject ) ) > 0   Then                    // if object under pointer
		cTag = Describe( cObject+".Tag" )                     // use object tag
		If Trim( cTag ) = "!" Or Trim( cTag ) = "?" Then
			cTag = ""
		End If
	Else                                                                                                    // else use     
		cTag = This.Tag                                                                 // use datawindow tag
	End If

	// a little insurance
	If Len( Trim( cTag ) ) <= 0 Then                                // if sonehow empty
		cTag = This.Tag                                                                 // then use datawindow tag
	End If
	// a little insurance
	If Len( Trim( cTag ) ) <= 0 Then                                // if sonehow empty
		cTag = Parent.Tag                                                                       // then use Window tag
	End If
	SetMicroHelp( cTag )
End If

end event

on getfocus;call u_dw_maint::getfocus;boolean lSfsg

lSfsg = True
// Set Window Instance Var with pointer to current DataWindow
// since we need to know the last chosen when a button
// is pressed.
Parent.SetRedraw( False )
If dwCurrDW <> This Then
	If IsValid( dwCurrDW ) Then
		// make sure we want to leave last datawindow
		dwCurrDW.TriggerEvent( "ue_closequery" )
		If message.DoubleParm = -1      Then // user cancelled from ue_closequery
			lSfsg = False
		Else
			dwCurrDw.SetRowFocusIndicator( p_unselected )
		End If
	End If
	If lSfsg Then
		dwCurrDw = This
		dwCurrDw.SetRowFocusIndicator( p_selected, 50 )
		dwCurrDW.SetFocus()     // reset focus to last datawindow
	ElseIf IsValid( dwCurrDW ) Then // make sure it is valid
		dwCurrDW.SetFocus()     // reset focus to last datawindow
	End If
End If
Parent.SetRedraw( True )

end on

type cb_close from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Exit and close this window.  You will be prompted for any un-saved changes."
integer x = 2286
integer y = 936
integer width = 247
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Close"
boolean cancel = true
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// Close the maint.

Close( parent )
end on

type cb_save from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Save any un-saved changes and leave editing mode."
integer x = 2286
integer y = 552
integer width = 247
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Save"
boolean default = true
end type

on ue_mousemove;SetMicroHelp( This.Tag )

end on

on clicked;// "ue_prepareupdate" is the hook to the control's save event.

If Is_PasswordOK( Get_Event_Security( "S" ) ) Then
	SetPointer( HourGlass! )
	dwCurrDW.TriggerEvent( "ue_closequery" )
End If
end on

type cb_sort from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Soprt the data in this workstations~' data-buffer from among selected fields."
integer x = 2286
integer y = 428
integer width = 247
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "S&ort"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// "ue_sort" is the hook to the control's sort event.
// The w_sort_by dialog box will be opened by this event.

SetPointer( HourGlass! )
dwCurrDW.TriggerEvent( "ue_sort" )

end on

type cb_find from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Find a record in thuis workstations~' data-buffer from among selected fields."
integer x = 2286
integer y = 304
integer width = 247
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Find"
end type

on ue_mousemove;SetMicroHelp( This.Tag )

end on

event rbuttondown;long nFindResult

If Len( Trim( cFindNext ) ) > 0 Then
	If dwCurrDW.ii_currow >= dwCurrDW.RowCount() Then
		MessageBox( "Find Error", "You are at the last record.", StopSign! )
	Else
		// safe ti use ii_currow + 1 for start cuz we check for bounds above
		nFindResult = dwCurrDW.Find( cFindNext, dwCurrDW.ii_CurRow+1, dwCurrDW.RowCount() )
		If nFindResult > 0 Then
			dwCurrDW.SetRow( nFindResult )
			dwCurrDW.ScrollToRow( nFindResult )
		Else
			MessageBox( "String Not Found", "No more records with [" + cFindNext + "] found.", &
							StopSign! )
		End If
	End If
Else
	dwCurrDW.TriggerEvent( "ue_find" )
End If
end event

on clicked;// "ue_find" is the hook to the control's find event.
// The w_find dialog box will be opened by this event.

SetPointer( HourGlass! )
dwCurrDW.TriggerEvent( "ue_find" )
end on

type cb_delete from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Delete the currently selected record.  You will be prompted before this occurs."
integer x = 2286
integer y = 180
integer width = 247
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Delete"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// "ue_delete" is the hook to the control's delete event.

If Is_PasswordOK( Get_Event_Security( "D" ) ) Then
	SetPointer( HourGlass! )
	dwCurrDW.TriggerEvent( "ue_delete" )
End If
end on

type cb_add from commandbutton within w_maint
event ue_mousemove pbm_mousemove
string tag = "Add a new record to the currently selected data area on this window."
integer x = 2286
integer y = 52
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Add"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// "ue_insert" is the hook to the control's add event.
// Focus is not assumed by the control, it must be set.

If Is_PasswordOK( Get_Event_Security( "N" ) ) Then
	SetPointer( HourGlass! )
	dwCurrDw.TriggerEvent( "ue_insert" )
	dwCurrDw.SetFocus()
End If
end on

on rbuttondown;//Showhelp( "\consult\summit30\help\summit.hlp", Keyword!, "Reports" )
end on

