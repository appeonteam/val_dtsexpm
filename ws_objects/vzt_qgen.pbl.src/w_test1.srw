$PBExportHeader$w_test1.srw
forward
global type w_test1 from Window
end type
type dw_2 from datawindow within w_test1
end type
type cb_save from commandbutton within w_test1
end type
type cb_1 from commandbutton within w_test1
end type
type dw_1 from datawindow within w_test1
end type
end forward

global type w_test1 from Window
int X=823
int Y=360
int Width=2496
int Height=1664
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
dw_2 dw_2
cb_save cb_save
cb_1 cb_1
dw_1 dw_1
end type
global w_test1 w_test1

type variables
nvo_qgen inv_qgen    
end variables

on w_test1.create
this.dw_2=create dw_2
this.cb_save=create cb_save
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.cb_save,&
this.cb_1,&
this.dw_1}
end on

on w_test1.destroy
destroy(this.dw_2)
destroy(this.cb_save)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;inv_qgen = create nvo_qgen

end event

type dw_2 from datawindow within w_test1
int X=55
int Y=1016
int Width=2373
int Height=516
int TabOrder=30
string DataObject="d_qset_answers01"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_save from commandbutton within w_test1
int X=1065
int Y=872
int Width=352
int Height=108
int TabOrder=20
string Text="save qset"
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
inv_qgen.event ue_save_qset_with_commit ()

end event

type cb_1 from commandbutton within w_test1
int X=187
int Y=872
int Width=352
int Height=108
int TabOrder=40
string Text="create qset"
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//inv_qgen.ids_answers = dw_2  // DW TEST 


inv_qgen.event ue_create_qset (1, dw_1)
//set user/date -----------------------
inv_qgen.idt_ans_date	= datetime( date('04/14/2000'))
inv_qgen.in_responderid	= 1 
//---------------------------------------
inv_qgen.event ue_load_user_answers ()
end event

type dw_1 from datawindow within w_test1
int X=37
int Y=44
int Width=2400
int Height=792
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

