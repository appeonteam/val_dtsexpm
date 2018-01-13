$PBExportHeader$w_gcc_ole.srw
forward
global type w_gcc_ole from w_vzt_base_ole
end type
end forward

global type w_gcc_ole from w_vzt_base_ole
string title = "Template Edit"
string menuname = ""
end type
global w_gcc_ole w_gcc_ole

on w_gcc_ole.create
call super::create
end on

on w_gcc_ole.destroy
call super::destroy
end on

event ue_assign_menu;//overr 
end event

type dw_mainlist from w_vzt_base_ole`dw_mainlist within w_gcc_ole
integer y = 4
integer height = 552
end type

type cb_last_search from w_vzt_base_ole`cb_last_search within w_gcc_ole
integer x = 2725
integer y = 1524
end type

type cb_close from w_vzt_base_ole`cb_close within w_gcc_ole
integer x = 2638
end type

type cb_delete1 from w_vzt_base_ole`cb_delete1 within w_gcc_ole
integer x = 2162
end type

type cb_save from w_vzt_base_ole`cb_save within w_gcc_ole
integer x = 1285
integer width = 187
end type

type cb_select from w_vzt_base_ole`cb_select within w_gcc_ole
integer width = 265
string text = "&Title Edit"
end type

type cb_new from w_vzt_base_ole`cb_new within w_gcc_ole
integer x = 1993
end type

type cb_newsearch from w_vzt_base_ole`cb_newsearch within w_gcc_ole
end type

type cb_search from w_vzt_base_ole`cb_search within w_gcc_ole
end type

type st_foundrecs from w_vzt_base_ole`st_foundrecs within w_gcc_ole
integer x = 2373
integer y = 1624
end type

type st_stop from w_vzt_base_ole`st_stop within w_gcc_ole
integer x = 2437
end type

type dw_data from w_vzt_base_ole`dw_data within w_gcc_ole
integer height = 552
end type

type dw_print from w_vzt_base_ole`dw_print within w_gcc_ole
integer x = 2418
end type

type ole_1 from w_vzt_base_ole`ole_1 within w_gcc_ole
integer y = 564
integer height = 1052
end type

type cb_oleedit from w_vzt_base_ole`cb_oleedit within w_gcc_ole
integer x = 873
integer width = 402
string text = "&Template Edit"
end type

event cb_oleedit::clicked;call super::clicked;cb_save.enabled = true 
end event

type cb_getfile from w_vzt_base_ole`cb_getfile within w_gcc_ole
integer x = 1499
end type

event cb_getfile::clicked;call super::clicked;cb_save.enabled = true 
end event

