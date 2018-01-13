$PBExportHeader$w_equipment_report_category.srw
forward
global type w_equipment_report_category from window
end type
type cb_1 from commandbutton within w_equipment_report_category
end type
type dw_1 from datawindow within w_equipment_report_category
end type
end forward

global type w_equipment_report_category from window
integer width = 4786
integer height = 2328
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
global w_equipment_report_category w_equipment_report_category

on w_equipment_report_category.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_equipment_report_category.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.setTrans(SQLCA);
dw_1.retrieve();
end event

type cb_1 from commandbutton within w_equipment_report_category
integer x = 4302
integer y = 2104
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

type dw_1 from datawindow within w_equipment_report_category
integer x = 46
integer y = 56
integer width = 4649
integer height = 2020
integer taborder = 10
string title = "none"
string dataobject = "rjt_rpt_equipment_by_category_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

