$PBExportHeader$w_manual_paging.srw
forward
global type w_manual_paging from window
end type
type p_1 from picture within w_manual_paging
end type
type rb_1 from radiobutton within w_manual_paging
end type
type sle_time from singlelineedit within w_manual_paging
end type
type sle_date from singlelineedit within w_manual_paging
end type
type dw_emp_dept from datawindow within w_manual_paging
end type
type lb_selected from listbox within w_manual_paging
end type
type cb_exeit from commandbutton within w_manual_paging
end type
type cb_send from commandbutton within w_manual_paging
end type
type st_3 from statictext within w_manual_paging
end type
type mle_page_msg from multilineedit within w_manual_paging
end type
type cb_deleteone from commandbutton within w_manual_paging
end type
type cb_deleteall from commandbutton within w_manual_paging
end type
type cb_addall from commandbutton within w_manual_paging
end type
type cb_addone from commandbutton within w_manual_paging
end type
type st_2 from statictext within w_manual_paging
end type
type st_1 from statictext within w_manual_paging
end type
type rb_emp from radiobutton within w_manual_paging
end type
type rb_mgr from radiobutton within w_manual_paging
end type
type rb_dept from radiobutton within w_manual_paging
end type
type dw_list from datawindow within w_manual_paging
end type
type gb_1 from groupbox within w_manual_paging
end type
end forward

global type w_manual_paging from window
integer width = 2089
integer height = 2420
boolean titlebar = true
string title = "Manual Paging"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "PAGER.ICO"
boolean center = true
p_1 p_1
rb_1 rb_1
sle_time sle_time
sle_date sle_date
dw_emp_dept dw_emp_dept
lb_selected lb_selected
cb_exeit cb_exeit
cb_send cb_send
st_3 st_3
mle_page_msg mle_page_msg
cb_deleteone cb_deleteone
cb_deleteall cb_deleteall
cb_addall cb_addall
cb_addone cb_addone
st_2 st_2
st_1 st_1
rb_emp rb_emp
rb_mgr rb_mgr
rb_dept rb_dept
dw_list dw_list
gb_1 gb_1
end type
global w_manual_paging w_manual_paging

forward prototypes
public subroutine wf_insert_emp_by_dept (string indept, ref listbox inlb)
public subroutine wf_add_lb (string initem)
public subroutine wf_strip_spcl_char (multilineedit intext)
end prototypes

public subroutine wf_insert_emp_by_dept (string indept, ref listbox inlb);
end subroutine

public subroutine wf_add_lb (string initem);if lb_selected.FindItem(inItem,0) = -1 then
	lb_selected.AddItem(inItem)
end if
end subroutine

public subroutine wf_strip_spcl_char (multilineedit intext);
end subroutine

on w_manual_paging.create
this.p_1=create p_1
this.rb_1=create rb_1
this.sle_time=create sle_time
this.sle_date=create sle_date
this.dw_emp_dept=create dw_emp_dept
this.lb_selected=create lb_selected
this.cb_exeit=create cb_exeit
this.cb_send=create cb_send
this.st_3=create st_3
this.mle_page_msg=create mle_page_msg
this.cb_deleteone=create cb_deleteone
this.cb_deleteall=create cb_deleteall
this.cb_addall=create cb_addall
this.cb_addone=create cb_addone
this.st_2=create st_2
this.st_1=create st_1
this.rb_emp=create rb_emp
this.rb_mgr=create rb_mgr
this.rb_dept=create rb_dept
this.dw_list=create dw_list
this.gb_1=create gb_1
this.Control[]={this.p_1,&
this.rb_1,&
this.sle_time,&
this.sle_date,&
this.dw_emp_dept,&
this.lb_selected,&
this.cb_exeit,&
this.cb_send,&
this.st_3,&
this.mle_page_msg,&
this.cb_deleteone,&
this.cb_deleteall,&
this.cb_addall,&
this.cb_addone,&
this.st_2,&
this.st_1,&
this.rb_emp,&
this.rb_mgr,&
this.rb_dept,&
this.dw_list,&
this.gb_1}
end on

on w_manual_paging.destroy
destroy(this.p_1)
destroy(this.rb_1)
destroy(this.sle_time)
destroy(this.sle_date)
destroy(this.dw_emp_dept)
destroy(this.lb_selected)
destroy(this.cb_exeit)
destroy(this.cb_send)
destroy(this.st_3)
destroy(this.mle_page_msg)
destroy(this.cb_deleteone)
destroy(this.cb_deleteall)
destroy(this.cb_addall)
destroy(this.cb_addone)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_emp)
destroy(this.rb_mgr)
destroy(this.rb_dept)
destroy(this.dw_list)
destroy(this.gb_1)
end on

event open;dw_list.dataobject = "d_emp_pagers"
dw_list.SetTransObject(sqlca)
dw_list.Retrieve()
dw_emp_dept.SetTransObject(sqlca)

sle_time.text = string(now(),"hh:mm:ss")
sle_date.text = string(today(),cReportDateFormatStr)

timer(1)


end event

event timer;timer(0)
sle_time.text = string(now(),"hh:mm:ss")
sle_date.text = string(today(),cReportDateFormatStr)
//MessageBox('timer','timer')
timer(1)
end event

type p_1 from picture within w_manual_paging
integer x = 1006
integer y = 228
integer width = 965
integer height = 176
string picturename = "HotelEXPERTSmartPaging.bmp"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_manual_paging
integer x = 389
integer y = 436
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Supervisor"
end type

event clicked;if dw_list.dataobject <> "d_supervisor_list" then
	dw_list.dataobject= "d_supervisor_list"
	dw_list.SetTransObject(sqlca)
	dw_list.Retrieve()
end if
end event

type sle_time from singlelineedit within w_manual_paging
integer x = 1600
integer y = 52
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 67108864
boolean border = false
end type

type sle_date from singlelineedit within w_manual_paging
integer x = 137
integer y = 56
integer width = 352
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 67108864
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type dw_emp_dept from datawindow within w_manual_paging
boolean visible = false
integer x = 1143
integer y = 208
integer width = 690
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "d_emp_pagers_dept"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_selected from listbox within w_manual_paging
integer x = 1161
integer y = 704
integer width = 681
integer height = 648
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

type cb_exeit from commandbutton within w_manual_paging
integer x = 1093
integer y = 2072
integer width = 402
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
end type

event clicked;close(parent)
end event

type cb_send from commandbutton within w_manual_paging
integer x = 613
integer y = 2072
integer width = 402
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Send"
end type

event clicked;int itm1Inx, itm2Inx, inx, ans
string itm, emp_name, pgr_id, pg_msg
double keyId

if lb_selected.TotalItems() = 0 then
	MessageBox("Error","No pager is selected!")
	return
end if

if RightTrim(mle_page_msg.text) = '' then
	MessageBox("Error","Please enter paging message!")
	return
end if

//pg_msg = RightTrim(mle_page_msg.text) 
pg_msg = f_strip_special_char (RightTrim(mle_page_msg.text))

beep(1)
ans = MessageBox("Confirmation", "Do you want to go ahead to send the pages?",  Question!, YesNo!, 1)
if ans = 2 then return

inx = 1
s_pageassignment ass
do while lb_selected.TotalItems() >= inx
	itm = lb_selected.Text(inx)
	itm1Inx = Pos(itm,' - ') - 1
	itm2Inx = itm1Inx + 4
	emp_name = mid(itm,1,itm1Inx)
	pgr_id = mid(itm,itm2Inx)

	keyId = double(string(today(),"yymmddhhmmssff"))+inx
	ass.assignment_id = string(keyId,"00000000000000")
	ass.assignment_cd = 'M'
	ass.dept_assigned = ""
	ass.emp_id = ""
	ass.emp_name = emp_name
	ass.pager_id = pgr_id
	ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	SetNull(ass.time_completed)
	ass.call_number = ""
	ass.page_sent = 'N'
	ass.special_msg = pg_msg

	if not f_insert_assignment(ass) then 
		rollback;
		MessageBox("DB Error","insert pageassignment failed!")
		return 
	end if	
	
	inx++
loop


commit;

lb_selected.Reset()
mle_page_msg.text=""
dw_list.dataobject = "" 
rb_emp.TriggerEvent(clicked!)
end event

type st_3 from statictext within w_manual_paging
integer x = 288
integer y = 1392
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Paging Message"
boolean focusrectangle = false
end type

type mle_page_msg from multilineedit within w_manual_paging
integer x = 261
integer y = 1484
integer width = 1568
integer height = 512
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_deleteone from commandbutton within w_manual_paging
integer x = 969
integer y = 1216
integer width = 133
integer height = 120
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<"
end type

event clicked;if lb_selected.SelectedItem() = "" then
	return
end if

string itm, itm1, itm2
int selItm, itm1Inx, itm2Inx
selItm = lb_selected.SelectedIndex()
Do while selItm > 0 
	itm = lb_selected.SelectedItem()
	itm1Inx = Pos(itm,' - ') - 1
	itm2Inx = itm1Inx + 4
	itm1 = mid(itm,1,itm1Inx)
	itm2 = mid(itm,itm2Inx)
	if dw_list.dataobject <> 'd_dept_list' then
		if dw_list.Find("employee = '" + itm1 + "'",1,dw_list.RowCount()) = 0 then
			dw_list.InsertRow(0)
			if dw_list.dataobject = 'd_deptmgr_list' or dw_list.dataobject = 'd_supervisor_list' then
				dw_list.SetItem(dw_list.RowCount(),2,itm1)
				dw_list.SetItem(dw_list.RowCount(),3,itm2)
			else
				dw_list.SetItem(dw_list.RowCount(),1,itm1)
				dw_list.SetItem(dw_list.RowCount(),2,itm2)	
			end if
		end if
	end if
	lb_selected.DeleteItem(selItm)
	selItm = lb_selected.SelectedIndex()
loop



end event

type cb_deleteall from commandbutton within w_manual_paging
integer x = 969
integer y = 1032
integer width = 133
integer height = 120
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<<"
end type

event clicked;string itm, itm1, itm2
int selItm, itm1Inx, itm2Inx, inx
inx = lb_selected.TotalItems()
Do while inx > 0 
	itm = lb_selected.Text(1)
	itm1Inx = Pos(itm,' - ') - 1
	itm2Inx = itm1Inx + 4
	itm1 = mid(itm,1,itm1Inx)
	itm2 = mid(itm,itm2Inx)
	if dw_list.dataobject <> 'd_dept_list' then
		if dw_list.Find("employee = '" + itm1 + "'",1,dw_list.RowCount()) = 0 then
			dw_list.InsertRow(0)
			if dw_list.dataobject = 'd_deptmgr_list' or dw_list.dataobject = 'd_supervisor_list' then
				dw_list.SetItem(dw_list.RowCount(),2,itm1)
				dw_list.SetItem(dw_list.RowCount(),3,itm2)
			else
				dw_list.SetItem(dw_list.RowCount(),1,itm1)
				dw_list.SetItem(dw_list.RowCount(),2,itm2)	
			end if
		end if
	end if
	lb_selected.DeleteItem(1)
	inx = lb_selected.TotalItems()
loop



end event

type cb_addall from commandbutton within w_manual_paging
integer x = 969
integer y = 892
integer width = 133
integer height = 120
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">>"
end type

event clicked;string itm
Do while dw_list.RowCount() > 0
	if dw_list.dataobject = "d_dept_list" then
		itm = dw_list.GetItemString(1,1)
		dw_emp_dept.Retrieve(itm)
		do while dw_emp_dept.RowCount() > 0 
				wf_add_lb((dw_emp_dept.GetItemString(1,1)+' - '+&
							dw_emp_dept.GetItemString(1,2)))
				dw_emp_dept.DeleteRow(1)
			loop
	end if
	
	if dw_list.dataobject = "d_deptmgr_list"  or dw_list.dataobject = "d_supervisor_list" then
		itm = dw_list.GetItemString(1,2)+' - ' + &
					dw_list.GetItemString(1,3)
		wf_add_lb(itm)
	end if
	
	if dw_list.dataobject = 'd_emp_pagers' then
		itm = dw_list.GetItemString(1,1)+' - ' + &
					dw_list.GetItemString(1,2)
		wf_add_lb(itm)
	end if
		
	dw_list.DeleteRow(1)
loop
end event

type cb_addone from commandbutton within w_manual_paging
integer x = 969
integer y = 760
integer width = 133
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">"
end type

event clicked;//if dw_list.dataobject = "d_dept_list" then
	//MessageBox("GetSelectedRow",string(dw_list.GetSelectedRow(0)))
	int sel
	string itm
	sel = dw_list.GetSelectedRow(0)
	do while sel > 0
		if dw_list.dataobject = "d_dept_list" then
			itm = dw_list.GetItemString(sel,1)
			dw_emp_dept.Retrieve(itm)
			do while dw_emp_dept.RowCount() > 0 
				wf_add_lb((dw_emp_dept.GetItemString(1,1)+' - '+&
							dw_emp_dept.GetItemString(1,2)))
				dw_emp_dept.DeleteRow(1)
			loop
		elseif dw_list.dataobject = "d_deptmgr_list" then
			itm = dw_list.GetItemString(sel,2)+' - ' + &
						dw_list.GetItemString(sel,3)
			wf_add_lb(itm)
		elseif dw_list.dataobject = "d_supervisor_list" then
			itm = dw_list.GetItemString(sel,2)+' - ' + &
						dw_list.GetItemString(sel,3)
			wf_add_lb(itm)
		else
			itm = dw_list.GetItemString(sel,1)+' - ' + &
						dw_list.GetItemString(sel,2)
			wf_add_lb(itm)
		end if
		
		dw_list.DeleteRow(sel)
		sel = dw_list.GetSelectedRow(0)
	loop
//end if

end event

type st_2 from statictext within w_manual_paging
integer x = 1152
integer y = 628
integer width = 443
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Selected Pager"
boolean focusrectangle = false
end type

type st_1 from statictext within w_manual_paging
integer x = 256
integer y = 632
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Available"
boolean focusrectangle = false
end type

type rb_emp from radiobutton within w_manual_paging
integer x = 389
integer y = 520
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Employee"
boolean checked = true
end type

event clicked;if dw_list.dataobject <> "d_emp_pagers" then
	dw_list.dataobject= "d_emp_pagers"
	dw_list.SetTransObject(sqlca)
	dw_list.Retrieve()
end if
end event

type rb_mgr from radiobutton within w_manual_paging
integer x = 389
integer y = 360
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Manager"
end type

event clicked;if dw_list.dataobject <> "d_deptmgr_list" then
	dw_list.dataobject= "d_deptmgr_list"
	dw_list.SetTransObject(sqlca)
	dw_list.Retrieve()
end if
end event

type rb_dept from radiobutton within w_manual_paging
integer x = 389
integer y = 276
integer width = 475
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 8388608
long backcolor = 67108864
string text = "Department"
end type

event clicked;if dw_list.dataobject <> "d_dept_list" then
	dw_list.dataobject= "d_dept_list"
	dw_list.SetTransObject(sqlca)
	dw_list.Retrieve()
end if
end event

type dw_list from datawindow within w_manual_paging
integer x = 251
integer y = 704
integer width = 681
integer height = 648
integer taborder = 10
string title = "none"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.IsSelected(row) then
	this.SelectRow(row,false)
else
	this.SelectRow(row,true)
end if
end event

type gb_1 from groupbox within w_manual_paging
integer x = 270
integer y = 192
integer width = 640
integer height = 432
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217729
long backcolor = 67108864
string text = "Selection by"
end type

