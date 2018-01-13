$PBExportHeader$w_vzt_about.srw
forward
global type w_vzt_about from Window
end type
type cb_1 from commandbutton within w_vzt_about
end type
type dw_about from datawindow within w_vzt_about
end type
end forward

global type w_vzt_about from Window
int X=1074
int Y=484
int Width=1664
int Height=1720
boolean TitleBar=true
string Title="About Window"
long BackColor=79349703
boolean ControlMenu=true
WindowType WindowType=response!
cb_1 cb_1
dw_about dw_about
end type
global w_vzt_about w_vzt_about

on w_vzt_about.create
this.cb_1=create cb_1
this.dw_about=create dw_about
this.Control[]={this.cb_1,&
this.dw_about}
end on

on w_vzt_about.destroy
destroy(this.cb_1)
destroy(this.dw_about)
end on

event open;dw_about.InsertRow(0)
dw_about.object.appname [1] 		= gnv_appman.is_apptitle
dw_about.object.version [1] 		= gnv_appman.is_version
dw_about.object.lastupdated [1] 	= gnv_appman.id_last_updated 
dw_about.object.dbms			[1] 		= SQLCA.dbms
dw_about.object.database	[1] 		= SQLCA.database	
dw_about.object.servername	[1] 		= SQLCA.servername
dw_about.object.dbparm 		[1] 		= SQLCA.dbparm 		


end event

type cb_1 from commandbutton within w_vzt_about
int X=677
int Y=1460
int Width=247
int Height=108
int TabOrder=1
string Text="OK"
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type dw_about from datawindow within w_vzt_about
int X=14
int Y=8
int Width=1646
int Height=1560
int TabOrder=1
boolean Enabled=false
string DataObject="d_vzt_about"
boolean Border=false
boolean LiveScroll=true
end type

