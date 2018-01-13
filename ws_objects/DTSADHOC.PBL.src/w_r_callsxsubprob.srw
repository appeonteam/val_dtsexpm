$PBExportHeader$w_r_callsxsubprob.srw
$PBExportComments$Calls by Subproblem report window.
forward
global type w_r_callsxsubprob from w_report_slug
end type
end forward

global type w_r_callsxsubprob from w_report_slug
integer height = 1660
string title = "Calls by SubTask Category"
string menuname = "m_reports"
end type
global w_r_callsxsubprob w_r_callsxsubprob

event open; 
string sheet_name

SetMicroHelp( "Opening " + This.Title + " window...please wait." )
 
This.Title = This.Title + " - Report"	// enforces standard
cSortOrder = "problem_problem_desc A, subproblem_subproblem_desc A, opencall_stat_code A, opencall_call_indate A"

// The Followings are to change date/time display format base on he_dts.ini specification
f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_indate")

f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_outdate")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_outdate")

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
end event

on w_r_callsxsubprob.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxsubprob.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxsubprob
string dataobject = "r_callsxsubprob_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxsubprob
string dataobject = "r_callsxsubprob"
end type

