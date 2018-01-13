$PBExportHeader$u_vzt_ddcal_inline.sru
forward
global type u_vzt_ddcal_inline from u_vzt_ddcal
end type
type cb_close from commandbutton within u_vzt_ddcal_inline
end type
type r_2 from rectangle within u_vzt_ddcal_inline
end type
type r_1 from rectangle within u_vzt_ddcal_inline
end type
end forward

global type u_vzt_ddcal_inline from u_vzt_ddcal
integer width = 777
integer height = 712
cb_close cb_close
r_2 r_2
r_1 r_1
end type
global u_vzt_ddcal_inline u_vzt_ddcal_inline

on u_vzt_ddcal_inline.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.r_2=create r_2
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.r_2
this.Control[iCurrent+3]=this.r_1
end on

on u_vzt_ddcal_inline.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.r_2)
destroy(this.r_1)
end on

type sle_date from u_vzt_ddcal`sle_date within u_vzt_ddcal_inline
integer x = 174
integer y = 20
integer width = 311
end type

type cb_null from u_vzt_ddcal`cb_null within u_vzt_ddcal_inline
integer x = 498
integer y = 12
integer width = 183
end type

type cb_today from u_vzt_ddcal`cb_today within u_vzt_ddcal_inline
integer x = 14
integer y = 12
integer width = 155
end type

type p_1 from u_vzt_ddcal`p_1 within u_vzt_ddcal_inline
integer x = 594
integer y = 48
end type

type p_next from u_vzt_ddcal`p_next within u_vzt_ddcal_inline
integer x = 663
integer y = 104
end type

type p_prev from u_vzt_ddcal`p_prev within u_vzt_ddcal_inline
integer x = 41
integer y = 104
end type

type p_ddlb from u_vzt_ddcal`p_ddlb within u_vzt_ddcal_inline
integer x = 818
integer y = 32
end type

type dw_cal from u_vzt_ddcal`dw_cal within u_vzt_ddcal_inline
integer x = 14
integer y = 92
integer width = 736
integer height = 596
end type

type cb_close from commandbutton within u_vzt_ddcal_inline
integer x = 686
integer y = 12
integer width = 64
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "X"
end type

event clicked;parent.visible = false
end event

type r_2 from rectangle within u_vzt_ddcal_inline
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 10789024
integer x = 18
integer y = 4
integer width = 750
integer height = 704
end type

type r_1 from rectangle within u_vzt_ddcal_inline
integer linethickness = 4
long fillcolor = 12632256
integer width = 759
integer height = 696
end type

