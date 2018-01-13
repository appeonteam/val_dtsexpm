$PBExportHeader$w_vzt_replace_lookup.srw
forward
global type w_vzt_replace_lookup from w_vzt_base_lookup
end type
end forward

global type w_vzt_replace_lookup from w_vzt_base_lookup
integer width = 1111
integer height = 820
end type
global w_vzt_replace_lookup w_vzt_replace_lookup

on w_vzt_replace_lookup.create
call super::create
end on

on w_vzt_replace_lookup.destroy
call super::destroy
end on

event ue_preopen;// overr 
is_code_colname 	= "code"
is_name_colname 	= "descr" 
is_lookup_name	= 'VZT_AUTODATE'

dw_1._selection_service = 'S'  // 'S' single, 'M' - multi
dw_1.dataobject	= 'd_vzt_lookup01'
dw_1.Settransobject( SQLCA) 
dw_1.Retrieve( is_lookup_name	)

//copy and override in the descendant !!!
end event

type cb_inv from w_vzt_base_lookup`cb_inv within w_vzt_replace_lookup
integer x = 251
integer height = 68
end type

type cb_clear from w_vzt_base_lookup`cb_clear within w_vzt_replace_lookup
integer x = 626
integer width = 215
integer height = 68
end type

type dw_1 from w_vzt_base_lookup`dw_1 within w_vzt_replace_lookup
integer x = 9
integer width = 1088
string dataobject = "d_vzt_autodate_lookup"
end type

type cb_1 from w_vzt_base_lookup`cb_1 within w_vzt_replace_lookup
boolean visible = false
integer x = 361
integer height = 68
end type

type cb_cancel from w_vzt_base_lookup`cb_cancel within w_vzt_replace_lookup
integer x = 846
integer width = 219
integer height = 68
end type

type cb_select from w_vzt_base_lookup`cb_select within w_vzt_replace_lookup
integer x = 18
integer width = 215
integer height = 68
end type

