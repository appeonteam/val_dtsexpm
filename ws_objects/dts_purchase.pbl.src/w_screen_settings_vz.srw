$PBExportHeader$w_screen_settings_vz.srw
forward
global type w_screen_settings_vz from window
end type
type lb_1 from listbox within w_screen_settings_vz
end type
type cb_ok from commandbutton within w_screen_settings_vz
end type
type cb_cancel from commandbutton within w_screen_settings_vz
end type
type st_6 from statictext within w_screen_settings_vz
end type
type tab_setting from tab within w_screen_settings_vz
end type
type tabpage_pending from userobject within tab_setting
end type
type cb_sel_stat from commandbutton within tabpage_pending
end type
type cb_sel_dept from commandbutton within tabpage_pending
end type
type ddlb_filter from dropdownlistbox within tabpage_pending
end type
type st_5 from statictext within tabpage_pending
end type
type sle_dept_filter from singlelineedit within tabpage_pending
end type
type sle_status_filter from singlelineedit within tabpage_pending
end type
type st_4 from statictext within tabpage_pending
end type
type st_2 from statictext within tabpage_pending
end type
type sle_refresh_freq from singlelineedit within tabpage_pending
end type
type st_3 from statictext within tabpage_pending
end type
type st_1 from statictext within tabpage_pending
end type
type tabpage_pending from userobject within tab_setting
cb_sel_stat cb_sel_stat
cb_sel_dept cb_sel_dept
ddlb_filter ddlb_filter
st_5 st_5
sle_dept_filter sle_dept_filter
sle_status_filter sle_status_filter
st_4 st_4
st_2 st_2
sle_refresh_freq sle_refresh_freq
st_3 st_3
st_1 st_1
end type
type tabpage_timer from userobject within tab_setting
end type
type st_15 from statictext within tabpage_timer
end type
type sle_duration_time from singlelineedit within tabpage_timer
end type
type st_14 from statictext within tabpage_timer
end type
type st_12 from statictext within tabpage_timer
end type
type cb_2 from commandbutton within tabpage_timer
end type
type sle_dept_filter_t from singlelineedit within tabpage_timer
end type
type st_11 from statictext within tabpage_timer
end type
type sle_alarm_freq from singlelineedit within tabpage_timer
end type
type st_10 from statictext within tabpage_timer
end type
type st_9 from statictext within tabpage_timer
end type
type sle_refresh_freq_t from singlelineedit within tabpage_timer
end type
type st_8 from statictext within tabpage_timer
end type
type tabpage_timer from userobject within tab_setting
st_15 st_15
sle_duration_time sle_duration_time
st_14 st_14
st_12 st_12
cb_2 cb_2
sle_dept_filter_t sle_dept_filter_t
st_11 st_11
sle_alarm_freq sle_alarm_freq
st_10 st_10
st_9 st_9
sle_refresh_freq_t sle_refresh_freq_t
st_8 st_8
end type
type tabpage_callback from userobject within tab_setting
end type
type sle_dept_filter_c from singlelineedit within tabpage_callback
end type
type cb_1 from commandbutton within tabpage_callback
end type
type st_20 from statictext within tabpage_callback
end type
type st_19 from statictext within tabpage_callback
end type
type sle_call_within_mins from singlelineedit within tabpage_callback
end type
type st_18 from statictext within tabpage_callback
end type
type st_17 from statictext within tabpage_callback
end type
type sle_refresh_freq_c from singlelineedit within tabpage_callback
end type
type st_16 from statictext within tabpage_callback
end type
type tabpage_callback from userobject within tab_setting
sle_dept_filter_c sle_dept_filter_c
cb_1 cb_1
st_20 st_20
st_19 st_19
sle_call_within_mins sle_call_within_mins
st_18 st_18
st_17 st_17
sle_refresh_freq_c sle_refresh_freq_c
st_16 st_16
end type
type tabpage_callentry from userobject within tab_setting
end type
type cb_sel_room from commandbutton within tabpage_callentry
end type
type sle_room_allow_dup from singlelineedit within tabpage_callentry
end type
type st_24 from statictext within tabpage_callentry
end type
type cb_sel_except from commandbutton within tabpage_callentry
end type
type em_hist_limit from editmask within tabpage_callentry
end type
type sle_dup_exception from singlelineedit within tabpage_callentry
end type
type em_departure_def from editmask within tabpage_callentry
end type
type st_7 from statictext within tabpage_callentry
end type
type st_23 from statictext within tabpage_callentry
end type
type st_22 from statictext within tabpage_callentry
end type
type st_21 from statictext within tabpage_callentry
end type
type st_13 from statictext within tabpage_callentry
end type
type ddlb_show_call_hist from dropdownlistbox within tabpage_callentry
end type
type tabpage_callentry from userobject within tab_setting
cb_sel_room cb_sel_room
sle_room_allow_dup sle_room_allow_dup
st_24 st_24
cb_sel_except cb_sel_except
em_hist_limit em_hist_limit
sle_dup_exception sle_dup_exception
em_departure_def em_departure_def
st_7 st_7
st_23 st_23
st_22 st_22
st_21 st_21
st_13 st_13
ddlb_show_call_hist ddlb_show_call_hist
end type
type tabpage_phonebook from userobject within tab_setting
end type
type dw_parms from datawindow within tabpage_phonebook
end type
type cb_sel_dept_pb from commandbutton within tabpage_phonebook
end type
type sle_dept_filter_pb from singlelineedit within tabpage_phonebook
end type
type st_25 from statictext within tabpage_phonebook
end type
type tabpage_phonebook from userobject within tab_setting
dw_parms dw_parms
cb_sel_dept_pb cb_sel_dept_pb
sle_dept_filter_pb sle_dept_filter_pb
st_25 st_25
end type
type tab_setting from tab within w_screen_settings_vz
tabpage_pending tabpage_pending
tabpage_timer tabpage_timer
tabpage_callback tabpage_callback
tabpage_callentry tabpage_callentry
tabpage_phonebook tabpage_phonebook
end type
end forward

global type w_screen_settings_vz from window
string tag = "Settings"
integer width = 2432
integer height = 1536
boolean titlebar = true
string title = "Screen Settings"
windowtype windowtype = response!
long backcolor = 134217750
string icon = "WRENCH.ICO"
boolean center = true
lb_1 lb_1
cb_ok cb_ok
cb_cancel cb_cancel
st_6 st_6
tab_setting tab_setting
end type
global w_screen_settings_vz w_screen_settings_vz

type variables
string currOpen
int modifiedCount
datawindow idw_parms
window iwin
str_response istr_parms 

end variables

forward prototypes
public function boolean wf_load_selection_data (string seltype, string selectedstr)
public function boolean wf_save_pending_data_file ()
public subroutine wf_load_timer_data_file ()
public subroutine wf_load_pending_data_file ()
public subroutine wf_load_callback_data_file ()
public function boolean wf_save_timer_data_file ()
public function boolean wf_save_callback_data_file ()
public function string wf_return_selection_data ()
public function string wf_return_selection_data2 ()
public subroutine wf_load_callentry_data_file ()
public function boolean wf_save_callentry_data_file ()
public subroutine wf_load_data_file_vz (string as_screen, ref datawindow adw_parms)
end prototypes

public function boolean wf_load_selection_data (string seltype, string selectedstr);if lb_1.TotalItems() > 0 then
	do until lb_1.DeleteItem(1) = 0
	loop
end if
string itemStr, itemDelimiter
int startPos, endPos, foundIndex

//selType = Mid(Message.StringParm,1,Pos(Message.StringParm,'|') - 1)
//selectedStr = Mid(Message.StringParm,Pos(Message.StringParm,'|') + 1)
itemDelimiter = ','

if selType = 'dept' then
	pop_lb_from_db ( 'dept', 'instdept', lb_1 )
end if

if selType = 'stat' then
	pop_lb_from_db_2 ( 'stat_code','stat_desc', 'callstat', lb_1 )
end if

if selType = 'task' then
	itemDelimiter = '|'
	pop_lb_from_db_2 ( 'problem_desc','subproblem_desc', &
	'problem, subproblem where problem.problem_number=subproblem.problem_number order by problem_desc,subproblem_desc', lb_1 )
end if

if selType = 'room' then
	itemDelimiter = '|'
	pop_lb_from_db ("area_number",&
		"area order by area_number",lb_1)
//		"area where substring(area_number,1,1) not in ('0','1','2','3','4','5','6','7','8','9') order by area_number",lb_1)
end if

if Len(selectedStr) > 0 then
	startPos = 1
	Do until Pos(selectedStr,itemDelimiter, startPos) = 0
		endPos = Pos(selectedStr,itemDelimiter,startPos) - 1
		itemStr = Mid(selectedStr, startPos, endPos - startPos +1)
		foundIndex = lb_1.FindItem(itemStr,0)
		if foundIndex > 0 then
			lb_1.SetState(foundIndex,true)
		end if
		startPos = endPos + 2
	Loop
	itemStr = Mid(selectedStr,startPos)
	foundIndex = lb_1.FindItem(itemStr,0)
	if foundIndex > 0 then
		lb_1.SetState(foundIndex,true)
	end if
end if

return true



end function

public function boolean wf_save_pending_data_file ();int ret
ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Pending", &
					"ReadSeconds", tab_setting.tabpage_pending.sle_refresh_freq.text )
if ret < 0 then 
	MessageBox("write","write ReadSeconds failed!")
end if

ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Pending", &
					"statusFilter", tab_setting.tabpage_pending.sle_status_filter.text )
if ret < 0 then 
	MessageBox("write","write statusFilter failed!")
end if
					
ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Pending", &
					"StartTimerFilter", tab_setting.tabpage_pending.ddlb_filter.text)
if ret < 0 then 
	MessageBox("write","write StartTimerFilter failed!")
end if

ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Pending", &
					"Dept", tab_setting.tabpage_pending.sle_dept_filter.text)
if ret < 0 then 
	MessageBox("write","write Dept failed!")
end if
					
return true
end function

public subroutine wf_load_timer_data_file ();
tab_setting.tabpage_timer.sle_refresh_freq_t.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"timer", "ReadSeconds", '150' ) 

tab_setting.tabpage_timer.sle_alarm_freq.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"timer", "AlarmSeconds", '90' )

tab_setting.tabpage_timer.sle_duration_time.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"timer", "AlarmDurationSeconds", '5' )

tab_setting.tabpage_timer.sle_dept_filter_t.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"timer", "Dept", '' )


end subroutine

public subroutine wf_load_pending_data_file ();
tab_setting.tabpage_pending.sle_refresh_freq.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "ReadSeconds", '150' ) 

tab_setting.tabpage_pending.sle_status_filter.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "statusFilter", '' )

tab_setting.tabpage_pending.ddlb_filter.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "StartTimerFilter", '' )

tab_setting.tabpage_pending.sle_dept_filter.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Pending", "Dept", '' )

end subroutine

public subroutine wf_load_callback_data_file ();tab_setting.tabpage_callback.sle_refresh_freq_c.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"GuestCallBack", "ReadSeconds", '150' ) 

tab_setting.tabpage_callback.sle_call_within_mins.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"GuestCallBack", "CallWithinMins", '15' )

tab_setting.tabpage_callback.sle_dept_filter_c.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"GuestCallBack", "Dept", '' )
												
												
												
end subroutine

public function boolean wf_save_timer_data_file ();int ret
ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Timer", &
					"ReadSeconds", tab_setting.tabpage_timer.sle_refresh_freq_t.text )
if ret < 0 then 
	MessageBox("write","write ReadSeconds failed!")
end if

ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Timer", &
					"AlarmSeconds", tab_setting.tabpage_timer.sle_alarm_freq.text )
if ret < 0 then 
	MessageBox("write","write statusFilter failed!")
end if
					
ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Timer", &
					"AlarmDurationSeconds", tab_setting.tabpage_timer.sle_duration_time.text)
if ret < 0 then 
	MessageBox("write","write alarmDurationSeconds failed!")
end if

ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "Timer", &
					"Dept", tab_setting.tabpage_timer.sle_dept_filter_t.text)
if ret < 0 then 
	MessageBox("write","write Dept failed!")
end if

return true

											
										

end function

public function boolean wf_save_callback_data_file ();int ret
ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "GuestCallBack", &
					"ReadSeconds", tab_setting.tabpage_callback.sle_refresh_freq_c.text )
if ret < 0 then 
	MessageBox("write","write ReadSeconds failed!")
end if

ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "GuestCallBack", &
					"CallWithinMins", tab_setting.tabpage_callback.sle_call_within_mins.text )
if ret < 0 then 
	MessageBox("write","write statusFilter failed!")
end if
					
ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "GuestCallBack", &
					"Dept", tab_setting.tabpage_callback.sle_dept_filter_c.text)
if ret < 0 then 
	MessageBox("write","write Dept failed!")
end if


return true

end function

public function string wf_return_selection_data ();int cnt 
string itemStr, strpItem, retStr
retStr = ''
cnt = 1
Do until cnt >  lb_1.TotalItems()
	if lb_1.State (cnt) = 1 then
		itemStr = lb_1.text(cnt)
		if pos(itemStr,',') = 0 then
			strpItem = itemStr
		else
			strpItem = mid(itemStr,1,pos(itemStr,',') - 1)
		end if
		if retStr = '' then
			retStr = strpItem
		else
			retStr = retStr +',' +strpItem
		end if
	end if
	cnt = cnt + 1
Loop
return retStr
end function

public function string wf_return_selection_data2 ();int cnt 
string itemStr, retStr
retStr = ''
cnt = 1
Do until cnt >  lb_1.TotalItems()
	if lb_1.State (cnt) = 1 then
		itemStr = lb_1.text(cnt)
		if retStr = '' then
			retStr = itemStr
		else
			retStr = retStr +'|' +itemStr
		end if
	end if
	cnt = cnt + 1
Loop
return retStr
end function

public subroutine wf_load_callentry_data_file ();
tab_setting.tabpage_callentry.ddlb_show_call_hist.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "ShowGuestCallHistSw", 'NO' ) 

tab_setting.tabpage_callentry.em_hist_limit.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "GuestCallHistCutOffDays", '7' )

tab_setting.tabpage_callentry.em_departure_def.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "LnkTskByDeptTimeDef", '11:00' )

tab_setting.tabpage_callentry.sle_room_allow_dup.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "RoomAllowDup", '' )

tab_setting.tabpage_callentry.sle_dup_exception.text=&
	ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"CallDataEntry", "Dupcallexecption", '' )
end subroutine

public function boolean wf_save_callentry_data_file ();int ret
ret = SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "CallDataEntry", &
					"ShowGuestCallHistSw", tab_setting.tabpage_callentry.ddlb_show_call_hist.text )
if ret < 0 then 
	MessageBox("write","write ReadSeconds failed!")
end if

ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "CallDataEntry", &
					"GuestCallHistCutOffDays", tab_setting.tabpage_callentry.em_hist_limit.text )
if ret < 0 then 
	MessageBox("write","write statusFilter failed!")
end if
					
ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "CallDataEntry", &
					"LnkTskByDeptTimeDef", tab_setting.tabpage_callentry.em_departure_def.text)
if ret < 0 then 
	MessageBox("write","write StartTimerFilter failed!")
end if

ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "CallDataEntry", &
					"RoomAllowDup", tab_setting.tabpage_callentry.sle_room_allow_dup.text)
if ret < 0 then 
	MessageBox("write","write Dept failed!")
end if
		
ret=SetProfileString( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile, "CallDataEntry", &
					"Dupcallexecption", tab_setting.tabpage_callentry.sle_dup_exception.text)
if ret < 0 then 
	MessageBox("write","write Dept failed!")
end if

return true
end function

public subroutine wf_load_data_file_vz (string as_screen, ref datawindow adw_parms);string lsFile , lsFilter

lsFile = gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile 
lsFilter = ProfileString( lsFile, as_screen, "F1", '*ALL*' )
adw_parms.SetItem(1, 'parmvalue', lsFilter )

end subroutine

on w_screen_settings_vz.create
this.lb_1=create lb_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_6=create st_6
this.tab_setting=create tab_setting
this.Control[]={this.lb_1,&
this.cb_ok,&
this.cb_cancel,&
this.st_6,&
this.tab_setting}
end on

on w_screen_settings_vz.destroy
destroy(this.lb_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_6)
destroy(this.tab_setting)
end on

event open;currOpen = Message.StringParm
//MessageBox("Opening",Message.StringParm)
iwin = this
if currOpen = 'partmaint' then
	tab_setting.tabpage_phonebook.text = 'Part Maint' 
	tab_setting.tabpage_phonebook.enabled = true
	idw_parms = tab_setting.tabpage_phonebook.dw_parms
	idw_parms.InsertRow(0) 
	idw_parms.SetItem(1, 'parmname', 'Subcategory Filter')
	idw_parms.SetItem(1, 'parmvalue', '*ALL*')
	idw_parms.SetItem(1, 'lookuptype', 'WINDOW')
	idw_parms.SetItem(1, 'lookupprocessor', 'w_vzt_base_lookup')
	idw_parms.SetItem(1, 'weblookup_do', 'd_dddw_lookup_partsubcat') 	
	idw_parms.SetItem(1, 'weblookup_code_colname', 'code')
	idw_parms.SetItem(1, 'weblookup_disp_colname', 'descr')
	idw_parms.SetItem(1, 'weblookup_type', 'M')
	idw_parms.SetItem(1, 'numeric_list', 'N')
	 	
	this.wf_load_data_file_VZ('partmaint',idw_parms )
	tab_setting.post SelectTab(5)
elseif currOpen = 'phonebook' then
	tab_setting.tabpage_phonebook.enabled = true
	idw_parms = tab_setting.tabpage_phonebook.dw_parms
	idw_parms.InsertRow(0) 
	idw_parms.SetItem(1, 'parmname', 'Vendor Filter')
	idw_parms.SetItem(1, 'parmvalue', '*ALL*')
	idw_parms.SetItem(1, 'lookuptype', 'WINDOW')
	idw_parms.SetItem(1, 'lookupprocessor', 'w_vzt_base_lookup')
	idw_parms.SetItem(1, 'weblookup_do', 'd_dddw_lookup_cont_types1') 	
	idw_parms.SetItem(1, 'weblookup_code_colname', 'code')
	idw_parms.SetItem(1, 'weblookup_disp_colname', 'descr')
	idw_parms.SetItem(1, 'weblookup_type', 'M')
	idw_parms.SetItem(1, 'numeric_list', 'N')
	 	
	this.wf_load_data_file_VZ('phonebook',idw_parms )
	tab_setting.post SelectTab(5)
elseif currOpen = 'approvals' then
	tab_setting.tabpage_phonebook.text = 'Approvals' 
	tab_setting.tabpage_phonebook.enabled = true
	idw_parms = tab_setting.tabpage_phonebook.dw_parms
	idw_parms.InsertRow(0) 
	idw_parms.SetItem(1, 'parmname', 'Department')
	idw_parms.SetItem(1, 'parmvalue', '*ALL*')
	idw_parms.SetItem(1, 'lookuptype', 'WINDOW')
	idw_parms.SetItem(1, 'lookupprocessor', 'w_vzt_base_lookup')
	idw_parms.SetItem(1, 'weblookup_do', 'd_dddw_department') 	
	idw_parms.SetItem(1, 'weblookup_code_colname', 'dept')
	idw_parms.SetItem(1, 'weblookup_disp_colname', 'dept')
	idw_parms.SetItem(1, 'weblookup_type', 'M')
	idw_parms.SetItem(1, 'numeric_list', 'N')
	 	
	this.wf_load_data_file_VZ('approvals',idw_parms )
	tab_setting.post SelectTab(5)
else
	tab_setting.tabpage_phonebook.enabled = false
end if

if currOpen = 'pending' then
	tab_setting.tabpage_pending.enabled = true
	wf_load_pending_data_file()
else
	tab_setting.tabpage_pending.enabled = false 
end if

if currOpen = 'timer' then
	tab_setting.tabpage_timer.enabled = true
	tab_setting.MoveTab(2,1)
	wf_load_timer_data_file()
else
	tab_setting.tabpage_timer.enabled = false
end if

if currOpen = 'callback' then
	tab_setting.tabpage_callback.enabled = true
	tab_setting.MoveTab(3,1)
	wf_load_callback_data_file()
else
	tab_setting.tabpage_callback.enabled = false
end if

if currOpen = 'callentry' then
	tab_setting.tabpage_callentry.enabled = true
	tab_setting.MoveTab(4,1)
	wf_load_callentry_data_file()
else
	tab_setting.tabpage_callentry.enabled = false
end if

ModifiedCount = 0




end event

type lb_1 from listbox within w_screen_settings_vz
boolean visible = false
integer x = 1275
integer y = 800
integer width = 635
integer height = 556
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

type cb_ok from commandbutton within w_screen_settings_vz
integer x = 1230
integer y = 1188
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Ok"
boolean default = true
end type

event clicked;string returnVal
returnVal = ''
if ModifiedCount > 0 then 
	if currOpen = 'pending'	then
		wf_save_pending_data_file()
		returnVal = tab_setting.tabpage_pending.sle_refresh_freq.text+'|'+&
			tab_setting.tabpage_pending.sle_status_filter.text+'|'+&
			tab_setting.tabPage_pending.ddlb_filter.text+'|'+&
			tab_setting.tabPage_pending.sle_dept_filter.text	
	end if
	if currOpen = 'timer'	then
		wf_save_timer_data_file()
		returnVal = tab_setting.tabpage_timer.sle_refresh_freq_t.text+'|'+&
			tab_setting.tabpage_timer.sle_alarm_freq.text+'|'+&
			tab_setting.tabpage_timer.sle_duration_time.text+'|'+&
			tab_setting.tabPage_timer.sle_dept_filter_t.text	
	end if
	
	if currOpen = 'callback'	then
		wf_save_callback_data_file()
		returnVal = tab_setting.tabpage_callback.sle_refresh_freq_c.text+'|'+&
			tab_setting.tabpage_callback.sle_call_within_mins.text+'|'+&
			tab_setting.tabPage_callback.sle_dept_filter_c.text	
	end if
	
	if currOpen = 'callentry'	then
		wf_save_callentry_data_file()
		returnVal = tab_setting.tabpage_callentry.ddlb_show_call_hist.text+'!'+&
			tab_setting.tabpage_callentry.em_hist_limit.text+'!'+&
			tab_setting.tabpage_callentry.em_departure_def.text+'!'+&	
			tab_setting.tabpage_callentry.sle_room_allow_dup.text+'!'+&
			tab_setting.tabpage_callentry.sle_dup_exception.text	
	end if
	
end if
//===================================================
// Victors code 
//===================================================
string lsFile
lsFile = gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile 
//if Not FileExists(lsFile ) then 
//	int lihandle
//	lihandle = FileOpen( lsFile)
//	FileWrite(lihandle, '; ==== Screen Settings File'+'~r~n')
//	FileWrite(lihandle, '[phonebook]'+'~r~n')
//	FileWrite(lihandle, 'F1='+'~r~n')
//	FileClose(lihandle)
//end if 	

istr_parms.rc = 0
if IsValid(idw_parms) then 
	istr_parms.string1 = UPPER(f_nvl(idw_parms.GetItemString(1, 'parmvalue'),'')) // vendor types 
end if

choose case currOpen 
	case 'phonebook','partmaint','approvals'	//		vendortype	subcat
		SetProfileString(lsFile,currOpen, "F1", istr_parms.string1)
		CloseWithReturn(parent, istr_parms) 
case else
		CloseWithReturn(parent,returnVal)
end choose

end event

type cb_cancel from commandbutton within w_screen_settings_vz
integer x = 645
integer y = 1188
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;int ans
if ModifiedCount>0 then
	ans=MessageBox("Warning","Are you sure you want to cancel the changes?",Question!,YesNo!,2)
end if	
if ans=2 then 
	return
end if

istr_parms.rc = -1
choose case currOpen 
	case 'phonebook','partmaint','approvals' 	//		vz vendortype	subcat
		CloseWithReturn(parent, istr_parms) 
case else
		close(parent) 
end choose
	

end event

type st_6 from statictext within w_screen_settings_vz
integer x = 763
integer y = 44
integer width = 882
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean italic = true
long textcolor = 27354725
long backcolor = 134217750
string text = "Screen Display Settings"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type tab_setting from tab within w_screen_settings_vz
integer x = 64
integer y = 180
integer width = 2295
integer height = 964
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_pending tabpage_pending
tabpage_timer tabpage_timer
tabpage_callback tabpage_callback
tabpage_callentry tabpage_callentry
tabpage_phonebook tabpage_phonebook
end type

on tab_setting.create
this.tabpage_pending=create tabpage_pending
this.tabpage_timer=create tabpage_timer
this.tabpage_callback=create tabpage_callback
this.tabpage_callentry=create tabpage_callentry
this.tabpage_phonebook=create tabpage_phonebook
this.Control[]={this.tabpage_pending,&
this.tabpage_timer,&
this.tabpage_callback,&
this.tabpage_callentry,&
this.tabpage_phonebook}
end on

on tab_setting.destroy
destroy(this.tabpage_pending)
destroy(this.tabpage_timer)
destroy(this.tabpage_callback)
destroy(this.tabpage_callentry)
destroy(this.tabpage_phonebook)
end on

type tabpage_pending from userobject within tab_setting
integer x = 18
integer y = 112
integer width = 2258
integer height = 836
boolean border = true
long backcolor = 67108864
string text = "Pending"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_sel_stat cb_sel_stat
cb_sel_dept cb_sel_dept
ddlb_filter ddlb_filter
st_5 st_5
sle_dept_filter sle_dept_filter
sle_status_filter sle_status_filter
st_4 st_4
st_2 st_2
sle_refresh_freq sle_refresh_freq
st_3 st_3
st_1 st_1
end type

on tabpage_pending.create
this.cb_sel_stat=create cb_sel_stat
this.cb_sel_dept=create cb_sel_dept
this.ddlb_filter=create ddlb_filter
this.st_5=create st_5
this.sle_dept_filter=create sle_dept_filter
this.sle_status_filter=create sle_status_filter
this.st_4=create st_4
this.st_2=create st_2
this.sle_refresh_freq=create sle_refresh_freq
this.st_3=create st_3
this.st_1=create st_1
this.Control[]={this.cb_sel_stat,&
this.cb_sel_dept,&
this.ddlb_filter,&
this.st_5,&
this.sle_dept_filter,&
this.sle_status_filter,&
this.st_4,&
this.st_2,&
this.sle_refresh_freq,&
this.st_3,&
this.st_1}
end on

on tabpage_pending.destroy
destroy(this.cb_sel_stat)
destroy(this.cb_sel_dept)
destroy(this.ddlb_filter)
destroy(this.st_5)
destroy(this.sle_dept_filter)
destroy(this.sle_status_filter)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.sle_refresh_freq)
destroy(this.st_3)
destroy(this.st_1)
end on

type cb_sel_stat from commandbutton within tabpage_pending
integer x = 1358
integer y = 252
integer width = 242
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;//OpenWithParm(w_list_screen_selection,'stat|'+sle_status_filter.text)
//if sle_status_filter.text <> Message.StringParm then
//	sle_status_filter.text =  Message.StringParm
//	tab_setting.tabpage_pending.sle_status_filter.TriggerEvent("modified")
//end if
string stat_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_pending.cb_sel_stat.x - 604 then
		stat_str = wf_return_selection_data()
		if tab_setting.tabpage_pending.sle_status_filter.text <> stat_str then
			tab_setting.tabpage_pending.sle_status_filter.text = stat_str
			tab_setting.tabpage_pending.sle_status_filter.TriggerEvent("modified")
		end if
		cb_sel_stat.text = 'Select'
		lb_1.visible = false
		return
	else
		cb_sel_dept.text = 'Select'
	end if
end if
wf_load_selection_data('stat',sle_status_filter.text)
lb_1.x = tab_setting.tabpage_pending.cb_sel_stat.x - 604
lb_1.y = tab_setting.tabpage_pending.cb_sel_stat.y  + 304
lb_1.width = 686
lb_1.height = 556
cb_sel_stat.text = 'Done'
lb_1.visible=true


end event

event losefocus;//lb_1.visible = false
end event

type cb_sel_dept from commandbutton within tabpage_pending
integer x = 1902
integer y = 520
integer width = 242
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;string dept_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_pending.cb_sel_dept.x - 604 then
		dept_str = wf_return_selection_data()
		if sle_dept_filter.text <> dept_str then
			sle_dept_filter.text  = dept_str
			tab_setting.tabpage_pending.sle_dept_filter.TriggerEvent("modified")
		end if
		cb_sel_dept.text = 'Select'
		lb_1.visible = false
		return
	else
		cb_sel_stat.text = 'Select'
	end if
end if
wf_load_selection_data('dept',sle_dept_filter.text)
lb_1.x = tab_setting.tabpage_pending.cb_sel_dept.x - 604
lb_1.y = tab_setting.tabpage_pending.cb_sel_dept.y + 304
lb_1.width = 686
lb_1.height = 556
cb_sel_dept.text = 'Done'
lb_1.visible=true


end event

event losefocus;//lb_1.visible = false
end event

type ddlb_filter from dropdownlistbox within tabpage_pending
string tag = "select filter"
integer x = 677
integer y = 396
integer width = 411
integer height = 400
integer taborder = 40
integer textsize = -10
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

event selectionchanged;ModifiedCount = ModifiedCount+1
end event

type st_5 from statictext within tabpage_pending
integer x = 946
integer y = 124
integer width = 315
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seconds"
boolean focusrectangle = false
end type

type sle_dept_filter from singlelineedit within tabpage_pending
integer x = 677
integer y = 520
integer width = 1216
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type sle_status_filter from singlelineedit within tabpage_pending
integer x = 677
integer y = 252
integer width = 672
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_4 from statictext within tabpage_pending
integer x = 160
integer y = 540
integer width = 585
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Department Filter"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_pending
integer x = 361
integer y = 268
integer width = 352
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Call Status"
boolean focusrectangle = false
end type

type sle_refresh_freq from singlelineedit within tabpage_pending
integer x = 677
integer y = 108
integer width = 251
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_3 from statictext within tabpage_pending
integer x = 279
integer y = 416
integer width = 480
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Days to View"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_pending
integer x = 219
integer y = 128
integer width = 498
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Screen Refresh"
boolean focusrectangle = false
end type

type tabpage_timer from userobject within tab_setting
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2258
integer height = 836
long backcolor = 67108864
string text = "Timer"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_15 st_15
sle_duration_time sle_duration_time
st_14 st_14
st_12 st_12
cb_2 cb_2
sle_dept_filter_t sle_dept_filter_t
st_11 st_11
sle_alarm_freq sle_alarm_freq
st_10 st_10
st_9 st_9
sle_refresh_freq_t sle_refresh_freq_t
st_8 st_8
end type

on tabpage_timer.create
this.st_15=create st_15
this.sle_duration_time=create sle_duration_time
this.st_14=create st_14
this.st_12=create st_12
this.cb_2=create cb_2
this.sle_dept_filter_t=create sle_dept_filter_t
this.st_11=create st_11
this.sle_alarm_freq=create sle_alarm_freq
this.st_10=create st_10
this.st_9=create st_9
this.sle_refresh_freq_t=create sle_refresh_freq_t
this.st_8=create st_8
this.Control[]={this.st_15,&
this.sle_duration_time,&
this.st_14,&
this.st_12,&
this.cb_2,&
this.sle_dept_filter_t,&
this.st_11,&
this.sle_alarm_freq,&
this.st_10,&
this.st_9,&
this.sle_refresh_freq_t,&
this.st_8}
end on

on tabpage_timer.destroy
destroy(this.st_15)
destroy(this.sle_duration_time)
destroy(this.st_14)
destroy(this.st_12)
destroy(this.cb_2)
destroy(this.sle_dept_filter_t)
destroy(this.st_11)
destroy(this.sle_alarm_freq)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.sle_refresh_freq_t)
destroy(this.st_8)
end on

type st_15 from statictext within tabpage_timer
integer x = 965
integer y = 412
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seconds"
boolean focusrectangle = false
end type

type sle_duration_time from singlelineedit within tabpage_timer
integer x = 677
integer y = 400
integer width = 261
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_14 from statictext within tabpage_timer
integer x = 965
integer y = 272
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seconds"
boolean focusrectangle = false
end type

type st_12 from statictext within tabpage_timer
integer x = 311
integer y = 556
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Department:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within tabpage_timer
integer x = 1902
integer y = 544
integer width = 242
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;//OpenWithParm(w_list_screen_selection,'dept|'+sle_dept_filter_t.text)
//if sle_dept_filter_t.text <> Message.StringParm then
//	sle_dept_filter_t.text =  Message.StringParm
//	tab_setting.tabpage_timer.sle_dept_filter_t.TriggerEvent("modified")
//end if
string dept_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_timer.cb_2.x - 604 then
		dept_str = wf_return_selection_data()
		if sle_dept_filter_t.text <> dept_str then
			sle_dept_filter_t.text  = dept_str
			tab_setting.tabpage_timer.sle_dept_filter_t.TriggerEvent("modified")
		end if
		cb_2.text = 'Select'
		lb_1.visible = false
		return
	end if
end if
wf_load_selection_data('dept',sle_dept_filter_t.text)
lb_1.x = tab_setting.tabpage_timer.cb_2.x - 604
lb_1.y = tab_setting.tabpage_timer.cb_2.y + 304
lb_1.width = 686
lb_1.height = 556
cb_2.text = 'Done'
lb_1.visible=true



end event

type sle_dept_filter_t from singlelineedit within tabpage_timer
integer x = 677
integer y = 544
integer width = 1216
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_11 from statictext within tabpage_timer
integer x = 238
integer y = 412
integer width = 425
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Alarm Duration:"
boolean focusrectangle = false
end type

type sle_alarm_freq from singlelineedit within tabpage_timer
integer x = 677
integer y = 256
integer width = 261
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_10 from statictext within tabpage_timer
integer x = 123
integer y = 276
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Refresh Alert Every:"
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_timer
integer x = 965
integer y = 132
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seconds"
boolean focusrectangle = false
end type

type sle_refresh_freq_t from singlelineedit within tabpage_timer
integer x = 677
integer y = 108
integer width = 251
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_8 from statictext within tabpage_timer
integer x = 64
integer y = 128
integer width = 603
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Refresh Screen Every:"
boolean focusrectangle = false
end type

type tabpage_callback from userobject within tab_setting
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2258
integer height = 836
long backcolor = 67108864
string text = "Guest Call Back"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_dept_filter_c sle_dept_filter_c
cb_1 cb_1
st_20 st_20
st_19 st_19
sle_call_within_mins sle_call_within_mins
st_18 st_18
st_17 st_17
sle_refresh_freq_c sle_refresh_freq_c
st_16 st_16
end type

on tabpage_callback.create
this.sle_dept_filter_c=create sle_dept_filter_c
this.cb_1=create cb_1
this.st_20=create st_20
this.st_19=create st_19
this.sle_call_within_mins=create sle_call_within_mins
this.st_18=create st_18
this.st_17=create st_17
this.sle_refresh_freq_c=create sle_refresh_freq_c
this.st_16=create st_16
this.Control[]={this.sle_dept_filter_c,&
this.cb_1,&
this.st_20,&
this.st_19,&
this.sle_call_within_mins,&
this.st_18,&
this.st_17,&
this.sle_refresh_freq_c,&
this.st_16}
end on

on tabpage_callback.destroy
destroy(this.sle_dept_filter_c)
destroy(this.cb_1)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.sle_call_within_mins)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.sle_refresh_freq_c)
destroy(this.st_16)
end on

type sle_dept_filter_c from singlelineedit within tabpage_callback
integer x = 677
integer y = 476
integer width = 1216
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type cb_1 from commandbutton within tabpage_callback
integer x = 1902
integer y = 476
integer width = 242
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;//OpenWithParm(w_list_screen_selection,'dept|'+sle_dept_filter_c.text)
//if sle_dept_filter_c.text <> Message.StringParm then
//	sle_dept_filter_c.text =  Message.StringParm
//	tab_setting.tabpage_callback.sle_dept_filter_c.TriggerEvent("modified")
//end if

string dept_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_callback.cb_1.x - 604 then
		dept_str = wf_return_selection_data()
		if sle_dept_filter_c.text <> dept_str then
			sle_dept_filter_c.text  = dept_str
			tab_setting.tabpage_callback.sle_dept_filter_c.TriggerEvent("modified")
		end if
		cb_1.text = 'Select'
		lb_1.visible = false
		return
	end if
end if
wf_load_selection_data('dept',sle_dept_filter_c.text)
lb_1.x = tab_setting.tabpage_callback.cb_1.x - 604
lb_1.y = tab_setting.tabpage_callback.cb_1.y + 304
lb_1.width = 686
lb_1.height = 556
cb_1.text = 'Done'
lb_1.visible=true


end event

type st_20 from statictext within tabpage_callback
integer x = 343
integer y = 488
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Department:"
boolean focusrectangle = false
end type

type st_19 from statictext within tabpage_callback
integer x = 965
integer y = 308
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Minutes"
boolean focusrectangle = false
end type

type sle_call_within_mins from singlelineedit within tabpage_callback
integer x = 677
integer y = 292
integer width = 261
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_18 from statictext within tabpage_callback
integer x = 206
integer y = 308
integer width = 475
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Call Back Within:"
boolean focusrectangle = false
end type

type st_17 from statictext within tabpage_callback
integer x = 965
integer y = 128
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seconds"
boolean focusrectangle = false
end type

type sle_refresh_freq_c from singlelineedit within tabpage_callback
integer x = 677
integer y = 112
integer width = 251
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_16 from statictext within tabpage_callback
integer x = 78
integer y = 128
integer width = 603
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Refresh Screen Every:"
boolean focusrectangle = false
end type

type tabpage_callentry from userobject within tab_setting
integer x = 18
integer y = 112
integer width = 2258
integer height = 836
long backcolor = 67108864
string text = "Call Entry"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_sel_room cb_sel_room
sle_room_allow_dup sle_room_allow_dup
st_24 st_24
cb_sel_except cb_sel_except
em_hist_limit em_hist_limit
sle_dup_exception sle_dup_exception
em_departure_def em_departure_def
st_7 st_7
st_23 st_23
st_22 st_22
st_21 st_21
st_13 st_13
ddlb_show_call_hist ddlb_show_call_hist
end type

on tabpage_callentry.create
this.cb_sel_room=create cb_sel_room
this.sle_room_allow_dup=create sle_room_allow_dup
this.st_24=create st_24
this.cb_sel_except=create cb_sel_except
this.em_hist_limit=create em_hist_limit
this.sle_dup_exception=create sle_dup_exception
this.em_departure_def=create em_departure_def
this.st_7=create st_7
this.st_23=create st_23
this.st_22=create st_22
this.st_21=create st_21
this.st_13=create st_13
this.ddlb_show_call_hist=create ddlb_show_call_hist
this.Control[]={this.cb_sel_room,&
this.sle_room_allow_dup,&
this.st_24,&
this.cb_sel_except,&
this.em_hist_limit,&
this.sle_dup_exception,&
this.em_departure_def,&
this.st_7,&
this.st_23,&
this.st_22,&
this.st_21,&
this.st_13,&
this.ddlb_show_call_hist}
end on

on tabpage_callentry.destroy
destroy(this.cb_sel_room)
destroy(this.sle_room_allow_dup)
destroy(this.st_24)
destroy(this.cb_sel_except)
destroy(this.em_hist_limit)
destroy(this.sle_dup_exception)
destroy(this.em_departure_def)
destroy(this.st_7)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_21)
destroy(this.st_13)
destroy(this.ddlb_show_call_hist)
end on

type cb_sel_room from commandbutton within tabpage_callentry
integer x = 1998
integer y = 468
integer width = 242
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;//OpenWithParm(w_list_screen_selection,'dept|'+sle_dept_filter.text)
//if sle_dept_filter.text <> Message.StringParm then
//	sle_dept_filter.text =  Message.StringParm
//	tab_setting.tabpage_pending.sle_dept_filter.TriggerEvent("modified")
//end if
string room_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_callentry.cb_sel_room.x - 604 then
		room_str = wf_return_selection_data2()
		if sle_room_allow_dup.text <> room_str then
			sle_room_allow_dup.text  = room_str
			tab_setting.tabpage_callentry.sle_room_allow_dup.TriggerEvent("modified")
		end if
		cb_sel_room.text = 'Select'
		lb_1.visible = false
		return
	else
		cb_sel_room.text = 'Select'
	end if
end if
wf_load_selection_data('room',sle_room_allow_dup.text)
lb_1.x = tab_setting.tabpage_callentry.cb_sel_room.x - 604
lb_1.y = tab_setting.tabpage_callentry.cb_sel_room.y + 304
lb_1.width = 686
lb_1.height = 556
cb_sel_room.text = 'Done'
lb_1.visible=true



end event

event losefocus;//lb_1.visible = false
end event

type sle_room_allow_dup from singlelineedit within tabpage_callentry
integer x = 878
integer y = 464
integer width = 1111
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_24 from statictext within tabpage_callentry
integer x = 105
integer y = 472
integer width = 759
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Duplicate Allow for Room:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_sel_except from commandbutton within tabpage_callentry
integer x = 1998
integer y = 596
integer width = 242
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;//OpenWithParm(w_list_screen_selection,'dept|'+sle_dept_filter.text)
//if sle_dept_filter.text <> Message.StringParm then
//	sle_dept_filter.text =  Message.StringParm
//	tab_setting.tabpage_pending.sle_dept_filter.TriggerEvent("modified")
//end if
string exception_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_callentry.cb_sel_except.x - 1116 then
		exception_str = wf_return_selection_data2()
		if sle_dup_exception.text <> exception_str then
			sle_dup_exception.text  = exception_str
			tab_setting.tabpage_callentry.sle_dup_exception.TriggerEvent("modified")
		end if
		cb_sel_except.text = 'Select'
		lb_1.visible = false
		return
	else
		cb_sel_except.text = 'Select'
	end if
end if
wf_load_selection_data('task',sle_dup_exception.text)
lb_1.x = tab_setting.tabpage_callentry.cb_sel_except.x - 1116
lb_1.y = tab_setting.tabpage_callentry.cb_sel_except.y + 295
lb_1.width = 1200
lb_1.height = 570
cb_sel_except.text = 'Done'
lb_1.visible=true


end event

event losefocus;//lb_1.visible = false
end event

type em_hist_limit from editmask within tabpage_callentry
integer x = 878
integer y = 200
integer width = 265
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "7"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type sle_dup_exception from singlelineedit within tabpage_callentry
integer x = 878
integer y = 592
integer width = 1115
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type em_departure_def from editmask within tabpage_callentry
integer x = 878
integer y = 340
integer width = 265
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_7 from statictext within tabpage_callentry
integer x = 1143
integer y = 220
integer width = 187
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Day(s)"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_23 from statictext within tabpage_callentry
integer x = 87
integer y = 608
integer width = 773
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Duplicate Allow for Task:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_22 from statictext within tabpage_callentry
integer x = 32
integer y = 344
integer width = 827
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Guest Departure Default Time:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_21 from statictext within tabpage_callentry
integer x = 32
integer y = 216
integer width = 827
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Guest Call History Limit:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_13 from statictext within tabpage_callentry
integer x = 32
integer y = 84
integer width = 827
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Show Guest Call History:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_show_call_hist from dropdownlistbox within tabpage_callentry
integer x = 878
integer y = 72
integer width = 265
integer height = 252
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 1
string item[] = {"Yes","No"}
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type tabpage_phonebook from userobject within tab_setting
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2258
integer height = 836
long backcolor = 67108864
string text = "Phone Book"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_parms dw_parms
cb_sel_dept_pb cb_sel_dept_pb
sle_dept_filter_pb sle_dept_filter_pb
st_25 st_25
end type

on tabpage_phonebook.create
this.dw_parms=create dw_parms
this.cb_sel_dept_pb=create cb_sel_dept_pb
this.sle_dept_filter_pb=create sle_dept_filter_pb
this.st_25=create st_25
this.Control[]={this.dw_parms,&
this.cb_sel_dept_pb,&
this.sle_dept_filter_pb,&
this.st_25}
end on

on tabpage_phonebook.destroy
destroy(this.dw_parms)
destroy(this.cb_sel_dept_pb)
destroy(this.sle_dept_filter_pb)
destroy(this.st_25)
end on

type dw_parms from datawindow within tabpage_phonebook
integer x = 18
integer y = 28
integer width = 2194
integer height = 596
integer taborder = 30
string title = "none"
string dataobject = "d_vzt_mm_rpt_parms"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string ls_parmtype, ls_lookuptype, ls_lookupprocessor,ls_parmvalue, ls_newvalue, ls_autoreplace
string ls_numlist, ls_newdescr
window  lw_processor
DataWindowChild  dwchild
//str_rptgen_reportparms lst_parms
st_lookup_parm		lst_lparms
st_lookup_ret		lst_retparms

If row <= 0 or row > this.RowCount() then return
If this.accepttext() <> 1 then return 

ls_parmtype 			= trim( this.object.parmtype 	[row] )
ls_lookuptype 			= this.object.lookuptype 		[row] 
ls_lookupprocessor 	= this.object.lookupprocessor [row] 
ls_autoreplace			= UPPER( this.object.autoreplace	[row] )
ls_numlist				= UPPER( this.object.numeric_list [row] )
lst_lparms.selection = UPPER( this.object.weblookup_type [row] )

//parenttab.tabposition = TabsOnBottom! 
long ll_x, ll_y, ll_w, ll_h, ll_rc

ll_y = parent.y
ll_y = parent.y
ll_y = this.y
ll_y = long(this.object.parmvalue.y)
ll_y = long(this.object.datawindow.detail.height)

ll_x = long(this.object.parmvalue.x) + parent.x + this.x
ll_y = long(this.object.parmvalue.y) + parent.y + this.y +parent.y+ ((row - 1) * long(this.object.datawindow.detail.height)) + long(this.object.datawindow.header.height)
ll_x = ll_x  + tab_setting.x + iwin.x + 180
ll_y = ll_y  + tab_setting.y + iwin.y + 200
//MessageBox('lookup', string(dwo.name)+':~r~nX:'+string(dwo.x)+':~r~nY:'+string(dwo.y))

// get current value
CHOOSE CASE ls_parmtype 
	CASE 'DATE'
		ls_parmvalue = string( this.object.parmdate [row],"yyyy mmm dd" )
		this.SetColumn('parmdate')
		
		if ls_autoreplace	= 'Y' then 
			ls_lookupprocessor 	= 'w_vzt_replace_lookup' 			
			ls_lookuptype 			= 'WINDOW'
		END IF
	CASE 'DATETIME'
		ls_parmvalue = string( this.object.parmdate [row], "yyyy mmm dd" )
		this.SetColumn('parmdate')
		if ls_autoreplace	= 'Y' then 
			ls_lookupprocessor 	= 'w_vzt_replace_lookup' 			
			ls_lookuptype 			= 'WINDOW'
		END IF
	CASE 'STRING'
		this.SetColumn('parmvalue')
		ls_parmvalue = this.object.parmvalue [row] 
	CASE 'NUMBER'
		this.SetColumn('parmnum')
		ls_parmvalue = string( this.object.parmnum [row] )
		 
END CHOOSE

this.SetRow(row) 
this.ScrollToRow(row) 
		
if ls_lookupprocessor = '' or isNull (ls_lookupprocessor) then return 

CHOOSE CASE ls_lookuptype 	
	CASE 'DDDW'
	CASE 'UO'
		userobject uo_lookup
	//	parenttab.visible = false
//      ll_rc = parenttab.w_parent.OpenUserObjectWithParm(uo_lookup, "ccc", "u_multi_select_01", ll_x, ll_y)
//   	if ll_rc <> 1 then messagebox('lookup error' , ' object creation failed')
//		uo_lookup.bringtotop = true
//		uo_lookup.triggerevent ("size_open")
	CASE 'WINDOW'
		lst_lparms.parmvalue = ls_parmvalue
		lst_lparms.codecol	= this.object.weblookup_code_colname [row]
		lst_lparms.desccol	= this.object.weblookup_disp_colname [row]
		lst_lparms.dataobject= this.object.weblookup_do [row]
		lst_lparms.x = ll_x 
		lst_lparms.y = ll_y 
		lst_lparms.numlist	= ls_numlist
	   OpenWithParm(lw_processor, lst_lparms , ls_lookupprocessor )
	CASE ELSE
		return
END CHOOSE

//ls_newvalue = message.stringparm 
lst_retparms = message.PowerObjectPArm
ls_newvalue  = lst_retparms.newvalue
ls_newdescr  = lst_retparms.newdescr

this.SetFocus()

If ls_newvalue =  "CANCEL" then
    return
Else
	CHOOSE CASE Upper(ls_parmtype )
		CASE 'DATE'
			if ls_autoreplace	= 'Y' then 
			   this.object.replacetype [row] = TRIM(UPPER(ls_newvalue ))
			Else
			   this.object.parmdate [row] = datetime( date( ls_newvalue ), time("00:00 AM") )
			END IF
		CASE 'STRING'
			this.object.parmvalue [row] = ls_newvalue 
			this.object.parmdescr [row] = ls_newdescr 
	
		CASE 'NUMBER'
			If IsNumber( ls_newvalue ) then this.object.parmnumber [row] = dec( ls_newvalue ) 
	END CHOOSE
End If
//this.event ue_dateset()

end event

type cb_sel_dept_pb from commandbutton within tabpage_phonebook
boolean visible = false
integer x = 1989
integer y = 632
integer width = 242
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;//OpenWithParm(w_list_screen_selection,'dept|'+sle_dept_filter.text)
//if sle_dept_filter.text <> Message.StringParm then
//	sle_dept_filter.text =  Message.StringParm
//	tab_setting.tabpage_pending.sle_dept_filter.TriggerEvent("modified")
//end if
string dept_str
if lb_1.visible = true then
	if lb_1.x = tab_setting.tabpage_phonebook.cb_sel_dept_pb.x - 604 then
		dept_str = wf_return_selection_data()
		if sle_dept_filter_pb.text <> dept_str then
			sle_dept_filter_pb.text  = dept_str
			tab_setting.tabpage_phonebook.sle_dept_filter_pb.TriggerEvent("modified")
		end if
		cb_sel_dept_pb.text = 'Select'
		lb_1.visible = false
		return
	else

	end if
end if
wf_load_selection_data('dept',sle_dept_filter_pb.text)
lb_1.x = tab_setting.tabpage_phonebook.cb_sel_dept_pb.x - 604
lb_1.y = tab_setting.tabpage_phonebook.cb_sel_dept_pb.y + 304
lb_1.width = 686
lb_1.height = 556
cb_sel_dept_pb.text = 'Done'
lb_1.visible=true


end event

type sle_dept_filter_pb from singlelineedit within tabpage_phonebook
boolean visible = false
integer x = 1010
integer y = 732
integer width = 1216
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ModifiedCount = ModifiedCount+1
end event

type st_25 from statictext within tabpage_phonebook
boolean visible = false
integer x = 334
integer y = 736
integer width = 585
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Vendor Type Filter"
boolean focusrectangle = false
end type

