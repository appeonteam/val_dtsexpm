$PBExportHeader$w_quick_time.srw
forward
global type w_quick_time from window
end type
type cb_2 from commandbutton within w_quick_time
end type
type cb_1 from commandbutton within w_quick_time
end type
type st_2 from statictext within w_quick_time
end type
type st_1 from statictext within w_quick_time
end type
type em_shift_to from editmask within w_quick_time
end type
type em_shift_from from editmask within w_quick_time
end type
end forward

global type w_quick_time from window
integer width = 1125
integer height = 664
boolean titlebar = true
string title = "Quick Time Entry"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "CLOCK01A.ICO"
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
em_shift_to em_shift_to
em_shift_from em_shift_from
end type
global w_quick_time w_quick_time

type variables
string quickTime
boolean newQuickTime=false
end variables

on w_quick_time.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.em_shift_to=create em_shift_to
this.em_shift_from=create em_shift_from
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.em_shift_to,&
this.em_shift_from}
end on

on w_quick_time.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_shift_to)
destroy(this.em_shift_from)
end on

event open;select setting_value 
into	 :quickTime
from	 screensettings 
where  screen_name='QuickCall'
and	 setting_name='Shift';

if sqlca.sqlcode = 100 then
	newQuickTime = true
	quickTime = "18:00 07:00"
	MessageBox("Warning","QuickCall setting has never created. "+&
			"Please change the default shift time From & To using military time format!")
else
	if sqlca.sqlcode < 0 then
		MessageBox("Error","DB error:"+sqlca.sqlerrtext)
		close (this)
	end if
end if

string shift_from, shift_to

shift_from = mid(quickTime,1,5)
shift_to = mid(quickTime, 7,5)

em_shift_from.text = shift_from
em_shift_to.text = shift_to


		
end event

type cb_2 from commandbutton within w_quick_time
integer x = 576
integer y = 408
integer width = 402
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
end type

event clicked;string new_quick_time
int res

new_quick_time = trim(em_shift_from.text)+" " + trim(em_shift_to.text)

if new_quick_time <> quickTime then //no change
	Res = MessageBox("Warning","Shift time has changed. Are you sure?",&
			Question!,YesNo!, 2)
	if Res = 2 then
		return
	end if
end if

Close (parent)

end event

type cb_1 from commandbutton within w_quick_time
integer x = 105
integer y = 416
integer width = 393
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
boolean default = true
end type

event clicked;string new_quick_time

new_quick_time = trim(em_shift_from.text)+" "+trim(em_shift_to.text)

if newQuickTime then
	insert into screensettings (screen_name, setting_name, setting_value)
		values ('QuickCall','Shift',:new_quick_time);
	if sqlca.sqlcode <> 0 then
		MessageBox("DB Error","screensettings table insert error:"+sqlca.sqlerrtext)
		return
	end if
	close(parent)
	return
end if
		
if new_quick_time = quickTime then //no change
	close(parent)
	return
end if

update screensettings
set 	 setting_value = :new_quick_time,
		 lst_mod_ts = now()
where  screen_name='QuickCall'
and	 setting_name='Shift';

if sqlca.sqlcode < 0 then
	MessageBox("DB Error","Update Failed! Contact support!!!")
end if

close(parent)

end event

type st_2 from statictext within w_quick_time
integer x = 105
integer y = 112
integer width = 864
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enter Quick Call Shift Time"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_quick_time
integer x = 462
integer y = 260
integer width = 133
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "to"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_shift_to from editmask within w_quick_time
integer x = 622
integer y = 256
integer width = 306
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "08:00"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type em_shift_from from editmask within w_quick_time
integer x = 142
integer y = 256
integer width = 306
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "15:00"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

