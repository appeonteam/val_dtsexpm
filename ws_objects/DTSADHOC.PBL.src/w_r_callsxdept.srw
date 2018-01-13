$PBExportHeader$w_r_callsxdept.srw
$PBExportComments$Calls by department report window.
forward
global type w_r_callsxdept from w_report_slug
end type
end forward

global type w_r_callsxdept from w_report_slug
integer x = 29
integer y = 58
integer height = 1660
string title = "Calls by Department"
string menuname = "m_reports"
end type
global w_r_callsxdept w_r_callsxdept

event open;call super::open;cSortOrder = "opencall_closed_bydept A, opencall_call_indate A"
f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_indate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_outdate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_outdate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_timer_start")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_timer_start")

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
end event

on w_r_callsxdept.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxdept.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxdept
string dataobject = "r_callsxdept_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxdept
string dataobject = "r_callsxdept"
end type

