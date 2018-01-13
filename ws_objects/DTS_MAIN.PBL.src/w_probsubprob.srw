$PBExportHeader$w_probsubprob.srw
forward
global type w_probsubprob from w_maint
end type
type st_2 from statictext within w_probsubprob
end type
type cb_modify from commandbutton within w_probsubprob
end type
type st_mode from statictext within w_probsubprob
end type
type cb_link from commandbutton within w_probsubprob
end type
type st_1 from statictext within w_probsubprob
end type
type cb_resp from commandbutton within w_probsubprob
end type
type cb_recur from commandbutton within w_probsubprob
end type
type cb_archive from commandbutton within w_probsubprob
end type
type st_3 from statictext within w_probsubprob
end type
end forward

global type w_probsubprob from w_maint
boolean visible = false
integer x = 0
integer y = 140
integer width = 7017
integer height = 1928
string title = "Categories and SubCategories - Data Entry"
string icon = "CATEG01.ICO"
st_2 st_2
cb_modify cb_modify
st_mode st_mode
cb_link cb_link
st_1 st_1
cb_resp cb_resp
cb_recur cb_recur
cb_archive cb_archive
st_3 st_3
end type
global w_probsubprob w_probsubprob

type variables
boolean lEditMode = False
boolean lNewRecord = False
boolean l4Vtask = False
end variables

forward prototypes
public subroutine set_buttons (boolean ledit_mode)
public subroutine set_fields (integer edit_mode)
public function boolean wf_add_vtask (string taskno, string subtaskno)
public function integer wf_check_vtask (string taskno, string subtaskno)
public subroutine wf_delete_vtask (string taskno, string subtaskno)
public function boolean wf_check_dup_task (string task_desc)
public function boolean wf_check_dup_subtask (string task_desc, string subtask_desc)
end prototypes

public subroutine set_buttons (boolean ledit_mode);IF lEdit_Mode = True Then 
	lEditMode = True
Else
	lEditMode = False
End If

If lEditMode Then
//      dw_1.enabled    = True
//      dw_1a.enabled   = True
//
	cb_save.enabled    = True
	cb_reset.enabled   = True

	cb_add.enabled     = False
	cb_modify.enabled  = False
	cb_archive.enabled = False
	cb_sort.enabled          = False
	cb_find.enabled    = False
//      cb_print.enabled   = False
	cb_delete.enabled  = False
	cb_close.enabled   = False
//	messagebox("set_field(1)",dwCurrDw.dataobject)
	Set_Fields( 1 )

Else
//      dw_1.enabled    = False
//      dw_1a.enabled   = False
//
	cb_save.enabled         = False
	cb_reset.enabled     = False

	cb_add.enabled          = True
	cb_modify.enabled       = True
	cb_archive.enabled      = True
	cb_sort.enabled                 = True
	cb_find.enabled                 = True
//      cb_print.enabled                = True
	cb_delete.enabled       = True
	cb_close.enabled        = True
//	messagebox("set_field(0)",dwCurrDw.dataobject)
	Set_Fields( 0 )
	lNewRecord                              = False

End If

end subroutine

public subroutine set_fields (integer edit_mode);string cMode
long nCurrRow
//Edit_Mode = 1
If Edit_Mode > 0 Then
	lEditMode = True
	If lNewRecord Then
		cMode = "New"
	Else
		cMode = "Modify"
	End If
Else
	lEditMode = False
	cMode = "View"
End If

//nCurrRow = dw_1.GetRow()
nCurrRow = dwCurrDW.ii_currow

If lEditMode And nCurrRow > 0 Then
	// we're having a little problem with record mod save/reset control between windows
	// ...so only one at a time please
	// we'll check for secondary, else assume primary
	If dwCurrDW = dw_1a Then
//      dw_1a.SetTabOrder( "subproblem_number",  9210 ) // Prob Number
		dw_1a.SetTabOrder( "subproblem_desc",    9220 ) // Prob Desc
      dw_1a.SetTabOrder( "timer_level",        9225 ) // Timer 1 st     
		dw_1a.SetTabOrder( "timer1_start_min",   9230 ) // Timer 1 start
      dw_1a.SetTabOrder( "timer2_start_min",   9240 ) // Timer 2 Start
		dw_1a.SetTabOrder( "timer3_start_min",   9245 ) // Timer 2 Start
		dw_1a.SetTabOrder( "default_status",     9250 ) // default status
		dw_1a.SetTabOrder( "auth_take_off_timer",9260 ) // timer authority
		dw_1a.SetTabOrder( "pre_openable",       9270 ) // Pre-Openable
		dw_1a.SetTabOrder( "auto_assign_ind",    9280 ) 
		dw_1a.SetTabOrder( "dept_assign",        9290 )
		dw_1a.SetTabOrder( "init_paging_min",    9300 )
		dw_1a.SetTabOrder( "retcode",        	  9310 )
		dw_1a.SetTabOrder( "lnk_task_no",     	  9311 )
		dw_1a.SetTabOrder( "lnk_subtask_no",  	  9312 )
		

Else    //If dwCurrDW = dw_1
//              dw_1.SetTabOrder( "problem_number",      9110 ) // Prob Number
		dw_1.SetTabOrder( "problem_desc",        9120 ) // Prob Desc
      dw_1.SetTabOrder( "timer_level",   9225 ) // Timer 1 st
		dw_1.SetTabOrder( "timer1_start_min",    9130 ) // Timer 1 start
		dw_1.SetTabOrder( "timer2_start_min",    9140 ) // Timer 2 Start
		dw_1.SetTabOrder( "default_status",      9150 ) // default status
		dw_1.SetTabOrder( "auth_take_off_timer", 9160 ) // lnk_task_no
		dw_1.SetTabOrder( "pre_openable",        9170 ) // lnk_subtask_no
	End If

Else            // If Not EDIT Mode
	if dwCurrDW = dw_1a Then
//		messagebox("tab order","set dw_1a")
//		dw_1a.SetTabOrder( "subproblem_number",  0 ) // Prob Number
		dw_1a.SetTabOrder( "subproblem_desc",    0 ) // Prob Desc
      dw_1a.SetTabOrder( "timer_level",        0 ) //   
		dw_1a.SetTabOrder( "timer1_start_min",   0 ) // Timer 1 start
		dw_1a.SetTabOrder( "timer2_start_min",   0 ) // Timer 2 Start
		dw_1a.SetTabOrder( "timer3_start_min",   0 ) // Timer 3 Start
		dw_1a.SetTabOrder( "default_status",     0 ) // default status
		dw_1a.SetTabOrder( "auth_take_off_timer",0 )    // timer authority
		dw_1a.SetTabOrder( "pre_openable",       0 )    // Pre-Openable
		dw_1a.SetTabOrder( "auto_assign_ind",    0 ) 
		dw_1a.SetTabOrder( "dept_assign",        0 ) 
		dw_1a.SetTabOrder( "init_paging_min",    0 ) 
		dw_1a.SetTabOrder( "retcode",        	  0 )  // vz
		dw_1a.SetTabOrder( "lnk_task_no",     	 0 )
		dw_1a.SetTabOrder( "lnk_subtask_no",  	  0 )

   else
//		messagebox("tab order","set dw_1")
		dw_1.SetTabOrder( "problem_number",      0 ) // Prob Number
		dw_1.SetTabOrder( "problem_desc",        0 ) // Prob Desc
      dw_1.SetTabOrder( "timer_level",        0 ) //    
		dw_1.SetTabOrder( "timer1_start_min",    0 ) // Timer 1 start
		dw_1.SetTabOrder( "timer2_start_min",    0 ) // Timer 2 Start
		dw_1.SetTabOrder( "default_status",      0 ) // default status
		dw_1.SetTabOrder( "auth_take_off_timer", 0 )    // timer authority
		dw_1.SetTabOrder( "pre_openable",        0 )    // Pre-Openable
		
//		dw_1a.SetTabOrder( "subproblem_number",  0 ) // Prob Number
		dw_1a.SetTabOrder( "subproblem_desc",    0 ) // Prob Desc
      dw_1a.SetTabOrder( "timer_level",        0 ) //   
		dw_1a.SetTabOrder( "timer1_start_min",   0 ) // Timer 1 start
		dw_1a.SetTabOrder( "timer2_start_min",   0 ) // Timer 2 Start
		dw_1a.SetTabOrder( "timer3_start_min",   0 ) // Timer 2 Start
		dw_1a.SetTabOrder( "default_status",     0 ) // default status
		dw_1a.SetTabOrder( "auth_take_off_timer",0 )    // timer authority
		dw_1a.SetTabOrder( "pre_openable",       0 )    // Pre-Openable
		dw_1a.SetTabOrder( "auto_assign_ind",    0 ) 
		dw_1a.SetTabOrder( "dept_assign",        0 ) 
		dw_1a.SetTabOrder( "init_paging_min",    0 ) 
		dw_1a.SetTabOrder( "retcode",        	  0 )
		dw_1a.SetTabOrder( "lnk_task_no",     	  0)
		dw_1a.SetTabOrder( "lnk_subtask_no",  	  0)


   End If
End If
st_mode.Text = cMode

end subroutine

public function boolean wf_add_vtask (string taskno, string subtaskno);integer ret
string retMsg
integer ret1, ret2
DECLARE my_proc DYNAMIC PROCEDURE FOR SQLSA ;

PREPARE SQLSA FROM "addVtask @task_no=?, @subtask_no=?" ;

EXECUTE DYNAMIC my_proc USING :taskNo, :subtaskNo ;

FETCH my_proc into :retMsg;

CLOSE my_proc ;

return true
end function

public function integer wf_check_vtask (string taskno, string subtaskno);integer total_vtask

if subtaskNo = '' then
	select count(*) into :total_vtask
	from vtasks
	where problem_number = :taskNo;
else
	select count(*) into :total_vtask
	from vtasks
	where problem_number = :taskNo
	and	subproblem_number = :subtaskNo;
end if

return total_vtask
	
end function

public subroutine wf_delete_vtask (string taskno, string subtaskno);integer total_delete
if subtaskNo = '' then
	delete from vtasks where problem_number = :taskNo;
else
	delete from vtasks where problem_number = :taskNo and subproblem_number = :subtaskNo;
end if

total_delete = 1



end subroutine

public function boolean wf_check_dup_task (string task_desc);int found
found = 0

select count(*) into :found from problem 
where problem_desc = :task_desc ;

if found > 0 then
	return false
else
	return true
end if


end function

public function boolean wf_check_dup_subtask (string task_desc, string subtask_desc);int found
string task_no
found = 0

select problem_number into :task_no from problem where problem_desc=:task_desc;
if sqlca.sqlcode = 100 then
	return true
end if

select count(*) into :found from subproblem 
where subproblem_desc = :subtask_desc and problem_number=:task_no;

if found > 0 then
	return false
else
	return true
end if


end function

event resize;call super::resize;pointer cpOldPointer

SetMicroHelp( "Resizing " + this.title + " window...please wait." )
cpOldPointer = SetPointer( HourGlass! )
this.SetRedraw( False )
dw_1.SetRedraw( False )
dw_1a.SetRedraw( False )
//cb_add.y     = Max( this.WorkSpaceHeight() - cb_add.Height - cb_add.x, dw_1a.Y + (64*5) )
//cb_modify.y  = cb_add.y
//cb_delete.y  = cb_add.y
//cb_save.y    = cb_add.y
//cb_archive.y = cb_add.y
//cb_sort.y    = cb_add.y
//cb_find.y    = cb_add.y
////cb_print.y   = cb_add.y
//cb_reset.y   = cb_add.y
//cb_close.y   = cb_add.y
////dw_1.Resize(dw_1.Width, &
////                              this.cb_close.y - (dw_1.y + dw_1.x) )
//dw_1a.Resize(dw_1.Width, &
//				Max( this.cb_close.y - (dw_1a.y + dw_1a.x), (64*4) ) )
////dw_1a.Height = Max( this.cb_close.y - (dw_1a.y + dw_1a.x), (64*4) )

st_mode.x = this.WorkSpaceWidth() - (st_mode.Width + 100)
cb_add.y		= This.WorkSpaceHeight() - ( cb_add.height + 20 )
cb_modify.y		= cb_add.y			
cb_delete.y		= cb_add.y	
cb_save.y		= cb_add.y	
cb_sort.y		= cb_add.y	
cb_find.y		= cb_add.y	
cb_reset.y		= cb_add.y	
cb_close.y		= cb_add.y	
cb_link.y		= cb_add.y	
cb_resp.y		= cb_add.y	
cb_recur.y		= cb_add.y	

//st_1.Resize(this.WorkSpaceWidth() - (250 + st_mode.width), st_1.height)
st_2.Resize(this.WorkSpaceWidth() - (515 + st_mode.width), st_2.height)
//dw_1.Resize(This.WorkSpaceWidth() -  (100), &
//		dw_1.Height)

dw_1.Resize(dw_1.width,WorkSpaceHeight() - (st_2.y + st_2.height + cb_add.height + 180))
dw_1a.Resize(This.WorkSpaceWidth() -  (1200), &
				WorkSpaceHeight() - (st_2.y + st_2.height + cb_add.height + 180))


this.SetRedraw( True )
dw_1.SetRedraw( True )
dw_1a.SetRedraw( True )



SetPointer( cpOldPointer )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end event

event open;// Automatically retrieve into the first datawindow control.
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

This.SetRedraw( False )
IF Is_PassWordOK( Get_Event_Security( "GO" ) ) Then
	dw_1.Retrieve()         // chained retrieves happen automatically
	Set_Buttons( False )
	dw_1a.SetFocus()        // allows selection of non-selected DW record cursor
	dw_1.SetFocus()
	This.SetRedraw( True )
Else
	Close( This )
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
	dw_report.SetTransObject( sqlca )
	dw_report.Retrieve()    
	li_job_num = dw_report.Print()
	dw_report.Reset()       
	If li_job_num < 1 then
		MessageBox( "Print Failure", &
			"Unable to open print job.")
		RETURN
	End If
End if

end on

on w_probsubprob.create
int iCurrent
call super::create
this.st_2=create st_2
this.cb_modify=create cb_modify
this.st_mode=create st_mode
this.cb_link=create cb_link
this.st_1=create st_1
this.cb_resp=create cb_resp
this.cb_recur=create cb_recur
this.cb_archive=create cb_archive
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.cb_modify
this.Control[iCurrent+3]=this.st_mode
this.Control[iCurrent+4]=this.cb_link
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_resp
this.Control[iCurrent+7]=this.cb_recur
this.Control[iCurrent+8]=this.cb_archive
this.Control[iCurrent+9]=this.st_3
end on

on w_probsubprob.destroy
call super::destroy
destroy(this.st_2)
destroy(this.cb_modify)
destroy(this.st_mode)
destroy(this.cb_link)
destroy(this.st_1)
destroy(this.cb_resp)
destroy(this.cb_recur)
destroy(this.cb_archive)
destroy(this.st_3)
end on

on close;call w_maint::close;close(this)
end on

event deactivate;call super::deactivate;if isValid(w_main) then
	w_main.postevent("ue_menu_set")
end if	
end event

type dw_1 from w_maint`dw_1 within w_probsubprob
string tag = "Enter data in this Parent data area."
integer x = 46
integer y = 280
integer width = 1061
integer height = 1144
integer taborder = 10
string dataobject = "d_problem2"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::constructor;call super::constructor;// Set the columns and descriptions to find on.
isa_findcols[1] = "problem_number"
isa_findcols[2] = "problem_desc"
//isa_findcols[3] = "pre_openable"
//isa_findcols[4] = "default_status"
//isa_findcols[5] = "timer1_start_min"
//isa_findcols[6] = "timer2_start_min"
//isa_findcols[7] = "timer_level"

isa_finddesc[1] = "Problem Code"
isa_finddesc[2] = "Problem Description"
//isa_finddesc[3] = "Pre-Open Status Allowed"
//isa_finddesc[4] = "Default Status Code"
//isa_finddesc[5] = "Timer #1 Start Min.'s"
//isa_finddesc[6] = "Timer #2 Start Min.'s"
//isa_finddesc[7] = "Priority Level"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "problem_number"
isa_sortcols[2] = "problem_desc"
//isa_sortcols[3] = "pre_openable"
//isa_sortcols[4] = "default_status"
//isa_sortcols[5] = "timer1_start_min"
//isa_sortcols[6] = "timer2_start_min"
//isa_sortcols[7] = "timer_level"

isa_sortdesc[1] = "Problem Code"
isa_sortdesc[2] = "Problem Description"
//isa_sortdesc[3] = "Pre-Open Status Allowed"
//isa_sortdesc[4] = "Default Status Code"
//isa_sortdesc[5] = "Timer #1 Start Min.'s"
//isa_sortdesc[6] = "Timer #2 Start Min.'s"
//isa_sortdesc[7] = "Priority Level"

// Set the column to get focus after insert.
is_firstcol = "problem_desc"

// insert row into child when inserting row in this parent datawindow
ii_insertmode = 1       

// Set the seedmode to seed after an insert is done.  There are no columns
// defined here since the seeding needs a function.  The seeding code
// can be found in the "ue_seed" event.

ii_seedmode = 1         // 0 = no seeding (default), 1 = after insert, 2 = before save
ii_seedtype = 1         // 0 = foreign keys (isa_forkeyvals[]), 1 = array values (isa_primkeyvals)
							// (for expressions and func calls use ue_seed event)

// set seed values
isa_primkeycols[1] = "pre_openable"
isa_primkeycols[2] = "default_status"
isa_primkeycols[3] = "timer1_start_min"
isa_primkeycols[4] = "timer2_start_min"
isa_primkeycols[5] = "timer3_start_min"
isa_primkeycols[6] = "auth_take_off_timer"
isa_primkeycols[7] = "pre_openable"

isa_primkeyvals[1] = "N"
isa_primkeyvals[2] = "01"
isa_primkeyvals[3] = "15"
isa_primkeyvals[4] = "15"
isa_primkeyvals[5] = "15"
isa_primkeyvals[6] = "9"
isa_primkeyvals[7] = "N"

// Set the next control in the "chain".
idw_next = dw_1a

// Set the retrieval columns to be used when retrieveing the child.
// You can stop auto retrievel by setting ib_retrievenext to FALSE.
isa_dwnextretrcols[1] = "problem_number"

// Un-Saved changes prompt string
is_promptstring = "You have UN-SAVED Problem Category CHANGES.  Would you " + &
					"like to save changes?"
is_childprompt = "You have UN-SAVED Problem Sub-Category CHANGES.  Would you " + &
					"like to save changes?"
This.SetRowFocusIndicator( Hand!)
end event

on dw_1::getfocus;boolean lSfsg

lSfsg = True
// Set Window Instance Var with pointer to current DataWindow
// since we need to know the last chosen when a button
// is pressed.
Parent.SetRedraw( False )

// If editing another datawindow, then don't setfocus this one
If lEditMode And IsValid( dwCurrDW ) And dwCurrDW <> This Then
	dwCurrDW.SetFocus()

ElseIf dwCurrDW <> This Then
	If IsValid( dwCurrDW ) Then
		// make sure we want to leave last datawindow
		dwCurrDw.SetRowFocusIndicator( p_unselected )
	End If
	If lSfsg Then
		dwCurrDw = This
		dwCurrDw.SetRowFocusIndicator( p_selected, 50 )
	ElseIf IsValid( dwCurrDW ) Then // make sure it is valid
		dwCurrDW.SetFocus()     // reset focus to last datawindow
	End If
End If
Parent.SetRedraw( True )

end on

on dw_1::doubleclicked;call w_maint`dw_1::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [Add] to add a new "+This.Title+" record or " + &
					"[Modify] to change an existing " + This.Title + " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
ElseIf dw_1.RowCount() <= 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [Add] to add a new "+This.Title+ " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
	
End If

end on

event dw_1::ue_update;boolean lSfsg
string cCurrProb, cPreOpenable, cAuthTakeOffTimer, cDefStatus
long nTimer1StartMin, nTimer2StartMin, nCurrRow

SetMicroHelp( "Validating current "+This.Title+" changes.  Please wait." )
lSfsg = True

// in case scrolling off the record caused the RowFocusChanged Event
nCurrRow = This.ii_lastrow      

If nCurrRow > 0 Then
	cCurrProb                       = This.GetItemString( nCurrRow, "problem_desc" )
	cPreOpenable            = This.GetItemString( nCurrRow, "pre_openable" )
	cAuthTakeOffTimer       = This.GetItemString( nCurrRow, "auth_take_off_timer")
	cDefStatus                      = This.GetItemString( nCurrRow, "default_status" )
	nTimer1StartMin = This.GetItemNumber( nCurrRow, "timer1_start_min" )
	nTimer2StartMin = This.GetItemNumber( nCurrRow, "timer2_start_min" )
	If dwCurrDW = This And Len( Trim( cCurrProb ) ) = 0 Then
		MessageBox( "Incomplete Entry!", "Please enter the 'Problem " + &
				"Description' for the record you are editing.", StopSign! )
		This.SetColumn( "problem_desc" )
		lSfsg = False
	End If
	If Not lSfsg Then
		This.ib_update_ok = False       // tells ue_update not to proceed
	End If
End If

If lSfsg Then
	// Update this control - 
	//  DO NOT reset the update flags so 
	//  if there is a failure, the save can be reattempted.
	
	//
	//  If you override this event with client code, make sure
	//       to set ib_update_ok properly.
	//
	//
	
	ib_update_ok = (This.Update(TRUE,FALSE) = 1)

/////////////////////
// IF adding
//    INSERT WHERE....
//
// IF deleting 
//         DELETE WHERE...
//
// IF updating
//         UPDATE WHERE..
Else
	ib_update_ok = False
//      This.TriggerEvent( "itemerror" )
	MessageBox( "Problem Category Entry Error", "Please check to ensure that " + &
					"you have entered ALL the required data properly.", StopSign! )
End If
end event

on dw_1::ue_seed;call w_maint`dw_1::ue_seed;// This event will seed the date_entered column using functions.
// ii_currow is an instance variable of the control that holds the
// current row number.

long li_last_id
boolean lSFsg = True

// determine last problem_number used
SELECT max("problem"."problem_number")
 INTO :li_last_id  
 FROM "problem";

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
	This.SetItem( This.ii_currow, "problem_number", String( li_last_id, "00000" ) )
End If
end on

on dw_1::ue_find;call w_maint`dw_1::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
End If

end on

event dw_1::clicked;call super::clicked;//uf_set_delete_all (true)
end event

type p_unselected from w_maint`p_unselected within w_probsubprob
string tag = "The currently selected row in an un-selected data window."
integer x = 690
integer y = 220
end type

type p_selected from w_maint`p_selected within w_probsubprob
string tag = "The currently selected row in a selected data window."
integer x = 1001
integer y = 236
end type

type dw_report from w_maint`dw_report within w_probsubprob
integer x = 0
integer y = 1552
integer taborder = 130
string dataobject = "r_maint_probsubprob"
end type

type cb_reset from w_maint`cb_reset within w_probsubprob
string tag = "Reset record and ABANDON any un-saved changes to the currently selected record.."
integer x = 1381
integer y = 1452
integer width = 206
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
end type

on cb_reset::clicked;// It's what a Reset does
//int niAnswer
//niAnswer = MessageBox("Reset Data?", &
//                              "Do you wish to ABANDON any CHANGES made on this screen "+&
//                              "since last save?" &
//                              , Question!, YesNo!, 2 )
//
//If niAnswer = 1 Then
//      // It's what a Reset does...
//      ROLLBACK ;
//      If dwCurrDW = dw_1a Then
//              dwCurrDW.Retrieve( &
//                      dw_1.GetItemString( dw_1.GetRow(), "problem_number" ) )
//      Else
//              dwCurrDW.Retrieve()
//      End If
//      Set_Buttons( False )
//End If
dwCurrDW.TriggerEvent( "ue_closequery" )
If message.DoubleParm <> -1 Then        // user didn't press cancel
	Set_Buttons( False )
Else    // in case we got screwed-up, we at least fix it one way or another here
	Set_Buttons( True )
End IF





DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type dw_1a from w_maint`dw_1a within w_probsubprob
string tag = "Enter data in this Child data area."
boolean visible = true
integer x = 1134
integer y = 276
integer width = 5737
integer height = 1148
integer taborder = 20
string dataobject = "d_subproblem2"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

on dw_1a::getfocus;boolean lSfsg

lSfsg = True
// Set Window Instance Var with pointer to current DataWindow
// since we need to know the last chosen when a button
// is pressed.
Parent.SetRedraw( False )

// If editing another datawindow, then don't setfocus this one
If lEditMode And IsValid( dwCurrDW ) And dwCurrDW <> This Then
	dwCurrDW.SetFocus()

ElseIf dwCurrDW <> This Then
	If IsValid( dwCurrDW ) Then
		dwCurrDw.SetRowFocusIndicator( p_unselected )
	End If
	If lSfsg Then
		dwCurrDw = This
		dwCurrDw.SetRowFocusIndicator( p_selected, 50 )
	ElseIf IsValid( dwCurrDW ) Then // make sure it is valid
		dwCurrDW.SetFocus()     // reset focus to last datawindow
	End If
End If
Parent.SetRedraw( True )

end on

event dw_1a::constructor;call super::constructor;/* SFM Mod 11-95 added timer_level column to various arrays */


// Set the columns and descriptions to find on.
isa_findcols[1] = "subproblem_number"
isa_findcols[2] = "subproblem_desc"
isa_findcols[3] = "pre_openable"
isa_findcols[4] = "default_status"
isa_findcols[5] = "timer1_start_min"
isa_findcols[6] = "timer2_start_min"
isa_findcols[7] = "timer3_start_min"
isa_findcols[8] = "timer_level"

isa_finddesc[1] = "Subtask Code"
isa_finddesc[2] = "Subtask Description"
isa_finddesc[3] = "Pre-Open Status Allowed"
isa_finddesc[4] = "Default Status Code"
isa_finddesc[5] = "Timer #1 Start Min.'s"
isa_finddesc[6] = "Timer #2 Start Min.'s"
isa_finddesc[7] = "Timer #3 Start Min.'s"
isa_finddesc[8] = "Priority Level"

// Set the columns and descriptions to sort on.
isa_sortcols[1] = "subproblem_number"
isa_sortcols[2] = "subproblem_desc"
isa_sortcols[3] = "pre_openable"
isa_sortcols[4] = "default_status"
isa_sortcols[5] = "timer1_start_min"
isa_sortcols[6] = "timer2_start_min"
isa_sortcols[7] = "timer3_start_min"
isa_sortcols[8] = "timer_level"

isa_sortdesc[1] = "Subtask Code"
isa_sortdesc[2] = "Subtask Description"
isa_sortdesc[3] = "Pre-Open Status Allowed"
isa_sortdesc[4] = "Default Status Code"
isa_sortdesc[5] = "Timer #1 Start Min.'s"
isa_sortdesc[6] = "Timer #2 Start Min.'s"
isa_sortdesc[7] = "Timer #3 Start Min.'s"
isa_sortdesc[8] = "Priority Level"
// Set the seedmode to seed after an insert is done.  There are no columns
// defined here since the seeding needs a function.  The seeding code
// can be found in the "ue_seed" event.

ii_seedmode = 1         // 0 = no seeding (default), 1 = after insert, 2 = before save
ii_seedtype = 0         // 0 = foreign keys (isa_forkeyvals[]), 1 = array values (isa_primkeyvals)
							// (for expressions and func calls use ue_seed event)

// Set the seedmode to seed after an insert is done.  The seeding is to be
// done from column values in dw_1 (the parent).  There is also function
// seeding to be done; that code is in the ue_seed event.

// Indicate which control the values are coming from.
idw_seedfrom = dw_1

// Define the Primary Key columns (the columns to be seeded).
isa_primkeycols[1] = "problem_number"
isa_primkeycols[2] = "default_status"
isa_primkeycols[3] = "timer1_start_min"
isa_primkeycols[4] = "timer2_start_min"
isa_primkeycols[5] = "timer3_start_min"
isa_primkeycols[6] = "auth_take_off_timer"
isa_primkeycols[7] = "pre_openable"
isa_primkeycols[8] = "timer_level"



// Define the Foreign Key columns (the columns in the parent where the
// values are coming from).
isa_forkeycols[1] = "problem_number"
isa_forkeycols[2] = "default_status"
isa_forkeycols[3] = "timer1_start_min"
isa_forkeycols[4] = "timer2_start_min"
isa_forkeycols[5] = "timer3_start_min"
isa_forkeycols[6] = "auth_take_off_timer"
isa_forkeycols[7] = "pre_openable"
isa_forkeycols[8] = "timer_level"
// Define the first column to have focus.
is_firstcol = "subproblem_desc"

This.SetRowFocusIndicator( Hand! )


end event

event dw_1a::ue_seed;call super::ue_seed;// This code will go to the DEFAULT table to get the next available
// activity id.  this IS NOT necessary for all applications.  This is used
// here purely as an example of combining Primary/Foreign column seeding
// in conjunction with function seeding.

string cCurrProb
long li_last_id = -1

cCurrProb = dw_1.GetItemString( dw_1.ii_lastrow, "problem_number" )

SELECT max("subproblem"."subproblem_number")
 INTO :li_last_id  
 FROM "subproblem"
 WHERE "subproblem"."problem_number" = :cCurrProb;

// ERROR checking
If sqlca.SQLCode < 0 Then       // (-1) Database ERROR...lost connection...who knows?
	Beep(1)
	egm_sqlerror( SQLCA )

// No records for this probem in database
ElseIf sqlca.SQLCode = 100  Then        // no record result set from SELECT statement
	li_last_id = 0
	
ElseIf li_last_id = -1 Then     // didn't set from what default was...who knows...
	Beep(1)
	egm_sqlerror( SQLCA )

Elseif IsNull( li_last_id ) Then        // empty database
	li_last_id = 0

End If
li_last_id = li_last_id + 10

This.SetItem( This.ii_lastrow, "subproblem_number", &
						String( li_last_id, "00000" ) )
// every problem needs one (several reasons; no records in sub-problem...etc.)
If li_last_id = 10 Then
  This.SetItem( This.ii_lastrow, "subproblem_desc", "[General]" )
End If

this.setitem(This.ii_lastrow,'auto_assign_ind','N')

end event

event dw_1a::ue_update;/* sfm update 11/95 add timer_level column */


boolean lSfsg

string cCurrProb, cPreOpenable, cAuthTakeOffTimer, cDefStatus
long nTimer1StartMin, nTimer2StartMin, nCurrRow, ntimer_level, nTimer3StartMin
//MessageBox("dataobject",this.DataObject)
SetMicroHelp( "Validating current " + This.Title + " changes.  " + &
					"Please wait." )
lSfsg = True
nCurrRow = This.ii_lastrow      
//nCurrRow = This.ii_currow     

If nCurrRow > 0 Then
	cCurrProb                       = This.GetItemString( nCurrRow, "subproblem_desc" )
	cPreOpenable            = This.GetItemString( nCurrRow, "pre_openable" )
	cAuthTakeOffTimer       = This.GetItemString( nCurrRow, "auth_take_off_timer" )
	cDefStatus                      = This.GetItemString( nCurrRow, "default_status" )
	nTimer1StartMin = This.GetItemNumber( nCurrRow, "timer1_start_min" )
	nTimer2StartMin = This.GetItemNumber( nCurrRow, "timer2_start_min" )
	nTimer3StartMin = This.GetItemNumber( nCurrRow, "timer3_start_min" )
   nTimer_level      = This.GetItemNumber( nCurrRow, "timer_level" )
	// Sub-Problem Description not entered yet
	If Len( Trim( cCurrProb ) ) = 0 Then
		lSfsg = False
		MessageBox( "Incomplete Entry!", "Please enter the 'Sub-Problem " + &
						"Description' for the record you are editing.", StopSign! )
		This.SetColumn( "subproblem_desc" )
	End If

	If Not lSfsg Then
//              This.si_process = -1
		This.ib_update_ok = False       // tells ue_update not to proceed
	End If
End If
If lSfsg Then
	// Update this control - 
	//  DO NOT reset the update flags so 
	//  if there is a failure, the save can be reattempted.
	//
	//  If you override this event with client code, make sure
	//       to set ib_update_ok properly.
	//
	//
	//ib_update_ok = (This.Update(TRUE,FALSE) = 1)
	ib_update_ok = (This.Update() = 1)
	/////////////////////
	// IF adding
	//    INSERT WHERE....
	//
	// IF deleting 
	//         DELETE WHERE...
	//
	// IF updating
	//         UPDATE WHERE..
Else
	ib_update_ok = False
	MessageBox( "Problem Sub-Category Entry Error", "Please check to ensure that " + &
					"you have entered ALL the required data properly.", StopSign! )
End If
end event

on dw_1a::doubleclicked;call w_maint`dw_1a::doubleclicked;If Not lEditMode And this.RowCount() > 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [Add] to add a new "+This.Title+" record or " + &
					"[Modify] to change an existing " + This.Title + " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
ElseIf dw_1.RowCount() <= 0 Then
	Beep(10)
	MessageBox( "Please Note:", "You are currently in View mode.  " + &
					"If you wish to enter any data in this area, you " + &
					"need to select [Add] to add a new "+This.Title+ " record.", Information! ) 
//      Message.ReturnValue=1   // 1 - do not process (0 - process)
	
End If

end on

on dw_1a::ue_find;call w_maint`dw_1a::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
End If

end on

type cb_close from w_maint`cb_close within w_probsubprob
string tag = "Exit this window and prompt for changes, if any."
integer x = 2715
integer y = 1452
integer width = 178
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "E&xit"
boolean cancel = false
end type

on cb_close::clicked;call w_maint`cb_close::clicked;Close(w_admin)
end on

type cb_save from w_maint`cb_save within w_probsubprob
string tag = "Save any changes to ehe currently selected record."
integer x = 754
integer y = 1452
integer width = 201
integer height = 88
integer taborder = 60
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
boolean default = false
end type

event cb_save::clicked;
/* Sfm Modification 11/95 remove all to w_password window
   removes prompt for user password */
int nResponse
int whereToFocus
dwCurrDW.AcceptText() 
// "ue_prepareupdate" is the hook to the control's save event.
If dwCurrDW = dw_1 Then
	if lNewRecord then
		if not wf_check_dup_task (dwCurrDW.GetItemString(dwCurrDW.GetRow(),"problem_desc")) then
			MessageBox("Error","Task already Exists! Try a different one!")
			return
		end if
	end if
	whereToFocus = 1
	nResponse = MessageBox( "Save Problem Changes?", "Do you wish to save your Problem " + &
								"Category changes?", Question!, YesNo!, 2 )
Else
	whereToFocus = 2
	if lNewRecord then
		if not wf_check_dup_subtask(dw_1.GetItemString(dw_1.GetRow(),"problem_desc"), &
					dwCurrDW.GetItemString(dwCurrDW.GetRow(),"subproblem_desc")) then
				MessageBox("Error","Sub-task already Exists! Try a different one!")	
			return
		end if	
	end if
	nResponse = MessageBox( "Save Sub-Problem Changes?", "Do you wish to save your Problem " + &
								"Sub-Category changes?", Question!, YesNo!, 2 )
End If

If nResponse = 1 Then
	If dwCurrDW.AcceptText() <> -1 Then
//              If Is_PasswordOK( Get_Event_Security( "GS" ) ) Then
      If gi_user_rights >= Get_Event_Security( "GS" ) Then
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
			dwCurrDW.TriggerEvent( "ue_prepareupdate" )
			If dwCurrDW.ib_update_ok Then
//				messagebox("before set_button",dwCurrDw.dataobject)
				Set_Buttons( False )
			End If
      Else
	 Beep(1)
	MessageBox("Insufficient Authorization", &
			"Sorry, the current password does not have sufficient rights "+&
			"for the requested operation.", StopSign! )     
		End If  // If Password OK
	End If  // If AcceptText()
End If

if l4Vtask = true then
	integer ans 
	ans = MessageBox("Telephone Task","Do you want to add this to telephone task",Question!, YesNo!,2)
	if ans = 1 then
		wf_add_vtask (dw_1.GetItemString(dw_1.GetRow(),"problem_number"),&
							dw_1a.GetItemString(dw_1a.GetRow(),"subproblem_number"))
//		MessageBox("Saving", dw_1.GetItemString(dw_1.GetRow(),"problem_number")+'  '+&
//						dw_1a.GetItemString(dw_1a.GetRow(),"subproblem_number"))
	end if
end if
l4Vtask = false

//DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

if whereToFocus = 1 Then
	dw_1.setfocus()
else
	dw_1a.setfocus()
end if


end event

type cb_sort from w_maint`cb_sort within w_probsubprob
string tag = "Sort displayed data in currently selected data area."
integer x = 965
integer y = 1452
integer width = 201
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
end type

on cb_sort::clicked;call w_maint`cb_sort::clicked;DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_find from w_maint`cb_find within w_probsubprob
string tag = "Find a record in this workstation~'s data-buffer from among selected fields."
integer x = 1175
integer y = 1452
integer width = 201
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
end type

on cb_find::clicked;call w_maint`cb_find::clicked;DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type cb_delete from w_maint`cb_delete within w_probsubprob
string tag = "Delete the currently selected record."
integer x = 507
integer y = 1452
integer width = 238
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
end type

event cb_delete::clicked;/* SFM update 11/95 used global uer-rights variable and removed
   call to is_passwordok function */


// "ue_delete" is the hook to the control's delete event.
int niAnswer, niVtask
int dw, rowF, rowD
String msgTitle[2], subtask_desc, task_desc, vtask_desc, task_no, subtask_no
msgTitle[1]="Delete Current Problem Category Record?"
msgTitle[2]="Delete Current Problem Sub-Category Record?"
vtask_desc = ''
task_no=''
subtask_no=''
niVtask = 0

If dwCurrDW <> dw_1a Then
	dw = 1
	task_desc = dw_1.GetItemString(dw_1.GetRow(),"problem_desc")
	if IsNull(task_desc) then 
		task_desc = " " 
	end if
	task_no = dw_1.GetItemString(dw_1.GetRow(),"problem_number")
	niVtask = wf_check_vtask(task_no, "")
	if niVtask > 0 then
		vtask_desc = ' as '+trim(string(niVtask))+ ' voice task(s)'
	end if
	niAnswer = MessageBox( msgTitle[dw], &
				"Do you wish to DELETE the Task Category record: " + task_desc+ &
				" ?  This will DELETE ALL " + String(dw_1a.RowCount()) + &
				" SUB-CATEGORIES associated " + &
				"with this task as well"+ vtask_desc+'!' &
				, Question!, YesNo!, 2 )
Else
	dw = 2
	subtask_desc = dw_1a.GetItemString(dw_1a.GetRow(),"subproblem_desc")
	if IsNull(subtask_desc) then 
		subtask_desc = " " 
	end if
	task_no = dw_1.GetItemString(dw_1.GetRow(),"problem_number")
	subtask_no = dw_1a.GetItemString(dw_1a.GetRow(),"subproblem_number")
	niVtask = wf_check_vtask(task_no, subtask_no)
	if niVtask > 0 then
		vtask_desc = ' and the Voice Task'
	end if
	niAnswer = MessageBox( msgTitle[dw], &
				"Do you wish to DELETE the Task Sub-Category record: " + &
				subtask_desc + vtask_desc+" ?" , Question!, YesNo!, 2 )
				
End If
//The following code became neccessary because the pb9 focus behavior
if dw = 1 then
	dw_1.SetFocus()
else
	dw_1a.SetFocus()
end if	
If niAnswer = 1 Then
	// It's what a Delete does...
//	if dw = 2 then
//		subtask_desc = dw_1a.GetItemString(dw_1a.GetRow(),"subproblem_desc")
//		niAnswer = MessageBox(msgTitle[dw], &
//			"You are deleting Problem Sub-Category: "+subtask_desc+"! Are you sure?",&
//			Question!,YesNo!,2)
//		if niAnswer = 2 then
//			goto CancelDelete
//		end if
//	end if
//	if dw = 1 then
//		dw_1.SetFocus()
//	else
//		dw_1a.SetFocus()
//	end if		
	niAnswer = MessageBox(msgTitle[dw], &
		"This is your final warning. Do you still wish to delete?",&
		Question!,YesNo!,2)
	if niAnswer = 2 then
		goto CancelDelete
	end if
//      If Is_PasswordOK( Get_Event_Security( "GD" ) ) Then
   If gi_user_rights >=  Get_Event_Security( "GD" ) Then
		SetPointer( HourGlass! )
		if dw = 1 then
			if niVtask > 0 then
				wf_delete_vtask(task_no,'')
			end if
			dw_1.TriggerEvent( "ue_delete" )
		else
			rowD = dw_1a.GetRow()
			if niVtask > 0 then
				wf_delete_vtask(task_no,subtask_no)
			end if
			dw_1a.TriggerEvent( "ue_delete" )
		end if
		// dwCurrDW.TriggerEvent( "ue_delete" )
		Set_Buttons( False )
   else
      Beep(1)
		MessageBox("Insufficient Authorization", &
			"Sorry, the current password does not have sufficient rights "+&
			"for the requested operation.", StopSign! ) 
		goto CancelDelete
	end If  // password
else
	goto CancelDelete
End If

if dw = 1 then
	dw_1.SetFocus()
	dw_1.TriggerEvent(Clicked!)
else
	dw_1a.setFocus()
	if rowD > dw_1a.RowCount() then
		dw_1a.ScrollToRow(dw_1a.RowCount())
		dw_1a.SetRow(dw_1a.RowCount())
	else
		dw_1a.ScrollToRow(rowD)
		dw_1a.SetRow(rowD)
	end if
//	dw_1a.PostEvent(Clicked!)
end if
return

CancelDelete:
if dw = 1 then
	dw_1.SetFocus()
else
	dw_1a.SetFocus()
end if		
return

end event

type cb_add from w_maint`cb_add within w_probsubprob
string tag = "Add a New record to the currently selected database."
integer x = 41
integer y = 1452
integer width = 215
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "N&ew"
end type

event cb_add::clicked;/* SFM Mod 11-11 Removed messageboxes and call to w_password
   allows user to make changes prompt free */




// "ue_insert" is the hook to the control's add event.
// Focus is not assumed by the control, it must be set.

//int niAnswer

// "ue_insert" is the hook to the control's add event.
// Focus is not assumed by the control, it must be set.

//If dwCurrDW <> dw_1a Then
//      niAnswer = MessageBox( "Create Problem Category?", &
//                              "Do you wish to CREATE a NEW Problem Category record?" &
//                              , Question!, YesNo!, 1 )
//Else
//      niAnswer = MessageBox( "Create Problem Sub-Category?", &
//                              "Do you wish to CREATE a NEW Problem Sub-Category record?" &
//                              , Question!, YesNo!, 1 )
//End If
//If niAnswer = 1 Then
//      If Is_PasswordOK( Get_Event_Security( "GN" ) ) Then
	
   if gi_user_rights >=  Get_Event_Security( "GN" )  Then

	SetPointer( HourGlass! )

		// Set Buttons for Editing
		lNewRecord = True
		Set_Buttons( True )             // Setup Enabled's...et. al.  for Editing
		dwCurrDw.TriggerEvent( "ue_insert" )
		dwCurrDW.SetFocus()     // focus after add not assumed...must set.
		dwCurrDW.SetColumn( dwCurrDW.is_firstcol )

   Else
      Beep(1)
		MessageBox("Insufficient Authorization", &
			"Sorry, the current password does not have sufficient rights "+&
			"for the requested operation.", StopSign! )     
	End If  // password

//End If        // OK response to inquiry

l4Vtask = true

DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type st_2 from statictext within w_probsubprob
string tag = "The problem sub-categories used to identify a new call on the Call Data Entry window."
integer x = 1138
integer y = 136
integer width = 1710
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 16777215
long backcolor = 27354725
boolean enabled = false
string text = "Task Sub-Categories"
alignment alignment = center!
boolean border = true
long bordercolor = 16777215
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_modify from commandbutton within w_probsubprob
event mousemove pbm_mousemove
string tag = "Modify the currently selected record."
integer x = 261
integer y = 1452
integer width = 238
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "HAND.CUR"
string text = "&Modify"
end type

on mousemove;SetMicroHelp( This.Tag )

end on

on clicked;/* Sfm Modification 11/95  removed messageboxes and calls to w_password
   windows , no more user prompts */

integer iCurrow
iCurRow = dwCurrDW.GetRow()
dwCurrDW.SetRedraw(false)

IF gi_user_rights >= Get_Event_Security( "GM" )  Then

	leditmode               = True
	Set_Buttons( True )             // Setup Enabled's...et. al.  for Editing
Else
   Beep(1)
	MessageBox("Insufficient Authorization", &
	"Sorry, the current password does not have sufficient rights "+&
	"for the requested operation.", StopSign! )     

End If

dwCurrDw.SetRow(iCurRow)
dwCurrDW.SetRedraw(true)

DwCurrDw.setfocus() /* Sfm 11/95 fixes Alt- Problems */
end on

type st_mode from statictext within w_probsubprob
string tag = "The current mode of this window (e.g. New, Modify or View)."
integer x = 2089
integer y = 28
integer width = 699
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 27354725
long backcolor = 134217750
boolean enabled = false
string text = "Setting Up..."
alignment alignment = center!
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_link from commandbutton within w_probsubprob
integer x = 1595
integer y = 1452
integer width = 288
integer height = 88
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Link-Task"
end type

event clicked;//MessageBox("info",dw_1a.GetItemString(dw_1a.GetRow(),'problem_number') + " " +&
//dw_1a.GetItemString(dw_1a.GetRow(),'subproblem_number'))
s_lnk_task sTask
If lEditMode then
	sTask.view = false
else
	sTask.view = true
end if
sTask.lnk_task=dw_1a.GetItemString(dw_1a.GetRow(),'lnk_task_no')
sTask.lnk_subtask=dw_1a.GetItemString(dw_1a.GetRow(),'lnk_subtask_no')
OpenWithParm(w_link_task,sTask)
If lEditMode then
	sTask=Message.PowerObjectParm	
//	if not IsNull(sTask.lnk_task) and not IsNull(sTask.lnk_subtask) then
//		MessageBox("return",sTask.lnk_task+" "+sTask.lnk_subtask)
		dw_1a.SetItem(dw_1a.GetRow(),"lnk_task_no",sTask.lnk_task)
		dw_1a.SetItem(dw_1a.GetRow(),"lnk_subtask_no",sTask.lnk_subtask)
//	end if
end if
end event

type st_1 from statictext within w_probsubprob
string tag = "The problem categories used to identify a new call on the Call Data Entry window."
integer x = 41
integer y = 136
integer width = 1061
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 16777215
long backcolor = 27354725
boolean enabled = false
string text = "Task Categories"
alignment alignment = center!
boolean border = true
long bordercolor = 16777215
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_resp from commandbutton within w_probsubprob
integer x = 1893
integer y = 1452
integer width = 315
integer height = 88
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Resp-Task"
end type

event clicked;//MessageBox("info",dw_1a.GetItemString(dw_1a.GetRow(),'problem_number') + " " +&
//dw_1a.GetItemString(dw_1a.GetRow(),'subproblem_number'))
s_lnk_task sTask
If lEditMode then
	sTask.view = false
else
	sTask.view = true
end if
sTask.lnk_task=dw_1a.GetItemString(dw_1a.GetRow(),'resp_task_no')
sTask.lnk_subtask=dw_1a.GetItemString(dw_1a.GetRow(),'resp_subtask_no')
sTask.title = 'Response Task'

OpenWithParm(w_link_task,sTask)
If lEditMode then
	sTask=Message.PowerObjectParm	
//	if not IsNull(sTask.lnk_task) and not IsNull(sTask.lnk_subtask) then
//		MessageBox("return",sTask.lnk_task+" "+sTask.lnk_subtask) 
		dw_1a.SetItem(dw_1a.GetRow(),"resp_task_no",sTask.lnk_task)
		dw_1a.SetItem(dw_1a.GetRow(),"resp_subtask_no",sTask.lnk_subtask)
//	end if
sTask=sTask
end if
end event

type cb_recur from commandbutton within w_probsubprob
integer x = 2217
integer y = 1452
integer width = 489
integer height = 88
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Recur Template"
end type

event clicked;s_recur_template sRecur

If lEditMode then
	sRecur.view = false
else
	sRecur.view = true
end if

//sRecur.lnk_task=dw_1a.GetItemString(dw_1a.GetRow(),'resp_task_no')
//sRecur.lnk_subtask=dw_1a.GetItemString(dw_1a.GetRow(),'resp_subtask_no')
//sRecur.title = 'Response Task'
sRecur.recur_id =f_nvl(dw_1a.GetItemNUmber(dw_1a.GetRow(),'recurring_template_id'),0) 

OpenWithParm(w_vzt_recurring_template_edit, sRecur)

If lEditMode then
	sRecur=  Message.PowerObjectParm	
	sRecur.recur_id = f_nvl(sRecur.recur_id, 0)
	dw_1a.SetItem(dw_1a.GetRow(),"recurring_template_id",sRecur.recur_id)
	If gnv_appman.is_debugmode = 'Y' then
		MessageBox('Recur Template', 'Recur. ID:'+ string(sRecur.recur_id) )
	END IF
end if
end event

type cb_archive from commandbutton within w_probsubprob
string tag = "Archive (transfer to different database and no longer availabe for on-line Q&&A) date range of data."
boolean visible = false
integer x = 1111
integer y = 1348
integer width = 288
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "Arc&hive"
end type

on clicked;MessageBox( "Disabled Function", "Please contact your Database Administrator about this function.", Information! )

end on

type st_3 from statictext within w_probsubprob
string tag = "The current mode of this window (e.g. New, Modify or View)."
integer x = 50
integer y = 20
integer width = 699
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 27354725
long backcolor = 134217750
boolean enabled = false
string text = "Task Category"
alignment alignment = center!
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

