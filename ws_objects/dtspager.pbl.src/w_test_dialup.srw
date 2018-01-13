$PBExportHeader$w_test_dialup.srw
forward
global type w_test_dialup from Window
end type
type sle_pin from dropdownlistbox within w_test_dialup
end type
type sle_carrier from dropdownlistbox within w_test_dialup
end type
type cb_send from commandbutton within w_test_dialup
end type
type st_3 from statictext within w_test_dialup
end type
type st_2 from statictext within w_test_dialup
end type
type st_1 from statictext within w_test_dialup
end type
type sle_msg from singlelineedit within w_test_dialup
end type
end forward

global type w_test_dialup from Window
int X=1056
int Y=484
int Width=2555
int Height=1124
boolean TitleBar=true
string Title="Test Dialup"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
sle_pin sle_pin
sle_carrier sle_carrier
cb_send cb_send
st_3 st_3
st_2 st_2
st_1 st_1
sle_msg sle_msg
end type
global w_test_dialup w_test_dialup

type variables
string lport = "COM2"
string lbaud = "2400"
string lmodem_init_str = ""
string lmodem_dial_str=""
string laccess_number
string lpager_id 
string lmax_chars_per_blk = "80"
string lmsg 
string ldebug_file="D:\HotelEXPERT\Dts32\tapi.log"
char lretmsg[100]
int lrc



end variables

on w_test_dialup.create
this.sle_pin=create sle_pin
this.sle_carrier=create sle_carrier
this.cb_send=create cb_send
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_msg=create sle_msg
this.Control[]={this.sle_pin,&
this.sle_carrier,&
this.cb_send,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_msg}
end on

on w_test_dialup.destroy
destroy(this.sle_pin)
destroy(this.sle_carrier)
destroy(this.cb_send)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_msg)
end on

type sle_pin from dropdownlistbox within w_test_dialup
int X=1600
int Y=212
int Width=530
int Height=228
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
boolean AllowEdit=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"246399^246399",&
"9149068834",&
"9149068835"}
end type

type sle_carrier from dropdownlistbox within w_test_dialup
int X=526
int Y=208
int Width=603
int Height=260
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
boolean AllowEdit=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"19172522000",&
"19149066683"}
end type

type cb_send from commandbutton within w_test_dialup
int X=905
int Y=724
int Width=457
int Height=108
int TabOrder=40
string Text="Send"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;lpager_id=sle_pin.text
laccess_number=sle_carrier.text
lmsg=sle_msg.text

lrc = send_alpha_page (lport,lbaud,lmodem_init_str,lmodem_dial_str,laccess_number,&
	lpager_id,lmax_chars_per_blk,lmsg,ldebug_file,lretmsg)
	
MessageBox("Done",String(lrc)+ " - " + lretmsg)
end event

type st_3 from statictext within w_test_dialup
int X=1417
int Y=216
int Width=155
int Height=76
boolean Enabled=false
string Text="Pin:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_test_dialup
int X=206
int Y=464
int Width=274
int Height=76
boolean Enabled=false
string Text="Message:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_test_dialup
int X=46
int Y=220
int Width=439
int Height=76
boolean Enabled=false
string Text="Carrier Access#"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_msg from singlelineedit within w_test_dialup
int X=544
int Y=456
int Width=1646
int Height=92
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
string Text="Test From My PB Test Program 1 ^ test msg 2"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

