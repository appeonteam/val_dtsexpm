$PBExportHeader$w_table_upd.srw
forward
global type w_table_upd from window
end type
type dw_supervisor_rpt from datawindow within w_table_upd
end type
type dw_emp_pager_rpt from datawindow within w_table_upd
end type
type dw_mgr_rpt from datawindow within w_table_upd
end type
type dw_pager_rpt from datawindow within w_table_upd
end type
type dw_1 from datawindow within w_table_upd
end type
type tab_update from tab within w_table_upd
end type
type tabpage_pager from userobject within tab_update
end type
type tabpage_pager from userobject within tab_update
end type
type tabpage_pager_emp from userobject within tab_update
end type
type tabpage_pager_emp from userobject within tab_update
end type
type tabpage_supervisor from userobject within tab_update
end type
type tabpage_supervisor from userobject within tab_update
end type
type tabpage_manager from userobject within tab_update
end type
type tabpage_manager from userobject within tab_update
end type
type tab_update from tab within w_table_upd
tabpage_pager tabpage_pager
tabpage_pager_emp tabpage_pager_emp
tabpage_supervisor tabpage_supervisor
tabpage_manager tabpage_manager
end type
type st_today from statictext within w_table_upd
end type
type st_dayofweek from statictext within w_table_upd
end type
type cb_save from commandbutton within w_table_upd
end type
type cb_delete from commandbutton within w_table_upd
end type
type cb_exit from commandbutton within w_table_upd
end type
type cb_new from commandbutton within w_table_upd
end type
type cb_sort from commandbutton within w_table_upd
end type
end forward

global type w_table_upd from window
string tag = "Table Update"
integer x = 1074
integer y = 480
integer width = 2121
integer height = 1524
boolean titlebar = true
string title = "Table Update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
string icon = "TABLE.ICO"
event ue_select_tab ( )
event ue_printrpt ( )
event ue_printreport ( )
event ue_printscreen ( )
dw_supervisor_rpt dw_supervisor_rpt
dw_emp_pager_rpt dw_emp_pager_rpt
dw_mgr_rpt dw_mgr_rpt
dw_pager_rpt dw_pager_rpt
dw_1 dw_1
tab_update tab_update
st_today st_today
st_dayofweek st_dayofweek
cb_save cb_save
cb_delete cb_delete
cb_exit cb_exit
cb_new cb_new
cb_sort cb_sort
end type
global w_table_upd w_table_upd

type variables
int currentTab, currPagerIdSize,currPagerIdMinSize
String currentColumn,columnContent

end variables

forward prototypes
public function string wf_chk_dup_dept (datawindow dw_chk)
public function boolean wf_is_deft_dept_exist (datawindow dw_in)
public function boolean wf_chk_double_coverage (datawindow in_dw, string in_chk)
public function boolean wf_chk_pager_double_usage (datawindow in_dw, string in_chk_id, string in_chk_person)
public function string wf_chk_dup_generic (datawindow dw_chk, string col_nm)
end prototypes

event ue_select_tab;//tab_update.SelectedTab = currenttab
end event

event ue_printrpt();if currentTab = 1 then
	dw_pager_rpt.SetTransObject(sqlca)
	dw_pager_rpt.Retrieve()
	dw_pager_rpt.Print()
else
	if currentTab =2 then
		dw_emp_pager_rpt.SetTransObject(sqlca)
		dw_emp_pager_rpt.Retrieve()
		dw_emp_pager_rpt.Print()		
	else
		if currentTab = 3 then
			dw_supervisor_rpt.SetTransObject(sqlca)
			dw_supervisor_rpt.Retrieve()
			dw_supervisor_rpt.Print()
		else
			dw_mgr_rpt.SetTransObject(sqlca)
			dw_mgr_rpt.Retrieve()
			dw_mgr_rpt.Print()
		end if
	end if
end if
		
end event

event ue_printreport;TriggerEvent("ue_printrpt")
end event

event ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

public function string wf_chk_dup_dept (datawindow dw_chk);int total_row, cnt, row
string dup_dept, chk_dept
total_row = dw_chk.rowcount()
cnt = 1
dup_dept = ""
do while cnt <= total_row
	chk_dept = dw_chk.GetItemString(cnt,'dept')
	row = 1
	do while row <= total_row
		if cnt <> row then
			if dw_chk.GetItemString(row,'dept') = chk_dept then
				dup_dept = chk_dept
				exit
			end if
		end if
		row++
	loop
	cnt++
loop

return dup_dept

end function

public function boolean wf_is_deft_dept_exist (datawindow dw_in);int row
boolean DEFT_found
DEFT_found = false
row=1
do while row <= dw_in.RowCount()
	if dw_in.GetItemString(row,'dept') = 'DEFT' then
		DEFT_found = true
		exit
	end if
	row++
loop

return DEFT_found
end function

public function boolean wf_chk_double_coverage (datawindow in_dw, string in_chk);int i, chk_row, found_chk_row
string chk_id, chk_zone
i=1
do while i<= in_dw.RowCount()
	chk_row = i
	chk_id = in_dw.GetItemString(i,in_chk)
	chk_zone = in_dw.GetItemString(i,"zone_code")
	if in_dw.DataObject = 'd_mgr_upd' or in_dw.DataObject = 'd_supervisor_upd' then
		if in_dw.GetItemString(i,"dept") = "WELCOME" then 
			i++
			continue
		end if
	end if
	found_chk_row = in_dw.Find(in_chk+"='"+chk_id+"'", i+1, in_dw.RowCount())
	if found_chk_row > 0 then
		if found_chk_row <> chk_row then
			if chk_zone = in_dw.GetItemString(found_chk_row,"zone_code") or &
				chk_zone = 'Z0' or in_dw.GetItemString(found_chk_row,"zone_code")='Z0' then
				if in_chk = 'pager_id' then
//					MessageBox("Error","Multipla pager: "+in_dw.GetItemString(chk_row,2)+&
//							" can potentially cover a same area! Update failed!")
					MessageBox("Error","Pager:"+in_dw.GetItemString(chk_row,2)+&
							" is already exist. Update failed!")
				else
//					MessageBox("Error","Pager "+in_dw.GetItemString(chk_row,2)+&
//							" and " +in_dw.GetItemString(found_chk_row,2)+&
//							" are potentially covering a same area! Update failed!")
					MessageBox("Error","The department you selected is already "+&
								"covered by a supervisor/manager. Only 1 "+&
								"supervisor/manager is allowed to a department!")
				end if
				return false
			end if
		end if
	end if
	i++
loop

return true

end function

public function boolean wf_chk_pager_double_usage (datawindow in_dw, string in_chk_id, string in_chk_person);// in_chk_id is either a supervisor_pager_id or a mgr_pager_id
// in_chk_person is either a supervisor_id or a deptmgr_id

int i, chk_row, found_chk_row
string chk_id, chk_person
i=1
do while i<= in_dw.RowCount()
	chk_row = i
	chk_id = in_dw.GetItemString(i,in_chk_id)
	chk_person = in_dw.GetItemString(i,in_chk_person)
//	if in_dw.GetItemString(i,"dept") = "WELCOME" then //bypass when dept='WELCOME'
//		i++
//		continue
//	end if
	found_chk_row = in_dw.Find(in_chk_id+"='"+chk_id+"'", i+1, in_dw.RowCount())
	if found_chk_row > 0 then
		if found_chk_row <> chk_row then
			if chk_person <> in_dw.GetItemString(found_chk_row,in_chk_person) then
				if in_chk_id = 'supervisor_pager_id' then
					MessageBox("Error","Two supervisors can't share a same pager:"+chk_id+"!")
				else
					MessageBox("Error","Two managers can't share a same pager:"+chk_id+"!")
				end if
				return true
			end if
		end if
	end if
	i++
loop

return false

end function

public function string wf_chk_dup_generic (datawindow dw_chk, string col_nm);integer total_row, cnt, dup_cnt, row
string dup_val, chk_val

total_row = dw_chk.rowcount()
cnt = 1
dup_val = ""
do while cnt <= total_row
	chk_val = dw_chk.GetItemString(cnt,col_nm)
	row = 1
	do while row <= total_row
		if cnt <> row then
			if dw_chk.GetItemString(row,col_nm) = chk_val then
				dup_val = chk_val
				exit
			end if
		end if
		row++
	loop
	cnt++
loop

return dup_val

end function

event open;st_dayofweek.text = string(today(),"dddd")
st_today.text = string(today(),cReportLongDateFormatStr2)





end event

on w_table_upd.create
this.dw_supervisor_rpt=create dw_supervisor_rpt
this.dw_emp_pager_rpt=create dw_emp_pager_rpt
this.dw_mgr_rpt=create dw_mgr_rpt
this.dw_pager_rpt=create dw_pager_rpt
this.dw_1=create dw_1
this.tab_update=create tab_update
this.st_today=create st_today
this.st_dayofweek=create st_dayofweek
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.cb_exit=create cb_exit
this.cb_new=create cb_new
this.cb_sort=create cb_sort
this.Control[]={this.dw_supervisor_rpt,&
this.dw_emp_pager_rpt,&
this.dw_mgr_rpt,&
this.dw_pager_rpt,&
this.dw_1,&
this.tab_update,&
this.st_today,&
this.st_dayofweek,&
this.cb_save,&
this.cb_delete,&
this.cb_exit,&
this.cb_new,&
this.cb_sort}
end on

on w_table_upd.destroy
destroy(this.dw_supervisor_rpt)
destroy(this.dw_emp_pager_rpt)
destroy(this.dw_mgr_rpt)
destroy(this.dw_pager_rpt)
destroy(this.dw_1)
destroy(this.tab_update)
destroy(this.st_today)
destroy(this.st_dayofweek)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.cb_exit)
destroy(this.cb_new)
destroy(this.cb_sort)
end on

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event close;close (this)
end event

event resize;cb_new.y    = This.WorkSpaceHeight() - cb_new.Height - 55
cb_delete.y = cb_new.y
cb_save.y = cb_new.y
cb_sort.y   = cb_new.y
cb_exit.y   = cb_new.y
tab_update.height = This.WorkSpaceHeight() - 350
dw_1.height = This.WorkSpaceHeight()- 520

end event

type dw_supervisor_rpt from datawindow within w_table_upd
boolean visible = false
integer x = 1851
integer y = 1256
integer width = 256
integer height = 152
integer taborder = 20
string dataobject = "d_supervisor_rpt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_emp_pager_rpt from datawindow within w_table_upd
boolean visible = false
integer x = 1481
integer y = 1280
integer width = 146
integer height = 84
integer taborder = 10
string dataobject = "d_emp_pagers_rpt"
boolean livescroll = true
end type

type dw_mgr_rpt from datawindow within w_table_upd
boolean visible = false
integer x = 1472
integer y = 1216
integer width = 183
integer height = 120
integer taborder = 20
string dataobject = "d_mgr_rpt"
boolean livescroll = true
end type

type dw_pager_rpt from datawindow within w_table_upd
boolean visible = false
integer x = 27
integer y = 1216
integer width = 197
integer height = 116
integer taborder = 30
string dataobject = "d_pager_rpt"
boolean livescroll = true
end type

type dw_1 from datawindow within w_table_upd
event mousemove pbm_mousemove
string tag = "Pager Update screen"
integer x = 82
integer y = 304
integer width = 1929
integer height = 848
integer taborder = 40
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;this.SetItem (row,"upd_ts",today())
if currentTab <> 1 then
	return
end if

dw_1.AcceptText()
int num_digit

currentColumn = this.GetColumnName()
columnContent = data

if CurrentColumn = "pager_type" then
	currPagerIdSize = f_get_pager_digit('MAX',columnContent)
	currPagerIdMinSize = f_get_pager_digit('MIN',columnContent)
	num_digit = len(this.GetItemString(row,'pager_id'))
	if num_digit > 0 then //re-validate digit
		if num_digit < currPagerIdMinSize or num_digit > currPagerIdSize then
			this.SetItem(row,'pager_id','')
			this.AcceptText()
			this.setfocus()
			return 2		
		end if
	end if
end if

if CurrentColumn = "pager_id" then
	num_digit = len(this.GetItemString(row,'pager_id'))
	if num_digit < currPagerIdMinSize or &
		num_digit >  currPagerIdSize then
		if currPagerIdMinSize <> currPagerIdSize then
			MessageBox("Error","Pager ID should contain from "+string(currPagerIdMinSize)+" to "+&
					string(currPagerIdSize)+" digits!")
		else
			MessageBox("Error","Pager ID should contain "+string(currPagerIdSize)+" digits!")
		end if
	else
		return
	end if
	this.SetItem(row,'pager_id','')
	this.AcceptText()
	this.setfocus()
	return 2	
end if	

	
end event

event rowfocuschanged;if currentTab <> 1 then
	return
end if

columnContent = this.GetItemString(currentrow,'pager_type')


currPagerIdSize = f_get_pager_digit('MAX',columnContent)
currPagerIdMinSize = f_get_pager_digit('MIN',columnContent)
end event

type tab_update from tab within w_table_upd
integer x = 37
integer y = 176
integer width = 1989
integer height = 1060
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_pager tabpage_pager
tabpage_pager_emp tabpage_pager_emp
tabpage_supervisor tabpage_supervisor
tabpage_manager tabpage_manager
end type

on tab_update.create
this.tabpage_pager=create tabpage_pager
this.tabpage_pager_emp=create tabpage_pager_emp
this.tabpage_supervisor=create tabpage_supervisor
this.tabpage_manager=create tabpage_manager
this.Control[]={this.tabpage_pager,&
this.tabpage_pager_emp,&
this.tabpage_supervisor,&
this.tabpage_manager}
end on

on tab_update.destroy
destroy(this.tabpage_pager)
destroy(this.tabpage_pager_emp)
destroy(this.tabpage_supervisor)
destroy(this.tabpage_manager)
end on

event selectionchanged;dw_1.AcceptText()
if dw_1.ModifiedCount() > 0 or dw_1.DeletedCount() > 0 then
	long res
	res = MessageBox("Data Changed","Do you want to save the changes?",&
		Question!,YesNo!,1)
	if res = 1 then
		if dw_1.Update() = 1 then
			commit;
		else
			MessageBox("DB Error","Update failed!")
		end if
	end if
end if

//MessageBox("DB Parms" , &
//"database:" + sqlca.database + &
//" servername:" + sqlca.servername + &
//" logid:" + sqlca.logid + &
//" userid:" + sqlca.userid + & 
//" dbms:" + sqlca.dbms + &
//" logpass:" + sqlca.logpass + & 
//" dbpass:" + sqlca.dbpass + &
//" dbparm:" + sqlca.dbparm )


currentTab = this.SelectedTab

if currentTab = 1 then
	dw_1.DataObject = 'd_pager_upd'
else
	if currentTab = 2 then
		dw_1.DataObject = 'd_pager_emp_upd'
	else
		if currentTab = 3 then
			dw_1.DataObject = 'd_supervisor_upd'
		else
			dw_1.DataObject = 'd_mgr_upd'
		end if
	end if
end if
int stat
stat=dw_1.SetTransObject(sqlca)
if stat < 0 then
	messagebox("SetTransObject",string(stat))
end if
if dw_1.Retrieve(cPageSysCd) = 0 then
	dw_1.insertrow(0)
end if

end event

type tabpage_pager from userobject within tab_update
event mousemove pbm_mousemove
string tag = "Update Pager Table"
integer x = 18
integer y = 108
integer width = 1952
integer height = 936
long backcolor = 67108864
string text = "Pager"
long tabtextcolor = 134217729
long picturemaskcolor = 536870912
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event dragdrop;dw_1.SetTransObject(sqlca)
end event

type tabpage_pager_emp from userobject within tab_update
event mousemove pbm_mousemove
string tag = "Update Pager Assignment"
integer x = 18
integer y = 108
integer width = 1952
integer height = 936
long backcolor = 67108864
string text = "Pager Assignment"
long tabtextcolor = 134217729
long picturemaskcolor = 536870912
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

type tabpage_supervisor from userobject within tab_update
string tag = "Update Supervisor Table"
integer x = 18
integer y = 108
integer width = 1952
integer height = 936
long backcolor = 67108864
string text = "Supervisor"
long tabtextcolor = 134217729
long picturemaskcolor = 536870912
end type

type tabpage_manager from userobject within tab_update
string tag = "Update Supervisor"
integer x = 18
integer y = 108
integer width = 1952
integer height = 936
long backcolor = 67108864
string text = "Manager"
long tabtextcolor = 134217729
long picturemaskcolor = 536870912
end type

type st_today from statictext within w_table_upd
integer x = 1198
integer y = 48
integer width = 699
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

type st_dayofweek from statictext within w_table_upd
integer x = 64
integer y = 44
integer width = 302
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_table_upd
event mousemove pbm_mousemove
string tag = "click here to save the changes"
integer x = 933
integer y = 1240
integer width = 265
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Sa&ve"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;dw_1.AcceptText()
if dw_1.ModifiedCount() = 0 and dw_1.DeletedCount() = 0 then
	MessageBox("No Change","there is no changes to the data!")
	return
else
	if dw_1.DataObject = 'd_pager_upd' then
		if dw_1.GetItemString(dw_1.GetRow(),"pager_id") = ' ' then
			MessageBox("Data Error","Pager ID required!")
			dw_1.SetFocus()
			return
		end if
		if not wf_chk_double_coverage(dw_1,'pager_id') then
			return
		end if
	end if
	if dw_1.DataObject = 'd_pager_emp_upd' then
		string dup_pager
		dup_pager = wf_chk_dup_generic(dw_1, "pager_id")
		if dup_pager <> '' then
			//MessageBox("Error","Pager "+dup_pager+" is already assigned. Please select another pager!")
			MessageBox("Error","Pager is already assigned. Please select another pager!")
			return
		end if
		
		if f_chk_dup_generic ("supervisor","supervisor_pager_id",&
				dw_1.GetItemString(dw_1.GetRow(),"pager_id") ) then
				/*** allow if the pager is used by same person ***/
				if not f_chk_dup_generic2 ("supervisor","supervisor_pager_id",&
					"supervisor_id",dw_1.GetItemString(dw_1.GetRow(),"pager_id"),&
					dw_1.GetItemString(dw_1.GetRow(),"emp_id")) then
					MessageBox("Error","Pager is already used by a supervisor. "+&
						"Please select another pager!")
					return
				end if
		end if		
		if f_chk_dup_generic ("deptmgr","mgr_pager_id",&
				dw_1.GetItemString(dw_1.GetRow(),"pager_id") ) then
				/*** allow if the pager is used by same person ***/
				if not f_chk_dup_generic2 ("deptmgr","mgr_pager_id",&
					"deptmgr_id",dw_1.GetItemString(dw_1.GetRow(),"pager_id"),&
					dw_1.GetItemString(dw_1.GetRow(),"emp_id")) then				
					MessageBox("Error","Pager is already used by a manager. "+&
						"Please select another pager!")
				end if
			return
		end if		

	end if
	if dw_1.DataObject = 'd_mgr_upd' or dw_1.DataObject = 'd_supervisor_upd' then
		string cDept
		if not wf_chk_double_coverage(dw_1,'dept') then
			return
		end if
		if dw_1.DataObject = 'd_mgr_upd' then
			if wf_chk_pager_double_usage(dw_1,'mgr_pager_id','deptmgr_id') then
				return
			end if
			if f_chk_dup_generic ("supervisor","supervisor_pager_id",&
				dw_1.GetItemString(dw_1.GetRow(),"mgr_pager_id") ) then
				/*** allow if the pager is used by same person ***/
				if not f_chk_dup_generic2 ("supervisor","supervisor_pager_id",&
					"supervisor_id",dw_1.GetItemString(dw_1.GetRow(),"mgr_pager_id"),&
					dw_1.GetItemString(dw_1.GetRow(),"deptmgr_id")) then				
					MessageBox("Error","Pager is already used by a supervisor. "+&
						"Please select another pager!")
					return
				end if
			end if		
			if f_chk_dup_generic ("pager_emp","pager_id",&
				dw_1.GetItemString(dw_1.GetRow(),"mgr_pager_id") ) then
				/*** allow if the pager is used by same person ***/
				if not f_chk_dup_generic2 ("pager_emp","pager_id",&
					"emp_id",dw_1.GetItemString(dw_1.GetRow(),"mgr_pager_id"),&
					dw_1.GetItemString(dw_1.GetRow(),"deptmgr_id")) then								
					MessageBox("Error","Pager is already used by an employee. "+&
						"Please select another pager!")
					return
				end if
			end if			
		else // d_supervisor
			if wf_chk_pager_double_usage(dw_1,'supervisor_pager_id','supervisor_id') then
				return
			end if
			if f_chk_dup_generic ("pager_emp","pager_id",&
				dw_1.GetItemString(dw_1.GetRow(),"supervisor_pager_id") ) then
				if not f_chk_dup_generic2 ("pager_emp","pager_id",&
					"emp_id",dw_1.GetItemString(dw_1.GetRow(),"supervisor_pager_id"),&
					dw_1.GetItemString(dw_1.GetRow(),"supervisor_id")) then					
					MessageBox("Error","Pager is already used by an employee. "+&
						"Please select another pager!")
					return
				end if
			end if		
			if f_chk_dup_generic ("deptmgr","mgr_pager_id",&
				dw_1.GetItemString(dw_1.GetRow(),"supervisor_pager_id") ) then
				if not f_chk_dup_generic2 ("deptmgr","mgr_pager_id",&
					"deptmgr_id",dw_1.GetItemString(dw_1.GetRow(),"supervisor_pager_id"),&
					dw_1.GetItemString(dw_1.GetRow(),"supervisor_id")) then					
					MessageBox("Error","Pager is already used by a manager. "+&
						"Please select another pager!")
					return
				end if
			end if			
		end if		
		if not wf_is_deft_dept_exist(dw_1) then
			MessageBox("Error","You must have a DEFT department assigned to a pager! Please try again!",StopSign!)
			return
		end if			
	end if
	if dw_1.update() = 1 then
		commit;
	else
		MessageBox("DB Error","Update failed!")
	end if
end if
dw_1.SetFocus()

end event

type cb_delete from commandbutton within w_table_upd
event mousemove pbm_mousemove
string tag = "Click to delete the current row"
integer x = 608
integer y = 1240
integer width = 265
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Delete"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;
if currentTab = 1 then
	if f_emp_own_pager(dw_1.GetItemString(dw_1.GetRow(),'pager_id')) then
		MessageBox("Warning","If you wish to delete the pager, pls deacivate pager first!",StopSign!)
		return
	end if
end if

if currentTab >= 3 then
	if dw_1.GetItemString(dw_1.GetRow(),'dept') = 'DEFT' then
		MessageBox("Error","Can't delete the Default department!")
		return
	end if
end if
dw_1.DeleteRow(dw_1.GetRow())
dw_1.SetFocus()
end event

type cb_exit from commandbutton within w_table_upd
event mousemove pbm_mousemove
string tag = "click here to close the update screen"
integer x = 1559
integer y = 1240
integer width = 265
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&E&xit"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;dw_1.AcceptText()
if dw_1.ModifiedCount() > 0 or dw_1.DeletedCount() > 0 then
	long res
	res = MessageBox("Data Changed","Do you want to save the changes before exit?",&
		Question!,YesNoCancel!,1)
	if res = 3 then
		return
	else
		if res = 1 then
			if dw_1.DataObject = 'd_pager_upd' then
				if len(dw_1.GetItemString(dw_1.GetRow(),"pager_id")) > nPagerIdDigit then
					MessageBox("Data Error","Page ID should be only "+string(nPagerIdDigit)+" digits!")
					return
				end if
			end if
			if dw_1.Update() = 1 then
				commit;
			else
				MessageBox("DB Error","Update failed!")
			end if
		end if
		m_main.m_file.m_close.TriggerEvent("clicked")
	end if
else
	m_main.m_file.m_close.TriggerEvent("clicked")
end if

end event

type cb_new from commandbutton within w_table_upd
event mousemove pbm_mousemove
string tag = "click here to add a pager"
integer x = 293
integer y = 1240
integer width = 265
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&New"
end type

event mousemove;w_main.SetMicroHelp(This.Tag)
end event

event clicked;dw_1.InsertRow(0)
dw_1.ScrollToRow(dw_1.RowCount())
dw_1.SetItem (dw_1.Rowcount(),"upd_ts",today())


if currentTab = 1 then
	if dw_1.RowCount() > 1 then
		dw_1.SetItem (dw_1.RowCount(),"pager_type",dw_1.GetItemString(dw_1.RowCount()-1,"pager_type"))
		currPagerIdSize = f_get_pager_digit('MAX',dw_1.GetItemString(dw_1.RowCount()-1,"pager_type"))
		currPagerIdMinSize = f_get_pager_digit('MIN',dw_1.GetItemString(dw_1.RowCount()-1,"pager_type"))	
	end if
	dw_1.SetItem ( dw_1.RowCount(), "active_ind", "Y" )
	dw_1.SetItem ( dw_1.RowCount(), "zone_code", "Z0") // Z0 is all zone
	if dw_1.RowCount() > 1 then
//		dw_1.SetItem ( dw_1.RowCount(), "stack_seq", dw_1.GetItemNumber(dw_1.RowCount() - 1,"stack_seq") + 1)
		dw_1.SetItem ( dw_1.RowCount(), "stack_seq", f_max_pager_stack_seq())

	else
		dw_1.SetItem (1,"stack_seq",1)
	end if
//	dw_1.SetItem ( dw_1.RowCount(), "pager_id", string(dw_1.RowCount(),"0000") )
else
	if currentTab >= 3 then
		dw_1.SetItem ( dw_1.RowCount(), "zone_code", "Z0")
	end if
end if
dw_1.SetFocus()
//MessageBox('','T'+string(12345,'00000000000'))
//MessageBox('','A'+string(today(),'yyyymmddhhmmss'))
end event

type cb_sort from commandbutton within w_table_upd
integer x = 1257
integer y = 1240
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Sort"
end type

event clicked;string nullStr
SetNull(nullStr)
dw_1.SetSort(nullStr)
dw_1.Sort()
end event

