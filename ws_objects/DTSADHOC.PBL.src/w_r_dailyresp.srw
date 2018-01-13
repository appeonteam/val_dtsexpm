$PBExportHeader$w_r_dailyresp.srw
forward
global type w_r_dailyresp from window
end type
type p_1 from picture within w_r_dailyresp
end type
type ddlb_caller from dropdownlistbox within w_r_dailyresp
end type
type st_3 from statictext within w_r_dailyresp
end type
type st_2 from statictext within w_r_dailyresp
end type
type uo_dept from u_multi_select_01 within w_r_dailyresp
end type
type cb_2 from commandbutton within w_r_dailyresp
end type
type cb_1 from commandbutton within w_r_dailyresp
end type
type uo_date from u_ddcal within w_r_dailyresp
end type
type st_1 from statictext within w_r_dailyresp
end type
type dw_1 from datawindow within w_r_dailyresp
end type
end forward

global type w_r_dailyresp from window
string tag = "(responder) Ready"
integer x = 1056
integer y = 484
integer width = 3634
integer height = 2464
boolean titlebar = true
string title = "Department Daily Response Rate"
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
uo_date uo_date
st_1 st_1
dw_1 dw_1
end type
global w_r_dailyresp w_r_dailyresp

type variables
String cDeptDailyRespDept, cDeptDailyRespCaller
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

cDeptDailyRespDept = ProfileString(cINIPath + cINIFile, "Department Response Rate", & 
			"DeptDailyRespDept","")
cDeptDailyRespCaller = ProfileString(cINIPath + cINIFile, "Department Response Rate", & 
			"DeptDailyRespCaller","")

deptStr = cDeptDailyRespDept

if upper(cDeptDailyRespDept) <> "[ALL]" then
	uo_dept.uo_ddlb_1.text = '[Selected]'
	uo_dept.uo_ddlb_1.TriggerEvent("SelectionChanged")
	int ii,jj,kk,r1,r2,r3
	r3=uo_dept.uo_lb_1.TotalItems()
	string dispStr
	ii = len(cDeptDailyRespDept)
	jj = 1
	do while jj <= ii
		kk = pos(cDeptDailyRespDept,',',jj)
		if kk = 0 then
			dispStr = trim(mid(cDeptDailyRespDept,jj))
			jj = ii + 1
		else
			dispStr = trim(mid(cDeptDailyRespDept,jj,kk - jj))
			jj = kk + 1
		end if	
		r1 = uo_dept.uo_lb_1.FindItem(dispStr,0)
		r2 = uo_dept.uo_lb_1.SetState(r1,TRUE)
	loop
	uo_dept.uo_ddlb_1.text = '[Selected]'
	uo_dept.uo_lb_1.TriggerEvent("losefocus")
end if

caller = cDeptDailyRespCaller
ddlb_caller.text = caller

//integer ret
//ret = pop_lb_from_db (uo_dept.cColumn2Retrieve, uo_dept.cTable2Use, uo_dept.uo_lb_1 )
//if ret=0 then
//	uo_dept.ib_loaded = TRUE
//	messagebox("loaded","uo_dept is loaded!")
//end if

uo_date.sle_date.text = string(today(),cDateFormatStr)
dw_1.SetTransObject(sqlca)
cb_1.SetFocus()
cb_1.Default = true

f_mod_rpt_dw_ld_disp(dw_1,'rpttoday')


end event

on w_r_dailyresp.create
this.p_1=create p_1
this.ddlb_caller=create ddlb_caller
this.st_3=create st_3
this.st_2=create st_2
this.uo_dept=create uo_dept
this.cb_2=create cb_2
this.cb_1=create cb_1
this.uo_date=create uo_date
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.p_1,&
this.ddlb_caller,&
this.st_3,&
this.st_2,&
this.uo_dept,&
this.cb_2,&
this.cb_1,&
this.uo_date,&
this.st_1,&
this.dw_1}
end on

on w_r_dailyresp.destroy
destroy(this.p_1)
destroy(this.ddlb_caller)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.uo_dept)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_date)
destroy(this.st_1)
destroy(this.dw_1)
end on

event close;close(this)
end event

event activate;if IsValid(W_main) then 
	w_main.triggerevent("ue_menu_set")
end if	
end event

event deactivate;if Isvalid(w_main) then
 w_main.postevent("ue_menu_set")
end if
//m_main.m_file.m_copy.enabled=false
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

type p_1 from picture within w_r_dailyresp
integer x = 3250
integer y = 76
integer width = 169
integer height = 140
string picturename = "rapid_response_icon_32.jpg"
boolean focusrectangle = false
end type

type ddlb_caller from dropdownlistbox within w_r_dailyresp
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
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"[All]","GST","Employee"}
borderstyle borderstyle = stylelowered!
end type

event mousemove;SetMicroHelp( this.tag )
end event

type st_3 from statictext within w_r_dailyresp
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

type st_2 from statictext within w_r_dailyresp
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

type uo_dept from u_multi_select_01 within w_r_dailyresp
string tag = "click here to open department selection!"
integer x = 672
integer y = 120
integer taborder = 20
end type

on uo_dept.destroy
call u_multi_select_01::destroy
end on

type cb_2 from commandbutton within w_r_dailyresp
event mousemove pbm_mousemove
string tag = "Click here to close this window"
integer x = 2633
integer y = 112
integer width = 343
integer height = 108
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

type cb_1 from commandbutton within w_r_dailyresp
event mousemove pbm_mousemove
string tag = "Click here to run report"
integer x = 2194
integer y = 112
integer width = 366
integer height = 108
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

event clicked;
uo_dept.uf_select_items()

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

if cDeptDailyRespDept <> deptStr then
	SetProfileString(cINIPath + cINIFile, "Department Response Rate", &
			"DeptDailyRespDept",deptStr)
	cDeptDailyRespDept=DeptStr
end if

if cDeptDailyRespCaller <> caller then
	SetProfileString(cINIPath + cINIFile, "Department Response Rate", &
			"DeptDailyRespCaller",caller)
	cDeptDailyRespCaller=caller
end if


SetMicroHelp( '{responder} Ready')





end event

type uo_date from u_ddcal within w_r_dailyresp
string tag = "Select a end date to for daily department response rate report!"
integer x = 169
integer y = 116
integer width = 425
integer height = 100
integer taborder = 10
end type

on uo_date.destroy
call u_ddcal::destroy
end on

event mousemove;SetMicroHelp( this.tag )
end event

type st_1 from statictext within w_r_dailyresp
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

type dw_1 from datawindow within w_r_dailyresp
string tag = "Daily Department Response Rate"
integer x = 27
integer y = 276
integer width = 3538
integer height = 2028
integer taborder = 50
string dataobject = "d_daily_resp"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

