$PBExportHeader$w_vzt_form_person_edit.srw
forward
global type w_vzt_form_person_edit from w_vzt_person_edit
end type
type tab_1 from tab within w_vzt_form_person_edit
end type
type tabpage_1 from userobject within tab_1
end type
type dw_client from uo_vzt_dwbase within tabpage_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_relations from uo_vzt_dwbase within tabpage_2
end type
type tabpage_5 from userobject within tab_1
end type
type dw_spouses from uo_vzt_dwbase within tabpage_5
end type
type tabpage_3 from userobject within tab_1
end type
type dw_addresses from uo_vzt_dwbase within tabpage_3
end type
type tabpage_4 from userobject within tab_1
end type
type dw_jobs from uo_vzt_dwbase within tabpage_4
end type
type tabpage_6 from userobject within tab_1
end type
type dw_forms from uo_vzt_dwbase within tabpage_6
end type
type dw_preview from uo_vzt_dwbase within tabpage_6
end type
type cb_1 from commandbutton within tabpage_6
end type
type uo_1 from uo_zoom_slide within tabpage_6
end type
type tabpage_1 from userobject within tab_1
dw_client dw_client
end type
type tabpage_2 from userobject within tab_1
dw_relations dw_relations
end type
type tabpage_5 from userobject within tab_1
dw_spouses dw_spouses
end type
type tabpage_3 from userobject within tab_1
dw_addresses dw_addresses
end type
type tabpage_4 from userobject within tab_1
dw_jobs dw_jobs
end type
type tabpage_6 from userobject within tab_1
dw_forms dw_forms
dw_preview dw_preview
cb_1 cb_1
uo_1 uo_1
end type
type tab_1 from tab within w_vzt_form_person_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_5 tabpage_5
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_6 tabpage_6
end type
end forward

global type w_vzt_form_person_edit from w_vzt_person_edit
int Width=3502
int Height=1996
boolean TitleBar=true
string Title="Maintain Clients"
long BackColor=79349703
boolean Resizable=true
tab_1 tab_1
end type
global w_vzt_form_person_edit w_vzt_form_person_edit

type variables
uo_vzt_dwbase	idw_addresses, idw_relations, idw_main
uo_vzt_dwbase	idw_spouses, idw_jobs, idw_forms
uo_vzt_dwbase	idw_preview
end variables

on w_vzt_form_person_edit.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_vzt_form_person_edit.destroy
call super::destroy
destroy(this.tab_1)
end on

event open;call super::open;//this.ib_autoscroll=false
ib_do_required = true

idw_addresses	= tab_1.tabpage_3.dw_addresses
idw_relations	= tab_1.tabpage_2.dw_relations
idw_main			= tab_1.tabpage_1.dw_client
idw_spouses		= tab_1.tabpage_5.dw_spouses
idw_jobs			= tab_1.tabpage_4.dw_jobs
idw_forms 		= tab_1.tabpage_6.dw_forms
idw_PREVIEW 	= tab_1.tabpage_6.dw_PREVIEW

ib_setrowonscroll = true 
//super::event open()

dw_primary 			= idw_main			
it_main_tab 		= tab_1
dw_primary_list 	= dw_mainlist

cb_newsearch.event clicked()
cb_search.event clicked()

idw_forms.Retrieve()
ib_resizeenabled = true
end event

event resize;//overr
if ib_resizeenabled then 
	if sizetype <> 1 then 

		r_1.y 			= newheight - ii_resizeband_y - r_1.height + 7
		
		cb_new.y 		= newheight - 2 * ii_resizeband_y - cb_new.height
		cb_newsearch.y = newheight - 2 * ii_resizeband_y - cb_newsearch.height
		cb_save.y 		= newheight - 2 * ii_resizeband_y - cb_save.height
		cb_search.y 	= newheight - 2 * ii_resizeband_y - cb_search.height
		cb_select.y 	= newheight - 2 * ii_resizeband_y - cb_select.height
		cb_delete1.y 	= newheight - 2 * ii_resizeband_y - cb_delete1.height		
		cb_close.y 		= newheight - 2 * ii_resizeband_y - cb_close.height		
		st_stop.y		= newheight - 2 * ii_resizeband_y - st_stop.height
		cb_last_search.y=newheight - 2 * ii_resizeband_y - cb_last_search.height
		st_foundrecs.y	= newheight - 2 * ii_resizeband_y - st_foundrecs.height		
		
		tab_1.height 	= r_1.y - tab_1.y - ii_resizeband_y 
		tab_1.width  	= newwidth  - tab_1.x -  ii_resizeband_x 
		
		idw_preview.width  = tab_1.width - idw_preview.x - ii_resizeband_x 
		idw_preview.height = tab_1.tabpage_6.height - idw_preview.y - ii_resizeband_y

//		dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
//		dw_primary.width	= newwidth  - dw_primary.x * 2 

		
	
	End IF 
End IF 	
end event

event ue_retrieve_links;idw_addresses.Retrieve( ii_person_id )
idw_relations.Retrieve( ii_person_id )
idw_spouses.Retrieve( ii_person_id )
idw_jobs.Retrieve( ii_person_id )

idw_spouses.modifyedit ("R" ) 
idw_addresses.modifyedit ("R" ) 
idw_relations.modifyedit ("R" ) 
idw_jobs.modifyedit ("R" ) 

idw_preview.reset()

end event

type dw_mainlist from w_vzt_person_edit`dw_mainlist within w_vzt_form_person_edit
int Width=3003
int Height=312
string DataObject="d_client_list"
end type

event dw_mainlist::ue_rowselected;If row > 0 then 
	

//	idw_main.Retrieve( ii_person_id )
END IF 

return 1
end event

event dw_mainlist::ue_get_key_values;if this.GEtRow() > 0 then ii_person_id = dw_mainlist.GetItemNumber ( this.GEtRow(), 'id')


end event

type cb_last_search from w_vzt_person_edit`cb_last_search within w_vzt_form_person_edit
int Y=1788
int TabOrder=20
end type

type cb_close from w_vzt_person_edit`cb_close within w_vzt_form_person_edit
int Y=1788
int TabOrder=50
end type

type cb_delete1 from w_vzt_person_edit`cb_delete1 within w_vzt_form_person_edit
int Y=1788
int TabOrder=110
end type

type cb_save from w_vzt_person_edit`cb_save within w_vzt_form_person_edit
int Y=1788
int TabOrder=90
end type

type cb_select from w_vzt_person_edit`cb_select within w_vzt_form_person_edit
int Y=1788
int TabOrder=80
end type

type cb_new from w_vzt_person_edit`cb_new within w_vzt_form_person_edit
int Y=1788
int TabOrder=100
end type

type cb_newsearch from w_vzt_person_edit`cb_newsearch within w_vzt_form_person_edit
int Y=1788
int TabOrder=70
end type

type cb_search from w_vzt_person_edit`cb_search within w_vzt_form_person_edit
int Y=1788
int TabOrder=60
end type

type st_foundrecs from w_vzt_person_edit`st_foundrecs within w_vzt_form_person_edit
int Y=1788
boolean BringToTop=true
end type

type st_stop from w_vzt_person_edit`st_stop within w_vzt_form_person_edit
int Y=1788
boolean BringToTop=true
end type

type dw_data from w_vzt_person_edit`dw_data within w_vzt_form_person_edit
int X=2784
int Y=1428
int Width=521
int Height=160
int TabOrder=40
boolean Visible=false
boolean Enabled=false
string DataObject="d_client_edit"
end type

type dw_print from w_vzt_person_edit`dw_print within w_vzt_form_person_edit
int Y=1772
int TabOrder=120
boolean BringToTop=true
end type

type r_1 from w_vzt_person_edit`r_1 within w_vzt_form_person_edit
int Y=1768
end type

type tab_1 from tab within w_vzt_form_person_edit
int X=9
int Y=332
int Width=3429
int Height=1428
int TabOrder=30
boolean BringToTop=true
boolean RaggedRight=true
int SelectedTab=1
long BackColor=80269528
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_5 tabpage_5
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_6 tabpage_6
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_5=create tabpage_5
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_6=create tabpage_6
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_5,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_6}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_5)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_6)
end on

event selectionchanged;
//CHOOSE CASE newindex
//	CASE 6
//
//END CHOOSE
//
//
end event

type tabpage_1 from userobject within tab_1
int X=18
int Y=108
int Width=3392
int Height=1304
long BackColor=80269528
string Text="General"
long TabBackColor=80269528
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_client dw_client
end type

on tabpage_1.create
this.dw_client=create dw_client
this.Control[]={this.dw_client}
end on

on tabpage_1.destroy
destroy(this.dw_client)
end on

type dw_client from uo_vzt_dwbase within tabpage_1
int X=32
int Y=0
int Width=3360
int Height=1296
int TabOrder=20
boolean BringToTop=true
string DataObject="d_client_edit"
end type

event constructor;call super::constructor;//_dragable 					= true
//_drop_available_DW 		= true // available options
//_selection_service 		= 'S'

//_ResetDataObjectOnSelect 	= true
is_editable[]	= { & 
'last_name','middle_init','first_name',  & 
 'phone', 'addr1', &
'addr2','city','state','zip','country',  'email', &
'country_orig',  &
'city_orig',  	&
'sex',  			&
'birthdate',  	&
'nationality', & 
'file_number', &
'ssn',  			&	
'marital_status', & 
'occupation',  &
'last_occupation_abroad', & 
'last_name_native',  &
'first_name_native',  &
'middle_name_native' &
}

//is_protected[]	={''}
//is_restricted[]	={''}

is_required[]		={  &
'country_orig',  	&
'city_orig',  		&
'sex',  				&
'birthdate',  		&
'nationality',  	&
'file_number',  	&
'ssn',  				&
'marital_status', &
'occupation'	  	&
}

is_searchable[]	= is_editable[]	

wf_setupdateable ( dw_client, "Client info", true, true  ) // set updateable, title and selectable

end event

event scrollvertical;if ib_setrowonscroll then
	string ls_row
	ls_row = this.Describe("DataWindow.FirstRowOnPage")
	st_foundrecs.Text = ls_row + " of " + string(this.rowCount())
	this.setrow( long(ls_row))
	iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list)

END IF
end event

type tabpage_2 from userobject within tab_1
int X=18
int Y=108
int Width=3392
int Height=1304
long BackColor=80269528
string Text="Parents And Children"
long TabBackColor=80269528
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_relations dw_relations
end type

on tabpage_2.create
this.dw_relations=create dw_relations
this.Control[]={this.dw_relations}
end on

on tabpage_2.destroy
destroy(this.dw_relations)
end on

type dw_relations from uo_vzt_dwbase within tabpage_2
int X=0
int Y=12
int Width=2711
int Height=848
int TabOrder=20
boolean BringToTop=true
string DataObject="d_client_relations_edit"
boolean HScrollBar=true
boolean VScrollBar=true
end type

event constructor;call super::constructor;wf_setupdateable ( dw_relations, "parents and children info", true, true  ) // set updateable, title and selectable

is_editable[]	= {'relation_type'}

end event

type tabpage_5 from userobject within tab_1
int X=18
int Y=108
int Width=3392
int Height=1304
long BackColor=80269528
string Text="Wives And Husbands"
long TabBackColor=80269528
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_spouses dw_spouses
end type

on tabpage_5.create
this.dw_spouses=create dw_spouses
this.Control[]={this.dw_spouses}
end on

on tabpage_5.destroy
destroy(this.dw_spouses)
end on

type dw_spouses from uo_vzt_dwbase within tabpage_5
int X=0
int Y=12
int Width=2720
int Height=848
int TabOrder=30
boolean BringToTop=true
string DataObject="d_client_relations_edit_spouse"
boolean HScrollBar=true
boolean VScrollBar=true
end type

event constructor;call super::constructor;_set_bg_opaque_on_search = false
wf_setupdateable ( dw_spouses, "spouse info", true, true  ) // set updateable, title and selectable
is_editable[]	= {'date_from', 'date_to', 'place_start', 'place_end', 'city_start', 'city_end', 'country_start', 'country_end'}

end event

type tabpage_3 from userobject within tab_1
int X=18
int Y=108
int Width=3392
int Height=1304
long BackColor=80269528
string Text="Residence History"
long TabBackColor=80269528
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_addresses dw_addresses
end type

on tabpage_3.create
this.dw_addresses=create dw_addresses
this.Control[]={this.dw_addresses}
end on

on tabpage_3.destroy
destroy(this.dw_addresses)
end on

type dw_addresses from uo_vzt_dwbase within tabpage_3
int X=0
int Y=12
int Width=3374
int Height=848
int TabOrder=30
boolean BringToTop=true
string DataObject="d_person_address_edit"
boolean VScrollBar=true
end type

event constructor;call super::constructor;_set_bg_opaque_on_search = false
wf_setupdateable ( dw_addresses, "Residence History", true, true  ) // set updateable, title and selectable
is_editable[]	= {'from_date', 'to_date', 'addr_type', 'addr1', 'addr2', 'city', 'state', 'zip', 'country' }

end event

type tabpage_4 from userobject within tab_1
int X=18
int Y=108
int Width=3392
int Height=1304
long BackColor=80269528
string Text="Employment History"
long TabBackColor=80269528
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_jobs dw_jobs
end type

on tabpage_4.create
this.dw_jobs=create dw_jobs
this.Control[]={this.dw_jobs}
end on

on tabpage_4.destroy
destroy(this.dw_jobs)
end on

type dw_jobs from uo_vzt_dwbase within tabpage_4
int X=0
int Y=12
int Width=3374
int Height=848
int TabOrder=30
boolean BringToTop=true
string DataObject="d_person_address_edit"
boolean HScrollBar=true
boolean VScrollBar=true
end type

event constructor;call super::constructor;//_selection_service = 'S'  
_set_bg_opaque_on_search = false
wf_setupdateable ( dw_jobs, "Employment History", true, true  ) // set updateable, title and selectable
is_editable[]	= {'from_date', 'to_date', 'addr_type', 'addr1', 'addr2', 'city', 'state', 'zip', 'country' }

end event

type tabpage_6 from userobject within tab_1
int X=18
int Y=108
int Width=3392
int Height=1304
long BackColor=79349703
string Text="Forms"
long TabBackColor=79349703
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_forms dw_forms
dw_preview dw_preview
cb_1 cb_1
uo_1 uo_1
end type

on tabpage_6.create
this.dw_forms=create dw_forms
this.dw_preview=create dw_preview
this.cb_1=create cb_1
this.uo_1=create uo_1
this.Control[]={this.dw_forms,&
this.dw_preview,&
this.cb_1,&
this.uo_1}
end on

on tabpage_6.destroy
destroy(this.dw_forms)
destroy(this.dw_preview)
destroy(this.cb_1)
destroy(this.uo_1)
end on

type dw_forms from uo_vzt_dwbase within tabpage_6
int X=0
int Y=8
int Width=736
int Height=436
int TabOrder=30
boolean BringToTop=true
string DataObject="d_forms_list"
boolean VScrollBar=true
end type

event constructor;call super::constructor;//_dragable 						= true
_dropable 						= false
//_drop_available_DW 			= true // available options
_selection_service = 'M'  
end event

event clicked;call super::clicked;if row > 0 then
	string ls_dw
	ls_dw = this.getitemstring( row, 'dwdataobjectname') 
	dw_preview.dataobject = ls_dw
	dw_preview.Reset()
	dw_preview.insertrow(0)
	long ll_row
	//If idw_main.RowCOunt() <> 1 then return
	ll_row = idw_main.GetRow() 
	dw_preview.object.lname [1]	= idw_main.object.last_name [ll_row]
	dw_preview.object.fname [1] 	= idw_main.object.first_name [ll_row]
	dw_preview.object.mname [1] 	= idw_main.object.middle_init [ll_row]
	dw_preview.object.dob [1] 		= idw_main.object.birthdate [ll_row]
	dw_preview.object.sex [1] 		= idw_main.object.sex [ll_row]
	dw_preview.object.nationality [1] = idw_main.object.nationality [ll_row]
	dw_preview.object.city_orig [1] 	= trim(idw_main.object.city_orig [ll_row]) + ', '+ trim(idw_main.object.country_orig [ll_row])
	dw_preview.object.filenumber [1] = idw_main.object.file_number [ll_row]
	dw_preview.object.ssn [1] 			= idw_main.object.ssn [ll_row] 
	dw_preview.object.last_occupation_abroad [1] = idw_main.object.last_occupation_abroad [ll_row]
	dw_preview.object.last_name_native [1] = idw_main.object.last_name_native [ll_row]
	dw_preview.object.first_name_native [1] = idw_main.object.first_name_native [ll_row]
	dw_preview.object.middle_name_native [1] = idw_main.object.middle_name_native [ll_row]
	dw_preview.object.pdate [1] 			= today()
	
	// current spouse if any
	if idw_spouses.RowCount() > 0 then
		dw_preview.object.spouse_fname [1] 	= idw_spouses.object.vzt_person_first_name [1]
		dw_preview.object.spouse_lname [1] 	= idw_spouses.object.vzt_person_last_name [1]
		dw_preview.object.spouse_birth_city [1] 	= idw_spouses.object.vzt_person_city_orig [1]
		dw_preview.object.spouse_birthdate [1] 	= idw_spouses.object.vzt_person_birthdate [1]
		dw_preview.object.spouse_birth_country [1] = idw_spouses.object.vzt_person_country_orig [1]
		dw_preview.object.spouse_marriage_date [1] = idw_spouses.object.date_from [1]
		dw_preview.object.spouse_marriage_city [1] = idw_spouses.object.city_start [1]
		dw_preview.object.spouse_marriage_country [1] = idw_spouses.object.country_start [1]
	end if
	// ex - spouses
	if idw_spouses.RowCount() > 1 then
		long ll_hrow
		ll_hrow = 2
		dw_preview.object.spouse_fname [1] 				= idw_spouses.object.vzt_person_first_name [ll_hrow]
		dw_preview.object.spouse_lname [1] 				= idw_spouses.object.vzt_person_last_name [ll_hrow]
		dw_preview.object.spouse_birth_city [1] 		= idw_spouses.object.vzt_person_city_orig [ll_hrow]
		dw_preview.object.spouse_birthdate [1] 		= idw_spouses.object.vzt_person_birthdate [ll_hrow]
		dw_preview.object.spouse_birth_country [1] 	= idw_spouses.object.vzt_person_country_orig [ll_hrow]
		dw_preview.object.spouse_marriage_date [1] 	= idw_spouses.object.date_from [ll_hrow]
		dw_preview.object.spouse_marriage_city [1] 	= idw_spouses.object.city_start [ll_hrow]
		dw_preview.object.spouse_marriage_country [1]= idw_spouses.object.country_start [ll_hrow]
	end if
	if idw_spouses.RowCount() > 2 then
		ll_hrow = 3
		dw_preview.object.spouse_fname [1] 				= idw_spouses.object.vzt_person_first_name [ll_hrow]
		dw_preview.object.spouse_lname [1] 				= idw_spouses.object.vzt_person_last_name [ll_hrow]
		dw_preview.object.spouse_birth_city [1] 		= idw_spouses.object.vzt_person_city_orig [ll_hrow]
		dw_preview.object.spouse_birthdate [1] 		= idw_spouses.object.vzt_person_birthdate [ll_hrow]
		dw_preview.object.spouse_birth_country [1] 	= idw_spouses.object.vzt_person_country_orig [ll_hrow]
		dw_preview.object.spouse_marriage_date [1] 	= idw_spouses.object.date_from [ll_hrow]
		dw_preview.object.spouse_marriage_city [1] 	= idw_spouses.object.city_start [ll_hrow]
		dw_preview.object.spouse_marriage_country [1]= idw_spouses.object.country_start [ll_hrow]
	end if

end if 
end event

type dw_preview from uo_vzt_dwbase within tabpage_6
int X=745
int Y=8
int Width=2629
int Height=900
int TabOrder=30
boolean BringToTop=true
string DataObject="d_forms_list"
boolean HScrollBar=true
boolean VScrollBar=true
end type

event constructor;call super::constructor;//_dragable 						= true
_dropable 						= false
//_drop_available_DW 			= true // available options

end event

type cb_1 from commandbutton within tabpage_6
int X=9
int Y=464
int Width=727
int Height=76
int TabOrder=40
boolean BringToTop=true
string Text="print form"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_preview.print()
end event

type uo_1 from uo_zoom_slide within tabpage_6
int X=9
int Y=552
int Width=521
int TabOrder=50
boolean BringToTop=true
long BackColor=79349703
end type

event constructor;call super::constructor;// modify in the descendant as desired 

//ii_line 	= 10				// line increment
//ii_page	= 20				// page increment
//ii_max		= 300				// max zoom
//ii_min		= 10 				// min zoom
//
dw_target = dw_preview 	// target dw
hsb_zoom.maxposition = ii_max		
hsb_zoom.minposition = ii_min 

end event

on uo_1.destroy
call uo_zoom_slide::destroy
end on

