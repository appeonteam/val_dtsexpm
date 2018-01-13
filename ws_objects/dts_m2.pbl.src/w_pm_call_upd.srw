$PBExportHeader$w_pm_call_upd.srw
forward
global type w_pm_call_upd from window
end type
type lb_2 from listbox within w_pm_call_upd
end type
type lb_1 from listbox within w_pm_call_upd
end type
type cb_1 from commandbutton within w_pm_call_upd
end type
type p_3 from picture within w_pm_call_upd
end type
type p_2 from picture within w_pm_call_upd
end type
type pb_exit from picturebutton within w_pm_call_upd
end type
type pb_reset from picturebutton within w_pm_call_upd
end type
type pb_save from picturebutton within w_pm_call_upd
end type
type p_1 from picture within w_pm_call_upd
end type
type dw_1 from datawindow within w_pm_call_upd
end type
type uo_subproblem from u_multi_select_pm within w_pm_call_upd
end type
end forward

global type w_pm_call_upd from window
integer width = 3461
integer height = 1780
boolean titlebar = true
string title = "PM Call Entry"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 134217728
string icon = "WRENCH.ICO"
boolean center = true
event ue_add ( )
lb_2 lb_2
lb_1 lb_1
cb_1 cb_1
p_3 p_3
p_2 p_2
pb_exit pb_exit
pb_reset pb_reset
pb_save pb_save
p_1 p_1
dw_1 dw_1
uo_subproblem uo_subproblem
end type
global w_pm_call_upd w_pm_call_upd

type variables
DataWindowChild dwc_subproblem
DataWindowChild dwc_problem
DataWindowChild dwc_room
DataWindowChild dwc_room_dsc
DataWindowChild dwc_repairman
DataWindowChild dwc_guest


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
string callType //1=timer, 2=pending
string tableSelectStr
boolean errExit = false
integer iTotalSubtask
integer iCurrentCallNumber
integer iInsertedCall
integer pmPreset
string origProblemSql


string auto_assign_ind
string recur_ind

int colToSet

//auto-assignment variables
String ls_dept , ls_employee_num , ls_employee_name
String ls_pager_id , ls_datetime, ls_capecode
s_pageassignment ass
string special_msg
string ls_now , ls_mgr_pager_id  
long ll_count


//call record variables
double	dCallNumber
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
s_timer_recur sTimerRecurInit

//Guest call history variables
integer guestHistCutOffDays
boolean showGuestCallHist

//default PM task variables
string pmTaskNo[]
string pmSubtaskNo[]
int pmIntervalDay[]
string pmTask[]
string pmSubtask[]
int pmTaskIndex
int currPmTaskIndex
boolean pmSubtaskLoad[]
string blankSArray[]
boolean blankBArray[]
end variables

forward prototypes
public function string wf_mod_datetime_mask (string coln)
public subroutine wf_initialize_call_variables (integer initflag)
public subroutine wf_set_tab_order (integer tabmode)
public function boolean wf_load_shift_data ()
public function integer wf_shift_number (integer dayofweek, datetime shiftdatetime)
public subroutine wf_process_room_change (string chgorigin)
public function boolean wf_validate_problem (string problemnumber)
public function boolean wf_dddw_set_filter (string filterfor, string filtercriteria)
public function boolean wf_insert_call ()
public function boolean wf_insert_call_all_subtask ()
public function boolean wf_insert_call_selected_subtask (string iselected)
public function double wf_get_next_call_number (integer total_call_number_to_get)
public subroutine wf_get_subtask_info (string itask, string isubtask)
public function integer wf_insert_pageassignment ()
public function integer wf_check_pm_preset (string equip_no)
public subroutine wf_add_entire_pm_task (integer equip_id, integer preset_period)
public subroutine wf_reg_repeater ()
public subroutine wf_popup_reg_repeater ()
public subroutine wf_popup_pm_repeater ()
public subroutine wf_collect_pm_tasks ()
public subroutine wf_insert_pm_preset_call ()
public subroutine wf_get_task_info (string itask)
public function boolean wf_pm_repeater ()
end prototypes

event ue_add();if dw_1.RowCount() > 0 then
	dw_1.DeleteRow(0) // re-initialize screen
end if


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
dw_1.SetItem(dw_1.GetRow(),"stat_code","20")

sStatCode = "20"

if not shiftDataLoaded then
	wf_load_shift_data()
end if
sShift = string(wf_shift_number ( DayNumber( Date(dtCallIndate) ), dtCallIndate ))

dw_1.ResetUpdate()
wf_set_tab_order(2) // set to allow update

colToSet = 4 //set column focus to room
timerStartModified = false //reset timer start datetime mod sw

dw_1.SetColumn("room")

dw_1.SetFocus()
end event

public function string wf_mod_datetime_mask (string coln);string modStr,modRes

modStr = colN+".edit.format=~""+cDateTimeFormatStr+"~""

modRes=dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw Modify Error","dw:"+dw_1.dataobject+" column:"+coln)
end if

//modRes=dw_2.Modify(modStr)
//if modRes <> "" then
//	MessageBox("dw Modify Error","dw:"+dw_2.dataobject+" column:"+coln)
//end if


modStr = colN+".editmask.mask=~""+cDateTimeFormatStr+"~""
modRes=dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw Modify Error","dw:"+dw_1.dataobject+" column:"+coln)
end if

//modRes=dw_2.Modify(modStr)
//if modRes <> "" then
//	MessageBox("dw Modify Error","dw:"+dw_2.dataobject+" column:"+coln)
//end if

return modRes
end function

public subroutine wf_initialize_call_variables (integer initflag);sCallNumber				= ""
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

iInsertedCall = 0
iTotalSubtask = 0
dCallNumber = 0
pmPreset = 0

sTimerRecur=sTimerRecurInit

uo_subproblem.uo_ddlb_1.text = "[All]"
uo_subproblem.cDbWhere=""
uo_subproblem.load_lb = 'subtask'
uo_subproblem.cTable2Use		 = "subproblem"
uo_subproblem.cColumn2Retrieve = "subproblem_desc+' ('+subproblem_number+')'"
uo_subproblem.ib_loaded=false

timerStartModified = false

pmTaskIndex = 0
currPmTaskIndex=0
pmTask=blankSArray
pmSubtask=blankSArray
pmSubtaskLoad=blankBArray
pmTaskNo=blankSArray
pmSubtaskNo=blankSArray




return
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
//	dw_1.SetTabOrder("call_outdate",50)
	dw_1.SetTabOrder("stat_code",60)
	dw_1.SetTabOrder("timer_start",70)
	dw_1.SetTabOrder("room",80)
	dw_1.SetTabOrder("room_dsc",90)
	dw_1.SetTabOrder("caller_category",100)
	dw_1.SetTabOrder("guest",110)
	dw_1.SetTabOrder("problem_problem_number",120)
//	dw_1.SetTabOrder("subproblem",130)
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
//	dw_1.SetTabOrder("call_outdate",0)
	dw_1.SetTabOrder("stat_code",10)
	dw_1.SetTabOrder("timer_start",20)
	dw_1.SetTabOrder("room",30)
	dw_1.SetTabOrder("room_dsc",40)
	dw_1.SetTabOrder("caller_category",50)
	dw_1.SetTabOrder("guest",60)
	dw_1.SetTabOrder("problem_problem_number",70)
//	dw_1.SetTabOrder("subproblem",80)
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
//	dw_1.SetTabOrder("call_outdate",0)
	dw_1.SetTabOrder("stat_code",0)
	dw_1.SetTabOrder("timer_start",0)
	dw_1.SetTabOrder("room",0)
	dw_1.SetTabOrder("room_dsc",0)
	dw_1.SetTabOrder("caller_category",0)
	dw_1.SetTabOrder("guest",0)
	dw_1.SetTabOrder("problem_problem_number",0)
//	dw_1.SetTabOrder("subproblem",0)
	dw_1.SetTabOrder("closed_bydept",0)
	dw_1.SetTabOrder("repairman",0)
	dw_1.SetTabOrder("problem_definition",0)
	dw_1.SetTabOrder("resolution",0)
	
end if


	
	
	

end subroutine

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

public function boolean wf_validate_problem (string problemnumber); datetime dtTimer
  
  SELECT "problem"."problem_desc"  
    INTO :sProblem   

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

dw_1.SetItem(dw_1.GetRow(), "subproblem", "")
sSubproblemNumber = ""


return true
end function

public function boolean wf_dddw_set_filter (string filterfor, string filtercriteria);int ret
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

if filterFor = "PROBLEM" then
	string sql, newSql, sqlerr
	if pmPreset > 0 then
		newSql="select distinct problem_number='PM'+string(period), problem_desc= 'PM '+convert(char(3), period) + '-day',seq=period ~n"+&
			"from area, vzt_equipment_task_map~n"+&
			"where room_type='E'  and area_number='"+filterCriteria+"' and area_number=convert(char(15),equipment_id) ~n"+&
			"union all~n"+"select 'PM','[All] PM-Preset',0~n order by seq"
	else
		newSql = origProblemSql
	end if
	newsql = "datawindow.table.select=~""+newsql+"~""
	sqlerr = dwc_problem.Modify(newsql)
	if sqlerr <>"" then MessageBox("modify",sqlerr)
	ret=dwc_problem.retrieve()
	if pmPreset > 0 then 
		pmTaskIndex = ret
		int load_ix
		pmSubtaskLoad = blankBArray
		load_ix = 1
		do while load_ix <= pmTaskIndex
			pmSubtaskLoad[load_ix] = false
			load_ix++
		loop
	end if
end if

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

public function boolean wf_insert_call ();
sCallNumber = string(dCallNumber + iInsertedCall)

if integer(sDefaultStatus) > 10 then
	sStatCode = sDefaultStatus
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
	VALUES 	( :sCallNumber,   
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
			  :dRecurId, 
			  0,
			  :dTimer3StartMin,
			  :dTimer3Reps )  ;
else
	if sRepairman <> '' then // timercall assigned by user
		sStatCode = sDefaultStatus
		sPreOpened = ''
		sPaging = ''
	else 
		if auto_assign_ind = 'Y' then
			if timerStartModified then
				sStatCode = '00'
				sPreOpened = 'Y'
				sPaging = 'P'
				sClosedBydept = ls_dept
			else
				sStatCode = sDefaultStatus
				//do auto assign here
				wf_insert_pageassignment()
			end if
		else 	// not auto-assign
			sStatCode = sDefaultStatus
			sPreOpened = ''
			sPaging = ''
		end if
	end if
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
	VALUES 	( :sCallNumber,   
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
			  :dRecurId, 
			  0,
			  :dTimer3StartMin,
			  :dTimer3Reps )  ;	
end if

if sqlca.sqlcode <> 0 then
	MessageBox("DB Error",sqlca.sqlerrtext)
	return false
else
//	commit;
	return true
end if
end function

public function boolean wf_insert_call_all_subtask ();
select 	count(*) into :iTotalSubtask
from		subproblem
where	problem_number = :sProblemNumber;
if sqlca.sqlcode <> 0 then
	MessageBox("DB Error",sqlca.sqlerrtext)
	return false
end if
	
dCallNumber=wf_get_next_call_number(iTotalSubtask)
iInsertedCall=0

 
DECLARE SubTask CURSOR FOR  
  SELECT "subproblem"."subproblem_desc",
  			"subproblem"."subproblem_number",
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
			"subproblem"."timer3_reps",
			"subproblem"."auto_assign_ind",
			"subproblem"."dept_assign"
    FROM  subproblem  
	 where "subproblem"."problem_number"=:sProblemNumber	;
	 
OPEN SubTask;

FETCH	SubTask into 	:sSubproblem,
							:sSubproblemNumber,
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
							:dTimer3Reps,
							:auto_assign_ind,
							:ls_dept;
DO WHILE SQLCA.SQLCODE = 0
	if integer(sDefaultStatus) > 10 then
		callType = '2'
	else
		callType = '1'
	end if
	if not f_chk_duplicate_call(integer(callType),'insert',sRoomDsc, sProblem, sSubproblem) then
		int ans 
		ans=MessageBox("Warning",trim(sProblem)+"/"+trim(sSubproblem)+" for "+trim(sRoomDsc)+ &
		" is duplicate! Save Anyway?",Question!, YesNo!, 2)
		if ans = 2 then
			goto NEXTCALL
		end if
	
	end if
	if sRecurInd = 'Y' then
		dRecurId=f_insert_recurring(sTimerRecur, sRoom, sCallerCategory,sGuest,&
				sProblemNumber, sSubproblemNumber,sProblemDefinition)
	end if
	
	if dRecurId = 0 then //insert recurring info fails
		rollback;
		EXIT
	end if
	
	if not wf_insert_call() then
		rollback;
		EXIT
	end if
	NEXTCALL:
	iInsertedCall++
	
	FETCH	SubTask into :sSubproblem,
							:sSubproblemNumber,
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
							:dTimer3Reps,
							:auto_assign_ind,
							:ls_dept;
LOOP
							
							
CLOSE SubTask;

commit;
return true
end function

public function boolean wf_insert_call_selected_subtask (string iselected);//dRecurId=f_insert_recurring(sTimerRecur, sRoom, sCallerCategory,sGuest,&
//				sProblemNumber, sSubproblemNumber,sProblemDefinition)
string inSubTask,inSubTaskNo
integer i, j,  numTask, ans

if len(trim(iselected)) = 0 then
	return false
end if

i=1
j=1
numTask=1

do while pos(iselected, '),',i) > 0 //count selected subtask
	j=pos(iselected, '),',i)
	i=j+3
	numTask++
loop

dCallNumber=wf_get_next_call_number(numTask)
iInsertedCall = 0

i=1
j=1

do while pos(iselected, '),',i) > 0
	j=pos(iselected,'),',i)
	inSubTask = mid(iselected, i,(j+1)-i)
	inSubTaskNo=mid(inSubTask,pos(inSubTask,'(')+1,5)
	
	wf_get_subtask_info(sProblemNumber,inSubTaskNo)
	
	if integer(sDefaultStatus) > 10 then
		callType = '2'
	else
		callType = '1'
	end if
	if not f_chk_duplicate_call(integer(callType),'insert',sRoomDsc, sProblem, sSubproblem) then
		ans = MessageBox("Warning",trim(sProblem)+"/"+trim(sSubproblem)+" is duplicate! Save Anyway?",&
			Question!, YesNo!, 2)
		if ans = 2 then
			goto ContinueNext
		end if
	
	end if
	
	if sRecurInd = 'Y' then
		dRecurId=f_insert_recurring(sTimerRecur, sRoom, sCallerCategory,sGuest,&
				sProblemNumber, sSubproblemNumber,sProblemDefinition)
	end if
	
	if dRecurId = 0 then // insert recurring info fail
		rollback;
		return false
	end if
	
	if not wf_insert_call() then
		rollback;
		return false
	end if
	
	ContinueNext:
	
	iInsertedCall++
	
	i=j+3
loop

inSubTask = mid(iselected, i)
inSubTaskNo=mid(inSubTask,pos(inSubTask,'(')+1,5)
wf_get_subtask_info(sProblemNumber,inSubTaskNo)

if integer(sDefaultStatus) > 10 then
	callType = '2'
else
	callType = '1'
end if
if not f_chk_duplicate_call(integer(callType),'insert',sRoomDsc, sProblem, sSubproblem) then
	ans=MessageBox("Warning",trim(sProblem)+"/"+trim(sSubproblem)+" for "+trim(sRoomDsc)+ &
		" is duplicate! Save Anyway?",Question!, YesNo!, 2)
	if ans = 2 then
		return true
	end if

end if
	
if sRecurInd = 'Y' then
	dRecurId=f_insert_recurring(sTimerRecur, sRoom, sCallerCategory,sGuest,&
			sProblemNumber, sSubproblemNumber,sProblemDefinition)
end if

	
if dRecurId = 0 then // insert recurring info fail
	rollback;
	return false
end if

if not wf_insert_call() then
	rollback;
	return false
end if



return true
end function

public function double wf_get_next_call_number (integer total_call_number_to_get);double dNewCallNumber
string sNewCallNumber,  ls_error, ls_code

UPDATE sys_settings
SET last_callnum =  convert(char(10),convert(double,last_callnum) + :total_call_number_to_get) 
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
//	ROLLBACK;
	MessageBox('Database Error', 'Failed to select new call number.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return -1
END IF
//COMMIT; // !!!!!!!!!!!!!!!! 
dNewCallNumber = (double ( sNewCallNumber)) - total_call_number_to_get + 1
return dNewCallNumber
end function

public subroutine wf_get_subtask_info (string itask, string isubtask);SELECT "subproblem"."subproblem_desc",
  			"subproblem"."subproblem_number",
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
			"subproblem"."timer3_reps",
			"subproblem"."auto_assign_ind",
			"subproblem"."dept_assign"
into		:sSubproblem,
			:sSubproblemNumber,
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
			:dTimer3Reps,
			:auto_assign_ind,
			:ls_dept
FROM  subproblem  
where "subproblem"."problem_number"=:itask	
and	"subproblem"."subproblem_number"=:isubtask;
if sqlca.sqlcode <> 0 then
	egm_sqlerror(sqlca)
end if

return

end subroutine

public function integer wf_insert_pageassignment ();If IsNull(ls_dept) THEN
   MEssagebox('Responder','A pager ID could not be determined from the subproblem table and the department managers table!~r~nInsert of this record has been aborted')
	return - 1
END IF


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
	sClosedBydept = ls_dept
	sRepairman = ls_employee_name
	return 0
else 
	return -1
end if


end function

public function integer wf_check_pm_preset (string equip_no);int pm_preset

select convert(int,isnull(sum(period/period),0)) into :pm_preset
from area, vzt_equipment_task_map  
where room_type='E' and area_number=:equip_no
and	area_number*=convert(char(15),equipment_id);

if sqlca.sqlcode< 0 then
	MessageBox("db Error",sqlca.sqlerrtext)
	pm_preset=0
end if

if pm_preset > 0 then
	uo_subproblem.cColumn2Retrieve =&
	"data=fmt_subtask_desc (subproblem.problem_number,subproblem.subproblem_number)+'~t  '+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'"
//	"data=rtrim(subproblem.subproblem_desc)+space(25-datalength(rtrim(subproblem.subproblem_desc)))+ ' ~t '+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'"				
//		"data=rtrim(subproblem.subproblem_desc)+ ' ~t'+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'"
	uo_subproblem.cDbWhere="equipment_id="+sRoom+" and  vzt_equipment_task_map.problem_number=subproblem.problem_number  "+&
		"and vzt_equipment_task_map.subproblem_number=subproblem.subproblem_number order by convert(int,substring(data,charindex('-day', data) - 3,3))"
	//convert(int,substring(data,charindex('-day', data) - 3,3))
	uo_subproblem.load_lb = 'subtask'
	uo_subproblem.cTable2Use="vzt_equipment_task_map, subproblem"
	uo_subproblem.ib_loaded=false	

end if
				
return pm_preset

end function

public subroutine wf_add_entire_pm_task (integer equip_id, integer preset_period);

pop_lb_from_db_where ("rtrim(subproblem.subproblem_desc)+ ' ~t '+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'", &
	"vzt_equipment_task_map, subproblem",&
	"equipment_id="+string(equip_id)+" and vzt_equipment_task_map.period="+string(preset_period) +&
						" and  vzt_equipment_task_map.problem_number=subproblem.problem_number  "+&
						"and vzt_equipment_task_map.subproblem_number=subproblem.subproblem_number",&
						lb_2)

int idx
idx=1

if lb_2.TotalItems() > 0 then
	do while idx <= lb_2.TotalItems()
		lb_1.AddItem(lb_2.Text(idx))
		idx++
	loop
end if


end subroutine

public subroutine wf_reg_repeater ();if sRecurInd = 'Y' then 
	goto SAVECALL //repeater data already input
end if

//* pop up timer datetime entry screen
w_call_timer_date_new dt_win
datetime ldt_timerdate, ldt_new_timerdate
string ls_orig_datetime, ls_new_datetime

ldt_timerdate = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
ls_orig_datetime = f_dt_to_dt_str(ldt_timerdate)

sTimerRecur.timer_dt_str 	= ls_orig_datetime
sTimerRecur.recur_ind 		= 'Y'
sTimerRecur.open_mode 		= openMode
sTimerRecur.recur_freq_code='D'
if sTimerRecur.recur_freq_num = '' then
	sTimerRecur.recur_freq_num = '30'
end if

openwithparm(dt_win,sTimerRecur)

if IsValid(Message.PowerObjectParm) then
	sTimerRecur = Message.PowerObjectParm
end if

if sTimerRecur.recur_start_date = '' then
	sTimerRecur.recur_ind = 'N'
end if
	
if sTimerRecur.recur_end_date ='' then
	sTimerRecur.recur_ind = 'N'
end if

if sTimerRecur.recur_ind = 'N' then
	int ans 
	ans=MessageBox("Warning","No Repeater data is entered! Continue to Save?",&
			Question!, YesNo!, 2)
	if ans = 2 then
		return
	end if
end if

ls_new_datetime = sTimerRecur.timer_dt_str
dw_1.SetItem(dw_1.GetRow(),"recur_ind",sTimerRecur.recur_ind)
sRecurInd = sTimerRecur.recur_ind

if f_str_dt_to_dt(ls_orig_datetime) <> f_str_dt_to_dt(ls_new_datetime) then
	ldt_new_timerdate = f_str_dt_to_dt(ls_new_datetime)
	dw_1.SetFocus()
	if dw_1.Setcolumn("timer_start") < 0 then
		MessageBox("error","setcolumn TIMER START failed")
	end if
	dw_1.SetItem(dw_1.GetRow(),"timer_start",ldt_new_timerdate)
	dtTimerStart = ldt_new_timerdate
	timerStartModified = true
end if

SAVECALL:

if uo_subproblem.uo_ddlb_1.text = "[All]" then
	if wf_insert_call_all_subtask() then 
		commit;
	end if
else
	if wf_insert_call_selected_subtask(uo_subproblem.is_selected) then 
		commit;
	end if
end if
end subroutine

public subroutine wf_popup_reg_repeater ();//* pop up timer datetime entry screen
w_call_timer_date_new dt_win
datetime ldt_timerdate, ldt_new_timerdate
string ls_orig_datetime, ls_new_datetime

ldt_timerdate = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
ls_orig_datetime = f_dt_to_dt_str(ldt_timerdate)
//recur_ind = dw_1.GetItemString(dw_1.GetRow(),"recur_ind")

//if isnull(recur_ind) then
//	recur_ind = 'N'
//end if

sTimerRecur.timer_dt_str 	= ls_orig_datetime
//sTimerRecur.recur_ind 		= 'Y' //force to open task repeater section
sTimerRecur.open_mode 		= openMode
//sTimerRecur.recur_freq_num = '30'
sTimerRecur.recur_freq_code='D'
openwithparm(dt_win,sTimerRecur)

if IsValid(Message.PowerObjectParm) then
	sTimerRecur = Message.PowerObjectParm
end if

if sTimerRecur.recur_start_date = '' then
	sTimerRecur.recur_ind = 'N'
end if
	
if sTimerRecur.recur_end_date ='' then
	sTimerRecur.recur_ind = 'N'
end if

ls_new_datetime = sTimerRecur.timer_dt_str
dw_1.SetItem(dw_1.GetRow(),"recur_ind",sTimerRecur.recur_ind)
sRecurInd = sTimerRecur.recur_ind

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
	end if
	if dw_1.Setcolumn("ROOM") < 0 then
		MessageBox("error","setcolumn ROOM failed")
	end if
end if
end subroutine

public subroutine wf_popup_pm_repeater ();//* pop up timer datetime entry screen
w_call_timer_date_pm dt_win
datetime ldt_timerdate, ldt_new_timerdate
string ls_orig_datetime, ls_new_datetime

//MessageBox("sTimerRecur.timer_dt_str",sTimerRecur.timer_dt_str)

ldt_timerdate = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
ls_orig_datetime = f_dt_to_dt_str(ldt_timerdate)
if sTimerRecur.timer_dt_str='' then
	sTimerRecur.timer_dt_str 	= ls_orig_datetime
end if
sTimerRecur.recur_ind 		= 'Y' //force to open task repeater section
sTimerRecur.open_mode 		= openMode
//sTimerRecur.recur_freq_num = '30'
sTimerRecur.recur_freq_code='D'

openwithparm(dt_win,sTimerRecur)

if IsValid(Message.PowerObjectParm) then
	sTimerRecur = Message.PowerObjectParm
end if

sTimerRecur.recur_ind = 'Y'

ls_new_datetime = sTimerRecur.timer_dt_str
dw_1.SetItem(dw_1.GetRow(),"recur_ind",sTimerRecur.recur_ind)
sRecurInd = sTimerRecur.recur_ind

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
	end if
	if dw_1.Setcolumn("ROOM") < 0 then
		MessageBox("error","setcolumn ROOM failed")
	end if
end if
end subroutine

public subroutine wf_collect_pm_tasks ();int idx, subIdx, foundPos, begPos, endPos, taskLen
int  intervalDay, svIntervalDay
string taskSubtask, svTaskSubTask
idx = 1
lb_1.Reset()
do while idx <= UpperBound(pmSubtaskLoad)
	if pmSubtaskLoad[idx] = true then
		subIdx = 1
		do while pos(pmSubtask[idx],',',subIdx)>0
			foundPos=pos(pmSubtask[idx],', ',subIdx)
			lb_1.AddItem(mid(pmSubtask[idx],subIdx, foundPos - subIdx))
			subIdx=foundPos+2
		loop
		lb_1.AddItem(mid(pmSubtask[idx],subIdx))
		if idx = 1 then exit //if subtask under [All' is selected, finish
	else
		if idx > 1 then
			wf_add_entire_pm_task(integer(sRoom),integer(Mid(dwc_problem.GetItemString(idx,1), 3 )))
		end if			
	end if
	idx++
loop

idx = 2
subIdx = 2
svIntervalDay = integer(Mid(lb_1.Text(1), Pos(lb_1.Text(1),'-day')-3, 3))
pmIntervalDay[1] = svIntervalDay
begPos = Pos(lb_1.Text(1),'(',1)+1
endPos = Pos(lb_1.Text(1),')',1)+1
taskLen = endPos - begPos
svTaskSubtask = Mid(lb_1.Text(1),begPos,taskLen)
pmTaskNo[1] = Mid(svTaskSubtask, 1, 5)
pmSubtaskNo[1] = Mid(svTaskSubtask,7,5)

do while idx <= lb_1.TotalItems()
	begPos = Pos(lb_1.Text(idx),'(',1)+1
	endPos = Pos(lb_1.Text(idx),')',1)+1	
	taskLen = endPos - begPos
	TaskSubtask = Mid(lb_1.Text(idx),begPos,taskLen)
	intervalDay = integer(Mid(lb_1.Text(idx), Pos(lb_1.Text(idx),'-day')-3, 3)) 
	if taskSubtask <> svTaskSubtask or svIntervalDay <> intervalDay then 		
		svTaskSubtask = taskSubtask
		svIntervalDay = intervalDay
		pmTaskNo[subIdx] = mid(svTaskSubtask, 1, 5)
		pmSubtaskNo[subIdx] = mid(svTaskSubtask,7,5)
		pmIntervalDay[subIdx] = svIntervalDay
		subIdx++
	end if
	idx++
loop

//MessageBox("loaded",string(subIdx -1))




end subroutine

public subroutine wf_insert_pm_preset_call ();int idx, ans
string svPmTaskNo, svPmSubtaskNo
string msg

iTotalSubtask = UpperBound(pmSubtaskNo)
iInsertedCall=0

//MessageBox("To Insert", string(UpperBound(pmSubtaskNo))+' pm calls')

dCallNumber=wf_get_next_call_number(iTotalSubtask) // get next pack of call numbers

idx = 1
svPmTaskNo = ''
svPmSubtaskNo = ''

do while idx <= UpperBound(pmTaskNo)
	
//	MessageBox("inserting","#"+string(idx)+" "+pmTaskNo[idx]+' '+pmSubtaskNo[idx]+' '+string(pmIntervalDay[idx]))
	
	if pmTaskNo[idx] <>  svPmTaskNo then
		wf_get_task_info (pmTaskNo[idx])
		wf_get_subtask_info(pmTaskNo[idx], pmSubtaskNo[idx])
		svPmTaskNo = pmTaskNo[idx]
		svPmSubtaskNo = pmSubtaskNo[idx]
	end if
	
	if pmSubtaskNo[idx] <> svPmSubtaskNo then
		wf_get_subtask_info(pmTaskNo[idx], pmSubtaskNo[idx])
		svPmSubtaskNo = pmSubtaskNo[idx]
	end if
	
	sTimerRecur.recur_freq_num = string(pmIntervalDay[idx])
	
	msg = msg+sProblemNumber+' '+sProblem+' '+sSubproblemNumber+' '+sSubproblem+' '+sTimerRecur.recur_freq_num+' day~n'
		

	if integer(sDefaultStatus) > 10 then
		callType = '2'
	else
		callType = '1'
	end if
	
	if not f_chk_duplicate_call(integer(callType),'insert',sRoomDsc, sProblem, sSubproblem) then
		ans = MessageBox("Warning",trim(sProblem)+"/"+trim(sSubproblem)+" is duplicate! Save Anyway?",&
			Question!, YesNo!, 2)
		if ans = 2 then
			goto ContinueNext
		end if
	
	end if
	
	dRecurId=f_insert_recurring(sTimerRecur, sRoom, sCallerCategory,sGuest,&
				sProblemNumber, sSubproblemNumber,sProblemDefinition)
	
	if dRecurId = 0 then //insert recurring info fails
		rollback;
		EXIT
	end if
	
	if not wf_insert_call() then
		rollback;
		EXIT
	end if
	
	iInsertedCall++
	
	ContinueNext:
	
	idx++
loop
MessageBox("You saved the following PM Preset task(s)",msg)

end subroutine

public subroutine wf_get_task_info (string itask);SELECT 	problem_desc,
			problem_number
into		:sProblem,
			:sProblemNumber
FROM  problem  
where problem_number=:itask;
if sqlca.sqlcode <> 0 then
	egm_sqlerror(sqlca)
end if

return
end subroutine

public function boolean wf_pm_repeater ();if sRecurInd = 'Y' then 
	return true
end if

//* pop up timer datetime entry screen
w_call_timer_date_pm dt_win
datetime ldt_timerdate, ldt_new_timerdate
string ls_orig_datetime, ls_new_datetime

ldt_timerdate = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
ls_orig_datetime = f_dt_to_dt_str(ldt_timerdate)

sTimerRecur.timer_dt_str 	= ls_orig_datetime
sTimerRecur.recur_ind 		= 'Y'
sTimerRecur.open_mode 		= openMode
sTimerRecur.recur_freq_code='D'


// *** sTimerRecur.recur_freq_num need to be populated from pmIntervalDay
//if sTimerRecur.recur_freq_num = '' then
//	sTimerRecur.recur_freq_num = '30'
//end if

openwithparm(dt_win,sTimerRecur)

if IsValid(Message.PowerObjectParm) then
	sTimerRecur = Message.PowerObjectParm
end if

//*** check recurring data 
if sTimerRecur.recur_start_date = '' then return false
if sTimerRecur.recur_start_date='' then return false
if sTimerRecur.recur_start_time='' then return false
	

ls_new_datetime = sTimerRecur.timer_dt_str
dw_1.SetItem(dw_1.GetRow(),"recur_ind",sTimerRecur.recur_ind)
sRecurInd = sTimerRecur.recur_ind

if f_str_dt_to_dt(ls_orig_datetime) <> f_str_dt_to_dt(ls_new_datetime) then
	ldt_new_timerdate = f_str_dt_to_dt(ls_new_datetime)
	dw_1.SetFocus()
	if dw_1.Setcolumn("timer_start") < 0 then
		MessageBox("error","setcolumn TIMER START failed")
		return false
	end if
	dw_1.SetItem(dw_1.GetRow(),"timer_start",ldt_new_timerdate)
	dtTimerStart = ldt_new_timerdate
	if sRecurInd = 'N' or (sRecurInd = 'Y' and sStatCode < '10' )then // only force status code to '00' if not a recur call
		dw_1.SetItem(dw_1.GetRow(),"stat_code","00")
		timerStartModified = true
		sStatCode = "00"
	end if
	if dw_1.Setcolumn("ROOM") < 0 then
		MessageBox("error","setcolumn ROOM failed")
		return false
	end if
end if

return true

end function

on w_pm_call_upd.create
this.lb_2=create lb_2
this.lb_1=create lb_1
this.cb_1=create cb_1
this.p_3=create p_3
this.p_2=create p_2
this.pb_exit=create pb_exit
this.pb_reset=create pb_reset
this.pb_save=create pb_save
this.p_1=create p_1
this.dw_1=create dw_1
this.uo_subproblem=create uo_subproblem
this.Control[]={this.lb_2,&
this.lb_1,&
this.cb_1,&
this.p_3,&
this.p_2,&
this.pb_exit,&
this.pb_reset,&
this.pb_save,&
this.p_1,&
this.dw_1,&
this.uo_subproblem}
end on

on w_pm_call_upd.destroy
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.cb_1)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.pb_exit)
destroy(this.pb_reset)
destroy(this.pb_save)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.uo_subproblem)
end on

event open;//
//p_1.Visible = false
//st_banner.Text = cRegSite
//SetMicroHelp( "Opening Call Data Entry screen...please wait." )
//
//// in WingDings font a 'P' is a Pointed Pennant
//st_BannerRightChar.Text = ProfileString( cINIPath +&
//							cINIFile, "CallDataEntry", &
//							"BannerRightChar", "P" )
//st_BannerLeftChar.Text = ProfileString( cINIPath +&
//							cINIFile, "CallDataEntry", &
//							"BannerLeftChar", "P" )
//cTempReadVar = ProfileString( cINIPath +&
//							cINIFile, "CallDataEntry", &
//							"EnterKeyScrollsRecords", "No" )
//
//
//if Upper(ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
//												"CallDataEntry", "ShowGuestCallHistSw", 'NO' )) = 'YES' then
//	showGuestCallHist = true
//else
//	showGuestCallHist = false
//end if
//
//guestHistCutOffDays = integer(ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
//												"CallDataEntry", "GuestCallHistCutOffDays", '7' ))
//
//

dw_1.SetTransObject(sqlca)
tableSelectStr = dw_1.Describe("DataWindow.Table.Select")

dw_1.GetChild("problem_problem_number",dwc_problem)
dwc_problem.SetTransObject(sqlca)
dwc_problem.Retrieve()
origProblemSql = dwc_problem.Describe("datawindow.table.select")

f_mod_dw_dt_disp(dw_1,"call_indate")
f_mod_dw_dt_disp(dw_1,"timer_start") 
wf_mod_datetime_mask("timer_start") 
//f_mod_dw_dt_disp(dw_1,"call_outdate")



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


if dw_1.GetChild("repairman",dwc_repairman) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_repairman Error")
else
	dwc_repairman.SetTransObject(SQLCA)
end if



TriggerEvent("ue_add")
uo_subproblem.BringToTop=true


//Timer(.055, This )
//SetMicroHelp( "{Responder} Ready" )
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
			pb_save.TriggerEvent("clicked")
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
			pb_save.TriggerEvent("clicked")
			dw_1.ResetUpdate() //do save changes
		CASE 2
			dw_1.ResetUpdate() //discard changes
		END CHOOSE
	end if
end if

close(this)

end event

type lb_2 from listbox within w_pm_call_upd
boolean visible = false
integer x = 2405
integer y = 1624
integer width = 987
integer height = 748
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_pm_call_upd
boolean visible = false
integer x = 27
integer y = 1616
integer width = 2354
integer height = 760
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_pm_call_upd
boolean visible = false
integer x = 123
integer y = 1444
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;int idx, subIdx, foundPos
//idx = 1
//lb_1.Reset()
//do while idx <= UpperBound(pmSubtaskLoad)
//	if pmSubtaskLoad[idx] = true then
//		subIdx = 1
//		do while pos(pmSubtask[idx],',',subIdx)>0
//			foundPos=pos(pmSubtask[idx],', ',subIdx)
//			lb_1.AddItem(mid(pmSubtask[idx],subIdx, foundPos - subIdx))
//			subIdx=foundPos+2
//		loop
//		lb_1.AddItem(mid(pmSubtask[idx],subIdx))
//	else
//		if idx > 1 then
//			wf_add_entire_pm_task(integer(sRoom),integer(Mid(dwc_problem.GetItemString(idx,1), 3 )))
//		end if			
//	end if
//	idx++
//loop


wf_collect_pm_tasks()


end event

type p_3 from picture within w_pm_call_upd
integer x = 2898
integer y = 64
integer width = 160
integer height = 136
string picturename = "rapid_response_icon_48.bmp"
boolean focusrectangle = false
end type

type p_2 from picture within w_pm_call_upd
integer x = 59
integer y = 48
integer width = 576
integer height = 156
boolean originalsize = true
string picturename = "PM Entry Screen.BMP"
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_pm_call_upd
integer x = 1906
integer y = 1492
integer width = 274
integer height = 112
integer taborder = 50
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

event clicked;exitByExitButton = true
parent.TriggerEvent("close")
end event

type pb_reset from picturebutton within w_pm_call_upd
integer x = 1563
integer y = 1492
integer width = 274
integer height = 112
integer taborder = 40
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

event clicked;
parent.TriggerEvent("ue_add")

end event

type pb_save from picturebutton within w_pm_call_upd
integer x = 1225
integer y = 1492
integer width = 274
integer height = 112
integer taborder = 30
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

if sRoom = "" then
	MessageBox("Required","Room is required. Try again !")
	return
end if

if sCallerCategory = "" then
	MessageBox("Required","Category is required. Try again !")
	return
end if

if sCaller = "" and sGuest = "" then
	MessageBox("Required","Caller/Guest is required. Try again !")
	return
end if

if sProblem = "" then
	MessageBox("Required","Task is required. Try again !")
	return
end if

if pmPreset = 0 then
	wf_reg_repeater()
else
	if wf_pm_repeater() = false then 
		MessageBox("Error","Save Failed! Recurring info incomplete!")
		return
	end if
	wf_collect_pm_tasks()
	wf_insert_pm_preset_call()
	commit;
end if

parent.TriggerEvent("ue_add")
end event

type p_1 from picture within w_pm_call_upd
integer x = 1627
integer y = 664
integer width = 82
integer height = 68
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;if pmPreset > 0 then 
	wf_popup_pm_repeater()
else
	wf_popup_reg_repeater()
end if
end event

type dw_1 from datawindow within w_pm_call_upd
event keydown pbm_dwnkey
integer x = 27
integer y = 252
integer width = 3346
integer height = 1176
integer taborder = 10
string title = "none"
string dataobject = "d_pm_calls_upd"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keydown;if KeyDown(KeyTab!) then
	if this.GetColumnName() = 'problem_problem_number' then
		usedMouse = false
		uo_subproblem.uo_ddlb_1.setfocus()
	end if
end if
end event

event clicked;CHOOSE CASE dwo.Name
	CASE "caller_category"
		usedMouse = true
	CASE "guest"
		usedMouse = true
	CASE "problem_problem_number"
		usedMouse = true

	CASE "closed_bydept"
		usedMouse = true
	CASE "repairman"
		usedMouse = true
	CASE ELSE
		usedMouse = false
END CHOOSE

end event

event itemchanged;string CurrentColumn, ColumnContent

CurrentColumn = this.GetColumnName()
ColumnContent = data


CHOOSE CASE Upper(CurrentColumn) 
	
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
		pmPreset =wf_check_pm_preset(sRoom)
		wf_dddw_set_filter("PROBLEM",sRoom)
		if pmPreset > 0 then
			if sRecurInd = 'Y' then sRecurInd = 'N' // force to pop-up repeater screen when enter PM Preset calls
			this.SetItem(row,"problem_problem_number","PM")
			sProblem = "[All] PM-Preset"
		else
			this.SetItem(row,"problem_problem_number","")
		end if
		if tabPressInRoom then
		else
			this.SetColumn("caller_category")
		end if
		tabPressInRoom = false
		
	CASE	"ROOM_DSC"
		wf_process_room_change('room_dsc')
		sRoomDsc = ColumnContent
		sRoom =  this.GetItemString(row,"room")
		pmPreset =wf_check_pm_preset(sRoom)
		wf_dddw_set_filter("PROBLEM",sRoom)
		if pmPreset > 0 then
			this.SetItem(row,"problem_problem_number","PM")
			sProblem = "[All] PM-Preset"
		else
			this.SetItem(row,"problem_problem_number","")
		end if
		
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
		if pmPreset = 0 then
			this.SetItem(row,"SUBPROBLEM","")
		end if
			
	CASE	"PROBLEM_PROBLEM_NUMBER"

			sProblemNumber = ColumnContent
			sSubProblemNumber = ""
			sSubProblem = ""
			if pmPreset = 0 then
				uo_subproblem.cDbWhere="problem_number='"+sProblemNumber+"'"
				uo_subproblem.load_lb = 'subtask'
				uo_subproblem.cTable2Use		 = "subproblem"
				uo_subproblem.cColumn2Retrieve =  "subproblem_desc+'~t~t~t~t~t ('+subproblem_number+')'"
				uo_subproblem.ib_loaded=false
				wf_validate_problem(sProblemNumber)
			else
				uo_subproblem.cColumn2Retrieve =&
				"data=fmt_subtask_desc (subproblem.problem_number,subproblem.subproblem_number)+'~t  '+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'"
//					"data=rtrim(subproblem.subproblem_desc)+space(25-datalength(rtrim(subproblem.subproblem_desc)))+ ' ~t '+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'"				
				if sProblemNumber='PM' then
//					uo_subproblem.cColumn2Retrieve =&
//					"data=rtrim(subproblem.subproblem_desc)+ ' ~t'+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+'),period'"

					uo_subproblem.cDbWhere="equipment_id="+sRoom+&
						" and  vzt_equipment_task_map.problem_number=subproblem.problem_number  "+&
						"and vzt_equipment_task_map.subproblem_number=subproblem.subproblem_number order by convert(int,substring(data,charindex('-day', data) - 3,3)) "
				else
//					uo_subproblem.cColumn2Retrieve =&
//					"data=rtrim(subproblem.subproblem_desc)+ ' ~t'+convert(char(3),period)+'-day' +'~t~t~t ('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+'),period'"
////					"rtrim(subproblem.subproblem_desc)+ '~t~t~t('+vzt_equipment_task_map.problem_number+'/'+vzt_equipment_task_map.subproblem_number+')'"

					uo_subproblem.cDbWhere="equipment_id="+sRoom+" and vzt_equipment_task_map.period="+mid(sProblemNumber,3) +&
						" and  vzt_equipment_task_map.problem_number=subproblem.problem_number  "+&
						"and vzt_equipment_task_map.subproblem_number=subproblem.subproblem_number order by 1"
				end if
				uo_subproblem.load_lb = 'subtask'
				uo_subproblem.cTable2Use="vzt_equipment_task_map, subproblem"
				uo_subproblem.ib_loaded=false	
				if UpperBound(pmSubtaskLoad) > 0 then				
					if pmSubtaskLoad[dwc_problem.GetRow()]=false then
						uo_subproblem.uo_ddlb_1.text='[All]'
					else
						uo_subproblem.uo_ddlb_1.text='[Selected]'
					end if
				end if
//				MessageBox("dwc_problem",string(dwc_problem.GetRow()))
			end if
			if usedMouse then
				uo_subproblem.uo_ddlb_1.setfocus()
			end if


//		this.SetItem(row,"SUBPROBLEM","")

//		wf_validate_problem(sProblemNumber)
			

//	CASE	"SUBPROBLEM"
//		sSubProblemNumber = wf_find_subproblem_number()
//		wf_validate_subproblem(sSubProblemNumber)
//		this.PostEvent("ue_hide_dddw")
		
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
			sClosedBydept=sDept
			this.SetItem(row,"closed_bydept",sDept)			
		end if
		
	CASE "PROBLEM_DEFINITION"
		sProblemDefinition = ColumnContent
		
	CASE "RESOLUTION"
		sResolution = ColumnContent
		
		
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
//		wf_set_dddw_allow_edit(dw_1.GetItemString(dw_1.GetRow(),"CALLER_CATEGORY"), currentColumn)
	CASE "SUBPROBLEM"
		columnContent = dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_PROBLEM_NUMBER")
		if IsNull(columnContent) then
			return
		end if
//		wf_dddw_set_filter(currentColumn,dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_PROBLEM_NUMBER"))
//		wf_set_dddw_allow_edit(dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_PROBLEM_NUMBER"), currentColumn)		
	CASE "REPAIRMAN"
		columnContent = dw_1.GetItemString(dw_1.GetRow(),"CLOSED_BYDEPT")
		if IsNull(columnContent) then
			return
		end if
		wf_dddw_set_filter(currentColumn,dw_1.GetItemString(dw_1.GetRow(),"CLOSED_BYDEPT"))
//		wf_set_dddw_allow_edit(dw_1.GetItemString(dw_1.GetRow(),"CLOSED_BYDEPT"), currentColumn)	
END CHOOSE
end event

type uo_subproblem from u_multi_select_pm within w_pm_call_upd
event keydown pbm_dwnkey
integer x = 2130
integer y = 768
integer width = 1175
integer height = 104
integer taborder = 20
boolean bringtotop = true
borderstyle borderstyle = styleshadowbox!
end type

on uo_subproblem.destroy
call u_multi_select_pm::destroy
end on

event size_closed;call super::size_closed;uo_subproblem.BringToTop=true
//MessageBox("uo_subproblem.is_selected",uo_subproblem.is_selected)
//if uo_subproblem.is_selected<>'' then
if pmTaskIndex > 0 then
	if uo_subproblem.is_selected <> '' then
		pmSubtask[dwc_problem.GetRow()] = uo_subproblem.is_selected
		pmSubtaskLoad[dwc_problem.GetRow()] = true
		if dwc_problem.GetRow() > 1 then
//			pmSubtask[1] 
		end if
	else
		pmSubtask[dwc_problem.GetRow()]  = ''
		pmSubtaskLoad[dwc_problem.GetRow()] = false
//		pmSubtask[dwc_problem.GetRow()]='[All]'
	end if
end if
dw_1.SetFocus()
dw_1.SetColumn('CLOSED_BYDEPT')

end event

event size_open;call super::size_open;if UpperBound(pmSubtaskLoad) > 0 then				
	if pmSubtaskLoad[dwc_problem.GetRow()]=true then
		uo_subproblem.uf_pop_is_selected(pmSubtask[dwc_problem.GetRow()])
		uo_subproblem.uf_select_items()
//		uo_subproblem.uf_show_uo_lb_1(true)
	end if
end if
end event

event other;call super::other;if KeyDown(KeyTab!) then
	usedMouse = false
end if
end event

