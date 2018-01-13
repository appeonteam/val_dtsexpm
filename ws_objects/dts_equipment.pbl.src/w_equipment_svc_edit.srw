$PBExportHeader$w_equipment_svc_edit.srw
forward
global type w_equipment_svc_edit from w_vzt_svc_cont_edit
end type
end forward

global type w_equipment_svc_edit from w_vzt_svc_cont_edit
end type
global w_equipment_svc_edit w_equipment_svc_edit

event open;call super::open;String searchString;

searchString=Message.StringParm;

cb_newsearch.event clicked()
if (not isNull(searchString)) Then
		 idw_details.setItem(idw_details.getRow(),"descr",searchString);	
		 idw_details.acceptText();
end if
cb_search.event clicked()


end event

on w_equipment_svc_edit.create
int iCurrent
call super::create
end on

on w_equipment_svc_edit.destroy
call super::destroy
end on

type cb_tmpl from w_vzt_svc_cont_edit`cb_tmpl within w_equipment_svc_edit
end type

type cb_dfilter from w_vzt_svc_cont_edit`cb_dfilter within w_equipment_svc_edit
end type

type uo_trace01 from w_vzt_svc_cont_edit`uo_trace01 within w_equipment_svc_edit
end type

type dw_mainlist from w_vzt_svc_cont_edit`dw_mainlist within w_equipment_svc_edit
end type

type cb_last_search from w_vzt_svc_cont_edit`cb_last_search within w_equipment_svc_edit
end type

type cb_close from w_vzt_svc_cont_edit`cb_close within w_equipment_svc_edit
end type

type cb_delete1 from w_vzt_svc_cont_edit`cb_delete1 within w_equipment_svc_edit
end type

type cb_save from w_vzt_svc_cont_edit`cb_save within w_equipment_svc_edit
end type

type cb_select from w_vzt_svc_cont_edit`cb_select within w_equipment_svc_edit
end type

type cb_new from w_vzt_svc_cont_edit`cb_new within w_equipment_svc_edit
end type

type cb_newsearch from w_vzt_svc_cont_edit`cb_newsearch within w_equipment_svc_edit
end type

type cb_search from w_vzt_svc_cont_edit`cb_search within w_equipment_svc_edit
end type

type st_foundrecs from w_vzt_svc_cont_edit`st_foundrecs within w_equipment_svc_edit
end type

type st_stop from w_vzt_svc_cont_edit`st_stop within w_equipment_svc_edit
end type

type dw_data from w_vzt_svc_cont_edit`dw_data within w_equipment_svc_edit
end type

type dw_print from w_vzt_svc_cont_edit`dw_print within w_equipment_svc_edit
end type

type uo_ddcal from w_vzt_svc_cont_edit`uo_ddcal within w_equipment_svc_edit
end type

type r_1 from w_vzt_svc_cont_edit`r_1 within w_equipment_svc_edit
end type

type dw_contact_address from w_vzt_svc_cont_edit`dw_contact_address within w_equipment_svc_edit
end type

type tab_1 from w_vzt_svc_cont_edit`tab_1 within w_equipment_svc_edit
end type

type tabpage_1 from w_vzt_svc_cont_edit`tabpage_1 within tab_1
integer y = 96
integer height = 1216
end type

type dw_detail from w_vzt_svc_cont_edit`dw_detail within tabpage_1
end type

type tabpage_2 from w_vzt_svc_cont_edit`tabpage_2 within tab_1
integer y = 96
integer height = 1216
end type

type cb_oleedit from w_vzt_svc_cont_edit`cb_oleedit within tabpage_2
end type

type cb_getfile from w_vzt_svc_cont_edit`cb_getfile within tabpage_2
end type

type ole_1 from w_vzt_svc_cont_edit`ole_1 within tabpage_2
end type

type cb_del from w_vzt_svc_cont_edit`cb_del within tabpage_2
end type

type cb_ins from w_vzt_svc_cont_edit`cb_ins within tabpage_2
end type

type dw_doc from w_vzt_svc_cont_edit`dw_doc within tabpage_2
end type

type tabpage_3 from w_vzt_svc_cont_edit`tabpage_3 within tab_1
integer y = 96
integer height = 1216
end type

type st_2 from w_vzt_svc_cont_edit`st_2 within tabpage_3
end type

type st_1 from w_vzt_svc_cont_edit`st_1 within tabpage_3
end type

type dw_vpartdet from w_vzt_svc_cont_edit`dw_vpartdet within tabpage_3
end type

type dw_avail from w_vzt_svc_cont_edit`dw_avail within tabpage_3
end type

type dw_sel from w_vzt_svc_cont_edit`dw_sel within tabpage_3
end type

type p_1 from w_vzt_svc_cont_edit`p_1 within w_equipment_svc_edit
end type

