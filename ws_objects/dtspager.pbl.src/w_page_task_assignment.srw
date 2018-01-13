$PBExportHeader$w_page_task_assignment.srw
$PBExportComments$report
forward
global type w_page_task_assignment from w_report_gen
end type
end forward

global type w_page_task_assignment from w_report_gen
int Width=2619
int Height=1652
boolean TitleBar=true
string Title="Page Task Assignement Report"
WindowState WindowState=maximized!
string Icon="REPORT.ICO"
end type
global w_page_task_assignment w_page_task_assignment

on w_page_task_assignment.create
call super::create
end on

on w_page_task_assignment.destroy
call super::destroy
end on

type dw_2 from w_report_gen`dw_2 within w_page_task_assignment
string DataObject="d_pager_assignment_rpt"
end type

type cb_1 from w_report_gen`cb_1 within w_page_task_assignment
int Y=36
end type

type cb_sort from w_report_gen`cb_sort within w_page_task_assignment
int Y=36
end type

type dw_1 from w_report_gen`dw_1 within w_page_task_assignment
int X=41
int Width=2505
int Height=1304
string DataObject="d_pager_assignment"
end type

