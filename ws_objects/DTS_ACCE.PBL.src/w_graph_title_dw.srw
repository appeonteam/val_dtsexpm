$PBExportHeader$w_graph_title_dw.srw
$PBExportComments$General response window to set DW graph title.
forward
global type w_graph_title_dw from Window
end type
type cb_cancel from commandbutton within w_graph_title_dw
end type
type cb_ok from commandbutton within w_graph_title_dw
end type
type sle_title from singlelineedit within w_graph_title_dw
end type
end forward

global type w_graph_title_dw from Window
int X=874
int Y=1213
int Width=1162
int Height=513
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
global w_graph_title_dw w_graph_title_dw

type variables
datawindow dw_parm
string original_title
end variables

on w_graph_title_dw.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_title=create sle_title
this.Control[]={ this.cb_cancel,&
this.cb_ok,&
this.sle_title}
end on

on w_graph_title_dw.destroy
destroy(cb_cancel)
destroy(cb_ok)
destroy(sle_title)
end on

on open;// The calling window has passed the current datawindow object. 
// Initialize the Single Line Edit so the user can modify it.
// the  datawindow 'dw_parm' is declared as an instance variable.
dw_parm = message.powerobjectparm
sle_title.text = dw_parm.dwdescribe ("gr_1.title")
sle_title.SelectText (1,999)

// Remember original title, in case they cancel
original_title = sle_title.text
end on

type cb_cancel from commandbutton within w_graph_title_dw
int X=723
int Y=257
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

on clicked;// Reset the original graph title in the datawindow, since they
// cancelled. Ignore all modifications
dw_parm.dwModify ("gr_1.title='" + original_title + "'")
Close (parent)
end on

type cb_ok from commandbutton within w_graph_title_dw
int X=193
int Y=257
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

on clicked;Close (parent) 
end on

type sle_title from singlelineedit within w_graph_title_dw
int X=193
int Y=89
int Width=778
int Height=89
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long BackColor=12632256
int TextSize=UnitsToPixels(53,YUnitsToPixels!)
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on modified;// Set the graph title in the datawindow to the modified text.
dw_parm.dwModify ("gr_1.title='" + sle_title.text + "'")
end on

