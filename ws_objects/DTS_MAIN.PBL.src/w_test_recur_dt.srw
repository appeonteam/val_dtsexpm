$PBExportHeader$w_test_recur_dt.srw
forward
global type w_test_recur_dt from window
end type
type cb_1 from commandbutton within w_test_recur_dt
end type
type cbx_7 from checkbox within w_test_recur_dt
end type
type cbx_6 from checkbox within w_test_recur_dt
end type
type cbx_5 from checkbox within w_test_recur_dt
end type
type cbx_4 from checkbox within w_test_recur_dt
end type
type cbx_3 from checkbox within w_test_recur_dt
end type
type cbx_2 from checkbox within w_test_recur_dt
end type
type cbx_1 from checkbox within w_test_recur_dt
end type
type st_15 from statictext within w_test_recur_dt
end type
type st_14 from statictext within w_test_recur_dt
end type
type em_daily_end from editmask within w_test_recur_dt
end type
type em_daily_start from editmask within w_test_recur_dt
end type
type cb_init from commandbutton within w_test_recur_dt
end type
type cb_clear from commandbutton within w_test_recur_dt
end type
type st_13 from statictext within w_test_recur_dt
end type
type st_12 from statictext within w_test_recur_dt
end type
type sle_schd_time from singlelineedit within w_test_recur_dt
end type
type sle_schd_date from singlelineedit within w_test_recur_dt
end type
type st_11 from statictext within w_test_recur_dt
end type
type st_10 from statictext within w_test_recur_dt
end type
type st_9 from statictext within w_test_recur_dt
end type
type st_8 from statictext within w_test_recur_dt
end type
type st_7 from statictext within w_test_recur_dt
end type
type st_6 from statictext within w_test_recur_dt
end type
type st_5 from statictext within w_test_recur_dt
end type
type st_4 from statictext within w_test_recur_dt
end type
type st_3 from statictext within w_test_recur_dt
end type
type st_2 from statictext within w_test_recur_dt
end type
type st_1 from statictext within w_test_recur_dt
end type
type sle_start_date from singlelineedit within w_test_recur_dt
end type
type cb_test from commandbutton within w_test_recur_dt
end type
type sle_freq_code from singlelineedit within w_test_recur_dt
end type
type sle_freq_num from singlelineedit within w_test_recur_dt
end type
type sle_end_date from singlelineedit within w_test_recur_dt
end type
type sle_next_date from singlelineedit within w_test_recur_dt
end type
type sle_today from singlelineedit within w_test_recur_dt
end type
type sle_now from singlelineedit within w_test_recur_dt
end type
type sle_next_time from singlelineedit within w_test_recur_dt
end type
type sle_recur_by from singlelineedit within w_test_recur_dt
end type
type sle_start_time from singlelineedit within w_test_recur_dt
end type
end forward

global type w_test_recur_dt from window
integer width = 1920
integer height = 1600
boolean titlebar = true
string title = "Test Recurring date/time"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cbx_7 cbx_7
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_15 st_15
st_14 st_14
em_daily_end em_daily_end
em_daily_start em_daily_start
cb_init cb_init
cb_clear cb_clear
st_13 st_13
st_12 st_12
sle_schd_time sle_schd_time
sle_schd_date sle_schd_date
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
sle_start_date sle_start_date
cb_test cb_test
sle_freq_code sle_freq_code
sle_freq_num sle_freq_num
sle_end_date sle_end_date
sle_next_date sle_next_date
sle_today sle_today
sle_now sle_now
sle_next_time sle_next_time
sle_recur_by sle_recur_by
sle_start_time sle_start_time
end type
global w_test_recur_dt w_test_recur_dt

type variables
double dd
date nd,td,sd,ed,schd
time nt,now,st,scht,dst,det
string fc,rc,wksel
int fn
end variables

on w_test_recur_dt.create
this.cb_1=create cb_1
this.cbx_7=create cbx_7
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_15=create st_15
this.st_14=create st_14
this.em_daily_end=create em_daily_end
this.em_daily_start=create em_daily_start
this.cb_init=create cb_init
this.cb_clear=create cb_clear
this.st_13=create st_13
this.st_12=create st_12
this.sle_schd_time=create sle_schd_time
this.sle_schd_date=create sle_schd_date
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_start_date=create sle_start_date
this.cb_test=create cb_test
this.sle_freq_code=create sle_freq_code
this.sle_freq_num=create sle_freq_num
this.sle_end_date=create sle_end_date
this.sle_next_date=create sle_next_date
this.sle_today=create sle_today
this.sle_now=create sle_now
this.sle_next_time=create sle_next_time
this.sle_recur_by=create sle_recur_by
this.sle_start_time=create sle_start_time
this.Control[]={this.cb_1,&
this.cbx_7,&
this.cbx_6,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_15,&
this.st_14,&
this.em_daily_end,&
this.em_daily_start,&
this.cb_init,&
this.cb_clear,&
this.st_13,&
this.st_12,&
this.sle_schd_time,&
this.sle_schd_date,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_start_date,&
this.cb_test,&
this.sle_freq_code,&
this.sle_freq_num,&
this.sle_end_date,&
this.sle_next_date,&
this.sle_today,&
this.sle_now,&
this.sle_next_time,&
this.sle_recur_by,&
this.sle_start_time}
end on

on w_test_recur_dt.destroy
destroy(this.cb_1)
destroy(this.cbx_7)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.em_daily_end)
destroy(this.em_daily_start)
destroy(this.cb_init)
destroy(this.cb_clear)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.sle_schd_time)
destroy(this.sle_schd_date)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_start_date)
destroy(this.cb_test)
destroy(this.sle_freq_code)
destroy(this.sle_freq_num)
destroy(this.sle_end_date)
destroy(this.sle_next_date)
destroy(this.sle_today)
destroy(this.sle_now)
destroy(this.sle_next_time)
destroy(this.sle_recur_by)
destroy(this.sle_start_time)
end on

type cb_1 from commandbutton within w_test_recur_dt
integer x = 1408
integer y = 1308
integer width = 402
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "validate"
end type

event clicked;date origDate, newDate 
origDate = date(sle_next_date.text)
newDate = date(sle_next_date.text)
time origTime, newTime
origTime = time(sle_next_time.text)
newTime = time(sle_next_time.text)
f_validate_recur_dt(dst,det,wksel,newDate,newTime)
if origDate <> newDate then
	MessageBox('changed',string(origDate)+' to '+string(newDate))
	if newDate > date(sle_end_date.text	) then
		sle_next_date.text = ''
		sle_next_time.text = '' 
		return
	else
		sle_next_date.text = string(newDate)
	end if
end if
if origTime <> newTime then
	MessageBox('changed',string(origTime)+' to '+string(newTime))
	sle_next_time.text = string(newTime)	
end if 
end event

type cbx_7 from checkbox within w_test_recur_dt
integer x = 1554
integer y = 880
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sun"
end type

type cbx_6 from checkbox within w_test_recur_dt
integer x = 1330
integer y = 964
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sat"
end type

type cbx_5 from checkbox within w_test_recur_dt
integer x = 1330
integer y = 880
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fri"
end type

type cbx_4 from checkbox within w_test_recur_dt
integer x = 1056
integer y = 960
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Thu"
end type

type cbx_3 from checkbox within w_test_recur_dt
integer x = 1056
integer y = 872
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Wed"
end type

type cbx_2 from checkbox within w_test_recur_dt
integer x = 786
integer y = 960
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tue"
end type

type cbx_1 from checkbox within w_test_recur_dt
integer x = 786
integer y = 876
integer width = 210
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mon"
end type

type st_15 from statictext within w_test_recur_dt
integer x = 379
integer y = 864
integer width = 325
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "daily end"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_14 from statictext within w_test_recur_dt
integer x = 73
integer y = 864
integer width = 325
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "daily start"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_daily_end from editmask within w_test_recur_dt
integer x = 411
integer y = 944
integer width = 279
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = Center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type em_daily_start from editmask within w_test_recur_dt
integer x = 87
integer y = 940
integer width = 279
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = Center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type cb_init from commandbutton within w_test_recur_dt
integer x = 50
integer y = 1316
integer width = 402
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Init"
end type

event clicked;sle_schd_date.text = sle_start_date.text
sle_schd_time.text = sle_start_time.text
sle_now.text = string(RelativeTime(time(sle_start_time.text),-30*60))
sle_today.text = sle_start_date.text
end event

type cb_clear from commandbutton within w_test_recur_dt
integer x = 960
integer y = 1312
integer width = 402
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Next"
end type

event clicked;	sle_schd_date.text = sle_next_date.text
	sle_schd_time.text = sle_next_time.text
	sle_next_date.text = ''
	sle_next_time.text = ''
end event

type st_13 from statictext within w_test_recur_dt
integer x = 686
integer y = 1076
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Next Recur Time"
boolean focusrectangle = false
end type

type st_12 from statictext within w_test_recur_dt
integer x = 59
integer y = 1072
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Next Recur Date"
boolean focusrectangle = false
end type

type sle_schd_time from singlelineedit within w_test_recur_dt
integer x = 1243
integer y = 188
integer width = 361
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "09:15:00"
borderstyle borderstyle = stylelowered!
end type

type sle_schd_date from singlelineedit within w_test_recur_dt
integer x = 841
integer y = 188
integer width = 352
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "12/15/2003"
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_test_recur_dt
integer x = 1266
integer y = 100
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Time"
boolean focusrectangle = false
end type

type st_10 from statictext within w_test_recur_dt
integer x = 910
integer y = 100
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
boolean focusrectangle = false
end type

type st_9 from statictext within w_test_recur_dt
integer x = 983
integer y = 24
integer width = 457
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lst Sched Close"
boolean focusrectangle = false
end type

type st_8 from statictext within w_test_recur_dt
integer x = 809
integer y = 632
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recur By"
boolean focusrectangle = false
end type

type st_7 from statictext within w_test_recur_dt
integer x = 430
integer y = 636
integer width = 288
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Freq Num"
boolean focusrectangle = false
end type

type st_6 from statictext within w_test_recur_dt
integer x = 55
integer y = 632
integer width = 329
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Freq Code"
boolean focusrectangle = false
end type

type st_5 from statictext within w_test_recur_dt
integer x = 992
integer y = 400
integer width = 507
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Original Start Time"
boolean focusrectangle = false
end type

type st_4 from statictext within w_test_recur_dt
integer x = 503
integer y = 400
integer width = 434
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recur End Date"
boolean focusrectangle = false
end type

type st_3 from statictext within w_test_recur_dt
integer x = 18
integer y = 388
integer width = 457
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recur Start Date"
boolean focusrectangle = false
end type

type st_2 from statictext within w_test_recur_dt
integer x = 421
integer y = 96
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Currnt Time"
boolean focusrectangle = false
end type

type st_1 from statictext within w_test_recur_dt
integer x = 18
integer y = 92
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Current Date"
boolean focusrectangle = false
end type

type sle_start_date from singlelineedit within w_test_recur_dt
integer x = 9
integer y = 480
integer width = 416
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "12/01/2003"
borderstyle borderstyle = stylelowered!
end type

type cb_test from commandbutton within w_test_recur_dt
integer x = 498
integer y = 1316
integer width = 402
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Test"
boolean default = true
end type

event clicked;dd=0
nd=date(sle_next_date.text)
td=date(sle_today.text)
nt=time(sle_next_time.text)
now=time(sle_now.text)
fc=sle_freq_code.text
fn=integer(sle_freq_num.text)
rc=sle_recur_by.text
sd=date(sle_start_date.text)
ed=date(sle_end_date.text)
st=time(sle_start_time.text)
schd = date(sle_schd_date.text)
scht = time(sle_schd_time.text)
dst=time(em_daily_start.text)
det=time(em_daily_end.text)
wksel=''
if cbx_1.checked then
	wksel='Mon'
end if
if cbx_2.checked then
	wksel=wksel+'Tue'
end if
if cbx_3.checked then
	wksel=wksel+'Wed'
end if
if cbx_4.checked then
	wksel=wksel+'Thu'
end if
if cbx_5.checked then
	wksel=wksel+'Fri'
end if
if cbx_6.checked then
	wksel=wksel+'Sat'
end if
if cbx_7.checked then
	wksel=wksel+'Sun'
end if
if f_next_recurring_date_test(dd,nd,nt,schd,scht,td,now,fc,fn,rc,sd,ed,st,dst,det,wksel) = true then
	sle_next_date.text = string(nd)
	sle_next_time.text = string(nt)
else
	sle_next_date.text = ''
	sle_next_time.text = ''
end if
	
end event

type sle_freq_code from singlelineedit within w_test_recur_dt
integer x = 133
integer y = 712
integer width = 110
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "H"
borderstyle borderstyle = stylelowered!
end type

type sle_freq_num from singlelineedit within w_test_recur_dt
integer x = 475
integer y = 708
integer width = 169
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "12"
borderstyle borderstyle = stylelowered!
end type

type sle_end_date from singlelineedit within w_test_recur_dt
integer x = 535
integer y = 480
integer width = 402
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "12/31/2003"
borderstyle borderstyle = stylelowered!
end type

type sle_next_date from singlelineedit within w_test_recur_dt
integer x = 59
integer y = 1160
integer width = 389
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_today from singlelineedit within w_test_recur_dt
integer x = 9
integer y = 188
integer width = 402
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "12/10/2003"
borderstyle borderstyle = stylelowered!
end type

type sle_now from singlelineedit within w_test_recur_dt
integer x = 421
integer y = 188
integer width = 311
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "09:00:00"
borderstyle borderstyle = stylelowered!
end type

type sle_next_time from singlelineedit within w_test_recur_dt
integer x = 722
integer y = 1160
integer width = 347
integer height = 104
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_recur_by from singlelineedit within w_test_recur_dt
integer x = 846
integer y = 708
integer width = 123
integer height = 104
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "C"
borderstyle borderstyle = stylelowered!
end type

type sle_start_time from singlelineedit within w_test_recur_dt
integer x = 1065
integer y = 480
integer width = 338
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "09:00:00"
borderstyle borderstyle = stylelowered!
end type

