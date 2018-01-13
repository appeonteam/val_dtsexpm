$PBExportHeader$w_gcc_about.srw
forward
global type w_gcc_about from w_vzt_about
end type
type st_rightsreserved from statictext within w_gcc_about
end type
type st_copyright from statictext within w_gcc_about
end type
type st_vz2 from statictext within w_gcc_about
end type
type st_vz1 from statictext within w_gcc_about
end type
end forward

global type w_gcc_about from w_vzt_about
integer x = 800
integer y = 236
integer width = 2633
integer height = 1276
long backcolor = 80269528
st_rightsreserved st_rightsreserved
st_copyright st_copyright
st_vz2 st_vz2
st_vz1 st_vz1
end type
global w_gcc_about w_gcc_about

on w_gcc_about.create
int iCurrent
call super::create
this.st_rightsreserved=create st_rightsreserved
this.st_copyright=create st_copyright
this.st_vz2=create st_vz2
this.st_vz1=create st_vz1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_rightsreserved
this.Control[iCurrent+2]=this.st_copyright
this.Control[iCurrent+3]=this.st_vz2
this.Control[iCurrent+4]=this.st_vz1
end on

on w_gcc_about.destroy
call super::destroy
destroy(this.st_rightsreserved)
destroy(this.st_copyright)
destroy(this.st_vz2)
destroy(this.st_vz1)
end on

type cb_1 from w_vzt_about`cb_1 within w_gcc_about
integer x = 1138
integer y = 980
end type

type dw_about from w_vzt_about`dw_about within w_gcc_about
integer y = 12
integer width = 2574
integer height = 936
string dataobject = "d_gcc_about"
end type

type st_rightsreserved from statictext within w_gcc_about
integer x = 23
integer y = 1016
integer width = 759
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79349703
boolean enabled = false
string text = "All Rights Reserved"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_copyright from statictext within w_gcc_about
integer x = 23
integer y = 968
integer width = 759
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79349703
boolean enabled = false
string text = "Copyright (c) 1996-2004"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_vz2 from statictext within w_gcc_about
integer x = 1486
integer y = 968
integer width = 992
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79349703
boolean enabled = false
string text = " WEB Surveys Copyright © 2001-2004"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_vz1 from statictext within w_gcc_about
integer x = 1490
integer y = 1024
integer width = 1019
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 79349703
boolean enabled = false
string text = "VZTECH Systems Inc. All Rights Reserved"
alignment alignment = center!
boolean focusrectangle = false
end type

