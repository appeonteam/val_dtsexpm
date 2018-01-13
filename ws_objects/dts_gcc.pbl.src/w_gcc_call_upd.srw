$PBExportHeader$w_gcc_call_upd.srw
forward
global type w_gcc_call_upd from window
end type
type cb_letter from commandbutton within w_gcc_call_upd
end type
type p_2 from picture within w_gcc_call_upd
end type
type cb_closecall from commandbutton within w_gcc_call_upd
end type
type cb_retrieve from commandbutton within w_gcc_call_upd
end type
type cb_copy from commandbutton within w_gcc_call_upd
end type
type cb_modify from commandbutton within w_gcc_call_upd
end type
type cb_add from commandbutton within w_gcc_call_upd
end type
type cb_close from commandbutton within w_gcc_call_upd
end type
type cb_reset from commandbutton within w_gcc_call_upd
end type
type cb_save from commandbutton within w_gcc_call_upd
end type
type cb_delete from commandbutton within w_gcc_call_upd
end type
type st_bannerleftchar from statictext within w_gcc_call_upd
end type
type st_bannerrightchar from statictext within w_gcc_call_upd
end type
type st_3 from statictext within w_gcc_call_upd
end type
type st_2 from statictext within w_gcc_call_upd
end type
type st_mode from statictext within w_gcc_call_upd
end type
type st_banner from statictext within w_gcc_call_upd
end type
type dw_1 from datawindow within w_gcc_call_upd
end type
type p_1 from picture within w_gcc_call_upd
end type
end forward

global type w_gcc_call_upd from window
integer x = 1074
integer y = 480
integer width = 2871
integer height = 1680
boolean titlebar = true
string title = "Calls"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "PHONE01.ICO"
event ue_add ( )
event ue_refresh ( )
event ue_setcol ( )
event ue_printscreen ( )
event type integer ue_setvisual ( string as_mode )
cb_letter cb_letter
p_2 p_2
cb_closecall cb_closecall
cb_retrieve cb_retrieve
cb_copy cb_copy
cb_modify cb_modify
cb_add cb_add
cb_close cb_close
cb_reset cb_reset
cb_save cb_save
cb_delete cb_delete
st_bannerleftchar st_bannerleftchar
st_bannerrightchar st_bannerrightchar
st_3 st_3
st_2 st_2
st_mode st_mode
st_banner st_banner
dw_1 dw_1
p_1 p_1
end type
global w_gcc_call_upd w_gcc_call_upd

type variables
string 		is_closedby 
str_dts_call	istr_parms
boolean		ib_edit=false

DataWindowChild dwc_subproblem
DataWindowChild dwc_room
DataWindowChild dwc_room_dsc
DataWindowChild dwc_repairman
DataWindowChild dwc_guest

double	id_account

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

string auto_assign_ind

int colToSet

//call record variables
double	id_gccid
decimal {2} i_amount
string      sCallNumber
datetime 	dtCallIndate
string      sStatCode
string      sRoom
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
string      sZone
datetime 	dtCallOutdate
string      sClosedBy
string      sClosedBydept
string      sTimerNumber
datetime 	dtTimerStart
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

//shift related variables
time weekday_shift_start[]
time weekday_shift_end[]
time sat_shift_start[]
time sat_shift_end[]
time sun_shift_start[]
time sun_shift_end[]
int max_shift
end variables

forward prototypes
public function boolean wf_show_dddw (datawindow dw_in, string dw_in_col, integer dddw_on_off)
public subroutine wf_set_buttons (integer bottonmode)
public subroutine wf_set_tab_order (integer tabmode)
public subroutine wf_process_room_change (string chgorigin)
public function string wf_chk_showlist (string incol)
public subroutine wf_allow_dddw_edit (datawindow dwin, string dwincol, integer dddwalloweditsw)
public subroutine wf_set_dddw_allow_edit (string controlcolumn, string setcolumn)
public function boolean wf_dddw_set_filter (string filterfor, string filtercriteria)
public function boolean wf_validate_problem (string problemnumber)
public function datetime wf_calc_timer_start (datetime callOpenDateTime, long timerMin)
public function boolean wf_validate_subproblem (string subproblemnumber)
public subroutine wf_initialize_call_variables (integer initflag)
public function integer wf_validate_stat_code (string ccolcontents)
public function boolean wf_load_shift_data ()
public function integer wf_shift_number (integer dayOfWeek, datetime shiftDateTime)
public function double wf_call_number ()
public function boolean wf_save_call ()
public function boolean wf_insert_call (integer calltable)
public function boolean wf_update_call (integer calltable)
public function string wf_find_subproblem_number ()
public function boolean wf_modify_data_source (string currsourcetable, string newsourcetable)
public function boolean wf_set_initial_col (integer colnum)
public function integer wf_check_auto_assign ()
public function string wf_get_pn (string as_disp)
public function string wf_get_spn0 (string as_disp, string as_pn)
end prototypes

event ue_add;dw_1.RowsDiscard(0,999,Primary!) // re-initialize screen
long 		ll_row
string	ls_code
//sfm 
//mn- need to maintain openMode for return to action initiation screen. openMode is set action is moved to m_menu
//openMode = '0'

st_mode.text = 'Add'
wf_set_tab_order(1) // set to open all fields
ll_row = dw_1.insertRow(0)

wf_initialize_call_variables(0)

dtCallIndate = datetime(today(), now())

this.openMode 		= istr_parms.openmode
this.sCallNumber 	= istr_parms.callNumber
//this.colToSet 		= istr_parms.colToSet
this.id_gccid 		= istr_parms.gccid
this.sRoom			= istr_parms.room

ib_edit = false

//this.colToSet  = 4 //set column focus to room

cb_letter.visible					= false
if openmode = '0' or openMode = 'G' or openMode = 'RE' or openMode = 'AM' then
	dw_1.SetItem(ll_row,"stat_code", 		11)
	sStatCode = '11'
	dw_1.SetItem(ll_row,"call_indate", 		dtCallIndate)
	dw_1.SetItem(ll_row,"gcc_id", 			istr_parms.gccid)		// vz
	dw_1.SetItem(ll_row,"caller_category", 'GST')					// vz
	sCallerCategory = 'GST'
	dw_1.SetItem(ll_row,"guest", istr_parms.guestname)				// vz
	sGuest = istr_parms.guestname
	dw_1.SetItem(ll_row,"room", 				istr_parms.room)		// vz
	dw_1.SetItem(ll_row,"room_dsc", 			istr_parms.room)		// vz
end if

if openMode = '0' then
	dw_1.POST SetFocus()
	dw_1.POST SetColumn("problem_problem_number")
End If 

if openMode = 'G' then
	sProblem = 'GCC-Call Guest'
  	sProblemNumber = wf_get_pn( sProblem)
	dw_1.SetItem(ll_row,"problem_problem_number", 	sProblemNumber) // GCC 00670
//	sSubProblem = 'Call Guest'
//	sSubProblemNumber= wf_get_spn(sSubProblem, sProblemNumber)
//	dw_1.SetItem(ll_row,"subproblem", sSubProblem)	// call guest vz
	dw_1.SetItem(ll_row,"problem_definition", istr_parms.guest_phone)		// vz
	sProblemDefinition = istr_parms.guest_phone
	dw_1.SetColumn("subproblem")
	this.colToSet  = 8 //set column focus subproblem
//	dw_1.PostEvent("ue_show_dddw")
end if

if openMode = 'RE' then
	sProblem = 'Rebates'
	sProblemNumber = wf_get_pn(sProblem)
	dw_1.SetItem(ll_row,"problem_problem_number", sProblemNumber)  
	dw_1.SetColumn("subproblem")
	this.colToSet  = 8 //set column focus subproblem
	//dw_1.PostEvent("ue_show_dddw")
END IF
if openMode = 'AM' then
	sProblem = 'Amends'
	sProblemNumber = wf_get_pn(sProblem)
	dw_1.SetItem(ll_row,"problem_problem_number", 	sProblemNumber)  
	dw_1.SetColumn("subproblem")
	this.colToSet  = 8 //set column focus subproblem
	//dw_1.PostEvent("ue_show_dddw")
END IF

this.event ue_setvisual(openmode)

datetime after15Mins
if SecondsAfter(now(), 23:59:00) < 840 then  //leap into next day
	after15Mins = datetime(RelativeDate(today(),1), &
								  RelativeTime(00:00:00, 900 - (SecondsAfter(now(), 23:59:00) + 60)))
else
	after15Mins = datetime(today(), RelativeTime(now(), 900))
end if

dtTimerStart = after15Mins
sReceiver = cpassusername

dw_1.SetItem(ll_row,"timer_start", after15Mins)
dw_1.SetItem(ll_row,"receiver",cpassusername)
dw_1.SetItem(ll_row,"stat_code","11")
sStatCode = "11"

if not shiftDataLoaded then
	wf_load_shift_data()
end if
sShift = string(wf_shift_number ( DayNumber( Date(dtCallIndate) ), dtCallIndate ))

dw_1.ResetUpdate()
wf_set_buttons(1) // set to entry mode
wf_set_tab_order(2) // set to allow update
//dw_1.SetColumn("room")
timerStartModified = false //reset timer start datetime mod sw

dw_1.SetFocus()
end event

event ue_refresh;
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

event ue_setvisual;CHOOSE CASE as_mode
	CASE '0'
		this.title = 'GCC Tasking: Add Call'
	CASE 'G'
		this.title = 'GCC Tasking: Call guest'
//		dw_1.object.problem_problem_number.Edit.DisplayOnly = true 
//		dw_1.object.subproblem.Edit.DisplayOnly = true 
	CASE 'AM'
		this.title = 'GCC Tasking: Amends'
		//	dw_1.object.problem_problem_number.Edit.DisplayOnly = true 
		dw_1.object.resolution.width 	= '3218'
		dw_1.object.amt_t.text			= 'Amends Amount:'
		dw_1.object.amount.visible		= true
		dw_1.object.amt_t.visible		= true
		cb_letter.visible					= true
	CASE 'RE'
		this.title = 'GCC Tasking: Rebates'
		//	dw_1.object.problem_problem_number.Edit.DisplayOnly = true 
		dw_1.object.resolution.width 	= '3218'
		dw_1.object.amount.visible		= true
		dw_1.object.amt_t.visible		= true
		cb_letter.visible					= true
	CASE ELSE
		this.title = 'GCC Tasking'
END CHOOSE

return 1
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
	return
end if

if bottonmode = 2 then
	cb_reset.enabled = true
	cb_save.enabled = true
	cb_copy.enabled = false
	cb_delete.enabled = true
	cb_closecall.enabled = true
	return
end if

if bottonmode = 3 then
	cb_reset.enabled = false
	cb_save.enabled = true
	cb_copy.enabled = true
	cb_delete.enabled = false
	cb_closecall.enabled = false
	return
end if

if bottonmode = 1 then
	cb_reset.enabled = true
	cb_save.enabled = true
	cb_copy.enabled = false
	cb_delete.enabled = false
	cb_closecall.enabled = false
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
	sZone = dwc_room.GetItemString(dwc_room.GetRow(),"unit_type")
end if
end subroutine

public function string wf_chk_showlist (string incol);string strDesc

strDesc = inCol + ".dddw.showlist"

return dw_1.Describe(strDesc)

end function

public subroutine wf_allow_dddw_edit (datawindow dwin, string dwincol, integer dddwalloweditsw);//** allow_edit_sw = 1 then turn allowedit on
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

If Pos( Upper( controlColumn ), "GST" ) <> 0 Then  //* is not HLT/GST or GST
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
  
  SELECT "problem"."problem_desc",   
         "problem"."timer1_start_min",   
         "problem"."timer2_start_min",   
         "problem"."timer1_reps",   
         "problem"."timer2_reps",   
         "problem"."auth_take_off_timer",   
         '11',   /* "problem"."default_status" always 11 for GCC */
         "problem"."pre_openable",   
         "problem"."timer_level"  
    INTO :sProblem,   
         :dTimer1StartMin,   
         :dTimer2StartMin,   
         :dTimer1Reps,   
         :dTimer2Reps,   
         :sAuthTakeOffTimer,   
         :sDefaultStatus,   
         :sPreOpenable,   
         :iTimerLevel  
    FROM "problem"  
   WHERE "problem"."problem_number" = :problemNumber   ;
	
	sDefaultStatus = '11' 
	
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
	dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin) 
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
	dw_1.SetItem(dw_1.GetRow(), "subproblem", "")
	sSubproblemNumber = ""
end if

return true
end function

public function datetime wf_calc_timer_start (datetime callOpenDateTime, long timerMin);datetime	timer_start
int day_incr 
long min_remainder, sec_remainder
long sec_diff, min_diff
time open_time, time_incr_base

open_time = Time(callOpenDateTime)
sec_diff = 86400 - (SecondsAfter(Time("00:00:00"), Time(callOpenDateTime)))
min_diff = sec_diff / 60
time_incr_base = time(callOpenDateTime)

// calc day increment
day_incr = int(timerMin / 1440) 

min_remainder = timerMin  - day_incr * 1440
sec_remainder = min_remainder * 60

if sec_diff < (min_remainder * 60) then  // check if time is pass midnight
	day_incr = day_incr + 1
	sec_remainder = timerMin * 60 - sec_diff
	min_remainder = int(timerMin - sec_diff / 60)
	time_incr_base = Time("00:00:00")
end if

timer_start = DateTime( RelativeDate(Date(callOpenDateTime), day_incr), &
								RelativeTime(time_incr_base, sec_remainder ) )				  

return timer_start
end function

public function boolean wf_validate_subproblem (string subproblemnumber); datetime dtTimer
  
  SELECT "subproblem"."subproblem_desc",   
         "subproblem"."timer1_start_min",   
         "subproblem"."timer2_start_min",   
         "subproblem"."timer1_reps",   
         "subproblem"."timer2_reps",   
         "subproblem"."auth_take_off_timer",   
        '11', /* "subproblem"."default_status",   */
         "subproblem"."pre_openable",   
         "subproblem"."timer_level",
         "subproblem"."init_paging_min"
			
    INTO :sSubproblem,   
         :dTimer1StartMin,   
         :dTimer2StartMin,   
         :dTimer1Reps,   
         :dTimer2Reps,   
         :sAuthTakeOffTimer,   
         :sDefaultStatus,   
         :sPreOpenable,   
         :iTimerLevel,
			:d_paging_min  
    FROM "subproblem"  
   WHERE "subproblem"."subproblem_number" = :subproblemNumber   
	  and "subproblem"."problem_number" 	= :sProblemNumber;
	
	sDefaultStatus = '11' // for GCC 
	
	if sqlca.sqlcode <> 0 then
		if sqlca.sqlcode = 100 then
			MessageBox("Database Error", &
			"Subproblem not found in subproblem table."+&
			"~r~nProblem NUmber:"+sProblemNumber+"~r~nSubproblem Number:"+subproblemNumber, StopSign!)
			return false
		else
			MessageBox("Database Error",sqlca.sqlerrtext, StopSign!)
			return false
		end if
	end if

if openMode = '0' then  //adding new call
	dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin) 
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
	id_account 				= 0
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
id_account				= dw_1.GetItemNumber(dw_1.GetRow(),"guest_account")
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

shiftDataLoaded = true
return true
end function

public function integer wf_shift_number (integer dayOfWeek, datetime shiftDateTime);boolean weekday, sat, sun, shift_not_found
datetime day_start[], day_end[], sat_start[], sat_end[], sun_start[], sun_end[]

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

/// record with new call number
     UPDATE "sys_settings"
      SET "last_callnum" =  {fn floor("last_callnum")} + 1 
    WHERE "phony_key"    = '1';

If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to create new call number.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return -1
END IF

// get last call number Before Commit!!!!!! 
SELECT "sys_settings"."last_callnum"
    INTO :sNewCallNumber
    FROM "sys_settings"
         WHERE "sys_settings"."phony_key" = '1';

If sqlca.SQLCode <> 0 Then       // Database ERROR...lost connection...who knows?
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to select new call number.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return -1
END IF
COMMIT; // !!!!!!!!!!!!!!!! 
dNewCallNumber = double ( sNewCallNumber)
return dNewCallNumber







//double dNewCallNumber
//string sNewCallNumber
//
//// get last call number
//SELECT "sys_settings"."last_callnum"
//    INTO :sNewCallNumber
//    FROM "sys_settings"
//	 WHERE "sys_settings"."phony_key" = '1';
//
//If sqlca.SQLCode < 0 Then       // Database ERROR...lost connection...who knows?
//	Beep(1)
//	egm_sqlerror( SQLCA )
//END IF
//
//dNewCallNumber = double(sNewCallNumber) + 1
//sNewCallNumber = string(dNewCallNumber)
//
//// record record with new call number
//	UPDATE "sys_settings"
//      SET "sys_settings"."last_callnum" = :sNewCallNumber
//    WHERE "sys_settings"."phony_key"    = '1';
//
//If sqlca.SQLCode < 0 Then       // Database ERROR...lost connection...who knows?
//	Beep(1)
//	egm_sqlerror( SQLCA )
//	return -1
//END IF
//
//return dNewCallNumber
end function

public function boolean wf_save_call ();int iCallTable, iFindPagerRes
string sCallTable, sEmpId, sPagerId, sPagerCd 
double dCallNumber
boolean bInsertCall

iCallTable = 2
sCallTable = 'PENDINGCALLS'

CHOOSE CASE openMode
	CASE '1'
		sCallNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
//		if integer(sStatCode) < 10 then
//			bInsertCall = false
//			iCallTable = 1
//			sCallTable = 'TIMERCALLS'
//		else
//			// delete from timercalls because stats is changed to pending
//			if not f_delete_call(sCallNumber, 1) then 
//				return false
//			end if
//			iCallTable = 2
//			bInsertCall = true
//		end if
				
   CASE '2'
		sCallNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
		if integer(sStatCode) > 9 then
			bInsertCall = false
			iCallTable = 2
			sCallTable = 'PENDINGCALLS'
		else
			if not f_delete_call(sCallNumber, 2, false) then 
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
	CASE ELSE  //CASE '0' , '3', '4' will fall into there -  AM, RE, G as well VZ
		If f_nvl(dw_1.GetItemString(dw_1.GetRow(), "call_number"),'') = '' then
			bInsertCall = true
			dCallNumber = wf_call_number()
			if dCallNumber > 0 then
				sCallNumber = string(dCallNumber)
			else
				return false
			end if
		ELSE
			bInsertCall = false
		END IF
		sOpenedStatus = sStatCode
		
		if (openMode = 'AM' or openMode = 'RE') and (integer(sStatCode) = 99 and len(is_closedby) > 0 ) then  
			iCallTable = 3
			sCallTable = 'CLOSEDCALLS'
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

if sClosedByDept <> "" and sRepairman <> "" then
//	MessageBox("msg","not a auto-assigned call")
	iFindPagerRes = f_get_pager(sClosedByDept,sRepairman,sEmpId, sPagerId)
	if iFindPagerRes = 0 then
		s_pageassignment ass
		ass.assignment_id = string(today(),"yyyymmddhhmmss")
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
			rollback;
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



if bInsertCall then
   if not wf_insert_call(iCallTable) then
		return false
	end if
else
	if not wf_update_call(iCallTable) then	
		return false
	end if
end if

blob 		lb_object
string   ls_msg
 
CHOOSE CASE this.openMode
	CASE '0'
		ls_msg = 'GCC Service Call'
	CASE 'G'
		ls_msg = 'GCC "Call Guest" record'
	CASE 'AM'
		ls_msg = 'GCC Amends call'
	CASE 'RE'
		ls_msg = 'GCC Rebates call'
	CASE ELSE
		ls_msg = 'GCC call record'
END CHOOSE


if not ib_edit and (openMode='0' or openmode ='G' or openmode ='RE' or openmode ='AM') then
	dw_1.SetItem(dw_1.GetRow(),"call_number",sCallNumber)
	this.SetMicroHelp("Call Record: " + sCallNumber + " Inserted Into " + &
				+ sCallTable + " Successfully. ")
	f_write_gcc_history( istr_parms.gccid, 'SVC', lb_object, ls_msg+' created', sCallNumber, '')			
				
elseif openMode = '1' or ib_edit or openMode = '2' or openMode = '5' or openMode = '6' then
	this.SetMicroHelp("Call Record: " + sCallNumber + " Updated in " + &
				+ sCallTable + " Successfully. ")
//	f_write_gcc_history( istr_parms.gccid, 'SVC', lb_object, ls_msg+' updated', sCallNumber,'')			
			
elseif openMode = '3' or openMode = '4' then
	this.SetMicroHelp("Call Record: " + sCallNumber + " Copied in " + &
				+ sCallTable + " Successfully. ")
end if

return true
end function

public function boolean wf_insert_call (integer calltable);
if f_chk_duplicate_call(calltable,'insert',sRoom,sProblem,sSubproblem) = false then
	MessageBox("Duplicate","The intended save call is found duplicate!")
	return false
end if
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
			  "gcc_id",
			  "amount")    
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
			  :id_gccid,
			  :i_amount
				)  ;
else
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
			  "gcc_id",
			  "amount")    
  
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
			  :id_gccid,
			  :i_amount
				)  ;
end if

string ls_error, ls_code
If sqlca.SQLCode <> 0 Then        
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Insert Error', 'Failed to create new call record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return false
END IF

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

public function boolean wf_update_call (integer calltable);// callTable 1 = 'timercalls'
//			    2 = 'pendingcalls'
//           3 = 'closedcalls'
if f_chk_duplicate_call(calltable,'update',sRoom,sProblem,sSubproblem) = false then
	MessageBox("Duplicate","The intended save call is found duplicate!")
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
			  "paging_ind" = :spaging ,
			  "gcc_id"  =  :id_gccid,
			  "amount"	=  :i_amount
			
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
			  "gcc_id"  =  :id_gccid,
			  "amount"	=  :i_amount
			  
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
           "opened_status" = :sOpenedStatus ,
			   "gcc_id"  =  :id_gccid,
			  "amount"	=  :i_amount
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
If sqlca.SQLnrows = 0 then MessageBox('Database Update Error', 'DBMS indicated that no rows were updated~n~r(wf_update_call)')
commit;
if sqlca.sqlcode <> 0 then
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Commit Error', 'Failed on commit. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return false
end if

//
//if sqlca.sqlcode < 0 then
//	MessageBox("update error", sqlca.sqlerrtext)
//	return false
//end if
//
//commit;
//if sqlca.sqlcode < 0 then
//	MessageBox("commit error", sqlca.sqlerrtext)
//	return false
//end if
//
return true
end function

public function string wf_find_subproblem_number ();DataWindowChild dddw_temp
integer ret
string cSubProblemNo

cSubProblemNo = ''
ret     = dw_1.GetChild( "subproblem", dddw_temp )
if ret = -1 then
	MessageBox( "Subproblem Error!", "Couldn't get SubProblem data properly." )
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
		return 0
	end if
	ls_pager_id = '' // VZ precaution for auto-reassign
	
	if not f_find_pager_id (ls_dept, ls_employee_name, ls_employee_num, ls_pager_id, ls_capecode, sroom, dtTimerStart) then // VZ ZONE + QUICK CALL CHG 2006-05-22
		ass.assignment_id = string(today(),"yyyymmddhhmmss")
	   ass.assignment_cd = 'N'
 	   ass.dept_assigned = ls_dept
	   ass.emp_id = '8888888888'
	   ass.emp_name = 'NONE'
      ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	   SetNull(ass.time_completed)
	   ass.call_number = sCallNumber 
	   ass.page_sent = 'N'
		ass.special_msg = 'Auto assignment call # ' + scallnumber + &
		 ' has failed to allocate a pager!'
		ass.pager_id = f_find_mgr_pager(ls_dept, sroom, dtTimerStart) // VZ ZONE + QUICK CALL CHG 2006-05-22
		/*
	    SELECT "deptmgr"."mgr_pager_id"  
         INTO :ass.pager_id  
         FROM "deptmgr"  
       WHERE "deptmgr"."dept" = :ls_dept   ;
		*/ 
   	 spaging = '0'
    ELSE
		ass.assignment_id = string(today(),"yyyymmddhhmmss")
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

public function string wf_get_pn (string as_disp); datetime dtTimer
  string ls_code 
  	
	  SELECT problem_number into :ls_code FROM problem WHERE problem_desc = :as_disp;
	  
	
	if sqlca.sqlcode <> 0 then
		if sqlca.sqlcode = 100 then
			MessageBox("Database Error","Problem not found in problem table:" +as_disp, StopSign!)
			return ''
		else
			MessageBox("Database Error",sqlca.sqlerrtext +'~r~nProblem:'+as_disp, StopSign!)
			return ''
		end if
	end if


return ls_code
end function

public function string wf_get_spn0 (string as_disp, string as_pn); datetime dtTimer
  string ls_code 
  	
	  SELECT subproblem_number into :ls_code FROM subproblem 
	  WHERE problem_number = :as_pn AND 
	  			subproblem_desc = :as_disp
	  		  ;
	  
	if sqlca.sqlcode <> 0 then
		if sqlca.sqlcode = 100 then
			MessageBox("Database Error","Subroblem not found in problem table:" +as_disp+'~r~nProblem:'+as_pn, StopSign!)
			return ''
		else
			MessageBox("Database Error",sqlca.sqlerrtext +'~r~nSubproblem:' +as_disp+'~r~nProblem:'+as_pn, StopSign!)
			return ''
		end if
	end if


return ls_code
end function

on w_gcc_call_upd.create
this.cb_letter=create cb_letter
this.p_2=create p_2
this.cb_closecall=create cb_closecall
this.cb_retrieve=create cb_retrieve
this.cb_copy=create cb_copy
this.cb_modify=create cb_modify
this.cb_add=create cb_add
this.cb_close=create cb_close
this.cb_reset=create cb_reset
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.st_bannerleftchar=create st_bannerleftchar
this.st_bannerrightchar=create st_bannerrightchar
this.st_3=create st_3
this.st_2=create st_2
this.st_mode=create st_mode
this.st_banner=create st_banner
this.dw_1=create dw_1
this.p_1=create p_1
this.Control[]={this.cb_letter,&
this.p_2,&
this.cb_closecall,&
this.cb_retrieve,&
this.cb_copy,&
this.cb_modify,&
this.cb_add,&
this.cb_close,&
this.cb_reset,&
this.cb_save,&
this.cb_delete,&
this.st_bannerleftchar,&
this.st_bannerrightchar,&
this.st_3,&
this.st_2,&
this.st_mode,&
this.st_banner,&
this.dw_1,&
this.p_1}
end on

on w_gcc_call_upd.destroy
destroy(this.cb_letter)
destroy(this.p_2)
destroy(this.cb_closecall)
destroy(this.cb_retrieve)
destroy(this.cb_copy)
destroy(this.cb_modify)
destroy(this.cb_add)
destroy(this.cb_close)
destroy(this.cb_reset)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.st_bannerleftchar)
destroy(this.st_bannerrightchar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_mode)
destroy(this.st_banner)
destroy(this.dw_1)
destroy(this.p_1)
end on

event open;string cTempReadVar 

// SFM 10/26/97 Determine db type and switch dataobjects if need be

if f_nvl(gnv_appman.is_datemask ,'') <> ''  then 
	if f_nvl(gnv_appman.is_timemask ,'') <> ''  then 
		dw_1.Object.call_indate.EditMask.Mask	= gnv_appman.is_datemask +' '+ gnv_appman.is_timemask
		dw_1.Object.call_outdate.EditMask.Mask	= gnv_appman.is_datemask +' '+ gnv_appman.is_timemask
		dw_1.Object.timer_start.EditMask.Mask	= gnv_appman.is_datemask +' '+ gnv_appman.is_timemask
	else
		dw_1.Object.call_indate.EditMask.Mask	= gnv_appman.is_datemask + ' hh:mm:ss'
		dw_1.Object.call_outdate.EditMask.Mask	= gnv_appman.is_datemask + ' hh:mm:ss'	
		dw_1.Object.timer_start.EditMask.Mask	= gnv_appman.is_datemask + ' hh:mm:ss'	
	end if
Else
//default 
	dw_1.Object.call_indate.EditMask.Mask	= 'mm/dd/yyyy hh:mm:ss'
	dw_1.Object.call_outdate.EditMask.Mask	= 'mm/dd/yyyy hh:mm:ss'
	dw_1.Object.timer_start.EditMask.Mask	= 'mm/dd/yyyy hh:mm:ss'
end if


IF cappdbtype = 'MSSQL' THEN dw_1.dataobject = 'd_timercalls_upd_mssql'
istr_parms 			= Message.PowerObjectparm 
this.openMode 		= istr_parms.openmode
this.sCallNumber 	= istr_parms.callNumber
this.colToSet 		= istr_parms.colToSet
this.id_gccid 		= istr_parms.gccid
this.sRoom			= istr_parms.room

windowIsAlreadyOpen = false
p_1.Visible = false
st_banner.Text = 'GCC Tracking System'
SetMicroHelp( "Opening GCC Call Data Entry screen...please wait." )

// in WingDings font a 'P' is a Pointed Pennant
st_BannerRightChar.Text = ProfileString( cINIPath+cINIFile, "CallDataEntry","BannerRightChar", "P" )
st_BannerLeftChar.Text = ProfileString( cINIPath +cINIFile, "CallDataEntry","BannerLeftChar", "P" )
cTempReadVar = ProfileString( cINIPath+cINIFile, "CallDataEntry","EnterKeyScrollsRecords", "No" )

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
				  G    (GCC) window is opened by another screen for adding a "call guest" call
*/
//MessageBox("openmode","openMode is " + openMode)

// default call is pending for GCC
//.callType = "timercalls"
callType = "pendingcalls"
CHOOSE CASE openMode
	CASE '0', 'G', 'AM', 'RE' 
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
		callType = "pendingcalls"
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

// if intended opencall(pending,closed or timer) type is not equal to default(timer)
// modify DW "table.select"

// GCC - always pending or closed !!!!!

if callType <> "timercalls" then
	if not wf_modify_data_source("timercalls",callType) then
		return
	end if
end if

//if f_nvl(this.sCallNumber,'' ) <> '' then this.event ue_refresh() //vz

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

if openMode = '0' or openMode = 'G' or openMode = 'AM' or openMode = 'RE' then //new GCC call entry
	cb_add.TriggerEvent("clicked")
elseif openMode = 'A' or (openMode = 'B' or openMode = 'C') then // view only
	st_mode.text = 'View'
	if dw_1.Retrieve(sCallNumber) <= 0 then
		MessageBox("Retrieval Failed","Failed to retrieve call # " + sCallNumber)
		return
	end if
	wf_set_buttons(4)
	wf_set_tab_order(3)
elseif openMode = '3' or openMode = '4' then   // copy a call
	if dw_1.Retrieve(sCallNumber) <= 0 then
		MessageBox("Retrieval Failed","Failed to retrieve call # " + sCallNumber)
		return
	end if
	wf_initialize_call_variables(1)
	copyCallNumber = sCallNumber
	cb_copy.TriggerEvent("clicked")
	cb_copy.enabled = false
else  // modify a call	'1' or '2' or '6' -----------------------------------------
	// try pending then closed 
	if dw_1.Retrieve(sCallNumber) <= 0 then
			callType = "closedcalls"
			if not wf_modify_data_source("pendingcalls",callType) then 
				MessageBox("Retrieval Failed","Failed to retrieve call # " + sCallNumber)
				return
			end if
	 		if dw_1.Retrieve(sCallNumber) <= 0 then
			 	MessageBox("Retrieval Failed","Failed to retrieve call # " + sCallNumber)
				return
			end if
	end if
	wf_initialize_call_variables(1)
	
	string ls_stat
	sproblemNumber = dw_1.GetItemString(dw_1.GetRow() ,	"problem_problem_number") 
	i_amount			= dw_1.GetItemDecimal(dw_1.GetRow() ,	"amount") 
	ls_stat			= dw_1.GetItemString(dw_1.GetRow() ,	"stat_code") 
	if ls_stat = '99' then cb_close.enabled = false
	
	
	If sProblemNumber = wf_get_pn('Rebates') then 
		sProblem = 'Rebates'
		openmode = 'RE'
	END IF 
	
	If sProblemNumber = wf_get_pn('Amends') then 
		sProblem = 'Amends'
		openmode = 'AM'
	END IF 
	ib_edit = true // not a new call
	If sProblemNumber = wf_get_pn('GCC-Call Guest') then 
		//If dw_1.GetItemString(dw_1.GetRow() ,"subproblem") = 'Call Guest' then 
			sProblem = 'GCC-Call Guest'
			openmode = 'G'
//			sSubProblem = 'Call Guest'
//		END IF
	END IF 
	
	this.event ue_setvisual(openmode)
	dw_1.visible = true 
	cb_modify.TriggerEvent("clicked")
	colToSet = istr_parms.colToSet
	IF coltoset > 0 then postEvent("ue_setcol")
end if

Timer(.055, This )

end event

event timer;// In case we ever get stuck we won't stack-up the Timer Calls
Timer( 0, this )   

//dw_1.Retrieve()
st_2.Text = " " + String( Now(), "dddd") + " "
st_3.Text = " " + String( Now(), "mmmm d, yyyy") + " "

Timer( 120, this ) // Now we'll reset

end event

event close;integer Net

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

event deactivate;if isValid(w_gcc_main) then w_gcc_main.postevent("ue_menu_set")
end event

event activate;if this.WindowState = Minimized! then
	this.WindowState = Normal!
end if
if isValid(gnv_appman.iw_frame) then gnv_appman.iw_frame.event dynamic ue_menu_set()


If dw_1.GetRow() <= 0 then return 
is_closedby = trim(dw_1.GetItemString(dw_1.GetRow(), 'closed_by'))

cb_close.enabled = true
cb_reset.enabled = false
cb_copy.enabled = false
cb_add.enabled = false
cb_retrieve.enabled = true 
cb_delete.enabled = true	
	
If len ( is_closedby ) > 1 then 
	//closed
	cb_closecall.enabled = false
	cb_save.enabled = false
	//cb_letter
Else
	cb_closecall.enabled = true 
	cb_save.enabled = true
END IF 

end event

type cb_letter from commandbutton within w_gcc_call_upd
boolean visible = false
integer x = 142
integer y = 1348
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Letter"
end type

event clicked;if istr_parms.gccid <= 0 then return  
long ll_row

ll_row = dw_1.GEtRow()
if ll_row <= 0 then return
if dw_1.AcceptText() <> 1 then return 

SetPointer( Hourglass!)

CHOOSE CASE parent.openMode
	CASE 'AM'
		istr_parms.amount = dw_1.GetItemDecimal( ll_row, 'amount')
		istr_parms.offer 	= dw_1.GetItemString( ll_row, 'subproblem')
		OpenSheetWithParm( w_gcc_letter_amends, istr_parms, w_gcc_main, 0, Layered!)
		cb_close.enabled = true  
	CASE 'RE'
		istr_parms.amount = dw_1.GetItemDecimal( ll_row, 'amount')
		OpenSheetWithParm( w_gcc_letter_rebates, istr_parms, w_gcc_main, 0, Layered!)
		cb_close.enabled = true  
	CASE ELSE
END CHOOSE

end event

type p_2 from picture within w_gcc_call_upd
integer x = 526
integer y = 12
integer width = 1801
integer height = 188
boolean originalsize = true
string picturename = "gcc_b01.bmp"
boolean focusrectangle = false
end type

type cb_closecall from commandbutton within w_gcc_call_upd
event mousemove pbm_mousemove
string tag = "Close the current call."
integer x = 745
integer y = 1348
integer width = 261
integer height = 84
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

event clicked;If Is_PasswordOK( Get_Event_Security( "CS" ) ) Then
	string 		callNumber, statCode, targetTable
	callNumber 	= dw_1.GetItemString(dw_1.GetRow(),"call_number")
	statCode 	= dw_1.GetItemString(dw_1.GetRow(),"stat_code")
 	
	if f_close_a_call_gcc(	callNumber) then
		// close window or add a call action
		if	istr_parms.return_after_call_closed = 'Y' then // close upd window if call closed
			if isValid( istr_parms.w_caller) then istr_parms.w_caller.event dynamic ue_refresh() 
			close( parent) 
		else
	 		cb_add.TriggerEvent("Clicked")
		end if
	end if
end if
end event

type cb_retrieve from commandbutton within w_gcc_call_upd
event mousemove pbm_mousemove
string tag = "Enter a call number in Call Number field and click here to retrieve a call!"
integer x = 434
integer y = 1348
integer width = 261
integer height = 84
integer taborder = 70
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
else
	messagebox('Responder','Call number not found!')
	cb_add.triggerevent(clicked!)
	openmode = '0'
END IF
ib_findcall = false
end event

type cb_copy from commandbutton within w_gcc_call_upd
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Create a new call by copying the current call"
integer x = 1358
integer y = 1348
integer width = 261
integer height = 84
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
dtTimer = wf_calc_timer_start (dtCallIndate, dTimer1StartMin)
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

type cb_modify from commandbutton within w_gcc_call_upd
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Modify the currently viewed call record."
boolean visible = false
integer x = 393
integer y = 1356
integer width = 210
integer height = 84
integer taborder = 90
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

type cb_add from commandbutton within w_gcc_call_upd
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Add a new call record into the system."
boolean visible = false
integer x = 87
integer y = 1356
integer width = 210
integer height = 400
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&New"
end type

event clicked;Parent.TriggerEvent("ue_add")
if colToSet > 0 then Parent.PostEvent("ue_setcol")


end event

event ue_mousemove;SetMicroHelp( This.Tag )
end event

type cb_close from commandbutton within w_gcc_call_upd
event ue_mousemove pbm_mousemove
string tag = "Exit and close this window.  You will be prompted if any unsaved changes exist."
integer x = 2281
integer y = 1348
integer width = 261
integer height = 84
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

type cb_reset from commandbutton within w_gcc_call_upd
event ue_mousemove pbm_mousemove
event dddd ( )
string tag = "Abandon any unsaved changes and leave edit mode.  You will be prompted before this occurs."
integer x = 1673
integer y = 1348
integer width = 261
integer height = 84
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
		dw_1.Retrieve(sCallNumber)
	end if
else
	cb_add.TriggerEvent("clicked")
end if

end event

type cb_save from commandbutton within w_gcc_call_upd
event ue_mousemove pbm_mousemove
string tag = "Save any changes to the currently viewed record."
integer x = 1056
integer y = 1348
integer width = 261
integer height = 84
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

if openMode = 'RE' or openMode = 'AM' then
	decimal ld_amount
	ld_amount = f_nvl( dw_1.getitemDecimal(1,'amount') , 0.00)
	if ld_amount <= 0.00 then
		string ls_type 
		ls_type = 'Amends'
		if openMode = 'RE' then ls_type = 'Rebate'
		MessageBox("Required","Please enter the "+ ls_type +" amount!")
		return
	END IF
END IF 

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
		else
		//	cb_close.TriggerEvent("clicked")
		end if
	else
		if LEN(is_closedby) <=0  then  cb_copy.enabled = true // not for closed calls 
		
	end if
//end if
cb_close.enabled = true		// allow close ??? vz
end event

type cb_delete from commandbutton within w_gcc_call_upd
event ue_mousemove pbm_mousemove
string tag = "Delete the currently displayed call record."
integer x = 1984
integer y = 1348
integer width = 261
integer height = 84
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

type st_bannerleftchar from statictext within w_gcc_call_upd
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

type st_bannerrightchar from statictext within w_gcc_call_upd
string tag = "(this character is modifiable in this applications INI file.)"
boolean visible = false
integer x = 2117
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

type st_3 from statictext within w_gcc_call_upd
string tag = "Current Month, Day and Time as set on this computer."
integer x = 14
integer y = 92
integer width = 494
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 17934062
long backcolor = 8388608
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_gcc_call_upd
string tag = "Current Day of the week as set on this computer."
integer x = 14
integer y = 36
integer width = 489
integer height = 124
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 17934062
long backcolor = 8388608
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_mode from statictext within w_gcc_call_upd
string tag = "Current window Mode. e.g., New, Modify, View or Close allows edit of different fields and different fules."
integer x = 2336
integer y = 28
integer width = 457
integer height = 124
integer textsize = -18
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8388608
boolean enabled = false
string text = "Set-Up"
alignment alignment = center!
boolean border = true
long bordercolor = 65535
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_banner from statictext within w_gcc_call_upd
string tag = "The registered site for this installation of the system."
boolean visible = false
integer x = 549
integer y = 12
integer width = 1755
integer height = 172
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

type dw_1 from datawindow within w_gcc_call_upd
event ue_show_dddw ( )
event ue_show_arrow ( )
event ue_keydown pbm_dwnkey
event ue_hide_dddw ( )
event ue_setfocus ( )
event ue_keyenter pbm_dwnprocessenter
integer y = 196
integer width = 2798
integer height = 1132
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_gcc_timercalls_upd"
boolean livescroll = true
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
CurrentColumn = dwo.name // this.GetColumnName()
ColumnContent = data

//MessageBox("Column Contenct",CurrentColumn + ' --> "' + columncontent + '"')

CHOOSE CASE Upper(CurrentColumn)
	CASE 'AMOUNT' 
			i_amount = dec ( data)
			cb_save.enabled = true 			
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
			MessageBox("Database Error", "Room Number not found in area table.", StopSign!)
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
		
	CASE	"ROOM_DSC"
		wf_process_room_change('room_dsc')
		sRoomDsc = ColumnContent
		sRoom =  this.GetItemString(row,"room")
		
	CASE	"CALLER_CATEGORY"
		if Pos(Upper(ColumnContent), "GST" ) = 0  then // not "GST" or "HLT/GST"
			this.SetItem(this.GetRow(),"guest","")
		end if
		if usedMouse then
			this.SetColumn("guest")
			if Pos(Upper(ColumnContent), "GST" ) = 0  then
				this.PostEvent("ue_show_dddw")
			end if
		end if
		sCallerCategory = ColumnContent
		
	CASE	"GUEST"
		this.PostEvent("ue_hide_dddw")
		sGuest = ColumnContent
		
	CASE	"PROBLEM_PROBLEM_NUMBER"
		sProblemNumber = ColumnContent
		wf_validate_problem(sProblemNumber)
		if usedMouse then
			this.SetColumn("subproblem")
			this.PostEvent("ue_show_dddw")
		end if
		
	CASE	"SUBPROBLEM"
		sSubProblemNumber = wf_find_subproblem_number()
		wf_validate_subproblem(sSubProblemNumber)
		this.PostEvent("ue_hide_dddw")
		this.POst SetColumn("subproblem")
		this.POST AcceptText()
		return 0
		
	CASE	"CLOSED_BYDEPT"
		if usedMouse then
			this.SetColumn("repairman")
			this.PostEvent("ue_show_dddw")
		end if
		sClosedBydept = ColumnContent
		
	CASE	"REPAIRMAN"
		this.PostEvent("ue_hide_dddw")
		sRepairman = ColumnContent
		
	CASE "PROBLEM_DEFINITION"
		sProblemDefinition = ColumnContent
		cb_save.enabled = true 
	CASE "RESOLUTION"
		sResolution = ColumnContent
		cb_save.enabled = true 
		
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
end event

type p_1 from picture within w_gcc_call_upd
integer x = 1362
integer y = 668
integer width = 64
integer height = 80
boolean bringtotop = true
string picturename = "ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;if st_mode.text = 'View' then return

//* pop up timer datetime entry screen
w_call_timer_date_gcc dt_win
datetime ldt_timerdate, ldt_new_timerdate
string ls_orig_datetime, ls_new_datetime
str_datetime lst_parm, lst_newparm

lst_parm.dateparm = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
//ls_orig_datetime = string(ldt_timerdate,"mm/dd/yy hh:mm:ss")

openwithparm(dt_win, lst_parm)

lst_newparm = Message.PowerObjectParm
if not isvalid( lst_newparm ) then return 

if lst_parm.dateparm <> lst_newparm.dateparm then
//	ldt_new_timerdate = datetime(date(mid(ls_new_datetime,1,8)),&
//										  time(mid(ls_new_datetime,10,8)))
	dw_1.SetFocus()
	if dw_1.Setcolumn("timer_start") < 0 then MessageBox("error","setcolumn TIMER START failed")
//	dw_1.SetItem(dw_1.GetRow(),"stat_code","00")
	dw_1.SetItem(dw_1.GetRow(),"timer_start",lst_newparm.dateparm )
	cb_save.enabled = true 
//	timerStartModified = true
//	sStatCode = "00"
//	dtTimerStart = ldt_new_timerdate
//	dw_1.TriggerEvent("itemchanged")

	if dw_1.Setcolumn("ROOM") < 0 then MessageBox("error","setcolumn ROOM failed")

end if

end event

