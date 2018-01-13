$PBExportHeader$w_vzt_error.srw
forward
global type w_vzt_error from w_vzt_base_error
end type
end forward

global type w_vzt_error from w_vzt_base_error
end type
global w_vzt_error w_vzt_error

on w_vzt_error.create
call super::create
end on

on w_vzt_error.destroy
call super::destroy
end on

event open;call super::open;sle_1.text = 'support@metromediasoftware.com'
end event

type dw_response from w_vzt_base_error`dw_response within w_vzt_error
end type

type cb_2 from w_vzt_base_error`cb_2 within w_vzt_error
end type

type cb_1 from w_vzt_base_error`cb_1 within w_vzt_error
end type

type cb_3 from w_vzt_base_error`cb_3 within w_vzt_error
end type

type sle_1 from w_vzt_base_error`sle_1 within w_vzt_error
integer x = 1129
integer width = 549
end type

