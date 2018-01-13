$PBExportHeader$w_vtask_upd.srw
forward
global type w_vtask_upd from window
end type
type p_1 from picture within w_vtask_upd
end type
type pb_5 from picturebutton within w_vtask_upd
end type
type pb_4 from picturebutton within w_vtask_upd
end type
type pb_3 from picturebutton within w_vtask_upd
end type
type pb_2 from picturebutton within w_vtask_upd
end type
type pb_1 from picturebutton within w_vtask_upd
end type
type cb_1 from commandbutton within w_vtask_upd
end type
type dw_2 from datawindow within w_vtask_upd
end type
type sle_date from singlelineedit within w_vtask_upd
end type
type st_1 from statictext within w_vtask_upd
end type
type cb_exit from commandbutton within w_vtask_upd
end type
type cb_reset from commandbutton within w_vtask_upd
end type
type cb_delete from commandbutton within w_vtask_upd
end type
type cb_save from commandbutton within w_vtask_upd
end type
type cb_add from commandbutton within w_vtask_upd
end type
type dw_1 from datawindow within w_vtask_upd
end type
type sle_1 from singlelineedit within w_vtask_upd
end type
type sle_2 from singlelineedit within w_vtask_upd
end type
end forward

global type w_vtask_upd from window
integer x = 1074
integer y = 480
integer width = 3470
integer height = 1732
boolean titlebar = true
string title = "Voice Task Table Update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 134217728
string icon = "CATEG01.ICO"
event ue_print pbm_custom01
event ue_printreport ( )
p_1 p_1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cb_1 cb_1
dw_2 dw_2
sle_date sle_date
st_1 st_1
cb_exit cb_exit
cb_reset cb_reset
cb_delete cb_delete
cb_save cb_save
cb_add cb_add
dw_1 dw_1
sle_1 sle_1
sle_2 sle_2
end type
global w_vtask_upd w_vtask_upd

type variables
DataWindowChild dwc_subtaskno
DataWindowChild dwc_taskno
string LastId
int RowLastSaved
end variables

forward prototypes
public function boolean wf_check_dup (string taskno, string subtaskno)
public function boolean wf_save ()
public function long wf_find_dup (string taskno, string subtaskno)
end prototypes

on ue_print;dw_1.ShareData(dw_2)
dw_2.SetSort("problem_problem_desc A, subproblem_subproblem A")
dw_2.Sort() 
dw_2.print()

dw_1.ShareDataOff ( )
dw_1.Sort()

end on

event ue_printreport();dw_1.ShareData(dw_2)
//dw_2.SetSort("problem_problem_desc A, subproblem_subproblem A")
dw_2.SetSort("task_id A")
dw_2.Sort() 
dw_2.print()

dw_1.ShareDataOff ( )
dw_1.Sort()

end event

public function boolean wf_check_dup (string taskno, string subtaskno);string id
  SELECT vtasks.task_id  
    INTO :id  
    FROM vtasks  
   WHERE ( vtasks.problem_number = :taskno ) AND  
         ( vtasks.subproblem_number = :subtaskno )   ;
if sqlca.sqlcode = 0 then
	return false
else
	if sqlca.sqlcode = 100 then
		return true
	else
		egm_sqlerror ( sqlca )
//		MessageBox("db error",sqlca.sqlerrtext)
	end if
end if

end function

public function boolean wf_save ();int startRow, endRow, curRow
string id, task, subtask
endRow = dw_1.RowCount()
startRow = dw_1.Find("task_id = '" + lastId + "'", 1, endRow) 
curRow = startRow + 1
DO WHILE curRow <= endRow
	id = dw_1.GetItemString(curRow,"task_id")
	task = dw_1.GetItemString(curRow,"problem_number")
	subtask = dw_1.GetItemString(curRow,"subproblem_number") 
//	MessageBox("Insert","Inserting: " + id + " " + task + " " + subtask)
	INSERT INTO vtasks ( task_id, problem_number, subproblem_number )  
 		 VALUES ( :id, :task, :subtask )  ;
	if sqlca.sqlcode <> 0 then
		egm_sqlerror ( sqlca )
//		MessageBox("DB Error","Save error on record: " + id + "  " + sqlca.sqlerrtext)
		return false
	end if  	
	curRow = curRow + 1
	
LOOP
dw_1.ResetUpdate()
lastId = id
return true
end function

public function long wf_find_dup (string taskno, string subtaskno);//** if dup is found, return true else return false **//

string findStr

findStr = "problem_desc = '" + taskno + "' and subproblem_desc = '" + subtaskno + "'"
//MessageBox("",findStr+ " total row: " + string(dw_1.RowCount()))
return dw_1.Find(findStr,1,dw_1.RowCount())

end function

on open;dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
dw_1.GetChild("subproblem_number",dwc_subtaskno)
dwc_subtaskno.SetTransObject(sqlca)
dwc_subtaskno.Retrieve()
sle_date.text = string(today(), "mm/dd/yy")
dw_1.SetFocus()

dw_1.GetChild("problem_number",dwc_taskno)
dwc_taskno.SetTransObject(sqlca)
dwc_taskno.Retrieve()

dw_1.GetChild("subproblem_number",dwc_subtaskno)
dwc_subtaskno.SetTransObject(sqlca)
dwc_subtaskno.Retrieve()
RowLastSaved = dw_1.RowCount()


end on

on w_vtask_upd.create
this.p_1=create p_1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_1=create cb_1
this.dw_2=create dw_2
this.sle_date=create sle_date
this.st_1=create st_1
this.cb_exit=create cb_exit
this.cb_reset=create cb_reset
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_add=create cb_add
this.dw_1=create dw_1
this.sle_1=create sle_1
this.sle_2=create sle_2
this.Control[]={this.p_1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.cb_1,&
this.dw_2,&
this.sle_date,&
this.st_1,&
this.cb_exit,&
this.cb_reset,&
this.cb_delete,&
this.cb_save,&
this.cb_add,&
this.dw_1,&
this.sle_1,&
this.sle_2}
end on

on w_vtask_upd.destroy
destroy(this.p_1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.sle_date)
destroy(this.st_1)
destroy(this.cb_exit)
destroy(this.cb_reset)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_add)
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.sle_2)
end on

event resize;pointer cpOldPointer

SetMicroHelp( "Resizing " + this.title + " window...please wait." )
cpOldPointer = SetPointer( HourGlass! )
this.SetRedraw( False )
dw_1.SetRedraw( False )

//st_mode.x = this.WorkSpaceWidth() - (st_mode.Width + 100)
cb_add.y		= This.WorkSpaceHeight() - ( cb_add.height + 20 )
cb_delete.y		= cb_add.y	
cb_save.y		= cb_add.y	
cb_reset.y		= cb_add.y	
cb_exit.y		= cb_add.y	

pb_1.y		= This.WorkSpaceHeight() - ( cb_add.height + 50 )
pb_2.y		= pb_1.y	
pb_3.y		= pb_1.y	
pb_4.y		= pb_1.y	
pb_5.y		= pb_1.y	

//dw_1.Resize(This.WorkSpaceWidth() -  (100), &
//				dw_1.Height)

dw_1.Resize(This.WorkSpaceWidth() -  (100), &
				WorkSpaceHeight() - (sle_date.y + sle_date.height + cb_add.height + 180))

this.SetRedraw( True )
dw_1.SetRedraw( True )




SetPointer( cpOldPointer )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end event

type p_1 from picture within w_vtask_upd
integer x = 3040
integer y = 40
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "rapid_response_icon_32.jpg"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_vtask_upd
integer x = 1966
integer y = 1432
integer width = 242
integer height = 112
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if dw_1.ModifiedCount() > 0 or dw_1.DeletedCount() > 0 then
	int Net
	Net = MessageBox("Save Changes", "Do you want to save your changes? ", Question!, YesNoCancel!, 1)
	IF Net = 1 THEN 
		wf_save()
	else
		IF Net = 3 then
			Return
		end if
	end if
END IF
close(parent)
end event

type pb_4 from picturebutton within w_vtask_upd
integer x = 1701
integer y = 1432
integer width = 242
integer height = 112
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Reset"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if dw_1.ModifiedCount() > 0 then
	dw_1.Retrieve()
	RowLastSaved = dw_1.RowCount()
end if
end event

type pb_3 from picturebutton within w_vtask_upd
integer x = 1435
integer y = 1432
integer width = 242
integer height = 112
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Save"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if dw_1.ModifiedCount() <> 0 then
	wf_save()
	RowLastSaved = dw_1.RowCount()
else
	MessageBox("No changed","No change is detected!")
end if
end event

type pb_2 from picturebutton within w_vtask_upd
integer x = 1152
integer y = 1432
integer width = 265
integer height = 112
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Delete"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;int net
string taskid
if dw_1.GetRow() > 0 then
	taskid = dw_1.GetItemString(dw_1.GetRow(),"task_id")
	if dw_1.GetRow() <= RowLastSaved then
		RowLastSaved = RowLastSaved - 1
	end if
	net = MessageBox("Confirmation", "Do you want to delete task id: " + taskid + " ",&
		Question!, YesNo!,2)
	if net = 1 then //delete
		dw_1.DeleteRow(dw_1.GetRow())
		delete from vtasks where task_id = :taskid;
		if sqlca.sqlcode <> 0 then
			egm_sqlerror ( sqlca )
//			MessageBox("DB Error","Delete record: " + taskid + " failed")
		end if 
		lastId = dw_1.GetItemString(dw_1.RowCount(),"task_id")
	end if
end if
end event

type pb_1 from picturebutton within w_vtask_upd
integer x = 891
integer y = 1432
integer width = 242
integer height = 112
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Add"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if dw_1.ModifiedCount() <> 0 then
	wf_save()
	RowLastSaved = dw_1.RowCount()
end if
dw_1.InsertRow(0)
dw_1.ScrollToRow(dw_1.RowCount())
dw_1.SetColumn("problem_number")
dw_1.SetFocus()
dwc_subtaskno.SetFilter("")
dwc_subtaskno.Filter()
end event

type cb_1 from commandbutton within w_vtask_upd
boolean visible = false
integer x = 2629
integer y = 48
integer width = 261
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "test"
end type

event clicked;messagebox('task_id',f_get_next_vtask_id(sle_1.text,sle_2.text))
end event

type dw_2 from datawindow within w_vtask_upd
boolean visible = false
integer x = 2560
integer y = 1360
integer width = 448
integer height = 100
integer taborder = 20
string dataobject = "d_vtask_rpt"
boolean livescroll = true
end type

type sle_date from singlelineedit within w_vtask_upd
integer x = 46
integer y = 56
integer width = 293
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 134217728
string text = "Telephone Interface Task Codes"
boolean border = false
boolean autohscroll = false
end type

type st_1 from statictext within w_vtask_upd
integer x = 928
integer y = 48
integer width = 1225
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 27354725
long backcolor = 134217728
boolean enabled = false
string text = "Telephone Interface Task Codes"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_exit from commandbutton within w_vtask_upd
boolean visible = false
integer x = 2185
integer y = 1368
integer width = 274
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "E&xit"
boolean cancel = true
end type

on clicked;if dw_1.ModifiedCount() > 0 or dw_1.DeletedCount() > 0 then
	int Net
	Net = MessageBox("Save Changes", "Do you want to save your changes? ", Question!, YesNoCancel!, 1)
	IF Net = 1 THEN 
		wf_save()
	else
		IF Net = 3 then
			Return
		end if
	end if
END IF
close(parent)
end on

type cb_reset from commandbutton within w_vtask_upd
boolean visible = false
integer x = 1797
integer y = 1368
integer width = 274
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Reset"
end type

on clicked;if dw_1.ModifiedCount() > 0 then
	dw_1.Retrieve()
	RowLastSaved = dw_1.RowCount()
end if
end on

type cb_delete from commandbutton within w_vtask_upd
boolean visible = false
integer x = 1051
integer y = 1368
integer width = 274
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Delete"
end type

on clicked;int net
string taskid
if dw_1.GetRow() > 0 then
	taskid = dw_1.GetItemString(dw_1.GetRow(),"task_id")
	if dw_1.GetRow() <= RowLastSaved then
		RowLastSaved = RowLastSaved - 1
	end if
	net = MessageBox("Confirmation", "Do you want to delete task id: " + taskid + " ",&
		Question!, YesNo!,2)
	if net = 1 then //delete
		dw_1.DeleteRow(dw_1.GetRow())
		delete from vtasks where task_id = :taskid;
		if sqlca.sqlcode <> 0 then
			egm_sqlerror ( sqlca )
//			MessageBox("DB Error","Delete record: " + taskid + " failed")
		end if 
		lastId = dw_1.GetItemString(dw_1.RowCount(),"task_id")
	end if
end if
end on

type cb_save from commandbutton within w_vtask_upd
boolean visible = false
integer x = 1422
integer y = 1368
integer width = 274
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Save"
end type

on clicked;if dw_1.ModifiedCount() <> 0 then
	wf_save()
	RowLastSaved = dw_1.RowCount()
else
	MessageBox("No changed","No change is detected!")
end if
end on

type cb_add from commandbutton within w_vtask_upd
boolean visible = false
integer x = 681
integer y = 1368
integer width = 274
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Add"
end type

event clicked;if dw_1.ModifiedCount() <> 0 then
	wf_save()
	RowLastSaved = dw_1.RowCount()
end if
dw_1.InsertRow(0)
dw_1.ScrollToRow(dw_1.RowCount())
dw_1.SetColumn("problem_number")
dw_1.SetFocus()
dwc_subtaskno.SetFilter("")
dwc_subtaskno.Filter()
end event

type dw_1 from datawindow within w_vtask_upd
integer x = 5
integer y = 196
integer width = 3392
integer height = 1132
integer taborder = 10
string dataobject = "d_vtask"
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;string changedColname, subTaskFilter, newIdStr, task, subtask, findStr, taskno, subtaskno, nvid
int newId, descRow
long dup
changedColName = this.GetColumnName()

CHOOSE CASE changedColName
	CASE "task_id"
		if dw_1.GetRow() <= RowLastSaved then
			MessageBox("Error","An established task id can't be changed !")
//			dw_1.SetActionCode(2)  //refused change and set column value be to original
			return 2
		end if
	CASE "problem_number"
	 	dw_1.SetItem(this.GetRow(),"subproblem_number","")
		dw_1.SetColumn("subproblem_number")
		task = dwc_taskno.GetItemString(dwc_taskno.GetRow(),"problem_desc")
		this.SetItem(this.GetRow(),"problem_problem_desc",task)
	CASE "subproblem_number"
		taskno = this.GetItemString(this.GetRow(),"problem_number")
		subtaskno = dwc_subtaskno.GetItemString(dwc_subtaskno.GetRow(),"subproblem_subproblem_number")
		dup =  wf_find_dup(taskno, subtaskno) 
		if dup > 0 then
			MessageBox("Duplicate task","TaskNo '" +taskno + "' and SubTaskNo '" + subtaskno + & 
						"' is found in Task Id: " + this.GetItemString(dup,"task_id"))
			return
		end if  

		findStr = "problem_problem_number = '" + taskno + "' and subproblem_subproblem_number = '" &
			+ subtaskno + "'"
		descRow = dwc_subtaskno.Find(findStr,1,dwc_subtaskno.RowCount())
		subtask = dwc_subtaskno.GetItemString(descRow,"subproblem_subproblem_desc")
		this.SetItem(this.GetRow(),"subproblem_subproblem_desc",subtask)
//		if IsNull(this.GetItemString(this.GetRow(),"task_id")) then
//			if this.RowCount() = 1 then
//				newId = 1
//			else
//				newId = Integer(this.GetItemString(this.GetRow()-1,"task_id")) + 1
//			end if
//			dw_1.SetItem(this.GetRow(),"task_id",string(newId,"0000"))
			nvid = f_get_next_vtask_id (taskno, subtaskno)	
			dw_1.SetItem(this.GetRow(),"task_id",nvid)
//		end if
END CHOOSE




end event

on dberror;//if sqlca.sqlerrtext = 'Transaction not connected' then
//	connect using SQLCA;
//end if
MessageBox("db error",sqlca.sqlerrtext)
end on

on retrieveend;if dw_1.RowCount() = 0 then
	return
end if
lastId = this.GetItemString(this.RowCount(),"task_id")

end on

on itemfocuschanged;string currentColName, subTaskFilter
currentColName = dw_1.GetColumnName()
if currentColName = "subproblem_number" then
	if IsNull(this.GetItemString(this.GetRow(),"problem_number")) then
		return
	end if
	dw_1.GetChild("subproblem_number",dwc_subtaskno)
	dwc_subtaskno.SetTransObject(sqlca)
	dwc_subtaskno.Retrieve()
	subTaskFilter = "problem_problem_number = '" + &
				this.GetItemString(this.GetRow(),"problem_number") + "'"
	dwc_subTaskNo.SetFilter(subTaskFilter)
	dwc_subTaskNo.Filter()

end if
end on

type sle_1 from singlelineedit within w_vtask_upd
boolean visible = false
integer x = 2011
integer y = 48
integer width = 297
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_2 from singlelineedit within w_vtask_upd
boolean visible = false
integer x = 2318
integer y = 48
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
end type

