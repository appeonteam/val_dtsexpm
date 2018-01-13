$PBExportHeader$w_paging_msg.srw
forward
global type w_paging_msg from Window
end type
type st_3 from statictext within w_paging_msg
end type
type lb_1 from listbox within w_paging_msg
end type
type dw_1 from datawindow within w_paging_msg
end type
type st_2 from statictext within w_paging_msg
end type
type st_1 from statictext within w_paging_msg
end type
type sle_msg from singlelineedit within w_paging_msg
end type
type cb_exit from commandbutton within w_paging_msg
end type
type cb_send from commandbutton within w_paging_msg
end type
end forward

shared variables

end variables

global type w_paging_msg from Window
int X=1074
int Y=480
int Width=1696
int Height=996
boolean TitleBar=true
string Title="Paging"
string Tag="Menu paging screen!"
long BackColor=79349703
boolean ControlMenu=true
WindowType WindowType=response!
st_3 st_3
lb_1 lb_1
dw_1 dw_1
st_2 st_2
st_1 st_1
sle_msg sle_msg
cb_exit cb_exit
cb_send cb_send
end type
global w_paging_msg w_paging_msg

type variables
datawindowchild dwc_1
end variables

event open;dw_1.SetTransObject(sqlca)
dw_1.InsertRow(0)

end event

on w_paging_msg.create
this.st_3=create st_3
this.lb_1=create lb_1
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_msg=create sle_msg
this.cb_exit=create cb_exit
this.cb_send=create cb_send
this.Control[]={this.st_3,&
this.lb_1,&
this.dw_1,&
this.st_2,&
this.st_1,&
this.sle_msg,&
this.cb_exit,&
this.cb_send}
end on

on w_paging_msg.destroy
destroy(this.st_3)
destroy(this.lb_1)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_msg)
destroy(this.cb_exit)
destroy(this.cb_send)
end on

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

type st_3 from statictext within w_paging_msg
int X=731
int Y=64
int Width=425
int Height=72
boolean Enabled=false
string Text="Selected Pager IDs"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type lb_1 from listbox within w_paging_msg
event mousemove pbm_mousemove
int X=727
int Y=140
int Width=553
int Height=292
int TabOrder=10
string Tag="Double click on an item to delete it!"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean Sorted=false
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event doubleclicked;this.DeleteItem(index)
end event

type dw_1 from datawindow within w_paging_msg
event mousemove pbm_mousemove
int X=46
int Y=144
int Width=581
int Height=280
int TabOrder=20
string Tag="Select pager ID!"
string DataObject="d_pager"
boolean Border=false
boolean LiveScroll=true
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event itemchanged;lb_1.AddItem ( data )
end event

type st_2 from statictext within w_paging_msg
int X=46
int Y=60
int Width=233
int Height=72
boolean Enabled=false
string Text="Pager#"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_paging_msg
int X=46
int Y=476
int Width=439
int Height=72
boolean Enabled=false
string Text="Paging String"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_msg from singlelineedit within w_paging_msg
event mousemove pbm_mousemove
int X=46
int Y=572
int Width=1541
int Height=92
int TabOrder=30
string Tag="Enter paging text here!"
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;w_main.SetMicroHelp(This.Tag)
end event

type cb_exit from commandbutton within w_paging_msg
event mousemove pbm_mousemove
int X=407
int Y=748
int Width=347
int Height=100
int TabOrder=40
string Tag="Click here to exit without sending page!"
string Text="E&xit"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;CloseWithReturn(parent,'exit')
end event

type cb_send from commandbutton within w_paging_msg
event mousemove pbm_mousemove
int X=955
int Y=748
int Width=347
int Height=100
int TabOrder=50
string Tag="Click here to send page!"
string Text="&Send Page"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;
string pagerId
string pageMsg
string sendStr
//pagerId = dw_1.GetItemString(1,"pager_id")
//MessageBox("pageid",pagerId)
if sle_msg.text = "" then
	MessageBox("Error","Please enter Paging String to be sent!")
	return
end if
pageMsg = sle_msg.text
//sendStr = char(255) + char(255) + char(255) + pagerId + char(10) + pageMsg+ char(13)
if lb_1.TotalItems() = 0 then
	MessageBox("Error","Please select at least one pager id to be paged!")
	return
end if

pageMsg = pageMsg + "#" + lb_1.Text(1)
int i = 2
do while i <= lb_1.TotalItems()
	pageMsg = pageMsg + "," + lb_1.Text(i)
	i++
loop

CloseWithReturn (parent, pageMsg)


end event

