$PBExportHeader$w_r_fail_benchmark.srw
forward
global type w_r_fail_benchmark from window
end type
type p_1 from picture within w_r_fail_benchmark
end type
type dw_2 from datawindow within w_r_fail_benchmark
end type
type cb_2 from commandbutton within w_r_fail_benchmark
end type
type cb_1 from commandbutton within w_r_fail_benchmark
end type
type dw_1 from datawindow within w_r_fail_benchmark
end type
type st_7 from statictext within w_r_fail_benchmark
end type
type st_6 from statictext within w_r_fail_benchmark
end type
type st_5 from statictext within w_r_fail_benchmark
end type
type st_4 from statictext within w_r_fail_benchmark
end type
type st_3 from statictext within w_r_fail_benchmark
end type
type st_2 from statictext within w_r_fail_benchmark
end type
type st_1 from statictext within w_r_fail_benchmark
end type
type uo_repairman from u_multi_select_01 within w_r_fail_benchmark
end type
type uo_dept from u_multi_select_01 within w_r_fail_benchmark
end type
type uo_subtask from u_multi_select_01 within w_r_fail_benchmark
end type
type uo_task from u_multi_select_01 within w_r_fail_benchmark
end type
type uo_dt_to from u_ddcal within w_r_fail_benchmark
end type
type uo_dt_fr from u_ddcal within w_r_fail_benchmark
end type
type ddlb_cat from dropdownlistbox within w_r_fail_benchmark
end type
end forward

global type w_r_fail_benchmark from window
string tag = "Failed Benchmark"
integer width = 3474
integer height = 2016
boolean titlebar = true
string title = "Failed Benchmark"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "Report5!"
boolean center = true
event ue_printreport ( )
event ue_printscreen ( )
p_1 p_1
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
uo_repairman uo_repairman
uo_dept uo_dept
uo_subtask uo_subtask
uo_task uo_task
uo_dt_to uo_dt_to
uo_dt_fr uo_dt_fr
ddlb_cat ddlb_cat
end type
global w_r_fail_benchmark w_r_fail_benchmark

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

on w_r_fail_benchmark.create
this.p_1=create p_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.uo_repairman=create uo_repairman
this.uo_dept=create uo_dept
this.uo_subtask=create uo_subtask
this.uo_task=create uo_task
this.uo_dt_to=create uo_dt_to
this.uo_dt_fr=create uo_dt_fr
this.ddlb_cat=create ddlb_cat
this.Control[]={this.p_1,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.uo_repairman,&
this.uo_dept,&
this.uo_subtask,&
this.uo_task,&
this.uo_dt_to,&
this.uo_dt_fr,&
this.ddlb_cat}
end on

on w_r_fail_benchmark.destroy
destroy(this.p_1)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.uo_repairman)
destroy(this.uo_dept)
destroy(this.uo_subtask)
destroy(this.uo_task)
destroy(this.uo_dt_to)
destroy(this.uo_dt_fr)
destroy(this.ddlb_cat)
end on

event open;ddlb_cat.text = 'GST'
uo_dt_fr.sle_date.text = string(today(),cDateFormatStr)
uo_dt_to.sle_date.text = string(today(),cDateFormatStr)

uo_dept.cTable2Use		= "instdept"
uo_dept.cColumn2Retrieve= "dept"
//uo_dept.cColumn2AdHoc	= ""
//uo_dept.load_lb	= ""

uo_task.cTable2Use			= "problem"
uo_task.cColumn2Retrieve	= "problem_desc"

uo_subtask.cTable2Use		 = "subproblem"
uo_subtask.cColumn2Retrieve = "subproblem_desc"

uo_repairman.cTable2Use			= "instemp"
uo_repairman.cColumn2Retrieve	= "employee"


dw_1.SetTransObject(sqlca)

// The Followings are to change date/time display format base on he_dts.ini specification
f_mod_rpt_dw_d_disp(dw_2,"rpttoday")
f_mod_rpt_dw_dt_disp(dw_1,"timer_start")
f_mod_rpt_dw_dt_disp(dw_2,"timer_start")
f_mod_rpt_dw_dt_disp(dw_1,"call_indate")
f_mod_rpt_dw_dt_disp(dw_2,"call_indate")
end event

event resize;pointer cpOldPointer

cpOldPointer = SetPointer(HourGlass!)


this.setredraw(FALSE)
//dw_1.WIdth = this.WorkSpaceWidth() 
//dw_1.Height = this.WorkSpaceHeight() - (st_3.y + st_3.height + cb_exit.height + 100) 
    

dw_1.Resize(This.WorkSpaceWidth() -  (55), This.WorkSpaceHeight() -570)
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

type p_1 from picture within w_r_fail_benchmark
integer x = 2912
integer y = 104
integer width = 174
integer height = 148
string picturename = "rapid_response_icon_32.jpg"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_r_fail_benchmark
boolean visible = false
integer x = 315
integer y = 1480
integer width = 1449
integer height = 280
integer taborder = 60
string title = "none"
string dataobject = "d_fail_bm_rpt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_r_fail_benchmark
integer x = 1943
integer y = 132
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
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_r_fail_benchmark
integer x = 1518
integer y = 132
integer width = 366
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Run Report"
end type

event clicked;string origSql, sql1, sql2, sql3, sqlWhere, newSql,err
string cNewDateStr, cAdHoc, new_nm, callcat, deptStr, deptSel, empStr, empSel
string taskStr, taskSel, subtaskStr, subtaskSel, overDueFilter
integer whereStart, whereEnd, nm_start, strStart, strLen, strEnd

deptStr=''
empStr=''
taskStr=''
subtaskStr=''
overDueFilter = 'datediff(minute,timer_start,call_outdate) >= 0 and '


origSql = dw_1.Describe("datawindow.table.select")
whereStart = pos(origSql,"WHERE")
whereEnd = pos(origSql,"ORDER")
sql1 = mid(origSql,1, whereStart - 1 )
sql2 = mid(origSql,whereStart, whereEnd - whereStart - 1)
sql3 = mid(origSql,whereEnd)

if ddlb_cat.text = 'GST' then
	sqlWhere = ' WHERE ' + overDueFilter + ' ~~"closedcalls~~".~~"caller_category~~" = ~'' + ddlb_cat.text+ '~' '
else
	sqlWhere = ' WHERE ' + overDueFilter + ' ~~"closedcalls~~".~~"caller_category~~" <> ~'' + 'GST' + '~' '
end if
// Date Opened from
IF f_str_d_to_d(uo_dt_fr.sle_date.Text) > Date('1990/01/01') Then
   cNewDateStr = string(f_str_d_to_d(uo_dt_fr.sle_date.text),'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_indate~~" >= ' + "Date('"+cNewDateStr+"')"
End if

// Date Opened to
IF f_str_d_to_d(uo_dt_to.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(f_str_d_to_d(uo_dt_to.sle_date.Text),'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_indate~~" <= ' + "Datetime('"+cNewDateStr+" 23:59:59')"
End if

// Department
If Len( uo_dept.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"closed_bydept~~"'
	deptSel =  uo_dept.cCriteria 
	nm_start = pos(deptSel,'=')
	deptStr = mid(deptSel,1,nm_start - 1) 
	strStart = 1
	do while nm_start > 0
		strEnd = pos(deptSel,'=',nm_start + 1 )
		if strEnd > 0 then
			strLen = strEnd - nm_start 
		else
			strLen = len(deptSel) - nm_start + 1
		end if	
		deptStr = deptStr+ new_nm + mid(deptSel, nm_start, strLen)
		strStart = nm_start
		nm_start = pos(deptSel,'=',strEnd - 1)
	loop
END IF   

// Handled by 
If Len( uo_repairman.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"repairman~~"'
	empSel =  uo_repairman.cCriteria 
	nm_start = pos(empSel,'=')
	empStr = mid(empSel,1,nm_start - 1) 
	strStart = 1
	do while nm_start > 0
		strEnd = pos(empSel,'=',nm_start + 1 )
		if strEnd > 0 then
			strLen = strEnd - nm_start 
		else
			strLen = len(empSel) - nm_start + 1
		end if	
		empStr = empStr+ new_nm + mid(empSel, nm_start, strLen)
		strStart = nm_start
		nm_start = pos(empSel,'=',strEnd - 1)
	loop
END IF   

// Task
If Len( uo_task.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"problem~~"'
	taskSel =  uo_task.cCriteria 
	nm_start = pos(taskSel,'=')
	taskStr = mid(taskSel,1,nm_start - 1) 
	strStart = 1
	do while nm_start > 0
		strEnd = pos(taskSel,'=',nm_start + 1 )
		if strEnd > 0 then
			strLen = strEnd - nm_start 
		else
			strLen = len(taskSel) - nm_start + 1
		end if	
		taskStr = taskStr+ new_nm + mid(taskSel, nm_start, strLen)
		strStart = nm_start
		nm_start = pos(taskSel,'=',strEnd - 1)
	loop	
end if


// Subtask 
If Len( uo_subtask.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"subproblem~~"'
	subtaskSel =  uo_subtask.cCriteria 
	nm_start = pos(subtaskSel,'=')
	subtaskStr = mid(subtaskSel,1,nm_start - 1) 
	strStart = 1
	do while nm_start > 0
		strEnd = pos(subtaskSel,'=',nm_start + 1 )
		if strEnd > 0 then
			strLen = strEnd - nm_start 
		else
			strLen = len(subtaskSel) - nm_start + 1
		end if	
		subtaskStr = subtaskStr+ new_nm + mid(subtaskSel, nm_start, strLen)
		strStart = nm_start
		nm_start = pos(subtaskSel,'=',strEnd - 1)
	loop	
end if

newSql = sql1 + sqlWhere + cAdHoc + deptStr+' '+ empStr +' '+taskStr +' '+subtaskStr +' '+ sql3
newSql = "datawindow.table.select=~""+newsql+"~""
err = dw_1.modify(newSql) 
if err <> "" then
	MessageBox("dw mod error",err)
end if





dw_1.Retrieve()
end event

type dw_1 from datawindow within w_r_fail_benchmark
integer x = 41
integer y = 560
integer width = 3319
integer height = 1008
integer taborder = 50
string title = "none"
string dataobject = "d_fail_bm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_r_fail_benchmark
integer x = 2574
integer y = 276
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
string text = "Subtask"
boolean focusrectangle = false
end type

type st_6 from statictext within w_r_fail_benchmark
integer x = 1733
integer y = 280
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
string text = "Task"
boolean focusrectangle = false
end type

type st_5 from statictext within w_r_fail_benchmark
integer x = 905
integer y = 284
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
string text = "Handled By"
boolean focusrectangle = false
end type

type st_4 from statictext within w_r_fail_benchmark
integer x = 55
integer y = 288
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

type st_3 from statictext within w_r_fail_benchmark
integer x = 905
integer y = 76
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
string text = "Open Date To"
boolean focusrectangle = false
end type

type st_2 from statictext within w_r_fail_benchmark
integer x = 425
integer y = 76
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
string text = "Open Date From"
boolean focusrectangle = false
end type

type st_1 from statictext within w_r_fail_benchmark
integer x = 69
integer y = 76
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Category"
boolean focusrectangle = false
end type

type uo_repairman from u_multi_select_01 within w_r_fail_benchmark
integer x = 891
integer y = 364
integer taborder = 40
end type

on uo_repairman.destroy
call u_multi_select_01::destroy
end on

type uo_dept from u_multi_select_01 within w_r_fail_benchmark
integer x = 41
integer y = 364
integer taborder = 40
end type

on uo_dept.destroy
call u_multi_select_01::destroy
end on

type uo_subtask from u_multi_select_01 within w_r_fail_benchmark
integer x = 2565
integer y = 356
integer taborder = 40
end type

on uo_subtask.destroy
call u_multi_select_01::destroy
end on

type uo_task from u_multi_select_01 within w_r_fail_benchmark
integer x = 1728
integer y = 360
integer taborder = 30
end type

on uo_task.destroy
call u_multi_select_01::destroy
end on

type uo_dt_to from u_ddcal within w_r_fail_benchmark
integer x = 891
integer y = 144
integer width = 430
integer height = 104
integer taborder = 20
end type

on uo_dt_to.destroy
call u_ddcal::destroy
end on

type uo_dt_fr from u_ddcal within w_r_fail_benchmark
integer x = 411
integer y = 144
integer width = 425
integer height = 104
integer taborder = 20
end type

on uo_dt_fr.destroy
call u_ddcal::destroy
end on

type ddlb_cat from dropdownlistbox within w_r_fail_benchmark
integer x = 59
integer y = 144
integer width = 270
integer height = 240
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
string item[] = {"GST","EMP"}
borderstyle borderstyle = stylelowered!
end type

