$PBExportHeader$w_about.srw
$PBExportComments$About Window for Dispatch Tracking System 4 Win v2.0
forward
global type w_about from window
end type
type pb_ok from picturebutton within w_about
end type
type st_banner2 from statictext within w_about
end type
type st_banner1 from statictext within w_about
end type
type st_copyright from statictext within w_about
end type
type st_rightsreserved from statictext within w_about
end type
type pb_logo from picturebutton within w_about
end type
end forward

global type w_about from window
integer x = 526
integer y = 420
integer width = 1966
integer height = 1428
boolean titlebar = true
string title = "About Dispatch for Windows v2.0"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30589613
string icon = "None!"
pb_ok pb_ok
st_banner2 st_banner2
st_banner1 st_banner1
st_copyright st_copyright
st_rightsreserved st_rightsreserved
pb_logo pb_logo
end type
global w_about w_about

on open;st_banner1.Text = cAppName + " " + cAppversion + " for " + cOSName + " " + cOSVersion
st_banner2.Text = cSysName + " Systems " + cSysVersion

end on

on w_about.create
this.pb_ok=create pb_ok
this.st_banner2=create st_banner2
this.st_banner1=create st_banner1
this.st_copyright=create st_copyright
this.st_rightsreserved=create st_rightsreserved
this.pb_logo=create pb_logo
this.Control[]={this.pb_ok,&
this.st_banner2,&
this.st_banner1,&
this.st_copyright,&
this.st_rightsreserved,&
this.pb_logo}
end on

on w_about.destroy
destroy(this.pb_ok)
destroy(this.st_banner2)
destroy(this.st_banner1)
destroy(this.st_copyright)
destroy(this.st_rightsreserved)
destroy(this.pb_logo)
end on

type pb_ok from picturebutton within w_about
integer x = 859
integer y = 1120
integer width = 174
integer height = 152
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean default = true
boolean originalsize = true
string picturename = "exit02.bmp"
end type

on clicked;close(parent)
end on

type st_banner2 from statictext within w_about
integer x = 219
integer y = 248
integer width = 1458
integer height = 132
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 16777215
long backcolor = 33086168
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_banner1 from statictext within w_about
integer x = 37
integer y = 36
integer width = 1819
integer height = 160
integer textsize = -20
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 255
long backcolor = 33086168
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_copyright from statictext within w_about
integer x = 64
integer y = 1156
integer width = 759
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 16777215
long backcolor = 30589613
boolean enabled = false
string text = "Copyright (c) 1995-2004"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_rightsreserved from statictext within w_about
integer x = 1074
integer y = 1156
integer width = 759
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 16777215
long backcolor = 30589613
boolean enabled = false
string text = "All Rights Reserved"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_logo from picturebutton within w_about
integer x = 571
integer y = 428
integer width = 654
integer height = 648
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\BMPS\HE\CleanLogo.bmp"
end type

on clicked;pb_ok.TriggerEvent( Clicked! )
end on

