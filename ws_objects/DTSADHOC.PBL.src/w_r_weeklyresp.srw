$PBExportHeader$w_r_weeklyresp.srw
forward
global type w_r_weeklyresp from window
end type
type p_1 from picture within w_r_weeklyresp
end type
type ddlb_caller from dropdownlistbox within w_r_weeklyresp
end type
type st_3 from statictext within w_r_weeklyresp
end type
type st_2 from statictext within w_r_weeklyresp
end type
type uo_dept from u_multi_select_01 within w_r_weeklyresp
end type
type cb_2 from commandbutton within w_r_weeklyresp
end type
type cb_1 from commandbutton within w_r_weeklyresp
end type
type st_1 from statictext within w_r_weeklyresp
end type
type dw_1 from datawindow within w_r_weeklyresp
end type
type uo_date from u_ddcal within w_r_weeklyresp
end type
end forward

global type w_r_weeklyresp from window
string tag = "(responder) Ready"
integer x = 1056
integer y = 484
integer width = 3717
integer height = 2464
boolean titlebar = true
string title = "Department Weekly Response Rate Trend"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
string icon = "Report.ico"
event ue_printreport ( )
event ue_printscreen ( )
p_1 p_1
ddlb_caller ddlb_caller
st_3 st_3
st_2 st_2
uo_dept uo_dept
cb_2 cb_2
cb_1 cb_1
st_1 st_1
dw_1 dw_1
uo_date uo_date
end type
global w_r_weeklyresp w_r_weeklyresp

type variables
string cDeptWeeklyRespDept
string cDeptWeeklyRespCaller
String selDeptStr, selCallerStr
string deptStr, caller
end variables

event ue_printreport;dw_1.print()
end event

event ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

event open;uo_dept.cTable2Use		= "instdept"
uo_dept.cColumn2Retrieve= "dept"
uo_dept.cColumn2AdHoc	= ""
uo_dept.load_lb	= ""

cDeptWeeklyRespDept = ProfileString(cINIPath + cINIFile, "Department Response Rate", & 
			"DeptWeeklyRespDept","")
cDeptWeeklyRespCaller = ProfileString(cINIPath + cINIFile, "Department Response Rate", & 
			"DeptWeeklyRespCaller","")

deptStr = cDeptWeeklyRespDept

if upper(cDeptWeeklyRespDept) <> "[ALL]" then
	uo_dept.uo_ddlb_1.text = '[Selected]'
	uo_dept.uo_ddlb_1.TriggerEvent("SelectionChanged")
	int ii,jj,kk,r1,r2,r3
	r3=uo_dept.uo_lb_1.TotalItems()
	string dispStr
	ii = len(cDeptWeeklyRespDept)
	jj = 1
	do while jj <= ii
		kk = pos(cDeptWeeklyRespDept,',',jj)
		if kk = 0 then
			dispStr = trim(mid(cDeptWeeklyRespDept,jj))
			jj = ii + 1
		else
			dispStr = trim(mid(cDeptWeeklyRespDept,jj,kk - jj))
			jj = kk + 1
		end if	
		r1 = uo_dept.uo_lb_1.FindItem(dispStr,0)
		r2 = uo_dept.uo_lb_1.SetState(r1,TRUE)
	loop
	uo_dept.uo_ddlb_1.text = '[Selected]'
	uo_dept.uo_lb_1.TriggerEvent("losefocus")
end if

caller = cDeptWeeklyRespCaller
ddlb_caller.text = caller

//integer ret
//ret = pop_lb_from_db (uo_dept.cColumn2Retrieve, uo_dept.cTable2Use, uo_dept.uo_lb_1 )
//if ret=0 then
//	uo_dept.ib_loaded = TRUE
//	messagebox("loaded","uo_dept is loaded!")
//end if
//ddlb_caller.text = '[All]'

uo_date.sle_date.text = string(today(),cDateFormatStr)
dw_1.SetTransObject(sqlca)
f_mod_rpt_dw_ld_disp(dw_1,'rpttoday')



end event

on w_r_weeklyresp.create
this.p_1=create p_1
this.ddlb_caller=create ddlb_caller
this.st_3=create st_3
this.st_2=create st_2
this.uo_dept=create uo_dept
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.uo_date=create uo_date
this.Control[]={this.p_1,&
this.ddlb_caller,&
this.st_3,&
this.st_2,&
this.uo_dept,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.dw_1,&
this.uo_date}
end on

on w_r_weeklyresp.destroy
destroy(this.p_1)
destroy(this.ddlb_caller)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.uo_dept)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.uo_date)
end on

event close;close(this)
end event

event activate;if Isvalid(w_main) then
	w_main.triggerevent("ue_menu_set")
end if	
end event

event deactivate;if Isvalid(w_main) then
	w_main.triggerevent("ue_menu_set")
end if	
end event

event resize;pointer cpOldPointer

cpOldPointer = SetPointer(HourGlass!)


this.setredraw(FALSE)
//dw_1.WIdth = this.WorkSpaceWidth() 
//dw_1.Height = this.WorkSpaceHeight() - (st_3.y + st_3.height + cb_exit.height + 100) 
    

dw_1.Resize(This.WorkSpaceWidth() -  (55), This.WorkSpaceHeight() -300)
this.setredraw(TRUE)
SetPointer( cpOldPointer )



end event

event mousemove;SetMicroHelp( this.tag )
end event

type p_1 from picture within w_r_weeklyresp
integer x = 3333
integer y = 64
integer width = 174
integer height = 152
string picturename = "rapid_response_icon_32.jpg"
boolean focusrectangle = false
end type

type ddlb_caller from dropdownlistbox within w_r_weeklyresp
event mousemove pbm_mousemove
string tag = "click here to select caller category!"
integer x = 1586
integer y = 124
integer width = 402
integer height = 312
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"[All]","GST","Employee"}
borderstyle borderstyle = stylelowered!
end type

event mousemove;SetMicroHelp( this.tag )
end event

type st_3 from statictext within w_r_weeklyresp
integer x = 1563
integer y = 48
integer width = 416
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select Caller"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_r_weeklyresp
integer x = 699
integer y = 48
integer width = 745
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select Department"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_dept from u_multi_select_01 within w_r_weeklyresp
string tag = "click here to open department selection!"
integer x = 672
integer y = 120
integer taborder = 20
end type

on uo_dept.destroy
call u_multi_select_01::destroy
end on

type cb_2 from commandbutton within w_r_weeklyresp
event mousemove pbm_mousemove
string tag = "Click here to close this window"
integer x = 2592
integer y = 112
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
end type

event mousemove;SetMicroHelp( this.tag )
end event

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_r_weeklyresp
event mousemove pbm_mousemove
string tag = "Click here to run report"
integer x = 2162
integer y = 112
integer width = 366
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Run Report"
end type

event mousemove;SetMicroHelp( this.tag )
end event

event clicked;uo_dept.uf_select_items()
date inDate
integer i
if uo_dept.uf_return_ddlb_text() = '[All]' then
//	MessageBox("uo_lb_1",uo_dept.uo_lb_1.text(1))
	deptStr = '[All]'
//	for i = 1 to uo_dept.uo_lb_1.TotalItems()
//		if i = 1 then
//			deptStr = uo_dept.uo_lb_1.text(i)
//		else
//			deptStr = deptStr + "," + uo_dept.uo_lb_1.text(i)
//		end if
//	next
else
	deptStr=uo_dept.is_selected
end if
caller = ddlb_caller.text
//MessageBox('deptStr',deptStr)

if date(uo_date.sle_date.text) = today() then
	inDate = RelativeDate(f_str_d_to_d(uo_date.sle_date.text), -1)
else
	inDate = f_str_d_to_d(uo_date.sle_date.text)
end if

SetMicroHelp( 'Loading data...' )
dw_1.Retrieve(inDate,deptStr,caller)
SetMicroHelp( '(responder) Ready')

if cDeptWeeklyRespDept <> deptStr then
	SetProfileString(cINIPath + cINIFile, "Department Response Rate", &
			"DeptWeeklyRespDept",deptStr)
	cDeptWeeklyRespDept=DeptStr
end if

if cDeptWeeklyRespCaller <> caller then
	SetProfileString(cINIPath + cINIFile, "Department Response Rate", &
			"DeptWeeklyRespCaller",caller)
	cDeptWeeklyRespCaller=caller
end if


end event

type st_1 from statictext within w_r_weeklyresp
integer x = 155
integer y = 48
integer width = 457
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select Date"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_r_weeklyresp
string tag = "Weekly Department Response Rate"
integer x = 27
integer y = 284
integer width = 3611
integer height = 2028
integer taborder = 50
string dataobject = "d_weekly_resp"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_date from u_ddcal within w_r_weeklyresp
string tag = "Select a end date to for daily department response rate report!"
integer x = 169
integer y = 116
integer width = 425
integer height = 100
integer taborder = 10
boolean bringtotop = true
end type

on uo_date.destroy
call u_ddcal::destroy
end on

event mousemove;SetMicroHelp( this.tag )
end event

