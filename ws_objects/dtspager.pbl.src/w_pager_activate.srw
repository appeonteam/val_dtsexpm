$PBExportHeader$w_pager_activate.srw
$PBExportComments$report
forward
global type w_pager_activate from w_report_gen
end type
end forward

global type w_pager_activate from w_report_gen
int Width=2382
boolean TitleBar=true
string Title="Activate/Deactivate Report"
WindowState WindowState=maximized!
string Icon="REPORT.ICO"
end type
global w_pager_activate w_pager_activate

on w_pager_activate.create
call super::create
end on

on w_pager_activate.destroy
call super::destroy
end on

type cb_2 from w_report_gen`cb_2 within w_pager_activate
int X=1358
int Y=32
end type

type dw_2 from w_report_gen`dw_2 within w_pager_activate
string DataObject="d_act_deact_rpt"
end type

type st_1 from w_report_gen`st_1 within w_pager_activate
long BackColor=79349703
FontCharSet FontCharSet=Ansi!
end type

type cb_1 from w_report_gen`cb_1 within w_pager_activate
int X=1975
int TabOrder=30
end type

type cb_sort from w_report_gen`cb_sort within w_pager_activate
int X=1669
end type

type dw_1 from w_report_gen`dw_1 within w_pager_activate
int Width=2249
string DataObject="d_act_deact"
BorderStyle BorderStyle=StyleLowered!
end type

