$PBExportHeader$w_pending_calls.srw
$PBExportComments$Pending Calls Browse Screen
forward
global type w_pending_calls from window
end type
type st_6 from statictext within w_pending_calls
end type
type st_5 from statictext within w_pending_calls
end type
type pb_4 from picturebutton within w_pending_calls
end type
type st_4 from statictext within w_pending_calls
end type
type st_3 from statictext within w_pending_calls
end type
type st_2 from statictext within w_pending_calls
end type
type st_1 from statictext within w_pending_calls
end type
type pb_5 from picturebutton within w_pending_calls
end type
type pb_3 from picturebutton within w_pending_calls
end type
type pb_2 from picturebutton within w_pending_calls
end type
type pb_1 from picturebutton within w_pending_calls
end type
type p_3 from picture within w_pending_calls
end type
type pb_exit from picturebutton within w_pending_calls
end type
type pb_filter from picturebutton within w_pending_calls
end type
type pb_refresh from picturebutton within w_pending_calls
end type
type pb_findprev from picturebutton within w_pending_calls
end type
type pb_findnext from picturebutton within w_pending_calls
end type
type pb_find from picturebutton within w_pending_calls
end type
type pb_sort from picturebutton within w_pending_calls
end type
type pb_modify from picturebutton within w_pending_calls
end type
type pb_copy from picturebutton within w_pending_calls
end type
type pb_closecall from picturebutton within w_pending_calls
end type
type p_screen_hdr from picture within w_pending_calls
end type
type p_2 from picture within w_pending_calls
end type
type st_filter from statictext within w_pending_calls
end type
type ddlb_filter from dropdownlistbox within w_pending_calls
end type
type st_9 from statictext within w_pending_calls
end type
type st_status from statictext within w_pending_calls
end type
type pb_last from picturebutton within w_pending_calls
end type
type st_19 from statictext within w_pending_calls
end type
type st_readsecs from statictext within w_pending_calls
end type
type st_17 from statictext within w_pending_calls
end type
type st_16 from statictext within w_pending_calls
end type
type st_nextread from statictext within w_pending_calls
end type
type st_lastread from statictext within w_pending_calls
end type
type st_13 from statictext within w_pending_calls
end type
type dw_3 from datawindow within w_pending_calls
end type
type dw_1 from u_dw_maint within w_pending_calls
end type
end forward

global type w_pending_calls from window
integer width = 4110
integer height = 2008
boolean titlebar = true
string title = "Pending Calls - View"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 134217728
string icon = "CHECK1.ICO"
event ue_print pbm_custom01
event ue_printscreen pbm_custom02
event ue_printreport pbm_custom03
st_6 st_6
st_5 st_5
pb_4 pb_4
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
pb_5 pb_5
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
p_3 p_3
pb_exit pb_exit
pb_filter pb_filter
pb_refresh pb_refresh
pb_findprev pb_findprev
pb_findnext pb_findnext
pb_find pb_find
pb_sort pb_sort
pb_modify pb_modify
pb_copy pb_copy
pb_closecall pb_closecall
p_screen_hdr p_screen_hdr
p_2 p_2
st_filter st_filter
ddlb_filter ddlb_filter
st_9 st_9
st_status st_status
pb_last pb_last
st_19 st_19
st_readsecs st_readsecs
st_17 st_17
st_16 st_16
st_nextread st_nextread
st_lastread st_lastread
st_13 st_13
dw_3 dw_3
dw_1 dw_1
end type
global w_pending_calls w_pending_calls

type variables
//datetime tLastTimer
//datetime tNextTimer
string cScrBMP1         // screen idle BMP
string cScrBMP2         // screen data read BMP
string cWinIcon1                // min win idle icon
string cWinIcon2                // min win read data icon
long nReadSecs          // Re-read data every...
string cfindnext
string dwSelectStr
string clickedColumn
string ls_StatusFilter		// vz
string ls_TimerStartFilter //mn
boolean thereIsAUnassignCall
boolean firstLoad = true
integer beforeRowCnt
string deptSelectionStr
string origDwSelectStr
boolean handHeld
boolean jobInfoRequired
s_job job_info



end variables

forward prototypes
public function boolean wf_mod_selections (string deptstr)
public function integer wf_find_preopen_paging_call ()
public function boolean wf_upd_call (string callnum, string dept, string repairman)
public function boolean wf_mod_by_status (string as_status_filter, string as_timerstart_filter)
public function boolean wf_close_call (integer row_to_close, ref string callnum_to_close)
end prototypes

on ue_print;dw_1.print()
end on

on ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end on

event ue_printreport;dw_1.print()
end event

public function boolean wf_mod_selections (string deptstr);string deptid[]
string deptPendingNmStr, deptTimerNmStr, deptPendingStr, deptTimerStr
string modRes, newDwSelectStr
string selectStr1, selectStr2, selectStr3, selectStr4 
string selectStr5, selectStr6, selectStr7, selectStr8, selectStr9, selectStr10, selectStr11,selectStr12
string modStr,selectStr13, selectStr14, selectStr15, selectStr16, selectStr17, selectStr18,selectStr19
int posStart, posStop, posInt, numOfDept, i, j

if len(trim(deptStr)) = 0 then 
	modStr = "datawindow.table.select=~""+ origDwSelectStr+"~"" //restore the original dw select string
	goto ModifyDWSelect
//	MessageBox("orig",origDwSelectStr)
//	return true //no need to do anything
end if


numOfDept = 1
i = 1
DO UNTIL i > len(trim(deptStr))
	j = pos(deptStr, ',', i) 
	if j  > 0 then
		deptid[numOfDept] = mid(deptStr, i, j - i)
		i = j + 1
		numOfDept++
	else
		deptid[numOfDept] = mid(deptStr, i) 
		i = len(trim(deptStr)) + 1
	end if
	
LOOP


deptPendingNmStr = ' ~~"pendingcalls~~".~~"closed_bydept~~" = '
depttimerNmStr   = ' ~~"timercalls~~".~~"closed_bydept~~" = '


i = 1 
do while i <= numOfDept
	if i = 1 then
		deptPendingStr   = deptPendingNmStr + "'" + deptid[i] + "' "
		deptTimerStr     = depttimerNmStr + "'" + deptid[i] + "' " 
	else
		deptPendingStr   = deptPendingStr + " or " + deptPendingNmStr + "'" + deptid[i] + "' "
		deptTimerStr     = deptTimerStr + " or " + depttimerNmStr + "'" + deptid[i] + "' " 
	end if
	i++
loop

deptPendingStr   = " and (" + deptPendingStr + ") " 
deptTimerStr	  = " and (" + deptTimerStr + ") "				

//**************************************************************						 
posStart = 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - 1
selectStr1 = mid(dwSelectStr, posStart, posStop)  	//1st pending select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr2 = mid(dwSelectStr, posStart, posStop)  	//1st pending where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr3 = mid(dwSelectStr, posStart, posStop)  	//2nd pending select

posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr4 = mid(dwSelectStr, posStart, posStop) 	//2nd pending where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr5 = mid(dwSelectStr, posStart, posStop)  	//3rd pending select

posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr6 = mid(dwSelectStr, posStart, posStop) 	//3rd pending where

//mn chg 9/97 **********************************************************************************************
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr7 = mid(dwSelectStr, posStart, posStop)  	//1st timer select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr8 = mid(dwSelectStr, posStart, posStop)  	//1st timer where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr9 = mid(dwSelectStr, posStart, posStop)  	//4th pending select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr10 = mid(dwSelectStr, posStart, posStop)  	//4th pending where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr11= mid(dwSelectStr, posStart, posStop)  	//5th pending select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr12 = mid(dwSelectStr, posStart, posStop)  	//5th pending where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr13 = mid(dwSelectStr, posStart, posStop)  	//2nd timer select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr14 = mid(dwSelectStr, posStart, posStop)  	//2nd timer where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr15 = mid(dwSelectStr, posStart, posStop)  	//6th pending select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr16 = mid(dwSelectStr, posStart, posStop)  	//6th pending where
//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr17 = mid(dwSelectStr, posStart, posStop)  	//3rd timer select

posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'ORDER', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'ORDER' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr18 = mid(dwSelectStr, posStart, posStop) 	//3rd timer where


//**********************************************************************************************

posStart =posStart + posStop + 1
selectStr19 = mid(dwSelectStr, posStart) 				// last part

//modify where strings

selectStr2 = selectStr2 + deptPendingStr
selectStr4 = selectStr4 + deptPendingStr
// mn chg 9/97
selectStr6 = selectStr6 + deptPendingStr
selectStr8 = selectStr8 + deptTimerStr
selectStr10 = selectStr10 + deptPendingStr

selectStr12 = selectStr12 + deptPendingStr

//mn chg 11/01
selectStr14 = selectStr14 + deptTimerStr
selectStr16 = selectStr16 + deptPendingStr
selectStr18 = selectStr18 + deptTimerStr


//new string

//dwSelectStr = selectStr1 + selectStr2 + selectStr3 + selectStr4 + &
//				  selectStr5 + selectStr6 + selectStr7 + selectStr8 +	& 
//				  selectStr9 + selectStr10 + selectStr11 + selectStr12 +&
//				  selectStr13 + selectStr14 + &
//				  selectStr15 + selectStr16 + selectStr17 + selectStr18 + &
//				  selectStr19
newDwSelectStr = selectStr1 + selectStr2 + selectStr3 + selectStr4 + &
				  selectStr5 + selectStr6 + selectStr7 + selectStr8 +	& 
				  selectStr9 + selectStr10 + selectStr11 + selectStr12 +&
				  selectStr13 + selectStr14 + &
				  selectStr15 + selectStr16 + selectStr17 + selectStr18 + &
				  selectStr19

modStr = "datawindow.table.select=~""+newDwSelectStr+"~""

ModifyDWSelect:
modRes = dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw1 Modidy Error", modRes)
	return false
end if

modRes = dw_3.Modify(modStr)
if modRes <> "" then
	MessageBox("dw3 Modidy Error", modRes)
	return false
end if

newDwSelectStr = dw_1.Describe("datawindow.table.select")
//MessageBox("New SelectStr",newDwSelectStr)

//if dw_1.Retrieve() < 0 then
//   MessageBox("DW error","retrieve error")
//end if

return true
end function

public function integer wf_find_preopen_paging_call ();string ls_dept,ls_employee_name, ls_employee_num, ls_pager_id, ls_capecode, ls_zone, ls_room
string auto_assign_ind,sSubproblemNumber,sproblemNumber,sCallNumber
string sProblem, sSubproblem, sGuest
datetime dtTimerStart
s_pageassignment ass
int i
for i=1 to dw_1.RowCount() step +1
	if dw_1.GetItemString(i,"pagingind") = "Y" and dw_1.GetItemString(i,"repairman") = "" then
		
		if f_chk_preopen_page('Y',dw_1.GetItemNumber(i,"init_paging_min"),&
			dw_1.GetItemDateTime(i,"timer_start")) = "N" then
			CONTINUE
		end if
			
		sproblemNumber=dw_1.GetItemString(i,"problem_number")
		sSubProblemNumber=dw_1.GetItemString(i,"subproblem_number")
		sCallNumber=string(dw_1.GetItemNumber(i,"call_number_numeric"))
		sProblem = dw_1.GetItemString(i,"problem")
		sSubproblem = dw_1.GetItemString(i,"subproblem")
		sGuest = dw_1.GetItemString(i,"guest")
		dtTimerStart = dw_1.GetItemDateTime(i,"timer_start")
		ls_zone=dw_1.GetItemString(i,"area_unit_type")
		ls_room=dw_1.GetItemString(i,"room_num")
		
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
  			Messagebox('Responder','A pager ID could not be determined for call_number ' + &
				  dw_1.GetItemString(i,'call_number')+ &
				  +' in Subproblem and Department managers tables! ~r~nInsertion of a pageassignment record has been aborted!')
				return - 1
		END IF
			
		IF auto_assign_ind = 'Y' THEN

			if not f_find_pager_id (ls_dept, ls_employee_name, ls_employee_num, &
						ls_pager_id, ls_capecode, ls_room, dtTimerStart) then
				if not wf_upd_call(sCallNumber,ls_dept,'') then
					return -1
				end if
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
				 ' for dept:'+ls_dept+' has failed to allocate a pager! Caller:'+ sGuest +&
				 ' task:'+trim(sProblem)+'/'+trim(sSubproblem) //+'['+f_dt_to_dt_str(dtTimerStart)+']'
				 
				ass.pager_id = f_find_supervisor_pager(ls_dept,ls_room,dw_1.GetItemDateTime(i,"timer_start"))
    		ELSE
				if not wf_upd_call(sCallNumber,ls_dept,ls_employee_name) then
					return -1
				end if
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
			if dw_1.GetItemString(i,'stat_code') < '10'  then
				if f_insert_assignment(ass) then
					commit;
				end if
			end if
		end if	
	end if
next
return 0
end function

public function boolean wf_upd_call (string callnum, string dept, string repairman);boolean timerCall
string callNumber
datetime curDt

curDt = datetime(today(),now())

timerCall = TRUE
SELECT timercalls.call_number  
    INTO :callNumber  
    FROM timercalls  
   WHERE timercalls.call_number = :callnum   ;
if sqlca.sqlcode = 100 then
	timerCall = FALSE
else
	if sqlca.sqlcode < 0 then
		MessageBox("SQL error","DB select error: "+ sqlca.sqlerrtext)
		return false
	end if
end if

if handHeld then
	if timerCall then
		update timercalls
		set timercalls.closed_bydept = :dept,
			 timercalls.repairman = :repairman,
			 timercalls.paging_ind = '0',
			 timercalls.last_upd_ts = :curDt
		where timercalls.call_number = :callnum;
	else
		update pendingcalls
		set pendingcalls.closed_bydept = :dept,
			 pendingcalls.repairman = :repairman,
			 pendingcalls.paging_ind = '0',
			 timercalls.last_upd_ts = :curDt
		where pendingcalls.call_number = :callnum	;
	end if	
else
	if timerCall then
		update timercalls
		set timercalls.closed_bydept = :dept,
			 timercalls.repairman = :repairman,
			 timercalls.paging_ind = '0'
		where timercalls.call_number = :callnum;
	else
		update pendingcalls
		set pendingcalls.closed_bydept = :dept,
			 pendingcalls.repairman = :repairman,
			 pendingcalls.paging_ind = '0'
		where pendingcalls.call_number = :callnum	;
	end if
end if

if sqlca.sqlcode < 0 then
	MessageBox("SQL error","DB update error: " +sqlca.sqlerrtext)
	return false
else
	commit;
end if
return true
end function

public function boolean wf_mod_by_status (string as_status_filter, string as_timerstart_filter);if len(trim(as_status_filter)) = 0 and len(trim(as_timerstart_filter)) = 0 then
	return true //no need to do anything
end if
string ls_filter, ls_filter1, ls_filter2
int range 
string unit
date filterDate
time filterTime,t1
datetime newFilterDateTime

//**** mn 12.19.2003
if POS(as_timerstart_filter,"hour") > 0 then
	range = integer(mid(as_timerstart_filter,1,POS(as_timerstart_filter,"hour") - 1))
	t1 = RelativeTime(time("23:59:59"),-(dec(range)*3600))
	if t1 < now() then // pass midnight
		filterDate = RelativeDate(today(),1) // proj time pass midnight
		filterTime=RelativeTime(time('00:00:00'),SecondsAfter(t1,now())-1)
	else
		filterDate = today()
		filterTime = RelativeTime(now(),dec(range)*3600)
	end if
else
	if POS(as_timerstart_filter,"day") > 0 then
		range = integer(mid(as_timerstart_filter,1,POS(as_timerstart_filter,"day") - 1))
		filterDate = RelativeDate(today(),range)
		filterTime = now()
	end if
end if
if as_timerstart_filter = "ALL" or as_timerstart_filter = "" then
	ls_filter2 = ""
else
	ls_filter2 = " timer_start <= datetime('"+string(datetime(filterDate,filterTime)) + "') "
end if
//*** end 12.19.2003 
if len(trim(as_status_filter)) > 0 then
	ls_filter1 = "POS( '"+as_status_filter+"', trim(stat_code) ) > 0 "
end if

if ls_filter1 <> "" and ls_filter2 <> "" then
	ls_filter = ls_filter1 + " and " + ls_filter2
else
	if ls_filter1 <> "" then
		ls_filter = ls_filter1
	else
		ls_filter = ls_filter2
	end if
end if
//MessageBox("wf_mod_by_status",ls_filter)
dw_1.SetFilter( ls_filter )
dw_1.Filter()
dw_3.SetFilter( ls_filter )
dw_3.Filter()

//if len(trim(as_status_filter)) > 0 then
//	st_9.visible 		= true
//	st_status.text		= as_status_filter
//	st_status.visible = true
//end if
//
//if len(trim(as_timerstart_filter)) > 0 then
//	st_filter.visible	= true
//	ddlb_filter.visible = true
//end if
return true 


end function

public function boolean wf_close_call (integer row_to_close, ref string callnum_to_close);string callNumber, statCode, targetTable
string guest_name, guest_room, room_type
callNumber = dw_1.GetItemString(row_to_close,"call_number")
callnum_to_close = callNumber
statCode = dw_1.GetItemString(row_to_close,"stat_code")
if dw_1.GetItemString(row_to_close,'problem') = 'Guest Reservation' and &
	dw_1.GetItemString(row_to_close,'subproblem') = 'Arrival Pending' then
	s_guest guest_data
	guest_data.guest = dw_1.GetItemString(row_to_close,'guest')
	guest_data.room = dw_1.GetItemString(row_to_close,'room')
	OpenWithParm(w_guest_info,guest_data)
end if
room_type = dw_1.GetItemString(row_to_close, 'area_room_type')
if room_type = 'E' and jobInfoRequired then 
	job_info.call_number=callNumber
	job_info.job_start=dw_1.GetItemDateTime(row_to_close,'timer_start')
	job_info.job_end=f_sysdate()
	job_info.job_type='EM' //Equipment Maintenance
	job_info.task = dw_1.GetItemString(row_to_close,'problem')
	job_info.subtask = dw_1.GetItemString(row_to_close,'subproblem')
	job_info.room_equip = dw_1.GetItemString(row_to_close,'room')
	w_job_info dt_win
	openwithparm(dt_win,job_info)
//	if IsValid(Message.PowerObjectParm) then
//		MessageBox("job data","OK")
//	else
//		MessageBox("job data","Not OK")
//	end if
//	MessageBox("Closing","This is an equipment call!")
end if
if integer(statCode) < 10 then
  	targetTable = '1'
else
	targetTable = '2'
end if
if	f_close_a_call(callNumber,targetTable) then
	return true
else
	return false
end if
end function

event resize;
pointer cpOldPointer

cpOldPointer = SetPointer(HourGlass!)


this.setredraw(FALSE)

p_2.x = This.WorkSpaceWidth() - p_2.width - 300

pb_sort.y = This.WorkSpaceHeight() - ( pb_sort.height + 10 ) 
pb_find.y = This.WorkSpaceHeight() - ( pb_find.height + 10 ) 
pb_findnext.y = This.WorkSpaceHeight() - ( pb_findnext.height + 10 ) 
pb_findprev.y = This.WorkSpaceHeight() - ( pb_findprev.height + 10 ) 

pb_closecall.y = This.WorkSpaceHeight() - ( pb_closecall.height + 10 ) 
pb_copy.y = This.WorkSpaceHeight() - ( pb_copy.height + 10 ) 
pb_modify.y = This.WorkSpaceHeight() - ( pb_modify.height + 10 ) 

pb_refresh.y = This.WorkSpaceHeight() - ( pb_refresh.height + 10 ) 
pb_filter.y = This.WorkSpaceHeight() - ( pb_filter.height + 10 ) 
pb_exit.y = This.WorkSpaceHeight() - ( pb_exit.height + 10 ) 


dw_1.Resize(This.WorkSpaceWidth() -  (25), &
				This.WorkSpaceHeight() - (p_screen_hdr.y + p_screen_hdr.height + 280) )
this.setredraw(TRUE)
SetPointer( cpOldPointer )



end event

event open;/* Sfm mod 11/95 remove password call to w_password */

long FGColor1, FGColor2, FGColor3, FGColor4, FGColor5, FGColor6, FGColor7, FGDefault_color
long BGColor1, BGColor2, BGColor3, BGColor4, BGColor5, BGColor6, BGColor7, BGDefault_color
string Bgrnd_string, err, Fgrnd_string, cCols2Do[], cMinOpenCompute
string cOverTimerCall, cOpenTimerCall, cPreOpenCall, cOpenNonTimerCall, cClosedCall, cUnAssignedCall
string cRecurringCall, cReadSecs
string ls_sort, cGccCall
int nCols2Do, nCtr, li_rc
pointer pOldPointer


// SFM 10/26/97 Determine db type and switch dataobjects if need be

IF cappdbtype = 'MSSQL' THEN
	dw_1.dataobject = 'd_pending_calls_mssql'
END IF


/******* sfm *****/


//If Is_PassWordOK( Get_Event_Security( "PO" ) ) Then
  SetMicroHelp( "Opening Pending Calls view screen...please wait." )
  pOldPointer = SetPointer( HourGlass! )
  cScrBMP1  = ProfileString( cINIPath+cINIFile, "Pending", "ScreenBMP1", "eye01a.bmp" )
  cScrBMP2  = ProfileString( cINIPath+cINIFile, "Pending", "ScreenBMP2", cScrBMP1 )
  cWinIcon1 = ProfileString( cINIPath+cINIFile, "Pending", "WindowIcon1", cScrBMP1 )
  cWInIcon2 = ProfileString( cINIPath+cINIFile, "Pending", "WindowIcon2", cScrBMP2 )
 
// following code controls the update of last_upd_ts timestamp for handheld 
if ProfileString( cINIPath+cINIFile, "Pending", "HandHeld","N") = 'Y' then
	handHeld = true
else
	handHeld = false
end if

if ProfileString( cINIPath+cINIFile, "Pending", "JobDuration","N") = 'Y' then
	jobInfoRequired = true
else
	jobInfoRequired = false
end if

//  p_1.PictureName = cScrBMP2
  
  //nReadSecs = ProfileInt(cINIPath+cINIFile, "Pending", "ReadSeconds", 150 )      // 2.5 min.'s
	nReadSecs = ProfileInt(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "ReadSeconds", 150 ) 
 
  //deptSelectionStr 	=  ProfileString(cINIPath + cINIFile, "Pending", "Dept", "<?>")
  
  	deptSelectionStr = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "Dept", '' )
												
  //ls_StatusFilter		=  ProfileString(cINIPath + cINIFile, "Pending", "StatusFilter", "")
	ls_StatusFilter = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "statusFilter", '' )

//  ls_TimerStartFilter = ProfileString(cINIPath + cINIFile, "Pending", "StartTimerFilter","")	
	ls_TimerStartFilter = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "StartTimerFilter", '' )
  This.Icon = cWInIcon2

  FGColor1                      = 65535         // Yellow       -       over timer
  FGColor2                      = 255           // Red          -       open timer
  FGColor3                      = 0             // Black                -       pre-open
  FGColor4                      = 16777215      // White                -       open non-timer
  FGColor5                      = 16711680      // Blue
  FGColor6							  = 0 				// Black			- GCC call
  FGColor7							  = 0 				// Black			- Recurring call
  FGDefault_color   = 0                         // Black                -       end of if(... list

  BGColor1                      = 255           // Red          -       over timer
  BGColor2                      = 65535         // Yellow       -       open timer
  BGColor3                      = 65280         // Green                -       pre-open
  BGColor4                      = 8421504       // DkGray       -       open non-timer
  BGColor5                      = 12632256      // Light Gray
  BGColor6							  = 65280         // Green 		- GCC call
  BGColor7							  = 16754899        // voilet 		- Recurring call
  BGDefault_color       = 16777215      // White        -       end of if(... list
  cOverTimerCall = "( ( DaysAfter( Date( timer_start ),"+ &
										"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") >= 0 and integer(stat_code) < 10 "+ &
					 "and repairman <> ~"~""  // mn - chg for filter unassigned call
  cOpenTimerCall = "( ( DaysAfter( Date( timer_start ),"+ &
									"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") < 0 and integer(stat_code) < 10 and integer(stat_code) > 0" +&
					 " and repairman <> ~"~"" // mn - chg for filter unassigned call
  cPreOpenCall = "( ( DaysAfter( Date( timer_start ),"+ &
										"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") < 0 and integer(stat_code) = 0" +&
					 " and repairman <> ~"~"" // mn - chg for filter unassigned call
  cOpenNonTimerCall = "( ( DaysAfter( Date( call_indate ),"+ &
										"Date( Today() ) ) * 86400 ) + "+&
							"SecondsAfter( Time( call_indate ), "+&
											  "Now() ) "+&
					 ") >= 0 and integer(stat_code) >= 10 and "+&
									"integer(stat_code) < 90" +&
					 " and repairman <> ~"~" "    // mn - chg for filter unassigned call
//  cUnAssignedCall = " repairman = ~"~" and pagingind <> ~"Y~" "
  cUnAssignedCall = " repairman = ~"~" "
  cGccCall			= " integer(stat_code) = 11 "
  cRecurringCall = " (integer(stat_code) >= 20 and integer(stat_code) <= 40) " + &
  						" and repairman <> ~"~" " 

  Bgrnd_string = &
	".background.color = '"  + String( BGDefault_color ) + " &
	~t if(" + cOverTimerCall + ", " + String( BGDefault_color ) + ",&
	if(" + cGccCall + ", " + String( BGColor6 ) + ",&
	if(" + cRecurringCall + ", " + String( BGColor7 ) + ",&
	if(" + cOpenTimerCall    + ", " + String( BGDefault_color ) + ",&
	if(" + cPreOpenCall      + ", " + String( BGDefault_color ) + ",&
	if(" + cUnAssignedCall      + ", " + String( BGColor2  ) + ",&
	if(" + cOpenNonTimerCall + ", " + String( BGColor5 ) + "," + &
	String( BGDefault_color ) + ") ) ) ) ) ) ) '" 


  Fgrnd_string = &
	".color = '"  + String( FGDefault_color ) + " &
	~t if(" + cOverTimerCall + ", " + String( FGDefault_color ) + ",&
	if(" + cGccCall + ", " + String( FGColor6 ) + ",&
	if(" + cRecurringCall + ", " + String( FGColor7 ) + ",&
	if(" + cOpenTimerCall    + ", " + String( FGDefault_color ) + ",&
	if(" + cPreOpenCall      + ", " + String( FGDefault_color ) + ",&
	if(" + cUnAssignedCall      + ", " + String( FGColor3 ) + ",&
	if(" + cOpenNonTimerCall + ", " + String( FGColor5 ) + "," + &
	String( FGDefault_color ) + ") ) ) ) ) ) ) '" 
 //
  st_lastread.Text = String(Now(), cTimeFormat)
  st_readsecs.Text = String( nReadSecs )
  
  //transaction SQL_AllCalls
  //SQL_AllCalls = create transaction
  dw_1.SetTrans(SQLCA)
  f_mod_dw_dt_disp(dw_1,"timer_start")
  
  dwSelectStr = dw_1.Describe("datawindow.table.select")
  origDwSelectStr = dwSelectStr
   
  if len(trim(deptSelectionSTr)) > 0 then
	  wf_mod_selections(deptSelectionStr)		
  end if
  wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter) 		// vz 02.04.2003
  
  f_mod_dw_dt_disp(dw_3,"timer_start")
  
  dw_1.Retrieve()
  
  ls_sort =  ProfileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort",'error')

  IF ls_sort <> 'error' THEN
     li_rc = dw_1.setsort(ls_sort)
	  If li_rc < 1 THEN
	     SetProfileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort","")
	   ELSE
		  li_rc = dw_1.sort()
        If li_rc < 1 THEN
		     SetProfileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort","")
	     END IF
     END IF
  END IF
  
  
  
  
  
  
//  p_1.PictureName = cScrBMP1
  This.Icon = cWInIcon1
  If nReadSecs > 0 Then
     st_nextread.Text = String( RelativeTime( Now(), nReadSecs ), cTimeFormat )
  Else
		st_nextread.Text = "OFF"
  End If
//  if dw_1.SetSort( "timer_start " + "A" ) <> 1 Then
//      MessageBox("Sort Problem","Couldn't set-sort Timer data correctly.",StopSign!)
//  End If
//  if dw_1.Sort( ) <> 1 Then
//              MessageBox("Sort Problem","Couldn't sort Timer data correctly.",StopSign!)
//  End If
//
      cCols2Do[1] = "room"
		cCols2Do[2] = "caller_category"
		cCols2Do[3] = "guest"
      cCols2Do[4] = "problem"
      cCols2Do[5] = "subproblem"
      cCols2Do[6] = "closed_bydept"
      cCols2Do[7] = "repairman"
      cCols2Do[8] = "problem_definition"
      cCols2Do[9] = "timer_start"
      cCols2Do[10] = "durationminutesopen"
      cCols2Do[11] = "callstat_stat_desc"
      cCols2Do[12] = "call_number_numeric"
		cCols2Do[13] = "pagingind"
		cCols2Do[14] = "paged"
//
//      // now let's re-color the columns
      nCols2Do = UpperBound( cCols2Do )
      For nCtr = 1 to nCols2Do

              // background color
              err = dw_1.Modify( cCols2Do[nCtr] + ".background.mode=0" )
              If err <> "" Then
                      MessageBox("Status", "Unable to set background mode to Opaque for "+&
                                                              cCols2Do[nCtr] + " - " + err + ".")
              End If
              err = dw_1.Modify( cCols2Do[nCtr] + Bgrnd_string )
              If err <> "" Then
                              MessageBox("Status", "Unable to set background color for "+&
                                                              cCols2Do[nCtr] + " - " + err + ".")
              End If

              // foreground color
              err = dw_1.Modify( cCols2Do[nCtr] + Fgrnd_string )
              If err <> "" Then
                              MessageBox("Status", "Unable to set foreground color for "+&
                                                              cCols2Do[nCtr] + " - " + err + ".")
              End If
      Next
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
	SetPointer( pOldPointer )
	// time next timer as close to next read as possible inside the 65 sec limit
	If nReadSecs > 0 Then
		Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), this )
	Else
		Timer( 0, this )
	End If
	dw_1.SetFocus()
//Else
//      SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
//      Close(w_pending_calls)
//End If

pb_closecall.Enabled = false
pb_copy.Enabled = false
pb_modify.Enabled = false
ddlb_filter.text = ls_TimerStartFilter

w_main.postevent("ue_menu_set")

end event

on close;close(this)
end on

event timer;long nLastRowOnPage = 0, nFirstRowOnPage = 0
pointer pOldPointer
long nSelectedRow, nSelectedCol
//MessageBox("st_nextread",st_nextread.text)
pb_refresh.enabled = false  // disable refresh button while screen is refreshed

Timer( 0, this )
If SecondsAfter( Time(st_nextread.Text), Now() ) >= 0 Then
//	p_1.PictureName = cScrBMP2
	This.Icon = cWInIcon2
	SetMicroHelp( "Reading Data for Pending Calls window...please wait." )
	pOldPointer = SetPointer(HourGlass!)
	nLastRowOnPage  = Long( dw_1.Describe( "datawindow.LastRowOnPage" ) )
	nFirstRowOnPage = Long( dw_1.Describe( "datawindow.FirstRowOnPage" ) )
	dw_1.SetRedraw(False)
	st_lastread.Text = String(Now(), cTimeFormat)
	st_readsecs.Text = String( nReadSecs )
	nSelectedRow = dw_1.GetRow()
	nSelectedCol = dw_1.GetColumn()
	dw_1.Retrieve()

	wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter)

	dw_1.ScrollToRow(nLastRowOnPage)
	dw_1.ScrollToRow(nFirstRowOnPage)
//	p_1.PictureName = cScrBMP1
	This.Icon = cWInIcon1
	If nReadSecs > 0 Then
		st_nextread.Text = String( RelativeTime( Now(), nReadSecs ), cTimeFormat )
	Else
		st_nextread.Text = "OFF"
	End If
	dw_1.SetRow(nSelectedRow)
	dw_1.SetColumn(nSelectedCol)
	if pb_closecall.Enabled = false then
		pb_closecall.Enabled = true
		pb_copy.Enabled = true
		pb_modify.Enabled = true
	end if
//	dw_1.SetFocus()
	dw_1.SetRedraw(True)
	SetPointer(pOldPointer)
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
End If
// time next timer as close to next read as possible inside the 65 sec limit
If nReadSecs > 0 Then
	Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), this )
Else
	Timer( 0, this )
End If

pb_refresh.enabled = true
end event

on w_pending_calls.create
this.st_6=create st_6
this.st_5=create st_5
this.pb_4=create pb_4
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_5=create pb_5
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.p_3=create p_3
this.pb_exit=create pb_exit
this.pb_filter=create pb_filter
this.pb_refresh=create pb_refresh
this.pb_findprev=create pb_findprev
this.pb_findnext=create pb_findnext
this.pb_find=create pb_find
this.pb_sort=create pb_sort
this.pb_modify=create pb_modify
this.pb_copy=create pb_copy
this.pb_closecall=create pb_closecall
this.p_screen_hdr=create p_screen_hdr
this.p_2=create p_2
this.st_filter=create st_filter
this.ddlb_filter=create ddlb_filter
this.st_9=create st_9
this.st_status=create st_status
this.pb_last=create pb_last
this.st_19=create st_19
this.st_readsecs=create st_readsecs
this.st_17=create st_17
this.st_16=create st_16
this.st_nextread=create st_nextread
this.st_lastread=create st_lastread
this.st_13=create st_13
this.dw_3=create dw_3
this.dw_1=create dw_1
this.Control[]={this.st_6,&
this.st_5,&
this.pb_4,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.pb_5,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.p_3,&
this.pb_exit,&
this.pb_filter,&
this.pb_refresh,&
this.pb_findprev,&
this.pb_findnext,&
this.pb_find,&
this.pb_sort,&
this.pb_modify,&
this.pb_copy,&
this.pb_closecall,&
this.p_screen_hdr,&
this.p_2,&
this.st_filter,&
this.ddlb_filter,&
this.st_9,&
this.st_status,&
this.pb_last,&
this.st_19,&
this.st_readsecs,&
this.st_17,&
this.st_16,&
this.st_nextread,&
this.st_lastread,&
this.st_13,&
this.dw_3,&
this.dw_1}
end on

on w_pending_calls.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.pb_4)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_5)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.p_3)
destroy(this.pb_exit)
destroy(this.pb_filter)
destroy(this.pb_refresh)
destroy(this.pb_findprev)
destroy(this.pb_findnext)
destroy(this.pb_find)
destroy(this.pb_sort)
destroy(this.pb_modify)
destroy(this.pb_copy)
destroy(this.pb_closecall)
destroy(this.p_screen_hdr)
destroy(this.p_2)
destroy(this.st_filter)
destroy(this.ddlb_filter)
destroy(this.st_9)
destroy(this.st_status)
destroy(this.pb_last)
destroy(this.st_19)
destroy(this.st_readsecs)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_nextread)
destroy(this.st_lastread)
destroy(this.st_13)
destroy(this.dw_3)
destroy(this.dw_1)
end on

on deactivate;w_main.postevent("ue_menu_set")

end on

type st_6 from statictext within w_pending_calls
integer x = 73
integer y = 200
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "Paging Legend"
boolean focusrectangle = false
end type

type st_5 from statictext within w_pending_calls
integer x = 1650
integer y = 272
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "Non-Pageable"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_pending_calls
integer x = 1550
integer y = 260
integer width = 82
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "nopage_unassigned.bmp"
alignment htextalign = left!
end type

type st_4 from statictext within w_pending_calls
integer x = 1175
integer y = 268
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = " MOD notified"
boolean focusrectangle = false
end type

type st_3 from statictext within w_pending_calls
integer x = 773
integer y = 268
integer width = 279
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "Scheduled"
boolean focusrectangle = false
end type

type st_2 from statictext within w_pending_calls
integer x = 535
integer y = 264
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "Sent"
boolean focusrectangle = false
end type

type st_1 from statictext within w_pending_calls
integer x = 165
integer y = 268
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "Assigned"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_pending_calls
integer x = 1083
integer y = 260
integer width = 82
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "page_supervisor.bmp"
alignment htextalign = left!
end type

type pb_3 from picturebutton within w_pending_calls
integer x = 681
integer y = 256
integer width = 82
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "page_unassigned.bmp"
alignment htextalign = left!
end type

type pb_2 from picturebutton within w_pending_calls
integer x = 439
integer y = 256
integer width = 82
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "page_sent.bmp"
alignment htextalign = left!
end type

type pb_1 from picturebutton within w_pending_calls
integer x = 73
integer y = 260
integer width = 82
integer height = 72
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "page_assigned.bmp"
alignment htextalign = left!
end type

type p_3 from picture within w_pending_calls
integer x = 2455
integer y = 256
integer width = 2181
integer height = 92
string picturename = "Color Legend.bmp"
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_pending_calls
integer x = 3104
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 110
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

event clicked;close(parent)
end event

type pb_filter from picturebutton within w_pending_calls
integer x = 2811
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Fi&lter"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if
OpenWithParm (w_screen_settings, "pending",parent)
if Message.StringParm <> '' then
	string refreshMin, statCode, startTimer, deptCode
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'|') - 1
	refreshMin = Mid(Message.StringParm,1,endPos) 
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	statCode = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	startTimer = Mid(Message.StringParm, startPos,endPos - startPos +1)
		
	startPos = endPos + 2
	deptCode = Mid(Message.StringParm, startPos)	
	
//	MessageBox("returned","refreshMin:"+refreshMin+ &
//		" statCode:"+statCode+" startTimer:"+startTimer +&
//		" deptCode:"+deptCode)
	if startTimer <> ls_TimerStartFilter then
		ls_TimerStartFilter = startTimer
		ddlb_filter.text = ls_TimerStartFilter
		wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter)
	end if
	
	if statCode <> ls_StatusFilter then
		ls_StatusFilter = statCode
		wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter)
	end if
	
	if deptSelectionStr <> deptCode then
		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
		deptSelectionStr = deptCode 
		wf_mod_selections(deptSelectionStr)
		dw_1.Retrieve()
	end if

end if
end event

type pb_refresh from picturebutton within w_pending_calls
integer x = 2519
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Refresh"
string picturename = "BlankCB.bmp"
string disabledname = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;st_nextread.Text = String( RelativeTime( Now(), -1 ), cTimeFormat )
Timer( .01, parent )
//Timer(0,parent)
end event

type pb_findprev from picturebutton within w_pending_calls
integer x = 983
integer y = 1668
integer width = 274
integer height = 112
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean enabled = false
string text = "&Prev"
string picturename = "BlankCB.bmp"
string disabledname = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;int nFindResult

If Len( Trim( cFindNext ) ) > 0 Then
	If dw_1.ii_currow >= dw_1.RowCount() Then
		MessageBox( "Find Error", "You are at the last record.", StopSign! )
	Else
		// safe ti use ii_currow + 1 for start cuz we check for bounds above
		nFindResult = dw_1.Find( cFindNext, dw_1.ii_CurRow - 1 , 1)
		If nFindResult > 0 Then
//                      dw_1.SelectRow(dw_1.ii_currow, false)
			dw_1.SetRow( nFindResult )
			dw_1.ScrollToRow( nFindResult )
			dw_1.SelectRow( nFindResult, true )
		Else
			MessageBox( "String Not Found", "No more records with [" + cFindNext + "] found.", &
							StopSign! )
		End If
	End If
Else
	dw_1.TriggerEvent( "ue_find" )
End If

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end event

type pb_findnext from picturebutton within w_pending_calls
integer x = 690
integer y = 1668
integer width = 274
integer height = 112
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean enabled = false
string text = "&Next"
string picturename = "BlankCB.bmp"
string disabledname = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;int nFindResult

If Len( Trim( cFindNext ) ) > 0 Then
	If dw_1.ii_currow >= dw_1.RowCount() Then
		MessageBox( "Find Error", "You are at the last record.", StopSign! )
	Else
		// safe ti use ii_currow + 1 for start cuz we check for bounds above
		nFindResult = dw_1.Find( cFindNext, dw_1.ii_CurRow+1, dw_1.RowCount() )
		If nFindResult > 0 Then
//                      dw_1.SelectRow(dw_1.ii_currow, false)
			dw_1.SetRow( nFindResult )
			dw_1.ScrollToRow( nFindResult )
			dw_1.SelectRow( nFindResult, true )
		Else
			MessageBox( "String Not Found", "No more records with [" + cFindNext + "] found.", &
							StopSign! )
		End If
	End If
Else
	dw_1.TriggerEvent( "ue_find" )
End If

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end event

type pb_find from picturebutton within w_pending_calls
integer x = 398
integer y = 1668
integer width = 274
integer height = 112
integer taborder = 150
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

event clicked;dw_1.triggerevent("ue_find")
dw_1.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type pb_sort from picturebutton within w_pending_calls
integer x = 101
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 170
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

event clicked;dw_1.triggerevent("ue_sort")

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end event

type pb_modify from picturebutton within w_pending_calls
integer x = 2057
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Modify"
string picturename = "BlankCB.bmp"
string disabledname = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;If Is_PasswordOK( Get_Event_Security( "CM" ) ) Then
	string callNumber, action, statCode, clickedColNum
	callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
	statCode = dw_1.GetItemString(dw_1.GetRow(),"stat_code")
	clickedColumn = dw_1.GetColumnName()
	clickedColNum = string(f_find_col_num(clickedColumn),"00")
	if integer(statCode) < 10 then
 	  action = '1'
	else
		action = '2'
	end if
	If IsValid( w_call_upd ) Then
//		MessageBox("col num",string(f_find_col_num(clickedColumn),"00"))
		w_call_upd.sCallNumber = callNumber
		w_call_upd.openMode = action
		w_call_upd.colToSet = integer(clickedColNum)
		w_call_upd.TriggerEvent("ue_refresh")
		if w_call_upd.st_mode.text = 'Add' then // try to modify a closed call
			SetPointer ( arrow! )
		else
			open(w_call_upd)
		end if
	else
//		MessageBox("col num",string(f_find_col_num(clickedColumn),"00"))
		If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
			OpenSheetWithParm( w_call_upd, action+clickedColNum+callNumber, "w_call_upd", w_main, 0, Original! )
		else
			MessageBox("Failed","Opening Call Screen failed!")
		end if
	end if
end if
end event

type pb_copy from picturebutton within w_pending_calls
integer x = 1765
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Cop&y"
string picturename = "BlankCB.bmp"
string disabledname = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then

string callNumber, action, statCode, clickedColNum
callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
statCode = dw_1.GetItemString(dw_1.GetRow(),"stat_code")
clickedColumn = dw_1.GetColumnName()
clickedColNum = string(f_find_col_num(clickedColumn),"00")
if integer(statCode) < 10 then
   action = '3'
else
	action = '4'
end if

if IsValid(w_call_upd) then
		w_call_upd.sCallNumber = callNumber
		w_call_upd.openMode = action
		w_call_upd.colToSet = integer(clickedColNum)
		w_call_upd.TriggerEvent("ue_refresh")
		open(w_call_upd)
else
	// 6/17/97 SFM padded messageparm with'00' for substring call number
	OpenSheetWithParm( w_call_upd, action+'00'+callNumber, "w_call_upd", w_main, 0, Original! )
end if
end if
end event

type pb_closecall from picturebutton within w_pending_calls
integer x = 1458
integer y = 1664
integer width = 274
integer height = 112
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Close"
string picturename = "BlankCB.bmp"
string disabledname = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;//***** chg for multi-call close feature. Ming
int cnt, totalRowSelected
boolean unAssignedCall
cnt=1
unAssignedCall = false
totalRowSelected = 0
do while cnt <= dw_1.rowcount()
	if dw_1.IsSelected(cnt) then
		if dw_1.GetItemString(cnt,'repairman') = '' or IsNull(dw_1.GetItemString(cnt,'repairman')) or & 
			dw_1.GetItemString(cnt,'closed_bydept') = '' or IsNull(dw_1.GetItemString(cnt,'closed_bydept'))then
			unAssignedCall=true
		end if
		totalRowSelected++
	end if
	cnt++
loop

if unAssignedCall then
	beep(2)
	MessageBox("Error","Can't close an unassigned call! Either department or repairman contains blank value!!")
	return
end if

string callNumber, statCode, targetTable
string guest_name, guest_room
s_guest guest_data

If Is_PasswordOK( Get_Event_Security( "CC" ) ) Then
	if totalRowSelected = 1 then
		if wf_close_call (dw_1.GetRow(),callNumber) then
			if dw_1.DeleteRow(0) < 0 then
				MessageBox("DW Error","DeleteRow error: " + callNumber)
			end if
		end if
	else
		cnt = 1
		do while cnt <= dw_1.rowcount()
			if dw_1.IsSelected(cnt) then
				if wf_close_call (cnt,callNumber) then
					if dw_1.DeleteRow(cnt) < 0 then
						MessageBox("DW Error","DeleteRow error: " + callNumber)
					end if
					continue
				end if
			end if
			cnt++
		loop
	end if
	if dw_1.rowcount() > 0 then
		dw_1.SelectRow(dw_1.GetRow(),true)
	end if
end if
// reset timer after close calls. Multi-close function will disable timer.
Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), parent )
//****chg for multi-call call feature. end

end event

type p_screen_hdr from picture within w_pending_calls
integer x = 41
integer y = 28
integer width = 1134
integer height = 172
string picturename = "Pending Calls.bmp"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type p_2 from picture within w_pending_calls
integer x = 2395
integer y = 40
integer width = 1152
integer height = 212
string picturename = "HotelEXPERT.bmp"
boolean focusrectangle = false
end type

type st_filter from statictext within w_pending_calls
boolean visible = false
integer x = 869
integer y = 280
integer width = 297
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "View Filter:"
boolean focusrectangle = false
end type

type ddlb_filter from dropdownlistbox within w_pending_calls
string tag = "select filter"
boolean visible = false
integer x = 1161
integer y = 276
integer width = 347
integer height = 400
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"1 hour","3 hours","6 hours","12 hours","1 day","3 days","7 days","14 days","ALL"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//ls_TimerStartFilter = this.text
//wf_mod_by_status(ls_StatusFilter,ls_TimerStartFilter)
end event

type st_9 from statictext within w_pending_calls
boolean visible = false
integer x = 3214
integer y = 68
integer width = 375
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Showing Status:"
boolean focusrectangle = false
end type

type st_status from statictext within w_pending_calls
boolean visible = false
integer x = 3214
integer y = 136
integer width = 617
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " "
boolean focusrectangle = false
end type

type pb_last from picturebutton within w_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Scroll to last call record as currently sorted."
boolean visible = false
integer x = 2601
integer y = 1668
integer width = 101
integer height = 84
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "last1.bmp"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;dw_1.scrolltorow(dw_1.rowcount())
end on

type st_19 from statictext within w_pending_calls
boolean visible = false
integer x = 2162
integer y = 324
integer width = 160
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "sec.~'s"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_readsecs from statictext within w_pending_calls
boolean visible = false
integer x = 2034
integer y = 592
integer width = 133
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "000"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_17 from statictext within w_pending_calls
boolean visible = false
integer x = 2016
integer y = 228
integer width = 206
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Every"
boolean focusrectangle = false
end type

type st_16 from statictext within w_pending_calls
boolean visible = false
integer x = 1294
integer y = 324
integer width = 306
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Next Read:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nextread from statictext within w_pending_calls
boolean visible = false
integer x = 1605
integer y = 372
integer width = 384
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "00:00:00 AM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_lastread from statictext within w_pending_calls
boolean visible = false
integer x = 1605
integer y = 228
integer width = 384
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "00:00:00 AM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_13 from statictext within w_pending_calls
boolean visible = false
integer x = 1294
integer y = 228
integer width = 306
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Last Read:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_pending_calls
event mousemove pbm_mousemove
boolean visible = false
integer x = 498
integer y = 508
integer width = 1225
integer height = 748
integer taborder = 20
string dataobject = "d_pending_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event mousemove;string cObject, cTag

// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is not down, so set MicroHelp()
	cObject = this.GetObjectAtPointer()   // Get object name

	// this takes care of "!" (bad Describe()) AND no object
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

event doubleclicked;//int nRowClicked
//string cCallClicked
//
//SetPointer( HourGlass! )
//// Obtains call number of clicked row and jumps to call screen
////nRowClicked = dw_1.GetClickedRow()
//nRowClicked = row
//If nRowClicked > 0 Then
//	cCallClicked = dw_1.GetItemString( nRowClicked, "call_number" )
//	If Len( cCallClicked ) > 0 Then
//		If IsValid( w_call_de ) Then
//			w_call_de.cPassCall = cCallClicked
//		End If
//		SetPointer( HourGlass! )
////              If UnitsToPixels( nScreenWidth, XUnitsToPixels! ) > 650 Then    // after 640x480 is 800x600
////                      OpenSheetWithParm( w_call_de2, cCallClicked, "w_call_de", &
////                              w_main, 0, Original! )
////              Else
//			OpenSheetWithParm( w_call_de, cCallClicked, "w_call_de", &
//				w_main, 0, Original! )
////              End If
//	Else
//		MessageBox( "Call Number Unknown", "The call you just selected " + &
//				"MAY NOT be jumped to on the Call Screen because the call number cannot " + &
//				"be determined.  Please make sure the tip of the cursor is " + &
//				"directly on the call number field when you double-click the mouse.", StopSign! )
//	End If
//End If

end event

type dw_1 from u_dw_maint within w_pending_calls
integer x = 37
integer y = 352
integer width = 3474
integer height = 1248
integer taborder = 60
string dataobject = "d_pending_calls"
boolean hscrollbar = true
borderstyle borderstyle = styleraised!
end type

event constructor;call super::constructor;//dwCurrDW = This

// ***** Set the columns and descriptions to find on.
isa_findcols[1] = "room"
isa_findcols[2] = "caller_category"
isa_findcols[3] = "guest"
isa_findcols[4] = "problem"
isa_findcols[5] = "subproblem"
isa_findcols[6] = "closed_bydept"
isa_findcols[7] = "repairman"
isa_findcols[8] = "problem_definition"
isa_findcols[9] = "call_number_numeric"
isa_findcols[10] = "timer_start"
isa_findcols[11] = "durationminutesopen"
isa_findcols[12] = "callstat_stat_desc"
isa_findcols[13] = "call_indate"


isa_finddesc[1] = "Room"
isa_finddesc[2] = "Caller Category"
isa_finddesc[3] = "Guest/Caller"
isa_finddesc[4] = "Task"
isa_finddesc[5] = "Sub Task"
isa_finddesc[6] = "Dept."
isa_finddesc[7] = "Handled By"
isa_finddesc[8] = "Task Definition"
isa_finddesc[9] = "Call Number"
isa_finddesc[10] = "Timer Start"
isa_finddesc[11] = "Duration"
isa_finddesc[12] = "Status"
isa_finddesc[13] = "Date Opened"

// ***** Set the columns and descriptions to sort on.
isa_sortcols[1]  = "room"
isa_sortcols[2]  = "caller_category"
isa_sortcols[3] = "guest"
isa_sortcols[4]  = "problem"
isa_sortcols[5]  = "subproblem"
isa_sortcols[6]  = "closed_bydept"
isa_sortcols[7]  = "repairman"
isa_sortcols[8]  = "problem_definition"
isa_sortcols[9]  = "call_number_numeric"
isa_sortcols[10]  = "timer_start"
isa_sortcols[11] = "durationminutesopen"
isa_sortcols[12] = "stat_code"
isa_sortcols[13] = "call_indate"
isa_sortcols[14] = "status_group"

isa_sortdesc[1] = "Room"
isa_sortdesc[2] = "Caller Category"
isa_sortdesc[3] = "Guest/Caller"
isa_sortdesc[4] = "Task"
isa_sortdesc[5] = "Sub Task"
isa_sortdesc[6] = "Dept."
isa_sortdesc[7] = "Handled By"
isa_sortdesc[8] = "Task Definition"
isa_sortdesc[9] = "Call Number"
isa_sortdesc[10] =  "Timer Start"
isa_sortdesc[11] = "Duration"
isa_sortdesc[12] = "Status"
isa_sortdesc[13] = "Date/Time Opened"
isa_sortdesc[14] = "Status Group"

// ***** for seeding
ii_seedtype = 1 // 1 = values, 0 = foreign keys
ii_seedmode = 1 // 0 = no, 1 = after insert, 2 = before save

isa_primkeycols[1] = "stat_code"
isa_primkeyvals[1] = "01"

isa_primkeycols[2] = "room"
isa_primkeyvals[2] = " "

// Set the column to get focus after insert.
is_firstcol = "room"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Call Data-Entry Screen changes are Un-Saved.  " + &
						"Would you like to save changes?"

// re-populate sub-problem, et. al.
//Set_dddw_Filters()





end event

on rowfocuschanged;call u_dw_maint::rowfocuschanged;dw_1.SelectRow(0,false)
end on

event ue_find;call super::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
	pb_findnext.Enabled = True
	pb_findprev.Enabled = True
Else
	pb_findnext.Enabled = False
	pb_findprev.Enabled = False
End If

end event

event doubleclicked;if row > 0 then
//	clickedColumn = this.GetColumnName()
//	MessageBox("column num",string(f_find_col_num(this.GetColumnName())) + " " + clickedColumn)
	pb_modify.TriggerEvent("clicked")
end if

end event

event clicked;call super::clicked;if row > 0 then
	//*** chg for multi-call close feature. Ming
	this.SelectRow(row,true)
	//*** chg for multi-call close feature. end
	pb_closecall.Enabled = true
	pb_copy.Enabled = true
	pb_modify.Enabled = true
else
	pb_closecall.Enabled = false
	pb_copy.Enabled = false
	pb_modify.Enabled = false
end if


end event

event retrieveend;IF this.find('repairman = ""',1,this.rowcount()) > 0 THEN
	if cSoundCard = 'Y' then
		beep(1)
	else
		Run(cAppPath+'SOUND5.exe', Minimized!)
	end if
	thereIsAUnassignCall = false
end if
wf_find_preopen_paging_call()
if not firstLoad then
	uint wavFlag
	if this.RowCount() > beforeRowCnt then
		if cSoundCard = 'N' then
			Run(cAppPath+'SOUND5.exe', Minimized!)
		else
			sndPlaySoundA ("Utopia Asterisk.WAV",wavFlag)
		end if
	end if
//else
//	sndPlaySoundA ("Utopia Asterisk.WAV",wavFlag)
end if
firstLoad = false
pb_refresh.enabled = true
SetMicroHelp( "refresh end!!!" )
//MessageBox("END","Refresh Ends!!!")
end event

event retrievestart;call super::retrievestart;beforeRowCnt = this.RowCount()
end event

event rbuttondown;call super::rbuttondown;//****chg for multi-call call feature. Ming
this.SelectRow(row,true)
pb_closecall.Enabled = true
int cnt, totalRowSelected
cnt=1
totalRowSelected = 0
do while cnt <= dw_1.rowcount()
	if dw_1.IsSelected(cnt) then
		totalRowSelected++
//		MessageBox("selected row",string(cnt))
	end if
	cnt++
loop
if totalRowSelected > 1 then
	// stop timer until calls are closed
	Timer(0,parent)
end if

//****chg for multi-call call feature. end
end event

