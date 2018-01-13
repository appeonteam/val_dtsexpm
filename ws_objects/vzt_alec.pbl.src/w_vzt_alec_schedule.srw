$PBExportHeader$w_vzt_alec_schedule.srw
forward
global type w_vzt_alec_schedule from w_vzt_batch_schedule
end type
type mdi_1 from mdiclient within w_vzt_alec_schedule
end type
end forward

global type w_vzt_alec_schedule from w_vzt_batch_schedule
integer x = 18
integer height = 1840
string title = "ALEC! Dynamic Scheduler"
string menuname = "m_vzt_alec_main"
windowtype windowtype = mdi!
mdi_1 mdi_1
end type
global w_vzt_alec_schedule w_vzt_alec_schedule

type variables
string is_propname
end variables

on w_vzt_alec_schedule.create
int iCurrent
call super::create
if this.MenuName = "m_vzt_alec_main" then this.MenuID = create m_vzt_alec_main
this.mdi_1=create mdi_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
end on

on w_vzt_alec_schedule.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event ue_assign_menu;this.ChangeMenu(m_vzt_alec_main) 
im_menu = this.menuid 

end event

event close;call super::close;if IsValid(w_vzt_alec_contact_edit) 		then CLOSE(w_vzt_alec_contact_edit)
if IsValid(w_vzt_alec_distlist_tv_edit) 	then CLOSE(w_vzt_alec_distlist_tv_edit)
if IsValid(w_vzt_alec_report_def) 			then CLOSE(w_vzt_alec_report_def)
end event

event open;call super::open;If is_mode = 'SERVER' then 
	npassuserrights = 10 // we are on the server - admin rights
	is_accessflags = 'WRA'
ELSE
	cb_timer.visible 		= false
	sle_interval.visible = false
	cb_sql.visible 		= false
	cbx_debug.visible 	= false
	cbx_live.visible 		= false
	uo_trace01.visible 	= false
	cb_timer.post event clicked()
END IF
gnv_appman.is_userid = 'SASYS'

select option06 into :is_propname from vzt_sysoptions where id=1;

end event

event ue_refresh;call super::ue_refresh;//check expiration
integer li_expired
select vzt_alec_expired() into :li_expired from dummy;
If li_expired < 0 then
	timer(0)
	post timer(0)
	MessageBox('Software Expired', 'This copy of Alec! is expired. Please contact Metromedia Software Support', Exclamation!)
	post close(this)
END IF

If li_expired > 0 then
	MessageBox('Software Is About to Expire', 'This copy of Alec! is about to expire in '+string(li_expired) +' days. Please contact Metromedia Software Support', Exclamation!)
END IF


end event

event ue_mail_options;call super::ue_mail_options;if len( trim(f_nvl(is_propname ,'')) ) > 0 then
	is_mail_subject = trim(is_mail_subject ) + ', ' + trim(f_nvl(is_propname ,''))
ELSE
END IF
end event

type cb_dfilter from w_vzt_batch_schedule`cb_dfilter within w_vzt_alec_schedule
end type

type uo_trace01 from w_vzt_batch_schedule`uo_trace01 within w_vzt_alec_schedule
integer x = 1504
integer y = 1556
end type

type dw_mainlist from w_vzt_batch_schedule`dw_mainlist within w_vzt_alec_schedule
end type

type cb_last_search from w_vzt_batch_schedule`cb_last_search within w_vzt_alec_schedule
end type

type cb_close from w_vzt_batch_schedule`cb_close within w_vzt_alec_schedule
integer x = 2770
integer width = 288
end type

type cb_delete1 from w_vzt_batch_schedule`cb_delete1 within w_vzt_alec_schedule
integer width = 288
end type

type cb_save from w_vzt_batch_schedule`cb_save within w_vzt_alec_schedule
integer x = 800
integer width = 288
end type

event cb_save::clicked;call super::clicked;if IsNumber( sle_interval.text) then SetProfileString( gnv_appman.is_inifile, "SCHEDULE",  "timer", sle_interval.text )

end event

type cb_select from w_vzt_batch_schedule`cb_select within w_vzt_alec_schedule
end type

type cb_new from w_vzt_batch_schedule`cb_new within w_vzt_alec_schedule
end type

type cb_newsearch from w_vzt_batch_schedule`cb_newsearch within w_vzt_alec_schedule
end type

type cb_search from w_vzt_batch_schedule`cb_search within w_vzt_alec_schedule
end type

type st_foundrecs from w_vzt_batch_schedule`st_foundrecs within w_vzt_alec_schedule
end type

type st_stop from w_vzt_batch_schedule`st_stop within w_vzt_alec_schedule
integer x = 2537
end type

type dw_data from w_vzt_batch_schedule`dw_data within w_vzt_alec_schedule
end type

type dw_print from w_vzt_batch_schedule`dw_print within w_vzt_alec_schedule
end type

type uo_ddcal from w_vzt_batch_schedule`uo_ddcal within w_vzt_alec_schedule
end type

type sle_interval from w_vzt_batch_schedule`sle_interval within w_vzt_alec_schedule
end type

type dw_schedule from w_vzt_batch_schedule`dw_schedule within w_vzt_alec_schedule
integer y = 92
integer height = 1444
end type

type cb_refresh from w_vzt_batch_schedule`cb_refresh within w_vzt_alec_schedule
boolean visible = false
integer x = 2185
integer y = 1660
end type

type cb_timer from w_vzt_batch_schedule`cb_timer within w_vzt_alec_schedule
end type

type cb_display from w_vzt_batch_schedule`cb_display within w_vzt_alec_schedule
boolean visible = false
integer x = 2199
integer y = 1740
end type

type cb_options from w_vzt_batch_schedule`cb_options within w_vzt_alec_schedule
boolean visible = false
integer x = 2587
integer y = 1664
end type

type cb_mail from w_vzt_batch_schedule`cb_mail within w_vzt_alec_schedule
integer x = 1106
integer width = 288
end type

type dw_distribution from w_vzt_batch_schedule`dw_distribution within w_vzt_alec_schedule
integer x = 1417
integer width = 782
integer height = 84
end type

type cbx_debug from w_vzt_batch_schedule`cbx_debug within w_vzt_alec_schedule
end type

type cb_mail_logon from w_vzt_batch_schedule`cb_mail_logon within w_vzt_alec_schedule
boolean visible = false
integer x = 2665
integer y = 1708
end type

type dw_distlist from w_vzt_batch_schedule`dw_distlist within w_vzt_alec_schedule
end type

type dw_parms from w_vzt_batch_schedule`dw_parms within w_vzt_alec_schedule
integer x = 3406
integer y = 628
integer width = 128
boolean bringtotop = true
end type

type dw_rpt from w_vzt_batch_schedule`dw_rpt within w_vzt_alec_schedule
integer x = 3547
integer y = 624
boolean bringtotop = true
end type

type cbx_live from w_vzt_batch_schedule`cbx_live within w_vzt_alec_schedule
end type

type cb_sql from w_vzt_batch_schedule`cb_sql within w_vzt_alec_schedule
integer x = 3566
integer y = 1568
end type

type mdi_1 from mdiclient within w_vzt_alec_schedule
long BackColor=79349703
end type

