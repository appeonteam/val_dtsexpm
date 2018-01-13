$PBExportHeader$w_callback_upd.srw
forward
global type w_callback_upd from w_call_upd
end type
end forward

global type w_callback_upd from w_call_upd
string tag = "Call Back Update"
integer height = 2096
string title = "Call Back Update"
end type
global w_callback_upd w_callback_upd

type variables
string callback_num
boolean initDeptByOpen 
end variables

forward prototypes
public subroutine wf_set_callback_data ()
public function boolean wf_update_callback_status (string callback_call_number)
public subroutine wf_set_tab_order (integer tabmode)
end prototypes

public subroutine wf_set_callback_data ();
string origProblem, origSubproblem, origTaskDef

select 	room,
			room_dsc,
			guest,
			caller,
			caller_category,
			problem,
			subproblem,
			problem_definition
into		:sRoom,
			:sRoomDsc,
			:sGuest,
			:sCaller,
			:sCallerCategory,
			:origProblem,
			:origSubproblem,
			:origTaskDef
from		closedcalls
where		call_number = :callback_num;
if sqlca.sqlcode <> 0 then
	if sqlca.sqlcode = 100 then
		MessageBox("Database Error","closedcalls not found! ", StopSign!)
		return 
else
		MessageBox("Database Error",sqlca.sqlerrtext, StopSign!)
		return 
	end if
end if			

select	problem_number
into		:sProblemNumber
from		problem
where		upper(problem_desc) = 'CALL BACK';

if sqlca.sqlcode <> 0 then
	if sqlca.sqlcode = 100 then
		MessageBox("Database Error","Problem not found in problem table. ", StopSign!)
		return 
else
		MessageBox("Database Error",sqlca.sqlerrtext, StopSign!)
		return 
	end if
end if		
	
if isnull(origTaskDef) then
	origTaskDef=''
end if
dw_1.SetItem(dw_1.GetRow(),"room",sRoom)
dw_1.SetItem(dw_1.GetRow(),"room_dsc",sRoomDsc)
dw_1.SetItem(dw_1.GetRow(),"guest",sGuest)
dw_1.SetItem(dw_1.GetRow(),"caller",sCaller)
dw_1.SetItem(dw_1.GetRow(),"caller_category",sCallerCategory)
dw_1.SetItem(dw_1.GetRow(),"problem_problem_number",sProblemNumber)
dw_1.SetItem(dw_1.GetRow(),"shift",sShift)
dw_1.SetItem(dw_1.GetRow(),"problem_definition", &
	"Ref#"+callback_num +", "+ trim(origProblem)+"/"+trim(origSubproblem) + &
	", TASK DEF: " + trim(origTaskDef))

if sClosedBydept <> "" then
	dw_1.SetItem(dw_1.GetRow(),"closed_bydept",sClosedByDept)
	dw_1.SetItem(dw_1.GetRow(),"repairman",sRepairman)
end if
	

sProblem					= "Call Back"
wf_validate_problem(sProblemNumber)

//sCallNumber				= dw_1.GetItemString(dw_1.GetRow(),"call_number")
dtCallIndate			= dw_1.GetItemDatetime(dw_1.GetRow(),"call_indate")
//sStatCode				= dw_1.GetItemString(dw_1.GetRow(),"stat_code")
//sRoom						= dw_1.GetItemString(dw_1.GetRow(),"room")
//sGuest					= dw_1.GetItemString(dw_1.GetRow(),"guest")
//sCaller					= dw_1.GetItemString(dw_1.GetRow(),"caller")
//sProblem					= dw_1.GetItemString(dw_1.GetRow(),"problem")
//sSubproblem				= dw_1.GetItemString(dw_1.GetRow(),"subproblem")
sProblemDefinition	= dw_1.GetItemString(dw_1.GetRow(),"problem_definition")
//sComplaint				= dw_1.GetItemString(dw_1.GetRow(),"complaint")
sReceiver				= dw_1.GetItemString(dw_1.GetRow(),"receiver")
//sShift					= dw_1.GetItemString(dw_1.GetRow(),"shift")
//sResolution				= dw_1.GetItemString(dw_1.GetRow(),"resolution")
//sRepairman				= dw_1.GetItemString(dw_1.GetRow(),"repairman")
//dtCallOutdate			= dw_1.GetItemDatetime(dw_1.GetRow(),"call_outdate")		
//sClosedBy				= dw_1.GetItemString(dw_1.GetRow(),"closed_by")
//sClosedBydept			= dw_1.GetItemString(dw_1.GetRow(),"closed_bydept")
//sTimerNumber			= dw_1.GetItemString(dw_1.GetRow(),"timer_number")
dtTimerStart			= dw_1.GetItemDatetime(dw_1.GetRow(),"timer_start")
//sCallerCategory		= dw_1.GetItemString(dw_1.GetRow(),"caller_category")
//sProblemNumber			= dw_1.GetItemString(dw_1.GetRow(),"problem_problem_number")
//sSubproblemNumber		= dw_1.GetItemString(dw_1.GetRow(),"subproblem_subproblem_number")
//dTimer1StartMin		= dw_1.GetItemNumber(dw_1.GetRow(),"timer1_start_min")
//dTimer2StartMin		= dw_1.GetItemNumber(dw_1.GetRow(),"timer2_start_min")
//dTimer1Reps				= dw_1.GetItemNumber(dw_1.GetRow(),"timer1_reps")
//dTimer2Reps				= dw_1.GetItemNumber(dw_1.GetRow(),"timer2_reps")
//sAuthTakeOffTimer		= dw_1.GetItemString(dw_1.GetRow(),"auth_take_off_timer")
//sDefaultStatus			= dw_1.GetItemString(dw_1.GetRow(),"default_status")   
//sPreOpenable			= dw_1.GetItemString(dw_1.GetRow(),"pre_openable")
//sPreOpened				= dw_1.GetItemString(dw_1.GetRow(),"pre_opened")
//iTimerLevel				= dw_1.GetItemNumber(dw_1.GetRow(),"timer_level")
//sRoomDsc					= dw_1.GetItemString(dw_1.GetRow(),"room_dsc")
sOpenedStatus			= dw_1.GetItemString(dw_1.GetRow(),"opened_status")
//sRecurInd				= dw_1.GetItemString(dw_1.GetRow(),"recur_ind")
//dRecurId					= dw_1.GetItemNumber(dw_1.GetRow(),"recur_id")
end subroutine

public function boolean wf_update_callback_status (string callback_call_number);string ls_error, ls_code
update closedcalls
set	 called_back_ind = 'Y'
where	 call_number = :callback_call_number;
If sqlca.SQLCode <> 0 Then        
	ls_error =  sqlca.SQLerrtext
	ls_code	=  string( sqlca.SQLCode) 
	ROLLBACK;
	MessageBox('Database Update Error', 'Failed to update call record. ~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	return false
END IF

return true
end function

public subroutine wf_set_tab_order (integer tabmode);if tabmode = 4 then 
	dw_1.SetTabOrder("call_number",0)
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
	dw_1.SetTabOrder("subproblem",10)
	dw_1.SetTabOrder("closed_bydept",20)
	dw_1.SetTabOrder("repairman",30)
	dw_1.SetTabOrder("problem_definition",0)
	dw_1.SetTabOrder("resolution",50)
	
end if

if tabmode = 5 then 
	dw_1.SetTabOrder("call_number",0)
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

on w_callback_upd.create
int iCurrent
call super::create
end on

on w_callback_upd.destroy
call super::destroy
end on

event open;string cTempReadVar 

// SFM 10/26/97 Determine db type and switch dataobjects if need be

IF cappdbtype = 'MSSQL' THEN
	dw_1.dataobject = 'd_timercalls_upd_mssql'
END IF



windowIsAlreadyOpen = false
p_1.Visible = false
st_banner.Text = cRegSite
SetMicroHelp( "Opening Callback Data Entry screen...please wait." )

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
callType = "closedcalls"

//MessageBox("info","got here!")
wf_load_shift_data() 

dw_1.SetTransObject(sqlca)
tableSelectStr = dw_1.Describe("DataWindow.Table.Select")

f_mod_dw_dt_disp(dw_1,"call_indate")
f_mod_dw_dt_disp(dw_1,"timer_start") 
wf_mod_datetime_mask("timer_start") 
f_mod_dw_dt_disp(dw_1,"call_outdate")

f_mod_dw_dt_disp(dw_2,"call_indate")
f_mod_dw_dt_disp(dw_2,"timer_start") 
f_mod_dw_dt_disp(dw_2,"call_outdate")

if not wf_modify_data_source("timercalls",callType) then
	return
end if

// if intended opencall(pending,closed or timer) type is not equal to default(timer)
// modify DW "table.select"

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

callback_num=Mid(Message.StringParm,4)
dw_1.InsertRow(0)
wf_initialize_call_variables(0)
initDeptByOpen = true
cb_add.TriggerEvent("clicked")
wf_set_callback_data()
//colToSet = integer(Mid(Message.StringParm,2,2))
wf_set_tab_order(4)
p_1.enabled = false
colToSet = 8 //subtask column
postEvent("ue_setcol")

//MessageBox("resolution_t",dw_1.describe("resolution_t.text"))
dw_1.Modify("resolution_t.text='Comment/Res:'")
dw_1.SetFocus()

//MessageBox("validation",dw_1.GetValidate ( "subproblem"))

Timer(.055, This )

SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
end event

event timer;Timer( 0, this )   

//dw_1.Retrieve()
st_2.Text = " " + String( Now(), "dddd") + " "
st_3.Text = " " + String( Now(), cReportLongDateFormatStr2) + " "

Timer( 120, this ) // Now we'll reset

end event

event ue_refresh;dw_1.DeleteRow(0)
dw_1.InsertRow(0)
wf_initialize_call_variables(0)
cb_add.TriggerEvent("clicked")
wf_set_callback_data()
wf_set_tab_order(4)
colToSet = 8 //subtask column
postEvent("ue_setcol")

dw_1.SetFocus()

end event

event ue_add;call super::ue_add;st_mode.text = 'Guest Call Back'
string callback_emp, callback_emp_alt
//if pos(sReceiver,',') = 0 then
//	callback_emp = sReceiver
//else
//	callback_emp = mid(sReceiver, pos(sReceiver,',')+2) + ' ' + & 
//		mid(sReceiver,1, pos(sReceiver,',')-1) 
//end if
callback_emp = sReceiver
if pos(sReceiver,',') > 0 then
	callback_emp_alt = mid(sReceiver, pos(sReceiver,',')+2) + ' ' + & 
		mid(sReceiver,1, pos(sReceiver,',')-1) 
else
	callback_emp_alt = mid(sReceiver, pos(sReceiver,' ')+1)+', '+ &
		mid(sReceiver,1, pos(sReceiver,' ')-1)
end if
	

select 	dept 
into		:sClosedBydept
from 		instemp 
where		employee in (:callback_emp,:callback_emp_alt);
if sqlca.sqlcode <> 0 then
	if sqlca.sqlcode = 100 then
		if initDeptByOpen then
			MessageBox("Warning","You are a User, but your name does not exist in the Employee table. "+&
			"You will have to select Department and Handled By manually!")
		end if
		sClosedBydept=''
	else
		sClosedBydept=''
//		MessageBox("Error",sqlca.sqlerrtext+"! Handle by dept will not be auto-assign!")
	end if
else
	sRepairman = callback_emp
end if	

end event

type pb_4 from w_call_upd`pb_4 within w_callback_upd
integer x = 1115
integer y = 1496
end type

event pb_4::clicked;double dCallNumber
callType = 'closedcalls'
dCallNumber = wf_call_number()
if dCallNumber > 0 then
	sCallNumber = string(dCallNumber)
else
	return 
end if
//if sSubproblemNumber = '' then
////	MessageBox("inserting","timer call!")
//	wf_update_callback_status(Mid(Message.StringParm,4))
//	wf_insert_call(1)
//	dw_1.ResetUpdate()
//	cb_add.TriggerEvent(clicked!)
//	If IsValid( w_call_back ) Then
//		open(w_call_back)
//	end if
//	return
//end if

if sSubproblemNumber = "" then
	MessageBox("Required","task/sub-task info is required. Try again !")
	return
end if

if sClosedByDept = "" or sRepairman = "" then
	MessageBox("Required","Handling info is required. Try again !")
	return
end if

//MessageBox("inserting","closed call!")
wf_update_callback_status(callback_num)
sStatCode = '99'
wf_insert_call(3)
dw_1.ResetUpdate()
initDeptByOpen = false
cb_add.TriggerEvent(clicked!)
wf_set_tab_order(5)
If IsValid( w_call_back ) Then
	w_call_back.cb_refresh.TriggerEvent(clicked!)
	open(w_call_back)
end if

end event

type p_2 from w_call_upd`p_2 within w_callback_upd
end type

type pb_9 from w_call_upd`pb_9 within w_callback_upd
boolean visible = false
end type

type pb_8 from w_call_upd`pb_8 within w_callback_upd
integer x = 1870
integer y = 1496
end type

type pb_7 from w_call_upd`pb_7 within w_callback_upd
boolean visible = false
end type

type pb_6 from w_call_upd`pb_6 within w_callback_upd
integer x = 1490
integer y = 1496
string text = "&Cancel"
end type

event pb_6::clicked;dw_1.ResetUpdate()
copiedCall = false
timerStartModified = false
dw_1.Reset()
initDeptByOpen = false
cb_add.TriggerEvent("clicked")

end event

type pb_5 from w_call_upd`pb_5 within w_callback_upd
boolean visible = false
end type

type pb_3 from w_call_upd`pb_3 within w_callback_upd
boolean visible = false
end type

type dw_2 from w_call_upd`dw_2 within w_callback_upd
end type

type st_bannerleftchar from w_call_upd`st_bannerleftchar within w_callback_upd
end type

type st_bannerrightchar from w_call_upd`st_bannerrightchar within w_callback_upd
end type

type st_3 from w_call_upd`st_3 within w_callback_upd
end type

type st_2 from w_call_upd`st_2 within w_callback_upd
end type

type st_mode from w_call_upd`st_mode within w_callback_upd
string tag = "Current window Mode"
integer x = 2331
integer y = 20
integer width = 448
integer height = 144
integer textsize = -11
string text = "Guest Call Back"
end type

type st_banner from w_call_upd`st_banner within w_callback_upd
end type

type p_1 from w_call_upd`p_1 within w_callback_upd
end type

type pb_2 from w_call_upd`pb_2 within w_callback_upd
end type

type pb_1 from w_call_upd`pb_1 within w_callback_upd
boolean visible = false
end type

type dw_1 from w_call_upd`dw_1 within w_callback_upd
end type

event dw_1::ue_hide_dddw;string curCol

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
		if this.SetColumn("resolution") < 0 then
			MessageBox("Error","SetColumn error: resolution")
		end if

END CHOOSE
end if


usedMouse = false
end event

type cb_copy from w_call_upd`cb_copy within w_callback_upd
integer x = 2222
integer y = 1364
end type

type cb_modify from w_call_upd`cb_modify within w_callback_upd
end type

type cb_closecall from w_call_upd`cb_closecall within w_callback_upd
end type

type cb_delete from w_call_upd`cb_delete within w_callback_upd
end type

type cb_save from w_call_upd`cb_save within w_callback_upd
end type

event cb_save::clicked;double dCallNumber
callType = 'closedcalls'
dCallNumber = wf_call_number()
if dCallNumber > 0 then
	sCallNumber = string(dCallNumber)
else
	return 
end if
//if sSubproblemNumber = '' then
////	MessageBox("inserting","timer call!")
//	wf_update_callback_status(Mid(Message.StringParm,4))
//	wf_insert_call(1)
//	dw_1.ResetUpdate()
//	cb_add.TriggerEvent(clicked!)
//	If IsValid( w_call_back ) Then
//		open(w_call_back)
//	end if
//	return
//end if

if sSubproblemNumber = "" then
	MessageBox("Required","task/sub-task info is required. Try again !")
	return
end if

if sClosedByDept = "" or sRepairman = "" then
	MessageBox("Required","Handling info is required. Try again !")
	return
end if

//MessageBox("inserting","closed call!")
wf_update_callback_status(callback_num)
sStatCode = '99'
wf_insert_call(3)
dw_1.ResetUpdate()
initDeptByOpen = false
cb_add.TriggerEvent(clicked!)
wf_set_tab_order(5)
If IsValid( w_call_back ) Then
	w_call_back.cb_refresh.TriggerEvent(clicked!)
	open(w_call_back)
end if

end event

type cb_reset from w_call_upd`cb_reset within w_callback_upd
integer x = 1321
string text = " &Cancel"
end type

event cb_reset::clicked;
dw_1.ResetUpdate()
copiedCall = false
timerStartModified = false
dw_1.Reset()
initDeptByOpen = false
cb_add.TriggerEvent("clicked")


end event

type cb_close from w_call_upd`cb_close within w_callback_upd
integer x = 1632
end type

type cb_add from w_call_upd`cb_add within w_callback_upd
end type

event cb_add::clicked;Parent.TriggerEvent("ue_add")
If IsValid(w_callback_upd) THEN
//	if colToSet > 0 then
//		Parent.PostEvent("ue_setcol")
//	end if
end if

end event

type uo_1 from w_call_upd`uo_1 within w_callback_upd
boolean visible = false
end type

type cb_retrieve from w_call_upd`cb_retrieve within w_callback_upd
end type

