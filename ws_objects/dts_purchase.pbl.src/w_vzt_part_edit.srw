$PBExportHeader$w_vzt_part_edit.srw
forward
global type w_vzt_part_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_part_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_part_edit
end type
type dw_sub from datawindow within w_vzt_part_edit
end type
type tab_1 from tab within w_vzt_part_edit
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
type dw_avail from uo_vzt_dwbase within tabpage_items
end type
type dw_sel from uo_vzt_dwbase within tabpage_items
end type
type tabpage_items from userobject within tab_1
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_avail dw_avail
dw_sel dw_sel
end type
type tabpage_2 from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_2
end type
type dw_avail_vendors from uo_vzt_dwbase within tabpage_2
end type
type dw_vpartdet from uo_vzt_dwbase within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_1 cb_1
dw_avail_vendors dw_avail_vendors
dw_vpartdet dw_vpartdet
end type
type tab_1 from tab within w_vzt_part_edit
tabpage_1 tabpage_1
tabpage_items tabpage_items
tabpage_2 tabpage_2
end type
type p_1 from picture within w_vzt_part_edit
end type
end forward

global type w_vzt_part_edit from w_vzt_base
integer width = 4297
integer height = 2160
string title = "Parts Manager"
windowstate windowstate = maximized!
r_1 r_1
dw_contact_address dw_contact_address
dw_sub dw_sub
tab_1 tab_1
p_1 p_1
end type
global w_vzt_part_edit w_vzt_part_edit

type variables
long 	il_contactid
datawindowchild idw_sub

uo_vzt_dwbase   idw_details, idw_vpart_sel, idw_vpart_avail
uo_vzt_dwbase   idw_vpartdet, idw_avail_vendors

string is_subcat_filter
end variables

on w_vzt_part_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
this.dw_sub=create dw_sub
this.tab_1=create tab_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
this.Control[iCurrent+3]=this.dw_sub
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.p_1
end on

on w_vzt_part_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
destroy(this.dw_sub)
destroy(this.tab_1)
destroy(this.p_1)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

idw_vpart_sel		= tab_1.tabpage_items.dw_sel
idw_vpart_avail	= tab_1.tabpage_items.dw_avail
idw_details			= tab_1.tabpage_1.dw_detail
idw_vpartdet		= tab_1.tabpage_2.dw_vpartdet
idw_avail_vendors = tab_1.tabpage_2.dw_avail_vendors

dw_primary 			= idw_details			
dw_primary.POST SetFocus()

it_main_tab 		= tab_1

is_dfilter_label='partmaint'

//dw_primary_list 	= dw_mainlist

//dw_sub.SettransObject( SQLCA)
//dw_sub.Retrieve()

//integer li_ret 
//li_ret = dw_data.GetChild ('subproblem_number', idw_sub)
//IF li_ret = -1 THEN MessageBox( "Error", "Not a DataWindowChild")
//dw_sub.ShareData (idw_sub) 

cb_newsearch.event clicked()

cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
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
		
	//	dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
	//	dw_primary.width	= newwidth  - dw_primary.x * 2 
		cb_dfilter.y	= newheight - ii_resizeband_y - cb_dfilter.height
		
		dw_mainlist.height	= newheight - ii_resizeband_y * 2 - dw_mainlist.y - tab_1.height - r_1.height 
		dw_mainlist.width	= newwidth  - dw_mainlist.x * 2 

		r_1.y				= cb_save.y - 20
		r_1.width 		= newwidth - r_1.x * 2 
		tab_1.y 			= r_1.y - tab_1.height - 10
		tab_1.width 	= newwidth - tab_1.x * 2 
	End IF 
End IF 	
end event

event ue_dfilter;call super::ue_dfilter;		string lsFilter 
		int liRc
		
	if trim(is_dfilter[1]) <> '' and is_dfilter[1] <> '*ALL*' then	
		lsFilter =  'POS("'+UPPER(trim(is_dfilter[1]))+'", UPPER(subcategory)) > 0' 
		liRc = dw_primary.SetFilter (lsFilter) 
		liRc = dw_primary.Filter () 
		liRc = liRc
	ELSE
		liRc = dw_primary.SetFilter ('') 
		liRc = dw_primary.Filter () 
	end if
	
//		dw_mainlist

end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_part_edit
boolean visible = true
integer x = 2057
integer y = 1944
integer width = 201
integer textsize = -8
string facename = "Lucida Sans"
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_part_edit
integer x = 2994
integer y = 668
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_part_edit
integer x = 0
integer y = 256
integer width = 3621
integer height = 544
string dataobject = "d_parts_list"
boolean hscrollbar = true
end type

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'category_t', 'category A, subcategory A, partname A', 'category D, subcategory A, partname A')
this.inv_field_sort.of_setcolumn( 'subcategory_t', 'subcategory A, category A, partname A', 'subcategory D, category A, partname A')
this.inv_field_sort.of_setcolumn( 'partname_t', 'partname A, category A, subcategory A', 'partname D, category A, subcategory A')
this.inv_field_sort.of_setcolumn( 'price_t', 'price A, category A, subcategory A, partname A', 'price D, category A, subcategory A, partname A')
this.inv_field_sort.of_setcolumn( 'description_t', 'description A, category A, subcategory A, partname A', 'description D, category A, subcategory A, partname A')
this.inv_field_sort.of_setcolumn( 'pref_vendor_t', 'pref_vendor A, category A, subcategory A, partname A', 'pref_vendor D, category A, subcategory A, partname A')
this.inv_field_sort.of_setcolumn( 'expcategory_t', 'expcategory A, category A, subcategory A, partname A', 'expcategory D, category A, subcategory A, partname A')

this.setsort( 'category A, subcategory A, partname A')


end event

event dw_mainlist::ue_get_key_values;call super::ue_get_key_values;if al_row > 0 and al_row <= this.RowCount() then
	id_main_id 		= f_nvl(this.GetItemNumber(al_row ,'id') , 0)
	il_contactid 	= id_main_id 
	idw_vpart_sel.id_main_id_local 	= id_main_id 
	idw_vpart_avail.id_main_id_local = id_main_id 

	cb_new.visible 		= true 
	long ll_rows

	if id_main_id <= 0 then 
//		dw_answers.Reset()
		return 
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
//		dw_answers.Retrieve( il_contactid )
//		dw_contact_address.Retrieve( il_contactid )
//		dw_answers.visible 	= true 	
//		cb_ins.visible			= true
//		cb_del.visible			= true
		ll_rows = idw_vpart_sel.Retrieve( id_main_id )
		ll_rows = idw_vpart_avail.Retrieve( id_main_id )
//		ll_rows = idw_vpartdet.Retrieve( id_main_id )
		idw_vpartdet.event ue_dragdrop_refresh()
		idw_avail_vendors.event ue_dragdrop_refresh( )
		ll_rows = 0

	END IF 

	
END IF	






end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_part_edit
integer x = 718
integer y = 1944
integer width = 343
integer taborder = 20
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_close from w_vzt_base`cb_close within w_vzt_part_edit
integer x = 2263
integer y = 1944
integer width = 201
integer taborder = 50
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_part_edit
integer x = 1851
integer y = 1944
integer width = 201
integer taborder = 110
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_save from w_vzt_base`cb_save within w_vzt_part_edit
integer x = 1426
integer y = 1944
integer width = 201
integer taborder = 90
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
//	dw_answers.Retrieve( il_contactid)
END IF
end event

type cb_select from w_vzt_base`cb_select within w_vzt_part_edit
integer x = 1216
integer y = 1944
integer width = 201
integer taborder = 80
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_base`cb_new within w_vzt_part_edit
integer x = 1641
integer y = 1944
integer width = 201
integer taborder = 100
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_part_edit
integer x = 14
integer y = 1944
integer taborder = 70
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_newsearch::clicked;call super::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_part_edit
integer x = 366
integer y = 1944
integer width = 343
integer taborder = 60
integer textsize = -8
string facename = "Lucida Sans"
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_part_edit
integer x = 2930
integer y = 1940
integer width = 247
integer textsize = -8
long backcolor = 67108864
end type

type st_stop from w_vzt_base`st_stop within w_vzt_part_edit
integer x = 2697
integer y = 1944
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_part_edit
boolean visible = false
integer x = 3657
integer y = 128
integer width = 608
integer height = 164
integer taborder = 40
string dataobject = "d_parts_edit"
boolean vscrollbar = false
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'category', 'subcategory', 'expcategory', &
'partname', 'description', 'price','qty_reorder_point', 'problem_number','subproblem_number'} // 'id',

is_searchable[]	=  is_editable[]


end event

event dw_data::itemchanged;call super::itemchanged;if row <= 0 then return 

choose case dwo.name 
	CASE	"problem_number"
		this.SetItem(row,"subproblem_number","") 
		string ls_expr 
		ls_expr = 'problem_number = "' + trim(data) + '"'
		dw_sub.SetFilter (ls_expr)
		dw_sub.Filter()
	CASE	"subproblem_number"
	case else
end choose

end event

type dw_print from w_vzt_base`dw_print within w_vzt_part_edit
integer x = 3781
integer y = 424
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_part_edit
end type

type r_1 from rectangle within w_vzt_part_edit
boolean visible = false
integer linethickness = 12
long fillcolor = 8421504
integer x = 3378
integer y = 1680
integer width = 251
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_part_edit
boolean visible = false
integer x = 3035
integer y = 512
integer width = 571
integer height = 288
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_contact_address_edit"
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)
end event

type dw_sub from datawindow within w_vzt_part_edit
boolean visible = false
integer x = 3680
integer y = 552
integer width = 686
integer height = 64
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_dl_subproblem"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_vzt_part_edit
integer y = 832
integer width = 4187
integer height = 1080
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_items tabpage_items
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_items=create tabpage_items
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_items,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_items)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 4151
integer height = 968
long backcolor = 79349703
string text = "Details"
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
integer x = -18
integer y = 52
integer width = 3547
integer height = 660
integer taborder = 50
string dataobject = "d_parts_edit"
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_detail, "Part Information", true, true ) // set updateable, title and selectable

this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'category', 'subcategory', 'expcategory', &
'partname', 'description', 'price','qty_reorder_point','ptype','dept','alert_distlist_id'} // 'id',

is_searchable[]	=  is_editable[]


end event

type tabpage_items from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 96
integer width = 4151
integer height = 968
long backcolor = 79349703
string text = "Task Mapping"
long picturemaskcolor = 8388608
cb_filter cb_filter
st_2 st_2
st_1 st_1
dw_avail dw_avail
dw_sel dw_sel
end type

on tabpage_items.create
this.cb_filter=create cb_filter
this.st_2=create st_2
this.st_1=create st_1
this.dw_avail=create dw_avail
this.dw_sel=create dw_sel
this.Control[]={this.cb_filter,&
this.st_2,&
this.st_1,&
this.dw_avail,&
this.dw_sel}
end on

on tabpage_items.destroy
destroy(this.cb_filter)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_avail)
destroy(this.dw_sel)
end on

type cb_filter from commandbutton within tabpage_items
integer x = 1792
integer y = 704
integer width = 384
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Filter Tasks"
end type

event clicked;string ls_filter
//dw_avail.Filter()
setNull (ls_filter) 
dw_avail.SetFilter( ls_filter )
dw_avail.Filter()

end event

type st_2 from statictext within tabpage_items
integer x = 2359
integer y = 12
integer width = 466
integer height = 44
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Available:"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_items
integer x = 471
integer y = 12
integer width = 631
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Currently Mapped:"
boolean focusrectangle = false
end type

type dw_avail from uo_vzt_dwbase within tabpage_items
integer x = 1783
integer y = 68
integer width = 1957
integer height = 624
integer taborder = 40
string dataobject = "d_subproblem_list_avail"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= TRUE
_dropable 						= TRUE 
_drop_selected_DW 			= FALSE // selected options
_drop_available_DW 			= TRUE // available options
_selection_service 			= 'M'  
_dragdrop_auto 				= true
is_drag_src_idcol				= 'id' // 'part_id'
is_drag_trg_idcol				= 'id' // 'subproblem_number'


this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'problem_number_t', 'problem_number A, subproblem_number A', 'problem_number D, subproblem_number A')
this.inv_field_sort.of_setcolumn( 'problem_desc_t', 'problem_desc A, problem_number A, subproblem_desc A', 'problem_desc D, problem_number D, subproblem_desc A')
this.inv_field_sort.of_setcolumn( 'subproblem_number_t', 'subproblem_number A, problem_number A', 'subproblem_number D, problem_number A')
this.inv_field_sort.of_setcolumn( 'subproblem_desc_t', 'subproblem_desc A, subproblem_number A, problem_desc A, problem_number A', 'subproblem_desc D, subproblem_number D, problem_desc A, problem_number A')

this.setsort( 'problem_number A, subproblem_number A')


end event

event ue_dragdrop_avl_drop_sql;call super::ue_dragdrop_avl_drop_sql;if al_source_row <= 0 then return 
string ls_problem_number, ls_subproblem_number
integer ll_part_id

ll_part_id				= idw_vpart_sel.GetItemNumber( al_source_row, 'part_id')
ls_problem_number		= idw_vpart_sel.GetItemString( al_source_row, 'problem_number')
ls_subproblem_number	= idw_vpart_sel.GetItemString( al_source_row, 'subproblem_number')

DELETE FROM vzt_part_task_map 
		WHERE part_id 				= :ll_part_id	AND
				problem_number		= :ls_problem_number	AND		
				subproblem_number	= :ls_subproblem_number	
		;


				
end event

event constructor_post;call super::constructor_post;is_drag_src_do	= idw_vpart_sel.dataobject //'d_parts_list_vavail'
idw_vpart_sel._dw_droptarget 	= this


end event

type dw_sel from uo_vzt_dwbase within tabpage_items
integer x = 5
integer y = 68
integer width = 1769
integer height = 624
integer taborder = 30
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

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 4151
integer height = 968
long backcolor = 67108864
string text = "Suppliers"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
dw_avail_vendors dw_avail_vendors
dw_vpartdet dw_vpartdet
end type

on tabpage_2.create
this.cb_1=create cb_1
this.dw_avail_vendors=create dw_avail_vendors
this.dw_vpartdet=create dw_vpartdet
this.Control[]={this.cb_1,&
this.dw_avail_vendors,&
this.dw_vpartdet}
end on

on tabpage_2.destroy
destroy(this.cb_1)
destroy(this.dw_avail_vendors)
destroy(this.dw_vpartdet)
end on

type cb_1 from commandbutton within tabpage_2
integer x = 2830
integer y = 872
integer width = 375
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filter Vendor"
end type

event clicked;string ls_filter
 
setNull (ls_filter) 
dw_avail_vendors.SetFilter( ls_filter )
dw_avail_vendors.Filter()

end event

type dw_avail_vendors from uo_vzt_dwbase within tabpage_2
integer x = 2830
integer y = 8
integer width = 1317
integer height = 860
integer taborder = 50
string dataobject = "d_vendor_list_avail"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= true
_dropable 						= false
_dragdrop_auto 				= true  // built in d-d 
_drop_selected_DW 			= false // selected options
_drop_available_DW 			= true  // available options
_dw_droptarget					= dw_vpartdet

_selection_service = 'M'  
is_drag_src_idcol				= 'id'
is_drag_trg_idcol				= 'vendor_id'

end event

event ue_dragdrop_refresh;call super::ue_dragdrop_refresh;idw_avail_vendors.Retrieve( id_main_id )
		
end event

type dw_vpartdet from uo_vzt_dwbase within tabpage_2
integer x = -18
integer y = 8
integer width = 2830
integer height = 864
integer taborder = 40
string title = " "
string dataobject = "d_part_vendors"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_vpartdet, "vendor item detail edit", true, true  ) // set updateable, title and selectable

is_editable[]	= {"pref_order", "vendor_sku", "unit", &
"unit_qty", "qty_to_reorder", "price", "bid_date", "rebid_date", &
"usage", "autotask" }
//is_searchable[]	= is_editable[]	
_selection_service = 'S'  

_dragable 						= false
_dropable 						= true
_dragdrop_auto 				= true  // built in d-d 
_drop_selected_DW 			= true // selected options
_drop_available_DW 			= true  // available options
is_drag_src_do					= 'd_vendor_list_avail'
_dw_dropsource 				= dw_avail_vendors
is_drag_src_idcol				= 'id'
is_drag_trg_idcol				= 'vendor_id'
_dclick_prompt					= true 
is_rec_name						= 'Vendor Part' 

this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'firstname_t', 'firstname A, vendor_sku A', 'firstname D, vendor_sku A')
this.inv_field_sort.of_setcolumn( 'pref_order_t','pref_order A, firstname A, vendor_sku A', 'pref_order D, firstname A, vendor_sku A')
this.inv_field_sort.of_setcolumn( 'vendor_sku_t','vendor_sku A, pref_order A, firstname A', 'vendor_sku D, pref_order A, firstname A')
this.inv_field_sort.of_setcolumn( 'price_t','price A, pref_order A, firstname A, vendor_sku A', 'price D, pref_order A, firstname A, vendor_sku A')

end event

event ue_dragdrop_sel_drop_sql;call super::ue_dragdrop_sel_drop_sql;// drop insert sql
int li_pref_order
SELECT MAX(pref_order)+1 INTO :li_pref_order from vzt_vendor_part 
	where part_id = :id_main_id ;
	
INSERT INTO vzt_vendor_part
		(vendor_id, part_id, pref_order) 
		VALUES ( :id_source_id, :id_main_id, :li_pref_order) ;

		
end event

event ue_dragdrop_refresh;	//overr
	idw_vpartdet.Retrieve( id_main_id )
	
end event

event ue_dragdrop_sel_drop_commit;//overr
if this.UpDATE(true, true) = 1 then
	commit;
ELSE
	rollback;
END IF	
end event

type p_1 from picture within w_vzt_part_edit
integer y = 28
integer width = 1317
integer height = 212
boolean bringtotop = true
boolean originalsize = true
string picturename = "Service & Supplies.bmp"
boolean focusrectangle = false
end type

