$PBExportHeader$w_vzt_batch_schedule.srw
forward
global type w_vzt_batch_schedule from w_vzt_base
end type
type sle_interval from singlelineedit within w_vzt_batch_schedule
end type
type dw_schedule from uo_vzt_dwbase within w_vzt_batch_schedule
end type
type cb_refresh from commandbutton within w_vzt_batch_schedule
end type
type cb_timer from commandbutton within w_vzt_batch_schedule
end type
type cb_display from commandbutton within w_vzt_batch_schedule
end type
type cb_options from commandbutton within w_vzt_batch_schedule
end type
type cb_mail from commandbutton within w_vzt_batch_schedule
end type
type dw_distribution from uo_vzt_dwbase within w_vzt_batch_schedule
end type
type cbx_debug from checkbox within w_vzt_batch_schedule
end type
type cb_mail_logon from commandbutton within w_vzt_batch_schedule
end type
type dw_distlist from uo_vzt_dwbase within w_vzt_batch_schedule
end type
type dw_parms from uo_vzt_dwbase within w_vzt_batch_schedule
end type
type dw_rpt from uo_vzt_dwbase within w_vzt_batch_schedule
end type
type cbx_live from checkbox within w_vzt_batch_schedule
end type
type cb_sql from commandbutton within w_vzt_batch_schedule
end type
end forward

global type w_vzt_batch_schedule from w_vzt_base
integer x = 265
integer y = 396
integer width = 4869
integer height = 1948
string title = "Batch Scheduler"
event ue_refresh ( )
event type integer ue_startjob ( long al_row )
event type integer ue_display_report ( long al_row )
event ue_refresh_options ( )
event ue_finishedjobs ( )
event ue_mail_connect ( )
event ue_mail_send ( )
event ue_mail_options ( )
sle_interval sle_interval
dw_schedule dw_schedule
cb_refresh cb_refresh
cb_timer cb_timer
cb_display cb_display
cb_options cb_options
cb_mail cb_mail
dw_distribution dw_distribution
cbx_debug cbx_debug
cb_mail_logon cb_mail_logon
dw_distlist dw_distlist
dw_parms dw_parms
dw_rpt dw_rpt
cbx_live cbx_live
cb_sql cb_sql
end type
global w_vzt_batch_schedule w_vzt_batch_schedule

type variables
string  is_userid,  is_batch_inipath
str_reporter_reportparms  istr_parms
string is_mode 
boolean ib_connected, ib_outage
int ii_concurrent 
datetime idt_norun_start, idt_norun_end 
datetime idt_app_start
boolean            	 ib_dberror

string 		is_status_distributed = 'EMAILED'
uo_vzt_report_output	inv_output
datawindowchild 	idwc_distlist
string 		is_timer_autostart
string		is_mail_subject='', is_dist_list_id, is_bsched_id, is_output_id
end variables

event ue_refresh;dw_schedule.retrieve()
dw_schedule.visible = true
end event

event type integer ue_startjob(long al_row);// Passed all tests, run the job
string 	ls_run 
long		ll_run
SetPointer(HourGlass!) 
dw_schedule.object.starteddate [ al_row] = datetime( today(), now() )
dw_schedule.object.status [ al_row] = 'STARTED' 

If not cbx_debug.checked then // run as exe 
	if MID(is_batch_inipath, len(is_batch_inipath),1) <> '\' then is_batch_inipath = is_batch_inipath + '\'
	ls_run = is_batch_inipath+'vztbserv.exe BATCH`'+ dw_schedule.object.id [ al_row] +"`"
	ls_run += dw_schedule.object.userid [ al_row] +"`"
	ls_run += is_batch_inipath +"`"+ istr_parms.live_trace+"`"
	
	ls_run = f_nvl(ls_run , '*** null command ***')

	if gnv_appman.is_debugmode = 'Y' then 
			MessageBox('VZT: Run command:', ls_run )
	end if
	
	ll_run = RUN ( ls_run , Normal!) 

	if ll_run <> 1 then 
		dw_schedule.object.status [ al_row] = 'ERROR' 
		dw_schedule.object.message[ al_row] = 'VZT: Run command failed' 
		if gnv_appman.is_debugmode = 'Y' then 
			MessageBox('VZT: Run command failed', ls_run )
		end if
		
	END IF 
	
Else // run as a window 
	str_reporter_reportparms  lstr_parms
	window  lw_report
	string  ls_reportwin, ls_reportid
	
	lstr_parms.mode 			= 'BATCH'
	lstr_parms.report_id 	= dw_schedule.object.id [ al_row] 
	lstr_parms.schedule_id 	= dw_schedule.object.id [ al_row] 
	lstr_parms.userid 		= 'SYS'
	//istr_parms.live_trace
	
	ls_reportid					= dw_schedule.object.reportid [ al_row] 
	
	SELECT windowname INTO :ls_reportwin FROM vzt_reportdef WHERE reportid = :ls_reportid;
	
	if trim(ls_reportwin)='' or IsNull(ls_reportwin) then ls_reportwin = 'w_vzt_rpt_processor'
	OpenWithPArm( lw_report, lstr_parms, ls_reportwin) 
	this.POST EVENT ue_refresh()				
END IF

this.EVENT menu_save()				
If ii_savestatus <> 1 then this.backcolor = RGB ( 179, 200, 138) 
return 1

end event

event ue_display_report;// open report for display
long ll_rc
if al_row <=0 then al_row = dw_schedule.GetRow() // first assume current row on 0
if al_row <=0 or al_row > dw_schedule.RowCount() then return -1
ll_rc = 1 
SetPointer(HourGlass!)
If trim( dw_schedule.object.status [ al_row] ) <> "FINISHED" then 
	MessageBox("Display Report", "Job is not finished yet." )
	ll_rc = 0 
END IF 
If ll_rc > 0 then 
	IF TRIM(dw_schedule.object.outputid [ al_row]) = '' or IsNULL( dw_schedule.object.outputid [ al_row] ) then 
		MessageBox("Display Report Error", "Output ID is Missing.", Stopsign! )
		ll_rc = -1 
	END IF 
END IF 
If ll_rc > 0 then
	istr_parms.mode = 'DISPLAY'
	istr_parms.schedule_id 	= dw_schedule.object.id [ al_row] 
	istr_parms.report_id 	= dw_schedule.object.reportid [ al_row] 
	window lw_display 
	string ls_windowname
	ls_windowname = 'w_vzt_rpt_processor'   
	openWithParm( lw_display,  istr_parms, ls_windowname )		
END IF

SetPointer(Arrow!)
return ll_rc 
end event

event ue_refresh_options;//
SELECT batchconcurrency, batch_norun_start_time, batch_norun_end_time , option08, option05
into 	:ii_concurrent, :idt_norun_start, :idt_norun_end , :is_batch_inipath, :is_timer_autostart
FROM 	vzt_sysoptions where id = 1;

If SQLCA.SQLCODE <> 0 then 
	MessageBox("VZT Batch Server Error", "Could not retrieve system options from database.", Stopsign!)
End IF	

dw_distlist.Retrieve()

end event

event ue_finishedjobs;long 		ll_finished, ll_row, ll_rc 
string 	ls_id 

dw_schedule.SetFilter( "status = 'FINISHED' and not match(message,'.*"+is_status_distributed+".*') ")
dw_schedule.Filter()
ll_finished = dw_schedule.RowCOunt()

If ll_finished > 0 then 
	For ll_row = 1 to ll_finished 
	 	ls_id	= dw_schedule.object.id [ll_row] 	 
	 	dw_schedule.SetRow( ll_row ) 
		this.EVENT ue_mail_send()	
	Next // main loop
end if 

this.EVENT menu_save()	
If ii_savestatus <> 1 then 
	this.backcolor = RGB ( 179, 200, 138) 
	return 
End IF
this.EVENT ue_refresh()	

dw_schedule.SetFilter( "1=1")
dw_schedule.Filter()
dw_schedule.SetRedraw( true)

end event

event ue_mail_connect();int li_ret
li_ret = 1
if gnv_appman.inv_mail.ib_logged_on then 
	li_ret = MessageBox('Batch Schedule Mail Logon', 'You seem to be already logged on. Do you want to logon again?', question!, yesno!) 
end if
If li_ret = 1 then 
	li_ret = gnv_appman.inv_mail.uf_mail_logon() 
	If li_ret = 1 then 
//		MessageBox('Batch Schedule Mail Logon', 'Logon Successful' ) 
	ELSE
		MessageBox('Batch Schedule Mail Logon', 'Logon Failed' ) 
	END IF
END IF
end event

event ue_mail_send();long		ll_maxrows, ll_dist, ll_ret, ll_rc, ll_trigrow, ll_trigger
string	ls_msg , ls_filename, ls_sent_lists

is_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
is_bsched_id		= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
is_output_id		= f_nvl(dw_schedule.object.outputid [ dw_schedule.GetRow() ] , '')

ls_msg = 'is_dist_list_id 	'+ is_dist_list_id + "~r~n"
ls_msg = 'is_id'+ is_bsched_id+ "~r~n"
ls_msg = 'is_output_id	'+ is_output_id	+ "~r~n"

uo_trace01.event ue_trace('Schedule Mail Send', ls_msg )

inv_output.event ue_read_report_output ( is_output_id, ib_rptblob, dw_parms, dw_rpt, 'BATCH')

// create unique file name for report 
ls_filename =  dw_schedule.object.id[1] 
f_replace(ls_filename, ',','')
f_replace(ls_filename, ':','')
f_replace(ls_filename, ';','')
f_replace(ls_filename, ':','')
f_replace(ls_filename, '/','')
f_replace(ls_filename, '\','')
f_replace(ls_filename, '|','')
f_replace(ls_filename, '-','_')

// Use Distlist from report rows if present 
ll_dist = f_isvalidcolumn (dw_rpt, 'vzt_distlist')
IF ll_dist > 0 then 	
	ll_maxrows = dw_rpt.RowCount() 
	FOR ll_dist = 1 to ll_maxrows 
		is_dist_list_id = f_nvl(dw_rpt.GetItemString( ll_dist, 'vzt_distlist') ,'')
		IF is_dist_list_id = '' or POS(ls_sent_lists, is_dist_list_id)>0 then continue 
		dw_rpt.SetFilter( "vzt_distlist = '"+ is_dist_list_id+"'" )
		dw_rpt.Filter() // send only report rows filtered for the distlist 
		ls_sent_lists = ls_sent_lists + ','+ is_dist_list_id 
		this.event ue_mail_report_save2file( ls_filename, dw_rpt)
		this.event ue_mail_report_to_dist ()
	NEXT	
ELSE 
	If is_dist_list_id = '' then return 
	this.event ue_mail_report_save2file( ls_filename, dw_rpt)
	this.event ue_mail_report_to_dist ()
END IF 

FileDelete ( is_vzrfile	 )
FileDelete ( is_pdffile	 )


end event

event ue_mail_options;//is_mail_subject = is_mail_subject + 'sssss'
end event

event open;call super::open;setpointer( Hourglass!)
ib_resizeenabled = true 
istr_parms.live_trace = 'N' 
if Not IsValid(gnv_appman.inv_mail) then gnv_appman.inv_mail = CREATE uo_vzt_mail

is_userid = f_nvl(upper( trim(message.stringparm)), '')
idt_app_start = f_sysdate() // window open time = app start time for server 


dw_distlist.Retrieve()
if dw_schedule.GetChild( 'distribution_list_id', idwc_distlist) > 0 then
	dw_distlist.ShareData( idwc_distlist)
END IF

If lower(is_userid) = 'sys'  then 
	 is_userid = '' // allow to view all users 
   // we are on the server 
	is_mode = 'SERVER'
	this.event ue_refresh_options() 
	if is_timer_autostart = 'Y' then cb_timer.post event clicked() 
//	this.backcolor = RGB( 128,128,128)

	inv_output 	= CREATE uo_vzt_report_output	
	//gnv_appman.inv_mail = CREATE uo_vzt_mail 
	
	
	this.post event ue_mail_connect() 
//	If gnv_appman.is_debugmode = 'Y' then 
//		dw_rpt.visible = true 
//		dw_parms.visible = true 
//	END IF
	
ELSE 
	// the window opened from the client workstation
	is_mode 						= 'CLIENT'	
	cb_options.visible 		= false		// hide options refresh
	im_menu.m_file.visible 	= false		// hide menu
 
	If POS( is_accessflags, "A") <= 0 then // not authorized to view all users 
		// modify SQL select to filter for current user 
		string ls_newsql
		long ll_rc
		ls_newsql 	= Upper(dw_schedule.getSQLSelect())
		ls_newsql 	= ls_newsql + " WHERE userid = '" +  is_userid +"' " 
		ll_rc 		= dw_schedule.setSQLSelect(ls_newsql) 
		If ll_rc <> 1 then // error 
			MessageBox('VZT Batch Schedule Error', 'Failed to set SQL user filter:~r~n~r~n'+ls_newsql, StopSign!)
			POST Close(this)
			RETURN 
		END IF 
	End If
	If POS( is_accessflags, "W") <= 0 then // not authorized to update/view all fields 
		cb_save.enabled = false
		dw_schedule.object.reportid.visible = false 
		dw_schedule.object.outputid.visible = false 
		dw_schedule.object.id.visible 		= false 
		dw_schedule.Object.Datawindow.readonly="YES"		
	End If
END IF

dw_primary = dw_schedule
this.EVENT ue_refresh()
If	is_mode <> 'SERVER' then cb_timer.event clicked() //don't start timer on the server automatically 
this.title = this.title + " " + is_mode 
cb_delete1.enabled = false

SELECT rpt_format, rpt_pdf_style INTO :is_rpt_format, :is_rpt_pdf_style 
FROM VZT_SYSOPTIONS where id = 1
USING SQLCA;

end event

on w_vzt_batch_schedule.create
int iCurrent
call super::create
this.sle_interval=create sle_interval
this.dw_schedule=create dw_schedule
this.cb_refresh=create cb_refresh
this.cb_timer=create cb_timer
this.cb_display=create cb_display
this.cb_options=create cb_options
this.cb_mail=create cb_mail
this.dw_distribution=create dw_distribution
this.cbx_debug=create cbx_debug
this.cb_mail_logon=create cb_mail_logon
this.dw_distlist=create dw_distlist
this.dw_parms=create dw_parms
this.dw_rpt=create dw_rpt
this.cbx_live=create cbx_live
this.cb_sql=create cb_sql
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_interval
this.Control[iCurrent+2]=this.dw_schedule
this.Control[iCurrent+3]=this.cb_refresh
this.Control[iCurrent+4]=this.cb_timer
this.Control[iCurrent+5]=this.cb_display
this.Control[iCurrent+6]=this.cb_options
this.Control[iCurrent+7]=this.cb_mail
this.Control[iCurrent+8]=this.dw_distribution
this.Control[iCurrent+9]=this.cbx_debug
this.Control[iCurrent+10]=this.cb_mail_logon
this.Control[iCurrent+11]=this.dw_distlist
this.Control[iCurrent+12]=this.dw_parms
this.Control[iCurrent+13]=this.dw_rpt
this.Control[iCurrent+14]=this.cbx_live
this.Control[iCurrent+15]=this.cb_sql
end on

on w_vzt_batch_schedule.destroy
call super::destroy
destroy(this.sle_interval)
destroy(this.dw_schedule)
destroy(this.cb_refresh)
destroy(this.cb_timer)
destroy(this.cb_display)
destroy(this.cb_options)
destroy(this.cb_mail)
destroy(this.dw_distribution)
destroy(this.cbx_debug)
destroy(this.cb_mail_logon)
destroy(this.dw_distlist)
destroy(this.dw_parms)
destroy(this.dw_rpt)
destroy(this.cbx_live)
destroy(this.cb_sql)
end on

event timer;// Main scheduling loop 
integer  li_daynum, li_dbret, li_temp, li_started
long 		ll_row, ll_maxrow, ll_daystokeep, ll_rc
string 	ls_recurring, ls_id, ls_outputid, ls_status, ls_daystorun[7], ls_old_interval='10'
boolean  lb_run 
datetime ldt_submitted, ldt_timetorun, ldt_timetorun_end, ldt_sysdate, ldt_started
// Go through all rows and see what needs to be done... 

sle_interval.backcolor = RGB ( 225, 132, 183)
ldt_sysdate			= f_sysdate()
ls_old_interval 	= sle_interval.text
timer ( 0 )			//stop timer while running 
If is_mode <> 'SERVER' then 
	// CLIENT MODE 	
	this.EVENT menu_save()	
	this.event ue_refresh()
	ll_maxrow = dw_schedule.RowCount()
	dw_schedule.Selectrow(0, false)
Else
	// SERVER MODE 
	dw_schedule.SetRedraw( false)

	// Check for server backup window (disconnect and reconnect )
	If time(ldt_sysdate) >= time( idt_norun_start) and time(ldt_sysdate) <= time( idt_norun_end ) then 
		If ib_connected  then 
			li_dbret = gnv_appman.uf_dbdisconnect( SQLCA, false) // 0 // 
//			ls_old_interval = sle_interval.text
//			sle_interval.text = '30'
		END IF
		dw_schedule.Reset() 
		sle_interval.backcolor = RGB ( 72, 192, 192)
		ib_connected = false 
		ib_outage	 = true 
		goto RET
	Else // not in backup window - run reports 
		ib_outage	 = false
		// always check if still connected 
		ib_connected = false
//		transaction ltest
//		ltest = CREATE transaction 
		SELECT 10 INTO :li_temp from vzt_sysoptions where id = 1 using SQLCA ;
		If SQLCA.SQLcode = 0  and li_temp = 10 then 
			ib_connected = true 
			dw_schedule.SettransObject(SQLCA) 			
			dw_distribution.SettransObject(SQLCA) 			
		Else // no connection try reconnecting 
			li_dbret =  gnv_appman.uf_dbconnect( SQLCA, false) // 0 //
			if li_dbret < 0 then 
				goto RET
			Else
				ib_connected = true 
				dw_schedule.SettransObject(SQLCA) 
				dw_distribution.SettransObject(SQLCA) 								
			END IF 
		END IF 
	End If 

	// Save and refresh queue
	this.EVENT menu_save()	
	If ii_savestatus <> 1 then 
		this.backcolor = RGB ( 160, 194, 143) 
		goto RET
	End IF
	this.event ue_refresh()
	
	ll_maxrow = dw_schedule.RowCount()
	dw_schedule.Selectrow(0, false)
	
	// Process all completed jobs - currently email to distribution
	this.event ue_finishedjobs()

	if IsNUll( ii_concurrent ) then ii_concurrent = 10
	dw_schedule.SetFilter( "status = 'STARTED' ")
	dw_schedule.Filter()
	li_started = dw_schedule.RowCOunt()

	dw_schedule.SetFilter( "1=1")
	dw_schedule.Filter()
	ll_maxrow = dw_schedule.RowCount()  
	dw_schedule.SetRedraw( true)

	// If max allowed concurrent jobs are running - then wait again...
	If  li_started >= ii_concurrent then 
		goto RET
	END IF
	
	For ll_row =1 to ll_maxrow 
	 	ls_id					= dw_schedule.object.id [ll_row] 	 
		ls_recurring 		= UPPER(trim( dw_schedule.object.recurring [ll_row] ))
		ldt_submitted 		= dw_schedule.object.submitteddate [ll_row]	 
		ll_daystokeep 		= dw_schedule.object.daystokeep [ll_row] 	 
 		ls_status 			= UPPER(TRIM(dw_schedule.object.status [ll_row]))

		//------------------------------------------------------------------------------------	 
		// Delete old reports and failed ONLINE reports 
		//------------------------------------------------------------------------------------
		If ls_recurring  = 'ONETIME' then // do not delete recuring reports 
		 	If (daysAfter( date(ldt_submitted ), date(ldt_sysdate) ) > ll_daystokeep AND ls_status <> 'OFFLINE') OR  &
				(ls_status = 'ONLINE' AND daysAfter( date(ldt_submitted ), date(ldt_sysdate) ) >= 1) then 
				ll_rc = 1 
				DELETE FROM vzt_batchschedule WHERE id = :ls_id;
				If SQLCA.SQLcode <> 0 then ll_rc = -10
				IF ll_rc > 0 then ll_rc = this.event ue_delete_children (dw_schedule, ll_row) 
				f_end_tran (SQLCA, ll_rc, '', '','' )
			END IF 		
		END IF 			
		//------------------------------------------------------------------------------------	 
		// Delete output that has no schedule items 
		//------------------------------------------------------------------------------------
		DELETE FROM vzt_reportoutput WHERE NOT EXISTS ( SELECT * FROM vzt_batchschedule  WHERE vzt_batchschedule.id = vzt_reportoutput.scheduleid );
		If SQLCA.SQLcode <> 0 then ll_rc = -20
		f_end_tran (SQLCA, ll_rc, '', '','' )

		//------------------------------------------------------------------------------------	 
		// Check if any jobs to schedule 
		//------------------------------------------------------------------------------------
		If ls_status = 'SUBMITTED' 	or ls_recurring  = 'QUARTERLY' or &
			ls_recurring  = 'MONTHLY' 	or ls_recurring  = 'DAILY' or & 
			ls_recurring  = 'WEEKLY'	or ls_recurring  = 'HOURLY'  then // not started yet
		
			ls_daystorun[1]	= dw_schedule.object.daytorunsun [ll_row] 	 
			ls_daystorun[2]	= dw_schedule.object.daytorunmon [ll_row] 	 
			ls_daystorun[3]	= dw_schedule.object.daytoruntue [ll_row] 	 
			ls_daystorun[4]	= dw_schedule.object.daytorunwed [ll_row] 	 
			ls_daystorun[5]	= dw_schedule.object.daytorunthu [ll_row] 	 
			ls_daystorun[6]	= dw_schedule.object.daytorunfri [ll_row] 	 
			ls_daystorun[7]	= dw_schedule.object.daytorunsat [ll_row] 	 
			li_daynum			= DayNumber ( date(ldt_sysdate) ) 
			ldt_started			= dw_schedule.object.starteddate [ll_row]	 
		
			lb_run 				= true // think positive 
			ldt_timetorun		= dw_schedule.object.timetorun [ll_row]
			ldt_timetorun_end	= dw_schedule.object.timetorunend [ll_row]
			
			If time( ldt_sysdate	) < time( ldt_timetorun	) then lb_run = false // too early in the day...
			// check if end of window is specified and if beyond the allowed window 00:00 = unspecified.
			If Not IsNull(ldt_timetorun_end ) and time(ldt_timetorun_end ) <> time('00:00') AND time( ldt_sysdate	) > time( ldt_timetorun_end )   then lb_run = false // too late ...
			
			If ls_daystorun[li_daynum] <> 'Y' then lb_run = false // bad day... 
			
			CHOOSE CASE ls_recurring
				CASE 'ONETIME'

				CASE 'QUARTERLY'
					// check when last ran, whether it's time to run it again.
					If date( ldt_started) = date (ldt_sysdate) then lb_run = false // must be later date 
					If month(date( ldt_started)) = month(date (ldt_sysdate)) then lb_run = false // must be diffrent month
					If f_vzt_quarter(month(date( ldt_started))) = f_vzt_quarter(month(date (ldt_sysdate))) then lb_run = false // must be diffrent quarter

				CASE 'MONTHLY'
					// check when last ran, whether it's time to run it again.
					If date( ldt_started) = date (ldt_sysdate) then lb_run = false // must be later date 
					If month(date( ldt_started)) = month(date (ldt_sysdate)) then lb_run = false // must be diffrent month
				CASE 'DAILY' , 'WEEKLY' 
					// check when last ran, whether it's time to run it again.
					If date( ldt_started) >= date (ldt_sysdate) then lb_run = false // must be later date 

				CASE 'HOURLY'  
					integer li_start_hour , li_now_hour 
					// check when last ran, whether it's time to run it again.
					If date( ldt_started) = date (ldt_sysdate) then 
						IF hour ( time ( ldt_started)) >= hour ( time ( ldt_sysdate)) then 
							lb_run = false // must be later hour
						END IF
					END IF
			CASE ELSE
			END CHOOSE // recurring
		
			If lb_run then this.event ue_startjob (ll_row) // Passed all tests, run the job
		End If // not started
	Next // main loop

	this.EVENT menu_save()	
	If ii_savestatus <> 1 then 
		this.backcolor = RGB ( 179, 200, 138) 
		goto RET
	End IF
	this.EVENT ue_refresh()	

END IF
this.event ue_refresh_options()
sle_interval.backcolor = RGB ( 192, 192, 192)

RET:
dw_schedule.SetRedraw( true)		
if upper(cb_timer.text) <> 'START TIMER' then timer (integer (ls_old_interval ))
return

end event

event ue_delete_children;call super::ue_delete_children;string ls_outputid 
long ll_row
ll_row = al_row
if al_row = 0 then ll_row = adw_target.GetRow()
If ll_row > 0 then 
	ls_outputid = adw_target.object.outputid [ll_row] 	 
	DELETE FROM vzt_reportoutput WHERE id = :ls_outputid ;
	If SQLCA.SQLcode <> 0 then return -1
	return 1 	
End If
return 1


end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_timer.y 		= newheight - ii_resizeband_y - cb_timer.height 
		cb_delete1.y 	= newheight - ii_resizeband_y - cb_delete1.height 
		cb_close.y 		= newheight - ii_resizeband_y - cb_close.height 
		sle_interval.y	= newheight - ii_resizeband_y - sle_interval.height 
		cb_refresh.y	= newheight - ii_resizeband_y - cb_refresh.height 
		cb_display.y	= newheight - ii_resizeband_y - cb_display.height 
		cb_options.y	= newheight - ii_resizeband_y - cb_options.height 
		cb_mail.y		= newheight - ii_resizeband_y - cb_mail.height 
		cbx_debug.y		= newheight - ii_resizeband_y - cbx_debug.height 
		cbx_live.y		= newheight - ii_resizeband_y - cbx_live.height 
		cb_mail_logon.y= newheight - ii_resizeband_y - cb_mail_logon.height 
		cb_sql.y			= newheight - ii_resizeband_y - cb_sql.height  
	End IF 
End IF 	



end event

event close;if IsValid(inv_output) 	then DESTROY inv_output


end event

event ue_mail_report_to_dist;call super::ue_mail_report_to_dist;string 	ls_now, ls_mailmsg 	
long		ll_maxrows, ll_row, ll_ret, ll_rc, ll_trigrow, ll_trigger
datetime	ldt_now
string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
string ls_fname, ls_lname,ls_filename   

if is_dist_list_id = '' then return 

ll_maxrows = dw_distribution.Retrieve( is_dist_list_id )
If ll_maxrows <= 0 then 
	return 
END IF 

// Conditional Distribution 
// check for trigger value in the report - "-" = do trigger, "+" = skip
ll_trigrow = f_isvalidcolumn (dw_rpt, 'vzt_trigger')
If ll_trigrow >  0 then // email if negative only 
	ll_trigger	= dw_rpt.GetItemNumber( ll_trigrow , 'vzt_trigger')
	If ll_trigger >= 0 then return // skip if positive 
END IF 

//IF istr_parms.mode <> 'BATCH' then 
//	MessageBox('VZT Reporter Email', 'Would you like to email the report to the following receipients?', Question!) 
//END IF	

If IsNull(is_rpt_format) or is_rpt_format ='' then is_rpt_format = 'VZR'
If is_rpt_format ='PDF' then
	if IsNull(is_rpt_pdf_style ) then is_rpt_pdf_style = 'XSLFOP' 
ELSE
	is_rpt_pdf_style = ''
END IF

// Mail to list 
if Not IsValid(gnv_appman.inv_mail) then gnv_appman.inv_mail = CREATE uo_vzt_mail 

choose case is_rpt_format 
	case 'VZR' 
		ls_attachfile[1]	= is_vzrfile 
	case 'PDF' 
		ls_attachfile[1]	= is_pdffile 
	case 'BOTH' 
		ls_attachfile[1]	= is_vzrfile 
		ls_attachfile[2]	= is_pdffile 
end choose

is_mail_subject	= trim(f_nvl(dw_schedule.object.title [ dw_schedule.GetRow() ] , ''))
//If ll_trigger < 0 then ls_subject += '

FOR ll_row = 1 to ll_maxrows 
	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
NEXT

this.event ue_mail_options() // allow ancestors to modify stuff

ll_ret = gnv_appman.inv_mail.uf_mail_send_no_logon( is_mail_subject,'Report is attached',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
//ll_ret = this.inv_mail.uf_mail_send( ls_subject,'Report is attached',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 	

// Update message to reflect report was emailed or failed
ldt_now = f_sysdate()  
ls_now = string ( ldt_now , 'mm-dd-yyyy hh:mm:ss')
IF ll_ret >= 0 then 
	ll_rc 		= 1
	ls_mailmsg 	= is_status_distributed
ELSE 
	ll_rc 		= -15
	ls_mailmsg 	= 'EMAIL FAILED.'
END IF 

if is_bsched_id <> '' then 
	UPDATE vzt_batchschedule SET message1=RTRIM(message1)+', '+ :ls_mailmsg +' '+:ls_now 
	WHERE id = :is_bsched_id;
	If SQLCA.SQLcode <> 0 then ll_rc = -10
	f_end_tran (SQLCA, ll_rc, '', '','' )
END IF


end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_batch_schedule
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_batch_schedule
boolean visible = true
integer x = 3557
integer y = 1560
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_batch_schedule
boolean visible = false
integer x = 9
integer taborder = 140
boolean enabled = false
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_batch_schedule
integer x = 987
integer y = 1036
end type

type cb_close from w_vzt_base`cb_close within w_vzt_batch_schedule
integer x = 2048
integer y = 1564
integer width = 178
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
string text = "Close"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_batch_schedule
boolean visible = true
integer x = 498
integer y = 1564
integer width = 192
integer taborder = 150
integer textsize = -8
boolean enabled = false
end type

type cb_save from w_vzt_base`cb_save within w_vzt_batch_schedule
integer x = 699
integer y = 1564
integer width = 192
integer taborder = 200
integer textsize = -8
end type

type cb_select from w_vzt_base`cb_select within w_vzt_batch_schedule
boolean visible = false
integer x = 1723
integer y = 1036
integer taborder = 190
end type

type cb_new from w_vzt_base`cb_new within w_vzt_batch_schedule
boolean visible = false
integer x = 1147
integer y = 1564
integer width = 238
integer taborder = 210
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_batch_schedule
boolean visible = false
integer x = 1339
integer y = 1036
integer width = 379
integer taborder = 180
end type

event cb_newsearch::clicked;call super::clicked;cb_new.visible = true 
cb_search.EVENT clicked()
end event

type cb_search from w_vzt_base`cb_search within w_vzt_batch_schedule
boolean visible = false
integer x = 759
integer y = 1036
integer taborder = 170
end type

event cb_search::clicked;call super::clicked;dw_data.search('')
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_batch_schedule
boolean visible = false
integer x = 3022
integer y = 1036
integer width = 347
end type

type st_stop from w_vzt_base`st_stop within w_vzt_batch_schedule
integer x = 2807
integer y = 1564
end type

type dw_data from w_vzt_base`dw_data within w_vzt_batch_schedule
boolean visible = false
integer x = 128
integer y = 1468
integer height = 36
integer taborder = 90
boolean hscrollbar = true
end type

event dw_data::constructor;call super::constructor;_SetNullonNewSearch = true
_ResetMaskOnSearch = true
_ResetDataObjectOnSelect = true
_dragable = true
end event

event dw_data::clicked;call super::clicked;If row > 0 and row <= this.rowcount() then //and cb_select.Visible = true  
	this.SelectRow( 0, false)
	this.SelectRow( row, true)	
	this.SetRow( row)
	this.ScrollToRow( row)
End IF

end event

type dw_print from w_vzt_base`dw_print within w_vzt_batch_schedule
integer x = 3328
integer y = 816
integer taborder = 160
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_batch_schedule
end type

type sle_interval from singlelineedit within w_vzt_batch_schedule
integer x = 306
integer y = 1564
integer width = 178
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 12632256
string text = "10"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_schedule from uo_vzt_dwbase within w_vzt_batch_schedule
event type string ue_get_row_access ( long ll_row )
integer x = 9
integer y = 4
integer width = 3314
integer height = 1540
integer taborder = 20
string dataobject = "d_schedule"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event ue_get_row_access;string ls_row_user , ls_access 

ls_row_user = trim( dw_schedule.object.userid [ ll_row ]) 
ls_access = f_get_batch_rowaccess( ls_row_user )

return ls_access 


end event

event constructor;call super::constructor;ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = this 
end event

event doubleclicked;call super::doubleclicked;If row > 0 and row <= this.RowCount() then
	If is_mode = 'SERVER' then 	// we are on the batch server 
		iw_mywindow.event dynamic ue_startjob (row) 
	Else							// we are on the client machine
		MessageBox('Information', 'Double Click on the Client does not RUN report.~r~nIt displays finished report.')  
		iw_mywindow.event dynamic ue_display_report (row) 				
	End If		
End If
end event

event clicked;call super::clicked;dw_schedule.Selectrow(0, false)
if row <= 0 then return
If UPPER(TRIM(cb_timer.text)) ="START TIMER" then 
	dw_schedule.Selectrow(row, true)
	dw_schedule.SetRow(row) 
	dw_schedule.ScrollToRow(row) 
	this.event rowfocuschanged ( row ) 
ELSE
	If is_mode <> 'SERVER'	then 	cb_delete1.enabled = false	
End If

If is_mode = 'SERVER' then cb_delete1.enabled = true
end event

event retrieveend;call super::retrieveend;// display only what the user is allowed to see
If rowcount <= 0 then return
long ll_row
string ls_row_user, ls_row_group
boolean lb_doit

If is_mode = 'CLIENT' then 
 For ll_row = rowcount to 1 step -1 
	if trim( this.event ue_get_row_access( ll_row)) = '' then this.DeleteRow( ll_row) 
 Next 
 this.ResetUpdate() 
End IF
this.SetRedraw( true)
end event

event retrievestart;this.SetRedraw( false)
end event

event rowfocuschanged;call super::rowfocuschanged;If is_mode = 'CLIENT' then 
	if currentrow <= 0 then return 
	If UPPER(TRIM(cb_timer.text)) ="STOP TIMER" then return 
	string ls_access
	ls_access =  trim( this.event ue_get_row_access( currentrow)) 
	If POS( ls_access, "W") > 0 then 	
		If UPPER(TRIM(cb_timer.text)) ="START TIMER" then 
			cb_delete1.enabled = true
		End If
	ELSE
		cb_delete1.enabled = false
	END IF
ELSE
	cb_delete1.enabled = true
END IF
end event

event dberror;ib_dberror = true 
return 1
end event

event ue_setmasks;call super::ue_setmasks;if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 

string ls_mask, ls_format

if upper(left(gnv_appman.is_datemask, 1)) = 'M' then
//	ls_format 	= "m/d hh:mm:ss a/p"
	ls_mask 	 	= "mm/dd/yy hh:mm:ss"
ELSE
	ls_mask 		= "dd/mm/yy hh:mm:ss"
END IF

this.Object.submitteddate.EditMask.Mask	= ls_mask 
this.Object.starteddate.EditMask.Mask		= ls_mask 
this.Object.finisheddate.EditMask.Mask		= ls_mask 
this.Object.submitteddate.format				= ls_mask 
this.Object.starteddate.format				= ls_mask 
this.Object.finisheddate.format				= ls_mask 

end event

event itemchanged;call super::itemchanged;If row > 0 and row <= this.RowCount() then
	If is_mode = 'SERVER' then 	// we are on the batch server 
	Else							// we are on the client machine
		if dwo.name = 'status' then
			if upper(data) = 'STARTED' then
				MessageBox('Information', 'Changing status to "STARTED" does not start report.')  
			end if	
		end if	
	End If		
End If
end event

type cb_refresh from commandbutton within w_vzt_batch_schedule
integer x = 901
integer y = 1564
integer width = 338
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Refresh Queue "
end type

event clicked;parent.EVENT ue_refresh()
end event

type cb_timer from commandbutton within w_vzt_batch_schedule
integer x = 9
integer y = 1564
integer width = 288
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Start Timer"
end type

event clicked;// Flip timer on and off

If UPPER(TRIM(this.text)) ="START TIMER" then 
	If IsNumber( sle_interval.text) then 
		timer( integer(sle_interval.text) )
	Else
		timer( 15 )	
	End If
	this.text ="Stop Timer"
	dw_schedule.Selectrow(0, false)
	cb_delete1.enabled = false 
Else
	this.text ="Start Timer"
	timer( 0)		
End If
end event

type cb_display from commandbutton within w_vzt_batch_schedule
integer x = 1239
integer y = 1564
integer width = 347
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Display Report"
end type

event clicked;iw_mywindow.event dynamic ue_display_report ( dw_schedule.GetRow() ) 	
end event

type cb_options from commandbutton within w_vzt_batch_schedule
integer x = 1595
integer y = 1564
integer width = 448
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Refresh Sysoptions"
end type

event clicked;parent.event ue_refresh_options()
end event

type cb_mail from commandbutton within w_vzt_batch_schedule
integer x = 2354
integer y = 1564
integer width = 151
integer height = 76
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mail "
end type

event clicked;//parent.event ue_sendmail()
parent.event ue_finishedjobs()
end event

type dw_distribution from uo_vzt_dwbase within w_vzt_batch_schedule
boolean visible = false
integer x = 3328
integer y = 664
integer width = 823
integer height = 164
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_contact_list_ids"
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type cbx_debug from checkbox within w_vzt_batch_schedule
integer x = 3099
integer y = 1580
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "trace"
end type

type cb_mail_logon from commandbutton within w_vzt_batch_schedule
integer x = 2514
integer y = 1564
integer width = 283
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mail Logon"
end type

event clicked;parent.event ue_mail_connect()

end event

type dw_distlist from uo_vzt_dwbase within w_vzt_batch_schedule
boolean visible = false
integer x = 3392
integer y = 1052
integer width = 608
integer height = 300
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_vzt_dddw_distribution"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type dw_parms from uo_vzt_dwbase within w_vzt_batch_schedule
boolean visible = false
integer x = 3675
integer y = 1156
integer width = 283
integer height = 60
integer taborder = 220
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

type dw_rpt from uo_vzt_dwbase within w_vzt_batch_schedule
boolean visible = false
integer x = 3977
integer y = 1156
integer width = 137
integer height = 56
integer taborder = 60
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

type cbx_live from checkbox within w_vzt_batch_schedule
integer x = 3310
integer y = 1580
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "live"
end type

event clicked;if cbx_live.checked then
	istr_parms.live_trace = 'Y'
else
	istr_parms.live_trace = 'N'
end if
end event

type cb_sql from commandbutton within w_vzt_batch_schedule
integer x = 4480
integer y = 1572
integer width = 283
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SQL Trace"
end type

event clicked;open(w_vzt_sqltrace)
end event

