$PBExportHeader$w_gcc_about.srw
forward
global type w_gcc_about from w_vzt_about
end type
type st_rightsreserved from statictext within w_gcc_about
end type
type st_copyright from statictext within w_gcc_about
end type
end forward

global type w_gcc_about from w_vzt_about
int X=800
int Y=236
int Width=2633
int Height=1208
long BackColor=80269528
st_rightsreserved st_rightsreserved
st_copyright st_copyright
end type
global w_gcc_about w_gcc_about

on w_gcc_about.create
int iCurrent
call super::create
this.st_rightsreserved=create st_rightsreserved
this.st_copyright=create st_copyright
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_rightsreserved
this.Control[iCurrent+2]=this.st_copyright
end on

on w_gcc_about.destroy
call super::destroy
destroy(this.st_rightsreserved)
destroy(this.st_copyright)
end on

type cb_1 from w_vzt_about`cb_1 within w_gcc_about
int X=1138
int Y=980
end type

type dw_about from w_vzt_about`dw_about within w_gcc_about
int Y=12
int Width=2574
int Height=936
string DataObject="d_gcc_about"
end type

type st_rightsreserved from statictext within w_gcc_about
int X=1806
int Y=980
int Width=759
int Height=108
boolean Enabled=false
string Text="All Rights Reserved"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=128
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_copyright from statictext within w_gcc_about
int X=23
int Y=980
int Width=759
int Height=108
boolean Enabled=false
string Text="Copyright (c) 1996-2002"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=128
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

