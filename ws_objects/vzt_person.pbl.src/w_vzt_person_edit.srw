$PBExportHeader$w_vzt_person_edit.srw
forward
global type w_vzt_person_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_person_edit
end type
end forward

global type w_vzt_person_edit from w_vzt_base
integer width = 2537
integer height = 1684
string title = "Maintain Teachers"
boolean resizable = false
long backcolor = 80269528
r_1 r_1
end type
global w_vzt_person_edit w_vzt_person_edit

type variables
double	ii_person_id
end variables

on w_vzt_person_edit.create
int iCurrent
call super::create
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
end on

on w_vzt_person_edit.destroy
call super::destroy
destroy(this.r_1)
end on

event open;call super::open;cb_newsearch.event clicked()
cb_select.visible 	= false
cb_select.enabled 	= true
cb_save.enabled 		= true
cb_new.visible 		= true
end event

event ue_assign_menu;//
end event

type cb_tmpl from w_vzt_base`cb_tmpl within w_vzt_person_edit
end type

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_person_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_person_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_person_edit
integer width = 2487
integer height = 636
string dataobject = "d_teacher_list"
end type

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'first_name_t', 'guest_first_name A, guest_last_name A', 'guest_first_name D, guest_last_name D')
this.inv_field_sort.of_setcolumn( 'city_t', 'city A, last_name A, first_name A', 'city D, last_name A, first_name A')
this.inv_field_sort.of_setcolumn( 'state_t', 'state A, last_name A, first_name A', 'state D, last_name A, first_name A')
this.inv_field_sort.of_setcolumn( 'zip_t', 'zip A, last_name A, first_name A', 'zip D, last_name A, first_name A')
this.inv_field_sort.of_setcolumn( 'id_t', 'ID A','id D')
this.inv_field_sort.of_setcolumn( 'last_name_t', 'last_name A, first_name A', 'last_name D, first_name D')

this.setsort( 'last_name A, first_name A, city A')


end event

event dw_mainlist::retrieveend;call super::retrieveend; this. post sort()
end event

event dw_mainlist::clicked;call super::clicked;If row > 0 then 
	ii_person_id = dw_mainlist.GetItemNumber ( row, 'id')
END IF 
end event

event dw_mainlist::rowfocuschanged;call super::rowfocuschanged;If currentrow > 0 then 
	ii_person_id = dw_mainlist.GetItemNumber ( currentrow, 'id')
END IF 
end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_person_edit
integer x = 626
integer y = 1476
end type

type cb_close from w_vzt_base`cb_close within w_vzt_person_edit
integer x = 2107
integer y = 1476
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_person_edit
integer x = 1157
integer y = 1476
end type

type cb_save from w_vzt_base`cb_save within w_vzt_person_edit
integer x = 1591
integer y = 1476
boolean enabled = false
end type

type cb_select from w_vzt_base`cb_select within w_vzt_person_edit
integer x = 1367
integer y = 1476
boolean enabled = false
end type

event cb_select::clicked;call super::clicked;dw_data.post SetFocus()
end event

type cb_new from w_vzt_base`cb_new within w_vzt_person_edit
integer x = 983
integer y = 1476
end type

event cb_new::clicked;call super::clicked;cb_delete1.visible 	= FALSE
end event

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_person_edit
integer x = 46
integer y = 1476
end type

event cb_newsearch::clicked;call super::clicked;cb_delete1.visible 	= FALSE
end event

type cb_search from w_vzt_base`cb_search within w_vzt_person_edit
integer x = 393
integer y = 1476
end type

event cb_search::clicked;call super::clicked;cb_new.visible 		= true
cb_delete1.visible 	= true
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_person_edit
integer x = 1865
integer y = 1476
integer width = 233
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_vzt_person_edit
integer x = 1893
integer y = 1476
end type

type dw_data from w_vzt_base`dw_data within w_vzt_person_edit
integer y = 664
integer width = 2491
integer height = 764
string dataobject = "d_teacher_edit"
end type

event dw_data::constructor;call super::constructor;_ResetDataObjectOnSelect 	= true
is_editable[]	= { & 
'last_name','middle_init','first_name',  & 
'title',  'phone', 'addr1', &
'addr2','city','state','zip','country',  'email'}

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_searchable[]	= is_editable[]	


end event

event dw_data::dberror;error.of_dberror( sqldbcode, sqlerrtext, sqlsyntax, buffer, row, this.dataobject)
end event

type dw_print from w_vzt_base`dw_print within w_vzt_person_edit
integer x = 1385
integer y = 1476
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_person_edit
end type

type r_1 from rectangle within w_vzt_person_edit
integer linethickness = 12
long fillcolor = 8421504
integer x = 9
integer y = 1456
integer width = 2496
integer height = 112
end type

