$PBExportHeader$w_admin.srw
forward
global type w_admin from w_maint
end type
type cb_modify from commandbutton within w_admin
end type
type cb_archive from commandbutton within w_admin
end type
end forward

global type w_admin from w_maint
boolean visible = false
integer x = 0
integer y = 168
integer width = 4494
integer height = 1612
string title = "Admin Screen - Data Entry"
string icon = "ADMIN01.ICO"
event ue_refocus pbm_custom58
cb_modify cb_modify
cb_archive cb_archive
end type
global w_admin w_admin

type variables
boolean lEditMode = False
boolean lNewRecord = False
string cFindNext
integer iCurRow
string cCurColumn
end variables

forward prototypes
public subroutine set_buttons (boolean ledit_mode)
public function boolean wf_check_dup_password (string chk_pwd)
public function boolean wf_check_dup_user (string firstnm, string lastnm)
public function boolean wf_check_dup_userid (string inuserid)
end prototypes

on ue_refocus;call w_maint::ue_refocus;if DwCurrDw.SetColumn(ccurcolumn) < 0 then
	Messagebox("error","setcolumn error: user_password")
end if
DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */
end on

public subroutine set_buttons (boolean ledit_mode);IF lEdit_Mode = True Then 
	lEditMode = True
Else
	lEditMode = False
End If

If lEditMode Then
//      dw_1.enabled    = True
//      dw_1a.enabled   = True

	cb_save.enabled    = True
	cb_reset.enabled   = True

	cb_add.enabled     = False
	cb_modify.enabled  = False
	cb_archive.enabled = False      // disabled for now
	cb_sort.enabled          = False
	cb_find.enabled    = False
	cb_delete.enabled  = False
	cb_close.enabled   = False
	dw_1.SetTabOrder("user_password",400)
	dw_1.SetTabOrder("user_fname",410)
	dw_1.SetTabOrder("user_lname",420)
	dw_1.SetTabOrder("user_id",430)
	dw_1.SetTabOrder("user_rights",450)
	dw_1.SetTabOrder("approval_budget",500) // VZ
	dw_1a.SetTabOrder("rights",520)

Else
	cb_save.enabled         = False
	cb_reset.enabled        = False
	cb_add.enabled          = True
	cb_modify.enabled       = True
	cb_archive.enabled      = False // disabled for now
	cb_sort.enabled                 = True
	cb_find.enabled                 = True
	cb_delete.enabled       = True
	cb_close.enabled        = True
	dw_1a.SetTabOrder("event",0)
	dw_1a.SetTabOrder("event_desc",0)
	dw_1a.SetTabOrder("rights",0)
	dw_1.SetTabOrder("user_password",0)
	dw_1.SetTabOrder("user_fname",0)
	dw_1.SetTabOrder("user_lname",0)
	dw_1.SetTabOrder("user_id",0)
	dw_1.SetTabOrder("user_rights",0)
	dw_1.SetTabOrder("approval_budget",0) // VZ
	lNewRecord = false
End If

end subroutine

public function boolean wf_check_dup_password (string chk_pwd);int found
found = 0

select count(*) into :found from user_rights where user_password = :chk_pwd;

if found > 0 then
	return false
else
	return true
end if

end function

public function boolean wf_check_dup_user (string firstnm, string lastnm);int found
found = 0

select count(*) into :found from user_rights 
where user_lname = :lastNm and user_fname=:firstNm;

if found > 0 then
	return false
else
	return true
end if


end function

public function boolean wf_check_dup_userid (string inuserid);int found
found = 0

select count(*) into :found from user_rights 
where user_id = :inUserId;

if found > 0 then
	return false
else
	return true
end if

end function

on ue_printreport;// It's what a Print does
int niAnswer
Int li_job_num

niAnswer = MessageBox( "Print Data?", &
				"Do you wish to Printer-Formatted Report of the data "+&
				"partially shown on-screen?", &
				Question!, YesNo!, 2 )

If niAnswer = 1 Then
	// It's what a Print does...
	if dwcurrdw.dataobject = 'd_admin' then
		dw_report.SetTransObject( sqlca )
		dw_report.Retrieve()    
		li_job_num = dw_report.Print()
		dw_report.Reset()   
	else
		li_job_num = dwcurrdw.print()
   end if 
	If li_job_num < 1 then
		MessageBox( "Print Failure", &
			"Unable to open print job.")
		RETURN
	End If
End if

end on

event open;call super::open;IF Is_PassWordOK( Get_Event_Security( "SO" ) ) Then
	Set_Buttons( False )
	dw_1.SetFocus() // sets inactive record pointer
	dw_1.Retrieve()

	dw_1a.SetFocus()        // sets inactive record pointer
	dw_1a.Retrieve()

	dw_1.SetFocus() // sets inactive record pointer
	This.SetRedraw( True )
Else
	Close(w_admin)
End If

if IsValid(w_main) then
	w_main.postevent("ue_menu_set")
end if	
end event

event deactivate;call super::deactivate;if IsValid(w_main) then
	w_main.postevent("ue_menu_set")
end if	
end event

on resize;call w_maint::resize;pointer cpOldPointer

SetMicroHelp( "Resizing " + this.title + " window...please wait." )
cpOldPointer = SetPointer( HourGlass! )
w_admin.SetRedraw( False )
dw_1.SetRedraw( False )
dw_1a.SetRedraw( False )
cb_add.y     = w_admin.WorkSpaceHeight() - cb_add.Height - cb_add.x
cb_modify.y  = cb_add.y
cb_delete.y  = cb_add.y
cb_save.y    = cb_add.y
cb_archive.y = cb_add.y
cb_sort.y    = cb_add.y
cb_find.y    = cb_add.y
//cb_print.y   = cb_add.y
cb_reset.y   = cb_add.y
cb_close.y   = cb_add.y
dw_1.Resize(dw_1.Width, &
				w_admin.cb_close.y - (dw_1.y + dw_1.x) )
dw_1a.Resize(dw_1a.Width, &
				w_admin.cb_close.y - (dw_1.y + dw_1.x) )
w_admin.SetRedraw( True )
dw_1.SetRedraw( True )
dw_1a.SetRedraw( True )
SetPointer( cpOldPointer )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end on

on w_admin.create
int iCurrent
call super::create
this.cb_modify=create cb_modify
this.cb_archive=create cb_archive
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modify
this.Control[iCurrent+2]=this.cb_archive
end on

on w_admin.destroy
call super::destroy
destroy(this.cb_modify)
destroy(this.cb_archive)
end on

on close;call w_maint::close;close(this)
end on

type dw_1 from w_maint`dw_1 within w_admin
integer x = 23
integer y = 28
integer width = 2382
integer height = 1160
integer taborder = 10
boolean titlebar = true
string title = "Password, User & User Rights"
string dataobject = "d_admin"
boolean maxbox = true
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

on dw_1::constructor;call w_maint`dw_1::constructor;// ***** Set the columns and descriptions to find on.
isa_findcols[1] = "user_lname"
isa_findcols[2] = "user_fname"
isa_findcols[3] = "user_rights"

isa_finddesc[1] = "Last  Name"
isa_finddesc[2] = "First Name"
isa_finddesc[3] = "User Rights"

// ***** Set the columns and descriptions to sort on.
isa_sortcols[1] = "user_lname"
isa_sortcols[2] = "user_fname"
isa_sortcols[3] = "user_rights"

isa_sortdesc[1] = "Last  Name"
isa_sortdesc[2] = "First Name"
isa_sortdesc[3] = "User Rights"

// Set the column to get focus after insert.
is_firstcol = "user_password"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "User Profile changes are Un-Saved.  Would you like to save changes?"


end on

on dw_1::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [New] to add a new "+This.Title+" record or " + &
					"[Modify] to change an existing " + This.Title + " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
ElseIf dw_1.RowCount() <= 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [New] to add a new "+This.Title+ " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
	
End If

end on

event dw_1::itemerror;call super::itemerror;string cCurrCol, cFieldName

cCurrCol        = dwCurrDW.GetColumnName()
cFieldName      = cCurrCol

Choose Case Upper( cCurrCol )
Case "USER_PASSWORD"
	cFieldName = "User Password"

Case "USER_LNAME"
	cFieldName = "Last Name"

Case "USER_FNAME"
	cFieldName = "First Name"

Case "USER_RIGHTS"
	cFieldName = "User Rights"

End Choose

if Upper( cCurrCol ) <> "USER_PASSWORD" then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + dwCurrDW.GetText() + &
				"] is not a valid value for the '" + cFieldName + &
				"' field for this user record.  " + &
				"Please try another value.", StopSign! )
end if
//SetActionCode( 1 )      // reject and no sys error
return 1
end event

on dw_1::ue_find;call w_maint`dw_1::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
End If

end on

event dw_1::itemchanged;call super::itemchanged;string CurrentColumn, ColumnContent
string lName, fName,usrId

ColumnContent = This.GetText()
CurrentColumn = this.GetColumnName()

if CurrentColumn = 'user_lname' then
	lName=data
	fName=dw_1.GetItemString(row,'user_fname')
	if lNewRecord then
		if not wf_check_dup_user(fName, lName) then
			MessageBox("Error","User already exists! Try a different one!")
			return 2
		end if				
		if len(trim(fName)) > 0 then
			dw_1.SetItem(row,'user_id',lower(mid(fName,1,1))+lower(mid(lName,1,7)))
		end if
	end if
end if

if CurrentColumn = 'user_fname' then
	fName=data
	lName=dw_1.GetItemString(row,'user_lname')
	if lNewRecord then
		if not wf_check_dup_user(fName, lName) then
			MessageBox("Error","User already exists! Try a different one!")
			return 2
		end if
	end if
end if

if CurrentColumn = 'user_password' then
	if not wf_check_dup_password(ColumnContent) then
		MessageBox("Error","Password is already taken! Try a different one!")
		return 1
	end if
end if

if CurrentColumn = 'user_id' then
	usrId = data
	if lNewRecord then
		if not wf_check_dup_userid(usrId) then
			MessageBox("Error","User ID already exists! Try a different one!")
			return 2
		end if
	end if
end if
end event

type p_unselected from w_maint`p_unselected within w_admin
end type

type p_selected from w_maint`p_selected within w_admin
end type

type dw_report from w_maint`dw_report within w_admin
integer x = 2377
integer y = 1148
string dataobject = "r_userrights"
end type

type cb_reset from w_maint`cb_reset within w_admin
integer x = 1957
integer y = 1300
integer height = 88
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
end type

on cb_reset::clicked;dwCurrDW.TriggerEvent( "ue_closequery" )
If message.DoubleParm <> -1 Then        // user didn't press cancel
	Set_Buttons( False )
Else    // in case we got screwed-up, we at least fix it one way or another here
	Set_Buttons( True )
End IF
DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type dw_1a from w_maint`dw_1a within w_admin
boolean visible = true
integer x = 2409
integer y = 28
integer width = 1998
integer height = 1160
integer taborder = 20
boolean titlebar = true
string title = "Option Minimum Rights"
string dataobject = "d_admin2"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

on dw_1a::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [New] to add a new "+This.Title+" record or " + &
					"[Modify] to change an existing " + This.Title + " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
ElseIf dw_1.RowCount() <= 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [New] to add a new "+This.Title+ " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
	
End If

end on

on dw_1a::constructor;call w_maint`dw_1a::constructor;// ***** Set the columns and descriptions to find on.
isa_findcols[1] = "event"
isa_findcols[2] = "event_desc"
isa_findcols[3] = "rights"

isa_finddesc[1] = "Event Code"
isa_finddesc[2] = "Event Description"
isa_finddesc[3] = "Minumum Rights"

// ***** Set the columns and descriptions to sort on.
isa_sortcols[1] = "event"
isa_sortcols[2] = "event_desc"
isa_sortcols[3] = "rights"

isa_sortdesc[1] = "Event Code"
isa_sortdesc[2] = "Event Description"
isa_sortdesc[3] = "Minumum Rights"

// Set the column to get focus after insert.
is_firstcol = "rights"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Application Event Security changes are Un-Saved.  Would you like to save changes?"


end on

on dw_1a::itemerror;call w_maint`dw_1a::itemerror;string cCurrCol, cFieldName

cCurrCol        = dwCurrDW.GetColumnName()
cFieldName      = cCurrCol

Choose Case Upper( cCurrCol )
Case "EVENT"
	cFieldName = "Event Code"

Case "EVENT_DESC"
	cFieldName = "Event Description"

Case "RIGHTS"
	cFieldName = "Application Rights"

End Choose

MessageBox( "Invalid " + cFieldName + " Field Value", "[" + dwCurrDW.GetText() + &
				"] is not a valid value for the '" + cFieldName + &
				"' field for this event record.  " + &
				"Please try another value.", StopSign! )

SetActionCode( 1 )      // reject and no sys error
end on

on dw_1a::ue_find;call w_maint`dw_1a::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
End If

end on

type cb_close from w_maint`cb_close within w_admin
string tag = "Exit and close this window.  You will be prompted for any unsaved changes."
integer x = 2235
integer y = 1300
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
string text = "E&xit"
end type

on cb_close::clicked;call w_maint`cb_close::clicked;Close(w_admin)
end on

type cb_save from w_maint`cb_save within w_admin
integer x = 1147
integer y = 1300
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
boolean default = false
end type

event cb_save::clicked;int nResponse
string usrId

// "ue_prepareupdate" is the hook to the control's save event.
//nResponse = MessageBox( "Save Changes?", "Do you wish to save your Security " + &
//                                                              "Administration changes?", Question!, YesNo!, 1 )
//If nResponse = 1 Then
//	If Is_PasswordOK( Get_Event_Security( "SS" ) ) Then
		SetPointer( HourGlass! )
		If dwCurrDW.ModifiedCount() = 0 Then
			SetMicroHelp( "No changes detected...but Attempting to Save Data anyway." )
			Beep( 3 )
			Pause( 1 )
		ElseIf dwCurrDW.ModifiedCount() < 0 Then
			SetMicroHelp( "ERROR detecting changes...but Attempting to Save Data anyway." )
			Beep( 10 )
			Pause( 1 )
		End If
//		MessageBox("checking","password!")
		if lNewRecord then
			dw_1.AcceptText()
			usrId=dw_1.GetItemString(dw_1.GetRow(),'user_id')
			if not wf_check_dup_userid(usrId) then
				MessageBox("Error","User ID already exists! Try a different one!")
				return 
			end if
		end if
		dwCurrDW.TriggerEvent( "ue_prepareupdate" )
		If dwCurrDW.ib_update_ok Then
			Set_Buttons( False )
//		End If
//      End If
End If

DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type cb_sort from w_maint`cb_sort within w_admin
string tag = "Sort the data in this workstation~'s data-buffer from among selected fields."
integer x = 1417
integer y = 1300
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
end type

on cb_sort::clicked;call w_maint`cb_sort::clicked;DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_find from w_maint`cb_find within w_admin
string tag = "Find a record in this workstations~' data-buffer from among selected fields."
integer x = 1687
integer y = 1300
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
end type

on cb_find::clicked;call w_maint`cb_find::clicked;DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_delete from w_maint`cb_delete within w_admin
integer x = 878
integer y = 1300
integer height = 88
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
end type

event cb_delete::clicked;// "ue_delete" is the hook to the control's delete event.
int niAnswer
long nlSec 

If dwCurrDW <> dw_1a Then
	niAnswer = MessageBox( "Delete Current Record?", &
					"Do you wish to DELETE the Security Administration record currently selected " + &
					"on this screen?" &
					, Question!, YesNo!, 2 )
	If niAnswer = 1 Then
		// It's what a Delete does...
//		nlSec = Get_Event_Security( "SD" )
//		If Is_PasswordOK( nlSec ) Then
			SetPointer( HourGlass! )
			dwCurrDW.TriggerEvent( "ue_delete" )
			Set_Buttons( False )
//		End If  
	End If
Else
	MessageBox( "Error", "You may not delete records from this data window.", StopSign! )
End If


DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type cb_add from w_maint`cb_add within w_admin
integer x = 338
integer y = 1300
integer height = 88
integer textsize = -8
integer weight = 700
string pointer = "Arrow!"
string text = "N&ew"
end type

event cb_add::clicked;int niAnswer
lNewRecord = True
// "ue_insert" is the hook to the control's add event.
// Focus is not assumed by the control, it must be set.

If dwCurrDW <> dw_1a Then
//      niAnswer = MessageBox( "Create User Profile?", &
//                              "Do you wish to CREATE a NEW user profile record?" &
//                              , Question!, YesNo!, 1 )
//
//      If niAnswer = 1 Then
//		If Is_PasswordOK( Get_Event_Security( "SA" ) ) Then
			SetPointer( HourGlass! )
			Set_Buttons( True )
			dwCurrDw.TriggerEvent( "ue_insert" )
			if dwCurrDw.dataobject='d_admin' then
				dwCurrDw.SetItem(dwCurrDw.GetRow(),'upd_ts',today())
			end if
			dwCurrDw.SetFocus()
//		End If
//      End If
Else
	MessageBox( "Error", "You may not add records to this data window.", StopSign! )
End If
DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type cb_modify from commandbutton within w_admin
integer x = 608
integer y = 1300
integer width = 247
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modify"
end type

event clicked;int niAnswer, niCurRow

//dwcurrdw.setredraw(false)
dwCurrDw.SetRowFocusIndicator( off!)
niCurRow = dwcurrdw.GetRow()

//If Is_PassWordOK( Get_Event_Security( "SM" ) ) Then
//	lNewRecord = True
	Set_Buttons( True )             // Setup Enabled's...et. al.  for Editing
//End If
dwcurrdw.SetRedraw(true)
dwCurrDw.SetRowFocusIndicator( p_unselected )
dwcurrdw.SetRow(nicurrow)

if dwcurrdw.DataObject = 'd_admin' then
	cCurcolumn = "user_password"
else
	cCurcolumn = "rights"
end if
parent.PostEvent("ue_refocus")
//DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */ move
// to ue_refocus event

end event

type cb_archive from commandbutton within w_admin
boolean visible = false
integer x = 1111
integer y = 1300
integer width = 288
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Archive"
end type

on clicked;MessageBox( "Awaiting Implementation", "Please contact your Database Administrator " + &
				"about this function.", Information! )

end on

