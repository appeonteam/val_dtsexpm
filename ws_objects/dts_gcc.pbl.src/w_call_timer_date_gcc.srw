$PBExportHeader$w_call_timer_date_gcc.srw
forward
global type w_call_timer_date_gcc from Window
end type
type cb_cancel from commandbutton within w_call_timer_date_gcc
end type
type cb_ok from commandbutton within w_call_timer_date_gcc
end type
type st_2 from statictext within w_call_timer_date_gcc
end type
type st_1 from statictext within w_call_timer_date_gcc
end type
type em_1 from editmask within w_call_timer_date_gcc
end type
type uo_1 from u_ddcal within w_call_timer_date_gcc
end type
end forward

global type w_call_timer_date_gcc from Window
int X=1344
int Y=652
int Width=1120
int Height=1044
boolean TitleBar=true
string Title="Timer Start Date/Time"
long BackColor=79349703
boolean ControlMenu=true
WindowType WindowType=response!
cb_cancel cb_cancel
cb_ok cb_ok
st_2 st_2
st_1 st_1
em_1 em_1
uo_1 uo_1
end type
global w_call_timer_date_gcc w_call_timer_date_gcc

type variables
str_datetime  istr_datetime //string   ls_parm_datetime
string is_mask
end variables

event open;
//ls_parm_datetime = Message.StringParm 
istr_datetime = Message.Powerobjectparm

if f_nvl(gnv_appman.is_datemask ,'') <> ''  then 
	if lower(left(gnv_appman.is_datemask ,1)) = 'd'  then 
		is_mask = 'dd/mm/yyyy' 
	else
		is_mask = 'mm/dd/yyyy' 
	end if
Else
	is_mask = 'mm/dd/yyyy' // default
end if

//ld_parm_date     = date(mid(ls_parm_datetime,1,8))
//lt_parm_time	  = time(mid(ls_parm_datetime,10,8))
//ldt_parm_datetime = datetime(ld_parm_date,lt_parm_time)

uo_1.sle_date.Text = string(istr_datetime.dateparm, is_mask)
em_1.text = string(time(istr_datetime.dateparm),"hh:mm:ss")




end event

on w_call_timer_date_gcc.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_2=create st_2
this.st_1=create st_1
this.em_1=create em_1
this.uo_1=create uo_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.st_2,&
this.st_1,&
this.em_1,&
this.uo_1}
end on

on w_call_timer_date_gcc.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.uo_1)
end on

type cb_cancel from commandbutton within w_call_timer_date_gcc
int X=613
int Y=732
int Width=251
int Height=92
int TabOrder=40
string Text="&Cancel"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn(parent, istr_datetime)
end event

type cb_ok from commandbutton within w_call_timer_date_gcc
int X=229
int Y=732
int Width=247
int Height=92
int TabOrder=30
string Text="&OK"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;istr_datetime.dateparm = datetime(date(uo_1.sle_date.Text),time(em_1.text))
closewithreturn(parent, istr_datetime)
end event

type st_2 from statictext within w_call_timer_date_gcc
int X=357
int Y=48
int Width=343
int Height=72
boolean Enabled=false
string Text="Enter Date"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79349703
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_call_timer_date_gcc
int X=384
int Y=360
int Width=293
int Height=72
boolean Enabled=false
string Text="Enter Time"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79349703
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_1 from editmask within w_call_timer_date_gcc
int X=352
int Y=456
int Width=393
int Height=88
int TabOrder=20
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="hh:mm:ss"
MaskDataType MaskDataType=TimeMask!
boolean Spin=true
double Increment=1
string MinMax="~~"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type uo_1 from u_ddcal within w_call_timer_date_gcc
int X=338
int Y=164
int Width=430
int Height=104
int TabOrder=10
long BackColor=79349703
end type

on uo_1.destroy
call u_ddcal::destroy
end on

