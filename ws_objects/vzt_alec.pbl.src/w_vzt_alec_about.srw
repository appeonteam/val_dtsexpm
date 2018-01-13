$PBExportHeader$w_vzt_alec_about.srw
forward
global type w_vzt_alec_about from w_vzt_about
end type
end forward

global type w_vzt_alec_about from w_vzt_about
integer width = 2030
integer height = 1756
string title = "Alec! About Window"
long backcolor = 12632256
end type
global w_vzt_alec_about w_vzt_alec_about

on w_vzt_alec_about.create
call super::create
end on

on w_vzt_alec_about.destroy
call super::destroy
end on

type cb_1 from w_vzt_about`cb_1 within w_vzt_alec_about
integer x = 919
integer y = 1524
integer height = 84
end type

type dw_about from w_vzt_about`dw_about within w_vzt_alec_about
integer x = 5
integer y = 4
integer width = 2002
integer height = 1496
string dataobject = "d_vzt_alec_about"
end type

