$PBExportHeader$w_r_callsxguest.srw
$PBExportComments$Calls by Guest report window.
forward
global type w_r_callsxguest from w_report_slug
end type
end forward

global type w_r_callsxguest from w_report_slug
integer height = 1660
string title = "Calls by Caller/Guest"
string menuname = "m_reports"
end type
global w_r_callsxguest w_r_callsxguest

event open; 
string sheet_name

SetMicroHelp( "Opening " + This.Title + " window...please wait." )
 
This.Title = This.Title + " - Report"	// enforces standard
cSortOrder = "opencall_guest A, opencall_call_indate A"

//the followings are to modify dw date format to the specification of date/time setting in he_dts.ini file
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

on w_r_callsxguest.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxguest.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxguest
string dataobject = "r_callsxguest_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxguest
string dataobject = "r_callsxguest"
end type

