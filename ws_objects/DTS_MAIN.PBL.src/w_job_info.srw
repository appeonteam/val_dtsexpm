$PBExportHeader$w_job_info.srw
forward
global type w_job_info from window
end type
type p_1 from picture within w_job_info
end type
type em_end from editmask within w_job_info
end type
type em_start from editmask within w_job_info
end type
type st_4 from statictext within w_job_info
end type
type st_room_equip from statictext within w_job_info
end type
type st_5 from statictext within w_job_info
end type
type st_task from statictext within w_job_info
end type
type st_3 from statictext within w_job_info
end type
type st_2 from statictext within w_job_info
end type
type st_1 from statictext within w_job_info
end type
type sle_1 from singlelineedit within w_job_info
end type
type pb_1 from picturebutton within w_job_info
end type
type dp_end_date from datepicker within w_job_info
end type
type dp_start_date from datepicker within w_job_info
end type
end forward

global type w_job_info from window
integer width = 1550
integer height = 1668
boolean titlebar = true
string title = "Job Completion"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
em_end em_end
em_start em_start
st_4 st_4
st_room_equip st_room_equip
st_5 st_5
st_task st_task
st_3 st_3
st_2 st_2
st_1 st_1
sle_1 sle_1
pb_1 pb_1
dp_end_date dp_end_date
dp_start_date dp_start_date
end type
global w_job_info w_job_info

type variables
s_job iParm
time start_time
time end_time


end variables

on w_job_info.create
this.p_1=create p_1
this.em_end=create em_end
this.em_start=create em_start
this.st_4=create st_4
this.st_room_equip=create st_room_equip
this.st_5=create st_5
this.st_task=create st_task
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.pb_1=create pb_1
this.dp_end_date=create dp_end_date
this.dp_start_date=create dp_start_date
this.Control[]={this.p_1,&
this.em_end,&
this.em_start,&
this.st_4,&
this.st_room_equip,&
this.st_5,&
this.st_task,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.pb_1,&
this.dp_end_date,&
this.dp_start_date}
end on

on w_job_info.destroy
destroy(this.p_1)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.st_4)
destroy(this.st_room_equip)
destroy(this.st_5)
destroy(this.st_task)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.dp_end_date)
destroy(this.dp_start_date)
end on

event open;iParm = Message.PowerObjectParm

st_room_equip.text = iParm.room_equip

st_task.text = iParm.task+"/"+iParm.subtask

dp_start_date.SetValue(iParm.job_start)
start_time = time(iParm.job_start)
em_start.text = string(start_time)

dp_end_date.SetValue(iParm.job_end)
end_time = time(iParm.job_end)
em_end.text = string(end_time)

end event

event closequery;datetime start_dt, end_dt
date d1, d2, d3, d4
time t1, t2, t3, t4

if dp_start_date.GetValue(d1,t1) < 0 then 
	MessageBox("Error","Date/time format error!")
	return
end if
if dp_end_date.GetValue(d2, t2) < 0 then
	MessageBox("Error","Date/time format error!")
	return
end if	

start_time = time(em_start.text)
end_time = time(em_end.text)

start_dt = datetime(d1,start_time)
end_dt = datetime(d2,end_time)

//MessageBox("result","start dt: " + string(start_dt)+" end dt: " + string(end_dt))

if start_dt >= end_dt then
	MessageBox("Error","start date/time can't be greater or equal to end date/time!")
	return 1 //prevent from closing this popup
end if

insert into job_duration (call_number, job_type, job_start, job_end, job_comment)
			values (:iParm.call_number, :iParm.job_type, :start_dt, :end_dt,  :sle_1.text);

if sqlca.sqlcode <> 0 then
	egm_sqlerror(sqlca)
end if

end event

type p_1 from picture within w_job_info
integer x = 1271
integer y = 40
integer width = 192
integer height = 172
string picturename = "C:\Victor\eq\rapid_response_icon_48.bmp"
boolean focusrectangle = false
end type

type em_end from editmask within w_job_info
integer x = 837
integer y = 824
integer width = 475
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "[time]"
boolean spin = true
end type

type em_start from editmask within w_job_info
integer x = 837
integer y = 628
integer width = 475
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "[time]"
boolean spin = true
end type

type st_4 from statictext within w_job_info
integer x = 110
integer y = 84
integer width = 553
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 67108864
string text = "Room/Equipment"
boolean focusrectangle = false
end type

type st_room_equip from statictext within w_job_info
integer x = 192
integer y = 192
integer width = 974
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_job_info
integer x = 110
integer y = 304
integer width = 165
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 67108864
string text = "Task"
boolean focusrectangle = false
end type

type st_task from statictext within w_job_info
integer x = 192
integer y = 412
integer width = 1221
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_job_info
integer x = 201
integer y = 740
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 67108864
string text = "Job End"
boolean focusrectangle = false
end type

type st_2 from statictext within w_job_info
integer x = 206
integer y = 532
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 67108864
string text = "Job Start"
boolean focusrectangle = false
end type

type st_1 from statictext within w_job_info
integer x = 110
integer y = 960
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 67108864
string text = "Comments"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_job_info
integer x = 142
integer y = 1040
integer width = 1234
integer height = 340
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_job_info
integer x = 635
integer y = 1420
integer width = 302
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
boolean default = true
string picturename = "C:\HotelEXPERT\HE601_PM\BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;
closewithreturn(parent,iParm)
end event

type dp_end_date from datepicker within w_job_info
integer x = 206
integer y = 824
integer width = 512
integer height = 100
integer taborder = 30
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
string customformat = "m/dd/yyyy hh:mm"
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2007-05-14"), Time("22:01:32.000000"))
integer textsize = -9
integer fontweight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type dp_start_date from datepicker within w_job_info
integer x = 206
integer y = 624
integer width = 517
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
string customformat = "dtfshortdate!"
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2007-05-14"), Time("22:01:32.000000"))
integer textsize = -9
integer fontweight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

