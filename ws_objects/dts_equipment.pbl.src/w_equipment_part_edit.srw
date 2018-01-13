$PBExportHeader$w_equipment_part_edit.srw
forward
global type w_equipment_part_edit from w_vzt_part_edit
end type
end forward

global type w_equipment_part_edit from w_vzt_part_edit
end type
global w_equipment_part_edit w_equipment_part_edit

on w_equipment_part_edit.create
int iCurrent
call super::create
end on

on w_equipment_part_edit.destroy
call super::destroy
end on

event open;call super::open;LONG ID;
if not IsValid(Message) then return 

ID = f_nvl(Message.DoubleParm, 0)

cb_newsearch.event clicked()
idw_details.setItem(idw_details.getRow(),"id",ID);	
idw_details.acceptText();
cb_search.event clicked()


end event

type cb_tmpl from w_vzt_part_edit`cb_tmpl within w_equipment_part_edit
end type

type cb_dfilter from w_vzt_part_edit`cb_dfilter within w_equipment_part_edit
end type

type uo_trace01 from w_vzt_part_edit`uo_trace01 within w_equipment_part_edit
end type

type dw_mainlist from w_vzt_part_edit`dw_mainlist within w_equipment_part_edit
end type

type cb_last_search from w_vzt_part_edit`cb_last_search within w_equipment_part_edit
end type

type cb_close from w_vzt_part_edit`cb_close within w_equipment_part_edit
end type

type cb_delete1 from w_vzt_part_edit`cb_delete1 within w_equipment_part_edit
end type

type cb_save from w_vzt_part_edit`cb_save within w_equipment_part_edit
end type

type cb_select from w_vzt_part_edit`cb_select within w_equipment_part_edit
end type

type cb_new from w_vzt_part_edit`cb_new within w_equipment_part_edit
end type

type cb_newsearch from w_vzt_part_edit`cb_newsearch within w_equipment_part_edit
end type

type cb_search from w_vzt_part_edit`cb_search within w_equipment_part_edit
end type

type st_foundrecs from w_vzt_part_edit`st_foundrecs within w_equipment_part_edit
end type

type st_stop from w_vzt_part_edit`st_stop within w_equipment_part_edit
end type

type dw_data from w_vzt_part_edit`dw_data within w_equipment_part_edit
end type

type dw_print from w_vzt_part_edit`dw_print within w_equipment_part_edit
end type

type uo_ddcal from w_vzt_part_edit`uo_ddcal within w_equipment_part_edit
end type

type r_1 from w_vzt_part_edit`r_1 within w_equipment_part_edit
end type

type dw_contact_address from w_vzt_part_edit`dw_contact_address within w_equipment_part_edit
end type

type dw_sub from w_vzt_part_edit`dw_sub within w_equipment_part_edit
end type

type tab_1 from w_vzt_part_edit`tab_1 within w_equipment_part_edit
end type

type tabpage_1 from w_vzt_part_edit`tabpage_1 within tab_1
integer y = 104
integer height = 960
end type

type dw_detail from w_vzt_part_edit`dw_detail within tabpage_1
end type

event dw_detail::constructor;call super::constructor;post wf_setupdateable ( dw_detail, "Part Information", true, true ) // set updateable, title and selectable

this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'category', 'subcategory', 'expcategory', &
'partname', 'description', 'price','qty_reorder_point','ptype','dept','alert_distlist_id', 'ID'} // 'id',

is_searchable[]	=   is_editable[]


end event

type tabpage_items from w_vzt_part_edit`tabpage_items within tab_1
integer y = 104
integer height = 960
end type

type cb_filter from w_vzt_part_edit`cb_filter within tabpage_items
end type

type st_2 from w_vzt_part_edit`st_2 within tabpage_items
end type

type st_1 from w_vzt_part_edit`st_1 within tabpage_items
end type

type dw_avail from w_vzt_part_edit`dw_avail within tabpage_items
end type

type dw_sel from w_vzt_part_edit`dw_sel within tabpage_items
end type

type tabpage_2 from w_vzt_part_edit`tabpage_2 within tab_1
integer y = 104
integer height = 960
end type

type cb_1 from w_vzt_part_edit`cb_1 within tabpage_2
end type

type dw_avail_vendors from w_vzt_part_edit`dw_avail_vendors within tabpage_2
end type

type dw_vpartdet from w_vzt_part_edit`dw_vpartdet within tabpage_2
end type

type p_1 from w_vzt_part_edit`p_1 within w_equipment_part_edit
end type

