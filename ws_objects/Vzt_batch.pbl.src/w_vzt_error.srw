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

event open;call super::open;If trim(gnv_appman.is_error_email) = '' then
	sle_1.text = 'support@metromediasoftware.com'
ELSE
	sle_1.text = gnv_appman.is_error_email
END IF
end event

type sle_1 from w_vzt_base_error`sle_1 within w_vzt_error
int Width=549
boolean BringToTop=true
end type

