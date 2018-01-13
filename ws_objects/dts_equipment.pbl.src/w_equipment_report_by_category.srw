$PBExportHeader$w_equipment_report_by_category.srw
forward
global type w_equipment_report_by_category from w_vzt_rpt_viewer
end type
end forward

global type w_equipment_report_by_category from w_vzt_rpt_viewer
end type
global w_equipment_report_by_category w_equipment_report_by_category

on w_equipment_report_by_category.create
int iCurrent
call super::create
end on

on w_equipment_report_by_category.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type cb_dfilter from w_vzt_rpt_viewer`cb_dfilter within w_equipment_report_by_category
end type

type uo_trace01 from w_vzt_rpt_viewer`uo_trace01 within w_equipment_report_by_category
end type

type dw_mainlist from w_vzt_rpt_viewer`dw_mainlist within w_equipment_report_by_category
end type

type cb_last_search from w_vzt_rpt_viewer`cb_last_search within w_equipment_report_by_category
end type

type cb_close from w_vzt_rpt_viewer`cb_close within w_equipment_report_by_category
end type

type cb_delete1 from w_vzt_rpt_viewer`cb_delete1 within w_equipment_report_by_category
end type

type cb_save from w_vzt_rpt_viewer`cb_save within w_equipment_report_by_category
end type

type cb_select from w_vzt_rpt_viewer`cb_select within w_equipment_report_by_category
end type

type cb_new from w_vzt_rpt_viewer`cb_new within w_equipment_report_by_category
end type

type cb_newsearch from w_vzt_rpt_viewer`cb_newsearch within w_equipment_report_by_category
end type

type cb_search from w_vzt_rpt_viewer`cb_search within w_equipment_report_by_category
end type

type st_foundrecs from w_vzt_rpt_viewer`st_foundrecs within w_equipment_report_by_category
end type

type st_stop from w_vzt_rpt_viewer`st_stop within w_equipment_report_by_category
end type

type dw_data from w_vzt_rpt_viewer`dw_data within w_equipment_report_by_category
string dataobject = "rjt_rpt_equipment_by_category"
end type

type dw_print from w_vzt_rpt_viewer`dw_print within w_equipment_report_by_category
string dataobject = "rjt_rpt_equipment_by_category"
end type

type uo_ddcal from w_vzt_rpt_viewer`uo_ddcal within w_equipment_report_by_category
end type

type uo_zoom from w_vzt_rpt_viewer`uo_zoom within w_equipment_report_by_category
end type

type cbx_preview from w_vzt_rpt_viewer`cbx_preview within w_equipment_report_by_category
end type

type tab_1 from w_vzt_rpt_viewer`tab_1 within w_equipment_report_by_category
end type

type dw_repdef from w_vzt_rpt_viewer`dw_repdef within w_equipment_report_by_category
end type

type dw_repout from w_vzt_rpt_viewer`dw_repout within w_equipment_report_by_category
end type

type cb_run_again from w_vzt_rpt_viewer`cb_run_again within w_equipment_report_by_category
end type

type cb_show_sql from w_vzt_rpt_viewer`cb_show_sql within w_equipment_report_by_category
end type

type cb_show_syntax from w_vzt_rpt_viewer`cb_show_syntax within w_equipment_report_by_category
end type

type dw_parms from w_vzt_rpt_viewer`dw_parms within w_equipment_report_by_category
end type

type dw_def from w_vzt_rpt_viewer`dw_def within w_equipment_report_by_category
end type

type dw_rpt from w_vzt_rpt_viewer`dw_rpt within w_equipment_report_by_category
end type

type dw_schedule from w_vzt_rpt_viewer`dw_schedule within w_equipment_report_by_category
end type

type cbx_cover from w_vzt_rpt_viewer`cbx_cover within w_equipment_report_by_category
end type

type dw_cover from w_vzt_rpt_viewer`dw_cover within w_equipment_report_by_category
end type

type st_data from w_vzt_rpt_viewer`st_data within w_equipment_report_by_category
end type

type dw_distribution from w_vzt_rpt_viewer`dw_distribution within w_equipment_report_by_category
end type

type p_1 from w_vzt_rpt_viewer`p_1 within w_equipment_report_by_category
integer x = 1029
integer y = 440
end type

type dw_remote_connections from w_vzt_rpt_viewer`dw_remote_connections within w_equipment_report_by_category
end type

