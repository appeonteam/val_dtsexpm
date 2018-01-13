$PBExportHeader$w_vzt_base_logon.srw
forward
global type w_vzt_base_logon from Window
end type
type cb_exit from commandbutton within w_vzt_base_logon
end type
type cb_ok from commandbutton within w_vzt_base_logon
end type
type st_password from statictext within w_vzt_base_logon
end type
type sle_password from singlelineedit within w_vzt_base_logon
end type
type sle_loginid from singlelineedit within w_vzt_base_logon
end type
type st_loginid from statictext within w_vzt_base_logon
end type
end forward

global type w_vzt_base_logon from Window
int X=375
int Y=248
int Width=2135
int Height=1388
long BackColor=79349703
boolean Border=false
WindowType WindowType=response!
cb_exit cb_exit
cb_ok cb_ok
st_password st_password
sle_password sle_password
sle_loginid sle_loginid
st_loginid st_loginid
end type
global w_vzt_base_logon w_vzt_base_logon

type variables

end variables

event timer;//if resetintrotimer(timeoutperiod) <= 0 then
//	closeWithReturn(this, -1)
//end if

end event

event open;window		thiswindow
integer		retint
sle_loginid.setFocus()

end event

event close;timer(0)

end event

on w_vzt_base_logon.create
this.cb_exit=create cb_exit
this.cb_ok=create cb_ok
this.st_password=create st_password
this.sle_password=create sle_password
this.sle_loginid=create sle_loginid
this.st_loginid=create st_loginid
this.Control[]={this.cb_exit,&
this.cb_ok,&
this.st_password,&
this.sle_password,&
this.sle_loginid,&
this.st_loginid}
end on

on w_vzt_base_logon.destroy
destroy(this.cb_exit)
destroy(this.cb_ok)
destroy(this.st_password)
destroy(this.sle_password)
destroy(this.sle_loginid)
destroy(this.st_loginid)
end on

type cb_exit from commandbutton within w_vzt_base_logon
int X=1234
int Y=1108
int Width=247
int Height=108
int TabOrder=40
string Text="Exit"
boolean Cancel=true
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ok from commandbutton within w_vzt_base_logon
int X=640
int Y=1108
int Width=247
int Height=108
int TabOrder=30
string Text="O.K."
boolean Default=true
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_password from statictext within w_vzt_base_logon
int X=334
int Y=976
int Width=293
int Height=72
boolean Enabled=false
string Text="Password:"
long TextColor=65535
long BackColor=8388608
long BorderColor=8388608
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_password from singlelineedit within w_vzt_base_logon
int X=640
int Y=956
int Width=841
int Height=104
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
boolean PassWord=true
boolean HideSelection=false
string Pointer="Arrow!"
long TextColor=16711680
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_loginid from singlelineedit within w_vzt_base_logon
int X=640
int Y=824
int Width=841
int Height=104
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
boolean HideSelection=false
int Limit=16
TextCase TextCase=Upper!
string Pointer="Arrow!"
long TextColor=16711680
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_loginid from statictext within w_vzt_base_logon
int X=379
int Y=844
int Width=247
int Height=72
boolean Enabled=false
string Text="Login ID:"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
long BorderColor=8388608
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

