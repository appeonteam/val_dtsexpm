﻿$PBExportHeader$w_r_callsxemployee.srw
$PBExportComments$Calls by employee report window.
forward
global type w_r_callsxemployee from w_report_slug
end type
end forward

global type w_r_callsxemployee from w_report_slug
integer height = 1660
string title = "Calls by Employee"
string menuname = "m_reports"
end type
global w_r_callsxemployee w_r_callsxemployee

event open;call super::open;cSortOrder = "opencall_repairman A, opencall_call_indate A"

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

on w_r_callsxemployee.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxemployee.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxemployee
string dataobject = "r_callsxemployee_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxemployee
string dataobject = "r_callsxemployee"
end type

