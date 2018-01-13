$PBExportHeader$w_vzt_contact_edit_full.srw
forward
global type w_vzt_contact_edit_full from w_vzt_contact_edit
end type
end forward

global type w_vzt_contact_edit_full from w_vzt_contact_edit
integer width = 3689
integer height = 2264
end type
global w_vzt_contact_edit_full w_vzt_contact_edit_full

on w_vzt_contact_edit_full.create
int iCurrent
call super::create
end on

on w_vzt_contact_edit_full.destroy
call super::destroy
end on

type cb_dfilter from w_vzt_contact_edit`cb_dfilter within w_vzt_contact_edit_full
end type

type uo_trace01 from w_vzt_contact_edit`uo_trace01 within w_vzt_contact_edit_full
integer x = 3031
end type

type dw_mainlist from w_vzt_contact_edit`dw_mainlist within w_vzt_contact_edit_full
integer width = 3616
string dataobject = "d_contact_list_full"
end type

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'firstname_t', 'firstname A', 'firstname D')
this.inv_field_sort.of_setcolumn( 'lastname_t', 'lastname A, firstname A', 'lastname D, firstname D')
this.inv_field_sort.of_setcolumn( 'contacttype_t', 'contacttype A, lastname A, firstname A', 'contacttype D, firstname A, lastname A')
this.setsort( 'contacttype A, lastname A, firstname A')

end event

type cb_last_search from w_vzt_contact_edit`cb_last_search within w_vzt_contact_edit_full
integer x = 928
integer y = 2020
end type

type cb_close from w_vzt_contact_edit`cb_close within w_vzt_contact_edit_full
integer x = 3305
integer y = 2020
integer width = 197
end type

type cb_delete1 from w_vzt_contact_edit`cb_delete1 within w_vzt_contact_edit_full
integer x = 1390
integer y = 2020
end type

type cb_save from w_vzt_contact_edit`cb_save within w_vzt_contact_edit_full
integer x = 750
integer y = 2020
end type

type cb_select from w_vzt_contact_edit`cb_select within w_vzt_contact_edit_full
integer x = 576
integer y = 2020
end type

type cb_new from w_vzt_contact_edit`cb_new within w_vzt_contact_edit_full
integer x = 1239
integer y = 2020
end type

type cb_newsearch from w_vzt_contact_edit`cb_newsearch within w_vzt_contact_edit_full
integer y = 2020
integer width = 329
end type

type cb_search from w_vzt_contact_edit`cb_search within w_vzt_contact_edit_full
integer x = 370
integer y = 2020
end type

type st_foundrecs from w_vzt_contact_edit`st_foundrecs within w_vzt_contact_edit_full
integer x = 1573
integer y = 2020
end type

type st_stop from w_vzt_contact_edit`st_stop within w_vzt_contact_edit_full
integer x = 1591
integer y = 2020
end type

type dw_data from w_vzt_contact_edit`dw_data within w_vzt_contact_edit_full
integer width = 3616
end type

type dw_print from w_vzt_contact_edit`dw_print within w_vzt_contact_edit_full
integer x = 3205
end type

type uo_ddcal from w_vzt_contact_edit`uo_ddcal within w_vzt_contact_edit_full
end type

type dw_answers from w_vzt_contact_edit`dw_answers within w_vzt_contact_edit_full
integer width = 3616
integer height = 1300
string dataobject = "d_full_address_edit"
end type

event dw_answers::ue_setmasks;call super::ue_setmasks;if f_nvl(gnv_appman.is_phonemask ,'') = ''  then return 
this.Object.phone.EditMask.Mask	= gnv_appman.is_phonemask 

end event

type cb_ins from w_vzt_contact_edit`cb_ins within w_vzt_contact_edit_full
integer x = 1861
integer y = 2020
end type

type cb_del from w_vzt_contact_edit`cb_del within w_vzt_contact_edit_full
integer x = 2117
integer y = 2020
end type

type r_1 from w_vzt_contact_edit`r_1 within w_vzt_contact_edit_full
integer y = 2000
integer width = 3616
end type

type dw_contact_address from w_vzt_contact_edit`dw_contact_address within w_vzt_contact_edit_full
integer x = 3122
end type

