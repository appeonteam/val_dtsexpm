﻿$PBExportHeader$w_gcc_letter_thanks_preferred.srw
forward
global type w_gcc_letter_thanks_preferred from w_gcc_letter
end type
end forward

global type w_gcc_letter_thanks_preferred from w_gcc_letter
boolean TitleBar=true
string Title="GCC  Preferred Guest Letter "
long BackColor=80269528
end type
global w_gcc_letter_thanks_preferred w_gcc_letter_thanks_preferred

on w_gcc_letter_thanks_preferred.create
call super::create
end on

on w_gcc_letter_thanks_preferred.destroy
call super::destroy
end on

event open;call super::open;id_oleid = 10
is_action_code = 'PGL'
is_descr			= 'Preferred guest letter'
sle_1.text		= 'Thank you ...'
end event

type st_foundrecs from w_gcc_letter`st_foundrecs within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type st_stop from w_gcc_letter`st_stop within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type dw_print from w_gcc_letter`dw_print within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type ole_1 from w_gcc_letter`ole_1 within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type cb_getfile from w_gcc_letter`cb_getfile within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type cb_history from w_gcc_letter`cb_history within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type cb_mail from w_gcc_letter`cb_mail within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type sle_1 from w_gcc_letter`sle_1 within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type st_1 from w_gcc_letter`st_1 within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type st_2 from w_gcc_letter`st_2 within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type sle_2 from w_gcc_letter`sle_2 within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type st_3 from w_gcc_letter`st_3 within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

type dw_guest from w_gcc_letter`dw_guest within w_gcc_letter_thanks_preferred
boolean BringToTop=true
end type

