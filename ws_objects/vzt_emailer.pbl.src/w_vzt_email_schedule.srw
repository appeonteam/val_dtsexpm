$PBExportHeader$w_vzt_email_schedule.srw
forward
global type w_vzt_email_schedule from w_vzt_base
end type
type sle_interval from singlelineedit within w_vzt_email_schedule
end type
type cb_timer from commandbutton within w_vzt_email_schedule
end type
type cb_display from commandbutton within w_vzt_email_schedule
end type
type dw_distribution from uo_vzt_dwbase within w_vzt_email_schedule
end type
type cbx_debug from checkbox within w_vzt_email_schedule
end type
type dw_rpt from uo_vzt_dwbase within w_vzt_email_schedule
end type
type dw_parms from uo_vzt_dwbase within w_vzt_email_schedule
end type
type dw_distlist from uo_vzt_dwbase within w_vzt_email_schedule
end type
type dw_schedule from uo_vzt_dwbase within w_vzt_email_schedule
end type
type uo_trace from nvo_trace within w_vzt_email_schedule
end type
type uo_rr from uo_room_registry within w_vzt_email_schedule
end type
type lb_files from listbox within w_vzt_email_schedule
end type
type sle_subj from singlelineedit within w_vzt_email_schedule
end type
type st_subj from statictext within w_vzt_email_schedule
end type
end forward

global type w_vzt_email_schedule from w_vzt_base
integer x = 183
integer y = 72
integer width = 3520
integer height = 1520
string title = "HotelEXPERT Email Scheduler "
string menuname = "m_emailer_main"
long backcolor = 80269524
event ue_refresh ( )
event type integer ue_startjob ( long al_row )
event type integer ue_display_report ( long al_row )
event ue_refresh_options ( )
event ue_finishedjobs ( )
event ue_mail_connect ( )
event ue_mail_send ( )
event ue_mail_options ( )
event ue_init_vars ( )
event ue_get_filenames ( )
event ue_mail_all ( )
event ue_mail_file ( string as_email,  ref string as_text )
sle_interval sle_interval
cb_timer cb_timer
cb_display cb_display
dw_distribution dw_distribution
cbx_debug cbx_debug
dw_rpt dw_rpt
dw_parms dw_parms
dw_distlist dw_distlist
dw_schedule dw_schedule
uo_trace uo_trace
uo_rr uo_rr
lb_files lb_files
sle_subj sle_subj
st_subj st_subj
end type
global w_vzt_email_schedule w_vzt_email_schedule

type variables
string 	is_error , is_code, is_file, is_dir
long 	il_row
// table vars 
//string	room_code,   guest_lname,   guest_fname
//string	addr1, addr2, city, state,  zip,  country, company_name
//string	email, freq_guest_num,  phone
//string 	aduts_num
//string  arr_date  , dep_date
//string	reg_code,  share1_lname,   share1_fname
//string	share2_lname, share2_fname
//string	share3_lname, share3_fname  
// 
int	ii_table
string  is_userid,  is_batch_inipath, is_mode
str_reporter_reportparms  istr_parms
int ii_concurrent 
datetime idt_app_start, idt_norun_start, idt_norun_end
boolean            	 ib_dberror, ib_connected, ib_outage
uo_vzt_mail	inv_mail
string 		is_status_distributed = 'EMAILED'

transaction	i_tran
datawindowchild 	idwc_distlist
string 		is_timer_autostart
string		is_mail_subject=''


string	sEmpId, sPagerId
//call record variables
string      sCallNumber
datetime dtCallIndate
string      sStatCode
string      sRoom
string      sZone
string      sGuest
string      sCaller
string      sProblem
string      sSubproblem
string      sProblemDefinition
string      sComplaint
string      sReceiver
string      sShift
string      sResolution
string      sRepairman
datetime dtCallOutdate
string      sClosedBy
string      sClosedBydept
string      sTimerNumber
datetime dtTimerStart
string      sCallerCategory
string      sProblemNumber
string      sSubproblemNumber
double    dTimer1StartMin
double    dTimer2StartMin
double    dTimer1Reps
double    dTimer2Reps
string       sAuthTakeOffTimer
string       sDefaultStatus   
string       sPreOpenable
string       sPreOpened
int            iTimerLevel
string       sRoomDsc
string       sOpenedStatus
string       spaging
double    d_paging_min

end variables

event ue_refresh();this.event ue_get_filenames()
end event

event ue_startjob;// Passed all tests, run the job
string 	ls_run 
long		ll_run
SetPointer(HourGlass!) 
dw_schedule.object.starteddate [ al_row] = datetime( today(), now() )
dw_schedule.object.status [ al_row] = 'STARTED' 

If not cbx_debug.checked then // run as exe 
	ls_run = 'vztbserv.exe BATCH`'+ dw_schedule.object.id [ al_row] +"`"+ dw_schedule.object.userid [ al_row] +"`"+is_batch_inipath +"`"
	ll_run = RUN ( ls_run , Normal!) 

	if ll_run <> 1 then 
		dw_schedule.object.status [ al_row] = 'ERROR' 
		dw_schedule.object.message[ al_row] = 'VZT: Run command failed' 
	END IF 
Else // run as a window 
	str_reporter_reportparms  lstr_parms
	window  lw_report
	string  ls_reportwin, ls_reportid
	lstr_parms.mode = 'BATCH'
	lstr_parms.report_id 	= dw_schedule.object.id [ al_row] 
	lstr_parms.schedule_id 	= dw_schedule.object.id [ al_row] 
	lstr_parms.userid = 'SYS'
	ls_reportid					= dw_schedule.object.reportid [ al_row] 
	
	SELECT windowname INTO :ls_reportwin FROM vzt_reportdef WHERE reportid = :ls_reportid;
	
	ls_reportwin = f_nvl( ls_reportwin ,'w_vzt_rpt_processor')
	OpenWithPArm( lw_report, lstr_parms, ls_reportwin) 
	this.POST EVENT ue_refresh()				
END IF

this.EVENT menu_save()				
If ii_savestatus <> 1 then this.backcolor = RGB ( 179, 200, 138) 
return 1

end event

event ue_refresh_options;//
SELECT batchconcurrency, batch_norun_start_time, batch_norun_end_time , option08, option05
into 	:ii_concurrent, :idt_norun_start, :idt_norun_end , :is_batch_inipath, :is_timer_autostart
FROM 	vzt_sysoptions where id = 1;

If SQLCA.SQLCODE <> 0 then 
	uo_trace.event ue_trace("HE Database Error", "Could not retrieve system options from database.")
End IF	

dw_distlist.Retrieve()

end event

event ue_mail_connect;int li_ret
li_ret = 1
if this.inv_mail.ib_logged_on then 
	li_ret = MessageBox('Batch Schedule Mail Logon', 'You seem to be already logged on. Do you want to logon again?', question!, yesno!) 
end if
If li_ret = 1 then 
	li_ret = inv_mail.uf_mail_logon() 
	If li_ret = 1 then 
		uo_trace.event ue_trace('Batch Schedule Mail Logon', 'Logon Successful' ) 
	ELSE
		uo_trace.event ue_trace('Batch Schedule Mail Logon', 'Logon Failed' ) 
	END IF
END IF
end event

event ue_mail_options;//is_mail_subject = is_mail_subject + 'sssss'
end event

event ue_init_vars();uo_rr.room_code 		= dw_schedule.GetItemString( il_row, "room_code") 
uo_rr.guest_lname		= dw_schedule.GetItemString( il_row, "guest_lname")
uo_rr.guest_fname		= dw_schedule.GetItemString( il_row, "guest_fname")
uo_rr.addr1				= dw_schedule.GetItemString( il_row, "addr1")
uo_rr.addr2				= dw_schedule.GetItemString( il_row, "addr2")
uo_rr.city				= dw_schedule.GetItemString( il_row, "city")
uo_rr.state				= dw_schedule.GetItemString( il_row, "state")
uo_rr.zip				= dw_schedule.GetItemString( il_row, "zip")
uo_rr.country			= dw_schedule.GetItemString( il_row, "country")
uo_rr.company_name	= dw_schedule.GetItemString( il_row, "company_name")
uo_rr.email				= dw_schedule.GetItemString( il_row, "email")
uo_rr.freq_guest_num	= dw_schedule.GetItemString( il_row, "freq_guest_num")

uo_rr.adults_num		= dw_schedule.GetItemString( il_row, "aduts_num")
uo_rr.adults_num		=  MID(uo_rr.adults_num, 1,1)
	
uo_rr.phone				= dw_schedule.GetItemString( il_row, "phone")
uo_rr.arr_date  		= dw_schedule.GetItemString( il_row, "date_from")
uo_rr.dep_date  		= dw_schedule.GetItemString( il_row, "date_to")
uo_rr.reg_code			= dw_schedule.GetItemString( il_row, "reg_code")
uo_rr.share1_lname	= dw_schedule.GetItemString( il_row, "share1_lname")
uo_rr.share1_fname	= dw_schedule.GetItemString( il_row, "share1_fname")
uo_rr.share2_lname	= dw_schedule.GetItemString( il_row, "share2_lname")
uo_rr.share2_fname 	= dw_schedule.GetItemString( il_row, "share2_fname")
uo_rr.share3_lname	= dw_schedule.GetItemString( il_row, "share3_lname")
uo_rr.share3_fname  	= dw_schedule.GetItemString( il_row, "share3_fname")

end event

event ue_get_filenames();//ue_get_filenames
long 		ll_max_items, ll_item, ll_row, ll_pos1
string	ls_filename, ls_dir, ls_email


dw_schedule.Reset() // clear 

ls_dir = is_dir

lb_files.DirList(is_dir+'*.email*', 0 )

ll_max_items = lb_files.TotalItems ()

FOR ll_item = 1 to ll_max_items 
	lb_files.SelectItem (ll_item)
	ls_filename = lb_files.SelectedItem ( )
	If POS(ls_filename ,'@') <= 0 then CONTINUE 
	ll_pos1 = POS(ls_filename ,'.email') 
	ls_email = MID( ls_filename, 1, ll_pos1 - 1 )
	
	ll_row = dw_schedule.InsertRow(0) 
	If ll_row > 0 then
		dw_schedule.SetItem( ll_row, 'filename', 	ls_filename )
		dw_schedule.SetItem( ll_row, 'email', 		ls_email)
	END IF
NEXT
end event

event ue_mail_all();// ue_mail_all
long 		ll_row, ll_max_row
string 	ls_filename, ls_email

integer 	li_FileNum
string 	ls_input 
long 		ll_FLength

is_mail_subject	= sle_subj.text //'HE PAGE' 

//ls_input = f_replace(ls_input, '~r',' ')
//ls_input = f_replace(ls_input, '~n',' ')
//ls_input = f_replace(ls_input, '~t',' ')

ll_max_row = dw_schedule.RowCount()

FOR ll_row = 1 to ll_max_row

	ls_filename = dw_schedule.GetItemString(ll_row, 'filename' )
	ls_email		= dw_schedule.GetItemString(ll_row, 'email' )

	li_FileNum = FileOpen(ls_filename, StreamMode!)
	FileRead(li_FileNum, ls_input )
	FileClose(li_FileNum)
//
	this.event ue_mail_file(ls_email, ls_input )
	dw_schedule.SetItem(ll_row, 'emailed' ,'Y')
	filedelete(is_dir + ls_filename )
NEXT

dw_schedule.Reset()

end event

event ue_mail_file(string as_email, ref string as_text);// mail report to dist

string 	ls_dist_list_id, ls_id, ls_now, ls_output_id
long		ll_maxrows, ll_row, ll_ret, ll_rc, ll_trigrow, ll_trigger
datetime	ldt_now
blob 		lblob 
string	ls_mailmsg , ls_msg 

ls_msg = 'email =	'+ as_email + "~r~n"
uo_trace01.event ue_trace('Schedule Mail Send', ls_msg )

If as_email = '' or IsNull(as_email) then return 

if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 

string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
string ls_fname, ls_lname, ls_filename, ls_pdffile, ls_vzrfile

//ls_filename =  dw_schedule.object.id[1] 
//f_replace(ls_filename, ',','')
//f_replace(ls_filename, ':','')
//f_replace(ls_filename, ';','')
//f_replace(ls_filename, ':','')
//f_replace(ls_filename, '/','')
//f_replace(ls_filename, '\','')
//f_replace(ls_filename, '|','')
//f_replace(ls_filename, '-','_')


ls_fname 			= ''
ls_lname 			= ''
ls_mailtoname[1]	= as_email
ls_mailtoid[1]		= as_email

this.event ue_mail_options() // allow ancestors to modify stuff

ll_ret = this.inv_mail.uf_mail_send_no_logon( is_mail_subject, as_text ,ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 


end event

event open;call super::open;setpointer( Hourglass!)
ib_resizeenabled = true 
//if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail

is_userid = f_nvl(upper( trim(message.stringparm)), '')
idt_app_start = f_sysdate() // window open time = app start time for server 

is_userid = 'sys'
If lower(is_userid) = 'sys'  then 
	 is_userid = '' // allow to view all users 
   // we are on the server 
	is_mode = 'SERVER'
	this.event ue_refresh_options() 
	if is_timer_autostart = 'Y' then cb_timer.post event clicked() 
//	this.backcolor = RGB( 128,128,128)

	inv_mail 	= CREATE uo_vzt_mail 
	this.post event ue_mail_connect() 
	If gnv_appman.is_debugmode = 'Y' then 
		dw_rpt.visible = true 
		dw_parms.visible = true 
	END IF
	
ELSE 
	// the window opened from the client workstation
	is_mode 						= 'CLIENT'	
	im_menu.m_file.visible 	= false		// hide menu
 
END IF

SELECT option21 INTO :is_dir from vzt_sysoptions where id = 1;

dw_primary = dw_schedule
this.EVENT ue_refresh()
//If	is_mode <> 'SERVER' then cb_timer.event clicked() //don't start timer on the server automatically 
//this.title = this.title + " " + is_mode 
cb_delete1.enabled = false


end event

on w_vzt_email_schedule.create
int iCurrent
call super::create
if this.MenuName = "m_emailer_main" then this.MenuID = create m_emailer_main
this.sle_interval=create sle_interval
this.cb_timer=create cb_timer
this.cb_display=create cb_display
this.dw_distribution=create dw_distribution
this.cbx_debug=create cbx_debug
this.dw_rpt=create dw_rpt
this.dw_parms=create dw_parms
this.dw_distlist=create dw_distlist
this.dw_schedule=create dw_schedule
this.uo_trace=create uo_trace
this.uo_rr=create uo_rr
this.lb_files=create lb_files
this.sle_subj=create sle_subj
this.st_subj=create st_subj
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_interval
this.Control[iCurrent+2]=this.cb_timer
this.Control[iCurrent+3]=this.cb_display
this.Control[iCurrent+4]=this.dw_distribution
this.Control[iCurrent+5]=this.cbx_debug
this.Control[iCurrent+6]=this.dw_rpt
this.Control[iCurrent+7]=this.dw_parms
this.Control[iCurrent+8]=this.dw_distlist
this.Control[iCurrent+9]=this.dw_schedule
this.Control[iCurrent+10]=this.uo_trace
this.Control[iCurrent+11]=this.uo_rr
this.Control[iCurrent+12]=this.lb_files
this.Control[iCurrent+13]=this.sle_subj
this.Control[iCurrent+14]=this.st_subj
end on

on w_vzt_email_schedule.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_interval)
destroy(this.cb_timer)
destroy(this.cb_display)
destroy(this.dw_distribution)
destroy(this.cbx_debug)
destroy(this.dw_rpt)
destroy(this.dw_parms)
destroy(this.dw_distlist)
destroy(this.dw_schedule)
destroy(this.uo_trace)
destroy(this.uo_rr)
destroy(this.lb_files)
destroy(this.sle_subj)
destroy(this.st_subj)
end on

event timer;long 		ll_row, ll_maxrow, ll_rc
string 	ls_old_interval 
int 		li_dbret,li_temp 
datetime ldt_sysdate

// Go through all rows and see what needs to be done... 

sle_interval.backcolor = RGB ( 225, 132, 183)
ldt_sysdate			= f_sysdate()
ls_old_interval 	= sle_interval.text
timer ( 0 )			//stop timer while running 


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
			END IF 
		END IF 
	End If 
this.event ue_refresh()
//--------------------------------------
this.event DYNAMIC ue_mail_all()
//--------------------------------------
this.EVENT ue_refresh()	
this.event ue_refresh_options()
sle_interval.backcolor = RGB ( 192, 192, 192)

RET:
dw_schedule.Selectrow(0, false) 
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
		cb_display.y	= newheight - ii_resizeband_y - cb_display.height 
		//cb_mail.y		= newheight - ii_resizeband_y - cb_mail.height 
		cbx_debug.y		= newheight - ii_resizeband_y - cbx_debug.height 
		uo_trace.y		= newheight - ii_resizeband_y - uo_trace.height + 20
		//cb_mail_logon.y= newheight - ii_resizeband_y - cb_mail_logon.height 
		//cb_import.y		= newheight - ii_resizeband_y - cb_import.height 
		//cb_dir.y			= newheight - ii_resizeband_y - cb_dir.height
		st_subj.y			= newheight - ii_resizeband_y - st_subj.height
		sle_subj.y			= newheight - ii_resizeband_y - sle_subj.height

		dw_schedule.width 	= newwidth - 2 * dw_schedule.x 
		 
	End IF 
End IF 	



end event

event close;if IsValid(inv_mail) 	then DESTROY inv_mail


end event

event ue_assign_menu;//overr
this.ChangeMenu(m_EMAILER_main) 
im_menu = this.menuid 

end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_email_schedule
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_email_schedule
integer x = 3319
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_email_schedule
boolean visible = false
integer x = 9
integer taborder = 130
boolean enabled = false
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_email_schedule
integer x = 987
integer y = 1036
end type

type cb_close from w_vzt_base`cb_close within w_vzt_email_schedule
integer x = 2734
integer y = 904
integer width = 169
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
string text = "Close"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_email_schedule
integer x = 498
integer y = 904
integer width = 192
integer taborder = 140
integer textsize = -8
boolean enabled = false
end type

type cb_save from w_vzt_base`cb_save within w_vzt_email_schedule
integer x = 471
integer y = 904
integer width = 151
integer taborder = 190
integer textsize = -8
end type

event cb_save::clicked;call super::clicked;parent.event post ue_refresh()
end event

type cb_select from w_vzt_base`cb_select within w_vzt_email_schedule
boolean visible = false
integer x = 1723
integer y = 1036
integer taborder = 180
end type

type cb_new from w_vzt_base`cb_new within w_vzt_email_schedule
boolean visible = false
integer x = 1147
integer y = 904
integer width = 238
integer taborder = 200
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_email_schedule
boolean visible = false
integer x = 1339
integer y = 1036
integer width = 379
integer taborder = 170
end type

event cb_newsearch::clicked;call super::clicked;cb_new.visible = true 
cb_search.EVENT clicked()
end event

type cb_search from w_vzt_base`cb_search within w_vzt_email_schedule
boolean visible = false
integer x = 759
integer y = 1036
integer taborder = 160
end type

event cb_search::clicked;call super::clicked;dw_data.search('')
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_email_schedule
boolean visible = false
integer x = 3557
integer y = 1036
integer width = 347
end type

type st_stop from w_vzt_base`st_stop within w_vzt_email_schedule
integer x = 3205
integer y = 904
end type

type dw_data from w_vzt_base`dw_data within w_vzt_email_schedule
boolean visible = false
integer x = 27
integer y = 1000
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

type dw_print from w_vzt_base`dw_print within w_vzt_email_schedule
integer taborder = 150
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_email_schedule
end type

type sle_interval from singlelineedit within w_vzt_email_schedule
integer x = 297
integer y = 904
integer width = 160
integer height = 76
integer taborder = 110
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

type cb_timer from commandbutton within w_vzt_email_schedule
integer x = 9
integer y = 904
integer width = 274
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

type cb_display from commandbutton within w_vzt_email_schedule
boolean visible = false
integer x = 2002
integer y = 1044
integer width = 347
integer height = 76
integer taborder = 120
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

type dw_distribution from uo_vzt_dwbase within w_vzt_email_schedule
boolean visible = false
integer x = 3291
integer y = 712
integer width = 823
integer height = 108
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_contact_list_ids"
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type cbx_debug from checkbox within w_vzt_email_schedule
boolean visible = false
integer x = 3406
integer y = 912
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

type dw_rpt from uo_vzt_dwbase within w_vzt_email_schedule
boolean visible = false
integer x = 3493
integer y = 916
integer width = 137
integer height = 92
integer taborder = 60
boolean bringtotop = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type dw_parms from uo_vzt_dwbase within w_vzt_email_schedule
boolean visible = false
integer x = 3575
integer y = 908
integer width = 137
integer height = 92
integer taborder = 210
boolean bringtotop = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type dw_distlist from uo_vzt_dwbase within w_vzt_email_schedule
boolean visible = false
integer x = 3401
integer y = 1344
integer width = 608
integer height = 300
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_vzt_dddw_distribution"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type dw_schedule from uo_vzt_dwbase within w_vzt_email_schedule
event type string ue_get_row_access ( long ll_row )
integer x = 9
integer y = 4
integer width = 3314
integer height = 676
integer taborder = 20
string dataobject = "d_directory"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event ue_get_row_access;string ls_row_user , ls_access 
//
//ls_row_user = trim( dw_schedule.object.userid [ ll_row ]) 
//ls_access = f_get_batch_rowaccess( ls_row_user )
//
return 'RWA' // ls_access 
//
//
end event

event clicked;call super::clicked;//this.Selectrow(0, false)
//if row <= 0 then return
//If UPPER(TRIM(cb_timer.text)) ="START TIMER" then 
//	this.Selectrow(row, true)
//	this.SetRow(row) 
//	this.ScrollToRow(row) 
//	this.event rowfocuschanged ( row ) 
//ELSE
//	If is_mode <> 'SERVER'	then 	cb_delete1.enabled = false	
//End If
//
//If is_mode = 'SERVER' then cb_delete1.enabled = true
end event

event constructor;call super::constructor;ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = this 
end event

event dberror;ib_dberror = true 
return 1
end event

event doubleclicked;call super::doubleclicked;//If row > 0 and row <= this.RowCount() then
//	If is_mode = 'SERVER' then 	// we are on the batch server 
//		iw_mywindow.event dynamic ue_startjob (row) 
//	Else							// we are on the client machine
//		iw_mywindow.event dynamic ue_display_report (row) 				
//	End If		
//End If
end event

event rowfocuschanged;call super::rowfocuschanged;//If is_mode = 'CLIENT' then 
//	if currentrow <= 0 then return 
//	If UPPER(TRIM(cb_timer.text)) ="STOP TIMER" then return 
//	string ls_access
//	ls_access =  trim( this.event ue_get_row_access( currentrow)) 
//	If POS( ls_access, "W") > 0 then 	
//		If UPPER(TRIM(cb_timer.text)) ="START TIMER" then 
//			cb_delete1.enabled = true
//		End If
//	ELSE
//		cb_delete1.enabled = false
//	END IF
//ELSE
//	cb_delete1.enabled = true
//END IF
end event

event ue_setmasks;call super::ue_setmasks;if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 

string ls_mask, ls_format

if upper(left(gnv_appman.is_datemask, 1)) = 'M' then
//	ls_format 	= "m/d hh:mm:ss a/p"
	ls_mask 	 	= "mm/dd/yy hh:mm:ss"
ELSE
	ls_mask 		= "dd/mm/yy hh:mm:ss"
END IF
//
//this.Object.submitteddate.EditMask.Mask	= ls_mask 
//this.Object.starteddate.EditMask.Mask		= ls_mask 
//this.Object.finisheddate.EditMask.Mask		= ls_mask 
//this.Object.submitteddate.format				= ls_mask 
//this.Object.starteddate.format				= ls_mask 
//this.Object.finisheddate.format				= ls_mask 
//
end event

type uo_trace from nvo_trace within w_vzt_email_schedule
integer x = 626
integer y = 904
integer width = 869
integer taborder = 70
boolean bringtotop = true
boolean border = false
long backcolor = 80269524
end type

on uo_trace.destroy
call nvo_trace::destroy
end on

type uo_rr from uo_room_registry within w_vzt_email_schedule
boolean visible = false
integer x = 2327
integer y = 764
integer width = 183
integer height = 112
integer taborder = 220
boolean bringtotop = true
end type

on uo_rr.destroy
call uo_room_registry::destroy
end on

type lb_files from listbox within w_vzt_email_schedule
boolean visible = false
integer x = 2601
integer y = 1008
integer width = 882
integer height = 308
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_subj from singlelineedit within w_vzt_email_schedule
integer x = 1691
integer y = 912
integer width = 704
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "HotelEXPERT Message"
borderstyle borderstyle = stylelowered!
end type

type st_subj from statictext within w_vzt_email_schedule
integer x = 1499
integer y = 916
integer width = 197
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subject:"
boolean focusrectangle = false
end type

