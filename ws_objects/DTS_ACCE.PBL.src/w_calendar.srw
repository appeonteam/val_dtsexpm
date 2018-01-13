$PBExportHeader$w_calendar.srw
forward
global type w_calendar from Window
end type
type sle_format from singlelineedit within w_calendar
end type
type uo_1 from u_ddcal within w_calendar
end type
type gb_1 from groupbox within w_calendar
end type
end forward

global type w_calendar from Window
int X=673
int Y=265
int Width=1916
int Height=1121
boolean TitleBar=true
string Title="Calendar User Object"
boolean ControlMenu=true
boolean MinBox=true
sle_format sle_format
uo_1 uo_1
gb_1 gb_1
end type
global w_calendar w_calendar

on open;uo_1.init_cal(today())
uo_1.set_date_format ( sle_format.text )
end on

on w_calendar.create
this.sle_format=create sle_format
this.uo_1=create uo_1
this.gb_1=create gb_1
this.Control[]={ this.sle_format,&
this.uo_1,&
this.gb_1}
end on

on w_calendar.destroy
destroy(this.sle_format)
destroy(this.uo_1)
destroy(this.gb_1)
end on

type sle_format from singlelineedit within w_calendar
int X=1239
int Y=265
int Width=503
int Height=105
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Text="dd-mmm-yy"
end type

on modified;uo_1.set_date_format ( sle_format.text )
end on

type uo_1 from u_ddcal within w_calendar
int X=261
int Y=133
boolean Border=false
long BackColor=1090519039
end type

on uo_1.destroy
call u_ddcal::destroy
end on

type gb_1 from groupbox within w_calendar
int X=1157
int Y=165
int Width=650
int Height=249
int TabOrder=10
string Text="Date Format "
end type

