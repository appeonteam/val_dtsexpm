$PBExportHeader$uo_tabpage_dw_admin.sru
forward
global type uo_tabpage_dw_admin from uo_tabpage_dw
end type
type cb_syntax from commandbutton within uo_tabpage_dw_admin
end type
type cb_sql from commandbutton within uo_tabpage_dw_admin
end type
end forward

global type uo_tabpage_dw_admin from uo_tabpage_dw
int Height=1240
string PictureName="debug5!"
string Text="Administration"
cb_syntax cb_syntax
cb_sql cb_sql
end type
global uo_tabpage_dw_admin uo_tabpage_dw_admin

on uo_tabpage_dw_admin.create
int iCurrent
call super::create
this.cb_syntax=create cb_syntax
this.cb_sql=create cb_sql
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_syntax
this.Control[iCurrent+2]=this.cb_sql
end on

on uo_tabpage_dw_admin.destroy
call super::destroy
destroy(this.cb_syntax)
destroy(this.cb_sql)
end on

type dw_1 from uo_tabpage_dw`dw_1 within uo_tabpage_dw_admin
int X=0
int Y=568
boolean Visible=false
boolean BringToTop=true
end type

type cb_syntax from commandbutton within uo_tabpage_dw_admin
int X=658
int Y=48
int Width=617
int Height=76
int TabOrder=10
boolean BringToTop=true
string Text="Show Report DW Syntax"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_syntax 
ls_syntax = "$PBExportHeader$" + "d_exported_report.srd~r~n"+ parenttab.idw_current.Describe("DataWindow.Syntax") 
Clipboard( ls_syntax ) 
MessageBox("VZT Reporter: Report Syntax",  ls_syntax )
end event

type cb_sql from commandbutton within uo_tabpage_dw_admin
int X=23
int Y=48
int Width=617
int Height=76
int TabOrder=10
boolean BringToTop=true
string Text="Show Report SQL"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string  		ls_newsql 
ls_newsql 	= Upper(parenttab.idw_current.getSQLSelect())
Clipboard( ls_newsql ) 
MessageBox("VZT Reporter: Report SQL",  ls_newsql )
end event

