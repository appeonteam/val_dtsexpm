$PBExportHeader$w_timer_calls.srw
$PBExportComments$Timer Calls Browse Screen
forward
global type w_timer_calls from window
end type
type p_1 from picture within w_timer_calls
end type
type pb_exit from picturebutton within w_timer_calls
end type
type pb_closecall from picturebutton within w_timer_calls
end type
type pb_refresh from picturebutton within w_timer_calls
end type
type pb_filter from picturebutton within w_timer_calls
end type
type p_3 from picture within w_timer_calls
end type
type p_2 from picture within w_timer_calls
end type
type pb_1 from picturebutton within w_timer_calls
end type
type cb_closecall from commandbutton within w_timer_calls
end type
type cb_2 from commandbutton within w_timer_calls
end type
type st_25 from statictext within w_timer_calls
end type
type st_24 from statictext within w_timer_calls
end type
type st_readsecs from statictext within w_timer_calls
end type
type st_nextread from statictext within w_timer_calls
end type
type st_21 from statictext within w_timer_calls
end type
type st_19 from statictext within w_timer_calls
end type
type st_lastread from statictext within w_timer_calls
end type
type st_15 from statictext within w_timer_calls
end type
type st_alarmevery from statictext within w_timer_calls
end type
type st_14 from statictext within w_timer_calls
end type
type st_13 from statictext within w_timer_calls
end type
type st_12 from statictext within w_timer_calls
end type
type st_nexttimer from statictext within w_timer_calls
end type
type st_lasttimer from statictext within w_timer_calls
end type
type cb_3 from commandbutton within w_timer_calls
end type
type cb_refresh from commandbutton within w_timer_calls
end type
type cb_1 from commandbutton within w_timer_calls
end type
type st_1 from statictext within w_timer_calls
end type
type dw_1 from datawindow within w_timer_calls
end type
type st_16 from statictext within w_timer_calls
end type
type st_7 from statictext within w_timer_calls
end type
type p_bomb from picture within w_timer_calls
end type
type st_bomb from statictext within w_timer_calls
end type
end forward

global type w_timer_calls from window
integer x = 5
integer y = 140
integer width = 3936
integer height = 1892
boolean titlebar = true
string title = "Timer Calls - View"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 134217728
string icon = "CLOCK01A.ICO"
event ue_print pbm_custom01
event ue_printscreen pbm_custom02
event ue_postopen pbm_custom03
p_1 p_1
pb_exit pb_exit
pb_closecall pb_closecall
pb_refresh pb_refresh
pb_filter pb_filter
p_3 p_3
p_2 p_2
pb_1 pb_1
cb_closecall cb_closecall
cb_2 cb_2
st_25 st_25
st_24 st_24
st_readsecs st_readsecs
st_nextread st_nextread
st_21 st_21
st_19 st_19
st_lastread st_lastread
st_15 st_15
st_alarmevery st_alarmevery
st_14 st_14
st_13 st_13
st_12 st_12
st_nexttimer st_nexttimer
st_lasttimer st_lasttimer
cb_3 cb_3
cb_refresh cb_refresh
cb_1 cb_1
st_1 st_1
dw_1 dw_1
st_16 st_16
st_7 st_7
p_bomb p_bomb
st_bomb st_bomb
end type
global w_timer_calls w_timer_calls

type variables
long il_Scan_Every = 0  // Timer interval to scan for open calls
long iL_Alarm_Every = 0 // Timer Alarm Threshold
long il_Alarm_DurationL1=0  // Timer Level 1
long il_Alarm_DurationL2=0  // Timer Level 2
long il_Alarm_DurationL3=0  // Timer Level 3
string origSelectionStr=''

boolean lTriggerTimer = True
datetime tLastTimer    // Time of last timer
datetime tNextTimer   // time to trigger next timer

boolean lPasswordNeeded2Close=True
string cAppIcon 
string is_ScrAlarmBMPL1A, is_ScrAlarmBmpL1B
string is_ScrAlarmBMPL2A, is_ScrAlarmBMPL2B
string is_ScrAlarmBMPL3A, is_ScrAlarmBMPL3B
string cNCallScrBMP1
string cNCallScrBMP2
string cYCallScrBMP1
string cYCallScrBMP2
 
string cNCallWinIcon1
string cNCallWinIcon2
string cYCallWinIcon1
string cYCallWinIcon2
string cAlarmWinIcon1
string cAlarmWinIcon2
string cMicroHelpAlarmL1,cMicroHelpAlarmL2,cMicroHelpAlarmL3

string dwSelectStr
string deptSelectionStr

uint wavFlag
end variables

forward prototypes
public function string file_path (string cstring2start, string cpath2use)
public function boolean wf_mod_selections (string deptstr)
public function integer wf_check_paging ()
end prototypes

on ue_print;dw_1.print()
end on

on ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end on

event ue_postopen;dw_1.settransobject(sqlca)
/****  modify select string logic ****/
//dwSelectStr = dw_1.Describe("datawindow.table.select")
dwSelectStr = origSelectionStr
wf_mod_selections(deptSelectionStr)
/***** end modify select string logic ****/
dw_1.retrieve()

// sfm update to sort 8/22/96
if dw_1.SetSort( "compute_0024 A, durationminutesopen D ") <> 1 Then
	MessageBox("Sort Problem","Couldn't set-sort Timer data correctly.",StopSign!)
End If

if dw_1.Sort( ) <> 1 Then
	MessageBox("Sort Problem","Couldn't sort Timer data correctly.",StopSign!)
End If


w_main.postevent("ue_menu_set")
end event

public function string file_path (string cstring2start, string cpath2use);If Pos( cString2Start, "\" ) <= 0 Then
	cString2Start = cPath2Use + cString2Start
End If

return cString2Start
end function

public function boolean wf_mod_selections (string deptstr);string deptid[]
string deptTimerNmStr, deptTimerStr
string modRes, newDwSelectStr
string selectStr3, selectStr4, selectStr5, modStr, selectStr1, selectStr2
int posStart, posStop, posInt, numOfDept, i, j

if len(trim(deptStr)) = 0 then
//	return true //no need to do anything
	modStr = "datawindow.table.select=~""+origSelectionStr+"~""
	goto ModifyDW
end if

numOfDept = 1
i = 1
DO UNTIL i > len(trim(deptStr))
	j = pos(deptStr, ',', i) 
	if j  > 0 then
		deptid[numOfDept] = mid(deptStr, i, j - i)
		i = j + 1
		numOfDept++
	else
		deptid[numOfDept] = mid(deptStr, i) 
		i = len(trim(deptStr)) + 1
	end if
	
LOOP


depttimerNmStr   = ' ~~"timercalls~~".~~"closed_bydept~~" = '

i = 1 
do while i <= numOfDept
	if i = 1 then
		deptTimerStr     = depttimerNmStr + "'" + deptid[i] + "' " 
	else
		deptTimerStr     = deptTimerStr + " or " + depttimerNmStr + "'" + deptid[i] + "' " 
	end if
	i++
loop

deptTimerStr	  = " and (" + deptTimerStr + ") "						
						 
//**************************************************************							 
posStart = 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - 1

selectStr3 = mid(dwSelectStr, posStart, posStop)  	// timer select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'UNION' in dwSelectStr")
	return false
end if

posStop = posInt - posStart - 1
selectStr4 = mid(dwSelectStr, posStart, posStop) 	// timer where

//**************************************************************	
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr1 = mid(dwSelectStr, posStart, posStop)  	//2nd pending select

posStart =posStart + posStop + 1

posStop = len(dwSelectStr) + 1
selectStr2 = mid(dwSelectStr, posStart, posStop) 	//2nd pending where
//**************************************************************	
//modify where strings


selectStr4 = selectStr4 + deptTimerStr
selectStr2 = selectStr2 + deptTimerStr

//new string

dwSelectStr = selectStr3 + selectStr4 + selectStr1 + selectStr2 + selectStr5

ModifyDW:
modStr = "datawindow.table.select=~""+dwSelectStr+"~""
//MessageBox('modStr',modStr)
modRes = dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw1 Modidy Error", modRes)
	return false
end if


newDwSelectStr = dw_1.Describe("datawindow.table.select")
//MessageBox("newDwSelectStr",newDwSelectStr)
//if dw_1.Retrieve() < 0 then
//   MessageBox("DW error","retrieve error")
//end if

return true
end function

public function integer wf_check_paging ();Long ll_row
string ls_call_no , ls_test

FOR ll_ROW = 1 to dw_1.rowcount()
	 IF dw_1.getitemstring(ll_row,'paging_ind') = "0" THEN
//		 IF dw_1.getitemdecimal(ll_row,'durationminutesopen') >= 15 THEN
          ls_call_no = dw_1.getitemstring(ll_row,'call_number')
  
          update timercalls
			 set paging_ind = '1'
			 where  call_number = :ls_call_no ;
		    if sqlca.sqlcode <> 0 then
	          MessageBox("DB Error",sqlca.sqlerrtext)
	          rollback;
	          return -1
          end if
      	 UPDATE "pageassignment"  
          SET "page_sent" = 'N'  
          WHERE "pageassignment"."call_number" = :ls_call_no   ;
          if sqlca.sqlcode <> 0 then
	          MessageBox("DB Error",sqlca.sqlerrtext)
	          rollback;
	          return -1
          end if
          commit;			
	      dw_1.setitem(ll_row,"paging_ind",'1')
      END IF
//	 END IF
NEXT
 
return 1

end function

event open;
/* Modifications 9/5/95
  
   Pulled original commented-out code
   Renamed several instance variables for readablity
   Added instance variables to correspond to updated 2 new timer levels
   converted sciptwide if statement
   Other Modifications are noted below */


/********* Check Security To Enter This Window *****************/
//
//If not Is_PassWordOK( Get_Event_Security( "TO" ) ) Then
//      SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
//      w_timer_calls.lPasswordNeeded2Close = False
//      Close(w_timer_calls)
//End If
//

/******************************************************************/

 

/**********************Load Data From INI File *********************/
il_Scan_every       = ProfileInt( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
					"Timer", "ReadSeconds", 15 )
il_Alarm_Every      = ProfileInt( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,& 
					"Timer", "AlarmSeconds", 90 )
il_Alarm_DurationL1 = ProfileInt( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,& 
				"Timer", "alarmDurationSeconds", 8 )			
il_Alarm_DurationL2 = ProfileInt( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,& 
				"Timer", "alarmDurationSeconds", 8 )	
il_Alarm_DurationL3 = ProfileInt( gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,& 
				"Timer", "alarmDurationSeconds", 8 )	
//il_Alarm_DurationL1 = ProfileInt( cINIPath+cINIFile, "Timer", "AlarmDurationSecondsL1", 8 )
//il_Alarm_DurationL2 = ProfileInt( cINIPath+cINIFile, "Timer", "AlarmDurationSecondsL2", 8 )
//il_Alarm_DurationL3 = ProfileInt( cINIPath+cINIFile, "Timer", "AlarmDurationSecondsL3", 8 )

			
cNCallScrBMP1  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenNoCallsBMP1", "clock01a.bmp" ), cAppPath )
cNCallScrBMP2  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenNoCallsBMP2", cNCallScrBMP1 ), cAppPath )
cYCallScrBMP1  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenYesCallsBMP1", cNCallScrBMP1 ), cAppPath )
cYCallScrBMP2  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenYesCallsBMP2", cYCallScrBMP1 ), cAppPath )

cNCallWinIcon1 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"WindowNoCallsIcon1", "clock01a.ico" ), cAppPath )
cNCallWinIcon2 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"WindowNoCallsIcon2", cNCallWinIcon1 ), cAppPath )
cYCallWinIcon1 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"WindowYesCallsIcon1", cNCallWinIcon1 ), cAppPath )
cYCallWinIcon2 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"WindowYesCallsIcon2", cYCallWinIcon1 ), cAppPath )
cAlarmWinIcon1 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"WindowTimerAlarmIcon1", cYCallWinIcon1 ), cAppPath )
cAlarmWinIcon2 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"WindowTimerAlarmIcon2", "" ), cAppPath )
cMicroHelpAlarmL1 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"AlarmMicroHelpStringL1", "!!! Timer Alert !!!" ), cAppPath )
cMicroHelpAlarmL2 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"AlarmMicroHelpStringL2", "!!! Timer Alert !!!" ), cAppPath )
cMicroHelpAlarmL3 = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"AlarmMicroHelpStringL3", "!!! Timer Alert !!!" ), cAppPath )


/* Loads bitmap files from ini file each set below corrasponds to
   timer levels of retrieved calls 
   these bitmaps are displayed when timer is triggered  */

/******************* Modification 09/05/95 *****************/
/* Renamed instance variables added 2 sets on bitmaps in ini file
   here we load the new bitmaps */

/* bitmaps for Timer  level 1 */

is_ScrAlarmBMPL1A = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenTimerAlarmBMP1", "ScrAlarmBMPL1A" ), cAppPath )
//is_ScrAlarmBMPL1A = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
//                                              "ScrAlarmBMPL1A", "" ), cAppPath )

is_ScrAlarmBMPL1B  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenTimerAlarmBMP2", "ScrAlarmBMPL1B" ), cAppPath )
//is_ScrAlarmBMPL1B  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
//                                              "ScrAlarmBMPL1B", "" ), cAppPath )

/* bitmaps for Timerlevel 2 */
is_ScrAlarmBMPL2A  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
					  "ScreenTimerAlarmBMP11", "ScrAlarmBMPL2A" ), cAppPath )
is_ScrAlarmBMPL2B  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScreenTimerAlarmBMP22", "ScrAlarmBMPL2B" ), cAppPath )

/* bitmaps for Timer level 3 */
is_ScrAlarmBMPL3A  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
					  "ScrAlarmBMPL3A", "" ), cAppPath )
is_ScrAlarmBMPL3B  = File_Path( ProfileString( cINIPath+cINIFile, "Timer", &
						"ScrAlarmBMPL3B", "" ), cAppPath )

/**************** End Modification ********************************/

/****** add logic to filter dept *****/

deptSelectionStr =  ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,& 
					"Timer", "Dept", "")

origSelectionStr=dw_1.Describe("datawindow.table.select")
/****** end filter mod ***************/

SetMicroHelp( "Opening Timer Calls view screen...please wait." )
st_1.Text = cRegSite
st_lastread.Text = String( Now(), cTimeFormat )
st_readsecs.Text = String( il_Scan_every )


// SFM 10/26/97 Determine db type and switch dataobjects if need be

IF cappdbtype = 'MSSQL' THEN
	dw_1.dataobject = 'd_timer_calls_mssql'
END IF



/**********************Column Color Variables*********************/
/* Sfm Modification 09/05/95
 Renamed instance variables and added timer_level column to
   column list array  */
/* These variables are used to set column colors in d_timer_calls
   datawindow, tried to place in datwindow attributes but recieve
   many gpf's so we will leave it here */

Long   ll_bcolor15,ll_bcolor10,ll_bcolor5,ll_bcolor0,ll_bcolor_default
Long   ll_tcolor15,ll_tcolor10,ll_tcolor5,ll_tcolor0,ll_tcolor_default

String ls_backcolor, ls_textcolor, ls_columns[] , ls_return_code
String ls_MinOpenCompute

Int    li_column_cnt, li_cnt  

ll_tcolor15                     = 65535         // Yellow       -       after 15 min.'s
ll_tcolor10                     = 0                     // Black                -       after 10 min.'s
ll_tcolor5                      = 0                     // Black                -       after  5 min.'s
ll_tcolor0                      = 0                     // Black                -       after  0 min.'s
ll_tcolor_Default       = 0                     // Black                -       if appearing accidentally

ll_bcolor15                     = 255                   // Red          -       after 15 min.'s
ll_bcolor10                     = 65535         // Yellow       -       after 10 min.'s
ll_bcolor5                      = 65280         // Green                -       after  5 min.'s
ll_bcolor0                      = 16777215      // White                -       after  0 min.'s
ll_bcolor_default       = 16777215      // White                -       if appearing accidentally

ls_MinOpenCompute = "((DaysAfter( Date(timer_start), Today() ) * 1440) + &
	 (SecondsAfter( Time(timer_start), Now() ) / 60))"

/* Set background color of columns in d_timer_calls */

ls_backcolor = &
	'.background.color = ~''+String( ll_bcolor_default) +' ~t&
   if( ' + ls_MinOpenCompute + ' >= 15, ' + String( ll_bcolor15 ) + ',  &
   if( ' + ls_MinOpenCompute + ' >= 10, ' + String( ll_bcolor10 ) + ',  &
	if( ' + ls_MinOpenCompute + ' >=  5, ' + String( ll_bcolor5 ) + ',  &
	if( ' + ls_MinOpenCompute + ' >=  0, ' + String( ll_bcolor0 ) + ', '+&
	String( ll_bcolor_default )+') ) ) )~''

/* Set Text colors in d_timer_calls */
ls_textcolor = &
		'.color = ~''+String( ll_tcolor_default ) +' ~t&
	if( ' + ls_MinOpenCompute + ' >= 15, ' + String( ll_tcolor15 ) + ',  &
	if( ' + ls_MinOpenCompute + ' >= 10, ' + String( ll_tcolor10 ) + ',  &
	if( ' + ls_MinOpenCompute + ' >=  5, ' + String( ll_tcolor5 ) + ',  &
	if( ' + ls_MinOpenCompute + ' >=  0, ' + String( ll_tcolor0 ) + ', '+&
	String( ll_tcolor_default )+') ) ) )~''

ls_columns[1] = 'area_area_name'
ls_columns[2] = 'timercalls_caller_category'
ls_columns[3] = 'timercalls_guest'
ls_columns[4] = "problem_problem_desc"
ls_columns[5] = "subproblem_desc"
ls_columns[6] = "closed_bydept"
ls_columns[7] = "repairman"
ls_columns[8] = "timercalls_problem_definition"
ls_columns[9] = "durationminutesopen"
ls_columns[10] = "call_number"
ls_columns[11] = "callstat_stat_desc"
ls_columns[12] = 'paging_ind'


//// now let's re-color the columns

li_column_cnt = UpperBound( ls_columns )
For li_cnt = 1 to li_column_cnt
   ls_return_code = dw_1.Modify( ls_columns[li_cnt] + ".background.mode=0" )
	If ls_return_code <> "" Then
		MessageBox("Status", "Unable to set background mode to Opaque for "+&
							ls_columns[li_cnt] + " - " + ls_return_code + ".")
	End If
	ls_return_code = dw_1.Modify( ls_columns[li_cnt] + ls_backcolor)
	If ls_return_code <> "" Then
		MessageBox("Status", "Unable to set background color for "+&
							ls_columns[li_cnt] + " - " + ls_return_code + ".")
	End If
	ls_return_code = dw_1.Modify( ls_columns[li_cnt] + ls_textcolor )
	If ls_return_code <> "" Then
		MessageBox("Status", "Unable to set foreground color for "+&
						ls_columns[li_cnt] + " - " + ls_return_code + ".")
	End If
Next

/********************** ENd Of Modification  ***********************/


// If any timer calls then icon is dynamite, else it is clock
If dw_1.RowCount() <= 0 Then
	This.Icon = cNCallWinIcon1
Else
	This.Icon = cYCallWinIcon1
End If
tNextTimer = DateTime( Today(), Now() ) // for Timer() event
st_lasttimer.Text               = "[None]"
st_nexttimer.Text               = String( Time( tNextTimer ), cTimeFormat )
st_alarmevery.Text      = String( il_Alarm_Every )
st_nextread.Text                = String( RelativeTime( Now(), il_Scan_every ), &
									cTimeFormat )

cb_closecall.Enabled = false
// time next Read as close to next Timer as possible inside the &
// 65 sec limit for PB3 window timers
If il_Scan_every > 0 Then
	Timer( Min( SecondsAfter( Now(), &
				Time(st_nextread.Text) ), 65 ), This )
Else
	Timer( 0, this )
End If
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )


postevent("ue_postopen")



end event

event timer;
Window w_currwin
integer nCtr = 0
long nLastRowOnPage = 0, nFirstRowOnPage = 0
long ll_ALarm_Duration
string cVarMessage, cOrigTimerIcon, cOrigTimerBMP, ls_AlarmBMP1
string ls_AlarmBMP2 , ls_song1 , ls_microhelp
datetime dtAlarmStart
long nCurrentRow, nCurrentCol

cb_refresh.enabled = false  // disable refresh button while screen is refreshing

Timer( 0, this )

/*  time to scan for timer calls */
If SecondsAfter( Time(st_nextread.Text), Now() ) >= 0 Then
	SetMicroHelp( "Reading Data for Timer Calls window...please wait." )
	cOrigAppIcon    = w_main.Icon 
	cOrigTimerIcon  = This.Icon
	cOrigTimerBMP   = p_bomb.PictureName
	nLastRowOnPage          = Long( dw_1.Describe( "datawindow.LastRowOnPage" ) )
	nFirstRowOnPage         = Long( dw_1.Describe( "datawindow.FirstRowOnPage" ) )
	
   // If any timer calls then icon is dynamite, else it is clock
	If dw_1.RowCount() <= 0 Then
		w_main.Icon     = cNCallWinIcon2
		This.Icon               = cNCallWinIcon2
		This.p_bomb.PictureName=cNCallSCrBMP2
	ElseIf dw_1.RowCount() > 0 Then
		w_main.Icon     = cYCallWinIcon2
		This.Icon               = cYCallWinIcon2
		This.p_bomb.PictureName=cYCallSCrBMP2
	End If
 
	w_currwin = GetActiveSheet()

	dw_1.SetRedraw(False)
	
	nCurrentRow = dw_1.GetRow()
	nCurrentCol = dw_1.GetColumn()
	
	dw_1.Retrieve()
	dw_1.ScrollToRow(nLastRowOnPage)
	dw_1.ScrollToRow(nFirstRowOnPage)
	
	dw_1.SetRow(nCurrentRow)
	dw_1.SetColumn(nCurrentCol)
	dw_1.SetFocus()
	if cb_closecall.Enabled = false then
		cb_closecall.Enabled = true
	end if
	
	dw_1.SetRedraw(True)
	/* If any timer calls then icon is one of 3 timer_level
      Bitmaps, else it is clock */
	If dw_1.RowCount() <= 0 Then
		w_main.Icon = cOrigAppIcon
		This.Icon = cNCallWinIcon1
		This.p_bomb.PictureName=cNCallSCrBMP1
	ElseIf dw_1.RowCount() > 0 Then
		w_main.Icon = cYCallWinIcon1
		This.Icon = cYCallWinIcon1
		This.p_bomb.PictureName=cYCallSCrBMP1
	   if dw_1.getitemnumber(1,"timer_level") = 1 THEN
		   ls_AlarmBMP1      = is_ScrAlarmBMPL1A   
			ls_AlarmBMP2      = is_ScrAlarmBMPL1B
			ls_song1          = "song5.exe"
			ll_Alarm_Duration = il_Alarm_DurationL1
			ls_microhelp      = cmicrohelpalarmL1
		ElseIF dw_1.getitemnumber(1,"timer_level") = 2 THEN
   		  ls_AlarmBMP1      = is_ScrAlarmBMPL2A   
			  ls_AlarmBMP2      = is_ScrAlarmBMPL2B
			  ls_song1          = "song1.exe"
			  ll_Alarm_Duration = il_Alarm_DurationL2
			  ls_microhelp      = cmicrohelpalarmL2     
      ELSE
			  ls_AlarmBMP1      = is_ScrAlarmBMPL3A   
			  ls_AlarmBMP2      = is_ScrAlarmBMPL3B
			  ls_song1          = "song3.exe"
			  ll_Alarm_Duration = il_Alarm_DurationL3
			  ls_microhelp      = cmicrohelpalarmL3
      END IF 
   END IF 
	// Timers have both new and old duration tolerances...
	//      ...what this means is that the timer alarm will not go
	// off too soon after the last time the timer has gone off regardless
	// of what time the next call goes on timer.  If either an Old or
	// New Call sets the
	// timer off and a New call goes on timer 20 seconds later,
	// and the new timer tolerance is 40 seconds, then the timer for the
	// new call will be after the 40 second New Timer tolerance level.  If
	// a New Call Timer goes off, then a repeat of an Old Timer is scheduled
	// to go off several seconds later but the Old Timer tolerance factor
	// is 30 seconds, then the Old Timer alarm will not sound for
	// at least 30 seconds after the last.  
	// If Both New and Old Timer tolerance durations
	If (DaysAfter( Date(tNextTimer), Today() ) * 86400) +&
		 SecondsAfter( Time(tNextTimer), Now() ) > 0 Then
		lTriggerTimer = True
	Else
		lTriggerTimer = False
	End If
	If lTriggerTimer And dw_1.RowCount() > 0 Then

      /*        if sheet is inactive or minimized reopen here */
// sfm - comment out so its stays minimized
//              OpenSheet( w_timer_calls, "w_timer_calls", w_main, 0, Original!)
//              This.SetFocus()
		dtAlarmStart = DateTime( Today(), Now() )
		nCtr = 0

	   /* Flash bitmaps and sound */

		This.Icon = cAlarmWinIcon1
		w_main.Icon = cAlarmWinIcon1
		This.p_bomb.PictureName = ls_AlarmBMP1
		SetMicroHelp( Lower( ls_microhelp ) )
		if cSoundCard = 'N' then
			Run(cAppPath+ls_song1, Minimized!)
		else
			sndPlaySoundA ("musica asterisk.wav",wavFlag)
		end if

		This.Icon = cAlarmWinIcon2
		w_main.Icon = cAlarmWinIcon2
		This.p_bomb.PictureName = ls_AlarmBMP2
		SetMicroHelp( ls_microhelp )


      /* this loop is determined by the duration of each timer level
	 the window will flash for the duration */
		
		Do While ( DaysAfter( Date( dtAlarmStart), Today() ) * 86400 ) + &
					  SecondsAfter( Time( dtAlarmStart ), Now() )  &
						< ll_Alarm_Duration  and not &
					(KeyDown( keyEnter! ) or KeyDown( keySpaceBar! ) )
			nCtr += 1
			FlashWindow( Handle( w_main ), True )
			FlashWindow( Handle( This ), True )
			if Mod(nCtr, 2) = 1 then
				This.Icon = cAlarmWinIcon2
				w_main.Icon = cAlarmWinIcon2
				This.p_bomb.PictureName = ls_AlarmBMP2
				SetMicroHelp( Lower( ls_microhelp ) )
			else
				This.Icon = cAlarmWinIcon1
				w_main.Icon = cAlarmWinIcon1
				This.p_bomb.PictureName = ls_AlarmBMP1
				SetMicroHelp(ls_microhelp)
			end if
//			If Mod( nCtr, 8 ) = 0 Then
//				This.Icon = cAlarmWinIcon1
//				w_main.Icon = cAlarmWinIcon1
//				This.p_bomb.PictureName = ls_AlarmBMP1
//				SetMicroHelp( ls_microhelp )
//			Elseif Mod( nCtr, 8 ) = 4 Then
//				This.Icon = cAlarmWinIcon2
//				w_main.Icon = cAlarmWinIcon2
//				This.p_bomb.PictureName = ls_AlarmBMP2
//				SetMicroHelp( Lower( ls_microhelp ) )
//			End If
//	 		Run(cAppPath+ls_song1, Minimized!)
//			run(cAppPath+"song1.exe",Minimized!)
			if cSoundCard = 'N' then
				Run(cAppPath+ls_song1, Minimized!)
			else
				sndPlaySoundA ("musica asterisk.wav",wavFlag)
			end if
//			beep(1)
//                      Beep( 10 )
		Loop

		This.Icon = cAlarmWinIcon1
		w_main.Icon = cAlarmWinIcon1
		This.p_bomb.PictureName = ls_AlarmBMP1
		SetMicroHelp( ls_microhelp )

		Pause(1)
		lTriggerTimer = False   // don't flag again until after tNextTimer
		// difference is time to acknowledge + nTimerAlarmSecs
		tLastTimer = tNextTimer
		tNextTimer = DateTime( Today(), &
				RelativeTime( Now(), il_Alarm_every ) )
		// if we've traversed 12mid then increment day by 1
		If SecondsAfter( Time( tLastTimer ), Time( tNextTimer ) ) < 0 Then
			tNextTimer = DateTime( RelativeDate( Date( tNextTimer) , 1 ), &
											Time( tNextTimer ) &
										)
		End If
		st_lasttimer.Text = String( Time( tLastTimer ), cTimeFormat )
		st_nexttimer.Text = String( Time( tNextTimer ), cTimeFormat )
	End If
	// If any timer calls then icon is dynamite, else it is clock
	If dw_1.RowCount() <= 0 Then
		w_main.Icon = cOrigAppIcon
		This.Icon=cNCallWinIcon1
		This.p_bomb.PictureName=cNCallSCrBMP1
	ElseIf dw_1.RowCount() > 0 Then
		w_main.Icon = cYCallWinIcon1
		This.Icon = cYCallWinIcon1
		This.p_bomb.PictureName=cYCallSCrBMP1
	End If
	// update different fields (on-the-fly *.ini updating)
	st_alarmevery.Text = String( il_Alarm_Every )
	st_readsecs.Text = String( il_scan_every )
	st_lastread.Text = st_nextread.Text
	st_nextread.Text = String( RelativeTime( Now(), il_scan_every ), &
										cTimeFormat )
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
	
	// 6/16/97 SFM sets focus back to the active sheet
	w_currwin.setfocus()
	
	
	
End If
// time next timer as close to next read as possible inside the 65 sec limit
If il_scan_every > 0 Then
	Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), this )
Else
	Timer( 0, this )
End If
end event

on closequery;


// If we don't get past the open event password
// then let's not password protect the exit...that's where we set
// lPasswordNeeded2Close = False

If not This.lPasswordNeeded2Close Then
	w_main.Icon = cOrigAppIcon
ElseIf is_passwordok( Get_Event_Security( "TX" ) ) Then
	w_main.Icon = cOrigAppIcon
Else
	Message.ReturnValue=1   // Disallow Close
End If

end on

on close;close(this)
end on

event resize;this.SetRedraw( False )
p_3.x = This.WorkSpaceWidth() - p_3.width - 300
pb_closecall.y = This.WorkSpaceHeight() - ( pb_closecall.height + 30 ) 
pb_filter.y = This.WorkSpaceHeight() - ( pb_filter.height + 30 ) 
pb_refresh.y = This.WorkSpaceHeight() - ( pb_refresh.height + 30 )
//pb_exit.x = This.WorkSpaceWidth() - p_3.width - 300
pb_exit.y = This.WorkSpaceHeight() - ( pb_exit.height + 30 ) 

dw_1.Resize(This.WorkSpaceWidth() -  (25), This.WorkSpaceHeight()-550)

SetMicroHelp( "dw_1 w:"+string(dw_1.width)+" pb_exit x:"+string(pb_exit.x) )

this.SetRedraw( True )


end event

on w_timer_calls.create
this.p_1=create p_1
this.pb_exit=create pb_exit
this.pb_closecall=create pb_closecall
this.pb_refresh=create pb_refresh
this.pb_filter=create pb_filter
this.p_3=create p_3
this.p_2=create p_2
this.pb_1=create pb_1
this.cb_closecall=create cb_closecall
this.cb_2=create cb_2
this.st_25=create st_25
this.st_24=create st_24
this.st_readsecs=create st_readsecs
this.st_nextread=create st_nextread
this.st_21=create st_21
this.st_19=create st_19
this.st_lastread=create st_lastread
this.st_15=create st_15
this.st_alarmevery=create st_alarmevery
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_nexttimer=create st_nexttimer
this.st_lasttimer=create st_lasttimer
this.cb_3=create cb_3
this.cb_refresh=create cb_refresh
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.st_16=create st_16
this.st_7=create st_7
this.p_bomb=create p_bomb
this.st_bomb=create st_bomb
this.Control[]={this.p_1,&
this.pb_exit,&
this.pb_closecall,&
this.pb_refresh,&
this.pb_filter,&
this.p_3,&
this.p_2,&
this.pb_1,&
this.cb_closecall,&
this.cb_2,&
this.st_25,&
this.st_24,&
this.st_readsecs,&
this.st_nextread,&
this.st_21,&
this.st_19,&
this.st_lastread,&
this.st_15,&
this.st_alarmevery,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_nexttimer,&
this.st_lasttimer,&
this.cb_3,&
this.cb_refresh,&
this.cb_1,&
this.st_1,&
this.dw_1,&
this.st_16,&
this.st_7,&
this.p_bomb,&
this.st_bomb}
end on

on w_timer_calls.destroy
destroy(this.p_1)
destroy(this.pb_exit)
destroy(this.pb_closecall)
destroy(this.pb_refresh)
destroy(this.pb_filter)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.pb_1)
destroy(this.cb_closecall)
destroy(this.cb_2)
destroy(this.st_25)
destroy(this.st_24)
destroy(this.st_readsecs)
destroy(this.st_nextread)
destroy(this.st_21)
destroy(this.st_19)
destroy(this.st_lastread)
destroy(this.st_15)
destroy(this.st_alarmevery)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_nexttimer)
destroy(this.st_lasttimer)
destroy(this.cb_3)
destroy(this.cb_refresh)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.st_16)
destroy(this.st_7)
destroy(this.p_bomb)
destroy(this.st_bomb)
end on

on deactivate;w_main.postevent("ue_menu_set")

end on

event activate;w_main.triggerevent("ue_menu_set")
end event

type p_1 from picture within w_timer_calls
integer x = 279
integer y = 76
integer width = 800
integer height = 172
string picturename = "Timers Calls.bmp"
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_timer_calls
integer x = 2130
integer y = 1492
integer width = 288
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xit"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;Parent.TriggerEvent("close")
end event

type pb_closecall from picturebutton within w_timer_calls
integer x = 1179
integer y = 1492
integer width = 288
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;string repairDept, repairer
repairDept=trim(dw_1.GetItemString(dw_1.GetRow(),"closed_bydept"))
repairer=trim(dw_1.GetItemString(dw_1.GetRow(),"repairman"))
if repairDept = "" or isnull(repairDept) or repairer = "" or IsNull(repairer) then
	MessageBox("Error","Can't close an unassigned call! Either department or repairman contains balnk value!!")
	return
end if
If Is_PasswordOK( Get_Event_Security( "CC" ) ) Then
	string callNumber
	callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
	if f_close_a_call(callNumber,'1') then
		if dw_1.DeleteRow(0) < 0 then
			MessageBox("DW Error","DeleteRow error: " + callNumber)
			return
		end if
		cb_closecall.enabled = FALSE // 5/22/97 sfm
	end if
end if
end event

type pb_refresh from picturebutton within w_timer_calls
integer x = 1815
integer y = 1492
integer width = 288
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Refresh"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;st_nextread.Text = String( RelativeTime( Now(), -1 ), cTimeFormat )
Timer( .01, parent )
end event

type pb_filter from picturebutton within w_timer_calls
integer x = 1495
integer y = 1492
integer width = 288
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filter"
string picturename = "BlankCB.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if
Timer( 0, parent )
OpenWithParm (w_screen_settings, "timer")
if Message.StringParm <> '' then
	string refreshMin, alrmFreq, durationTime, deptCode
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'|') - 1
	refreshMin = Mid(Message.StringParm,1,endPos) 
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	alrmFreq = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	durationTime = Mid(Message.StringParm, startPos,endPos - startPos +1)
		
	startPos = endPos + 2
	deptCode = Mid(Message.StringParm, startPos)	
	

	if il_Scan_every <> integer(refreshMin) then
		il_Scan_every=integer(refreshMin)
		st_readsecs.text = refreshMin
	end if
	st_nextread.Text = String( RelativeTime( Now(), il_Scan_every ), &
									cTimeFormat )
   Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), parent )									
	
	if iL_Alarm_Every <> integer(alrmFreq) then
		iL_Alarm_Every=integer(alrmFreq)
	end if
	
	if il_Alarm_DurationL1 <> integer(durationTime) then
		il_Alarm_DurationL1=integer(durationTime)
		il_Alarm_DurationL2=integer(durationTime)
		il_Alarm_DurationL3=integer(durationTime)
	end if
	
	if deptSelectionStr <> deptCode then
		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
		deptSelectionStr = deptCode
		dwSelectStr=origSelectionStr
		wf_mod_selections(deptSelectionStr)
		dw_1.Retrieve()
	end if
else
	Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), parent )
end if
end event

type p_3 from picture within w_timer_calls
integer x = 2597
integer y = 96
integer width = 1024
integer height = 200
string picturename = "HotelEXPERT.bmp"
boolean focusrectangle = false
end type

type p_2 from picture within w_timer_calls
integer x = 110
integer y = 252
integer width = 1646
integer height = 100
string picturename = "Timer Minutes Legend.bmp"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_timer_calls
boolean visible = false
integer x = 914
integer y = 1664
integer width = 384
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "TOOLBAR1.bmp"
alignment htextalign = left!
end type

event clicked;If not Is_PasswordOK( Get_Event_Security( "DS" ) ) then
	return
end if
Timer( 0, parent )
OpenWithParm (w_screen_settings, "timer")
if Message.StringParm <> '' then
	string refreshMin, alrmFreq, durationTime, deptCode
	int endPos, startPos
	
	startPos=1
	endPos=Pos(Message.StringParm,'|') - 1
	refreshMin = Mid(Message.StringParm,1,endPos) 
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	alrmFreq = Mid(Message.StringParm, startPos,endPos - startPos +1)
	
	startPos = endPos + 2
	endPos=Pos(Message.StringParm,'|',startPos) - 1
	durationTime = Mid(Message.StringParm, startPos,endPos - startPos +1)
		
	startPos = endPos + 2
	deptCode = Mid(Message.StringParm, startPos)	
	

	if il_Scan_every <> integer(refreshMin) then
		il_Scan_every=integer(refreshMin)
		st_readsecs.text = refreshMin
	end if
	st_nextread.Text = String( RelativeTime( Now(), il_Scan_every ), &
									cTimeFormat )
   Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), parent )									
	
	if iL_Alarm_Every <> integer(alrmFreq) then
		iL_Alarm_Every=integer(alrmFreq)
	end if
	
	if il_Alarm_DurationL1 <> integer(durationTime) then
		il_Alarm_DurationL1=integer(durationTime)
		il_Alarm_DurationL2=integer(durationTime)
		il_Alarm_DurationL3=integer(durationTime)
	end if
	
	if deptSelectionStr <> deptCode then
		//MessageBox('dept','old:'+deptSelectionStr+"   new:"+deptCode)
		deptSelectionStr = deptCode
		dwSelectStr=origSelectionStr
		wf_mod_selections(deptSelectionStr)
		dw_1.Retrieve()
	end if
else
	Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), parent )
end if
end event

type cb_closecall from commandbutton within w_timer_calls
boolean visible = false
integer x = 1975
integer y = 1672
integer width = 416
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close a Call"
end type

event clicked;if trim(dw_1.GetItemString(dw_1.GetRow(),"closed_bydept")) = "" or &
	trim(dw_1.GetItemString(dw_1.GetRow(),"repairman")) = "" then
	MessageBox("Error","The call is an unassigned call! Can not close it!!!")
	return
end if
If Is_PasswordOK( Get_Event_Security( "CC" ) ) Then
	string callNumber
	callNumber = dw_1.GetItemString(dw_1.GetRow(),"call_number")
	if f_close_a_call(callNumber,'1') then
		if dw_1.DeleteRow(0) < 0 then
			MessageBox("DW Error","DeleteRow error: " + callNumber)
			return
		end if
		cb_closecall.enabled = FALSE // 5/22/97 sfm
	end if
end if
end event

type cb_2 from commandbutton within w_timer_calls
boolean visible = false
integer x = 2450
integer y = 1664
integer width = 416
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "E&xit"
end type

on clicked;Parent.TriggerEvent("close")
end on

type st_25 from statictext within w_timer_calls
boolean visible = false
integer x = 2162
integer y = 324
integer width = 160
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "sec.~'s"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_24 from statictext within w_timer_calls
boolean visible = false
integer x = 2002
integer y = 232
integer width = 197
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Every "
boolean focusrectangle = false
end type

type st_readsecs from statictext within w_timer_calls
boolean visible = false
integer x = 2002
integer y = 324
integer width = 146
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "000"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_nextread from statictext within w_timer_calls
boolean visible = false
integer x = 1568
integer y = 324
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "00:00:00 AM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_21 from statictext within w_timer_calls
boolean visible = false
integer x = 1207
integer y = 324
integer width = 343
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Next Read: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_19 from statictext within w_timer_calls
boolean visible = false
integer x = 1207
integer y = 232
integer width = 343
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Last Read: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_lastread from statictext within w_timer_calls
boolean visible = false
integer x = 1568
integer y = 232
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "00:00:00 AM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_15 from statictext within w_timer_calls
boolean visible = false
integer x = 3287
integer y = 324
integer width = 238
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "seconds"
boolean focusrectangle = false
end type

type st_alarmevery from statictext within w_timer_calls
boolean visible = false
integer x = 3127
integer y = 320
integer width = 133
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 12632256
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_14 from statictext within w_timer_calls
boolean visible = false
integer x = 2967
integer y = 324
integer width = 160
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Every"
boolean focusrectangle = false
end type

type st_13 from statictext within w_timer_calls
boolean visible = false
integer x = 2990
integer y = 236
integer width = 128
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Next"
boolean focusrectangle = false
end type

type st_12 from statictext within w_timer_calls
boolean visible = false
integer x = 2999
integer y = 148
integer width = 119
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Last"
boolean focusrectangle = false
end type

type st_nexttimer from statictext within w_timer_calls
boolean visible = false
integer x = 3127
integer y = 232
integer width = 375
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 12632256
boolean enabled = false
string text = "99:99:99 AM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_lasttimer from statictext within w_timer_calls
boolean visible = false
integer x = 3127
integer y = 144
integer width = 375
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 12632256
boolean enabled = false
string text = "99:99:99 AM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_timer_calls
boolean visible = false
integer x = 2382
integer y = 164
integer width = 466
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Print"
end type

on clicked;dw_1.Print()
end on

type cb_refresh from commandbutton within w_timer_calls
boolean visible = false
integer x = 1463
integer y = 1664
integer width = 416
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Refresh"
boolean default = true
end type

on clicked;st_nextread.Text = String( RelativeTime( Now(), -1 ), cTimeFormat )
Timer( .01, parent )

end on

type cb_1 from commandbutton within w_timer_calls
boolean visible = false
integer x = 2382
integer y = 276
integer width = 466
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "E&xit"
boolean cancel = true
end type

on clicked;Close(parent)
end on

type st_1 from statictext within w_timer_calls
boolean visible = false
integer x = 571
integer y = 544
integer width = 1696
integer height = 164
integer textsize = -24
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 65535
long backcolor = 16711680
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_timer_calls
event mousemove pbm_mousemove
integer y = 380
integer width = 3730
integer height = 524
string dataobject = "d_timer_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
string icon = "CLOCK01A.ICO"
boolean hsplitscroll = true
boolean livescroll = true
end type

event mousemove;string cObject, cTag

// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is not down, so set MicroHelp()
	cObject = this.GetObjectAtPointer()   // Get object name

	// this takes care of "!" (bad dwDescribe()) AND no object
	cObject = Left( cObject, Max( Pos( cObject, "	" ) - 1, 0 ) )

	// now a little 'where are we and what do we show' logic
	If Len( Trim( cObject ) ) > 0   Then                    // if object under pointer
		cTag = Describe( cObject+".Tag" )                     // use object tag
		If Trim( cTag ) = "!" Or Trim( cTag ) = "?" Then
			cTag = ""
		End If
	Else                                                                                                    // else use     
		cTag = This.Tag                                                                 // use datawindow tag
	End If

	// a little insurance
	If Len( Trim( cTag ) ) <= 0 Then                                // if sonehow empty
		cTag = This.Tag                                                                 // then use datawindow tag
	End If
	// a little insurance
	If Len( Trim( cTag ) ) <= 0 Then                                // if sonehow empty
		cTag = Parent.Tag                                                                       // then use Window tag
	End If
	SetMicroHelp( cTag )
End If

end event

event doubleclicked;int nRowClicked
string cCallClicked, clickedColumn, clickedColNum

SetPointer( HourGlass! )
// Obtains call number of clicked row and jumps to call screen
//nRowClicked = dw_1.GetClickedRow()
//MessageBox("Column Clicked",this.GetColumnName())
//MessageBox("column num",string(f_find_col_num(this.GetColumnName())))
if dw_1.GetColumnName() = "call_number" then
	MessageBox("Warning","Call Number is not a changeable field! Try a different field.")
	SetPointer( arrow! )
	return
end if
nRowClicked = row
If nRowClicked > 0 Then
	If Is_PasswordOK( Get_Event_Security( "CM" ) ) Then
		cCallClicked = dw_1.GetItemString( nRowClicked, "call_number" )
		clickedColumn = dw_1.GetColumnName()
		clickedColNum = string(f_find_col_num(clickedColumn),"00")
		If Len( cCallClicked ) > 0 Then
			SetPointer( HourGlass! )
			If IsValid( w_call_upd ) Then
				w_call_upd.sCallNumber = cCallClicked
				w_call_upd.openMode = '6'
				w_call_upd.colToSet = integer(clickedColNum)
				w_call_upd.TriggerEvent("ue_refresh")
				if w_call_upd.st_mode.text = 'Add' then // try to modify a closed call
					SetPointer ( arrow! )
				else
					open(w_call_upd)
				end if
			else
				If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
					OpenSheetWithParm( w_call_upd, '1'+clickedColNum+cCallClicked, "w_call_upd", &
						w_main, 0, Original! )
				else
					MessageBox("Failed","Openning Call screen failed!")
				end if
			end if
		Else
			MessageBox( "Call Number Unknown", "The call you just selected " + &
				"MAY NOT be jumped to on the Call Screen because the call number cannot " + &
				"be determined.  Please make sure the tip of the cursor is " + &
				"directly on the call number field when you double-click the mouse.", StopSign! )
		End If
	End if
End If

end event

event clicked;cb_closecall.Enabled = true
end event

event retrieveend;wf_check_paging()
cb_refresh.enabled = true
end event

type st_16 from statictext within w_timer_calls
boolean visible = false
integer x = 2935
integer y = 32
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
string text = "Repeating Alarm"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_7 from statictext within w_timer_calls
integer x = 329
integer y = 736
integer width = 375
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = " ~~ 15+ min.~'s"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type p_bomb from picture within w_timer_calls
integer x = 133
integer y = 104
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "DYNAM01B.bmp"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

on clicked;// force alarm
tNextTimer = DateTime( Today(), Now() ) // advance timer alarm scheduled
Timer( .01, w_timer_calls )                                     // trigger timer alarm check
end on

type st_bomb from statictext within w_timer_calls
integer x = 133
integer y = 104
integer width = 155
integer height = 132
integer textsize = -20
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
string facename = "Wingdings"
long textcolor = 255
long backcolor = 0
string text = "M"
alignment alignment = right!
boolean focusrectangle = false
end type

