$PBExportHeader$w_link_task.srw
forward
global type w_link_task from window
end type
type cb_delete from commandbutton within w_link_task
end type
type cb_cancel from commandbutton within w_link_task
end type
type cb_ok from commandbutton within w_link_task
end type
type st_2 from statictext within w_link_task
end type
type st_1 from statictext within w_link_task
end type
type dw_1 from datawindow within w_link_task
end type
end forward

global type w_link_task from window
integer width = 1865
integer height = 620
boolean titlebar = true
string title = "Link Task"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_delete cb_delete
cb_cancel cb_cancel
cb_ok cb_ok
st_2 st_2
st_1 st_1
dw_1 dw_1
end type
global w_link_task w_link_task

type variables
DataWindowChild dwc_subproblem
s_lnk_task lTask
end variables

forward prototypes
public function boolean wf_set_subtask_filter (string filtercriteria)
end prototypes

public function boolean wf_set_subtask_filter (string filtercriteria);int ret
ret=dw_1.GetChild("SUBPROBLEM_NUMBER",dwc_subproblem)
ret=dwc_subproblem.SetTransObject(sqlca)
ret=dwc_subproblem.retrieve()
ret = dwc_subproblem.SetFilter( "problem_number = '" + filterCriteria + "'" )
if ret < 0 then
	MessageBox( "Error!", "Couldn't SetFilter Subtask properly." )
	return false
end if
ret = dwc_subproblem.Filter()
if ret < 0 then
	MessageBox( "Error!", "Couldn't Filter subtask pick-list properly." )
	return false
end if
return true
end function

on w_link_task.create
this.cb_delete=create cb_delete
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.cb_delete,&
this.cb_cancel,&
this.cb_ok,&
this.st_2,&
this.st_1,&
this.dw_1}
end on

on w_link_task.destroy
destroy(this.cb_delete)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;lTask = Message.PowerObjectParm	

if lTask.title <> '' then this.title =  lTask.title //vic

if lTask.view then
	cb_ok.enabled = false
	dw_1.enabled = false
else
	cb_ok.enabled = true
	dw_1.enabled = true
end if
dw_1.SetTransObject(sqlca)
if len(trim(lTask.lnk_task)) = 0 or len(trim(lTask.lnk_subtask)) = 0 or &
	IsNull(lTask.lnk_task) or IsNull(lTask.lnk_subtask) then
	dw_1.InsertRow(0)
else
	dw_1.Retrieve(lTask.lnk_task,lTask.lnk_subtask)
	wf_set_subtask_filter(dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_NUMBER"))
end if
end event

type cb_delete from commandbutton within w_link_task
integer x = 727
integer y = 344
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Delete"
end type

event clicked;int ans
ans = MessageBox("Confirm","You're deleting the linked task! Are your sure?",&
		question!,YesNo!,2)
if ans = 2 then
	return
end if
SetNull(lTask.lnk_task)
SetNull(lTask.lnk_subtask)
CloseWithReturn(parent,lTask)


end event

type cb_cancel from commandbutton within w_link_task
integer x = 1143
integer y = 348
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Cancel"
end type

event clicked;CloseWithReturn(parent,lTask)
end event

type cb_ok from commandbutton within w_link_task
integer x = 315
integer y = 348
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Ok"
boolean default = true
end type

event clicked;if IsNull(dw_1.GetItemString(dw_1.GetRow(),'problem_number')) or &
	dw_1.GetItemString(dw_1.GetRow(),'subproblem_number') = '' then
	MessageBox("Error","Both fields must be selected or click Cancel!")
	return
end if
lTask.lnk_task=dw_1.GetItemString(dw_1.GetRow(),'problem_number')
lTask.lnk_subtask=dw_1.GetItemString(dw_1.GetRow(),'subproblem_number')
CloseWithReturn(parent,lTask)
end event

type st_2 from statictext within w_link_task
integer x = 992
integer y = 44
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sub Task"
boolean focusrectangle = false
end type

type st_1 from statictext within w_link_task
integer x = 128
integer y = 48
integer width = 402
integer height = 64
integer textsize = -10
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

type dw_1 from datawindow within w_link_task
integer x = 32
integer y = 136
integer width = 1723
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "d_link_task"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;string currentColumn, columnContent
currentColumn = Upper(dwo.Name)
if CurrentColumn = "SUBPROBLEM_NUMBER" then
		columnContent = dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_NUMBER")
		if IsNull(columnContent) then
			return
		end if
		wf_set_subtask_filter(dw_1.GetItemString(dw_1.GetRow(),"PROBLEM_NUMBER"))
end if

end event

event itemchanged;
if upper(this.GetColumnName()) = "PROBLEM_NUMBER" then
	this.SetItem(row,"subproblem_number",'')
	this.SetColumn("SUBPROBLEM_NUMBER")
end if

end event

