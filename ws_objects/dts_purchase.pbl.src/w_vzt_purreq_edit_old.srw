﻿$PBExportHeader$w_vzt_purreq_edit_old.srw
forward
global type w_vzt_purreq_edit_old from w_vzt_base
end type
type r_1 from rectangle within w_vzt_purreq_edit_old
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_purreq_edit_old
end type
type tab_1 from tab within w_vzt_purreq_edit_old
end type
type tabpage_1 from userobject within tab_1
end type
type dw_detail from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_detail dw_detail
end type
type tabpage_2 from userobject within tab_1
end type
type cb_del from commandbutton within tabpage_2
end type
type cb_ins from commandbutton within tabpage_2
end type
type dw_addr from uo_vzt_dwbase within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_del cb_del
cb_ins cb_ins
dw_addr dw_addr
end type
type tabpage_3 from userobject within tab_1
end type
type cb_filter from commandbutton within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type dw_vpartdet from uo_vzt_dwbase within tabpage_3
end type
type dw_avail from uo_vzt_dwbase within tabpage_3
end type
type dw_sel from uo_vzt_dwbase within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type
type tab_1 from tab within w_vzt_purreq_edit_old
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_vzt_purreq_edit_old from w_vzt_base
integer width = 3648
integer height = 1976
string title = "Purchase Request Maintenance"
windowstate windowstate = maximized!
r_1 r_1
dw_contact_address dw_contact_address
tab_1 tab_1
end type
global w_vzt_purreq_edit_old w_vzt_purreq_edit_old

type variables

uo_vzt_dwbase   idw_details, idw_addresses
uo_vzt_dwbase   idw_vpart_sel, idw_vpart_avail, idw_vpart






end variables

on w_vzt_purreq_edit_old.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
this.Control[iCurrent+3]=this.tab_1
end on

on w_vzt_purreq_edit_old.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
destroy(this.tab_1)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_new.visible = true 

idw_details 		= tab_1.tabpage_1.dw_detail
idw_addresses 		= tab_1.tabpage_2.dw_addr

idw_vpart 			= tab_1.tabpage_3.dw_vpartdet
idw_vpart_sel		= tab_1.tabpage_3.dw_sel
idw_vpart_avail	= tab_1.tabpage_3.dw_avail
 
//dw_data.ShareData( idw_details )

dw_primary 			= idw_details			
it_main_tab 		= tab_1
//dw_primary_list 	= dw_mainlist

cb_newsearch.event clicked()
cb_search.event clicked()

//this.ib_autoscroll=false
//ib_do_required = true
//ib_setrowonscroll = true 

ib_resizeenabled = true
cb_new.visible = true 
ib_new_allowed = true 

end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)
end event

event ue_cb_new;call super::ue_cb_new;//cb_del.visible	= false
//cb_ins.visible = false
end event

event resize;ii_resizeband_y = 20
if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_new.y 		= newheight - ii_resizeband_y - cb_new.height
		cb_newsearch.y = newheight - ii_resizeband_y - cb_newsearch.height
		cb_save.y 		= newheight - ii_resizeband_y - cb_save.height
		cb_search.y 	= newheight - ii_resizeband_y - cb_search.height
		cb_select.y 	= newheight - ii_resizeband_y - cb_select.height
		cb_delete1.y 	= newheight - ii_resizeband_y - cb_delete1.height		
		cb_close.y 		= newheight - ii_resizeband_y - cb_close.height		
		st_stop.y		= newheight - ii_resizeband_y - st_stop.height
		cb_last_search.y=newheight - ii_resizeband_y - cb_last_search.height
		st_foundrecs.y	= newheight - ii_resizeband_y - st_foundrecs.height		
		
	//	dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
	//	dw_primary.width	= newwidth  - dw_primary.x * 2 
		
		dw_mainlist.height	= newheight - ii_resizeband_y * 2 - dw_mainlist.y - tab_1.height - r_1.height 
		dw_mainlist.width	= newwidth  - dw_mainlist.x * 2 

		r_1.y				= cb_save.y - 20
		r_1.width 		= newwidth - r_1.x * 2 
		tab_1.y 			= r_1.y - tab_1.height - 10
		tab_1.width 	= newwidth - tab_1.x * 2 
	End IF 
End IF 	
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_purreq_edit_old
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_purreq_edit_old
integer x = 1582
integer y = 696
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_purreq_edit_old
integer x = 9
integer width = 3579
integer height = 472
string dataobject = "d_purreq_list"
boolean hscrollbar = true
end type

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'id_t', 'id A', 'id D')
this.inv_field_sort.of_setcolumn( 'budget_code_t', 'budget_code A', 'budget_code D')
this.inv_field_sort.of_setcolumn( 'crdate_t', 'crdate D, department A', 'crdate A, department A')
this.inv_field_sort.of_setcolumn( 'descr_t', 'descr A', 'descr D')
this.inv_field_sort.of_setcolumn( 'department_t', 'department A, crdate D', 'department D, crdate D')

this.setsort( 'crdate D, department A, purchase_type A, descr A')


end event

event dw_mainlist::ue_get_key_values;call super::ue_get_key_values;if al_row > 0 and al_row <= this.RowCount() then
	id_main_id = f_nvl(this.GetItemNumber(al_row ,'id') , 0)
	idw_vpart_sel.id_main_id_local = id_main_id 
	idw_vpart_avail.id_main_id_local = id_main_id 
	
	cb_new.visible 		= true 

	if id_main_id <= 0 then 
		idw_addresses.Reset()
		return 
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		long ll_rows
		
//		ll_rows = idw_details.Retrieve( id_main_id ) 

//		ll_rows = idw_addresses.Retrieve( id_main_id )
//		ll_rows = dw_contact_address.Retrieve( id_main_id )

		ll_rows = idw_vpart_sel.Retrieve( id_main_id )
		ll_rows = idw_vpart_avail.Retrieve( id_main_id )
		
		ll_rows = 0
//		dw_answers.visible 	= true 	
//		cb_ins.visible			= true
//		cb_del.visible			= true
	END IF 

	
END IF	




end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_purreq_edit_old
integer x = 901
integer y = 1724
integer width = 302
integer taborder = 20
integer textsize = -8
end type

type cb_close from w_vzt_base`cb_close within w_vzt_purreq_edit_old
integer x = 2738
integer y = 1724
integer taborder = 50
integer textsize = -8
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_purreq_edit_old
integer x = 1362
integer y = 1724
integer width = 178
integer taborder = 110
integer textsize = -8
end type

type cb_save from w_vzt_base`cb_save within w_vzt_purreq_edit_old
integer x = 722
integer y = 1724
integer width = 165
integer taborder = 90
integer textsize = -8
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
	idw_addresses.Retrieve( 0 )
END IF
end event

type cb_select from w_vzt_base`cb_select within w_vzt_purreq_edit_old
integer x = 549
integer y = 1724
integer width = 165
integer taborder = 80
integer textsize = -8
end type

type cb_new from w_vzt_base`cb_new within w_vzt_purreq_edit_old
integer x = 1211
integer y = 1724
integer width = 137
integer taborder = 100
integer textsize = -8
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_purreq_edit_old
integer x = 32
integer y = 1724
integer width = 302
integer taborder = 70
integer textsize = -8
end type

event cb_newsearch::clicked;call super::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_purreq_edit_old
integer x = 343
integer y = 1724
integer width = 192
integer taborder = 60
integer textsize = -8
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_purreq_edit_old
integer x = 1545
integer y = 1724
integer width = 247
integer textsize = -8
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_vzt_purreq_edit_old
integer x = 1563
integer y = 1724
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_purreq_edit_old
boolean visible = false
integer x = 2277
integer y = 364
integer width = 137
integer height = 108
integer taborder = 40
string dataobject = "d_purreq_edit"
boolean vscrollbar = false
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'firstname', 'lastname','title'} // 'id',

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

type dw_print from w_vzt_base`dw_print within w_vzt_purreq_edit_old
integer x = 2674
integer y = 1128
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_purreq_edit_old
end type

type r_1 from rectangle within w_vzt_purreq_edit_old
integer linethickness = 12
long fillcolor = 8421504
integer x = 14
integer y = 1704
integer width = 3570
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_purreq_edit_old
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

type tab_1 from tab within w_vzt_purreq_edit_old
integer x = 9
integer y = 500
integer width = 3575
integer height = 1176
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3538
integer height = 1048
long backcolor = 79349703
string text = "Details"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_detail dw_detail
end type

on tabpage_1.create
this.dw_detail=create dw_detail
this.Control[]={this.dw_detail}
end on

on tabpage_1.destroy
destroy(this.dw_detail)
end on

type dw_detail from uo_vzt_dwbase within tabpage_1
integer x = 9
integer y = 24
integer width = 2341
integer height = 1016
integer taborder = 20
string dataobject = "d_purreq_edit"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_poweredit = true
end type

event constructor;call super::constructor;this.ib_poweredit = true 
post wf_setupdateable ( dw_detail, "purchase request detail", true, true  ) // set updateable, title and selectable

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'descr', 'department', &
'appr_level_1', 'appr_level_2', 'appr_level_3','budget_code'}  

is_searchable[]	=  is_editable[]



end event

event rowfocuschanged;call super::rowfocuschanged;if currentrow <= 0 or currentrow >= this.rowcount() then return

//disable - enable save depending on approvals.
string ls_approval
boolean lb_protect
int  nn
For nn = 1 to 3 
	ls_approval = f_nvl(this.GetItemString( currentrow, "appr_by_"+string(nn) ),'')
	If ls_approval <> '' then lb_protect = true
Next
if lb_protect then
 //  this.object.datawindow.readonly = true
 	cb_save.enabled = false
else
//	this.object.datawindow.readonly = false
	cb_save.enabled = false
end if
end event

event buttonclicked;call super::buttonclicked;if row <= 0 or row >= this.RowCount() then return 
choose case dwo.name 
	case "b_appr_1"
		messagebox('sss','sss')
	case "b_appr_2"
		messagebox('sss','sss')
	case "b_appr_3"
		messagebox('sss','sss')
	case else
		/*statementblock*/
end choose

end event

event clicked;call super::clicked;if row <= 0 or row > this.RowCount() then return 
string ls_appr='I', ls_ret 
integer li_level
choose case dwo.name 
	case "appr_level_1" 
		ls_appr = f_nvl(this.GetItemString( row, 'appr_level_1'),'')
		li_level = 1 
	case "appr_level_2"
		ls_appr = f_nvl(this.GetItemString( row, 'appr_level_2'),'')
		li_level = 2 
	case "appr_level_3"
		ls_appr = f_nvl(this.GetItemString( row, 'appr_level_3'),'')
		li_level = 3 
	case else
		/*statementblock*/
end choose
if ls_appr = 'N' or ls_appr = '' then 
	select  vzt_he_pr_approval( :id_main_id , :gnv_appman.is_pw, :li_level) INTO :ls_ret from dummy ;
	if IsNull( ls_ret) then ls_ret = '***' 
	messagebox('Approval level ' + string(li_level) , ls_ret )
	if ls_ret = 'OK' then 
		cb_newsearch.event clicked()
		cb_search.event clicked()
	end if
END IF 



end event

type tabpage_2 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3538
integer height = 1048
long backcolor = 79349703
string text = "-------"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
cb_del cb_del
cb_ins cb_ins
dw_addr dw_addr
end type

on tabpage_2.create
this.cb_del=create cb_del
this.cb_ins=create cb_ins
this.dw_addr=create dw_addr
this.Control[]={this.cb_del,&
this.cb_ins,&
this.dw_addr}
end on

on tabpage_2.destroy
destroy(this.cb_del)
destroy(this.cb_ins)
destroy(this.dw_addr)
end on

type cb_del from commandbutton within tabpage_2
integer x = 2030
integer y = 936
integer width = 114
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Del"
end type

event clicked;	long ll_row , ll_address 
	string ls_expr
	ll_row = dw_addr.GetRow() 
	If ll_row <= 0 then return 
	ll_address = dw_addr.object.id [ll_row ]
	ls_expr = ' contact_id = ' + string( id_main_id) + ' AND address_id = ' + string( ll_address )
	dw_addr.DeleteRow(0) 
	ll_row = dw_contact_address.Find( ls_expr, 1, dw_contact_address.RowCount() )
	// make trigger !!!!!!!!!!!!! 
	if ll_row <= 0 then return 
	dw_contact_address.DeleteRow( ll_row ) 
	

end event

type cb_ins from commandbutton within tabpage_2
integer x = 1897
integer y = 936
integer width = 119
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ins"
end type

event clicked;	long			ll_newrow
 	ll_newrow = idw_addresses.EVENT ue_insert_new( 'address') 
	if ll_newrow <= 0 then return 

	idw_addresses.SetItem( ll_newrow, 'type', 	'EMAIL')
	idw_addresses.SetItem( ll_newrow, 'primary', 'N')

	If idw_addresses.RowCount() = 1 then 
		idw_addresses.SetItem( ll_newrow, 'type', 	'MAILING')
		idw_addresses.SetItem( ll_newrow, 'descr', 	'Primary mailing address')
		idw_addresses.SetItem( ll_newrow, 'primary', 'Y')
	END IF 


end event

type dw_addr from uo_vzt_dwbase within tabpage_2
integer x = 18
integer y = 28
integer width = 2999
integer height = 888
integer taborder = 20
string dataobject = "d_full_address_edit"
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3538
integer height = 1048
long backcolor = 79349703
string text = "Items Requested"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type

on tabpage_3.create
this.cb_filter=create cb_filter
this.st_2=create st_2
this.st_1=create st_1
this.dw_vpartdet=create dw_vpartdet
this.dw_avail=create dw_avail
this.dw_sel=create dw_sel
this.Control[]={this.cb_filter,&
this.st_2,&
this.st_1,&
this.dw_vpartdet,&
this.dw_avail,&
this.dw_sel}
end on

on tabpage_3.destroy
destroy(this.cb_filter)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_vpartdet)
destroy(this.dw_avail)
destroy(this.dw_sel)
end on

type cb_filter from commandbutton within tabpage_3
integer x = 2437
integer y = 944
integer width = 343
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filter Parts"
end type

event clicked;string ls_filter
//dw_avail.Filter()
setNull (ls_filter) 
dw_avail.SetFilter( ls_filter )
end event

type st_2 from statictext within tabpage_3
integer x = 2789
integer y = 12
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Available:"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_3
integer x = 293
integer y = 8
integer width = 713
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Currently selected:"
boolean focusrectangle = false
end type

type dw_vpartdet from uo_vzt_dwbase within tabpage_3
boolean visible = false
integer x = 3227
integer y = 948
integer width = 279
integer height = 92
integer taborder = 30
string dataobject = "d_vendor_parts_edit"
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_vpartdet, "vendor item detail edit", true, true  ) // set updateable, title and selectable

is_editable[]	= {"pref_order", "vendor_sku", "unit", &
"unit_qty", "qty_to_reorder", "price", "bid_date", "rebid_date", &
"usage", "autotask" }

//is_searchable[]	= is_editable[]	
end event

type dw_avail from uo_vzt_dwbase within tabpage_3
integer x = 2441
integer y = 72
integer width = 1088
integer height = 856
integer taborder = 30
string dataobject = "d_parts_list_pravail"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= FALSE // selected options
_drop_available_DW 			= TRUE // available options
_selection_service 			= 'M'  
_dragdrop_auto 				= true
is_drag_src_idcol				= 'part_id'
is_drag_trg_idcol				= 'id'

end event

event constructor_post;call super::constructor_post;is_drag_src_do	= idw_vpart_sel.dataobject //'d_parts_list_vavail'
idw_vpart_sel._dw_droptarget 	= this


end event

event ue_dragdrop_avl_drop_sql;call super::ue_dragdrop_avl_drop_sql;DELETE FROM vzt_purchase_req_items
		WHERE req_id = :id_main_id 
				AND part_id = :id_source_id
		;

		
end event

type dw_sel from uo_vzt_dwbase within tabpage_3
integer x = 9
integer y = 72
integer width = 2409
integer height = 960
integer taborder = 20
string dataobject = "d_parts_list_prsel"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= TRUE // selected options
_drop_available_DW 			= false // available options
_selection_service 			= 'M'  
is_drag_trg_idcol				= 'part_id'
_dragdrop_auto 				= true

this.ib_poweredit = true 
post wf_setupdateable ( dw_sel, "purchase request items", true, true  ) // set updateable, title and selectable

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'quantity', 'vendor_id'}  

is_searchable[]	= {''}



end event

event ue_dragdrop_sel_drop_sql;call super::ue_dragdrop_sel_drop_sql;long ll_pref_vendor_id 
decimal ll_price 
ll_price = 0.00

If al_source_row > 0 then
	ll_pref_vendor_id = f_nvl(idw_vpart_avail.GetItemNumber( al_source_row, 'pref_vendor_id'),0)
END IF

If ll_pref_vendor_id > 0 then 
	
	SELECT price INTO :ll_price FROM vzt_vendor_part 
	WHERE Vendor_id = :ll_pref_vendor_id
			and part_id = :id_source_id ;
END IF			

INSERT INTO vzt_purchase_req_items
			(req_id, 		part_id, 	quantity, price, 		vendor_id  ) 
VALUES 	( :id_main_id, :id_source_id, 0, 	:ll_price,  :ll_pref_vendor_id ) ;

ll_price = 0.00
end event

event constructor_post;call super::constructor_post;is_drag_src_do			= idw_vpart_avail.dataobject //'d_parts_list_vavail'
idw_vpart_avail._dw_droptarget = this

end event

event clicked;call super::clicked;//If row > 0  then
//	long ll_part_id
//	ll_part_id = this.GetItemNumber( row, "part_id" )
//	idw_vpart.Retrieve ( id_main_id, ll_part_id )
//END IF
//
return 0
end event

