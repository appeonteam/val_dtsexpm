$PBExportHeader$w_r_callsxdurationsum.srw
forward
global type w_r_callsxdurationsum from w_report_slug
end type
end forward

global type w_r_callsxdurationsum from w_report_slug
integer height = 1660
string title = "Call by Duration Summary"
string menuname = "m_reports"
end type
global w_r_callsxdurationsum w_r_callsxdurationsum

event open; 
string sheet_name

SetMicroHelp( "Opening " + This.Title + " window...please wait." )
 
This.Title = This.Title + " - Report"	// enforces standard
cSortOrder = "compute_0024 A, call_indate A"
end event

on w_r_callsxdurationsum.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_callsxdurationsum.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event activate;call super::activate;dw_1.setfilter('opencall_stat_code = "99"')
dw_1.filter()

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday") 



end event

event deactivate;call super::deactivate;dw_1.setfilter('')
dw_1.filter()

end event

type dw_2 from w_report_slug`dw_2 within w_r_callsxdurationsum
string dataobject = "r_callsxdurationsum_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_callsxdurationsum
string dataobject = "r_callsxdurationsum"
end type

