$PBExportHeader$w_vzt_lang_tran.srw
forward
global type w_vzt_lang_tran from w_vzt_base
end type
type r_1 from rectangle within w_vzt_lang_tran
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_lang_tran
end type
type tab_1 from tab within w_vzt_lang_tran
end type
type tabpage_1 from userobject within tab_1
end type
type dw_detail from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_detail dw_detail
end type
type tabpage_items from userobject within tab_1
end type
type cb_filter from commandbutton within tabpage_items
end type
type st_2 from statictext within tabpage_items
end type
type st_1 from statictext within tabpage_items
end type
type dw_vpartdet from uo_vzt_dwbase within tabpage_items
end type
type dw_avail from uo_vzt_dwbase within tabpage_items
end type
type dw_sel from uo_vzt_dwbase within tabpage_items
end type
type tabpage_items from userobject within tab_1
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type
type tabpage_4 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_4
end type
type cb_2 from commandbutton within tabpage_4
end type
type cb_1 from commandbutton within tabpage_4
end type
type dw_subimp from uo_vzt_dwbase within tabpage_4
end type
type dw_probimp from uo_vzt_dwbase within tabpage_4
end type
type dw_subex from uo_vzt_dwbase within tabpage_4
end type
type dw_probex from uo_vzt_dwbase within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_subimp dw_subimp
dw_probimp dw_probimp
dw_subex dw_subex
dw_probex dw_probex
end type
type tab_1 from tab within w_vzt_lang_tran
tabpage_1 tabpage_1
tabpage_items tabpage_items
tabpage_4 tabpage_4
end type
type phl_1 from picturehyperlink within w_vzt_lang_tran
end type
end forward

global type w_vzt_lang_tran from w_vzt_base
integer width = 4224
integer height = 2296
string title = "Language Translation Map"
windowstate windowstate = maximized!
r_1 r_1
dw_contact_address dw_contact_address
tab_1 tab_1
phl_1 phl_1
end type
global w_vzt_lang_tran w_vzt_lang_tran

type variables

uo_vzt_dwbase   idw_details 
uo_vzt_dwbase   idw_vpart_sel, idw_vpart_avail, idw_vpart


long il_part_id, il_text_lang_id



end variables

on w_vzt_lang_tran.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
this.tab_1=create tab_1
this.phl_1=create phl_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.phl_1
end on

on w_vzt_lang_tran.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
destroy(this.tab_1)
destroy(this.phl_1)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

idw_details 		= tab_1.tabpage_1.dw_detail

idw_vpart 			= tab_1.tabpage_items.dw_vpartdet
idw_vpart_sel		= tab_1.tabpage_items.dw_sel
idw_vpart_avail	= tab_1.tabpage_items.dw_avail

ib_stay_tab_on_save = true

//dw_data.ShareData( idw_details )
is_dfilter_label='lantran'

dw_primary 			= idw_details			
it_main_tab 		= tab_1
//dw_primary_list 	= dw_mainlist

cb_newsearch.event clicked()
cb_search.event clicked()

this.event ue_dfilter_readini ()
this.event ue_dfilter ()

cb_new.visible = true 

//this.ib_autoscroll=false
//ib_do_required = true
//ib_setrowonscroll = true 

ib_resizeenabled = true


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
		cb_dfilter.y	= newheight - ii_resizeband_y - cb_dfilter.height		
		
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

event ue_dfilter;call super::ue_dfilter;string lsFilter 
int liRc
		
if trim(is_dfilter[1]) <> '' and is_dfilter[1] <> '*ALL*' then	
	lsFilter =  'POS("'+UPPER(trim(is_dfilter[1]))+  '", UPPER(contacttype)) > 0' 
	liRc = dw_primary.SetFilter (lsFilter) 
	liRc = dw_primary.Filter () 
	liRc = liRc
END IF

//		dw_mainlist

end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_lang_tran
boolean visible = true
integer x = 1824
integer y = 1928
integer width = 178
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_dfilter::clicked;call super::clicked;//string lsFilter
//int liRc
//str_response lstr_parms
//
//If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
//	return
//end if
//
//OpenWithParm (w_screen_settings, "phonebook",parent)
//lstr_parms = Message.PowerObjectParm 
//
//if lstr_parms.rc >= 0 then
//	//	set vendor type filter 
//	is_vendor_type_filter = lstr_parms.string1 
//	parent.event ue_dfilter ()
//end if
end event

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_lang_tran
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_lang_tran
integer x = 9
integer y = 264
integer width = 3273
integer height = 408
string dataobject = "d_vzt_text_list"
end type

event dw_mainlist::ue_rowselected;//if row > 0 and row <= this.RowCount() AND ab_selected = true then
//	this.event ue_get_key_values( row ) 
//	this.event ue_retrieve_links() 
	
	
//	id_main_id = f_nvl(this.GetItemNumber(row,'id') , 0)
//	idw_vpart_sel.id_main_id_local 	= id_main_id 
//	idw_vpart_avail.id_main_id_local = id_main_id 
//	
//	cb_new.visible 	= true 
//	is_vendor_type = f_nvl(this.GetItemString(row,'contacttype') ,'')
////Reset tabs based on vendor type:
//tab_1.tabpage_items.visible = true 
//tab_1.tabpage_projects.visible = false
//tab_1.tabpage_scon.visible = false
//
//choose case is_vendor_type 
//	case 'DESIGNER' 
//		tab_1.tabpage_projects.visible = true 
//		tab_1.tabpage_items.visible = false 
//	case 'CONTRACTOR' 
//		tab_1.tabpage_scon.visible = true 
//		tab_1.tabpage_items.visible = false 
//	case 'MUNICIPAL' 
//		
//	case else
//end choose
//
//
//	if id_main_id <= 0 then 
//		idw_addresses.Reset()
//		return 1
//	ELSE
//		cb_delete1.visible 	= true 
//		cb_save.visible 		= true 
//		cb_save.enabled 		= true 
//		long ll_rows
//		
////		ll_rows = idw_details.Retrieve( id_main_id ) 
//
//		ll_rows = idw_scon.Retrieve( id_main_id )
//		ll_rows = idw_proj.Retrieve( id_main_id )
//		ll_rows = idw_addresses.Retrieve( id_main_id )
////		ll_rows = dw_contact_address.Retrieve( id_main_id )
//
//		ll_rows = idw_vpart_sel.Retrieve( id_main_id )
//		ll_rows = idw_vpart_avail.Retrieve( id_main_id )
//		
//		ll_rows = 0
////		dw_answers.visible 	= true 	
////		cb_ins.visible			= true
////		cb_del.visible			= true
//	END IF 
//
	
//END IF	

return 1


end event

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'text_t', 'text A', 'text D')
this.inv_field_sort.of_setcolumn( 'descr_t', 'descr A, text A', 'descr D, text D')

this.setsort( 'text A')


end event

event dw_mainlist::ue_get_key_values;call super::ue_get_key_values;if al_row > 0 then 
	id_main_id = f_nvl(this.GetItemNumber(al_row ,'id') , 0)
	idw_vpart_sel.id_main_id_local 	= id_main_id 
	idw_vpart_avail.id_main_id_local = id_main_id 
	
	cb_new.visible 	= true 
	il_text_lang_id = f_nvl(this.GetItemNumber(al_row ,'lang_id') ,0)
//Reset tabs based on vendor type:

tab_1.tabpage_items.visible 		= false

choose case il_text_lang_id 
	case 1 
		tab_1.tabpage_items.visible = true
	case else 
//		wf_enabletab (tab_1, true)
end choose

	if id_main_id <= 0 then 
		return 
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		long ll_rows
		
//		ll_rows = idw_details.Retrieve( id_main_id ) 

//		ll_rows = dw_contact_address.Retrieve( id_main_id )
		ll_rows = idw_vpart_sel.Retrieve( id_main_id )
		ll_rows = idw_vpart_avail.Retrieve( id_main_id )
		
		ll_rows = 0
//		dw_answers.visible 	= true 	
//		cb_ins.visible			= true
//		cb_del.visible			= true
	END IF 

	
END IF	

return 


end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_lang_tran
integer x = 718
integer y = 1928
integer width = 343
integer taborder = 20
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_close from w_vzt_base`cb_close within w_vzt_lang_tran
integer x = 2217
integer y = 1928
integer width = 201
integer taborder = 50
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_lang_tran
integer x = 2007
integer y = 1928
integer width = 201
integer taborder = 110
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_save from w_vzt_base`cb_save within w_vzt_lang_tran
integer x = 1408
integer y = 1928
integer width = 201
integer taborder = 90
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
//	dw_mainlist.event ue_get_key_values ( dw_mainlist.GetRow() )
	//idw_addresses.Retrieve( id_main_id )
END IF
end event

type cb_select from w_vzt_base`cb_select within w_vzt_lang_tran
integer x = 1198
integer y = 1928
integer width = 201
integer taborder = 80
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_base`cb_new within w_vzt_lang_tran
integer x = 1618
integer y = 1928
integer width = 201
integer taborder = 100
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_lang_tran
integer x = 55
integer y = 1928
integer taborder = 70
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_newsearch::clicked;call super::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_lang_tran
integer x = 407
integer y = 1928
integer width = 302
integer taborder = 60
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_search::clicked;call super::clicked;cb_new.visible = true 
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_lang_tran
integer x = 2514
integer y = 1928
integer width = 247
integer textsize = -8
long backcolor = 67108864
end type

type st_stop from w_vzt_base`st_stop within w_vzt_lang_tran
integer x = 2574
integer y = 1928
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_lang_tran
boolean visible = false
integer x = 3099
integer y = 396
integer width = 137
integer height = 108
integer taborder = 40
string dataobject = "d_vendor_edit"
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

type dw_print from w_vzt_base`dw_print within w_vzt_lang_tran
integer x = 3547
integer y = 768
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_lang_tran
integer x = 2016
integer y = 8
end type

type r_1 from rectangle within w_vzt_lang_tran
boolean visible = false
integer linethickness = 12
long fillcolor = 8421504
integer x = 347
integer y = 2060
integer width = 91
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_lang_tran
boolean visible = false
integer x = 3365
integer y = 256
integer width = 645
integer height = 428
integer taborder = 20
string dataobject = "d_contact_address_edit"
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)
end event

type tab_1 from tab within w_vzt_lang_tran
integer x = 23
integer y = 700
integer width = 4064
integer height = 1448
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 134217728
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_items tabpage_items
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_items=create tabpage_items
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_items,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_items)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 4027
integer height = 1336
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
integer y = 28
integer width = 3040
integer height = 1064
integer taborder = 20
string dataobject = "d_vzt_text_edit"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_detail, "text detail", true, true ) // set updateable, title and selectable

//this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'text', 'descr', 'lang_id' } // 'id',

is_searchable[]	=  is_editable[]


end event

event rowfocuschanged;call super::rowfocuschanged;iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
//this.event ue_get_key_values ()
//iw_mywindow.event ue_retrieve_links()

end event

event ue_refresh_identity;call super::ue_refresh_identity;//detail(contact type vendor) save succeeded 
// need to update ID
long  ll_count , ll_id
string ls_name, ls_type
ll_count = this.rowcount() 
If ll_count <= 0 then return 


ll_id = f_nvl(this.GetitemNumber( this.GetRow() , 'id'),0)

if ll_id = 0 then 
	select id into :ll_id from vzt_text where id=@@identity;
ELSE
//	id_main_id = ll_id
END IF

return 
end event

type tabpage_items from userobject within tab_1
integer x = 18
integer y = 96
integer width = 4027
integer height = 1336
long backcolor = 79349703
string text = "Translation"
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

on tabpage_items.create
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

on tabpage_items.destroy
destroy(this.cb_filter)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_vpartdet)
destroy(this.dw_avail)
destroy(this.dw_sel)
end on

type cb_filter from commandbutton within tabpage_items
integer x = 1783
integer y = 624
integer width = 361
integer height = 68
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Filter text"
end type

event clicked;string ls_filter
//dw_avail.Filter()
setNull (ls_filter) 
dw_avail.SetFilter( ls_filter )
dw_avail.Filter() 

end event

type st_2 from statictext within tabpage_items
integer x = 1605
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

type st_1 from statictext within tabpage_items
integer x = 293
integer y = 4
integer width = 507
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Currently supplied:"
boolean focusrectangle = false
end type

type dw_vpartdet from uo_vzt_dwbase within tabpage_items
integer x = 18
integer y = 716
integer width = 2318
integer height = 600
integer taborder = 30
string dataobject = "d_vzt_text_edit_sel"
boolean hsplitscroll = false
boolean livescroll = false
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_vpartdet, "vendor item detail edit", true, true  ) // set updateable, title and selectable

is_editable[]	= {"pref_order", "vendor_sku", "unit", &
"unit_qty", "qty_to_reorder", "price", "bid_date", "rebid_date", &
"usage", "autotask" }

//is_searchable[]	= is_editable[]	
end event

event retrieveend;call super::retrieveend;	dw_sel.POST SelectRow( dw_sel.getrow(), true) 

end event

type dw_avail from uo_vzt_dwbase within tabpage_items
integer x = 1774
integer y = 72
integer width = 1774
integer height = 544
integer taborder = 30
string dataobject = "d_vzt_text_list_avl"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= FALSE // selected options
_drop_available_DW 			= TRUE // available options
_selection_service 			= 'M'  
_dragdrop_auto 				= true
is_drag_src_idcol				= 'id'
is_drag_trg_idcol				= 'id'

end event

event constructor_post;call super::constructor_post;is_drag_src_do	= idw_vpart_sel.dataobject //'d_parts_list_vavail'
idw_vpart_sel._dw_droptarget 	= this


end event

event ue_dragdrop_avl_drop_sql;call super::ue_dragdrop_avl_drop_sql;DELETE FROM vzt_text_lang 
		WHERE english_text_id = :id_main_id 
				AND text_id = :id_source_id
		;

		
end event

type dw_sel from uo_vzt_dwbase within tabpage_items
integer x = 18
integer y = 72
integer width = 1733
integer height = 636
integer taborder = 20
string dataobject = "d_vzt_text_list_sel"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= TRUE // selected options
_drop_available_DW 			= false // available options
_selection_service 			= 'S'  
is_drag_trg_idcol				= 'id'
_dragdrop_auto 				= true
end event

event ue_dragdrop_sel_drop_sql;call super::ue_dragdrop_sel_drop_sql;INSERT INTO vzt_text_lang  
		VALUES ( :id_main_id, :id_source_id) ;

		
end event

event constructor_post;call super::constructor_post;is_drag_src_do			= idw_vpart_avail.dataobject //'d_parts_list_vavail'
idw_vpart_avail._dw_droptarget = this

end event

event ue_rowselected;call super::ue_rowselected;If row > 0  then
	 
	il_part_id = this.GetItemNumber( row, "id" )
	idw_vpart.Retrieve ( il_part_id  )
	
END IF

return 0
end event

event clicked;call super::clicked;if row >  0 then
	this.SelectRow( 0, false)
	this.SelectRow( row, true)
end if	
end event

event dragdrop;call super::dragdrop;if this.GetRow() >  0 then
	this.SelectRow( 0, false)
	this.SelectRow( this.GetRow() , true)
end if	
end event

event retrieveend;call super::retrieveend;if this.RowCOunt() > 0 then
	this.event ue_rowselected( 1,true)
end if
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 4027
integer height = 1336
long backcolor = 79349703
string text = "Import"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_subimp dw_subimp
dw_probimp dw_probimp
dw_subex dw_subex
dw_probex dw_probex
end type

on tabpage_4.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_subimp=create dw_subimp
this.dw_probimp=create dw_probimp
this.dw_subex=create dw_subex
this.dw_probex=create dw_probex
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_subimp,&
this.dw_probimp,&
this.dw_subex,&
this.dw_probex}
end on

on tabpage_4.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_subimp)
destroy(this.dw_probimp)
destroy(this.dw_subex)
destroy(this.dw_probex)
end on

type cb_3 from commandbutton within tabpage_4
integer x = 901
integer y = 980
integer width = 293
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "uPPer"
end type

event clicked;string lsstr='àáâãäå¸æçèéêëìíîïðñòóôõö÷øùúûüýþÿ àáâãäå¸æçèéêëìíîïðñòóôõö÷øùúûüýþÿ ÀÁÂÃÄÅÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß aasaweaczxcasasdeksldhjcisuhnsdcskdcjcd'


lsstr = f_upper_cyrillic(lsstr )
lsstr =lsstr 

end event

type cb_2 from commandbutton within tabpage_4
integer x = 558
integer y = 980
integer width = 293
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Import prob"
end type

event clicked;dw_probimp.ImportFile('')
//dw_subimp.Retrieve()
//
end event

type cb_1 from commandbutton within tabpage_4
integer x = 27
integer y = 980
integer width = 274
integer height = 76
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrive"
end type

event clicked;dw_probex.Retrieve()
dw_subex.Retrieve()
//dw_probimp.Retrieve()
//dw_subimp.Retrieve()
//
end event

type dw_subimp from uo_vzt_dwbase within tabpage_4
integer x = 1522
integer y = 492
integer width = 1463
integer height = 452
integer taborder = 40
string dataobject = "d_vzt_lang_subprob_export"
end type

type dw_probimp from uo_vzt_dwbase within tabpage_4
integer x = 1522
integer y = 24
integer width = 1463
integer height = 452
integer taborder = 30
string dataobject = "d_vzt_lang_prob_export"
end type

type dw_subex from uo_vzt_dwbase within tabpage_4
integer x = 32
integer y = 496
integer width = 1463
integer height = 452
integer taborder = 30
string dataobject = "d_vzt_lang_subprob_export"
end type

type dw_probex from uo_vzt_dwbase within tabpage_4
integer x = 32
integer y = 24
integer width = 1463
integer height = 452
integer taborder = 20
string dataobject = "d_vzt_lang_prob_export"
end type

type phl_1 from picturehyperlink within w_vzt_lang_tran
integer x = 37
integer y = 32
integer width = 1152
integer height = 212
boolean bringtotop = true
string pointer = "HyperLink!"
boolean originalsize = true
boolean focusrectangle = false
end type

