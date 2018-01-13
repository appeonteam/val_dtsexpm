$PBExportHeader$w_call_timer_date.srw
forward
global type w_call_timer_date from window
end type
type rb_recur_close from radiobutton within w_call_timer_date
end type
type rb_recur_target from radiobutton within w_call_timer_date
end type
type em_2 from editmask within w_call_timer_date
end type
type rb_freq_hour from radiobutton within w_call_timer_date
end type
type rb_freq_day from radiobutton within w_call_timer_date
end type
type uo_3 from u_ddcal within w_call_timer_date
end type
type st_4 from statictext within w_call_timer_date
end type
type uo_2 from u_ddcal within w_call_timer_date
end type
type st_3 from statictext within w_call_timer_date
end type
type cb_recur from commandbutton within w_call_timer_date
end type
type cb_cancel from commandbutton within w_call_timer_date
end type
type cb_ok from commandbutton within w_call_timer_date
end type
type st_2 from statictext within w_call_timer_date
end type
type st_1 from statictext within w_call_timer_date
end type
type em_1 from editmask within w_call_timer_date
end type
type uo_1 from u_ddcal within w_call_timer_date
end type
type gb_1 from groupbox within w_call_timer_date
end type
type gb_2 from groupbox within w_call_timer_date
end type
end forward

global type w_call_timer_date from window
integer x = 1344
integer y = 652
integer width = 1275
integer height = 920
boolean titlebar = true
string title = "Timer Start Date/Time"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
rb_recur_close rb_recur_close
rb_recur_target rb_recur_target
em_2 em_2
rb_freq_hour rb_freq_hour
rb_freq_day rb_freq_day
uo_3 uo_3
st_4 st_4
uo_2 uo_2
st_3 st_3
cb_recur cb_recur
cb_cancel cb_cancel
cb_ok cb_ok
st_2 st_2
st_1 st_1
em_1 em_1
uo_1 uo_1
gb_1 gb_1
gb_2 gb_2
end type
global w_call_timer_date w_call_timer_date

type variables
string   ls_parm_datetime
string 	recur_ind
s_timer_recur iParm
end variables

forward prototypes
public subroutine wf_validation ()
end prototypes

public subroutine wf_validation ();//if em_daily_start.text = "" then
//	return
//end if
//
//if time(em_daily_start.text) < time(em_1.text) then 
//	if rb_freq_hour.checked then
//		if f_str_d_to_d(uo_2.sle_date.text) <= today() then
//			datetime toDate = datetime(RelativeDate(today(),1))
//			uo_2.sle_date.text = f_dt_to_d_str(toDate)
//			uo_1.sle_date.text = f_dt_to_d_str(toDate)
//			em_1.text = em_daily_start.text
//			if f_str_d_to_d(uo_3.sle_date.text) <= today() then
//				uo_3.sle_date.text = f_dt_to_d_str(toDate)
//			end if
//			MessageBox("warning","Intended starting time is in the past! " + & 
//				"Start date is changed to the next date("+ f_dt_to_d_str(toDate)+")!")	
//		end if
//	end if
//end if
end subroutine

event open;datetime ldt_parm_datetime

iParm = Message.PowerObjectParm
ls_parm_datetime = iParm.timer_dt_str
ldt_parm_datetime = f_str_dt_to_dt(iParm.timer_dt_str)
recur_ind = iParm.recur_ind
uo_1.sle_date.text = f_dt_to_d_str(ldt_parm_datetime)
em_1.text = f_dt_to_t_str(ldt_parm_datetime)

if recur_ind = 'Y' then
	this.Title = 'TaskRepeater'
	uo_2.visible = true
	uo_3.visible = true
	st_3.visible = true
	st_4.visible = true
	gb_1.visible = true
	gb_2.visible = true
	em_2.visible = true
	uo_2.sle_date.text = iParm.recur_start_date
	uo_3.sle_date.text = iParm.recur_end_date
	if iParm.recur_freq_code = 'D' then
		rb_freq_day.checked = true
	else
		rb_freq_hour.checked = true
	end if
	if iParm.recur_by = 'T' then
		rb_recur_target.checked = true
	else
		rb_recur_close.checked = true
	end if
	em_2.text = iParm.recur_freq_num
	rb_freq_hour.visible = true
	rb_freq_day.visible = true
	rb_recur_close.visible = true
	rb_recur_target.visible = true
	cb_recur.y = cb_recur.y + 610
	cb_ok.y = cb_ok.y + 610
	cb_cancel.y = cb_cancel.y + 610
	this.height = this.height + 600
	if iParm.open_mode = '0' then
		cb_recur.text = "No Repeat"
	else
		cb_recur.enabled = false
	end if
else
	this.Title = 'Timer Start Date/Time'
end if



end event

on w_call_timer_date.create
this.rb_recur_close=create rb_recur_close
this.rb_recur_target=create rb_recur_target
this.em_2=create em_2
this.rb_freq_hour=create rb_freq_hour
this.rb_freq_day=create rb_freq_day
this.uo_3=create uo_3
this.st_4=create st_4
this.uo_2=create uo_2
this.st_3=create st_3
this.cb_recur=create cb_recur
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_2=create st_2
this.st_1=create st_1
this.em_1=create em_1
this.uo_1=create uo_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_recur_close,&
this.rb_recur_target,&
this.em_2,&
this.rb_freq_hour,&
this.rb_freq_day,&
this.uo_3,&
this.st_4,&
this.uo_2,&
this.st_3,&
this.cb_recur,&
this.cb_cancel,&
this.cb_ok,&
this.st_2,&
this.st_1,&
this.em_1,&
this.uo_1,&
this.gb_1,&
this.gb_2}
end on

on w_call_timer_date.destroy
destroy(this.rb_recur_close)
destroy(this.rb_recur_target)
destroy(this.em_2)
destroy(this.rb_freq_hour)
destroy(this.rb_freq_day)
destroy(this.uo_3)
destroy(this.st_4)
destroy(this.uo_2)
destroy(this.st_3)
destroy(this.cb_recur)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.uo_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type rb_recur_close from radiobutton within w_call_timer_date
integer x = 69
integer y = 940
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Close date/time"
boolean checked = true
end type

type rb_recur_target from radiobutton within w_call_timer_date
integer x = 626
integer y = 940
integer width = 576
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Target date/time"
end type

type em_2 from editmask within w_call_timer_date
boolean visible = false
integer x = 133
integer y = 984
integer width = 219
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "30"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "1~~365"
end type

event modified;if em_2.text = '24' and rb_freq_hour.checked = true then
	em_2.text = '1' 
	MessageBox("Warning","You selected 24 hour for recurring frequency, it will be changed to 1 day instead!!!")
	rb_freq_hour.checked = false
	rb_freq_day.checked = true
end if
end event

type rb_freq_hour from radiobutton within w_call_timer_date
boolean visible = false
integer x = 434
integer y = 1012
integer width = 224
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "hours"
end type

event clicked;if em_2.text = '24' and rb_freq_hour.checked = true then
	em_2.text = '1' 
	MessageBox("Warning","You selected 24 hour for recurring frequency, it will be changed to 1 day instead!!!")
	rb_freq_hour.checked = false
	rb_freq_day.checked = true
end if

if em_2.text > '23' then
	em_2.text = '1'
end if

wf_validation()
end event

type rb_freq_day from radiobutton within w_call_timer_date
boolean visible = false
integer x = 699
integer y = 1012
integer width = 242
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "days"
boolean checked = true
end type

type uo_3 from u_ddcal within w_call_timer_date
boolean visible = false
integer x = 197
integer y = 772
integer width = 430
integer height = 104
integer taborder = 20
end type

on uo_3.destroy
call u_ddcal::destroy
end on

type st_4 from statictext within w_call_timer_date
boolean visible = false
integer x = 224
integer y = 700
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "End Date"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_2 from u_ddcal within w_call_timer_date
boolean visible = false
integer x = 197
integer y = 568
integer width = 430
integer height = 104
integer taborder = 20
end type

on uo_2.destroy
call u_ddcal::destroy
end on

event size_closed;call super::size_closed;if uo_2.sle_date.text <> '' then
	uo_1.sle_date.text = uo_2.sle_date.text
	if datetime(date(uo_2.sle_date.text),time(09:00:00)) > datetime(today(),now()) then
		em_1.text = '09:00:00'
	end if
	recur_ind = 'Y'
end if
end event

type st_3 from statictext within w_call_timer_date
boolean visible = false
integer x = 219
integer y = 508
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "Start Date"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_recur from commandbutton within w_call_timer_date
integer x = 814
integer y = 604
integer width = 297
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Repeater"
end type

event clicked;
if uo_2.visible = true then //recurring is shown
	uo_2.visible = false
	uo_3.visible = false
	st_3.visible = false
	st_4.visible = false
	gb_1.visible = false
	gb_2.visible = false
	em_2.visible = false
	rb_freq_hour.visible = false
	rb_freq_day.visible = false
	rb_recur_target.visible = false
	rb_recur_close.visible = false
	cb_recur.y = cb_recur.y - 610
	cb_ok.y = cb_ok.y - 610
	cb_cancel.y = cb_cancel.y - 610
	parent.height = parent.height - 600
	if iParm.open_mode = '0' then //allow to change to a non-recurring call 
		uo_2.sle_date.text = ''
		uo_3.sle_date.text = ''
		recur_ind = 'N'
	end if
	cb_recur.text = 'Repeating'
	parent.Title='Timer Start Date/Time'
else
	uo_2.visible = true
	uo_3.visible = true
	st_3.visible = true
	st_4.visible = true
	gb_1.visible = true
	gb_2.visible = true
	em_2.visible = true
	rb_freq_hour.visible = true
	rb_freq_day.visible = true
	rb_recur_close.visible = true
	rb_recur_target.visible = true
	cb_recur.y = cb_recur.y + 610
	cb_ok.y = cb_ok.y + 610
	cb_cancel.y = cb_cancel.y + 610
	parent.height = parent.height + 600
	cb_recur.text = "No Repeat"
	parent.Title='TaskRepeater'
//	MessageBox("uo_1 value",uo_1.sle_date.text)
end if
	
end event

type cb_cancel from commandbutton within w_call_timer_date
integer x = 475
integer y = 604
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

event clicked;closewithreturn(parent,iParm)
end event

type cb_ok from commandbutton within w_call_timer_date
integer x = 142
integer y = 604
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

event clicked;//string ls_return
//ls_return = string(date(uo_1.sle_date.Text),"mm/dd/yy") + " " + em_1.text
iParm.timer_dt_str = uo_1.sle_date.Text + " " + em_1.text
iParm.recur_ind = recur_ind
if recur_ind = 'Y' then
	iParm.recur_start_date = uo_2.sle_date.text
	iParm.recur_end_date = uo_3.sle_date.text
	iParm.recur_start_time = em_1.text
	if rb_freq_hour.checked = true then
		iParm.recur_freq_code = 'H'
	else
		iParm.recur_freq_code = 'D'
	end if
	iParm.recur_freq_num = em_2.text
	if rb_recur_close.checked = true then
		iParm.recur_by = 'C' //recurring by close date
	else
		iParm.recur_by = 'T' //recurring by target date
	end if
else
	iParm.recur_start_date = ''
	iParm.recur_end_date = ''
	iParm.recur_start_time = ''
	iParm.recur_freq_code = ''
	iParm.recur_freq_num = ''
	iParm.recur_by = ''
end if
//ls_return = uo_1.sle_date.Text + " " + em_1.text
//closewithreturn(parent,ls_return)
closewithreturn(parent,iParm)
end event

type st_2 from statictext within w_call_timer_date
integer x = 434
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

type st_1 from statictext within w_call_timer_date
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

type em_1 from editmask within w_call_timer_date
integer x = 416
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

type uo_1 from u_ddcal within w_call_timer_date
integer x = 398
integer y = 152
integer width = 430
integer height = 104
integer taborder = 10
end type

on uo_1.destroy
call u_ddcal::destroy
end on

type gb_1 from groupbox within w_call_timer_date
boolean visible = false
integer x = 37
integer y = 924
integer width = 1010
integer height = 196
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Frequency"
end type

type gb_2 from groupbox within w_call_timer_date
integer x = 55
integer y = 876
integer width = 1166
integer height = 168
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Repeating by"
end type

