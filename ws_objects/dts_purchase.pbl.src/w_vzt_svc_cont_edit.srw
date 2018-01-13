$PBExportHeader$w_vzt_svc_cont_edit.srw
forward
global type w_vzt_svc_cont_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_svc_cont_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_svc_cont_edit
end type
type tab_1 from tab within w_vzt_svc_cont_edit
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
type cb_oleedit from commandbutton within tabpage_2
end type
type cb_getfile from commandbutton within tabpage_2
end type
type ole_1 from uo_vzt_oledoc_base within tabpage_2
end type
type cb_del from commandbutton within tabpage_2
end type
type cb_ins from commandbutton within tabpage_2
end type
type dw_doc from uo_vzt_dwbase within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_oleedit cb_oleedit
cb_getfile cb_getfile
ole_1 ole_1
cb_del cb_del
cb_ins cb_ins
dw_doc dw_doc
end type
type tabpage_3 from userobject within tab_1
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
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type
type tab_1 from tab within w_vzt_svc_cont_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type p_1 from picture within w_vzt_svc_cont_edit
end type
end forward

global type w_vzt_svc_cont_edit from w_vzt_base
integer width = 3991
integer height = 2144
string title = "Contracts and Projects "
windowstate windowstate = maximized!
r_1 r_1
dw_contact_address dw_contact_address
tab_1 tab_1
p_1 p_1
end type
global w_vzt_svc_cont_edit w_vzt_svc_cont_edit

type variables
double	id_oleid, id_doc_id
uo_vzt_dwbase   idw_details, idw_docs
uo_vzt_dwbase   idw_vpart_sel, idw_vpart_avail, idw_vpart






end variables

on w_vzt_svc_cont_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
this.tab_1=create tab_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.p_1
end on

on w_vzt_svc_cont_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
destroy(this.tab_1)
destroy(this.p_1)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_new.visible = true 

idw_details 		= tab_1.tabpage_1.dw_detail
idw_docs		 		= tab_1.tabpage_2.dw_doc

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

timer (1)
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

event timer;call super::timer;timer (0)
long 		ll_rows, ll_maxrows
string 	ls_color , ls_c1, ls_c2, ls_c3, ls_c4, ls_ex1, ls_ex2, ls_ex3, ls_ex4 
string 	ls_f1, ls_f2,ls_f3, ls_f4, ls_mode
ll_maxrows = dw_mainlist.RowCount()

ls_ex1 = "if(relativedate( today(),alert_days ) >= renew_date, rgb (255, 50, 50),  536870912)"
ls_ex2 = "if(relativedate( today(),alert_days ) >= renew_date, rgb (55, 250, 50),  536870912)"

ls_f1 = "400~tif(relativedate(today(),alert_days ) >= renew_date, 700, 400)" 
ls_f2 = "400~tif(relativedate(today(),alert_days ) >= renew_date, 400, 400)" 
///////////////////////////
ls_ex3 = "if(relativedate( today(), alert_days ) >= ins_exp_date, rgb (255, 50, 50),  536870912)"
ls_ex4 = "if(relativedate( today(), alert_days ) >= ins_exp_date, rgb (55, 250, 50),  536870912)"

ls_f3 = "400~tif(relativedate(today(),alert_days ) >= ins_exp_date, 700, 400)" 
ls_f4 = "400~tif(relativedate(today(),alert_days ) >= ins_exp_date, 400, 400)" 
////////////////////////////////
///////////////////////////
ls_c1 = "553648127~t"+ls_ex1	
ls_c2 = "553648127~t"+ls_ex2
ls_c3 = "553648127~t"+ls_ex3
ls_c4 = "553648127~t"+ls_ex4
//ls_c2 = 		// string(rgb( 255, 50, 50) )	// "536870912"

//ls_mode = string( dw_mainlist.object.renew_date.background.mode )
//if ls_mode <> '0' then 
		dw_mainlist.object.renew_date.background.mode 	= '0' 
		dw_mainlist.object.ins_exp_date.background.mode = '0' 
//end if
	
	ls_color = trim(string( dw_mainlist.object.renew_date.background.color ))
	if POS(ls_color, ls_ex1) > 0  then 
		dw_mainlist.object.renew_date.background.color 	= ls_c2 
		dw_mainlist.object.renew_date.font.weight 		= ls_f2 
	else
		dw_mainlist.object.renew_date.background.color 	= ls_c1 
		dw_mainlist.object.renew_date.font.weight 		= ls_f1
	end if 
//////////////////////////////
	ls_color = trim(string( dw_mainlist.object.ins_exp_date.background.color ))
	if POS(ls_color, ls_ex3) > 0  then 
		dw_mainlist.object.ins_exp_date.background.color 	= ls_c4
		dw_mainlist.object.ins_exp_date.font.weight 			= ls_f4
	else
		dw_mainlist.object.ins_exp_date.background.color 	= ls_c3
		dw_mainlist.object.ins_exp_date.font.weight 			= ls_f3
	end if 

timer(.5)
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_svc_cont_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_svc_cont_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_svc_cont_edit
integer x = 0
integer y = 256
integer width = 3877
integer height = 256
string dataobject = "d_svc_cont_list"
boolean hscrollbar = true
end type

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'id_t', 'id A', 'id D')
this.inv_field_sort.of_setcolumn( 'contact_id_t', 'contact_id A', 'contact_id D')
this.inv_field_sort.of_setcolumn( 'start_date_t', 'start_date D', 'start_date A')
this.inv_field_sort.of_setcolumn( 'descr_t', 'descr A', 'descr D')

this.setsort( 'crdate D, contact_id A, descr A')


end event

event dw_mainlist::ue_get_key_values;call super::ue_get_key_values;if al_row > 0 and al_row <= this.RowCount() then
	id_main_id = f_nvl(this.GetItemNumber(al_row ,'id') , 0)
	idw_vpart_sel.id_main_id_local = id_main_id 
	idw_vpart_avail.id_main_id_local = id_main_id 
	
	cb_new.visible 		= true 

	if id_main_id <= 0 then 
		idw_docs.Reset()
		return 
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		long ll_rows
		
//		ll_rows = idw_details.Retrieve( id_main_id ) 

		ll_rows = idw_docs.Retrieve( id_main_id )
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

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_svc_cont_edit
integer x = 727
integer y = 1868
integer width = 343
integer taborder = 20
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_close from w_vzt_base`cb_close within w_vzt_svc_cont_edit
integer x = 2514
integer y = 1868
integer width = 302
integer taborder = 50
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_svc_cont_edit
integer x = 2203
integer y = 1868
integer width = 302
integer taborder = 110
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_save from w_vzt_base`cb_save within w_vzt_svc_cont_edit
integer x = 1582
integer y = 1868
integer width = 302
integer taborder = 90
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
	idw_docs.Retrieve( id_main_id )
END IF
end event

type cb_select from w_vzt_base`cb_select within w_vzt_svc_cont_edit
integer x = 1271
integer y = 1868
integer width = 302
integer taborder = 80
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_base`cb_new within w_vzt_svc_cont_edit
integer x = 1893
integer y = 1868
integer width = 302
integer taborder = 100
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_svc_cont_edit
integer x = 18
integer y = 1868
integer taborder = 70
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_newsearch::clicked;call super::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_svc_cont_edit
integer y = 1868
integer width = 343
integer taborder = 60
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_search::clicked;call super::clicked;cb_new.visible = true 
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_svc_cont_edit
integer x = 2898
integer y = 1868
integer width = 247
integer textsize = -8
string facename = "Lucida Sans"
long backcolor = 67108864
end type

type st_stop from w_vzt_base`st_stop within w_vzt_svc_cont_edit
integer x = 2917
integer y = 1868
integer textsize = -8
integer weight = 400
string facename = "Lucida Sans"
end type

type dw_data from w_vzt_base`dw_data within w_vzt_svc_cont_edit
boolean visible = false
integer x = 2277
integer y = 616
integer width = 137
integer height = 108
integer taborder = 40
string dataobject = "d_svc_cont_edit"
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

type dw_print from w_vzt_base`dw_print within w_vzt_svc_cont_edit
integer x = 2674
integer y = 1128
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_svc_cont_edit
end type

type r_1 from rectangle within w_vzt_svc_cont_edit
boolean visible = false
integer linethickness = 12
long fillcolor = 8421504
integer x = 2994
integer y = 1848
integer width = 119
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_svc_cont_edit
boolean visible = false
integer x = 2441
integer y = 356
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

type tab_1 from tab within w_vzt_svc_cont_edit
integer y = 544
integer width = 3840
integer height = 1328
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
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
integer y = 104
integer width = 3803
integer height = 1208
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
integer width = 3730
integer height = 1100
integer taborder = 20
string dataobject = "d_svc_cont_edit1"
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_poweredit = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_detail, "Contract detail edit", true, true  ) // set updateable, title and selectable
this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={ 'id','contact_id', 'descr', 'start_date', &
 'end_date', 'renew_date', 'alert_days',  'alert_dist', &
'ins_exp_date', 'amount', 'freq', 'long_desc', &
'ins_start_date','ins_alert_days', 'dept' } 

is_searchable[]	=   is_editable[]


end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3803
integer height = 1208
long backcolor = 79349703
string text = "Documents"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
cb_oleedit cb_oleedit
cb_getfile cb_getfile
ole_1 ole_1
cb_del cb_del
cb_ins cb_ins
dw_doc dw_doc
end type

on tabpage_2.create
this.cb_oleedit=create cb_oleedit
this.cb_getfile=create cb_getfile
this.ole_1=create ole_1
this.cb_del=create cb_del
this.cb_ins=create cb_ins
this.dw_doc=create dw_doc
this.Control[]={this.cb_oleedit,&
this.cb_getfile,&
this.ole_1,&
this.cb_del,&
this.cb_ins,&
this.dw_doc}
end on

on tabpage_2.destroy
destroy(this.cb_oleedit)
destroy(this.cb_getfile)
destroy(this.ole_1)
destroy(this.cb_del)
destroy(this.cb_ins)
destroy(this.dw_doc)
end on

type cb_oleedit from commandbutton within tabpage_2
integer x = 1737
integer y = 960
integer width = 375
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Edit/View Doc"
end type

event clicked;ole_1.uf_activate(ole_1.i_acttype)
cb_save.visible = true 
cb_save.enabled = true 
end event

type cb_getfile from commandbutton within tabpage_2
integer x = 2121
integer y = 960
integer width = 361
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Get Doc File"
end type

event clicked;long ll_row
dwitemstatus lst_stat
ll_row = idw_docs.GetROw() 
lst_stat = idw_docs.GetItemStatus( ll_row, 0, Primary!)
If lst_stat = New! or lst_stat = NewModified! then
	MessageBox("Recent Changes Unsaved", "Please save changes before adding a document!", StopSign!)
ELSE	
	int li_rc
	li_rc = ole_1.event ue_loadfile()
	if li_rc > 0 then 
		li_rc = ole_1.uf_save()
		if li_rc >= 0 then 
			idw_docs.Retrieve( id_main_id )
			if ll_row > 0 then
				idw_docs.SetRow( ll_row) 
				idw_docs.ScrollToRow( ll_row) 
				idw_docs.SelectRow(0,false)
				idw_docs.SelectRow(ll_row,true)
			end if	
		end if 
		cb_save.enabled = true 
	end if
END IF



end event

type ole_1 from uo_vzt_oledoc_base within tabpage_2
integer x = 1413
integer y = 8
integer width = 1070
integer height = 932
integer taborder = 20
string binarykey = "w_vzt_svc_cont_edit.win"
end type

event ue_ole_save_upd_ref_sql;double ld_ole, ld_doc_id ,ld_main_id 
ld_ole			= id_ole
ld_doc_id 		= id_doc_id 
ld_main_id 		= id_main_id 

if ld_ole > 0 then 
	UPDATE vzt_service_cont_docs SET ole_doc_id = :ld_ole 
	WHERE id = :ld_doc_id AND service_id = :ld_main_id ;
	
	ld_ole = SQLCA.SQLCODE
end if
end event

type cb_del from commandbutton within tabpage_2
integer x = 1563
integer y = 960
integer width = 142
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<-Del"
end type

event clicked;	long ll_row , ll_address 
	string ls_expr
	ll_row = dw_doc.GetRow() 
	If ll_row <= 0 then return 
	ll_address = dw_doc.object.id [ll_row ]
	ls_expr = ' contact_id = ' + string( id_main_id) + ' AND address_id = ' + string( ll_address )
	dw_doc.DeleteRow(0) 
//	ll_row = dw_contact_address.Find( ls_expr, 1, dw_contact_address.RowCount() )
	// make trigger !!!!!!!!!!!!! 
//	if ll_row <= 0 then return 
//	dw_contact_address.DeleteRow( ll_row ) 
	

end event

type cb_ins from commandbutton within tabpage_2
integer x = 1417
integer y = 960
integer width = 142
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<-Ins"
end type

event clicked;	long			ll_newrow
 	ll_newrow = idw_docs.EVENT ue_insert_new( 'doc_type') 
	if ll_newrow <= 0 then return 

	idw_docs.SetItem( ll_newrow, 'service_id', 	id_main_id)
//	idw_addresses.ModifyEdit ("W")
//	If idw_addresses.RowCount() = 1 then 
//		idw_addresses.SetItem( ll_newrow, 'type', 	'MAILING')
//		idw_addresses.SetItem( ll_newrow, 'descr', 	'Primary mailing address')
//		idw_addresses.SetItem( ll_newrow, 'primary', 'Y')
//	END IF 
//

end event

type dw_doc from uo_vzt_dwbase within tabpage_2
integer x = 5
integer y = 8
integer width = 1390
integer height = 1028
integer taborder = 20
string dataobject = "d_svc_cont_doc_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_doc, "Contract documents", true, true  ) // set updateable, title and selectable

this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={ 'doc_type', 'descr'} 

is_searchable[]	=  is_editable[]

_selection_service = 'S' 

end event

event rowfocuschanged;call super::rowfocuschanged;long row
double ld_ole

row = currentrow
If row <= 0 or row > this.Rowcount() then return 

id_oleid = f_nvl( this.GetItemNumber( row, 'ole_doc_id') ,0)
id_doc_id = f_nvl( this.GetItemNumber( row, 'id') ,0)

ld_ole = id_oleid

ole_1.Clear() 
ole_1.id_ole = 0
if id_oleid > 0 then 
	ole_1.event ue_Retrieve( id_oleid) 
	cb_delete1.visible = true 
end if
return 1



end event

event clicked;call super::clicked;if row = 1 and this.RowCOunt() = 1 then 
	this.event rowfocuschanged (1)
end if
end event

event editchanged;call super::editchanged;cb_save.visible = true 
end event

event retrieveend;call super::retrieveend;ole_1.Clear() 
this.event rowfocuschanged( this.getrow())
end event

type tabpage_3 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 104
integer width = 3803
integer height = 1208
long backcolor = 79349703
string text = "------------"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
st_2 st_2
st_1 st_1
dw_vpartdet dw_vpartdet
dw_avail dw_avail
dw_sel dw_sel
end type

on tabpage_3.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_vpartdet=create dw_vpartdet
this.dw_avail=create dw_avail
this.dw_sel=create dw_sel
this.Control[]={this.st_2,&
this.st_1,&
this.dw_vpartdet,&
this.dw_avail,&
this.dw_sel}
end on

on tabpage_3.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_vpartdet)
destroy(this.dw_avail)
destroy(this.dw_sel)
end on

type st_2 from statictext within tabpage_3
integer x = 1586
integer y = 4
integer width = 466
integer height = 64
integer textsize = -10
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
integer width = 677
integer height = 64
integer textsize = -10
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

type dw_vpartdet from uo_vzt_dwbase within tabpage_3
integer x = 27
integer y = 460
integer width = 2318
integer height = 608
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
integer x = 1257
integer y = 72
integer width = 1088
integer height = 376
integer taborder = 30
string dataobject = "d_parts_list_vavail"
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

type dw_sel from uo_vzt_dwbase within tabpage_3
integer x = 27
integer y = 72
integer width = 1216
integer height = 376
integer taborder = 20
string dataobject = "d_parts_list_vsel"
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= TRUE // selected options
_drop_available_DW 			= false // available options
_selection_service 			= 'M'  
is_drag_trg_idcol				= 'part_id'
_dragdrop_auto 				= true
end event

event dragdrop;call super::dragdrop;//datawindow ldw_source 
//long ll_source_row, ll_row, ll_sort
//double	ld_id /* part id */ 
//string 	ls_expr, ls_practiceid, ls_locationid, ls_request = 'ADD'
//string	ls_source_col_id='part_id'
//ldw_source = source 
//If IsValid( ldw_source ) then 
//	// insert row and populate it from object list 
//	if ldw_source.dataobject = 'd_parts_list_vavail' then 
//		ll_source_row = ldw_source.GetSelectedRow( 0) 
//		ll_sort = this.RowCount() + 1
//		DO WHILE ll_source_row > 0 
//
//			ld_id = ldw_source.GetItemNumber ( ll_source_row , ls_source_col_id) 
//			ls_expr = ls_source_col_id + " = " + string( ld_id ) 
//			
//			If this.Find( ls_expr , 0, this.RowCount() ) = 0 then // assign only if not exist already 
//			  // SQL INSERT 
////				INSERT INTO qgen_qset_questions 
////				VALUES( :id_qsetid, :ld_id, :ll_sort ) ;
//			End if				// find
//			If ll_source_row < ldw_source.RowCount() then 
//				ll_source_row = ldw_source.GetSelectedRow( ll_source_row) // get next selected
//			ELSE
//				ll_source_row = 0
//			END IF 
//			ll_sort += 10
//		LOOP // while rows selected 
//		COMMIT ;
////		this.Retrieve( id_id)  // refresh 
//	End If
//	ldw_source.SelectRow( 0, false) // reset all selections
//End If
end event

event ue_dragdrop_sel_drop_sql;call super::ue_dragdrop_sel_drop_sql;INSERT INTO vzt_vendor_part
		(vendor_id, part_id) 
		VALUES ( :id_main_id, :id_source_id) ;

		
end event

event constructor_post;call super::constructor_post;is_drag_src_do			= idw_vpart_avail.dataobject //'d_parts_list_vavail'
idw_vpart_avail._dw_droptarget = this

end event

event clicked;call super::clicked;If row > 0  then
	long ll_part_id
	ll_part_id = this.GetItemNumber( row, "part_id" )
	idw_vpart.Retrieve ( id_main_id, ll_part_id )
END IF

return 0
end event

type p_1 from picture within w_vzt_svc_cont_edit
integer y = 28
integer width = 1152
integer height = 212
boolean bringtotop = true
boolean originalsize = true
string picturename = "Contracts.bmp"
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
04w_vzt_svc_cont_edit.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14w_vzt_svc_cont_edit.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
