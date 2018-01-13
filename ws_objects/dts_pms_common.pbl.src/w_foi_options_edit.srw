$PBExportHeader$w_foi_options_edit.srw
forward
global type w_foi_options_edit from w_vzt_base
end type
type r_1 from rectangle within w_foi_options_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_foi_options_edit
end type
end forward

global type w_foi_options_edit from w_vzt_base
integer width = 1970
integer height = 1652
string title = "FOI Options Maintenance"
r_1 r_1
dw_contact_address dw_contact_address
end type
global w_foi_options_edit w_foi_options_edit

type variables
long 	il_contactid
end variables

on w_foi_options_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
end on

on w_foi_options_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
end on

event open;call super::open;is_accessflags = 'WR'

if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_newsearch.event clicked()
cb_search.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()

cb_save.visible = true 

end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;//If dw_data.Rowcount() > 0 then
//	int li_id
//	string ls_system
//	li_id = dw_data.object.id [dw_data.getrow()] 
//	If li_id = 1 then 
//		ls_system = dw_data.object.foisystem [dw_data.getrow()] 
//		UPDATE foioptions SET id = 0 where foisystem <> :ls_system ;
//		COMMIT;
//	END IF
//		
//END IF		
		
dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)		
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_foi_options_edit
integer y = 1128
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_foi_options_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_foi_options_edit
integer x = 9
integer width = 1906
integer height = 604
string dataobject = "d_foi_list"
boolean hsplitscroll = false
end type

event dw_mainlist::ue_rowselected;if row > 0 and row <= this.RowCount() AND ab_selected = true then
	il_contactid = f_nvl(dw_data.GetItemNumber(row,'id') , 0)

	cb_new.visible 		= true 

	if il_contactid <= 0 then 
//		dw_answers.Reset()
		return 1
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
	END IF 

	
END IF	

return 1


end event

type cb_last_search from w_vzt_base`cb_last_search within w_foi_options_edit
integer x = 832
integer y = 1432
integer width = 288
integer taborder = 20
integer textsize = -8
end type

type cb_close from w_vzt_base`cb_close within w_foi_options_edit
integer x = 1691
integer y = 1436
integer taborder = 50
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_foi_options_edit
integer x = 1280
integer y = 1432
integer width = 178
integer taborder = 110
integer textsize = -8
end type

type cb_save from w_vzt_base`cb_save within w_foi_options_edit
integer x = 704
integer y = 1436
integer width = 146
integer taborder = 90
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_select from w_vzt_base`cb_select within w_foi_options_edit
integer x = 558
integer y = 1436
integer width = 137
integer taborder = 80
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_base`cb_new within w_foi_options_edit
integer x = 1134
integer y = 1436
integer width = 137
integer taborder = 100
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_foi_options_edit
integer x = 46
integer y = 1436
integer width = 311
integer taborder = 70
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_search from w_vzt_base`cb_search within w_foi_options_edit
integer x = 366
integer y = 1436
integer width = 192
integer taborder = 60
integer textsize = -8
string facename = "Lucida Sans"
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_foi_options_edit
integer x = 1467
integer y = 1432
integer width = 210
integer textsize = -8
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_foi_options_edit
integer x = 1472
integer y = 1432
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_foi_options_edit
integer x = 9
integer y = 632
integer width = 1906
integer height = 772
integer taborder = 40
string dataobject = "d_foi_sysedit"
boolean vscrollbar = false
borderstyle borderstyle = styleraised!
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'foisystem', 'id','singlethread', 'host_ip', &
		'host_port', 'initwait', 'autorequest', 'nak_max', &
		'out_nak_max', 'nak_wait', 'out_nak_wait'} // 'id',

//is_searchable[]	=  is_editable[]


end event

event dw_data::ue_refresh_identity;//long ll_row, ll_id
//ll_row = this.GetRow() 
//if ll_row <= 0 then return  
//
//ll_id = f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0)
//if ll_id = 0 then 
//	SELECT max(questionid) into :id_questionid from qgen_questions ;
//	this.setitem( this.GetRow(), 'questionid', id_questionid)
////	MessageBox('qid',string(id_questionid))
//ELSE
//	id_questionid = ll_id 
//END IF
//
//
end event

event dw_data::itemchanged;call super::itemchanged;if row <= 0 or row > this.RowCount() then return 

If dwo.name = 'id' then
	if integer(data) = 1 then 
		long ll_row, ll_maxrow
		ll_maxrow = dw_mainlist.RowCOunt()
		FOR ll_row = 1 to ll_maxrow
			If ll_row <> row then
				dw_mainlist.SetItem(ll_row, 'id', 0)
			END IF
		NEXT 
	end if
END IF
end event

event dw_data::ue_update_keys_on_new;If row <= 0 then return 1

long ll_id, ll_row, ll_count
ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)

if ll_id = 0 then 
	SELECT max(id) + 1 into :ll_id from vzt_contact ;
	this.setitem( row, 'id', ll_id )
END IF
return 1
end event

type dw_print from w_vzt_base`dw_print within w_foi_options_edit
integer x = 2674
integer y = 1128
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_foi_options_edit
integer y = 364
end type

type r_1 from rectangle within w_foi_options_edit
long linecolor = 134217750
integer linethickness = 12
long fillcolor = 8421504
integer x = 14
integer y = 1412
integer width = 1906
integer height = 120
end type

type dw_contact_address from uo_vzt_dwbase within w_foi_options_edit
boolean visible = false
integer x = 2437
integer y = 104
integer width = 645
integer height = 572
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_contact_address_edit"
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)

end event

