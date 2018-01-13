$PBExportHeader$w_r_purchase_requests.srw
forward
global type w_r_purchase_requests from w_report_slug
end type
end forward

global type w_r_purchase_requests from w_report_slug
int Width=2697
int Height=1660
boolean TitleBar=true
string Title="Calls with Task Definition"
string MenuName="m_reports"
end type
global w_r_purchase_requests w_r_purchase_requests

type variables
//int iJob
end variables

event open;window activesheet
string report_type

SetMicroHelp( "Opening " + This.Title + " window...please wait." )
activesheet = w_main.GetActiveSheet()
This.Title = This.Title + " - Report"	// enforces standard

report_type = Message.StringParm

cSortorder = ("opencall_caller_category A, opencall_receiver A, problem_problem_desc A, subproblem_subproblem_desc A")

dw_1.SetTransObject( sqlca )
dw_2.SetTransObject( sqlca )

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")


f_mod_rpt_dw_dt_disp(dw_1,"opencall_timer_start")
f_mod_rpt_dw_dt_disp(dw_2,"opencall_timer_start")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")





end event

on w_r_purchase_requests.create
call super::create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
end on

on w_r_purchase_requests.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_2 from w_report_slug`dw_2 within w_r_purchase_requests
int X=283
int Y=992
int Width=1326
int Height=328
string DataObject="r_purchase_request_rpt"
end type

type dw_1 from w_report_slug`dw_1 within w_r_purchase_requests
int X=0
int Y=0
int Width=2565
int Height=1468
string DataObject="r_purchase_request"
end type

