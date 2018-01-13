$PBExportHeader$w_gcc_pending_calls.srw
forward
global type w_gcc_pending_calls from window
end type
type st_status from statictext within w_gcc_pending_calls
end type
type st_9 from statictext within w_gcc_pending_calls
end type
type st_8 from statictext within w_gcc_pending_calls
end type
type st_7 from statictext within w_gcc_pending_calls
end type
type cb_findprev from commandbutton within w_gcc_pending_calls
end type
type st_6 from statictext within w_gcc_pending_calls
end type
type st_5 from statictext within w_gcc_pending_calls
end type
type cb_closecall from commandbutton within w_gcc_pending_calls
end type
type cb_copy from commandbutton within w_gcc_pending_calls
end type
type cb_modify from commandbutton within w_gcc_pending_calls
end type
type pb_last from picturebutton within w_gcc_pending_calls
end type
type cb_exit from commandbutton within w_gcc_pending_calls
end type
type cb_sort from commandbutton within w_gcc_pending_calls
end type
type cb_findnext from commandbutton within w_gcc_pending_calls
end type
type cb_find from commandbutton within w_gcc_pending_calls
end type
type pb_first from picturebutton within w_gcc_pending_calls
end type
type p_1 from picture within w_gcc_pending_calls
end type
type cb_print from commandbutton within w_gcc_pending_calls
end type
type cb_refresh from commandbutton within w_gcc_pending_calls
end type
type st_19 from statictext within w_gcc_pending_calls
end type
type st_readsecs from statictext within w_gcc_pending_calls
end type
type st_17 from statictext within w_gcc_pending_calls
end type
type st_16 from statictext within w_gcc_pending_calls
end type
type st_nextread from statictext within w_gcc_pending_calls
end type
type st_lastread from statictext within w_gcc_pending_calls
end type
type st_13 from statictext within w_gcc_pending_calls
end type
type st_3 from statictext within w_gcc_pending_calls
end type
type st_1 from statictext within w_gcc_pending_calls
end type
type dw_3 from datawindow within w_gcc_pending_calls
end type
type st_2 from statictext within w_gcc_pending_calls
end type
type dw_1 from u_dw_maint within w_gcc_pending_calls
end type
type gb_1 from groupbox within w_gcc_pending_calls
end type
type st_4 from statictext within w_gcc_pending_calls
end type
end forward

global type w_gcc_pending_calls from window
integer width = 3429
integer height = 1744
boolean titlebar = true
string title = "GCC Pending Calls - View"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 12632256
string icon = "CHECK1.ICO"
event ue_print pbm_custom01
event ue_printscreen pbm_custom02
event ue_printreport pbm_custom03
event ue_refresh ( )
st_status st_status
st_9 st_9
st_8 st_8
st_7 st_7
cb_findprev cb_findprev
st_6 st_6
st_5 st_5
cb_closecall cb_closecall
cb_copy cb_copy
cb_modify cb_modify
pb_last pb_last
cb_exit cb_exit
cb_sort cb_sort
cb_findnext cb_findnext
cb_find cb_find
pb_first pb_first
p_1 p_1
cb_print cb_print
cb_refresh cb_refresh
st_19 st_19
st_readsecs st_readsecs
st_17 st_17
st_16 st_16
st_nextread st_nextread
st_lastread st_lastread
st_13 st_13
st_3 st_3
st_1 st_1
dw_3 dw_3
st_2 st_2
dw_1 dw_1
gb_1 gb_1
st_4 st_4
end type
global w_gcc_pending_calls w_gcc_pending_calls

type variables
//datetime tLastTimer
//datetime tNextTimer
string cScrBMP1         // screen idle BMP
string cScrBMP2         // screen data read BMP
string cWinIcon1         // min win idle icon
string cWinIcon2         // min win read data icon
long nReadSecs          // Re-read data every...
string cfindnext
string dwSelectStr
string clickedColumn
boolean thereIsAUnassignCall
str_dts_call	istr_parms
end variables

forward prototypes
public function boolean wf_mod_selections (string deptstr)
public function integer wf_find_preopen_paging_call ()
public function boolean wf_upd_call (string callnum, string dept, string repairman)
public function boolean wf_mod_by_status (string as_status_filter)
end prototypes

on ue_print;dw_1.print()
end on

on ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end on

event ue_printreport;dw_1.print()
end event

event ue_refresh;st_nextread.Text = String( RelativeTime( Now(), -1 ), cTimeFormat )
Timer( .01, this )
//Timer(0,parent)
end event

public function boolean wf_mod_selections (string deptstr);if len(trim(deptStr)) = 0 then
	return true //no need to do anything
end if

string deptid[]
string deptPendingNmStr, deptTimerNmStr, deptPendingStr
string modRes, newDwSelectStr
string selectStr1, selectStr2, selectStr3, selectStr4 
string selectStr5, selectStr6, selectStr7, selectStr8, selectStr9, modStr
int posStart, posStop, posInt, numOfDept, i, j
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


deptPendingNmStr = ' ~~"pendingcalls~~".~~"closed_bydept~~" = '
//depttimerNmStr   = ' ~~"timercalls~~".~~"closed_bydept~~" = '


i = 1 
do while i <= numOfDept
	if i = 1 then
		deptPendingStr   = deptPendingNmStr + "'" + deptid[i] + "' "
//		deptTimerStr     = depttimerNmStr + "'" + deptid[i] + "' " 
	else
		deptPendingStr   = deptPendingStr + " or " + deptPendingNmStr + "'" + deptid[i] + "' "
//		deptTimerStr     = deptTimerStr + " or " + depttimerNmStr + "'" + deptid[i] + "' " 
	end if
	i++
loop

deptPendingStr   = " and (" + deptPendingStr + ") " 
//deptTimerStr	  = " and (" + deptTimerStr + ") "				
						 
						 
posStart = 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - 1
selectStr1 = mid(dwSelectStr, posStart, posStop)  	//1st pending select

posStart =posStart + posStop 
posInt = pos(dwSelectStr, 'UNION', posStart)
if posInt = 0 then
	MessageBox("error","can't position 1-st 'UNION' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr2 = mid(dwSelectStr, posStart, posStop)  	//1st pending where

posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'WHERE', posStart)
if posInt = 0 then
	MessageBox("error","can't position 2nd 'WHERE' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
posStart =posStart + posStop + 1
posInt = pos(dwSelectStr, 'ORDER', posStart)
if posInt = 0 then
	MessageBox("error","can't position 'ORDER' in dwSelectStr")
	return false
end if
posStop = posInt - posStart - 1
selectStr8 = mid(dwSelectStr, posStart, posStop) 	//2nd timer where
//**********************************************************************************************

posStart =posStart + posStop + 1
selectStr9 = mid(dwSelectStr, posStart) 				// last part

//modify where strings

selectStr2 = selectStr2 + deptPendingStr
//selectStr4 = selectStr4 + deptTimerStr
 
selectStr8 = selectStr8 + deptPendingStr
//selectStr8 = selectStr8 + deptTimerStr

//new string

dwSelectStr = selectStr1 + selectStr2 +  &
				  selectStr6 + selectStr7 + selectStr9

modStr = "datawindow.table.select=~""+dwSelectStr+"~""
modRes = dw_1.Modify(modStr)
if modRes <> "" then
	MessageBox("dw1 Modidy Error", modRes)
	return false
end if

modRes = dw_3.Modify(modStr)
if modRes <> "" then
	MessageBox("dw3 Modidy Error", modRes)
	return false
end if

newDwSelectStr = dw_1.Describe("datawindow.table.select")
return true
end function

public function integer wf_find_preopen_paging_call ();string 	ls_dept,ls_employee_name, ls_employee_num, ls_pager_id, ls_capecode, ls_zone
string 	auto_assign_ind,sSubproblemNumber,sproblemNumber,sCallNumber
datetime ldtTimerStart
string 	sroom


s_pageassignment ass
int i 
for i=1 to dw_1.RowCount() step +1
	if dw_1.GetItemString(i,"pagingind") = "Y" and dw_1.GetItemString(i,"repairman") = "" then
		if f_chk_preopen_page('Y',dw_1.GetItemNumber(i,"init_paging_min"),&
			dw_1.GetItemDateTime(i,"timer_start")) = "Y" then
			
			sproblemNumber=dw_1.GetItemString(i,"problem_number")
			sSubProblemNumber=dw_1.GetItemString(i,"subproblem_number")
			sCallNumber	=string(dw_1.GetItemNumber(i,"call_number_numeric"))
			ls_zone=	dw_1.GetItemString(i,"area_unit_type")
			
			sroom  			= dw_1.GetItemString(i,"room") 				// VZ quick call etc 2006-05-22
			ldtTimerStart  = dw_1.GetItemDatetime(i,"timer_start") 	// VZ quick call etc 2006-05-22
			
			SELECT subproblem.auto_assign_ind, 
						subproblem.dept_assign 
			into :auto_assign_ind, :ls_dept
			FROM subproblem  
			WHERE subproblem.subproblem_number = :sSubproblemNumber and
				   Subproblem.problem_number = :sproblemNumber;
			IF sqlca.sqlcode <> 0 THEN
				messagebox('Select SubProblem Table Error',sqlca.sqlerrtext)
				return - 1
			END IF
			
			If auto_assign_ind = 'Y' and IsNull(ls_dept) THEN
  				Messagebox('Responder','A pager ID could not be determined for call_number ' + &
				  dw_1.GetItemString(i,'call_number')+ &
				  +' in Subproblem and Department managers tables! ~r~nInsertion of a pageassignment record has been aborted!')
				return - 1
			END IF
			
			IF auto_assign_ind = 'Y' THEN
	//			MessageBox("info","Call # "+sCallNumber+&
	//			"problem: " +sProblemNumber + " " + sSubProblemNumber+" is to be inserted to pagingassignment!")					
				ls_pager_id = '' // VZ precaution for auto-reassign
				
				if not f_find_pager_id(ls_dept, ls_employee_name, ls_employee_num, ls_pager_id, ls_capecode, sroom, ldtTimerStart) then // VZ quick call etc 2006-05-22
					if not wf_upd_call(sCallNumber,'','') then
						return -1
					end if
					ass.assignment_id = string(today(),"yyyymmddhhmmss")
	   			ass.assignment_cd = 'N'
 	   			ass.dept_assigned = ls_dept
	   			ass.emp_id = '8888888888'
	   			ass.emp_name = 'NONE'
      			ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
	   			SetNull(ass.time_completed)
	   			ass.call_number = sCallNumber 
	   			ass.page_sent = 'N'
					ass.special_msg = 'Auto assignment call # ' + scallnumber + &
		 			' has failed to allocate a pager!'
					ass.pager_id = f_find_mgr_pager(ls_dept, sroom, ldtTimerStart) // VZ quick call etc 2006-05-22
    			ELSE
					if not wf_upd_call(sCallNumber,ls_dept,ls_employee_name) then
						return -1
					end if
					ass.assignment_id = string(today(),"yyyymmddhhmmss")
					ass.assignment_cd = 'T'
					ass.dept_assigned = ls_dept
					ass.emp_id = ls_employee_num
					ass.emp_name = ls_employee_name
					ass.pager_id = ls_pager_id
					ass.time_assigned = string(today(),"yyyy/mm/dd hh:mm:ss")
					SetNull(ass.time_completed)
					ass.call_number = sCallNumber 
					ass.page_sent = 'N'
				END IF
				if f_insert_assignment(ass) then
					commit;
				end if

			end if	
		end if
	end if
next
return 0
end function

public function boolean wf_upd_call (string callnum, string dept, string repairman);boolean timerCall
string callNumber
timerCall = TRUE
SELECT timercalls.call_number  
    INTO :callNumber  
    FROM timercalls  
   WHERE timercalls.call_number = :callnum   ;
if sqlca.sqlcode = 100 then
	timerCall = FALSE
else
	if sqlca.sqlcode < 0 then
		MessageBox("SQL error","DB select error: "+ sqlca.sqlerrtext)
		return false
	end if
end if

if timerCall then
	update timercalls
	set timercalls.closed_bydept = :dept,
		 timercalls.repairman = :repairman,
		 timercalls.paging_ind = '0'
	where timercalls.call_number = :callnum;
else
	update pendingcalls
	set pendingcalls.closed_bydept = :dept,
		 pendingcalls.repairman = :repairman,
		 pendingcalls.paging_ind = '0'
	where pendingcalls.call_number = :callnum	;
end if

if sqlca.sqlcode < 0 then
	MessageBox("SQL error","DB update error: " +sqlca.sqlerrtext)
	return false
else
	commit;
end if
return true
end function

public function boolean wf_mod_by_status (string as_status_filter);if len(trim(as_status_filter)) = 0 then
	return true //no need to do anything
end if
string ls_filter
ls_filter = "POS( '"+as_status_filter+"', trim(stat_code) ) > 0 "
dw_1.SetFilter( ls_filter)
dw_1.Filter()
dw_3.SetFilter( ls_filter)
dw_3.Filter()

st_9.visible 		= true
st_status.text		= as_status_filter
st_status.visible = true

return true 

//int posStart , posint, posStop 
//string	selectStr1 , selectStr2, selectStr3, selectStr8,selectStr9 , modStr, ls_modrc
//string	newDwSelectStr
//
//posStart = 1
//posInt = pos(dwSelectStr, 'WHERE', posStart) 
//if posInt = 0 then
//	MessageBox("error","can't position 1st 'WHERE' in dwSelectStr")
//	return false
//end if
//posStop = posInt - 1
//selectStr1 = mid(dwSelectStr, posStart, posStop)  	//1st pending select
//
//posStart =posStart + posStop 
//posInt = pos(dwSelectStr, 'UNION', posStart)
//if posInt = 0 then
//	MessageBox("error","can't position 1-st 'UNION' in dwSelectStr")
//	return false
//end if
//posStop = posInt - posStart - 1
//selectStr2 = mid(dwSelectStr, posStart, posStop)  	//1st pending where
//
//posStart =posStart + posStop + 1
//posInt = pos(dwSelectStr, 'WHERE', posStart)
//if posInt = 0 then
//	MessageBox("error","can't position 2nd 'WHERE' in dwSelectStr")
//	return false
//end if
//posStop = posInt - posStart - 1
//posStart =posStart + posStop + 1
//posInt = pos(dwSelectStr, 'ORDER', posStart)
//if posInt = 0 then
//	MessageBox("error","can't position 'ORDER' in dwSelectStr")
//	return false
//end if
//posStop = posInt - posStart - 1
//selectStr8 = mid(dwSelectStr, posStart, posStop) 	//2nd timer where
////**********************************************************************************************
//
//posStart =posStart + posStop + 1
////new string
//
//dwSelectStr = selectStr1 + selectStr2 +  &
//				  + selectStr9
//
//modStr = "datawindow.table.select=~""+dwSelectStr+"~""
//ls_modrc = dw_1.Modify(modStr)
//if ls_modrc <> "" then
//	MessageBox("dw1 Modidy Error", ls_modrc)
//	return false
//end if
//
//ls_modrc = dw_3.Modify(modStr)
//if ls_modrc <> "" then
//	MessageBox("dw3 Modidy Error", ls_modrc)
//	return false
//end if
//
//newDwSelectStr = dw_1.Describe("datawindow.table.select")
//return true
end function

event resize;pointer cpOldPointer
cpOldPointer = SetPointer(HourGlass!)

this.setredraw(FALSE)
//dw_1.WIdth = this.WorkSpaceWidth() 
//dw_1.Height = this.WorkSpaceHeight() - (st_3.y + st_3.height + cb_exit.height + 100) 
    
cb_find.y		= This.WorkSpaceHeight() - ( cb_find.height + 40 )
cb_closecall.y	= cb_find.y
cb_modify.y		= cb_find.y
cb_copy.y		= cb_find.y
//cb_exit.y		= cb_find.y
cb_findnext.y 	= cb_find.y
cb_findprev.y 	= cb_find.y
cb_sort.y     	= cb_find.y
pb_first.y    	= cb_find.y
//pb_next.y     	= cb_find.y
//pb_prior.y    	= cb_find.y
pb_last.y     	= cb_find.y

dw_1.Resize(This.WorkSpaceWidth() -  (25), &
				This.WorkSpaceHeight() - (st_3.y + st_3.height + cb_exit.height + 100) )
this.setredraw(TRUE)
SetPointer( cpOldPointer )



end event

event open;st_9.visible 		= false
st_status.visible = false

/* Sfm mod 11/95 remove password call to w_password */

long FGColor1, FGColor2, FGColor3, FGColor4, FGColor5, FGDefault_color
long BGColor1, BGColor2, BGColor3, BGColor4, BGColor5, BGDefault_color, BGGCCcolor
string Bgrnd_string, err, Fgrnd_string, cCols2Do[], cMinOpenCompute
string cOverTimerCall, cOpenTimerCall, cPreOpenCall, cOpenNonTimerCall, cClosedCall, cUnAssignedCall
string deptSelectionStr , ls_sort , ls_StatusFilter	
int nCols2Do, nCtr, li_rc
pointer pOldPointer

if f_nvl(gnv_appman.is_datemask ,'') <> ''  then 
	if f_nvl(gnv_appman.is_timemask ,'') <> ''  then 
		dw_1.Object.timer_start.EditMask.Mask	= gnv_appman.is_datemask +' '+ gnv_appman.is_timemask
	else
		dw_1.Object.timer_start.EditMask.Mask	= gnv_appman.is_datemask + ' hh:mm:ss'
	end if
Else
	//default 
	dw_1.Object.timer_start.EditMask.Mask	= 'mm/dd/yyyy hh:mm:ss'
end if


// SFM 10/26/97 Determine db type and switch dataobjects if need be
IF cappdbtype = 'MSSQL' THEN dw_1.dataobject = 'd_gcc_pending_calls_mssql'
/******* sfm *****/

//If Is_PassWordOK( Get_Event_Security( "PO" ) ) Then
  SetMicroHelp( "Opening Pending Calls view screen...please wait." )
  pOldPointer = SetPointer( HourGlass! )
  nReadSecs = ProfileInt(    cINIPath+cINIFile, "Pending", "ReadSeconds", 150 )      // 2.5 min.'s
  cScrBMP1  = ProfileString( cINIPath+cINIFile, "Pending", "ScreenBMP1", "eye01a.bmp" )
  cScrBMP2  = ProfileString( cINIPath+cINIFile, "Pending", "ScreenBMP2", cScrBMP1 )
  cWinIcon1 = ProfileString( cINIPath+cINIFile, "Pending", "WindowIcon1", cScrBMP1 )
  cWInIcon2 = ProfileString( cINIPath+cINIFile, "Pending", "WindowIcon2", cScrBMP2 )
  p_1.PictureName = cScrBMP2
  
  deptSelectionStr 	=  ProfileString(cINIPath + cINIFile, "Pending", "Dept", "<?>")
  ls_StatusFilter		=  ProfileString(cINIPath + cINIFile, "Pending", "StatusFilter", "")

  This.Icon = cWInIcon2

	// Window banner name from registration database
  st_1.Text = cRegSite

//	BGGCCcolor	= RGB( 0,255,0) 
  FGColor1                      = 65535         // Yellow       -       over timer
  FGColor2                      = 255           // Red          -       open timer
  FGColor3                      = 0             // Black                -       pre-open
  FGColor4                      = 16777215      // White                -       open non-timer
  FGColor5                      = 16711680      // Blue
  FGDefault_color   = 0                         // Black                -       end of if(... list

  BGColor1                      = 255           // Red          -       over timer
  BGColor2                      = 65535         // Yellow       -       open timer
  BGColor3                      = 65280         // Green                -       pre-open
  BGColor4                      = 8421504       // DkGray       -       open non-timer
  BGColor5                      = 12632256      // Light Gray
  BGDefault_color       = 16777215      // White        -       end of if(... list
  cOverTimerCall = "( ( DaysAfter( Date( timer_start ),"+ &
										"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") >= 0 and integer(stat_code) < 10 "+ &
					 "and repairman <> ~"~""  // mn - chg for filter unassigned call
  cOpenTimerCall = "( ( DaysAfter( Date( timer_start ),"+ &
									"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") < 0 and integer(stat_code) < 10 and integer(stat_code) > 0" +&
					 " and repairman <> ~"~"" // mn - chg for filter unassigned call
  cPreOpenCall = "( ( DaysAfter( Date( timer_start ),"+ &
										"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") < 0 and integer(stat_code) = 0" +&
					 " and repairman <> ~"~"" // mn - chg for filter unassigned call
  cOpenNonTimerCall = "( ( DaysAfter( Date( call_indate ),"+ &
										"Date( Today() ) ) * 86400 ) + "+&
							"SecondsAfter( Time( call_indate ), "+&
											  "Now() ) "+&
					 ") >= 0 and integer(stat_code) >= 10 and "+&
									"integer(stat_code) < 90" +&
					 " and repairman <> ~"~" "    // mn - chg for filter unassigned call
  cUnAssignedCall = " repairman = ~"~" and pagingind <> ~"Y~" "

  Bgrnd_string = &
	".background.color = '"  + String( BGDefault_color ) + " &
	~t if( integer(stat_code) >= 11, RGB(0,255,0), &
	if(" + cOverTimerCall + ", " + String( BGDefault_color ) + ",&
	if(" + cOpenTimerCall    + ", " + String( BGDefault_color ) + ",&
	if(" + cPreOpenCall      + ", " + String( BGDefault_color ) + ",&
	if(" + cUnAssignedCall      + ", " + String( BGColor2  ) + ",&
	if(" + cOpenNonTimerCall + ", " + String( BGColor5 ) + ","+ &
	String( BGDefault_color ) + ") ) ) ) ) ) '" 


  Fgrnd_string = &
	".color = '"  + String( FGDefault_color ) + " &
	~t if( integer(stat_code) >= 11, RGB(0,0,0), &
	if(" + cOverTimerCall + ", " + String( FGDefault_color ) + ",&
	if(" + cOpenTimerCall    + ", " + String( FGDefault_color ) + ",&
	if(" + cPreOpenCall      + ", " + String( FGDefault_color ) + ",&
	if(" + cUnAssignedCall      + ", " + String( FGColor3 ) + ",&
	if(" + cOpenNonTimerCall + ", " + String( FGColor5 ) + ","+&
	String( FGDefault_color ) + ") ) ) ) ) )'" // vz
 //
  st_lastread.Text = String(Now(), cTimeFormat)
  st_readsecs.Text = String( nReadSecs )
  
  //transaction SQL_AllCalls
  //SQL_AllCalls = create transaction
  dw_1.SetTrans(SQLCA)
 
  dwSelectStr = dw_1.Describe("datawindow.table.select")
  wf_mod_selections(deptSelectionStr)
//  wf_mod_by_status(ls_StatusFilter) no filter in GCC only 11 displayed !!!!
  
  dw_1.Retrieve()
  
  ls_sort =  ProfileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort",'error')

  IF ls_sort <> 'error' THEN
     li_rc = dw_1.setsort(ls_sort)
	  If li_rc < 1 THEN
	     SetProfileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort","")
	   ELSE
		  li_rc = dw_1.sort()
        If li_rc < 1 THEN
		     SetProfileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort","")
	     END IF
     END IF
  END IF
    
  p_1.PictureName = cScrBMP1
  This.Icon = cWInIcon1
  
  If nReadSecs > 0 Then
     st_nextread.Text = String( RelativeTime( Now(), nReadSecs ), cTimeFormat )
  Else
		st_nextread.Text = "OFF"
  End If
 
 		cCols2Do[1] = "room"
		cCols2Do[2] = "gcc_id"
		cCols2Do[3] = "guest"
      cCols2Do[4] = "problem"
      cCols2Do[5] = "subproblem"
      cCols2Do[6] = "closed_bydept"
      cCols2Do[7] = "repairman"
      cCols2Do[8] = "problem_definition"
      cCols2Do[9] = "timer_start"
      cCols2Do[10] = "durationminutesopen"
      cCols2Do[11] = "callstat_stat_desc"
      cCols2Do[12] = "call_number_numeric"
		cCols2Do[13] = "pagingind"
//
//      // now let's re-color the columns
      nCols2Do = UpperBound( cCols2Do )
      For nCtr = 1 to nCols2Do
         // background color
         err = dw_1.Modify( cCols2Do[nCtr] + ".background.mode=0" )
         If err <> "" Then MessageBox("Status", "Unable to set background mode to Opaque for " + cCols2Do[nCtr] + " - " + err + ".")
         err = dw_1.Modify( cCols2Do[nCtr] + Bgrnd_string )
         If err <> "" Then MessageBox("Status", "Unable to set background color for "+ cCols2Do[nCtr] + " - " + err + ".")
         // foreground color
         err = dw_1.Modify( cCols2Do[nCtr] + Fgrnd_string )
         If err <> "" Then MessageBox("Status", "Unable to set foreground color for "+ cCols2Do[nCtr] + " - " + err + ".")
      Next
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
	SetPointer( pOldPointer )
	// time next timer as close to next read as possible inside the 65 sec limit
	If nReadSecs > 0 Then
		Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), this )
	Else
		Timer( 0, this )
	End If
	dw_1.SetFocus()
 
cb_closecall.Enabled = false
cb_copy.Enabled 		= false
cb_modify.Enabled		= false

w_gcc_main.postevent("ue_menu_set")


if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 


//set date masks 
string ls_mask, ls_format
if upper(left(gnv_appman.is_datemask, 1)) = 'M' then
//	ls_format 	= "m/d hh:mm:ss a/p"
	ls_mask 	 	= "mm/dd/yy hh:mm:ss"
ELSE
	ls_mask 		= "dd/mm/yy hh:mm:ss"
END IF

dw_1.Object.timer_start.EditMask.Mask	= ls_mask 



end event

on close;close(this)
end on

event timer;long nLastRowOnPage = 0, nFirstRowOnPage = 0
pointer pOldPointer
long nSelectedRow, nSelectedCol

cb_refresh.enabled = false  // disable refresh button while screen is refreshed

Timer( 0, this )
If SecondsAfter( Time(st_nextread.Text), Now() ) >= 0 Then
	p_1.PictureName 	= cScrBMP2
	This.Icon 			= cWInIcon2
	SetMicroHelp( "Reading Data for Pending Calls window...please wait." )
	pOldPointer 		= SetPointer(HourGlass!)
	nLastRowOnPage  	= Long( dw_1.Describe( "datawindow.LastRowOnPage" ) )
	nFirstRowOnPage 	= Long( dw_1.Describe( "datawindow.FirstRowOnPage" ) )

	dw_1.SetRedraw(False)
	st_lastread.Text 	= String(Now(), cTimeFormat)
	st_readsecs.Text 	= String( nReadSecs )
	nSelectedRow 		= dw_1.GetRow()
	nSelectedCol 		= dw_1.GetColumn()
	
	dw_1.Retrieve()
	dw_1.ScrollToRow(nLastRowOnPage)
	dw_1.ScrollToRow(nFirstRowOnPage)
	p_1.PictureName 	= cScrBMP1
	This.Icon = cWInIcon1
	
	If nReadSecs > 0 Then
		st_nextread.Text = String( RelativeTime( Now(), nReadSecs ), cTimeFormat )
	Else
		st_nextread.Text = "OFF"
	End If
	dw_1.SetRow(nSelectedRow)
	dw_1.SetColumn(nSelectedCol)
	
	if cb_closecall.Enabled = false then
		cb_closecall.Enabled = true
		cb_copy.Enabled 		= true
		cb_modify.Enabled 	= true
	end if

	dw_1.SetRedraw(True)
	SetPointer(pOldPointer)
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
End If

// time next timer as close to next read as possible inside the 65 sec limit
If nReadSecs > 0 Then
	Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), this )
Else
	Timer( 0, this )
End If
end event

on w_gcc_pending_calls.create
this.st_status=create st_status
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.cb_findprev=create cb_findprev
this.st_6=create st_6
this.st_5=create st_5
this.cb_closecall=create cb_closecall
this.cb_copy=create cb_copy
this.cb_modify=create cb_modify
this.pb_last=create pb_last
this.cb_exit=create cb_exit
this.cb_sort=create cb_sort
this.cb_findnext=create cb_findnext
this.cb_find=create cb_find
this.pb_first=create pb_first
this.p_1=create p_1
this.cb_print=create cb_print
this.cb_refresh=create cb_refresh
this.st_19=create st_19
this.st_readsecs=create st_readsecs
this.st_17=create st_17
this.st_16=create st_16
this.st_nextread=create st_nextread
this.st_lastread=create st_lastread
this.st_13=create st_13
this.st_3=create st_3
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.st_4=create st_4
this.Control[]={this.st_status,&
this.st_9,&
this.st_8,&
this.st_7,&
this.cb_findprev,&
this.st_6,&
this.st_5,&
this.cb_closecall,&
this.cb_copy,&
this.cb_modify,&
this.pb_last,&
this.cb_exit,&
this.cb_sort,&
this.cb_findnext,&
this.cb_find,&
this.pb_first,&
this.p_1,&
this.cb_print,&
this.cb_refresh,&
this.st_19,&
this.st_readsecs,&
this.st_17,&
this.st_16,&
this.st_nextread,&
this.st_lastread,&
this.st_13,&
this.st_3,&
this.st_1,&
this.dw_3,&
this.st_2,&
this.dw_1,&
this.gb_1,&
this.st_4}
end on

on w_gcc_pending_calls.destroy
destroy(this.st_status)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.cb_findprev)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_closecall)
destroy(this.cb_copy)
destroy(this.cb_modify)
destroy(this.pb_last)
destroy(this.cb_exit)
destroy(this.cb_sort)
destroy(this.cb_findnext)
destroy(this.cb_find)
destroy(this.pb_first)
destroy(this.p_1)
destroy(this.cb_print)
destroy(this.cb_refresh)
destroy(this.st_19)
destroy(this.st_readsecs)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_nextread)
destroy(this.st_lastread)
destroy(this.st_13)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.st_4)
end on

event deactivate;w_gcc_main.postevent("ue_menu_set")

end event

event activate;w_gcc_main.triggerevent("ue_menu_set")
end event

type st_status from statictext within w_gcc_pending_calls
integer x = 2939
integer y = 112
integer width = 617
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " "
boolean focusrectangle = false
end type

type st_9 from statictext within w_gcc_pending_calls
integer x = 2939
integer y = 56
integer width = 375
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Showing Status:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 110
integer y = 192
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "Closed GCC Calls"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_7 from statictext within w_gcc_pending_calls
integer x = 110
integer y = 132
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65280
boolean enabled = false
string text = "Open GCC Calls"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_findprev from commandbutton within w_gcc_pending_calls
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Continue last search from next record after the currently displayed one."
integer x = 2126
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 91
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Find &Prev"
end type

event clicked;int nFindResult

If Len( Trim( cFindNext ) ) > 0 Then
	If dw_1.ii_currow >= dw_1.RowCount() Then
		MessageBox( "Find Error", "You are at the last record.", StopSign! )
	Else
		// safe ti use ii_currow + 1 for start cuz we check for bounds above
		nFindResult = dw_1.Find( cFindNext, dw_1.ii_CurRow - 1 , 1)
		If nFindResult > 0 Then
//                      dw_1.SelectRow(dw_1.ii_currow, false)
			dw_1.SetRow( nFindResult )
			dw_1.ScrollToRow( nFindResult )
			dw_1.SelectRow( nFindResult, true )
		Else
			MessageBox( "String Not Found", "No more records with [" + cFindNext + "] found.", &
							StopSign! )
		End If
	End If
Else
	dw_1.TriggerEvent( "ue_find" )
End If

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end event

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

type st_6 from statictext within w_gcc_pending_calls
integer x = 110
integer y = 76
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Pending Calls"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_5 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 110
integer y = 76
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Timer Calls"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_closecall from commandbutton within w_gcc_pending_calls
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
string tag = "Close the highlighted call"
integer x = 137
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close "
end type

event clicked;if dw_1.GetItemString(dw_1.GetRow(),'repairman') = '' then
	beep(2)
	MessageBox("Error","Can't close a unassigned call!")
	return
end if
If Is_PasswordOK( Get_Event_Security( "CS" ) ) Then
	string callNumber, statCode, targetTable
	callNumber 	= dw_1.GetItemString(dw_1.GetRow(),"call_number")
	statCode 	= dw_1.GetItemString(dw_1.GetRow(),"stat_code")
	if integer(statCode) < 10 then
  		targetTable = '1'
	else
		targetTable = '2'
	end if
	if f_close_a_call_gcc(callNumber) then // ,targetTable
		if dw_1.DeleteRow(0) < 0 then
			MessageBox("DW Error","DeleteRow error: " + callNumber)
		end if
	end if
end if
end event

event ue_mousemove;If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end event

type cb_copy from commandbutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Copy the highlighted call"
boolean visible = false
integer x = 466
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cop&y"
end type

event ue_mousemove;If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end event

event clicked;If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then

string callNumber, action, statCode, clickedColNum
callNumber 		= dw_1.GetItemString(dw_1.GetRow(),"call_number")
statCode 		= dw_1.GetItemString(dw_1.GetRow(),"stat_code")
clickedColumn 	= dw_1.GetColumnName()
clickedColNum 	= string(f_find_col_num(clickedColumn),"00")
if integer(statCode) < 10 then
   action = '3'
else
	action = '4'
end if

if IsValid(w_gcc_call_upd) then
		w_gcc_call_upd.sCallNumber = callNumber
		w_gcc_call_upd.openMode 	= action
		w_gcc_call_upd.colToSet 	= integer(clickedColNum)
		w_gcc_call_upd.TriggerEvent("ue_refresh")
		open(w_gcc_call_upd)
else
	// 6/17/97 SFM padded messageparm with'00' for substring call number
	OpenSheetWithParm( w_gcc_call_upd, action+'00'+callNumber, "w_gcc_call_upd", w_gcc_main, 0, Original! )
end if
end if
end event

type cb_modify from commandbutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Modify the highlighted call"
integer x = 795
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modify"
end type

event ue_mousemove;If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end event

event clicked;long ll_row
ll_row	= dw_1.GetRow()
if ll_row <= 0 then return 

If Is_PasswordOK( Get_Event_Security( "CM" ) ) Then
	string callNumber, action, statCode, clickedColNum
	callNumber 		= dw_1.GetItemString(ll_row,	"call_number")
	statCode 		= dw_1.GetItemString(ll_row,	"stat_code")
	clickedColumn 	= dw_1.GetColumnName()
	clickedColNum 	= string(f_find_col_num(clickedColumn),"00")
	istr_parms.gccid = dw_1.GetItemNumber(ll_row,	"gcc_id")
	
  	action = '1'
	If IsValid( w_gcc_call_upd ) Then
  		MessageBox('Warning', 'Call Window already open for another guest and or task!.~r~nClose it first.', StopSign!)
		open(w_gcc_call_upd)
	else
 		SetPointer( Hourglass!)
		istr_parms.CallNumber 					= callNumber
		istr_parms.openMode 						= action
		istr_parms.colToSet 						= integer(clickedColNum)
		istr_parms.return_after_call_closed = 'Y' // close upd window if call closed
		istr_parms.w_caller						= parent
		
		OpenSheetWithParm( w_gcc_call_upd, istr_parms, w_gcc_main, 0, Layered!)
	end if
end if


end event

type pb_last from picturebutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Scroll to last call record as currently sorted."
integer x = 2624
integer y = 1488
integer width = 101
integer height = 84
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "last1.bmp"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;if dw_1.rowcount() > 0 then dw_1.scrolltorow(dw_1.rowcount())
end event

type cb_exit from commandbutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Exit and close this window.  "
integer x = 2368
integer y = 156
integer width = 466
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xit"
boolean cancel = true
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;close(parent)
end on

type cb_sort from commandbutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Sort the data in this workstations~' data-buffer from among several different fields."
integer x = 1129
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "S&ort..."
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;dw_1.triggerevent("ue_sort")

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end on

type cb_findnext from commandbutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Continue last search from next record after the currently displayed one."
integer x = 1792
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Find &Next"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;int nFindResult

If Len( Trim( cFindNext ) ) > 0 Then
	If dw_1.ii_currow >= dw_1.RowCount() Then
		MessageBox( "Find Error", "You are at the last record.", StopSign! )
	Else
		// safe ti use ii_currow + 1 for start cuz we check for bounds above
		nFindResult = dw_1.Find( cFindNext, dw_1.ii_CurRow+1, dw_1.RowCount() )
		If nFindResult > 0 Then
//                      dw_1.SelectRow(dw_1.ii_currow, false)
			dw_1.SetRow( nFindResult )
			dw_1.ScrollToRow( nFindResult )
			dw_1.SelectRow( nFindResult, true )
		Else
			MessageBox( "String Not Found", "No more records with [" + cFindNext + "] found.", &
							StopSign! )
		End If
	End If
Else
	dw_1.TriggerEvent( "ue_find" )
End If

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end event

type cb_find from commandbutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Find a particular call record based on value of any of several different fields.  Right-click continues last search."
integer x = 1467
integer y = 1492
integer width = 283
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Find..."
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;dw_1.triggerevent("ue_find")
dw_1.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end on

type pb_first from picturebutton within w_gcc_pending_calls
event ue_mousemove pbm_mousemove
string tag = "Scroll to first call record as currently sorted."
integer x = 2514
integer y = 1488
integer width = 101
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "first1.bmp"
end type

on ue_mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;if dw_1.rowcount() > 0 then dw_1.scrolltorow(1)
end event

type p_1 from picture within w_gcc_pending_calls
integer x = 741
integer y = 60
integer width = 169
integer height = 144
string picturename = "check1.bmp"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_gcc_pending_calls
boolean visible = false
integer x = 2373
integer y = 160
integer width = 466
integer height = 100
integer taborder = 140
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

type cb_refresh from commandbutton within w_gcc_pending_calls
integer x = 2368
integer y = 44
integer width = 466
integer height = 100
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Refresh"
boolean default = true
end type

event clicked;parent.event ue_refresh() 
end event

type st_19 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 2162
integer y = 324
integer width = 160
integer height = 76
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

type st_readsecs from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 2034
integer y = 592
integer width = 133
integer height = 76
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

type st_17 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 2016
integer y = 228
integer width = 206
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Every"
boolean focusrectangle = false
end type

type st_16 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 1294
integer y = 324
integer width = 306
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Next Read:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nextread from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 1605
integer y = 324
integer width = 384
integer height = 76
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

type st_lastread from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 1605
integer y = 228
integer width = 384
integer height = 76
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

type st_13 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 1294
integer y = 228
integer width = 306
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Last Read:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_gcc_pending_calls
integer x = 937
integer y = 60
integer width = 1362
integer height = 148
integer textsize = -19
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 65535
long backcolor = 16711680
boolean enabled = false
string text = "GCC Pending Calls View"
alignment alignment = center!
boolean border = true
long bordercolor = 65535
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_1 from statictext within w_gcc_pending_calls
boolean visible = false
integer x = 635
integer y = 44
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

type dw_3 from datawindow within w_gcc_pending_calls
event mousemove pbm_mousemove
boolean visible = false
integer x = 498
integer y = 508
integer width = 1225
integer height = 748
integer taborder = 20
string dataobject = "d_gcc_pending_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event mousemove;string cObject, cTag

// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is not down, so set MicroHelp()
	cObject = this.GetObjectAtPointer()   // Get object name

	// this takes care of "!" (bad Describe()) AND no object
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

event doubleclicked;//int nRowClicked
//string cCallClicked
//
//SetPointer( HourGlass! )
//// Obtains call number of clicked row and jumps to call screen
////nRowClicked = dw_1.GetClickedRow()
//nRowClicked = row
//If nRowClicked > 0 Then
//	cCallClicked = dw_1.GetItemString( nRowClicked, "call_number" )
//	If Len( cCallClicked ) > 0 Then
//		If IsValid( w_call_de ) Then
//			w_call_de.cPassCall = cCallClicked
//		End If
//		SetPointer( HourGlass! )
////              If UnitsToPixels( nScreenWidth, XUnitsToPixels! ) > 650 Then    // after 640x480 is 800x600
////                      OpenSheetWithParm( w_call_de2, cCallClicked, "w_call_de", &
////                              w_main, 0, Original! )
////              Else
//			OpenSheetWithParm( w_call_de, cCallClicked, "w_call_de", &
//				w_main, 0, Original! )
////              End If
//	Else
//		MessageBox( "Call Number Unknown", "The call you just selected " + &
//				"MAY NOT be jumped to on the Call Screen because the call number cannot " + &
//				"be determined.  Please make sure the tip of the cursor is " + &
//				"directly on the call number field when you double-click the mouse.", StopSign! )
//	End If
//End If

end event

type st_2 from statictext within w_gcc_pending_calls
integer x = 759
integer y = 80
integer width = 137
integer height = 124
integer textsize = -22
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
string facename = "Wingdings"
long textcolor = 128
long backcolor = 65535
boolean enabled = false
string text = "%"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from u_dw_maint within w_gcc_pending_calls
integer x = 14
integer y = 272
integer width = 2866
integer height = 1156
integer taborder = 60
string dataobject = "d_gcc_pending_calls"
boolean hscrollbar = true
end type

event constructor;call super::constructor;//dwCurrDW = This

// ***** Set the columns and descriptions to find on.
isa_findcols[1] = "room"
isa_findcols[2] = "guest"
isa_findcols[3] = "problem"
isa_findcols[4] = "subproblem"
isa_findcols[5] = "closed_bydept"
isa_findcols[6] = "repairman"
isa_findcols[7] = "problem_definition"
isa_findcols[8] = "call_number_numeric"
isa_findcols[9] = "timer_start"
isa_findcols[10] = "durationminutesopen"
isa_findcols[11] = "callstat_stat_desc"
isa_findcols[12] = "call_indate"


isa_finddesc[1] = "Room"
isa_finddesc[2] = "Guest/Caller"
isa_finddesc[3] = "Task"
isa_finddesc[4] = "Sub Task"
isa_finddesc[5] = "Dept."
isa_finddesc[6] = "Handled By"
isa_finddesc[7] = "Task Definition"
isa_finddesc[8] = "Call Number"
isa_finddesc[9] = "Timer Start"
isa_finddesc[10] = "Duration"
isa_finddesc[11] = "Status"
isa_finddesc[12] = "Date Opened"

// ***** Set the columns and descriptions to sort on.
isa_sortcols[1]  = "room"
isa_sortcols[2] = "guest"
isa_sortcols[3]  = "problem"
isa_sortcols[4]  = "subproblem"
isa_sortcols[5]  = "closed_bydept"
isa_sortcols[6]  = "repairman"
isa_sortcols[7]  = "problem_definition"
isa_sortcols[8]  = "call_number_numeric"
isa_sortcols[9]  = "timer_start"
isa_sortcols[10] = "durationminutesopen"
isa_sortcols[11] = "stat_code"
isa_sortcols[12] = "call_indate"
isa_sortcols[13] = "compute_0011"

isa_sortdesc[1] = "Room"
isa_sortdesc[2] = "Guest/Caller"
isa_sortdesc[3] = "Task"
isa_sortdesc[4] = "Sub Task"
isa_sortdesc[5] = "Dept."
isa_sortdesc[6] = "Handled By"
isa_sortdesc[7] = "Task Definition"
isa_sortdesc[8] = "Call Number"
isa_sortdesc[9] =  "Timer Start"
isa_sortdesc[10] = "Duration"
isa_sortdesc[11] = "Status"
isa_sortdesc[12] = "Date/Time Opened"
isa_sortdesc[13] = "Status Group"

// ***** for seeding
ii_seedtype = 1 // 1 = values, 0 = foreign keys
ii_seedmode = 1 // 0 = no, 1 = after insert, 2 = before save

isa_primkeycols[1] = "stat_code"
isa_primkeyvals[1] = "01"

isa_primkeycols[2] = "room"
isa_primkeyvals[2] = " "

// Set the column to get focus after insert.
is_firstcol = "room"

// The CHANGES UNSAVED MESSAGE
is_promptstring = "Call Data-Entry Screen changes are Un-Saved.  " + &
						"Would you like to save changes?"

// re-populate sub-problem, et. al.
//Set_dddw_Filters()





end event

on rowfocuschanged;call u_dw_maint::rowfocuschanged;dw_1.SelectRow(0,false)
end on

event ue_find;call super::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
	cb_findnext.Enabled = True
	cb_findprev.Enabled = True
Else
	cb_findnext.Enabled = False
	cb_findprev.Enabled = False
End If

end event

event doubleclicked;if row > 0 then
//	clickedColumn = this.GetColumnName()
//	MessageBox("column num",string(f_find_col_num(this.GetColumnName())) + " " + clickedColumn)
	cb_modify.TriggerEvent("clicked")
end if

end event

event clicked;call super::clicked;if row > 0 then
	cb_closecall.Enabled = true
	cb_copy.Enabled = true
	cb_modify.Enabled = true
else
	cb_closecall.Enabled = false
	cb_copy.Enabled = false
	cb_modify.Enabled = false
end if
end event

event retrieveend;call super::retrieveend;IF this.find('repairman = ""',1,this.rowcount()) > 0 THEN
	beep(1)
	thereIsAUnassignCall = false
end if
wf_find_preopen_paging_call()
cb_refresh.enabled = true
end event

type gb_1 from groupbox within w_gcc_pending_calls
boolean visible = false
integer x = 2363
integer width = 512
integer height = 396
integer taborder = 10
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type st_4 from statictext within w_gcc_pending_calls
integer x = 110
integer y = 12
integer width = 480
integer height = 68
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
string text = "Color Legend"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

