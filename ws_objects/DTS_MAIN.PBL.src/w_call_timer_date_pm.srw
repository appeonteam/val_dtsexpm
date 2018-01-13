$PBExportHeader$w_call_timer_date_pm.srw
forward
global type w_call_timer_date_pm from window
end type
type st_2 from statictext within w_call_timer_date_pm
end type
type em_1 from editmask within w_call_timer_date_pm
end type
type st_1 from statictext within w_call_timer_date_pm
end type
type uo_3 from u_ddcal within w_call_timer_date_pm
end type
type st_4 from statictext within w_call_timer_date_pm
end type
type cbx_7 from checkbox within w_call_timer_date_pm
end type
type cbx_6 from checkbox within w_call_timer_date_pm
end type
type cbx_5 from checkbox within w_call_timer_date_pm
end type
type cbx_4 from checkbox within w_call_timer_date_pm
end type
type cbx_3 from checkbox within w_call_timer_date_pm
end type
type cbx_2 from checkbox within w_call_timer_date_pm
end type
type cbx_1 from checkbox within w_call_timer_date_pm
end type
type st_6 from statictext within w_call_timer_date_pm
end type
type st_5 from statictext within w_call_timer_date_pm
end type
type rb_recur_close from radiobutton within w_call_timer_date_pm
end type
type rb_recur_target from radiobutton within w_call_timer_date_pm
end type
type uo_2 from u_ddcal within w_call_timer_date_pm
end type
type st_3 from statictext within w_call_timer_date_pm
end type
type cb_cancel from commandbutton within w_call_timer_date_pm
end type
type cb_ok from commandbutton within w_call_timer_date_pm
end type
type gb_2 from groupbox within w_call_timer_date_pm
end type
type gb_4 from groupbox within w_call_timer_date_pm
end type
type em_daily_start from editmask within w_call_timer_date_pm
end type
type em_daily_end from editmask within w_call_timer_date_pm
end type
type gb_3 from groupbox within w_call_timer_date_pm
end type
end forward

global type w_call_timer_date_pm from window
integer x = 1344
integer y = 652
integer width = 1856
integer height = 1328
boolean titlebar = true
string title = "Timer Start Date/Time"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
st_2 st_2
em_1 em_1
st_1 st_1
uo_3 uo_3
st_4 st_4
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
uo_2 uo_2
st_3 st_3
cb_cancel cb_cancel
cb_ok cb_ok
gb_2 gb_2
gb_4 gb_4
em_daily_start em_daily_start
em_daily_end em_daily_end
gb_3 gb_3
end type
global w_call_timer_date_pm w_call_timer_date_pm

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

//if time(em_daily_start.text) < time(em_1.text) then 
//	if rb_freq_hour.checked then
//		if f_str_d_to_d(uo_2.sle_date.text) <= today() then
//			datetime toDate 
//			toDate = datetime(RelativeDate(today(),1))
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
//else
//	if time(em_daily_start.text) > time(em_1.text) then
//		if f_str_d_to_d(uo_2.sle_date.text) <= today() then
//			em_1.text = em_daily_start.text
//		end if
//	end if
//end if

//if f_str_d_to_d(uo_1.sle_date.text) > today() then
//	if time(em_daily_start.text) <> time(em_1.text) then 
//		em_1.text = em_daily_start.text
//	end if
//end if
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
//uo_1.sle_date.text = f_dt_to_d_str(ldt_parm_datetime)
em_1.text = f_dt_to_t_str(ldt_parm_datetime)

//this.Title = 'PM TaskRepeater'

	this.Title = 'PM TaskRepeater'
	uo_2.sle_date.text = iParm.recur_start_date
	uo_3.sle_date.text =iParm.recur_end_date 
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

	if iParm.recur_by = 'T' then
		rb_recur_target.checked = true
	else
		rb_recur_close.checked = true
	end if

	rb_recur_close.visible = true
	rb_recur_target.visible = true




end event

on w_call_timer_date_pm.create
this.st_2=create st_2
this.em_1=create em_1
this.st_1=create st_1
this.uo_3=create uo_3
this.st_4=create st_4
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
this.uo_2=create uo_2
this.st_3=create st_3
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.gb_2=create gb_2
this.gb_4=create gb_4
this.em_daily_start=create em_daily_start
this.em_daily_end=create em_daily_end
this.gb_3=create gb_3
this.Control[]={this.st_2,&
this.em_1,&
this.st_1,&
this.uo_3,&
this.st_4,&
this.cbx_7,&
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
this.uo_2,&
this.st_3,&
this.cb_cancel,&
this.cb_ok,&
this.gb_2,&
this.gb_4,&
this.em_daily_start,&
this.em_daily_end,&
this.gb_3}
end on

on w_call_timer_date_pm.destroy
destroy(this.st_2)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.uo_3)
destroy(this.st_4)
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
destroy(this.uo_2)
destroy(this.st_3)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.em_daily_start)
destroy(this.em_daily_end)
destroy(this.gb_3)
end on

type st_2 from statictext within w_call_timer_date_pm
integer x = 1102
integer y = 52
integer width = 466
integer height = 48
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 134217750
string text = "Repeater Initial "
boolean focusrectangle = false
end type

type em_1 from editmask within w_call_timer_date_pm
integer x = 1147
integer y = 184
integer width = 361
integer height = 92
integer taborder = 40
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

type st_1 from statictext within w_call_timer_date_pm
integer x = 1170
integer y = 112
integer width = 315
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 134217750
boolean enabled = false
string text = "Start Time"
boolean focusrectangle = false
end type

type uo_3 from u_ddcal within w_call_timer_date_pm
integer x = 654
integer y = 180
integer width = 457
integer height = 104
integer taborder = 50
end type

on uo_3.destroy
call u_ddcal::destroy
end on

type st_4 from statictext within w_call_timer_date_pm
integer x = 690
integer y = 108
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

type cbx_7 from checkbox within w_call_timer_date_pm
integer x = 1422
integer y = 740
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

type cbx_6 from checkbox within w_call_timer_date_pm
integer x = 1230
integer y = 740
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

type cbx_5 from checkbox within w_call_timer_date_pm
integer x = 1033
integer y = 740
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
boolean checked = true
end type

type cbx_4 from checkbox within w_call_timer_date_pm
integer x = 837
integer y = 740
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
boolean checked = true
end type

type cbx_3 from checkbox within w_call_timer_date_pm
integer x = 640
integer y = 740
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
boolean checked = true
end type

type cbx_2 from checkbox within w_call_timer_date_pm
integer x = 443
integer y = 740
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
boolean checked = true
end type

type cbx_1 from checkbox within w_call_timer_date_pm
integer x = 242
integer y = 740
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
boolean checked = true
end type

type st_6 from statictext within w_call_timer_date_pm
boolean visible = false
integer x = 1070
integer y = 428
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

type st_5 from statictext within w_call_timer_date_pm
boolean visible = false
integer x = 526
integer y = 428
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

type rb_recur_close from radiobutton within w_call_timer_date_pm
integer x = 375
integer y = 964
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

type rb_recur_target from radiobutton within w_call_timer_date_pm
integer x = 992
integer y = 964
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

type uo_2 from u_ddcal within w_call_timer_date_pm
integer x = 169
integer y = 180
integer width = 457
integer height = 104
integer taborder = 30
end type

on uo_2.destroy
call u_ddcal::destroy
end on

event size_closed;call super::size_closed;if uo_2.sle_date.text <> '' then
	if datetime(date(uo_2.sle_date.text),time(09:00:00)) > datetime(today(),now()) then
		em_1.text = '09:00:00'
	end if
end if
end event

type st_3 from statictext within w_call_timer_date_pm
integer x = 206
integer y = 116
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
string text = "Start Date"
alignment alignment = center!
long bordercolor = 134217750
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_call_timer_date_pm
integer x = 942
integer y = 1104
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

type cb_ok from commandbutton within w_call_timer_date_pm
integer x = 608
integer y = 1104
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

event clicked;
iParm.recur_ind = recur_ind

	if em_1.text<> "" then
		if f_str_d_to_d(uo_2.sle_date.text) = date('1900-01-01') then
			MessageBox("Error","Invalid Repeater Start Date!")
			return
		end if
	else
		MessageBox("Warning","Repeater start date required!")
		return
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
	iParm.timer_dt_str = uo_2.sle_date.text+' '+em_1.text
//*	if rb_freq_hour.checked = true then
//*		iParm.recur_freq_code = 'H'
//*	else
	iParm.recur_freq_code = 'D'
//*	end if
//*	iParm.recur_freq_num = em_2.text
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
//*		validate_start_date = wf_validate_init_start_date(uo_1.sle_date.text)
//*		if validate_start_date <> uo_1.sle_date.text then
//*			if f_str_d_to_d(uo_1.sle_date.text) = today() then
//*				em_1.text = '09:00'
//*			end if
//*			uo_1.sle_date.text = validate_start_date
//*			uo_2.sle_date.text = validate_start_date
//*			iParm.timer_dt_str = uo_1.sle_date.text + " " + em_1.text
//*			iParm.recur_start_date=uo_2.sle_date.text
//*			if f_str_d_to_d(uo_3.sle_date.text) < f_str_d_to_d(uo_2.sle_date.text) then
//*				uo_3.sle_date.text = validate_start_date
//*			end if
//*			MessageBox("Warning","Initial scheduled date and Repeater start date are changed " + &
//*				"according to Day-Of-Week-Selector! Please verify!")
//			MessageBox("day of week", dowt[DayNumber(f_str_d_to_d(uo_1.sle_date.text))])
			return
//*		end if
	end if	

//else
//	iParm.recur_start_date = ''
//	iParm.recur_end_date = ''
//	iParm.recur_start_time = ''
//	iParm.recur_freq_code = ''
//	iParm.recur_freq_num = ''
//	iParm.recur_by = ''
//	iParm.daily_start_time = ''
//	iParm.daily_end_time = ''
//	iParm.week_day_selected = ''
//end if
//ls_return = uo_1.sle_date.Text + " " + em_1.text
//closewithreturn(parent,ls_return)
closewithreturn(parent,iParm)
end event

type gb_2 from groupbox within w_call_timer_date_pm
integer x = 265
integer y = 900
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

type gb_4 from groupbox within w_call_timer_date_pm
integer x = 210
integer y = 656
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

type em_daily_start from editmask within w_call_timer_date_pm
integer x = 489
integer y = 496
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

type em_daily_end from editmask within w_call_timer_date_pm
integer x = 987
integer y = 496
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

type gb_3 from groupbox within w_call_timer_date_pm
string tag = "Require only when for hourly frequency!"
integer x = 384
integer y = 328
integer width = 1097
integer height = 296
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

