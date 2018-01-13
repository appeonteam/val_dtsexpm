$PBExportHeader$w_vzt_lookup_edit.srw
forward
global type w_vzt_lookup_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_lookup_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_lookup_edit
end type
end forward

global type w_vzt_lookup_edit from w_vzt_base
integer width = 3621
integer height = 1816
string title = "Look Up Maintenance"
r_1 r_1
dw_contact_address dw_contact_address
end type
global w_vzt_lookup_edit w_vzt_lookup_edit

type variables
long 	il_contactid
end variables

on w_vzt_lookup_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
end on

on w_vzt_lookup_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_newsearch.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()


end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)
end event

event ue_cb_new;call super::ue_cb_new;//cb_del.visible	= false
//cb_ins.visible = false
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_lookup_edit
integer y = 1172
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_lookup_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_lookup_edit
integer x = 9
integer width = 3538
integer height = 1044
string dataobject = "d_lookup_list"
boolean hscrollbar = true
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
//		dw_answers.Retrieve( il_contactid )
//		dw_contact_address.Retrieve( il_contactid )
//		dw_answers.visible 	= true 	
//		cb_ins.visible			= true
//		cb_del.visible			= true
	END IF 

	
END IF	

return 1


end event

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'id_t', 'id A', 'id D')
this.inv_field_sort.of_setcolumn( 'code_t', 'code A', 'code D')
this.inv_field_sort.of_setcolumn( 'name_t', 'name A, descr A, code A', 'name D, descr D, code D')
this.inv_field_sort.of_setcolumn( 'descr_t', 'descr A', 'descr D')
this.inv_field_sort.of_setcolumn( 'value_t', 'value A','value D')
this.inv_field_sort.of_setcolumn( 'sortorder_t', 'name A, sortorder A', 'name D, sortorder D')

this.post setsort( 'name A, descr A, code A')
this.post sort()

end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_lookup_edit
integer x = 901
integer y = 1596
integer width = 302
integer taborder = 20
integer textsize = -8
end type

type cb_close from w_vzt_base`cb_close within w_vzt_lookup_edit
integer x = 3278
integer y = 1596
integer taborder = 50
integer textsize = -8
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_lookup_edit
integer x = 1362
integer y = 1596
integer width = 178
integer taborder = 110
integer textsize = -8
end type

type cb_save from w_vzt_base`cb_save within w_vzt_lookup_edit
integer x = 722
integer y = 1596
integer width = 165
integer taborder = 90
integer textsize = -8
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
//	dw_answers.Retrieve( il_contactid)
END IF
end event

type cb_select from w_vzt_base`cb_select within w_vzt_lookup_edit
integer x = 549
integer y = 1596
integer width = 165
integer taborder = 80
integer textsize = -8
end type

type cb_new from w_vzt_base`cb_new within w_vzt_lookup_edit
integer x = 1211
integer y = 1596
integer width = 137
integer taborder = 100
integer textsize = -8
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_lookup_edit
integer x = 32
integer y = 1596
integer width = 302
integer taborder = 70
integer textsize = -8
end type

event cb_newsearch::clicked;call super::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_lookup_edit
integer x = 343
integer y = 1596
integer width = 192
integer taborder = 60
integer textsize = -8
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_lookup_edit
integer x = 1545
integer y = 1596
integer width = 247
integer textsize = -8
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_vzt_lookup_edit
integer x = 1563
integer y = 1596
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_lookup_edit
integer x = 9
integer y = 1068
integer width = 3534
integer height = 492
integer taborder = 40
string dataobject = "d_lookup_edit"
boolean vscrollbar = false
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'code', 'name', 'descr', 'value', 'sortorder'} // 'id',

is_searchable[]	=  is_editable[]


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

event dw_data::ue_update_keys_on_new;If row <= 0 then return 1

long ll_id, ll_row, ll_count
ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)

if ll_id = 0 then 
	SELECT max(id) + 1 into :ll_id from vzt_contact ;
	this.setitem( row, 'id', ll_id )
END IF
return 1
end event

type dw_print from w_vzt_base`dw_print within w_vzt_lookup_edit
integer x = 2674
integer y = 1128
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_lookup_edit
end type

type r_1 from rectangle within w_vzt_lookup_edit
integer linethickness = 12
long fillcolor = 8421504
integer x = 14
integer y = 1576
integer width = 3543
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_lookup_edit
boolean visible = false
integer x = 2441
integer y = 104
integer width = 645
integer height = 572
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_contact_address_edit"
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)
end event

