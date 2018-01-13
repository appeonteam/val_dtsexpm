$PBExportHeader$w_r_callsxhour.srw
$PBExportComments$Calls by Hour of Day report.
forward
global type w_r_callsxhour from w_report_slug
end type
end forward

global type w_r_callsxhour from w_report_slug
integer height = 1660
string title = "Calls by Hour of Day"
string menuname = "m_reports"
end type
global w_r_callsxhour w_r_callsxhour

event open;call super::open;cSortOrder = "opencall_call_indate A"
string rpt_ty, grp_by_date, grp_by_hour, mod_res

rpt_ty = Message.StringParm

if rpt_ty = 'Scheduled' then
	grp_by_date = " date_grp.expression= 'date(opencall_timer_start)' "
	grp_by_hour = " hour_grp.expression= 'opencall_timer_start' "
else
	grp_by_date = " date_grp.expression= 'date(opencall_call_indate)' "
	grp_by_hour = " hour_grp.expression= 'opencall_call_indate' "
end if

mod_res = dw_1.Modify(grp_by_date)
if mod_res <> "" then
	MessageBox("Modify Error",mod_res)
end if

mod_res = dw_2.Modify(grp_by_date)
if mod_res <> "" then
	MessageBox("Modify Error",mod_res)
end if

mod_res = dw_1.Modify(grp_by_hour)
if mod_res <> "" then
	MessageBox("Modify Error",mod_res)
end if

mod_res = dw_2.Modify(grp_by_hour)
if mod_res <> "" then
	MessageBox("Modify Error",mod_res)
end if

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_indate")


f_mod_rpt_dw_dt_disp(dw_1,"opencall_timer_start")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_timer_start")

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_d_disp(dw_1,"compute_2")
f_mod_rpt_dw_d_disp(dw_2,"compute_2")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")


end event

on w_r_callsxhour.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxhour.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxhour
string dataobject = "r_callsxhour_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxhour
string dataobject = "r_callsxhour"
end type

