$PBExportHeader$w_vzt_sysoptions_edit.srw
forward
global type w_vzt_sysoptions_edit from w_vzt_base
end type
end forward

global type w_vzt_sysoptions_edit from w_vzt_base
integer x = 46
integer y = 52
integer width = 4549
integer height = 2104
string title = "VZT System Options Edit"
end type
global w_vzt_sysoptions_edit w_vzt_sysoptions_edit

type variables

end variables

on w_vzt_sysoptions_edit.create
int iCurrent
call super::create
end on

on w_vzt_sysoptions_edit.destroy
call super::destroy
end on

event open;call super::open;//cb_newsearch.event clicked()
//cb_search.event clicked()

dw_primary.Retrieve()
dw_mainlist.visible 	= false
cb_select.visible 	= false
cb_newsearch.visible = false

cb_save.visible = true


end event

event ue_assign_menu;//
end event

event ue_postopen_01;call super::ue_postopen_01;dw_mainlist.visible = false
cb_select.visible = false
cb_newsearch.visible = false

cb_save.visible = true
end event

event ue_search;call super::ue_search;dw_mainlist.visible = false
cb_select.visible = false
cb_save.visible = true

return 0
end event

event ue_save_commit;call super::ue_save_commit;gnv_appman.event ue_getsysoptions() 
end event

event activate;cb_select.visible 	= false
DW_MAINLIST.visible 	= false
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_sysoptions_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_sysoptions_edit
integer x = 3099
integer y = 1724
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_sysoptions_edit
boolean visible = false
integer x = 5554
integer y = 120
integer width = 46
integer height = 40
string dataobject = "d_vzt_sysoptions_edit"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_sysoptions_edit
integer x = 818
integer y = 1712
end type

type cb_close from w_vzt_base`cb_close within w_vzt_sysoptions_edit
integer x = 2277
integer y = 1712
integer width = 265
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_sysoptions_edit
integer x = 1349
integer y = 1712
end type

type cb_save from w_vzt_base`cb_save within w_vzt_sysoptions_edit
integer x = 1563
integer y = 1712
integer width = 270
end type

type cb_select from w_vzt_base`cb_select within w_vzt_sysoptions_edit
integer x = 5554
integer y = 180
integer height = 60
end type

type cb_new from w_vzt_base`cb_new within w_vzt_sysoptions_edit
integer x = 1175
integer y = 1712
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_sysoptions_edit
integer x = 9
integer y = 1712
end type

type cb_search from w_vzt_base`cb_search within w_vzt_sysoptions_edit
integer x = 361
integer y = 1712
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_sysoptions_edit
integer x = 2011
integer y = 1716
end type

type st_stop from w_vzt_base`st_stop within w_vzt_sysoptions_edit
integer x = 2075
integer y = 1712
end type

type dw_data from w_vzt_base`dw_data within w_vzt_sysoptions_edit
integer y = 12
integer width = 4453
integer height = 1688
string dataobject = "d_vzt_sysoptions_edit"
boolean hscrollbar = true
end type

event dw_data::constructor;call super::constructor;is_editable[]	={'id','batchconcurrency','reportfields_portrait','reportfields_landscape', &
'reportfields_landscape_legal','readbgcolor','writebgcolor','searchbgcolor', &
'reqbgcolor','batch_norun_start_time', 'batch_norun_end_time','search_case', &
'mailsysuserid', 'mailsyspwd', 'parmsonreport', 'reportminhdr','reportminsum', &
'reportminftr', 'draft_portrait', 'draft_landscape', 'debugmode', 'reporterbuttons', &
'parmtabonreport', 'option00', 'option01', 'option02', 'option04', 'option05', &
'option06', 'option07','option08', 'language','language_multi','datemask1','datemask2', &
'option09','option10','option11','option12', 'option17','option15','option18','option19','option20','option21','option22','option23', & 
'rpt_format','rpt_pdf_style', &
'option03', 'vip_greet_ind', 'maid_status_ind','sql_trace', 'phonemask', &
'prearrivalcalltime', 'pager_type' &
}

is_searchable[]	={''}
ib_poweredit					= true
end event

event dw_data::editchanged;cb_select.visible = false
end event

event dw_data::rowfocuschanged;call super::rowfocuschanged;cb_select.visible = false
end event

event dw_data::itemchanged;call super::itemchanged;cb_select.visible = false
end event

event dw_data::resize;cb_select.visible = false
end event

type dw_print from w_vzt_base`dw_print within w_vzt_sysoptions_edit
integer x = 1829
integer y = 1716
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_sysoptions_edit
end type

