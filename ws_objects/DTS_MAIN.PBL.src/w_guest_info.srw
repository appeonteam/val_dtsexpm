$PBExportHeader$w_guest_info.srw
forward
global type w_guest_info from window
end type
type em_arrive from editmask within w_guest_info
end type
type em_depart from editmask within w_guest_info
end type
type sle_room from singlelineedit within w_guest_info
end type
type st_6 from statictext within w_guest_info
end type
type sle_first_name from singlelineedit within w_guest_info
end type
type sle_last_name from singlelineedit within w_guest_info
end type
type st_5 from statictext within w_guest_info
end type
type st_4 from statictext within w_guest_info
end type
type st_3 from statictext within w_guest_info
end type
type st_2 from statictext within w_guest_info
end type
type cb_cancel from commandbutton within w_guest_info
end type
type cb_save from commandbutton within w_guest_info
end type
type sle_1 from singlelineedit within w_guest_info
end type
type st_1 from statictext within w_guest_info
end type
end forward

global type w_guest_info from window
integer width = 2016
integer height = 1224
boolean titlebar = true
string title = "Guest Arrival/Departure Information"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
string icon = "MISC28.ICO"
boolean center = true
em_arrive em_arrive
em_depart em_depart
sle_room sle_room
st_6 st_6
sle_first_name sle_first_name
sle_last_name sle_last_name
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
cb_cancel cb_cancel
cb_save cb_save
sle_1 sle_1
st_1 st_1
end type
global w_guest_info w_guest_info

type variables
s_guest parm
end variables

event open;string datefmt 
integer namelen
datefmt = ProfileString (cINIPath + cINIFile,&
							"Intl","DateFormat", "mm/dd/yy")
							
sle_1.text=string(today(),datefmt)

parm=Message.PowerObjectParm

namelen=len(trim(parm.guest))

sle_room.text = parm.room
em_arrive.SetMask(datemask!,datefmt)
em_arrive.text = string(today())
em_depart.SetMask(datemask!,datefmt)

if pos(parm.guest,',') > 0 and pos(parm.guest,',') < namelen then
	sle_last_name.text = mid(parm.guest,1,pos(parm.guest,',') - 1)
	sle_first_name.text = LeftTrim(mid(parm.guest,pos(parm.guest,',')+1))
else
	if pos(parm.guest,' ') > 0 and pos(parm.guest,' ') < namelen then
		sle_first_name.text = mid(parm.guest,1,pos(parm.guest,' ') - 1)
		sle_last_name.text = LeftTrim(mid(parm.guest,pos(parm.guest,' ')))		
	else
		sle_first_name.text = parm.guest
		sle_last_name.text = ''
	end if
end if




end event

on w_guest_info.create
this.em_arrive=create em_arrive
this.em_depart=create em_depart
this.sle_room=create sle_room
this.st_6=create st_6
this.sle_first_name=create sle_first_name
this.sle_last_name=create sle_last_name
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.sle_1=create sle_1
this.st_1=create st_1
this.Control[]={this.em_arrive,&
this.em_depart,&
this.sle_room,&
this.st_6,&
this.sle_first_name,&
this.sle_last_name,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cb_cancel,&
this.cb_save,&
this.sle_1,&
this.st_1}
end on

on w_guest_info.destroy
destroy(this.em_arrive)
destroy(this.em_depart)
destroy(this.sle_room)
destroy(this.st_6)
destroy(this.sle_first_name)
destroy(this.sle_last_name)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.sle_1)
destroy(this.st_1)
end on

type em_arrive from editmask within w_guest_info
integer x = 649
integer y = 712
integer width = 379
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217742
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_depart from editmask within w_guest_info
integer x = 1495
integer y = 724
integer width = 375
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217742
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type sle_room from singlelineedit within w_guest_info
integer x = 649
integer y = 280
integer width = 443
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217742
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_guest_info
integer x = 425
integer y = 284
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Room"
alignment alignment = right!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_first_name from singlelineedit within w_guest_info
integer x = 654
integer y = 548
integer width = 818
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217742
borderstyle borderstyle = stylelowered!
end type

type sle_last_name from singlelineedit within w_guest_info
integer x = 654
integer y = 416
integer width = 818
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217742
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_guest_info
integer x = 1056
integer y = 716
integer width = 430
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Departure Date"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_guest_info
integer x = 274
integer y = 716
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Arrival Date"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_guest_info
integer x = 123
integer y = 568
integer width = 503
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Guest First Name"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_guest_info
integer x = 123
integer y = 428
integer width = 512
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Guest Last Name"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_guest_info
integer x = 1061
integer y = 928
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_save from commandbutton within w_guest_info
integer x = 503
integer y = 932
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Save"
boolean default = true
end type

event clicked;if not (IsDate(em_depart.text)) then
	MessageBox("Error","Please enter a valid date!")
	return
end if

Insert into room_registry 
	(room_code, guest_lname, guest_fname, date_from, date_to)
values (	:sle_room.text, 
			:sle_last_name.text, 
			:sle_first_name.text,
			:em_arrive.text,
			:em_depart.text );
if sqlca.sqlcode <> 0 then
	MessageBox('DB Error','Storing Guest Info Error!')
end if

close(parent)
end event

type sle_1 from singlelineedit within w_guest_info
integer x = 736
integer y = 156
integer width = 443
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
boolean border = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_guest_info
integer x = 219
integer y = 56
integer width = 1458
integer height = 148
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Guest Arrival/Departure Information"
alignment alignment = center!
boolean focusrectangle = false
end type

