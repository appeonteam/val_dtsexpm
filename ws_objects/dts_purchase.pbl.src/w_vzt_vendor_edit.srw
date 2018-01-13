$PBExportHeader$w_vzt_vendor_edit.srw
forward
global type w_vzt_vendor_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_vendor_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_vendor_edit
end type
type tab_1 from tab within w_vzt_vendor_edit
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
type tabpage_items from userobject within tab_1
end type
type cb_call from commandbutton within tabpage_items
end type
type dw_part_tasks from uo_vzt_dwbase within tabpage_items
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
cb_call cb_call
dw_part_tasks dw_part_tasks
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type
type tabpage_scon from userobject within tab_1
end type
type dw_scon from uo_vzt_dwbase within tabpage_scon
end type
type tabpage_scon from userobject within tab_1
dw_scon dw_scon
end type
type tabpage_projects from userobject within tab_1
end type
type dw_proj from uo_vzt_dwbase within tabpage_projects
end type
type tabpage_projects from userobject within tab_1
dw_proj dw_proj
end type
type tabpage_4 from userobject within tab_1
end type
type tabpage_4 from userobject within tab_1
end type
type tab_1 from tab within w_vzt_vendor_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_items tabpage_items
tabpage_scon tabpage_scon
tabpage_projects tabpage_projects
tabpage_4 tabpage_4
end type
type phl_1 from picturehyperlink within w_vzt_vendor_edit
end type
end forward

global type w_vzt_vendor_edit from w_vzt_base
integer width = 4224
integer height = 2296
string title = "Telephone Book"
windowstate windowstate = maximized!
r_1 r_1
dw_contact_address dw_contact_address
tab_1 tab_1
phl_1 phl_1
end type
global w_vzt_vendor_edit w_vzt_vendor_edit

type variables

uo_vzt_dwbase   idw_details, idw_addresses, idw_scon, idw_proj
uo_vzt_dwbase   idw_vpart_sel, idw_vpart_avail, idw_vpart
uo_vzt_dwbase	 idw_part_tasks

long il_part_id

string is_vendor_type  

w_call_upd_profile  iw_call


end variables

on w_vzt_vendor_edit.create
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

on w_vzt_vendor_edit.destroy
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
idw_addresses 		= tab_1.tabpage_2.dw_addr

idw_vpart 			= tab_1.tabpage_items.dw_vpartdet
idw_vpart_sel		= tab_1.tabpage_items.dw_sel
idw_vpart_avail	= tab_1.tabpage_items.dw_avail
idw_part_tasks		= tab_1.tabpage_items.dw_part_tasks

idw_proj  			= tab_1.tabpage_projects.dw_proj
idw_scon 			= tab_1.tabpage_scon.dw_scon

ib_stay_tab_on_save = true

//dw_data.ShareData( idw_details )
is_dfilter_label='phonebook'

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
idw_addresses.Reset()
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
ELSE
	liRc = dw_primary.SetFilter ('') 
	liRc = dw_primary.Filter () 
END IF

//		dw_mainlist

end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_vendor_edit
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

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_vendor_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_vendor_edit
integer x = 9
integer y = 264
integer width = 3273
integer height = 408
string dataobject = "d_vendor_list"
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
this.inv_field_sort.of_setcolumn( 'comp_name_t', 'firstname A', 'firstname D')
this.inv_field_sort.of_setcolumn( 'contacttype_t', 'contacttype A, firstname A', 'contacttype D, firstname A')

this.setsort( 'firstname A')


end event

event dw_mainlist::ue_get_key_values;call super::ue_get_key_values;if al_row > 0 then 
	id_main_id = f_nvl(this.GetItemNumber(al_row ,'id') , 0)
	idw_vpart_sel.id_main_id_local 	= id_main_id 
	idw_vpart_avail.id_main_id_local = id_main_id 
	
	cb_new.visible 	= true 
	is_vendor_type = f_nvl(this.GetItemString(al_row ,'contacttype') ,'')
//Reset tabs based on vendor type:

tab_1.tabpage_projects.visible 	= false
tab_1.tabpage_scon.visible 		= false

tab_1.tabpage_2.visible 			= true  // visible for all 
tab_1.tabpage_2.enabled 			= true 

//setfocus( tab_1.tabpage_1)

choose case is_vendor_type 
	case 'DESIGNER' , 'ARCHITECT'
		tab_1.tabpage_projects.visible = true 
		tab_1.tabpage_projects.enabled = true 
		
		tab_1.tabpage_items.visible = false 
	case 'CONTRACTOR' 
		tab_1.tabpage_scon.visible = true 
		tab_1.tabpage_scon.enabled = true 

		tab_1.tabpage_items.visible = false 
	case 'MUNICIPAL'  // licences 
		tab_1.tabpage_items.visible = true  
		tab_1.tabpage_items.enabled = true 

	case 'VENDOR' 
		tab_1.tabpage_items.visible = true 
		tab_1.tabpage_items.enabled = true 
		
	case else 
		wf_enabletab (tab_1, true)
end choose


	if id_main_id <= 0 then 
		idw_addresses.Reset()
		return 
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		long ll_rows
		
//		ll_rows = idw_details.Retrieve( id_main_id ) 

		ll_rows = idw_scon.Retrieve( id_main_id )
		ll_rows = idw_proj.Retrieve( id_main_id )
		ll_rows = idw_addresses.Retrieve( id_main_id )
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

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_vendor_edit
integer x = 718
integer y = 1928
integer width = 343
integer taborder = 20
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_close from w_vzt_base`cb_close within w_vzt_vendor_edit
integer x = 2217
integer y = 1928
integer width = 201
integer taborder = 50
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_vendor_edit
integer x = 2007
integer y = 1928
integer width = 201
integer taborder = 110
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_save from w_vzt_base`cb_save within w_vzt_vendor_edit
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

type cb_select from w_vzt_base`cb_select within w_vzt_vendor_edit
integer x = 1198
integer y = 1928
integer width = 201
integer taborder = 80
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_base`cb_new within w_vzt_vendor_edit
integer x = 1618
integer y = 1928
integer width = 201
integer taborder = 100
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_vendor_edit
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

type cb_search from w_vzt_base`cb_search within w_vzt_vendor_edit
integer x = 407
integer y = 1928
integer width = 302
integer taborder = 60
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_search::clicked;call super::clicked;cb_new.visible = true 
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_vendor_edit
integer x = 2514
integer y = 1928
integer width = 247
integer textsize = -8
long backcolor = 67108864
end type

type st_stop from w_vzt_base`st_stop within w_vzt_vendor_edit
integer x = 2574
integer y = 1928
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_vendor_edit
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

type dw_print from w_vzt_base`dw_print within w_vzt_vendor_edit
integer x = 3547
integer y = 768
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_vendor_edit
integer x = 2016
integer y = 8
end type

type r_1 from rectangle within w_vzt_vendor_edit
boolean visible = false
integer linethickness = 12
long fillcolor = 8421504
integer x = 347
integer y = 2060
integer width = 91
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_vendor_edit
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

type tab_1 from tab within w_vzt_vendor_edit
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
tabpage_2 tabpage_2
tabpage_items tabpage_items
tabpage_scon tabpage_scon
tabpage_projects tabpage_projects
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_items=create tabpage_items
this.tabpage_scon=create tabpage_scon
this.tabpage_projects=create tabpage_projects
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_items,&
this.tabpage_scon,&
this.tabpage_projects,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_items)
destroy(this.tabpage_scon)
destroy(this.tabpage_projects)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4027
integer height = 1328
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
string dataobject = "d_vendor_edit"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_detail, "vendor information", true, true ) // set updateable, title and selectable

//this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'firstname', 'contacttype' } // 'id',

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
ls_name = f_nvl(this.GetitemString( this.GetRow() , 'firstname'),'')
ls_type  = f_nvl(this.GetitemString( this.GetRow() , 'contacttype'),'')

if ll_id = 0 then 
	SELECT count(*) into :ll_count FROM vzt_contact 
	WHERE firstname = :ls_name and contacttype = :ls_type;
	
	IF ll_count = 1 then 
		SELECT id into :ll_id FROM vzt_contact 
		WHERE firstname = :ls_name and contacttype = :ls_type;
	END IF 
	
	IF ll_count = 0 or ll_id = 0 then 
		MessageBox("Database Error", "Vendor IDentity Refresh error")
	END IF
ELSE
//	id_main_id = ll_id
END IF

return 
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4027
integer height = 1328
long backcolor = 79349703
string text = "Addresses"
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
integer x = 2789
integer y = 1232
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
integer x = 2656
integer y = 1232
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
 	ll_newrow = idw_addresses.EVENT ue_insert_new( 'type') 
	if ll_newrow <= 0 then return 

//	idw_addresses.SetItem( ll_newrow, 'type', 	'EMAIL')
//	idw_addresses.SetItem( ll_newrow, 'primary', 'N')
//	idw_addresses.SetItem( ll_newrow, 'address', ' ')
//
	If idw_addresses.RowCount() = 1 then 
		idw_addresses.SetItem( ll_newrow, 'type', 	'MAILING')
		idw_addresses.SetItem( ll_newrow, 'descr', 	'Primary mailing address')
		idw_addresses.SetItem( ll_newrow, 'primary', 'Y')
	END IF 

string lsRand

idw_addresses.SetItem( ll_newrow, 'country', gnv_appman.is_country)


lsRand = f_random_string (20) 
idw_addresses.SetItem( ll_newrow, 'descr', lsRand)
end event

type dw_addr from uo_vzt_dwbase within tabpage_2
integer x = 9
integer y = 20
integer width = 3744
integer height = 1196
integer taborder = 20
string dataobject = "d_full_address_edit"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_addr, "vendor addresses", true, true  ) // set updateable, title and selectable

is_editable[]	= {"type", "primary", "addr1", "addr2", "address" , &
"city", "state", "zip", "country", "phone", "descr" &
 }

end event

event ue_update_keys_on_new;call super::ue_update_keys_on_new;return 1
//If row <= 0 then return 1
////this.SetItem( row, 'id', il_contactid) 
//
//long ll_id, ll_row, ll_count
//
//ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)
//if ll_id = 0 then 
//	SELECT max(id) into :ll_id from vzt_address ;
//	ll_id = f_nvl(ll_id,0) + row 
//	this.setitem( row, 'id', ll_id )
//
//	string ls_expr
//	ls_expr = ' contact_id = ' + string( id_main_id ) + ' AND address_id = ' + string( ll_id  )
//	ll_row = dw_contact_address.Find( ls_expr, 1, dw_contact_address.RowCount() )
//	SELECT count(*) into :ll_count from vzt_contact_address 
//		where contact_id = :id_main_id AND address_id = :ll_id ; 
//	IF ll_count <= 0 then 
//		// make trigger !!!!!!!!!!!!! 
//		INSERT INTO vzt_contact_address VALUES ( :ll_id , :id_main_id  ) ;
//	END IF 
//// make trigger !!!!!!!!!!!!! 
////	if ll_row <= 0 then  // if row not found - insert 
////		long ll_newrow 
////		 	ll_newrow = dw_contact_address.EVENT ue_insert_new( 'contact_id') 
////	 	 	if ll_newrow > 0 then 
////				dw_contact_address.SetItem( ll_newrow, 'contact_id', 	il_contactid ) 
////				dw_contact_address.SetItem( ll_newrow, 'address_id', 	ll_id ) 
////			end if 	
////	end if 
//////	MessageBox('qid',string(id_questionid))
//END IF
//return 1
end event

event ue_refresh_identity;call super::ue_refresh_identity;//address save succeeded 
// need to insert contact address relation records 
long ll_id, ll_row, ll_count, ll_adcnt, ll_mainid
string lsRand
ll_count = this.rowcount() 
If ll_count <= 0 then return 

//ll_count  = idw_addresses.Retrieve( id_main_id )
//If ll_count <= 0 then return 

FOR ll_row = 1 to ll_count 
	
	ll_id = f_nvl(this.GetitemNumber( ll_row , 'id'),0)
 
  	if ll_id <> 0 then 
		ll_mainid = id_main_id
		SELECT count(*) into :ll_adcnt from vzt_contact_address 
			where contact_id = :id_main_id AND address_id = :ll_id ; 
		IF ll_adcnt <= 0 or IsNUll(ll_count) then 
			INSERT INTO vzt_contact_address (address_id, contact_id) 
					VALUES ( :ll_id , :id_main_id  ) ;
		END IF 
	ELSE
		//	get the id manually 
		lsRand = idw_addresses.GetItemString( ll_row, 'descr')
		SELECT id into :ll_id from vzt_address WHERE descr = :lsRand;
		ll_id = f_nvl ( ll_id, 0) 
	END IF
  	if ll_id <> 0 then 
		ll_mainid = id_main_id
		SELECT count(*) into :ll_adcnt from vzt_contact_address 
			where contact_id = :id_main_id AND address_id = :ll_id ; 
		IF ll_adcnt <= 0 or IsNUll(ll_count) then 
			INSERT INTO vzt_contact_address (address_id, contact_id) 
					VALUES ( :ll_id , :id_main_id  ) ;
		END IF 
	ELSE
		MessageBox("Database Error", "Address IDentity Refresh error")
	END IF

NEXT

return 
end event

type tabpage_items from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4027
integer height = 1328
long backcolor = 79349703
string text = "Supplies & Services"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
cb_call cb_call
dw_part_tasks dw_part_tasks
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type

on tabpage_items.create
this.cb_call=create cb_call
this.dw_part_tasks=create dw_part_tasks
this.cb_filter=create cb_filter
this.st_2=create st_2
this.st_1=create st_1
this.dw_vpartdet=create dw_vpartdet
this.dw_avail=create dw_avail
this.dw_sel=create dw_sel
this.Control[]={this.cb_call,&
this.dw_part_tasks,&
this.cb_filter,&
this.st_2,&
this.st_1,&
this.dw_vpartdet,&
this.dw_avail,&
this.dw_sel}
end on

on tabpage_items.destroy
destroy(this.cb_call)
destroy(this.dw_part_tasks)
destroy(this.cb_filter)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_vpartdet)
destroy(this.dw_avail)
destroy(this.dw_sel)
end on

type cb_call from commandbutton within tabpage_items
integer x = 2354
integer y = 1224
integer width = 576
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Task Service/Part"
end type

event clicked;str_response lstr_parms

lstr_parms.num1 = il_part_id

OpenWIthParm( w_vzt_get_part_task, lstr_parms)

lstr_parms = Message.PowerObjectParm
if not isValid( lstr_parms) then return 0
If lstr_parms.rc <= 0 then return 0

lstr_parms.string5 = 'VENDOR' // dept 
string 	ls_vendor_name
ls_vendor_name 		= idw_details.GetItemstring(idw_details.GetRow(),'firstname') 
lstr_parms.string6 	= ls_vendor_name 
lstr_parms.num2	 	= id_main_id 
if idw_vpart.RowCount() > 0 then
	lstr_parms.value1		= idw_vpart.GetItemDecimal(1, 'price')
END IF 	
//iw_call = f_vzt_open_call ()

// use global structure to pass parms
gnv_appman.istr_response = lstr_parms

Openwithparm( iw_call,'0', "w_call_upd_profile" )
If IsValid(iw_call) THEN
		iw_call.openMode = '0'
		iw_call.cb_add.TriggerEvent("clicked")
		if iw_call.WindowState = Minimized! then
			iw_call.WindowState = Normal!
		end if
end if
end event

type dw_part_tasks from uo_vzt_dwbase within tabpage_items
boolean visible = false
integer x = 2482
integer y = 56
integer width = 1536
integer height = 608
integer taborder = 40
string dataobject = "d_part_task_map_list"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event clicked;call super::clicked;If row > 0  then
//	long ll_part_id
//	ll_part_id = this.GetItemNumber( row, "part_id" )
//	idw_vpart.Retrieve ( id_main_id, ll_part_id )
END IF

return 0
end event

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= TRUE // selected options
_drop_available_DW 			= false // available options
_selection_service 			= 'M'  
is_drag_src_idcol				= 'id' //'subproblem_number'
is_drag_trg_idcol				= 'id' //'part_id'
_dragdrop_auto 				= true
end event

event ue_dragdrop_sel_drop_sql;call super::ue_dragdrop_sel_drop_sql;if al_source_row <= 0 then return 
string ls_problem_number, ls_subproblem_number

ls_problem_number		= idw_vpart_avail.GetItemString( al_source_row, 'problem_number')
ls_subproblem_number	= idw_vpart_avail.GetItemString( al_source_row, 'subproblem_number')

INSERT INTO vzt_part_task_map
		(part_id, problem_number, subproblem_number) 
		VALUES ( :id_main_id, :ls_problem_number, :ls_subproblem_number) ;

		
end event

event constructor_post;call super::constructor_post;is_drag_src_do			= idw_vpart_avail.dataobject //'d_parts_list_vavail'
idw_vpart_avail._dw_droptarget = this

end event

type cb_filter from commandbutton within tabpage_items
integer x = 1239
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
string text = "Filter Parts"
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
string dataobject = "d_vendor_parts_edit"
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
integer x = 1239
integer y = 72
integer width = 1097
integer height = 544
integer taborder = 30
string dataobject = "d_parts_list_vavail"
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

event ue_dragdrop_avl_drop_sql;call super::ue_dragdrop_avl_drop_sql;DELETE FROM vzt_vendor_part
		WHERE vendor_id = :id_main_id 
				AND part_id = :id_source_id
		;

		
end event

type dw_sel from uo_vzt_dwbase within tabpage_items
integer x = 18
integer y = 72
integer width = 1129
integer height = 636
integer taborder = 20
string dataobject = "d_parts_list_vsel"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= TRUE // selected options
_drop_available_DW 			= false // available options
_selection_service 			= 'S'  
is_drag_trg_idcol				= 'part_id'
_dragdrop_auto 				= true
end event

event ue_dragdrop_sel_drop_sql;call super::ue_dragdrop_sel_drop_sql;INSERT INTO vzt_vendor_part
		(vendor_id, part_id) 
		VALUES ( :id_main_id, :id_source_id) ;

		
end event

event constructor_post;call super::constructor_post;is_drag_src_do			= idw_vpart_avail.dataobject //'d_parts_list_vavail'
idw_vpart_avail._dw_droptarget = this

end event

event ue_rowselected;call super::ue_rowselected;If row > 0  then
	 
	il_part_id = this.GetItemNumber( row, "part_id" )
	idw_vpart.Retrieve ( id_main_id, il_part_id )
	idw_part_tasks.Retrieve ( il_part_id )
	
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

type tabpage_scon from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 104
integer width = 4027
integer height = 1328
long backcolor = 79349703
string text = "Service Contracts"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_scon dw_scon
end type

on tabpage_scon.create
this.dw_scon=create dw_scon
this.Control[]={this.dw_scon}
end on

on tabpage_scon.destroy
destroy(this.dw_scon)
end on

type dw_scon from uo_vzt_dwbase within tabpage_scon
integer x = 9
integer y = 16
integer width = 3749
integer height = 1292
integer taborder = 20
string dataobject = "d_svc_cont_list_by_contractor"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type tabpage_projects from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 104
integer width = 4027
integer height = 1328
long backcolor = 79349703
string text = "Projects"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_proj dw_proj
end type

on tabpage_projects.create
this.dw_proj=create dw_proj
this.Control[]={this.dw_proj}
end on

on tabpage_projects.destroy
destroy(this.dw_proj)
end on

type dw_proj from uo_vzt_dwbase within tabpage_projects
integer x = 5
integer y = 12
integer width = 4009
integer height = 1292
integer taborder = 30
string dataobject = "d_svc_cont_list_by_contractor"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type tabpage_4 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 104
integer width = 4027
integer height = 1328
long backcolor = 79349703
string text = "none"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
end type

type phl_1 from picturehyperlink within w_vzt_vendor_edit
integer x = 37
integer y = 32
integer width = 1152
integer height = 212
boolean bringtotop = true
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "Telephone Bookbf.bmp"
boolean focusrectangle = false
end type

