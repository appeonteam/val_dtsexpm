$PBExportHeader$w_vzt_graph_title.srw
forward
global type w_vzt_graph_title from Window
end type
type cb_cancel from commandbutton within w_vzt_graph_title
end type
type cb_ok from commandbutton within w_vzt_graph_title
end type
type sle_title from singlelineedit within w_vzt_graph_title
end type
end forward

global type w_vzt_graph_title from Window
int X=873
int Y=1212
int Width=1161
int Height=512
boolean TitleBar=true
string Title="Enter Graph Title"
long BackColor=12632256
boolean ControlMenu=true
boolean Resizable=true
WindowType WindowType=response!
cb_cancel cb_cancel
cb_ok cb_ok
sle_title sle_title
end type
global w_vzt_graph_title w_vzt_graph_title

type variables
datawindow dw_parm
string original_title
end variables

on w_vzt_graph_title.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_title=create sle_title
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.sle_title}
end on

on w_vzt_graph_title.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_title)
end on

event open;// The calling window has passed the current datawindow object. 
// Initialize the Single Line Edit so the user can modify it.
// the  datawindow 'dw_parm' is declared as an instance variable.
dw_parm = message.powerobjectparm
sle_title.text = dw_parm.describe ("gr_1.title")
sle_title.SelectText (1,999)

// Remember original title, in case they cancel
original_title = sle_title.text
end event

type cb_cancel from commandbutton within w_vzt_graph_title
int X=722
int Y=256
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

event clicked;// Reset the original graph title in the datawindow, since they
// cancelled. Ignore all modifications
dw_parm.Modify ("gr_1.title='" + original_title + "'")
Close (parent)
end event

type cb_ok from commandbutton within w_vzt_graph_title
int X=192
int Y=256
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

on clicked;Close (parent) 
end on

type sle_title from singlelineedit within w_vzt_graph_title
int X=69
int Y=88
int Width=1010
int Height=88
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;// Set the graph title in the datawindow to the modified text.
dw_parm.Modify ("gr_1.title='" + sle_title.text + "'")
end event

