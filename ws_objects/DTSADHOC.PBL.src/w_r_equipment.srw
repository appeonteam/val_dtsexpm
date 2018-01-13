$PBExportHeader$w_r_equipment.srw
forward
global type w_r_equipment from window
end type
type st_1 from statictext within w_r_equipment
end type
type cbx_scheduled from checkbox within w_r_equipment
end type
type cbx_pending from checkbox within w_r_equipment
end type
type cbx_closed from checkbox within w_r_equipment
end type
type dw_2 from datawindow within w_r_equipment
end type
type cb_2 from commandbutton within w_r_equipment
end type
type cb_1 from commandbutton within w_r_equipment
end type
type dw_1 from datawindow within w_r_equipment
end type
type st_4 from statictext within w_r_equipment
end type
type st_3 from statictext within w_r_equipment
end type
type st_2 from statictext within w_r_equipment
end type
type gb_1 from groupbox within w_r_equipment
end type
type gb_2 from groupbox within w_r_equipment
end type
type uo_equip from u_multi_select_01 within w_r_equipment
end type
type uo_dept from u_multi_select_01 within w_r_equipment
end type
type uo_dt_fr from u_ddcal within w_r_equipment
end type
type uo_dt_to from u_ddcal within w_r_equipment
end type
type gb_3 from groupbox within w_r_equipment
end type
end forward

global type w_r_equipment from window
string tag = "DND Call"
integer width = 4082
integer height = 2052
boolean titlebar = true
string title = "Scheduled Task By Equipment Report"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "Report5!"
boolean center = true
event ue_printreport ( )
event ue_printscreen ( )
st_1 st_1
cbx_scheduled cbx_scheduled
cbx_pending cbx_pending
cbx_closed cbx_closed
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
st_4 st_4
st_3 st_3
st_2 st_2
gb_1 gb_1
gb_2 gb_2
uo_equip uo_equip
uo_dept uo_dept
uo_dt_fr uo_dt_fr
uo_dt_to uo_dt_to
gb_3 gb_3
end type
global w_r_equipment w_r_equipment

event ue_printreport();if dw_1.Sharedata(dw_2) < 0 then
	MessageBox("Print Error","Sharedata error!")
	return
end if
dw_2.print()
dw_1.Sharedataoff()
end event

event ue_printscreen();long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)

end event

on w_r_equipment.create
this.st_1=create st_1
this.cbx_scheduled=create cbx_scheduled
this.cbx_pending=create cbx_pending
this.cbx_closed=create cbx_closed
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.uo_equip=create uo_equip
this.uo_dept=create uo_dept
this.uo_dt_fr=create uo_dt_fr
this.uo_dt_to=create uo_dt_to
this.gb_3=create gb_3
this.Control[]={this.st_1,&
this.cbx_scheduled,&
this.cbx_pending,&
this.cbx_closed,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.gb_1,&
this.gb_2,&
this.uo_equip,&
this.uo_dept,&
this.uo_dt_fr,&
this.uo_dt_to,&
this.gb_3}
end on

on w_r_equipment.destroy
destroy(this.st_1)
destroy(this.cbx_scheduled)
destroy(this.cbx_pending)
destroy(this.cbx_closed)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.uo_equip)
destroy(this.uo_dept)
destroy(this.uo_dt_fr)
destroy(this.uo_dt_to)
destroy(this.gb_3)
end on

event open;uo_dt_fr.sle_date.text = string(today(),cDateFormatStr)
uo_dt_to.sle_date.text = string(today(),cDateFormatStr)
uo_dt_to.bringtotop=true
uo_dt_fr.bringtotop=true
uo_dept.bringtotop=true
uo_equip.bringtotop=true

uo_equip.cTable2Use		= "area"
uo_equip.cColumn2Retrieve= "area_name"
//uo_equip.cColumn2AdHoc	= ""
uo_equip.load_lb	= "equipment"
uo_equip.cDbWhere = "room_type='E' order by area_name"

uo_dept.cTable2Use		= "instdept"
uo_dept.cColumn2Retrieve= "dept"
//uo_dept.cColumn2AdHoc	= ""
//uo_dept.load_lb	= "department"
uo_dept.cDbWhere = "1=1 order by dept"

dw_1.SetTransObject(sqlca)

// The Followings are to change date/time display format base on he_dts.ini specification
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"todate")
f_mod_rpt_dw_dt_disp(dw_1,"call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"call_indate")
end event

event resize;pointer cpOldPointer

cpOldPointer = SetPointer(HourGlass!)


this.setredraw(FALSE)
//dw_1.WIdth = this.WorkSpaceWidth() 
//dw_1.Height = this.WorkSpaceHeight() - (st_3.y + st_3.height + cb_exit.height + 100) 
    

dw_1.Resize(This.WorkSpaceWidth() -  (55), This.WorkSpaceHeight() -350)
this.setredraw(TRUE)
SetPointer( cpOldPointer )

end event

event activate;if Isvalid(w_main) then
	w_main.triggerevent("ue_menu_set")
end if
end event

event deactivate;if Isvalid(w_main) then
	w_main.triggerevent("ue_menu_set")
end if	
end event

type st_1 from statictext within w_r_equipment
integer x = 23
integer y = 232
integer width = 343
integer height = 48
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Department"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_scheduled from checkbox within w_r_equipment
integer x = 1961
integer y = 168
integer width = 366
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Scheduled"
boolean checked = true
end type

type cbx_pending from checkbox within w_r_equipment
integer x = 2341
integer y = 168
integer width = 302
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pending"
end type

type cbx_closed from checkbox within w_r_equipment
integer x = 2665
integer y = 168
integer width = 297
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Closed"
end type

type dw_2 from datawindow within w_r_equipment
boolean visible = false
integer x = 201
integer y = 1520
integer width = 1184
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "r_equipment_rpt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_r_equipment
integer x = 3534
integer y = 128
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_r_equipment
integer x = 3063
integer y = 128
integer width = 421
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Run Report"
boolean default = true
end type

event clicked;string frDate, toDate,equipSel,equipStr,new_nm, callType, deptSel, deptStr
datetime frDateDt, toDateDt
int rowRet
// Date Opened from
IF f_str_d_to_d(uo_dt_fr.sle_date.Text) > Date('1990/01/01') Then
   frDate = string(f_str_d_to_d(uo_dt_fr.sle_date.text),'yyyy/mm/dd') 
End if

// Date Opened to
IF f_str_d_to_d(uo_dt_to.sle_date.Text) > Date("1990/01/01") Then
   toDate = string(f_str_d_to_d(uo_dt_to.sle_date.Text),'yyyy/mm/dd') 
End if

// Equipment
If Len( uo_equip.cCriteria ) > 0 Then
	equipStr = uo_equip.is_selected
else
	equipStr = 'ALL'
END IF   

// Department
If Len( uo_dept.cCriteria ) > 0 Then
	deptStr = uo_dept.is_selected
else
	deptStr = 'ALL'
END IF   

frDateDt=datetime(date(frDate),time('00:00:00'))
toDateDt=datetime(date(toDate),time('23:59:59'))
//dw_1.modify('deptLabel.text = "Department Selected:"')
//dw_1.modify('deptName.text = "'+ equipStr+'"') 

//dw_2.modify('deptLabel.text = "Department Selected:"')
//dw_2.modify('deptName.text = "'+ equipStr+'"') 

if cbx_scheduled.checked = true then
	callType = '1'
else
	callType = '0'
end if
if cbx_pending.checked = true then
	callType = callType+'1'
else
	callType = callType+'0'
end if
if cbx_closed.checked = true then
	callType = callType+'1'
else
	callType = callType+'0'
end if
	

rowRet = dw_1.Retrieve(frDateDt,toDateDt,equipStr,callType,deptStr)
if rowRet = 0 then
	MessageBox("Warning","No Data for selected criteria!")
end if
//dw_1.Retrieve(frDateDt,toDateDt)


end event

type dw_1 from datawindow within w_r_equipment
integer y = 356
integer width = 3968
integer height = 1532
integer taborder = 90
string title = "none"
string dataobject = "r_equipment"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_r_equipment
integer x = 41
integer y = 120
integer width = 306
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Equipment"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_r_equipment
integer x = 1289
integer y = 228
integer width = 110
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "To"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_r_equipment
integer x = 1271
integer y = 108
integer width = 151
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "From"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_r_equipment
integer x = 1947
integer y = 72
integer width = 1042
integer height = 220
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217730
long backcolor = 67108864
string text = "Call Type"
end type

type gb_2 from groupbox within w_r_equipment
integer x = 1239
integer y = 32
integer width = 663
integer height = 300
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217730
long backcolor = 67108864
string text = "Schedule"
end type

type uo_equip from u_multi_select_01 within w_r_equipment
integer x = 375
integer y = 96
integer width = 786
integer taborder = 80
boolean bringtotop = true
end type

on uo_equip.destroy
call u_multi_select_01::destroy
end on

event size_closed;call super::size_closed;this.BringToTop=true
end event

type uo_dept from u_multi_select_01 within w_r_equipment
integer x = 379
integer y = 216
integer width = 786
integer taborder = 100
boolean bringtotop = true
end type

on uo_dept.destroy
call u_multi_select_01::destroy
end on

event size_closed;call super::size_closed;this.BringToTop=true
end event

type uo_dt_fr from u_ddcal within w_r_equipment
integer x = 1449
integer y = 84
integer width = 425
integer height = 104
integer taborder = 30
boolean bringtotop = true
end type

on uo_dt_fr.destroy
call u_ddcal::destroy
end on

event size_closed;call super::size_closed;this.BringToTop=true
end event

type uo_dt_to from u_ddcal within w_r_equipment
integer x = 1449
integer y = 208
integer width = 430
integer height = 104
integer taborder = 40
boolean bringtotop = true
end type

on uo_dt_to.destroy
call u_ddcal::destroy
end on

event size_closed;call super::size_closed;this.BringToTop=true
end event

type gb_3 from groupbox within w_r_equipment
integer x = 5
integer y = 32
integer width = 1211
integer height = 304
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217730
long backcolor = 67108864
string text = "Filter By"
end type

