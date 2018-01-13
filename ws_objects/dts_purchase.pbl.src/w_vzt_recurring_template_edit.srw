$PBExportHeader$w_vzt_recurring_template_edit.srw
forward
global type w_vzt_recurring_template_edit from w_vzt_base
end type
type st_1 from statictext within w_vzt_recurring_template_edit
end type
type cb_ok from commandbutton within w_vzt_recurring_template_edit
end type
end forward

global type w_vzt_recurring_template_edit from w_vzt_base
integer width = 1815
integer height = 1696
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_1 st_1
cb_ok cb_ok
end type
global w_vzt_recurring_template_edit w_vzt_recurring_template_edit

type variables
s_recur_template sRecur
end variables

on w_vzt_recurring_template_edit.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_ok
end on

on w_vzt_recurring_template_edit.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_ok)
end on

event ue_postopen_01;call super::ue_postopen_01;//this.ib_poweredit = true 
//cb_newsearch.event clicked()
//cb_search.event clicked()
dw_data.ModifyEdit( 'W') 
//cb_new.visible = true
long llrows

cb_newsearch.visible = false
cb_search.visible = false
cb_select.post hide()
dw_mainlist.post hide()
cb_save.visible = false
	
If sRecur.recur_id > 0 then 
	llrows = dw_data.Retrieve(sRecur.recur_id) 
	if llrows <= 0 then 
		MessageBox('Template Retrieval Error','Template '+string(sRecur.recur_id) + ' missing.')
		cb_new.event Clicked()
	end if			
ELSE
	cb_new.event Clicked()
END IF	
if not sRecur.view then
	cb_delete1.visible = true
	cb_ok.visible = true
ELSE
	dw_data.object.datawindow.readonly = 'Yes'
	cb_delete1.visible = false
	cb_ok.visible = false
END IF		
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
sRecur = Message.PowerObjectParm 



end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_recurring_template_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_recurring_template_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_recurring_template_edit
boolean visible = false
integer x = 2139
integer y = 1576
integer width = 187
integer height = 56
string dataobject = "d_recur_edit"
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_recurring_template_edit
integer x = 2825
integer y = 188
end type

type cb_close from w_vzt_base`cb_close within w_vzt_recurring_template_edit
integer x = 1033
integer y = 1556
integer width = 233
string facename = "Lucida Sans"
string text = "Cancel"
end type

event cb_close::clicked;//
parent.event ue_reset_popups()
closeWithReturn (parent, sRecur )
end event

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_recurring_template_edit
integer x = 818
integer y = 1556
integer width = 201
string facename = "Lucida Sans"
end type

type cb_save from w_vzt_base`cb_save within w_vzt_recurring_template_edit
boolean visible = false
integer x = 238
integer y = 1552
integer width = 201
string facename = "Lucida Sans"
string text = "save"
end type

type cb_select from w_vzt_base`cb_select within w_vzt_recurring_template_edit
integer x = 2912
integer y = 380
end type

type cb_new from w_vzt_base`cb_new within w_vzt_recurring_template_edit
boolean visible = false
integer x = 32
integer y = 1552
integer width = 201
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_recurring_template_edit
integer x = 2798
integer y = 280
integer width = 224
end type

type cb_search from w_vzt_base`cb_search within w_vzt_recurring_template_edit
integer x = 3031
integer y = 280
integer width = 155
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_recurring_template_edit
boolean visible = false
integer x = 1655
integer y = 1536
end type

type st_stop from w_vzt_base`st_stop within w_vzt_recurring_template_edit
integer x = 1719
integer y = 1532
end type

type dw_data from w_vzt_base`dw_data within w_vzt_recurring_template_edit
integer y = 16
integer width = 1742
integer height = 1500
string dataobject = "d_recur_edit"
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
end type

type dw_print from w_vzt_base`dw_print within w_vzt_recurring_template_edit
integer x = 2894
integer y = 188
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_recurring_template_edit
integer x = 1719
integer y = 80
end type

type st_1 from statictext within w_vzt_recurring_template_edit
boolean visible = false
integer x = 1449
integer y = 1576
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

type cb_ok from commandbutton within w_vzt_recurring_template_edit
integer x = 608
integer y = 1556
integer width = 201
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "OK"
end type

event clicked;//
if not sRecur.view then
	parent.event ue_reset_popups()
	//cb_save.event clicked()
	If dw_data.Update(true,true) = 1 then
		COMMIT;
		if dw_data.RowCOunt() > 0 then 
			sRecur.Recur_id = f_nvl(dw_data.GetItemNumber( 1, 'recur_id'),0)
		ELSE
			sRecur.Recur_id = 0
		END IF
	 IF sRecur.Recur_id = 0 and dw_data.RowCOunt() > 0 then
		long ll_recur_id
		SELECT MAX(recur_id) INTO :ll_recur_id FROM recurring ;
		sRecur.Recur_id = f_nvl(ll_recur_id,0) 
		If gnv_appman.is_debugmode = 'Y' then
			MessageBox('Recur Template Edit Identity Error (FIxed)', 'Recur. ID:'+ string(sRecur.recur_id) )
		END IF
		
	 END IF
	ELSE
		ROLLBACK;
		if dw_data.RowCOunt() > 0 then 
			sRecur.Recur_id = f_nvl(dw_data.GetItemNumber( 1, 'recur_id'),0)
		ELSE
			sRecur.Recur_id = 0
		END IF
		MessageBox('Recur Template Edit Error', 'Data Not Saved. Recur. ID:'+ string(sRecur.recur_id) )
	END IF;

	if dw_data.RowCOunt() <= 0 then 
		sRecur.Recur_id = 0
	END IF
//	cb_save.event clicked()
END IF

If gnv_appman.is_debugmode = 'Y' then
	MessageBox('Recur Template Edit', 'Recur. ID:'+ string(sRecur.recur_id) )
END IF

closeWithReturn (parent, sRecur )
end event

