$PBExportHeader$w_r_callsxroom_most_call.srw
$PBExportComments$Calls by Room report window.
forward
global type w_r_callsxroom_most_call from w_report_slug
end type
end forward

global type w_r_callsxroom_most_call from w_report_slug
integer height = 1660
string title = "Calls by Room - Most Reported"
string menuname = "m_reports"
end type
global w_r_callsxroom_most_call w_r_callsxroom_most_call

event open;call super::open;cSortOrder = "opencall_room A, problem_problem_desc A" 

//cSortOrder = "group1callstotal D opencall_room A problem_problem_desc A " 

f_mod_rpt_dw_ld_disp(dw_1,'rpttoday')
f_mod_rpt_dw_ld_disp(dw_1,'rpttoday')
// m.n. modify date format 5/20/04

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_indate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_outdate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_outdate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_timer_start")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_timer_start")

end event

on w_r_callsxroom_most_call.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxroom_most_call.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxroom_most_call
string dataobject = "r_callsxroom_most_call_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxroom_most_call
integer height = 1348
string dataobject = "r_callsxroom_most_call"
end type

