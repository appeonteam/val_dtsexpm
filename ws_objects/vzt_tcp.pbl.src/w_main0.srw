$PBExportHeader$w_main0.srw
forward
global type w_main0 from Window
end type
type sle_1 from singlelineedit within w_main0
end type
type uo_1 from uo_vzt_tcp_base within w_main0
end type
end forward

global type w_main0 from Window
int X=1051
int Y=480
int Width=1531
int Height=1016
boolean TitleBar=true
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
string Icon=".\powertcp.ico"
sle_1 sle_1
uo_1 uo_1
end type
global w_main0 w_main0

on w_main0.create
this.sle_1=create sle_1
this.uo_1=create uo_1
this.Control[]={this.sle_1,&
this.uo_1}
end on

on w_main0.destroy
destroy(this.sle_1)
destroy(this.uo_1)
end on

type sle_1 from singlelineedit within w_main0
int X=41
int Y=772
int Width=1390
int Height=92
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type uo_1 from uo_vzt_tcp_base within w_main0
event destroy ( )
int X=27
int Y=16
int Height=740
int TabOrder=10
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

on uo_1.destroy
call uo_vzt_tcp_base::destroy
end on

event ue_onreceive;call super::ue_onreceive;int li_len, li

sle_1.text = "|"
li_len = len (as_incoming)
for li = 1 to li_len 
	sle_1.text = sle_1.text + string(asc( MID(as_incoming,li,1) )) + "|"
next 
end event

