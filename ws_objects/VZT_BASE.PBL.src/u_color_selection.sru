$PBExportHeader$u_color_selection.sru
$PBExportComments$Color selector, with SLEs and HScrollBars for R,G,B
forward
global type u_color_selection from userobject
end type
type st_3 from statictext within u_color_selection
end type
type st_2 from statictext within u_color_selection
end type
type st_1 from statictext within u_color_selection
end type
type hsb_green from hscrollbar within u_color_selection
end type
type hsb_red from hscrollbar within u_color_selection
end type
type sle_blue from singlelineedit within u_color_selection
end type
type sle_green from singlelineedit within u_color_selection
end type
type sle_red from singlelineedit within u_color_selection
end type
type hsb_blue from hscrollbar within u_color_selection
end type
type st_4 from statictext within u_color_selection
end type
type rr_1 from roundrectangle within u_color_selection
end type
end forward

global type u_color_selection from userobject
integer width = 750
integer height = 460
boolean border = true
long backcolor = 12632256
event color_changed pbm_custom01
event mousemove pbm_mousemove
st_3 st_3
st_2 st_2
st_1 st_1
hsb_green hsb_green
hsb_red hsb_red
sle_blue sle_blue
sle_green sle_green
sle_red sle_red
hsb_blue hsb_blue
st_4 st_4
rr_1 rr_1
end type
global u_color_selection u_color_selection

type variables
int r,g,b
end variables

forward prototypes
global function long get_rgb ()
subroutine set_rgb (long background_rgb)
end prototypes

event mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
//	f_MicroHelp( This.Tag ) //vz 2005–05–15
End If

end event

global function long get_rgb ();return rgb (r, g, b)
end function

subroutine set_rgb (long background_rgb);long color

color = background_rgb
r = Mod (color,256)
color = color/256
g = Mod (color,256)
color = color/256
b = Mod (color,256)
rr_1.fillcolor = rgb(r,g,b)
sle_red.text = string (r)
sle_green.text = string (g)
sle_blue.text = string (b)
hsb_red.position = r
hsb_green.position = g
hsb_blue.position = b

end subroutine

on constructor;// PB3 doesn't have a uo painter-settable way of doing this
This.Tag = "Click an Arrow or Number to change desired color setting in Red-Green-Blue (RGB) color-box above controls."
end on

on u_color_selection.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.hsb_green=create hsb_green
this.hsb_red=create hsb_red
this.sle_blue=create sle_blue
this.sle_green=create sle_green
this.sle_red=create sle_red
this.hsb_blue=create hsb_blue
this.st_4=create st_4
this.rr_1=create rr_1
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.hsb_green,&
this.hsb_red,&
this.sle_blue,&
this.sle_green,&
this.sle_red,&
this.hsb_blue,&
this.st_4,&
this.rr_1}
end on

on u_color_selection.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.hsb_green)
destroy(this.hsb_red)
destroy(this.sle_blue)
destroy(this.sle_green)
destroy(this.sle_red)
destroy(this.hsb_blue)
destroy(this.st_4)
destroy(this.rr_1)
end on

type st_3 from statictext within u_color_selection
integer x = 32
integer y = 332
integer width = 178
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Blue"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
end type

type st_2 from statictext within u_color_selection
integer x = 32
integer y = 236
integer width = 178
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Green"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
end type

type st_1 from statictext within u_color_selection
integer x = 32
integer y = 144
integer width = 178
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Red"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
end type

type hsb_green from hscrollbar within u_color_selection
event mousemove pbm_mousemove
string tag = "Click left arrow to decrease or right arrow to increase amount of Green in above color-box."
integer x = 384
integer y = 236
integer width = 311
integer height = 52
integer taborder = 40
integer maxposition = 255
end type

event mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	f_MicroHelp( This.Tag ) //vz 2005–05–15
//End If
//
end event

on pageleft;// Pageleft script for hsb_green

if g < 25 then
	g = 0
else
	g = g - 25
end if
sle_green.text = String(g)
this.position = g
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on lineleft;// Lineleft script for hsb_green

if g < 1 then
	g = 0
else
	g = g - 1
end if
sle_green.text = String(g)
this.position = g
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on lineright;// Lineright script for hsb_green

if g > 254 then
	g = 255
else
	g = g + 1
end if
sle_green.text = String(g)
this.position = g
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on moved;// Moved script for hsb_green

g = this.position
sle_green.text = String(g)
rr_1.fillcolor = RGB(r,g,b)
parent.TriggerEvent("color_changed")
end on

on pageright;// Pageright script for hsb_green

if g > 230 then
	g = 255
else
	g = g + 25
end if
sle_green.text = String(g)
this.position = g
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

type hsb_red from hscrollbar within u_color_selection
event mousemove pbm_mousemove
string tag = "Click left arrow to decrease or right arrow to increase amount of Red in above color-box."
integer x = 384
integer y = 144
integer width = 311
integer height = 52
integer taborder = 20
integer maxposition = 255
end type

event mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	f_MicroHelp( This.Tag ) //vz 2005–05–15
//End If
//
end event

on pageright;// Pageright script for hsb_red

if r > 230 then
	r = 255
else
	r = r + 25
end if
sle_red.text = String(r)
this.position = r
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on lineleft;// Lineleft script for hsb_red

if r < 1 then
	r = 0
else
	r = r - 1
end if
sle_red.text = String(r)
this.position = r
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on lineright;// Lineright script for hsb_red


if r > 254 then
	r = 255
else
	r = r + 1
end if
sle_red.text = String(r)
this.position = r
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on moved;// Moved script for hsb_red

r = this.position
sle_red.text = String(r)
rr_1.fillcolor = RGB(r,g,b)
parent.TriggerEvent("color_changed")
end on

on pageleft;// Pageleft script for hsb_red

if r < 25 then
	r = 0
else
	r = r - 25
end if
sle_red.text = String(r)
this.position = r
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

type sle_blue from singlelineedit within u_color_selection
string tag = "Click here to enter the amount of Blue in above color-box"
integer x = 219
integer y = 332
integer width = 151
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helv"
string pointer = "arrow!"
long textcolor = 16777215
long backcolor = 16711680
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;// Modified script for sle_blue

int	new_value

new_value = Integer(this.text)
if new_value < 0 or new_value > 255 then
	Beep(2)
	this.text = String(b)
	Return
end if

b = new_value

rr_1.fillcolor = RGB(r,g,b)
hsb_blue.position = b
parent.TriggerEvent("color_changed")
end on

type sle_green from singlelineedit within u_color_selection
string tag = "Click here to enter the amount of Green in above color-box"
integer x = 219
integer y = 236
integer width = 151
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helv"
string pointer = "arrow!"
long backcolor = 65280
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;// Modified script for sle_green

int	new_value

new_value = Integer(this.text)
if new_value < 0 or new_value > 255 then
	Beep(2)
	this.text = String(g)
	Return
end if

g = new_value

rr_1.fillcolor = RGB(r,g,b)
hsb_green.position = g
TriggerEvent("color_changed")
end on

type sle_red from singlelineedit within u_color_selection
string tag = "Click here to enter the amount of Red in above color-box"
integer x = 219
integer y = 140
integer width = 151
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helv"
string pointer = "Arrow!"
long textcolor = 16777215
long backcolor = 255
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;// Modified script for sle_red

int	new_value

new_value = Integer(this.text)
if new_value < 0 or new_value > 255 then
	Beep(2)
	this.text = String(r)
	Return
end if

//r = Integer(this.text)
r = new_value

rr_1.fillcolor = RGB(r,g,b)
hsb_red.position = r
parent.TriggerEvent("color_changed")
end on

type hsb_blue from hscrollbar within u_color_selection
event mousemove pbm_mousemove
string tag = "Click left arrow to decrease or right arrow to increase amount of Blue in above color-box."
integer x = 379
integer y = 332
integer width = 311
integer height = 52
integer taborder = 60
integer maxposition = 255
end type

event mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	f_MicroHelp( This.Tag ) //vz 2005–05–15
//End If
//
end event

on pageright;// Pageright script for hsb_blue

if b > 230 then
	b = 255
else
	b = b + 25
end if
sle_blue.text = String(b)
this.position = b
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on lineleft;// Lineleft script for hsb_blue

if b < 1 then
	b = 0
else
	b = b - 1
end if
sle_blue.text = String(b)
this.position = b
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on lineright;// Lineright script for hsb_blue

if b > 254 then
	b = 255
else
	b = b + 1
end if
sle_blue.text = String(b)
this.position = b
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

on moved;// Moved script for hsb_blue

b = this.position
sle_blue.text = string(b)
rr_1.fillcolor = RGB(r,g,b)
parent.TriggerEvent("color_changed")
end on

on pageleft;// Pageleft script for hsb_blue

if b < 25 then
	b = 0
else
	b = b - 25
end if
sle_blue.text = String(b)
this.position = b
rr_1.fillcolor = RGB(r,g,b)

parent.TriggerEvent("color_changed")
end on

type st_4 from statictext within u_color_selection
event mousemove pbm_mousemove
integer x = 18
integer y = 120
integer width = 704
integer height = 316
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	SetMicroHelp( w_main, Parent.Tag )
//End If
//
end event

type rr_1 from roundrectangle within u_color_selection
integer linethickness = 6
long fillcolor = 16777215
integer x = 23
integer y = 16
integer width = 690
integer height = 76
integer cornerheight = 445
integer cornerwidth = 40
end type

