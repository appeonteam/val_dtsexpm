$PBExportHeader$w_equipment_report_productivity.srw
forward
global type w_equipment_report_productivity from window
end type
type dw_2 from datawindow within w_equipment_report_productivity
end type
type dw_1 from datawindow within w_equipment_report_productivity
end type
end forward

global type w_equipment_report_productivity from window
integer width = 4027
integer height = 2364
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
dw_2 dw_2
dw_1 dw_1
end type
global w_equipment_report_productivity w_equipment_report_productivity

on w_equipment_report_productivity.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on w_equipment_report_productivity.destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;dw_1.setTrans(SQLCA);
dw_1.retrieve();


dw_2.setTrans(SQLCA);
dw_2.retrieve();

end event

type dw_2 from datawindow within w_equipment_report_productivity
integer x = 55
integer y = 1208
integer width = 3296
integer height = 1016
integer taborder = 20
string title = "none"
string dataobject = "d_equipment_productivity_report_header"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_equipment_report_productivity
integer x = 59
integer y = 60
integer width = 3858
integer height = 1096
integer taborder = 10
string title = "none"
string dataobject = "rjt_rpt_productivity"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

