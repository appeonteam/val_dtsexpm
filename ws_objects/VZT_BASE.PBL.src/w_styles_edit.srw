$PBExportHeader$w_styles_edit.srw
forward
global type w_styles_edit from w_vzt_base
end type
type st_1 from statictext within w_styles_edit
end type
end forward

global type w_styles_edit from w_vzt_base
integer width = 2880
integer height = 1116
string title = "Style Maintenance"
st_1 st_1
end type
global w_styles_edit w_styles_edit

on w_styles_edit.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_styles_edit.destroy
call super::destroy
destroy(this.st_1)
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

event ue_save_aftersave;call super::ue_save_aftersave;gnv_appman.ids_styles.Retrieve()
end event

event open;call super::open;dw_mainlist.dataobject = dw_data.dataobject 
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_styles_edit
integer y = 900
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_styles_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_styles_edit
boolean visible = false
integer x = 695
integer y = 872
integer width = 402
integer height = 136
string dataobject = "d_style_list"
end type

type cb_last_search from w_vzt_base`cb_last_search within w_styles_edit
integer x = 2825
integer y = 188
end type

type cb_close from w_vzt_base`cb_close within w_styles_edit
integer x = 2126
integer y = 900
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_styles_edit
integer x = 411
integer y = 896
end type

type cb_save from w_vzt_base`cb_save within w_styles_edit
integer x = 18
integer y = 896
end type

type cb_select from w_vzt_base`cb_select within w_styles_edit
integer x = 2912
integer y = 380
end type

type cb_new from w_vzt_base`cb_new within w_styles_edit
integer x = 242
integer y = 896
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_styles_edit
integer x = 2798
integer y = 280
integer width = 224
end type

type cb_search from w_vzt_base`cb_search within w_styles_edit
integer x = 3031
integer y = 280
integer width = 155
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_styles_edit
integer x = 1449
integer y = 900
end type

type st_stop from w_vzt_base`st_stop within w_styles_edit
integer x = 1230
integer y = 900
end type

type dw_data from w_vzt_base`dw_data within w_styles_edit
integer y = 16
integer width = 2811
integer height = 856
string dataobject = "d_style_list"
end type

type dw_print from w_vzt_base`dw_print within w_styles_edit
integer x = 2894
integer y = 188
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_styles_edit
integer x = 2354
integer y = 308
end type

type st_1 from statictext within w_styles_edit
boolean visible = false
integer x = 32
integer y = 948
integer width = 654
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 65535
string text = "SYNC dw as main==>"
boolean focusrectangle = false
end type

