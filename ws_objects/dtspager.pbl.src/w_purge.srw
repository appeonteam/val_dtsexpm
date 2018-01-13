$PBExportHeader$w_purge.srw
forward
global type w_purge from Window
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

global type w_purge from Window
int X=1074
int Y=480
int Width=2546
int Height=1620
boolean TitleBar=true
string Title="Purge Paging Assignment Transaction"
string Tag="Purge Paging Assignment Transaction"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
string Icon="TRASH.ICO"
event ue_printrpt ( )
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
			ROLLBACK ;
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
uo_1.sle_date.text = string(RelativeDate(today(),-45),"mm/dd/yyyy")
dw_1.SetTransObject(sqlca)
dw_selection = dw_1.Describe("DataWindow.Table.Select")
//MessageBox("select",dw_selection)
//MessageBox("title", dw_1.Describe("DataWindow.Bands=header"))

end event

event resize;dw_1.Resize ( this.width - dwWinWidthDiff, this.height - dwWinHeightDiff ) 
end event

type dw_2 from datawindow within w_purge
int X=1115
int Y=16
int Width=494
int Height=360
int TabOrder=1
boolean Visible=false
string DataObject="d_pager_assignment_purge_rpt"
boolean LiveScroll=true
end type

type cb_2 from commandbutton within w_purge
int X=2071
int Y=136
int Width=334
int Height=108
int TabOrder=10
string Text="&Purge"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if dw_1.RowCount() <= 0 then
	MessageBox("Error","No data to delete!")
	return
end if
int res
if MessageBox("Confirm","Are you sure?",Question!,YesNo!,2) = 2 then return 
if wf_delete_trans() then 	dw_1.Retrieve()

end event

type cb_1 from commandbutton within w_purge
int X=1691
int Y=136
int Width=338
int Height=108
int TabOrder=20
string Text="&Retrieve"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if len(trim(uo_1.sle_date.text)) = 0 then
	MessageBox("Error","Please enter a date!")
	return
end if

string new_where, add_where, err,sdate
date ldt_date

ldt_date = uo_1.getselecteddate()
//sdate = mid(uo_1.sle_date.text,7,4) + "/" + mid(uo_1.sle_date.text,1,5)
sdate = string( year (ldt_date)) +'/' + string( month(ldt_date)) + '/' + string(day(ldt_date))
sdate = sdate + ' 23:59:59'
add_where = ' and convert(datetime,~~"pageassignment~~".~~"time_completed~~") &
	<= convert(datetime,~'' + sdate + "')";

new_where = dw_selection + add_where
//	MessageBox("new where",new_where)
err = dw_1.Modify('DataWindow.Table.Select="'+new_where+'"')
if err <> "" then
	MessageBox("DW Modify Error",err)
	return
end if
dw_1.Retrieve()
end event

type dw_1 from datawindow within w_purge
int X=18
int Y=288
int Width=2459
int Height=1188
int TabOrder=40
string DataObject="d_pager_assignment"
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

type st_1 from statictext within w_purge
int X=41
int Y=152
int Width=645
int Height=72
boolean Enabled=false
string Text="Purge Before Date of:"
boolean FocusRectangle=false
long BackColor=80269528
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type uo_1 from u_ddcal within w_purge
int X=686
int Y=140
int Width=448
int Height=104
int TabOrder=30
long BackColor=80269528
end type

on uo_1.destroy
call u_ddcal::destroy
end on

