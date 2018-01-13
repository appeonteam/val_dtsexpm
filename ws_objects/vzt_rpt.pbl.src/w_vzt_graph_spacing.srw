$PBExportHeader$w_vzt_graph_spacing.srw
forward
global type w_vzt_graph_spacing from Window
end type
type em_spacing from editmask within w_vzt_graph_spacing
end type
type cb_cancel from commandbutton within w_vzt_graph_spacing
end type
type cb_ok from commandbutton within w_vzt_graph_spacing
end type
end forward

global type w_vzt_graph_spacing from Window
int X=1079
int Y=368
int Width=951
int Height=512
boolean TitleBar=true
string Title="Select Spacing Percent"
long BackColor=12632256
boolean ControlMenu=true
boolean Resizable=true
WindowType WindowType=response!
em_spacing em_spacing
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_vzt_graph_spacing w_vzt_graph_spacing

type variables
datawindow dw_parm
string original_spacing
end variables

on w_vzt_graph_spacing.create
this.em_spacing=create em_spacing
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={this.em_spacing,&
this.cb_cancel,&
this.cb_ok}
end on

on w_vzt_graph_spacing.destroy
destroy(this.em_spacing)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;dw_parm = Message.PowerObjectParm
em_spacing.text = dw_parm.Describe ("gr_1.spacing")
original_spacing = em_spacing.text
end event

type em_spacing from editmask within w_vzt_graph_spacing
int X=183
int Y=68
int Width=530
int Height=100
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="#####"
boolean Spin=true
double Increment=10
string MinMax="10	300"
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;dw_parm.Modify ("gr_1.spacing=" + em_spacing.text)



end event

type cb_cancel from commandbutton within w_vzt_graph_spacing
int X=475
int Y=252
int Width=247
int Height=108
int TabOrder=20
string Text="Cancel"
boolean Cancel=true
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_parm.Modify ("gr_1.spacing=" + original_spacing)
Close (parent)
end event

type cb_ok from commandbutton within w_vzt_graph_spacing
int X=178
int Y=252
int Width=247
int Height=108
int TabOrder=30
string Text="OK"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;

Close (parent) 
end on

