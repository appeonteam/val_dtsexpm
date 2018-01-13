$PBExportHeader$w_vzt_form_about.srw
forward
global type w_vzt_form_about from w_vzt_about
end type
type st_rightsreserved from statictext within w_vzt_form_about
end type
type st_copyright from statictext within w_vzt_form_about
end type
end forward

global type w_vzt_form_about from w_vzt_about
int Width=1435
int Height=1656
st_rightsreserved st_rightsreserved
st_copyright st_copyright
end type
global w_vzt_form_about w_vzt_form_about

on w_vzt_form_about.create
int iCurrent
call super::create
this.st_rightsreserved=create st_rightsreserved
this.st_copyright=create st_copyright
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_rightsreserved
this.Control[iCurrent+2]=this.st_copyright
end on

on w_vzt_form_about.destroy
call super::destroy
destroy(this.st_rightsreserved)
destroy(this.st_copyright)
end on

type cb_1 from w_vzt_about`cb_1 within w_vzt_form_about
int X=539
int Y=1436
end type

type dw_about from w_vzt_about`dw_about within w_vzt_form_about
int X=9
int Y=12
int Width=1422
int Height=1432
string DataObject="d_vzt_form_about"
end type

type st_rightsreserved from statictext within w_vzt_form_about
int X=859
int Y=1468
int Width=530
int Height=56
boolean Enabled=false
string Text="All Rights Reserved"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=79349703
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_copyright from statictext within w_vzt_form_about
int X=18
int Y=1444
int Width=521
int Height=116
boolean Enabled=false
string Text="Copyright (c) 1997-2002"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=79349703
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

