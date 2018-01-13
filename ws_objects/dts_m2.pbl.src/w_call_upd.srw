$PBExportHeader$w_call_upd.srw
forward
global type w_call_upd from window
end type
type pb_4 from picturebutton within w_call_upd
end type
type p_2 from picture within w_call_upd
end type
type pb_9 from picturebutton within w_call_upd
end type
type pb_8 from picturebutton within w_call_upd
end type
type pb_7 from picturebutton within w_call_upd
end type
type pb_6 from picturebutton within w_call_upd
end type
type pb_5 from picturebutton within w_call_upd
end type
type pb_docs from picturebutton within w_call_upd
end type
type pb_3 from picturebutton within w_call_upd
end type
type dw_2 from datawindow within w_call_upd
end type
type st_bannerleftchar from statictext within w_call_upd
end type
type st_bannerrightchar from statictext within w_call_upd
end type
type st_3 from statictext within w_call_upd
end type
type st_2 from statictext within w_call_upd
end type
type st_mode from statictext within w_call_upd
end type
type st_banner from statictext within w_call_upd
end type
type p_1 from picture within w_call_upd
end type
type pb_2 from picturebutton within w_call_upd
end type
type pb_1 from picturebutton within w_call_upd
end type
type dw_1 from datawindow within w_call_upd
end type
type cb_copy from commandbutton within w_call_upd
end type
type cb_modify from commandbutton within w_call_upd
end type
type cb_closecall from commandbutton within w_call_upd
end type
type cb_delete from commandbutton within w_call_upd
end type
type cb_save from commandbutton within w_call_upd
end type
type cb_reset from commandbutton within w_call_upd
end type
type cb_close from commandbutton within w_call_upd
end type
type cb_add from commandbutton within w_call_upd
end type
type uo_1 from uo_vzt_tcp_metro within w_call_upd
end type
type cb_retrieve from commandbutton within w_call_upd
end type
end forward

global type w_call_upd from window
boolean visible = false
integer x = 1074
integer y = 480
integer width = 3525
integer height = 2596
boolean titlebar = true
string title = "Call Update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 134217728
string icon = "PHONE01.ICO"
string pointer = "Arrow!"
event ue_add ( )
event ue_refresh ( )
event ue_setcol ( )
event ue_printscreen ( )
event ue_printreport ( )
pb_4 pb_4
p_2 p_2
pb_9 pb_9
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_docs pb_docs
pb_3 pb_3
dw_2 dw_2
st_bannerleftchar st_bannerleftchar
st_bannerrightchar st_bannerrightchar
st_3 st_3
st_2 st_2
st_mode st_mode
st_banner st_banner
p_1 p_1
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
cb_copy cb_copy
cb_modify cb_modify
cb_closecall cb_closecall
cb_delete cb_delete
cb_save cb_save
cb_reset cb_reset
cb_close cb_close
cb_add cb_add
uo_1 uo_1
cb_retrieve cb_retrieve
end type
global w_call_upd w_call_upd

type variables
DataWindowChild dwc_subproblem
DataWindowChild dwc_room
DataWindowChild dwc_room_dsc
DataWindowChild dwc_repairman
DataWindowChild dwc_guest

double id_account // HE guest id

decimal{2} ld_Amount

boolean exitByExitButton
boolean usedMouse
boolean timerStartModified
boolean copiedCall
boolean tabPressInRoom
boolean windowIsAlreadyOpen
boolean shiftDataLoaded
boolean ib_findcall
string copyCallNumber
string openMode 
string inputOperator
string callType
string tableSelectStr
boolean errExit = false
string allowDup

string auto_assign_ind

int colToSet

//call record variables
string      sCallNumber
datetime dtCallIndate
string      sStatCode
string      sRoom
string      sZone
string      sGuest
string      sCaller
string      sProblem
string      sSubproblem
string      sProblemDefinition
string      sComplaint
string      sReceiver
string      sShift
string      sResolution
string      sRepairman
datetime dtCallOutdate
string      sClosedBy
string      sClosedBydept
string      sTimerNumber
datetime dtTimerStart
string      sCallerCategory
string      sProblemNumber
string      sSubproblemNumber
double    dTimer1StartMin
double    dTimer2StartMin
double    dTimer1Reps
double    dTimer2Reps
string       sAuthTakeOffTimer
string       sDefaultStatus   
string       sPreOpenable
string       sPreOpened
int            iTimerLevel
string       sRoomDsc
string       sOpenedStatus
string       spaging
double    d_paging_min
string	 sRecurInd
double 	 dRecurId
double    dTimer3StartMin
double    dTimer3Reps

//shift related variables
time weekday_shift_start[]
time weekday_shift_end[]
time sat_shift_start[]
time sat_shift_end[]
time sun_shift_start[]
time sun_shift_end[]
int max_shift

//timer/recurring variables
s_timer_recur sTimerRecur

//Guest call history variables
integer guestHistCutOffDays
boolean showGuestCallHist
end variables

forward prototypes
public function boolean wf_show_dddw (datawindow dw_in, string dw_in_col, integer dddw_on_off)
public subroutine wf_set_buttons (integer bottonmode)
public subroutine wf_set_tab_order (integer tabmode)
public subroutine wf_process_room_change (string chgorigin)
public function string wf_chk_showlist (string incol)
public subroutine wf_allow_dddw_edit (datawindow dwIn, string dwInCol, integer dddwAllowEditSW)
public subroutine wf_set_dddw_allow_edit (string controlcolumn, string setcolumn)
public function boolean wf_dddw_set_filter (string filterfor, string filtercriteria)
public function boolean wf_validate_problem (string problemnumber)
public function boolean wf_validate_subproblem (string subproblemnumber)
public subroutine wf_initialize_call_variables (integer initflag)
public function integer wf_validate_stat_code (string ccolcontents)
public function boolean wf_load_shift_data ()
public function integer wf_shift_number (integer dayofweek, datetime shiftdatetime)
public function double wf_call_number ()
public function boolean wf_insert_call (integer calltable)
public function boolean wf_update_call (integer calltable)
public function string wf_find_subproblem_number ()
public function boolean wf_modify_data_source (string currsourcetable, string newsourcetable)
public function boolean wf_set_initial_col (integer colnum)
public function integer wf_check_auto_assign ()
public function boolean wf_save_call ()
public function double wf_call_number_old ()
public subroutine wf_delete_pageassignment (string callNumber)
public function string wf_mod_datetime_mask (string coln)
public function double wf_insert_recurring (s_timer_recur itimerrecur, string iroom, string icategory, string icaller, string itaskno, string isubtaskno, string itaskdef)
public function string wf_pop_guest_call_hist (string room_no, string guest_nm, date cutoff_dt)
public subroutine wf_process_guest_call_hist ()
end prototypes

event ue_add();if dw_1.RowCount() > 0 then
	dw_1.DeleteRow(0) // re-initialize screen
end if

//sfm 
//mn- need to maintain openMode for return to action initiation screen. openMode is set action is moved to m_menu
//openMode = '0'

st_mode.text = 'Add'
wf_set_tab_order(1) // set to open all fields
dw_1.insertRow(0)

wf_initialize_call_variables(0)

dtCallIndate = datetime(today(), now())

dw_1.SetItem(dw_1.GetRow(),"call_indate", dtCallIndate)

datetime after15Mins
if SecondsAfter(now(), 23:59:00) < 840 then  //leap into next day
	after15Mins = datetime(RelativeDate(today(),1), &
								  RelativeTime(00:00:00, 900 - (SecondsAfter(now(), 23:59:00) + 60)))
else
	after15Mins = datetime(today(), RelativeTime(now(), 900))
end if

dtTimerStart = after15Mins
if cPassUserName <> "" then
	sReceiver = cpassusername
else
	 If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
	   	sReceiver = cpassusername
	 else
		errExit = true
		exitByExitButton = true
		TriggerEvent("close")
		return
	end if
end if
//MessageBox("cpassusername",cpassusername)
dw_1.SetItem(dw_1.GetRow(),"timer_start", after15Mins)
dw_1.SetItem(dw_1.GetRow(),"receiver",cpassusername)
dw_1.SetItem(dw_1.GetRow(),"stat_code","01")

sStatCode = "01"

if not shiftDataLoaded then
	wf_load_shift_data()
end if
sShift = string(wf_shift_number ( DayNumber( Date(dtCallIndate) ), dtCallIndate ))

dw_1.ResetUpdate()
wf_set_buttons(1) // set to entry mode
wf_set_tab_order(2) // set to allow update
//dw_1.SetColumn("room")
colToSet = 4 //set column focus to room
timerStartModified = false //reset timer start datetime mod sw

dw_1.SetFocus()
end event

event ue_refresh();
st_mode.text = 'Modify'
//openMode = mid(Message.StringParm,1,1)
/* openMode = 0    window is opened via menu(could be entering a timer or pending call)
				  1	 window is opened by Pendingcall screen for modifying a timer call
				  2	 window is opened by Pendingcall screen for modifying a pending call 
				  3    window is opened by another screen for copying a timer call
				  4    window is opened by another screen for copying a pending call
				  5    window is opened by another screen for modifying a closed call
				  6	 window is opened by Timercall screen for modifying a timer call
				  A    window is opened by another screen for viewing a timer call
				  B    window is opened by another screen for viewing a pending call
				  C    window is opened by another screen for viewing a closed call
*/
//MessageBox("openmode","openMode is " + openMode)

string currentDataObject, newDataObject, newCallType
currentDataObject = dw_1.DataObject

CHOOSE CASE openMode
	CASE '1' 
		newCallType = "timercalls"
	CASE '2'
		newCallType = "pendingcalls"
	CASE '3' 
		newCallType = "timercalls"
	CASE '4'
		newCallType = "pendingcalls"
	CASE '5'
		newCallType = "closedcalls"
	CASE '6'
		newCallType = "timercalls"
	CASE 'A' 
		newCallType = "timercalls"
	CASE 'B'
		newCallType = "pendingcalls"
	CASE 'C'
		newCallType = "closedcalls"				
END CHOOSE

if newCallType <> callType then
	if not wf_modify_data_source(callType,newCallType) then
		return
	end if
	callType = newCallType
end if

if dw_1.Retrieve(sCallNumber) = 0 then
// the following logic is to prevent user trying to modify a closed call via a pending or timer call screen 
// where a call is closed by one but is still shown in another before the refresh hasn't been take place.
	MessageBox("Error","Call number " + sCallNumber + " may have already closed! It should not in your " + &
	           "Pending calls or Timer calls screen after the next refresh!")
	this.TriggerEvent("ue_add")
	CHOOSE CASE openMode
			CASE '1'
				if IsValid( w_pending_calls ) then
					open(w_pending_calls)
				end if
			CASE '2'
				if IsValid( w_pending_calls ) then
					open(w_pending_calls)
				end if
			CASE '6'
				if IsValid( w_timer_calls ) then
					open(w_timer_calls)
				end if
	END CHOOSE
	return
end if
wf_initialize_call_variables(1)
if openMode = '3' or openMode = '4' then
	cb_copy.TriggerEvent("clicked")
elseif openMode = 'A' or (openMode = 'B' or openMode = 'C') then // view only
	st_mode.text = 'View'
	wf_set_buttons(4)
	wf_set_tab_order(3)
else
	cb_modify.TriggerEvent("clicked")
end if
p_1.Visible = true
windowIsAlreadyOpen = true
this.postEvent("ue_setcol")
end event

event ue_setcol;wf_set_initial_col(colToSet)
SetPointer(Arrow!)
end event

event ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

event ue_printreport();int res
res = dw_1.Sharedata(dw_2)
dw_2.print()
dw_1.Sharedataoff()
end event

public function boolean wf_show_dddw (datawindow dw_in, string dw_in_col, integer dddw_on_off);string ls_dw_mod, ls_cur_dw, mod_res
//ls_cur_dw = dw_in.Describe("guest.dddw.Showlist")
//MessageBox("before modify showlist",ls_cur_dw)

if dddw_on_off = 0 then  // Hide
	ls_dw_mod = dw_in_col + ".dddw.ShowList = no"
else  // Show
	ls_dw_mod = dw_in_col + ".dddw.ShowList = yes"
end if

mod_res = dw_in.Modify(ls_dw_mod)

//ls_cur_dw = dw_in.Describe("guest.dddw.Showlist")
//MessageBox("after modify showlist","sw: " + ls_cur_dw + " **rslt: " + mod_res)


if  mod_res <> '' then
	return false
else
	return true
end if


end function

public subroutine wf_set_buttons (integer bottonmode);/* buttonmode values
	1 = call entry
	2 = update mode
	3 = copy mode
	4 = view mode
	
*/

if bottonmode = 4 then
	cb_reset.enabled = false
	cb_save.enabled = false
	cb_copy.enabled = false
	cb_delete.enabled = false
	cb_closecall.enabled = false
	pb_6.enabled = false
	pb_4.enabled = false
	pb_5.enabled = false
	pb_7.enabled = false
	pb_3.enabled = false	
	return
end if

if bottonmode = 2 then
	cb_reset.enabled = true
	cb_save.enabled = true
	cb_copy.enabled = false
	cb_delete.enabled = true
	cb_closecall.enabled = true
	pb_6.enabled = true
	pb_4.enabled = true
	pb_5.enabled = false
	pb_7.enabled = true
	pb_3.enabled = true	
	return
end if

if bottonmode = 3 then
	cb_reset.enabled = false
	cb_save.enabled = true
	cb_copy.enabled = true
	cb_delete.enabled = false
	cb_closecall.enabled = false
	pb_6.enabled = false
	pb_4.enabled = true
	pb_5.enabled = true
	pb_7.enabled = false
	pb_3.enabled = false	
	return
end if

if bottonmode = 1 then
	cb_reset.enabled = true
	cb_save.enabled = true
	cb_copy.enabled = false
	cb_delete.enabled = false
	cb_closecall.enabled = false
	pb_6.enabled = true
	pb_4.enabled = true
	pb_5.enabled = false
	pb_7.enabled = false
	pb_3.enabled = false	
	return
end if


end subroutine

public subroutine wf_set_tab_order (integer tabmode);/* tabmode  1 = original tab order
			   2 = update tab
				3 = view tab
*/

int cn, rc, cb, ci, co, sc, ts, rm, rd, cc, gs, pn, sp, cd, rp, pd, ro

if tabmode = 1 then 
	dw_1.SetTabOrder("call_number",10)
	dw_1.SetTabOrder("receiver",20)
	dw_1.SetTabOrder("closed_by",30)
	dw_1.SetTabOrder("call_indate",40)
	dw_1.SetTabOrder("call_outdate",50)
	dw_1.SetTabOrder("stat_code",60)
	dw_1.SetTabOrder("timer_start",70)
	dw_1.SetTabOrder("room",80)
	dw_1.SetTabOrder("room_dsc",90)
	dw_1.SetTabOrder("caller_category",100)
	dw_1.SetTabOrder("guest",110)
	dw_1.SetTabOrder("problem_problem_number",120)
	dw_1.SetTabOrder("subproblem",130)
	dw_1.SetTabOrder("closed_bydept",140)
	dw_1.SetTabOrder("repairman",150)
	dw_1.SetTabOrder("problem_definition",160)
	dw_1.SetTabOrder("resolution",170)
	
end if

if tabmode = 2 then 
//	dw_1.SetTabOrder("call_number",0)
	dw_1.SetTabOrder("receiver",0)
	dw_1.SetTabOrder("closed_by",0)
	dw_1.SetTabOrder("call_indate",0)
	dw_1.SetTabOrder("call_outdate",0)
	dw_1.SetTabOrder("stat_code",10)
	dw_1.SetTabOrder("timer_start",20)
	dw_1.SetTabOrder("room",30)
	dw_1.SetTabOrder("room_dsc",40)
	dw_1.SetTabOrder("caller_category",50)
	dw_1.SetTabOrder("guest",60)
	dw_1.SetTabOrder("problem_problem_number",70)
	dw_1.SetTabOrder("subproblem",80)
	dw_1.SetTabOrder("closed_bydept",90)
	dw_1.SetTabOrder("repairman",100)
	dw_1.SetTabOrder("problem_definition",110)
	dw_1.SetTabOrder("resolution",120)
//	dw_1.SetColumn("room")
end if


if tabmode = 3 then 
//	dw_1.SetTabOrder("call_number",0)
	dw_1.SetTabOrder("receiver",0)
	dw_1.SetTabOrder("closed_by",0)
	dw_1.SetTabOrder("call_indate",0)
	dw_1.SetTabOrder("call_outdate",0)
	dw_1.SetTabOrder("stat_code",0)
	dw_1.SetTabOrder("timer_start",0)
	dw_1.SetTabOrder("room",0)
	dw_1.SetTabOrder("room_dsc",0)
	dw_1.SetTabOrder("caller_category",0)
	dw_1.SetTabOrder("guest",0)
	dw_1.SetTabOrder("problem_problem_number",0)
	dw_1.SetTabOrder("subproblem",0)
	dw_1.SetTabOrder("closed_bydept",0)
	dw_1.SetTabOrder("repairman",0)
	dw_1.SetTabOrder("problem_definition",0)
	dw_1.SetTabOrder("resolution",0)
	
end if


	
	
	

end subroutine

public subroutine wf_process_room_change (string chgorigin);/* If room number changes, corresponding room desc must be changed too 
   or wise reverse
*/

string roomNum, roomDsc
if chgOrigin = 'room' then
	roomDsc = dwc_room.GetItemString(dwc_room.GetRow(),"area_name")
	dw_1.SetItem(dw_1.GetRow(),"room_dsc",roomDsc)
	sZone = dwc_room.GetItemString(dwc_room.GetRow(),"unit_type")
else
	roomNum = dwc_room_dsc.GetItemString(dwc_room_dsc.GetRow(),"area_number")
	dw_1.SetItem(dw_1.GetRow(),"room",roomNum)
	sZone = dwc_room_dsc.GetItemString(dwc_room_dsc.GetRow(),"unit_type")
end if
end subroutine

public function string wf_chk_showlist (string incol);string strDesc

strDesc = inCol + ".dddw.showlist"

return dw_1.Describe(strDesc)

end function

public subroutine wf_allow_dddw_edit (datawindow dwIn, string dwInCol, integer dddwAllowEditSW);//** allow_edit_sw = 1 then turn allowedit on
// 

string ls_dw_mod

if dddwAllowEditSW = 0 then  // off
	ls_dw_mod = dwInCol + ".dddw.AllowEdit = false"
else  // on
	ls_dw_mod = dwInCol + ".dddw.AllowEdit = true"
end if

if dwIn.Modify(ls_dw_mod) <> '' then
	MessageBox("dwModify Error","dwModify AllowEdit Error")
end if
end subroutine

public subroutine wf_set_dddw_allow_edit (string controlcolumn, string setcolumn);string ls_desc_str, xx

ls_desc_str = setColumn + ".dddw.AllowEdit"
xx = dw_1.Describe(ls_desc_str)

If Pos( Upper( controlColumn ), "GST" ) > 0 or &
	Pos( Upper( controlColumn ), "OUTSIDER" ) > 0 Then  //* is not HLT/GST or GST
	if dw_1.Describe(ls_desc_str) <> 'yes' then
		wf_allow_dddw_edit(dw_1,setColumn,1)
	end if
else
	if dw_1.Describe(ls_desc_str) <> 'no' then
		wf_allow_dddw_edit(dw_1,setColumn,0)
	end if  
end if

end subroutine

public function boolean wf_dddw_set_filter (string filterfor, string filtercriteria);//MessageBox("SetFilter", "SetFilter For: " + filterfor + " with criteria of: " + filtercriteria)
int ret
filterFor = upper(filterFor)

if filterFor = "GUEST" then
	dw_1.GetChild("guest",dwc_guest)
	dwc_guest.SetTransObject(sqlca)
	dwc_guest.retrieve()
	ret = dwc_guest.SetFilter( "dept = '" + filterCriteria + "'"  )
	if ret < 0 then
		MessageBox( "Error!", "Couldn't SetFilter Caller/Guest Table properly." )
		return false
	end if
	ret = dwc_guest.Filter()
	if ret < 0 then
		MessageBox( "Error!", "Couldn't Filter Caller/Guest Table properly." )
		return false
	end if
end If


if filterFor = "SUBPROBLEM" then
	dw_1.GetChild("subproblem",dwc_subproblem)
	dwc_subproblem.SetTransObject(sqlca)
	dwc_subproblem.retrieve()
	ret = dwc_subproblem.SetFilter( "problem_number = '" + filterCriteria + "'" )
	if ret < 0 then
		MessageBox( "Error!", "Couldn't SetFilter Subproblem properly." )
		return false
	end if
	ret = dwc_subproblem.Filter()
	if ret < 0 then
		MessageBox( "Error!", "Couldn't Filter SubProblem pick-list properly." )
		return false
	end if
end if


if filterFor = "REPAIRMAN" then
	dw_1.GetChild("repairman",dwc_repairman)
	dwc_repairman.SetTransObject(sqlca)
	dwc_repairman.retrieve()
	ret = dwc_repairman.SetFilter( "dept = '" + filterCriteria + "'" )
	if ret < 0 then
		MessageBox( "Error!", "Couldn't SetFilter Repairman properly." )
		return false
	end if
	ret = dwc_repairman.Filter()
	if ret < 0 then
		MessageBox( "Error!", "Couldn't Filter Repairman properly." )
		return false
	end if
end If


return true
end function

public function boolean wf_validate_problem (string problemnumber); datetime dtTimer
  
  SELECT "problem"."problem_desc"  
//         "problem"."timer1_start_min",   
//         "problem"."timer2_start_min",   
//         "problem"."timer1_reps",   
//         "problem"."timer2_reps",   
//         "problem"."auth_take_off_timer",   
//         "problem"."default_status",   
//         "problem"."pre_openable",   
//         "problem"."timer_level"  
    INTO :sProblem   
//         :dTimer1StartMin,   
//         :dTimer2StartMin,   
//         :dTimer1Reps,   
//         :dTimer2Reps,   
//         :sAuthTakeOffTimer,   
//         :sDefaultStatus,   
//         :sPreOpenable,   
//         :iTimerLevel  
    FROM "problem"  
   WHERE "problem"."problem_number" = :problemNumber   ;
	
	if sqlca.sqlcode <> 0 then
		if sqlca.sqlcode = 100 then
			MessageBox("Database Error","Problem not found in problem table. ", StopSign!)
			return false
		else
			MessageBox("Database Error",sqlca.sqlerrtext, StopSign!)
			return false
		end if
	end if

if openMode = '0' then  //adding new call
//	if sRecurInd = 'Y' then //recurring call do not re-calc timer start
//		dtTimer = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
//		if sDefaultStatus = '01' then //force it to a pre-open so it won't auto assign right a way
//			dw_1.SetItem(dw_1.GetRow(), "stat_code", '00')
//			sStatCode = "00"
//			timerStartModified = true
//		end if
//	else
//		//dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin) 
//		dtTimer = f_calc_timer_start (dtCallIndate, dTimer1StartMin) 
//	end if
//	if sPreOpenable = 'Y' then
//		if timerStartModified  then  //manually modified timer start field 
//			if sDefaultStatus > '09' then //if none timer call('10' - '90'), retain default stat
//				dtTimerStart = dtTimer
//				dw_1.SetItem(dw_1.GetRow(), "stat_code", sDefaultStatus)
//				sStatCode = sDefaultStatus
//			end if
//		else
//			dtTimerStart = dtTimer
//			dw_1.SetItem(dw_1.GetRow(), "timer_start", dtTimer)
//			dw_1.SetItem(dw_1.GetRow(), "stat_code", sDefaultStatus)
//			sStatCode = sDefaultStatus
//		end if
//	else
//		dtTimerStart = dtTimer
//		dw_1.SetItem(dw_1.GetRow(), "timer_start", dtTimer)
//		dw_1.SetItem(dw_1.GetRow(), "stat_code", sDefaultStatus)
//		sStatCode = sDefaultStatus
//	end if
	dw_1.SetItem(dw_1.GetRow(), "subproblem", "")
	sSubproblemNumber = ""
end if

return true
end function

public function boolean wf_validate_subproblem (string subproblemnumber); datetime dtTimer
  
  SELECT "subproblem"."subproblem_desc",   
         "subproblem"."timer1_start_min",   
         "subproblem"."timer2_start_min",   
         "subproblem"."timer1_reps",   
         "subproblem"."timer2_reps",   
         "subproblem"."auth_take_off_timer",   
         "subproblem"."default_status",   
         "subproblem"."pre_openable",   
         "subproblem"."timer_level",
         "subproblem"."init_paging_min",
         "subproblem"."timer3_start_min",
			"subproblem"."timer3_reps"
			
    INTO :sSubproblem,   
         :dTimer1StartMin,   
         :dTimer2StartMin,   
         :dTimer1Reps,   
         :dTimer2Reps,   
         :sAuthTakeOffTimer,   
         :sDefaultStatus,   
         :sPreOpenable,   
         :iTimerLevel,
			:d_paging_min,
			:dTimer3StartMin, 
			:dTimer3Reps
    FROM "subproblem"  
   WHERE "subproblem"."subproblem_number" = :subproblemNumber   
	  and "subproblem"."problem_number" = :sProblemNumber;
	
	if sqlca.sqlcode <> 0 then
		if sqlca.sqlcode = 100 then
			MessageBox("Database Error","subproblem not found in subproblem table. ", StopSign!)
			return false
		else
			MessageBox("Database Error",sqlca.sqlerrtext, StopSign!)
			return false
		end if
	end if

if openMode = '0' then  //adding new call
	if sRecurInd = 'Y' then //recurring call do not re-calc timer start
		dtTimer = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
		if sDefaultStatus = '01' then //force it to a pre-open so it won't auto assign right a way
			dw_1.SetItem(dw_1.GetRow(), "stat_code", '00')
			sStatCode = "00"
			timerStartModified = true
		end if
	else
	//	dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin) 
		dtTimer = f_calc_timer_start (dtCallIndate, dTimer1StartMin) 
	end if
	if sPreOpenable = 'Y' then
		if timerStartModified  then  //manually modified timer start field 
			if sDefaultStatus > '09' then //if none timer call('10' - '90'), retain default stat
				dtTimerStart = dtTimer
				dw_1.SetItem(dw_1.GetRow(), "stat_code", sDefaultStatus)
				sStatCode = sDefaultStatus
			end if
		else
			dtTimerStart = dtTimer
			dw_1.SetItem(dw_1.GetRow(), "timer_start", dtTimer)
			dw_1.SetItem(dw_1.GetRow(), "stat_code", sDefaultStatus)
			sStatCode = sDefaultStatus
		end if
	else
		dtTimerStart = dtTimer
		dw_1.SetItem(dw_1.GetRow(), "timer_start", dtTimer)
		dw_1.SetItem(dw_1.GetRow(), "stat_code", sDefaultStatus)
		sStatCode = sDefaultStatus
	end if
end if

return true
end function

public subroutine wf_initialize_call_variables (integer initflag);if initFlag = 0 then  // opened via menu ico
	sCallNumber				= ""
	setNull(dtCallIndate)
	sStatCode				= ""
	sRoom						= ""
	sGuest					= ""
	sCaller					= ""
	sProblem					= ""
	sSubproblem				= ""
	sProblemDefinition	= ""
	sComplaint				= ""
	sReceiver				= ""
	sShift					= ""
	sResolution				= ""
	sRepairman				= ""
	setNull(dtCallOutdate)			
	sClosedBy				= ""
	sClosedBydept			= ""
	sTimerNumber			= ""
	setNull(dtTimerStart)
	sCallerCategory		= ""
	sProblemNumber			= ""
	sSubproblemNumber		= ""
	dTimer1StartMin		= 0
	dTimer2StartMin		= 0
	dTimer1Reps				= 0
	dTimer2Reps				= 0
	sAuthTakeOffTimer		= ""
	sDefaultStatus			= ""   
	sPreOpenable			= ""
	sPreOpened				= ""
	iTimerLevel				= 0
	sRoomDsc					= ""
	sOpenedStatus			= ""
   spaging              = ""
	sZone 					= "00"  // default to all zone
	sRecurInd				= "N"
	dRecurId					= 0
	return
end if

// opened via all other screens
sCallNumber				= dw_1.GetItemString(dw_1.GetRow(),"call_number")
dtCallIndate			= dw_1.GetItemDatetime(dw_1.GetRow(),"call_indate")
sStatCode				= dw_1.GetItemString(dw_1.GetRow(),"stat_code")
sRoom						= dw_1.GetItemString(dw_1.GetRow(),"room")
sGuest					= dw_1.GetItemString(dw_1.GetRow(),"guest")
sCaller					= dw_1.GetItemString(dw_1.GetRow(),"caller")
sProblem					= dw_1.GetItemString(dw_1.GetRow(),"problem")
sSubproblem				= dw_1.GetItemString(dw_1.GetRow(),"subproblem")
sProblemDefinition	= dw_1.GetItemString(dw_1.GetRow(),"problem_definition")
sComplaint				= dw_1.GetItemString(dw_1.GetRow(),"complaint")
sReceiver				= dw_1.GetItemString(dw_1.GetRow(),"receiver")
sShift					= dw_1.GetItemString(dw_1.GetRow(),"shift")
sResolution				= dw_1.GetItemString(dw_1.GetRow(),"resolution")
sRepairman				= dw_1.GetItemString(dw_1.GetRow(),"repairman")
dtCallOutdate			= dw_1.GetItemDatetime(dw_1.GetRow(),"call_outdate")		
sClosedBy				= dw_1.GetItemString(dw_1.GetRow(),"closed_by")
sClosedBydept			= dw_1.GetItemString(dw_1.GetRow(),"closed_bydept")
sTimerNumber			= dw_1.GetItemString(dw_1.GetRow(),"timer_number")
dtTimerStart			= dw_1.GetItemDatetime(dw_1.GetRow(),"timer_start")
sCallerCategory		= dw_1.GetItemString(dw_1.GetRow(),"caller_category")
sProblemNumber			= dw_1.GetItemString(dw_1.GetRow(),"problem_problem_number")
sSubproblemNumber		= dw_1.GetItemString(dw_1.GetRow(),"subproblem_subproblem_number")
dTimer1StartMin		= dw_1.GetItemNumber(dw_1.GetRow(),"timer1_start_min")
dTimer2StartMin		= dw_1.GetItemNumber(dw_1.GetRow(),"timer2_start_min")
dTimer1Reps				= dw_1.GetItemNumber(dw_1.GetRow(),"timer1_reps")
dTimer2Reps				= dw_1.GetItemNumber(dw_1.GetRow(),"timer2_reps")
sAuthTakeOffTimer		= dw_1.GetItemString(dw_1.GetRow(),"auth_take_off_timer")
sDefaultStatus			= dw_1.GetItemString(dw_1.GetRow(),"default_status")   
sPreOpenable			= dw_1.GetItemString(dw_1.GetRow(),"pre_openable")
sPreOpened				= dw_1.GetItemString(dw_1.GetRow(),"pre_opened")
iTimerLevel				= dw_1.GetItemNumber(dw_1.GetRow(),"timer_level")
sRoomDsc					= dw_1.GetItemString(dw_1.GetRow(),"room_dsc")
sOpenedStatus			= dw_1.GetItemString(dw_1.GetRow(),"opened_status")
sRecurInd				= dw_1.GetItemString(dw_1.GetRow(),"recur_ind")
dRecurId					= dw_1.GetItemNumber(dw_1.GetRow(),"recur_id")


return
end subroutine

public function integer wf_validate_stat_code (string ccolcontents);int nResponse
string cCurrStat
cCurrStat         = dw_1.GetItemString(   dw_1.GetRow(), "stat_code" )
	CHOOSE CASE Integer( cColContents )

	Case 0                  // pre-open timer calls
		If sPreOpenable = "N" Then
			MessageBox( "dw_1 Call is NOT Pre-Openable", "You have set " + &
					"the time for dw_1 calls' alarm " + &
					"after the allowable duration set for dw_1 Sub-Problem.  " + &
					"dw_1 call has a Pre-Openable flag of [" + &
					sPreOpenable + "] and may therefore not be set beyond " + &
					"the number of minutes allowable " + &
					"for dw_1 Problem Sub-Category.  dw_1 flag is modifiable on " + &
					"the Problem (Sub-)Category Screen (as well as minutes " + &
					"before timer)" + &
					"and MAY NOT BE MODIFIED here once dw_1 call is saved unless " + &
					"[Modify] is chosen " + &
					"and then a (even the same) Problem Sub-Category for dw_1 call " + &
					"is chosen.  You will then be prompted to update all " + &
					"the Problem Sub-Category Information associated with " + &
					"dw_1 call.", StopSign! )
					dw_1.SetItem( dw_1.GetRow(), "stat_code", sDefaultStatus)
					sStatCode = sDefaultStatus
					return 1  // disallow change
		End If

	Case 1 To 9             // open timer calls

	Case 10 To 89   // open non-timer calls
		If Integer( sDefaultStatus ) < 10 &
		 AND Integer( cCurrStat ) < 10 then
//		 And Integer( ccolcontents) < 10 Then
			nResponse = MessageBox( "Reset Timer Start?", &
					"You have chosen a Status Code " + &
					"of an Open Non-Timer Call.  dw_1 Call has both a " + &
					"Current and Default Status Code of an Open Timer Call.  " + &
					"Would you like to TAKE dw_1 CALL OFF-TIMER.", &
					Question!, YesNo!, 2 )
			If nResponse = 1 Then
				If Is_PasswordOK( Integer( sAuthTakeOffTimer ) ) Then
//					return 0 // accept
				Else
					return 1 // reject and retain focus
				End If
			Else
				return 1 // reject and retain focus
			End If
		End If
	CASE 99 
			MessageBox("Stop","Can not change to 'Close Status' ! Please use Pending Call screen to " + &
			           "close a call !",stopsign!)
			dw_1.SetItem( dw_1.GetRow(), "stat_code", sDefaultStatus)
			sStatCode = sDefaultStatus
			return 1  // disallow change
	End Choose

return 0
end function

public function boolean wf_load_shift_data ();int i_shift
i_shift = 1
string s_shift, s_weekday, s_sat, s_sun
datetime dt_shift_start
time      t_shift_start

 select max(shift_num) into :max_shift from timeshift;
 if sqlca.sqlcode <> 0 then
	 MessageBox("Error","DB error: " + sqlca.sqlerrtext)
	 return false
 end if

 DECLARE shift CURSOR FOR  
  SELECT timeshift.shift_num,   
			timeshift.shift_time_start,
         timeshift.shift_weekday,   
         timeshift.shift_saturday,   
         timeshift.shift_sunday  
    FROM timeshift  ;
OPEN shift;

//** the following logic is assuming there are only 3 shifts

do while i_shift <= max_shift
	// SFM 11/01/97 Code fro mssql datetime datatype
	IF cappdbtype = 'MSSQL' THEN
	   FETCH shift into :s_shift, :dt_shift_start, :s_weekday, :s_sat, :s_sun;
      t_shift_start = time(dt_shift_start)
	ELSE
	   FETCH shift into :s_shift, :t_shift_start, :s_weekday, :s_sat, :s_sun;
   END IF
	if integer(s_shift) = 1 then
		if s_weekday = 'Y' then
			weekday_shift_start[1] = t_shift_start
			weekday_shift_end[max_shift] = t_shift_start
		end if
		if s_sat = 'Y' then
			sat_shift_start[1] = t_shift_start
			sat_shift_end[max_shift] = t_shift_start
		end if 
		if s_sun = 'Y' then
			sun_shift_start[1] = t_shift_start
			sun_shift_end[max_shift] = t_shift_start
		end if 
	else
		if s_weekday = 'Y' then
			weekday_shift_start[integer(s_shift)] = t_shift_start
			weekday_shift_end[integer(s_shift) - 1] = t_shift_start
		end if
		if s_sat = 'Y' then
			sat_shift_start[integer(s_shift)] = t_shift_start
			sat_shift_end[integer(s_shift) - 1] = t_shift_start
		end if 
		if s_sun = 'Y' then
			sun_shift_start[integer(s_shift)] = t_shift_start
			sun_shift_end[integer(s_shift) - 1 ] = t_shift_start
		end if 
	end if
	i_shift += 1

loop

CLOSE shift;
ROLLBACK;

shiftDataLoaded = true
return true
end function

public function integer wf_shift_number (integer dayofweek, datetime shiftdatetime);boolean weekday, sat, sun, shift_not_found
datetime day_start[], day_end[], sat_start[], sat_end[], sun_start[], sun_end[]

if max_shift = 0 then
	// reload shift data if not loaded
	wf_load_shift_data()
end if

int i_loop
time shift_time
int shift_num
shift_time = time(shiftDateTime)

weekday = false
sat = false
sun = false

if dayOfWeek = 1 then
	sun = true
elseif dayOfWeek = 7 then
	sat = true
else
	weekday = true
end if

//* the followings are setting up date and time for shifts through out a day
if weekday then
	if weekday_shift_start[max_shift] > weekday_shift_end[max_shift] then  // shift are in between 2 days
		if shift_time <= weekday_shift_start[1] then // fall into last shift of the day
			i_loop = 1
			do while i_loop < max_shift
				day_start[i_loop] = datetime(RelativeDate(date(shiftDateTime), -1), &
									 weekday_shift_start[i_loop])
				day_end[i_loop] = datetime(RelativeDate(date(shiftDateTime), -1), &
									weekday_shift_end[i_loop])
				i_loop += 1
			loop
			day_start[max_shift] = datetime(RelativeDate(date(shiftDateTime), -1), &
								weekday_shift_start[max_shift])
			day_end[max_shift] = datetime(date(shiftDateTime), &
								weekday_shift_end[max_shift])
		else
			i_loop = 1
			do while i_loop < max_shift
				day_start[i_loop] = datetime(date(shiftDateTime), &
											weekday_shift_start[i_loop])
				day_end[i_loop] = datetime(date(shiftDateTime), &
											weekday_shift_end[i_loop])
				i_loop += 1
			loop
			day_start[max_shift] = datetime(date(shiftDateTime), &
											weekday_shift_start[max_shift])
			day_end[max_shift] = datetime(RelativeDate(date(shiftDateTime), 1), &
											weekday_shift_end[max_shift])
		end if
	else
		i_loop = 1
		do while i_loop <= max_shift
			day_start[i_loop] = datetime(date(shiftDateTime), weekday_shift_start[i_loop])
			day_end[i_loop] = datetime(date(shiftDateTime), weekday_shift_end[i_loop])
			i_loop += 1
		loop
	end if
end if


if sat then
	if sat_shift_start[max_shift] > sat_shift_end[max_shift] then  // shift are in between 2 days
		if shift_time <= sat_shift_start[1] then // fall into last shift of the day
			i_loop = 1
			do while i_loop < max_shift
				sat_start[i_loop] = datetime(RelativeDate(date(shiftDateTime), -1), &
									 sat_shift_start[i_loop])
				sat_end[i_loop] = datetime(RelativeDate(date(shiftDateTime), -1), &
									sat_shift_end[i_loop])
				i_loop += 1
			loop
			sat_start[max_shift] = datetime(RelativeDate(date(shiftDateTime), -1), &
								sat_shift_start[max_shift])
			sat_end[max_shift] = datetime(date(shiftDateTime), &
								sat_shift_end[max_shift])
		else
			i_loop = 1
			do while i_loop < max_shift
				sat_start[i_loop] = datetime(date(shiftDateTime), &
											sat_shift_start[i_loop])
				sat_end[i_loop] = datetime(date(shiftDateTime), &
											sat_shift_end[i_loop])
				i_loop += 1
			loop
			sat_start[max_shift] = datetime(date(shiftDateTime), &
											sat_shift_start[max_shift])
			sat_end[max_shift] = datetime(RelativeDate(date(shiftDateTime), 1), &
											sat_shift_end[max_shift])
		end if
	else
		i_loop = 1
		do while i_loop <= max_shift
			sat_start[i_loop] = datetime(date(shiftDateTime), sat_shift_start[i_loop])
			sat_end[i_loop] = datetime(date(shiftDateTime), sat_shift_end[i_loop])
			i_loop += 1
		loop
	end if
end if



if sun then
	if sun_shift_start[max_shift] > sun_shift_end[max_shift] then  // shift are in between 2 days
		if shift_time <= sun_shift_start[1] then // fall into last shift of the day
			i_loop = 1
			do while i_loop < max_shift
				sun_start[i_loop] = datetime(RelativeDate(date(shiftDateTime), -1), &
									 sun_shift_start[i_loop])
				sun_end[i_loop] = datetime(RelativeDate(date(shiftDateTime), -1), &
									sun_shift_end[i_loop])
				i_loop += 1
			loop
			sun_start[max_shift] = datetime(RelativeDate(date(shiftDateTime), -1), &
								sun_shift_start[max_shift])
			sun_end[max_shift] = datetime(date(shiftDateTime), &
								sun_shift_end[max_shift])
		else
			i_loop = 1
			do while i_loop < max_shift
				sun_start[i_loop] = datetime(date(shiftDateTime), &
											sun_shift_start[i_loop])
				sun_end[i_loop] = datetime(date(shiftDateTime), &
											sun_shift_end[i_loop])
				i_loop += 1
			loop
			sun_start[max_shift] = datetime(date(shiftDateTime), &
											sun_shift_start[max_shift])
			sun_end[max_shift] = datetime(RelativeDate(date(shiftDateTime), 1), &
											sun_shift_end[max_shift])
		end if
	else
		i_loop = 1
		do while i_loop <= max_shift
			sun_start[i_loop] = datetime(date(shiftDateTime), sun_shift_start[i_loop])
			sun_end[i_loop] = datetime(date(shiftDateTime), sun_shift_end[i_loop])
			i_loop += 1
		loop
	end if
end if


//** the followings are to determine which shift the current call fall into
i_loop = 1
shift_not_found = true
if weekday then 
	do while shift_not_found
		if shiftDateTime >= day_start[i_loop] and shiftDateTime < day_end[i_loop] then
			shift_num = i_loop
			shift_not_found = false
		end if
		i_loop += 1
		if i_loop > max_shift and shift_not_found then
			MessageBox("Shift Error","No shift is found")
			shift_num = 0
			shift_not_found = false
		end if
	loop
elseif sat then
	do while shift_not_found
		if shiftDateTime >= sat_start[i_loop] and shiftDateTime < sat_end[i_loop] then
			shift_num = i_loop
			shift_not_found = false
		end if
		i_loop += 1
		if i_loop > max_shift and shift_not_found then
			MessageBox("Shift Error","No shift is found")
			shift_num = 0
			shift_not_found = false
		end if
	loop
else
	do while shift_not_found
		if shiftDateTime >= sun_start[i_loop] and shiftDateTime < sun_end[i_loop] then
			shift_num = i_loop
			shift_not_found = false
		end if
		i_loop += 1
		if i_loop > max_shift and shift_not_found then
			MessageBox("Shift Error","No shift is found")
			shift_num = 0
			shift_not_found = false
		end if
	loop
end if

return shift_num
end function

public function double wf_call_number ();double dNewCallNumber
string sNewCallNumber,  ls_error, ls_code

/// record record with new call number
//	UPDATE "sys_settings"
//      SET "last_callnum" =  {fn floor("last_callnum")}+ 1 
//    WHERE "phony_key"    = '1';
// the followings changes is made to avoid using floor function which is suspected the
// cause of the big jump in call numbers from 300,000's to a million.
UPDATE sys_settings
SET last_callnum =  convert(char(10),convert(double,last_callnum) + 1) 
WHERE phony_key   = '1';

If sqlca.SQLCode <> 0 Then        
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Error', 'Failed to create new call number. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return -1
END IF

// get last call number
SELECT "sys_settings"."last_callnum"
    INTO :sNewCallNumber
    FROM "sys_settings"
	 WHERE "sys_settings"."phony_key" = '1';

If sqlca.SQLCode <> 0 Then       // Database ERROR...lost connection...who knows?
 	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Error', 'Failed to select new call number.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return -1
END IF
COMMIT; // !!!!!!!!!!!!!!!! 
dNewCallNumber = double ( sNewCallNumber)
return dNewCallNumber
end function

public function boolean wf_insert_call (integer calltable);// callTable 1 = 'timercalls'
//			    2 = 'pendingcalls'
if f_chk_duplicate_call(calltable,'insert',sRoomDsc,sProblem,sSubproblem) = false then
	if allowDup = 'N' then
		MessageBox("Error","Duplicate is not allowed!")
		return false
	end if
	int ans	
	ans = MessageBox("Duplicate","The call is a duplicate! Please enter Yes to save it anyway or No to change it!", &
			question!, YesNo!, 2)
	if ans = 2 then
		return false
	end if
end if

if sRecurInd = 'Y' then
		dRecurId = wf_insert_recurring(sTimerRecur,sRoom,sCallerCategory,sGuest,&
			sProblemNumber, sSubproblemNumber,sProblemDefinition)
end if

//s_call scall
//scall.call_number=sCallNumber     
//scall.call_indate=dtCallIndate 
//scall.stat_code=sStatCode  
//scall.room=sRoom  
//scall.guest=sGuest   
//scall.caller=sCaller   
//scall.problem=sProblem   
//scall.subproblem=sSubProblem   
//scall.problem_definition=sProblemDefinition   
//scall.complaint=sComplaint   
//scall.receiver=sReceiver  
//scall.shift=sShift   
//scall.resolution=sResolution   
//scall.repairman=sRepairman   
//scall.call_outdate=dtCallOutdate   
//scall.closed_by=sClosedBy   
//scall.closed_bydept=sClosedBydept   
//scall.timer_number=sTimerNumber   
//scall.timer_start=dtTimerStart   
//scall.caller_category=sCallerCategory   
//scall.problem_number=sProblemNumber 
//scall.subproblem_number=sSubproblemNumber 
//scall.timer1_start_min=dTimer1StartMin   
//scall.timer2_start_min=dTimer2StartMin 
//scall.timer1_reps=dTimer1Reps  
//scall.timer2_reps=dTimer2Reps   
//scall.auth_take_off_timer=sAuthTakeOffTimer  
//scall.default_status=sDefaultStatus   
//scall.pre_openable=sPreOpenable   
//scall.pre_opened=sPreOpened  
//scall.timer_level=iTimerLevel  
//scall.room_dsc=sRoomDsc
//scall.opened_status=sOpenedStatus
//scall.paging_ind=spaging
//scall.init_paging_min=d_paging_min
//scall.recur_ind=sRecurInd
//scall.recur_id=dRecurId
//
//if f_insert_call (callTable,sCallNumber,scall) = false then
//	return false
//end if
//
ld_amount = dw_1.GetITemNumber (1, 'amount')

StartInsert:
if callTable = 1 then
	INSERT INTO "timercalls"  
         ( "call_number",   
           "call_indate",   
           "stat_code",   
           "room",   
           "guest",   
           "caller",   
           "problem",   
           "subproblem",   
           "problem_definition",   
           "complaint",   
           "receiver",   
           "shift",   
           "resolution",   
           "repairman",   
           "call_outdate",   
           "closed_by",   
           "closed_bydept",   
           "timer_number",   
           "timer_start",   
           "caller_category",   
           "problem_number",   
           "subproblem_number",   
           "timer1_start_min",   
           "timer2_start_min",   
           "timer1_reps",   
           "timer2_reps",   
           "auth_take_off_timer",   
           "default_status",   
           "pre_openable",   
           "pre_opened",   
           "timer_level",   
           "room_dsc",   
           "opened_status",
			  "paging_ind",
			  "init_paging_min",
			  "recur_ind",
				"recur_id", "amount","timer3_start_min","timer3_reps")    
  VALUES ( :sCallNumber,   
           :dtCallIndate,   
           :sStatCode,   
           :sRoom,   
           :sGuest,   
           :sCaller,   
           :sProblem,   
           :sSubProblem,   
           :sProblemDefinition,   
           :sComplaint,   
           :sReceiver,   
           :sShift,   
           :sResolution,   
           :sRepairman,   
           :dtCallOutdate,   
           :sClosedBy,   
           :sClosedBydept,   
           :sTimerNumber,   
           :dtTimerStart,   
           :sCallerCategory,   
           :sProblemNumber,   
           :sSubproblemNumber,   
           :dTimer1StartMin,   
           :dTimer2StartMin,   
           :dTimer1Reps,   
           :dTimer2Reps,   
           :sAuthTakeOffTimer,   
           :sDefaultStatus,   
           :sPreOpenable,   
           :sPreOpened,   
           :iTimerLevel,   
           :sRoomDsc,   
           :sOpenedStatus,
			  :spaging,
			  :d_paging_min,
			  :sRecurInd,
			  :dRecurId, :ld_Amount, :dTimer3StartMin,:dTimer3Reps )  ;
else
	if callTable = 2 then
		INSERT INTO "pendingcalls"  
         ( "call_number",   
           "call_indate",   
           "stat_code",   
           "room",   
           "guest",   
           "caller",   
           "problem",   
           "subproblem",   
           "problem_definition",   
           "complaint",   
           "receiver",   
           "shift",   
           "resolution",   
           "repairman",   
           "call_outdate",   
           "closed_by",   
           "closed_bydept",   
           "timer_number",   
           "timer_start",   
           "caller_category",   
           "problem_number",   
           "subproblem_number",   
           "timer1_start_min",   
           "timer2_start_min",   
           "timer1_reps",   
           "timer2_reps",   
           "auth_take_off_timer",   
           "default_status",   
           "pre_openable",   
           "pre_opened",   
           "timer_level",   
           "room_dsc",   
           "opened_status",
			  "paging_ind",
			  "init_paging_min",
			  "recur_ind",
			  "recur_id", "amount","timer3_start_min","timer3_reps")  
  VALUES ( :sCallNumber,   
           :dtCallIndate,   
           :sStatCode,   
           :sRoom,   
           :sGuest,   
           :sCaller,   
           :sProblem,   
           :sSubProblem,   
           :sProblemDefinition,   
           :sComplaint,   
           :sReceiver,   
           :sShift,   
           :sResolution,   
           :sRepairman,   
           :dtCallOutdate,   
           :sClosedBy,   
           :sClosedBydept,   
           :sTimerNumber,   
           :dtTimerStart,   
           :sCallerCategory,   
           :sProblemNumber,   
           :sSubproblemNumber,   
           :dTimer1StartMin,   
           :dTimer2StartMin,   
           :dTimer1Reps,   
           :dTimer2Reps,   
           :sAuthTakeOffTimer,   
           :sDefaultStatus,   
           :sPreOpenable,   
           :sPreOpened,   
           :iTimerLevel,   
           :sRoomDsc,   
           :sOpenedStatus,
			  :spaging,
			  :d_paging_min,
			  :sRecurInd,
			  :dRecurId, :ld_Amount,:dTimer3StartMin,:dTimer3Reps )  ;
	else
		INSERT INTO "closedcalls"  
         ( "call_number",   
           "call_indate",   
           "stat_code",   
           "room",   
           "guest",   
           "caller",   
           "problem",   
           "subproblem",   
           "problem_definition",   
           "complaint",   
           "receiver",   
           "shift",   
           "resolution",   
           "repairman",   
           "call_outdate",   
           "closed_by",   
           "closed_bydept",   
           "timer_number",   
           "timer_start",   
           "caller_category",   
           "problem_number",   
           "subproblem_number",   
           "timer1_start_min",   
           "timer2_start_min",   
           "timer1_reps",   
           "timer2_reps",   
           "auth_take_off_timer",   
           "default_status",   
           "pre_openable",   
           "pre_opened",   
           "timer_level",   
           "room_dsc",   
           "opened_status",
			  "paging_ind",
			  "init_paging_min",
			  "recur_ind",
			  "recur_id", "amount","timer3_start_min","timer3_reps")  
  VALUES ( :sCallNumber,   
           :dtCallIndate,   
           :sStatCode,   
           :sRoom,   
           :sGuest,   
           :sCaller,   
           :sProblem,   
           :sSubProblem,   
           :sProblemDefinition,   
           :sComplaint,   
           :sReceiver,   
           :sShift,   
           :sResolution,   
           :sRepairman,   
           :dtCallOutdate,   
           :sClosedBy,   
           :sClosedBydept,   
           :sTimerNumber,   
           :dtTimerStart,   
           :sCallerCategory,   
           :sProblemNumber,   
           :sSubproblemNumber,   
           :dTimer1StartMin,   
           :dTimer2StartMin,   
           :dTimer1Reps,   
           :dTimer2Reps,   
           :sAuthTakeOffTimer,   
           :sDefaultStatus,   
           :sPreOpenable,   
           :sPreOpened,   
           :iTimerLevel,   
           :sRoomDsc,   
           :sOpenedStatus,
			  :spaging,
			  :d_paging_min,
			  :sRecurInd,
			  :dRecurId, :ld_Amount,:dTimer3StartMin,:dTimer3Reps )  ;
		end if
end if
string ls_error, ls_code
if sqlca.sqlcode <> 0 then
	if sqlca.sqldbcode = -193 then// duplicate primary key 
		sCallNumber=string(wf_call_number())
		Goto StartInsert // re-try insertion
	else
		ls_error =  sqlca.SQLerrtext
		ls_code	=  string( sqlca.SQLCode) 
		ROLLBACK;
		MessageBox('Database Insert Error', 'Failed to create new call record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
		return false
	end if
end if

commit;
if sqlca.sqlcode < 0 then
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Commit Error', 'Failed on commit. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return false
end if

return true
end function

public function boolean wf_update_call (integer calltable);  
// callTable 1 = 'timercalls'
//			    2 = 'pendingcalls'
//           3 = 'closedcalls'
datetime ts
ts = datetime(today(),now())
if f_chk_duplicate_call(calltable,'update',sRoomDsc,sProblem,sSubproblem) = false then
	MessageBox("Duplicate","The call is a duplicate!")
	return false
end if
CHOOSE CASE callTable
	CASE 1
	   UPDATE  "timercalls"  
      SET  "call_indate" =  :dtCallIndate,   
           "stat_code" =  :sStatCode, 
           "room" =   :sRoom,
           "guest" =  :sGuest,  
           "caller" =  :sCaller, 
           "problem" =   :sProblem, 
           "subproblem" =  :sSubProblem,    
           "problem_definition" = :sProblemDefinition,    
           "complaint" = :sComplaint,   
           "receiver" = :sReceiver,   
           "shift" =  :sShift,
           "resolution" = :sResolution,     
           "repairman" =   :sRepairman,  
           "call_outdate" =   :dtCallOutdate  ,   
			  "closed_by" =   :sClosedBy,
           "closed_bydept" =  :sClosedBydept,
           "timer_number" = :sTimerNumber,   
           "timer_start" =  :dtTimerStart,    
           "caller_category" = :sCallerCategory,    
           "problem_number" = :sProblemNumber,    
           "subproblem_number" =  :sSubproblemNumber,  
           "timer1_start_min" = :dTimer1StartMin,  
           "timer2_start_min" = :dTimer2StartMin,      
           "timer1_reps" = :dTimer1Reps,   
           "timer2_reps" =   :dTimer2Reps,  
           "auth_take_off_timer" =  :sAuthTakeOffTimer,    
           "default_status" = :sDefaultStatus,   
           "pre_openable" = :sPreOpenable,     
           "pre_opened" =   :sPreOpened,  
           "timer_level" =    :iTimerLevel,   
           "room_dsc" =    :sRoomDsc,   
           "opened_status" = :sOpenedStatus ,
			  "paging_ind" = :spaging,
			  "last_upd_ts" = :ts
	 WHERE "timercalls"."call_number" = :sCallNumber;
CASE 2
	   UPDATE  "pendingcalls"  
      SET  "call_indate" =  :dtCallIndate,   
           "stat_code" =  :sStatCode, 
           "room" =   :sRoom,
           "guest" =  :sGuest,  
           "caller" =  :sCaller, 
           "problem" =   :sProblem, 
           "subproblem" =  :sSubProblem,    
           "problem_definition" = :sProblemDefinition,    
           "complaint" = :sComplaint,   
           "receiver" = :sReceiver,   
           "shift" =  :sShift,
           "resolution" = :sResolution,     
           "repairman" =   :sRepairman,  
           "call_outdate" =   :dtCallOutdate  ,   
			  "closed_by" =   :sClosedBy,
           "closed_bydept" =  :sClosedBydept,
           "timer_number" = :sTimerNumber,   
           "timer_start" =  :dtTimerStart,    
           "caller_category" = :sCallerCategory,    
           "problem_number" = :sProblemNumber,    
           "subproblem_number" =  :sSubproblemNumber,  
           "timer1_start_min" = :dTimer1StartMin,  
           "timer2_start_min" = :dTimer2StartMin,      
           "timer1_reps" = :dTimer1Reps,   
           "timer2_reps" =   :dTimer2Reps,  
           "auth_take_off_timer" =  :sAuthTakeOffTimer,    
           "default_status" = :sDefaultStatus,   
           "pre_openable" = :sPreOpenable,     
           "pre_opened" =   :sPreOpened,  
           "timer_level" =    :iTimerLevel,   
           "room_dsc" =    :sRoomDsc,   
           "opened_status" = :sOpenedStatus,
			  "paging_ind" = :spaging,
			  "last_upd_ts" = :ts
			  
	 WHERE "pendingcalls"."call_number" = :sCallNumber;
CASE 3
	   UPDATE  "closedcalls"  
      SET  "call_indate" =  :dtCallIndate,   
           "stat_code" =  :sStatCode, 
           "room" =   :sRoom,
           "guest" =  :sGuest,  
           "caller" =  :sCaller, 
           "problem" =   :sProblem, 
           "subproblem" =  :sSubProblem,    
           "problem_definition" = :sProblemDefinition,    
           "complaint" = :sComplaint,   
           "receiver" = :sReceiver,   
           "shift" =  :sShift,
           "resolution" = :sResolution,     
           "repairman" =   :sRepairman,  
           "call_outdate" =   :dtCallOutdate  ,   
			  "closed_by" =   :sClosedBy,
           "closed_bydept" =  :sClosedBydept,
           "timer_number" = :sTimerNumber,   
           "timer_start" =  :dtTimerStart,    
           "caller_category" = :sCallerCategory,    
           "problem_number" = :sProblemNumber,    
           "subproblem_number" =  :sSubproblemNumber,  
           "timer1_start_min" = :dTimer1StartMin,  
           "timer2_start_min" = :dTimer2StartMin,      
           "timer1_reps" = :dTimer1Reps,   
           "timer2_reps" =   :dTimer2Reps,  
           "auth_take_off_timer" =  :sAuthTakeOffTimer,    
           "default_status" = :sDefaultStatus,   
           "pre_openable" = :sPreOpenable,     
           "pre_opened" =   :sPreOpened,  
           "timer_level" =    :iTimerLevel,   
           "room_dsc" =    :sRoomDsc,   
           "opened_status" = :sOpenedStatus,
			  "last_upd_ts" = :ts
	 WHERE "closedcalls"."call_number" = :sCallNumber;
END CHOOSE
string ls_error, ls_code
If sqlca.SQLCode <> 0 Then        
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Update Error', 'Failed to update call record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return false
END IF

//check recurring data change. if it changes, update the recurring table
if dw_1.GetItemString(dw_1.GetRow(),"recur_ind") = 'Y' then 
	double thisRecurId
	date old_start_date, old_end_date, new_start_date, new_end_date
	time old_start_time, new_start_time, old_daily_start, old_daily_end
	time new_daily_start, new_daily_end
	string old_freq_code, old_recur_by, old_week_day_selected
	integer old_freq_num, new_freq_num
	thisRecurId = dw_1.getItemNumber(dw_1.GetRow(),"recur_id")
	if not IsNumber(string(thisRecurId)) then
		goto DONE
	end if
	select	start_date,
				end_date,
				start_time,
				freq_code,
				freq_num,
				recur_by,
				daily_start_time,
				daily_end_time,
				week_day_selected
	into		:old_start_date,
				:old_end_date,
				:old_start_time, 
				:old_freq_code,
				:old_freq_num,
				:old_recur_by,
				:old_daily_start,
				:old_daily_end,
				:old_week_day_selected
	from		recurring
	where		recur_id = :thisRecurId;
	if sqlca.sqlcode < 0 then
		MessageBox("DB Error","getting recurring data erorr: " + string(thisRecurId))
	end if
	if sTimerRecur.recur_start_date <> string(old_start_date) or &
		sTimerRecur.recur_end_date <> string(old_end_date) or &
		sTimerRecur.recur_start_time <> string(old_start_time) or &
		sTimerRecur.recur_freq_code <> old_freq_code or &
		sTimerRecur.recur_freq_num <> string(old_freq_num) or &
		sTimerRecur.recur_by <> old_recur_by or &
		sTimerRecur.daily_start_time <> string(old_daily_start) or &
		sTimerRecur.daily_end_time <> string(old_daily_end) or &
		sTimerRecur.week_day_selected <> old_week_day_selected then
//		MessageBox("Update","updating recurring table...")
		new_start_date = date(sTimerRecur.recur_start_date)
		new_end_date = date(sTimerRecur.recur_end_date)
		new_start_time = time(sTimerRecur.recur_start_time )
		new_freq_num = integer(sTimerRecur.recur_freq_num) 
		new_daily_start = time(sTimerRecur.daily_start_time)
		new_daily_end = time(sTimerRecur.daily_end_time)
		update 	recurring
		set		start_date = :new_start_date,
					end_date = :new_end_date,
					start_time = :new_start_time,
					freq_code = :sTimerRecur.recur_freq_code,
					freq_num = :new_freq_num,
					recur_by = :sTimerRecur.recur_by,
					daily_start_time = :new_daily_start,
					daily_end_time = :new_daily_end,
					week_day_selected = :sTimerRecur.week_day_selected,
					lst_upd = getdate()
		where		recur_id = :thisRecurId;
		if sqlca.sqlcode < 0 then
			MessageBox("DB Update Error",sqlca.sqlerrtext+" for id:"+ string(thisRecurId))
			return false
		end if
	end if
end if
DONE:
commit;
if sqlca.sqlcode <> 0 then
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Commit Error', 'Failed on commit. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return false
end if

return true
end function

public function string wf_find_subproblem_number ();DataWindowChild dddw_temp
integer ret
string cSubProblemNo

cSubProblemNo = ''
ret     = dw_1.GetChild( "subproblem", dddw_temp )
if ret = -1 then
	MessageBox( "Error!", "Couldn't load" +&
					" SubProblem Table properly." )
else
	dddw_temp.SetTransObject( SQLCA )
	cSubProblemNo   = dddw_temp.GetItemString(dddw_temp.GetRow(),"subproblem_number")
   auto_assign_ind = dddw_temp.getitemstring(dddw_temp.getrow(),'auto_assign_ind')
	

end if

return cSubProblemNo
end function

public function boolean wf_modify_data_source (string currsourcetable, string newsourcetable);boolean done
long nmStart
done = false
nmStart = 1

if upper(currsourcetable) = upper(newsourcetable)   then return true

do while not done
	nmStart = pos(tableSelectStr,currSourceTable,nmStart)
	if nmStart = 0 then
		done = true
	else
		tableSelectStr = replace(tableSelectStr,nmStart,len(currsourcetable),newSourceTable)
	end if
loop
if dw_1.Modify("DataWindow.Table.Select='" + tableSelectStr + "'") <> "" then
	MessageBox("DW Modify Error","")
	return false
end if

return true
end function

public function boolean wf_set_initial_col (integer colnum);//MessageBox("setcol",string(colnum))
if dw_1.SetColumn(colNum) < 0 then
	MessageBox("Setcolumn Fail","Fail to SetColumn " + string(colNum))
	return false
else
	return true
end if
end function

public function integer wf_check_auto_assign ();String ls_dept , ls_employee_num , ls_employee_name
String ls_pager_id , ls_datetime, ls_capecode
s_pageassignment ass
string special_msg
string ls_now , ls_mgr_pager_id  
long ll_count


  
SELECT subproblem.auto_assign_ind, 
			subproblem.dept_assign 
into :auto_assign_ind, :ls_dept
FROM subproblem  
WHERE subproblem.subproblem_number = :sSubproblemNumber and
	   Subproblem.problem_number = :sproblemNumber;

IF sqlca.sqlcode <> 0 THEN
	messagebox('Select SubProblem Table Error',sqlca.sqlerrtext)
	return - 1
END IF
If auto_assign_ind = 'Y' and IsNull(ls_dept) THEN
   MEssagebox('Responder','A pager ID could not be determined from the subproblem table and the department managers table!~r~nInsert of this record has been aborted')
	return - 1
END IF


IF auto_assign_ind = 'Y' THEN
	if sPreOpened = 'Y' then
		if sClosedByDept = '' then
			sClosedBydept = ls_dept // populate auto assign dept for pending screen filter
		end if
		return 0
	end if
	if not f_find_pager_id (ls_dept, ls_employee_name, ls_employee_num, ls_pager_id, ls_capecode, sRoom, dtTimerStart) then
		ass.assignment_id = string(today(),"yymmddhhmmss")+string(rand(99))
	   ass.assignment_cd = 'N'
 	   ass.dept_assigned = ls_dept
	   ass.emp_id = '8888888888'
	   ass.emp_name = 'NONE'
      ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	   SetNull(ass.time_completed)
	   ass.call_number = sCallNumber 
	   ass.page_sent = 'N'
		ass.special_msg = 'Auto assignment call # ' + scallnumber + &
		 ' for dept:'+ls_dept+' has failed to allocate a pager! Caller:'+ sGuest +&
		 ' task:'+trim(sProblem)+'/'+trim(sSubproblem) //+'['+f_dt_to_dt_str(dtTimerStart)+']'
		ass.pager_id = f_find_supervisor_pager(ls_dept,sZone,dtTimerStart)
		/*
	    SELECT "deptmgr"."mgr_pager_id"  
         INTO :ass.pager_id  
         FROM "deptmgr"  
       WHERE "deptmgr"."dept" = :ls_dept   ;
		*/ 
   	 spaging = '0'
    ELSE
		ass.assignment_id = string(today(),"yymmddhhmmss")+string(rand(99))
		ass.assignment_cd = 'T'
		ass.dept_assigned = ls_dept
		ass.emp_id = ls_employee_num
		ass.emp_name = ls_employee_name
		ass.pager_id = ls_pager_id
		ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
		SetNull(ass.time_completed)
		ass.call_number = sCallNumber 
		ass.page_sent = 'N'
	END IF
	if f_insert_assignment(ass) then
		commit;
	else
		rollback;
		return -1
	end if
	sClosedBydept = ls_dept
	srepairman = ls_employee_name  
	spaging   = '0'
ELSE
	auto_assign_ind = ''
   spaging = ''
END IF
return 1
end function

public function boolean wf_save_call ();/* openMode = 0    window is opened via menu(could be entering a timer or pending call)
				  1	 window is opened by Pendingcall screen for modifying a timer call
				  2	 window is opened by Pendingcall screen for modifying a pending call 
				  3    window is opened by another screen for copying a timer call
				  4    window is opened by another screen for copying a pending call
				  5    window is opened by another screen for modifying a closed call
				  6	 window is opened by Timercall screen for modifying a timer call
				  A    window is opened by another screen for viewing a timer call
				  B    window is opened by another screen for viewing a pending call
				  C    window is opened by another screen for viewing a closed call
*/
int iCallTable, iFindPagerRes
string sCallTable, sEmpId, sPagerId, sPagerCd 
double dCallNumber
boolean bInsertCall


CHOOSE CASE openMode
	CASE '1'
		sCallNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
		wf_delete_pageassignment(sCallNumber)
		if integer(sStatCode) < 10 then
			bInsertCall = false
			iCallTable = 1
			sCallTable = 'TIMERCALLS'
		else
			// delete from timercalls because stats is changed to pending
			if not f_delete_call(sCallNumber, 1, false) then 
				return false
			end if
			iCallTable = 2
			bInsertCall = true
		end if
				
   CASE '2'
		sCallNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
		if integer(sStatCode) > 9 then
			bInsertCall = false
			iCallTable = 2
			sCallTable = 'PENDINGCALLS'
		else
			if not f_delete_call(sCallNumber, 2,false) then 
				return false
			end if
			iCallTable = 1
			bInsertCall = true
		end if
	CASE '5'
		sCallNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
		iCallTable = 3
		sCallTable = 'CLOSEDCALLS'
	CASE '6'
		sCallNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
		if integer(sStatCode) < 10 then
			bInsertCall = false
			iCallTable = 1
			sCallTable = 'TIMERCALLS'
		else
			// delete from timercalls because stats is changed to pending
			if not f_delete_call(sCallNumber, 1, false) then 
				return false
			end if
			iCallTable = 2
			bInsertCall = true
		end if
		
	CASE 'A'		
	CASE 'B'
	CASE 'C'
	CASE ELSE   //CASE '0' , '3', '4' will fall into there
		bInsertCall = true
		dCallNumber = wf_call_number()
		if dCallNumber > 0 then
			sCallNumber = string(dCallNumber)
		else
			return false
		end if
		sOpenedStatus = sStatCode
		if integer(sStatCode) < 10 then
			iCallTable = 1
			sCallTable = 'TIMERCALLS'
		else
			iCallTable = 2 
			sCallTable = 'PENDINGCALLS'
		end if	
		if openMode = '3' or openMode = '4' then
			dw_1.SetItem(dw_1.GetRow(),"call_number",sCallNumber)
		end if

END CHOOSE
	

if sStatCode = '00' then
	sPreOpened = 'Y'
	sPaging = 'P'
end if

if sStatCode < '10' then  // only status less 10 to check auto assignement and assign pager
	if sClosedByDept <> "" and sRepairman <> "" then
	//	MessageBox("msg","not an auto-assigned call")
		iFindPagerRes = f_get_pager(sClosedByDept,sRepairman,sEmpId, sPagerId)
		if iFindPagerRes = 0 then
			s_pageassignment ass
			ass.assignment_id = string(today(),"yymmddhhmmss")+string(rand(99))
			ass.assignment_cd = 'T'
			ass.dept_assigned = sClosedByDept
			ass.emp_id = sEmpId
			ass.emp_name = sRepairman
			ass.pager_id = sPagerId
			ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
			SetNull(ass.time_completed)
			ass.call_number = sCallNumber 
			ass.page_sent = 'N'
			if f_insert_assignment(ass) then 
				commit;
			else
				return false
			end if
			spaging   = '0'
		else
			if iFindPagerRes = 1 then
				MessageBox("Warning","The repairman's pager is in-active!")
			end if
		end if
	else
		wf_check_auto_assign()
	end if
end if

//------------------------------------------------------------
id_account = uo_1.event ue_save_guest(bInsertCall, sProblemNumber, sSubproblemNumber  ) 
If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: wf_save_call', 'account:'+ string( id_account  )) 

if id_account < 0 then // VZ
	MessageBox('FOI Interface Error', 'Return Code:' + string(id_account )+', save call aborted!') 
	return false
End IF 
//------------------------------------------------------------


if bInsertCall then
   if not wf_insert_call(iCallTable) then
		return false
	end if
else
	if not wf_update_call(iCallTable) then	
		return false
	end if
end if

if openMode = '0' then
	SetMicroHelp("Call Record: " + sCallNumber + " Inserted Into " + &
				+ sCallTable + " Successfully. ")
elseif openMode = '1' or (openMode = '2' or (openMode = '5' or openMode = '6')) then
	SetMicroHelp("Call Record: " + sCallNumber + " Updated in " + &
				+ sCallTable + " Successfully. ")
elseif openMode = '3' or openMode = '4' then
	SetMicroHelp("Call Record: " + sCallNumber + " Copied in " + &
				+ sCallTable + " Successfully. ")
end if

return true
end function

public function double wf_call_number_old ();double dNewCallNumber
string sNewCallNumber
string ls_error, ls_code

// get last call number
SELECT "sys_settings"."last_callnum"
    INTO :sNewCallNumber
    FROM "sys_settings"
	 WHERE "sys_settings"."phony_key" = '1';

If sqlca.SQLCode < 0 Then       // Database ERROR...lost connection...who knows?
	Beep(1)
	egm_sqlerror( SQLCA )
END IF

dNewCallNumber = double(sNewCallNumber) + 1
sNewCallNumber = string(dNewCallNumber)

// record record with new call number
	UPDATE "sys_settings"
      SET "sys_settings"."last_callnum" = :sNewCallNumber
    WHERE "sys_settings"."phony_key"    = '1';

If sqlca.SQLCode < 0 Then       // Database ERROR...lost connection...who knows?
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	Beep(1)
//	egm_sqlerror( SQLCA )
	MessageBox('Database Error', 'Failed to create new call number. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return -1
END IF

return dNewCallNumber
end function

public subroutine wf_delete_pageassignment (string callNumber);DELETE FROM DBA.pageassignment  
   WHERE DBA.pageassignment.call_number = :callNumber   ;

string ls_error, ls_code
If sqlca.SQLCode <> 0 Then        
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Delete Error', 'Failed to delete record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
END IF
end subroutine

public function string wf_mod_datetime_mask (string coln);string modStr,modRes

modStr = colN+".edit.format=~""+cDateTimeFormatStr+"~""

modRes=dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw Modify Error","dw:"+dw_1.dataobject+" column:"+coln)
end if

modRes=dw_2.Modify(modStr)
if modRes <> "" then
	MessageBox("dw Modify Error","dw:"+dw_2.dataobject+" column:"+coln)
end if


modStr = colN+".editmask.mask=~""+cDateTimeFormatStr+"~""
modRes=dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw Modify Error","dw:"+dw_1.dataobject+" column:"+coln)
end if

modRes=dw_2.Modify(modStr)
if modRes <> "" then
	MessageBox("dw Modify Error","dw:"+dw_2.dataobject+" column:"+coln)
end if

return modRes
end function

public function double wf_insert_recurring (s_timer_recur itimerrecur, string iroom, string icategory, string icaller, string itaskno, string isubtaskno, string itaskdef);double recur_id
date start_date, end_date
datetime updDT
time start_time
//if iTimerRecur.daily_start_time = '' then
//	SetNull(iTimerRecur.daily_start_time)
//	SetNull(iTimerRecur.daily_end_time)
//end if
start_date = f_str_d_to_d(iTimerRecur.recur_start_date)
end_date = f_str_d_to_d(iTimerRecur.recur_end_date)
start_time = time(iTimerRecur.recur_start_time)
insert into recurring
(	start_date,
	end_date,
	start_time,
	freq_code,
	freq_num,
	recur_by,
	room,
	category,
	caller,
	task_no,
	subtask_no,
	task_definition,
	daily_start_time,
	daily_end_time,
	week_day_selected,
	lst_upd
	)
values
(	:start_date,
	:end_date,
	:start_time,
	:iTimerRecur.recur_freq_code,
	:iTimerRecur.recur_freq_num,
	:iTimerRecur.recur_by,
	:iRoom,
	:iCategory,
	:iCaller,
	:iTaskNo,
	:iSubtaskNo,
	:iTaskDef,
	:iTimerRecur.daily_start_time,
	:iTimerRecur.daily_end_time,
	:iTimerRecur.week_day_selected,
	getdate()
	);
	
if sqlca.sqlcode < 0 then
	MessageBox("DB Failed","insert recurring fails!!")
	rollback;
	return 0
end if

select recur_id into :recur_id from recurring where recur_id=@@identity;


return recur_id
	
	
	
end function

public function string wf_pop_guest_call_hist (string room_no, string guest_nm, date cutoff_dt);string hist_info, hist_info_all, header
string callTime, callStatus, callTask,callSubtask
boolean firstLine
firstLine = true
hist_info=''
hist_info_all=''
header= 'CALL TIME~tSTATUS~tTASK/SUBTASK~n'+&
		'---------------------~t---------~t'+&
		'----------------------------------------'

DECLARE hist CURSOR FOR
select convert(char(18),call_indate,111)+' '+ convert(char(5),call_indate,114),
		 stat_desc,
		 problem,
		 subproblem 
from 	closedcalls a, callstat b 
where caller_category='GST' and call_indate>:cutoff_dt
and 	problem <> 'Call Back'
and	room=:room_no  and guest=:guest_nm
and	a.stat_code = b.stat_code
union
select convert(char(18),call_indate,111)+' '+ convert(char(5),call_indate,114),
		 stat_desc,
		 problem,
		 subproblem 
from 	timercalls a, callstat b 
where caller_category='GST' and call_indate>:cutoff_dt
and 	problem <> 'Call Back'
and	room=:room_no  and guest=:guest_nm
and	a.stat_code = b.stat_code
union
select convert(char(18),call_indate,111)+' '+ convert(char(5),call_indate,114),
		 stat_desc,
		 problem,
		 subproblem 
from 	pendingcalls a, callstat b 
where caller_category='GST' and call_indate>:cutoff_dt
and 	problem <> 'Call Back'
and	room=:room_no  and guest=:guest_nm
and	a.stat_code = b.stat_code
order by 1;
if		sqlca.sqlcode < 0 then
		egm_sqlerror(sqlca)
		return ''
end if

OPEN hist;
if		sqlca.sqlcode < 0 then
		egm_sqlerror(sqlca)
		return ''
end if

FETCH hist into :callTime,:callStatus,:callTask,:callSubtask;

DO WHILE sqlca.sqlcode = 0 
	if callStatus <> 'Open' and callStatus <> 'Pre-Open' and callStatus <> 'Closed' then
		callStatus = 'Open'
	end if
	if firstLine then
		hist_info_all = header
		firstLine = false
	end if
	hist_info_all = hist_info_all + '~n'+callTime+'~t'+callStatus+&
		'~t'+callTask+'/'+callSubtask
	FETCH hist into :callTime,:callStatus,:callTask,:callSubtask;
LOOP
if		sqlca.sqlcode < 0 then
		egm_sqlerror(sqlca)
		return ''
end if

CLOSE hist;
if		sqlca.sqlcode < 0 then
		egm_sqlerror(sqlca)
		return ''
end if

return hist_info_all
end function

public subroutine wf_process_guest_call_hist ();if not showGuestCallHist then
	return
end if
string histMsg
date cutoffDt
cutoffDt = RelativeDate(today(),-guestHistCutOffDays)
histMsg=wf_pop_guest_call_hist(sRoom,sGuest,cutoffDt)
if histMsg <> '' then
	MessageBox('Guest Call History',histMsg)
end if

end subroutine

on w_call_upd.create
this.pb_4=create pb_4
this.p_2=create p_2
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_docs=create pb_docs
this.pb_3=create pb_3
this.dw_2=create dw_2
this.st_bannerleftchar=create st_bannerleftchar
this.st_bannerrightchar=create st_bannerrightchar
this.st_3=create st_3
this.st_2=create st_2
this.st_mode=create st_mode
this.st_banner=create st_banner
this.p_1=create p_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.cb_copy=create cb_copy
this.cb_modify=create cb_modify
this.cb_closecall=create cb_closecall
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_reset=create cb_reset
this.cb_close=create cb_close
this.cb_add=create cb_add
this.uo_1=create uo_1
this.cb_retrieve=create cb_retrieve
this.Control[]={this.pb_4,&
this.p_2,&
this.pb_9,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_docs,&
this.pb_3,&
this.dw_2,&
this.st_bannerleftchar,&
this.st_bannerrightchar,&
this.st_3,&
this.st_2,&
this.st_mode,&
this.st_banner,&
this.p_1,&
this.pb_2,&
this.pb_1,&
this.dw_1,&
this.cb_copy,&
this.cb_modify,&
this.cb_closecall,&
this.cb_delete,&
this.cb_save,&
this.cb_reset,&
this.cb_close,&
this.cb_add,&
this.uo_1,&
this.cb_retrieve}
end on

on w_call_upd.destroy
destroy(this.pb_4)
destroy(this.p_2)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_docs)
destroy(this.pb_3)
destroy(this.dw_2)
destroy(this.st_bannerleftchar)
destroy(this.st_bannerrightchar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_mode)
destroy(this.st_banner)
destroy(this.p_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.cb_copy)
destroy(this.cb_modify)
destroy(this.cb_closecall)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_reset)
destroy(this.cb_close)
destroy(this.cb_add)
destroy(this.uo_1)
destroy(this.cb_retrieve)
end on

event open;string cTempReadVar 

// SFM 10/26/97 Determine db type and switch dataobjects if need be

IF cappdbtype = 'MSSQL' THEN
	dw_1.dataobject = 'd_timercalls_upd_mssql'
END IF



windowIsAlreadyOpen = false
p_1.Visible = false
st_banner.Text = cRegSite
SetMicroHelp( "Opening Call Data Entry screen...please wait." )

// in WingDings font a 'P' is a Pointed Pennant
st_BannerRightChar.Text = ProfileString( cINIPath +&
							cINIFile, "CallDataEntry", &
							"BannerRightChar", "P" )
st_BannerLeftChar.Text = ProfileString( cINIPath +&
							cINIFile, "CallDataEntry", &
							"BannerLeftChar", "P" )
cTempReadVar = ProfileString( cINIPath +&
							cINIFile, "CallDataEntry", &
							"EnterKeyScrollsRecords", "No" )
allowDup =  ProfileString( cINIPath +&
							cINIFile, "CallDataEntry", &
							"allowdupcall", "N" )

//if Upper(ProfileString( cINIPath + cINIFile, "CallDataEntry",&
//							"ShowGuestCallHistSw", "No" )) = 'YES' then
if Upper(ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "ShowGuestCallHistSw", 'NO' )) = 'YES' then
	showGuestCallHist = true
else
	showGuestCallHist = false
end if

//guestHistCutOffDays = integer(ProfileString( cINIPath + cINIFile, "CallDataEntry", &
//						"GuestCallHistCutOffDays", '7' ))
guestHistCutOffDays = integer(ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "GuestCallHistCutOffDays", '7' ))


openMode = mid(Message.StringParm,1,1)
/* openMode = 0    window is opened via menu(could be entering a timer or pending call)
				  1	 window is opened by Pendingcall screen for modifying a timer call
				  2	 window is opened by Pendingcall screen for modifying a pending call 
				  3    window is opened by another screen for copying a timer call
				  4    window is opened by another screen for copying a pending call
				  5    window is opened by another screen for modifying a closed call
				  6	 window is opened by Timercall screen for modifying a timer call
				  A    window is opened by another screen for viewing a timer call
				  B    window is opened by another screen for viewing a pending call
				  C    window is opened by another screen for viewing a closed call
*/
//MessageBox("openmode","openMode is " + openMode)

// default call is timercalls
callType = "timercalls"

CHOOSE CASE openMode
	CASE '0'
		wf_load_shift_data() 
	CASE '2'
		callType = "pendingcalls"
//		dw_1.DataObject = "d_pendingcalls_upd"
	CASE '3'
		wf_load_shift_data() 
	CASE '4'
		callType = "pendingcalls"
//		dw_1.DataObject = "d_pendingcalls_upd"
		wf_load_shift_data() 
	CASE 'B'
		callType = "pendingcalls"
//		dw_1.DataObject = "d_pendingcalls_upd"
	CASE 'C'
		callType = "closedcalls"
//		dw_1.DataObject = "d_closedcalls_upd"
	CASE '5'
		callType = "closedcalls"
//		dw_1.DataObject = "d_closedcalls_upd"	
// CASE 0 is Default to "d_timercalls_upd"
// CASE 1 is Default to "d_timercalls_upd"
// CASE 3 is Default to "d_timercalls_upd"
// CASE 6 is Default to "d_timercalls_upd"
// CASE A is Default to "d_timercalls_upd"
END CHOOSE

dw_1.SetTransObject(sqlca)
tableSelectStr = dw_1.Describe("DataWindow.Table.Select")

f_mod_dw_dt_disp(dw_1,"call_indate")
f_mod_dw_dt_disp(dw_1,"timer_start") 
wf_mod_datetime_mask("timer_start") 
f_mod_dw_dt_disp(dw_1,"call_outdate")

f_mod_dw_dt_disp(dw_2,"call_indate")
f_mod_dw_dt_disp(dw_2,"timer_start") 
f_mod_dw_dt_disp(dw_2,"call_outdate")


// if intended opencall(pending,closed or timer) type is not equal to default(timer)
// modify DW "table.select"
if callType <> "timercalls" then
	if not wf_modify_data_source("timercalls",callType) then
		return
	end if
end if

if dw_1.GetChild("room",dwc_room) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_room Error")
else
	dwc_room.SetTransObject(SQLCA)
end if

if dw_1.GetChild("room_dsc",dwc_room_dsc) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_room_dsc Error")
else
	dwc_room_dsc.SetTransObject(SQLCA)
	dwc_room_dsc.SetSort("area_name A, area_number A")
	dwc_room_dsc.Sort() 
end if

if dw_1.GetChild("guest",dwc_guest) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_guest Error")
else
	dwc_guest.SetTransObject(SQLCA)
end if

if dw_1.GetChild("subproblem",dwc_subproblem) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_subproblem Error")
else
	dwc_subproblem.SetTransObject(SQLCA)
end if

if dw_1.GetChild("repairman",dwc_repairman) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_repairman Error")
else
	dwc_repairman.SetTransObject(SQLCA)
end if

//CallNumber is after 3rd digit of Message.StringParm)

colToSet = 0

if openMode = '0' then  // new call entry
	cb_add.TriggerEvent("clicked")
elseif openMode = 'A' or (openMode = 'B' or openMode = 'C') then // view only
	st_mode.text = 'View'
	sCallNumber = mid(Message.StringParm,4)
	dw_1.Retrieve(sCallNumber)
	wf_set_buttons(4)
	wf_set_tab_order(3)
elseif openMode = '3' or openMode = '4' then   // copy a call
	sCallNumber = mid(Message.StringParm,4)
	if dw_1.Retrieve(sCallNumber) = 0 then
		MessageBox("Failed","Failed to retrieve call # " + sCallNumber)
		return
	end if
	wf_initialize_call_variables(1)
	copyCallNumber = sCallNumber
	cb_copy.TriggerEvent("clicked")
	cb_copy.enabled = false
else  // modify a call	'1' or '2' or '6'
	sCallNumber = mid(Message.StringParm,4)
	dw_1.Retrieve(sCallNumber)
	wf_initialize_call_variables(1)
	cb_modify.TriggerEvent("clicked")
	colToSet = Integer(Mid(Message.StringParm,2,2))
	postEvent("ue_setcol")
end if
//MessageBox("validation",dw_1.GetValidate ( "subproblem"))
if openMode <> '0' then
	windowIsAlreadyOpen = true
end if
Timer(.055, This )
SetMicroHelp( "{Responder} Ready" )
end event

event timer;// In case we ever get stuck we won't stack-up the Timer Calls
Timer( 0, w_call_upd )   

//dw_1.Retrieve()
st_2.Text = " " + String( Now(), "dddd") + " "
st_3.Text = " " + String( Now(), cReportLongDateFormatStr2) + " "

Timer( 120, w_call_upd ) // Now we'll reset

end event

event close;integer Net
if errExit then
	close(this)
	return
end if
if dw_1.ModifiedCount() <> 0 then
	if exitByExitButton then
		exitByExitButton = false
		Net = MessageBox("Warning","Do you want to save the changes", question!, YesNoCancel!, 1)
		CHOOSE CASE Net
		CASE 1
			cb_save.TriggerEvent("clicked")
			dw_1.ResetUpdate() //do save changes
		CASE 2
			dw_1.ResetUpdate() //discard changes
		CASE ELSE
			return				 //cancel action
		END CHOOSE
	else
		Net = MessageBox("Warning","Do you want to save the changes", question!, YesNo!, 1)
		CHOOSE CASE Net
		CASE 1
			cb_save.TriggerEvent("clicked")
			dw_1.ResetUpdate() //do save changes
		CASE 2
			dw_1.ResetUpdate() //discard changes
		END CHOOSE
	end if
end if

close(this)

end event

event deactivate;w_main.postevent("ue_menu_set")
end event

event activate;if this.WindowState = Minimized! then
	this.WindowState = Normal!
end if
w_main.triggerevent("ue_menu_set")
end event

type pb_4 from picturebutton within w_call_upd
integer x = 891
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 110
boolean bringtotop = true
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

event clicked;if dw_1.ModifiedCount() = 0 then
	MessageBox("No Change","No change detected in this call. Make change and try again !")
	return
end if
if (dw_1.getitemstring(1,'call_number') <> &
   dw_1.getitemstring(1,'call_number',primary!,true)) and &
	not isnull(dw_1.getitemstring(1,'call_number',primary!,true)) THEN
	MessageBox("Error","Call Numbers can not be changed!")
	return
end if

if sRoom = "" then
	MessageBox("Required","Room is required. Try again !")
	return
end if

if sCallerCategory = "" then
	MessageBox("Required","Caller Category is required. Try again !")
	return	
end if

if sGuest = "" then
	MessageBox("Required","Guest/Caller is required. Try again !")
	return
end if

if sProblem = "" then
	MessageBox("Required","Task is required. Try again !")
	return
end if

if sSubProblem = "" then
	MessageBox("Required","Sub-task is required. Try again !")
	return
end if

if sClosedByDept <> "" and sRepairman <> "" then
	if sStatCode = '00' then
		sPreOpened = 'Y'
		sPaging = 'P'
//		wf_find_subproblem_number() // can use this function to check auto-assign indicator
//		messagebox("auto assigned",auto_assign_ind)
		if wf_check_auto_assign() = 0 then /* is an auto-assign call */
			integer res
			res = MessageBox("Auto Assignment", "This is an auto assignment task! Do you want to clear the "  + & 
				"assigned employee? ", Question!, YesNo!, 1)
			IF res = 1 THEN /* process yes */
 		//		dw_1.SetItem(1,'closed_bydept','') // do not clear the dept so pending fitlering can still pick up the call
				dw_1.setItem(1,'repairman','')
		//		sClosedByDept = ""
				sRepairman = ""
			END IF
		end if
	end if
end if



//If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
	if not wf_save_call() then
		return 
	end if
	copiedCall = false          //reset copy call switch
	timerStartModified = false  //reset "timer_start" manual modified switch
	dw_1.ResetUpdate()
	if openMode = '0' then
//		colToSet = 4
		cb_add.TriggerEvent("clicked")
	elseif openMode = '1' or (openMode = '2' or (openMode = '5' or openMode = '6')) then
		if windowIsAlreadyOpen then
			cb_add.TriggerEvent("clicked")
			CHOOSE CASE openMode
				CASE '1'
					if IsValid( w_pending_calls ) then
						open(w_pending_calls)
					end if
				CASE '2'
					if IsValid( w_pending_calls ) then
						open(w_pending_calls)
					end if
				CASE '5'
					if IsValid( w_closed_calls ) then
						open(w_closed_calls)
					end if
				CASE '6'
					if IsValid( w_timer_calls ) then
						open(w_timer_calls)
					end if
			END CHOOSE
			openMode = '0' // reset it after save
		else
		//	cb_close.TriggerEvent("clicked")
		end if
	else
		cb_copy.enabled = true
		
	end if
//end i
end event

type p_2 from picture within w_call_upd
integer x = 5
integer y = 24
integer width = 549
integer height = 156
string picturename = "Brand Logo.jpg"
boolean focusrectangle = false
end type

type pb_9 from picturebutton within w_call_upd
integer x = 2267
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Se&ttings"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if
OpenWithParm (w_screen_settings, "callentry",parent)
if Message.StringParm <> '' then
	string showHist, dayLimit, deptDef, roomDup, dupExcept
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'!') - 1
	showHist = Mid(Message.StringParm,1,endPos) 
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'!',startPos) - 1
	dayLimit = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'!',startPos) - 1
	deptDef = Mid(Message.StringParm, startPos,endPos - startPos +1)
		
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'!',startPos) - 1
	roomDup = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	dupExcept = Mid(Message.StringParm, startPos)	
	
	if Upper(showHist) = 'YES' then
		showGuestCallHist = true
	else
		showGuestCallHist = false
	end if

	guestHistCutOffDays = integer(dayLimit)
	
	if gnv_appman.cDupCallException <> dupExcept then
		gnv_appman.cDupCallException = dupExcept
	end if
	
	if gnv_appman.cRoomAllowDup <> roomDup then
		gnv_appman.cRoomAllowDup = roomDup
	end if

//	if statCode <> ls_StatusFilter then
//		ls_StatusFilter = statCode
//		wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter)
//	end if
//	
//	if deptSelectionStr <> deptCode then
//		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
//		deptSelectionStr = deptCode
//		wf_mod_selections(deptSelectionStr)
//		dw_1.Retrieve()
//	end if

end if
end event

type pb_8 from picturebutton within w_call_upd
integer x = 2725
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 100
boolean bringtotop = true
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

event clicked;//close(parent)
exitByExitButton = true
parent.TriggerEvent("close")
end event

type pb_7 from picturebutton within w_call_upd
integer x = 1952
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 110
boolean bringtotop = true
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

event clicked;integer Net
Net = MessageBox("Delete Warning","Are you sure ?", question!, YesNoCancel!, 3)
CHOOSE CASE Net
	CASE 3
		return
	CASE 2 
		//cb_close.TriggerEvent("clicked")
	CASE 1
		If Is_PasswordOK( Get_Event_Security( "CD" ) ) Then
			f_delete_call(sCallNumber, Integer(openMode), true)
//			cb_close.TriggerEvent("clicked")
			cb_add.triggerevent(clicked!)
		end if
END CHOOSE
end event

type pb_6 from picturebutton within w_call_upd
integer x = 1637
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 130
boolean bringtotop = true
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

event clicked;dw_1.ResetUpdate()
copiedCall = false
timerStartModified = false
dw_1.Reset()
if openMode <> '0' then
	if openMode = '3' or openMode = '4' then
		dw_1.Retrieve(copyCallNumber)
		cb_copy.TriggerEvent("clicked")
		cb_copy.enabled = false
	else
		if dw_1.Retrieve(sCallNumber) = 0 then
			cb_add.TriggerEvent("clicked")
		end if
	end if
else
	cb_add.TriggerEvent("clicked")
end if

end event

type pb_5 from picturebutton within w_call_upd
integer x = 1207
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Co&py"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;st_mode.text = 'Copy'
wf_set_buttons(3) 	// set to copy mode
wf_set_tab_order(1)

sCallNumber = ""
dw_1.SetItem(dw_1.GetRow(),"call_number","")
dtCallIndate = datetime(today(), now()) //set call in datetime to now
if dw_1.SetItem(dw_1.GetRow(),"call_indate", dtCallIndate) < 0 then
	MessageBox("SetItem Error","SetItem error for call opened datetime")
end if
sReceiver = cpassusername
datetime dtTimer
//dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin)
dtTimer = f_calc_timer_start (dtCallIndate, dTimer1StartMin)
dw_1.SetItem(dw_1.GetRow(),"timer_start", dtTimer)
dtTimerStart = dtTimer
dw_1.SetItem(dw_1.GetRow(),"receiver",cpassusername)
sShift = string(wf_shift_number ( DayNumber( Date(dtCallIndate) ), dtCallIndate ))

dw_1.ResetUpdate()
timerStartModified = false //reset timer start datetime mod sw
dw_1.SetFocus()
wf_set_tab_order(2)


end event

type pb_docs from picturebutton within w_call_upd
integer x = 2953
integer y = 1192
integer width = 119
integer height = 104
integer taborder = 110
boolean bringtotop = true
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "DOCs"
string picturename = "Custom001!"
vtextalign vtextalign = vcenter!
end type

event clicked;string ls_call_number

if dw_1.RowCount() <= 0 then return 

ls_call_number = f_nvl(dw_1.GetITemString( 1, 'call_number'),'')
if ls_call_number = '' then
	return 
ELSE
	OpenWithParm (w_call_linked_docs, ls_call_number )
END IF
end event

type pb_3 from picturebutton within w_call_upd
integer x = 581
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Close"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;string chkRepairman
string callNumber, statCode, targetTable
callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
statCode = dw_1.GetItemString(dw_1.GetRow(),"stat_code")
if integer(statCode) < 10 then
  	targetTable = '1'
else
	targetTable = '2'
end if

if dw_1.GetItemString(dw_1.GetRow(),'repairman') = '' or &
	dw_1.GetItemString(dw_1.GetRow(),'closed_bydept') = '' or & 
	IsNull(dw_1.GetItemString(dw_1.GetRow(),'repairman')) or &
	IsNull(dw_1.GetItemString(dw_1.GetRow(),'closed_bydept')) then // check for unassigned call
	beep(2)
	MessageBox("Error","Can't close an unassigned call! Either department or repairman contains blank value!!")
	return
else
	if targetTable = '1' then
		  SELECT timercalls.repairman  
    		INTO :chkRepairman  
    		FROM timercalls  
   		WHERE timercalls.call_number = :callNumber   ;
	else
		  SELECT pendingcalls.repairman  
    		INTO :chkRepairman  
    		FROM pendingcalls  
   		WHERE pendingcalls.call_number = :callNumber   ;
	end if
	If sqlca.sqlcode < 0 then
		MessageBox("DB Error","Check unassigned call error:"+sqlca.sqlerrtext)
		return
	end if
	if trim(chkRepairman) = '' then
		beep(2)
		MessageBox("Error","Can't close an unsaved call!")
		return
	end if
end if
If Is_PasswordOK( Get_Event_Security( "CC" ) ) Then	
	if dw_1.ModifiedCount() > 0 then //if change is made, save call before close m.n.
//		MessageBox("Change is made","Save the change. def:"+sProblemDefinition+" res:"+sResolution)
		wf_update_call(integer(targetTable))
	end if
	if f_close_a_call(callNumber,targetTable) then
		uo_1.event ue_sendreturn ( '', callNumber, '' ) 		// FOI VZ
//		MessageBox("Close","Call#:"+callNumber+" is closed!")
		cb_add.TriggerEvent("Clicked")
	end if
end if

end event

type dw_2 from datawindow within w_call_upd
boolean visible = false
integer x = 23
integer y = 1388
integer width = 384
integer height = 360
integer taborder = 90
string dataobject = "d_timercalls_upd_rpt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_bannerleftchar from statictext within w_call_upd
string tag = "(this character is modifiable in this applications INI file.)"
boolean visible = false
integer x = 567
integer y = 20
integer width = 169
integer height = 140
integer textsize = -26
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
string facename = "Wingdings"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
string text = "P"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_bannerrightchar from statictext within w_call_upd
string tag = "(this character is modifiable in this applications INI file.)"
boolean visible = false
integer x = 2391
integer y = 20
integer width = 169
integer height = 140
integer textsize = -26
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
string facename = "Wingdings"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
string text = "P"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_call_upd
string tag = "Current Month, Day and Time as set on this computer."
boolean visible = false
integer x = 14
integer y = 92
integer width = 494
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_call_upd
string tag = "Current Day of the week as set on this computer."
boolean visible = false
integer x = 14
integer y = 36
integer width = 489
integer height = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_mode from statictext within w_call_upd
string tag = "Current window Mode. e.g., New, Modify, View or Close allows edit of different fields and different fules."
integer x = 2688
integer y = 80
integer width = 439
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 134217728
boolean enabled = false
string text = "Set-Up"
alignment alignment = center!
long bordercolor = 65535
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_banner from statictext within w_call_upd
string tag = "The registered site for this installation of the system."
boolean visible = false
integer x = 549
integer y = 12
integer width = 2039
integer height = 168
integer textsize = -20
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean italic = true
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
alignment alignment = center!
boolean border = true
long bordercolor = 65535
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type p_1 from picture within w_call_upd
integer x = 1591
integer y = 724
integer width = 82
integer height = 68
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;if st_mode.text = 'View' then
	return
end if
//* pop up timer datetime entry screen
w_call_timer_date_new dt_win
datetime ldt_timerdate, ldt_new_timerdate
string ls_orig_datetime, ls_new_datetime, recur_ind

ldt_timerdate = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
ls_orig_datetime = f_dt_to_dt_str(ldt_timerdate)
recur_ind = dw_1.GetItemString(dw_1.GetRow(),"recur_ind")

if isnull(recur_ind) then
	recur_ind = 'N'
end if

sTimerRecur.timer_dt_str 	= ls_orig_datetime
sTimerRecur.recur_ind 		= recur_ind
sTimerRecur.open_mode 		= openMode
openwithparm(dt_win,sTimerRecur)

if IsValid(Message.PowerObjectParm) then
	sTimerRecur = Message.PowerObjectParm
end if

ls_new_datetime = sTimerRecur.timer_dt_str
dw_1.SetItem(dw_1.GetRow(),"recur_ind",sTimerRecur.recur_ind)
sRecurInd = sTimerRecur.recur_ind
//ls_new_datetime = Message.StringParm

if f_str_dt_to_dt(ls_orig_datetime) <> f_str_dt_to_dt(ls_new_datetime) then
	ldt_new_timerdate = f_str_dt_to_dt(ls_new_datetime)
	dw_1.SetFocus()
	if dw_1.Setcolumn("timer_start") < 0 then
		MessageBox("error","setcolumn TIMER START failed")
	end if
	dw_1.SetItem(dw_1.GetRow(),"timer_start",ldt_new_timerdate)
	dtTimerStart = ldt_new_timerdate
	if sRecurInd = 'N' or (sRecurInd = 'Y' and sStatCode < '10' )then // only force status code to '00' if not a recur call
		dw_1.SetItem(dw_1.GetRow(),"stat_code","00")
		timerStartModified = true
		sStatCode = "00"
	//	dw_1.TriggerEvent("itemchanged")
	end if
	if dw_1.Setcolumn("ROOM") < 0 then
		MessageBox("error","setcolumn ROOM failed")
	end if
end if
end event

type pb_2 from picturebutton within w_call_upd
string tag = "Setting"
boolean visible = false
integer x = 238
integer y = 1348
integer width = 379
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "TOOLBAR1.BMP"
alignment htextalign = left!
string powertiptext = "Setting"
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if
OpenWithParm (w_screen_settings, "callentry",parent)
if Message.StringParm <> '' then
	string showHist, dayLimit, deptDef, roomDup, dupExcept
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'!') - 1
	showHist = Mid(Message.StringParm,1,endPos) 
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'!',startPos) - 1
	dayLimit = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'!',startPos) - 1
	deptDef = Mid(Message.StringParm, startPos,endPos - startPos +1)
		
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'!',startPos) - 1
	roomDup = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	dupExcept = Mid(Message.StringParm, startPos)	
	
	if Upper(showHist) = 'YES' then
		showGuestCallHist = true
	else
		showGuestCallHist = false
	end if

	guestHistCutOffDays = integer(dayLimit)
	
	if gnv_appman.cDupCallException <> dupExcept then
		gnv_appman.cDupCallException = dupExcept
	end if
	
	if gnv_appman.cRoomAllowDup <> roomDup then
		gnv_appman.cRoomAllowDup = roomDup
	end if

//	if statCode <> ls_StatusFilter then
//		ls_StatusFilter = statCode
//		wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter)
//	end if
//	
//	if deptSelectionStr <> deptCode then
//		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
//		deptSelectionStr = deptCode
//		wf_mod_selections(deptSelectionStr)
//		dw_1.Retrieve()
//	end if

end if
end event

type pb_1 from picturebutton within w_call_upd
integer x = 151
integer y = 1488
integer width = 288
integer height = 112
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Retrieve"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;String ls_callnumber, ls_table[3], ls_mode[3]
integer li_cnt
boolean lb_foundcall

if not ib_findcall then return


ls_table[1] = 'timercalls'
ls_table[2] = 'closedcalls'
ls_table[3] = 'pendingcalls'
ls_mode[1]  = '1'
ls_mode[2]  = '5'
ls_mode[3]  = '2'

ls_callnumber= dw_1.object.Call_Number[1]

FOR li_cnt = 1 to 3
	if not wf_modify_data_source(callType,ls_table[li_cnt]) then
		return
	end if
	CALLTYPE = ls_table[li_cnt]
   if dw_1.retrieve(ls_callnumber) > 0 THEN
		lb_foundcall = true
		exit
   end if 	
NEXT

if lb_foundcall THEN
	wf_initialize_call_variables(1)
	if CALLTYPE = 'closedcalls' then
		wf_set_buttons(4)
		st_mode.text = 'View'
	else
		wf_set_buttons(2)
		st_mode.text = 'Modify'
	end if
   wf_set_tab_order(1)
	openmode = ls_mode[li_cnt]
	//------------------------------------------------------------
	uo_1.event ue_retrieve_guest( id_account )	/// vz
	//------------------------------------------------------------	
else
	messagebox('Responder','Call number not found!')
	cb_add.triggerevent(clicked!)
	openmode = '0'
END IF
ib_findcall = false
end event

type dw_1 from datawindow within w_call_upd
event ue_show_dddw ( )
event ue_show_arrow ( )
event ue_keydown pbm_dwnkey
event ue_hide_dddw ( )
event ue_setfocus ( )
event ue_keyenter pbm_dwnprocessenter
integer y = 192
integer width = 3150
integer height = 1276
integer taborder = 50
string dataobject = "d_timercalls_upd"
borderstyle borderstyle = styleraised!
end type

event ue_show_dddw;string ls_cur_col
ls_cur_col = this.GetColumnName()
if not wf_show_dddw(dw_1,ls_cur_col,1) then
	MessageBox("Error","dw Modify error for dddw: " + ls_cur_col)
end if
end event

event ue_show_arrow;if this.RowCount() = 0 then
	p_1.Visible = false
	wf_set_buttons(4)
else
	p_1.Visible = true
end if
end event

event ue_keydown;
//if this.GetColumnName() = "room_dsc" then
//	if KeyDown(65) then
//		MessageBox("Key Press","A")
//	end if
//end if

if this.GetColumnName() = "room" then
	if keyDown(KeyTab!) then
		tabPressInRoom = true
//		MessageBox("Key Press","Tab")
	end if
end if


end event

event ue_hide_dddw;string curCol

curCol = this.GetColumnName()

if wf_chk_showlist(curCol) = 'yes' then
	if not wf_show_dddw(dw_1,curCol,0) then
		MessageBox("Error","dw Modify error for dddw: " + curCol)
	end if
end if

if usedMouse then
CHOOSE CASE curCol
	CASE 'subproblem' 
		if this.SetColumn("closed_bydept") < 0 then
			MessageBox("Error","SetColumn error: closed_bydept")
		end if
	CASE 'guest' 
		if this.SetColumn("problem_problem_number") < 0 then
			MessageBox("Error","SetColumn error: problem_problem_number")
		end if
	CASE 'repairman'
		if this.SetColumn("problem_definition") < 0 then
			MessageBox("Error","SetColumn error: problem_definition")
		end if

END CHOOSE
end if


usedMouse = false

end event

event ue_setfocus;dw_1.SetColumn("room")
//return 0

end event

event ue_keyenter;if this.GetColumnName() = "call_number" then
	cb_retrieve.PostEvent("clicked")
end if
end event

event itemchanged;string CurrentColumn, ColumnContent

//ColumnContent = This.GetText()
CurrentColumn = this.GetColumnName()
ColumnContent = data

//MessageBox("Column Contenct",CurrentColumn + ' --> "' + columncontent + '"')

CHOOSE CASE Upper(CurrentColumn) 
	CASE 'CALL_NUMBER'
		ib_findcall = TRUE
		
	CASE	"STAT_CODE"
		if openMode = '5' then
			MessageBox("Stop","You can not change 'STAT_CODE' of a closed call !",stopsign!)
			return 2
		else
			if wf_validate_stat_code(ColumnContent) <> 0 then
				return 2
			end if
		end if
		sStatCode = ColumnContent
	   this.SetColumn("room")
	
	CASE	"TIMER_START"
		timerStartModified = true
		this.SetItem(row,"stat_code","00")
		sStatCode = "00"
	   dtTimerStart = Datetime(date(string(date(mid(data,1,10)),"mm/dd/yy")),&
									   time(string(time(mid(data,11)),"hh:mm:ss")))
			
	CASE	"ROOM"
		if dwc_room.Find("area_number = '" + ColumnContent + "'", 0, dwc_room.RowCount()) = 0 then
			MessageBox("Database Error", "Room Number not found in area table.", &
						StopSign!)
			this.SetItem( row, "room","" )
			return 
		end if
		wf_process_room_change('room')
		sRoom = ColumnContent
		sRoomDsc = this.GetItemString(row,"room_dsc")
		if tabPressInRoom then
		else
			this.SetColumn("caller_category")
		end if
		tabPressInRoom = false
		//---------------------------------------------------------------
		uo_1.post event ue_getroomauto() // FOI Interface request 
		//---------------------------------------------------------------		
		
	CASE	"ROOM_DSC"
		wf_process_room_change('room_dsc')
		sRoomDsc = ColumnContent
		sRoom =  this.GetItemString(row,"room")
		
	CASE	"CALLER_CATEGORY"
		if Pos(Upper(ColumnContent), "GST" ) = 0 and &
			Pos(Upper(ColumnContent), "OUTSIDER") = 0 then // not "GST" or "HLT/GST"
			this.SetItem(this.GetRow(),"guest","")
		end if
		sGuest = ""
		this.SetItem(row,"GUEST","")

		if usedMouse then
			this.SetColumn("guest")
			if Pos(Upper(ColumnContent), "GST" ) = 0 and &
				Pos(Upper(ColumnContent), "OUTSIDER") = 0 then
				this.PostEvent("ue_show_dddw")
			end if
		end if
		sCallerCategory = ColumnContent
		
	CASE	"GUEST"
		this.PostEvent("ue_hide_dddw")
		sGuest = ColumnContent
		if sCallerCategory = 'GST' then
			wf_process_guest_call_hist()
			this.SetFocus() // make sure dw_1 gets focus
		end if
		
	CASE	"PROBLEM_PROBLEM_NUMBER"
		sProblemNumber = ColumnContent
		sSubProblemNumber = ""
		sSubProblem = ""
		this.SetItem(row,"SUBPROBLEM","")

		wf_validate_problem(sProblemNumber)
		
//		if sRecurInd = 'Y' then
//			if sDefaultStatus <= '20' or sDefaultStatus >'40' then
//				MessageBox("Error","You must select recurring status codes 20-40!")
//				return 2
//			end if
//		end if		
		if usedMouse then
			this.SetColumn("subproblem")
			this.PostEvent("ue_show_dddw")
		end if

	CASE	"SUBPROBLEM"
		sSubProblemNumber = wf_find_subproblem_number()
		wf_validate_subproblem(sSubProblemNumber)
//		if sRecurInd = 'Y' then
//			if sDefaultStatus <= '20' or sDefaultStatus >'40' then
//				MessageBox("Error","You must select recurring status codes 20-40!")
//				return 2
//			end if
//		end if		
		this.PostEvent("ue_hide_dddw")
		
	CASE	"CLOSED_BYDEPT"
		sRepairman = ""
		this.SetItem(row,"REPAIRMAN","")
		if usedMouse then
			this.SetColumn("repairman")
			this.PostEvent("ue_show_dddw")
		end if
		sClosedBydept = ColumnContent
		
	CASE	"REPAIRMAN"
		this.PostEvent("ue_hide_dddw")
		sRepairman = ColumnContent
		if sClosedBydept = "" then
			string sDept
			sDept = dwc_repairman.GetItemString(dwc_repairman.GetRow(),'dept')
//			MessageBox("dept",sDept)
			sClosedBydept=sDept
			this.SetItem(row,"closed_bydept",sDept)			
		end if
		
	CASE "PROBLEM_DEFINITION"
		sProblemDefinition = ColumnContent
		
	CASE "RESOLUTION"
		sResolution = ColumnContent
		
		
END CHOOSE
end event

event rowfocuschanged;this.PostEvent("ue_show_arrow")
end event

event clicked;CHOOSE CASE dwo.Name
	CASE "caller_category"
		usedMouse = true
	CASE "guest"
		usedMouse = true
	CASE "problem_problem_number"
		usedMouse = true
	CASE "subproblem"
		usedMouse = true
	CASE "closed_bydept"
		usedMouse = true
	CASE "repairman"
		usedMouse = true
	CASE ELSE
		usedMouse = false
END CHOOSE



end event

event itemfocuschanged;string currentColumn, columnContent
currentColumn = Upper(dwo.Name)
CHOOSE CASE CurrentColumn
	CASE "GUEST"
		columnContent = dw_1.GetItemString(dw_1.GetRow(),"CALLER_CATEGORY")
		if IsNull(columnContent) then
			return
		end if
		wf_dddw_set_filter(currentColumn,dw_1.GetItemString(dw_1.GetRow(),"CALLER_CATEGORY"))
		wf_set_dddw_allow_edit(dw_1.GetItemString(dw_1.GetRow(),"CALLER_CATEGORY"), currentColumn)
	CASE "SUBPROBLEM"
		columnContent = dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_PROBLEM_NUMBER")
		if IsNull(columnContent) then
			return
		end if
		wf_dddw_set_filter(currentColumn,dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_PROBLEM_NUMBER"))
		wf_set_dddw_allow_edit(dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_PROBLEM_NUMBER"), currentColumn)		
	CASE "REPAIRMAN"
		columnContent = dw_1.GetItemString(dw_1.GetRow(),"CLOSED_BYDEPT")
		if IsNull(columnContent) then
			return
		end if
		wf_dddw_set_filter(currentColumn,dw_1.GetItemString(dw_1.GetRow(),"CLOSED_BYDEPT"))
		wf_set_dddw_allow_edit(dw_1.GetItemString(dw_1.GetRow(),"CLOSED_BYDEPT"), currentColumn)	
END CHOOSE
	
end event

event losefocus;this.AcceptText()
//w_call_upd.SetMicroHelp("Lost Focus!!!")
end event

event retrieveend;if this.GetRow() = 0 then
	return
end if
if this.getItemString(this.GetRow(),"recur_ind") = 'Y' then 
	double thisRecurId
	datetime start_date, end_date
	thisRecurId = this.getItemNumber(this.GetRow(),"recur_id")
	select	recur_id,
				start_date,
				end_date,
				start_time,
				freq_code,
				freq_num,
				recur_by,
				daily_start_time,
				daily_end_time,
				week_day_selected
	into		:sTimerRecur.recur_id,
				:start_date,
				:end_date,
				:sTimerRecur.recur_start_time, 
				:sTimerRecur.recur_freq_code,
				:sTimerRecur.recur_freq_num,
				:sTimerRecur.recur_by,
				:sTimerRecur.daily_start_time,
				:sTimerRecur.daily_end_time,
				:sTimerRecur.week_day_selected
	from		recurring
	where		recur_id = :thisRecurId;
	if sqlca.sqlcode < 0 then
		MessageBox("DB Error","recurring not found: " + string(thisRecurId))
	end if
	sTimerRecur.recur_start_date=f_dt_to_d_str(start_date)
	sTimerRecur.recur_end_date=f_dt_to_d_str(end_date)
	if openMode = '4' then // copying a recurring call 
		if MessageBox("Warning","This is a recurring call! " + & 
				"Do you want to continue?",Question!,YesNo!,2) = 2 then
			cb_add.TriggerEvent("clicked")
//			w_pending_calls.BringToTop = true
		end if
	end if
	
end if
end event

event getfocus;//w_call_upd.SetMicroHelp("Gets Focus!!!")
end event

type cb_copy from commandbutton within w_call_upd
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Create a new call by copying the current call"
boolean visible = false
integer x = 1458
integer y = 1512
integer width = 261
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&py"
end type

event clicked;st_mode.text = 'Copy'
wf_set_buttons(3) 	// set to copy mode
wf_set_tab_order(1)

sCallNumber = ""
dw_1.SetItem(dw_1.GetRow(),"call_number","")
dtCallIndate = datetime(today(), now()) //set call in datetime to now
if dw_1.SetItem(dw_1.GetRow(),"call_indate", dtCallIndate) < 0 then
	MessageBox("SetItem Error","SetItem error for call opened datetime")
end if
sReceiver = cpassusername
datetime dtTimer
//dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin)
dtTimer = f_calc_timer_start (dtCallIndate, dTimer1StartMin)
dw_1.SetItem(dw_1.GetRow(),"timer_start", dtTimer)
dtTimerStart = dtTimer
dw_1.SetItem(dw_1.GetRow(),"receiver",cpassusername)
sShift = string(wf_shift_number ( DayNumber( Date(dtCallIndate) ), dtCallIndate ))

dw_1.ResetUpdate()
timerStartModified = false //reset timer start datetime mod sw
dw_1.SetFocus()
wf_set_tab_order(2)


end event

event ue_mousemove;If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If
end event

type cb_modify from commandbutton within w_call_upd
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Modify the currently viewed call record."
boolean visible = false
integer x = 393
integer y = 1512
integer width = 206
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Modify"
end type

event clicked;wf_set_buttons(2) // set to update mode
wf_set_tab_order(2)
st_mode.text = 'Modify'
timerStartModified = false
dw_1.SetFocus()
end event

event ue_mousemove;SetMicroHelp( This.Tag )

end event

type cb_closecall from commandbutton within w_call_upd
event mousemove pbm_mousemove
string tag = "Close the current call."
boolean visible = false
integer x = 846
integer y = 1512
integer width = 261
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
end type

event mousemove;SetMicroHelp( This.Tag )
end event

event clicked;string chkRepairman
string callNumber, statCode, targetTable
callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
statCode = dw_1.GetItemString(dw_1.GetRow(),"stat_code")
if integer(statCode) < 10 then
  	targetTable = '1'
else
	targetTable = '2'
end if

if dw_1.GetItemString(dw_1.GetRow(),'repairman') = '' then // check for unassigned call
	beep(2)
	MessageBox("Error","Can't close an unassigned call!")
	return
else
	if targetTable = '1' then
		  SELECT timercalls.repairman  
    		INTO :chkRepairman  
    		FROM timercalls  
   		WHERE timercalls.call_number = :callNumber   ;
	else
		  SELECT pendingcalls.repairman  
    		INTO :chkRepairman  
    		FROM pendingcalls  
   		WHERE pendingcalls.call_number = :callNumber   ;
	end if
	If sqlca.sqlcode < 0 then
		MessageBox("DB Error","Check unassigned call error:"+sqlca.sqlerrtext)
		return
	end if
	if trim(chkRepairman) = '' then
		beep(2)
		MessageBox("Error","Can't close an unsaved call!")
		return
	end if
end if
If Is_PasswordOK( Get_Event_Security( "CC" ) ) Then	
	if dw_1.ModifiedCount() > 0 then //if change is made, save call before close m.n.
//		MessageBox("Change is made","Save the change. def:"+sProblemDefinition+" res:"+sResolution)
		wf_update_call(integer(targetTable))
	end if
	if f_close_a_call(callNumber,targetTable) then
		uo_1.event ue_sendreturn ( '', callNumber, '' ) 		// FOI VZ
//		MessageBox("Close","Call#:"+callNumber+" is closed!")
		cb_add.TriggerEvent("Clicked")
	end if
end if

end event

type cb_delete from commandbutton within w_call_upd
event ue_mousemove pbm_mousemove
string tag = "Delete the currently displayed call record."
boolean visible = false
integer x = 2085
integer y = 1512
integer width = 261
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Delete"
end type

event ue_mousemove;SetMicroHelp( This.Tag )
end event

event clicked;integer Net
Net = MessageBox("Delete Warning","Are you sure ?", question!, YesNoCancel!, 3)
CHOOSE CASE Net
	CASE 3
		return
	CASE 2 
		//cb_close.TriggerEvent("clicked")
	CASE 1
		If Is_PasswordOK( Get_Event_Security( "CD" ) ) Then
			f_delete_call(sCallNumber, Integer(openMode), true)
//			cb_close.TriggerEvent("clicked")
			cb_add.triggerevent(clicked!)
		end if
END CHOOSE
end event

type cb_save from commandbutton within w_call_upd
event ue_mousemove pbm_mousemove
string tag = "Save any changes to the currently viewed record."
boolean visible = false
integer x = 1161
integer y = 1512
integer width = 261
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Save"
end type

event ue_mousemove;SetMicroHelp( This.Tag )
end event

event clicked;if dw_1.ModifiedCount() = 0 then
	MessageBox("No Change","No change detected in this call. Make change and try again !")
	return
end if
if (dw_1.getitemstring(1,'call_number') <> &
   dw_1.getitemstring(1,'call_number',primary!,true)) and &
	not isnull(dw_1.getitemstring(1,'call_number',primary!,true)) THEN
	MessageBox("Error","Call Numbers can not be changed!")
	return
end if

if sRoom = "" then
	MessageBox("Required","Room is required. Try again !")
	return
end if

if sProblem = "" then
	MessageBox("Required","Task is required. Try again !")
	return
end if

if sSubProblem = "" then
	MessageBox("Required","Sub-task is required. Try again !")
	return
end if

if sClosedByDept <> "" and sRepairman <> "" then
	if sStatCode = '00' then
		sPreOpened = 'Y'
		sPaging = 'P'
//		wf_find_subproblem_number() // can use this function to check auto-assign indicator
//		messagebox("auto assigned",auto_assign_ind)
		if wf_check_auto_assign() = 0 then /* is an auto-assign call */
			integer res
			res = MessageBox("Auto Assignment", "This is an auto assignment task! Do you want to clear the "  + & 
				"assigned employee? ", Question!, YesNo!, 1)
			IF res = 1 THEN /* process yes */
 		//		dw_1.SetItem(1,'closed_bydept','') // do not clear the dept so pending fitlering can still pick up the call
				dw_1.setItem(1,'repairman','')
		//		sClosedByDept = ""
				sRepairman = ""
			END IF
		end if
	end if
end if



//If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
	if not wf_save_call() then
		return 
	end if
	copiedCall = false          //reset copy call switch
	timerStartModified = false  //reset "timer_start" manual modified switch
	dw_1.ResetUpdate()
	if openMode = '0' then
//		colToSet = 4
		cb_add.TriggerEvent("clicked")
	elseif openMode = '1' or (openMode = '2' or (openMode = '5' or openMode = '6')) then
		if windowIsAlreadyOpen then
			cb_add.TriggerEvent("clicked")
			CHOOSE CASE openMode
				CASE '1'
					if IsValid( w_pending_calls ) then
						open(w_pending_calls)
					end if
				CASE '2'
					if IsValid( w_pending_calls ) then
						open(w_pending_calls)
					end if
				CASE '5'
					if IsValid( w_closed_calls ) then
						open(w_closed_calls)
					end if
				CASE '6'
					if IsValid( w_timer_calls ) then
						open(w_timer_calls)
					end if
			END CHOOSE
			openMode = '0' // reset it after save
		else
		//	cb_close.TriggerEvent("clicked")
		end if
	else
		cb_copy.enabled = true
		
	end if
//end if
end event

type cb_reset from commandbutton within w_call_upd
event ue_mousemove pbm_mousemove
event dddd ( )
string tag = "Abandon any unsaved changes and leave edit mode.  You will be prompted before this occurs."
boolean visible = false
integer x = 1774
integer y = 1512
integer width = 261
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = " &Reset"
boolean cancel = true
end type

event ue_mousemove;SetMicroHelp( This.Tag )
end event

event clicked;dw_1.ResetUpdate()
copiedCall = false
timerStartModified = false
dw_1.Reset()
if openMode <> '0' then
	if openMode = '3' or openMode = '4' then
		dw_1.Retrieve(copyCallNumber)
		cb_copy.TriggerEvent("clicked")
		cb_copy.enabled = false
	else
		if dw_1.Retrieve(sCallNumber) = 0 then
			cb_add.TriggerEvent("clicked")
		end if
	end if
else
	cb_add.TriggerEvent("clicked")
end if

end event

type cb_close from commandbutton within w_call_upd
event ue_mousemove pbm_mousemove
string tag = "Exit and close this window.  You will be prompted if any unsaved changes exist."
boolean visible = false
integer x = 2382
integer y = 1512
integer width = 261
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = " E&xit "
end type

event ue_mousemove;SetMicroHelp( This.Tag )
end event

event clicked;//close(parent)
exitByExitButton = true
parent.TriggerEvent("close")
end event

type cb_add from commandbutton within w_call_upd
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Add a new call record into the system."
boolean visible = false
integer x = 82
integer y = 1512
integer width = 210
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&New"
end type

event clicked;
Parent.TriggerEvent("ue_add")
If IsValid(w_call_upd) THEN
	if colToSet > 0 then
		Parent.PostEvent("ue_setcol")
	end if
end if

end event

event ue_mousemove;SetMicroHelp( This.Tag )
end event

type uo_1 from uo_vzt_tcp_metro within w_call_upd
integer x = 105
integer y = 1460
integer width = 3694
integer height = 1020
integer taborder = 100
boolean border = false
long backcolor = 134217728
end type

on uo_1.destroy
call uo_vzt_tcp_metro::destroy
end on

event constructor;call super::constructor;window lw_window
lw_window	= parent
this.of_init( lw_window	, dw_1, cb_close, 60 )  
end event

event ue_parent_setcolumn;call super::ue_parent_setcolumn;CHOOSE CASE as_colname
	CASE 'caller_category'
			dw_1.SetColumn("caller_category")
			sCallerCategory = as_value
	CASE 'guest'
			dw_1.SetColumn("guest")
			sGuest = as_value
//			if sCallerCategory = 'GST' then
				wf_process_guest_call_hist()
				dw_1.SetFocus() // make sure dw_1 gets focus
//			end if
	CASE ELSE
END CHOOSE


end event

type cb_retrieve from commandbutton within w_call_upd
event mousemove pbm_mousemove
string tag = "Enter a call number in Call Number field and click here to retrieve a call!"
boolean visible = false
integer x = 155
integer y = 1608
integer width = 256
integer height = 64
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "Re&trieve"
end type

event mousemove;SetMicroHelp( This.Tag )
end event

event clicked;String ls_callnumber, ls_table[3], ls_mode[3]
integer li_cnt
boolean lb_foundcall

if not ib_findcall then return


ls_table[1] = 'timercalls'
ls_table[2] = 'closedcalls'
ls_table[3] = 'pendingcalls'
ls_mode[1]  = '1'
ls_mode[2]  = '5'
ls_mode[3]  = '2'

ls_callnumber= dw_1.object.Call_Number[1]

FOR li_cnt = 1 to 3
	if not wf_modify_data_source(callType,ls_table[li_cnt]) then
		return
	end if
	CALLTYPE = ls_table[li_cnt]
   if dw_1.retrieve(ls_callnumber) > 0 THEN
		lb_foundcall = true
		exit
   end if 	
NEXT

if lb_foundcall THEN
	wf_initialize_call_variables(1)
	if CALLTYPE = 'closedcalls' then
		wf_set_buttons(4)
		st_mode.text = 'View'
	else
		wf_set_buttons(2)
		st_mode.text = 'Modify'
	end if
   wf_set_tab_order(1)
	openmode = ls_mode[li_cnt]
	//------------------------------------------------------------
	uo_1.event ue_retrieve_guest( id_account )	/// vz
	//------------------------------------------------------------	
else
	messagebox('Responder','Call number not found!')
	cb_add.triggerevent(clicked!)
	openmode = '0'
END IF
ib_findcall = false
end event

