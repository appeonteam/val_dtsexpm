$PBExportHeader$w_gcc_employee_kudos.srw
forward
global type w_gcc_employee_kudos from w_gcc_employee
end type
type cb_1 from commandbutton within w_gcc_employee_kudos
end type
end forward

global type w_gcc_employee_kudos from w_gcc_employee
int Width=2075
boolean TitleBar=true
string Title="GCC Employee Recognition"
cb_1 cb_1
end type
global w_gcc_employee_kudos w_gcc_employee_kudos

type variables
str_dts_call	istr_parms
end variables

on w_gcc_employee_kudos.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_gcc_employee_kudos.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_last_search from w_gcc_employee`cb_last_search within w_gcc_employee_kudos
int TabOrder=20
end type

type cb_close from w_gcc_employee`cb_close within w_gcc_employee_kudos
int TabOrder=40
end type

type cb_delete1 from w_gcc_employee`cb_delete1 within w_gcc_employee_kudos
int X=2295
int Y=684
int TabOrder=100
end type

type cb_save from w_gcc_employee`cb_save within w_gcc_employee_kudos
int X=1376
int TabOrder=80
end type

type cb_select from w_gcc_employee`cb_select within w_gcc_employee_kudos
int X=1157
int TabOrder=70
end type

type cb_new from w_gcc_employee`cb_new within w_gcc_employee_kudos
int X=2295
int Y=604
int TabOrder=90
end type

type cb_newsearch from w_gcc_employee`cb_newsearch within w_gcc_employee_kudos
int TabOrder=60
end type

type cb_search from w_gcc_employee`cb_search within w_gcc_employee_kudos
int TabOrder=50
end type

type st_foundrecs from w_gcc_employee`st_foundrecs within w_gcc_employee_kudos
int X=1605
int Y=816
int Width=242
boolean BringToTop=true
end type

type st_stop from w_gcc_employee`st_stop within w_gcc_employee_kudos
int X=1632
boolean BringToTop=true
end type

type dw_data from w_gcc_employee`dw_data within w_gcc_employee_kudos
int TabOrder=30
end type

type dw_print from w_gcc_employee`dw_print within w_gcc_employee_kudos
int X=1970
int Y=636
int TabOrder=110
boolean BringToTop=true
end type

type cb_1 from commandbutton within w_gcc_employee_kudos
int X=622
int Y=816
int Width=375
int Height=76
int TabOrder=20
boolean BringToTop=true
string Text="Write Letter"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;SetPointer( Hourglass!)

long ll_row
ll_row = dw_data.GetRow()
if ll_row <= 0 then return 

istr_parms.dtsparm 	= f_nvl( dw_data.object.employee_number [ ll_row ], '*')
istr_parms.guestname = dw_data.object.employee [ ll_row ]

If istr_parms.dtsparm = '*' then return

OpenSheetWithParm( w_gcc_letter_employee_tx, istr_parms, w_gcc_main, 0, Layered!)
end event

