$PBExportHeader$w_t.srw
forward
global type w_t from window
end type
type cb_1 from commandbutton within w_t
end type
end forward

global type w_t from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_t w_t

on w_t.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_t.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_t
integer x = 736
integer y = 604
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

