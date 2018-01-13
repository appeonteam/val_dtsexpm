$PBExportHeader$hkhvk.srw
forward
global type hkhvk from window
end type
type cb_1 from commandbutton within hkhvk
end type
end forward

global type hkhvk from window
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
global hkhvk hkhvk

on hkhvk.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on hkhvk.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within hkhvk
integer x = 1234
integer y = 684
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

