$PBExportHeader$w_send_page.srw
forward
global type w_send_page from window
end type
type ole_1 from olecustomcontrol within w_send_page
end type
type cb_3 from commandbutton within w_send_page
end type
type st_link from statictext within w_send_page
end type
type cbx_ltrace from checkbox within w_send_page
end type
type cb_view from commandbutton within w_send_page
end type
type cb_2 from commandbutton within w_send_page
end type
type st_1 from statictext within w_send_page
end type
type cbx_ptrace from checkbox within w_send_page
end type
type sle_tfile from singlelineedit within w_send_page
end type
type cb_email from commandbutton within w_send_page
end type
type cb_start from commandbutton within w_send_page
end type
type em_timer from editmask within w_send_page
end type
type st_timer from rectangle within w_send_page
end type
type cb_1 from commandbutton within w_send_page
end type
type cb_delete from commandbutton within w_send_page
end type
type dw_2 from datawindow within w_send_page
end type
type st_date from statictext within w_send_page
end type
type mle_1 from multilineedit within w_send_page
end type
type p_1 from picture within w_send_page
end type
type dw_1 from datawindow within w_send_page
end type
type cb_resend from commandbutton within w_send_page
end type
type cb_sort from commandbutton within w_send_page
end type
type cb_menu_page from commandbutton within w_send_page
end type
type cb_refresh from commandbutton within w_send_page
end type
type cb_exit from commandbutton within w_send_page
end type
type st_border from rectangle within w_send_page
end type
type lb_1 from listbox within w_send_page
end type
type cb_save from commandbutton within w_send_page
end type
type lb_2 from listbox within w_send_page
end type
type cb_test_espa from commandbutton within w_send_page
end type
end forward

global type w_send_page from window
string tag = "Paging Auto-timer screen"
integer x = 1074
integer y = 480
integer width = 3525
integer height = 1924
boolean titlebar = true
string title = "Paging Timer"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 80269528
string icon = "Pager.ico"
event ue_printrpt ( )
event ue_settest ( )
event type long ue_refresh ( )
event ue_translate ( )
event ue_page_all ( )
event type integer ue_timer_on ( boolean ab_timer_on )
event ue_send_dialup ( )
event type integer ue_process_return ( datetime adt_date,  string as_retcode,  string as_level )
event type integer ue_update_error ( string as_error_msg )
event ue_create_uo ( )
event ue_trace ( string ls_hdr,  string ls_msg )
ole_1 ole_1
cb_3 cb_3
st_link st_link
cbx_ltrace cbx_ltrace
cb_view cb_view
cb_2 cb_2
st_1 st_1
cbx_ptrace cbx_ptrace
sle_tfile sle_tfile
cb_email cb_email
cb_start cb_start
em_timer em_timer
st_timer st_timer
cb_1 cb_1
cb_delete cb_delete
dw_2 dw_2
st_date st_date
mle_1 mle_1
p_1 p_1
dw_1 dw_1
cb_resend cb_resend
cb_sort cb_sort
cb_menu_page cb_menu_page
cb_refresh cb_refresh
cb_exit cb_exit
st_border st_border
lb_1 lb_1
cb_save cb_save
lb_2 lb_2
cb_test_espa cb_test_espa
end type
global w_send_page w_send_page

type variables
boolean 	ib_closing=false
string 	is_language, is_reminder_txt, errorDesc
integer 	errorNo,  	currentStage, refreshTimerCnt
integer 	retryCount,  nakretryCount,  rc
boolean 	TapLinkOpen = false
string 	pagerIdStr, messageStr, comStr
string 	callNumToUpd[], emptyStrArray[], callPageCnt[]
long 	callRow[], emptyIntArray[],  delayCount
string 	callAssignId[],  is_pager_time_mask
string 	is_crlf = '~r~n'
uo_vzt_tcp_metro_page 	uo_snpp
uo_espa_test		uo_espa

string	is_linktrace
string 	is_dept
string	is_ts_on_sw

string 	is_text_dir, is_smpp_dir, is_email_dir
string	is_msg_size

//string cPageSysCd

boolean is_snpp_open = false
boolean is_espa_open = false
boolean is_comport_open = false


end variables

forward prototypes
public function boolean wf_determin_time_interval (integer timer_min, string time_last_sent)
public function string wf_preopen_send_msg (string pre_open, integer init_paging_min, datetime timer_start)
public function boolean wf_open_tap_link ()
public subroutine wf_send_cr ()
public subroutine wf_send_eot ()
public subroutine wf_send_escape_pg1 ()
public function string wf_calc_checksum (string msg)
public function boolean wf_send_tap_msg (string pagerid, string msg)
public subroutine wf_sending_tap_msg (string msg)
public function boolean wf_wait_ack1 ()
public function boolean wf_wait_ack2 ()
public function boolean wf_wait_id ()
public subroutine wf_send_sa_page (string pagerid, string msg)
public subroutine wf_format_dialup_str (string inPagerId, string inMsg)
public function boolean wf_send_dialup_page (string pageridstring, string msgstring)
public function boolean wf_send_espa_msg (string pagerid, string msg)
public function integer wf_portopen ()
public subroutine wf_trace (string as_input)
public function boolean wf_open_espa_link (string as_pagerid)
public subroutine wf_send_string (string as_string, integer ai_stage, string as_message)
public function integer wf_wait_espa (string as_string, integer ai_newstage, string as_message)
public function boolean wf_send_snpp_page (ref string pagerid, ref string msg, string as_level)
public function boolean wf_reassign_call ()
public subroutine wf_set_dept_filter (string dept_str)
public subroutine wf_send_tx_msg (string pagerid, string msg)
public function string wf_shorten_txt (string intext, integer txtsize)
public subroutine wf_create_uo ()
public function boolean wf_upd_tables (string as_callnum, string as_pagecnt, string as_assid, long al_dwrow, string as_paging_type)
public subroutine wf_send_salcom_page (string pagerid, string msg)
public subroutine wf_send_page (long al_currow, string as_type, boolean ab_confirm, integer as_paged)
public function string wf_format_msg (string msgtype, string incallnum, string inroom, string inguest, string intask, string insubtask, string intaskdef, string inreminder, string indate, string inemployee, integer inpagecnt, string inspecialmsg, string indept, string inroomno)
public subroutine wf_read_smpp_file ()
public function boolean wf_find_emp_by_pagerid (string in_pager_id, ref string out_emp_name, ref string out_dept)
public function boolean wf_declinecalls (string in_call_number, integer call_tbl_ind, string username)
public function boolean wf_remove_declined_pageassignment (string in_call_number)
public function boolean wf_clear_auto_assignment (integer call_tbl_ind, string in_call_number, integer in_timer_min)
end prototypes

event ue_printrpt;if (dw_1.ShareData(dw_2)) < 0 then
	this.event ue_trace( "Failed","Sharedata fails!")
	return
end if
dw_2.print()
end event

event ue_settest;If gs_debugmode = 'Y' then 
	cb_test_espa.visible = true
	//mle_1.visible = true
end if

end event

event type long ue_refresh();if not cb_refresh.enabled then return 0

this.event ue_timer_on (true) 

long ll_rows 
integer ll_items,ll_txt_end
string smpp_action, smpp_call_num, smpp_pager_id, smpp_emp, smpp_dept, ls_retmsg
timer(0)
SetPointer( Hourglass!)

lb_1.DirList(is_text_dir+"*.SMP",0)
if lb_1.TotalItems() > 0 then
	ll_items = 1
	do while ll_items <= lb_1.TotalItems()
		ll_txt_end = pos(lb_1.Text(ll_items),".SMP") -1
		if ll_txt_end = 0 then
			ll_txt_end = pos(lb_1.Text(ll_items),".smp") //trap lower case name
		end if
		smpp_action = Mid(lb_1.Text(ll_items),1,3)
//		smpp_call_num= Mid(lb_1.Text(ll_items),4,6)
//		smpp_pager_id = Mid(lb_1.Text(ll_items),10,ll_txt_end -10)
		smpp_call_num= Mid(lb_1.Text(ll_items),4, ll_txt_end - 3 - nPagerIdDigit )
		smpp_pager_id = Mid(lb_1.Text(ll_items),ll_txt_end - nPagerIdDigit + 1, nPagerIdDigit	)


		wf_find_emp_by_pagerid(smpp_pager_id, smpp_emp, smpp_dept)
		
		CHOOSE CASE upper(smpp_action)
			CASE 'CLS' // close call
				f_close_a_call_common (smpp_call_num, '1', f_sysdate(), true, smpp_emp, smpp_dept )
			CASE 'DEC' // decline call
				f_declined_calls (smpp_call_num,1,smpp_emp)
			CASE 'DND' //Do-Not-Disturb call
				f_set_dnd_call (smpp_call_num,1,smpp_emp)
		END CHOOSE
		FileDelete(is_text_dir+lb_1.Text(ll_items))
		ll_items++
	loop
end if
ll_rows 	= dw_1.Retrieve() 
if ll_rows > 0 then
	this.event ue_page_all()		// resets ib_refresh flag 
else
	if ll_rows < 0 then
		egm_sqlerror(sqlca)
	end if
	this.event ue_timer_on ( false)
end if

SetPointer( Arrow!)

return ll_rows
end event

event ue_translate;string ls_datemask1, ls_datemask2
SELECT language, datemask1 , datemask2 INTO :is_language, :ls_datemask1, :ls_datemask2 FROM vzt_sysoptions WHERE id = 1;
is_language 			= f_nvl( is_language , '')
// Translate window strings (id, lang, default )
is_reminder_txt = f_vzt_translate('reminder', is_language, 'reminder') 

ls_datemask1			= lower( trim(f_nvl( ls_datemask1, '')))
ls_datemask2			= lower( trim(f_nvl( ls_datemask2, '')))

If ls_datemask1 		= '' then ls_datemask1 = 'mm/dd/yy' // default US
ls_datemask1 = f_replace ( ls_datemask1 , 'yyyy', 'yy') // enforce 2 digit year 
If ls_datemask2 		= '' then ls_datemask2 = 'h:mam/pm' // default US
is_pager_time_mask 	= ls_datemask1 + ' ' + ls_datemask2 
IF is_pager_time_mask = '' then is_pager_time_mask = 'm/d h:mmam/pm' // US default


end event

event ue_page_all();string 	pageSent, ls_callnum, ls_now
int 		li_prow, n, li_pageCnt
time 		starttime 
string 	curDt, ls_twoway_status, ls_twoway_status_mgr, ls_twoway_status_rem
long 		ll_rowcount

string 	ls_preopened, ls_msg, ls_ascode
int		li_init_min
datetime ldt_timer_start


ll_rowcount = dw_1.rowCount() 

pagerIdStr = ""
messageStr = ""

if ll_rowcount>0 then 
	cPageSysCd = dw_1.GetItemString(1,"pagers_pager_type")
	if pos(cPageSysCd,'SN') > 0  then
		if not is_snpp_open then wf_create_uo() 
	elseif pos(cPageSysCd,'ES') > 0 then
		if not is_espa_open then wf_create_uo()
	else
		if cPageSysCd = 'SA' or cPageSysCd ='VS' or cPageSysCd = 'OT' or &
			cPageSysCd = 'SC' then
			if not is_comport_open then wf_portopen() 
		end if
	end if
end if

if cPageSysCd <> 'TX' and cPageSysCd <> 'EML' then // do not open comm port on text mode 
	this.wf_portopen () // reset the commport 
end if

FOR li_prow = 1 to ll_rowcount 
	dw_1.SelectRow( 0, false)
	dw_1.SetRow( li_prow)
	dw_1.ScrollToRow( li_prow)
	
	cPageSysCd = dw_1.GetItemString(li_prow,"pagers_pager_type") //get pager type each call
	
//	MessageBox("settings","SysCd:"+cPageSysCd+" comport:"+string(gi_comport)+" settings:"+gs_settings)
//	gi_comport 	
//	gs_settings 

	
	ls_now					= f_nvl(string( datetime(today(), now())),'')
	ls_callnum				= f_nvl( dw_1.GetItemString(li_prow,"call_number"),'')	
	li_pageCnt				= f_nvl(integer( dw_1.GetItemString(li_prow,"paging_ind")),0)
	pageSent 				= f_nvl(dw_1.GetItemString(li_prow,"page_sent"),'')
	ls_twoway_status 		= f_nvl(dw_1.GetItemString(li_prow,"twoway_status") ,'')
	ls_twoway_status_rem	= f_nvl(dw_1.GetItemString(li_prow,"twoway_status_rem") ,'')
	ls_twoway_status_mgr = f_nvl(dw_1.GetItemString(li_prow,"twoway_status_mgr"),'')  

	If li_pageCnt > 0 then pageSent = "Y" //make sure flags agree
	
	If POS(cPageSysCd, 'SN') > 0  then // SNPP special processing
		If POS( '.E.' , ls_twoway_status ) > 0 then 	continue // SNPP error

		//if two way sent - check status - original page
		If POS( 'S.D.' , ls_twoway_status ) > 0 then 	// sent or delivered 
			dw_1.SelectRow( li_prow , true )
			this.event ue_trace( 'Paging Loop-SNPP' + ls_now, 'b4 Two way check status 2S')
			wf_send_page(li_prow, '2S', false,li_pageCnt)	// check for status
			this.event ue_trace( 'Paging Loop-SNPP' + ls_now, 'aft Two way check status 2S')
		END IF
		//if two way sent - check status - reminder page
		If POS( 'S.D.' , ls_twoway_status_rem ) > 0 then 	// sent or delivered 
			dw_1.SelectRow( li_prow , true )
			this.event ue_trace( 'Paging Loop-SNPP' + ls_now, 'b4 Two way check status 2SR')
			wf_send_page(li_prow, '2SR', false,li_pageCnt)	// check for status
			this.event ue_trace( 'Paging Loop-SNPP' + ls_now, 'aft Two way check status 2SR')
		END IF

		If POS( 'S.D.' , ls_twoway_status_mgr ) > 0 then 	// sent or delivered 
			dw_1.SelectRow( li_prow , true )
			this.event ue_trace( 'Paging Loop-SNPP'+ ls_now, 'b4 Two way check status mgr 2SM')
			wf_send_page(li_prow, '2SM', false, li_pageCnt)	// check for status
			this.event ue_trace( 'Paging Loop-SNPP'+ ls_now, 'aft Two way check status mgr 2SM')
		END IF
	END IF // SNPP 
	
	If li_pageCnt >= 4 and pageSent = "Y"  then continue // no more pages will be sent

	ls_ascode = f_nvl( dw_1.GetItemString(li_prow,"assignment_cd") ,'')
	if ls_ascode = 'T' then
		ls_preopened 		= f_nvl(dw_1.GetItemString(li_prow,"timercalls_pre_opened"),'')
		li_init_min  		= f_nvl(dw_1.GetItemNumber(li_prow,"timercalls_init_paging_min"),0)
		ldt_timer_start	= dw_1.GetItemDatetime(li_prow,"timer_start")
		ls_msg	= '~r~nPaging Call:'+ls_callnum +&
				+'~r~nPreopened='+ls_preopened &
				+'~r~nInit page min:' +string(li_init_min ) &
				+'~r~nTimer start:'+string(ldt_timer_start) &
				+'~r~nPage Sent flag:'+pageSent &
				+'~r~nPage Count:'+string(li_pageCnt) + '~r~n'
		//clipboard( ls_msg)				
		this.event ue_trace( 'Paging Loop-(code=T)'+ ls_now, ls_msg + ' ===================================================')
				
		if pageSent = 'N' then 
			if li_pageCnt = 0 and wf_preopen_send_msg( ls_preopened, li_init_min, ldt_timer_start) = 'Y' then
				dw_1.SelectRow( li_prow , true )
				this.event ue_trace( 'Paging Schedule (pagecnt = 0)', ls_msg+'b4 Original Page Sent')
				wf_send_page(li_prow, 'EMP', false,li_pageCnt)	// orig page
				this.event ue_trace( 'Paging Schedule (pagecnt = 0)', ls_msg+'aft Original Page Sent')
			ELSE
				this.event ue_trace( 'Paging Schedule (pagesent=N + pagecnt <> 0: error !!!!)', ls_msg+'Original Page NOT Sent')
			end if
		else
			this.event ue_trace( 'Paging Schedule (pageSent <> N)', ls_msg+'Original Page NOT Sent')
			
			CHOOSE CASE li_pageCnt
			CASE 1
			if datetime(today(),now()) >= dw_1.GetItemDatetime(li_prow,"timer_start") then
				dw_1.SelectRow( li_prow , true )
				this.event ue_trace( 'Paging Schedule', ls_msg+'b4 Reminder Sent')
				wf_send_page(li_prow, 'EMPR', false,li_pageCnt)	// reminder 
				this.event ue_trace('Paging Schedule', ls_msg+'aft Reminder Sent')
			ELSE
				this.event ue_trace('Paging Schedule', ls_msg+'Reminder NOT Sent')
			end if						

			CASE 2 
			if wf_determin_time_interval(dw_1.GetItemNumber(li_prow,"timer2_start_min"),&
					dw_1.GetItemString(li_prow,"time_page_sent")) then
				dw_1.SelectRow( li_prow , true )
				this.event ue_trace( 'Paging Schedule', ls_msg+'b4 MGR page Sent')
				wf_send_page(li_prow, 'MGR', false,li_pageCnt)		// supervisor escalation
				this.event ue_trace( 'Paging Schedule', ls_msg+'aft MGR page Sent')
			ELSE
				this.event ue_trace( 'Paging Schedule', ls_msg+'MGR page NOT Sent')
			end if		
			CASE 3 
			if wf_determin_time_interval(dw_1.GetItemNumber(li_prow,"timer3_start_min"),&
					dw_1.GetItemString(li_prow,"time_page_sent")) then
				dw_1.SelectRow( li_prow , true )
				this.event ue_trace( 'Paging Schedule', ls_msg+'b4 MGR page Sent')
				wf_send_page(li_prow, 'MGR', false,li_pageCnt)		// manager escalation
				this.event ue_trace( 'Paging Schedule', ls_msg+'aft MGR page Sent')
			ELSE
				this.event ue_trace( 'Paging Schedule', ls_msg+'MGR page NOT Sent')
			end if					
			CASE ELSE // 
				this.event ue_trace( 'Paging Schedule', ls_msg+'page count=' + f_nvl(string(li_pageCnt),'') + '. Page not sent')
		  END CHOOSE // pagecount 
		end if 	// pagesent = N
	
	else
		if ls_ascode = 'N' then // assignement_cd = 'N' -- no pager 
			this.event ue_trace( 'Paging Schedule', 'b4 Sending MGRNOP - MGR, No pager')
			dw_1.SelectRow( li_prow , true )
			wf_send_page(li_prow, 'MGRNOP', false, li_pageCnt)		
			this.event ue_trace( 'Paging Schedule', 'aft Sending MGRNOP - MGR, No pager')
		else // assignement_cd = 'M' --- direct (manual) paging 
			this.event ue_trace( 'Paging Schedule', 'b4 Sending Direct paging')
			dw_1.SelectRow( li_prow , true )
			wf_send_page(li_prow, 'EMPR', false, li_pageCnt)		
			this.event ue_trace( 'Paging Schedule', 'aft Sending Direct paging')
		end if
	end if
NEXT
dw_1.SelectRow( 0, false)

//if cPageSysCd = "DI" then 
if pageridstr <> "" then this.event ue_send_dialup() // all dialup at the end
this.event ue_timer_on ( false)

return 
end event

event type integer ue_timer_on(boolean ab_timer_on);if ab_timer_on then
	timer(0)
	cb_exit.enabled	 		= false
	cb_refresh.enabled 		= false
	cb_resend.enabled	 		= false
//	cb_menu_page.enabled	 	= false
	
ELSE
	cb_exit.enabled	 = true
	cb_refresh.enabled = true
	st_timer.visible 	 = false
	cb_resend.enabled	 = true
//	cb_menu_page.enabled	 = true
	timer(nPagingRefresh)
END IF

return 1
end event

event ue_send_dialup();
//if cPageSysCd = "DI" then // Dialup connection will send all pages at once
	if pagerIdStr <> "" then
		if wf_send_dialup_page(pagerIdStr,messageStr) = true then
			int z
			for z=1 to UpperBound(callNumToUpd) step 1
				wf_upd_tables (callNumToUpd[z], callPageCnt[z], callAssignId[z],callrow[z],' ')
			Next
		end if
	end if
//end if

pagerIdStr 		= ""
messageStr		= ""
callNumToUpd 	= emptyStrArray
callPageCnt 	= emptyStrArray
callRow 			= emptyIntArray
callAssignId 	= emptyStrArray

end event

event type integer ue_process_return(datetime adt_date, string as_retcode, string as_level);If POS( 'D,CL,MR,CM', as_retcode) <= 0 then return 1

string 	ls_callnumber, ls_table, ls_pid , ls_close_rc
long		ll_crow
string 	ls_emp, ls_Dept, ls_mgr
int		li_page_sent 
//			twoway_time_received,   
//       twoway_time_sent_orig,   
//       twoway_time_sent_mgr,   
//       twoway_time_received_mgr,   
//       twoway_retcode_mgr,   
//       twoway_tag_mgr,   
//       twoway_passcode_mgr,   
//       twoway_status_mgr  

ll_crow  = dw_1.GetRow()
If ll_crow <= 0 then return  1

ls_table			= dw_1.GetItemString( ll_crow, 'targettable') 
ls_pid			= dw_1.GetItemString( ll_crow, 'assignment_id') 
ls_callnumber	= trim(dw_1.GetItemString(ll_crow,"call_number"))
ls_emp  			= trim(dw_1.GetItemString(ll_crow,"emp_name")) 
ls_dept			= trim(dw_1.GetItemString(ll_crow,"dept_assigned")) 
ls_mgr			= trim(dw_1.GetItemString(ll_crow,"dept_assigned"))
//ls_page_sent  	= dw_1.GetItemNumber(ll_crow,"page_sent")   // VZ 0208 2006
string ls_page
ls_page = dw_1.GetItemString(ll_crow,"paging_ind")   // VZ 0208 2006
li_page_sent = 0
If IsNumber(ls_page ) then li_page_sent = integer(ls_page ) 	

this.event ue_trace( "ue_process return: level:"+ as_level, "call num:"+ls_callnumber+", retcode:"+as_retcode + ", emp:" + ls_emp + ", dept:" + ls_dept+ ", mgr:" + ls_mgr + ", PID:" + ls_pid + ", table:" + ls_table )		

CHOOSE CASE as_retcode

CASE 'DC'	//DC DECLINE CALL- empl. declined assigned call 
//	if this.wf_reassign_call() = false then 
//			UPDATE pageassignment 
//			SET twoway_time_received_mgr 	= :adt_date ,
//				twoway_status_mgr				= 'MRF'
//			WHERE assignment_id 				= :ls_pid; 
//			f_end_tran0( SQLCA, '','','') // commmit or rollback
//			wf_send_page(ll_crow, 'MGR_NOAR', false, li_page_sent )	
//	
//	end if
//**** Ming commented out above and added below to handle declined call by employee. 7/4/2007
	wf_declinecalls(ls_callnumber, integer(ls_table), ls_emp)

CASE 'MR'	// manager requested auto-reassign 
			if this.wf_reassign_call() = false then 
				UPDATE pageassignment 
				SET twoway_time_received_mgr 	= :adt_date ,
					twoway_status_mgr				= 'MRF'
				WHERE assignment_id 				= :ls_pid; 
				f_end_tran0( SQLCA, '','','') // commmit or rollback

				wf_send_page(ll_crow, 'MGR_NOAR', false, li_page_sent )	
			end if
	CASE 'D'		// delivered - update time 
		IF as_level = '2S' then // emp status 
			UPDATE pageassignment 
			SET 	twoway_retcode 		= :as_retcode, 
					twoway_time_received = :adt_date ,
					twoway_status 			= 'D'
			WHERE assignment_id 			= :ls_pid; 
		ElseIF as_level = '2SR' then // emp reminder status 
			UPDATE pageassignment 
			SET 	twoway_retcode 		= :as_retcode, 
					twoway_status_rem		= 'D'
			WHERE assignment_id 			= :ls_pid; 
		ElseIf as_level = '2SM' then // mgr status 
			UPDATE pageassignment 
			SET twoway_time_received_mgr 	= :adt_date ,
				twoway_status_mgr				= 'D'
			WHERE assignment_id 				= :ls_pid; 
		END IF 
		f_end_tran0( SQLCA, '','','') // commmit or rollback
		this.event ue_trace( "ue_process return: Page delivered. level:"+ as_level, "call num:"+ls_callnumber+", retcode:"+as_retcode + ", emp:" + ls_emp + ", dept:" + ls_dept+ ", mgr:" + ls_mgr + ", PID:" + ls_pid + ", table:" + ls_table )		

CASE 'CL', 'CM' // employee or manager closed the call 
	// UPDATE the page row and Close the call 	
		UPDATE pageassignment 
		SET 	twoway_retcode = :as_retcode, 
				twoway_retdate = :adt_date ,
				twoway_status 	= 'C'
		WHERE assignment_id = :ls_pid; 
	// Get Emp. name or MGR name who closed the call 
		CHOOSE CASE as_retcode
			CASE 'CL'  // employee closed the call 
				ls_close_rc = f_close_a_call_common( ls_callnumber, ls_table, adt_date, false, ls_emp, ls_dept) // no message 
			CASE 'CM'  // manager closed the call 
				// Get Mgr Name  
				select employee INTO :ls_mgr 
				from instemp e, deptmgr m 
				where m.deptmgr_id = e.employee_number and 
				m.dept = :ls_dept;
				If IsNull(ls_mgr ) or trim(ls_mgr) ='' then ls_mgr = trim(ls_dept)+' manager'
				this.event ue_trace( 'Closing Call', 'mgr =' + ls_mgr )
				ls_close_rc = f_close_a_call_common( ls_callnumber, ls_table, adt_date, false, ls_mgr, ls_dept) // no message 
		END CHOOSE 
		this.event ue_trace( "ue_process return: Close Call request. Level:"+ as_level , "call num:"+ls_callnumber+", retcode:"+as_retcode + ", emp:" + ls_emp + ", dept:" + ls_dept+ ", mgr:" + ls_mgr + ", PID:" + ls_pid + ", table:" + ls_table + ", close rc: '" + ls_close_rc +"'" )		
				
		//	commit/rollback is in the close call ....  
		if ls_close_rc <> '' then // failed 
			CHOOSE CASE as_retcode
				CASE 'CL'  // employee closed the call 
					wf_send_page(ll_crow, 'EMP_NOCL', false, li_page_sent )	
				CASE 'CM'  // manager closed the call 
					wf_send_page(ll_crow, 'MGR_NOCL', false, li_page_sent )	
			END CHOOSE 
		Else // successful close
			CHOOSE CASE as_retcode
				CASE 'CL'  // employee closed the call 
					wf_send_page(ll_crow, 'EMP_CL', false, li_page_sent )	
				CASE 'CM'  // manager closed the call 
					wf_send_page(ll_crow, 'MGR_CL', false,li_page_sent )	
			END CHOOSE 
		
		END IF
END CHOOSE
	
return 1
end event

event ue_update_error;string 	ls_assid, ls_errtext, ls_eflag
long 		ll_row

ll_row = dw_1.GetRow() 
If ll_row <= 0 then return -10

ls_eflag = 'E'
ls_assid = dw_1.GetItemString( ll_row , 'assignment_id')

If POS( lower(as_error_msg), 'timeout') > 0 then 
 
 UPDATE 	"pageassignment"  
    SET 	"lasterror" 		= "lasterror" + ' '+ :as_error_msg
	WHERE "pageassignment"."assignment_id" = :ls_assId   ;

ELSE
if IsValid( uo_snpp ) then 
	if  uo_snpp.ib_reconnect then ls_eflag = ''
END IF 
 UPDATE 	"pageassignment"  
    SET 	"lasterror" 		= "lasterror" + ' '+ :as_error_msg,
	      "twoway_status" 	= :ls_eflag 
 WHERE 	"pageassignment"."assignment_id" = :ls_assId   ;

END IF
 
if sqlca.sqlcode <> 0 then 
	ls_errtext = sqlca.sqlerrtext
	ROLLBACK;
	this.event ue_trace( "DB Error( upd date send on page assignment ) ", ls_errtext)
	return -10
end if

COMMIT;

return 1
end event

event ue_create_uo();		
If POS(cpagesyscd, 'SN') > 0 OR /*===*/ gs_settings = 'TCP' then 
	window lw_window
	datawindow	ldw_1
	this.OpenUserObject(uo_snpp , 'uo_vzt_tcp_metro_page', 3300, 247)
	lw_window	= this
	uo_snpp.dynamic of_init( lw_window	, ldw_1 )  		
	uo_snpp.ii_timeout = 15
	is_snpp_open = true
END IF

if POS(cpagesyscd, 'ES') > 0 then //espa
	this.OpenUserObject(uo_espa , 'uo_espa_test', 0, 247)
	uo_espa.visible 	= false
	mle_1.visible 		= false
	is_espa_open = true
END IF	



end event

event ue_trace;If not cbx_ptrace.checked then 
	if gs_debugmode = 'Y' then 
		MessageBox( ls_hdr, ls_msg)
	end if
Else // trace checked 
	string ls_file, ls_sep
	ls_sep = '----------------------------------------------------'
	ls_file = sle_tfile.text
	long lfile
	If ls_file <> "" then
		lfile = FileOpen( ls_file, linemode!, write!)
		FileWrite (lfile , ls_sep)
		FileWrite (lfile , ls_hdr )
		FileWrite (lfile , ls_msg )
		FileWrite (lfile , ls_sep)
		FileClose(lfile ) 
	END IF
END IF
end event

public function boolean wf_determin_time_interval (integer timer_min, string time_last_sent);long secInt
long secAfter, daysAfter, secAfter_d0
datetime lstSent
date lstSentDate
time lstSentTime
boolean lb_ret
string ls_msg 

lstSentDate = date(mid(time_last_sent,1,10))
lstSentTime = time(mid(time_last_sent,12))
secInt 		= timer_min * 60
lstSent 		= datetime(date(mid(time_last_sent,1,10)),time(mid(time_last_sent,12)))
daysAfter	= DaysAfter(lstSentDate, today())
secAfter_d0 = SecondsAfter(lstSentTime, now())
secAfter 	= (daysAfter * 86400) + secAfter_d0 

lb_ret = false // default to no

ls_msg =  '~r~nLast sent  date: ' + string( lstSentDate ) 
ls_msg += '~r~nLast sent  time: ' + string( lstSentTime ) 
ls_msg += '~r~nLast sent dtime: ' + string( lstSent ) 
ls_msg += '~r~ndays after: ' + string( daysAfter ) 
ls_msg += '~r~nsecs after: ' + string( secAfter_d0 ) 
ls_msg += '~r~nsecs (timer_min * 60): ' + string( secInt ) 

if daysAfter = 0 then 
	if secAfter_d0 >= secInt then lb_ret = true
else 
	if secAfter >= secInt then lb_ret = true
end if
ls_msg += '~r~nlb_ret = ' + string( lb_ret) 

this.event ue_trace( 'wf_determine_time_interval', ls_msg) 

return lb_ret


end function

public function string wf_preopen_send_msg (string pre_open, integer init_paging_min, datetime timer_start);if pre_open = 'N' or pre_open = '' then 	return 'Y'

date timerDate
time timerTime
timerDate = date(timer_start)
timerTime = time(timer_start)

// timer date is at least 2 days greater than today logic
if DaysAfter(today(),timerDate) > 1 then return 'N' 

// scheduled timer is at least 2 days older then today
if DaysAfter(timerDate, today()) > 1 then return 'Y' 

// scheduled timer is a day older then today then check cross mid-night logic
if DaysAfter(timerDate, today()) = 1 then 
	if (SecondsAfter(now(), 23:59:59)+1) / 60 > init_paging_min then
		return 'N'
	else
		if ((SecondsAfter(now(), 23:59:59)+1) / 60) + (SecondsAfter(00:00:00, timerTime) / 60) <= init_paging_min then
			return 'Y'
		else
			return 'N'
		end if
	end if
end if

// same day logic
if (SecondsAfter(now(),timerTime)) / 60 <= init_paging_min then return 'Y'
return 'N'

end function

public function boolean wf_open_tap_link ();retryCount = 1
currentStage = sndSendCR
errorDesc = ""
errorNo = errNoError
TapLinkOpen = false

do while errorNo = errNoError and TapLinkOpen = false
	if currentStage = sndSendCR then
		ole_1.object.InBufferCount = 0
		wf_send_cr()
	end if
	if currentStage = sndWaitID then
		delayCount = 0
		if wf_wait_id() then
//			sle_1.text = "wait_id done!"
		end if
	end if
	if currentStage = sndSendPG1 then
		ole_1.object.InBufferCount = 0
		wf_send_escape_pg1()
	end if
	if currentStage = sndWaitAck1 then
		delayCount = 0
		if wf_wait_ack1() then
//			sle_1.text = "wait_ack1 done!"
		end if
	end if
	if currentStage = sndSendMessage then
		tapLinkOpen = true
	end if
loop

if errorNo <> errNoError then
	tapLinkOpen = false
	if errorNo = errWaitID then
		errorDesc = "No ID!"
	elseif errorNo = errWaitAck1 then
		errorDesc = "No Acknowledge 1!"
	end if
	this.event ue_trace( "Tap Link Error",errorDesc)
else
	tapLinkOpen = true
end if
//sle_err.text = errorDesc
return TapLinkOpen

end function

public subroutine wf_send_cr ();comStr = char(CODE_CR)

//
IF gs_settings = 'TCP' then 
	uo_snpp.event ue_send( comstr) 
ELSE	
	ole_1.object.Output = comStr
END IF

//sle_1.text = "Send CR!"
currentStage = sndWaitID



end subroutine

public subroutine wf_send_eot ();IF gs_settings = 'TCP' then 
	uo_snpp.event ue_send( char(CODE_EOT) + char(CODE_CR) ) 
ELSE	
	ole_1.object.Output = char(CODE_EOT) + char(CODE_CR)
END IF

currentStage = sndWaitAck2
end subroutine

public subroutine wf_send_escape_pg1 ();comStr = char(CODE_ESC) + "PG1" + char(CODE_CR)

IF gs_settings = 'TCP' then 
	uo_snpp.event ue_send( comStr ) 
ELSE	
	ole_1.object.Output = comStr
END IF

currentStage = sndWaitAck1

end subroutine

public function string wf_calc_checksum (string msg);string 	ls_tmpMsg,  ls_calcCheckSum
long 		ln_tmpCheckSum
long 		ix,n1,n2,n3

ls_tmpMsg = msg

for ix = 1 to len(ls_tmpMsg)
	ln_tmpCheckSum = ln_tmpCheckSum + asc(mid(ls_tmpMsg,ix,1))
next

n1 = mod(integer(ln_tmpCheckSum)/256,16)
n2 = mod(integer(ln_tmpCheckSum)/16,16)
n3 = mod(integer(ln_tmpCheckSum),16)

ls_calcCheckSum=char(n1+48)+char(n2+48)+char(n3+48)
return ls_calcCheckSum
end function

public function boolean wf_send_tap_msg (string pagerid, string msg);if tapLinkOpen = false then
//	if cPageSysCd = "VS" then //Visiplex
	if wf_open_tap_link() = false then
		this.event ue_trace( "Failed","Open TAP link failed!")
		return false
	end if
end if
string checkSum
boolean messageSent
string tmpMsg

retryCount = 1
messageSent = false
currentStage = sndSendMessage
errorDesc = ""
errorNo = errNoError

do while errorNo = errNoError and messageSent = false
	if currentStage = sndSendMessage then
		ole_1.object.InBufferCount = 0
		tmpMsg = char(CODE_STX) + pagerid + char(CODE_CR) + left(msg,248) + char(CODE_CR) + char(CODE_ETX)
		checkSum = wf_calc_checksum(tmpMsg)
		tmpMsg = tmpMsg + checkSum + char(CODE_CR)
		wf_sending_tap_msg(tmpMsg)
	end if
	if currentStage = sndWaitAck2 then
		delayCount = 0
		if wf_wait_ack2() then
			messageSent = true
		end if
	end if
loop

if errorNo <> errNoError then
	messageSent = false
	if errorNo = errWaitAck2 then
		errorDesc = "No Acknowledge 2!"
	end if
	this.event ue_trace( "Tap Link Error",errorDesc)
else
	messageSent = true
end if
//sle_err.text = errorDesc
return messageSent
end function

public subroutine wf_sending_tap_msg (string msg);ole_1.object.OutPut = msg
currentStage = sndWaitAck2

end subroutine

public function boolean wf_wait_ack1 ();string inputBuffer
boolean waitAck1
waitAck1 = false

if gs_settings <> 'TCP' then 
	do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
		yield()
		delayCount ++
	loop
	inputBuffer = trim(ole_1.object.Input)
ELSE
	// VZ TCP ESPA
	inputBuffer = f_NVL(uo_snpp.is_input,'')
	do while trim(inputBuffer) <> '' and delayCount < MAX_DELAY 
	// VZ ??????????????? GET IT FROM TCP 
		yield() 
		if Not Isvalid( this) then return false
		if ib_closing then return false
		delayCount ++ 
		inputBuffer = f_NVL(uo_snpp.is_input,'')
	loop
END IF

	if Right(inputBuffer,3) = "[p"+char(CODE_CR) then
		waitAck1 = true
		currentStage = sndSendMessage
		retryCount = 1
		delayCount = 0 // reset on success
	else
		currentStage = sndSendPG1
		retryCount = retryCount + 1
		delayCount = 0 // reset for next try
	end if

	if waitAck1 = false then
		w_main.SetMicroHelp("waitack1 try:"+string(retryCount)+" Buffer:"+inputBuffer)
	end if

if retryCount > MAX_RETRIES then
	retryCount = 1
	delayCount = 0 // reset on failure
	errorNo = errWaitAck1
end if

return waitAck1
end function

public function boolean wf_wait_ack2 ();string inputBuffer
boolean waitAck2
waitAck2 = false

if gs_settings <> 'TCP' then 
	do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
		yield()
		delayCount ++
	loop
	inputBuffer = trim(ole_1.object.Input)
ELSE
	// VZ TCP ESPA
	inputBuffer = f_NVL(uo_snpp.is_input,'')
	do while trim(inputBuffer) <> '' and delayCount < MAX_DELAY 
	// VZ ??????????????? GET IT FROM TCP 
		yield() 
		if Not Isvalid( this) then return false
		if ib_closing then return false
		delayCount ++ 
		inputBuffer = f_NVL(uo_snpp.is_input,'')
	loop
END IF


if right(inputBuffer,2) = char(CODE_ACK) + char(CODE_CR) or &
	mid(inputBuffer,1,len(inputBuffer) - 1 ) = "110 1.8" then
	waitAck2 = true
	retryCount = 1
	delayCount = 0 // reset on success
	currentStage = sndSendEOT
else
	if left(inputBuffer,2) = char(CODE_NAK) + char(CODE_CR) then
		currentStage = sndSendMessage
		retryCount = retryCount + 1
		delayCount = 0 // reset for next try
	end if
end if

if retryCount > MAX_RETRIES then
	retryCount = 1
	delayCount = 0 // reset on failure
	errorNo = errWaitAck2
end if
return waitAck2

end function

public function boolean wf_wait_id ();
string inputBuffer
boolean waitID 
waitID = false

if gs_settings <> 'TCP' then 
	do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
		yield()
		delayCount ++ 
	loop
	inputBuffer = trim(ole_1.object.Input)
	
ELSE
	// VZ TCP ESPA
	inputBuffer = f_NVL(uo_snpp.is_input,'')
	do while trim(inputBuffer) <> '' and delayCount < MAX_DELAY 
	// VZ ??????????????? GET IT FROM TCP 
		yield() 
		if Not Isvalid( this) then return false
		if ib_closing then return false
		delayCount ++ 
		inputBuffer = f_NVL(uo_snpp.is_input,'')
	loop
END IF

if left(inputBuffer,3) = "ID=" then
	waitID = true
	currentStage = sndSendPG1
	retryCount = 1
	delayCount = 0 // reset on success 
else
	waitId = false
	currentStage = sndSendCR
	retryCount = retryCount + 1
	delayCount = 0 // reset for next try
end if
if retryCount > MAX_RETRIES then
	retryCount = 1
	delayCount = 0 // reset on failure
	errorNo = errWaitID
end if
IF waitID = false then
	this.event ue_trace( "wait ID","try:"+string(retryCount))
end if


return waitId

	
end function

public subroutine wf_send_sa_page (string pagerid, string msg);string pageStr
//MessageBox("page string",pagerId+' '+msg)
//return
pageStr = char(255) + char(255) + char(255) + pagerId + char(10) + msg+ char(13)
ole_1.object.output =pageStr
end subroutine

public subroutine wf_format_dialup_str (string inPagerId, string inMsg);if pageridstr = "" then
	pageridstr = inPagerId
	messagestr = inMsg
else
	pagerIdStr = pagerIdStr + "^" + inPagerId
	messageStr = messageStr + "^" + inMsg
end if

end subroutine

public function boolean wf_send_dialup_page (string pageridstring, string msgstring);//rc = send_alpha_page (port,baud,modem_init_str,modem_dial_str,access_number,&
//	pagerIdString,max_chars_per_blk,msgString,debug_file,retmsg)
w_main.SetMicroHelp("sending page..."+pageridstring+" "+msgstring)
//MessageBox("MSG",msgstring) 
//return true
string txt1, txt2, txt3, mn
txt1="     HotelEXPERT Smart Paging"
txt2="       Copyright " + char(169) + " 1996-2004 " //char(169)    // copyright symbol
txt3="     Metromedia Software, Inc. "// + char(174) // register symbol

port = 'COM'+ string( gi_comport)
//port='TAPI'
//MessageBox("info","baud:"+baud+" port:"+port+" modem_init_str:"+modem_init_str+" modem_dial_str:"+modem_dial_str)
rc = PowerPage (port,baud,modem_init_str,modem_dial_str,access_number,&
	pagerIdString,max_chars_per_blk,msgString,debug_file,retmsg,txt1,txt2,txt3,hiddenDialupBox)
if rc <> 0 then
	this.event ue_trace( "Dialup Error",String(rc)+ " - " + retmsg)
//	egm_syserror(string(today())+" " +string(now())+" rc="+string(rc)+ " - " + retmsg)
	return false
else
	return true
end if
end function

public function boolean wf_send_espa_msg (string pagerid, string msg);mle_1.text = '' // clear call trace 
mle_1.SetRedraw(false)
is_linktrace = ''

this.event ue_trace( 'wf_send_espa_msg -start-'+ string(now()), ' ---- Protocol start ---') // save to file

//if tapLinkOpen = false then
	if wf_open_espa_link( pagerid) = false then
		wf_trace(is_crlf + "Open ESPA link failed!")
		this.event ue_trace( 'wf_send_espa_msg -link error-'+ string(now()), f_nvl(mle_1.text,'')) // save to file
		mle_1.SetRedraw(true)
		return false
	end if
//end if

string ls_checkSum, ls_tmpMsg, ls_header, ls_hdr, ls_rectype, ls_inputmsg
boolean 	lb_messageSent
string 	ls_msg

retryCount 		= 1
lb_messageSent = false
currentStage 	= sndSendMessage
errorDesc 		= ""
errorNo 			= errNoError
ls_inputmsg		= f_replace_german ( msg) // Replace Umlauts for DAKS paging
			
			// call to pager 
	ls_header	= char(CODE_SOH)  
		ls_tmpMsg 	= '1' + char(CODE_STX) + &
				+ '1'+ char(CODE_US )+ string( pagerid) 	+ char(CODE_RS ) + /*call addr*/ & 
				+ '4'+ char(CODE_US )+ '3'						+ char(CODE_RS ) + /*call type*/ &  
				+ '3'+ char(CODE_US )+ '2'						+ char(CODE_RS ) + /*beep coding*/ &  
				+ '5'+ char(CODE_US )+ '1'						+ char(CODE_RS ) + /*# of trans*/ & 
				+ '6'+ char(CODE_US )+ '2'					 	+ char(CODE_RS ) + /*priority */ & 
				+ '2'+ char(CODE_US )+ trim(left(ls_inputmsg,160))+ char(CODE_ETX) 
//		ls_tmpMsg 	= char(CODE_STX) + pagerid + char(CODE_CR) + left(ls_inputmsg,248) + char(CODE_CR) + char(CODE_ETX)

		ls_checkSum = wf_calc_checksum( ls_tmpMsg)
		ls_checkSum = f_vzt_calc_lrc( ls_tmpMsg)
		wf_trace('checksum:"'+ls_checkSum +'"')
		
	
do while errorNo = errNoError and lb_messageSent = false
	if currentStage = sndSendMessage then
		if gs_settings <> 'TCP' then ole_1.object.InBufferCount = 0

		ls_msg = ls_header + ls_tmpMsg + ls_checkSum // char(CODE_CR) ?? CR??
		wf_send_string(ls_msg, snd_ESPA_Wait_DATA_ACK01, 'sending page 1-st try...' )
	end if
	
		integer 	li_ack_ret
	if currentStage = snd_ESPA_Wait_DATA_ACK01 then
		delayCount = 0
		li_ack_ret = wf_wait_espa('ACK', snd_ESPA_Received_DATA_ACK01, 'Sending espa page ... ' ) 
		CHOOSE CASE li_ack_ret 
		CASE 1		// ACK
			currentStage = snd_ESPA_Received_DATA_ACK01	
		CASE 0		// TIMEOUT etc.
		CASE -1		// NACK
			// Resend data again 
			wf_send_string(ls_tmpMsg, snd_ESPA_Wait_DATA_ACK01, 'REsending page after NACK...' )
		END CHOOSE
	end if
	
	if currentStage = snd_ESPA_Received_DATA_ACK01	then 
		lb_messageSent = true
		wf_send_string(CHAR(CODE_EOT), snd_ESPA_SendEOT, 'ESPA EOT.' )
		this.wf_trace( "ESPA page sent (success), connection closed ..." + is_crlf  )		
		tapLinkOpen = false
	end if
	
loop
errorDesc = f_nvl(errorDesc, '*')

if errorNo <> errNoError then
	lb_messageSent = false 
	this.wf_trace( "ESPA page error: "+ errorDesc + is_crlf  )		
	this.event ue_trace( "ESPA Send Error",errorDesc)
end if

string ls_temp
ls_temp = 'Page Success. '
if not lb_messageSent then ls_temp = 'Page failed. '
this.event ue_trace( 'wf_send_espa_msg -end-'+ string(now()),ls_temp + is_linktrace + 'currentstage='+string(currentStage)+ 'errorDesc='+string(errorDesc)) // save to file
mle_1.SetRedraw(true)

return lb_messageSent

end function

public function integer wf_portopen ();//if cPageSysCd <> "DI" and POS( cPageSysCd, "SN" ) <= 0 then // not dialup not SNPP connection
if POS(cPageSysCd,"DI") <= 0 and POS( cPageSysCd,"SN") <=0 and gs_settings <> 'TCP' then // not dialup not SNPP connection
	this.event ue_trace( "wf_portopen","Before port open. Commport:"+string(gi_comPort)+', settings:'+ gs_settings)
	if ole_1.object.PortOpen = true then
		this.event ue_trace( "wf_portopen","Already open, close first...")
		ole_1.object.PortOpen = false 
	end if
	
	if ole_1.object.PortOpen = false then
		
		ole_1.object.CommPort = gi_comPort
		
		CHOOSE CASE cPageSysCd
			CASE "SA"					//system alert
				ole_1.object.Settings = "1200,N,8,1"
			CASE "SC"					//Salcom
				ole_1.object.Settings = "9600,N,8,2"
			CASE "VS", "OT" 			//Visiplex, TAP
				ole_1.object.Settings = "9600,N,8,1"
				ole_1.object.InputMode = 0 // comInputModeText
			CASE "ES" 
				ole_1.object.Settings = gs_settings // "9600,N,7,1"
				ole_1.object.InputMode = 0 // comInputModeText
			CASE "DI"
	
		END CHOOSE

		ole_1.object.InputLen = 0
		ole_1.object.Portopen = True 
		is_comport_open = true
	end if
	this.event ue_trace( "wf_portopen","After port open.")
ELSE
	// TCP espa 
	IF gs_settings  = 'TCP' then
//		this.event ue_trace( "wf_portopen TCP","Before TCP connect.gs_settings:"+ gs_settings)
		uo_snpp.event ue_connect('',0)
		is_comport_open = true
//		this.event ue_trace( "wf_portopen TCP","After TCP connect.")
	end if
end if

return 1
end function

public subroutine wf_trace (string as_input);string ls_text
if gs_trace = 'Y' or cbx_ltrace.checked then //and mle_1.visible 
	ls_text = f_nvl(as_input, '') 
	if POS ( ls_text, is_crlf ) <= 0 then ls_text = is_crlf + ls_text
	is_linktrace = is_linktrace + f_replace_ascii( ls_text) 
	if not cbx_ltrace.checked  then mle_1.text = is_linktrace 
end if

//
end subroutine

public function boolean wf_open_espa_link (string as_pagerid);integer		li_ack_ret

retryCount = 1
currentStage = snd_ESPA_SendEOT
errorDesc = ""
errorNo = errNoError
TapLinkOpen = false

do while errorNo = errNoError and TapLinkOpen = false
// Clear previous transmission ----------------------------------------	
	if currentStage = snd_ESPA_SendEOT then
		if gs_settings <> 'TCP' then ole_1.object.InBufferCount = 0
		wf_send_string( char(CODE_EOT) , snd_ESPA_PollENQ, 'Clearing previous transmission... ' ) 
	end if

// Poll itself ------------------------------------------------------------
	if currentStage = snd_ESPA_PollENQ then
		if gs_settings <> 'TCP' then ole_1.object.InBufferCount = 0
//		wf_send_string( trim(as_pagerid) + char(CODE_ENQ) + char(CODE_CR), snd_ESPA_Wait_ENQ_ACK ) 
		wf_send_string( '1' + char(CODE_ENQ) , snd_ESPA_SelectENQ, 'Polling itself... ' ) // '1' = poll itself 
	end if

// Select paging system------------------------------------------------------------
	if currentStage = snd_ESPA_SelectENQ then
		if gs_settings <> 'TCP' then ole_1.object.InBufferCount = 0
//		wf_send_string( trim(as_pagerid) + char(CODE_ENQ) + char(CODE_CR), snd_ESPA_Wait_ENQ_ACK ) 
	wf_send_string( '2' + char(CODE_ENQ) , snd_ESPA_Wait_Select_ACK, 'Selecting paging system ... ' ) // '1' = poll itself 
	end if

	if currentStage = snd_ESPA_Wait_Select_ACK then
		delayCount = 0
		li_ack_ret = wf_wait_espa( 'ACK', snd_ESPA_Received_Select_ACK, 'Selecting paging system ... ' ) 
		CHOOSE CASE li_ack_ret 
		CASE 1		// ACK
			currentStage = snd_ESPA_Received_Select_ACK	
		CASE 0		// TIMEOUT etc.
		CASE -1		// NACK
			// Select again
			currentStage = snd_ESPA_SelectENQ 			
		END CHOOSE
	end if
	
	if currentStage = snd_ESPA_Received_Select_ACK	then 
		currentStage = sndSendMessage // ready to page 
		this.wf_trace( "ready to page" + is_crlf  )		
   	tapLinkOpen = true
	end if
loop

if errorNo <> errNoError then 
	tapLinkOpen = false
	this.wf_trace( "ESPA Link Error: " + errorDesc + is_crlf  )
end if

return TapLinkOpen

end function

public subroutine wf_send_string (string as_string, integer ai_stage, string as_message);IF gs_settings = 'TCP' then 
	uo_snpp.event ue_send( as_string ) 
ELSE	
	ole_1.object.Output 	= as_string 		 
END IF

wf_trace( 'sent:(' + as_string + '), new stage: ' + string (ai_stage	) + ', trace info: ' + as_message + is_crlf  )
If ai_stage <> 0 then currentStage 	= ai_stage			


end subroutine

public function integer wf_wait_espa (string as_string, integer ai_newstage, string as_message);string ls_inputBuffer, ls_msg
integer	li_ret
// as_string='' indicates wait for any input in the buffer ... 
if Not Isvalid( this) then return 1
if ib_closing then return 1
li_ret		= 0
ls_msg 		= as_message  + ", waiting for "+ as_string +", try: "+string(retryCount) + ", Stage:" + string( currentStage)   

if gs_settings <> 'TCP' then 
	do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
		yield() 
		if Not Isvalid( this) then return 1
		if ib_closing then return 1
		delayCount ++ 
loop

	ls_inputBuffer = trim(ole_1.object.Input)
ELSE
	ls_inputBuffer = f_NVL(uo_snpp.is_input,'')
	do while trim(ls_inputBuffer) <> '' and delayCount < MAX_DELAY 
	// VZ ??????????????? GET IT FROM TCP 
		yield() 
		if Not Isvalid( this) then return 1
		if ib_closing then return 1
		delayCount ++ 
		ls_inputBuffer = f_NVL(uo_snpp.is_input,'')
	loop
END IF
	
//ls_inputBuffer = CHAR( CODE_ACK)
//ls_inputBuffer = CHAR( CODE_NAK)
If len( ls_inputBuffer ) > 0 then wf_trace('received:('+  f_replace_ascii( ls_inputBuffer ) + ") " + is_crlf  )

if as_string <> '' then wf_trace(ls_msg )
if POS( ls_inputBuffer , CHAR( CODE_ACK)) > 0 then 	// got ACK...
	li_ret				= 1
	retryCount 			= 1
	nakretryCount 		= 1
	delayCount 			= 0 // reset on success
	wf_trace( as_message  + ", received ACK..." + is_crlf )
	currentStage 	= ai_newstage // set new stage on ACK
elseif POS( ls_inputBuffer , CHAR( CODE_NAK)) > 0 then 	// got NACK...
	li_ret				= -1	// NACK
	retryCount 			= 1
	delayCount 			= 0 // reset on NACK
	nakretryCount 		= 	nakretryCount 	+ 1
	wf_trace( as_message  + ", received NACK..." + is_crlf )
	if nakretryCount 	> MAX_NAKRETRIES then
		nakretryCount 	= 1
		errorNo 			= (errWaitACK * 1000) + currentStage 
		errorDesc		= ls_msg + ' too many NAKs '
		wf_trace( ls_msg  + ', too many NAKs...' + is_crlf )
	end if
else // timeout
	if as_string = '' then return 0

	if retryCount > MAX_RETRIES and li_ret= 0 then
		retryCount 	= 1
		delayCount = 0 // reset on failure
		errorNo 		= (errWaitACK * 1000) + currentStage 
		errorDesc	= ls_msg +' err. num: ' + string( errorNo )
		wf_trace( ls_msg  + ', timeout error...' + is_crlf ) 
	end if
	retryCount 	= 	retryCount 	+ 1 
	delayCount = 0 // reset for next try
end if 

return li_ret

end function

public function boolean wf_send_snpp_page (ref string pagerid, ref string msg, string as_level);string	crlf = '~r~n' 
string 	ls_checkSum, ls_tmpMsg, ls_header, ls_hdr, ls_rectype, ls_inputmsg, ls_pid
boolean 	lb_messageSent
string 	ls_msg, ls_tag, ls_pass, ls_retcode
datetime ldt_reply
long 		ll_row

retryCount 		= 1
lb_messageSent = false
currentStage 	= sndSendMessage
errorDesc 		= ""
errorNo 			= errNoError
ls_inputmsg		= f_replace_german ( msg) // Replace Umlauts for DAKS paging

ll_row = dw_1.GetRow() 
If ll_row <= 0 then 
	errorNo = -20 
	return false
END IF			

ls_pid = dw_1.GetItemString(ll_row, 'assignment_id')
			
CHOOSE CASE as_level
	CASE '1'
		errorNo = uo_snpp.event dynamic ue_tran( 'PAGE1', pagerid , ls_inputmsg ,'','') 
	CASE '2' // empl page 
		errorNo = uo_snpp.event dynamic ue_tran( 'PAGE2', pagerid , ls_inputmsg ,'CL CLOSE_CALL/DC DECLINE CALL','') 
		if errorNo >= 0 then 
			errorNo = uo_snpp.event dynamic ue_snpp_get_tag( ls_tag, ls_pass) 
			// save tags in the table for next cycle.	UPDATE db and dw.
			UPDATE pageassignment 
			SET twoway_tag = :ls_tag, twoway_passcode = :ls_pass, twoway_status = 'S'  
			WHERE assignment_id = :ls_pid; 

			f_end_tran0( SQLCA, '','','') // commmit or rollback

		END IF
	CASE '2R' // empl reminder
		errorNo = uo_snpp.event dynamic ue_tran( 'PAGE2', pagerid , ls_inputmsg ,'CL CLOSE_CALL/DC DECLINE CALL','') 
		if errorNo >= 0 then 
			errorNo = uo_snpp.event dynamic ue_snpp_get_tag( ls_tag, ls_pass) 
			// save tags in the table for next cycle.	UPDATE db and dw.
			UPDATE pageassignment 
			SET twoway_tag_rem = :ls_tag, twoway_passcode_rem = :ls_pass, twoway_status_rem = 'S'  
			WHERE assignment_id = :ls_pid; 

			f_end_tran0( SQLCA, '','','') // commmit or rollback

		END IF
	CASE '2M' // manager page - allow reassignment option 
		errorNo = uo_snpp.event dynamic ue_tran( 'PAGE2', pagerid , ls_inputmsg ,'CM CLOSE_CALL/MR REASSIGN','') 
		if errorNo >= 0 then 
			errorNo = uo_snpp.event dynamic ue_snpp_get_tag( ls_tag, ls_pass) 

			UPDATE pageassignment 
			SET 
			twoway_tag_mgr = :ls_tag, twoway_passcode_mgr = :ls_pass, twoway_status_mgr = 'S'
			WHERE assignment_id = :ls_pid; 

			f_end_tran0( SQLCA, '','','') // commmit or rollback

		END IF
	CASE '2MRF' // manager page - reassignment failed 
		errorNo = uo_snpp.event dynamic ue_tran( 'PAGE2', pagerid , ls_inputmsg ,'CM CLOSE_CALL','') 
		if errorNo >= 0 then 
			errorNo = uo_snpp.event dynamic ue_snpp_get_tag( ls_tag, ls_pass) 

			UPDATE pageassignment 
			SET 
			twoway_tag_mgr = :ls_tag, twoway_passcode_mgr = :ls_pass, twoway_status_mgr = 'S'
			WHERE assignment_id = :ls_pid; 

			f_end_tran0( SQLCA, '','','') // commmit or rollback

		END IF
	CASE '2S', '2SM', '2SR' // two way EMP, REM or MGR status call pagerid=tag, ls_inputmsg=pass
		errorNo = uo_snpp.event dynamic ue_tran( 'PAGE2RC', pagerid, ls_inputmsg ,'','') 
		If errorNo >= 0 then errorNo = uo_snpp.event dynamic ue_snpp_get_status( ldt_reply, ls_retcode ) 
		this.event ue_trace( "SNPP page, status check: "+ as_level, "pagerid:"+pagerid+", pass:"+ls_inputmsg + ", status: '" + ls_retcode +"'" )		
		If errorNo >= 0 then errorNo = this.event dynamic ue_process_return(ldt_reply, ls_retcode, as_level )
END CHOOSE

errorDesc = uo_snpp.dynamic of_geterror() 

if errorNo < 0 then // 
	lb_messageSent = false 
	this.wf_trace( "SNPP page error: "+ errorDesc + crlf )		
	this.event ue_trace( "SNPP Send Error (w_send_page)",errorDesc) 
	errorNo = this.event dynamic ue_update_error( errorDesc )
else
	lb_messageSent = true 
end if

return lb_messageSent

end function

public function boolean wf_reassign_call ();string ls_errtext, ls_curdt
string 	ls_callnumber, ls_table, ls_pid, ls_zone, ls_dept, ls_empname, ls_empid, ls_room
long		ll_crow
string	ls_newpagerid, ls_pagerid, ls_now
datetime ld_timer

ll_crow  = dw_1.GetRow()
If ll_crow <= 0 then return  false

ls_table			= dw_1.GetItemString( ll_crow, 'targettable') 
ls_pid			= dw_1.GetItemString( ll_crow, 'assignment_id') 
ls_callnumber	= trim(dw_1.GetItemString(ll_crow,"call_number"))
ls_dept			= dw_1.GetItemString(ll_crow,"dept_assigned")
ls_zone			= dw_1.GetItemString(ll_crow,"area_unit_type")
ls_pagerId 		= trim(dw_1.GetItemString(ll_crow ,"pager_id"))
ls_room 		= trim(dw_1.GetItemString(ll_crow ,"roomnum"))
ld_timer = dw_1.GetItemDateTime(ll_crow,"timer_start")

ls_now			= string( datetime( today(), now() ), 'YYYY/MM/DD HH:MM:SS' ) 

ls_newpagerid = ls_pagerid  // VZ: exclude current pager from auto-reassign
string ls_capecode
f_find_pager_id( ls_dept, ls_empname, ls_empid, ls_newpagerid, ls_capecode, ls_room, ld_timer) 
IF ls_newpagerid = ls_pagerid or  ls_newpagerid = '' THEN 
	return false
ELSE
	// update paging table and timer/pending calls with new employee, dept, pager
	if ls_table = '1' then
		UPDATE timercalls 
		   SET repairman = :ls_empname, paging_ind = '0'
		 WHERE timercalls.call_number = :ls_callnumber ;
	else
		UPDATE pendingcalls  
		   SET repairman = :ls_empname, paging_ind = '0'
		 WHERE pendingcalls.call_number = :ls_callnumber ;	
	end if 

	if sqlca.sqlcode < 0 then
//		is_last_error = sqlca.sqlerrtext
		ROLLBACK;  
		return false
	end if

	// Update with status, times. if reassigned - update with new pager.
	UPDATE pageassignment 
	SET 	twoway_retcode 				= 'MR', 
			
			emp_name							= :ls_empname,
			emp_id 							= :ls_empid,
			pager_id							= :ls_newpagerid ,
			page_sent						= 'N',
			time_assigned					= :ls_now,
			
			twoway_time_received_mgr 	= getdate() ,
			twoway_status 					= 'MR',
			twoway_status_mgr				= 'R'
	WHERE assignment_id 					= :ls_pid; 

	if sqlca.sqlcode < 0 then
	//	is_lasterror = sqlca.sqlerrtext
		ROLLBACK;  
		return false
	end if

	f_end_tran0( SQLCA, '','','') // commmit or rollback
	return true
END IF
return false
end function

public subroutine wf_set_dept_filter (string dept_str);string fs0, fs1, fs2, fs_blank
integer i,j
fs1="dept_assigned = "
fs_blank=" or " + fs1 + "''"
SetNull(fs2)
if dept_str = "" then
	dw_1.SetFilter(fs2)
	dw_1.Filter()
	return 
end if
i = 1
j = 1
if Pos(dept_str,",") = 0 then
	fs2 =  fs1 +"'"+dept_str+"'"
else
	Do while Pos(dept_str,",",i) > 0
		j = Pos(dept_str,",",i)
		fs0 = mid(dept_str,i, j - i)
		if i = 1 then
			fs2 = fs1+"'"+fs0+"'"
		else
			fs2 = fs2 + " or " + fs1 + "'" + fs0 + "'"
		end if
		i = j+1
	loop
	fs0 = mid(dept_str,i)
	fs2 = fs2 + " or " + fs1 + "'" + fs0 + "'"
end if
//MessageBox("filter",fs2+fs_blank)
dw_1.SetFilter(fs2)
dw_1.Filter()
return 


end subroutine

public subroutine wf_send_tx_msg (string pagerid, string msg);string pageStr, txtFile, txtFileNm
integer jobNum


if cPageSysCd = 'TX' then
	pageStr = pagerId + ' ' + msg
	txtFileNm = "HESP"+string(today(),'dd')+string(Now(),'hhmmsshs')+".txt"
	txtFile = is_text_dir+txtFileNm
else
	pageStr = msg
	txtFileNm = pagerId+".email"+"HESP"+string(today(),'dd')+string(Now(),'hhmmsshs')
	txtFile = is_email_dir+txtFileNm	
end if

jobNum = FileOpen(txtFile,LineMode!, Write!, LockReadWrite!, Replace!)

if IsNull(jobNum) or jobNum < 0 then
	MessageBox("File Open","Error opening "+txtFile)
end if

if FileWrite (jobNum, pageStr) < 0 then
	MessageBox("File Close","Error clsoing "+txtFile)
end if

if FileClose(jobNum) < 0 then // close file fails
	MessageBox("File Close","Error clsoing "+txtFile)
end if
end subroutine

public function string wf_shorten_txt (string intext, integer txtsize);if Len(Trim(inText)) > txtSize then
	return Left(inText,txtSize)
else
	return Trim(inText)
end if
end function

public subroutine wf_create_uo ();//messagebox('open','opening snpp...')
If POS(cpagesyscd, 'SN') > 0 then 
	this.OpenUserObject(uo_snpp , 'uo_vzt_tcp_metro_page', 247, 424)
	window lw_window
	datawindow	ldw_1
	lw_window	= this
	uo_snpp.dynamic of_init( lw_window	, ldw_1 )  		
	uo_snpp.ii_timeout = 15
	is_snpp_open = true
	
ELSEif POS(cpagesyscd, 'ES') > 0 then //espa
	this.OpenUserObject(uo_espa , 'uo_espa_test', 0, 247)
	uo_espa.visible 	= false
	mle_1.visible 		= false
	is_espa_open = true
END IF	


end subroutine

public function boolean wf_upd_tables (string as_callnum, string as_pagecnt, string as_assid, long al_dwrow, string as_paging_type);string 	newPageCnt, ls_errtext, ls_curdt, ls_pagecnt, ls_table
int 		updTimerCall
long		ll_trows, ll_prows

if as_paging_type = 'D' then
	goto UpdPageAssignment
end if

this.event ue_trace( 'wf_upd_tables-'+ string(now()), 'b4 update. Call number:' +as_callnum+ ', Page count:'+as_pagecnt +', assmtid=' + as_assid )

SELECT count(*) INTO :updTimerCall FROM timercalls
WHERE timercalls.call_number = :as_callnum   ;

if sqlca.sqlcode <> 0 then 
	this.event ue_trace( "UPD Paging Count DB Error", ls_errtext)
	return false
end if

ls_table ='undetermined !!!!'
if updTimerCall = 1 then
	ls_table = 'timercalls'
	UPDATE timercalls 
	   SET paging_ind = :as_pagecnt
	 WHERE timercalls.call_number = :as_callnum ;
else
	ls_table = 'pendingcalls'
	UPDATE pendingcalls  
  	 SET paging_ind = :as_pagecnt  
	 WHERE pendingcalls.call_number = :as_callnum ;	
end if 

if sqlca.sqlcode < 0 then
		ls_errtext = f_nvl(sqlca.sqlerrtext, 'sql error occured')
		ROLLBACK;  
		this.event ue_trace( "UPD Paging Count DB Error", ls_errtext )
		return false
end if

ll_trows = f_nvl(SQLCA.SQLnROws , 0)

if ll_trows <> 1 then 
	this.event ue_trace( 'wf_upd_tables-'+ string(now())+"Posible DB Error( " +ls_table+ " not updated)", "aft error. id='" + as_assid + "', callnum=" + as_callnum + " , sqlrows="+ string(ll_trows ) )
	if ll_trows > 1 then 
		ROLLBACK; 
		this.event ue_trace( "DB Error( " +ls_table+ " not updated)", " id='" + as_assid + "', callnum=" + as_callnum + " , sqlrows="+ string(ll_trows ) )
		return false
	end if;
end if

UpdPageAssignment:

ls_curDt = string(datetime(today(),now()),"yyyy/mm/dd hh:mm:ss")

 UPDATE 	"pageassignment"  
    SET 	"time_page_sent" 	= :ls_curDt,
	      "page_sent" 		= 'Y'
 WHERE 	"pageassignment"."assignment_id" = :as_assId 	and  
			 "pageassignment"."call_number" = :as_callnum ;

ll_prows = SQLCA.SQLnROws

if sqlca.sqlcode <> 0 then 
	ls_errtext = f_nvl(sqlca.sqlerrtext, 'sql error occured')
	ROLLBACK;
	this.event ue_trace( "DB Error( upd date send on page assignment ) ", ls_errtext)
	return false
end if

if ll_prows <> 1 then 
	this.event ue_trace( 'wf_upd_tables-'+ string(now())+"Posible DB Error( pageassingment not updated)", "aft error. id='" + as_assid + "', callnum=" + as_callnum + " , sqlrows="+ string(ll_prows ))
	if ll_prows > 1 then 
		ROLLBACK; 
		this.event ue_trace( "DB Error( page assignment not updated)", " id='" + as_assid + "', callnum=" + as_callnum + " , sqlrows="+ string(ll_prows ))
		return false
	END IF;
end if

COMMIT;

if sqlca.sqlcode <> 0  then
	ls_errtext = f_nvl(sqlca.sqlerrtext, 'sql error occured')
	rollback;
	this.event ue_trace( "DB Error( commit upd date sent page assignment )", ls_errtext)
	return false
end if

dw_1.SetItem(	al_dwrow,	"paging_ind",		as_pagecnt)	
dw_1.SetItem(	al_dwrow,	"time_page_sent",	ls_curDt)
dw_1.SetItem(	al_dwrow,	"page_sent",		"Y")
dw_1.AcceptText()		

this.event ue_trace( 'wf_upd_tables-'+ string(now()), 'aft update. Call number:' +as_callnum &
+ ', Page count:' +as_pagecnt +', pageassingmentid=' + as_assid +', rows upd in '+ls_table + '=' +string(ll_trows) +', rows upd in pageassingment=' +string(ll_prows) )
	
return true


end function

public subroutine wf_send_salcom_page (string pagerid, string msg);// this is for Salcom paging transmitter 

string pageStr, SCStr
int i
SCStr=ProfileString( cINIPath+cINIFile, "Paging systems", "SalcomStr", "CA#bLbRMR" )
pageStr = mid(SCStr,1,2)
i = 3
do while i <= len(SCStr)
   choose case mid(SCstr, i, 1) 
		case '#' // pagerId
			pageStr = pageStr + pagerId
		case 'b'  // 1 blank space
			pageStr = pageStr + " "
		case 'L' // level (integer number 1-4)
			pageStr = pageStr + "1"
		case 'M' // paging message
			pageStr = pageStr + msg
		case 'R' //carrige return 
			pageStr = pageStr + char(13)			
	end choose
	i++
loop

//MessageBox('pageStr',SCStr+"  " + pageStr)
//pageStr = 'CA'+pagerId+" 1 " + char(13) + msg+ char(13)
if gs_settings <> 'TCP' then ole_1.object.output =pageStr
end subroutine

public subroutine wf_send_page (long al_currow, string as_type, boolean ab_confirm, integer as_paged);string pagerId, msg, pageStr, taskDef, taskDefMsg, ls_date, ls_spcl_msg
string ls_room, ls_guest, ls_task, ls_subtask, ls_emp, ls_call, ls_id , ls_dept, ls_area, ls_ascode, ls_room_no
datetime ld_timer
if al_currow <= 0 or al_currow > dw_1.RowCount() then return 
boolean	lb_message_sent
int		li_pageCnt

li_pageCnt = f_nvl(integer( dw_1.GetItemString(al_currow,"paging_ind")),0)
ls_room 	= f_nvl(trim(dw_1.GetItemString(al_currow,"room_dsc")) ,'')
ls_guest	= f_nvl(trim(dw_1.GetItemString(al_currow,"guest")) ,'')
ls_task 	= f_nvl(trim(dw_1.GetItemString(al_currow,"task")),'') +"/"+ f_nvl(trim(dw_1.GetItemString(al_currow,"subtask")),'')
ls_subtask = f_nvl(trim(dw_1.GetItemString(al_currow,"subtask")),'')
ls_emp  	= f_nvl(trim(dw_1.GetItemString(al_currow,"emp_name")) ,'')
ls_dept	= f_nvl(trim(dw_1.GetItemString(al_currow,"dept_assigned")) ,'')
ls_area  = f_nvl(trim(dw_1.GetItemString(al_currow,"area_unit_type")),'') 
ls_call 	= f_nvl(trim(dw_1.GetItemString(al_currow,"call_number")),'')
ls_id		= f_nvl(dw_1.GetItemString(al_currow,"assignment_id"),'')
taskDef 	= f_nvl(dw_1.GetItemString(al_currow,"timercalls_problem_definition"),'')
ls_ascode =f_nvl(dw_1.GetItemString(al_currow,"assignment_cd"),'')
ls_spcl_msg = trim(dw_1.GetItemString(al_currow,"special_msg"))
ls_room_no  = f_nvl(trim(dw_1.GetItemString(al_currow,"roomnum")),'') 
//ld_timer = f_nvl(dw_1.GetItemDateTime(al_currow,"timer_start"),'')
ld_timer = datetime(today(),now()) //use current time for correct QUICKCALL assignment.
taskDefMsg = ""
if len(trim(taskDef)) > 0 then taskDefMsg = " .Def:"+trim(taskDef)
ls_date = " ["+ string(today(), is_pager_time_mask) + "]"
if IsNUll( ls_date) then ls_date = " ["+ string(today()) + "]"

if Not IsValid( this) then return 

//if is_ts_on_sw = 'N' then // do not include timestamp into msg
//	ls_date=""
//end if

CHOOSE CASE as_type
	CASE 'EMP', 'EMPR' 
		pagerId = trim(dw_1.GetItemString(al_currow,"pager_id"))
	CASE 'MGR'
		if as_paged = 2 then
			pagerId = f_find_supervisor_pager (ls_dept, ls_room_no, ld_timer)
		else
			pagerId = f_find_mgr_pager(ls_dept, ls_room_no, ld_timer)
		end if
	CASE 'MGRNOP'
		if as_paged = 2 then
			pagerId = f_find_supervisor_pager (ls_dept, ls_room_no, ld_timer)
		else
			pagerId = f_find_mgr_pager(ls_dept, ls_room_no, ld_timer)
		end if
		ls_spcl_msg = ls_spcl_msg //+" "+ ls_date 
	CASE 'MGR_NOAR' 
		if as_paged = 2 then
			pagerId = f_find_supervisor_pager (ls_dept, ls_room_no, ld_timer)
		else
			pagerId = f_find_mgr_pager(ls_dept, ls_room_no, ld_timer)
		end if
	CASE 'MGR_NOCL' //mgr close call reply failed 
		if as_paged = 2 then
			pagerId = f_find_supervisor_pager (ls_dept, ls_room_no, ld_timer)
		else
			pagerId = f_find_mgr_pager(ls_dept, ls_room_no, ld_timer)
		end if
	CASE 'EMP_NOCL' //emp close call reply failed
		pagerId = trim(dw_1.GetItemString(al_currow,"pager_id"))
	CASE 'MGR_CL' //mgr close call reply failed 
		if as_paged = 2 then
			pagerId = f_find_supervisor_pager (ls_dept, ls_room_no, ld_timer)
		else
			pagerId = f_find_mgr_pager(ls_dept, ls_room_no, ld_timer)
		end if
	CASE 'EMP_CL' //emp close call reply failed
		pagerId = trim(dw_1.GetItemString(al_currow,"pager_id"))
	CASE ELSE 
		If POS('2S,2SM,2SR', as_type ) <= 0 then return 
END CHOOSE

If POS('2S,2SM,2SR',as_type) <= 0 and trim( pagerId) ='' or POS (upper(pagerId),'ONE') > 0 then  //matches NONe and NOONE
	return 
END IF


if pos(cPageSysCd,'SN') > 0  then
	if not is_snpp_open then wf_create_uo() 
elseif pos(cPageSysCd,'ES') > 0 then
	if not is_espa_open then wf_create_uo()
else
	if cPageSysCd = 'SA' or cPageSysCd ='VS' or cPageSysCd = 'OT' or &
	   cPageSysCd = 'SC' then
		if not is_comport_open then wf_portopen() 
	end if
end if

if ls_ascode = 'M' then
	msg = ls_spcl_msg
else
	msg=wf_format_msg(as_type, ls_call, ls_room, ls_guest, ls_task, ls_subtask, & 
			taskDef, is_reminder_txt, ls_date, ls_emp, li_pageCnt, ls_spcl_msg, ls_dept, ls_room_no)	 
end if

If ab_confirm then // confirm before sending 
	If	MessageBox('Page Send Confirmation', 'Are you sure you want to resend the following page?' + &
				'~r~n~r~n' + msg, question!, yesno!, 2) = 2 then 
		return 
	END IF
END IF

lb_message_sent = false 
if Not IsValid( this) then return 

if IsNUll( msg ) then msg = 'SmartPaging Error: null msg in wf_send_page'

string ls_tag, ls_pass 
If as_type = '2S' then //SNPP two way status 
	ls_tag	= trim(f_nvl(dw_1.GetItemString( al_currow, "twoway_tag"),''))
	ls_pass 	= trim(f_nvl(dw_1.GetItemString( al_currow, "twoway_passcode"),'')) 
	this.event ue_trace( 'wf_send_page-'+ string(now()), 'b4 sending page. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId + ", Tag:" + ls_tag+ ", Pass:" + ls_pass)
	If ls_tag<>'' and ls_pass<>'' then lb_message_sent = wf_send_snpp_page(ls_tag,ls_pass, '2S')
ElseIf as_type = '2SR' then //SNPP two way status - reminder
// reminder page status
	ls_tag	= trim(f_nvl(dw_1.GetItemString( al_currow, "twoway_tag_rem"),''))
	ls_pass 	= trim(f_nvl(dw_1.GetItemString( al_currow, "twoway_passcode_rem"),'')) 
	this.event ue_trace( 'wf_send_page-'+ string(now()), 'b4 sending page. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId + ", Tag:" + ls_tag+ ", Pass:" + ls_pass)
	If ls_tag<>'' and ls_pass<>'' then lb_message_sent = wf_send_snpp_page(ls_tag,ls_pass, '2SR')
ELSEIf as_type = '2SM' then //SNPP two way mgr page status 
	ls_tag	= trim(f_nvl(dw_1.GetItemString( al_currow, "twoway_tag_mgr"),''))
	ls_pass 	= trim(f_nvl(dw_1.GetItemString( al_currow, "twoway_passcode_mgr"),''))
	this.event ue_trace( 'wf_send_page-'+ string(now()), 'b4 sending page. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId + ", Tag:" + ls_tag+ ", Pass:" + ls_pass)
	If ls_tag<>'' and ls_pass<>'' then lb_message_sent = wf_send_snpp_page(ls_tag,ls_pass, '2SM')

ELSEIf as_type = 'MGR_NOAR' then //SNPP 2way: auto reassignment failed
	lb_message_sent = wf_send_snpp_page(pagerId,msg, '2MRF') // send close call reply only 
	this.event ue_trace( 'wf_send_page-'+ string(now()), 'after mgr reassign failed. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId + ", Tag:" + ls_tag+ ", Pass:" + ls_pass)

ELSEIf 	as_type = 'MGR_NOCL' or as_type = 'EMP_NOCL' or &
			as_type = 'MGR_CL' 	or as_type = 'EMP_CL' then //SNPP close failed or successful, send one way
	lb_message_sent = wf_send_snpp_page(pagerId,msg, '1') // send no replies
	this.event ue_trace( 'wf_send_page-'+ string(now()), 'close call confirm or fail. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId + ", Tag:" + ls_tag+ ", Pass:" + ls_pass)
	
ELSE
this.event ue_trace( 'wf_send_page-'+ string(now()), 'b4 sending page. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId)

 CHOOSE CASE cPageSysCd
	CASE "SA"										//ServiceAlert transmitter
		wf_send_sa_page(pagerId,msg)
		lb_message_sent = true // assume true - no checking is being done VZ
	CASE "SC"										//Salcom transmitter
		wf_send_salcom_page(pagerId,msg)
		lb_message_sent = true // assume true - no checking is being done VZ
	CASE "VS", "OT" 
		lb_message_sent = wf_send_tap_msg(pagerId,msg)
	CASE "ES"
		lb_message_sent = wf_send_espa_msg(pagerId,msg)
	CASE "DI"
		wf_format_dialup_str( pagerId, msg )
	CASE "DI2" // same as DI but send page one at a time
		lb_message_sent = wf_send_dialup_page(pagerId, msg) 
	CASE  "SN1" 									// SNPP one way
		lb_message_sent = wf_send_snpp_page(pagerId,msg, '1')
	CASE  "SN2" // SNPP two way
		CHOOSE CASE as_type
			case 'MGR'
				lb_message_sent = wf_send_snpp_page(pagerId,msg, '2M')
			case 'EMPR'
				lb_message_sent = wf_send_snpp_page(pagerId,msg, '2R')
			case else
				lb_message_sent = wf_send_snpp_page(pagerId,msg, '2') // EMP 
 		END CHOOSE
	CASE "TX"
		wf_send_tx_msg(pagerId,msg)
		lb_message_sent = true
	CASE "EML"
		wf_send_tx_msg(pagerId,msg)
		lb_message_sent = true
 END CHOOSE
 
END IF // type 
this.event ue_trace( 'wf_send_page-'+ string(now()), 'aft sending page. Type="'+ as_type +'", Sys:"'+cPageSysCd +'", pager:"'+pagerId)

if Not IsValid( this) then return 
if cPageSysCd = "DI" then // do not update page count & time stamp until dialup page send 
	callNumToUpd[UpperBound(callNumToUpd)+1] 	= ls_call 
	callPageCnt[UpperBound(callPageCnt)+1] 	= string( li_pageCnt + 1)
	callRow[UpperBound(callRow)+1] 				= al_currow
	callAssignId[UpperBound(callAssignId)+1] 	= ls_id 
else 
	IF lb_message_sent and POS ('/EMP/EMPR/MGRNOP/MGR/,', '/'+trim(as_type)+'/') > 0  then 
		li_pageCnt = li_pageCnt + 1 
		wf_upd_tables ( ls_call , string(li_pageCnt), ls_id, al_currow,ls_ascode) 
	END IF
	f_wait (1) // wait 5 sec ??????? 
	if Not IsValid( this) then return 
end if

end subroutine

public function string wf_format_msg (string msgtype, string incallnum, string inroom, string inguest, string intask, string insubtask, string intaskdef, string inreminder, string indate, string inemployee, integer inpagecnt, string inspecialmsg, string indept, string inroomno);string outMsg, timeShort, taskDefMsg, mgrMsg 
datetime curDt
curDt = datetime(today(),now())
inTaskDef=f_strip_special_char(inTaskDef)
taskDefMsg = ""
mgrMsg=""
if len(trim(inTaskDef)) > 0 then taskDefMsg = ". Def:"+trim(inTaskDef)
if msgType = 'MGR' or msgType='MGRNOP' or msgType = 'MGR_NOAR' then
	if inpagecnt = 3 then
		mgrMsg = 'Supv:'+f_find_supervisor(indept, inRoomNo, curDt)
		if is_msg_size = 'S' or is_msg_size = 'M' then
			mgrMsg = mgrMsg +' Emp:'
		end if
	end if	
end if

CHOOSE CASE msgType
	CASE 'EMP', 'EMPR' 
		if is_msg_size = 'S' then //Short message
			outMsg = wf_shorten_txt(inRoom,5)+' '+wf_shorten_txt(inSubtask,10) +' '+&
				 wf_shorten_txt(intaskdef,9) +' ' + String(Now(), "hh:mm")
			if inPageCnt > 0 then 
				outMsg = "Rem "+wf_shorten_txt(inRoom,7)+&
					' '+wf_shorten_txt(inSubtask,10)+' '+wf_shorten_txt(intaskdef,9) 
			end if
		elseif is_msg_size = 'M' then //Medium size 
			outMsg =  " #"+ inCallNum +", room:"+ inRoom + & 
			 ", "+ inTask + inDate 
			if inPageCnt > 0 then 
				outMsg = " ["+inReminder+"]" + outMsg 
			end if			
		else
			outMsg =  " call#:"+ inCallNum +". room:"+ inRoom +". guest:" + inGuest + & 
			 ". task:"+ inTask  + taskDefMsg + inDate 
			if inPageCnt > 0 then 
				outMsg = " ["+inReminder+"]" + outMsg 
			end if
		end if
	
	CASE 'MGR'
		if is_msg_size = 'S' then // Short message
			outMsg = wf_shorten_txt(inEmployee,9)+' '+wf_shorten_txt(inRoom,5)+' '+&
				wf_shorten_txt(inSubtask,10) + ' '+ String(Now(), "hh:mm")
		elseif is_msg_size = 'M' then //Medium size 
			outMsg = inEmployee +" #"+ inCallNum +", room:"+inRoom+", "+&
				inTask + inDate
		else
			outMsg = "Emp:"+ inEmployee +" call#:"+ inCallNum +". room:"+inRoom+". guest:"+&
				inGuest+". task:"+ inTask  + taskDefMsg + inDate 
		end if

	CASE 'MGRNOP'
		if is_msg_size = 'S' then
			outMsg = wf_shorten_txt(inSpecialMsg,26) + ' '+ String(Now(), "hh:mm")
		else
			outMsg = inSpecialMsg +" "+ inDate  
		end if
		
	CASE 'MGR_NOAR' 
		if is_msg_size = 'S' then
			outMsg="Can't Reassign: " + inCallNum + " " + String(Now(), "hh:mm")
		elseif  is_msg_size = 'M' then //Medium size 
			outMsg = inEmployee +", #"+ inCallNum +", room:"+inRoom+&
				", "+ inTask + inDate 
			outMsg = "Can't Reassign:"+ outMsg+ inDate  
		else
			outMsg = "Emp:"+ inEmployee +" call#:"+ inCallNum +". room:"+inRoom+&
				". guest:"+inGuest+". task:"+ inTask + inDate 
			outMsg = "Cannot Auto-Reassign: "+ outMsg+ inDate  
		end if	
 
	CASE 'MGR_NOCL' //mgr close call reply failed 
		if is_msg_size = 'S' then
			outMsg="Can't close: " + inCallNum + String(Now(), "hh:mm")
		elseif  is_msg_size = 'M' then //Medium size 
			outMsg = inEmployee +", #"+ inCallNum +", room:"+inRoom+&
				", " + inTask + inDate 
			outMsg = "Can't close:"+ outMsg+ inDate 	
		else
			outMsg = "Emp:"+ inEmployee +" call#:"+ inCallNum +". room:"+inRoom+&
				". guest:"+inGuest+". task:"+ inTask  + taskDefMsg + inDate 
			outMsg = "Could not close call. "+ outMsg+ inDate 	
		end if
		
	CASE 'EMP_NOCL' //emp close call reply failed
		if is_msg_size = 'S' then
			outMsg="Can't close: " + inCallNum + " " + String(Now(), "hh:mm")
		elseif is_msg_size = 'M' then
			outMsg = inEmployee +", #"+ inCallNum +", room:"+inRoom+&
				", "+ inTask + inDate 
			outMsg = "Can't close:"+ outMsg+ inDate  
		else
			outMsg = "Emp:"+ inEmployee +" call#:"+ inCallNum +". room:"+inRoom+&
				". guest:"+inGuest+". task:"+ inTask  + taskDefMsg + inDate 
			outMsg = "Could not close call. "+ outMsg+ inDate  
		end if
		
	CASE 'MGR_CL' //mgr close call reply failed 
		if is_msg_size = 'S' then
			outMsg="Closed: "+inCallNum+String(Now(), "hh:mm")
		elseif is_msg_size = 'M' then
			outMsg =inEmployee +", #"+ inCallNum +", room:"+&
				inRoom+", "+ inTask + inDate 
			outMsg = "Call closed:"+ outMsg+ inDate  			
		else
			outMsg = "Emp:"+ inEmployee +" call#:"+ inCallNum +". room:"+&
				inRoom+". guest:"+inGuest+". task:"+ inTask  + taskDefMsg + inDate 
			outMsg = "Call closed successfully. "+ outMsg+ inDate  
		end if
		
	CASE 'EMP_CL' //emp close call reply failed
		if is_msg_size = 'S' then
			outMsg="Closed: "+inCallNum+String(Now(), "hh:mm")
		elseif is_msg_size = 'M' then
			outMsg = inEmployee +", #"+ inCallNum +", room:"+inRoom+&
				", " + inTask + inDate 
			outMsg = "Closed:"+ outMsg+ inDate			
		else
			outMsg = "Emp:"+ inEmployee +" call#:"+ inCallNum +". room:"+inRoom+&
				". guest:"+inGuest+". task:"+ inTask  + taskDefMsg + inDate 
			outMsg = "Call closed successfully. "+ outMsg+ inDate
		end if	
		
End Choose

return mgrMsg+outMsg

end function

public subroutine wf_read_smpp_file ();integer li_FileNum
string ls_Emp_Input, ls_file_name
long ll_FLength
integer i
i=1

do while i <= lb_1.TotalItems()
	ls_file_name = is_text_dir+"\"+lb_1.text(i)
	ll_FLength = FileLength(ls_file_name)
	li_FileNum = FileOpen(ls_file_name, StreamMode!)
	IF ll_FLength < 32767 THEN
        FileRead(li_FileNum, ls_Emp_Input)
	END IF
	lb_2.InsertItem(ls_Emp_Input, i)
	i++
loop
end subroutine

public function boolean wf_find_emp_by_pagerid (string in_pager_id, ref string out_emp_name, ref string out_dept);string sEmpId
out_dept=''
out_emp_name=''

select emp_id into :sEmpId from pager_emp 
where pager_id=:in_pager_id;
if sqlca.sqlcode = 0 then
	select employee, dept
	into	:out_emp_name, :out_dept
	from instemp where employee_number=:sEmpId;
	if sqlca.sqlcode = 0 then // found in pager_emp table
		return true
	end if
else
	if sqlca.sqlcode < 0 then
		MessageBox("sql error",sqlca.sqlerrtext)
		return false
	else // not found in pager_emp table
		select distinct supervisor_id
		into	:sEmpId
		from	supervisor where supervisor_pager_id=:in_pager_id;
		if sqlca.sqlcode < 0 then
			MessageBox("sql error",sqlca.sqlerrtext)
			return false			
		else
			if sqlca.sqlcode = 100 then // not found in supervisor table
				select distinct deptmgr_id 
				into	:sEmpId
				from	deptmgr where mgr_pager_id = :in_pager_id;
				if sqlca.sqlcode <> 0 then // not found in deptmgr table
					return false
				end if
			end if
		end if
	end if
end if
			
// found employee_id in either supervisor or deptmgr table then look for name
// do not populate out_dept when employee is not found pager_emp table
// dept will be default to closed_bydept in timer/pending call table
select employee into :out_emp_name
from 	instemp where employee_number=:sEmpId;
if sqlca.sqlcode <> 0 then
	MessageBox("sql error",sqlca.sqlerrtext)
	out_emp_name = '' 
	out_dept = ''
	return false
end if

return true


end function

public function boolean wf_declinecalls (string in_call_number, integer call_tbl_ind, string username);string autoAssign, assignDept, declinedEmpId, declinedEmpName, employeeId, empName, pgrId, zoneId, roomNo
int timerMin
datetime timerStart

// get all past declined employee_id from declined call
string dclEmpId[]
int dclIndx 
DECLARE dclEmp CURSOR for
select	emp_id
from		declinedcalls
where		call_number = :in_call_number;
if sqlca.sqlcode < 0 then
	egm_sqlerror(sqlca)
	return false
end if

OPEN dclEmp;
dclIndx = 1

FETCH dclEmp into :dclEmpId[dclIndx];
DO WHILE sqlca.sqlcode = 0
	dclIndx++
	FETCH dclEmp into :dclEmpId[dclIndx];
LOOP


// insert declinedcalls 
s_pageassignment ass

// call_tbl_ind 1 = timercalls
//              2 = pendingcalls


if call_tbl_ind = 1 then
	insert into declinedcalls 
	(				call_number,
					emp_id,
					emp_name,
					emp_dept,
					time_assigned,
					time_declined,
					task_no,
					sub_task_no,
					room,
					lst_upd,
					declined_caller)
			
	select 	a.call_number,
				b.emp_id,
				b.emp_name,
				b.dept_assigned,
				b.time_assigned,
				time_declined=getdate(),
				a.problem_number,
				a.subproblem_number,
				room,
				lst_upd=getdate(),
				:userName
	from		timercalls a, pageassignment b
	where		a.call_number = :in_call_number
	and		a.call_number = b.call_number;
else
	insert into declinedcalls 
	(				call_number,
					emp_id,
					emp_name,
					emp_dept,
					time_assigned,
					time_declined,
					task_no,
					sub_task_no,
					room,
					lst_upd )
			
	select 	a.call_number,
				b.emp_id,
				b.emp_name,
				b.dept_assigned,
				b.time_assigned,
				time_declined=getdate(),
				a.problem_number,
				a.subproblem_number,
				room,
				lst_upd=getdate()	
	from		pendingcalls a, pageassignment b
	where		a.call_number = :in_call_number
	and		a.call_number = b.call_number;
end if
if sqlca.sqlcode < 0 then
	egm_sqlerror(sqlca)
//	MessageBox("insert error", sqlca.sqlerrtext)
	return false
end if


// get current declined call employee id
select	emp_id
into		:declinedEmpId
from		pageassignment
where		call_number = :in_call_number
and		assignment_cd = 'T';
if sqlca.sqlcode < 0 then
	egm_sqlerror(sqlca)
	return false
end if



// get auto_assign_ind from subproblem table
if call_tbl_ind = 1 then
	select auto_assign_ind, b.timer1_start_min, repairman, closed_bydept, unit_type, room, timer_start
	into	 :autoAssign, :timerMin, :declinedEmpName, :assignDept, :zoneId, :roomNo, :timerStart
	from 	 timercalls a, subproblem b, area c
	where  call_number=:in_call_number
	and 	 a.problem_number = b.problem_number
	and 	 a.subproblem_number = b.subproblem_number
	and	 a.room = c.area_number;
else
	select auto_assign_ind, b.timer1_start_min, repairman, closed_bydept, unit_type, room, timer_start
	into	 :autoAssign, :timerMin, :declinedEmpName, :assignDept, :zoneId, :roomNo, :timerStart
	from 	 pendingcalls a, subproblem b, area c
	where  call_number=:in_call_number
	and 	 a.problem_number = b.problem_number
	and 	 a.subproblem_number = b.subproblem_number
	and	 a.room = area_number;
end if
if sqlca.sqlcode < 0 then
	egm_sqlerror(sqlca)
	return false
end if

int reAssignCnt 
reAssignCnt = 0
TaskReAssignment:
reAssignCnt = reAssignCnt + 1 
if autoAssign = 'Y' then
	if f_find_pager_id_wo_declined (assignDept,empName, employeeId, pgrId, roomNo, dclEmpId[], timerStart) then
		if employeeId <> declinedEmpId then
		// update timer/pending call with new employee and new timer start time
			if call_tbl_ind = 1 then 
				update	timercalls
				set		repairman = :empName,
							timer_start = dateadd(minute,:timerMin, getdate()),
							paging_ind = 0
				where		call_number = :in_call_number;
			else
				update	pendingcalls
				set		repairman = :empName,
							timer_start = dateadd(minute,:timerMin, getdate()),
							paging_ind = 0
				where		call_number = :in_call_number;	
			end if
			if sqlca.sqlcode < 0 then
				egm_sqlerror(sqlca)
				return false
			end if
			// remove declined pageassignment call
			wf_remove_declined_pageassignment(in_call_number)
			// setup pageassignment 
			ass.assignment_id = string(today(),"yyyymmddhhmmss")
			ass.assignment_cd = 'T'
			ass.dept_assigned = assignDept
			ass.emp_id = employeeId
			ass.emp_name = empName
			ass.pager_id = pgrId
			ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
			SetNull(ass.time_completed)
			ass.call_number = in_call_number
			//	SetNull(ass.page_sent)
			ass.page_sent = 'N'
			ass.special_msg = ''
			f_insert_assignment(ass)
		else
			if reAssignCnt = 1 then 
				goto TaskReAssignment
			end if
			wf_remove_declined_pageassignment(in_call_number)
			// same employee as declined employee is found from pager pool
			ass.assignment_id = string(today(),"yyyymmddhhmmss")
	   		ass.assignment_cd = 'N'
 	  	 	ass.dept_assigned = assignDept
	  	 	ass.emp_id = '8888888888'
	  	 	ass.emp_name = 'NONE'
     	 	ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	  		SetNull(ass.time_completed)
	 	  	ass.call_number = in_call_number 
	   		ass.page_sent = 'N'
			ass.special_msg = 'Auto assigned call # ' + in_call_number + &
			 ' was declined. It has failed to allocate a new pager!'
			ass.pager_id = f_find_supervisor(assignDept,roomNo, timerStart)
			f_insert_assignment(ass)	
			if wf_clear_auto_assignment(call_tbl_ind, in_call_number, timerMin) = false then
				return false
			end if
		end if

	else // no pager or employee found. setup page for manager
		wf_remove_declined_pageassignment(in_call_number)
		ass.assignment_id = string(today(),"yyyymmddhhmmss")
	   ass.assignment_cd = 'N'
 	   ass.dept_assigned = assignDept
	   ass.emp_id = '8888888888'
	   ass.emp_name = 'NONE'
      ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	   SetNull(ass.time_completed)
	   ass.call_number = in_call_number 
	   ass.page_sent = 'N'
		ass.special_msg = 'Auto assigned call # ' + in_call_number + &
		 ' was declined. It has failed to allocate a new pager!'
		ass.pager_id = f_find_supervisor(assignDept,roomNo,timerStart)
		f_insert_assignment(ass)	
		if wf_clear_auto_assignment(call_tbl_ind, in_call_number, timerMin) = false then
			return false
		end if
	end if
else // clear assign dept and employee and set notification to manager if it is not an auto-assign task
	wf_remove_declined_pageassignment(in_call_number)
	ass.assignment_id = string(today(),"yyyymmddhhmmss")
	ass.assignment_cd = 'N'
 	ass.dept_assigned = assignDept
	ass.emp_id = '8888888888'
	ass.emp_name = 'NONE'
   ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	SetNull(ass.time_completed)
	ass.call_number = in_call_number 
	ass.page_sent = 'N'
	ass.special_msg = 'Auto assigned call # ' + in_call_number + &
		 ' was declined!'
	ass.pager_id = f_find_supervisor(assignDept,roomNo,timerStart)
	f_insert_assignment(ass)	
	if wf_clear_auto_assignment(call_tbl_ind, in_call_number, timerMin) = false then
		return false
	end if
	
end if
commit;
if sqlca.sqlcode < 0 then
	egm_sqlerror(sqlca)
	return false
end if
return true
			
end function

public function boolean wf_remove_declined_pageassignment (string in_call_number);// remove declined pageassignment call
	delete 	from pageassignment
	where		call_number = :in_call_number
	and		assignment_cd = 'T';
	if sqlca.sqlcode < 0 then
		egm_sqlerror(sqlca)
		return false
	end if
	return true;
end function

public function boolean wf_clear_auto_assignment (integer call_tbl_ind, string in_call_number, integer in_timer_min);	if call_tbl_ind = 1 then
		update 	timercalls
		set	 	repairman = '',
		/*			closed_bydept = '',*/
					paging_ind = 0,
					timer_start = dateadd(minute, :in_timer_min, getdate())
		where		call_number = :in_call_number;				
	else
		update 	pendingcalls
		set	 	repairman = '',
		/*			closed_bydept = '', */
					paging_ind = 0,
					timer_start = dateadd(minute,:in_timer_min, getdate())
		where		call_number = :in_call_number;				
	end if
	if sqlca.sqlcode < 0 then
		egm_sqlerror(sqlca)
		return false
	end if
	
	return true
end function

on w_send_page.create
this.ole_1=create ole_1
this.cb_3=create cb_3
this.st_link=create st_link
this.cbx_ltrace=create cbx_ltrace
this.cb_view=create cb_view
this.cb_2=create cb_2
this.st_1=create st_1
this.cbx_ptrace=create cbx_ptrace
this.sle_tfile=create sle_tfile
this.cb_email=create cb_email
this.cb_start=create cb_start
this.em_timer=create em_timer
this.st_timer=create st_timer
this.cb_1=create cb_1
this.cb_delete=create cb_delete
this.dw_2=create dw_2
this.st_date=create st_date
this.mle_1=create mle_1
this.p_1=create p_1
this.dw_1=create dw_1
this.cb_resend=create cb_resend
this.cb_sort=create cb_sort
this.cb_menu_page=create cb_menu_page
this.cb_refresh=create cb_refresh
this.cb_exit=create cb_exit
this.st_border=create st_border
this.lb_1=create lb_1
this.cb_save=create cb_save
this.lb_2=create lb_2
this.cb_test_espa=create cb_test_espa
this.Control[]={this.ole_1,&
this.cb_3,&
this.st_link,&
this.cbx_ltrace,&
this.cb_view,&
this.cb_2,&
this.st_1,&
this.cbx_ptrace,&
this.sle_tfile,&
this.cb_email,&
this.cb_start,&
this.em_timer,&
this.st_timer,&
this.cb_1,&
this.cb_delete,&
this.dw_2,&
this.st_date,&
this.mle_1,&
this.p_1,&
this.dw_1,&
this.cb_resend,&
this.cb_sort,&
this.cb_menu_page,&
this.cb_refresh,&
this.cb_exit,&
this.st_border,&
this.lb_1,&
this.cb_save,&
this.lb_2,&
this.cb_test_espa}
end on

on w_send_page.destroy
destroy(this.ole_1)
destroy(this.cb_3)
destroy(this.st_link)
destroy(this.cbx_ltrace)
destroy(this.cb_view)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cbx_ptrace)
destroy(this.sle_tfile)
destroy(this.cb_email)
destroy(this.cb_start)
destroy(this.em_timer)
destroy(this.st_timer)
destroy(this.cb_1)
destroy(this.cb_delete)
destroy(this.dw_2)
destroy(this.st_date)
destroy(this.mle_1)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.cb_resend)
destroy(this.cb_sort)
destroy(this.cb_menu_page)
destroy(this.cb_refresh)
destroy(this.cb_exit)
destroy(this.st_border)
destroy(this.lb_1)
destroy(this.cb_save)
destroy(this.lb_2)
destroy(this.cb_test_espa)
end on

event open;SetPointer(HourGlass!)

is_dept=ProfileString( cINIPath+cINIFile, "Paging systems", "Dept", "" )
//is_ts_on_sw=ProfileString( cINIPath+cINIFile, "Paging systems", "MsgTsOnSW", "Y" )
is_text_dir=ProfileString( cINIPath+cINIFile, "Paging systems", "TextMsgDir", "C:\" )
is_smpp_dir=ProfileString( cINIPath+cINIFile, "Paging systems", "TextSmppDir", "C:\" )
is_msg_size=ProfileString( cINIPath+cINIFile, "Paging systems", "MsgFormSize", " " )

select option21
into	 :is_email_dir
from	 vzt_sysoptions;
if sqlca.sqlcode = 100 then
	is_email_dir = is_text_dir
else
	if sqlca.sqlcode < 0 then
		MessageBox("DB Error",sqlca.sqlerrtext)
	end if
end if

if len(trim(is_email_dir)) = 0 then
	is_email_dir = is_text_dir
end if

this.event ue_create_uo()
this.event ue_translate() // set up language dependent strings 

dw_1.visible	 	= true
dw_1.y 				= 248

if gs_debugmode <> 'Y' then 
	cb_test_espa.visible = false
	cb_save.visible 		= false
	cb_email.visible 		= false
end if

//this.wf_portopen ()
//Set dept filter
if len(RightTrim(is_dept ))>0 then
	wf_set_dept_filter(is_dept)
end if

if dw_1.SetTransObject(sqlca) < 0 	then this.event ue_trace( "DB Error (open in w_send_page)","SetTransObject Error!")
if dw_1.Retrieve() < 0 					then this.event ue_trace( "DB Error (open in w_send_page)","Paging info retrieve Error!")

st_date.text = string(today(),"mmmm d, yyyy")
//this.Title = "Paging... " + string (now(),"hh:mm am/pm")

refreshTimerCnt 	= 0
delayCount 			= 0

em_timer.text = string (nPAgingRefresh) // set timer value
this.event ue_timer_on ( false) //

//lb_1.DirList(is_text_dir+"*.SMP",0)



end event

event close;ib_closing = true
timer (0) 

//	CHOOSE CASE cPageSysCd 
//		CASE "VS", "ES", "OT" 
//		if ole_1.object.PortOpen = true then ole_1.object.OutBufferCount=0
//			ole_1.object.output = char(CODE_EOT)+char(CODE_CR)
//			ole_1.object.PortOpen = FALSE
//			
//		CASE "SN1", "SN2"  
//			uo_snpp.event ue_end_tran()
//			uo_snpp.event ue_disconnect()
//			
//	END CHOOSE
//
//
//	CHOOSE CASE cpagesyscd 
//		CASE 'ES' 
//			DESTROY uo_espa 
//		CASE 'SN1', 'SN2'
//			DESTROY uo_snpp 
//	END CHOOSE

if is_comport_open then
 if gs_settings <> 'TCP' then 
	if ole_1.object.PortOpen = true then ole_1.object.OutBufferCount=0
		ole_1.object.output = char(CODE_EOT)+char(CODE_CR)
		ole_1.object.PortOpen = FALSE
 end if		
end if

if is_snpp_open then
	uo_snpp.event ue_end_tran()
	uo_snpp.event ue_disconnect()
	DESTROY uo_snpp 
end if

if is_espa_open then
	DESTROY uo_espa
end if
		

end event

event timer;timer(0) // stop recurring timer loop!
if ib_closing then return 

st_timer.visible 	 = true

st_date.text 		= string(today(),"mmmm d, yyyy")
refreshTimerCnt 	= 0 
delayCount 			= 0

this.post event ue_refresh() 

f_wait( 1)

end event

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event resize;If sizetype <> 1 then
	dw_1.x		= 10
	dw_1.width  = newwidth - 20 
	dw_1.height = newheight - dw_1.y - 10
	lb_1.x = lb_1.x + dw_1.x
	lb_1.y = lb_1.y + dw_1.y
	lb_2.x = lb_2.x + dw_1.x
	lb_2.y = lb_2.y + dw_1.y	
//	dw_1.Resize ( this.width - il_windwwidthdiff, this.height - il_windwheightdiff ) 
End If

lb_1.BringToTop=true
lb_2.BringToTop=true
end event

event closequery;ib_closing = true
If cb_refresh.enabled = false then 
	If MessageBox('Application is Busy', 'Closing the window may cause it to crash' + &
			'and display error messages.' + & 
			'~r~nWould you like to continue anyway?', question!, YesNo!, 2) = 1 then 
		return 0
		timer( 0 )
	ELSE
		return 1
	END IF
ELSE
	timer( 0 )
	RETURN 0
END IF
end event

type ole_1 from olecustomcontrol within w_send_page
event oncomm ( )
integer x = 3122
integer y = 756
integer width = 174
integer height = 152
integer taborder = 180
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_send_page.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Update Quick Call Shift Time!"
integer x = 1751
integer y = 36
integer width = 366
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "QCall Time"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;open(w_quick_time)
end event

type st_link from statictext within w_send_page
integer x = 3337
integer y = 44
integer width = 101
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "LNK"
boolean focusrectangle = false
end type

type cbx_ltrace from checkbox within w_send_page
integer x = 3255
integer y = 32
integer width = 69
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

type cb_view from commandbutton within w_send_page
integer x = 3250
integer y = 120
integer width = 155
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "view"
end type

event clicked;If FileExists(sle_tfile.text) then
	Run( "notepad.exe " + sle_tfile.text )
END IF
end event

type cb_2 from commandbutton within w_send_page
integer x = 3086
integer y = 120
integer width = 155
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "erase"
end type

event clicked;If FileExists(sle_tfile.text) then FileDelete(sle_tfile.text)


end event

type st_1 from statictext within w_send_page
integer x = 3086
integer y = 36
integer width = 183
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ptrace"
boolean focusrectangle = false
end type

type cbx_ptrace from checkbox within w_send_page
integer x = 3003
integer y = 32
integer width = 69
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

type sle_tfile from singlelineedit within w_send_page
integer x = 2642
integer y = 120
integer width = 434
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "c:\dts_ptrace.txt"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_email from commandbutton within w_send_page
boolean visible = false
integer x = 2642
integer y = 132
integer width = 352
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "email sched"
end type

event clicked;string ls_file
ls_file = 'paging_sched.txt'
dw_1.SaveAs( ls_file, TEXT!, True)

//email
FileDelete(ls_file)
end event

type cb_start from commandbutton within w_send_page
integer x = 2217
integer y = 36
integer width = 361
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Stop Timer"
end type

event clicked;If lower(this.text )= 'start timer' then 
	this.text = 'Stop Timer' 
	nPagingRefresh = integer( em_timer.text ) 
	SetProfileString (cINIPath + cINIFile,"Paging Systems", "ReadSeconds",string(nPagingRefresh)	)
	parent.event ue_timer_on ( false) //

ELSE // stop 
	this.text = 'Start Timer' 
	timer(0)
	cb_exit.enabled	 		= true
	cb_refresh.enabled 		= true
	cb_resend.enabled	 		= true
//	cb_menu_page.enabled	 	= true

END IF


end event

type em_timer from editmask within w_send_page
integer x = 2217
integer y = 140
integer width = 361
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "10"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
string minmax = "5~~1200"
end type

type st_timer from rectangle within w_send_page
integer linethickness = 8
long fillcolor = 8421504
integer x = 942
integer y = 12
integer width = 1207
integer height = 232
end type

type cb_1 from commandbutton within w_send_page
boolean visible = false
integer x = 1870
integer y = 140
integer width = 247
integer height = 108
integer taborder = 170
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//ole_1.Object.Output = char(255) + char(255) + char(255) + char(3) + '2010002' + char(13) + 'Ming Test'+ char(13)
wf_send_sa_page('2010002','Ming Test')
end event

type cb_delete from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Click here to delete the highlighted record"
boolean visible = false
integer x = 3003
integer y = 220
integer width = 398
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Delete"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;long delRow
int res
string delAssId
delRow = dw_1.GetRow()
delAssId = dw_1.GetItemString(delRow,"assignment_id")
if delRow = 0 then
	Messagebox("Error","First click to high-light the desired record then click the Delete button!")
	return
end if

If not Is_PasswordOK( Get_Event_Security( "BO" ) ) Then
	return
end if

res = MessageBox("Confirmation","Are you sure want to delete record: "+&
		dw_1.GetItemString(delRow,"call_number") + " for " + &
		dw_1.GetItemString(delRow,"emp_name") + "?" + &
		" This may result problem in data integrity!",Question!,YesNo!,2)
if res = 1 then
	dw_1.DeleteRow(delRow)
	MessageBox('deleted', "assignment_id: " + delAssId +" is deleted!")
	DELETE FROM pageassignment
   	WHERE pageassignment.assignment_id = :delAssId   ;
	if sqlca.sqlcode < 0 then
		MessageBox("DB Error",sqlca.sqlerrtext)
	end if
	commit;
end if 
end event

type dw_2 from datawindow within w_send_page
boolean visible = false
integer x = 741
integer y = 152
integer width = 297
integer height = 100
integer taborder = 150
string dataobject = "d_send_page_rpt"
boolean livescroll = true
end type

type st_date from statictext within w_send_page
integer x = 9
integer y = 180
integer width = 914
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 25509632
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_send_page
integer x = 14
integer y = 660
integer width = 2226
integer height = 708
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 25509632
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_send_page
integer x = 9
integer y = 8
integer width = 914
integer height = 248
string picturename = "pager03.bmp"
end type

type dw_1 from datawindow within w_send_page
event mousemove pbm_mousemove
string tag = "All outstanding paging tasks"
integer x = 9
integer y = 268
integer width = 2958
integer height = 1424
integer taborder = 140
string dataobject = "d_send_page"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;if row <= 0 or row > this.RowCount() then return

this.SelectRow(0, false)
this.SelectRow(row, true )





end event

event doubleclicked;if row <= 0 or row > this.RowCount() then return

timer(0)

this.SelectRow(0, false)
this.SelectRow(row, true )

cb_resend.event clicked()
end event

type cb_resend from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Click here to re-send page a currently highlighted task !"
integer x = 969
integer y = 36
integer width = 366
integer height = 80
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Resend"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;timer(0)
parent.event ue_timer_on (true)

string 	capCode, pageStr,msg, curDt, pgecd
long 		curRow
int		pageCnt


curRow = dw_1.GetRow()
if curRow < 1 then 
	parent.event ue_timer_on (false)
	return
end if


cPageSysCd = dw_1.GetItemString(curRow,'pagers_pager_type')
pageCnt = integer(dw_1.GetItemString(curRow,'page_sent'))

if pos(cPageSysCd,'SN') > 0  then
	if not is_snpp_open then wf_create_uo() 
elseif pos(cPageSysCd,'ES') > 0 then
	if not is_espa_open then wf_create_uo()
else
	if cPageSysCd = 'SA' or cPageSysCd ='VS' or cPageSysCd = 'OT' or &
		cPageSysCd = 'SC' then
		if not is_comport_open then wf_portopen() 
	end if
end if

wf_send_page(curRow, 'EMP', true, pageCnt)
if POS(cPageSysCd,"DI")>0 then parent.event ue_send_dialup() 

If lower(cb_start.text) = 'stop timer' then 
	parent.event ue_timer_on (false) // restart timer if it was running on dblclick
END IF



end event

type cb_sort from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Click here to change the sort of the screen"
integer x = 1358
integer y = 36
integer width = 366
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Sort"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;string nullStr
SetNull(nullStr)
dw_1.SetSort(nullStr)
dw_1.Sort()
end event

type cb_menu_page from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Click here to send a free-form page!"
integer x = 969
integer y = 140
integer width = 366
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Manual Page"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;//timer(0) 
//OpenWithParm(w_paging_msg,ole_1)
//if Message.StringParm = 'exit' then
//	timer(nPagingRefresh) 
//	return
//end if
//
//string pageMsgStr, msgStr1, msgStr2, msgStr3, msgStr4, msgStr5,pagersStr,dialSep
//int pagerStartPos
//boolean done
//time starttime 
//
//pagerStartPos = Pos( Message.StringParm, "#",1 ) + 1
//msgStr1 = char(255) + char(255) + char(255) + char(3) 
//msgStr3 = char(10)  
//msgStr4 = Mid(Message.StringParm, 1, pagerStartPos -2)
//msgStr5 = char(13)
//pagersStr = ""
//dialSep = ""
//
//done = false
//do while not done
//	msgStr2 = Mid(Message.StringParm, pagerStartPos,nPagerIdDigit)
//	pageMsgStr = msgStr1 + msgStr2 + msgStr3 + msgStr4 + msgStr5
////		ole_1.Object.Output = pageMsgStr 
//
//	CHOOSE CASE cPageSysCd
//		CASE "SA"
//			wf_send_sa_page(msgStr2,msgStr4)
//		CASE "VS", "OT" 
//			wf_send_tap_msg(msgStr2,msgStr4)
//		CASE "ES"
//			wf_send_espa_msg(msgStr2,msgStr4)
//		CASE "SN1", "SN2"
//			wf_send_snpp_page(msgStr2,msgStr4, '1') // menu page is one-way: no call to close
//		CASE "DI"
//				if pagersStr = "" then
//					pagersStr = msgStr2
//				else
//					pagersStr = pagersStr + "^"+msgStr2
//					dialSep = "^^"
//				end if
//	//			wf_send_dialup_page(msgStr2,msgStr4)
//		CASE "DI2"
//				if pagersStr = "" then
//					pagersStr = msgStr2
//				else
//					pagersStr = pagersStr + "^"+msgStr2
//					dialSep = "^^"
//				end if
//	END CHOOSE
//
//	pagerStartPos = pagerStartPos + nPagerIdDigit + 1
//	if Pos(cPageSysCd,"DI")<=0 then f_wait( 5)
//	if pagerStartPos > len(Message.StringParm) then
//		done = true
//	end if
//loop
//	
//if Pos(cPageSysCd,"DI")>0 then // Dialup connection
//	wf_send_dialup_page(pagersStr,msgStr4+dialSep)
//end if
//
//timer( nPagingRefresh)
//IF IsValid(w_manual_paging) = FALSE THEN 
	OpenSheet( w_manual_paging, "w_manual_paging", w_main, 0, Original! )
//end if
	
end event

type cb_refresh from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Click here to manually refresh the screen!"
integer x = 1358
integer y = 140
integer width = 366
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Re&fresh"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;parent.event ue_refresh() 


end event

type cb_exit from commandbutton within w_send_page
event mousemove pbm_mousemove
string tag = "Close this window"
integer x = 1751
integer y = 140
integer width = 366
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
end type

event mousemove;//w_main.SetMicroHelp(This.Tag)
end event

event clicked;//close(parent)
m_main.m_file.m_close.TriggerEvent("clicked")
end event

type st_border from rectangle within w_send_page
integer linethickness = 8
long fillcolor = 8421504
integer x = 2171
integer y = 12
integer width = 453
integer height = 232
end type

type lb_1 from listbox within w_send_page
boolean visible = false
integer x = 1938
integer y = 1140
integer width = 1006
integer height = 464
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_save from commandbutton within w_send_page
integer x = 2647
integer y = 20
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "save sched"
end type

event clicked;dw_1.SaveAs( '', TEXT!, True)
end event

type lb_2 from listbox within w_send_page
boolean visible = false
integer x = 1929
integer y = 724
integer width = 1006
integer height = 392
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_test_espa from commandbutton within w_send_page
integer x = 1751
integer y = 36
integer width = 366
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "test page"
end type

event clicked;// OpenWithParm(w_test_espa, ole_1)
timer(0)


If this.text = 'test page' then 
	this.text = 'stop test' 
	CHOOSE CASE cpagesyscd 
		CASE 'ES' 
			If gs_Settings='TCP' then 
				dw_1.y = uo_snpp.y + uo_snpp.height + 20
			ELSE
				dw_1.y = uo_espa.y + uo_espa.height + 20
			END IF		
			uo_espa.visible 	= true
			uo_espa.w_sp 		= parent
			mle_1.visible 		= true
		CASE 'SN1', 'SN2'
			uo_snpp.y = 255
			dw_1.y = uo_snpp.y + uo_snpp.height + 20
			mle_1.visible = false 
			uo_snpp.visible = true 
	END CHOOSE

ELSE // reset test 
	this.text = 'test page' 
	CHOOSE CASE cpagesyscd 
		CASE 'ES' 
			uo_espa.visible = false 
		CASE 'SN1', 'SN2'
			uo_snpp.visible = false
	END CHOOSE
	dw_1.y = 248 
	mle_1.visible = false
	cb_start.text = 'Stop Timer' 
	timer(nPagingRefresh)
END IF


end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
03w_send_page.bin 
2800000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000644a928001c7be4800000003000000c00000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000260000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000003c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004648a5600101b2c6e0000b6821400000000000000644a6b7001c7be48644a928001c7be48000000000000000000000000fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00430079007000690072006800670020007400630028002000290039003100340039000000200000000000000000000000000000000000000000000000001234432100000008000003ed000003ed648a560100060000000100008000000200000008000025800008000000000000000000000000000000000000000000001234432100000008000003ed000003ed648a560100060000000100008000000200000008000025800008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000003c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13w_send_page.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
