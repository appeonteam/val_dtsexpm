$PBExportHeader$w_vzt_noparms.srw
forward
global type w_vzt_noparms from Window
end type
type st_1 from statictext within w_vzt_noparms
end type
end forward

global type w_vzt_noparms from Window
int X=846
int Y=388
int Width=1134
int Height=376
boolean TitleBar=true
string Title="Batch Server: Missing Parameters"
long BackColor=79741120
st_1 st_1
end type
global w_vzt_noparms w_vzt_noparms

on w_vzt_noparms.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_vzt_noparms.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_vzt_noparms
int X=137
int Y=56
int Width=910
int Height=188
boolean Enabled=false
string Text="No parameters specified. Server app is exiting..."
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

