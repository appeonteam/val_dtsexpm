$PBExportHeader$w_closed_calls.srw
forward
global type w_closed_calls from Window
end type
type cb_findprev from commandbutton within w_closed_calls
end type
type cb_refresh from commandbutton within w_closed_calls
end type
type cb_find from commandbutton within w_closed_calls
end type
type cb_findnext from commandbutton within w_closed_calls
end type
type cb_sort from commandbutton within w_closed_calls
end type
type pb_first from picturebutton within w_closed_calls
end type
type pb_last from picturebutton within w_closed_calls
end type
type cb_1 from commandbutton within w_closed_calls
end type
type dw_1 from u_dw_maint within w_closed_calls
end type
type p_1 from picture within w_closed_calls
end type
type st_readsecs from statictext within w_closed_calls
end type
type st_nextread from statictext within w_closed_calls
end type
type st_lastread from statictext within w_closed_calls
end type
type st_3 from statictext within w_closed_calls
end type
type st_14 from statictext within w_closed_calls
end type
end forward

global type w_closed_calls from Window
int X=1
int Y=1
int Width=2926
int Height=1665
boolean TitleBar=true
string Title="Closed Calls View"
long BackColor=12632256
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
WindowState WindowState=maximized!
WindowType WindowType=child!
string Icon="EYE01A.ICO"
event ue_print pbm_custom01
event ue_printscreen pbm_custom02
event ue_postopen pbm_custom03
event ue_cancelquery pbm_custom04
cb_findprev cb_findprev
cb_refresh cb_refresh
cb_find cb_find
cb_findnext cb_findnext
cb_sort cb_sort
pb_first pb_first
pb_last pb_last
cb_1 cb_1
dw_1 dw_1
p_1 p_1
st_readsecs st_readsecs
st_nextread st_nextread
st_lastread st_lastread
st_3 st_3
st_14 st_14
end type
global w_closed_calls w_closed_calls

type variables
string cScrBMP1         // screen idle BMP
string cScrBMP2         // screen data read BMP
string cWinIcon1                // min win idle icon
string cWinIcon2                // min win read data icon
long nReadSecs          // Re-read data every...
long nRowCtr, nTotRows, nRowEvery , ii_column

string cfindnext
str_progress istr_progress
String is_call_number

u_secondtrans it_trans
end variables

event ue_print;dw_1.print()
end event

event ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

event ue_postopen;string ls_sort
integer li_rc 

// 11/1/97 SFM  UO for second transaction {
it_trans = create u_secondtrans

IF it_trans.uof_init() < 1 THEN
	Close(this)
	return
END IF

// }

dw_1.settransobject(it_trans)
dw_1.Retrieve()
w_main.triggerevent("ue_menu_set")

ls_sort =  ProfileString( cINIPath+"he_dts.ini", "Closed", "DefaultSort",'error')

IF ls_sort <> 'error' THEN
   li_rc = dw_1.setsort(ls_sort)
	If li_rc < 1 THEN
		SetProfileString( cINIPath+"he_dts.ini", "Closed", "DefaultSort","")
	ELSE
		li_rc = dw_1.sort()
      If li_rc < 1 THEN
		   SetProfileString( cINIPath+"he_dts.ini", "Closed", "DefaultSort","")
	   END IF
   END IF
END IF
this.setfocus()
end event

event ue_cancelquery;SetMicroHelp( "Closed Calls View - Full retrieval ABORTED BY USER.  Retrieved a total of " &
					+ String( nRowCtr ) + " rows." )
//      dtEarliestDate = 
Beep( 1 )
MessageBox( "Retrieval Aborted by User", "The Closed Calls View data retrieval in progress " + &
			"was aborted.  A total of [" + String( nRowCtr ) + "] " + &
			"rows of a possible " + String(nTotRows) + " were retrieved.", StopSign! )

dw_1.dbcancel()


end event

on w_closed_calls.create
this.cb_findprev=create cb_findprev
this.cb_refresh=create cb_refresh
this.cb_find=create cb_find
this.cb_findnext=create cb_findnext
this.cb_sort=create cb_sort
this.pb_first=create pb_first
this.pb_last=create pb_last
this.cb_1=create cb_1
this.dw_1=create dw_1
this.p_1=create p_1
this.st_readsecs=create st_readsecs
this.st_nextread=create st_nextread
this.st_lastread=create st_lastread
this.st_3=create st_3
this.st_14=create st_14
this.Control[]={ this.cb_findprev,&
this.cb_refresh,&
this.cb_find,&
this.cb_findnext,&
this.cb_sort,&
this.pb_first,&
this.pb_last,&
this.cb_1,&
this.dw_1,&
this.p_1,&
this.st_readsecs,&
this.st_nextread,&
this.st_lastread,&
this.st_3,&
this.st_14}
end on

on w_closed_calls.destroy
destroy(this.cb_findprev)
destroy(this.cb_refresh)
destroy(this.cb_find)
destroy(this.cb_findnext)
destroy(this.cb_sort)
destroy(this.pb_first)
destroy(this.pb_last)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.p_1)
destroy(this.st_readsecs)
destroy(this.st_nextread)
destroy(this.st_lastread)
destroy(this.st_3)
destroy(this.st_14)
end on

event close;close(this)
end event

event closequery;IF IsValid(w_progress_window) THEN
   message.returnvalue = 1
   message.processed = true
   return
end if

IF IsValid(it_trans) THEN destroy(it_trans)
end event

event open;/* SFM mod 11/95 Removed security check */



/* if open is activated by archive system, make [refresh] button 
	invisible. */

if Message.stringParm = 'archive' then
	cb_refresh.visible = false
//	open(w_date_range)
end if

long color1, color2, color3, color4, default_color
string mod_string, err, mod_string2, cCols2Do[] 
string cOpenTimerCall, cPreOpenCall, cOpenNonTimerCall, cClosedCall
int nCols2Do, nCtr

// SFM 10/26/97 Determine db type and switch dataobjects if need be

IF cappdbtype = 'MSSQL' THEN
	dw_1.dataobject = 'd_closed_calls_mssql'
END IF


//If Is_PasswordOK( Get_Event_Security( "AO" ) ) Then
	SetMicroHelp( "Opening Closed Calls view screen...please wait." )
	// --------------------------------------------------
	// Pending settings from *.INI file
	// --------------------------------------------------
	nReadSecs = ProfileInt( cINIPath+"he_dts.ini", "Closed", "ReadSeconds", 150 )      // 2.5 min.'s
	cScrBMP1  = ProfileString( cINIPath+"he_dts.ini", "Closed", "ScreenBMP1", "eye01a.bmp" )
	cScrBMP2  = ProfileString( cINIPath+"he_dts.ini", "Closed", "ScreenBMP2", cScrBMP1 )
	cWinIcon1 = ProfileString( cINIPath+"he_dts.ini", "Closed", "WindowIcon1", cScrBMP1 )
	cWInIcon2 = ProfileString( cINIPath+"he_dts.ini", "Closed", "WindowIcon2", cScrBMP2 )

	p_1.PictureName = cScrBMP2
	This.Icon = cWInIcon2
	st_lastread.Text = String(Now(), cTimeFormat)
	st_readsecs.Text = String( nReadSecs )
	p_1.PictureName = cScrBMP1
	This.Icon = cWInIcon1

	color1                  = 255                                   // Red
	color2                  = 65535                         // Yellow
	color3                  = 65280                         // Green
	color4                  = 12632256                      // Gray
	default_color   = 16777215                      // White
	cOpenTimerCall = "( ( DaysAfter( Date( timer_start ),"+ &
										"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") >= 0 and integer(stat_code) < 10"
	cPreOpenCall = "( ( DaysAfter( Date( timer_start ),"+ &
										"Today() ) * 86400) + "+&
							"SecondsAfter( Time( timer_start ), "+&
											  "Now() ) "+&
					 ") < 0 and integer(stat_code) = 0"
	cOpenNonTimerCall = "( ( DaysAfter( Date( call_indate ),"+ &
										"Date( Today() ) ) * 86400 ) + "+&
							"SecondsAfter( Time( call_indate ), "+&
											  "Now() ) "+&
					 ") >= 0 and integer(stat_code) >= 10 and "+&
									"integer(stat_code) < 90"
	cClosedCall = "integer(stat_code) >= 90"

	mod_string = &
	".background.color = '"+String(default_color) +" &
	~t if(" + cOpenTimerCall + ","+String(color1)+",&
	if(" + cPreOpenCall 		 + ","+String(color2)+",&
	if(" + cOpenNonTimerCall + ","+String(color3)+",&
	if(" + cClosedCall 		 + ","+String(color4)+","+&
	String(default_color)+"))))'" 

	// for background color to work MODE must be set to opaque -> 0
	err = dw_1.Modify( "call_number_numeric.background.mode=0" )
	If err <> "" Then
		MessageBox("Status", "Unable to set background mode for call "+&
								"number - " + err + ".")
	End If
	cCols2Do[1] = "area_area_name"
	cCols2Do[2] = "problem_desc"
	cCols2Do[3] = "subproblem_desc"
	cCols2Do[4] = "closed_bydept"
	cCols2Do[5] = "repairman"
   cCols2Do[6] = "problem_definition"
   cCols2Do[7] = "call_indate"
	cCols2Do[8] = "call_number_numeric"
//	cCols2Do[9] = "stat_desc"
	
	



//** commented out by m.n. 
	// now let's re-color the columns
//	nCols2Do = UpperBound( cCols2Do )
//	For nCtr = 1 to nCols2Do
//		err = dw_1.Modify( cCols2Do[nCtr] + ".background.mode=0" )
//		If err <> "" Then
//			MessageBox("Status", "Unable to set background mode to Opaque for "+&
//								cCols2Do[nCtr] + " - " + err + ".")
//		End If
//		err = dw_1.Modify( cCols2Do[nCtr] + mod_string )
//		If err <> "" Then
//			MessageBox("Status", "Unable to set background color for "+&
//								cCols2Do[nCtr] + " - " + err + ".")
//		End If
//	Next
//** end commented m.n
	SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
	// time next timer as close to next read as possible inside the 65 sec limit
//	If nReadSecs > 0 Then
//		Timer( Min( SecondsAfter( Now(), Time(st_nextread.Text) ), 65 ), this )
//	Else
//		Timer( 0, this )
//	End If
	//transaction SQL_AllCalls
	//SQL_AllCalls = create transaction
	dw_1.SetTrans(SQLCA)
//	This.SetRedraw( True )
//	dw_1.Retrieve()
//	// In case we closed window during retrieve
//	If IsValid( w_all_calls ) Then
//		If nReadSecs > 0 Then
//			st_nextread.Text = String( RelativeTime( Now(), nReadSecs ), cTimeFormat )
//		Else
//			st_nextread.Text = "OFF"
//		End If
//		dw_1.SetFocus()
//	End If
////else
////      SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
////      Close( this )
////end if
//
this.postevent("ue_postopen")
end event

event resize;pointer cpOldPointer

cpOldPointer = SetPointer(HourGlass!)


this.setredraw(FALSE)
      
cb_find.y     = This.WorkSpaceHeight() - ( cb_find.height + 40 )
cb_findnext.y = cb_find.y
cb_findprev.y = cb_find.y
cb_sort.y     = cb_find.y
pb_first.y    = cb_find.y
//pb_next.y     = cb_find.y
//pb_prior.y    = cb_find.y
pb_last.y     = cb_find.y

dw_1.Resize(This.WorkSpaceWidth() -  (20), &
				This.WorkSpaceHeight() - (st_3.y + st_3.height + cb_find.height + 100) )
this.setredraw(TRUE)



SetPointer( cpOldPointer )

end event

type cb_findprev from commandbutton within w_closed_calls
int X=1605
int Y=1421
int Width=334
int Height=89
int TabOrder=40
boolean Enabled=false
string Tag="Continue last search from previous record after the currently displayed one."
string Text="Find &Prev"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long ll_row
int nFindResult

If Len( Trim( cFindNext ) ) > 0 Then
	ll_row = dw_1.getselectedrow(0)
	IF ll_row > 1 THEN
		// safe ti use ii_currow + 1 for start cuz we check for bounds above
		nFindResult = dw_1.Find( cFindNext, ll_row - 1, 1 )
		If nFindResult > 0 Then
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

type cb_refresh from commandbutton within w_closed_calls
int X=2236
int Y=17
int Width=435
int Height=85
int TabOrder=70
string Text="&Refresh"
string Pointer="HAND.CUR"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//st_nextread.Text = String( RelativeTime( Now(), -1 ), cTimeFormat )
//Timer( .01, parent )
Long ll_findrow
setpointer(Hourglass!)
dw_1.retrieve()
IF is_call_number <> "" THEN
	ll_findrow = dw_1.find("Call_number = '"+is_call_number+"'",0,dw_1.rowcount())
	If ll_findrow > 0 THEN
//		dw_1.selectrow(0,FALSE)
//		dw_1.selectrow(ll_findrow,TRUE)    
		dw_1.scrolltorow(ll_findrow)
		dw_1.setcolumn(ii_column)
	END IF
END IF


end event

type cb_find from commandbutton within w_closed_calls
event ue_mousemove pbm_mousemove
int X=901
int Y=1421
int Width=334
int Height=89
int TabOrder=20
string Tag="Find a particular call record based on value of any of several different fields.  Right-click continues last search."
string Text="&Find..."
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF IsValid(w_progress_window) THEN return

dw_1.triggerevent("ue_find")
dw_1.setfocus() /* Sfm 11/95 fixes Alt- Problems */

end event

type cb_findnext from commandbutton within w_closed_calls
event ue_mousemove pbm_mousemove
int X=1253
int Y=1421
int Width=334
int Height=89
int TabOrder=30
boolean Enabled=false
string Tag="Continue last search from next record after the currently displayed one."
string Text="Find &Next"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

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

type cb_sort from commandbutton within w_closed_calls
event ue_mousemove pbm_mousemove
int X=549
int Y=1421
int Width=334
int Height=89
int TabOrder=10
string Tag="Sort the data in this workstations' data-buffer from among several different fields."
string Text="S&ort..."
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF IsValid(w_progress_window) THEN return

dw_1.triggerevent("ue_sort")

Dw_1.setfocus() /* Sfm 12/95 fixes Alt- Problems */

end event

type pb_first from picturebutton within w_closed_calls
event ue_mousemove pbm_mousemove
int X=2039
int Y=1421
int Width=101
int Height=85
int TabOrder=50
string Tag="Scroll to first call record as currently sorted."
string PictureName="first1.bmp"
boolean OriginalSize=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.scrolltorow(1)
end event

type pb_last from picturebutton within w_closed_calls
event ue_mousemove pbm_mousemove
int X=2195
int Y=1421
int Width=101
int Height=85
int TabOrder=60
string Tag="Scroll to last call record as currently sorted."
string PictureName="last1.bmp"
boolean OriginalSize=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.scrolltorow(dw_1.rowcount())
end event

type cb_1 from commandbutton within w_closed_calls
int X=2236
int Y=109
int Width=435
int Height=85
int TabOrder=80
string Text="E&xit"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF IsValid(w_progress_window) THEN return

parent.triggerevent("close")
end event

type dw_1 from u_dw_maint within w_closed_calls
event mousemove pbm_mousemove
int X=23
int Y=221
int Width=2881
int Height=1161
int TabOrder=90
string DataObject="d_closed_calls"
boolean HScrollBar=true
boolean HSplitScroll=true
end type

event mousemove;call super::mousemove;string cObject, cTag

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

event constructor;call super::constructor;// ***** Set the columns and descriptions to find on.

isa_findcols[1] = "area_area_name"
isa_findcols[2] = "problem_desc"
isa_findcols[3] = "subproblem_desc"
isa_findcols[4] = "closed_bydept"
isa_findcols[5] = "repairman"
isa_findcols[6] = "problem_definition"
isa_findcols[7] = "call_indate"
isa_findcols[8] = "call_number_numeric"
//isa_findcols[9] = "stat_desc"

isa_finddesc[1]  = "Room Number"
isa_finddesc[2]  = "Task"
isa_finddesc[3]  = "Sub-Task"
isa_finddesc[4]  = "Repaired by Dept."
isa_finddesc[5]  = "Repairman"
isa_finddesc[6]  = "Task Definition"
isa_finddesc[7]  = "Date Opened"
isa_finddesc[8]  = "Call Number"
//isa_finddesc[9]  = "Status Description"

// ***** Set the columns and descriptions to sort on.

isa_sortcols[1] = "area_area_name"
isa_sortcols[2] = "problem_desc"
isa_sortcols[3] = "subproblem_desc"
isa_sortcols[4] = "closed_bydept"
isa_sortcols[5] = "repairman"
isa_sortcols[6] = "problem_definition"
isa_sortcols[7] = "call_indate"
isa_sortcols[8] = "call_number_numeric"
//isa_sortcols[9] = "stat_desc"

isa_sortdesc[1]  = "Room Number"
isa_sortdesc[2]  = "Task"
isa_sortdesc[3]  = "Sub-Task"
isa_sortdesc[4]  = "Repaired by Dept."
isa_sortdesc[5]  = "Repaired by"
isa_sortdesc[6]  = "Task Definition"
isa_sortdesc[7]  = "Date Opened"
isa_sortdesc[8]  = "Call Number"
//isa_sortdesc[9]  = "Status Description"



end event

event doubleclicked;IF IsValid(w_progress_window) THEN return

//MessageBox("column num",string(f_find_col_num(this.GetColumnName())))
int nRowClicked
string cCallClicked, clickedColumn, clickedColNum

SetPointer( HourGlass! )
// Obtains call number of clicked row and jumps to call screen
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
				w_call_upd.openMode = '5'
				w_call_upd.colToSet = integer(clickedColNum)
				w_call_upd.TriggerEvent("ue_refresh")
				open(w_call_upd)
			else
				OpenSheetWithParm( w_call_upd, '5'+clickedColNum+cCallClicked, "w_call_upd", &
					w_main, 0, Original! )
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

event retrieveend;call super::retrieveend;If IsValid( w_main ) Then
	w_main.SetMicroHelp( "All Calls View - Retrieved a total of " + &
					String( This.RowCount()) + " rows." )
End If
SetPointer( Arrow! )
cb_1.enabled = TRUE
cb_refresh.Enabled = true

IF IsValid(w_progress_window) THEn
	close(w_progress_window)
END IF
end event

event retrieverow;call super::retrieverow;datetime dtEarliestCall

nRowCtr = nRowCtr + 1
If IsValid(w_progress_window) THEN
   If Mod( nRowCtr, nRowEvery ) = 0 Or nRowCtr >= nTotRows Then
			w_progress_window.wf_set_message( "Closed Calls View - Retrieving row " + String( nRowCtr ) + " of " + &
						String( nTotRows ) + "  -  " + &
						String( Round( ( nRowCtr / nTotRows ) * 100, 0 ) ) + &
						"% complete. ")
    End If
END IF
end event

event retrievestart;call super::retrievestart;str_progress lstr_progress

nRowCtr = 0

SetPointer( HourGlass! )
// Set Total Rows
SELECT count( "closedcalls"."call_number" )  
    INTO :w_closed_calls.ntotrows  
    FROM "closedcalls"  ;

// every 100th
nTotRows = Max( nTotRows, 1 )
nRowEvery = Max( Int( nTotRows / 20 ), 1 )
cb_1.enabled = false
cb_refresh.Enabled = false

lstr_progress.ss_title         = ' Closed Calls View Progress'
lstr_progress.sw_callingwindow = parent
lstr_progress.ss_message       = 'Processing request...'
openwithparm(w_progress_window,lstr_progress)


end event

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0,false)
end event

event ue_find;call super::ue_find;If Len( Trim( cGenFind ) ) > 0 Then
	cFindNext = cGenFind
	cGenFind = ""
	cb_findnext.Enabled = True
	cb_findprev.Enabled = True
Else
	cb_findnext.Enabled = False
	cb_findprev.Enabled = FALSE
End If

end event

event clicked;call super::clicked;IF row > 0 THEN
   is_call_number = getitemstring(row,"call_number")
	ii_column      = getcolumn()
END IF
end event

type p_1 from picture within w_closed_calls
int X=627
int Y=21
int Width=183
int Height=157
string PictureName="eye01a.bmp"
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
boolean FocusRectangle=false
string Pointer="HAND.CUR"
end type

type st_readsecs from statictext within w_closed_calls
int X=2003
int Y=321
int Width=124
int Height=69
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="000"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_nextread from statictext within w_closed_calls
int X=1559
int Y=273
int Width=403
int Height=69
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="00:00:00 AM"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_lastread from statictext within w_closed_calls
int X=1550
int Y=229
int Width=403
int Height=69
boolean Visible=false
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="00:00:00 AM"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_closed_calls
int X=860
int Y=21
int Width=1294
int Height=157
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleShadowBox!
string Text="Closed Calls View"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65535
long BackColor=0
long BorderColor=65535
int TextSize=-24
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_14 from statictext within w_closed_calls
int X=691
int Y=337
int Width=69
int Height=85
boolean Enabled=false
string Text="["
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=255
long BackColor=65535
int TextSize=-20
int Weight=400
string FaceName="Wingdings"
FontCharSet FontCharSet=Symbol!
FontPitch FontPitch=Variable!
end type

