$PBExportHeader$w_r_callsxproblemsum_new.srw
$PBExportComments$top10 summary
forward
global type w_r_callsxproblemsum_new from window
end type
type dw_2 from datawindow within w_r_callsxproblemsum_new
end type
type dw_1 from datawindow within w_r_callsxproblemsum_new
end type
end forward

global type w_r_callsxproblemsum_new from window
boolean visible = false
integer x = 5
integer y = 32
integer width = 2907
integer height = 1844
boolean titlebar = true
string title = "Calls by Top 10 Task Summary"
string menuname = "m_reports"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = minimized!
long backcolor = 79741120
string icon = "Report.ico"
event ue_sharedataon ( unsignedlong wparam,  long lparam )
event ue_sharedataoff ( unsignedlong wparam,  long lparam )
event ue_printreport ( unsignedlong wparam,  long lparam )
event ue_printscreen ( unsignedlong wparam,  long lparam )
event ue_autoprint ( unsignedlong wparam,  long lparam )
event ue_saveas ( )
dw_2 dw_2
dw_1 dw_1
end type
global w_r_callsxproblemsum_new w_r_callsxproblemsum_new

type variables
string sqlWhere = ""

end variables

forward prototypes
public subroutine wf_refresh_data ()
end prototypes

event ue_sharedataon;wf_refresh_data()
integer nRetCode
string ls_rc

dw_1.modify('summary1.text = "'+ w_adhoc. is_report_parms1+'"')
dw_1.modify('summary2.text = "'+ w_adhoc. is_report_parms2+'"')


nRetCode = dw_1.ShareData( dw_2 )
If  nRetCode <> 1 Then
	MessageBox( "Data Share Error dw_2", "There was an error in an " + &
			"attempt to link the " + This.Title + " window with the " + &
			"Q&A Window.  (Error code is " + String(nRetCode) + ")", &
			StopSign! )
	Close( this )
End If

dw_2.modify('summary1.text = "'+ w_adhoc. is_report_parms1+'"')
dw_2.modify('summary2.text = "'+ w_adhoc. is_report_parms2+'"')

end event

event ue_sharedataoff;integer nResponse


nResponse = dw_2.ShareDataOff()
If  nResponse <> 1 Then
	MessageBox( "Data Share Error dw_2", "There was an error in an " + &
	"attempt to UN-link the " + This.Title + " window with the " + &
	"Q&A Window.  (Error code is " + String(nResponse) + ")", &
	StopSign! )
	Close( This )
End If
end event

event ue_printreport;dw_2.print()
end event

event ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

event ue_autoprint;PrintDataWindow( iJob, dw_2 )
end event

event ue_saveas();dw_1.SaveAs()
end event

public subroutine wf_refresh_data ();sqlWhere = Message.StringParm
string sqlStr, sqlStr1, sqlNewWhere,sqlWhere1, sqlOther,sqlNewStr, modRes
int where_len, sel_len
dw_1.SetTransObject(sqlca)
sqlStr = dw_1.describe("datawindow.table.select")
if sqlWhere <> "" then
//	MessageBox("sqlWhere",sqlWhere)
//	sqlWhere = " WHERE " + sqlWhere
end if

sel_len = pos(sqlStr,"WHERE")
where_len = pos(sqlStr,"GROUP BY")

sqlStr1 = mid(sqlStr,1,sel_len - 1) 
sqlWhere1 = mid(sqlStr,sel_len, where_len - sel_len)
sqlother = mid(sqlStr, where_len, len(sqlStr))


sqlNewWhere = sqlWhere1 + " and " + sqlWhere

sqlNewStr = "datawindow.table.select=~""+ sqlStr1 + ' ' + sqlNewWhere+ ' ' + sqlOther + "~""

modRes = dw_1.Modify(sqlNewStr)
if modRes > '' then
	Messagebox("Error","dwModify Error")
	return 
end if

//dw_1.modify('summary1.text = "'+ 'parm1'+'"')
//dw_1.modify('summary2.text = "'+ 'parm2'+'"')

dw_1.Retrieve()


end subroutine

on w_r_callsxproblemsum_new.create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on w_r_callsxproblemsum_new.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;wf_refresh_data()
//sqlWhere = Message.StringParm
//string sqlStr, sqlStr1, sqlNewWhere,sqlWhere1, sqlOther,sqlNewStr
//int where_len, sel_len
//dw_1.SetTransObject(sqlca)
//sqlStr = dw_1.describe("datawindow.table.select")
//if sqlWhere <> "" then
////	MessageBox("sqlWhere",sqlWhere)
////	sqlWhere = " WHERE " + sqlWhere
//end if
//
//sel_len = pos(sqlStr,"WHERE")
//where_len = pos(sqlStr,"GROUP BY")
//
//sqlStr1 = mid(sqlStr,1,sel_len - 1) 
//sqlWhere1 = mid(sqlStr,sel_len, where_len - sel_len)
//sqlother = mid(sqlStr, where_len, len(sqlStr))
//
//
//sqlNewWhere = sqlWhere1 + " and " + sqlWhere
//
//sqlNewStr = "datawindow.table.select=~""+ sqlStr1 + ' ' + sqlNewWhere+ ' ' + sqlOther + "~""
//
//if dw_1.Modify(sqlNewStr) > '' then
//	Messagebox("Error","dwModify Error")
//	return 
//end if
//
////dw_1.modify('summary1.text = "'+ 'parm1'+'"')
////dw_1.modify('summary2.text = "'+ 'parm2'+'"')
//
//dw_1.Retrieve()


f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")
f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")
end event

event resize;SetMicroHelp( "Resizing " + this.title + " window...please wait." )
dw_1.Move( 1, 1 )
dw_1.Resize( This.Width - 50, This.Height - 100 )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end event

type dw_2 from datawindow within w_r_callsxproblemsum_new
boolean visible = false
integer x = 411
integer y = 1224
integer width = 1893
integer height = 360
integer taborder = 20
string dataobject = "r_callsxproblemsum_rpt_new"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_r_callsxproblemsum_new
string tag = "QAReport"
integer x = 23
integer y = 16
integer width = 2825
integer height = 1540
integer taborder = 10
string dataobject = "r_callsxproblemsum_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

