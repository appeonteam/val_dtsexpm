$PBExportHeader$w_gcc_letter_rebates.srw
forward
global type w_gcc_letter_rebates from w_gcc_letter
end type
end forward

global type w_gcc_letter_rebates from w_gcc_letter
int Height=1924
boolean TitleBar=true
string Title="GCC Rebates Letter"
end type
global w_gcc_letter_rebates w_gcc_letter_rebates

on w_gcc_letter_rebates.create
call super::create
end on

on w_gcc_letter_rebates.destroy
call super::destroy
end on

event open;call super::open;id_oleid = 3
is_action_code = 'REL'
is_descr			= 'Rebates letter'
sle_1.text		= 'Sorry for your inconvenience...'
end event

type st_foundrecs from w_gcc_letter`st_foundrecs within w_gcc_letter_rebates
boolean BringToTop=true
end type

type st_stop from w_gcc_letter`st_stop within w_gcc_letter_rebates
boolean BringToTop=true
end type

type dw_print from w_gcc_letter`dw_print within w_gcc_letter_rebates
boolean BringToTop=true
end type

type ole_1 from w_gcc_letter`ole_1 within w_gcc_letter_rebates
boolean BringToTop=true
end type

type cb_history from w_gcc_letter`cb_history within w_gcc_letter_rebates
boolean BringToTop=true
end type

type cb_mail from w_gcc_letter`cb_mail within w_gcc_letter_rebates
boolean BringToTop=true
end type

type sle_1 from w_gcc_letter`sle_1 within w_gcc_letter_rebates
boolean BringToTop=true
end type

type st_1 from w_gcc_letter`st_1 within w_gcc_letter_rebates
boolean BringToTop=true
end type

type dw_guest from w_gcc_letter`dw_guest within w_gcc_letter_rebates
boolean BringToTop=true
end type

