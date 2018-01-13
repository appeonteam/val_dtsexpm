$PBExportHeader$w_vzt_base_response.srw
forward
global type w_vzt_base_response from Window
end type
type dw_response from uo_vzt_dwbase within w_vzt_base_response
end type
type cb_2 from commandbutton within w_vzt_base_response
end type
type cb_1 from commandbutton within w_vzt_base_response
end type
end forward

global type w_vzt_base_response from Window
int X=1074
int Y=484
int Width=1961
int Height=1244
boolean TitleBar=true
long BackColor=79349703
boolean ControlMenu=true
WindowType WindowType=response!
event ue_ok ( )
event ue_cancel ( )
event ue_process_ok ( )
dw_response dw_response
cb_2 cb_2
cb_1 cb_1
end type
global w_vzt_base_response w_vzt_base_response

type variables
str_response istr_parms
end variables

event ue_ok;istr_parms.rc = 1
this.event ue_process_ok()
If istr_parms.rc > 0 then closeWithReturn (this, istr_parms) 

//// sample call 
//OpenWIthParm( w_ssss, lstr_parms)
//
//lstr_parms = Message.PowerObjectParm
//if not isValid( lstr_parms) then return 0
//If lstr_parms.rc <= 0 then return 0
end event

event ue_cancel;istr_parms.rc = -1
closeWithReturn (this, istr_parms) 
end event

event ue_process_ok;// Uncomment in desc.

//long ll_selrow
//ll_selrow = dw_response.GetSelectedRow(0) 
//If ll_selrow > 0 then
//	istr_parms.num1 = dw_response.GetItemNumber( ll_selrow, 'colnum')
//	istr_parms.string1 = dw_response.GetItemString( ll_selrow, 'colstr')
//END IF 	
//
end event

on w_vzt_base_response.create
this.dw_response=create dw_response
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_response,&
this.cb_2,&
this.cb_1}
end on

on w_vzt_base_response.destroy
destroy(this.dw_response)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_response from uo_vzt_dwbase within w_vzt_base_response
int X=96
int Y=64
int Width=1714
int Height=860
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

event constructor;call super::constructor;_selection_service = 'S' 
end event

event doubleclicked;call super::doubleclicked;parent.event post ue_ok()
end event

type cb_2 from commandbutton within w_vzt_base_response
int X=987
int Y=1016
int Width=247
int Height=108
int TabOrder=20
string Text="Cancel"
boolean Default=true
boolean Cancel=true
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;parent.event ue_cancel ()
end event

type cb_1 from commandbutton within w_vzt_base_response
int X=553
int Y=1016
int Width=247
int Height=108
int TabOrder=10
string Text="OK"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;parent.event ue_ok()
end event

