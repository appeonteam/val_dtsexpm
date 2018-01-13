$PBExportHeader$w_vzt_color.srw
forward
global type w_vzt_color from w_vzt_base_lookup
end type
type uo_1 from u_vzt_color_selection within w_vzt_color
end type
end forward

global type w_vzt_color from w_vzt_base_lookup
integer width = 846
integer height = 636
uo_1 uo_1
end type
global w_vzt_color w_vzt_color

type variables
string is_color
end variables

on w_vzt_color.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_vzt_color.destroy
call super::destroy
destroy(this.uo_1)
end on

event open;//overr
end event

type cb_inv from w_vzt_base_lookup`cb_inv within w_vzt_color
end type

type cb_clear from w_vzt_base_lookup`cb_clear within w_vzt_color
end type

type dw_1 from w_vzt_base_lookup`dw_1 within w_vzt_color
boolean visible = false
integer x = 869
integer y = 16
integer height = 564
end type

type cb_1 from w_vzt_base_lookup`cb_1 within w_vzt_color
boolean visible = false
boolean enabled = false
end type

type cb_cancel from w_vzt_base_lookup`cb_cancel within w_vzt_color
integer x = 480
integer y = 488
integer height = 76
end type

event cb_cancel::clicked;//overr istr_ret.newvalue = 

closewithreturn(parent, "CANCEL")
end event

type cb_select from w_vzt_base_lookup`cb_select within w_vzt_color
integer x = 178
integer y = 488
integer height = 76
string text = "OK"
end type

event cb_select::clicked;//overr

Closewithreturn(parent,is_parmvalue)


end event

type uo_1 from u_vzt_color_selection within w_vzt_color
integer x = 27
integer y = 24
integer height = 448
integer taborder = 20
boolean bringtotop = true
long backcolor = 79349703
end type

on uo_1.destroy
call u_vzt_color_selection::destroy
end on

event ue_color_changed;is_parmvalue = string ( al_color )
return 1
end event

