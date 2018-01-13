$PBExportHeader$w_vzt_alec_about_flash.srw
forward
global type w_vzt_alec_about_flash from w_vzt_alec_about
end type
end forward

global type w_vzt_alec_about_flash from w_vzt_alec_about
boolean visible = false
integer width = 2034
integer height = 1628
boolean controlmenu = false
windowtype windowtype = main!
long backcolor = 12632256
event ue_postopen ( )
end type
global w_vzt_alec_about_flash w_vzt_alec_about_flash

event ue_postopen;//f_wait ( 3 ) 
//close (this)
//return 
end event

on w_vzt_alec_about_flash.create
call super::create
end on

on w_vzt_alec_about_flash.destroy
call super::destroy
end on

event open;call super::open;this.event post ue_postopen()
this.visible = true
end event

type cb_1 from w_vzt_alec_about`cb_1 within w_vzt_alec_about_flash
boolean visible = false
integer x = 443
end type

type dw_about from w_vzt_alec_about`dw_about within w_vzt_alec_about_flash
integer y = 0
end type

