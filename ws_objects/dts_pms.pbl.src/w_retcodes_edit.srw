$PBExportHeader$w_retcodes_edit.srw
forward
global type w_retcodes_edit from w_vzt_base
end type
end forward

global type w_retcodes_edit from w_vzt_base
integer width = 2546
integer height = 1040
string title = "Returnable Codes Maintenance"
end type
global w_retcodes_edit w_retcodes_edit

on w_retcodes_edit.create
int iCurrent
call super::create
end on

on w_retcodes_edit.destroy
call super::destroy
end on

event ue_postopen_01;call super::ue_postopen_01;//this.ib_poweredit = true 
cb_newsearch.event clicked()
cb_search.event clicked()
dw_data.ModifyEdit( 'W') 
cb_new.visible = true
cb_save.visible = true
cb_delete1.visible = true

cb_newsearch.visible = false
cb_search.visible = false
cb_select.post hide()
dw_mainlist.post hide()

end event

event ue_assign_menu;//
end event

event ue_cb_new;//overr
long ll_row
ll_row = dw_primary.InsertRow(0)
If ll_row > 0 then 
	dw_primary.SetRow( ll_row )
	dw_primary.ScrollToRow( ll_row )
END IF
dw_primary.POST SetFocus()
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_retcodes_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_retcodes_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_retcodes_edit
boolean visible = false
integer x = 2469
integer y = 24
integer width = 1047
integer height = 140
string dataobject = "d_retcodes_edit"
end type

type cb_last_search from w_vzt_base`cb_last_search within w_retcodes_edit
integer x = 2501
integer y = 188
end type

type cb_close from w_vzt_base`cb_close within w_retcodes_edit
integer x = 2281
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_retcodes_edit
integer x = 411
integer y = 812
end type

type cb_save from w_vzt_base`cb_save within w_retcodes_edit
integer x = 18
integer y = 812
end type

type cb_select from w_vzt_base`cb_select within w_retcodes_edit
integer x = 2587
integer y = 380
end type

type cb_new from w_vzt_base`cb_new within w_retcodes_edit
integer x = 242
integer y = 812
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_retcodes_edit
integer x = 2473
integer y = 280
integer width = 224
end type

type cb_search from w_vzt_base`cb_search within w_retcodes_edit
integer x = 2706
integer y = 280
integer width = 155
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_retcodes_edit
integer x = 1166
end type

type st_stop from w_vzt_base`st_stop within w_retcodes_edit
integer x = 1230
end type

type dw_data from w_vzt_base`dw_data within w_retcodes_edit
integer y = 16
integer width = 2478
integer height = 784
string dataobject = "d_retcodes_edit"
end type

type dw_print from w_vzt_base`dw_print within w_retcodes_edit
integer x = 2569
integer y = 188
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_retcodes_edit
integer x = 2139
integer y = 156
end type

