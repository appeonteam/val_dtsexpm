$PBExportHeader$w_set_toolbars.srw
$PBExportComments$Sets toolbar options
forward
global type w_set_toolbars from window
end type
type cbx_showtext from checkbox within w_set_toolbars
end type
type rb_floating from radiobutton within w_set_toolbars
end type
type rb_left from radiobutton within w_set_toolbars
end type
type rb_right from radiobutton within w_set_toolbars
end type
type rb_bottom from radiobutton within w_set_toolbars
end type
type rb_top from radiobutton within w_set_toolbars
end type
type cb_2 from commandbutton within w_set_toolbars
end type
type cb_visible from commandbutton within w_set_toolbars
end type
type gb_2 from groupbox within w_set_toolbars
end type
type gb_1 from groupbox within w_set_toolbars
end type
end forward

global type w_set_toolbars from window
integer x = 850
integer y = 468
integer width = 1221
integer height = 756
boolean titlebar = true
string title = "Customize Toolbars"
boolean controlmenu = true
boolean resizable = true
windowtype windowtype = response!
long backcolor = 134217750
cbx_showtext cbx_showtext
rb_floating rb_floating
rb_left rb_left
rb_right rb_right
rb_bottom rb_bottom
rb_top rb_top
cb_2 cb_2
cb_visible cb_visible
gb_2 gb_2
gb_1 gb_1
end type
global w_set_toolbars w_set_toolbars

type variables
window win_ref
end variables

on open;win_ref = message.powerobjectparm
if win_ref.toolbaralignment = alignatbottom! then
	rb_bottom.checked = True
elseif win_ref.toolbaralignment = alignatleft! then
	rb_left.checked = true
elseif win_ref.toolbaralignment = alignatright! then
	rb_right.checked = true
elseif win_ref.toolbaralignment = alignattop! then
	rb_top.checked = true
elseif win_ref.toolbaralignment = floating! then
	rb_floating.checked = true
end if
if win_ref.toolbarvisible then
	cb_visible.text = "&Hide"
else
	cb_visible.text = "&Show"
end if

if dispatch_tracking_system.toolbartext then
	cbx_showtext.checked = TRUE
else
	cbx_showtext.checked = FALSE
end if

	
end on

on w_set_toolbars.create
this.cbx_showtext=create cbx_showtext
this.rb_floating=create rb_floating
this.rb_left=create rb_left
this.rb_right=create rb_right
this.rb_bottom=create rb_bottom
this.rb_top=create rb_top
this.cb_2=create cb_2
this.cb_visible=create cb_visible
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cbx_showtext,&
this.rb_floating,&
this.rb_left,&
this.rb_right,&
this.rb_bottom,&
this.rb_top,&
this.cb_2,&
this.cb_visible,&
this.gb_2,&
this.gb_1}
end on

on w_set_toolbars.destroy
destroy(this.cbx_showtext)
destroy(this.rb_floating)
destroy(this.rb_left)
destroy(this.rb_right)
destroy(this.rb_bottom)
destroy(this.rb_top)
destroy(this.cb_2)
destroy(this.cb_visible)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type cbx_showtext from checkbox within w_set_toolbars
integer x = 645
integer y = 144
integer width = 443
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
long backcolor = 134217750
string text = "Show Te&xt"
borderstyle borderstyle = styleraised!
end type

on clicked;
if this.checked then
	dispatch_tracking_system.toolbartext = True
else
	dispatch_tracking_system.toolbartext = False
end if
end on

type rb_floating from radiobutton within w_set_toolbars
integer x = 151
integer y = 464
integer width = 411
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
long backcolor = 134217750
string text = "&Floating"
borderstyle borderstyle = styleraised!
end type

on clicked;win_ref.toolbaralignment = floating!
win_ref.toolbarx = parent.x + parent.width/3 
win_ref.toolbary = parent.y + 2*(parent.height/3)

end on

type rb_left from radiobutton within w_set_toolbars
integer x = 151
integer y = 116
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
long backcolor = 134217750
string text = "&Left"
borderstyle borderstyle = styleraised!
end type

on clicked;win_ref.toolbaralignment = alignatleft!
end on

type rb_right from radiobutton within w_set_toolbars
integer x = 151
integer y = 204
integer width = 293
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
long backcolor = 134217750
string text = "&Right"
borderstyle borderstyle = styleraised!
end type

on clicked;win_ref.toolbaralignment = alignatright!
end on

type rb_bottom from radiobutton within w_set_toolbars
integer x = 151
integer y = 376
integer width = 347
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
long backcolor = 134217750
string text = "&Bottom"
borderstyle borderstyle = styleraised!
end type

on clicked;win_ref.toolbaralignment = alignatbottom!
end on

type rb_top from radiobutton within w_set_toolbars
integer x = 151
integer y = 292
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
long backcolor = 134217750
string text = "&Top"
borderstyle borderstyle = styleraised!
end type

on clicked;win_ref.toolbaralignment = alignattop!
end on

type cb_2 from commandbutton within w_set_toolbars
integer x = 722
integer y = 412
integer width = 261
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
string text = "&Done"
end type

on clicked;
Close (parent)
end on

type cb_visible from commandbutton within w_set_toolbars
integer x = 722
integer y = 268
integer width = 261
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
string pointer = "HAND.CUR"
string text = "&Hide"
end type

on clicked;If this.text = "&Hide" then
	win_ref.toolbarvisible = False
	this.text = "&Show"
else
	win_ref.toolbarvisible = True
	this.text = "&Hide"
end if
end on

type gb_2 from groupbox within w_set_toolbars
integer x = 608
integer y = 40
integer width = 494
integer height = 532
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33512283
long backcolor = 134217750
string text = "Change"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_set_toolbars
integer x = 87
integer y = 44
integer width = 503
integer height = 528
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = swiss!
string facename = "System"
long textcolor = 33512283
long backcolor = 134217750
string text = "Move"
borderstyle borderstyle = styleraised!
end type

