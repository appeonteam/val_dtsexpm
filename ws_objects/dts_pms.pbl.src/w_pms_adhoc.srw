$PBExportHeader$w_pms_adhoc.srw
forward
global type w_pms_adhoc from window
end type
type p_8 from picture within w_pms_adhoc
end type
type p_7 from picture within w_pms_adhoc
end type
type p_6 from picture within w_pms_adhoc
end type
type p_5 from picture within w_pms_adhoc
end type
type p_4 from picture within w_pms_adhoc
end type
type p_3 from picture within w_pms_adhoc
end type
type p_2 from picture within w_pms_adhoc
end type
type p_1 from picture within w_pms_adhoc
end type
type uo_retcode from u_multi_select_01 within w_pms_adhoc
end type
type uo_block_code from u_multi_select_01 within w_pms_adhoc
end type
type uo_company from u_multi_select_01 within w_pms_adhoc
end type
type dw_1 from uo_vzt_dwbase within w_pms_adhoc
end type
type cb_2 from commandbutton within w_pms_adhoc
end type
type cb_1 from commandbutton within w_pms_adhoc
end type
type uo_room from u_multi_select_01 within w_pms_adhoc
end type
type uo_status from u_multi_select_01 within w_pms_adhoc
end type
type uo_timer_start_to_date from u_ddcal within w_pms_adhoc
end type
type st_21 from statictext within w_pms_adhoc
end type
type uo_timer_start_from_date from u_ddcal within w_pms_adhoc
end type
type st_8 from statictext within w_pms_adhoc
end type
type lb_reports from listbox within w_pms_adhoc
end type
type uo_shift from u_multi_select_01 within w_pms_adhoc
end type
type uo_closed_by from u_multi_select_01 within w_pms_adhoc
end type
type uo_employee from u_multi_select_01 within w_pms_adhoc
end type
type uo_closed_bydept from u_multi_select_01 within w_pms_adhoc
end type
type uo_subproblem from u_multi_select_01 within w_pms_adhoc
end type
type uo_problem from u_multi_select_01 within w_pms_adhoc
end type
type uo_receivedby from u_multi_select_01 within w_pms_adhoc
end type
type uo_guestcaller from u_multi_select_01 within w_pms_adhoc
end type
type uo_callercat from u_multi_select_01 within w_pms_adhoc
end type
type uo_ddcal_closedate_to from u_ddcal within w_pms_adhoc
end type
type uo_ddcal_closedate_from from u_ddcal within w_pms_adhoc
end type
type uo_ddcal_opendate_to from u_ddcal within w_pms_adhoc
end type
type uo_ddcal_opendate_from from u_ddcal within w_pms_adhoc
end type
type cb_clear from commandbutton within w_pms_adhoc
end type
type cb_view from commandbutton within w_pms_adhoc
end type
type cb_exit from commandbutton within w_pms_adhoc
end type
type st_15 from statictext within w_pms_adhoc
end type
type st_14 from statictext within w_pms_adhoc
end type
type st_13 from statictext within w_pms_adhoc
end type
type st_4 from statictext within w_pms_adhoc
end type
type st_24 from statictext within w_pms_adhoc
end type
type st_23 from statictext within w_pms_adhoc
end type
type st_19 from statictext within w_pms_adhoc
end type
type st_18 from statictext within w_pms_adhoc
end type
type st_16 from statictext within w_pms_adhoc
end type
type em_timeofday_to from editmask within w_pms_adhoc
end type
type em_timemin_to from editmask within w_pms_adhoc
end type
type em_timeofday_from from editmask within w_pms_adhoc
end type
type em_timemin_from from editmask within w_pms_adhoc
end type
type st_5 from statictext within w_pms_adhoc
end type
type st_12 from statictext within w_pms_adhoc
end type
type st_11 from statictext within w_pms_adhoc
end type
type st_10 from statictext within w_pms_adhoc
end type
type st_9 from statictext within w_pms_adhoc
end type
type em_callnum_to from editmask within w_pms_adhoc
end type
type em_callnum_from from editmask within w_pms_adhoc
end type
type cb_exitgraph from commandbutton within w_pms_adhoc
end type
type lb_graphs from listbox within w_pms_adhoc
end type
type st_1 from statictext within w_pms_adhoc
end type
type st_2 from statictext within w_pms_adhoc
end type
type dw_graph from datawindow within w_pms_adhoc
end type
end forward

global type w_pms_adhoc from window
boolean visible = false
integer x = 352
integer y = 412
integer width = 1714
integer height = 1572
boolean titlebar = true
string title = "Q&A - Query"
string menuname = "m_adhoc"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
long backcolor = 134217750
string icon = "QA01.ICO"
event ue_loadfile pbm_custom01
event ue_savefile pbm_custom02
event ue_run pbm_custom03
event ue_clear pbm_custom04
event ue_printscreen pbm_custom05
event ue_cancelquery pbm_custom06
event ue_postopen pbm_custom07
event ue_loadfilea pbm_custom08
event ue_loadfileb pbm_custom09
p_8 p_8
p_7 p_7
p_6 p_6
p_5 p_5
p_4 p_4
p_3 p_3
p_2 p_2
p_1 p_1
uo_retcode uo_retcode
uo_block_code uo_block_code
uo_company uo_company
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
uo_room uo_room
uo_status uo_status
uo_timer_start_to_date uo_timer_start_to_date
st_21 st_21
uo_timer_start_from_date uo_timer_start_from_date
st_8 st_8
lb_reports lb_reports
uo_shift uo_shift
uo_closed_by uo_closed_by
uo_employee uo_employee
uo_closed_bydept uo_closed_bydept
uo_subproblem uo_subproblem
uo_problem uo_problem
uo_receivedby uo_receivedby
uo_guestcaller uo_guestcaller
uo_callercat uo_callercat
uo_ddcal_closedate_to uo_ddcal_closedate_to
uo_ddcal_closedate_from uo_ddcal_closedate_from
uo_ddcal_opendate_to uo_ddcal_opendate_to
uo_ddcal_opendate_from uo_ddcal_opendate_from
cb_clear cb_clear
cb_view cb_view
cb_exit cb_exit
st_15 st_15
st_14 st_14
st_13 st_13
st_4 st_4
st_24 st_24
st_23 st_23
st_19 st_19
st_18 st_18
st_16 st_16
em_timeofday_to em_timeofday_to
em_timemin_to em_timemin_to
em_timeofday_from em_timeofday_from
em_timemin_from em_timemin_from
st_5 st_5
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
em_callnum_to em_callnum_to
em_callnum_from em_callnum_from
cb_exitgraph cb_exitgraph
lb_graphs lb_graphs
st_1 st_1
st_2 st_2
dw_graph dw_graph
end type
global w_pms_adhoc w_pms_adhoc

type variables
u_multi_select_01 		iuo_multi_select[]
string cGraphsAvail[]
string cReportsAvail[]
window RW2Use[]
string sRW2Use[]
w_graph_sheet_using_dw GW2Use[]
string sGW2Use[]
string cFile2Load = Space(256)
string cPath2Load = Space(256)
string cFile2Save = Space(256)
string cPath2Save = Space(256)
integer nPassLevelOpenedWith=0
long nRowCtr, nTotRows, nRowEvery
string cAdHocFilt
string cOrigSql
string newsqlcnt
string cStatcode[]
boolean lb_stat_built
boolean lb_room_built
string cStatdesc[]
string cRoomcode[]
string cRoomdesc[]
string cAdHocStat
string cAdHocRoom
integer cStat_max
integer cRoom_max
string cReportType
//integer ijob
String is_report_parms1 , is_report_parms2

// SFM 1/21/97 
Boolean ib_closedcalls   = FALSE
Boolean ib_pendingcalls = FALSE
Boolean ib_TimerCalls    = FALSE

//SFM 6/30/97
u_secondtrans it_trans

boolean autoLoad = false

string task
string subtask
datetime indate
datetime outdate

end variables

forward prototypes
public subroutine setbuttons (boolean lgraphmode)
public subroutine wf_set_button (integer onoff_sw)
public function boolean wf_dwmodify (string adhocstring)
public function boolean wf_load_stat_array ()
public function boolean wf_load_stat_lb ()
public function boolean wf_load_room_lb ()
public function string wf_search_lb_by_code (string lb_nm, string lb_code, string array_code_in[], string array_desc_in[])
public function string wf_search_lb_by_desc (string lb_nm, string lb_desc, string array_code_in[], string array_desc_in[])
public subroutine wf_highlight_selected_stat (ref listbox lb_in, string adhoc_in, string code_in)
public subroutine wf_clear_lb_selected (ref listbox lb_in)
public subroutine wf_close_lb_stat ()
public subroutine wf_open_lb_stat ()
public subroutine wf_build_report_string (ref string ls_hold, ref integer li_cnt)
public subroutine wf_check_status ()

public function string wf_build_new_select (string as_sql)
public function string wf_shift_short_desc (string shiftnum)
public function string wf_mssql_buildrestrictions ()
public function string wf_watcom_buildrestrictions ()
end prototypes

event ue_run;
cb_view.TriggerEvent('clicked')

end event

event ue_clear;pointer pOldPointer
integer niCtr

SetMicroHelp( "Clearing specified criteria and selected graphs and reports...please wait." )
if autoLoad = false then
	niCtr = MessageBox( "Clear Q&A Ad-Hoc Criteria?", "Would you like to CLEAR all specified Q&A query " + &
							"Ad-Hoc Criteria and all Opened Report(s)?", &
							Question!, YesNo!, 2 )
else
	niCtr = 1
end if
If niCtr = 1 Then
	pOldPointer = SetPointer( HourGlass! )
	em_callnum_from.Text 						= ""
	em_callnum_to.Text 							= ""
	uo_ddcal_opendate_from.sle_date.Text 	= ""
	uo_ddcal_opendate_to.sle_date.Text 		= ""
	uo_ddcal_closedate_from.sle_date.Text 	= ""
	uo_ddcal_closedate_to.sle_date.Text 	= ""
	uo_timer_start_from_date.sle_date.Text = ""
	uo_timer_start_to_date.sle_date.Text 	= ""
	em_timemin_from.Text 						= ""
	em_timemin_to.Text 							= ""
	em_timeofday_from.Text 						= "00:00"
	em_timeofday_to.Text 						= "00:00"

//	uo_status.cCriteria 							= ""
//	uo_status.uo_ddlb_1.Text 					= "[All]"
//   uo_status.uf_clear_selected()
//	cAdHocStat 										= ""
////	ddlb_stat.text = "[All]"
//	uo_room.cCriteria 							= ""
//   uo_room.uf_clear_selected()
//	cAdHocRoom 										= ""
////	ddlb_room.text = "[All]"
//	uo_room.uo_ddlb_1.Text 						= "[All]"
//	uo_shift.cCriteria 							= ""
//	uo_shift.uo_ddlb_1.Text 					= "[All]"
//   uo_shift.uf_clear_selected()
//	uo_callercat.cCriteria 						= ""
//	uo_callercat.uo_ddlb_1.Text 				= "[All]"
//   uo_callercat.uf_clear_selected()
//	uo_guestcaller.cCriteria 					= ""
//	uo_guestcaller.uo_ddlb_1.Text 			= "[All]"
//   uo_guestcaller.uf_clear_selected()
//	uo_receivedby.cCriteria 					= ""
//	uo_receivedby.uo_ddlb_1.Text 				= "[All]"
//   uo_receivedby.uf_clear_selected()
//	uo_problem.cCriteria 						= ""
//	uo_problem.uo_ddlb_1.Text 					= "[All]"
//   uo_problem.uf_clear_selected()
//
//	uo_subproblem.cCriteria 					= ""
//	uo_subproblem.uo_ddlb_1.Text 				= "[All]"
//   uo_subproblem.uf_clear_selected()
//	
//	uo_closed_bydept.cCriteria 				= ""
//	uo_closed_bydept.uo_ddlb_1.Text 			= "[All]"
//   uo_closed_bydept.uf_clear_selected()
//	
//	uo_employee.cCriteria 						= ""
//	uo_employee.uo_ddlb_1.Text 				= "[All]"
//   uo_employee.uf_clear_selected()
//	
//	uo_closed_by.cCriteria 						= ""
//	uo_closed_by.uo_ddlb_1.Text 				= "[All]"
//   uo_closed_by.uf_clear_selected()
//	
int li_obj
For li_obj = 1 to UpperBound( iuo_multi_select[]) 
	iuo_multi_select[li_obj].uf_clear_selected()
Next


//End If
//niCtr = MessageBox( "Close Report and Graph Windows?", "Would you like to CLOSE " + &
//							"all Open Q&A query Graph and Report Windows?", &
//							Question!, YesNo!, 2 )
//If niCtr = 1 Then

	For niCtr = 1 To UpperBound( GW2Use )
		If IsValid( GW2Use[niCtr] ) Then
			Close( GW2Use[niCtr] )
		End If
	Next
	For niCtr = 1 To UpperBound( RW2Use )
		If IsValid( RW2Use[niCtr] ) Then
			Close( RW2Use[niCtr] )
		End If
	Next
//End If
//
//niCtr = MessageBox( "Clear Q&A Report and Graph Selections?", "Would you like to CLEAR " + &
//							"all Selected Q&A query Graphs and Reports from the appropriate " + &
//							"List-Boxes?", &
//							Question!, YesNo!, 2 )
//If niCtr = 1 Then


//	// PMS: no graphs
//	For niCtr = 1 To lb_graphs.TotalItems()
//		lb_graphs.SetState( niCtr, False )
//	Next
//	// PMS: 1 report
//	For niCtr = 1 To lb_reports.TotalItems()
//		lb_reports.SetState( niCtr, False )
//	Next
//
//	wf_clear_lb_selected(lb_stat)
//	wf_clear_lb_selected(lb_room)
	
	SetPointer( pOldPointer )
	w_main.ArrangeSheets( Tile! )
	w_main.ArrangeSheets( Icons! )

End If

SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
end event

on ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end on

event ue_cancelquery;SetMicroHelp( "Q&A Session - Full retrieval ABORTED BY USER.  Retrieved a total of " &
					+ String( nRowCtr ) + " rows." )
//      dtEarliestDate = 
Beep( 1 )
MessageBox( "Retrieval Aborted by User", "The Q&A Session data retrieval in progress " + &
			"was aborted.  A total of [" + String( nRowCtr ) + "] " + &
			"rows of a possible " + String(nTotRows) + " were retrieved.", StopSign! )

dw_graph.dbcancel()


end event

event ue_postopen;// 10/21/97 create instance transaction uo

it_trans = create u_secondtrans
IF it_trans.uof_init() < 1 THEN
	close(this)
	return
END IF

dw_graph.SetTransobject(it_trans)

end event

public subroutine setbuttons (boolean lgraphmode);If lGraphMode Then
	// Graph Mode buttons
	// non-Graph Mode buttons

	cb_view.Enabled = False
	cb_exit.Enabled = False
	cb_clear.Enabled = False

Else	// not graph mode
	// Graph Mode buttons
	// non-Graph Mode buttons

	cb_view.Enabled = True
	cb_exit.Enabled = True
	cb_clear.Enabled = True

End If
end subroutine

public subroutine wf_set_button (integer onoff_sw);if onoff_sw = 0  then // button disable
	cb_view.enabled = false

	cb_clear.enabled = false
	cb_exit.enabled = false

else
	cb_view.enabled = true

	cb_clear.enabled = true
	cb_exit.enabled = true

end if	
end subroutine

public function boolean wf_dwmodify (string adhocstring);string dwsqlstring, sqlstring, sqlselect, sqlwhere, sqlwhere1, sqlwhere2, sqlorder, sumOrigSql
integer sel_len, where_len, order_len
string  new, newsql,origsql
//sqlstring = buildadhocstring2 ( )

//*  Reset to original Datawindow sql select
origsql = "datawindow.table.select=~""+cOrigSql+"~""
if dw_graph.Modify(origsql) > '' then
	Messagebox("Error","dwModify Error")
	return false
end if

//sumOrigSql = "datawindow.table.select=~""+cOrigSql+"~""
//if dw_graph.Modify(origsql) > '' then
//	Messagebox("Error","dwModify Error")
//	return false
//end if

sqlstring = trim(adhocstring)

dwsqlstring = dw_graph.describe("datawindow.table.select")

sel_len = pos(dwsqlstring,"WHERE ")
where_len = pos(dwsqlstring,"ORDER BY")

sqlselect = mid(dwsqlstring,1,sel_len - 1) 

sqlwhere1 = mid(dwsqlstring, sel_len , where_len - sel_len - 1)

sqlorder = mid(dwsqlstring, where_len, len(dwsqlstring))

// SFM 2/21/96 FIX - invalid sql statment when no adhoc string is present
IF len(sqlstring) > 0 THEN
   sqlwhere2 = "  and " + sqlstring 
END IF

sqlwhere = sqlwhere1 + sqlwhere2


// 1/21/97 SFM do not replace order clause (union sql
// all report datawindows are sorted in their activate event
// server sort is redundant

//newsql =  sqlselect + sqlwhere + " " + sqlorder 
  newsql =  sqlselect + sqlwhere 

// 1/21/97 SFM checks instance booleans and builds new select statment
newsql = wf_build_new_select(newsql)



newsqlcnt = sqlwhere
newsql = "datawindow.table.select=~""+newsql+"~""
//messagebox("newsql",newsql)
new = dw_graph.modify(newsql)
if len(new) > 0 then
	MessageBox("Error","dwModify error: " + new)
	return false
end if

return true
end function

public function boolean wf_load_stat_array ();//int stat_max, room_max, stat_cnt, room_cnt
//
//select count(*) into :stat_max from callstat;
//if sqlca.sqlcode <> 0 then
//	MessageBox("DB Error","Load stat array error: " + sqlca.sqlerrtext)
//	return false
//end if
//
//cStatcode[stat_max] = ''
//cStatdesc[stat_max] = ''
//stat_cnt = 1
//DECLARE stat_cursor CURSOR FOR 
//	select stat_code, stat_desc from callstat
//		order by stat_desc;
//
//OPEN stat_cursor;  
//if sqlca.sqlcode < 0 then
//	MessageBox("DB Error!", sqlca.sqlerrtext)
//	return false
//end if 
//
//Do While sqlca.sqlcode = 0
//	Fetch stat_cursor into :cStatcode[stat_cnt], 
//								  :cStatdesc[stat_cnt];
//	stat_cnt = stat_cnt + 1
//loop
//
//close stat_cursor;

return true

end function

public function boolean wf_load_stat_lb ();//if lb_stat_built then
//	return true
//end if
//int  stat_cnt
//
//select count(*) into :cStat_max from callstat;
//if sqlca.sqlcode <> 0 then
//	MessageBox("DB Error","Load stat array error: " + sqlca.sqlerrtext)
//	return false
//end if
//
//cStatcode[cStat_max] = ''
//cStatdesc[cStat_max] = ''
//
//stat_cnt = 1
//DECLARE stat_cursor CURSOR FOR 
//  SELECT DISTINCT "opencall"."stat_code",   
//         "callstat"."stat_desc"  
//    FROM "opencall",   
//         "callstat"  
//   WHERE ( "opencall"."stat_code" = "callstat"."stat_code" )   
//	ORDER BY "callstat"."stat_desc" ASC;   
//
//OPEN stat_cursor;  
//if sqlca.sqlcode < 0 then
//	MessageBox("DB Error!", sqlca.sqlerrtext)
//	return false
//end if 
//
//stat_cnt = 1
//Do While sqlca.sqlcode = 0
//	Fetch stat_cursor into :cstatcode[stat_cnt], 
//								  :cstatdesc[stat_cnt];
//	if sqlca.sqlcode = 0 then
//		lb_stat.Additem(cstatdesc[stat_cnt])
//		stat_cnt = stat_cnt + 1
//	end if
//loop
//
//close stat_cursor;
//
//lb_stat_built = true
return true

end function

public function boolean wf_load_room_lb ();//if lb_room_built then
//	return true
//end if
//string roomcode, roomdesc
//int cnt
//
//select count(*) into :cRoom_max from area;
//if sqlca.sqlcode <> 0 then
//	MessageBox("DB Error","Load room array error: " + sqlca.sqlerrtext)
//	return false
//end if
//
//cRoomcode[cRoom_max] = ''
//cRoomdesc[cRoom_max] = ''
//
//
//DECLARE room_cursor CURSOR FOR 
//  SELECT DISTINCT "opencall"."room", "area"."area_name" 
//    FROM "opencall",   
//         "area"  
//   WHERE ( "opencall"."room" = "area"."area_number" )   
//	ORDER BY "area"."area_name" ASC;   
//
//OPEN room_cursor;  
//if sqlca.sqlcode < 0 then
//	MessageBox("DB Error!", sqlca.sqlerrtext)
//	return false
//end if 
//
//cnt = 1
//Do While sqlca.sqlcode = 0
//	Fetch room_cursor into :cRoomcode[cnt], 
//								  :cRoomdesc[cnt];
//	if sqlca.sqlcode = 0 then
//		lb_room.Additem(cRoomdesc[cnt])
//		cnt = cnt + 1
//	end if
//loop
//
//close room_cursor;
//
//lb_room_built = true
return true

end function

public function string wf_search_lb_by_code (string lb_nm, string lb_code, string array_code_in[], string array_desc_in[]);boolean bFound_code
int cnt, max_cnt
string sFound_desc
max_cnt = 0
bFound_code = false
sFound_desc = ''

if lb_nm = 'stat' then
	max_cnt = cstat_max
elseif lb_nm = 'room' then
	max_cnt = croom_max
end if

cnt = 1
do while bFound_code = false and cnt <= max_cnt
	if array_code_in[cnt] = lb_code then
		sFound_desc = array_desc_in[cnt]
		bFound_code = true
	else
		cnt = cnt + 1
	end if
loop 

return sFound_desc
end function

public function string wf_search_lb_by_desc (string lb_nm, string lb_desc, string array_code_in[], string array_desc_in[]);boolean bFound_desc
int cnt, max_cnt
string sFound_code
max_cnt = 0
bFound_desc = false
sFound_code = ''

if lb_nm = 'stat' then
	max_cnt = cstat_max
elseif lb_nm = 'room' then
	max_cnt = croom_max
end if

cnt = 1
do while bFound_desc = false and cnt <= max_cnt
	if array_desc_in[cnt] = lb_desc then
		sFound_code = array_code_in[cnt]
		bFound_desc = true
	else
		cnt = cnt + 1
	end if
loop 

return sFound_code
end function

public subroutine wf_highlight_selected_stat (ref listbox lb_in, string adhoc_in, string code_in);int iSearch, iStart
string sCodeid, sCodeDesc, cCode[], cDesc[]

if code_in = 'stat' then
	cCode[] = cStatcode[]
	cDesc[] = cStatdesc[]
elseif code_in = 'room' then
	cCode[] = cRoomcode[]
	cDesc[] = cRoomdesc[]
end if

iSearch = 1


iStart = pos(adhoc_in,"'",iSearch)
do while iStart <> 0
	sCodeid = mid(adhoc_in, iStart + 1, 2) 
	sCodeDesc = wf_search_lb_by_code (code_in, sCodeid, cCode[], cDesc[] )
	lb_in.SetState(lb_in.FindItem(sCodeDesc,1), true)
	iSearch = iStart + 4
	iStart = pos(adhoc_in,"'",iSearch) 
loop


end subroutine

public subroutine wf_clear_lb_selected (ref listbox lb_in);do while lb_in.SelectedItem() <> ""
	lb_in.SetState(lb_in.SelectedIndex(),false)
loop


end subroutine

public subroutine wf_close_lb_stat ();//
//lb_stat.x = 485
//lb_stat.y = 407
//lb_stat.height = 61
//lb_stat.width = 407  
end subroutine

public subroutine wf_open_lb_stat ();//lb_stat.x = 485
//lb_stat.y = 805
//lb_stat.height = 361
//lb_stat.width = 407

end subroutine

public subroutine wf_build_report_string (ref string ls_hold, ref integer li_cnt);IF ls_hold > "" THEN
   IF li_cnt > 1 THEN
      is_report_parms2 = is_report_parms2 + ls_hold + '~n'
      li_cnt = 0
   ELSE
     is_report_parms1  = is_report_parms1 + ls_hold + '~n'
   END IF
   ls_hold = ""
END IF
end subroutine

public subroutine wf_check_status ();///////////////////////////////////////////////////////////////////
//// Purpose : checks selected status's and sets 
////
/////////////////////////////////////////////////////////////////
//


ib_pendingcalls = FALSE
ib_TimerCalls   = FALSE
ib_closedcalls  = TRUE
return


//string  ls_selectedcodes , ls_code
//Integer li_pos 

//IF uo_status.uf_return_ddlb_text() = '[All]' THEN
//   ib_closedcalls  = TRUE
//   ib_pendingcalls = TRUE
//   ib_TimerCalls   = TRUE
//   return
//END IF

//ls_selectedcodes = uo_status.uf_return_codestring()
//
//DO WHILE len(ls_selectedcodes) > 0
//   li_pos  = pos(ls_selectedcodes,',')
//   IF li_pos = 0 AND len(ls_selectedcodes) > 0 THEN
//      ls_code = ls_selectedcodes
//      ls_selectedcodes = ""
//   ELSE
//      ls_code = mid(ls_selectedcodes,1,li_pos - 1)
//      ls_selectedcodes = mid(ls_selectedcodes,li_pos + 1, len(ls_selectedcodes)) 
//   END IF
//
//   CHOOSE CASE Integer(ls_code)
//       CASE 99 // closed calls
//          ib_closedcalls = TRUE
//       CASE  00 to 09 // timer calls
//          ib_Timercalls = TRUE
//       CASE 10 to 98 // pending calls
//          ib_pendingcalls = TRUE
//    END CHOOSE
//LOOP	
end subroutine

public function string wf_build_new_select (string as_sql);////////////////////////////////////////////////////////////////
// Purpose : Build's union select clause depenant on the state of 
//           boolean instance variables
//
// Argument : string as_sql  = original sql statment with modified
//                             where clause
//
// Returns  : string updated sql union statment ( if nessesary)
//
/////////////////////////////////////////////////////////////////

String ls_sql_closed, ls_sql_pending, ls_sql_timer, ls_new_sql

 
IF ib_closedcalls THEN // initial sql select is to closed calls
   ls_sql_closed = as_sql
END IF

IF ib_pendingcalls THEN
   ls_sql_pending = str_replace_all(as_sql,'closedcalls','pendingcalls')
END IF

IF ib_timercalls THEN
   ls_sql_timer  = str_replace_all(as_sql,'closedcalls','timercalls')
END IF

If len(ls_sql_closed) > 0 THEN
   ls_new_sql = ls_sql_closed 
END IF


If len(ls_sql_pending) > 0 THEN
   IF len(ls_new_sql) > 0 THEN
      ls_new_sql = ls_new_sql+' union ' + ls_sql_pending 
  ELSE
      ls_new_sql = ls_sql_pending
  END IF
END IF

If len(ls_sql_timer) > 0 THEN
   IF len(ls_new_sql) > 0 THEN
      ls_new_sql = ls_new_sql+' union ' + ls_sql_timer
  ELSE
      ls_new_sql = ls_sql_timer
  END IF
END IF

return(ls_new_sql)
end function

public function string wf_shift_short_desc (string shiftnum);string shiftshortnm
  SELECT "timeshift"."shift_shortdesc"  
    INTO :shiftshortnm  
    FROM "timeshift"  
   WHERE "timeshift"."shift_num" = :shiftnum   ;
if sqlca.sqlcode = 0 then
	return shiftshortnm
else
	return ''
end if
end function

public function string wf_mssql_buildrestrictions ();string  cAdHoc, cNewDateStr
int     nm_start , li_cnt 
string  callcat, new_nm, old_nm , ls_hold
boolean lb_match
Long    ll_time

cAdHoc          = ""
cReportType     = "Opened"
is_report_parms1 = ""
is_report_parms2 = ""

// SFM 1/21/96 replaced all table references from opencall 
//             to closedcalls


// Call # from
IF Integer(em_callnum_from.Text) > 0 Then
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_number~~" >= ' + &
	    em_callnum_from.text + ' '
End if

// Call # to
IF Integer(em_callnum_to.Text) > 0 Then
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_number~~" <= ' + &
	    em_callnum_to.text + ' '
End if

// Date Opened from
IF Date(uo_ddcal_opendate_from.sle_date.Text) > Date('1990/01/01') Then
   cNewDateStr = string(date(uo_ddcal_opendate_from.sle_date.text),'yyyy/mm/dd')

   //10/11/97 SFM SQL Server datediff replace date function {
  // cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_indate~~") >= ' + &
  //	    "Date('"+cNewDateStr+"')"
	
   cAdHoc = cAdHoc + " and datediff(day,'" +  cNewDateStr +"'" +',~~"closedcalls~~".~~"call_indate~~" ) >= 0 ' 

	// } end
	
	ls_hold = 'Open Date >= '+uo_ddcal_opendate_from.sle_date.Text
   lb_match = true
   li_cnt ++
End if

// Date Opened to
IF Date(uo_ddcal_opendate_to.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_ddcal_opendate_to.sle_date.Text),'yyyy/mm/dd')

 //	10/11/97 sfm sql server datediff {
 //	cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_indate~~") <= ' + &
 //	   "Date('"+cNewDateStr+"')"
	
   cAdHoc = cAdHoc + " and datediff(day,'" +  cNewDateStr +"'" +',~~"closedcalls~~".~~"call_indate~~" ) <= 0 ' 


 // } end
   	
   IF lb_match then
      ls_hold = ls_hold + ' and  <= '+uo_ddcal_opendate_to.sle_date.Text
      lb_match = false
   ELSE
      ls_hold = 'Open Date <= '+ uo_ddcal_opendate_to.sle_date.Text
      li_cnt ++
   END IF
End if


wf_build_report_string(ls_hold,li_cnt)

// Close Opened from
IF Date(uo_ddcal_closedate_from.sle_date.Text) > Date("1990/01/01") Then
	cNewDateStr = string(date(uo_ddcal_closedate_from.sle_date.Text),'yyyy/mm/dd')

 // 10/11/97 sfm sql server datediff {
 //    cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_outdate~~") >= ' + &
 //	 "Date('"+cNewDateStr+"')"
	 
   cAdHoc = cAdHoc + " and datediff(day,'" +  cNewDateStr +"'" +',~~"closedcalls~~".~~"call_outdate~~" ) >= 0 ' 

 
 
 // } end 	
	
	
   ls_hold  = 'Close Date >= '+uo_ddcal_closedate_from.sle_date.Text+''
   lb_match = true
   li_cnt ++
End if

// Date Closed to
IF Date(uo_ddcal_closedate_to.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_ddcal_closedate_to.sle_date.Text),'yyyy/mm/dd')

    // 10/11/97 sfm sql server datediff {
    //cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_outdate~~") <= ' + &
	 // "Date('"+cNewDateStr+"')"

	  cAdHoc = cAdHoc + " and datediff(day,'" +  cNewDateStr +"'" +',~~"closedcalls~~".~~"call_outdate~~") <= 0 ' 

	// }
	
   IF lb_match THEN
      ls_hold = ls_hold + ' and <= '+uo_ddcal_closedate_to.sle_date.Text+''
      lb_match = FALSE
   ELSE
      ls_hold = 'Close Date <= '+uo_ddcal_closedate_to.sle_date.Text
      li_cnt ++
   END IF
End if


wf_build_report_string(ls_hold,li_cnt)


// Timer Start from Date
IF Date(uo_timer_start_from_date.sle_date.Text) > Date('1990/01/01') Then
   cNewDateStr = string(date(uo_timer_start_from_date.sle_date.text),'yyyy/mm/dd')

    // 10/11/97 sfm sql server datediff {
	 //  cAdHoc      = cAdHoc + ' and date(~~"closedcalls~~".~~"timer_start~~") >= ' + &
 	 //	 "Date('"+cNewDateStr+"')"
	 //cAdHoc = cAdHoc + ' and datediff(day,~~"closedcalls~~".~~"timer_start~~",' +"'" + cNewDateStr + "') >= 0  " 
     cAdHoc = cAdHoc + " and datediff(day,'" +  cNewDateStr +"'" +',~~"closedcalls~~".~~"timer_start~~") >= 0 ' 

	 
	 
	 // }
	
	cReportType = "Scheduled"
   li_cnt ++
   ls_hold = 'Schedule Date >= '+uo_timer_start_from_date.sle_date.Text
   lb_match = TRUE
End if

// Timer Start to Date
IF Date(uo_timer_start_to_date.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_timer_start_to_date.sle_date.Text),'yyyy/mm/dd')
	
  // 10/11/97 sfm sql server datediff {
  // cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"timer_start~~") <= ' + &
  //         "Date('"+cNewDateStr+"')"
 
   cAdHoc = cAdHoc + " and datediff(day,'" +  cNewDateStr +"'" +',~~"closedcalls~~".~~"timer_start~~" ) <= 0 ' 


  //  }	
  
   cReportType = "Scheduled"
   IF lb_match THEN
      lb_match = FALSE
      ls_hold = ls_hold + ' and <= '+uo_timer_start_to_date.sle_date.Text
   ELSE
      ls_hold = 'Schedule Date <= '+uo_timer_start_to_date.sle_date.Text
      li_cnt ++   
   END IF
End if


wf_build_report_string(ls_hold,li_cnt)


// Time Min from
IF Integer( em_timemin_from.Text ) > 0  Then
   //10/11/97 sql server syntax {
	//cAdHoc = cAdHoc + &
	//    ' and seconds(seconds(~~"closedcalls~~".~~"timer_start~~", ' + & 
	//    ' -~~"subproblem~~".~~"timer1_start_min~~" * 60), '+ &
	//    ' ~~"closedcalls~~".~~"call_outdate~~") / 60 >= ' + em_timemin_from.text + ' '
	
	cAdHoc = cAdHoc + &
   ' and datediff(second,dateadd(second, - ~~"subproblem~~".~~"timer1_start_min~~" * 60 ,~~"timer_start~~" ),~~"call_outdate~~") / 60 > = ' + em_timemin_from.Text    
 
   //  }

   ls_hold = 'Duration Min >= '+em_timemin_from.Text
   li_cnt ++
   lb_match = true
End if

// Time Min to
IF Integer( em_timemin_to.Text ) > 0  Then
	
	// 10/11/97 sql server syntax  {
	//cAdHoc = cAdHoc + &
	//	' and seconds(seconds(~~"closedcalls~~".~~"timer_start~~", ' + & 
	//	' -~~"subproblem~~".~~"timer1_start_min~~" * 60), '+ &
	//	' ~~"closedcalls~~".~~"call_outdate~~") / 60 <= ' + em_timemin_to.text + ' '

 	cAdHoc = cAdHoc + &
     ' and datediff(second,dateadd(second, - ~~"subproblem~~".~~"timer1_start_min~~" * 60 ,~~"timer_start~~" ),~~"call_outdate~~")  / 60 < = ' + em_timemin_to.text  

	 // }
	
	
	If lb_match THEN
      ls_hold = ls_hold + ' and <= '+em_timemin_to.text
   ELSE
      ls_hold = 'Duration Min <= '+em_timemin_to.Text
      li_cnt ++
   END IF
End if


wf_build_report_string(ls_hold,li_cnt)



// Start Timer Min from

if IsTime(em_timeofday_from.text) and em_timeofday_from.text <> '00:00' then

	// 10/11/97 sql server syntax  {
	//cAdHoc = cAdHoc + &
	//	' and Seconds(datetime(date(~~"closedcalls~~".~~"timer_start~~")),' +&
	//	'~~"closedcalls~~".~~"timer_start~~") / 3600 ' + &
	//	' >= seconds('+"'00:00',"+"'" + em_timeofday_from.text + &
	//	"') / 3600 "
   
   ll_time = Integer(mid(em_timeofday_from.text,1,2)) * 60 + Integer(mid(em_timeofday_from.text,4,2))

		cAdHoc = cAdHoc + &
    ' and datepart(hour,~~"timer_start~~" ) * 60 + datepart(minute,~~"timer_start~~") > = ' + string(ll_time)  

   // }	
	
	
	ls_hold = 'Schedule Time >= '+em_timeofday_from.text
   li_cnt ++
   lb_match = true

End if

// Start Timer Min to
if IsTime(em_timeofday_to.text) and em_timeofday_to.text <> '00:00' then

	
   // 10/14/97 SFM sql date function  {
	
	//cAdHoc = cAdHoc + &
	//	' and Seconds(datetime(date(~~"closedcalls~~".~~"timer_start~~")),' +&
	//	'~~"closedcalls~~".~~"timer_start~~") / 3600 ' + &
	//	' <= seconds('+"'00:00',"+"'" + em_timeofday_to.text + &
	//	"') / 3600 "
	
  ll_time = Integer(mid(em_timeofday_to.text,1,2)) * 60 + Integer(mid(em_timeofday_to.text,4,2))

		cAdHoc = cAdHoc + &
   ' and datepart(hour,~~"timer_start~~" ) * 60 + datepart(minute,~~"timer_start~~")  < = ' +string(ll_time)  

   // }
	
   If lb_match THEN
      ls_hold = ls_hold + ' and <= '+em_timeofday_to.text
   ELSE
      ls_hold = 'Schedule Time <= '+em_timeofday_to.text
      li_cnt ++
   END IF
End if

wf_build_report_string(ls_hold,li_cnt)


// Status Codes
If Len( uo_status.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"stat_code~~"'
	old_nm = 'opencall_stat_code'
	callcat = uo_status.cCriteria  
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_status.cCriteria
	ls_hold = 'Status Code = '+ uo_status.is_selected
   li_cnt ++
End If

//if Len(cAdHocStat) > 0 then
//	cAdHoc = cAdHoc + cAdHocStat
//end if

wf_build_report_string(ls_hold,li_cnt)


// Room Numbers
//If Len(cRoomCrit) > 0 Then
If Len( uo_room.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"room~~"'
	old_nm = 'opencall_room'
	callcat = uo_room.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_room.cCriteria

//if Len(cAdHocRoom) > 0 then
//	cAdHoc = cAdHoc + cAdHocRoom
//end if
   ls_hold = 'Rooms = '+ uo_room.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// Shifts
//If Len(cShiftCrit) > 0 Then
If Len( uo_shift.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"shift~~"'
	old_nm = 'opencall_shift'
	callcat =  uo_shift.cCriteria
	string shiftnm
	shiftnm = wf_shift_short_desc("1")
	if  shiftnm <> "" then
		if pos(callcat,shiftnm) > 0 then
			callcat = Replace ( callcat, pos(callcat,shiftnm), len(shiftnm), "1" ) 
		end if
	end if
	shiftnm = wf_shift_short_desc("2")
	if  shiftnm <> "" then
		if pos(callcat,shiftnm) > 0 then
			callcat = Replace ( callcat, pos(callcat,shiftnm), len(shiftnm), "2" ) 
		end if
	end if
	shiftnm = wf_shift_short_desc("3")
	if  shiftnm <> "" then
		if pos(callcat,shiftnm) > 0 then
			callcat = Replace ( callcat, pos(callcat,shiftnm), len(shiftnm), "3" ) 
		end if
	end if
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_shift.cCriteria
   ls_hold = 'Shifts = '+ uo_shift.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// Caller Category
//If Len(cCallCatCrit) > 0 Then
If Len(uo_callercat.cCriteria) > 0 Then
	new_nm = '~~"closedcalls~~".~~"caller_category~~"'
	old_nm = 'opencall_caller_category'
	callcat = uo_callercat.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_callercat.cCriteria
   ls_hold = 'Caller Category = ' + uo_callercat.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Guest/Caller
If Len( uo_guestcaller.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"guest~~"'
	old_nm = 'opencall_guest'
	callcat =  uo_guestcaller.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_guestcaller.cCriteria
   ls_hold = 'Guest = ' + uo_guestcaller.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Received By
If Len( uo_receivedby.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"receiver~~"'
	old_nm = 'opencall_receiver'
	callcat =  uo_receivedby.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_receivedby.cCriteria
   ls_hold = 'Received by = ' + uo_receivedby.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Problem
If Len( uo_problem.cCriteria ) > 0 Then
	new_nm = '~~"problem~~".~~"problem_desc~~"'
	old_nm = 'problem_problem_desc'
	callcat =  uo_problem.cCriteria 
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_problem.cCriteria
   ls_hold = 'Task = Selected'
   ls_hold = 'Task = ' + uo_problem.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// SubProblem
If Len( uo_subproblem.cCriteria ) > 0 Then
	new_nm = '~~"subproblem~~".~~"subproblem_desc~~"'
	old_nm = 'subproblem_subproblem_desc'
	callcat =  uo_subproblem.cCriteria 
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_subproblem.cCriteria
   ls_hold = 'Sub-Task = ' + uo_subproblem.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// Department
If Len( uo_closed_bydept.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"closed_bydept~~"'
	old_nm = 'opencall_closed_bydept'
	callcat =  uo_closed_bydept.cCriteria 
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_closed_bydept.cCriteria 
   ls_hold = 'Departments = ' + uo_closed_bydept.is_selected
   li_cnt ++
END IF   


wf_build_report_string(ls_hold,li_cnt)


// Employee
If Len( uo_employee.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"repairman~~"'
	old_nm = 'opencall_repairman'
	callcat = uo_employee.cCriteria
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_employee.cCriteria
   ls_hold = 'Handled By = ' + uo_employee.is_selected

   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Closed By
If Len( uo_closed_by.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"closed_by~~"'
	old_nm = 'opencall_closed_by'
	callcat = uo_closed_by.cCriteria
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_closed_by.cCriteria 
   ls_hold = 'Closed by = ' + uo_closed_by.is_selected
   li_cnt ++
END IF

wf_build_report_string(ls_hold,li_cnt)


// *** Now that we've concatonated our little filter let's polish it
// *** and execute the little bugger while being sure to test the
// *** results like good little programmers.

// If we've a filt, then Strip-off 1st " and "
IF Len(cAdHoc) > 0 Then
//	cAdHoc = Mid( cAdHoc, 6 )  // pickup from 6th (del 1st 5 - " and ")
	cAdHoc = Mid( cAdHoc, 5 )  // pickup from 6th (del 1st 5 - " and ")
End If

return cAdHoc


end function

public function string wf_watcom_buildrestrictions ();string  cAdHoc, cNewDateStr
int     nm_start , li_cnt 
string  callcat, new_nm, old_nm , ls_hold
boolean lb_match

cAdHoc          = ""
cReportType     = "Opened"
is_report_parms1 = ""
is_report_parms2 = ""

// SFM 1/21/96 replaced all table references from opencall 
//             to closedcalls

// Call # from
IF Integer(em_callnum_from.Text) > 0 Then
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_number~~" >= ' + &
	    em_callnum_from.text + ' '
End if

// Call # to
IF Integer(em_callnum_to.Text) > 0 Then
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_number~~" <= ' + &
	    em_callnum_to.text + ' '
End if

// Date Opened from
IF Date(uo_ddcal_opendate_from.sle_date.Text) > Date('1990/01/01') Then
   cNewDateStr = string(date(uo_ddcal_opendate_from.sle_date.text),'yyyy/mm/dd')
// cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_indate~~") >= ' + &		------ VZ no date func in colname 
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_indate~~" >= ' + "Date('"+cNewDateStr+"')"
   ls_hold = 'Open Date >= '+uo_ddcal_opendate_from.sle_date.Text 
   lb_match = true
   li_cnt ++
End if

// Date Opened to
IF Date(uo_ddcal_opendate_to.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_ddcal_opendate_to.sle_date.Text),'yyyy/mm/dd')
// cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_indate~~") <= ' + &
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_indate~~" <= ' + "Datetime('"+cNewDateStr+" 23:59:59')"
   IF lb_match then
      ls_hold = ls_hold + ' and  <= '+uo_ddcal_opendate_to.sle_date.Text
      lb_match = false
   ELSE
      ls_hold = 'Open Date <= '+ uo_ddcal_opendate_to.sle_date.Text
      li_cnt ++
   END IF
End if

wf_build_report_string(ls_hold,li_cnt)

// Date Closed  from
IF Date(uo_ddcal_closedate_from.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_ddcal_closedate_from.sle_date.Text),'yyyy/mm/dd')
// cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_outdate~~") >= ' + &
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_outdate~~" >= ' + "Date('"+cNewDateStr+"')"
   ls_hold  = 'Close Date >= '+uo_ddcal_closedate_from.sle_date.Text+''
   lb_match = true
   li_cnt ++
End if

// Date Closed to
IF Date(uo_ddcal_closedate_to.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_ddcal_closedate_to.sle_date.Text),'yyyy/mm/dd')
//   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_outdate~~") <= ' + &
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"call_outdate~~" <= ' + "Datetime('"+cNewDateStr+" 23:59:59')"
   IF lb_match THEN
      ls_hold = ls_hold + ' and <= '+uo_ddcal_closedate_to.sle_date.Text+''
      lb_match = FALSE
   ELSE
      ls_hold = 'Close Date <= '+uo_ddcal_closedate_to.sle_date.Text
      li_cnt ++
   END IF
End if

wf_build_report_string(ls_hold,li_cnt)


// Timer Start from Date
IF Date(uo_timer_start_from_date.sle_date.Text) > Date('1990/01/01') Then
   cNewDateStr = string(date(uo_timer_start_from_date.sle_date.text),'yyyy/mm/dd')
//   cAdHoc      = cAdHoc + ' and date(~~"closedcalls~~".~~"timer_start~~") >= ' + &
   cAdHoc      = cAdHoc + ' and ~~"closedcalls~~".~~"timer_start~~" >= ' + "Date('"+cNewDateStr+"')"
   cReportType = "Scheduled"
   li_cnt ++
   ls_hold = 'Schedule Date >= '+uo_timer_start_from_date.sle_date.Text
   lb_match = TRUE
End if

// Timer Start to Date
IF Date(uo_timer_start_to_date.sle_date.Text) > Date("1990/01/01") Then
   cNewDateStr = string(date(uo_timer_start_to_date.sle_date.Text),'yyyy/mm/dd')
//   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"timer_start~~") <= ' + &
   cAdHoc = cAdHoc + ' and ~~"closedcalls~~".~~"timer_start~~" <= ' + "Datetime('"+cNewDateStr+" 23:59:59')"
   cReportType = "Scheduled"
   IF lb_match THEN
      lb_match = FALSE
      ls_hold = ls_hold + ' and <= '+uo_timer_start_to_date.sle_date.Text
   ELSE
      ls_hold = 'Schedule Date <= '+uo_timer_start_to_date.sle_date.Text
      li_cnt ++   
   END IF
End if

wf_build_report_string(ls_hold,li_cnt)


// Time Min from
IF Integer( em_timemin_from.Text ) > 0  Then
   cAdHoc = cAdHoc + &
	    ' and seconds(seconds(~~"closedcalls~~".~~"timer_start~~", ' + & 
	    ' -~~"subproblem~~".~~"timer1_start_min~~" * 60), '+ &
	    ' ~~"closedcalls~~".~~"call_outdate~~") / 60 >= ' + em_timemin_from.text + ' '
   ls_hold = 'Duration Min >= '+em_timemin_from.Text
   li_cnt ++
   lb_match = true
End if

// Time Min to
IF Integer( em_timemin_to.Text ) > 0  Then
	cAdHoc = cAdHoc + &
		' and seconds(seconds(~~"closedcalls~~".~~"timer_start~~", ' + & 
		' -~~"subproblem~~".~~"timer1_start_min~~" * 60), '+ &
		' ~~"closedcalls~~".~~"call_outdate~~") / 60 <= ' + em_timemin_to.text + ' '
   If lb_match THEN
      ls_hold = ls_hold + ' and <= '+em_timemin_to.text
   ELSE
      ls_hold = 'Duration Min <= '+em_timemin_to.Text
      li_cnt ++
   END IF
End if

wf_build_report_string(ls_hold,li_cnt)

// Start Timer Min from

if IsTime(em_timeofday_from.text) and em_timeofday_from.text <> '00:00' then
	cAdHoc = cAdHoc + &
		' and Seconds(datetime(date(~~"closedcalls~~".~~"timer_start~~")),' +&
		'~~"closedcalls~~".~~"timer_start~~") / 3600 ' + &
		' >= seconds('+"'00:00',"+"'" + em_timeofday_from.text + &
		"') / 3600 "
   ls_hold = 'Schedule Time >= '+em_timeofday_from.text
   li_cnt ++
   lb_match = true

End if

// Start Timer Min to
if IsTime(em_timeofday_to.text) and em_timeofday_to.text <> '00:00' then
	cAdHoc = cAdHoc + &
		' and Seconds(datetime(date(~~"closedcalls~~".~~"timer_start~~")),' +&
		'~~"closedcalls~~".~~"timer_start~~") / 3600 ' + &
		' <= seconds('+"'00:00',"+"'" + em_timeofday_to.text + &
		"') / 3600 "
   If lb_match THEN
      ls_hold = ls_hold + ' and <= '+em_timeofday_to.text
   ELSE
      ls_hold = 'Schedule Time <= '+em_timeofday_to.text
      li_cnt ++
   END IF
End if

wf_build_report_string(ls_hold,li_cnt)

// Status Codes
If Len( uo_status.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"stat_code~~"'
	old_nm = 'opencall_stat_code'
	callcat = uo_status.cCriteria  
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_status.cCriteria
	ls_hold = 'Status Code = '+ uo_status.is_selected
   li_cnt ++
End If

//if Len(cAdHocStat) > 0 then
//	cAdHoc = cAdHoc + cAdHocStat
//end if

wf_build_report_string(ls_hold,li_cnt)


// Room Numbers
//If Len(cRoomCrit) > 0 Then
If Len( uo_room.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"room~~"'
	old_nm = 'opencall_room'
	callcat = uo_room.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_room.cCriteria

//if Len(cAdHocRoom) > 0 then
//	cAdHoc = cAdHoc + cAdHocRoom
//end if
   ls_hold = 'Rooms = '+ uo_room.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// Shifts
//If Len(cShiftCrit) > 0 Then
If Len( uo_shift.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"shift~~"'
	old_nm = 'opencall_shift'
	callcat =  uo_shift.cCriteria
	string shiftnm
	shiftnm = wf_shift_short_desc("1")
	if  shiftnm <> "" then
		if pos(callcat,shiftnm) > 0 then
			callcat = Replace ( callcat, pos(callcat,shiftnm), len(shiftnm), "1" ) 
		end if
	end if
	shiftnm = wf_shift_short_desc("2")
	if  shiftnm <> "" then
		if pos(callcat,shiftnm) > 0 then
			callcat = Replace ( callcat, pos(callcat,shiftnm), len(shiftnm), "2" ) 
		end if
	end if
	shiftnm = wf_shift_short_desc("3")
	if  shiftnm <> "" then
		if pos(callcat,shiftnm) > 0 then
			callcat = Replace ( callcat, pos(callcat,shiftnm), len(shiftnm), "3" ) 
		end if
	end if
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_shift.cCriteria
   ls_hold = 'Shifts = '+ uo_shift.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// Caller Category
//If Len(cCallCatCrit) > 0 Then
If Len(uo_callercat.cCriteria) > 0 Then
	new_nm = '~~"closedcalls~~".~~"caller_category~~"'
	old_nm = 'opencall_caller_category'
	callcat = uo_callercat.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_callercat.cCriteria
   ls_hold = 'Caller Category = ' + uo_callercat.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Guest/Caller
If Len( uo_guestcaller.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"guest~~"'
	old_nm = 'opencall_guest'
	callcat =  uo_guestcaller.cCriteria  
//	do while pos(callcat,"'") > 0
//		callcat = replace(callcat,pos(callcat,"'"),1,'"')
//	loop
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
//	cAdHoc = cAdHoc + uo_guestcaller.cCriteria
   ls_hold = 'Guest = ' + uo_guestcaller.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Received By
If Len( uo_receivedby.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"receiver~~"'
	old_nm = 'opencall_receiver'
	callcat =  uo_receivedby.cCriteria  
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Received by = ' + uo_receivedby.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)


// Problem
If Len( uo_problem.cCriteria ) > 0 Then
	new_nm = '~~"problem~~".~~"problem_desc~~"'
	old_nm = 'problem_problem_desc'
	callcat =  uo_problem.cCriteria 
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Task = Selected'
   ls_hold = 'Task = ' + uo_problem.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// SubProblem
If Len( uo_subproblem.cCriteria ) > 0 Then
	new_nm = '~~"subproblem~~".~~"subproblem_desc~~"'
	old_nm = 'subproblem_subproblem_desc'
	callcat =  uo_subproblem.cCriteria 
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Sub-Task = ' + uo_subproblem.is_selected
   li_cnt ++
END IF   

wf_build_report_string(ls_hold,li_cnt)

// Department
If Len( uo_closed_bydept.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"closed_bydept~~"'
	old_nm = 'opencall_closed_bydept'
	callcat =  uo_closed_bydept.cCriteria 
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Departments = ' + uo_closed_bydept.is_selected
   li_cnt ++
END IF   
wf_build_report_string(ls_hold,li_cnt)


// Employee
If Len( uo_employee.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"repairman~~"'
	old_nm = 'opencall_repairman'
	callcat = uo_employee.cCriteria
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Handled By = ' + uo_employee.is_selected
   li_cnt ++
END IF   
wf_build_report_string(ls_hold,li_cnt)


// Closed By
If Len( uo_closed_by.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"closed_by~~"'
	old_nm = 'opencall_closed_by'
	callcat = uo_closed_by.cCriteria
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Closed by = ' + uo_closed_by.is_selected
   li_cnt ++
END IF
wf_build_report_string(ls_hold,li_cnt)

// Company
If Len( uo_company.cCriteria ) > 0 Then
	new_nm = '~~"guest~~".~~"comp_name~~"'
	old_nm = 'guest_comp_name'
	callcat = uo_company.cCriteria
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Company = ' + uo_company.is_selected
   li_cnt ++
END IF
wf_build_report_string(ls_hold,li_cnt)

// block code
If Len( uo_block_code.cCriteria ) > 0 Then
	new_nm = '~~"guest~~".~~"block_code~~"'
	old_nm = 'guest_block_code'
	callcat = uo_block_code.cCriteria
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Block Code = ' + uo_block_code.is_selected
   li_cnt ++
END IF
wf_build_report_string(ls_hold,li_cnt)

// retcode
If Len( uo_retcode.cCriteria ) > 0 Then
	new_nm = '~~"subproblem~~".~~"retcode~~"'
	old_nm = 'subproblem_retcode'
	callcat = uo_retcode.cCriteria
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Returnable Code = ' + uo_retcode.is_selected
   li_cnt ++
END IF
wf_build_report_string(ls_hold,li_cnt)


// *** Now that we've concatonated our little filter let's polish it
// *** and execute the little bugger while being sure to test the
// *** results like good little programmers.

// If we've a filt, then Strip-off 1st " and "
IF Len(cAdHoc) > 0 Then
//	cAdHoc = Mid( cAdHoc, 6 )  // pickup from 6th (del 1st 5 - " and ")
	cAdHoc = Mid( cAdHoc, 5 )  // pickup from 6th (del 1st 5 - " and ")
End If

return cAdHoc


end function

event open;SetMicroHelp( "Opening " + This.Title + " screen...please wait." )

// SFM 10/26/97 Determine db type and switch dataobjects if need be

//IF cappdbtype = 'MSSQL' THEN
//	dw_graph.dataobject = 'd_adhoc_master_dw_mssql'
//END IF

// Save a var or two..we'll store the level needed to open as 
//  starting point for password acrually used
This.nPassLevelOpenedWith = Get_Event_Security( "QO" )

//* if password parm = 1 then require password else 0 no password
double ld_password
ld_password = Message.DoubleParm

	if ld_password <> 0 then
		if not Is_PassWordOK( This.nPassLevelOpenedWith ) Then
			goto closewin
		end if
	end if

	// set in w_passord as level associated with password used
	if ld_password = 0 then
		npassuserrights = 99
	end if
	npasslevelopenedwith = npassuserrights	
	Get_Toolbar_Profile( This.Title, This )
	dispatch_tracking_system.toolbarsheettitle = This.title
	cb_exitgraph.Visible   = False
	dw_graph.Visible       = False
	
	
	uo_status.cTable2Use				= "call_stat"
	uo_status.cColumn2Retrieve		= "stat_code"
	uo_status.cColumn2AdHoc			= "opencall_stat_code"
	uo_status.load_lb					= "status"
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_status
	
	uo_room.cTable2Use				= "area"
	uo_room.cColumn2Retrieve		= "area_number"
	uo_room.cColumn2AdHoc			= "opencall_room"
	uo_room.load_lb					= "room"
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_room

	uo_shift.cTable2Use				= "timeshift"
	uo_shift.cColumn2Retrieve		= "shift_shortdesc"
	uo_shift.cColumn2AdHoc			= "opencall_shift"
	uo_shift.load_lb					= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_shift
	
	uo_problem.cTable2Use			= "problem"
	uo_problem.cColumn2Retrieve	= "problem_desc"
	uo_problem.cColumn2AdHoc		= "problem_problem_desc"
	uo_problem.load_lb				= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_problem
	
	uo_subproblem.cTable2Use		 = "subproblem"
	uo_subproblem.cColumn2Retrieve = "subproblem_desc"
	uo_subproblem.cColumn2AdHoc	 = "subproblem_subproblem_desc"
	uo_subproblem.load_lb    		 = ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_subproblem


	uo_callercat.cTable2Use			= "instdept"
	uo_callercat.cColumn2Retrieve	= "dept"
	uo_callercat.cColumn2AdHoc		= "opencall_caller_category"
	uo_callercat.load_lb				= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_callercat

// uo_guestcaller.cTable2Use			= "instemp"
	uo_guestcaller.cColumn2Retrieve	= "guest"
	uo_guestcaller.cColumn2AdHoc		= "opencall_guest"
	uo_guestcaller.load_lb				= "guest"
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_guestcaller

	uo_closed_by.cTable2Use			= "user_rights"
	uo_closed_by.cColumn2Retrieve	= "user_lname = user_lname + ~', ~' + user_fname"
	uo_closed_by.cColumn2AdHoc		= "opencall_closed_by"
	uo_closed_by.load_lb				= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_closed_by
	
	uo_closed_bydept.cTable2Use		= "instdept"
	uo_closed_bydept.cColumn2Retrieve= "dept"
	uo_closed_bydept.cColumn2AdHoc	= "opencall_closed_bydept"
	uo_closed_bydept.load_lb			= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_closed_bydept
	
   uo_employee.cTable2Use			= "instemp"
	uo_employee.cColumn2Retrieve	= "employee"
	uo_employee.cColumn2AdHoc		= "opencall_repairman"
   uo_employee.load_lb           = ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_employee
	
	uo_receivedby.cTable2Use		 = "user_rights"
	uo_receivedby.cColumn2Retrieve = "user_lname = user_lname + ~', ~' + user_fname"
	uo_receivedby.cColumn2AdHoc	 = "opencall_receiver"
   uo_receivedby.load_lb          = ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_receivedby
	
	uo_company.cTable2Use			= "guest"
	uo_company.cColumn2Retrieve	= "comp_name"
	uo_company.cColumn2AdHoc		= "guest_comp_name"
	uo_company.load_lb				= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_company
	
	uo_block_code.cTable2Use		= "guest"
	uo_block_code.cColumn2Retrieve= "block_code"
	uo_block_code.cColumn2AdHoc	= "guest_block_code"
	uo_block_code.load_lb			= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_block_code
	
	uo_retcode.cTable2Use			= "subproblem"
	uo_retcode.cColumn2Retrieve	= "retcode"
	uo_retcode.cColumn2AdHoc		= "subproblem_retcode"
	uo_retcode.load_lb				= ""
	iuo_multi_select[ UpperBound (iuo_multi_select[]) + 1] = uo_retcode
	
	
	dw_graph.SetTransobject(sqlca)
	string cSqlWhere, sql
	cOrigSql = dw_graph.Describe("datawindow.table.select")
	sql = cOrigSql
	cSqlWhere = dw_graph.GetSqlSelect()
//	dw_graph.Retrieve()


This.Visible = True
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

lb_reports.SetState( 1, true)		// select first (only) report
this.postevent("ue_postopen")

If IsValid(gnv_appman) then gnv_appman.event ue_getsysoptions() //

return

closewin:
close(this)

end event

on mousemove;SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end on

event closequery;long niCtr
boolean lOK2CloseYet = False
integer nResponse
string cMessageString = "You have Prepared Report and Graph Windows still open, do you " + &
								"still wish to close the Q&A window?"

	// Do each Report
	For niCtr = LowerBound( RW2Use ) To UpperBound( RW2Use )
		If IsValid( RW2Use[niCtr] ) Then
			If lOK2CloseYet = False Then
				nResponse = MessageBox( cAppNAme, cMessageString, Question!, YesNo!, 2 )
				If nResponse = 1 Then
					lOK2CloseYet = True
//					Message.ReturnValue = 0	// Allow Close - must be last statement
				Else
					Message.ReturnValue = 1	// Disallow Close
					RETURN	// ********** BAD BAD BAD PROGRAMMER ***************
				End If
			End If
			If lOK2CloseYet = True Then
				Close( RW2Use[niCtr] )
			End If
		End If
	Next
	// Do each Graph
	For niCtr = LowerBound( GW2Use ) To UpperBound( GW2Use )
		If IsValid( GW2Use[niCtr] ) Then
			If lOK2CloseYet = False Then
				nResponse = MessageBox( cAppNAme, cMessageString, Question!, YesNo!, 2 )
				If nResponse = 1 Then
					lOK2CloseYet = True
//					Message.ReturnValue = 0	// Allow Close - must be last statement
				Else
					Message.ReturnValue = 1	// Disallow Close
					RETURN	// ********** BAD BAD BAD PROGRAMMER ***************
				End If
			End If
			If lOK2CloseYet = True Then
				Close( GW2Use[niCtr] )
			End If
		End If
	Next

// don't know why but this got knocked outta whack when any other window is closed and
// this is required to close the Q&A window when the m_main Exit button is clicked

// this doesn't trigger the second time it is invoked (by the call below)
If lOK2CloseYet Then
	Message.ReturnValue = 0	// Allow Close
	Close( This )
	return
End If

IF IsValid(w_progress_window) THEN
   message.returnvalue = 1
   message.processed = true
   return
end if



end event

event close;Save_Toolbar_Profile( This.Title, This )

// sfm destroys trans object
If IsValid(it_trans) THEN destroy(it_trans)

end event

on w_pms_adhoc.create
if this.MenuName = "m_adhoc" then this.MenuID = create m_adhoc
this.p_8=create p_8
this.p_7=create p_7
this.p_6=create p_6
this.p_5=create p_5
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.uo_retcode=create uo_retcode
this.uo_block_code=create uo_block_code
this.uo_company=create uo_company
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.uo_room=create uo_room
this.uo_status=create uo_status
this.uo_timer_start_to_date=create uo_timer_start_to_date
this.st_21=create st_21
this.uo_timer_start_from_date=create uo_timer_start_from_date
this.st_8=create st_8
this.lb_reports=create lb_reports
this.uo_shift=create uo_shift
this.uo_closed_by=create uo_closed_by
this.uo_employee=create uo_employee
this.uo_closed_bydept=create uo_closed_bydept
this.uo_subproblem=create uo_subproblem
this.uo_problem=create uo_problem
this.uo_receivedby=create uo_receivedby
this.uo_guestcaller=create uo_guestcaller
this.uo_callercat=create uo_callercat
this.uo_ddcal_closedate_to=create uo_ddcal_closedate_to
this.uo_ddcal_closedate_from=create uo_ddcal_closedate_from
this.uo_ddcal_opendate_to=create uo_ddcal_opendate_to
this.uo_ddcal_opendate_from=create uo_ddcal_opendate_from
this.cb_clear=create cb_clear
this.cb_view=create cb_view
this.cb_exit=create cb_exit
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_4=create st_4
this.st_24=create st_24
this.st_23=create st_23
this.st_19=create st_19
this.st_18=create st_18
this.st_16=create st_16
this.em_timeofday_to=create em_timeofday_to
this.em_timemin_to=create em_timemin_to
this.em_timeofday_from=create em_timeofday_from
this.em_timemin_from=create em_timemin_from
this.st_5=create st_5
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.em_callnum_to=create em_callnum_to
this.em_callnum_from=create em_callnum_from
this.cb_exitgraph=create cb_exitgraph
this.lb_graphs=create lb_graphs
this.st_1=create st_1
this.st_2=create st_2
this.dw_graph=create dw_graph
this.Control[]={this.p_8,&
this.p_7,&
this.p_6,&
this.p_5,&
this.p_4,&
this.p_3,&
this.p_2,&
this.p_1,&
this.uo_retcode,&
this.uo_block_code,&
this.uo_company,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.uo_room,&
this.uo_status,&
this.uo_timer_start_to_date,&
this.st_21,&
this.uo_timer_start_from_date,&
this.st_8,&
this.lb_reports,&
this.uo_shift,&
this.uo_closed_by,&
this.uo_employee,&
this.uo_closed_bydept,&
this.uo_subproblem,&
this.uo_problem,&
this.uo_receivedby,&
this.uo_guestcaller,&
this.uo_callercat,&
this.uo_ddcal_closedate_to,&
this.uo_ddcal_closedate_from,&
this.uo_ddcal_opendate_to,&
this.uo_ddcal_opendate_from,&
this.cb_clear,&
this.cb_view,&
this.cb_exit,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_4,&
this.st_24,&
this.st_23,&
this.st_19,&
this.st_18,&
this.st_16,&
this.em_timeofday_to,&
this.em_timemin_to,&
this.em_timeofday_from,&
this.em_timemin_from,&
this.st_5,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.em_callnum_to,&
this.em_callnum_from,&
this.cb_exitgraph,&
this.lb_graphs,&
this.st_1,&
this.st_2,&
this.dw_graph}
end on

on w_pms_adhoc.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.p_8)
destroy(this.p_7)
destroy(this.p_6)
destroy(this.p_5)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.uo_retcode)
destroy(this.uo_block_code)
destroy(this.uo_company)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_room)
destroy(this.uo_status)
destroy(this.uo_timer_start_to_date)
destroy(this.st_21)
destroy(this.uo_timer_start_from_date)
destroy(this.st_8)
destroy(this.lb_reports)
destroy(this.uo_shift)
destroy(this.uo_closed_by)
destroy(this.uo_employee)
destroy(this.uo_closed_bydept)
destroy(this.uo_subproblem)
destroy(this.uo_problem)
destroy(this.uo_receivedby)
destroy(this.uo_guestcaller)
destroy(this.uo_callercat)
destroy(this.uo_ddcal_closedate_to)
destroy(this.uo_ddcal_closedate_from)
destroy(this.uo_ddcal_opendate_to)
destroy(this.uo_ddcal_opendate_from)
destroy(this.cb_clear)
destroy(this.cb_view)
destroy(this.cb_exit)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_4)
destroy(this.st_24)
destroy(this.st_23)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_16)
destroy(this.em_timeofday_to)
destroy(this.em_timemin_to)
destroy(this.em_timeofday_from)
destroy(this.em_timemin_from)
destroy(this.st_5)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.em_callnum_to)
destroy(this.em_callnum_from)
destroy(this.cb_exitgraph)
destroy(this.lb_graphs)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_graph)
end on

event deactivate;w_main.postevent("ue_menu_set")
end event

event activate;w_main.triggerevent("ue_menu_set")
end event

type p_8 from picture within w_pms_adhoc
integer x = 123
integer y = 784
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Ret Code.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_7 from picture within w_pms_adhoc
integer x = 123
integer y = 676
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Block Code.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_6 from picture within w_pms_adhoc
integer x = 123
integer y = 568
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Company.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_5 from picture within w_pms_adhoc
integer x = 123
integer y = 464
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Subtask.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_4 from picture within w_pms_adhoc
integer x = 123
integer y = 356
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Department.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_3 from picture within w_pms_adhoc
integer x = 123
integer y = 252
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Guest Caller.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_2 from picture within w_pms_adhoc
integer x = 123
integer y = 144
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\Room.bmp"
boolean border = true
boolean focusrectangle = false
end type

type p_1 from picture within w_pms_adhoc
integer x = 123
integer y = 32
integer width = 430
integer height = 88
boolean originalsize = true
string picturename = "C:\BMPS\2005\QA\QADate Opened.bmp"
boolean border = true
boolean focusrectangle = false
end type

type uo_retcode from u_multi_select_01 within w_pms_adhoc
string tag = "Select Call Receivers to include on selected reports and graphs."
integer x = 581
integer y = 784
integer width = 878
integer height = 96
integer taborder = 190
long backcolor = 134217750
end type

on uo_retcode.destroy
call u_multi_select_01::destroy
end on

type uo_block_code from u_multi_select_01 within w_pms_adhoc
string tag = "Select Call Receivers to include on selected reports and graphs."
integer x = 581
integer y = 676
integer width = 878
integer height = 96
integer taborder = 70
long backcolor = 134217750
end type

on uo_block_code.destroy
call u_multi_select_01::destroy
end on

type uo_company from u_multi_select_01 within w_pms_adhoc
string tag = "Select Call Receivers to include on selected reports and graphs."
integer x = 581
integer y = 568
integer width = 878
integer height = 96
integer taborder = 190
long backcolor = 134217750
end type

on uo_company.destroy
call u_multi_select_01::destroy
end on

type dw_1 from uo_vzt_dwbase within w_pms_adhoc
boolean visible = false
integer x = 2226
integer y = 1044
integer width = 562
integer height = 332
integer taborder = 290
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type cb_2 from commandbutton within w_pms_adhoc
boolean visible = false
integer x = 1961
integer y = 1252
integer width = 197
integer height = 88
integer taborder = 310
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "read"
end type

event clicked;blob bbb
f_vzt_readfile_to_blob ( 'c:\data\aaa.VZR', bbb)
f_dw_to_syntax_and_data( dw_1, false , bbb) 

string ls_sss
ls_sss = ''
end event

type cb_1 from commandbutton within w_pms_adhoc
boolean visible = false
integer x = 1957
integer y = 1136
integer width = 197
integer height = 88
integer taborder = 300
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "save"
end type

event clicked;blob bbb
string ls_sss

f_dw_to_syntax_and_data( dw_graph, true, bbb) 
f_vzt_writefile_from_blob( 'c:\data\aaa.VZR', bbb)
ls_sss = 'ss'


end event

type uo_room from u_multi_select_01 within w_pms_adhoc
integer x = 585
integer y = 144
integer width = 878
integer height = 96
integer taborder = 240
long backcolor = 134217750
end type

on uo_room.destroy
call u_multi_select_01::destroy
end on

type uo_status from u_multi_select_01 within w_pms_adhoc
boolean visible = false
integer x = 2025
integer y = 1040
integer taborder = 140
end type

on uo_status.destroy
call u_multi_select_01::destroy
end on

type uo_timer_start_to_date from u_ddcal within w_pms_adhoc
string tag = "Select call scheduled date range to for graphs and/or reports."
boolean visible = false
integer x = 2523
integer y = 820
integer width = 425
integer height = 92
integer taborder = 90
end type

on mousemove;call u_ddcal::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If
end on

on uo_timer_start_to_date.destroy
call u_ddcal::destroy
end on

type st_21 from statictext within w_pms_adhoc
boolean visible = false
integer x = 2446
integer y = 832
integer width = 73
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "To"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_timer_start_from_date from u_ddcal within w_pms_adhoc
string tag = "Select call scheduled date range from for graphs and/or reports."
boolean visible = false
integer x = 2016
integer y = 816
integer width = 425
integer height = 92
integer taborder = 80
end type

on mousemove;call u_ddcal::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If
end on

on uo_timer_start_from_date.destroy
call u_ddcal::destroy
end on

type st_8 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1563
integer y = 816
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Scheduled Date"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type lb_reports from listbox within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Select Reports to open on Query.  (Right-click toggles ~'Include <-> Exclude~')."
integer x = 581
integer y = 1016
integer width = 809
integer height = 252
integer taborder = 260
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long textcolor = 33554432
long backcolor = 134217750
boolean vscrollbar = true
boolean multiselect = true
integer accelerator = 114
borderstyle borderstyle = stylelowered!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event constructor;integer niCtr = 0

SetRedraw( False )
cReportsAvail[1]  = "Returned Calls"

sRW2Use[1] = "w_pms_r_retcalls01"
 RW2Use[1] =  w_pms_r_retcalls01


For niCtr = LowerBound( cReportsAvail ) TO UpperBound( cReportsAvail ) 
	AddItem( String(niCtr, "00") +" - " + cReportsAvail[niCtr] )

Next //niCtr
SetRedraw( True )


end event

on rbuttondown;boolean lSelect
integer niCtr

For niCtr = 1 To This.TotalItems()
	IF This.State( niCtr ) = 1 Then
		lSelect = False
	Else
		lSelect = True
	End If
	This.SetState( niCtr, lSelect )
Next
end on

type uo_shift from u_multi_select_01 within w_pms_adhoc
string tag = "Select Shifts to include on selected reports and graphs."
boolean visible = false
integer x = 2034
integer y = 1136
integer width = 841
integer taborder = 150
end type

on uo_shift.destroy
call u_multi_select_01::destroy
end on

type uo_closed_by from u_multi_select_01 within w_pms_adhoc
string tag = "Select Call Close Employees to include on selected reports and graphs."
boolean visible = false
integer x = 2021
integer y = 464
integer width = 841
integer taborder = 250
end type

on uo_closed_by.destroy
call u_multi_select_01::destroy
end on

type uo_employee from u_multi_select_01 within w_pms_adhoc
string tag = "Select ~'Repaired By~' Employees to include on selected reports and graphs."
boolean visible = false
integer x = 2025
integer y = 344
integer width = 841
integer taborder = 230
end type

on uo_employee.destroy
call u_multi_select_01::destroy
end on

type uo_closed_bydept from u_multi_select_01 within w_pms_adhoc
string tag = "Select Call Close Departments to include on selected reports and graphs."
integer x = 585
integer y = 356
integer width = 878
integer height = 96
integer taborder = 220
long backcolor = 134217750
end type

on uo_closed_bydept.destroy
call u_multi_select_01::destroy
end on

type uo_subproblem from u_multi_select_01 within w_pms_adhoc
string tag = "Select Sub-Tasks to include on selected reports and graphs."
integer x = 585
integer y = 464
integer width = 878
integer height = 96
integer taborder = 210
long backcolor = 134217750
end type

on uo_subproblem.destroy
call u_multi_select_01::destroy
end on

type uo_problem from u_multi_select_01 within w_pms_adhoc
string tag = "Select Tasks to include on selected reports and graphs."
boolean visible = false
integer x = 2030
integer y = 240
integer width = 841
integer taborder = 200
end type

on uo_problem.destroy
call u_multi_select_01::destroy
end on

type uo_receivedby from u_multi_select_01 within w_pms_adhoc
string tag = "Select Call Receivers to include on selected reports and graphs."
boolean visible = false
integer x = 2021
integer y = 128
integer width = 841
integer taborder = 180
end type

on uo_receivedby.destroy
call u_multi_select_01::destroy
end on

type uo_guestcaller from u_multi_select_01 within w_pms_adhoc
string tag = "Select Guests to include on selected reports and graphs."
integer x = 585
integer y = 252
integer width = 878
integer height = 96
integer taborder = 170
long backcolor = 134217750
end type

on uo_guestcaller.destroy
call u_multi_select_01::destroy
end on

type uo_callercat from u_multi_select_01 within w_pms_adhoc
string tag = "Select Caller Categories to include on selected reports and graphs."
boolean visible = false
integer x = 2025
integer y = 24
integer width = 837
integer taborder = 160
end type

on uo_callercat.destroy
call u_multi_select_01::destroy
end on

type uo_ddcal_closedate_to from u_ddcal within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Select maximum (latest) Close Date of Calls to include on selected reports and graphs."
boolean visible = false
integer x = 2523
integer y = 576
integer width = 421
integer height = 92
integer taborder = 40
string pointer = "ibeam!"
end type

on mousemove;call u_ddcal::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on uo_ddcal_closedate_to.destroy
call u_ddcal::destroy
end on

type uo_ddcal_closedate_from from u_ddcal within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Select minimum (earliest) Close Date of Calls to include on selected reports and graphs."
boolean visible = false
integer x = 2016
integer y = 576
integer width = 425
integer height = 92
integer taborder = 30
string pointer = "ibeam!"
end type

on mousemove;call u_ddcal::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on uo_ddcal_closedate_from.destroy
call u_ddcal::destroy
end on

type uo_ddcal_opendate_to from u_ddcal within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Select minimum (latest) Open Date or Calls to include on selected reports and graphs."
integer x = 1097
integer y = 28
integer width = 453
integer height = 112
integer taborder = 20
long backcolor = 134217750
string pointer = "ibeam!"
end type

on mousemove;call u_ddcal::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on uo_ddcal_opendate_to.destroy
call u_ddcal::destroy
end on

type uo_ddcal_opendate_from from u_ddcal within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Select minimum (earliest) Open Date of Calls to include on selected reports and graphs."
integer x = 576
integer y = 28
integer width = 453
integer height = 112
integer taborder = 10
long backcolor = 134217750
string pointer = "ibeam!"
end type

on mousemove;call u_ddcal::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on uo_ddcal_opendate_from.destroy
call u_ddcal::destroy
end on

type cb_clear from commandbutton within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "CLEAR ALL currently selected CRITERIA, REPORTS and GRAPHS."
integer x = 165
integer y = 1052
integer width = 334
integer height = 92
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "HAND.CUR"
string text = "&Clear"
end type

on mousemove;SetMicroHelp( This.Tag )

end on

on clicked;Parent.TriggerEvent( "ue_clear" )
end on

type cb_view from commandbutton within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Query the database with the currently selected criteria."
integer x = 165
integer y = 940
integer width = 334
integer height = 92
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "HAND.CUR"
string text = "&Query"
end type

on mousemove;SetMicroHelp( This.Tag )

end on

event clicked;/* 
	This script assembles all the little filter var's created whenever
	LoseFocus() for a listbox executes as well as all spin control FROM and
	TO var's.  It then executes the whole filter and tests the results.
	This filter is a basic;
	  ( criteria1a or criteria1b... ) and ( criteria2a or criteria2b... )... 
			for multi-select boxes and ( > fromcrit and < tocrit ) for FROM's and TO's
*/


if upper( gnv_appman.is_debugmode)  = 'Y' then dw_graph.visible = true

int niCtr, nResponse
string cLocAdHocFilt	// we use a local to compare to win instance of last used
pointer pOldPointer = SetPointer( HourGlass! )
boolean lSfsg
string ls_sql_select


lSfsg = True

wf_set_button(0)
SetMicroHelp("Building Report(s) and/or Graph(s)...please wait.")
cLocAdHocFilt = ""

// SFM 10/24/97 Build restrictions for MSsql or Watcom begin {

IF cappdbtype = 'MSSQL' THEN
   cLocAdHocFilt = wf_mssql_buildrestrictions()
ELSE
	cLocAdHocFilt = wf_watcom_buildrestrictions()
END IF

//cLocAdHocFilt = BuildAdHocString2()		// window function builds Adhoc criteria from uo's

// end }

//// if none selected then go into advanced
//If Len( Trim( cLocAdHocFilt ) ) = 0 Then
//	// If a Super-User Opened This Window
//	If nPassUserRights >= 90 Then	// super-user
//		nResponse = MessageBox( "Advanced Query?", "This application can create "+&
//					"UNLIMITED NESTING OF CONDITIONAL QUERIES.  You can create Queries "+&
//					"using Parenthesis as well as  AND, OR and NOT.  " + &
//					"Using this option successfully will require the abilities of a SQL " + &
//					"DBA (DataBase Administrator) who is fully familiar with the structure of " + &
//					"the tables in this application's database.  Would you like to open the " + &
//					"ADVANCED AD-HOC QUERY BUILDER?", Question!, YesNo!, 2 )
//		If nResponse = 1 Then
//			SetNull( cLocAdHocFilt )
//		End If
//	End If
//End If

// SFM 1/21/97 queries the uo_status object for selected status's
// sets instance vars that coraspond to the different call tables

   wf_check_status()


// Check return results from built query
if not wf_dwmodify(cLocAdHocFilt) then
	MessageBox( "Query Failure!", "The criteria specified has somehow caused " +&
				"an ERROR.  Please RE-SPECIFY CRITERIA in  a different "+&
				"manner.  Please call for support if specified criteria "+&
				"looks OK and problem persists.", StopSign! )
	lSfsg = False	// don't set query filter
Else
	For niCtr = 1 To UpperBound( GW2Use )
		If IsValid( GW2Use[niCtr] ) Then
			GW2Use[niCtr].TriggerEvent( "ue_sharedataoff" )
		End If
	Next
	For niCtr = 1 To UpperBound( RW2Use )
		If IsValid( RW2Use[niCtr] ) Then
			RW2Use[niCtr].TriggerEvent( "ue_sharedataoff" )
		End If
	Next
	nResponse = 1
	If cLocAdHocFilt = cAdHocFilt And dw_graph.RowCount() > 0 Then	// if no change then at least ask
		nResponse = MessageBox( "Refresh Data?", "Your Data Select Criteria has not " + &
					"changed since last executed.  Do you wish to REFRESH the DATA at " + &
					"this workstation?", Question!, YesNo!, 2 )
 	End If
	If nResponse <> 2 Then
	long ll_rows
		ll_rows = dw_graph.Retrieve()
	End If
	If IsValid( w_pms_adhoc ) Then
		// forces inheritance of Q&A menu to re-select this right before graph and rep win's
		OpenSheet( w_pms_adhoc, "w_pms_adhoc", w_main, 0, Original! )
		If lb_graphs.TotalSelected() + lb_reports.TotalSelected() > 0 Then
			w_main.ArrangeSheets( Layer! )
			// Let's open selected graphs
//			For niCtr = LowerBound( cGraphsAvail ) To UpperBound( cGraphsAvail )
//				If lb_graphs.State(niCtr) = 1 Then
//					OpenSheetWithParm( GW2Use[niCtr], cReportType, sGW2Use[nictr], w_main, 0, Original! )
//				End If
//				// seperated in case we have open graphs from as prior query no longer selected
//				If IsValid( GW2Use[niCtr] ) Then
//					GW2Use[niCtr].TriggerEvent( "ue_sharedataon" )
//				End If
//			Next
			// Let's open selected reports
			For niCtr = LowerBound( cReportsAvail ) To UpperBound( cReportsAvail )
				If lb_reports.State(niCtr) = 1 Then
					OpenSheetWithParm( RW2Use[niCtr], cReportType, sRW2Use[nictr], w_main, 0, Original! )			
				End If
				// seperated in case we have open reports from as prior query no longer selected
				If IsValid( RW2Use[niCtr] ) Then
					RW2Use[niCtr].event dynamic ue_sharedataon_pms()
				End If
			Next
			w_main.ArrangeSheets( Tile! )
			w_main.ArrangeSheets( Icons! )
			// reselects adhoc window after opening all others
			OpenSheet( w_pms_adhoc, "w_pms_adhoc", w_main, 0, Original! )
		Else
			MessageBox( "Incomplete Selection!", "Please click on a Report or "+&
						"Graph to select something to show the query data "+&
						"on.", Information! )
		End If	// reports and/or graphs selected
	End If	// window not closed during retrieve()
End If

SetPointer( pOldPointer )
// need w_main prefix in case this window is already closed
w_main.SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

// if Query OK then let's save so we know whether or not to retrieve next time here
If lSfsg Then
	cAdHocFilt = cLocAdHocFilt
End If

wf_set_button(1)
end event

type cb_exit from commandbutton within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Leave the current Q&&A session.  You will be prompted again if any reports or Graphs are open."
integer x = 165
integer y = 1168
integer width = 334
integer height = 92
integer taborder = 330
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "HAND.CUR"
string text = "E&xit"
end type

on mousemove;SetMicroHelp( This.Tag )

end on

on clicked;Close(Parent)
//w_adhoc.Visible = False
end on

type st_15 from statictext within w_pms_adhoc
integer x = 1015
integer y = 56
integer width = 96
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 134217750
boolean enabled = false
string text = "To"
alignment alignment = center!
long bordercolor = 25231359
boolean focusrectangle = false
end type

type st_14 from statictext within w_pms_adhoc
boolean visible = false
integer x = 2441
integer y = 944
integer width = 73
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "To"
alignment alignment = center!
long bordercolor = 25231359
boolean focusrectangle = false
end type

type st_13 from statictext within w_pms_adhoc
boolean visible = false
integer x = 2446
integer y = 720
integer width = 73
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "To"
alignment alignment = center!
long bordercolor = 25231359
boolean focusrectangle = false
end type

type st_4 from statictext within w_pms_adhoc
boolean visible = false
integer x = 2446
integer y = 596
integer width = 73
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "To"
alignment alignment = center!
long bordercolor = 25231359
boolean focusrectangle = false
end type

type st_24 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1513
integer y = 464
integer width = 480
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Closed By "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_23 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1513
integer y = 344
integer width = 480
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Handled By "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_19 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1522
integer y = 240
integer width = 480
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Task "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_18 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1541
integer y = 128
integer width = 453
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Received By "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_16 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1513
integer y = 24
integer width = 480
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Caller Category "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type em_timeofday_to from editmask within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Enter Maximum (latest) Time scheduled to include on graphs and/or reports."
boolean visible = false
integer x = 2537
integer y = 920
integer width = 407
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = " "
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type em_timemin_to from editmask within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Enter Maximum (longest) Duration of Open Call to include on graphs and/or reports."
boolean visible = false
integer x = 2533
integer y = 696
integer width = 407
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = " "
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
double increment = 1
string minmax = "0~~999999999999"
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type em_timeofday_from from editmask within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Enter Minimum (earliest) Time scheduled to include on graphs and/or reports."
boolean visible = false
integer x = 2025
integer y = 920
integer width = 407
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type em_timemin_from from editmask within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Enter Minimum (shortest) Duration of Open Call to include on graphs and/or reports."
boolean visible = false
integer x = 2025
integer y = 696
integer width = 407
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
double increment = 1
string minmax = "0~~999999999999"
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type st_5 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1563
integer y = 1040
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Status"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_12 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1582
integer y = 1136
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Shift "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_11 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1563
integer y = 920
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Scheduled Time"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_10 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1563
integer y = 696
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Duration Min "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_9 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1563
integer y = 576
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Close Date "
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type em_callnum_to from editmask within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Enter Maximum (highest) Call Number to include on graphs and/or reports."
boolean visible = false
integer x = 2985
integer y = 1060
integer width = 78
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
double increment = 100
string minmax = "0~~0"
end type

on mousemove;SetMicroHelp( This.Tag )

end on

type em_callnum_from from editmask within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Enter Minimum (lowest) Call Number to include on graphs and/or reports."
boolean visible = false
integer x = 2894
integer y = 1060
integer width = 82
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = " "
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
double increment = 100
string minmax = "0~~0"
end type

on mousemove;SetMicroHelp( This.Tag )

end on

type cb_exitgraph from commandbutton within w_pms_adhoc
boolean visible = false
integer x = 3365
integer y = 1484
integer width = 357
integer height = 108
integer taborder = 340
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exi&t"
end type

on clicked;dw_graph.Visible = False
cb_exitgraph.Visible = False
w_adhoc.ChangeMenu( m_main )

end on

type lb_graphs from listbox within w_pms_adhoc
event mousemove pbm_mousemove
string tag = "Select Graphs to open on Query.  (Right-click toggles ~'Include <-> Exclude~')."
boolean visible = false
integer x = 1376
integer y = 1008
integer width = 1051
integer height = 352
integer taborder = 270
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long textcolor = 33554432
boolean vscrollbar = true
boolean multiselect = true
integer accelerator = 103
borderstyle borderstyle = stylelowered!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event constructor;//integer niCtr = 0
//
//SetRedraw( False )
//
//cGraphsAvail[1]   = "Avg. response time per Department"
//cGraphsAvail[2]   = "Avg. response time per Shift"
//cGraphsAvail[3]   = "Avg. response time per Task"
//cGraphsAvail[4]   = "Avg. response time per Subtask"
//cGraphsAvail[5]   = "Avg. response time per Dispatcher"
//cGraphsAvail[6]   = "Avg. response time per Employee"
//cGraphsAvail[7]   = "Qty. of Calls Handled per Hour"
//cGraphsAvail[8]   = "Qty. of Calls Handled per Employee"
//cGraphsAvail[9]   = "Qty. of Calls per Task"
//cGraphsAvail[10]   = "Qty. of Calls By Hour Across Days"
//cGraphsAvail[11]  = "Qty. of Calls By Employee Across Days"
//
//
// GW2Use[1]  =  w_g_avgminsxdept
//sGW2Use[1]  = "w_g_avgminsxdept"
// GW2Use[2]  =  w_g_avgminsxshift
//sGW2Use[2]  = "w_g_avgminsxshift"
// GW2Use[3]  =  w_g_avgminsxprob
//sGW2Use[3]  = "w_g_avgminsxprob"
// GW2Use[4]  =  w_g_avgminsxsubprob
//sGW2Use[4]  = "w_g_avgminsxsubprob"
// GW2Use[5]  =  w_g_avgminsxdisp
//sGW2Use[5]  = "w_g_avgminsxdisp"
// GW2Use[6]  =  w_g_avgminsxemp
//sGW2Use[6]  = "w_g_avgminsxemp"
// GW2Use[7]  =  w_g_qtydatexhour
//sGW2Use[7]  = "w_g_qtydatexhour"
// GW2Use[8]  =  w_g_qtydatexemployee
//sGW2Use[8]  = "w_g_qtydatexemployee"
// GW2Use[9]  =  w_g_qtydatexprob
//sGW2Use[9]  = "w_g_qtydatexprob"
// GW2Use[10]  =  w_g_qtyxhour
//sGW2Use[10]  = "w_g_qtyxhour"
// GW2Use[11] =  w_g_qtyxemployee
//sGW2Use[11]  = "w_g_qtyxemployee"
//
//For niCtr = LowerBound( cGraphsAvail ) TO UpperBound( cGraphsAvail ) 
//	AddItem( String(niCtr, "00") +" - " + cGraphsAvail[niCtr] )
//
//Next //niCtr
//
//SetRedraw( True )
//
end event

on rbuttondown;boolean lSelect
integer niCtr

For niCtr = 1 To This.TotalItems()
	IF This.State( niCtr ) = 1 Then
		lSelect = False
	Else
		lSelect = True
	End If
	This.SetState( niCtr, lSelect )
Next
end on

type st_1 from statictext within w_pms_adhoc
integer x = 581
integer y = 940
integer width = 809
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 30589613
boolean enabled = false
string text = "&Reports"
alignment alignment = center!
boolean border = true
long bordercolor = 134217750
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_pms_adhoc
boolean visible = false
integer x = 1385
integer y = 784
integer width = 878
integer height = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "&Graphs"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_graph from datawindow within w_pms_adhoc
boolean visible = false
integer x = 1614
integer y = 1100
integer width = 233
integer height = 420
boolean bringtotop = true
boolean titlebar = true
string title = "Graph and Report Data Source"
string dataobject = "d_pms_adhoc_master_dw"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "GRAPH.ICO"
boolean livescroll = true
end type

event retrievestart;// SFM 1/23/97
// if  necessary perform multiple counts against the three call tables


string cnt_string, sqlcnt, ls_where
long ll_totrows

SetPointer( HourGlass! )
nRowCtr = 0

parent.nTotRows = 0

sqlcnt = newsqlcnt

//delete from top10task;

do while pos(sqlcnt,"~~") > 0
	sqlcnt = replace(sqlcnt,pos(sqlcnt,"~~"),1,"")
loop

IF ib_closedcalls then
   
   cnt_string = 'SELECT count(*) FROM ' + &
				 '"closedcalls","problem","subproblem", "guest", "retcodes" ' + sqlcnt
   PREPARE sqlsa FROM :cnt_string using it_trans;
   DECLARE ccalls_cursor DYNAMIC CURSOR FOR sqlsa;
   OPEN DYNAMIC ccalls_cursor ;  
   if it_trans.sqlcode < 0 then
	   MessageBox("DataBase Error!", it_trans.sqlerrtext)
   end if 
   Fetch ccalls_cursor into :ll_totrows ;
   if it_trans.sqlcode <> 0 then
	   MessageBox("DB Error","Fetch : " + it_trans.sqlerrtext)
   end if
   close ccalls_cursor;
   parent.ntotrows = ll_totrows
END IF

IF ib_timercalls then
   ls_where = str_replace_all(sqlcnt,'closedcalls','timercalls')
   cnt_string = 'SELECT count(*) FROM ' + &
				 '"timercalls","problem","subproblem", "guest", "retcodes" ' + ls_where
   PREPARE sqlsa FROM :cnt_string using it_trans;
   DECLARE tcalls_cursor DYNAMIC CURSOR FOR sqlsa;
   OPEN DYNAMIC tcalls_cursor;  
   if it_trans.sqlcode < 0 then
	   MessageBox("DataBase Error!", it_trans.sqlerrtext)
   end if 
   Fetch tcalls_cursor into :ntotrows;
   if it_trans.sqlcode <> 0 then
	   MessageBox("DB Error","Fetch : " + it_trans.sqlerrtext)
   end if
   close tcalls_cursor;
   ntotrows = ntotrows + ll_totrows
END IF

IF ib_pendingcalls then
   ls_where = str_replace_all(sqlcnt,'closedcalls','pendingcalls')
   cnt_string = 'SELECT count(*) FROM ' + &
				 '"pendingcalls","problem","subproblem" , "guest", "retcodes" ' + ls_where
   PREPARE sqlsa FROM :cnt_string using it_trans;
   DECLARE pcalls_cursor DYNAMIC CURSOR FOR sqlsa;
   OPEN DYNAMIC pcalls_cursor;  
   if it_trans.sqlcode < 0 then
	   MessageBox("DataBase Error!", it_trans.sqlerrtext)
   end if 
   Fetch pcalls_cursor into :ll_totrows;
   if it_trans.sqlcode <> 0 then
	   MessageBox("DB Error","Fetch : " + it_trans.sqlerrtext)
   end if
   close pcalls_cursor;
   ntotrows = ntotrows + ll_totrows
END IF


// every 100th
nTotRows = Max( nTotRows, 1 )
nRowEvery = Max( Int( nTotRows / 20 ), 1 )

str_progress lstr_progress

lstr_progress.ss_title         = ' Q & A Session Progress'
lstr_progress.sw_callingwindow = parent
lstr_progress.ss_message       = 'Processing request...'
openwithparm(w_progress_window,lstr_progress)

 

end event

event retrieveend;If IsValid( w_main ) Then
	// use w_main in case this window doesn't exist anymore
	w_main.SetMicroHelp( "Q&&A Session - Retrieved a total of " + &
				String( This.RowCount() ) + " rows." )
End If
SetPointer( Arrow! )


IF IsValid(w_progress_window) THEn
	close(w_progress_window)
END IF

 
end event

event retrieverow;//datetime dtEarliestCall

nRowCtr = nRowCtr + 1

If IsValid(w_progress_window) THEN
   If Mod( nRowCtr, nRowEvery ) = 0 Or nRowCtr >= nTotRows Then
   	w_progress_window.wf_set_message( "Q&A Session - Retrieving row " + String( nRowCtr ) + " of " + &
	   					String( nTotRows ) + "  -  " + &
		   				String( Round( ( nRowCtr / nTotRows ) * 100, 0 ) ) + &
			   			"% complete.")
   End If
end if

//If KeyDown( keyEscape! ) Then
//	SetMicroHelp( "Call Data Entry - Full retrieval ABORTED BY USER.  Retrieved a total of " &
//						+ String( nRowCtr ) + " of a possible " + String( nTotRows ) + " rows." )
////	dtEarliestDate = 
//	SetActionCode( 1 )	// stop retrieval
//	Beep( 1 )
//	MessageBox( "Retrieval Aborted by User", "The Q&A data retireval in progress " + &
//				"was aborted by the [Esc] key.  A total of [" + String( nRowCtr ) + "] " + &
//				"rows of a possible " + String(nTotRows)+" were retrieved.", StopSign! )
////	Pause( 1 )
//End If

//MessageBox("data",this.GetItemString(row,"problem_problem_desc")+"/"+ &
//	this.getitemstring(row,"subproblem_subproblem_desc"))

//task = this.GetItemString(row,"problem_problem_desc")
//subtask = this.GetItemString(row,"subproblem_subproblem_desc")
//indate=this.GetItemDatetime(row,"opencall_call_indate")
//outdate=this.GetItemDatetime(row,"opencall_call_outdate")
//
//insert into top10task (problem,subproblem,call_indate,call_outdate) values(:task,:subtask,:indate,:outdate);
//if sqlca.sqlcode <> 0 then
//	MessageBox("db error",sqlca.sqlerrtext)
//end if

end event

