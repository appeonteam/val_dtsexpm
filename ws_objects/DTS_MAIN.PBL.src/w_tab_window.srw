$PBExportHeader$w_tab_window.srw
forward
global type w_tab_window from window
end type
type cb_close from picturebutton within w_tab_window
end type
type cb_reset from picturebutton within w_tab_window
end type
type cb_find from picturebutton within w_tab_window
end type
type cb_sort from picturebutton within w_tab_window
end type
type cb_save from picturebutton within w_tab_window
end type
type cb_delete from picturebutton within w_tab_window
end type
type cb_add from picturebutton within w_tab_window
end type
type cb_modify from picturebutton within w_tab_window
end type
type dw_7 from u_dw_maint_tab within w_tab_window
end type
type dw_6 from u_dw_maint_tab within w_tab_window
end type
type dw_5 from u_dw_maint_tab within w_tab_window
end type
type dw_4 from u_dw_maint_tab within w_tab_window
end type
type dw_3 from u_dw_maint_tab within w_tab_window
end type
type dw_2 from u_dw_maint_tab within w_tab_window
end type
type dw_1 from u_dw_maint_tab within w_tab_window
end type
type uo_tabbar_1 from u_bottom_bar within w_tab_window
end type
end forward

global type w_tab_window from window
boolean visible = false
integer x = 453
integer y = 384
integer width = 3109
integer height = 1852
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 8421504
event ue_printreport pbm_custom01
event ue_printscreen pbm_custom02
event ue_buttonsadd pbm_custom03
event ue_buttonsmod pbm_custom04
event ue_buttonsview pbm_custom05
event ue_refocus pbm_custom06
cb_close cb_close
cb_reset cb_reset
cb_find cb_find
cb_sort cb_sort
cb_save cb_save
cb_delete cb_delete
cb_add cb_add
cb_modify cb_modify
dw_7 dw_7
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
uo_tabbar_1 uo_tabbar_1
end type
global w_tab_window w_tab_window

type variables
u_dw_maint_tab dwCurrDW
boolean lPasswordNeeded2Close=True
string cCurColumnName
integer nCurRow
end variables

on ue_printreport;MessageBox( "Almost There...", "This option is available for " + &
				"only selected screens...soon to be implemented " + &
				"application-wide.", Information! )

end on

on ue_printscreen;// It's what a Print does
int niAnswer
Int li_job_num

niAnswer = MessageBox( "Print Data?", &
				"Do you wish to Print a full listing of the data "+&
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

on ue_refocus;if DwCurrDw.SetColumn(1) < 0 then
	Messagebox("error","setcolumn error ")
end if
end on

event resize;pointer cpOldPointer
int niCtr, ndwResizeHeight, ndwResizeWidth

SetMicroHelp( "Resizing " + this.title + " window...please wait." )
cpOldPointer = SetPointer( HourGlass! )
uo_tabbar_1.SetRedraw( False )
dw_1.SetRedraw( False )
dw_2.SetRedraw( False )
dw_3.SetRedraw( False )
dw_4.SetRedraw( False )
dw_5.SetRedraw( False )
dw_6.SetRedraw( False )
dw_7.SetRedraw( False )
This.SetRedraw( False )
cb_add.y    = This.WorkSpaceHeight() - cb_add.Height - cb_add.x
cb_modify.y = cb_add.y
cb_delete.y = cb_add.y
cb_save.y   = cb_add.y
cb_sort.y   = cb_add.y
cb_find.y   = cb_add.y
//cb_info.y   = cb_add.y
//cb_print.y  = cb_add.y
cb_reset.y  = cb_add.y
cb_close.y  = cb_add.y
//uo_tabbar_1.Width = This.WorkSpaceWidth() - ( uo_tabbar_1.X * 2 )
uo_tabbar_1.Y = cb_add.Y - cb_add.Height - cb_add.X
//ndwResizeWidth = Max( This.WorkSpaceWidth() - ( dw_1.X * 2 ), uo_tabbar_1.Width )
ndwResizeWidth = dw_1.Width
ndwResizeHeight = Max( uo_tabbar_1.Y - dw_1.Y + 1, &
							  dw_1.Y + 63 )	// 1 long for overlap

SetMicroHelp( "Resizing " + dw_1.title + " window...please wait." )
dw_1.Resize( ndwResizeWidth+70, ndwResizeHeight )
SetMicroHelp( "Resizing " + dw_2.title + " window...please wait." )
dw_2.Resize( ndwResizeWidth, ndwResizeHeight )
SetMicroHelp( "Resizing " + dw_3.title + " window...please wait." )
dw_3.Resize( ndwResizeWidth, ndwResizeHeight )
SetMicroHelp( "Resizing " + dw_4.title + " window...please wait." )
dw_4.Resize( ndwResizeWidth, ndwResizeHeight )
SetMicroHelp( "Resizing " + dw_5.title + " window...please wait." )
dw_5.Resize( ndwResizeWidth, ndwResizeHeight )
SetMicroHelp( "Resizing " + dw_6.title + " window...please wait." )
dw_6.Resize( ndwResizeWidth, ndwResizeHeight )
SetMicroHelp( "Resizing " + this.title + " window...please wait." )
dw_7.Resize( ndwResizeWidth, ndwResizeHeight )
SetMicroHelp( "Resizing " + this.title + " window...please wait." )

dw_1.SetRedraw( True )
dw_2.SetRedraw( True )
dw_3.SetRedraw( True )
dw_4.SetRedraw( True )
dw_5.SetRedraw( True )
dw_6.SetRedraw( True )
dw_7.SetRedraw( True )
uo_tabbar_1.SetRedraw( True )
This.SetRedraw( True )

// NEVER SET VISIBLE OR ENABLED WHILE dw.SetRedraw( False ) or 
//  you sort of lose Tab Order (i.e., the datawindow fields become non-editable)
dwcurrdw.Visible = True
//This.SetPosition( ToTop! )
//dwCurrDW.SetPosition( Behind!, uo_tabbar_1 )

//uo_tabbar_1.Y = uo_tabbar_1.Y

SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
SetPointer( cpOldPointer )
dwcurrdw.SetFocus()

end event

event open;// Automatically retrieve into the first datawindow control.
// The main control is assumed to have the name dw_1.
SetMicroHelp( "Opening " + This.Title + " window...please wait." )

lPassWordOK = Is_PasswordOK( Get_Event_Security( "BO" ) )

If lPassWordOK Then
	// this allows multiple mutually exclusive user-objects
	// share same window (2nd is dw_1a and is initially hidden)
	dwCurrDW = dw_1
//	This.SetRedraw( False )
	dw_1.SetRedraw( False )
	dw_2.SetRedraw( False )
	dw_3.SetRedraw( False )
	dw_4.SetRedraw( False )
	dw_5.SetRedraw( False )
	dw_6.SetRedraw( False )
	dw_7.SetRedraw( False )
	dw_2.Move( dw_1.X, dw_1.Y )
	dw_3.Move( dw_1.X, dw_1.Y )
	dw_4.Move( dw_1.X, dw_1.Y )
	dw_5.Move( dw_1.X, dw_1.Y )
	dw_6.Move( dw_1.X, dw_1.Y )
	dw_7.Move( dw_1.X, dw_1.Y )
	dw_1.SetRowFocusIndicator( Hand!, 32 )
	dw_2.SetRowFocusIndicator( Hand!, 32 )
	dw_3.SetRowFocusIndicator( Hand!, 32 )
	dw_4.SetRowFocusIndicator( Hand!, 32 )
	dw_5.SetRowFocusIndicator( Hand!, 32 )
	dw_6.SetRowFocusIndicator( Hand!, 32 )
	dw_7.SetRowFocusIndicator( Hand!, 32 )
	// trigger selecting the 1st tab-control in the tab-bar control
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 7, 7 )
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 6, 6 )
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 5, 5 )
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 4, 4 )
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 3, 3 )
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 2, 2 )
	uo_tabbar_1.TriggerEvent( "ue_bar_clicked", 1, 1 )
	This.TriggerEvent( "resize" )
	This.Visible = True
//	dw_1.SetPosition( ToTop! )
//	dw_2.SetPosition( ToTop! )
//	dw_3.SetPosition( ToTop! )
//	dw_4.SetPosition( ToTop! )
//	dw_5.SetPosition( ToTop! )
//	This.SetRedraw( True )
End If
end event

on closequery;// The control's "ue_closequery" event simulates the window closequery
// event. It will cause the datawindow to check if there are any 
// unsaved changes.
//If Is_PasswordOK( Get_Event_Security( "BX" ) ) Then
If IsValid( dwCurrDW ) Then	// in case we close()d from a constructor or something
	If Not dwCurrDW.uf_AllowClose() Then
		Message.ReturnValue = 1		// disallow close
	End If
End If

end on

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
	// If left button is down, then drag control across window
//	This.Move( Parent.PointerX(), Parent.PointerY() )
Else
	// left button is down, set MicroHelp()
//	SetMicroHelp( This.Tag )
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
End If

end on

on w_tab_window.create
this.cb_close=create cb_close
this.cb_reset=create cb_reset
this.cb_find=create cb_find
this.cb_sort=create cb_sort
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.cb_modify=create cb_modify
this.dw_7=create dw_7
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.uo_tabbar_1=create uo_tabbar_1
this.Control[]={this.cb_close,&
this.cb_reset,&
this.cb_find,&
this.cb_sort,&
this.cb_save,&
this.cb_delete,&
this.cb_add,&
this.cb_modify,&
this.dw_7,&
this.dw_6,&
this.dw_5,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.uo_tabbar_1}
end on

on w_tab_window.destroy
destroy(this.cb_close)
destroy(this.cb_reset)
destroy(this.cb_find)
destroy(this.cb_sort)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.cb_modify)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.uo_tabbar_1)
end on

type cb_close from picturebutton within w_tab_window
string tag = "EXIT this window."
integer x = 2359
integer y = 1312
integer width = 279
integer height = 112
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// Close the maint.
Close( parent )

end event

type cb_reset from picturebutton within w_tab_window
string tag = "RESET all changes to a record."
integer x = 2039
integer y = 1312
integer width = 279
integer height = 112
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Reset"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// It's what a Reset does
int niAnswer
niAnswer = MessageBox("Reset Data?", &
				"Do you wish to ABANDON any CHANGES made on this screen "+&
				"since last save?" &
				, Question!, YesNo!, 2 )

If niAnswer = 1 Then
	// It's what a Reset does...
	ROLLBACK ;
	dwCurrDW.Retrieve()
//	Set_Buttons(0)
	Parent.TriggerEvent( "ue_buttonsview" )

End If
end event

type cb_find from picturebutton within w_tab_window
string tag = "FIND a particular record."
integer x = 1714
integer y = 1312
integer width = 279
integer height = 112
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Find"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// "ue_find" is the hook to the control's find event.
// The w_find dialog box will be opened by this event.

SetPointer( HourGlass! )
dwCurrDW.TriggerEvent( "ue_find" )
end event

type cb_sort from picturebutton within w_tab_window
string tag = "SORT displayed data."
integer x = 1394
integer y = 1312
integer width = 279
integer height = 112
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "S&ort"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// "ue_sort" is the hook to the control's sort event.
// The w_sort_by dialog box will be opened by this event.

SetPointer( HourGlass! )
dwCurrDW.TriggerEvent( "ue_sort" )

end event

type cb_save from picturebutton within w_tab_window
string tag = "SAVE any changes."
integer x = 1074
integer y = 1312
integer width = 279
integer height = 112
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Save"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// "ue_prepareupdate" is the hook to the control's save event.

/* SFM update 11-10  Added messagebox to prompt user for save
   also removed call to password window by using global user_rights   obtained in W_password window */ 

Int niAnswer
niAnswer = MessageBox( "Save Current Changes?", &
			"Do you wish to Save the "+dwCurrDW.Title+"?" &
			, Question!, YesNo!, 1 )
If niAnswer = 1 Then
//   If Is_PasswordOK( Get_Event_Security( "BS" ) ) Then  

 If gi_user_rights >= ( Get_Event_Security( "BS" ) ) Then  
   	SetPointer( HourGlass! )
   	dwCurrDW.TriggerEvent( "ue_prepareupdate" )
   	Parent.TriggerEVent( "ue_buttonsview" )
 ELse
      Beep(1)
		MessageBox("Insufficient Authorization", &
			"Sorry, the current password does not have sufficient rights "+&
			"for the requested operation.", StopSign! )     
 End if



End if
end event

type cb_delete from picturebutton within w_tab_window
string tag = "DELETE a record."
integer x = 754
integer y = 1308
integer width = 279
integer height = 112
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Delete"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;

// "ue_delete" is the hook to the control's delete event.

If is_passwordok(Get_Event_Security( "BD" ) ) Then
	SetPointer( HourGlass! )
	dwCurrDW.TriggerEvent( "ue_delete" )
End If
end event

type cb_add from picturebutton within w_tab_window
string tag = "Enter a NEW record."
integer x = 434
integer y = 1308
integer width = 279
integer height = 112
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Add"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;/* SFM Modification 11/03 removed messagebox and call to is_passwordok function
   instead we use a global variable which holds the last users
   sign-in rights, this variable is set in the w_password window
*/


int niAnswer

// "ue_insert" is the hook to the control's add event.
// Focus is not assumed by the control, it must be set.

//niAnswer = MessageBox( "Ceate New Record?", &
//			"Do you wish to CREATE a NEW "+dwCurrDW.Title+" record?" &
//			, Question!, YesNo!, 1 )
//If niAnswer = 1 Then
//	If Is_PasswordOK( Get_Event_Security( "BN" ) ) Then
   If gi_user_rights >= Get_Event_Security( "BN" ) Then

		// whatever we do, be nice
		SetPointer( HourGlass! )

		// allows set_buttons( # ) in descendant to be caled w/parm
		Parent.TriggerEvent( "ue_buttonsadd" )

		// allows ???...I knew once...
		dwCurrDW.TriggerEvent( "ue_insert" )

		// not assumed, must be set
		dwCurrDW.SetFocus()
//	End If
   Else
      Beep(1)
		MessageBox("Insufficient Authorization", &
			"Sorry, the current password does not have sufficient rights "+&
			"for the requested operation.", StopSign! )     
   End IF
//End If
end event

type cb_modify from picturebutton within w_tab_window
string tag = "Modify an existing record."
integer x = 114
integer y = 1304
integer width = 279
integer height = 112
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Modify"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;/* The following codes prevent users from modifying zone_group_code 'Z0' in Zone Group tab */
IF dwCurrdw.classname() = 'dw_7' then
	if dw_7.GetItemString(dw_7.GetRow(),"zone_group_code") = 'Z0' then
		messagebox("Error","Can't modify a system default entry!!!")
		return
	end if
end if
/* Zone group logic ends */ 

/* SFM Modification 11/03 removed call to is_passwordok function
   instead we use a global variable which holds the last users
   sign-in rights, this variable is set in the w_password window
*/

int niAnswer

nCurRow = dwCurrDW.GetRow() 
cCurColumnName = dwCurrDW.GetColumnName()
//messagebox("currow",string(ncurrow) + "  " + cCurColumnName)

dwCurrDW.SetRedraw(false)

If gi_user_rights >= get_event_security('BM') Then
	Parent.TriggerEvent( "ue_buttonsmod" )

	dwCurrDW.SetFocus()

	// if first column defined then go there
	If Len( dwCurrDW.is_firstcol ) > 0 Then
		dwCurrDW.SetColumn( dwCurrDW.is_firstcol )
	End If	

Else
   Beep(1)
	MessageBox("Insufficient Authorization", &
		"Sorry, the current password does not have sufficient rights "+&
		"for the requested operation.", StopSign! )     
End If

dwCurrDW.SetRedraw(true)

dwCurrDW.SetRow(ncurrow)

parent.postevent("ue_refocus")
end event

type dw_7 from u_dw_maint_tab within w_tab_window
integer x = 2112
integer y = 64
integer width = 279
integer height = 228
integer taborder = 80
borderstyle borderstyle = stylelowered!
end type

type dw_6 from u_dw_maint_tab within w_tab_window
integer x = 2523
integer y = 924
integer width = 279
integer height = 188
integer taborder = 70
end type

type dw_5 from u_dw_maint_tab within w_tab_window
integer x = 2523
integer y = 720
integer width = 288
integer height = 196
integer taborder = 60
borderstyle borderstyle = stylelowered!
end type

on getfocus;call u_dw_maint_tab::getfocus;//dwCurrDW=This
end on

type dw_4 from u_dw_maint_tab within w_tab_window
integer x = 2523
integer y = 492
integer width = 288
integer height = 196
integer taborder = 50
borderstyle borderstyle = stylelowered!
end type

on getfocus;call u_dw_maint_tab::getfocus;//dwCurrDW=This
end on

type dw_3 from u_dw_maint_tab within w_tab_window
integer x = 2523
integer y = 260
integer width = 288
integer height = 196
integer taborder = 40
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;//dwCurrDW=This
end event

type dw_2 from u_dw_maint_tab within w_tab_window
integer x = 2523
integer y = 36
integer width = 288
integer height = 196
integer taborder = 20
borderstyle borderstyle = stylelowered!
end type

on getfocus;call u_dw_maint_tab::getfocus;//dwCurrDW=This
end on

type dw_1 from u_dw_maint_tab within w_tab_window
integer x = 46
integer y = 36
integer width = 2889
integer height = 1104
integer taborder = 10
borderstyle borderstyle = stylelowered!
end type

type uo_tabbar_1 from u_bottom_bar within w_tab_window
integer x = 32
integer y = 1144
integer width = 2761
integer height = 124
integer taborder = 30
end type

event ue_bar_clicked;call super::ue_bar_clicked;boolean lSfsg

lSfsg = True
If IsValid( dwCurrDW ) Then
//	dwCurrDW.TriggerEvent( "ue_closequery" )	// if we're changing, then save any changes
//	If Message.DoubleParm = -1 Then	// user cancelled
	If Not dwCurrDW.uf_allowclose() Then
		lSfsg = False
	Else
		dwCurrDW.TriggerEvent( "ue_setfields" )
//		dwCurrDW.Visible = False
		lSfsg = True
	End If
End If

If lSfsg Then
	Choose Case ii_index
		Case 1
			dwCurrDW = dw_1
		Case 2
			dwCurrDW = dw_2
		Case 3
			dwCurrDW = dw_3
		Case 4
			dwCurrDW = dw_4
		Case 5
			dwCurrDW = dw_5
		Case 6
			dwCurrDW = dw_6
		Case 7
			dwCurrDW = dw_7
	End Choose
	If IsValid( dwCurrDW ) Then
//		dwCurrDW.Visible = True
		dwCurrDW.SetPosition( ToTop! )
	End If
End If

end event

on uo_tabbar_1.destroy
call u_bottom_bar::destroy
end on

