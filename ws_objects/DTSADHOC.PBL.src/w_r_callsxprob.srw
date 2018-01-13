$PBExportHeader$w_r_callsxprob.srw
$PBExportComments$Calls by Problem report window.
forward
global type w_r_callsxprob from w_report_slug
end type
end forward

global type w_r_callsxprob from w_report_slug
boolean visible = false
integer height = 1660
string title = "Calls by Task Category"
string menuname = "m_reports"
end type
global w_r_callsxprob w_r_callsxprob

event open;call super::open;cSortOrder = "problem_problem_desc A, subproblem_subproblem_desc A, opencall_stat_code A, opencall_call_indate A"

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_indate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_timer_start")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_timer_start")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_outdate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_outdate")

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
end event

on w_r_callsxprob.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxprob.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxprob
string dataobject = "r_callsxprob_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxprob
string dataobject = "r_callsxprob"
end type

