$PBExportHeader$w_pms_r_retcalls01.srw
forward
global type w_pms_r_retcalls01 from w_report_slug
end type
end forward

global type w_pms_r_retcalls01 from w_report_slug
int Height=1661
boolean TitleBar=true
string Title="PMS Returned Calls"
string MenuName="m_reports"
end type
global w_pms_r_retcalls01 w_pms_r_retcalls01

on open;call w_report_slug::open;cSortOrder = "integer(opencall_room) A, problem_problem_desc A"

end on

on w_pms_r_retcalls01.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_pms_r_retcalls01.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_pms_r_retcalls01
int X=150
int Y=1286
int Width=2604
int Height=186
string DataObject="d_pms_rpt_retcalls"
end type

type dw_1 from w_report_slug`dw_1 within w_pms_r_retcalls01
int Height=1350
string DataObject="d_pms_rpt_retcalls"
end type

