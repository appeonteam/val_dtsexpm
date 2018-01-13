$PBExportHeader$w_call_back.srw
forward
global type w_call_back from window
end type
type p_2 from picture within w_call_back
end type
type pb_exit from picturebutton within w_call_back
end type
type pb_refresh from picturebutton within w_call_back
end type
type pb_filter from picturebutton within w_call_back
end type
type pb_find from picturebutton within w_call_back
end type
type pb_sort from picturebutton within w_call_back
end type
type pb_callback from picturebutton within w_call_back
end type
type p_1 from picture within w_call_back
end type
type pb_1 from picturebutton within w_call_back
end type
type dw_2 from datawindow within w_call_back
end type
type dw_1 from u_dw_maint within w_call_back
end type
type cb_find from commandbutton within w_call_back
end type
type cb_sort from commandbutton within w_call_back
end type
type cb_callback from commandbutton within w_call_back
end type
type cb_exit from commandbutton within w_call_back
end type
type cb_refresh from commandbutton within w_call_back
end type
type st_5 from statictext within w_call_back
end type
type ddlb_min from dropdownlistbox within w_call_back
end type
type st_4 from statictext within w_call_back
end type
type sle_now from singlelineedit within w_call_back
end type
type st_3 from statictext within w_call_back
end type
type sle_today from singlelineedit within w_call_back
end type
type st_2 from statictext within w_call_back
end type
type r_1 from rectangle within w_call_back
end type
end forward

global type w_call_back from window
string tag = "Guest Call Control"
integer width = 3730
integer height = 1644
boolean titlebar = true
string title = "Guest Call Back"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 134217728
string icon = "PHONE01.ICO"
boolean center = true
event ue_printscreen ( )
event ue_printreport ( )
p_2 p_2
pb_exit pb_exit
pb_refresh pb_refresh
pb_filter pb_filter
pb_find pb_find
pb_sort pb_sort
pb_callback pb_callback
p_1 p_1
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
cb_find cb_find
cb_sort cb_sort
cb_callback cb_callback
cb_exit cb_exit
cb_refresh cb_refresh
st_5 st_5
ddlb_min ddlb_min
st_4 st_4
sle_now sle_now
st_3 st_3
sle_today sle_today
st_2 st_2
r_1 r_1
end type
global w_call_back w_call_back

type variables
datetime frDt,toDt
string clickedColumn
integer refresh_freq, call_within_mins
string dept, dept_filter
end variables

forward prototypes
public function datetime wf_get_from_dt (date tod, time tot, integer intervalmin)
public function boolean wf_set_dept_filter ()
end prototypes

event ue_printscreen();long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

event ue_printreport();dw_1.Sharedata(dw_2)
dw_2.print()
dw_1.Sharedataoff()


end event

public function datetime wf_get_from_dt (date tod, time tot, integer intervalmin);date frD
time frT
int diff
frD = toD
if RelativeTime(toT,-(intervalMin*60)) = time('00:00:00') then
	frD = RelativeDate(toD,(-1))
	diff = SecondsAfter(time('00:00:00'),toT)
	frT=RelativeTime(time('23:59:59'),-(intervalMin*60 - SecondsAfter(time('00:00:00'),toT)-1))	
else
	frT=RelativeTime(toT,-(intervalMin*60))
end if

return datetime(frD,frT)
end function

public function boolean wf_set_dept_filter ();if dept= '' then
	return true
end if

int ii
ii = 1
do while pos(dept,',',ii) > 0 
	if len(trim(dept_filter)) = 0 then
		dept_filter = "closed_bydept = '" + mid(dept,ii,pos(dept,',',ii)-1)+"'"
	else
		dept_filter = dept_filter + " or closed_bydept = '" + &
			mid(dept,ii,pos(dept,',',ii) -ii)+"'"
	end if
	ii=pos(dept,',',ii)+1
loop
if len(trim(dept_filter)) = 0 then
	dept_filter = "closed_bydept = '" + dept + "'"
else
	dept_filter = dept_filter + " or closed_bydept = '" + mid(dept,ii)+"'"
end if
dw_1.SetFilter(dept_filter)
dw_1.Filter()

return true
end function

on w_call_back.create
this.p_2=create p_2
this.pb_exit=create pb_exit
this.pb_refresh=create pb_refresh
this.pb_filter=create pb_filter
this.pb_find=create pb_find
this.pb_sort=create pb_sort
this.pb_callback=create pb_callback
this.p_1=create p_1
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_find=create cb_find
this.cb_sort=create cb_sort
this.cb_callback=create cb_callback
this.cb_exit=create cb_exit
this.cb_refresh=create cb_refresh
this.st_5=create st_5
this.ddlb_min=create ddlb_min
this.st_4=create st_4
this.sle_now=create sle_now
this.st_3=create st_3
this.sle_today=create sle_today
this.st_2=create st_2
this.r_1=create r_1
this.Control[]={this.p_2,&
this.pb_exit,&
this.pb_refresh,&
this.pb_filter,&
this.pb_find,&
this.pb_sort,&
this.pb_callback,&
this.p_1,&
this.pb_1,&
this.dw_2,&
this.dw_1,&
this.cb_find,&
this.cb_sort,&
this.cb_callback,&
this.cb_exit,&
this.cb_refresh,&
this.st_5,&
this.ddlb_min,&
this.st_4,&
this.sle_now,&
this.st_3,&
this.sle_today,&
this.st_2,&
this.r_1}
end on

on w_call_back.destroy
destroy(this.p_2)
destroy(this.pb_exit)
destroy(this.pb_refresh)
destroy(this.pb_filter)
destroy(this.pb_find)
destroy(this.pb_sort)
destroy(this.pb_callback)
destroy(this.p_1)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_find)
destroy(this.cb_sort)
destroy(this.cb_callback)
destroy(this.cb_exit)
destroy(this.cb_refresh)
destroy(this.st_5)
destroy(this.ddlb_min)
destroy(this.st_4)
destroy(this.sle_now)
destroy(this.st_3)
destroy(this.sle_today)
destroy(this.st_2)
destroy(this.r_1)
end on

event open;sle_today.text = string(today(),cDateFormatStr)
//sle_today.text = string(date('01/29/2003'),cDateFormatStr)
sle_now.text = string(now())
//sle_now.text = '16:55:00'

toDt = datetime(f_str_d_to_d(sle_today.text),time(sle_now.text))

frDt = wf_get_from_dt(f_str_d_to_d(sle_today.text),time(sle_now.text), integer(ddlb_min.text))

//MessageBox("test",string(frDt))

dw_1.SetTransObject(sqlca)
dw_1.retrieve(frDt, toDt)

refresh_freq = ProfileInt(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
			"GuestCallBack", "ReadSeconds",150)

call_within_mins = ProfileInt(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
			"GuestCallBack", "CallWithinMins",15)

ddlb_min.text = string(call_within_mins)


dept = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,& 
			"GuestCallBack", "Dept","")

wf_set_dept_filter()
//if dept <> '' then
//	int ii
//	ii = 1
//	do while pos(dept,',',ii) > 0 
//		if len(trim(dept_filter)) = 0 then
//			dept_filter = "closed_bydept = '" + mid(dept,ii,pos(dept,',',ii)-1)+"'"
//		else
//			dept_filter = dept_filter + " or closed_bydept = '" + &
//				mid(dept,ii,pos(dept,',',ii) -ii)+"'"
//		end if
//		ii=pos(dept,',',ii)+1
//	loop
//	if len(trim(dept_filter)) = 0 then
//		dept_filter = "closed_bydept = '" + dept + "'"
//	else
//		dept_filter = dept_filter + " or closed_bydept = '" + mid(dept,ii)+"'"
//	end if
//	dw_1.SetFilter(dept_filter)
//	dw_1.Filter()
//end if

Timer(refresh_freq, this )

end event

event resize;pointer cpOldPointer

cpOldPointer = SetPointer(HourGlass!)


this.setredraw(FALSE)
   
//cb_find.y		= This.WorkSpaceHeight() - ( cb_find.height + 25 )
//cb_callback.y		= cb_find.y
//cb_sort.y     	= cb_find.y
//
//dw_1.Resize(This.WorkSpaceWidth() -  (25), &
//				This.WorkSpaceHeight() - (st_3.y + st_3.height + cb_exit.height + 220) )
pb_callback.y = This.WorkSpaceHeight() - ( pb_callback.height + 65 )
pb_sort.y = pb_callback.y
pb_find.y = pb_callback.y

pb_refresh.y = pb_callback.y
pb_filter.y = pb_callback.y
pb_exit.y = pb_callback.y

dw_1.Resize(This.WorkSpaceWidth() -  (100), &
				This.WorkSpaceHeight() - (p_1.height + 325) )


this.setredraw(TRUE)
SetPointer( cpOldPointer )
end event

event timer;Timer( 0, this )
//sle_now.text = string(now())
cb_refresh.TriggerEvent("Clicked")
Timer( refresh_freq, this )


end event

type p_2 from picture within w_call_back
integer x = 3401
integer y = 108
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "rapid_response_icon_32.jpg"
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_call_back
integer x = 2555
integer y = 1224
integer width = 347
integer height = 112
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Lucida Console"
string text = "E&xit"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;close(parent)
end event

type pb_refresh from picturebutton within w_call_back
integer x = 1797
integer y = 1224
integer width = 347
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Lucida Console"
string text = "&Refresh"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;//toDt = datetime(f_str_d_to_d(sle_today.text),time(sle_now.text))
toDt = datetime(f_str_d_to_d(sle_today.text),now())
frDt = wf_get_from_dt(f_str_d_to_d(sle_today.text),time(sle_now.text), integer(ddlb_min.text))
frDt = wf_get_from_dt(f_str_d_to_d(sle_today.text),time(sle_now.text), integer(ddlb_min.text))

//MessageBox("from",string(frDt))

dw_1.retrieve(frDt,toDt)

timer(0,parent)
//sle_now.text = string(now())
timer(refresh_freq,parent)
end event

type pb_filter from picturebutton within w_call_back
integer x = 2176
integer y = 1224
integer width = 347
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Lucida Console"
string text = "Fil&ter"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if

OpenWithParm (w_screen_settings, "callback",parent)

if Message.StringParm <> '' then
	string refreshMin, callWithinMins, deptCode
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'|') - 1
	refreshMin = Mid(Message.StringParm,1,endPos) 
	if refresh_freq <> integer(refreshMin) then
		refresh_freq = integer(refreshMin)
	end if
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	callWithinMins = Mid(Message.StringParm, startPos,endPos - startPos +1)
	if ddlb_min.text <> callWithinMins then
		ddlb_min.text = callWithinMins
		cb_refresh.TriggerEvent(clicked!)
	end if
	
	startPos = endPos + 2
	deptCode = Mid(Message.StringParm, startPos)	
	
	if dept <> deptCode then
		wf_set_dept_filter()
	end if
	
//	MessageBox("returned","refreshMin:"+refreshMin+ &
//		" callWithinMins:"+callWithinMins+&
//		" deptCode:"+deptCode)


//	if deptSelectionStr <> deptCode then
//		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
//		deptSelectionStr = deptCode
//		wf_mod_selections(deptSelectionStr)
//		dw_1.Retrieve()
//	end if

end if
end event

type pb_find from picturebutton within w_call_back
integer x = 1042
integer y = 1224
integer width = 347
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Lucida Console"
string text = "&Find"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;dw_1.triggerevent("ue_find")
dw_1.setfocus() 
end event

type pb_sort from picturebutton within w_call_back
integer x = 649
integer y = 1224
integer width = 347
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Lucida Console"
string text = "&Sort"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;dw_1.triggerevent("ue_sort")

Dw_1.setfocus()
end event

type pb_callback from picturebutton within w_call_back
integer x = 229
integer y = 1224
integer width = 375
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Lucida Console"
string text = "&Call Back"
string picturename = "BlankCB.bmp"
alignment htextalign = left!
vtextalign vtextalign = vcenter!
end type

event clicked;string callNumber, action, statCode, clickedColNum
callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
clickedColumn = dw_1.GetColumnName()
clickedColNum = string(f_find_col_num(clickedColumn),"00")
action = '0'
If IsValid( w_callback_upd ) Then
//	w_callback_upd.cb_add.TriggerEvent(clicked!)
	w_callback_upd.initDeptByOpen = true
	w_callback_upd.callback_num = callNumber
	w_callback_upd.TriggerEvent("ue_refresh")
	Open( w_callback_upd )
else
//	MessageBox("col num",string(f_find_col_num(clickedColumn),"00"))
	If Is_PasswordOK( Get_Event_Security( "CB" ) ) Then
		OpenSheetWithParm( w_callback_upd, action+clickedColNum+callNumber, "w_callback_upd", w_main, 0, Original! )
	else
		MessageBox("Failed","Opening Call Screen failed!")
	end if
end if

end event

type p_1 from picture within w_call_back
integer x = 46
integer y = 60
integer width = 1152
integer height = 212
boolean originalsize = true
string picturename = "HotelEXPERTCallBack.bmp"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_call_back
string tag = "Setting"
boolean visible = false
integer x = 1755
integer y = 1632
integer width = 379
integer height = 96
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "TOOLBAR1.BMP"
alignment htextalign = left!
string powertiptext = "Setting"
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if

OpenWithParm (w_screen_settings, "callback",parent)

if Message.StringParm <> '' then
	string refreshMin, callWithinMins, deptCode
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'|') - 1
	refreshMin = Mid(Message.StringParm,1,endPos) 
	if refresh_freq <> integer(refreshMin) then
		refresh_freq = integer(refreshMin)
	end if
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	callWithinMins = Mid(Message.StringParm, startPos,endPos - startPos +1)
	if ddlb_min.text <> callWithinMins then
		ddlb_min.text = callWithinMins
		cb_refresh.TriggerEvent(clicked!)
	end if
	
	startPos = endPos + 2
	deptCode = Mid(Message.StringParm, startPos)	
	
	if dept <> deptCode then
		wf_set_dept_filter()
	end if
	
//	MessageBox("returned","refreshMin:"+refreshMin+ &
//		" callWithinMins:"+callWithinMins+&
//		" deptCode:"+deptCode)


//	if deptSelectionStr <> deptCode then
//		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
//		deptSelectionStr = deptCode
//		wf_mod_selections(deptSelectionStr)
//		dw_1.Retrieve()
//	end if

end if
end event

type dw_2 from datawindow within w_call_back
boolean visible = false
integer x = 87
integer y = 1848
integer width = 686
integer height = 400
integer taborder = 80
string title = "none"
string dataobject = "d_call_back_rpt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_maint within w_call_back
string tag = "Guest Call Back"
integer x = 50
integer y = 288
integer width = 3095
integer height = 848
integer taborder = 20
string title = "Guest Call Back"
string dataobject = "d_call_back"
borderstyle borderstyle = styleraised!
end type

event constructor;call super::constructor;isa_findcols[1] = "room"
isa_findcols[2] = "guest"
isa_findcols[3] = "problem"
isa_findcols[4] = "subproblem"
isa_findcols[5] = "duration"
isa_findcols[6] = "problem_definition"
isa_findcols[7] = "closed_bydept"
isa_findcols[8] = "repairman"
isa_findcols[9] = "closed_by"
isa_findcols[10] = "call_number"


isa_finddesc[1] = "Room"
isa_finddesc[2] = "Guest"
isa_finddesc[3] = "Task"
isa_finddesc[4] = "Subtask"
isa_finddesc[5] = "Duration"
isa_finddesc[6] = "Task Definition"
isa_finddesc[7] = "Dept"
isa_finddesc[8] = "Handled By"
isa_finddesc[9] = "Closed By"
isa_finddesc[10] = "Call Number"

// ***** Set the columns and descriptions to sort on.
isa_sortcols[1]  = "room"
isa_sortcols[2] = "guest"
isa_sortcols[3]  = "problem"
isa_sortcols[4]  = "subproblem"
isa_sortcols[5] = "duration"
isa_sortcols[6]  = "problem_definition"
isa_sortcols[7]  = "closed_bydept"
isa_sortcols[8]  = "repairman"
isa_sortcols[9] = "closed_by"
isa_sortcols[10]  = "call_number"

isa_sortdesc[1] = "Room"
isa_sortdesc[2] = "Guest"
isa_sortdesc[3] = "Task"
isa_sortdesc[4] = "Subtask"
isa_sortdesc[5] = "Duration"
isa_sortdesc[6] = "Task Definition"
isa_sortdesc[7] = "Dept."
isa_sortdesc[8] = "Handled By"
isa_sortdesc[9] = "Closed By"
isa_sortdesc[10] = "Call Number"

// ***** for seeding
ii_seedtype = 1 // 1 = values, 0 = foreign keys
ii_seedmode = 1 // 0 = no, 1 = after insert, 2 = before save

isa_primkeycols[1] = "call_number"
isa_primkeyvals[1] = " "

isa_primkeycols[2] = "gust"
isa_primkeyvals[2] = " "

// Set the column to get focus after insert.
is_firstcol = "room"

end event

event clicked;call super::clicked;if row > 0 then
	cb_callback.Enabled = true
else
	cb_callback.Enabled = false
end if
end event

event doubleclicked;call super::doubleclicked;if this.rowcount() = 0 then
	return
end if
cb_callback.TriggerEvent(clicked!)
end event

type cb_find from commandbutton within w_call_back
boolean visible = false
integer x = 1239
integer y = 1652
integer width = 357
integer height = 96
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Find"
end type

event clicked;dw_1.triggerevent("ue_find")
dw_1.setfocus() 
end event

type cb_sort from commandbutton within w_call_back
boolean visible = false
integer x = 805
integer y = 1632
integer width = 357
integer height = 96
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;dw_1.triggerevent("ue_sort")

Dw_1.setfocus()

end event

type cb_callback from commandbutton within w_call_back
boolean visible = false
integer x = 361
integer y = 1656
integer width = 357
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Call Back"
end type

event clicked;string callNumber, action, statCode, clickedColNum
callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
clickedColumn = dw_1.GetColumnName()
clickedColNum = string(f_find_col_num(clickedColumn),"00")
action = '0'
If IsValid( w_callback_upd ) Then
//	w_callback_upd.cb_add.TriggerEvent(clicked!)
	w_callback_upd.initDeptByOpen = true
	w_callback_upd.callback_num = callNumber
	w_callback_upd.TriggerEvent("ue_refresh")
	Open( w_callback_upd )
else
//	MessageBox("col num",string(f_find_col_num(clickedColumn),"00"))
	If Is_PasswordOK( Get_Event_Security( "CB" ) ) Then
		OpenSheetWithParm( w_callback_upd, action+clickedColNum+callNumber, "w_callback_upd", w_main, 0, Original! )
	else
		MessageBox("Failed","Opening Call Screen failed!")
	end if
end if

end event

type cb_exit from commandbutton within w_call_back
boolean visible = false
integer x = 2702
integer y = 1580
integer width = 338
integer height = 100
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xit"
end type

event clicked;close(parent)
end event

type cb_refresh from commandbutton within w_call_back
boolean visible = false
integer x = 2217
integer y = 1628
integer width = 338
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Refresh"
boolean default = true
end type

event clicked;//toDt = datetime(f_str_d_to_d(sle_today.text),time(sle_now.text))
toDt = datetime(f_str_d_to_d(sle_today.text),now())
frDt = wf_get_from_dt(f_str_d_to_d(sle_today.text),time(sle_now.text), integer(ddlb_min.text))
frDt = wf_get_from_dt(f_str_d_to_d(sle_today.text),time(sle_now.text), integer(ddlb_min.text))

//MessageBox("from",string(frDt))

dw_1.retrieve(frDt,toDt)

timer(0,parent)
//sle_now.text = string(now())
timer(refresh_freq,parent)
end event

type st_5 from statictext within w_call_back
boolean visible = false
integer x = 846
integer y = 284
integer width = 251
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Minutes"
boolean focusrectangle = false
end type

type ddlb_min from dropdownlistbox within w_call_back
string tag = "Select minute"
boolean visible = false
integer x = 622
integer y = 268
integer width = 215
integer height = 348
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "15"
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"5","10","15","20","30","45","60","120","360"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;cb_refresh.TriggerEvent(clicked!)
end event

type st_4 from statictext within w_call_back
boolean visible = false
integer x = 133
integer y = 284
integer width = 494
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calls Closed Within"
boolean focusrectangle = false
end type

type sle_now from singlelineedit within w_call_back
integer x = 2706
integer y = 176
integer width = 288
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean underline = true
long textcolor = 27354725
long backcolor = 134217728
string text = "11:58:00"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_call_back
integer x = 2304
integer y = 176
integer width = 407
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 134217728
string text = "Today~'s Time"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type sle_today from singlelineedit within w_call_back
integer x = 2706
integer y = 92
integer width = 402
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean underline = true
long textcolor = 27354725
long backcolor = 134217728
string text = "11/22/2003"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_call_back
integer x = 2304
integer y = 92
integer width = 407
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 134217728
string text = "Today~'s Date"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type r_1 from rectangle within w_call_back
long linecolor = 134217745
integer linethickness = 4
long fillcolor = 134217728
integer x = 2281
integer y = 72
integer width = 832
integer height = 184
end type

