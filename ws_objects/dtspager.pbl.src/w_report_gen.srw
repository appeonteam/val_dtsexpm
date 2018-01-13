$PBExportHeader$w_report_gen.srw
$PBExportComments$report template parent
forward
global type w_report_gen from Window
end type
type cb_2 from commandbutton within w_report_gen
end type
type dw_2 from datawindow within w_report_gen
end type
type st_1 from statictext within w_report_gen
end type
type cb_1 from commandbutton within w_report_gen
end type
type cb_sort from commandbutton within w_report_gen
end type
type dw_1 from datawindow within w_report_gen
end type
end forward

global type w_report_gen from Window
int X=1074
int Y=480
int Width=2501
int Height=1572
boolean TitleBar=true
string Title="Untitled"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
event ue_printrpt ( )
cb_2 cb_2
dw_2 dw_2
st_1 st_1
cb_1 cb_1
cb_sort cb_sort
dw_1 dw_1
end type
global w_report_gen w_report_gen

type variables
long dwWinWidthDiff
long dwWinHeightDiff
end variables

event ue_printrpt;
dw_1.ShareData(dw_2)
dw_2.print()
end event

event open;//this.Title = Message.StringParm
//if Message.StringParm = "Activate/Deactivate Report" then
//	dw_1.DataObject = 'd_act_deact'
//end if
//if Message.StringParm = "Paging Task Assignment Report" then
//	dw_1.DataObject = 'd_pager_assignment'
//end if

dwWinWidthDiff = this.width - dw_1.width
dwWinHeightDiff = this.height - dw_1.height
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
st_1.Text = String(today(),'mmmm dd, yyyy') +" "+ string(now(),'hh:mmam/pm')
end event

on w_report_gen.create
this.cb_2=create cb_2
this.dw_2=create dw_2
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_sort=create cb_sort
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.dw_2,&
this.st_1,&
this.cb_1,&
this.cb_sort,&
this.dw_1}
end on

on w_report_gen.destroy
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_sort)
destroy(this.dw_1)
end on

event resize;dw_1.Resize(this.width - dwWinWidthDiff, this.height - dwWinHeightDiff )
end event

type cb_2 from commandbutton within w_report_gen
event ue_printrpt ( )
int X=1413
int Y=32
int Width=247
int Height=92
int TabOrder=31
string Text="&Print"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;parent.TriggerEvent("ue_printrpt")
end event

type dw_2 from datawindow within w_report_gen
int X=1051
int Y=24
int Width=512
int Height=144
int TabOrder=30
boolean Visible=false
boolean LiveScroll=true
end type

type st_1 from statictext within w_report_gen
int X=64
int Y=40
int Width=754
int Height=72
boolean Enabled=false
string Text="none"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-9
int Weight=400
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_report_gen
int X=2021
int Y=32
int Width=247
int Height=92
int TabOrder=40
string Text="E&xit"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type cb_sort from commandbutton within w_report_gen
int X=1714
int Y=32
int Width=247
int Height=92
int TabOrder=20
string Text="&Sort"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string nullVal
SetNull(nullVal)
dw_1.SetSort(nullVal)
dw_1.Sort()
end event

type dw_1 from datawindow within w_report_gen
int X=46
int Y=204
int Width=2359
int Height=1180
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

