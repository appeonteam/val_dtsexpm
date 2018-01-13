$PBExportHeader$w_call_timer_date_new.srw
forward
global type w_call_timer_date_new from window
end type
type cbx_7 from checkbox within w_call_timer_date_new
end type
type cbx_6 from checkbox within w_call_timer_date_new
end type
type cbx_5 from checkbox within w_call_timer_date_new
end type
type cbx_4 from checkbox within w_call_timer_date_new
end type
type cbx_3 from checkbox within w_call_timer_date_new
end type
type cbx_2 from checkbox within w_call_timer_date_new
end type
type cbx_1 from checkbox within w_call_timer_date_new
end type
type st_6 from statictext within w_call_timer_date_new
end type
type st_5 from statictext within w_call_timer_date_new
end type
type rb_recur_close from radiobutton within w_call_timer_date_new
end type
type rb_recur_target from radiobutton within w_call_timer_date_new
end type
type em_2 from editmask within w_call_timer_date_new
end type
type rb_freq_hour from radiobutton within w_call_timer_date_new
end type
type rb_freq_day from radiobutton within w_call_timer_date_new
end type
type uo_3 from u_ddcal within w_call_timer_date_new
end type
type st_4 from statictext within w_call_timer_date_new
end type
type uo_2 from u_ddcal within w_call_timer_date_new
end type
type st_3 from statictext within w_call_timer_date_new
end type
type cb_recur from commandbutton within w_call_timer_date_new
end type
type cb_cancel from commandbutton within w_call_timer_date_new
end type
type cb_ok from commandbutton within w_call_timer_date_new
end type
type st_2 from statictext within w_call_timer_date_new
end type
type st_1 from statictext within w_call_timer_date_new
end type
type em_1 from editmask within w_call_timer_date_new
end type
type uo_1 from u_ddcal within w_call_timer_date_new
end type
type gb_1 from groupbox within w_call_timer_date_new
end type
type gb_2 from groupbox within w_call_timer_date_new
end type
type gb_4 from groupbox within w_call_timer_date_new
end type
type em_daily_start from editmask within w_call_timer_date_new
end type
type em_daily_end from editmask within w_call_timer_date_new
end type
type gb_3 from groupbox within w_call_timer_date_new
end type
end forward

global type w_call_timer_date_new from window
integer x = 1344
integer y = 652
integer width = 1856
integer height = 988
boolean titlebar = true
string title = "Timer Start Date/Time"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
cbx_7 cbx_7
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_6 st_6
st_5 st_5
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
gb_4 gb_4
em_daily_start em_daily_start
em_daily_end em_daily_end
gb_3 gb_3
end type
global w_call_timer_date_new w_call_timer_date_new

type variables
string   ls_parm_datetime
string 	recur_ind
s_timer_recur iParm
int down[7] = {0,1,2,3,4,5,6}
string dowt[7] = {'Sun','Mon','Tue','Wed','Thu','Fri','Sat'}
end variables

forward prototypes
public subroutine wf_validation ()
public subroutine wf_set_weekday_selector ()
public function string wf_validate_init_start_date (string idatestr)
public function boolean wf_if_week_day_selected ()
end prototypes

public subroutine wf_validation ();if em_daily_start.text = "" then
	return
end if

if time(em_daily_start.text) < time(em_1.text) then 
	if rb_freq_hour.checked then
		if f_str_d_to_d(uo_2.sle_date.text) <= today() then
			datetime toDate 
			toDate = datetime(RelativeDate(today(),1))
			uo_2.sle_date.text = f_dt_to_d_str(toDate)
			uo_1.sle_date.text = f_dt_to_d_str(toDate)
			em_1.text = em_daily_start.text
			if f_str_d_to_d(uo_3.sle_date.text) <= today() then
				uo_3.sle_date.text = f_dt_to_d_str(toDate)
			end if
			MessageBox("warning","Intended starting time is in the past! " + & 
				"Start date is changed to the next date("+ f_dt_to_d_str(toDate)+")!")	
		end if
	end if
else
	if time(em_daily_start.text) > time(em_1.text) then
		if f_str_d_to_d(uo_2.sle_date.text) <= today() then
			em_1.text = em_daily_start.text
		end if
	end if
end if

if f_str_d_to_d(uo_1.sle_date.text) > today() then
	if time(em_daily_start.text) <> time(em_1.text) then 
		em_1.text = em_daily_start.text
	end if
end if
end subroutine

public subroutine wf_set_weekday_selector ();if cbx_1.checked then
		iParm.week_day_selected = 'Mon'
end if
if cbx_2.checked then
	iParm.week_day_selected = iParm.week_day_selected+'Tue'
end if	
if cbx_3.checked then
	iParm.week_day_selected = iParm.week_day_selected+'Wed'
end if
if cbx_4.checked then
	iParm.week_day_selected = iParm.week_day_selected+'Thu'
end if	
if cbx_5.checked then
	iParm.week_day_selected = iParm.week_day_selected+'Fri'
end if
if cbx_6.checked then
	iParm.week_day_selected = iParm.week_day_selected+'Sat'
end if
if cbx_7.checked then
	iParm.week_day_selected = iParm.week_day_selected+'Sun'
end if
end subroutine

public function string wf_validate_init_start_date (string idatestr);if not wf_if_week_day_selected() then
	return iDateStr
end if
string dow 
date wdt 
dow = dowt[DayNumber(f_str_d_to_d(iDateStr))]
wdt = f_str_d_to_d(iDateStr)
int i = 1
do while i <= 7
	if dow = 'Mon' then
		if cbx_1.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	if dow = 'Tue' then
		if cbx_2.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	if dow = 'Wed' then
		if cbx_3.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	if dow = 'Thu' then
		if cbx_4.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	if dow = 'Fri' then
		if cbx_5.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	if dow = 'Sat' then
		if cbx_6.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	if dow = 'Sun' then
		if cbx_7.checked then
			return f_dt_to_d_str(datetime(wdt))
		end if
	end if
	i++
	wdt=RelativeDate(wdt,1)
	dow = dowt[DayNumber(wdt)]
loop

return ''
end function

public function boolean wf_if_week_day_selected ();if cbx_1.checked or &
	cbx_2.checked or &
	cbx_3.checked or &
	cbx_4.checked or &
	cbx_5.checked or &
	cbx_6.checked or &
	cbx_7.checked then
	return true
else
	return false
end if

end function

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
	gb_3.visible = true
	gb_4.visible = true
	em_2.visible = true
	em_daily_start.visible = true
	em_daily_end.visible = true
	cbx_7.visible = true
	cbx_1.visible = true
	cbx_2.visible = true
	cbx_3.visible = true
	cbx_4.visible = true
	cbx_5.visible = true
	cbx_6.visible = true
	uo_2.sle_date.text = iParm.recur_start_date
	uo_3.sle_date.text = iParm.recur_end_date
	em_daily_start.text = iParm.daily_start_time
	em_daily_end.text = iParm.daily_end_time
	int i = 1
	int j = 1
	do while i <= 21 and len(RightTrim(Mid(iParm.week_day_selected,i,3)))>0
		choose case mid(iParm.week_day_selected,i,3)
			case 'Mon'
				cbx_1.checked = true
			case 'Tue'
				cbx_2.checked = true
			case 'Wed'
				cbx_3.checked = true
			case 'Thu'
				cbx_4.checked = true
			case 'Fri'
				cbx_5.checked = true
			case 'Sat'
				cbx_6.checked = true
			case 'Sun'
				cbx_7.checked = true
		end choose
		i=i+3
		j++
	loop
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
	cb_recur.y = cb_recur.y + 930
	cb_ok.y = cb_ok.y +930
	cb_cancel.y = cb_cancel.y + 930
	this.height = this.height + 860
	if iParm.open_mode = '0' then
		cb_recur.text = "No Repeat"
	else
//		uo_1.enabled = false
//		uo_2.enabled = false
//		em_1.enabled = false
//		em_2.enabled = false
//		rb_freq_hour.enabled = false
//		rb_freq_day.enabled = false
//		rb_recur_close.enabled = false
//		rb_recur_target.enabled = false
//		em_daily_start.enabled = false
//		em_daily_end.enabled = false
//		cbx_1.enabled = false
//		cbx_2.enabled = false
//		cbx_3.enabled = false
//		cbx_4.enabled = false
//		cbx_5.enabled = false
//		cbx_6.enabled = false
//		cbx_7.enabled = false
		cb_recur.enabled = false
//		cb_ok.enabled = false
	end if
else
	this.Title = 'Timer Start Date/Time'
end if



end event

on w_call_timer_date_new.create
this.cbx_7=create cbx_7
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_6=create st_6
this.st_5=create st_5
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
this.gb_4=create gb_4
this.em_daily_start=create em_daily_start
this.em_daily_end=create em_daily_end
this.gb_3=create gb_3
this.Control[]={this.cbx_7,&
this.cbx_6,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_6,&
this.st_5,&
this.rb_recur_close,&
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
this.gb_2,&
this.gb_4,&
this.em_daily_start,&
this.em_daily_end,&
this.gb_3}
end on

on w_call_timer_date_new.destroy
destroy(this.cbx_7)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_6)
destroy(this.st_5)
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
destroy(this.gb_4)
destroy(this.em_daily_start)
destroy(this.em_daily_end)
destroy(this.gb_3)
end on

type cbx_7 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 1422
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Sun"
end type

type cbx_6 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 1230
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Sat"
end type

type cbx_5 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 1033
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Fri"
end type

type cbx_4 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 837
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Thu"
end type

type cbx_3 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 640
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Wed"
end type

type cbx_2 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 443
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Tue"
end type

type cbx_1 from checkbox within w_call_timer_date_new
boolean visible = false
integer x = 242
integer y = 1264
integer width = 197
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Mon"
end type

type st_6 from statictext within w_call_timer_date_new
boolean visible = false
integer x = 1088
integer y = 980
integer width = 297
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "End time"
boolean focusrectangle = false
end type

type st_5 from statictext within w_call_timer_date_new
boolean visible = false
integer x = 544
integer y = 980
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Start time"
boolean focusrectangle = false
end type

type rb_recur_close from radiobutton within w_call_timer_date_new
integer x = 379
integer y = 1448
integer width = 530
integer height = 72
integer taborder = 210
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "By Close Date"
boolean checked = true
end type

type rb_recur_target from radiobutton within w_call_timer_date_new
integer x = 997
integer y = 1448
integer width = 503
integer height = 72
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "By Target Date"
end type

type em_2 from editmask within w_call_timer_date_new
boolean visible = false
integer x = 480
integer y = 796
integer width = 219
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
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

type rb_freq_hour from radiobutton within w_call_timer_date_new
boolean visible = false
integer x = 768
integer y = 800
integer width = 224
integer height = 72
integer taborder = 70
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

if iParm.open_mode = '0' then
	wf_validation()
end if
end event

type rb_freq_day from radiobutton within w_call_timer_date_new
boolean visible = false
integer x = 1093
integer y = 800
integer width = 242
integer height = 72
integer taborder = 80
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

event clicked;if em_daily_start.text <> '' then
	em_daily_start.text = ''
	em_daily_end.text = ''
	MessageBox("Warning","Daily Schedule information becomes irrelevant, thus erased!")
end if
end event

type uo_3 from u_ddcal within w_call_timer_date_new
boolean visible = false
integer x = 1038
integer y = 584
integer width = 457
integer height = 104
integer taborder = 40
end type

on uo_3.destroy
call u_ddcal::destroy
end on

type st_4 from statictext within w_call_timer_date_new
boolean visible = false
integer x = 1074
integer y = 512
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 134217750
boolean enabled = false
string text = "End Date"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_2 from u_ddcal within w_call_timer_date_new
boolean visible = false
integer x = 366
integer y = 584
integer width = 457
integer height = 104
integer taborder = 30
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

type st_3 from statictext within w_call_timer_date_new
boolean visible = false
integer x = 402
integer y = 512
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 134217750
boolean enabled = false
string text = "Start Date"
alignment alignment = center!
long bordercolor = 134217750
boolean focusrectangle = false
end type

type cb_recur from commandbutton within w_call_timer_date_new
integer x = 1070
integer y = 676
integer width = 320
integer height = 96
integer taborder = 250
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
	gb_3.visible = false
	em_daily_start.visible = false
	em_daily_end.visible = false
	gb_4.visible = false
	st_5.visible = false
	st_6.visible = false
	rb_freq_hour.visible = false
	rb_freq_day.visible = false
	rb_recur_target.visible = false
	rb_recur_close.visible = false
	cbx_7.visible = false
	cbx_1.visible = false
	cbx_2.visible = false
	cbx_3.visible = false
	cbx_4.visible = false
	cbx_5.visible = false
	cbx_6.visible = false
	cb_recur.y = cb_recur.y - 930
	cb_ok.y = cb_ok.y - 930
	cb_cancel.y = cb_cancel.y - 930
	parent.height = parent.height - 860
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
	gb_3.visible = true
	em_daily_start.visible = true
	em_daily_end.visible = true
	gb_4.visible = true
	st_5.visible = true
	st_6.visible = true
	rb_freq_hour.visible = true
	rb_freq_day.visible = true
	rb_recur_close.visible = true
	rb_recur_target.visible = true
	cbx_7.visible = true
	cbx_1.visible = true
	cbx_2.visible = true
	cbx_3.visible = true
	cbx_4.visible = true
	cbx_5.visible = true
	cbx_6.visible = true
	cb_recur.y = cb_recur.y + 930
	cb_ok.y = cb_ok.y + 930
	cb_cancel.y = cb_cancel.y + 930
	parent.height = parent.height + 860
	cb_recur.text = "No Repeat"
	parent.Title='TaskRepeater'
//	MessageBox("uo_1 value",uo_1.sle_date.text)
end if
	
end event

type cb_cancel from commandbutton within w_call_timer_date_new
integer x = 731
integer y = 676
integer width = 315
integer height = 96
integer taborder = 240
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

type cb_ok from commandbutton within w_call_timer_date_new
integer x = 398
integer y = 676
integer width = 315
integer height = 96
integer taborder = 230
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
	if uo_2.sle_date.text <> "" then
		if f_str_d_to_d(uo_2.sle_date.text) = date('1900-01-01') then
			MessageBox("Error","Invalid Repeater Start Date!")
			return
		end if
	end if
	iParm.recur_start_date = uo_2.sle_date.text
	if uo_3.sle_date.text = '' then
		uo_3.sle_date.text = f_dt_to_d_str(datetime(RelativeDate(f_str_d_to_d(uo_2.sle_date.text),365)))
		MessageBox("Default","Default Repeater End Date is assumed! Please verify!")
		return
	else
		if f_str_d_to_d(uo_3.sle_date.text) = date('1900-01-01') then
			MessageBox("Error","Invalid Repeater End Date!")
			return
		end if
		iParm.recur_end_date = uo_3.sle_date.text
	end if
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
	if em_daily_start.text <> '' then
		if em_daily_end.text <> '' then
			iParm.daily_start_time = em_daily_start.text
			iparm.daily_end_time = em_daily_end.text
		else
			MessageBox("Error","Require end time! Try again!")
			return
		end if
	else
		SetNull(iParm.daily_start_time)
		if em_daily_end.text <> '' then
			MessageBox("Error","Require start time! Try again!")
			return
		else
			SetNull(iparm.daily_end_time)
		end if	
	end if
	iParm.week_day_selected = ''
	wf_set_weekday_selector()
	if iParm.open_mode = '0' then
		string validate_start_date 
		validate_start_date = wf_validate_init_start_date(uo_1.sle_date.text)
		if validate_start_date <> uo_1.sle_date.text then
			if f_str_d_to_d(uo_1.sle_date.text) = today() then
				em_1.text = '09:00'
			end if
			uo_1.sle_date.text = validate_start_date
			uo_2.sle_date.text = validate_start_date
			iParm.timer_dt_str = uo_1.sle_date.text + " " + em_1.text
			iParm.recur_start_date=uo_2.sle_date.text
			if f_str_d_to_d(uo_3.sle_date.text) < f_str_d_to_d(uo_2.sle_date.text) then
				uo_3.sle_date.text = validate_start_date
			end if
			MessageBox("Warning","Initial scheduled date and Repeater start date are changed " + &
				"according to Day-Of-Week-Selector! Please verify!")
//			MessageBox("day of week", dowt[DayNumber(f_str_d_to_d(uo_1.sle_date.text))])
			return
		end if
	end if	

else
	iParm.recur_start_date = ''
	iParm.recur_end_date = ''
	iParm.recur_start_time = ''
	iParm.recur_freq_code = ''
	iParm.recur_freq_num = ''
	iParm.recur_by = ''
	iParm.daily_start_time = ''
	iParm.daily_end_time = ''
	iParm.week_day_selected = ''
end if
//ls_return = uo_1.sle_date.Text + " " + em_1.text
//closewithreturn(parent,ls_return)
closewithreturn(parent,iParm)
end event

type st_2 from statictext within w_call_timer_date_new
integer x = 681
integer y = 48
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 134217750
boolean enabled = false
string text = "Enter Date"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_call_timer_date_new
integer x = 690
integer y = 300
integer width = 352
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 134217750
boolean enabled = false
string text = "Enter Time"
boolean focusrectangle = false
end type

type em_1 from editmask within w_call_timer_date_new
integer x = 681
integer y = 372
integer width = 361
integer height = 92
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
string mask = "hh:mm"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type uo_1 from u_ddcal within w_call_timer_date_new
integer x = 626
integer y = 128
integer width = 457
integer height = 104
integer taborder = 10
borderstyle borderstyle = stylelowered!
end type

on uo_1.destroy
call u_ddcal::destroy
end on

type gb_1 from groupbox within w_call_timer_date_new
boolean visible = false
integer x = 393
integer y = 712
integer width = 1102
integer height = 196
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217750
string text = "Frequency"
end type

type gb_2 from groupbox within w_call_timer_date_new
integer x = 270
integer y = 1384
integer width = 1294
integer height = 168
integer taborder = 200
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217750
string text = "Repeating by"
end type

type gb_4 from groupbox within w_call_timer_date_new
boolean visible = false
integer x = 210
integer y = 1180
integer width = 1422
integer height = 200
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217750
string text = "Day of week selector"
end type

type em_daily_start from editmask within w_call_timer_date_new
integer x = 507
integer y = 1048
integer width = 343
integer height = 80
integer taborder = 100
boolean bringtotop = true
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
string mask = "hh:mm"
boolean spin = true
double increment = 1
end type

event modified;if iParm.open_mode = '0' then
	wf_validation()
end if
if time(this.text) > time(em_daily_end.text) then
	em_daily_end.text = this.text
end if
end event

type em_daily_end from editmask within w_call_timer_date_new
integer x = 1006
integer y = 1048
integer width = 343
integer height = 80
integer taborder = 110
boolean bringtotop = true
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
string mask = "hh:mm"
boolean spin = true
double increment = 1
end type

event modified;if time(this.text) < time(em_daily_start.text) then
	MessageBox("Warning","End time can't be before start time!")
	this.text = em_daily_start.text
end if
end event

type gb_3 from groupbox within w_call_timer_date_new
string tag = "Require only when for hourly frequency!"
boolean visible = false
integer x = 402
integer y = 924
integer width = 1097
integer height = 252
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217750
string text = "Daily Schedule"
end type

