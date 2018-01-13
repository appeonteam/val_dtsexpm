$PBExportHeader$w_equipment_linked_docs.srw
forward
global type w_equipment_linked_docs from w_call_linked_docs
end type
end forward

global type w_equipment_linked_docs from w_call_linked_docs
end type
global w_equipment_linked_docs w_equipment_linked_docs

on w_equipment_linked_docs.create
call super::create
end on

on w_equipment_linked_docs.destroy
call super::destroy
end on

type dw_doc from w_call_linked_docs`dw_doc within w_equipment_linked_docs
string dataobject = "d_equipment_doc_list"
end type

type cb_save from w_call_linked_docs`cb_save within w_equipment_linked_docs
end type

type cb_getfile from w_call_linked_docs`cb_getfile within w_equipment_linked_docs
end type

type cb_oleedit from w_call_linked_docs`cb_oleedit within w_equipment_linked_docs
end type

type cb_del from w_call_linked_docs`cb_del within w_equipment_linked_docs
end type

type cb_ins from w_call_linked_docs`cb_ins within w_equipment_linked_docs
end type

type ole_1 from w_call_linked_docs`ole_1 within w_equipment_linked_docs
end type

event ole_1::ue_ole_save_upd_ref_sql;double ld_ole, ld_doc_id ,ld_main_id 
ld_ole			= id_ole
ld_doc_id 		= id_doc_id 

if ld_ole > 0 then 
	UPDATE vzt_eq_docs SET ole_doc_id = :ld_ole 
	WHERE id = :ld_doc_id AND call_number = :is_call_number ;
	
	ld_ole = SQLCA.SQLCODE
end if
end event

