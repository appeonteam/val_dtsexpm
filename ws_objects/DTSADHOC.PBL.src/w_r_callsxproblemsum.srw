$PBExportHeader$w_r_callsxproblemsum.srw
forward
global type w_r_callsxproblemsum from w_report_slug
end type
end forward

global type w_r_callsxproblemsum from w_report_slug
boolean visible = false
integer height = 1660
string title = "Calls by Task Summary"
string menuname = "m_reports"
end type
global w_r_callsxproblemsum w_r_callsxproblemsum

event open;string sheet_name

SetMicroHelp( "Opening " + This.Title + " window...please wait." )

This.Title = This.Title + " - Report"	// enforces standard

cSortOrder = "problem_problem_desc A, subproblem_subproblem_desc A"

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
end event

on w_r_callsxproblemsum.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxproblemsum.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxproblemsum
integer x = 229
integer y = 1124
integer width = 2103
integer height = 396
string dataobject = "r_callsxproblemsum_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxproblemsum
integer x = 5
integer y = 8
integer width = 2921
string dataobject = "r_callsxproblemsum"
end type

