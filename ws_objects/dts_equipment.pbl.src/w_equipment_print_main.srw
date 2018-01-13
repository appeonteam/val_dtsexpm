$PBExportHeader$w_equipment_print_main.srw
forward
global type w_equipment_print_main from window
end type
type dw_1 from datawindow within w_equipment_print_main
end type
end forward

global type w_equipment_print_main from window
integer width = 4430
integer height = 2060
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_equipment_print_main w_equipment_print_main

on w_equipment_print_main.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_equipment_print_main.destroy
destroy(this.dw_1)
end on

event open;
string searchString;

searchString=Message.StringParm;

if (not isNull(searchString)) Then
		MessageBox("hi paramter passed ",searchString);
		dw_1.SetTransObject(SQLCA);
		dw_1.retrieve(searchString);		
end if
end event

type dw_1 from datawindow within w_equipment_print_main
integer x = 78
integer y = 64
integer width = 4224
integer height = 1824
integer taborder = 10
string title = "none"
string dataobject = "d_equipment_print_option"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

