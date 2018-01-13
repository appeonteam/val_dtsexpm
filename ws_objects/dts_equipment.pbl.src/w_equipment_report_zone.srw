$PBExportHeader$w_equipment_report_zone.srw
forward
global type w_equipment_report_zone from window
end type
type cb_1 from commandbutton within w_equipment_report_zone
end type
type dw_1 from datawindow within w_equipment_report_zone
end type
end forward

global type w_equipment_report_zone from window
integer width = 4082
integer height = 2372
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
end type
global w_equipment_report_zone w_equipment_report_zone

on w_equipment_report_zone.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_equipment_report_zone.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.setTrans(SQLCA);
dw_1.retrieve();
end event

type cb_1 from commandbutton within w_equipment_report_zone
integer x = 3602
integer y = 2136
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print"
end type

event clicked;dw_1.print();
end event

type dw_1 from datawindow within w_equipment_report_zone
integer x = 50
integer y = 68
integer width = 3954
integer height = 2012
integer taborder = 10
string title = "none"
string dataobject = "rjt_rpt_equipment_by_zone_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

