$PBExportHeader$w_call_timer.srw
forward
global type w_call_timer from window
end type
type cb_cancel from commandbutton within w_call_timer
end type
type cb_ok from commandbutton within w_call_timer
end type
type st_2 from statictext within w_call_timer
end type
type st_1 from statictext within w_call_timer
end type
type em_1 from editmask within w_call_timer
end type
type uo_1 from u_ddcal within w_call_timer
end type
end forward

global type w_call_timer from window
integer x = 1344
integer y = 652
integer width = 1294
integer height = 1092
boolean titlebar = true
string title = "Timer Start Date/Time"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
cb_cancel cb_cancel
cb_ok cb_ok
st_2 st_2
st_1 st_1
em_1 em_1
uo_1 uo_1
end type
global w_call_timer w_call_timer

type variables
string   ls_parm_datetime

end variables

event open;datetime ldt_parm_datetime

ls_parm_datetime = Message.stringparm

ldt_parm_datetime = f_str_dt_to_dt(ls_parm_datetime)

uo_1.sle_date.text = f_dt_to_d_str(ldt_parm_datetime)
em_1.text = f_dt_to_t_str(ldt_parm_datetime)
end event

on w_call_timer.create
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

on w_call_timer.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.uo_1)
end on

type cb_cancel from commandbutton within w_call_timer
integer x = 640
integer y = 616
integer width = 293
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Cancel"
end type

event clicked;closewithreturn(parent,ls_parm_datetime)
end event

type cb_ok from commandbutton within w_call_timer
integer x = 270
integer y = 616
integer width = 293
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&OK"
boolean default = true
end type

event clicked;string ls_return
ls_return = uo_1.sle_date.Text + " " + em_1.text
closewithreturn(parent,ls_return)
end event

type st_2 from statictext within w_call_timer
integer x = 443
integer y = 68
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "Enter Date"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_call_timer
integer x = 434
integer y = 300
integer width = 352
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "Enter Time"
boolean focusrectangle = false
end type

type em_1 from editmask within w_call_timer
integer x = 425
integer y = 376
integer width = 393
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm:ss"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type uo_1 from u_ddcal within w_call_timer
integer x = 398
integer y = 152
integer width = 457
integer height = 104
integer taborder = 10
end type

on uo_1.destroy
call u_ddcal::destroy
end on

