$PBExportHeader$w_purge.srw
forward
global type w_purge from window
end type
type dw_2 from datawindow within w_purge
end type
type cb_2 from commandbutton within w_purge
end type
type cb_1 from commandbutton within w_purge
end type
type dw_1 from datawindow within w_purge
end type
type st_1 from statictext within w_purge
end type
type uo_1 from u_ddcal within w_purge
end type
end forward

global type w_purge from window
string tag = "Purge Paging Assignment Transaction"
integer x = 1074
integer y = 480
integer width = 2546
integer height = 1620
boolean titlebar = true
string title = "Purge Paging Transaction"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
string icon = "TRASH.ICO"
event ue_printrpt ( )
event ue_printreport ( )
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
st_1 st_1
uo_1 uo_1
end type
global w_purge w_purge

type variables
string dw_selection
long dwWinWidthDiff
long dwWinHeightDiff
end variables

forward prototypes
public function boolean wf_delete_trans ()
end prototypes

event ue_printrpt;dw_1.ShareData(dw_2)
f_mod_dw_dt_disp (dw_2,"rptdate")
dw_2.print()
end event

event ue_printreport;dw_1.ShareData(dw_2)
f_mod_dw_dt_disp (dw_2,"rptdate")
dw_2.print()
end event

public function boolean wf_delete_trans ();string assId
int i, j
i=1
j=dw_1.RowCount()
do while i <= j
	  assId = dw_1.GetItemString(i,"assignment_id")
//	  MessageBox("delete",assId)
	  DELETE FROM "pageassignment"  
   	WHERE "pageassignment"."assignment_id" = :assId   ;
		if sqlca.sqlcode < 0 then
			MessageBox("DB Error",sqlca.sqlerrtext)
			return false
		end if
	i++
loop

commit;
return true
end function

on w_purge.create
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_1=create st_1
this.uo_1=create uo_1
this.Control[]={this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.st_1,&
this.uo_1}
end on

on w_purge.destroy
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.uo_1)
end on

event open;dwWinHeightDiff = this.height - dw_1.height
dwWinWidthDiff = this.width - dw_1.width
uo_1.sle_date.text = string(RelativeDate(today(),-45),cDateFormatStr)
dw_1.SetTransObject(sqlca)
dw_selection = dw_1.Describe("DataWindow.Table.Select")
//MessageBox("select",dw_selection)
//MessageBox("title", dw_1.Describe("DataWindow.Bands=header"))

end event

event resize;dw_1.Resize ( this.width - dwWinWidthDiff, this.height - dwWinHeightDiff ) 
end event

type dw_2 from datawindow within w_purge
boolean visible = false
integer x = 128
integer y = 448
integer width = 2181
integer height = 948
integer taborder = 1
string dataobject = "d_pager_assignment_purge_rpt"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_purge
integer x = 2071
integer y = 132
integer width = 334
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Purge"
end type

event clicked;if dw_1.RowCount() = 0 then
	MessageBox("Error","No data to delete!")
	return
end if
int res
res = MessageBox("Confirm","Are you sure?",Question!,YesNo!,2)
if res = 2 then
	return
else
	if wf_delete_trans() then
		dw_1.Retrieve()
	end if
end if
end event

type cb_1 from commandbutton within w_purge
integer x = 1691
integer y = 136
integer width = 338
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Retrieve"
end type

event clicked;int firstWhereStart
string firstHalf, secondHalf
if len(trim(uo_1.sle_date.text)) = 0 then
	MessageBox("Error","Please enter a date!")
	return
end if

string new_where, add_where, err,sdate

//sdate = mid(uo_1.sle_date.text,7,4) + "/" + mid(uo_1.sle_date.text,1,5)
 
sdate = string(f_str_d_to_d(uo_1.sle_date.text),"yyyy/mm/dd")

add_where = ' and convert(datetime,~~"pageassignment~~".~~"time_completed~~") &
	<= convert(datetime,~'' + sdate + "')";

firstWhereStart = pos(dw_selection,'union')
firstHalf = mid(dw_selection,1,firstWhereStart - 1)
secondHalf = mid(dw_selection,firstWhereStart)
firstHalf = firstHalf + " " + add_where
secondHalf = secondHalf + add_where
new_where = firstHalf+secondHalf
//new_where = dw_selection + add_where
//MessageBox("new where",new_where)
err = dw_1.Modify('DataWindow.Table.Select="'+new_where+'"')
if err <> "" then
	MessageBox("DW Modify Error",err)
	return
end if
dw_1.Retrieve()
parent.WindowState = Maximized!
end event

type dw_1 from datawindow within w_purge
integer x = 18
integer y = 288
integer width = 2459
integer height = 1188
integer taborder = 40
string dataobject = "d_pager_assignment"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type st_1 from statictext within w_purge
integer x = 105
integer y = 152
integer width = 594
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 134217750
boolean enabled = false
string text = "Purge Before Date of:"
boolean focusrectangle = false
end type

type uo_1 from u_ddcal within w_purge
integer x = 686
integer y = 140
integer width = 439
integer height = 104
integer taborder = 30
long backcolor = 134217750
end type

on uo_1.destroy
call u_ddcal::destroy
end on

