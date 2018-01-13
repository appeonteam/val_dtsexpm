$PBExportHeader$w_r_dndcalls.srw
forward
global type w_r_dndcalls from window
end type
type dw_2 from datawindow within w_r_dndcalls
end type
type cb_2 from commandbutton within w_r_dndcalls
end type
type cb_1 from commandbutton within w_r_dndcalls
end type
type dw_1 from datawindow within w_r_dndcalls
end type
type st_4 from statictext within w_r_dndcalls
end type
type st_3 from statictext within w_r_dndcalls
end type
type st_2 from statictext within w_r_dndcalls
end type
type uo_dept from u_multi_select_01 within w_r_dndcalls
end type
type uo_dt_to from u_ddcal within w_r_dndcalls
end type
type uo_dt_fr from u_ddcal within w_r_dndcalls
end type
end forward

global type w_r_dndcalls from window
string tag = "DND Call"
integer width = 3474
integer height = 2052
boolean titlebar = true
string title = "Guest Do-Not-Disturb Call Report"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "Report5!"
boolean center = true
event ue_printreport ( )
event ue_printscreen ( )
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
st_4 st_4
st_3 st_3
st_2 st_2
uo_dept uo_dept
uo_dt_to uo_dt_to
uo_dt_fr uo_dt_fr
end type
global w_r_dndcalls w_r_dndcalls

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

on w_r_dndcalls.create
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.uo_dept=create uo_dept
this.uo_dt_to=create uo_dt_to
this.uo_dt_fr=create uo_dt_fr
this.Control[]={this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.uo_dept,&
this.uo_dt_to,&
this.uo_dt_fr}
end on

on w_r_dndcalls.destroy
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.uo_dept)
destroy(this.uo_dt_to)
destroy(this.uo_dt_fr)
end on

event open;uo_dt_fr.sle_date.text = string(today(),cDateFormatStr)
uo_dt_to.sle_date.text = string(today(),cDateFormatStr)

uo_dept.cTable2Use		= "instdept"
uo_dept.cColumn2Retrieve= "dept"
//uo_dept.cColumn2AdHoc	= ""
//uo_dept.load_lb	= ""


dw_1.SetTransObject(sqlca)

// The Followings are to change date/time display format base on he_dts.ini specification
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"todate")
//f_mod_rpt_dw_dt_disp(dw_1,"call_indate")
//f_mod_rpt_dw_dt_disp(dw_2,"call_indate")
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

type dw_2 from datawindow within w_r_dndcalls
boolean visible = false
integer x = 201
integer y = 1520
integer width = 1184
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "r_dnd_calls_rpt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_r_dndcalls
integer x = 2437
integer y = 128
integer width = 343
integer height = 100
integer taborder = 30
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

type cb_1 from commandbutton within w_r_dndcalls
integer x = 1966
integer y = 128
integer width = 421
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Run Report"
boolean default = true
end type

event clicked;string frDate, toDate,deptSel,deptStr,new_nm
datetime frDateDt, toDateDt
// Date Opened from
IF f_str_d_to_d(uo_dt_fr.sle_date.Text) > Date('1990/01/01') Then
   frDate = string(f_str_d_to_d(uo_dt_fr.sle_date.text),'yyyy/mm/dd') 
End if

// Date Opened to
IF f_str_d_to_d(uo_dt_to.sle_date.Text) > Date("1990/01/01") Then
   toDate = string(f_str_d_to_d(uo_dt_to.sle_date.Text),'yyyy/mm/dd') 
End if

// Department
If Len( uo_dept.cCriteria ) > 0 Then
	deptStr = uo_dept.is_selected
else
	deptStr = 'ALL'
END IF   

frDateDt=datetime(date(frDate),time('00:00:00'))
toDateDt=datetime(date(toDate),time('23:59:59'))
//dw_1.modify('deptLabel.text = "Department Selected:"')
//dw_1.modify('deptName.text = "'+ deptStr+'"') 

//dw_2.modify('deptLabel.text = "Department Selected:"')
//dw_2.modify('deptName.text = "'+ deptStr+'"') 

dw_1.Retrieve(frDateDt,toDateDt,deptStr)
//dw_1.Retrieve(frDateDt,toDateDt)


end event

type dw_1 from datawindow within w_r_dndcalls
integer x = 41
integer y = 280
integer width = 3319
integer height = 1564
integer taborder = 50
string title = "none"
string dataobject = "r_dnd_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_r_dndcalls
integer x = 73
integer y = 68
integer width = 411
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Department"
boolean focusrectangle = false
end type

type st_3 from statictext within w_r_dndcalls
integer x = 1431
integer y = 68
integer width = 411
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
boolean focusrectangle = false
end type

type st_2 from statictext within w_r_dndcalls
integer x = 951
integer y = 68
integer width = 411
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
boolean focusrectangle = false
end type

type uo_dept from u_multi_select_01 within w_r_dndcalls
integer x = 59
integer y = 148
integer taborder = 40
end type

on uo_dept.destroy
call u_multi_select_01::destroy
end on

type uo_dt_to from u_ddcal within w_r_dndcalls
integer x = 1417
integer y = 140
integer width = 430
integer height = 104
integer taborder = 20
end type

on uo_dt_to.destroy
call u_ddcal::destroy
end on

type uo_dt_fr from u_ddcal within w_r_dndcalls
integer x = 937
integer y = 140
integer width = 425
integer height = 104
integer taborder = 20
end type

on uo_dt_fr.destroy
call u_ddcal::destroy
end on

