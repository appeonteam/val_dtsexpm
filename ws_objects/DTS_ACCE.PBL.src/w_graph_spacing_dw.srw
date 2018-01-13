$PBExportHeader$w_graph_spacing_dw.srw
$PBExportComments$General response window to set DW graph spacing.
forward
global type w_graph_spacing_dw from Window
end type
type em_spacing from editmask within w_graph_spacing_dw
end type
type cb_cancel from commandbutton within w_graph_spacing_dw
end type
type cb_ok from commandbutton within w_graph_spacing_dw
end type
end forward

global type w_graph_spacing_dw from Window
int X=1079
int Y=369
int Width=951
int Height=513
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
global w_graph_spacing_dw w_graph_spacing_dw

type variables
datawindow dw_parm
string original_spacing
end variables

on w_graph_spacing_dw.create
this.em_spacing=create em_spacing
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={ this.em_spacing,&
this.cb_cancel,&
this.cb_ok}
end on

on w_graph_spacing_dw.destroy
destroy(em_spacing)
destroy(cb_cancel)
destroy(cb_ok)
end on

on open;dw_parm = Message.PowerObjectParm
em_spacing.text = dw_parm.DWDescribe ("gr_1.spacing")
original_spacing = em_spacing.text
end on

type em_spacing from editmask within w_graph_spacing_dw
int X=183
int Y=69
int Width=531
int Height=101
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="#####"
boolean Spin=true
double Increment=10
string MinMax="10	300"
long BackColor=12632256
int TextSize=UnitsToPixels(53,YUnitsToPixels!)
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on modified;dw_parm.DWModify ("gr_1.spacing=" + em_spacing.text)



end on

type cb_cancel from commandbutton within w_graph_spacing_dw
int X=476
int Y=253
int Width=247
int Height=109
int TabOrder=20
string Text="Cancel"
boolean Cancel=true
int TextSize=UnitsToPixels(53,YUnitsToPixels!)
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;dw_parm.DWModify ("gr_1.spacing=" + original_spacing)
Close (parent)
end on

type cb_ok from commandbutton within w_graph_spacing_dw
int X=179
int Y=253
int Width=247
int Height=109
int TabOrder=30
string Text="OK"
boolean Default=true
int TextSize=UnitsToPixels(53,YUnitsToPixels!)
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;

Close (parent) 
end on

