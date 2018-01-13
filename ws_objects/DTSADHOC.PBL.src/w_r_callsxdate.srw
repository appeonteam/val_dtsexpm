$PBExportHeader$w_r_callsxdate.srw
$PBExportComments$Calls by date report window.
forward
global type w_r_callsxdate from w_report_slug
end type
end forward

global type w_r_callsxdate from w_report_slug
integer width = 2697
integer height = 1660
string title = "Calls by Date"
string menuname = "m_reports"
end type
global w_r_callsxdate w_r_callsxdate

type variables
//int iJob
end variables

event open;
 
string report_type

SetMicroHelp( "Opening " + This.Title + " window...please wait." )
 
This.Title = This.Title + " - Report"	// enforces standard

report_type = Message.StringParm

if report_type = 'Scheduled' then
	dw_1.dataobject = 'r_callsxdate1'  // by scheduled date
	dw_2.dataobject = 'r_callsxdate1_rpt'
//	cSortOrder = "date(string(opencall_timer_start,'mm/dd/yyyy')) A, opencall_stat_code"
	cSortOrder = "string(date(opencall_timer_start)) A, opencall_stat_code"
else
	dw_1.dataobject = 'r_callsxdate'  // by opened date
	dw_2.dataobject = 'r_callsxdate_rpt'
//	cSortOrder = "date(string(opencall_call_indate,'mm/dd/yyyy')) A, opencall_stat_code"
	cSortOrder = "string(date(opencall_call_indate)) A, opencall_stat_code"
end if

dw_1.SetTransObject( sqlca )
dw_2.SetTransObject( sqlca )
f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_1,"hdr_dt")
f_mod_rpt_dw_ld_disp(dw_2,"hdr_dt")
if report_type = 'Scheduled' then
	f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_indate")
	f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_indate")
else
	f_mod_rpt_dw_dt_disp(dw_1,"opencall_timer_start")
	f_mod_rpt_dw_dt_disp(dw_2,"opencall_timer_start")
	f_mod_rpt_dw_dt_disp(dw_1,"opencall_call_outdate")
	f_mod_rpt_dw_dt_disp(dw_2,"opencall_call_outdate")
end if



f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")



end event

on w_r_callsxdate.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxdate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_callsxdate
string dataobject = "r_callsxdate_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxdate
integer x = 0
integer y = 0
integer width = 2565
integer height = 1468
string dataobject = "r_callsxdate"
end type

