$PBExportHeader$w_vzt_guest_edit.srw
forward
global type w_vzt_guest_edit from w_vzt_person_edit
end type
type tab_1 from tab within w_vzt_guest_edit
end type
type tabpage_1 from userobject within tab_1
end type
type dw_guest from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_guest dw_guest
end type
type tabpage_2 from userobject within tab_1
end type
type dw_stay from uo_vzt_dwbase within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_stay dw_stay
end type
type tabpage_3 from userobject within tab_1
end type
type dw_gcc from uo_vzt_dwbase within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_gcc dw_gcc
end type
type tabpage_4 from userobject within tab_1
end type
type dw_calls from uo_vzt_dwbase within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_calls dw_calls
end type
type tabpage_5 from userobject within tab_1
end type
type cb_ins from commandbutton within tabpage_5
end type
type cb_del from commandbutton within tabpage_5
end type
type dw_addr from uo_vzt_dwbase within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_ins cb_ins
cb_del cb_del
dw_addr dw_addr
end type
type tabpage_6 from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_6
end type
type cb_3 from commandbutton within tabpage_6
end type
type dw_cont_addr from uo_vzt_dwbase within tabpage_6
end type
type cb_2 from commandbutton within tabpage_6
end type
type cb_1 from commandbutton within tabpage_6
end type
type dw_contacts from uo_vzt_dwbase within tabpage_6
end type
type tabpage_6 from userobject within tab_1
cb_5 cb_5
cb_3 cb_3
dw_cont_addr dw_cont_addr
cb_2 cb_2
cb_1 cb_1
dw_contacts dw_contacts
end type
type tabpage_7 from userobject within tab_1
end type
type cb_getfile from commandbutton within tabpage_7
end type
type cb_oleedit from commandbutton within tabpage_7
end type
type cb_6 from commandbutton within tabpage_7
end type
type cb_4 from commandbutton within tabpage_7
end type
type ole_1 from uo_vzt_oledoc_base within tabpage_7
end type
type dw_docs from uo_vzt_dwbase within tabpage_7
end type
type tabpage_7 from userobject within tab_1
cb_getfile cb_getfile
cb_oleedit cb_oleedit
cb_6 cb_6
cb_4 cb_4
ole_1 ole_1
dw_docs dw_docs
end type
type tabpage_8 from userobject within tab_1
end type
type cb_16 from commandbutton within tabpage_8
end type
type cb_15 from commandbutton within tabpage_8
end type
type dw_prefs from uo_vzt_dwbase within tabpage_8
end type
type tabpage_8 from userobject within tab_1
cb_16 cb_16
cb_15 cb_15
dw_prefs dw_prefs
end type
type tabpage_9 from userobject within tab_1
end type
type cb_8 from commandbutton within tabpage_9
end type
type cb_7 from commandbutton within tabpage_9
end type
type dw_pets from uo_vzt_dwbase within tabpage_9
end type
type tabpage_9 from userobject within tab_1
cb_8 cb_8
cb_7 cb_7
dw_pets dw_pets
end type
type tabpage_10 from userobject within tab_1
end type
type cb_10 from commandbutton within tabpage_10
end type
type cb_9 from commandbutton within tabpage_10
end type
type dw_cars from uo_vzt_dwbase within tabpage_10
end type
type tabpage_10 from userobject within tab_1
cb_10 cb_10
cb_9 cb_9
dw_cars dw_cars
end type
type tabpage_11 from userobject within tab_1
end type
type cb_14 from commandbutton within tabpage_11
end type
type cb_13 from commandbutton within tabpage_11
end type
type cb_12 from commandbutton within tabpage_11
end type
type cb_11 from commandbutton within tabpage_11
end type
type dw_cont_addr_e from uo_vzt_dwbase within tabpage_11
end type
type dw_contacts_e from uo_vzt_dwbase within tabpage_11
end type
type tabpage_11 from userobject within tab_1
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
dw_cont_addr_e dw_cont_addr_e
dw_contacts_e dw_contacts_e
end type
type tabpage_12 from userobject within tab_1
end type
type dw_dates from uo_vzt_dwbase within tabpage_12
end type
type tabpage_12 from userobject within tab_1
dw_dates dw_dates
end type
type tab_1 from tab within w_vzt_guest_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
tabpage_8 tabpage_8
tabpage_9 tabpage_9
tabpage_10 tabpage_10
tabpage_11 tabpage_11
tabpage_12 tabpage_12
end type
type dw_subtask from uo_vzt_dwbase within w_vzt_guest_edit
end type
type cb_arr from commandbutton within w_vzt_guest_edit
end type
type p_1 from picture within w_vzt_guest_edit
end type
type p_2 from picture within w_vzt_guest_edit
end type
type cb_checkin from commandbutton within w_vzt_guest_edit
end type
type cb_checkout from commandbutton within w_vzt_guest_edit
end type
type cbx_profile from checkbox within w_vzt_guest_edit
end type
end forward

global type w_vzt_guest_edit from w_vzt_person_edit
integer width = 5920
integer height = 2428
string title = "Maintain Guests"
boolean resizable = true
long backcolor = 79349703
event ue_filter_subtask ( long al_row )
tab_1 tab_1
dw_subtask dw_subtask
cb_arr cb_arr
p_1 p_1
p_2 p_2
cb_checkin cb_checkin
cb_checkout cb_checkout
cbx_profile cbx_profile
end type
global w_vzt_guest_edit w_vzt_guest_edit

type variables
uo_vzt_dwbase	idw_guest, idw_stay, idw_calls, idw_gcc
uo_vzt_dwbase	idw_addresses, idw_contacts, idw_contaddr 
uo_vzt_dwbase	idw_docs, idw_prefs, idw_pets, idw_cars
uo_vzt_dwbase	idw_contaddr_e, idw_contacts_e, idw_dates
double			id_guest_contact_id , id_auth_contact_id
double			id_doc_id, id_oleid, id_survey_id, id_gcc_id
double			id_emer_contact_id
str_dts_call	istr_parms
datetime			idt_ansdate

end variables

event ue_filter_subtask(long al_row);
if al_row <= 0 or al_row > idw_prefs.rowcount() then return 
string ls_task
ls_task = f_nvl(trim(idw_prefs.GetItemString(al_row, "problem_number")),'')
if ls_task = '' then return

//dw_subtask.SetFilter( "problem_number = '" +ls_task + "'")
//dw_subtask.Filter()
end event

on w_vzt_guest_edit.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.dw_subtask=create dw_subtask
this.cb_arr=create cb_arr
this.p_1=create p_1
this.p_2=create p_2
this.cb_checkin=create cb_checkin
this.cb_checkout=create cb_checkout
this.cbx_profile=create cbx_profile
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.dw_subtask
this.Control[iCurrent+3]=this.cb_arr
this.Control[iCurrent+4]=this.p_1
this.Control[iCurrent+5]=this.p_2
this.Control[iCurrent+6]=this.cb_checkin
this.Control[iCurrent+7]=this.cb_checkout
this.Control[iCurrent+8]=this.cbx_profile
end on

on w_vzt_guest_edit.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.dw_subtask)
destroy(this.cb_arr)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.cb_checkin)
destroy(this.cb_checkout)
destroy(this.cbx_profile)
end on

event open;call super::open;//this.ib_autoscroll=false
ib_do_required = true

idw_guest		= tab_1.tabpage_1.dw_guest
idw_stay			= tab_1.tabpage_2.dw_stay
idw_gcc			= tab_1.tabpage_3.dw_gcc
idw_calls		= tab_1.tabpage_4.dw_calls
idw_addresses 	= tab_1.tabpage_5.dw_addr 
idw_contacts 	= tab_1.tabpage_6.dw_contacts 
idw_contaddr 	= tab_1.tabpage_6.dw_cont_addr 
idw_docs		 	= tab_1.tabpage_7.dw_docs
idw_prefs		= tab_1.tabpage_8.dw_prefs
idw_pets	 		= tab_1.tabpage_9.dw_pets
idw_cars			= tab_1.tabpage_10.dw_cars

idw_contacts_e	= tab_1.tabpage_11.dw_contacts_e 
idw_contaddr_e	= tab_1.tabpage_11.dw_cont_addr_e

idw_dates		= tab_1.tabpage_12.dw_dates


gnv_appman.uf_share( idw_prefs, 'subkey', dw_subtask )


ib_setrowonscroll = true 
//super::event open()

dw_primary 			= idw_guest 			
it_main_tab 		= tab_1
dw_primary_list 	= dw_mainlist

cb_newsearch.event clicked()
//cb_search.event clicked()

ib_resizeenabled = true

gnv_appman.uf_start_mail()

if gnv_appman.is_debugmode = 'Y' then
 cb_arr.visible = true 
end if 

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
		
		cb_arr.y			= newheight - 2 * ii_resizeband_y - cb_arr.height	
		cb_checkin.y	= newheight - 2 * ii_resizeband_y - cb_checkin.height	
		cb_checkout.y	= newheight - 2 * ii_resizeband_y - cb_checkout.height	
		
		cbx_profile.y  = cb_arr.y
		
		tab_1.height 	= r_1.y - tab_1.y - ii_resizeband_y 
		tab_1.width  	= newwidth  - tab_1.x -  ii_resizeband_x 
		
		dw_mainlist.width  = tab_1.width - dw_mainlist.x - ii_resizeband_x 
//		idw_preview.height = tab_1.tabpage_6.height - idw_preview.y - ii_resizeband_y

//		dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
//		dw_primary.width	= newwidth  - dw_primary.x * 2 
		
		idw_guest.width = tab_1.width - 2*idw_guest.x - ii_resizeband_x 

		idw_stay.x 			= idw_guest.x
		idw_stay.y 			= idw_guest.y
		idw_stay.height 	= idw_guest.height 
		idw_stay.width 	= idw_guest.width 
		
		idw_gcc.x 			= idw_guest.x
		idw_gcc.y 			= idw_guest.y
		idw_gcc.height 	= idw_guest.height 
		idw_gcc.width 		= idw_guest.width 
		
		idw_calls.x 		= idw_guest.x
		idw_calls.y 		= idw_guest.y
		idw_calls.height 	= idw_guest.height 
		idw_calls.width 	= idw_guest.width 
		
	End IF 
End IF 	
end event

event ue_retrieve_links;long ll_rows

ll_rows = idw_stay.Retrieve( ii_person_id )
ll_rows = idw_calls.Retrieve( ii_person_id )
ll_rows = idw_gcc.Retrieve( ii_person_id ) 

ll_rows = idw_addresses.Retrieve( id_guest_contact_id ) 
ll_rows = idw_contacts.Retrieve( id_guest_contact_id, 'RELATIVE' ) 
//idw_contaddr.Retrieve( id_guest_contact_id )  	
ll_rows = idw_docs.Retrieve( id_guest_contact_id ) 
ll_rows = idw_pets.Retrieve( id_guest_contact_id ) 

ll_rows = idw_prefs.Retrieve( id_guest_contact_id ) 

ll_rows = idw_cars.Retrieve( id_guest_contact_id )
ll_rows = idw_contacts_E.Retrieve( id_guest_contact_id, 'EMERGENCY' ) 
ll_rows = idw_dates.Retrieve( id_guest_contact_id )


idw_stay.modifyedit ("R" ) 
idw_calls.modifyedit ("R" ) 
idw_gcc.modifyedit ("R" ) 
end event

type cb_dfilter from w_vzt_person_edit`cb_dfilter within w_vzt_guest_edit
end type

type uo_trace01 from w_vzt_person_edit`uo_trace01 within w_vzt_guest_edit
end type

type dw_mainlist from w_vzt_person_edit`dw_mainlist within w_vzt_guest_edit
integer x = 0
integer y = 224
integer width = 5266
integer height = 480
string dataobject = "d_guest_list"
boolean hscrollbar = true
end type

event dw_mainlist::ue_rowselected;If row > 0 then 
	

//	idw_main.Retrieve( ii_person_id )
END IF 

return 1
end event

event dw_mainlist::ue_get_key_values;if this.GEtRow() > 0 then 
	ii_person_id 			= dw_mainlist.GetItemNumber ( this.GEtRow(), 'id')
	id_guest_contact_id 	= dw_mainlist.GetItemNumber ( this.GEtRow(), 'contact_id')
	
end if

end event

event dw_mainlist::constructor;// when shared - the columns are from primary dw !!!! 
this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'first_name_t', 'guest_first_name A, guest_last_name A', 'guest_first_name D, guest_last_name D')
this.inv_field_sort.of_setcolumn( 'last_name_t'	, 'guest_last_name A, guest_first_name A', 'guest_last_name D, guest_first_name D')
this.inv_field_sort.of_setcolumn( 'prefix_t'		, 'guest_prefix A, guest_last_name A, guest_first_name A', 'guest_prefix D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'addr1_t'		, 'guest_addr1 A, guest_addr2 A, guest_city A, guest_last_name A, guest_first_name A', 'guest_addr1 D, guest_addr2 D, guest_city A, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'addr2_t'		, 'guest_addr2 A, guest_addr1 A, guest_city A, guest_last_name A, guest_first_name A', 'guest_addr2 D, guest_addr1 D, guest_city A, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'city_t'		, 'guest_city A, guest_last_name A, guest_first_name A', 'guest_city D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'state_t'		, 'guest_state A, guest_last_name A, guest_first_name A', 'guest_state D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'zip_t'			, 'guest_zip A, guest_last_name A, guest_first_name A', 'guest_zip D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'phone_t'		, 'guest_phone A, guest_last_name A, guest_first_name A', 'guest_phone D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'email_t'		, 'guest_email A, guest_last_name A, guest_first_name A', 'guest_email D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'country_t'	, 'guest_country A, guest_last_name A, guest_first_name A', 'guest_country D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'email_t'		, 'guest_email A, guest_last_name A, guest_first_name A', 'guest_email D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'account_t'	, 'guest_account A, guest_last_name A, guest_first_name A', 'guest_account D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'guest_inhouse_t', 'guest_inhouse A, guest_last_name A, guest_first_name A, guest_account A', 'guest_inhouse D, guest_last_name A, guest_first_name A, guest_account A')

this.setsort( 'guest_last_name A, guest_first_name A, city A')


end event

type cb_last_search from w_vzt_person_edit`cb_last_search within w_vzt_guest_edit
integer x = 727
integer y = 2100
integer width = 343
integer taborder = 20
string facename = "Lucida Sans"
end type

type cb_close from w_vzt_person_edit`cb_close within w_vzt_guest_edit
integer x = 2080
integer y = 2188
integer width = 201
integer taborder = 50
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_person_edit`cb_delete1 within w_vzt_guest_edit
integer x = 1449
integer y = 2188
integer width = 201
integer taborder = 110
string facename = "Lucida Sans"
end type

type cb_save from w_vzt_person_edit`cb_save within w_vzt_guest_edit
integer x = 1870
integer y = 2188
integer width = 201
integer taborder = 90
string facename = "Lucida Sans"
end type

type cb_select from w_vzt_person_edit`cb_select within w_vzt_guest_edit
integer x = 1659
integer y = 2188
integer width = 201
integer taborder = 80
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_person_edit`cb_new within w_vzt_guest_edit
integer x = 1239
integer y = 2100
integer width = 201
integer taborder = 100
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_person_edit`cb_newsearch within w_vzt_guest_edit
integer x = 14
integer y = 2100
integer taborder = 70
string facename = "Lucida Sans"
end type

type cb_search from w_vzt_person_edit`cb_search within w_vzt_guest_edit
integer x = 370
integer y = 2100
integer width = 343
integer taborder = 60
string facename = "Lucida Sans"
end type

type st_foundrecs from w_vzt_person_edit`st_foundrecs within w_vzt_guest_edit
integer x = 3973
integer y = 2184
integer width = 398
long backcolor = 67108864
end type

type st_stop from w_vzt_person_edit`st_stop within w_vzt_guest_edit
integer x = 4142
integer y = 2188
string facename = "Lucida Sans"
end type

type dw_data from w_vzt_person_edit`dw_data within w_vzt_guest_edit
boolean visible = false
integer x = 2784
integer y = 1428
integer width = 521
integer height = 160
integer taborder = 40
boolean enabled = false
string dataobject = "d_client_edit"
end type

type dw_print from w_vzt_person_edit`dw_print within w_vzt_guest_edit
integer x = 1563
integer y = 1792
integer taborder = 120
end type

type uo_ddcal from w_vzt_person_edit`uo_ddcal within w_vzt_guest_edit
end type

type r_1 from w_vzt_person_edit`r_1 within w_vzt_guest_edit
boolean visible = false
integer x = 2848
integer y = 2176
integer width = 123
integer height = 100
end type

type tab_1 from tab within w_vzt_guest_edit
integer y = 824
integer width = 4366
integer height = 1336
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 80269528
boolean multiline = true
boolean raggedright = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
tabpage_8 tabpage_8
tabpage_9 tabpage_9
tabpage_10 tabpage_10
tabpage_11 tabpage_11
tabpage_12 tabpage_12
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.tabpage_8=create tabpage_8
this.tabpage_9=create tabpage_9
this.tabpage_10=create tabpage_10
this.tabpage_11=create tabpage_11
this.tabpage_12=create tabpage_12
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7,&
this.tabpage_8,&
this.tabpage_9,&
this.tabpage_10,&
this.tabpage_11,&
this.tabpage_12}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
destroy(this.tabpage_8)
destroy(this.tabpage_9)
destroy(this.tabpage_10)
destroy(this.tabpage_11)
destroy(this.tabpage_12)
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
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Guest"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
dw_guest dw_guest
end type

on tabpage_1.create
this.dw_guest=create dw_guest
this.Control[]={this.dw_guest}
end on

on tabpage_1.destroy
destroy(this.dw_guest)
end on

type dw_guest from uo_vzt_dwbase within tabpage_1
integer x = 14
integer y = 20
integer width = 3771
integer height = 1084
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_guest_edit"
boolean controlmenu = true
end type

event constructor;call super::constructor;wf_setupdateable ( dw_guest, "Guest info", true, true  ) // set updateable, title and selectable
//_dragable 					= true
//_drop_available_DW 		= true // available options
//_selection_service 		= 'S'

_ResetDataObjectOnSelect 	= true

is_editable[]	= { & 
'guest_room_last_checkin','guest_guest_id', &
'guest_last_checkin_dt','guest_last_depart_dt', 'guest_prefix',&
'guest_last_name','guest_first_name',  'guest_comp_name', 'guest_addr1', & 
'guest_addr2','guest_city','guest_state','guest_zip','guest_country', &
'guest_phone', 'email','guest_sr_code_5', 'stay_count', 'gcc_count', &
'pref_count', 'call_count','comments' }

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_searchable[]	= { & 
'guest_room_last_checkin','guest_guest_id', &
'guest_last_checkin_dt','guest_last_depart_dt','guest_prefix', &
'guest_last_name','guest_first_name',  'guest_comp_name', 'guest_addr1', & 
'guest_addr2','guest_city','guest_state','guest_zip','guest_country', & 
'guest_phone', 'email', 'guest_sr_code_5', 'stay_count', 'gcc_count', &
'pref_count', 'call_count','comments' }

//is_searchable[]	= is_editable[]	



end event

event scrollvertical;if ib_setrowonscroll then
	string ls_row
	ls_row = this.Describe("DataWindow.FirstRowOnPage")
	st_foundrecs.Text = ls_row + " of " + string(this.rowCount())
	this.setrow( long(ls_row))
	iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list)

END IF
end event

event retrieveend;call super::retrieveend;	string lsFilter 
		int liRc
		
		if cbx_profile.checked then 
			lsFilter =  'gcc_count >0 or stay_count >1 or pref_count >0 or call_count>0 or (guest_sr_code_5 = "1" or guest_sr_code_5 ="2" or guest_sr_code_5 ="3" ) ' 
			liRc = this.SetFilter (lsFilter) 
			this.Filter ()
			liRc = this.Rowcount() 
		else
			liRc = this.SetFilter ('') 
			this.Filter ()
		end if
		
this.ShareDataOff() 
this.ShareData(dw_mainlist)

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Stays"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
dw_stay dw_stay
end type

on tabpage_2.create
this.dw_stay=create dw_stay
this.Control[]={this.dw_stay}
end on

on tabpage_2.destroy
destroy(this.dw_stay)
end on

type dw_stay from uo_vzt_dwbase within tabpage_2
integer y = 12
integer width = 2711
integer height = 872
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_guest_stay_list"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  
wf_setupdateable ( dw_stay, "guest stays info", true, true  ) // set updateable, title and selectable

is_editable[]	= {'relation_type'}

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Comment Cards"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
dw_gcc dw_gcc
end type

on tabpage_3.create
this.dw_gcc=create dw_gcc
this.Control[]={this.dw_gcc}
end on

on tabpage_3.destroy
destroy(this.dw_gcc)
end on

type dw_gcc from uo_vzt_dwbase within tabpage_3
integer x = 5
integer y = 24
integer width = 3365
integer height = 736
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_guest_gcc_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  
//_set_bg_opaque_on_search = false
//wf_setupdateable ( dw_gcc, "Comment cards list", true, true  ) // set updateable, title and selectable
//is_editable[]	= {'from_date', 'to_date', 'addr_type', 'addr1', 'addr2', 'city', 'state', 'zip', 'country' }
//
end event

event doubleclicked;call super::doubleclicked;if row <= 0 then return 

id_survey_id 				= dw_gcc.GetItemNUmber( row, "surveyid")
id_gcc_id					= dw_gcc.GetItemNUmber( row, "gccid")
idt_ansdate					= dw_gcc.GetItemDateTime( row, "ansdate")

istr_parms.gccid 		= id_gcc_id // set call parm here - common to all calls
istr_parms.id 			= id_survey_id 
istr_parms.ansdate	= idt_ansdate 
istr_parms.account	= ii_person_id // guest acct 
istr_parms.guestname = f_nvl(trim(idw_guest.GetItemString( idw_guest.GetRow(), 'guest_first_name')),'') + ' '+ f_nvl(trim(idw_guest.GetItemString( idw_guest.GetRow(), 'guest_last_name'))	, '')

OPenSheetWithParm( w_qgen_survey_history_display, istr_parms, w_main, 5, original!)
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Calls"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
dw_calls dw_calls
end type

on tabpage_4.create
this.dw_calls=create dw_calls
this.Control[]={this.dw_calls}
end on

on tabpage_4.destroy
destroy(this.dw_calls)
end on

type dw_calls from uo_vzt_dwbase within tabpage_4
integer y = 12
integer width = 3374
integer height = 848
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_guest_calls_list"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  
//_set_bg_opaque_on_search = false
//wf_setupdateable ( dw_calls, "Guest Calls", true, true  ) // set updateable, title and selectable
//is_editable[]	= {'from_date', 'to_date', 'addr_type', 'addr1', 'addr2', 'city', 'state', 'zip', 'country' }
//
end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Addresses"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_ins cb_ins
cb_del cb_del
dw_addr dw_addr
end type

on tabpage_5.create
this.cb_ins=create cb_ins
this.cb_del=create cb_del
this.dw_addr=create dw_addr
this.Control[]={this.cb_ins,&
this.cb_del,&
this.dw_addr}
end on

on tabpage_5.destroy
destroy(this.cb_ins)
destroy(this.cb_del)
destroy(this.dw_addr)
end on

type cb_ins from commandbutton within tabpage_5
integer x = 3680
integer y = 16
integer width = 251
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ins Addr"
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

idw_addresses.SetItem( ll_newrow, 'country', gnv_appman.is_country)
idw_addresses.SetItem( ll_newrow, 'rand', 	f_random_string(20))

cb_save.visible = true

end event

type cb_del from commandbutton within tabpage_5
integer x = 3959
integer y = 16
integer width = 238
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Del Addr"
end type

event clicked;	long ll_row , ll_address 
	string ls_expr
	ll_row = dw_addr.GetRow() 
	If ll_row <= 0 then return 
	ll_address = dw_addr.object.id [ll_row ]
	ls_expr = ' contact_id = ' + string( id_main_id) + ' AND address_id = ' + string( ll_address )
	dw_addr.DeleteRow(0) 
	
	cb_save.visible = true


end event

type dw_addr from uo_vzt_dwbase within tabpage_5
integer x = 5
integer y = 12
integer width = 3657
integer height = 1100
integer taborder = 30
string dataobject = "d_full_address_edit"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event buttonclicked;call super::buttonclicked;//if row <= 0 or row > this.rowcount() then return
//
//if dwo.name = 'b_website' then
//	//display website
//	if this.GetItemString( row, "type") = "WEBSITE" then
//		wf_gotourl ( this.GetItemString( row, "address") )
//	end if
//end if
//
//if dwo.name = 'b_email' then
//	int li_ret
//	li_ret = 1
//	if not inv_mail.ib_logged_on then 
//		li_ret = inv_mail.uf_mail_logon() 
//		If li_ret = 1 then 
//		//		MessageBox('Batch Schedule Mail Logon', 'Logon Successful' ) 
//		ELSE
//			MessageBox('Mail Logon', 'Logon Failed' ) 
//		END IF
//		string ls_name[], ls_email[], ls_attach[]
//		ls_name[] = {''}
//		ls_email[1] = this.GEtItemString(row, "address")
//		inv_mail.uf_mail_send('','',ls_name,ls_email,ls_attach)
//		li_ret = inv_mail.uf_mail_logoff() 
//		// use templates later 
//	END IF
//end if
//
//
//
//
end event

event constructor;call super::constructor;post wf_setupdateable ( idw_addresses, "guest/owner addresses", true, true  ) // set updateable, title and selectable

is_editable[]	= {"type", "primary", "addr1", "addr2", "address" , &
"city", "state", "zip", "country", "phone", "descr" &
 }

end event

event ue_refresh_identity;call super::ue_refresh_identity;//address save succeeded 
// need to insert contact address relation records 
long ll_id, ll_row, ll_count, ll_adcnt
ll_count = this.rowcount() 
If ll_count <= 0 then return 

FOR ll_row = 1 to ll_count 
	
	ll_id = f_nvl(this.GetitemNumber( ll_row , 'id'),0)
//====================================================== ident 09/13/2006
	string ls_rand
	
	ls_rand 	= f_nvl(this.GetitemString( ll_row , 'rand'),'')
	
	If ll_id = 0 AND ls_rand <> '' then 
		SELECT MAX(id) INTO :ll_id FROM vzt_address 
			WHERE "rand" = :ls_rand;
			
		ll_id = f_nvl(ll_id,0)
	
		if gnv_appman.is_debugmode = 'Y' then
			MessageBox("Database Error","(select) ll_id="+string(ll_id))
		END IF	

		If ll_id > 0 then 
			this.Setitem( ll_row , 'id', ll_id 	)
			this.ResetUpdate()
		END IF
		
	END IF
//====================================================== ident 09/13/2006
		
  	if ll_id <> 0 then 

		SELECT count(*) into :ll_adcnt from vzt_contact_address 
			where contact_id = :id_guest_contact_id AND address_id = :ll_id ; 
		IF ll_adcnt <= 0 or IsNUll(ll_count) then 
			INSERT INTO vzt_contact_address (address_id, contact_id) 
					VALUES ( :ll_id , :id_guest_contact_id  ) ;
		END IF 
	ELSE
		MessageBox("Database Error", "Address IDentity Refresh error")
	END IF
NEXT

return 
end event

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Authorized Users"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_5 cb_5
cb_3 cb_3
dw_cont_addr dw_cont_addr
cb_2 cb_2
cb_1 cb_1
dw_contacts dw_contacts
end type

on tabpage_6.create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.dw_cont_addr=create dw_cont_addr
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_contacts=create dw_contacts
this.Control[]={this.cb_5,&
this.cb_3,&
this.dw_cont_addr,&
this.cb_2,&
this.cb_1,&
this.dw_contacts}
end on

on tabpage_6.destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.dw_cont_addr)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_contacts)
end on

type cb_5 from commandbutton within tabpage_6
integer x = 3323
integer y = 216
integer width = 439
integer height = 84
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Edit Contacts"
end type

event clicked;//OpenSheetWithParm( w_vzt_contact_edit, "0", w_main, 0, Original! )
OpenSheetWithParm( w_vzt_contact_edit_full, "0", w_main, 0, Original! )

end event

type cb_3 from commandbutton within tabpage_6
integer x = 3323
integer y = 116
integer width = 439
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Pick Contacts"
end type

event clicked;st_lookup_parm  	lstr_parms
st_lookup_ret		lstr_ret

lstr_parms.selection = 'S' 
OpenwithParm( w_vzt_contact_lookup, lstr_parms)
lstr_ret = Message.PowerObjectparm

lstr_ret = lstr_ret 
If IsNUmber(lstr_ret.newvalue) then
	long ll_id
	ll_id = long(lstr_ret.newvalue)
	INSERT into vzt_contact_relation 
	(contact_id_from, contact_id_to, relation_type)
	values (:id_guest_contact_id, :ll_id, 'RELATIVE') ;
	
	COMMIT;
	idw_contacts.Retrieve( id_guest_contact_id, 'RELATIVE' ) 
END IF

end event

type dw_cont_addr from uo_vzt_dwbase within tabpage_6
integer x = 5
integer y = 372
integer width = 3282
integer height = 920
integer taborder = 40
string dataobject = "d_full_address_edit"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event buttonclicked;call super::buttonclicked;if dwo.name = 'b_website' then
	//display website
	if row > 0 and row <= this.rowcount() then 
		if this.GetItemString( row, "type") = "WEBSITE" then
			wf_gotourl ( this.GetItemString( row, "address") )
		end if
	end if
end if



end event

event constructor;call super::constructor;post wf_setupdateable ( dw_cont_addr, "vendor addresses", true, true  ) // set updateable, title and selectable

is_editable[]	= {"type", "primary", "addr1", "addr2", "address" , &
"city", "state", "zip", "country", "phone", "descr" &
 }

end event

event ue_update_keys_on_new;call super::ue_update_keys_on_new;return 1
////need to update with keys from auth contacts
//
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
//
//END IF
//return 1
end event

event ue_refresh_identity;call super::ue_refresh_identity;//auth contact save succeeded 
// need to insert contact address relation records 
long ll_id, ll_row, ll_count
ll_count = this.rowcount() 
If ll_count <= 0 then return 

FOR ll_row = 1 to ll_count 
	
	ll_id = f_nvl(this.GetitemNumber( ll_row , 'id'),0)
  	if ll_id <> 0 then 

		SELECT count(*) into :ll_count from vzt_contact_address 
			where contact_id = :id_auth_contact_id AND address_id = :ll_id ; 
		IF ll_count <= 0 or IsNUll(ll_count) then 
			INSERT INTO vzt_contact_address (address_id, contact_id) 
					VALUES ( :ll_id , :id_auth_contact_id  ) ;
		END IF 
  END IF
NEXT

return 


return 
end event

type cb_2 from commandbutton within tabpage_6
boolean visible = false
integer x = 3547
integer y = 24
integer width = 210
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Delete"
end type

event clicked;	long ll_row , ll_address 
	string ls_expr
	ll_row = dw_contacts.GetRow() 
	If ll_row <= 0 then return 
	ll_address = dw_contacts.object.id [ll_row ]
	ls_expr = ' contact_id = ' + string( id_main_id) + ' AND address_id = ' + string( ll_address )
	dw_contacts.DeleteRow(0) 

end event

type cb_1 from commandbutton within tabpage_6
boolean visible = false
integer x = 3323
integer y = 24
integer width = 210
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Insert"
end type

event clicked;	long			ll_newrow
 	ll_newrow = dw_contacts.INsertRow(0)
	if ll_newrow <= 0 then return 
	

end event

type dw_contacts from uo_vzt_dwbase within tabpage_6
integer x = 5
integer y = 12
integer width = 3282
integer height = 352
integer taborder = 30
string dataobject = "d_contact_list_01_rel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_poweredit = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_contacts, "authorized relatives", true, true ) // set updateable, title and selectable

//this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

//is_editable[]	={'firstname', 'contacttype' } // 'id',

//is_searchable[]	=  is_editable[]

_selection_service = 'S' 

end event

event rowfocuschanged;call super::rowfocuschanged;//iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
//this.event ue_get_key_values ()
//iw_mywindow.event ue_retrieve_links()
if currentrow <=0 then 
	dw_cont_addr.Retrieve( 0)
	dw_cont_addr.visible = false
	return 
end if

if this.rowcount() <= 0 then return 

id_auth_contact_id = this.GetItemNumber( currentrow, 'id')
dw_cont_addr.Retrieve( id_auth_contact_id) 
dw_cont_addr.visible = true 

end event

event ue_rowselected;call super::ue_rowselected;//iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
//this.event ue_get_key_values ()
//iw_mywindow.event ue_retrieve_links()
if row <=0 then 
	dw_cont_addr.Retrieve( 0)
	dw_cont_addr.visible = false
	return 1
end if

id_auth_contact_id = this.GetItemNumber(  row, 'id')
dw_cont_addr.Retrieve( id_auth_contact_id, 'RELATIVES') 
dw_cont_addr.visible = true 

return 1
end event

event itemchanged;call super::itemchanged;cb_save.visible = true 
end event

event retrieveend;call super::retrieveend;//this.event rowfocuschanged(1)
end event

type tabpage_7 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Documents"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_getfile cb_getfile
cb_oleedit cb_oleedit
cb_6 cb_6
cb_4 cb_4
ole_1 ole_1
dw_docs dw_docs
end type

on tabpage_7.create
this.cb_getfile=create cb_getfile
this.cb_oleedit=create cb_oleedit
this.cb_6=create cb_6
this.cb_4=create cb_4
this.ole_1=create ole_1
this.dw_docs=create dw_docs
this.Control[]={this.cb_getfile,&
this.cb_oleedit,&
this.cb_6,&
this.cb_4,&
this.ole_1,&
this.dw_docs}
end on

on tabpage_7.destroy
destroy(this.cb_getfile)
destroy(this.cb_oleedit)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.ole_1)
destroy(this.dw_docs)
end on

type cb_getfile from commandbutton within tabpage_7
integer x = 2683
integer y = 1136
integer width = 654
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
			idw_docs.Retrieve( id_guest_contact_id )
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

type cb_oleedit from commandbutton within tabpage_7
integer x = 2034
integer y = 1136
integer width = 635
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Edit/View Doc"
end type

event clicked;ole_1.uf_activate(ole_1.i_acttype)
cb_save.visible = true 
cb_save.enabled = true 
end event

type cb_6 from commandbutton within tabpage_7
integer x = 1673
integer y = 20
integer width = 256
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<-Delete"
end type

event clicked;	long ll_row , ll_doc_id 
	string ls_expr
	ll_row = idw_docs.GetRow() 
	If ll_row <= 0 then return 
	ll_doc_id = dw_docs.object.id [ll_row ]
//	ls_expr = ' contact_id = ' + string( id_main_id) + ' AND doc_id = ' + string( ll_doc_id )
	dw_docs.DeleteRow(0) 
	cb_save.visible = true 
//	ll_row = dw_contact_address.Find( ls_expr, 1, dw_contact_address.RowCount() )
	// make trigger !!!!!!!!!!!!! 
//	if ll_row <= 0 then return 
//	dw_contact_address.DeleteRow( ll_row ) 
	

end event

type cb_4 from commandbutton within tabpage_7
integer x = 1417
integer y = 20
integer width = 233
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<-Insert"
end type

event clicked;	long			ll_newrow
 	ll_newrow = idw_docs.EVENT ue_insert_new( 'doc_type') 
	if ll_newrow <= 0 then return 

	idw_docs.SetItem( ll_newrow, 'contact_id', 	id_guest_contact_id)
	cb_save.visible = true 
//	idw_addresses.ModifyEdit ("W")

end event

type ole_1 from uo_vzt_oledoc_base within tabpage_7
integer x = 2030
integer y = 20
integer width = 1307
integer height = 1096
integer taborder = 30
string binarykey = "w_vzt_guest_edit.win"
end type

event ue_ole_save_upd_ref_sql;double ld_ole, ld_doc_id ,ld_guest_contact_id
ld_ole					= id_ole
ld_doc_id 				= id_doc_id 
ld_guest_contact_id	= id_guest_contact_id

if ld_ole > 0 then 
	UPDATE vzt_contact_docs SET ole_doc_id = :ld_ole 
	WHERE id = :ld_doc_id AND contact_id = :ld_guest_contact_id ;
end if
end event

type dw_docs from uo_vzt_dwbase within tabpage_7
integer x = 9
integer y = 12
integer width = 1390
integer height = 1172
integer taborder = 30
string dataobject = "d_contact_doc_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_docs, "Guest documents", true, true  ) // set updateable, title and selectable

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

event retrieveend;call super::retrieveend;ole_1.Clear() 
this.event rowfocuschanged( this.getrow())
end event

event editchanged;call super::editchanged;cb_save.visible = true 
end event

event clicked;call super::clicked;if row = 1 and this.RowCOunt() = 1 then 
	this.event rowfocuschanged (1)
end if
end event

type tabpage_8 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Preferences"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_16 cb_16
cb_15 cb_15
dw_prefs dw_prefs
end type

on tabpage_8.create
this.cb_16=create cb_16
this.cb_15=create cb_15
this.dw_prefs=create dw_prefs
this.Control[]={this.cb_16,&
this.cb_15,&
this.dw_prefs}
end on

on tabpage_8.destroy
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.dw_prefs)
end on

type cb_16 from commandbutton within tabpage_8
integer x = 3822
integer y = 120
integer width = 183
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;	long ll_row 
	ll_row = Idw_prefs.GetRow() 
	If ll_row <= 0 then return 
	Idw_prefs.DeleteRow(0) 
	cb_save.visible = true 
	

end event

type cb_15 from commandbutton within tabpage_8
integer x = 3817
integer y = 28
integer width = 183
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insert"
end type

event clicked;	long			ll_newrow
 	ll_newrow = dw_prefs.EVENT ue_insert_new( 'problem_number') 
	if ll_newrow <= 0 then return 

	dw_prefs.SetItem( ll_newrow, 'contact_id', 	id_guest_contact_id)
	cb_save.visible = true 

end event

type dw_prefs from uo_vzt_dwbase within tabpage_8
integer x = 5
integer y = 12
integer width = 3753
integer height = 1128
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_contact_pref_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  
//_set_bg_opaque_on_search = false
wf_setupdateable ( dw_prefs, "Guest Preferences list", false, false) // set updateable, title and selectable
//is_editable[]	= {'from_date', 'to_date', 'addr_type', 'addr1', 'addr2', 'city', 'state', 'zip', 'country' }
//
end event

event rowfocuschanged;call super::rowfocuschanged;iw_mywindow.event dynamic ue_filter_subtask(currentrow)

end event

event itemchanged;call super::itemchanged;if dwo.name = 'problem_number' then 
	iw_mywindow.post event dynamic ue_filter_subtask(row)
end if
if dwo.name = 'subkey' and row > 0 then 
	string ls_subtask
	ls_subtask = RIGHT(data, 5)
	this.SetItem ( row, "subproblem_number", ls_subtask)
end if

end event

type tabpage_9 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Pets"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_8 cb_8
cb_7 cb_7
dw_pets dw_pets
end type

on tabpage_9.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.dw_pets=create dw_pets
this.Control[]={this.cb_8,&
this.cb_7,&
this.dw_pets}
end on

on tabpage_9.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.dw_pets)
end on

type cb_8 from commandbutton within tabpage_9
integer x = 3397
integer y = 48
integer width = 210
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insert"
end type

event clicked;	long			ll_newrow
 	ll_newrow = idw_pets.EVENT ue_insert_new( 'name') 
	if ll_newrow <= 0 then return 

	idw_pets.SetItem( ll_newrow, 'contact_id', 	id_guest_contact_id)
	cb_save.visible = true 

end event

type cb_7 from commandbutton within tabpage_9
integer x = 3621
integer y = 48
integer width = 210
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;	long ll_row 
	ll_row = idw_pets.GetRow() 
	If ll_row <= 0 then return 
	idw_pets.DeleteRow(0) 
	cb_save.visible = true 
	

end event

type dw_pets from uo_vzt_dwbase within tabpage_9
integer y = 12
integer width = 3342
integer height = 1112
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_contact_pets_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  
post wf_setupdateable ( idw_pets, "Guest Pets", true, true  ) // set updateable, title and selectable

is_editable[]	= {"name", "breed", "species", "descr", "color" , &
"licence", "licence_expiration" }

end event

type tabpage_10 from userobject within tab_1
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Cars/Autos"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_10 cb_10
cb_9 cb_9
dw_cars dw_cars
end type

on tabpage_10.create
this.cb_10=create cb_10
this.cb_9=create cb_9
this.dw_cars=create dw_cars
this.Control[]={this.cb_10,&
this.cb_9,&
this.dw_cars}
end on

on tabpage_10.destroy
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.dw_cars)
end on

type cb_10 from commandbutton within tabpage_10
integer x = 3602
integer y = 32
integer width = 210
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;	long ll_row 
	ll_row = idw_cars.GetRow() 
	If ll_row <= 0 then return 
	idw_cars.DeleteRow(0) 
	cb_save.visible = true 
	

end event

type cb_9 from commandbutton within tabpage_10
integer x = 3378
integer y = 32
integer width = 210
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insert"
end type

event clicked;	long			ll_newrow
 	ll_newrow = idw_cars.EVENT ue_insert_new( 'type') 
	if ll_newrow <= 0 then return 

	idw_cars.SetItem( ll_newrow, 'contact_id', 	id_guest_contact_id)
	cb_save.visible = true 

end event

type dw_cars from uo_vzt_dwbase within tabpage_10
integer y = 12
integer width = 3342
integer height = 1128
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_contact_cars_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;//_selection_service = 'S'  
post wf_setupdateable ( idw_cars, "Guest Cars/Autos", true, true  ) // set updateable, title and selectable

is_editable[]	= {"name", "breed", "species", "descr", "color" , &
"licence", "licence_expiration" }

end event

type tabpage_11 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Emergency"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
dw_cont_addr_e dw_cont_addr_e
dw_contacts_e dw_contacts_e
end type

on tabpage_11.create
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.dw_cont_addr_e=create dw_cont_addr_e
this.dw_contacts_e=create dw_contacts_e
this.Control[]={this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.dw_cont_addr_e,&
this.dw_contacts_e}
end on

on tabpage_11.destroy
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.dw_cont_addr_e)
destroy(this.dw_contacts_e)
end on

type cb_14 from commandbutton within tabpage_11
integer x = 3470
integer y = 216
integer width = 448
integer height = 84
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Edit Contacts"
end type

event clicked;//OpenSheetWithParm( w_vzt_contact_edit, "0", w_main, 0, Original! )
OpenSheetWithParm( w_vzt_contact_edit_full, "0", w_main, 0, Original! )

end event

type cb_13 from commandbutton within tabpage_11
integer x = 3470
integer y = 116
integer width = 448
integer height = 84
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Pick Contacts"
end type

event clicked;st_lookup_parm  	str_parms
st_lookup_ret		str_ret

str_parms.selection = 'S' 
OpenwithParm( w_vzt_contact_lookup, str_parms)
str_ret = Message.PowerObjectparm

str_ret = str_ret 
If IsNUmber(str_ret.newvalue) then
	long ll_id
	ll_id = long(str_ret.newvalue)
	INSERT into vzt_contact_relation 
	(contact_id_from, contact_id_to, relation_type)
	values (:id_guest_contact_id, :ll_id, 'EMERGENCY') ;
	
	
	COMMIT;
	
	idw_contacts_e.Retrieve (id_guest_contact_id, 'EMERGENCY')
END IF

end event

type cb_12 from commandbutton within tabpage_11
boolean visible = false
integer x = 3707
integer y = 24
integer width = 210
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Delete"
end type

event clicked;	long ll_row , ll_address 
	string ls_expr
	ll_row = dw_contacts_e.GetRow() 
	If ll_row <= 0 then return 
	ll_address = dw_contacts_e.object.id [ll_row ]
	ls_expr = ' contact_id = ' + string( id_main_id) + ' AND address_id = ' + string( ll_address )
	dw_contacts_e.DeleteRow(0) 
//	ll_row = dw_contact_address_e.Find( ls_expr, 1, dw_contact_address.RowCount() )
	// make trigger !!!!!!!!!!!!! 
	if ll_row <= 0 then return 
//	dw_contact_address_e.DeleteRow( ll_row ) 
	

end event

type cb_11 from commandbutton within tabpage_11
boolean visible = false
integer x = 3470
integer y = 24
integer width = 215
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Insert"
end type

event clicked;	long			ll_newrow
 	ll_newrow = dw_contacts_e.INsertRow(0)
	if ll_newrow <= 0 then return 
	cb_save.visible = true 
	

end event

type dw_cont_addr_e from uo_vzt_dwbase within tabpage_11
integer x = 5
integer y = 372
integer width = 3323
integer height = 920
integer taborder = 50
string dataobject = "d_full_address_edit"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event buttonclicked;call super::buttonclicked;if dwo.name = 'b_website' then
	//display website
	if row > 0 and row <= this.rowcount() then 
		if this.GetItemString( row, "type") = "WEBSITE" then
			wf_gotourl ( this.GetItemString( row, "address") )
		end if
	end if
end if



end event

event constructor;call super::constructor;post wf_setupdateable ( dw_cont_addr_e, "emergency contact addresses", true, true  ) // set updateable, title and selectable

is_editable[]	= {"type", "primary", "addr1", "addr2", "address" , &
"city", "state", "zip", "country", "phone", "descr" &
 }

end event

event ue_update_keys_on_new;call super::ue_update_keys_on_new;return 1
////need to update with keys from auth contacts
//
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
//
//END IF
//return 1
end event

event ue_refresh_identity;call super::ue_refresh_identity;//auth contact save succeeded 
// need to insert contact address relation records 
long ll_id, ll_row, ll_count
ll_count = this.rowcount() 
If ll_count <= 0 then return 

FOR ll_row = 1 to ll_count 
	
	ll_id = f_nvl(this.GetitemNumber( ll_row , 'id'),0)
  	if ll_id <> 0 then 

		SELECT count(*) into :ll_count from vzt_contact_address 
			where contact_id = :id_emer_contact_id AND address_id = :ll_id ; 
		IF ll_count <= 0 or IsNUll(ll_count) then 
			INSERT INTO vzt_contact_address (address_id, contact_id) 
					VALUES ( :ll_id , :id_emer_contact_id  ) ;
		END IF 
  END IF
NEXT

return 


return 
end event

type dw_contacts_e from uo_vzt_dwbase within tabpage_11
integer x = 5
integer y = 12
integer width = 3319
integer height = 352
integer taborder = 40
string dataobject = "d_contact_list_01_emer"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_poweredit = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_contacts_e, "authorized relatives", true, true ) // set updateable, title and selectable

//this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

//is_editable[]	={'firstname', 'contacttype' } // 'id',

//is_searchable[]	=  is_editable[]

_selection_service = 'S' 

end event

event itemchanged;call super::itemchanged;cb_save.visible = true 
end event

event rowfocuschanged;call super::rowfocuschanged;//iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
//this.event ue_get_key_values ()
//iw_mywindow.event ue_retrieve_links()
if currentrow <=0 then 
	dw_cont_addr_e.Retrieve( 0)
	dw_cont_addr_e.visible = false
	return 
end if

id_emer_contact_id = this.GetItemNumber( currentrow, 'id')
dw_cont_addr_e.Retrieve( id_emer_contact_id, 'EMERGENCY') 
dw_cont_addr_e.visible = true 

end event

event ue_rowselected;call super::ue_rowselected;//iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
//this.event ue_get_key_values ()
//iw_mywindow.event ue_retrieve_links()
if row <=0 then 
	dw_cont_addr_e.Retrieve( 0)
	dw_cont_addr_e.visible = false
	return 1
end if

id_emer_contact_id = this.GetItemNumber(  row, 'id')
dw_cont_addr_e.Retrieve( id_emer_contact_id ) 
dw_cont_addr_e.visible = true 

return 1
end event

type tabpage_12 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 184
integer width = 4329
integer height = 1136
long backcolor = 80269528
string text = "Important Dates"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
long picturemaskcolor = 536870912
dw_dates dw_dates
end type

on tabpage_12.create
this.dw_dates=create dw_dates
this.Control[]={this.dw_dates}
end on

on tabpage_12.destroy
destroy(this.dw_dates)
end on

type dw_dates from uo_vzt_dwbase within tabpage_12
integer x = 9
integer y = 16
integer width = 2295
integer height = 684
integer taborder = 40
string dataobject = "d_contact_dates_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_poweredit = true
end type

event constructor;call super::constructor;//post wf_setupdateable ( dw_dates, "important dates", true, true ) // set updateable, title and selectable

//this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

//is_editable[]	={'firstname', 'contacttype' } // 'id',

//is_searchable[]	=  is_editable[]

//_selection_service = 'S' 

end event

event itemchanged;call super::itemchanged;cb_save.visible = true 
end event

event ue_rowselected;call super::ue_rowselected;////iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
////this.event ue_get_key_values ()
////iw_mywindow.event ue_retrieve_links()
//if row <=0 then 
//	dw_cont_addr.Retrieve( 0)
//	dw_cont_addr.visible = false
//	return 1
//end if
//
//id_auth_contact_id = this.GetItemNumber(  row, 'id')
//dw_cont_addr.Retrieve( id_auth_contact_id) 
//dw_cont_addr.visible = true 

return 1
end event

type dw_subtask from uo_vzt_dwbase within w_vzt_guest_edit
boolean visible = false
integer x = 3401
integer y = 384
integer width = 681
integer height = 396
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_dddw_subproblem_pref01"
end type

type cb_arr from commandbutton within w_vzt_guest_edit
integer x = 3319
integer y = 2188
integer width = 370
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Mark 4 Arrvl"
end type

event clicked;If idw_guest.GetRow() <= 0 then return 

f_room_reg_sync ()

// SET PRE-ARRIVAL PREFS FOR TOMORROWS ARRIVAL

idw_guest.SetItem(idw_guest.GetRow(),"guest_last_checkin_dt", relativedate(today(),1))
idw_guest.SetItem(idw_guest.GetRow(),"guest_last_depart_dt", relativedate(today(),2))
cb_save.post event clicked ()

parent.event ue_retrieve_links()

end event

type p_1 from picture within w_vzt_guest_edit
integer width = 1152
integer height = 212
boolean bringtotop = true
boolean originalsize = true
string picturename = "Profilesheader.bmp"
boolean focusrectangle = false
end type

type p_2 from picture within w_vzt_guest_edit
integer x = 3653
integer width = 1152
integer height = 212
boolean bringtotop = true
boolean originalsize = true
string picturename = "Fundamentals_bf.bmp"
boolean focusrectangle = false
end type

type cb_checkin from commandbutton within w_vzt_guest_edit
integer x = 2299
integer y = 2188
integer width = 462
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Mark 4 Check In"
end type

event clicked;If idw_guest.GetRow() <= 0 then return 

datetime  ld_date_from   ,  ld_date_to    
string 	 ls_date_from   ,  ls_date_to    	

string    ls_guest_lname , ls_guest_fname, ls_addr1, ls_addr2  
string    ls_city,  ls_state, ls_zip, ls_country, ls_company_name 
string    ls_aduts_num, ls_phone, ls_email, ls_room_code, lsRand, ls_VIP	 
double	 ld_guest_account     
long 	    ll_Row		

// CHECK OUT FIRST !!! 
//cb_checkout.event clicked()

//immediate checK-in == TODAY

ld_date_from   = datetime(today(),now())
ld_date_to     = datetime(relativedate(today(),3), now() )
ls_date_from   = string (ld_date_from, 'mm/dd/yyyy') 
ls_date_to    	= string (ld_date_to, 'mm/dd/yyyy')

ll_Row			= idw_guest.GetRow()

//idw_guest.SetItem(ll_Row ,"guest_last_checkin_dt", ld_date_from )
//idw_guest.SetItem(ll_Row ,"guest_last_depart_dt",  ld_date_to)
//
//cb_save.event clicked ()

lsRand				= f_random_string (10)
ls_guest_lname 	= idw_guest.GetItemString( ll_Row, 'guest_last_name') 
ls_guest_fname 	= idw_guest.GetItemString( ll_Row, 'guest_first_name') 
ls_addr1 			= idw_guest.GetItemString( ll_Row, 'guest_addr1') 
ls_addr2 			= idw_guest.GetItemString( ll_Row, 'guest_addr2') 
ls_city 				= idw_guest.GetItemString( ll_Row, 'guest_city') 
ls_state 			= idw_guest.GetItemString( ll_Row, 'guest_state') 
ls_zip 				= idw_guest.GetItemString( ll_Row, 'guest_zip') 
ls_country 			= idw_guest.GetItemString( ll_Row, 'guest_country') 
ls_company_name 	= idw_guest.GetItemString( ll_Row, 'guest_comp_name') 
ls_aduts_num 		= '1' 
ls_phone 			= idw_guest.GetItemString( ll_Row, 'guest_phone') 
ls_email 			= idw_guest.GetItemString( ll_Row, 'email') 
ls_room_code 		= idw_guest.GetItemString( ll_Row, 'guest_room_last_checkin') 
ld_guest_account  = idw_guest.GetItemnUMBER( ll_Row, 'guest_account') 
ls_VIP	 			= idw_guest.GetItemString( ll_Row, 'guest_sr_code_5') 

f_room_reg_sync ()

int li_cnt
li_cnt = 0
SELECT count(*) INTO :li_cnt from "room_registry"  
	WHERE room_code 		= :ls_room_code		;
	
if li_cnt <= 0 then 
	MessageBox('Room Registry Error', 'Room not found: '+ ls_room_code )
ELSE
	gnv_appman.iw_frame.SetMicrohelp('Room Found, rc:'+string(li_cnt))

	UPDATE "room_registry"  
     SET "guest_lname" 	= :ls_guest_lname,   
         "guest_fname" 	= :ls_guest_fname,   
			
         "date_from" 	= :ls_date_from,   
         "date_to" 		= :ls_date_to,   
         
			"addr1" 			= :ls_addr1,   
         "addr2" 			= :ls_addr2,   
         "city" 			= :ls_city,   
         "state" 			= :ls_state,   
         "zip" 			= :ls_zip,   
         "country" 		= :ls_country,   
         "company_name" = :ls_company_name,   
         "aduts_num" 	= '1',   
         "phone" 			= :ls_phone,   
         "email" 			= :ls_email,   
         "guest_account"= :ld_guest_account  ,
			"rand"			= :lsRand,
			"msg"				= 'OCCUPIED',  
			"share3_lname" = :ls_VIP	,
			"share2_fname" = 'N' 
	WHERE room_code 		= :ls_room_code					;

	f_end_tran0( SQLCA, 'Room Registry Update for Check-IN', 'CHECK-IN Updated successfully', 'Update Failed')
END IF

parent.event ue_retrieve_links()

end event

type cb_checkout from commandbutton within w_vzt_guest_edit
integer x = 2770
integer y = 2188
integer width = 526
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Mark 4 Check Out"
end type

event clicked;If idw_guest.GetRow() <= 0 then return 

datetime  ld_date_from   ,  ld_date_to    

string    ls_guest_lname , ls_guest_fname, ls_addr1, ls_addr2  
string    ls_city,  ls_state, ls_zip, ls_country, ls_company_name 
string    ls_aduts_num, ls_phone, ls_email, ls_room_code, lsRand
string 	 ls_vip
double	 ld_guest_account     
long 	    ll_Row		

ld_date_from   = datetime(today(),now())
ld_date_to     = datetime(relativedate(today(),2), now() )

ll_Row			= idw_guest.GetRow()

lsRand				= f_random_string (10)
ls_room_code 		= idw_guest.GetItemString( ll_Row, 'guest_room_last_checkin') 
ld_guest_account	= idw_guest.GetItemNumber( ll_Row, 'guest_account') 
ls_vip				= idw_guest.GetItemString( ll_Row, 'guest_sr_code_5') 

//		idw_target.SetItem( ll_row, "share3_fname", is_pms_guest_no)// pms guest num
//		idw_target.SetItem( ll_row, "share3_lname", is_vip) 			// pms guest VIP
//		idw_target.SetItem( ll_row, "share2_fname", is_guest_share) // pms share ind
//		idw_target.SetItem( ll_row, "share2_lname", is_oldroom) // old room on moves
//		idw_target.SetItem( ll_row, "share1_fname", is_guest_title ) // Mr. Mrs.
//

f_room_reg_sync ()

int li_cnt
li_cnt = 0
SELECT count(*) INTO :li_cnt from "room_registry"  
	WHERE room_code 		= :ls_room_code		;
	
if li_cnt <= 0 then 
	MessageBox('Room Registry Error', 'Room not found: '+ ls_room_code )
ELSE
	gnv_appman.iw_frame.SetMicrohelp('Room Found, rc:'+string(li_cnt))

	UPDATE "room_registry"  
     SET "guest_lname" 	= '',   
         "guest_fname" 	= '',   
         "date_from" 	= null,   
         "date_to" 		= null,   
         "addr1" 			= '',   
         "addr2" 			= '',   
         "city" 			= '',   
         "state" 			= '',
         "zip" 			= '',
         "country" 		= '',
         "company_name" = '',
         "aduts_num" 	= '0',   
         "phone" 			= '',
         "email" 			= '',
         "guest_account"= :ld_guest_account,
			"rand"			= :lsRand,
			"share3_lname" = :ls_vip, 
			"msg"				= 'VACANT'
	WHERE room_code 		= :ls_room_code					;

	f_end_tran0( SQLCA, 'Room Registry Update for Check-OUT', 'CHECK-OUT Updated successfully', 'Update Failed')
END IF
parent.event ue_retrieve_links()

end event

type cbx_profile from checkbox within w_vzt_guest_edit
integer x = 3707
integer y = 2192
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
string text = "profile"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_vzt_guest_edit.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_vzt_guest_edit.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
