$PBExportHeader$w_vzt_mm_report_def_eq.srw
forward
global type w_vzt_mm_report_def_eq from w_vzt_mm_report_def
end type
end forward

global type w_vzt_mm_report_def_eq from w_vzt_mm_report_def
integer width = 2491
integer height = 1900
string title = "Reports "
windowstate windowstate = maximized!
end type
global w_vzt_mm_report_def_eq w_vzt_mm_report_def_eq

on w_vzt_mm_report_def_eq.create
int iCurrent
call super::create
end on

on w_vzt_mm_report_def_eq.destroy
call super::destroy
end on

event open;call super::open;cb_save.visible = true 
end event

type cb_tmpl from w_vzt_mm_report_def`cb_tmpl within w_vzt_mm_report_def_eq
end type

type cb_dfilter from w_vzt_mm_report_def`cb_dfilter within w_vzt_mm_report_def_eq
end type

type uo_trace01 from w_vzt_mm_report_def`uo_trace01 within w_vzt_mm_report_def_eq
end type

type dw_mainlist from w_vzt_mm_report_def`dw_mainlist within w_vzt_mm_report_def_eq
integer width = 2427
string dataobject = "d_vzt_mm_rpt_list_eq"
end type

type cb_last_search from w_vzt_mm_report_def`cb_last_search within w_vzt_mm_report_def_eq
end type

type cb_close from w_vzt_mm_report_def`cb_close within w_vzt_mm_report_def_eq
end type

type cb_delete1 from w_vzt_mm_report_def`cb_delete1 within w_vzt_mm_report_def_eq
end type

type cb_save from w_vzt_mm_report_def`cb_save within w_vzt_mm_report_def_eq
end type

type cb_select from w_vzt_mm_report_def`cb_select within w_vzt_mm_report_def_eq
end type

type cb_new from w_vzt_mm_report_def`cb_new within w_vzt_mm_report_def_eq
end type

type cb_newsearch from w_vzt_mm_report_def`cb_newsearch within w_vzt_mm_report_def_eq
end type

type cb_search from w_vzt_mm_report_def`cb_search within w_vzt_mm_report_def_eq
end type

type st_foundrecs from w_vzt_mm_report_def`st_foundrecs within w_vzt_mm_report_def_eq
end type

type st_stop from w_vzt_mm_report_def`st_stop within w_vzt_mm_report_def_eq
end type

type dw_data from w_vzt_mm_report_def`dw_data within w_vzt_mm_report_def_eq
end type

type dw_print from w_vzt_mm_report_def`dw_print within w_vzt_mm_report_def_eq
end type

type uo_ddcal from w_vzt_mm_report_def`uo_ddcal within w_vzt_mm_report_def_eq
end type

type uo_zoom from w_vzt_mm_report_def`uo_zoom within w_vzt_mm_report_def_eq
end type

type cbx_preview from w_vzt_mm_report_def`cbx_preview within w_vzt_mm_report_def_eq
end type

type tab_1 from w_vzt_mm_report_def`tab_1 within w_vzt_mm_report_def_eq
integer width = 2432
end type

type dw_schedule from w_vzt_mm_report_def`dw_schedule within w_vzt_mm_report_def_eq
end type

type cb_run_online from w_vzt_mm_report_def`cb_run_online within w_vzt_mm_report_def_eq
end type

type dw_exe_test from w_vzt_mm_report_def`dw_exe_test within w_vzt_mm_report_def_eq
end type

type cb_reload from w_vzt_mm_report_def`cb_reload within w_vzt_mm_report_def_eq
end type

