$PBExportHeader$w_asset_explorer.srw
forward
global type w_asset_explorer from window
end type
type dw_1 from datawindow within w_asset_explorer
end type
end forward

global type w_asset_explorer from window
integer width = 3168
integer height = 1780
boolean titlebar = true
string title = "Asset Explorer"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_asset_explorer w_asset_explorer

on w_asset_explorer.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_asset_explorer.destroy
destroy(this.dw_1)
end on

event open;
dw_1.Retrieve()

end event

type dw_1 from datawindow within w_asset_explorer
integer x = 206
integer y = 132
integer width = 2802
integer height = 1440
integer taborder = 10
string title = "none"
string dataobject = "d_equipment_zone"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

