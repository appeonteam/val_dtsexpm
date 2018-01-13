$PBExportHeader$w_gcc_employee.srw
forward
global type w_gcc_employee from w_vzt_base
end type
end forward

global type w_gcc_employee from w_vzt_base
int Width=2080
int Height=1020
boolean TitleBar=true
string Title="GCC Employee"
boolean Resizable=false
end type
global w_gcc_employee w_gcc_employee

on w_gcc_employee.create
call super::create
end on

on w_gcc_employee.destroy
call super::destroy
end on

event open;call super::open;cb_newsearch.event clicked()
cb_select.visible = false
end event

event ue_assign_menu;//
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_gcc_employee
int Width=2007
int Height=284
string DataObject="d_empl_list"
end type

type cb_last_search from w_vzt_base`cb_last_search within w_gcc_employee
int X=608
end type

type cb_close from w_vzt_base`cb_close within w_gcc_employee
int X=1861
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_gcc_employee
int X=1138
end type

type cb_save from w_vzt_base`cb_save within w_gcc_employee
int X=1394
boolean Enabled=false
end type

type cb_select from w_vzt_base`cb_select within w_gcc_employee
int X=1184
boolean Enabled=false
end type

type cb_new from w_vzt_base`cb_new within w_gcc_employee
int X=965
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_gcc_employee
int X=1618
int Width=233
boolean BringToTop=true
end type

type st_stop from w_vzt_base`st_stop within w_gcc_employee
int X=1646
boolean BringToTop=true
end type

type dw_data from w_vzt_base`dw_data within w_gcc_employee
int Y=316
int Width=2011
int Height=292
string DataObject="d_empl_search"
end type

event dw_data::constructor;call super::constructor;is_searchable[]	={'dept', 'employee', 'employee_number'}
is_editable[]		=is_searchable[]
end event

event dw_data::dberror;error.of_dberror( sqldbcode, sqlerrtext, sqlsyntax, buffer, row, this.dataobject)
end event

type dw_print from w_vzt_base`dw_print within w_gcc_employee
int X=1367
int Y=816
boolean BringToTop=true
end type

