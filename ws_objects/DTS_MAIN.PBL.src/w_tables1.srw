$PBExportHeader$w_tables1.srw
forward
global type w_tables1 from w_tab_window
end type
type dw_report from datawindow within w_tables1
end type
end forward

global type w_tables1 from w_tab_window
integer x = 69
integer y = 168
integer width = 3090
integer height = 2072
string title = "Lookup and Validation - Data Entry"
string icon = "CATEG01.ICO"
dw_report dw_report
end type
global w_tables1 w_tables1

type variables
boolean lEditMode, lNewRecord, lCloseRecord
end variables

forward prototypes
public subroutine set_buttons (integer edit_mode)
public subroutine set_fields (integer edit_mode)
public function string wf_get_next_equip_number ()
end prototypes

public subroutine set_buttons (integer edit_mode);string cMode

If Edit_Mode > 0 Then
	lEditMode = True
Else
	lEditMode = False
End If


this.setredraw(false)
If lEditMode Then

	// Enable Edit Mode buttons
	cb_save.Enabled      = True
	cb_reset.Enabled                = True

	// Disable non-Edit Mode buttons
	cb_modify.Enabled    = False
	cb_add.Enabled       = False
//      cb_print.Enabled                = False
	cb_sort.Enabled         = False
	cb_delete.Enabled    = False
	cb_find.Enabled         = False

	// Mode-Box string for View
	cMode                            = "Modify"

	If lNewRecord Then
		// Mode-Box string for View
		cMode         = "New"
	End If
	If lCloseRecord Then
		// Mode-Box string for View
		cMode         = "Close"
	End If
	If lCloseRecord And lNewRecord Then
		cMode = "Modify"
	End If
//      Set_Fields( 1 )
	dwCurrDW.TriggerEvent( "ue_setfields" )

Else            // If Not EDIT Mode

//      Set_Fields( 0 )
	dwCurrDW.TriggerEvent( "ue_setfields" )
	// Asst. Editing Flags turned on in various places
	lNewRecord                              = False
	lCloseRecord                    = False

	// Mode-Box string for View
	cMode                           = "View"

	// Enable Non-Edit Mode buttons
	cb_modify.Enabled    = True
	cb_add.Enabled       = True
//      cb_print.Enabled                = True
	cb_sort.Enabled         = True
	cb_delete.Enabled    = True
	cb_find.Enabled         = True

	// Disable Edit Mode buttons
	cb_save.Enabled         = False
	cb_reset.Enabled                = False

	// Enable File Navigation Buttons
//      pb_first.Enabled                = True
//      pb_prior.Enabled                = True
//      pb_next.Enabled         = True
//      pb_last.Enabled         = True

End If
//st_mode.text = cMode
this.setredraw(true)
end subroutine

public subroutine set_fields (integer edit_mode);string cMode
long nCurrRow

If Edit_Mode > 0 Then
	lEditMode = True
Else
	lEditMode = False
End If

nCurrRow = dw_1.GetRow()
If lEditMode And nCurrRow > 0 Then

	If lNewRecord Then
//              If Len( Trim( dw_1.GetItemString( nCurrRow, "receiver" ) ) ) = 0 Then
//                      dw_1.SetTabOrder( "receiver",       9105 )      // Receiver
//              End If
//              dw_1.SetTabOrder( "stat_code",         9110 )   // Status Code
//              dw_1.SetTabOrder( "timer_start",       9120 )   // Timer Start
//              dw_1.SetTabOrder( "room",              9130 )   // Room
//              dw_1.SetTabOrder( "caller_category",   9140 )   // Caller Category
//              dw_1.SetTabOrder( "guest",             9150 )   // Guest
//              dw_1.SetTabOrder( "problem_problem_number",               9160 )        // Problem
//              dw_1.SetTabOrder( "subproblem_subproblem_number", 9170 )        // Sub-Problem
//              dw_1.SetTabOrder( "closed_bydept",     9180 )   // Closed by Dept.
//              dw_1.SetTabOrder( "repairman",         9190 )   // Repairman
	End If
	If lCloseRecord Then
//              If Len( Trim( dw_1.GetItemString( nCurrRow, "closed_by" ) ) ) = 0 Then
//                      dw_1.SetTabOrder( "closed_by",       9107 )     // Receiver
//              End If
//              dw_1.SetTabOrder( "closed_bydept",      9180 )  // Closed by Dept.
//              dw_1.SetTabOrder( "repairman",          9190 )  // Repairman
//              dw_1.SetTabOrder( "problem_definition", 9200 )  // Problem Def
//              dw_1.SetTabOrder( "resolution",                  9210 ) // Resolution
	End If
//      If lCloseRecord And lNewRecord Then     // Modify record
//      End If
	

Else            // If Not EDIT Mode

//      dw_1.SetTabOrder( "call_number",                0 )             // Call Number
//      dw_1.SetTabOrder( "call_indate",                0 )             // Call Opened
//      dw_1.SetTabOrder( "call_outdate",       0 )             // Call Closed
//      dw_1.SetTabOrder( "receiver",                   0 )             // Receiver
//      dw_1.SetTabOrder( "closed_by",                  0 )             // Closed by
//      dw_1.SetTabOrder( "stat_code",                          0 )             // Status Code
//      dw_1.SetTabOrder( "timer_start",                        0 )             // Timer Start
//      dw_1.SetTabOrder( "room",                                               0 )             // Room
//      dw_1.SetTabOrder( "caller_category",            0 )             // Caller Category
//      dw_1.SetTabOrder( "guest",                                      0 )             // Guest
//      dw_1.SetTabOrder( "problem_problem_number",               0 )   // Problem
//      dw_1.SetTabOrder( "subproblem_subproblem_number", 0 )   // Sub-Problem
//      dw_1.SetTabOrder( "closed_bydept",                      0 )             // Closed by Dept.
//      dw_1.SetTabOrder( "repairman",                          0 )             // Repairman
//      dw_1.SetTabOrder( "problem_definition",         0 )             // Problem Def
//      dw_1.SetTabOrder( "resolution",                         0 )             // Resolution

End If

end subroutine

public function string wf_get_next_equip_number ();string sNextNum
int iNextNum

select max(area_number) into :sNextNum 
from 	area 
where room_type='E' and ISNUMERIC(area_number)=1;
if sqlca.sqlcode < 0 then
	egm_sqlerror( SQLCA )
	return ''
end if

if IsNumber(sNextNum) then
	iNextNum = integer(sNextNum)
	if iNextNum < 10000 then
		iNextNum = 10000
	else
		iNextNum = iNextNum+1
	end if
	sNextNum = string(iNextNum)
else
	sNextNum = '10000'
end if

return sNextNum
end function

event open;call super::open;If lPasswordOK Then
	Set_Buttons(0)
	This.SetRedraw( True )
Else
	Close( This )
   return
End If

if IsValid(w_main) then 
	w_main.postevent("ue_menu_set")
end if

end event

on ue_printreport;// It's what a Print does
int niAnswer
Int li_job_num

niAnswer = MessageBox( "Print Data?", &
				"Do you wish to Printer-Formatted Report of the data "+&
				"partially shown on-screen?", &
				Question!, YesNo!, 2 )

If niAnswer = 1 Then
	// It's what a Print does...
//      dw_report.SetTransObject( sqlca )
//      dw_report.Retrieve()    

dwcurrdw.sharedata(dw_report)
	li_job_num = dw_report.Print()
//      dw_report.Reset()       
	If li_job_num < 1 then
		MessageBox( "Print Failure", &
			"Unable to open print job.")
		RETURN
	End If
End if

end on

on ue_buttonsview;call w_tab_window::ue_buttonsview;Set_Buttons( 0 )    // view-mode
end on

on close;call w_tab_window::close;close(this)
end on

on ue_buttonsmod;call w_tab_window::ue_buttonsmod;Set_Buttons( 1 ) // edit-mode

end on

on ue_buttonsadd;call w_tab_window::ue_buttonsadd;Set_Buttons( 1 )      // edit mode

end on

on w_tables1.create
int iCurrent
call super::create
this.dw_report=create dw_report
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_report
end on

on w_tables1.destroy
call super::destroy
destroy(this.dw_report)
end on

event deactivate;call super::deactivate;if IsValid(w_main) then 
	w_main.postevent("ue_menu_set")
end if
end event

type cb_close from w_tab_window`cb_close within w_tables1
integer y = 1304
integer taborder = 150
end type

type cb_reset from w_tab_window`cb_reset within w_tables1
integer y = 1304
end type

type cb_find from w_tab_window`cb_find within w_tables1
integer x = 1618
integer y = 1304
integer taborder = 100
end type

on cb_find::clicked;call w_tab_window`cb_find::clicked;DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_sort from w_tab_window`cb_sort within w_tables1
integer x = 1312
integer y = 1304
integer taborder = 120
end type

on cb_sort::clicked;call w_tab_window`cb_sort::clicked; DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_save from w_tab_window`cb_save within w_tables1
integer x = 1006
integer y = 1304
integer taborder = 130
end type

event cb_save::clicked;
dwCurrdw.AcceptText()
dwCurrdw.is_col_value = dwCurrdw.GetItemString(dwCurrdw.GetRow(),dwCurrdw.is_col_name)

// "ue_prepareupdate" is the hook to the control's save event.

/* SFM update 11-10  Added messagebox to prompt user for save
   also removed call to password window by using global user_rights 
   obtained in W_password window */ 

IF dwCurrdw.classname() = 'dw_7' then
	if Mid(dw_7.GetItemString(dw_7.GetRow(),'zone_group_code'),1,1) <> 'Z' then
		MessageBox("Error",'Code must begins with Z. Try again!')
		return
	end if
end if


Int niAnswer
niAnswer = MessageBox( "Save Current Changes?", &
			"Do you wish to Save the "+dwCurrDW.Title+"?" &
			, Question!, YesNo!, 1 )
If niAnswer = 1 Then
//   If Is_PasswordOK( Get_Event_Security( "BS" ) ) Then  

 If gi_user_rights >= ( Get_Event_Security( "BS" ) ) Then  
	SetPointer( HourGlass! )


/* sfm 11/95 Quick fix for employee datawindow problem with 
   the department field triggering dberror's , Removed required field
   option from dataobject ,coded ue_prepareupdate event in 
   dw_2(employee datawindow) there we check for null or empty strings
   Used this condition statement here because if the input is not valid
   we do not want to trigger the ue_buttonview event!  */ 

   IF dwCurrdw.classname() = 'dw_2' Then
	   dwCurrDW.TriggerEvent( "ue_prepareupdate" )
   else
	   dwCurrDW.TriggerEvent( "ue_prepareupdate" )
		if dwCurrDW.ib_update_ok then
		   Parent.TriggerEVent( "ue_buttonsview" )
		end if
   ENd if
  ELse
      Beep(1)
		MessageBox("Insufficient Authorization", &
			"Sorry, the current password does not have sufficient rights "+&
			"for the requested operation.", StopSign! )     
  End if



End if


DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type cb_delete from w_tab_window`cb_delete within w_tables1
integer x = 699
integer y = 1304
integer taborder = 90
end type

on cb_delete::clicked;call w_tab_window`cb_delete::clicked;DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_add from w_tab_window`cb_add within w_tables1
integer x = 87
integer y = 1304
integer taborder = 80
string text = "N&ew"
end type

event cb_add::clicked;call super::clicked;IF dwCurrdw.classname() = 'dw_1' then
	dw_1.SetItem(dw_1.GetRow(),"unit_type","00")
end if
DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type cb_modify from w_tab_window`cb_modify within w_tables1
integer x = 393
integer taborder = 140
end type

event cb_modify::clicked;call super::clicked;//IF dwCurrdw.classname() = 'dw_7' then
//	if dw_7.GetItemString(dw_7.GetRow(),"zone_group_code") = 'Z0' then
//		messagebox("Error","Can't modify a system default entry!!!")
//		return
//	end if
//end if
DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type dw_7 from w_tab_window`dw_7 within w_tables1
integer x = 1586
integer y = 448
integer width = 905
integer height = 676
boolean titlebar = true
string title = "Zone Group Table"
string dataobject = "d_tabdata_zone_group"
end type

event dw_7::constructor;call super::constructor;is_table_name = 'zone_group'
is_col_name = 'zone_group_code'

// Set the columns and descriptions to find on.
isa_findcols[1] = "zone_group_code"
isa_findcols[2] = "zone_group_name"

isa_finddesc[1] = "Zone Group Code"
isa_finddesc[2] = "Zone Group Name"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "zone_group_code"
isa_sortcols[2] = "zone_group_name"

isa_sortdesc[1] = "=Zone Group Code"
isa_sortdesc[2] = "Zone Group Name"

// Set the column to get focus after insert.
is_firstcol = "zone_group_code"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Zone Group Table changes are Un-Saved.  Would you like to save changes?"

// now set fields to current edit mode
This.TriggerEvent( "ue_setfields" )
end event

event dw_7::ue_setfields;call super::ue_setfields;If lEditMode Then
	This.SetTabOrder( "zone_group_code",  500 )
	This.SetTabOrder( "zone_group_name", 510 )
Else
	This.SetTabOrder( "zone_group_code",  0 )
	This.SetTabOrder( "zone_group_name", 0 )
End If

this.SetFocus()
end event

type dw_6 from w_tab_window`dw_6 within w_tables1
string tag = "Click on a field to begin Editing Zone Codes and [Tab] will move the cursor among fields"
integer x = 183
integer y = 196
integer width = 1582
integer height = 864
boolean titlebar = true
string title = "Zone/Area Table"
string dataobject = "d_tabdata_zone"
end type

event dw_6::constructor;call super::constructor;is_table_name = 'zone'
is_col_name = 'zone_code'

// Set the columns and descriptions to find on.
isa_findcols[1] = "zone_code"
isa_findcols[2] = "zone_name"

isa_finddesc[1] = "Area/Zone Code"
isa_finddesc[2] = "Zone Name"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "zone_code"
isa_sortcols[2] = "zone_name"

isa_sortdesc[1] = "Area/Zone Code"
isa_sortdesc[2] = "Zone Name"

// Set the column to get focus after insert.
is_firstcol = "zone_code"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Area/Zone Table changes are Un-Saved.  Would you like to save changes?"

// now set fields to current edit mode
This.TriggerEvent( "ue_setfields" )

end event

event dw_6::doubleclicked;call super::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
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

end event

event dw_6::itemerror;string cFieldName

cFieldName      = This.is_CurColName

Choose Case Upper( cFieldName )
Case "ZONE_CODE"
	cFieldName = "Zone Code"

Case "ZONE_NAME"
	cFieldName = "Zone Name"

End Choose

If Len( Trim( This.GetText() ) ) > 0 Then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + This.GetText() + &
				"] is NOT A VALID VALUE for the '" + cFieldName + &
				"' field on this data window.  " + &
				"Please try another value.", StopSign! )
Else
	MessageBox( cFieldName + " Blank!", cFieldName + &
				"' is a REQUIRED FIELD.  Please enter at least a temporary value if you " + &
				"wish to change it later, or [Reset] changes.", Information! )
End If
//SetActionCode( 1 )      // reject and no sys error
return 1

end event

event dw_6::mousemove;string cObject, cTag

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

event dw_6::ue_setfields;If lEditMode Then
	This.SetTabOrder( "zone_code",  500 )
	This.SetTabOrder( "zone_name", 510 )
Else
	This.SetTabOrder( "zone_code",  0 )
	This.SetTabOrder( "zone_name", 0 )
End If

this.SetFocus()
end event

type dw_5 from w_tab_window`dw_5 within w_tables1
string tag = "Click on a field to begin Editing Call Status Codes and [Tab] will move the cursor among fields"
integer x = 320
integer y = 96
integer width = 489
integer height = 348
integer taborder = 70
boolean titlebar = true
string title = "Call Status Table"
string dataobject = "d_tabdata_status"
end type

event dw_5::ue_setfields;call super::ue_setfields;If lEditMode Then
	This.SetTabOrder( "stat_code", 500 )
	This.SetTabOrder( "callstat_stat_desc",         505 )
	This.SetTabOrder( "callstat_stat_longdesc",     510 )
Else
	This.SetTabOrder( "stat_code",         0 )
	This.SetTabOrder( "callstat_stat_desc",                 0 )
	This.SetTabOrder( "callstat_stat_longdesc",     0 )
End If


end event

event dw_5::constructor;call super::constructor;is_table_name = 'callstat'
is_col_name = 'stat_code'

// Set the columns and descriptions to find on.
isa_findcols[1] = "stat_code"
isa_findcols[2] = "callstat_stat_desc"
isa_findcols[3] = "callstat_stat_longdesc"

isa_finddesc[1] = "Status Code"
isa_finddesc[2] = "Status Name"
isa_finddesc[3] = "Status Description"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "stat_code"
isa_sortcols[2] = "callstat_stat_desc"
isa_sortcols[3] = "callstat_stat_longdesc"

isa_sortdesc[1] = "Status Code"
isa_sortdesc[2] = "Status Name"
isa_sortdesc[3] = "Status Description"

// Set the columns and descriptions to sort on.
// Set the column to get focus after insert.
is_firstcol = "stat_code"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Call Status Code Table changes are Un-Saved.  Would " + &
						"you like to save changes?"

// now set fields to current edit mode
This.TriggerEvent( "ue_setfields" )

end event

on dw_5::doubleclicked;call w_tab_window`dw_5::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
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

event dw_5::itemerror;call super::itemerror;string cFieldName

cFieldName      = This.is_CurColName

Choose Case Upper( cFieldName )
Case "STAT_CODE"
	cFieldName = "Status Code"

Case "CALLSTAT_STAT_DESC"
	cFieldName = "Status Name"

Case "CALLSTAT_STAT_LONGDESC"
	cFieldName = "Status Description"

End Choose

If Len( Trim( This.GetText() ) ) > 0 Then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + &
				This.GetText() + &
				"] is NOT A VALID VALUE for the '" + cFieldName + &
				"' field on this data window.  " + &
				"Please try another value.", StopSign! )
Else
	MessageBox( cFieldName + " Blank!", cFieldName + &
				"' is a REQUIRED FIELD.  Please enter at least a " + &
				"temporary value if you " + &
				"wish to change it later, or [Reset] changes.", &
				Information! )
End If
//SetActionCode( 1 )      // reject and no sys error
return 1

end event

on dw_5::mousemove;call w_tab_window`dw_5::mousemove;string cObject, cTag

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

end on

type dw_4 from w_tab_window`dw_4 within w_tables1
string tag = "Click on a field to begin Editing Shift Table and [Tab] will move the cursor among fields"
integer x = 1358
integer y = 224
integer width = 1426
integer height = 456
boolean titlebar = true
string title = "Shift Schedule Table"
string dataobject = "d_tabdata_shift"
end type

event dw_4::ue_setfields;call super::ue_setfields;If lEditMode Then
	This.SetTabOrder( "shift_num", 500 )
	This.SetTabOrder( "shift_shortdesc", 505 )
	This.SetTabOrder( "shift_longdesc",  510 )
   This.SetTabOrder( "shift_time_start",520 )
	// SFM 11/12/97 for MSSQL
	IF cappdbtype = 'MSSQL' THEN
   	This.SetTabOrder( "hour",530 )
	   This.SetTabOrder( "minute", 540 )
	END IF
	This.SetTabOrder( "shift_weekday", 550 )
	This.SetTabOrder( "shift_saturday", 560 )
	This.SetTabOrder( "shift_sunday", 570 )
Else
	This.SetTabOrder( "shift_num", 0 )
	This.SetTabOrder( "shift_shortdesc", 0 )
	This.SetTabOrder( "shift_longdesc", 0 )
	This.SetTabOrder( "shift_time_start", 0 )
	IF cappdbtype = 'MSSQL' THEN
   	This.SetTabOrder( "hour",0 )
	   This.SetTabOrder( "minute", 0 )
	END IF
	This.SetTabOrder( "shift_weekday",  0 )
	This.SetTabOrder( "shift_saturday",  0 )
	This.SetTabOrder( "shift_sunday",  0 )
End If


end event

event dw_4::constructor;call super::constructor;// SFM 11/12/97 for MSSQL switch datawindow object
IF cappdbtype = 'MSSQL' THEN
	this.dataobject = 'd_tabdata_shift_mssql'
  	this.SetTransObject(sqlca)
	this.retrieve()
end if

is_table_name = 'timeshift'
is_col_name = 'shift_num'


// Set the columns and descriptions to find on.
isa_findcols[1] = "shift_num"
isa_findcols[2] = "shift_shortdesc"
isa_findcols[3] = "shift_longdesc"
isa_findcols[4] = "shift_time_start"
isa_findcols[5] = "shift_weekday"
isa_findcols[6] = "shift_saturday"
isa_findcols[7] = "shift_sunday"
//isa_findcols[8] = "shift_monday"
//isa_findcols[9] = "shift_tuesday"
//isa_findcols[10] = "shift_wednesday"
//isa_findcols[11] = "shift_thursday"
//isa_findcols[12] = "shift_friday"
//isa_findcols[13] = "shift_weekend"

isa_finddesc[1] = "Shift Number"
isa_finddesc[2] = "Shift"
isa_finddesc[3] = "Shift Description"
isa_finddesc[4] = "Shift Time Start"
isa_finddesc[5] = "Shift Weekday   (Y/N)"
isa_finddesc[6] = "Shift Saturday  (Y/N)"
isa_finddesc[7] = "Shift Sunday    (Y/N)"
//isa_finddesc[8] = "Shift Monday    (Y/N)"
//isa_finddesc[9] = "Shift Tuesday   (Y/N)"
//isa_finddesc[10] = "Shift Wednesday (Y/N)"
//isa_finddesc[11] = "Shift Thursday  (Y/N)"
//isa_finddesc[12] = "Shift Friday    (Y/N)"
//isa_finddesc[13] = "Shift Weekend   (Y/N)"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "shift_num"
isa_sortcols[2] = "shift_shortdesc"
isa_sortcols[3] = "shift_longdesc"
isa_sortcols[4] = "shift_time_start"
isa_sortcols[5] = "shift_weekday"
isa_sortcols[6] = "shift_saturday"
isa_sortcols[7] = "shift_sunday"

isa_sortdesc[1] = "Shift Number"
isa_sortdesc[2] = "Shift"
isa_sortdesc[3] = "Shift Description"
isa_sortdesc[4] = "Shift Time Start"
isa_sortdesc[5] = "Shift Weekday   (Y/N)"
isa_sortdesc[6] = "Shift Saturday  (Y/N)"
isa_sortdesc[7] = "Shift Sunday    (Y/N)"

// Set the column to get focus after insert.
is_firstcol = "shift_num"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Shift Schedule Table changes are Un-Saved.  Would you like to save changes?"

// now set fields to current edit mode
This.TriggerEvent( "ue_setfields" )

end event

on dw_4::doubleclicked;call w_tab_window`dw_4::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
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

on dw_4::itemerror;call w_tab_window`dw_4::itemerror;string cFieldName

cFieldName      = This.is_CurColName

Choose Case Upper( cFieldName )
Case "SHIFT_NUM"
	cFieldName = "Shift Number"

Case "SHIFT_SHORTDESC"
	cFieldName = "Shift Name"

Case "SHIFT_LONGDESC"
	cFieldName = "Shift Description"

Case "SHIFT_TIME_START"
	cFieldName = "Shift Time Start"

Case "SHIFT_WEEKEND"
	cFieldName = "Shift on Weekend"

Case "SHIFT_WEEKDAY"
	cFieldName = "Shift on Weekday"

Case "SHIFT_SATURDAY"
	cFieldName = "Shift on Saturday"

Case "SHIFT_SUNDAY"
	cFieldName = "Shift on Sunday"

End Choose

If Len( Trim( This.GetText() ) ) > 0 Then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + This.GetText() + &
				"] is NOT A VALID VALUE for the '" + cFieldName + &
				"' field on this data window.  " + &
				"Please try another value.", StopSign! )
Else
	MessageBox( cFieldName + " Blank!", cFieldName + &
				"' is a REQUIRED FIELD.  Please enter at least a temporary value if you " + &
				"wish to change it later, or [Reset] changes.", Information! )
End If

//SetActionCode( 1 )      // reject and no sys error
return 1
end on

on dw_4::mousemove;call w_tab_window`dw_4::mousemove;string cObject, cTag

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

end on

event dw_4::itemfocuschanged;call super::itemfocuschanged;//Date     ld_date
//DateTime ldt_datetime
//Integer  li_hr , li_min, li_rc
//String   ls_time 
//Time     lt_time
//
//dwitemstatus lstatus
//
//IF ii_currow < 1 or ii_currow > this.rowcount() then return
//IF cappdbtype = 'MSSQL' THEN
//	ldt_datetime = this.getitemdatetime(ii_currow,'shift_time_start')
//	li_hr        = this.getitemnumber(ii_currow,'hour')
//	li_min       = this.getitemnumber(ii_currow,'minute')
//	
//	IF IsNull(li_hr)  THEN li_hr  = 0
//   IF IsNull(li_min) THEN li_min = 0
//	
//	ls_time      = string(li_hr)+':'+string(li_min)+':00'	
//	lt_time      = Time(ldt_datetime)
//	
//	IF IsNull(ldt_datetime)  or &
//	   (li_hr <> Hour(lt_time) or li_min <> Minute(lt_time)) THEN 
//
//      lt_time      = Time(ls_time)
//	   ldt_datetime = datetime(today(),lt_time)
//		
//		li_rc = this.setitem(ii_currow,'shift_time_start',ldt_datetime)
//		lstatus = this.getitemstatus(ii_currow,0,primary!)
//	IF IsNull(li_hr)  THEN li_hr  = 0
//
//
//END IF
//END IF
//
end event

event dw_4::itemchanged;call super::itemchanged;// SFM 11/12/97 for MSSQL

Date     ld_date
DateTime ldt_datetime
Integer  li_hr , li_min, li_rc
String   ls_time 
Time     lt_time

//IF row < 1 or row > this.rowcount() then return
IF cappdbtype = 'MSSQL' THEN
	ldt_datetime = this.getitemdatetime(row,'shift_time_start')
	IF dwo.name = 'hour' THEN
		li_hr   = Integer(data)
   	li_min  = this.getitemnumber(row,'minute')
   END IF

	IF dwo.name = 'minute' THEN
		li_min  = Integer(data)
	   li_hr   = this.getitemnumber(row,'hour')
	END IF
	
   IF IsNull(li_min) THEN li_min = 0
	IF IsNull(li_hr)  THEN li_hr  = 0
	
	ls_time      = string(li_hr)+':'+string(li_min)+':00'	
	lt_time      = Time(ldt_datetime)
	
	IF IsNull(ldt_datetime)  or &
	   (li_hr <> Hour(lt_time) or li_min <> Minute(lt_time)) THEN 

      lt_time      = Time(ls_time)
		ld_date      = date('01/01/1990')
	   ldt_datetime = datetime(today(),lt_time)
		
		li_rc = this.setitem(row,'shift_time_start',ldt_datetime)

   END IF
END IF

end event

type dw_3 from w_tab_window`dw_3 within w_tables1
string tag = "Click on a field to begin Editing Departments Table and [Tab] will move the cursor among fields"
integer x = 859
integer y = 96
integer width = 1531
integer height = 736
boolean titlebar = true
string title = "Department Table"
string dataobject = "d_tabdata_dept"
end type

event dw_3::ue_setfields;If lEditMode Then
	This.SetTabOrder( "dept",                               500 )
	this.SetTabOrder( "dept_goal", 505) 
	This.SetTabOrder( "dept_longdesc",      510 )
	This.SetTabOrder( "quick_call_ind",      520 )
//      This.SetTabOrder( "dept_number",        520 )
Else
	This.SetTabOrder( "dept",                               0 )
	This.SetTabOrder( "dept_goal", 0) 
	This.SetTabOrder( "dept_longdesc",      0 )
	This.SetTabOrder( "dept_number",        0 )
	This.SetTabOrder( "quick_call_ind",        0 )
End If


end event

event dw_3::constructor;call super::constructor;is_table_name = 'instdept'
is_col_name = 'dept'

// Set the columns and descriptions to find on.
isa_findcols[1] = "dept"
isa_findcols[2] = "dept_goal"
isa_findcols[3] = "dept_longdesc"
isa_findcols[4] = "dept_number"
isa_findcols[5] = "quick_call_ind"

isa_finddesc[1] = "Department"
isa_finddesc[2] = "Resp Goal"
isa_finddesc[3] = "Department Description"
isa_finddesc[4] = "Dept Number"
isa_finddesc[5] = "QuickCall Ind"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "dept"
isa_sortcols[2] = "dept_goal"
isa_sortcols[3] = "dept_longdesc"
isa_sortcols[4] = "dept_number"
isa_sortcols[5] = "quick_call_ind"

isa_sortdesc[1] = "Department"
isa_sortdesc[2] = "resp Goal"
isa_sortdesc[3] = "Department Description"
isa_sortdesc[4] = "Dept Number"
isa_sortdesc[5] = "QuickCall Ind"

// Set the column to get focus after insert.
is_firstcol = "dept"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Department Table changes are Un-Saved.  Would you like to save changes?"

// Set the seedmode to seed after an insert is done.  There are no columns
// defined here since the seeding needs a function.  The seeding code
// can be found in the "ue_seed" event.

ii_seedmode = 1         // 0 = no seeding (default), 1 = after insert, 2 = before save
ii_seedtype = 1         // 0 = foreign keys (isa_forkeyvals[]), 1 = array values (isa_primkeyvals)
							// (for expressions and func calls use ue_seed event)

// noe to set fields to current view/edit mode
This.TriggerEvent( "ue_setfields" )

end event

on dw_3::doubleclicked;call w_tab_window`dw_3::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
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

event dw_3::itemerror;string cFieldName

cFieldName      = This.is_CurColName

Choose Case Upper( cFieldName )
Case "DEPT"
	cFieldName = "Department"
	
Case "DEPT_GOAL"
		cFieldName = "Resp Goal"

Case "DEPT_LONGDESC"
	cFieldName = "Department Description"

Case "DEPT_NUMBER"
	cFieldName = "Department Number"

Case "QUICK_CALL_IND"
	cFieldName = "Quick Call Indicator"
	
End Choose

If Len( Trim( This.GetText() ) ) > 0 Then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + This.GetText() + &
				"] is NOT A VALID VALUE for the '" + cFieldName + &
				"' field on this data window.  " + &
				"Please try another value.", StopSign! )
Else
	MessageBox( cFieldName + " Blank!", cFieldName + &
				"' is a REQUIRED FIELD.  Please enter at least a temporary value if you " + &
				"wish to change it later, or [Reset] changes.", Information! )
End If

//SetActionCode( 1 )      // reject and no sys error
return 1

end event

on dw_3::mousemove;call w_tab_window`dw_3::mousemove;string cObject, cTag

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

end on

on dw_3::ue_seed;call w_tab_window`dw_3::ue_seed;// This event will seed the date_entered column using functions.
// ii_currow is an instance variable of the control that holds the
// current row number.

long li_last_id
boolean lSFsg = True

// determine last problem_number used
SELECT max("instdept"."dept_number")
 INTO :li_last_id  
 FROM "instdept";

// ERROR checking
If sqlca.SQLCode < 0 Then       // (-1) Database ERROR...lost connection...who knows?
	Beep(1)
	lSFsg = False
	egm_sqlerror( SQLCA )

ElseIf sqlca.SQLCode = 100  Or IsNull( li_last_id ) Then        // no record result set from SELECT statement
	li_last_id = 0
	
ElseIf li_last_id = -1 Then     // didn't set from what default was...who knows...
	Beep(1)
	lSFsg = False
	egm_sqlerror( SQLCA )

End If
li_last_id = li_last_id + 10

// The column "date_entered" must be part of the datawindow object
// select statement and marked as updateable , but DOES NOT have to
// be visible.

// if so-far-so-good, then let's get going
If lSfsg Then
	This.SetItem( This.ii_currow, "dept_number", String( li_last_id, "0000000000" ) )
End If
end on

type dw_2 from w_tab_window`dw_2 within w_tables1
string tag = "Click on a field to begin Editing Employee Table and [Tab] will move the cursor among fields"
integer x = 635
integer y = 1188
integer width = 494
integer height = 312
boolean titlebar = true
string title = "Employee Table"
string dataobject = "d_tabdata_employees"
end type

on dw_2::ue_setfields;call w_tab_window`dw_2::ue_setfields;If lEditMode Then
	This.SetTabOrder( "dept",                                       500 )
	This.SetTabOrder( "employee_number",    510 )
	This.SetTabOrder( "employee",                   520 )
Else
	This.SetTabOrder( "dept",                                       0 )
	This.SetTabOrder( "employee_number",    0 )
	This.SetTabOrder( "employee",                   0 )
End If


end on

event dw_2::ue_prepareupdate;/* sfm update 11/95  Quick fix for required field problem

  Removed the required field options from the dataobject and
  do column checks here instead. If all is well we then call super
  and proceed with whatever the hell he was doing in the first place 

   ... see script for the cb_save button for further modifications */


this.accepttext()
If this.getitemstring(this.getrow(),'dept') = '' or &
   isnull(this.getitemstring(this.getrow(),'dept'))  Then
   messagebox('Warning','Please Enter A Valid Department !')
   this.setfocus()
   this.setcolumn(1)
   return
End IF 

If this.getitemstring(this.getrow(),'employee') = '' or &
   isnull(this.getitemstring(this.getrow(),'employee'))  Then
   messagebox('Warning','Please Enter A Valid Employee Name !')
   this.setfocus()
   this.setcolumn(2)

   return
End IF 

call super::ue_prepareupdate

if dwCurrDW.ib_update_ok then
	parent.triggerevent('ue_buttonsview')
end if
end event

on dw_2::ue_seed;call w_tab_window`dw_2::ue_seed;// This event will seed the date_entered column using functions.
// ii_currow is an instance variable of the control that holds the
// current row number.

long li_last_id
boolean lSFsg = True

// determine last problem_number used
SELECT max("instemp"."employee_number")
 INTO :li_last_id  
 FROM "instemp";

// ERROR checking
If sqlca.SQLCode < 0 Then       // (-1) Database ERROR...lost connection...who knows?
	Beep(1)
	lSFsg = False
	egm_sqlerror( SQLCA )

ElseIf sqlca.SQLCode = 100  Or IsNull( li_last_id ) Then        // no record result set from SELECT statement
	li_last_id = 0
	
ElseIf li_last_id = -1 Then     // didn't set from what default was...who knows...
	Beep(1)
	lSFsg = False
	egm_sqlerror( SQLCA )

End If
li_last_id = li_last_id + 10

// The column "date_entered" must be part of the datawindow object
// select statement and marked as updateable , but DOES NOT have to
// be visible.

// if so-far-so-good, then let's get going
If lSfsg Then
	This.SetItem( This.ii_currow, "employee_number", String( li_last_id, "0000000000" ) )
End If
end on

on dw_2::itemerror;call w_tab_window`dw_2::itemerror;string cFieldName

cFieldName      = This.is_CurColName

Choose Case Upper( cFieldName )
Case "DEPT"
	cFieldName = "Employee Department"

Case "EMPLOYEE_NUMBER"
	cFieldName = "Employee Number"

Case "EMPLOYEE"
	cFieldName = "Employee Name"

End Choose

If Len( Trim( This.GetText() ) ) > 0 Then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + This.GetText() + &
				"] is NOT A VALID VALUE for the '" + cFieldName + &
				"' field on this data window.  " + &
				"Please try another value.", StopSign! )
Else
	MessageBox( cFieldName + " Blank!", cFieldName + &
				"' is a REQUIRED FIELD.  Please enter at least a temporary value if you " + &
				"wish to change it later, or [Reset] changes.", Information! )
End If
//SetActionCode( 1 )      // reject and no sys error
return 1

end on

event dw_2::constructor;call super::constructor;is_table_name = 'instemp'
is_col_name = 'employee'

// Set the columns and descriptions to find on.
isa_findcols[1] = "dept"
isa_findcols[2] = "employee_number"
isa_findcols[3] = "employee"

isa_finddesc[1] = "Department"
isa_finddesc[2] = "Employee Number"
isa_finddesc[3] = "Employee Name"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "dept"
isa_sortcols[2] = "employee_number"
isa_sortcols[3] = "employee"

isa_sortdesc[1] = "Department"
isa_sortdesc[2] = "Employee Number"
isa_sortdesc[3] = "Employee Name"

// Set the column to get focus after insert.
is_firstcol = "dept"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Employee Table changes are Un-Saved.  Would you like to save changes?"

// Set the seedmode to seed after an insert is done.  There are no columns
// defined here since the seeding needs a function.  The seeding code
// can be found in the "ue_seed" event.

ii_seedmode = 1         // 0 = no seeding (default), 1 = after insert, 2 = before save
ii_seedtype = 1         // 0 = foreign keys (isa_forkeyvals[]), 1 = array values (isa_primkeyvals)
							// (for expressions and func calls use ue_seed event)

//// set seed values
//isa_primkeycols[1] = "pre_openable"
//isa_primkeycols[2] = "default_status"
//isa_primkeycols[3] = "timer1_start_min"
//isa_primkeycols[4] = "timer2_start_min"
//isa_primkeycols[5] = "auth_take_off_timer"
//isa_primkeycols[6] = "pre_openable"
//
//isa_primkeyvals[1] = "N"
//isa_primkeyvals[2] = "01"
//isa_primkeyvals[3] = "15"
//isa_primkeyvals[4] = "15"
//isa_primkeyvals[5] = "9"
//isa_primkeyvals[6] = "N"
// now set fields to non-edit
This.TriggerEvent( "ue_setfields" )

end event

on dw_2::doubleclicked;call w_tab_window`dw_2::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
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

on dw_2::mousemove;call w_tab_window`dw_2::mousemove;string cObject, cTag

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

end on

type dw_1 from w_tab_window`dw_1 within w_tables1
string tag = "Click on a field to begin Editing Room / Area Table and [Tab] will move the cursor among fields"
integer x = 87
integer y = 16
integer width = 2798
integer height = 820
boolean titlebar = true
string title = "Room / Area Table"
string dataobject = "d_tabdata_area"
boolean livescroll = false
end type

on dw_1::other;call w_tab_window`dw_1::other;//if keydown(keyTab!) then
//      messagebox("key","tab")
//end if

end on

event dw_1::ue_setfields;call super::ue_setfields;If lEditMode Then
	This.SetTabOrder( "unit_type",  20 )
	This.SetTabOrder( "area_number", 50 )
	This.SetTabOrder( "room_type",  10 )
	This.SetTabOrder( "area_name", 60 )
	This.SetTabOrder( "zone_group_code",  30 )
	This.SetTabOrder( "room_level", 40 )
Else
	This.SetTabOrder( "unit_type",  0 )
	This.SetTabOrder( "area_number", 0 )
	This.SetTabOrder( "room_type",  0)
	This.SetTabOrder( "area_name",  0 )
	This.SetTabOrder( "zone_group_code", 0)
	This.SetTabOrder( "room_level", 0)
End If

this.SetFocus()
end event

event dw_1::constructor;call super::constructor;is_table_name = 'area'
is_col_name = 'area_number'

// Set the columns and descriptions to find on.
isa_findcols[1] = "room_type"
isa_findcols[2] = "unit_type"
isa_findcols[3] = "zone_group_code"
isa_findcols[4] = "room_level"
isa_findcols[5] = "area_number"
isa_findcols[6] = "area_name"

isa_finddesc[1] = "Type"
isa_finddesc[2] = "Room/Area Type"
isa_finddesc[3] = "Zone Group"
isa_finddesc[4] = "Level"
isa_finddesc[5] = "Room/Area Number"
isa_finddesc[6] = "Room/Area Name"


// Set the columns and descriptions to sort on.
isa_sortcols[1] = "room_type"
isa_sortcols[2] = "unit_type"
isa_sortcols[3] = "zone_group_code"
isa_sortcols[4] = "room_level"
isa_sortcols[5] = "area_number"
isa_sortcols[6] = "area_name"

isa_sortdesc[1] = "Type"
isa_sortdesc[2] = "Room/Area Type"
isa_sortdesc[3] = "Zone Group"
isa_sortdesc[4] = "Level"
isa_sortdesc[5] = "Room/Area Number"
isa_sortdesc[6] = "Room/Area Name"

// Set the column to get focus after insert.
is_firstcol = "room_type"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Room/Area Table changes are Un-Saved.  Would you like to save changes?"

// now set fields to current edit mode
This.TriggerEvent( "ue_setfields" )

end event

on dw_1::itemerror;call w_tab_window`dw_1::itemerror;string cFieldName

cFieldName      = This.is_CurColName

Choose Case Upper( cFieldName )
Case "UNIT_TYPE"
	cFieldName = "Area/Room Type"

Case "AREA_NUMBER"
	cFieldName = "Area/Room Number"

Case "AREA_NAME"
	cFieldName = "Area/Room Name"

End Choose

If Len( Trim( This.GetText() ) ) > 0 Then
	MessageBox( "Invalid " + cFieldName + " Field Value", "[" + This.GetText() + &
				"] is NOT A VALID VALUE for the '" + cFieldName + &
				"' field on this data window.  " + &
				"Please try another value.", StopSign! )
Else
	MessageBox( cFieldName + " Blank!", cFieldName + &
				"' is a REQUIRED FIELD.  Please enter at least a temporary value if you " + &
				"wish to change it later, or [Reset] changes.", Information! )
End If
//setActionCode( 1 )      // reject and no sys error
return 1

end on

on dw_1::doubleclicked;call w_tab_window`dw_1::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
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

on dw_1::mousemove;call w_tab_window`dw_1::mousemove;string cObject, cTag

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

end on

event dw_1::itemchanged;call super::itemchanged;string CurrentColumn, ColumnContent

CurrentColumn = this.GetColumnName()

if CurrentColumn = 'room_type' then
	if upper(data) = 'E'  then // 'Equipment' 
		this.SetItem(row,'area_number',wf_get_next_equip_number())	
	else
		this.SetItem(row,'area_number',' ')
	end if
end if
 
end event

type uo_tabbar_1 from w_tab_window`uo_tabbar_1 within w_tables1
integer x = 69
integer y = 988
integer width = 2770
integer height = 120
end type

event uo_tabbar_1::ue_bar_clicked;boolean lSfsg
integer ii_tab_parm

If Not lEditMode Then
	// just in case
	If message.WordParm >= 1 And message.WordParm <= 7 Then
		ii_tab_parm = message.WordParm
	Else
		ii_tab_parm = 1
	End If

	// ue_click for u_bottom_tab
	
	// declare an reference variable for 
	// the user object u_bottom_bar

	u_bottom_bar lu_bar

	// assign the parent object (the bar) of this
	// object (the tab) to the variable
	// in order to have a reference
	lu_bar = This

	// update variables in the bar
	lu_bar.ii_lastindex = lu_bar.ii_index
	lu_bar.ii_index = ii_tab_parm

	// ue_bar_clicked in u_bottom_bar
	
	// create reference variable for 
	// the individual tabs
	u_bottom_tab lu_curtab, lu_lasttab

	// get the last tab and the current tab 
	lu_curtab       = uf_getobject ( ii_index )
	lu_lasttab      = uf_getobject ( ii_lastindex )
	
	// set the last tab to normal
	lu_lasttab.st_text.weight = 400
	lu_lasttab.p_1.picturename = cUnCurrPict

	// set the current tab to bold - need to do 2nd in case same selected
	lu_curtab.st_text.weight = 700
	lu_curtab.p_1.picturename = cCurrPict

	lSfsg = True
	If IsValid( dwCurrDW ) Then
//              dwCurrDW.TriggerEvent( "ue_closequery" )        // if we're changing, then save any changes
//              If Message.DoubleParm = -1 Then // user cancelled
		If Not dwCurrDW.uf_AllowClose() Then    // user cancelled
			lSfsg = False
		Else
//                      dwCurrDW.TriggerEvent( "ue_setfields" )
			dwCurrDW.Visible = False
//                      dwCurrDW.SetPosition( NoTopMost! )
//                      dwCurrDW.SetPosition( ToBottom! )
			lSfsg = True
		End If
	End If
/* Sfm 12/95 Added dw_report object to window and switch dataobjects
   dependant on current datawindow, this allows print function
   thoughout this window */

   dw_report.settransobject(sqlca)
	If lSfsg Then
		Choose Case ii_index
			Case 1
				dwCurrDW = dw_1
	    dw_report.dataobject = "r_room_area" /*sfm 12/95 */
			Case 2
				dwCurrDW = dw_2
	     dw_report.dataobject = "r_employee" /*sfm 12/95 */
			Case 3
				dwCurrDW = dw_3
	    dw_report.dataobject = "r_department" /*sfm 12/95 */
			Case 4
				dwCurrDW = dw_4
	    dw_report.dataobject = "r_shift" /*sfm 12/95 */
			Case 5
				dwCurrDW = dw_5
	    dw_report.dataobject = "r_call_status" /*sfm 12/95 */
			Case 6
				dwCurrDW = dw_6
	    dw_report.dataobject = "r_zone" /*mn 02/06 */
			Case 7
				dwCurrDw = dw_7
		dw_report.dataobject = "r_zone_group" /* mn 02/06 */		
		End Choose
		If IsValid( dwCurrDW ) Then
			dwCurrDW.Visible = True
	 dwCurrDW.setredraw(True)
			dwCurrDW.SetFocus()
//                      dwCurrDW.SetPosition( ToTop! )
//                      This.SetPosition( Behind!, dwCurrDW )
//                      dwCurrDW.SetPosition( TopMost! )
//                      This.SetPosition( TopMost! )
		End If
	End If
Else
	Beep( 10 )
	MessageBox( "You are in Edit mode.  ", &
					"Please choose [Save] or [Reset] before "+&
					"changing to another window." )
End If
end event

event uo_tabbar_1::constructor;call super::constructor;string asTabNames[7]

asTabNames[1] = "Area/Room"
asTabNames[2] = "Employee"
asTabNames[3] = "Department"
asTabNames[4] = "Shift"
asTabNames[5] = "Call Status"
asTabNames[6] = "Area/Zone"
asTabNames[7] = "Zone Group"

This.uf_settabs( asTabNames )
end event

type dw_report from datawindow within w_tables1
boolean visible = false
integer x = 603
integer y = 944
integer width = 494
integer height = 360
integer taborder = 60
boolean hscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

