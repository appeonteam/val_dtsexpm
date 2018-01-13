$PBExportHeader$w_test_color.srw
forward
global type w_test_color from Window
end type
type sle_1 from singlelineedit within w_test_color
end type
type em_b from editmask within w_test_color
end type
type em_r from editmask within w_test_color
end type
type em_g from editmask within w_test_color
end type
type cb_1 from commandbutton within w_test_color
end type
type r_1 from rectangle within w_test_color
end type
end forward

global type w_test_color from Window
int X=823
int Y=360
int Width=2016
int Height=1208
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
sle_1 sle_1
em_b em_b
em_r em_r
em_g em_g
cb_1 cb_1
r_1 r_1
end type
global w_test_color w_test_color

on w_test_color.create
this.sle_1=create sle_1
this.em_b=create em_b
this.em_r=create em_r
this.em_g=create em_g
this.cb_1=create cb_1
this.r_1=create r_1
this.Control[]={this.sle_1,&
this.em_b,&
this.em_r,&
this.em_g,&
this.cb_1,&
this.r_1}
end on

on w_test_color.destroy
destroy(this.sle_1)
destroy(this.em_b)
destroy(this.em_r)
destroy(this.em_g)
destroy(this.cb_1)
destroy(this.r_1)
end on

type sle_1 from singlelineedit within w_test_color
int X=338
int Y=552
int Width=736
int Height=92
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_b from editmask within w_test_color
int X=864
int Y=392
int Width=247
int Height=100
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
boolean Spin=true
double Increment=1
string MinMax="0~~255"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_r from editmask within w_test_color
int X=334
int Y=392
int Width=247
int Height=100
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
boolean Spin=true
double Increment=1
string MinMax="0~~255"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_g from editmask within w_test_color
int X=603
int Y=392
int Width=247
int Height=100
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
boolean Spin=true
double Increment=1
string MinMax="0~~255"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_test_color
int X=18
int Y=376
int Width=247
int Height=108
int TabOrder=10
string Text="RGB"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long ll_color
ll_color = RGB( integer(em_r.text), integer(em_g.text), integer(em_b.text) )
sle_1.text = string ( ll_color) 
r_1.fillcolor = ll_color
end event

type r_1 from rectangle within w_test_color
int X=475
int Y=32
int Width=567
int Height=316
boolean Enabled=false
int LineThickness=4
long LineColor=67108864
long FillColor=33554432
end type

