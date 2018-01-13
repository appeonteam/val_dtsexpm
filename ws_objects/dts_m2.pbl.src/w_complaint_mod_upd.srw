$PBExportHeader$w_complaint_mod_upd.srw
forward
global type w_complaint_mod_upd from window
end type
type p_2 from picture within w_complaint_mod_upd
end type
type st_date from statictext within w_complaint_mod_upd
end type
type st_1 from statictext within w_complaint_mod_upd
end type
type pb_exit from picturebutton within w_complaint_mod_upd
end type
type pb_reset from picturebutton within w_complaint_mod_upd
end type
type pb_save from picturebutton within w_complaint_mod_upd
end type
type pb_new from picturebutton within w_complaint_mod_upd
end type
type p_1 from picture within w_complaint_mod_upd
end type
type dw_1 from datawindow within w_complaint_mod_upd
end type
type st_guest_info from statictext within w_complaint_mod_upd
end type
end forward

global type w_complaint_mod_upd from window
integer width = 3186
integer height = 2336
boolean titlebar = true
string title = "Complaint/MOD Update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "RUN02.ICO"
string pointer = "Arrow!"
p_2 p_2
st_date st_date
st_1 st_1
pb_exit pb_exit
pb_reset pb_reset
pb_save pb_save
pb_new pb_new
p_1 p_1
dw_1 dw_1
st_guest_info st_guest_info
end type
global w_complaint_mod_upd w_complaint_mod_upd

type variables
DataWindowChild dwc_subtask
DataWindowChild dwc_subproblem
DataWindowChild dwc_problem
DataWindowChild dwc_room
DataWindowChild dwc_room_dsc
DataWindowChild dwc_repairman
DataWindowChild dwc_guest

//--- data variables ----
string sCallNumber
string sCatAbbr
string sCategory
string sRoomNo
string sRoomDsc
string sTaskNo
string sSubtaskNo
string sGuest
string sStatCode
string sProblemNumber
string sSubproblemNumber
string sClosedBydept
string sRepairman
string sTaskDef
string sResolution
string sProblemDsc
string sSubproblemDsc
string sOpenBy
string sOpenByDept=''
string sAuthTakeOffTimer
string sDefaultStatus 
string sPreOpenable
string sShift
string sPaging
string sPreOpened
string sAutoAssignInd
string sDeptAssign
string sZone

datetime dtTimeOpen
datetime dtTimerStart

integer iTimer1StartMin
integer iTimer2StartMin   
integer iTimer3StartMin
integer iTimerLevel
integer iPagingMin

double dModNumber
double dTimer1Reps   
double dTimer2Reps     
double dTimer3Reps

//--- view only variables ---
int view_id   
string view_category   
string view_guest_mod_name  
string view_room_no   
datetime view_time_open   
string view_task_no   
string view_subtask_no   
string view_task_def   
string view_resolution  
string view_handled_by   
string view_dept   
string view_lnk_doc   
string view_lnk_call_number   
datetime view_upd_ts   
integer view_shift  

string view_stat_code
string view_room_dsc
datetime view_timer_start
string view_problem_number
string view_subproblem_number
string view_closed_bydept
string view_repairman

//--- working variables ---
boolean tabPressInRoom
string complaint_task_no
string mod_task_no
datetime after15Mins
boolean preopenSet
boolean usedMouse
boolean shiftDataLoaded=false
boolean dataUpdated
integer in_id=0
string foundGuest
string guestInDate
string guestOutdate
string dateFmtStr

//--- shift related variables ---
time weekday_shift_start[]
time weekday_shift_end[]
time sat_shift_start[]
time sat_shift_end[]
time sun_shift_start[]
time sun_shift_end[]
int max_shift

end variables

forward prototypes
public subroutine wf_process_room_change (string chgorigin)
public subroutine wf_allow_dddw_edit (datawindow dwin, string dwincol, integer dddwalloweditsw)
public subroutine wf_set_dddw_allow_edit (string controlcolumn, string setcolumn)
public function boolean wf_dddw_set_filter (string filterfor, string filtercriteria)
public function boolean wf_set_complaint_mod_task ()
public function string wf_get_status (string in_task, string in_subtask)
public function boolean wf_get_task_info ()
public function datetime wf_set_time_after_x_mins (integer timeaftermins)
public function boolean wf_insert_call ()
public function boolean wf_load_shift_data ()
public function integer wf_get_shift_number (integer dayofweek, datetime shiftdatetime)
public function boolean wf_insert_pageassignment ()
public function boolean wf_load_complaint_mod ()
public function boolean wf_set_data ()
public function date wf_str_d_to_d (string dstr, string fmtstr)
public subroutine wf_init_fields (string initcategory)
public function boolean wf_guest_name_by_room (string in_room, date call_in_date, ref string guest_name, ref string check_in_date, ref string check_out_date)
end prototypes

public subroutine wf_process_room_change (string chgorigin);string roomNum, roomDsc

if chgOrigin = 'room_no' then
	roomDsc = dwc_room.GetItemString(dwc_room.GetRow(),"area_name")
	dw_1.SetItem(dw_1.GetRow(),"room_dsc",roomDsc)
	sZone = dwc_room.GetItemString(dwc_room.GetRow(),"unit_type")
else
	roomNum = dwc_room_dsc.GetItemString(dwc_room_dsc.GetRow(),"area_number")
	dw_1.SetItem(dw_1.GetRow(),"room_no",roomNum)
	sZone = dwc_room.GetItemString(dwc_room.GetRow(),"unit_type")
end if
end subroutine

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

if filterFor = "SUBTASK_NO" then
	dw_1.GetChild("subtask_no",dwc_subtask)
	dwc_subtask.SetTransObject(sqlca)
	dwc_subtask.retrieve()
	ret = dwc_subtask.SetFilter( "problem_number = '" + filterCriteria + "'" )
	if ret < 0 then
		MessageBox( "Error!", "Couldn't SetFilter complaint properly." )
		return false
	end if
	ret = dwc_subtask.Filter()
	if ret < 0 then
		MessageBox( "Error!", "Couldn't Filter complaint pick-list properly." )
		return false
	end if
end if


if filterFor = "SUBPROBLEM_NUMBER" then
	dw_1.GetChild("subproblem",dwc_subproblem)
	dwc_subproblem.SetTransObject(sqlca)
	dwc_subproblem.retrieve()
	ret = dwc_subproblem.SetFilter( "problem_number = '" + filterCriteria + "'" )
	if ret < 0 then
		MessageBox( "Error!", "Couldn't SetFilter recovery task properly." )
		return false
	end if
	ret = dwc_subproblem.Filter()
	if ret < 0 then
		MessageBox( "Error!", "Couldn't Filter recovery task pick-list properly." )
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

public function boolean wf_set_complaint_mod_task ();select	problem_number
into		:complaint_task_no
from		problem
where		problem_desc = 'Complaint';
if sqlca.sqlcode <> 0 then
	MessageBox("Error","Can't find task: Complaint!!! "+&
		"Please use category update to add it!")
	return false
end if

select	problem_number
into		:mod_task_no
from		problem
where		problem_desc = 'MOD';
if sqlca.sqlcode <> 0 then
	MessageBox("Error","Can't find task: MOD!!! "+&
		"Please use category update to add it!")
	return false
end if

return true
end function

public function string wf_get_status (string in_task, string in_subtask);string statcode

select 	default_status into :statcode
from 		subproblem 
where 	problem_number = :in_task
and		subproblem_number = :in_subtask;	

if sqlca.sqlcode <> 0 then
	return ''
else
	return statcode
end if
end function

public function boolean wf_get_task_info (); 
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
		  "subproblem"."timer3_reps",
		  "subproblem"."auto_assign_ind",
		  "subproblem"."dept_assign"
			
   INTO :sSubproblemDsc,   
        :iTimer1StartMin,   
        :iTimer2StartMin,   
        :dTimer1Reps,   
        :dTimer2Reps,   
        :sAuthTakeOffTimer,   
        :sDefaultStatus,   
        :sPreOpenable,   
        :iTimerLevel,
		  :iPagingMin,
		  :iTimer3StartMin, 
		  :dTimer3Reps,
		  :sAutoAssignInd,
		  :sDeptAssign
    FROM "subproblem"  
   WHERE "subproblem"."subproblem_number" = :sSubproblemNumber   
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
	
return true
end function

public function datetime wf_set_time_after_x_mins (integer timeaftermins);datetime timeAfterXMins
integer xSec
xSec = timeAfterMins * 60
if SecondsAfter(now(), 23:59:00) < (xSec - 60) then  //leap into next day
	timeAfterXMins = datetime(RelativeDate(today(),1), &
								  RelativeTime(00:00:00, xSec - (SecondsAfter(now(), 23:59:00) + 60)))
else
	timeAfterXMins = datetime(today(), RelativeTime(now(), xSec))
end if

return timeAfterXMins
end function

public function boolean wf_insert_call ();string ls_error, ls_code
datetime dt_now

dt_now = datetime(today(),now())

if f_chk_duplicate_call(1,'insert',sRoomNo,sProblemNumber,sSubproblemNumber) = false then
	int ans	
	ans = MessageBox("Duplicate","The call is a duplicate! Please enter Yes to save it anyway or No to change it!", &
			question!, YesNo!, 2)
	if ans = 2 then
		return false
	end if
end if

sCallNumber = string(f_new_call_number())


if sStatCode = '00' then
	sPreOpened = 'Y'
	sPaging = 'P'
end if

if integer(sStatCode) < 10 then
	if not wf_insert_pageassignment() then
		ROLLBACK;
		MessageBox("Error","Pageassignment Insert Error!!")
		return false
	end if
end if


if integer(sStatCode) < 10 then 
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
				  "recur_id", 
				  "amount",
				  "timer3_start_min",
				  "timer3_reps")    
	  VALUES ( :sCallNumber,   
   	        :dt_now,   
      	     :sStatCode,   
         	  :sRoomNo,   
	           :sGuest,   
   	        '',   
      	     :sProblemDsc,   
         	  :sSubProblemDsc,   
	           :sTaskDef,   
   	        '',   
      	     :sOpenBy,   
         	  :sShift,   
	           :sResolution,   
   	        :sRepairman,   
      	     null,   
         	  '',   
	           :sClosedBydept,   
   	        '',   
      	     :dtTimerStart,   
         	  :sCategory,   
	           :sProblemNumber,   
   	        :sSubproblemNumber,   
      	     :iTimer1StartMin,   
	        	  :iTimer2StartMin,   
	           :dTimer1Reps,   
   	        :dTimer2Reps,   
      	     :sAuthTakeOffTimer,   
         	  :sDefaultStatus,   
	           :sPreOpenable,   
   	        :sPreOpened,   
      	     :iTimerLevel,   
         	  :sRoomDsc,   
	           :sStatCode,
				  :spaging,
				  NULL,
				  'N',
				  0, 
				  0, 
				  :iTimer3StartMin,
				  :dTimer3Reps )  ;
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
				  "recur_ind",
				  "recur_id", 
				  "amount",
				  "timer3_start_min",
				  "timer3_reps")    
	  VALUES ( :sCallNumber,   
   	        :dt_now,   
      	     :sStatCode,   
         	  :sRoomNo,   
	           :sGuest,   
   	        '',   
      	     :sProblemDsc,   
         	  :sSubProblemDsc,   
	           :sTaskDef,   
   	        '',   
      	     :sOpenBy,   
         	  :sShift,   
	           :sResolution,   
   	        :sRepairman,   
      	     null,   
         	  '',   
	           :sClosedBydept,   
   	        '',   
      	     :dtTimerStart,   
         	  :sCategory,   
	           :sProblemNumber,   
   	        :sSubproblemNumber,   
      	     :iTimer1StartMin,   
	        	  :iTimer2StartMin,   
	           :dTimer1Reps,   
   	        :dTimer2Reps,   
      	     :sAuthTakeOffTimer,   
         	  :sDefaultStatus,   
	           :sPreOpenable,   
   	        :sPreOpened,   
      	     :iTimerLevel,   
         	  :sRoomDsc,   
	           :sStatCode,
				  :spaging,
				  NULL,
				  'N',
				  0, 
				  0, 
				  :iTimer3StartMin,
				  :dTimer3Reps )  ;	
end if
if sqlca.sqlcode <> 0 then
		ls_error =  sqlca.SQLerrtext
		ls_code	=  string( sqlca.SQLCode) 
		ROLLBACK;
		MessageBox('Database Insert Error', 'Failed to create new call record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
		return false
end if


dModNumber = f_new_mod_number()

INSERT INTO complaint_mod  
         ( id,   
           category,   
           guest_mod_name,   
           room_no,   
           time_open,   
           task_no,   
           subtask_no,   
           task_def,   
           resolution,   
           handled_by,   
           dept,   
           lnk_doc,   
           lnk_call_number,
			  shift)  
  VALUES ( :dModNumber,   
           :sCategory,   
           :sGuest,   
			  :sRoomNo,
			  getdate(),
           :sTaskNo,   
           :sSubtaskNo,   
           :sTaskDef,   
           :sResolution,   
           :sOpenBy,      
           null,   
           null,   
           :sCallNumber,
			  :sShift)  ;

if sqlca.sqlcode <> 0 then
		ls_error =  sqlca.SQLerrtext
		ls_code	=  string( sqlca.SQLCode) 
		ROLLBACK;
		MessageBox('Database Insert Error', 'Failed to create Complaint/Mod record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
		return false
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
   FETCH shift into :s_shift, :t_shift_start, :s_weekday, :s_sat, :s_sun;
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

public function integer wf_get_shift_number (integer dayofweek, datetime shiftdatetime);boolean weekday, sat, sun, shift_not_found
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

public function boolean wf_insert_pageassignment ();int res
string s_empName, s_empId, s_pagerId, s_capeCode
IF sClosedBydept <> '' and sRepairman <> '' then
	res = f_get_pager(sClosedByDept,sRepairman,s_empId,s_pagerId)
	if res = 0 then
		s_pageassignment ass
		ass.assignment_id = string(today(),"yymmddhhmmss")+string(rand(99))
		ass.assignment_cd = 'T'
		ass.dept_assigned = sClosedByDept
		ass.emp_id = s_empId
		ass.emp_name = sRepairman
		ass.pager_id = s_pagerId
		ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
		SetNull(ass.time_completed)
		ass.call_number = sCallNumber 
		ass.page_sent = 'N'
		if not f_insert_assignment(ass) then 
			return false
		end if
		spaging   = '0'
	else
		if res = 1 then
			MessageBox("Warning","The repairman's pager is in-active!")
		end if
	end if
ELSE
	if sAutoAssignInd = 'Y' then
		if sPreOpened = 'Y' then
			if sClosedByDept = '' then
				sClosedBydept = sDeptAssign // populate auto assign dept for pending screen filter
			end if
			return true
		end if
		if not f_find_pager_id (sDeptAssign, s_empName, s_empId, s_pagerId, s_capeCode, sRoomNo,dtTimerStart) then
			ass.assignment_id = string(today(),"yymmddhhmmss")+string(rand(99))
	   	ass.assignment_cd = 'N'
 	   	ass.dept_assigned = sDeptAssign
	   	ass.emp_id = '8888888888'
	   	ass.emp_name = 'NONE'
      	ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	   	SetNull(ass.time_completed)
	   	ass.call_number = sCallNumber 
	   	ass.page_sent = 'N'
			ass.special_msg = 'Auto assignment call # ' + sCallnumber + &
		 	' has failed to allocate a pager!'
			ass.pager_id = f_find_supervisor_pager(sDeptAssign,sRoomNo,dtTimerStart) 
   		spaging = '0'
		else
			ass.assignment_id = string(today(),"yymmddhhmmss")+string(rand(99))
			ass.assignment_cd = 'T'
			ass.dept_assigned = sDeptAssign
			ass.emp_id = s_empId
			ass.emp_name = s_empName
			ass.pager_id = s_pagerId
			ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
			SetNull(ass.time_completed)
			ass.call_number = sCallNumber 
			ass.page_sent = 'N'
		end if
		if not f_insert_assignment(ass) then
			return false
		end if
		sClosedBydept = sDeptAssign
		srepairman = s_empName  
		spaging   = '0'
	else
		sAutoAssignInd = ''
	   spaging = ''
	end if		
END IF

return true
end function

public function boolean wf_load_complaint_mod ();SELECT 	complaint_mod.id,   
         complaint_mod.category,   
         complaint_mod.guest_mod_name,   
         complaint_mod.room_no,   
         complaint_mod.time_open,   
         complaint_mod.task_no,   
         complaint_mod.subtask_no,   
         complaint_mod.task_def,   
         complaint_mod.resolution,   
         complaint_mod.handled_by,   
         complaint_mod.dept,   
         complaint_mod.lnk_doc,   
         complaint_mod.lnk_call_number,   
         complaint_mod.upd_ts,   
         complaint_mod.shift 
 	INTO 	:view_id,   
         :view_category,   
         :view_guest_mod_name,   
         :view_room_no,   
         :view_time_open,   
         :view_task_no,   
         :view_subtask_no,   
         :view_task_def,   
         :view_resolution,   
         :view_handled_by,   
         :view_dept,   
         :view_lnk_doc,   
         :view_lnk_call_number,   
         :view_upd_ts,   
         :view_shift 		
   FROM  complaint_mod  
	WHERE complaint_mod.id = :in_id;
	
if sqlca.sqlcode <> 0 then
	return false
end if

select 	closedcalls.stat_code,
			closedcalls.room_dsc,
			closedcalls.timer_start,
			closedcalls.problem_number,
			closedcalls.subproblem_number,
			closedcalls.closed_bydept,
			closedcalls.repairman
into		:view_stat_code,
			:view_room_dsc,
			:view_timer_start,
			:view_problem_number,
			:view_subproblem_number,
			:view_closed_bydept,
			:view_repairman
from 		closedcalls
where		call_number = :view_lnk_call_number;

if sqlca.sqlcode = 100 then // not found in closedcalls, try timer/pending
	select 	timercalls.stat_code,
				timercalls.room_dsc,
				timercalls.timer_start,
				timercalls.problem_number,
				timercalls.subproblem_number,
				timercalls.closed_bydept,
				timercalls.repairman
	into		:view_stat_code,
				:view_room_dsc,
				:view_timer_start,
				:view_problem_number,
				:view_subproblem_number,
				:view_closed_bydept,
				:view_repairman
	from 		timercalls
	where		call_number = :view_lnk_call_number;
	
	if sqlca.sqlcode = 100 then
		select 	pendingcalls.stat_code,
					pendingcalls.room_dsc,
					pendingcalls.timer_start,
					pendingcalls.problem_number,
					pendingcalls.subproblem_number,
					pendingcalls.closed_bydept,
					pendingcalls.repairman
		into		:view_stat_code,
					:view_room_dsc,
					:view_timer_start,
					:view_problem_number,
					:view_subproblem_number,
					:view_closed_bydept,
					:view_repairman
		from 		pendingcalls
		where		call_number = :view_lnk_call_number;	
		if sqlca.sqlcode <> 0 then
			return false
		else
			return true
		end if
	else
		return true
	end if
else
	return true
end if

	
end function

public function boolean wf_set_data ();dw_1.DeleteRow(0)
dw_1.InsertRow(0)
wf_init_fields(view_category)

dw_1.SetItem(1,'time_open',view_time_open)
dw_1.SetItem(1,'category',view_category)
dw_1.SetItem(1,'room_no',view_room_no)
dw_1.SetItem(1,'room_dsc',view_room_dsc)
dw_1.SetItem(1,'guest_mod_name',view_guest_mod_name)
dw_1.SetItem(1,'task_no',view_task_no)
dw_1.SetItem(1,'subtask_no',view_subtask_no)
dw_1.SetItem(1,'task_def',view_task_def)
dw_1.SetItem(1,'resolution',view_resolution)

dw_1.SetItem(1,'stat_code',view_stat_code)
dw_1.SetItem(1,'timer_start',view_timer_start)
dw_1.SetItem(1,'problem_number',view_problem_number)
wf_dddw_set_filter("subproblem_number",view_problem_number)
dw_1.SetItem(1,'subproblem_number',view_subproblem_number)
dw_1.SetItem(1,'closed_bydept',view_closed_bydept)
dw_1.SetItem(1,'repairman',view_repairman)

string chkGuest, chkInDt, chkOutDt
if view_category = 'G' then
	if wf_guest_name_by_room (view_room_no,date(view_time_open),chkGuest,&
				chkInDt,chkOutDt ) then
		if chkGuest = view_guest_mod_name then
			st_guest_info.text='(check-in '+chkInDt+' check-out '+chkOutDt+')'
		end if
	end if
end if
return true
end function

public function date wf_str_d_to_d (string dstr, string fmtstr);date ret_d
int yyyy
Choose Case fmtstr
			Case "mm/dd/yy"
				ret_d = date(dStr)
			Case "mm-dd-yyyy"
				ret_d = date(dStr)
			Case "mm.dd.yyyy"
				ret_d = date(dStr)
			Case "mm/dd/yyyy"
				ret_d = date(dStr)
			Case "mm-dd-yyyy"
				ret_d = date(dStr)
			Case "mm.dd.yyyy"
				ret_d = date(dStr)
	
	
			Case "dd/mm/yy" 
				if integer(mid(dStr,7,2)) < 80 then
					yyyy=integer(mid(dStr,7,2))+2000
				else
					yyyy=integer(mid(dStr,7,2))+1900
				end if		
				ret_d = date(yyyy,integer(mid(dStr,4,2)),integer(mid(dStr,1,2)))
			Case "dd.mm.yy" 
				if integer(mid(dStr,7,2)) < 80 then
					yyyy=integer(mid(dStr,7,2))+2000
				else
					yyyy=integer(mid(dStr,7,2))+1900
				end if		
				ret_d = date(yyyy,integer(mid(dStr,4,2)),integer(mid(dStr,1,2)))
			Case "dd-mm-yy" 
				if integer(mid(dStr,7,2)) < 80 then
					yyyy=integer(mid(dStr,7,2))+2000
				else
					yyyy=integer(mid(dStr,7,2))+1900
				end if		
				ret_d = date(yyyy,integer(mid(dStr,4,2)),integer(mid(dStr,1,2)))
			Case "dd/mm/yyyy" 
				ret_d = date(integer(mid(dStr,7,4)),integer(mid(dStr,4,2)),integer(mid(dStr,1,2)))
			Case "dd.mm.yyyy" 	
				ret_d = date(integer(mid(dStr,7,4)),integer(mid(dStr,4,2)),integer(mid(dStr,1,2)))
			Case "dd-mm-yyyy" 
				ret_d = date(integer(mid(dStr,7,4)),integer(mid(dStr,4,2)),integer(mid(dStr,1,2)))			

	
			Case "yy/mm/dd" 
				if integer(mid(dStr,1,2)) < 80 then
					yyyy=integer(mid(dStr,1,2))+2000
				else
					yyyy=integer(mid(dStr,1,2))+1900
				end if
				ret_d = date(yyyy,integer(mid(dStr,4,2)),integer(mid(dStr,7,2)))
			Case "yy-mm-dd" 
				if integer(mid(dStr,1,2)) < 80 then
					yyyy=integer(mid(dStr,1,2))+2000
				else
					yyyy=integer(mid(dStr,1,2))+1900
				end if
				ret_d = date(yyyy,integer(mid(dStr,4,2)),integer(mid(dStr,7,2)))
			Case "yy.mm.dd" 
				if integer(mid(dStr,1,2)) < 80 then
					yyyy=integer(mid(dStr,1,2))+2000
				else
					yyyy=integer(mid(dStr,1,2))+1900
				end if
				ret_d = date(yyyy,integer(mid(dStr,4,2)),integer(mid(dStr,7,2)))
			Case "yyyy/mm/dd"
				ret_d = date(dStr)
			Case "yyyy-mm-dd"
				ret_d = date(dStr)
			Case "yyyy.mm.dd"
				ret_d = date(dStr)
			Case Else
				messagebox("Date Format Error",dStr)
End Choose

return ret_d
end function

public subroutine wf_init_fields (string initcategory);
dw_1.SetItem(1,'category',initCategory)

dw_1.SetItem(1,'task_no',complaint_task_no)
dw_1.SetItem(1,'time_open',today())
dw_1.SetItem(1,'stat_code','01')
dw_1.SetItem(1,'timer_start',wf_set_time_after_x_mins(15))

wf_allow_dddw_edit(dw_1,"guest_mod_name",1)
wf_dddw_set_filter("subtask_no",complaint_task_no)

st_guest_info.text=''

dataUpdated = false

preopenSet = false



end subroutine

public function boolean wf_guest_name_by_room (string in_room, date call_in_date, ref string guest_name, ref string check_in_date, ref string check_out_date);string guestNm, inDate, outDate
date chkOutDt, chkInDt

guest_name = ''
check_in_date = ''
check_out_date = ''

select 	guest_fname+' '+guest_lname,
			date_from, 
			date_to
into		:guestNm,
			:inDate,
			:outDate
from		room_registry
where		room_code = :in_room;

if sqlca.sqlcode <> 0 then
	return false
end if

chkOutDt = wf_str_d_to_d (outDate, dateFmtStr)
chkInDt = wf_str_d_to_d (inDate, dateFmtStr)

if chkOUtDt < call_in_date or isnull(chkOutDt) then
	return false
end if

guest_name = guestNm
check_in_date = f_dt_to_d_str(datetime(chkInDt))
check_out_date = f_dt_to_d_str(datetime(chkOutDt))

							
return true
	
end function

event open;dw_1.SetTransObject(sqlca)
dw_1.InsertRow(0)
sOpenBy = cPassUserName
dateFmtStr = ProfileString( cINIPath +	cINIFile, "Intl", &
							"RmRegistryDateFmt", "mm/dd/yy" )
st_date.text = string(today(),cDateFormat)

if dw_1.GetChild("room_no",dwc_room) < 0 then
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

if dw_1.GetChild("subtask_no",dwc_subtask) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_subproblem Error")
else
	dwc_subtask.SetTransObject(SQLCA)
end if


if dw_1.GetChild("problem_number",dwc_problem) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_problem Error")
else
	dwc_problem.SetTransObject(SQLCA)
end if

if dw_1.GetChild("subproblem_number",dwc_subproblem) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_subproblem Error")
else
	dwc_subproblem.SetTransObject(SQLCA)
	dwc_subproblem.SetSort("subproblem_desc A")
	dwc_subproblem.Sort() 
end if

if dw_1.GetChild("repairman",dwc_repairman) < 0 then
	MessageBox("Error","GetChild DataWindow dwc_repairman Error")
else
	dwc_repairman.SetTransObject(SQLCA)
end if

//if dw_1.GetChild("guest",dwc_guest) < 0 then
//	MessageBox("Error","GetChild DataWindow dwc_guest Error")
//else
//	dwc_guest.SetTransObject(SQLCA)
//end if
//


if not wf_set_complaint_mod_task() then
	return
end if

wf_init_fields('G')

dw_1.SetColumn("room_no")

//MessageBox("parm",Message.StringParm	)
in_id = integer(Message.StringParm)


end event

on w_complaint_mod_upd.create
this.p_2=create p_2
this.st_date=create st_date
this.st_1=create st_1
this.pb_exit=create pb_exit
this.pb_reset=create pb_reset
this.pb_save=create pb_save
this.pb_new=create pb_new
this.p_1=create p_1
this.dw_1=create dw_1
this.st_guest_info=create st_guest_info
this.Control[]={this.p_2,&
this.st_date,&
this.st_1,&
this.pb_exit,&
this.pb_reset,&
this.pb_save,&
this.pb_new,&
this.p_1,&
this.dw_1,&
this.st_guest_info}
end on

on w_complaint_mod_upd.destroy
destroy(this.p_2)
destroy(this.st_date)
destroy(this.st_1)
destroy(this.pb_exit)
destroy(this.pb_reset)
destroy(this.pb_save)
destroy(this.pb_new)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.st_guest_info)
end on

event close;if dataUpdated and pb_save.enabled then
	long res
	res = MessageBox("Data Changed","Do you want to save the changes?",&
		Question!,YesNo!,1)
	if res = 1 then
		pb_save.TriggerEvent("cliecked")
	end if
end if
end event

event activate;
//messagebox('in_id',string(in_id))
if in_id <> 0 then
	pb_save.enabled = false
	pb_reset.enabled = false
else
	pb_save.enabled = true
	pb_reset.enabled = true
end if

if in_id <> 0 then
	if wf_load_complaint_mod() then
		wf_set_data()
	end if
end if
end event

type p_2 from picture within w_complaint_mod_upd
integer x = 96
integer y = 64
integer width = 201
integer height = 180
string picturename = "Mod notepad.bmp"
boolean focusrectangle = false
end type

type st_date from statictext within w_complaint_mod_upd
integer x = 2619
integer y = 96
integer width = 466
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_complaint_mod_upd
integer x = 311
integer y = 148
integer width = 1170
integer height = 104
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean italic = true
long textcolor = 21652867
long backcolor = 67108864
string text = "Manager On Duty Log"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_complaint_mod_upd
integer x = 2007
integer y = 1820
integer width = 288
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
string picturename = "BlankCBBF.bmp"
vtextalign vtextalign = top!
end type

event clicked;close(parent)
end event

type pb_reset from picturebutton within w_complaint_mod_upd
integer x = 1646
integer y = 1820
integer width = 288
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Reset"
string picturename = "BlankCBBF.bmp"
vtextalign vtextalign = top!
end type

event clicked;dw_1.Reset()
if dw_1.GetRow() = 0 then
	pb_new.TriggerEvent("Clicked")
end if
end event

type pb_save from picturebutton within w_complaint_mod_upd
integer x = 1275
integer y = 1820
integer width = 288
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Save"
string picturename = "BlankCBBF.bmp"
vtextalign vtextalign = top!
end type

event clicked;sCatAbbr = dw_1.GetItemString(1,'category')
if sCatAbbr = 'G' then
	sCategory = 'GST'
else
	sCategory = 'MOD'
end if
sGuest = dw_1.GetItemString(1,'guest_mod_name')
sRoomNo = dw_1.GetItemString(1,'room_no')
dtTimeOpen = dw_1.GetItemDateTime(1,'time_open')
sTaskNo = dw_1.GetItemString(1,'task_no')
sSubtaskNo = dw_1.GetItemString(1,'subtask_no')
sTaskDef = dw_1.GetItemString(1,'task_def')
if isnull(sTaskDef) then sTaskDef='' 
sResolution = dw_1.GetItemString(1,'resolution')
if isnull(sResolution) then sResolution='' 
sRepairman = dw_1.GetItemString(1,'repairman')
sStatCode = dw_1.GetItemString(1,'stat_code')
dtTimerStart = dw_1.GetItemDatetime(1,'timer_start')
sShift = string(wf_get_shift_number ( DayNumber( today() ), datetime(today(),now()) ))
sPaging='0'
sPreOpened = ''
if sStatCode = '00' then
	sPreOpened = 'Y'
	sPaging = 'P'
end if

sOpenByDept = ' '

if not dataUpdated then
	MessageBox("Warning","Nothing has changed!")
	return
end if

if isnull(sRoomNo) then
	MessageBox("Incomplete","Room required, Try Again!")
	return
end if
if isnull(sGuest) then
	MessageBox("Incomplete","Guest/MOD name required, Try Again!")
	return
end if
if isnull(sSubtaskNo) then
	MessageBox("Incomplete","Task required, Try Again!")
	return
end if
if isnull(sProblemNumber) or trim(sProblemNumber)='' then
	MessageBox("Incomplete","Recovery Task required, Try Again!")
	return
end if
if isnull(sSubproblemNumber) or trim(sSubproblemNumber)='' then
	MessageBox("Incomplete","Recovery subtask required, Try Again!")
	return
end if

if wf_insert_call() then
	pb_new.TriggerEvent("clicked")
end if


 



end event

type pb_new from picturebutton within w_complaint_mod_upd
integer x = 919
integer y = 1820
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&New"
string picturename = "BlankCBBF.bmp"
vtextalign vtextalign = top!
end type

event clicked;string initCat
if dw_1.GetRow() > 0 then
	initCat = dw_1.GetItemString(1,'category')
else
	initCat = 'G'
end if
dw_1.DeleteRow(0)
dw_1.InsertRow(0)
wf_init_fields(initCat)
dw_1.SetColumn("room_no")
pb_save.enabled = true
pb_reset.enabled = true
end event

type p_1 from picture within w_complaint_mod_upd
integer x = 2871
integer y = 692
integer width = 87
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;w_call_timer dt_win
datetime dt_timerdate
string ls_orig_datetime, ls_new_datetime

dt_timerdate = dw_1.GetItemDateTime(dw_1.GetRow(),"timer_start")
ls_orig_datetime = f_dt_to_dt_str(dt_timerdate)

openwithparm(dt_win,ls_orig_datetime)

ls_new_datetime = Message.StringParm

if ls_orig_datetime <> ls_new_datetime then
	preopenSet = true
	dw_1.SetItem(1,'stat_code','00')
end if


end event

type dw_1 from datawindow within w_complaint_mod_upd
event keydown pbm_dwnkey
integer x = 37
integer y = 284
integer width = 3058
integer height = 1460
integer taborder = 10
string title = "none"
string dataobject = "d_complaint_mod"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event keydown;if this.GetColumnName() = "room_no" then
	if keyDown(KeyTab!) then
		tabPressInRoom = true
	end if
end if
end event

event itemchanged;
CHOOSE CASE Upper(this.GetColumnName()) 

	CASE "CATEGORY"
		if data = 'G' then
			this.SetItem(1,'task_no',complaint_task_no)
			this.SetItem(1,'subtask_no','')
			wf_dddw_set_filter("subtask_no",complaint_task_no)
			wf_allow_dddw_edit(this,"guest_mod_name",1)
		else
			this.SetItem(1,'task_no',mod_task_no)
			this.SetItem(1,'subtask_no','')
			wf_allow_dddw_edit(this,"guest_mod_name",0)
			wf_dddw_set_filter("subtask_no",mod_task_no)
		end if
		
		this.SetColumn("room_no")
		dataUpdated=true

	CASE	"ROOM_NO"
		if dwc_room.Find("area_number = '" + data + "'", 0, dwc_room.RowCount()) = 0 then
			MessageBox("Database Error", "Room Number not found in area table.", &
						StopSign!)
			this.SetItem( row, "room_no","" )
			return 
		end if
		wf_process_room_change('room_no')
		sRoomNo = data
		sRoomDsc = this.GetItemString(row,"room_dsc")
		tabPressInRoom = false
		if usedMouse then
			this.SetColumn("guest_mod_name")
		end if
		if this.GetItemString(1,'category') = 'G' then
			if wf_guest_name_by_room (sRoomNo,date(today()),foundGuest,guestInDate,guestOutDate ) then
				this.SetItem(1,'guest_mod_name',foundGuest)
				st_guest_info.text='(arr. '+guestInDate+' depart. '+guestOutDate+')'
				this.SetColumn("subtask_no")
			else
				st_guest_info.text=''
				this.SetItem(1,'guest_mod_name',"")
			end if
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE	"ROOM_DSC"
		wf_process_room_change('room_dsc')
		sRoomDsc = data
		sRoomNo =  this.GetItemString(row,"room_no")
		if usedMouse then
			this.SetColumn("guest_mod_name")
		end if
		if this.GetItemString(1,'category') = 'G' then
			if wf_guest_name_by_room (sRoomNo,date(today()),foundGuest,guestInDate,guestOutDate ) then
				this.SetItem(1,'guest_mod_name',foundGuest)
				st_guest_info.text='(check-in '+guestInDate+' check-out '+guestOutDate+')'
				this.SetColumn("subtask_no")
			else
				st_guest_info.text=''
				this.SetItem(1,'guest_mod_name',"")
			end if
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE "SUBTASK_NO"
		sTaskNo = this.GetItemString(row,"task_no")
		sSubtaskNo = data
		if usedMouse then
			this.SetColumn("problem_number")
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE "STAT_CODE"
		dataUpdated=true
		
	CASE "TIMER_START"
		dataUpdated=true
		
	CASE "PROBLEM_NUMBER"
		sProblemNumber = data
		sProblemDsc = dwc_problem.GetItemString(dwc_problem.GetRow(),'problem_desc')
		this.SetItem(1,'subproblem_number','')
		wf_dddw_set_filter("subproblem_number",sProblemNumber)
		if usedMouse then
			this.SetColumn("subproblem_number")
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE "SUBPROBLEM_NUMBER"
		sSubproblemNumber = data
		if sProblemNumber <> '' then
			wf_get_task_info()
			if integer(sDefaultStatus) < 10 then
				if not preopenSet then
					this.SetItem(row,"stat_code",sDefaultStatus)
					this.SetItem(1,'timer_start',&
							wf_set_time_after_x_mins(iTimer1StartMin))
				end if
			else
				this.SetItem(row,"stat_code",sDefaultStatus)
				this.SetItem(1,'timer_start',&
							wf_set_time_after_x_mins(iTimer1StartMin))
			end if
		end if
		if usedMouse then
			this.SetColumn("closed_bydept")
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE "CLOSED_BYDEPT"
		sClosedBydept = data
		wf_dddw_set_filter("repairman",sClosedBydept)
		if usedMouse then
			this.SetColumn("repairman")
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE "REPAIRMAN"
		this.SetItem(1,'task_def','')
		if usedMouse then
			this.SetColumn("task_def")
		end if
		usedMouse=false
		dataUpdated=true
		
	CASE "TASK_DEF"
		dataUpdated=true
		
	CASE "RESOLUTION"
		dataUpdated=true
		
END CHOOSE		
end event

event clicked;CHOOSE CASE dwo.Name
	CASE "room_no"
		usedMouse = true
	CASE "room_dsc"
		usedMouse = true
	CASE "guest_mod_name"
		usedMouse = true
	CASE "subtask_no"
		usedMouse = true
	CASE "problem_number"
		usedMouse = true
	CASE "subproblem_number"
		usedMouse = true
	CASE "closed_bydept"
		usedMouse = true
	CASE "repairman"
		usedMouse = true
	CASE ELSE
		usedMouse = false
END CHOOSE


end event

event losefocus;this.AcceptText()
end event

type st_guest_info from statictext within w_complaint_mod_upd
integer x = 498
integer y = 780
integer width = 992
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

