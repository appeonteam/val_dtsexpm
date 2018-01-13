$PBExportHeader$w_r_callsxproblemsum_top10.srw
forward
global type w_r_callsxproblemsum_top10 from Window
end type
type dw_2 from datawindow within w_r_callsxproblemsum_top10
end type
type dw_1 from datawindow within w_r_callsxproblemsum_top10
end type
end forward

global type w_r_callsxproblemsum_top10 from Window
int X=5
int Y=32
int Width=2976
int Height=1812
boolean Visible=false
boolean TitleBar=true
string Title="Calls by Top 10 Task Summary"
string MenuName="m_reports"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
WindowState WindowState=minimized!
string Icon="Report.ico"
event ue_sharedataon ( unsignedlong wparam,  long lparam )
event ue_sharedataoff ( unsignedlong wparam,  long lparam )
event ue_printreport ( unsignedlong wparam,  long lparam )
event ue_printscreen ( unsignedlong wparam,  long lparam )
event ue_autoprint ( unsignedlong wparam,  long lparam )
dw_2 dw_2
dw_1 dw_1
end type
global w_r_callsxproblemsum_top10 w_r_callsxproblemsum_top10

type variables
string sqlWhere = ""

end variables

event ue_sharedataon;integer nRetCode
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

on w_r_callsxproblemsum_top10.create
if this.MenuName = "m_reports" then this.MenuID = create m_reports
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on w_r_callsxproblemsum_top10.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;sqlWhere = Message.StringParm
string sqlStr, sqlStr1, sqlNewWhere,sqlWhere1, sqlOther,sqlNewStr
int where_len, sel_len

dw_1.SetTransObject(sqlca)
sqlStr = dw_1.describe("datawindow.table.select")
MessageBox("sqlStr",sqlStr)
//if sqlWhere <> "" then
////	MessageBox("sqlWhere",sqlWhere)
//	sqlWhere = " WHERE " + sqlWhere
//end if
//
//sel_len = pos(sqlStr,"GROUP BY")
//
//sqlStr1 = mid(sqlStr,1,sel_len - 1) 
//
//sqlother = mid(sqlStr, sel_len, len(sqlStr))
//
//sqlNewWhere = sqlWhere
//
//sqlNewStr = "datawindow.table.select=~""+ sqlStr1 + ' ' + sqlNewWhere+ ' ' + sqlOther + "~""
//
//if dw_1.Modify(sqlNewStr) > '' then
//	Messagebox("Error","dwModify Error")
//	return 
//end if

//dw_1.modify('summary1.text = "'+ 'parm1'+'"')
//dw_1.modify('summary2.text = "'+ 'parm2'+'"')

f_mod_rpt_dw_d_disp(dw_1,"fromdate")
f_mod_rpt_dw_d_disp(dw_2,"fromdate")
f_mod_rpt_dw_d_disp(dw_1,"todate")
f_mod_rpt_dw_d_disp(dw_2,"todate")

f_mod_rpt_dw_ld_disp(dw_1,"rpttoday")
f_mod_rpt_dw_ld_disp(dw_2,"rpttoday")

dw_1.Retrieve()




end event

event resize;SetMicroHelp( "Resizing " + this.title + " window...please wait." )
dw_1.Move( 1, 1 )
dw_1.Resize( This.Width - 50, This.Height - 100 )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end event

type dw_2 from datawindow within w_r_callsxproblemsum_top10
int X=411
int Y=1224
int Width=1893
int Height=360
int TabOrder=20
boolean Visible=false
string DataObject="r_callsxproblemsum_rpt_new"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_1 from datawindow within w_r_callsxproblemsum_top10
int X=23
int Y=16
int Width=2885
int Height=1512
int TabOrder=10
string Tag="QAReport"
string DataObject="r_callsxproblemsum_top10"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

