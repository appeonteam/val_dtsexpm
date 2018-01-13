$PBExportHeader$w_gcc_adhoc.srw
forward
global type w_gcc_adhoc from Window
end type
type uo_company from u_multi_select_01 within w_gcc_adhoc
end type
type st_25 from statictext within w_gcc_adhoc
end type
type cb_save from commandbutton within w_gcc_adhoc
end type
type uo_room from u_multi_select_01 within w_gcc_adhoc
end type
type uo_status from u_multi_select_01 within w_gcc_adhoc
end type
type st_3 from statictext within w_gcc_adhoc
end type
type uo_timer_start_to_date from u_ddcal within w_gcc_adhoc
end type
type st_21 from statictext within w_gcc_adhoc
end type
type uo_timer_start_from_date from u_ddcal within w_gcc_adhoc
end type
type st_8 from statictext within w_gcc_adhoc
end type
type lb_reports from listbox within w_gcc_adhoc
end type
type uo_shift from u_multi_select_01 within w_gcc_adhoc
end type
type uo_closed_by from u_multi_select_01 within w_gcc_adhoc
end type
type uo_employee from u_multi_select_01 within w_gcc_adhoc
end type
type uo_closed_bydept from u_multi_select_01 within w_gcc_adhoc
end type
type uo_subproblem from u_multi_select_01 within w_gcc_adhoc
end type
type uo_problem from u_multi_select_01 within w_gcc_adhoc
end type
type uo_receivedby from u_multi_select_01 within w_gcc_adhoc
end type
type uo_guestcaller from u_multi_select_01 within w_gcc_adhoc
end type
type uo_callercat from u_multi_select_01 within w_gcc_adhoc
end type
type uo_ddcal_closedate_to from u_ddcal_vz within w_gcc_adhoc
end type
type uo_ddcal_closedate_from from u_ddcal_vz within w_gcc_adhoc
end type
type uo_ddcal_opendate_to from u_ddcal_vz within w_gcc_adhoc
end type
type uo_ddcal_opendate_from from u_ddcal_vz within w_gcc_adhoc
end type
type cb_clear from commandbutton within w_gcc_adhoc
end type
type cb_view from commandbutton within w_gcc_adhoc
end type
type cb_load from commandbutton within w_gcc_adhoc
end type
type st_15 from statictext within w_gcc_adhoc
end type
type st_4 from statictext within w_gcc_adhoc
end type
type st_24 from statictext within w_gcc_adhoc
end type
type st_23 from statictext within w_gcc_adhoc
end type
type st_22 from statictext within w_gcc_adhoc
end type
type st_20 from statictext within w_gcc_adhoc
end type
type st_19 from statictext within w_gcc_adhoc
end type
type st_18 from statictext within w_gcc_adhoc
end type
type st_17 from statictext within w_gcc_adhoc
end type
type st_16 from statictext within w_gcc_adhoc
end type
type em_timeofday_to from editmask within w_gcc_adhoc
end type
type em_timemin_to from editmask within w_gcc_adhoc
end type
type em_timeofday_from from editmask within w_gcc_adhoc
end type
type em_timemin_from from editmask within w_gcc_adhoc
end type
type st_5 from statictext within w_gcc_adhoc
end type
type st_12 from statictext within w_gcc_adhoc
end type
type st_11 from statictext within w_gcc_adhoc
end type
type st_10 from statictext within w_gcc_adhoc
end type
type st_9 from statictext within w_gcc_adhoc
end type
type em_callnum_to from editmask within w_gcc_adhoc
end type
type em_callnum_from from editmask within w_gcc_adhoc
end type
type st_6 from statictext within w_gcc_adhoc
end type
type cb_exitgraph from commandbutton within w_gcc_adhoc
end type
type lb_graphs from listbox within w_gcc_adhoc
end type
type st_1 from statictext within w_gcc_adhoc
end type
type st_2 from statictext within w_gcc_adhoc
end type
type dw_graph from datawindow within w_gcc_adhoc
end type
type cb_exit from commandbutton within w_gcc_adhoc
end type
end forward

global type w_gcc_adhoc from Window
int X=352
int Y=412
int Width=2976
int Height=1388
boolean Visible=false
boolean TitleBar=true
string Title="GCC Q&A - Query"
string MenuName="m_adhoc"
long BackColor=79349703
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean HScrollBar=true
boolean VScrollBar=true
boolean Resizable=true
string Icon="QA01.ICO"
event ue_loadfile pbm_custom01
event ue_savefile pbm_custom02
event ue_run pbm_custom03
event ue_clear pbm_custom04
event ue_printscreen pbm_custom05
event ue_cancelquery pbm_custom06
event ue_postopen pbm_custom07
event ue_loadfilea pbm_custom08
event ue_loadfileb pbm_custom09
uo_company uo_company
st_25 st_25
cb_save cb_save
uo_room uo_room
uo_status uo_status
st_3 st_3
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
cb_load cb_load
st_15 st_15
st_4 st_4
st_24 st_24
st_23 st_23
st_22 st_22
st_20 st_20
st_19 st_19
st_18 st_18
st_17 st_17
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
st_6 st_6
cb_exitgraph cb_exitgraph
lb_graphs lb_graphs
st_1 st_1
st_2 st_2
dw_graph dw_graph
cb_exit cb_exit
end type
global w_gcc_adhoc w_gcc_adhoc

type variables
str_dts_report_parms	istr_report_parms
window 			iw_this
string 			cGraphsAvail[]
string 			cReportsAvail[]
window 			RW2Use[]
string 			sRW2Use[]
w_graph_sheet_using_dw 	GW2Use[]
string 			sGW2Use[]
string 			cFile2Load = Space(256)
string 			cPath2Load = Space(256)
string 			cFile2Save = Space(256)
string 			cPath2Save = Space(256)
integer 			nPassLevelOpenedWith=0
long 		nRowCtr, nTotRows, nRowEvery
string 			cAdHocFilt
string 			cOrigSql	
string 			newsqlcnt
string 			cStatcode[]
boolean 			lb_stat_built
boolean 			lb_room_built
string 			cStatdesc[]
string 			cRoomcode[]
string 			cRoomdesc[]
string 			cAdHocStat
string 			cAdHocRoom
integer 			cStat_max
integer 			cRoom_max
string 			cReportType
//integer ijob
String 		is_report_parms1 , is_report_parms2

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

event ue_loadfile;int nResponse, niCtr
string cAdHoc
boolean lSfsg = True


If Len( Trim( cFile2Load ) ) = 0 Then
	cFile2Load = "*.QA1"
End If
if trim(cCommandParm) = 'QA' then
	if trim(cInitLoadQA) = 'Y' and trim(cInitLoadQAFile) <> "" then
		autoLoad = true
		nResponse = 1 
		cFile2Load = cInitLoadQAFile
		cPath2Load = cAppPath + cFile2Load
	end if
else
	if SetCurrentDirectoryA(cAppPath) = false then
		MessageBox("Win API Function","SetCurrentDirectoryA fails!")
	end if
	cPath2Load = capppath 
//	MessageBox("QA", "cPath2Load="+cPath2Load + "  cFile2Load=" + cFile2Load+"  cAppPath="+cAppPath)
	nResponse = GetFileOpenName( "Select Query to Load", cPath2Load, cFile2Load, &
						"QA1", "Q&A Queries (*.QA1), *.QA1, All Files (*.*), *.*" )
end if
//MessageBox("QA", "cPath2Load="+cPath2Load + "  cFile2Load=" + cFile2Load+"  cAppPath="+cAppPath)
If nResponse = 1 Then
	If Not FileExists( cPath2Load ) Then
		MessageBox( "File Not Found!", "The file " + cPath2Load + " cannot be found " + &
						" as specified.  Please re-specify desired Q&A Query file to load.", &
						StopSign! )
		lSFsg = False
	End If
	If lSfsg Then
		If ProfileString( cPath2Load, "Criteria", "SQLCriteria", "???" ) = "???" Then
			MessageBox( "Invalid File Format!", "The file " + &
								cPath2Load + " does not appear to be a valid Q&A Query File.  " + &
								"Please re-specify desired Q&A Query file to load.", StopSIgn! )
			cFile2Load = "*.QA1"
			lSfsg = False
		End If
	End If
	If lSfsg Then
		This.TriggerEvent( "ue_clear" )
		SetPointer( HourGlass! )
		// Call # from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallNumberFrom", "???" )
		IF cAdHoc <> "???" Then
			em_callnum_from.Text = cAdHoc
		End if
		// Call # to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallNumberTo", "???" )
		IF cAdHoc <> "???" Then
			em_callnum_to.Text = cAdHoc
		End if
		// Date Opened from
		// if autoLoad then default Open from/to to today
		if autoLoad = true then
			uo_ddcal_opendate_from.sle_date.Text 	= f_sysdate_string() // string(Today(),'mm/dd/yyyy')
			uo_ddcal_opendate_to.sle_date.Text 		= f_sysdate_string() // string(Today(),'mm/dd/yyyy')
		else
			cAdHoc = ProfileString( cPath2Load, "Criteria", "DateOpenFrom", "???" )
			IF cAdHoc <> "???" Then
				uo_ddcal_opendate_from.sle_date.Text = cAdHoc
			End if
		// Date Opened to
			cAdHoc = ProfileString( cPath2Load, "Criteria", "DateOpenTo", "???" )
			IF cAdHoc <> "???" Then
				uo_ddcal_opendate_to.sle_date.Text = cAdHoc
			End if
		end if
		// Date Close from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateCloseFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_closedate_from.sle_date.Text = cAdHoc
		End if
		// Date Closed to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateCloseTo", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_closedate_to.sle_date.Text = cAdHoc
		End if
		// Timer Start From Date
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimerStartFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_timer_start_from_date.sle_date.Text = cAdHoc
		End if
		// Timer Start to Date 
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimerStartTo", "???" )
		IF cAdHoc <> "???" Then
			uo_timer_start_to_date.sle_date.Text = cAdHoc
		End if
		// Time Min from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimeMinFrom", "???" )
		IF cAdHoc <> "???" Then
			em_timemin_from.text = cAdHoc
		End if
		// Time Min to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimeMinTo", "???" )
		IF cAdHoc <> "???" Then
			em_timemin_to.text = cAdHoc
		End if
		// Start Timer Min from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "StartTimerMinFrom", "???" )
		IF cAdHoc <> "???" Then
			em_timeofday_from.text = cAdHoc
		End if
		// Start Timer Min to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "StartTimerMinTo", "???" )
		IF cAdHoc <> "???" Then
			em_timeofday_to.text = cAdHoc
		End if
		// Status Codes
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Status", "???" )
		IF cAdHoc <> "???" Then
			uo_status.cCriteria = cAdHoc
			uo_status.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "StatusSelected", "???" )
			uo_status.is_selected = cAdHoc
         cAdHoc = ProfileString( cPath2Load, "Criteria", "StatusCodeString", "???" )
			uo_status.is_codestring = cAdHoc
			uo_status.uf_select_items()
		End if

		// Room Numbers
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Room", "???" )
		IF cAdHoc <> "???" Then
			uo_room.cCriteria = cAdhoc
			uo_room.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RoomSelected", "???" )
			uo_room.is_selected = cAdHoc
         uo_room.uf_select_items()
			
		End if

		// Shifts
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Shift", "???" )
		IF cAdHoc <> "???" Then
			uo_shift.cCriteria = cAdHoc
			uo_shift.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ShiftSelected", "???" )
			uo_shift.is_selected = cAdHoc
			uo_shift.uf_select_items()
		End if
		// Caller Category
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerCategory", "???" )
		IF cAdHoc <> "???" Then
			uo_callercat.cCriteria = cAdHoc
			uo_callercat.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerCategorySelected", "???" )
			uo_callercat.is_selected = cAdHoc
			uo_callercat.uf_select_items()
		End if
		// Guest/Caller
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Caller", "???" )
		IF cAdHoc <> "???" Then
			uo_guestcaller.cCriteria = cAdHoc
			uo_guestcaller.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerSelected", "???" )
			uo_guestcaller.is_selected = cAdHoc
			uo_guestcaller.uf_select_items()
		End if
		// Received By
		cAdHoc = ProfileString( cPath2Load, "Criteria", "ReceivedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_receivedby.cCriteria = cAdHoc
			uo_receivedby.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ReceivedBySelected", "???" )
			uo_receivedby.is_selected = cAdHoc
			uo_receivedby.uf_select_items()
		End if
		// Problem
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Problem", "???" )
		IF cAdHoc <> "???" Then
			uo_problem.cCriteria = cAdHoc
			uo_problem.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ProblemSelected", "???" )
			uo_problem.is_selected = cAdHoc
			uo_problem.uf_select_items()
		End if
		// SubProblem
		cAdHoc = ProfileString( cPath2Load, "Criteria", "SubProblem", "???" )
		IF cAdHoc <> "???" Then
			uo_subproblem.cCriteria = cAdHoc
			uo_subproblem.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "SubProblemSelected", "???" )
			uo_subproblem.is_selected = cAdHoc
			uo_subproblem.uf_select_items()
		End if
		// Department
		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedByDept", "???" )
		IF cAdHoc <> "???" Then
			uo_closed_bydept.cCriteria = cAdHoc
			uo_closed_bydept.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedByDeptSelected", "???" )
			uo_closed_bydept.is_selected = cAdHoc
			uo_closed_bydept.uf_select_items()
		End if
		// Employee
		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_employee.cCriteria = cAdHoc
			uo_employee.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedBySelected", "???" )
			uo_employee.is_selected = cAdHoc
			uo_employee.uf_select_items()
		End if
		// Closed By
		cAdHoc = ProfileString( cPath2Load, "Criteria", "ClosedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_closed_by.cCriteria = cAdHoc
			uo_closed_by.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ClosedBySelected", "???" )
			uo_closed_by.is_selected = cAdHoc
			uo_closed_by.uf_select_items()
		End if
		For niCtr = 1 To 1024
			cAdHoc = ProfileString( cPath2Load, "Graphs", &
								"SelectedGraph" + Trim( String( niCtr ) ), &
								"???" )
			If cAdHoc <> "???" Then
				nResponse = lb_graphs.FindItem( cAdHoc, 0 )
				If nResponse > 0 Then
					lb_graphs.SetState( nResponse, True )
				End If
//				lb_graphs.SelectItem( cAdHoc, 1  )
			Else
				niCtr = 1024
			End If
		Next
		For niCtr = 1 To 1024
			cAdHoc = ProfileString( cPath2Load, "Reports", &
							"SelectedReport" + Trim( String( niCtr ) ), &
							"???" )
			If cAdHoc <> "???" Then
//				lb_reports.SelectItem( cAdHoc, 1 )
				nResponse = lb_reports.FindItem( cAdHoc, 0 )
				If nResponse > 0 Then
					lb_reports.SetState( nResponse, True )
				End If
			Else
				niCtr = 1024
			End If
		Next
	End If
//	If lSfsg and lb_graphs.TotalSelected() + lb_reports.TotalSelected() > 0 Then
//		nResponse = MessageBox( "Run Query?", "Would you like to Run the Query " +&
//				"you have just loaded.  This will open all selected graphs and/or reports " +&
//				"found in the Q&A Query File " + cPath2Load + ".  This will also open  " + &
//				"any others selected " + &
//				"before loading Query File if No was chosen when asked to clear criteria " + &
//				"before load.", Question!, YesNo!, 1 )
//		If nResponse = 1 Then
//			cb_view.TriggerEvent( Clicked! )
//		End If
//	End If
End If


end event

event ue_savefile;int nResponse, niCtr
string cGraphs2Do, cReports2Do, cAdHoc
boolean lSfsg = True

If Len( Trim( cFile2Save ) ) = 0 Then
	cFile2Save = "Name_Me.QA1"
End If
//cPath2Save = Space( 1024 )
//cFile2Save = Space( 12 )
if autoLoad = false then
	nResponse = GetFileSaveName( "Filename for Query Save", cPath2Save, cFile2Save, "QA1", &
							"Q&A Queries (*.QA1), *.QA1, All Files (*.*), *.*" )
else
	nResponse = 1
	cFile2Save = cFile2Load
	cPath2Save = cPath2Load
end if
//cPath2Save = Trim( cPath2Save )
//cFile2Save = Trim( cFile2Save )
If nResponse = 1 Then
	
	// 10/24/97 SFM Build database restrictions begin {
	IF cappdbtype = "MSSQL" THEN
		cadhoc = wf_mssql_buildrestrictions()
	ELSE
		cadhoc = wf_watcom_buildrestrictions()
   END IF		
	
	//cAdHoc = BuildAdHocString2()
	// end }
	
	If Len( Trim( cAdHoc ) ) = 0 Then
		MessageBox( "Unspecified Criteria", "There is no current criteria specified.  " + &
						"Please specify criteria before saving.  (NOTE: choosing Clear will result " + &
						"in no criteria specified, which selects all records, as well.)", &
						StopSign! )
		lSfsg = False
	End If
	If lSfsg Then
		if autoLoad then
			If Not FileDelete( cPath2Save ) Then
					MessageBox( "File Creation Error", "Unable to delete file " + cPath2Save + ".  "  +&
									"Please re-specify desired Q&A Query file.", StopSign! )
					lSfsg = False
			End If
		else
			If FileExists( cPath2Save ) Then
				nResponse = MessageBox( "File Already Exists", "The file " + cPath2Save + " already " + &
						"exists.  Do you wish to overwrite file?", Question!, YesNo!, 2 )
				If nResponse <> 1 Then
					lSfsg = False
				Else
					If Not FileDelete( cPath2Save ) Then
						MessageBox( "File Creation Error", "Unable to delete file " + cPath2Save + ".  "  +&
									"Please re-specify desired Q&A Query file.", StopSign! )
						lSfsg = False
					End If
				end if
			End If
		End If
	End If
	If lSfsg Then
		nResponse = FileOpen( cPath2Save, StreamMode!, Write!, LockReadWrite!, Replace! )
		If nResponse = -1 Then
			MessageBox( "File Creation Error", "Unable to create file " + cPath2Save + ".  " + &
							"Please re-specify desired Q&A Query filename to save.", StopSign! )
			lSfsg = False
		Else
			nResponse = FileClose( nResponse )
			If nResponse = -1 Then
				MessageBox( "File Creation Error", "Unable to close file " + cPath2Save + " (perhaps it wasn't correctly opened).  " + &
							"Please re-specify desired Q&A Query filename to save.", StopSign! )

				lSfsg = False
			End If
		End If
	End If
	If lSfsg Then
		SetPointer( HourGlass! )
		SetProfileString( cPath2Save, "Criteria", "SQLCriteria", cAdHoc )
		// Call # from
		IF Integer(em_callnum_from.Text) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "CallNumberFrom", em_callnum_from.text )
		End if
		// Call # to
		IF Integer(em_callnum_to.Text) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "CallNumberTo", em_callnum_to.text )
		End if
		// Date Opened from
		IF Date(uo_ddcal_opendate_from.sle_date.Text) > Date("1990/01/01") Then
			SetProfileString( cPath2Save, "Criteria", "DateOpenFrom", &
										uo_ddcal_opendate_from.sle_date.text )
		End if
		// Date Opened to
		IF Date(uo_ddcal_opendate_to.sle_date.Text) > Date("1990/01/01") Then
			SetProfileString( cPath2Save, "Criteria", "DateOpenTo", &
										uo_ddcal_opendate_to.sle_date.text )
		End if
		// Close Opened from
		IF Date(uo_ddcal_closedate_from.sle_date.Text) > Date("1990/01/01") Then
			SetProfileString( cPath2Save, "Criteria", "DateCloseFrom", &
										uo_ddcal_closedate_from.sle_date.text )
		End if
		// Date Closed to
		IF Date(uo_ddcal_closedate_to.sle_date.Text) > Date("1990/01/01") Then
			SetProfileString( cPath2Save, "Criteria", "DateCloseTo", &
										uo_ddcal_closedate_to.sle_date.text )
		End if
		// Timer Date Start from
		IF Date(uo_timer_start_from_date.sle_date.Text) > Date("1990/01/01") Then
			SetProfileString( cPath2Save, "Criteria", "TimerStartFrom", &
										uo_timer_start_from_date.sle_date.text )
		End if
		// Timer Date Start to
		IF Date(uo_timer_start_to_date.sle_date.Text) > Date("1990/01/01") Then
			SetProfileString( cPath2Save, "Criteria", "TimerStartTo", &
										uo_timer_start_to_date.sle_date.text )
		End if
		// Time Min from
		IF Integer( em_timemin_from.Text ) > 0  Then
			SetProfileString( cPath2Save, "Criteria", "TimeMinFrom", &
										em_timemin_from.text )
		End if
		// Time Min to
		IF Integer( em_timemin_to.Text ) > 0  Then
			SetProfileString( cPath2Save, "Criteria", "TimeMinTo", &
										em_timemin_to.text )
		End if
		// Start Timer Min from
		IF em_timeofday_from.Text <> '00:00'  Then
			SetProfileString( cPath2Save, "Criteria", "StartTimerMinFrom", &
										em_timeofday_from.text )
		End if
		// Start Timer Min to
		IF em_timeofday_to.Text <> '00:00'  Then
			SetProfileString( cPath2Save, "Criteria", "StartTimerMinTo", &
										em_timeofday_to.text )
		End if
		// Status Codes
//		If Len( cAdHocStat ) > 0 Then
//			SetProfileString( cPath2Save, "Criteria", "Status", cAdHocStat)
//		End If
		if Len( uo_status.cCriteria) > 0 then
			SetProfileString( cPath2Save, "Criteria", "Status", uo_status.cCriteria)
         SetProfileString( cPath2Save, "Criteria", "StatusSelected", uo_status.is_selected)
         SetProfileString( cPath2Save, "Criteria", "StatusCodeString", uo_status.is_codestring)
		End if
		// Room Numbers
		If Len( uo_room.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "Room", uo_room.cCriteria )
   		SetProfileString( cPath2Save, "Criteria", "RoomSelected", uo_room.is_selected)
		End If
//		If Len( cAdHocRoom ) > 0 Then
//			SetProfileString( cPath2Save, "Criteria", "Room", cAdHocRoom )
//		End If
		// Shifts
		If Len( uo_shift.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "Shift", uo_shift.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "ShiftSelected", uo_shift.is_selected)
		End If
		// Caller Category
		If Len(uo_callercat.cCriteria) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "CallerCategory", uo_callercat.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "CallerCategorySelected", uo_callercat.is_selected)
   	End If
		// Guest/Caller
		If Len( uo_guestcaller.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "Caller", uo_guestcaller.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "CallerSelected", uo_guestcaller.is_selected)
		End If
		// Received By
		If Len( uo_receivedby.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "ReceivedBy", uo_receivedby.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "ReceivedBySelected", uo_receivedby.is_selected)
		End If
		// Problem
		If Len( uo_problem.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "Problem", uo_problem.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "ProblemSelected", uo_problem.is_selected)
		End If
		// SubProblem
		If Len( uo_subproblem.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "SubProblem", uo_subproblem.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "SubProblemSelected", uo_subproblem.is_selected )
		End If
		// Department
		If Len( uo_closed_bydept.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "RepairedByDept", uo_closed_bydept.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "RepairedByDeptSelected", uo_closed_bydept.is_selected)
		End If
		// Employee
		If Len( uo_employee.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "RepairedBy", uo_employee.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "RepairedBySelected", uo_employee.is_selected)
		End If
		// Closed By
		If Len( uo_closed_by.cCriteria ) > 0 Then
			SetProfileString( cPath2Save, "Criteria", "ClosedBy", uo_closed_by.cCriteria )
			SetProfileString( cPath2Save, "Criteria", "ClosedBySelected", uo_closed_by.is_selected)
		End If
		If lb_graphs.TotalSelected() + lb_reports.TotalSelected() > 0 Then
			nResponse = 0
			For niCtr = 1 To lb_graphs.TotalItems()
				If lb_graphs.State( niCtr ) > 0 Then
					nResponse++
					SetProfileString( cPath2Save, "Graphs", &
										"SelectedGraph" + Trim( String( nResponse ) ), lb_graphs.Text( niCtr ) )
				End If
			Next
			nResponse = 0
			For niCtr = 1 To lb_reports.TotalItems()
				If lb_reports.State( niCtr ) > 0 Then
					nResponse++
					SetProfileString( cPath2Save, "Reports", &
										"SelectedReport" + Trim( String( nResponse ) ), lb_reports.Text( niCtr ) )
				End If
			Next
		End If
	End If	// file exists and overwrite
	
End If	// file chosen to save ad-hoc query
end event

event ue_run;///* 
//	This script assembles all the little filter var's created whenever
//	LoseFocus() for a listbox executes as well as all spin control FROM and
//	TO var's.  It then executes the whole filter and tests the results.
//	This filter is a basic;
//	  ( criteria1a or criteria1b... ) and ( criteria2a or criteria2b... )... 
//			for multi-select boxes and ( > fromcrit and < tocrit ) for FROM's and TO's
//*/
//int niCtr
//string cAdHocFilt = ""
//pointer pOldPointer = SetPointer( HourGlass! )
//
//SetMicroHelp("Building Report(s) and/or Graph(s)...please wait.")
//cAdHocFilt = BuildAdHocString()		// window function builds Adhoc criteria from uo's
//
//// Check return results from built query
//IF dw_graph.SetFilter( cAdHocFilt ) <> 1 Then
//	MessageBox( "Query Failure", "The criteria specified has somehow caused " +&
//				"an ERROR, please re-specify criteria, in perhaps a simpler "+&
//				"manner.  Please call for support if specified criteria "+&
//				"looks OK and problem persists.", StopSign! )
//Else
//	dw_graph.Filter()
//	// forces inheritance of Q&A menu to re-select this right before graph and rep win's
//	OpenSheet( w_adhoc, "w_adhoc", w_gcc_main, 0, Original! )
//	If lb_graphs.TotalSelected() + lb_reports.TotalSelected() > 0 Then
//		w_gcc_main.ArrangeSheets( Layer! )
//		// Let's open selected graphs
//		For niCtr = LowerBound( cGraphsAvail ) To UpperBound( cGraphsAvail )
//			If lb_graphs.State(niCtr) = 1 Then
//				OpenSheetWithParm( GW2Use[niCtr], cAdHocFilt, sGW2Use[nictr], w_gcc_main, 0, Original! )
//			End If
//		Next
//		// Let's open selected reports
//		For niCtr = LowerBound( cReportsAvail ) To UpperBound( cReportsAvail )
//			If lb_reports.State(niCtr) = 1 Then
//				OpenSheetWithParm( RW2Use[niCtr], cAdHocFilt, sRW2Use[nictr], w_gcc_main, 0, Original! )
//			End If
//		Next
//		w_gcc_main.ArrangeSheets( Tile! )
//		w_gcc_main.ArrangeSheets( Icons! )
//	Else
//		MessageBox( "Selection Error.", "Please click on a Report or Graph to select something to view", Question!, OK!, 1 )
//	End If
//End If
//
////cb_exitgraph.Visible = True
//
////this.ChangeMenu( m_graph )
//SetPointer( pOldPointer )
//SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

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
	em_callnum_from.Text = ""
	em_callnum_to.Text = ""
	uo_ddcal_opendate_from.sle_date.Text = ""
	uo_ddcal_opendate_to.sle_date.Text = ""
	uo_ddcal_closedate_from.sle_date.Text = ""
	uo_ddcal_closedate_to.sle_date.Text = ""
	uo_timer_start_from_date.sle_date.Text = ""
	uo_timer_start_to_date.sle_date.Text = ""
	em_timemin_from.Text = ""
	em_timemin_to.Text = ""
	em_timeofday_from.Text = "00:00"
	em_timeofday_to.Text = "00:00"

	uo_status.cCriteria = ""
	uo_status.uo_ddlb_1.Text = "[All]"
   uo_status.uf_clear_selected()
	cAdHocStat = ""
//	ddlb_stat.text = "[All]"
	uo_room.cCriteria = ""
   uo_room.uf_clear_selected()
	cAdHocRoom = ""
//	ddlb_room.text = "[All]"
	uo_room.uo_ddlb_1.Text = "[All]"

	uo_shift.cCriteria = ""
	uo_shift.uo_ddlb_1.Text = "[All]"
   uo_shift.uf_clear_selected()
	uo_callercat.cCriteria = ""
	uo_callercat.uo_ddlb_1.Text = "[All]"
   uo_callercat.uf_clear_selected()
	uo_guestcaller.cCriteria = ""
	uo_guestcaller.uo_ddlb_1.Text = "[All]"
   uo_guestcaller.uf_clear_selected()
	uo_receivedby.cCriteria = ""
	uo_receivedby.uo_ddlb_1.Text = "[All]"
   uo_receivedby.uf_clear_selected()
	uo_problem.cCriteria = ""
	uo_problem.uo_ddlb_1.Text = "[All]"
   uo_problem.uf_clear_selected()
	uo_subproblem.cCriteria = ""
	uo_subproblem.uo_ddlb_1.Text = "[All]"
   uo_subproblem.uf_clear_selected()
	uo_closed_bydept.cCriteria = ""
	uo_closed_bydept.uo_ddlb_1.Text = "[All]"
   uo_closed_bydept.uf_clear_selected()
	uo_employee.cCriteria = ""
	uo_employee.uo_ddlb_1.Text = "[All]"
   uo_employee.uf_clear_selected()
	uo_closed_by.cCriteria = ""
	uo_closed_by.uo_ddlb_1.Text = "[All]"
   uo_closed_by.uf_clear_selected()
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
	For niCtr = 1 To lb_graphs.TotalItems()
		lb_graphs.SetState( niCtr, False )
	Next
	For niCtr = 1 To lb_reports.TotalItems()
		lb_reports.SetState( niCtr, False )
	Next

//	wf_clear_lb_selected(lb_stat)
//	wf_clear_lb_selected(lb_room)
	
	SetPointer( pOldPointer )
	w_gcc_main.ArrangeSheets( Tile! )
	w_gcc_main.ArrangeSheets( Icons! )

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

event ue_loadfilea;int nResponse, niCtr
string cAdHoc
boolean lSfsg = True

cFile2Load = cInitLoadQAFile
cPath2Load = cAppPath + cFile2Load

//MessageBox("QA", "cPath2Load="+cPath2Load + "  cFile2Load=" + cFile2Load+"  cAppPath="+cAppPath)
	If Not FileExists( cPath2Load ) Then
		MessageBox( "File Not Found!", "The file " + cPath2Load + " cannot be found " + &
						" as specified.  Please re-specify desired Q&A Query file to load.", &
						StopSign! )
		lSFsg = False
	End If
	If lSfsg Then
		If ProfileString( cPath2Load, "Criteria", "SQLCriteria", "???" ) = "???" Then
			MessageBox( "Invalid File Format!", "The file " + &
								cPath2Load + " does not appear to be a valid Q&A Query File.  " + &
								"Please re-specify desired Q&A Query file to load.", StopSIgn! )
			cFile2Load = "*.QA1"
			lSfsg = False
		End If
	End If
	If lSfsg Then
		This.TriggerEvent( "ue_clear" )
		SetPointer( HourGlass! )
		// Call # from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallNumberFrom", "???" )
		IF cAdHoc <> "???" Then
			em_callnum_from.Text = cAdHoc
		End if
		// Call # to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallNumberTo", "???" )
		IF cAdHoc <> "???" Then
			em_callnum_to.Text = cAdHoc
		End if
		// Date Opened from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateOpenFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_opendate_from.sle_date.Text = cAdHoc
		End if
		// Date Opened to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateOpenTo", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_opendate_to.sle_date.Text = cAdHoc
		End if
		// Date Close from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateCloseFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_closedate_from.sle_date.Text = cAdHoc
		End if
		// Date Closed to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateCloseTo", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_closedate_to.sle_date.Text = cAdHoc
		End if
		// Timer Start From Date
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimerStartFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_timer_start_from_date.sle_date.Text = cAdHoc
		End if
		// Timer Start to Date 
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimerStartTo", "???" )
		IF cAdHoc <> "???" Then
			uo_timer_start_to_date.sle_date.Text = cAdHoc
		End if
		// Time Min from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimeMinFrom", "???" )
		IF cAdHoc <> "???" Then
			em_timemin_from.text = cAdHoc
		End if
		// Time Min to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimeMinTo", "???" )
		IF cAdHoc <> "???" Then
			em_timemin_to.text = cAdHoc
		End if
		// Start Timer Min from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "StartTimerMinFrom", "???" )
		IF cAdHoc <> "???" Then
			em_timeofday_from.text = cAdHoc
		End if
		// Start Timer Min to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "StartTimerMinTo", "???" )
		IF cAdHoc <> "???" Then
			em_timeofday_to.text = cAdHoc
		End if
		// Status Codes
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Status", "???" )
		IF cAdHoc <> "???" Then
			uo_status.cCriteria = cAdHoc
			uo_status.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "StatusSelected", "???" )
			uo_status.is_selected = cAdHoc
         cAdHoc = ProfileString( cPath2Load, "Criteria", "StatusCodeString", "???" )
			uo_status.is_codestring = cAdHoc
			uo_status.uf_select_items()
		End if

		// Room Numbers
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Room", "???" )
		IF cAdHoc <> "???" Then
			uo_room.cCriteria = cAdhoc
			uo_room.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RoomSelected", "???" )
			uo_room.is_selected = cAdHoc
         uo_room.uf_select_items()
			
		End if

		// Shifts
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Shift", "???" )
		IF cAdHoc <> "???" Then
			uo_shift.cCriteria = cAdHoc
			uo_shift.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ShiftSelected", "???" )
			uo_shift.is_selected = cAdHoc
			uo_shift.uf_select_items()
		End if
		// Caller Category
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerCategory", "???" )
		IF cAdHoc <> "???" Then
			uo_callercat.cCriteria = cAdHoc
			uo_callercat.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerCategorySelected", "???" )
			uo_callercat.is_selected = cAdHoc
			uo_callercat.uf_select_items()
		End if
		// Guest/Caller
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Caller", "???" )
		IF cAdHoc <> "???" Then
			uo_guestcaller.cCriteria = cAdHoc
			uo_guestcaller.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerSelected", "???" )
			uo_guestcaller.is_selected = cAdHoc
			uo_guestcaller.uf_select_items()
		End if
		// Received By
		cAdHoc = ProfileString( cPath2Load, "Criteria", "ReceivedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_receivedby.cCriteria = cAdHoc
			uo_receivedby.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ReceivedBySelected", "???" )
			uo_receivedby.is_selected = cAdHoc
			uo_receivedby.uf_select_items()
		End if
		// Problem
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Problem", "???" )
		IF cAdHoc <> "???" Then
			uo_problem.cCriteria = cAdHoc
			uo_problem.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ProblemSelected", "???" )
			uo_problem.is_selected = cAdHoc
			uo_problem.uf_select_items()
		End if
		// SubProblem
		cAdHoc = ProfileString( cPath2Load, "Criteria", "SubProblem", "???" )
		IF cAdHoc <> "???" Then
			uo_subproblem.cCriteria = cAdHoc
			uo_subproblem.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "SubProblemSelected", "???" )
			uo_subproblem.is_selected = cAdHoc
			uo_subproblem.uf_select_items()
		End if
		// Department
		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedByDept", "???" )
		IF cAdHoc <> "???" Then
			uo_closed_bydept.cCriteria = cAdHoc
			uo_closed_bydept.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedByDeptSelected", "???" )
			uo_closed_bydept.is_selected = cAdHoc
			uo_closed_bydept.uf_select_items()
		End if
		// Employee
		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_employee.cCriteria = cAdHoc
			uo_employee.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedBySelected", "???" )
			uo_employee.is_selected = cAdHoc
			uo_employee.uf_select_items()
		End if
		// Closed By
		cAdHoc = ProfileString( cPath2Load, "Criteria", "ClosedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_closed_by.cCriteria = cAdHoc
			uo_closed_by.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ClosedBySelected", "???" )
			uo_closed_by.is_selected = cAdHoc
			uo_closed_by.uf_select_items()
		End if
		For niCtr = 1 To 1024
			cAdHoc = ProfileString( cPath2Load, "Graphs", &
								"SelectedGraph" + Trim( String( niCtr ) ), &
								"???" )
			If cAdHoc <> "???" Then
				nResponse = lb_graphs.FindItem( cAdHoc, 0 )
				If nResponse > 0 Then
					lb_graphs.SetState( nResponse, True )
				End If
//				lb_graphs.SelectItem( cAdHoc, 1  )
			Else
				niCtr = 1024
			End If
		Next
		For niCtr = 1 To 1024
			cAdHoc = ProfileString( cPath2Load, "Reports", &
							"SelectedReport" + Trim( String( niCtr ) ), &
							"???" )
			If cAdHoc <> "???" Then
//				lb_reports.SelectItem( cAdHoc, 1 )
				nResponse = lb_reports.FindItem( cAdHoc, 0 )
				If nResponse > 0 Then
					lb_reports.SetState( nResponse, True )
				End If
			Else
				niCtr = 1024
			End If
		Next
	End If

uo_ddcal_opendate_from.sle_date.text	= f_sysdate_string() // String(Today(), "mm/dd/yyyy")
uo_ddcal_opendate_to.sle_date.text		= f_sysdate_string() // String(Today(), "mm/dd/yyyy")
end event

event ue_loadfileb;int nResponse, niCtr
string cAdHoc
boolean lSfsg = True

cFile2Load = cInitLoadQAFile2
cPath2Load = cAppPath + cFile2Load

//MessageBox("QA", "cPath2Load="+cPath2Load + "  cFile2Load=" + cFile2Load+"  cAppPath="+cAppPath)
	If Not FileExists( cPath2Load ) Then
		MessageBox( "File Not Found!", "The file " + cPath2Load + " cannot be found " + &
						" as specified.  Please re-specify desired Q&A Query file to load.", &
						StopSign! )
		lSFsg = False
	End If
	If lSfsg Then
		If ProfileString( cPath2Load, "Criteria", "SQLCriteria", "???" ) = "???" Then
			MessageBox( "Invalid File Format!", "The file " + &
								cPath2Load + " does not appear to be a valid Q&A Query File.  " + &
								"Please re-specify desired Q&A Query file to load.", StopSIgn! )
			cFile2Load = "*.QA1"
			lSfsg = False
		End If
	End If
	If lSfsg Then
		This.TriggerEvent( "ue_clear" )
		SetPointer( HourGlass! )
		// Call # from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallNumberFrom", "???" )
		IF cAdHoc <> "???" Then
			em_callnum_from.Text = cAdHoc
		End if
		// Call # to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallNumberTo", "???" )
		IF cAdHoc <> "???" Then
			em_callnum_to.Text = cAdHoc
		End if
		// Date Opened from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateOpenFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_opendate_from.sle_date.Text = cAdHoc
		End if
		// Date Opened to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateOpenTo", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_opendate_to.sle_date.Text = cAdHoc
		End if
		// Date Close from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateCloseFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_closedate_from.sle_date.Text = cAdHoc
		End if
		// Date Closed to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "DateCloseTo", "???" )
		IF cAdHoc <> "???" Then
			uo_ddcal_closedate_to.sle_date.Text = cAdHoc
		End if
		// Timer Start From Date
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimerStartFrom", "???" )
		IF cAdHoc <> "???" Then
			uo_timer_start_from_date.sle_date.Text = cAdHoc
		End if
		// Timer Start to Date 
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimerStartTo", "???" )
		IF cAdHoc <> "???" Then
			uo_timer_start_to_date.sle_date.Text = cAdHoc
		End if
		// Time Min from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimeMinFrom", "???" )
		IF cAdHoc <> "???" Then
			em_timemin_from.text = cAdHoc
		End if
		// Time Min to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "TimeMinTo", "???" )
		IF cAdHoc <> "???" Then
			em_timemin_to.text = cAdHoc
		End if
		// Start Timer Min from
		cAdHoc = ProfileString( cPath2Load, "Criteria", "StartTimerMinFrom", "???" )
		IF cAdHoc <> "???" Then
			em_timeofday_from.text = cAdHoc
		End if
		// Start Timer Min to
		cAdHoc = ProfileString( cPath2Load, "Criteria", "StartTimerMinTo", "???" )
		IF cAdHoc <> "???" Then
			em_timeofday_to.text = cAdHoc
		End if
		// Status Codes
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Status", "???" )
		IF cAdHoc <> "???" Then
			uo_status.cCriteria = cAdHoc
			uo_status.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "StatusSelected", "???" )
			uo_status.is_selected = cAdHoc
         cAdHoc = ProfileString( cPath2Load, "Criteria", "StatusCodeString", "???" )
			uo_status.is_codestring = cAdHoc
			uo_status.uf_select_items()
		End if


		// Room Numbers
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Room", "???" )
		IF cAdHoc <> "???" Then
			uo_room.cCriteria = cAdhoc
			uo_room.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RoomSelected", "???" )
			uo_room.is_selected = cAdHoc
         uo_room.uf_select_items()
			
		End if

		// Shifts
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Shift", "???" )
		IF cAdHoc <> "???" Then
			uo_shift.cCriteria = cAdHoc
			uo_shift.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ShiftSelected", "???" )
			uo_shift.is_selected = cAdHoc
			uo_shift.uf_select_items()
		End if
		// Caller Category
		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerCategory", "???" )
		IF cAdHoc <> "???" Then
			uo_callercat.cCriteria = cAdHoc
			uo_callercat.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerCategorySelected", "???" )
			uo_callercat.is_selected = cAdHoc
			uo_callercat.uf_select_items()
		End if
		// Guest/Caller
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Caller", "???" )
		IF cAdHoc <> "???" Then
			uo_guestcaller.cCriteria = cAdHoc
			uo_guestcaller.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "CallerSelected", "???" )
			uo_guestcaller.is_selected = cAdHoc
			uo_guestcaller.uf_select_items()
		End if
		// Received By
		cAdHoc = ProfileString( cPath2Load, "Criteria", "ReceivedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_receivedby.cCriteria = cAdHoc
			uo_receivedby.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ReceivedBySelected", "???" )
			uo_receivedby.is_selected = cAdHoc
			uo_receivedby.uf_select_items()
		End if
		// Problem
		cAdHoc = ProfileString( cPath2Load, "Criteria", "Problem", "???" )
		IF cAdHoc <> "???" Then
			uo_problem.cCriteria = cAdHoc
			uo_problem.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ProblemSelected", "???" )
			uo_problem.is_selected = cAdHoc
			uo_problem.uf_select_items()
		End if
		// SubProblem
		cAdHoc = ProfileString( cPath2Load, "Criteria", "SubProblem", "???" )
		IF cAdHoc <> "???" Then
			uo_subproblem.cCriteria = cAdHoc
			uo_subproblem.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "SubProblemSelected", "???" )
			uo_subproblem.is_selected = cAdHoc
			uo_subproblem.uf_select_items()
		End if
		// Department
		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedByDept", "???" )
		IF cAdHoc <> "???" Then
			uo_closed_bydept.cCriteria = cAdHoc
			uo_closed_bydept.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedByDeptSelected", "???" )
			uo_closed_bydept.is_selected = cAdHoc
			uo_closed_bydept.uf_select_items()
		End if
		// Employee
		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_employee.cCriteria = cAdHoc
			uo_employee.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "RepairedBySelected", "???" )
			uo_employee.is_selected = cAdHoc
			uo_employee.uf_select_items()
		End if
		// Closed By
		cAdHoc = ProfileString( cPath2Load, "Criteria", "ClosedBy", "???" )
		IF cAdHoc <> "???" Then
			uo_closed_by.cCriteria = cAdHoc
			uo_closed_by.uo_ddlb_1.text = '[Selected]'
   		cAdHoc = ProfileString( cPath2Load, "Criteria", "ClosedBySelected", "???" )
			uo_closed_by.is_selected = cAdHoc
			uo_closed_by.uf_select_items()
		End if
		For niCtr = 1 To 1024
			cAdHoc = ProfileString( cPath2Load, "Graphs", &
								"SelectedGraph" + Trim( String( niCtr ) ), &
								"???" )
			If cAdHoc <> "???" Then
				nResponse = lb_graphs.FindItem( cAdHoc, 0 )
				If nResponse > 0 Then
					lb_graphs.SetState( nResponse, True )
				End If
//				lb_graphs.SelectItem( cAdHoc, 1  )
			Else
				niCtr = 1024
			End If
		Next
		For niCtr = 1 To 1024
			cAdHoc = ProfileString( cPath2Load, "Reports", &
							"SelectedReport" + Trim( String( niCtr ) ), &
							"???" )
			If cAdHoc <> "???" Then
//				lb_reports.SelectItem( cAdHoc, 1 )
				nResponse = lb_reports.FindItem( cAdHoc, 0 )
				If nResponse > 0 Then
					lb_reports.SetState( nResponse, True )
				End If
			Else
				niCtr = 1024
			End If
		Next
	End If
 
uo_ddcal_opendate_from.sle_date.text	= f_date_string( datetime(RelativeDate ( Today(), -7 )))
uo_ddcal_opendate_to.sle_date.text		= f_sysdate_string() 
end event

public subroutine setbuttons (boolean lgraphmode);If lGraphMode Then
	// Graph Mode buttons
	// non-Graph Mode buttons
	cb_save.Enabled = False
	cb_view.Enabled = False
	cb_exit.Enabled = False
	cb_clear.Enabled = False

Else	// not graph mode
	// Graph Mode buttons
	// non-Graph Mode buttons
	cb_save.Enabled = True
	cb_view.Enabled = True
	cb_exit.Enabled = True
	cb_clear.Enabled = True

End If
end subroutine

public subroutine wf_set_button (integer onoff_sw);if onoff_sw = 0  then // button disable
	cb_view.enabled = false
	cb_load.enabled = false
	cb_clear.enabled = false
	cb_exit.enabled = false
	cb_save.enabled = false
else
	cb_view.enabled = true
	cb_load.enabled = true
	cb_clear.enabled = true
	cb_exit.enabled = true
	cb_save.enabled = true
end if	
end subroutine

public function boolean wf_dwmodify (string adhocstring);string dwsqlstring, sqlstring, sqlselect, sqlwhere, sqlwhere1, sqlwhere2, sqlorder, sumOrigSql
integer sel_len, where_len, order_len
string  newsql,origsql, ls_rc
//sqlstring = buildadhocstring2 ( )

//*  Reset to original Datawindow sql select
origsql = "datawindow.table.select=~""+cOrigSql+"~""
ls_rc = dw_graph.Modify(origsql)									//vz
if ls_rc  <> '' then
	Messagebox("DW SQL set error","Error code:"+ls_rc)
	return false
end if

sqlstring 	= trim(adhocstring)
dwsqlstring = dw_graph.describe("datawindow.table.select")
sel_len 	 	= pos(dwsqlstring,"WHERE ")
where_len 	= pos(dwsqlstring,"ORDER BY")
sqlselect 	= mid(dwsqlstring,1,sel_len - 1) 
sqlwhere1 	= mid(dwsqlstring, sel_len , where_len - sel_len - 1)
sqlorder 	= mid(dwsqlstring, where_len, len(dwsqlstring))

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
ls_rc = dw_graph.modify(newsql)
if len(ls_rc) > 0 then
	Messagebox("DW SQL set error","Error code:"+ls_rc)
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
/////////////////////////////////////////////////////////////////

string  ls_selectedcodes , ls_code
Integer li_pos 

// reset instance variables used when defining tables
ib_closedcalls  = true
ib_pendingcalls = true
ib_TimerCalls   = true

IF uo_status.uf_return_ddlb_text() = '[All]' THEN
   ib_closedcalls  = TRUE
   ib_pendingcalls = TRUE
   ib_TimerCalls   = TRUE
   return
END IF

ls_selectedcodes = uo_status.uf_return_codestring()

DO WHILE len(ls_selectedcodes) > 0
   li_pos  = pos(ls_selectedcodes,',')
   IF li_pos = 0 AND len(ls_selectedcodes) > 0 THEN
      ls_code = ls_selectedcodes
      ls_selectedcodes = ""
   ELSE
      ls_code = mid(ls_selectedcodes,1,li_pos - 1)
      ls_selectedcodes = mid(ls_selectedcodes,li_pos + 1, len(ls_selectedcodes)) 
   END IF

   CHOOSE CASE Integer(ls_code)
       CASE 99 // closed calls
          ib_closedcalls = TRUE
       CASE  00 to 09 // timer calls
          ib_Timercalls = TRUE
       CASE 10 to 98 // pending calls
          ib_pendingcalls = TRUE
    END CHOOSE
LOOP	
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

cAdHoc          	= " and gcc_id > 0 "  // default to gcc 
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
date		ld_nulldate, ldt_temp
cAdHoc          	= " and gcc_id > 0 "  // default to gcc 
cReportType     	= "Opened"
is_report_parms1 	= ""
is_report_parms2 	= ""

ld_nulldate = Date("1900 January 1")


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
ldt_temp = uo_ddcal_opendate_from.getSelectedDate() 
IF ldt_temp > ld_nulldate Then
 	cNewDateStr = string( ldt_temp,'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_indate~~") >= ' + &
	    "Date('"+cNewDateStr+"')"
   ls_hold = 'Open Date >= '+uo_ddcal_opendate_from.sle_date.Text
   lb_match = true
   li_cnt ++
End if

// Date Opened to
ldt_temp = uo_ddcal_opendate_to.getSelectedDate()
IF ldt_temp > ld_nulldate Then
   cNewDateStr = string( ldt_temp,'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_indate~~") <= ' + &
	   "Date('"+cNewDateStr+"')"
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
ldt_temp = uo_ddcal_closedate_from.getSelectedDate()
IF ldt_temp > ld_nulldate Then
   cNewDateStr = string( ldt_temp,'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_outdate~~") >= ' + &
	   "Date('"+cNewDateStr+"')"
   ls_hold  = 'Close Date >= '+uo_ddcal_closedate_from.sle_date.Text+''
   lb_match = true
   li_cnt ++
End if

// Date Closed to
ldt_temp = uo_ddcal_closedate_to.getSelectedDate()
IF ldt_temp > ld_nulldate Then
   cNewDateStr = string( ldt_temp,'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"call_outdate~~") <= ' + &
	   "Date('"+cNewDateStr+"')"
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
ldt_temp = uo_timer_start_from_date.getSelectedDate()
IF ldt_temp > ld_nulldate Then
   cNewDateStr = string( ldt_temp,'yyyy/mm/dd')
   cAdHoc      = cAdHoc + ' and date(~~"closedcalls~~".~~"timer_start~~") >= ' + &
		 "Date('"+cNewDateStr+"')"
   cReportType = "Scheduled"
   li_cnt ++
   ls_hold = 'Schedule Date >= '+uo_timer_start_from_date.sle_date.Text
   lb_match = TRUE
End if

// Timer Start to Date
ldt_temp = uo_timer_start_to_date.getSelectedDate()
IF ldt_temp > ld_nulldate Then
   cNewDateStr = string( ldt_temp,'yyyy/mm/dd')
   cAdHoc = cAdHoc + ' and date(~~"closedcalls~~".~~"timer_start~~") <= ' + &
           "Date('"+cNewDateStr+"')"
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
wf_build_report_string(ls_hold,li_cnt)


// Room Numbers
If Len( uo_room.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"room~~"'
	old_nm = 'opencall_room'
	callcat = uo_room.cCriteria  
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Rooms = '+ uo_room.is_selected
   li_cnt ++
END IF   
wf_build_report_string(ls_hold,li_cnt)

// Shifts
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
If Len(uo_callercat.cCriteria) > 0 Then
	new_nm = '~~"closedcalls~~".~~"caller_category~~"'
	old_nm = 'opencall_caller_category'
	callcat = uo_callercat.cCriteria  
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
   ls_hold = 'Caller Category = ' + uo_callercat.is_selected
   li_cnt ++
END IF   
wf_build_report_string(ls_hold,li_cnt)


// Guest/Caller
If Len( uo_guestcaller.cCriteria ) > 0 Then
	new_nm = '~~"closedcalls~~".~~"guest~~"'
	old_nm = 'opencall_guest'
	callcat =  uo_guestcaller.cCriteria  
	nm_start = pos(callcat,old_nm)
	do while nm_start > 0
		callcat = replace(callcat, nm_start, len(old_nm), new_nm)
		nm_start = pos(callcat,old_nm)
	loop
	cAdHoc = cAdHoc + callcat
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

// company -  "guest"."comp_name"
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

// *** Now that we've concatonated our little filter let's polish it
// *** and execute the little bugger while being sure to test the
// *** results like good little programmers.

// If we've a filt, then Strip-off 1st " and "
IF Len(cAdHoc) > 0 Then cAdHoc = Mid( cAdHoc, 5 )  // pickup from 6th (del 1st 5 - " and ")

if gnv_appman.is_debugmode = 'Y' then
	MessageBox('Watcom query', cAdHoc ) 
	Clipboard( cAdHoc )
ENd If

return cAdHoc


end function

event open;SetMicroHelp( "Opening " + This.Title + " screen...please wait." )
iw_this = this
// SFM 10/26/97 Determine db type and switch dataobjects if need be

IF cappdbtype = 'MSSQL' THEN 	dw_graph.dataobject = 'd_adhoc_master_dw_mssql'

//Save a var or two..we'll store the level needed to open as 
//  starting point for password acrually used
This.nPassLevelOpenedWith = Get_Event_Security( "QO" )

//* if password parm = 1 then require password else 0 no password
double ld_password
ld_password = Message.DoubleParm

if ld_password <> 0 then
	if not Is_PassWordOK( This.nPassLevelOpenedWith ) Then
		close(this)
		return
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

// SFM 1/21/96  replaced the useobject variables to go against
//              the administration tables
	
	uo_status.cTable2Use				= "call_stat"
	uo_status.cColumn2Retrieve		= "stat_code"
	uo_status.cColumn2AdHoc			= "opencall_stat_code"
	uo_status.load_lb					= "status"

	uo_room.cTable2Use				= "area"
	uo_room.cColumn2Retrieve		= "area_number"
	uo_room.cColumn2AdHoc			= "opencall_room"
	uo_room.load_lb					= "room"

	uo_shift.cTable2Use				= "timeshift"
	uo_shift.cColumn2Retrieve		= "shift_shortdesc"
	uo_shift.cColumn2AdHoc			= "opencall_shift"
	uo_shift.load_lb					= ""


	uo_problem.cTable2Use			= "problem"
	uo_problem.cColumn2Retrieve	= "problem_desc"
	uo_problem.cColumn2AdHoc		= "problem_problem_desc"
	uo_problem.load_lb				= ""

	uo_subproblem.cTable2Use		 = "subproblem"
	uo_subproblem.cColumn2Retrieve = "subproblem_desc"
	uo_subproblem.cColumn2AdHoc	 = "subproblem_subproblem_desc"
	uo_subproblem.load_lb    		 = ""

	uo_callercat.cTable2Use			= "instdept"
	uo_callercat.cColumn2Retrieve	= "dept"
	uo_callercat.cColumn2AdHoc		= "opencall_caller_category"
	uo_callercat.load_lb				= ""


//	uo_guestcaller.cTable2Use			= "opencall"
// uo_guestcaller.cTable2Use			= "instemp"
	uo_guestcaller.cColumn2Retrieve	= "guest"
//	uo_guestcaller.cColumn2Retrieve	= "employee"
	uo_guestcaller.cColumn2AdHoc		= "opencall_guest"
	uo_guestcaller.load_lb				= "guest"

	uo_closed_by.cTable2Use			= "user_rights"
	uo_closed_by.cColumn2Retrieve	= "user_lname = user_lname + ~', ~' + user_fname"
	uo_closed_by.cColumn2AdHoc		= "opencall_closed_by"
	uo_closed_by.load_lb				= ""

	uo_closed_bydept.cTable2Use		= "instdept"
	uo_closed_bydept.cColumn2Retrieve= "dept"
	uo_closed_bydept.cColumn2AdHoc	= "opencall_closed_bydept"
	uo_closed_bydept.load_lb			= ""

   uo_employee.cTable2Use			= "instemp"
	uo_employee.cColumn2Retrieve	= "employee"
	uo_employee.cColumn2AdHoc		= "opencall_repairman"
   uo_employee.load_lb           = ""

	uo_receivedby.cTable2Use		 = "user_rights"
	uo_receivedby.cColumn2Retrieve = "user_lname = user_lname + ~', ~' + user_fname"
	uo_receivedby.cColumn2AdHoc	 = "opencall_receiver"
   uo_receivedby.load_lb          = ""

	uo_company.cTable2Use		 	= "guest"
	uo_company.cColumn2Retrieve 	= "comp_name"
	uo_company.cColumn2AdHoc	 	= "guest_comp_name"
   uo_company.load_lb          	= ""


//	dw_graph.SetTransobject(sqlca)
	string cSqlWhere, sql
	cOrigSql 	= dw_graph.Describe("datawindow.table.select")
	sql 			= cOrigSql
	cSqlWhere 	= dw_graph.GetSqlSelect()
//	dw_graph.Retrieve()

This.Visible = True
//This.SetRedraw( True )
//wf_load_stat_array()
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
if trim(cCommandParm) = 'QA' and trim(cInitLoadQA) = 'Y' then
	this.triggerevent("ue_loadfile")
end if

this.postevent("ue_postopen")


end event

event mousemove;SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end event

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

on w_gcc_adhoc.create
if this.MenuName = "m_adhoc" then this.MenuID = create m_adhoc
this.uo_company=create uo_company
this.st_25=create st_25
this.cb_save=create cb_save
this.uo_room=create uo_room
this.uo_status=create uo_status
this.st_3=create st_3
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
this.cb_load=create cb_load
this.st_15=create st_15
this.st_4=create st_4
this.st_24=create st_24
this.st_23=create st_23
this.st_22=create st_22
this.st_20=create st_20
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
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
this.st_6=create st_6
this.cb_exitgraph=create cb_exitgraph
this.lb_graphs=create lb_graphs
this.st_1=create st_1
this.st_2=create st_2
this.dw_graph=create dw_graph
this.cb_exit=create cb_exit
this.Control[]={this.uo_company,&
this.st_25,&
this.cb_save,&
this.uo_room,&
this.uo_status,&
this.st_3,&
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
this.cb_load,&
this.st_15,&
this.st_4,&
this.st_24,&
this.st_23,&
this.st_22,&
this.st_20,&
this.st_19,&
this.st_18,&
this.st_17,&
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
this.st_6,&
this.cb_exitgraph,&
this.lb_graphs,&
this.st_1,&
this.st_2,&
this.dw_graph,&
this.cb_exit}
end on

on w_gcc_adhoc.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_company)
destroy(this.st_25)
destroy(this.cb_save)
destroy(this.uo_room)
destroy(this.uo_status)
destroy(this.st_3)
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
destroy(this.cb_load)
destroy(this.st_15)
destroy(this.st_4)
destroy(this.st_24)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
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
destroy(this.st_6)
destroy(this.cb_exitgraph)
destroy(this.lb_graphs)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_graph)
destroy(this.cb_exit)
end on

event deactivate;if isvalid(w_gcc_main) then w_gcc_main.postevent("ue_menu_set")
end event

event activate;if isvalid(w_gcc_main) then  w_gcc_main.triggerevent("ue_menu_set")
end event

type uo_company from u_multi_select_01 within w_gcc_adhoc
int X=1938
int Y=572
int Width=841
int TabOrder=240
string Tag="Select Call Close Employees to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_company.destroy
call u_multi_select_01::destroy
end on

type st_25 from statictext within w_gcc_adhoc
int X=1431
int Y=572
int Width=480
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Company"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_save from commandbutton within w_gcc_adhoc
event mousemove pbm_mousemove
int X=265
int Y=916
int Width=210
int Height=80
int TabOrder=290
string Tag="Save the currrent Q&&A query to a file on disk."
string Text="Sa&ve"
string Pointer="HAND.CUR"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;Parent.TriggerEvent( "ue_savefile" )

end on

type uo_room from u_multi_select_01 within w_gcc_adhoc
int X=480
int Y=348
int TabOrder=220
long BackColor=79349703
end type

on uo_room.destroy
call u_multi_select_01::destroy
end on

type uo_status from u_multi_select_01 within w_gcc_adhoc
int X=480
int Y=236
int TabOrder=130
long BackColor=79349703
end type

on uo_status.destroy
call u_multi_select_01::destroy
end on

type st_3 from statictext within w_gcc_adhoc
int X=27
int Y=348
int Width=425
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Room"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type uo_timer_start_to_date from u_ddcal_vz within w_gcc_adhoc
int X=983
int Y=128
int Width=425
int Height=108
int TabOrder=80
string Tag="Select call scheduled date range to for graphs and/or reports."
long BackColor=79349703
end type

event mousemove;call super::mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	SetMicroHelp( This.Tag )
//End If
end event

on uo_timer_start_to_date.destroy
call u_ddcal_vz::destroy
end on

type st_21 from statictext within w_gcc_adhoc
int X=905
int Y=144
int Width=73
int Height=76
boolean Enabled=false
string Text="To"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79349703
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type uo_timer_start_from_date from u_ddcal_vz within w_gcc_adhoc
int X=475
int Y=128
int Width=425
int Height=108
int TabOrder=70
string Tag="Select call scheduled date range from for graphs and/or reports."
long BackColor=79349703
end type

event mousemove;call super::mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	SetMicroHelp( This.Tag )
//End If
end event

on uo_timer_start_from_date.destroy
call u_ddcal_vz::destroy
end on

type st_8 from statictext within w_gcc_adhoc
int X=23
int Y=128
int Width=421
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Scheduled Date"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type lb_reports from listbox within w_gcc_adhoc
event mousemove pbm_mousemove
int X=526
int Y=748
int Width=809
int Height=364
int TabOrder=240
string Tag="Select Reports to open on Query.  (Right-click toggles 'Include <-> Exclude')."
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean MultiSelect=true
string Pointer="HAND.CUR"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
int Accelerator=114
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
cReportsAvail[1]  = "Calls by Room"
//cReportsAvail[2]  = "Calls by Status"
cReportsAvail[2]  = "Calls by Date"
cReportsAvail[3]  = "Calls by Guest"
cReportsAvail[4]  = "Calls by Task"
//cReportsAvail[6]  = "Calls by Subtask"
cReportsAvail[5]  = "Calls by Department"
//cReportsAvail[8]  = "Calls by Employee"
//cReportsAvail[9]  = "Calls by Hour of Day"
//cReportsAvail[10] = "Calls by Duration Detail"
cReportsAvail[6] = "Calls by Duration Summary"
cReportsAvail[7] = "Calls by Task Summary"
//cReportsAvail[13] = "Calls with Task Definition"
cReportSAvail[8] = "Top 10 Task Summary"

sRW2Use[1] = "w_r_callsxroom"
 RW2Use[1] =  w_r_callsxroom
//sRW2Use[2] = "w_r_callsxstatus"
// RW2Use[2] =  w_r_callsxstatus
sRW2Use[2] = "w_r_callsxdate"
 RW2Use[2] =  w_r_callsxdate
sRW2Use[3] = "w_r_callsxguest"
 RW2Use[3] =  w_r_callsxguest
sRW2Use[4] = "w_r_callsxprob"
 RW2Use[4] =  w_r_callsxprob
//sRW2Use[6] = "w_r_callsxsubprob"
// RW2Use[6] =  w_r_callsxsubprob
sRW2Use[5] = "w_r_callsxdept"
 RW2Use[5] =  w_r_callsxdept
//sRW2Use[8] = "w_r_callsxemployee"
 //RW2Use[8] =  w_r_callsxemployee
//sRW2Use[9] = "w_r_callsxhour"
// RW2Use[9] =  w_r_callsxhour
//sRW2Use[10] = "w_r_callsxduration"
// RW2Use[10] =  w_r_callsxduration
sRW2Use[6] = "w_r_callsxdurationsum"
 RW2Use[6] =  w_r_callsxdurationsum
sRW2Use[7] = "w_r_callsxproblemsum"
 RW2Use[7] = w_r_callsxproblemsum
//sRW2Use[13] = "w_r_purchase_requests"
// RW2Use[13] = w_r_purchase_requests 
sRW2Use[8] = "w_r_callsxproblemsum_new"
 RW2Use[8] = w_r_callsxproblemsum_new


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

type uo_shift from u_multi_select_01 within w_gcc_adhoc
int X=480
int Y=828
int Width=841
int TabOrder=140
boolean Visible=false
string Tag="Select Shifts to include on selected reports and graphs."
end type

on uo_shift.destroy
call u_multi_select_01::destroy
end on

type uo_closed_by from u_multi_select_01 within w_gcc_adhoc
int X=1938
int Y=460
int Width=841
int TabOrder=230
string Tag="Select Call Close Employees to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_closed_by.destroy
call u_multi_select_01::destroy
end on

type uo_employee from u_multi_select_01 within w_gcc_adhoc
int X=1938
int Y=348
int Width=841
int TabOrder=210
string Tag="Select 'Repaired By' Employees to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_employee.destroy
call u_multi_select_01::destroy
end on

type uo_closed_bydept from u_multi_select_01 within w_gcc_adhoc
int X=1938
int Y=236
int Width=841
int TabOrder=200
string Tag="Select Call Close Departments to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_closed_bydept.destroy
call u_multi_select_01::destroy
end on

type uo_subproblem from u_multi_select_01 within w_gcc_adhoc
int X=1938
int Y=128
int Width=841
int TabOrder=190
string Tag="Select Sub-Tasks to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_subproblem.destroy
call u_multi_select_01::destroy
end on

type uo_problem from u_multi_select_01 within w_gcc_adhoc
int X=1938
int Y=28
int Width=841
int TabOrder=180
string Tag="Select Tasks to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_problem.destroy
call u_multi_select_01::destroy
end on

type uo_receivedby from u_multi_select_01 within w_gcc_adhoc
int X=1943
int Y=252
int Width=841
int TabOrder=170
boolean Visible=false
string Tag="Select Call Receivers to include on selected reports and graphs."
end type

on uo_receivedby.destroy
call u_multi_select_01::destroy
end on

type uo_guestcaller from u_multi_select_01 within w_gcc_adhoc
int X=480
int Y=572
int Width=841
int TabOrder=160
string Tag="Select Guests to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_guestcaller.destroy
call u_multi_select_01::destroy
end on

type uo_callercat from u_multi_select_01 within w_gcc_adhoc
int X=480
int Y=460
int Width=837
int TabOrder=150
string Tag="Select Caller Categories to include on selected reports and graphs."
long BackColor=79349703
end type

on uo_callercat.destroy
call u_multi_select_01::destroy
end on

type uo_ddcal_closedate_to from u_ddcal_vz within w_gcc_adhoc
event mousemove pbm_mousemove
int X=983
int Y=140
int Width=421
int Height=92
int TabOrder=40
boolean Visible=false
string Tag="Select maximum (latest) Close Date of Calls to include on selected reports and graphs."
string Pointer="ibeam!"
end type

on mousemove;call u_ddcal_vz::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on uo_ddcal_closedate_to.destroy
call u_ddcal_vz::destroy
end on

type uo_ddcal_closedate_from from u_ddcal_vz within w_gcc_adhoc
event mousemove pbm_mousemove
int X=475
int Y=140
int Width=425
int Height=92
int TabOrder=30
boolean Visible=false
string Tag="Select minimum (earliest) Close Date of Calls to include on selected reports and graphs."
string Pointer="ibeam!"
end type

on mousemove;call u_ddcal_vz::mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on uo_ddcal_closedate_from.destroy
call u_ddcal_vz::destroy
end on

type uo_ddcal_opendate_to from u_ddcal_vz within w_gcc_adhoc
event mousemove pbm_mousemove
int X=983
int Y=28
int Width=425
int Height=108
int TabOrder=20
string Tag="Select minimum (latest) Open Date or Calls to include on selected reports and graphs."
string Pointer="ibeam!"
long BackColor=79349703
end type

event mousemove;call super::mousemove;//// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then
//Else
//	// left button is down, set MicroHelp()
//	SetMicroHelp( This.Tag )
//End If
//
end event

on uo_ddcal_opendate_to.destroy
call u_ddcal_vz::destroy
end on

type uo_ddcal_opendate_from from u_ddcal_vz within w_gcc_adhoc
event mousemove pbm_mousemove
int X=475
int Y=28
int Width=439
int Height=100
int TabOrder=10
string Tag="Select minimum (earliest) Open Date of Calls to include on selected reports and graphs."
string Pointer="ibeam!"
long BackColor=79349703
end type

on uo_ddcal_opendate_from.destroy
call u_ddcal_vz::destroy
end on

type cb_clear from commandbutton within w_gcc_adhoc
event mousemove pbm_mousemove
int X=27
int Y=796
int Width=448
int Height=92
int TabOrder=270
string Tag="CLEAR ALL currently selected CRITERIA, REPORTS and GRAPHS."
string Text="&Clear"
string Pointer="HAND.CUR"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;SetMicroHelp( This.Tag )

end on

on clicked;Parent.TriggerEvent( "ue_clear" )
end on

type cb_view from commandbutton within w_gcc_adhoc
event mousemove pbm_mousemove
int X=27
int Y=676
int Width=448
int Height=92
int TabOrder=260
string Tag="Query the database with the currently selected criteria."
string Text="&Query"
string Pointer="HAND.CUR"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

//dw_graph.visible = true

int niCtr, nResponse
string cLocAdHocFilt	// we use a local to compare to win instance of last used
pointer pOldPointer = SetPointer( HourGlass! )
boolean lSfsg
string ls_sql_select , ls_filter
long ll_rows

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

// if none selected then go into advanced
If Len( Trim( cLocAdHocFilt ) ) = 0 Then
	// If a Super-User Opened This Window
	If nPassUserRights >= 90 Then	// super-user
		nResponse = MessageBox( "Advanced Query?", "This application can create "+&
					"UNLIMITED NESTING OF CONDITIONAL QUERIES.  You can create Queries "+&
					"using Parenthesis as well as  AND, OR and NOT.  " + &
					"Using this option successfully will require the abilities of a SQL " + &
					"DBA (DataBase Administrator) who is fully familiar with the structure of " + &
					"the tables in this application's database.  Would you like to open the " + &
					"ADVANCED AD-HOC QUERY BUILDER?", Question!, YesNo!, 2 )
		If nResponse = 1 Then
			SetNull( cLocAdHocFilt )
		End If
	End If
End If

// SFM 1/21/97 queries the uo_status object for selected status's
// sets instance vars that coraspond to the different call tables

  wf_check_status()
// ib_pendingcalls = true

// Check return results from built query
if not wf_dwmodify(cLocAdHocFilt) then
	MessageBox( "Query Failure!", "The criteria specified has somehow caused " +&
				"an ERROR.  Please RE-SPECIFY CRITERIA in  a different "+&
				"manner.  Please call for support if specified criteria "+&
				"looks OK and problem persists.", StopSign! )
	lSfsg = False	// don't set query filter
Else
	
	For niCtr = 1 To UpperBound( GW2Use )
		If IsValid( GW2Use[niCtr] ) Then GW2Use[niCtr].TriggerEvent( "ue_sharedataoff" )
	Next
	For niCtr = 1 To UpperBound( RW2Use )
		If IsValid( RW2Use[niCtr] ) Then	RW2Use[niCtr].TriggerEvent( "ue_sharedataoff" )
	Next
	
	nResponse = 1
	If cLocAdHocFilt = cAdHocFilt And dw_graph.RowCount() > 0 Then	// if no change then at least ask
		nResponse = MessageBox( "Refresh Data?", "Your Data Select Criteria has not " + &
					"changed since last executed.  Do you wish to REFRESH the DATA at " + &
					"this workstation?", Question!, YesNo!, 2 )
 	End If

	If nResponse <> 2 Then ll_rows = dw_graph.Retrieve()
	ls_sql_select = dw_graph.GetSQLSelect()
	ls_filter = dw_graph.Object.DataWindow.Table.Filter
	
	If IsValid( w_gcc_adhoc ) Then
		// forces inheritance of Q&A menu to re-select this right before graph and rep win's
		OpenSheet( w_gcc_adhoc, "w_gcc_adhoc", w_gcc_main, 0, Original! )
		If lb_graphs.TotalSelected() + lb_reports.TotalSelected() > 0 Then
			w_gcc_main.ArrangeSheets( Layer! )
			
			// Set parms structure
			istr_report_parms.cReportType 		= cReportType
			istr_report_parms.dwsource				= dw_graph
			istr_report_parms.wcaller				= parent
			istr_report_parms.s_report_parms1	= is_report_parms1
			istr_report_parms.s_report_parms2	= is_report_parms2
			
			// Let's open selected graphs
			For niCtr = LowerBound( cGraphsAvail ) To UpperBound( cGraphsAvail )
				If lb_graphs.State(niCtr) = 1 Then
					OpenSheetWithParm( GW2Use[niCtr], istr_report_parms, sGW2Use[nictr], w_gcc_main, 0, Original! )
				End If
				// seperated in case we have open graphs from as prior query no longer selected
				If IsValid(GW2Use[niCtr]) Then GW2Use[niCtr].event DYNAMIC ue_sharedataon(istr_report_parms)
			Next
			// Let's open selected reports
			For niCtr = LowerBound( cReportsAvail ) To UpperBound( cReportsAvail )
				If lb_reports.State(niCtr) = 1 Then
	//		vz		if sRW2Use[niCtr] = "w_r_callsxproblemsum_new" then
	//					OpenSheetWithParm( RW2Use[niCtr], cLocAdHocFilt, sRW2Use[nictr], w_gcc_main, 0, Original! )
	//				else
						OpenSheetWithParm( RW2Use[niCtr], istr_report_parms, sRW2Use[nictr], w_gcc_main, 0, Original! )			
	//				end if
				End If
				// seperated in case we have open reports from as prior query no longer selected
				If IsValid(RW2Use[niCtr]) Then RW2Use[niCtr].event DYNAMIC ue_sharedataon(istr_report_parms)
			Next
			w_gcc_main.ArrangeSheets( Tile! )
			w_gcc_main.ArrangeSheets( Icons! )
			// reselects adhoc window after opening all others
			OpenSheet( w_gcc_adhoc, "w_gcc_adhoc", w_gcc_main, 0, Original! )
		Else
			MessageBox( "Incomplete Selection!", "Please click on a Report or "+&
						"Graph to select something to show the query data "+&
						"on.", Information! )
		End If	// reports and/or graphs selected
	End If	// window not closed during retrieve()
End If

//cb_exitgraph.Visible = True
//w_gcc_adhoc.ChangeMenu( m_graph )
SetPointer( pOldPointer )
w_gcc_main.SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

// if Query OK then let's save so we know whether or not to retrieve next time here
If lSfsg Then cAdHocFilt = cLocAdHocFilt

// if autoLoad = true, save the QA String automatically
if autoLoad then parent.triggerevent("ue_savefile")

wf_set_button(1)
end event

type cb_load from commandbutton within w_gcc_adhoc
event mousemove pbm_mousemove
int X=27
int Y=916
int Width=201
int Height=80
int TabOrder=280
string Tag="Load a Q&A query from a previously saved file on disk."
string Text="&Load"
string Pointer="HAND.CUR"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;SetMicroHelp( This.Tag )

end on

event clicked;ccommandparm=""
Parent.TriggerEvent("ue_loadfile")
end event

type st_15 from statictext within w_gcc_adhoc
int X=905
int Y=44
int Width=73
int Height=76
boolean Enabled=false
string Text="To"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79349703
long BorderColor=25231359
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_gcc_adhoc
int X=905
int Y=160
int Width=73
int Height=76
boolean Visible=false
boolean Enabled=false
string Text="To"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=12632256
long BorderColor=25231359
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_24 from statictext within w_gcc_adhoc
int X=1431
int Y=460
int Width=480
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Closed By "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_23 from statictext within w_gcc_adhoc
int X=1431
int Y=348
int Width=480
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Handled By "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_22 from statictext within w_gcc_adhoc
int X=1431
int Y=236
int Width=480
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Department "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_20 from statictext within w_gcc_adhoc
int X=1431
int Y=128
int Width=480
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Sub-Task "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_19 from statictext within w_gcc_adhoc
int X=1431
int Y=32
int Width=480
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Task "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_18 from statictext within w_gcc_adhoc
int X=1435
int Y=252
int Width=480
int Height=76
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Received By "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_17 from statictext within w_gcc_adhoc
int X=27
int Y=572
int Width=425
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Guest/Caller "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_16 from statictext within w_gcc_adhoc
int X=27
int Y=460
int Width=425
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Caller Category "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_timeofday_to from editmask within w_gcc_adhoc
event mousemove pbm_mousemove
int X=992
int Y=484
int Width=407
int Height=92
int TabOrder=100
boolean Visible=false
string Tag="Enter Maximum (latest) Time scheduled to include on graphs and/or reports."
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="hh:mm"
MaskDataType MaskDataType=TimeMask!
boolean Spin=true
double Increment=1
string MinMax="~~"
string Text=" "
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type em_timemin_to from editmask within w_gcc_adhoc
event mousemove pbm_mousemove
int X=992
int Y=260
int Width=407
int Height=92
int TabOrder=60
boolean Visible=false
string Tag="Enter Maximum (longest) Duration of Open Call to include on graphs and/or reports."
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="#######"
boolean Spin=true
double Increment=1
string MinMax="0~~999999999999"
string Text=" "
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type em_timeofday_from from editmask within w_gcc_adhoc
event mousemove pbm_mousemove
int X=485
int Y=484
int Width=407
int Height=92
int TabOrder=90
boolean Visible=false
string Tag="Enter Minimum (earliest) Time scheduled to include on graphs and/or reports."
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="hh:mm"
MaskDataType MaskDataType=TimeMask!
boolean Spin=true
double Increment=1
string MinMax="~~"
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type em_timemin_from from editmask within w_gcc_adhoc
event mousemove pbm_mousemove
int X=485
int Y=260
int Width=407
int Height=92
int TabOrder=50
boolean Visible=false
string Tag="Enter Minimum (shortest) Duration of Open Call to include on graphs and/or reports."
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="#######"
boolean Spin=true
double Increment=1
string MinMax="0~~999999999999"
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type st_5 from statictext within w_gcc_adhoc
int X=27
int Y=236
int Width=425
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Status"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_12 from statictext within w_gcc_adhoc
int X=23
int Y=828
int Width=421
int Height=76
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Shift "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_11 from statictext within w_gcc_adhoc
int X=23
int Y=484
int Width=421
int Height=76
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Scheduled Time"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_10 from statictext within w_gcc_adhoc
int X=23
int Y=260
int Width=421
int Height=76
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Duration Min "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within w_gcc_adhoc
int X=23
int Y=140
int Width=421
int Height=76
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Close Date "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_callnum_to from editmask within w_gcc_adhoc
event mousemove pbm_mousemove
int X=1335
int Y=596
int Width=78
int Height=92
int TabOrder=120
boolean Visible=false
string Tag="Enter Maximum (highest) Call Number to include on graphs and/or reports."
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="#########"
boolean Spin=true
double Increment=100
string MinMax="0~~0"
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;SetMicroHelp( This.Tag )

end on

type em_callnum_from from editmask within w_gcc_adhoc
event mousemove pbm_mousemove
int X=1243
int Y=596
int Width=82
int Height=92
int TabOrder=110
boolean Visible=false
string Tag="Enter Minimum (lowest) Call Number to include on graphs and/or reports."
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="#########"
boolean Spin=true
double Increment=100
string MinMax="0~~0"
string Text=" "
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;SetMicroHelp( This.Tag )

end on

type st_6 from statictext within w_gcc_adhoc
int X=23
int Y=28
int Width=421
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Open Date "
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_exitgraph from commandbutton within w_gcc_adhoc
int X=3063
int Y=684
int Width=357
int Height=108
int TabOrder=310
boolean Visible=false
string Text="Exi&t"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_graph.Visible = False
cb_exitgraph.Visible = False
parent.ChangeMenu( m_main )

end event

type lb_graphs from listbox within w_gcc_adhoc
event mousemove pbm_mousemove
int X=1353
int Y=748
int Width=1051
int Height=364
int TabOrder=250
string Tag="Select Graphs to open on Query.  (Right-click toggles 'Include <-> Exclude')."
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean MultiSelect=true
string Pointer="HAND.CUR"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
int Accelerator=103
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

cGraphsAvail[1]   = "Avg. response time per Department"
//cGraphsAvail[2]   = "Avg. response time per Shift"
cGraphsAvail[2]   = "Avg. response time per Task"
cGraphsAvail[3]   = "Avg. response time per Subtask"
cGraphsAvail[4]   = "Avg. response time per Dispatcher"
//cGraphsAvail[6]   = "Avg. response time per Employee"
//cGraphsAvail[7]   = "Qty. of Calls Handled per Hour"
//cGraphsAvail[8]   = "Qty. of Calls Handled per Employee"
//cGraphsAvail[9]   = "Qty. of Calls per Task"
//cGraphsAvail[10]   = "Qty. of Calls By Hour Across Days"
//cGraphsAvail[11]  = "Qty. of Calls By Employee Across Days"


 GW2Use[1]  =  w_g_avgminsxdept
sGW2Use[1]  = "w_g_avgminsxdept"
// GW2Use[2]  =  w_g_avgminsxshift
//sGW2Use[2]  = "w_g_avgminsxshift"
 GW2Use[2]  =  w_g_avgminsxprob
sGW2Use[2]  = "w_g_avgminsxprob"
 GW2Use[3]  =  w_g_avgminsxsubprob
sGW2Use[3]  = "w_g_avgminsxsubprob"
 GW2Use[4]  =  w_g_avgminsxdisp
sGW2Use[4]  = "w_g_avgminsxdisp"
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

For niCtr = LowerBound( cGraphsAvail ) TO UpperBound( cGraphsAvail ) 
	AddItem( String(niCtr, "00") +" - " + cGraphsAvail[niCtr] )

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

type st_1 from statictext within w_gcc_adhoc
int X=526
int Y=684
int Width=809
int Height=68
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="&Reports"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_gcc_adhoc
int X=1353
int Y=684
int Width=1051
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="&Graphs"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=128
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_graph from datawindow within w_gcc_adhoc
int X=2432
int Y=684
int Width=233
int Height=420
boolean BringToTop=true
string DataObject="d_gcc_adhoc_master_dw"
boolean TitleBar=true
string Title="Graph and Report Data Source"
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
boolean LiveScroll=true
string Icon="GRAPH.ICO"
end type

event retrievestart;// SFM 1/23/97
// if  necessary perform multiple counts against the three call tables
string cnt_string, sqlcnt, ls_where
long ll_totrows

SetPointer( HourGlass! )
nRowCtr = 0
ntotrows = 0
sqlcnt = newsqlcnt

//delete from top10task;
do while pos(sqlcnt,"~~") > 0
	sqlcnt = replace(sqlcnt,pos(sqlcnt,"~~"),1,"")
loop

str_progress lstr_progress
lstr_progress.ss_title         = ' Q&A Session Progress'
lstr_progress.sw_callingwindow = parent
lstr_progress.ss_message       = 'Preparing request...'
openwithparm(w_progress_window, lstr_progress)

IF ib_closedcalls then
   
   cnt_string = 'SELECT count(*) FROM ' + &
				 '"closedcalls","problem","subproblem", "guest" ' + sqlcnt
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
   parent.ntotrows += ll_totrows
END IF

IF ib_timercalls then
   ls_where = str_replace_all(sqlcnt,'closedcalls','timercalls')
   cnt_string = 'SELECT count(*) FROM ' + &
				 '"timercalls","problem","subproblem", "guest" ' + ls_where
   PREPARE sqlsa FROM :cnt_string using it_trans;
   DECLARE tcalls_cursor DYNAMIC CURSOR FOR sqlsa;
   OPEN DYNAMIC tcalls_cursor;  
   if it_trans.sqlcode < 0 then
	   MessageBox("DataBase Error!", it_trans.sqlerrtext)
   end if 
   Fetch tcalls_cursor into :ll_totrows;
   if it_trans.sqlcode <> 0 then
	   MessageBox("DB Error","Fetch : " + it_trans.sqlerrtext)
   end if
   close tcalls_cursor;
    parent.ntotrows += ll_totrows
END IF

IF ib_pendingcalls then
   ls_where = str_replace_all(sqlcnt,'closedcalls','pendingcalls')
   cnt_string = 'SELECT count(*) FROM ' + &
				 '"pendingcalls","problem","subproblem", "guest" ' + ls_where
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
   parent.ntotrows += ll_totrows
END IF

// every 100th
nTotRows = Max( nTotRows, 1 )
nRowEvery = Max( Int( nTotRows / 20 ), 1 )

//str_progress lstr_progress
//
//lstr_progress.ss_title         = ' Q&A Session Progress'
//lstr_progress.sw_callingwindow = parent
//lstr_progress.ss_message       = 'Processing request...'
//openwithparm(w_progress_window, lstr_progress)
//
If IsValid(w_progress_window) THEN w_progress_window.wf_set_message("Processing request...")
 
end event

event retrieveend;If IsValid( w_gcc_main ) Then
	w_gcc_main.SetMicroHelp( "Q&A Session - Retrieved a total of "+String( rowcount)+" rows." )
End If
SetPointer( Arrow! )

IF IsValid(w_progress_window) THEn	close(w_progress_window)


 
end event

event retrieverow;////nRowCtr = nRowCtr + 1
If Mod( row, nRowEvery ) = 0 Or row >= nTotRows Then
	If IsValid(w_progress_window) THEN
   	w_progress_window.wf_set_message("Q&A Session - Retrieving row "+String(row)+ &
  					" of "+ String( nTotRows ) + "  -  " + &
   				String( Round( ( row / nTotRows ) * 100, 0 ) )+"% complete.")
   End If
end if

end event

type cb_exit from commandbutton within w_gcc_adhoc
event mousemove pbm_mousemove
int X=27
int Y=1020
int Width=448
int Height=92
int TabOrder=300
string Tag="Leave the current Q&&A session.  You will be prompted again if any reports or Graphs are open."
string Text="E&xit"
string Pointer="HAND.CUR"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;SetMicroHelp( This.Tag )

end on

on clicked;Close(Parent)
//w_adhoc.Visible = False
end on

