$PBExportHeader$w_gcc_feedback.srw
forward
global type w_gcc_feedback from w_vzt_base
end type
type dw_survey from datawindow within w_gcc_feedback
end type
type gb_web1 from groupbox within w_gcc_feedback
end type
type gb_web from groupbox within w_gcc_feedback
end type
type gb_6 from groupbox within w_gcc_feedback
end type
type gb_5 from groupbox within w_gcc_feedback
end type
type gb_1 from groupbox within w_gcc_feedback
end type
type gb_2 from groupbox within w_gcc_feedback
end type
type gb_3 from groupbox within w_gcc_feedback
end type
type gb_4 from groupbox within w_gcc_feedback
end type
type pb_task from picturebutton within w_gcc_feedback
end type
type pb_thankyou from picturebutton within w_gcc_feedback
end type
type pb_apology from picturebutton within w_gcc_feedback
end type
type pb_call from picturebutton within w_gcc_feedback
end type
type dw_gcc_history from uo_vzt_dwbase within w_gcc_feedback
end type
type dw_dupcheck from uo_vzt_dwbase within w_gcc_feedback
end type
type r_1 from rectangle within w_gcc_feedback
end type
type pb_rebates from picturebutton within w_gcc_feedback
end type
type pb_amends from picturebutton within w_gcc_feedback
end type
type st_1 from statictext within w_gcc_feedback
end type
type st_2 from statictext within w_gcc_feedback
end type
type st_3 from statictext within w_gcc_feedback
end type
type st_4 from statictext within w_gcc_feedback
end type
type st_5 from statictext within w_gcc_feedback
end type
type st_6 from statictext within w_gcc_feedback
end type
type dw_name_search from uo_vzt_dwbase within w_gcc_feedback
end type
type pb_web from picturebutton within w_gcc_feedback
end type
type st_web from statictext within w_gcc_feedback
end type
type uo_comp from uo_vzt_company within w_gcc_feedback
end type
type gb_00 from groupbox within w_gcc_feedback
end type
type cb_websearch from commandbutton within w_gcc_feedback
end type
type uo_room from uo_vzt_room within w_gcc_feedback
end type
type uo_prefix from uo_vzt_prefix within w_gcc_feedback
end type
type uo_state from uo_vzt_state within w_gcc_feedback
end type
type pb_web_all from picturebutton within w_gcc_feedback
end type
type st_web_all from statictext within w_gcc_feedback
end type
type cbx_filled from checkbox within w_gcc_feedback
end type
type st_7 from statictext within w_gcc_feedback
end type
type cb_reset from commandbutton within w_gcc_feedback
end type
type dw_hourglass from datawindow within w_gcc_feedback
end type
end forward

global type w_gcc_feedback from w_vzt_base
integer width = 3625
integer height = 2244
string title = "GCC Entry Screen"
event ue_used_existing ( )
event type integer ue_check_trial ( )
event type integer ue_web_check ( boolean ab_message )
event ue_web_letter ( boolean ab_get_survey )
event type integer ue_save_survey ( boolean ab_readonly )
event type integer ue_web_copy ( )
event ue_web_post ( )
event ue_web_letter_all ( )
event type integer ue_web_letter_prepare ( boolean ab_get_survey )
event type integer ue_web_letter_all_next ( ref str_dts_call a_parms )
event ue_web_letter_all_canceled ( )
event ue_web_open ( )
event ue_web_gcc_from_guest ( double adconfid )
event ue_guest_web_filter ( )
dw_survey dw_survey
gb_web1 gb_web1
gb_web gb_web
gb_6 gb_6
gb_5 gb_5
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
pb_task pb_task
pb_thankyou pb_thankyou
pb_apology pb_apology
pb_call pb_call
dw_gcc_history dw_gcc_history
dw_dupcheck dw_dupcheck
r_1 r_1
pb_rebates pb_rebates
pb_amends pb_amends
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
dw_name_search dw_name_search
pb_web pb_web
st_web st_web
uo_comp uo_comp
gb_00 gb_00
cb_websearch cb_websearch
uo_room uo_room
uo_prefix uo_prefix
uo_state uo_state
pb_web_all pb_web_all
st_web_all st_web_all
cbx_filled cbx_filled
st_7 st_7
cb_reset cb_reset
dw_hourglass dw_hourglass
end type
global w_gcc_feedback w_gcc_feedback

type variables
nvo_qgen    	inv_qgen
str_dts_call	istr_parms

string 		is_guestfilter
double 		id_surveyid, id_gcc, id_account
datetime    idt_ansdate
boolean		ib_used_existing, ib_used_lookup
string		is_editcol
boolean		ib_readonly, ib_history_visible
string		is_webfilled, is_webkey
boolean		ib_comp_update=false
// web options
string 		is_propid, is_dparm, is_web_default
boolean		ib_web_request, ib_webdb
n_cst_vzt_tran	i_web_tran
n_cst_dbcopy 	inv_dbcopy 
string		is_country
long 		il_web_batch_row, il_hglass_row
w_gcc_letter_thanks_websurvey_batch iw_letter


end variables

forward prototypes
public function integer wf_gcc_selected ()
end prototypes

event ue_used_existing();	long ll_row
	// use selected guest - new survey
	ib_used_existing = true
	datetime ldt_null
	ll_row = dw_primary.GetRow()
	if ll_row <= 0 then return
	setNull(ldt_null)
//	dw_primary.SetItem( ll_row, 'guest_last_checkin_dt', ldt_null )
//	dw_primary.SetItem( ll_row, 'guest_last_depart_dt', ldt_null )
//	dw_primary.SetItem( ll_row, 'gcc_checkin_dt', ldt_null )
//	dw_primary.SetItem( ll_row, 'gcc_depart_dt', ldt_null )
	
	dw_primary.SetItem( ll_row, 'gcc_checkin_dt', 	dw_primary.GetItemDateTime( ll_row, 'guest_last_checkin_dt') )
	dw_primary.SetItem( ll_row, 'gcc_depart_dt', 	dw_primary.GetItemDateTime( ll_row, 'guest_last_depart_dt') )
		
	//dw_primary.SetItem( ll_row, 'guest_room_last_checkin', '' )
	inv_qgen.in_responderid	= dw_primary.GetItemNumber( ll_row, 'guest_account')
	dw_primary.SetColumn( 'guest_room_last_checkin')

	dw_primary.ResetUpdate() 
	
	cb_select.event Clicked()
	dw_primary.POST setfocus()

end event

event ue_check_trial;string ls_1, ls_2, ls_num=''
int  li_len, li_char, li_num , li_gcc

SELECT option00, option01 , option10 , option11, option12, option14 , option17
INTO :ls_1, :ls_2 , :is_url, :is_propid, :is_dparm, :is_web_default , :is_country
from vzt_sysoptions where id = 1;

If IsNull( is_country ) or trim( is_country ) = '' then is_country = 'USA'

If ls_1 = 'N' then 
	li_len = len ( ls_2 ) 
	IF li_len > 0 then 
		FOR li_char = 1 to li_len 
			li_num = li_num + integer( MID (ls_2, li_char , 1))
		NEXT 
	END IF 
	li_num = 100 * (li_num / 2) 
	select count(*) INTO :li_gcc from gcc ;
	If li_gcc > li_num then  
		MessageBox('Trial version','Your GCC count ('+string(li_gcc )+' is above the allowed trial limit of '+string(li_num )+'.~r~nYou need to obtain a full version to continue entering comment cards.', Stopsign!)
		return -100
	END IF 
	return li_num
END IF 

return 999999
end event

event ue_web_check;		
		If trim(is_dparm ) ='' or IsNULL(is_dparm ) then 
			If ab_message then MessageBox('Option Not Available', 'You must subscribe separately for this service')
			Return -1
		END IF
		If trim(is_url) ='' or IsNULL(is_url) then 
			If ab_message then MessageBox('Configuration Error', 'Survey response URL is missing from System Options')
			Return -4
		END IF
		//check expiration
		integer li_expired
		select vzt_web_expired() into :li_expired from dummy;
		If li_expired = 1 then
			If ab_message then MessageBox('Software Expired', 'Your internet survey entry subscription is expired. Please contact Metromedia Software Support', Exclamation!)
			Return -8
		END IF

return 1

end event

event ue_web_letter;
if this.event ue_web_letter_prepare (ab_get_survey) > 0 then
	OpenSheetWithParm( w_gcc_letter_thanks_websurvey, istr_parms, gnv_appman.iw_frame, 0, Layered!)
end if

end event

event ue_save_survey;if dw_survey.rowcount() > 0 and not ab_readonly then 
	long ll_rc, ll_cnt
	string ls_sql
	// check if existing survey 
	SELECT count(*) INTO :ll_cnt FROM qgen_qset_answers WHERE headerid = :id_gcc ;
	ll_cnt = f_nvl( ll_cnt, 0)
	If gnv_appman.is_debugmode = 'Y' then
		ls_sql = "SELECT count(*) FROM qgen_qset_answers WHERE headerid = "+ string(id_gcc) 
		clipboard( ls_sql)
		MessageBox( 'DEBUG w_gcc_feedback.ue_save_survey()', ls_sql + '~r~n~r~n' & 
				+ '~r~nCount='+ string( ll_cnt) +'~r~nCopied to clipboard.')
	END IF		
	
	ll_rc = inv_qgen.event ue_save_qset()
	if ll_rc > 0 and ll_cnt > 0 then 
		blob l_blob
		string	ls_openedby
		ls_openedby = gnv_appman.is_userid 
		l_blob = blob('')
		f_write_gcc_history( id_gcc, 'MOD', l_blob, 'Survey Modified' , ls_openedby, '')
	end if
end if
return ll_rc

end event

event type integer ue_web_copy();int 			li_ret 
datetime		ldt_ansdate
string 		ls_args

	IF ib_webdb then // use web db if necessary 
		setpointer(hourglass!)
		IF len(is_webkey) > 0 and is_webfilled <> 'Y' then 
			If not IsValid( inv_dbcopy ) then inv_dbcopy = CREATE n_cst_dbcopy 
			if ib_HTTP then // use HTTP to get data 
			// ======================================================================================
			//  HTTP
			// ======================================================================================
//				string ls_http_webfilled
//				ls_http_webfilled = f_vzt_html_get_data( is_url+"qgen_getwebanswers.asp?d="+is_dparm)  )
				DELETE FROM qgen_qset_answers WHERE headerid = :id_gcc USING SQLCA;
				if gnv_appman.is_debugmode = 'Y' then 
					MessageBox('deleted local answers', 'code='+ string(SQLCA.sqlcode) + ', err='+string(f_nvl(SQLCA.sqlerrtext,'')) )
				end if

				inv_dbcopy.of_init_http( 'd_answers_list_web_import', SQLCA, is_url+"qgen_getwebanswers.asp") //,is_dparm, is_webkey, do, tran_from, tran_to
				ls_args = "d="+is_dparm +"&w=" + is_webkey
				li_ret = inv_dbcopy.of_copy_http (ls_args, false) // copy but no commit 
				// dont forget ansdate - its a part of key !!
				SELECT MAX(ansdate) INTO :ldt_ansdate FROM qgen_qset_answers WHERE headerid = :id_gcc USING SQLCA;
				If li_ret >=0 then 
					is_webfilled = 'Y' 
					idt_ansdate = ldt_ansdate
					inv_qgen.idt_ans_date	= idt_ansdate 
					long ll_row 
					ll_row = dw_data.GetRow() 
					dw_data.SetItem( ll_row, 'gcc_webfilled', 'Y' ) // update retrieved value as well 
					dw_data.SetItem( ll_row, 'gcc_ansdate', idt_ansdate ) // update retrieved value as well 
					dw_mainlist.SetItem( dw_mainlist.Getrow(), 'gcc_webfilled', 'Y' ) // update retrieved value as well 
					//dw_mainlist.SetItem( dw_mainlist.Getrow(), "ansdate", idt_ansdate) // update retrieved value as well 
					UPDATE gcc SET webfilled = 'Y', ansdate = :ldt_ansdate WHERE gccid = :id_gcc USING SQLCA;
					li_ret = f_end_tran0( SQLCA, 'Final Web survey HTTP copy' , '', 'Flag update failed')
				END IF
				If li_ret < 0 then return -10
				COMMIT USING SQLCA;
			// ======================================================================================
			// End of HTTP
			// ======================================================================================
			ELSE // use db conn 
				// First check other db if webfilled 
				SELECT webfilled, ansdate INTO :is_webfilled, :ldt_ansdate FROM gcc WHERE gccid = :id_gcc USING i_web_tran;
				IF is_webfilled = 'Y' then // need to copy to main db 
					// ------------------------------------------------------------------------
					inv_dbcopy.of_init( 'd_answers_list', i_web_tran, SQLCA) // do, tran_from, tran_to
					inv_dbcopy.ids_data.Retrieve (id_gcc)
					li_ret = inv_dbcopy.of_copy(true) // copy + commit
					If li_ret >=0 then 
						is_webfilled = 'Y'
						idt_ansdate = ldt_ansdate
						inv_qgen.idt_ans_date	= idt_ansdate 
						dw_data.SetItem( dw_data.GetRow() , 'webfilled', 'Y' ) // update retrieved value as well 
						dw_data.SetItem( dw_data.GetRow() , 'gcc_ansdate', idt_ansdate ) // update retrieved value as well 
						UPDATE gcc SET webfilled = 'Y', ansdate = :ldt_ansdate WHERE gccid = :id_gcc USING SQLCA;
						li_ret = f_end_tran0( SQLCA, 'Final Web survey copy' , '', 'Flag update failed')
					END IF
					If li_ret < 0 then return -10
					// ------------------------------------------------------------------------
				ELSE
				END IF 
			END IF // HTTP check
		END IF 
	ELSE // not web db
	END IF
	IF len(is_webkey) > 0 and is_webfilled <> 'Y' then
		li_ret = MessageBox('WEB Survey', "Internet survey request has been sent, but is not filled out. ~r~n" &
				+"Would you like to edit it anyway?", Question!, YesNo!, 2)
		If li_ret = 2 then return -20
	END IF

return 1 // either no webdb or copied web answers successfully
end event

event ue_web_post();string		ls_data, ls_url, ls_tab

long ll_tab
ls_tab = '~t'
ls_url 		= 	"http://localhost//qgen_answers.asp"
ls_data		= 	string( f_vzt_html_get_result( ls_url, 'args' ))
ls_data		=	f_replace( ls_data, '``' ,'~r~n')
ls_data		=	f_replace( ls_data, '~~' , ls_tab )
ls_data		=	ls_data	


end event

event ue_web_letter_all();long 		ll_maxrows
boolean 	lb_switch
dwobject		ldwo

ll_maxrows 	= dw_data.RowCount() 
If ll_maxrows 	<= 0 then return 

setNull(ldwo)

il_web_batch_row = 0 // 1 ... so the next will ++ and start with 1
dw_mainlist.Event clicked( 10, 10, il_web_batch_row, ldwo) 

double ldConfID
gnv_appman.istr_response.num1 = 0 //confid

id_surveyid	= ABS( f_qgen_get_survey(2)) 

//if conf was selected or added save it in gcc 
ldConfID  = gnv_appman.istr_response.num1 

istr_parms.batch 	= 'Y'
istr_parms.id		= id_surveyid	
this.event ue_web_gcc_from_guest( ldConfID )
istr_parms.dw_distribution = dw_mainlist 

OpenSheetWithParm( iw_letter, istr_parms, 'w_gcc_letter_thanks_websurvey_batch', gnv_appman.iw_frame, 0, Layered!)


// the rest is called back from the window
end event

event type integer ue_web_letter_prepare(boolean ab_get_survey);if dw_data.RowCount() <= 0 or dw_data.Getrow() <= 0 then return -1

	dw_hourglass.reset()
	il_hglass_row = dw_hourglass.InsertRow(0)
	dw_hourglass.SetItem( il_hglass_row, 'x', 'Preparing web survey ...')
	dw_hourglass.visible = true 

		string 	ls_url, ls_rand, ls_code, ls_message, ls_success
		double	ld_qsetid, ld_guest_account, ld_idgcc_neg
		long 		li_rc, ll_ret, ll_row
		
		ll_row	= dw_data.Getrow() 
		
		If ab_get_survey then 
			ld_qsetid = ABS( f_qgen_get_survey(1))
		ELSE
		 	if id_surveyid <= 0 then
				ld_qsetid = ABS(  f_qgen_get_survey(1))
			ELSE
				ld_qsetid = id_surveyid 
			END IF 
		END IF
		
		if ld_qsetid <= 0 then 
			dw_hourglass.visible = false
			MessageBox('Web Commentator error', 'Survey Id missing.', StopSign! )
			return -1
		end if
		
		istr_parms.id = ld_qsetid

		ll_ret = this.event ue_web_check(true) //check with messages
		if ll_ret < 0 then 
				dw_hourglass.visible = false
				MessageBox('Web Commentator error', 'Web Functinality is not enabled.', StopSign! )
				return -1
		end if
				
		ls_rand = f_random_string(10) 
		If POS( is_url, '160.79.255.6' ) <=0 and POS( is_url, 'localhost' ) <=0 and POS( is_url, 'vzpoll') <= 0 then
			MessageBox('Web Commentator error', 'Invalid URL Specified. Please call Support.', StopSign! )
		END IF
		ls_url = is_url + "qgen1.asp?k=" +ls_rand+"&p="+is_propid+"&q="+ string (ld_qsetid) +"&d=" + is_dparm
		istr_parms.gcc_url = ls_url 
		if gnv_appman.is_debugmode = 'Y' then 
			Clipboard( ls_url ) 
			MessageBox('GCC URL (copied to clipboard)', ls_url )
		end if
		li_rc = 1
		
		if gnv_appman.is_debugmode = 'Y' then 
			ls_success = 'GCC Updated Successfully'
		ELSE
			ls_success = ''
		end if

		// ------------------------------------------------------------------------------
		// Prepare and clean up for web data ntry 
		// ------------------------------------------------------------------------------

		// ------------------------------------------------------------------------------
		// Create GCC record if not there e.g. guests loaded in ISQL
		// ------------------------------------------------------------------------------
		If id_gcc <= 0 then  
			
		END IF	
			
		UPDATE gcc SET webkey = :ls_rand , webfilled = 'N', surveyid = :ld_qsetid WHERE gccid = :id_gcc USING SQLCA;
		// ------------------------------------------------------------------------------
		if gnv_appman.is_debugmode = 'Y' then 
			MessageBox('updated local gcc', 'code='+ string(SQLCA.sqlcode) + ', err='+ string(f_nvl(SQLCA.sqlerrtext,'')) )
		end if
		
		If f_check_tran( SQLCA, li_rc, ls_code, ls_message, -10) > 0 then	
			DELETE FROM qgen_qset_answers WHERE headerid = :id_gcc USING SQLCA;
			dw_hourglass.SetItem( il_hglass_row, 'x', 'Cleaning local answers (if any) ...')
			if gnv_appman.is_debugmode = 'Y' then 
				MessageBox('deleted local answers', 'code='+ string(SQLCA.sqlcode) + ', err='+string(f_nvl(SQLCA.sqlerrtext,'')) )
			end if
		END IF;
		
		ld_idgcc_neg = (-1) * id_gcc
		
		If f_check_tran( SQLCA, li_rc, ls_code, ls_message, -15) > 0 then	
			// ======================================================================================
			//  REMOTE DB SYNC 
			// ======================================================================================
			IF ib_webdb then // use web db if necessary 
				dw_hourglass.SetItem( il_hglass_row, 'x', 'Preparing remote db ...')

				ld_guest_account = dw_data.GetItemNumber( dw_data.Getrow(), 'guest_account')
				If IsNUll( ld_guest_account) or ld_guest_account = 0 then
					MessageBox("GCC Web Sync Error", "Guest account must be filled!", stopsign!)
				END IF
				// ======================================================================================
				//  Get guest info for webdb and HTTP updates 
				// ======================================================================================
				string	ls_fname, ls_lname, ls_mi, ls_prefix, ls_comp_name

				ls_fname 		= dw_data.GetItemString( ll_row, 'guest_first_name')
				ls_lname 		= dw_data.GetItemString( ll_row, 'guest_last_name')
				ls_mi				= dw_data.GetItemString( ll_row, 'guest_middle_init')
				ls_prefix 		= dw_data.GetItemString( ll_row, 'guest_prefix')
				ls_comp_name	= dw_data.GetItemString( ll_row, 'guest_comp_name')

			  If ib_HTTP then // update webdb via HTTP
				// ======================================================================================
				//  HTTP
				// ======================================================================================
				dw_hourglass.SetItem( il_hglass_row, 'x', 'Starting HTTP remote db link ...')

				string 	ls_http_return, ls_http_url, ls_http_args
				integer 	li_ret 
				
				ls_http_url 	= is_url + "qgen_prepweb.asp"

				ls_http_args  += "d=" 		+ f_nvl(is_dparm,'')
				ls_http_args  += "&w=" 		+ f_nvl(ls_rand,'')
				ls_http_args  += "&gcc=" 	+ f_nvl(string(id_gcc),'0000')  
				ls_http_args  += "&qs=" 	+ f_nvl(string(ld_qsetid),'0000')
				ls_http_args  += "&ga=" 	+ f_nvl(string(ld_guest_account),'0000') 
				ls_http_args  += "&gf=" 	+ f_nvl(ls_fname,'')
				ls_http_args  += "&gl=" 	+ f_nvl(ls_lname,'') 		
				ls_http_args  += "&gm=" 	+ f_nvl(ls_mi,'') 	
				ls_http_args  += "&gp=" 	+ f_nvl(ls_prefix,'') 		
				ls_http_args  += "&gc=" 	+ f_nvl(ls_comp_name,'')	

				if gnv_appman.is_debugmode = 'Y' then 
					MessageBox('HTTP args', ls_http_args)
				end if
				// commit for now - while testing the same DB !!!!!!!
			//	COMMIT USING SQLCA; 
				ls_http_return = f_vzt_html_get_data( ls_http_url, ls_http_args )  

				If li_ret < 0 or ls_http_return <> "OK" then 
					MessageBox('Web Commentator error', 'HTML Sync failed, Msg:'+ls_http_return , StopSign! )
					dw_hourglass.visible = false
					ROLLBACK USING SQLCA;
					return -10
				END IF
				COMMIT USING SQLCA;
				// ======================================================================================
				// End of HTTP
				// ======================================================================================
		    ELSE // not HTTP use reg web db
			  //=== WEBDB  ============================================================
				COMMIT USING i_web_tran;
				dw_hourglass.SetItem( il_hglass_row, 'x', 'Starting direct remote db link ...')
				DELETE FROM gcc WHERE gccid IN ( :id_gcc, :ld_idgcc_neg) USING i_web_tran;
				
				if gnv_appman.is_debugmode = 'Y' then 
					MessageBox('deleted remote gcc', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) )
				end if

				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -100) > 0 then	
					INSERT INTO gcc ( gccid, guest_account, ansdate, webkey, webfilled, surveyid  ) 
					VALUES ( :id_gcc, :ld_guest_account, vzt_getdate(), :ls_rand, 'N', :ld_qsetid) USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('inserted remote gcc', 'code='+ string(i_web_tran.sqlcode) + 'err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						+'~r~n' + 'gcc='+ string(id_gcc)  & 
						+'~r~n' + 'guest='+ string(ld_guest_account)  & 
						+'~r~n' + 'qset='+ string(ld_qsetid)  & 
						)
					end if
				END IF

				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -105) > 0 then	
					DELETE FROM guest WHERE account = :ld_guest_account USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('deleted remote guest', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						+'~r~n' + 'guest='+ string(ld_guest_account)  & 
						)
					end if
				END IF
				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -110) > 0 then	
					// Refresh guest info in the webdb as well
				
					INSERT INTO guest ( account, first_name, last_name, middle_init, prefix, comp_name ) 
					VALUES ( :ld_guest_account , :ls_fname, :ls_lname, :ls_mi, :ls_prefix, :ls_comp_name) USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('inserted remote guest', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						+'~r~n' + 'guest='+ string(ld_guest_account)  & 
						+'~r~n' + 'fname='+ ls_fname  & 
						+'~r~n' + 'lname='+ ls_lname  & 
						)
					end if
				END IF

				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -115) > 0 then	
					DELETE FROM qgen_qset_answers WHERE headerid IN (:id_gcc, (-1) * :id_gcc) USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('deleted remote answers', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						)
					end if
				END IF
				f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -125) 
				f_end_tran (i_web_tran, li_rc , 'GCC Web Survey Request (webdb)', ls_success,'Failed to update GCC entry with web key data.'+'~r~n~r~n WEB Tran Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )
			  	//=== WEBDB  END ============================================================
			  END IF // HTTP
			END IF // webdb
		END IF // ok tran
		dw_hourglass.SetItem( il_hglass_row, 'x', 'Finished remote db link ...')
		
		f_end_tran (SQLCA, li_rc , 'GCC Web Survey Request', ls_success,'Failed to update local GCC entry with web key data.'+'~r~n~r~nSQLCA Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )

		dw_hourglass.visible = false
		dw_hourglass.reset()
		return 1
	

end event

event type integer ue_web_letter_all_next(ref str_dts_call a_parms);// process rows 2 and up for the web survey
// called from the letter window !!!!!!!!!!!!!!!!!!!!!
long 			ll_maxrows
dwobject		ldwo
int			li_ret

ll_maxrows 	= dw_data.RowCount() 
If ll_maxrows 	<= 0 then return -1

setNull(ldwo)

if istr_parms.batch_do_one > 0 then
	il_web_batch_row = istr_parms.batch_do_one 
 ELSE
	il_web_batch_row ++ 
END IF

If il_web_batch_row > ll_maxrows then return -1// no more guests
dw_mainlist.Event clicked( 10, 10, il_web_batch_row, ldwo) 
id_surveyid	= istr_parms.id  
li_ret = this.event ue_web_letter_prepare (false) 
a_parms = istr_parms

return li_ret

end event

event ue_web_letter_all_canceled;// called back from the window
il_web_batch_row = 1

end event

event ue_web_open();long ll_web, ll_tranx
string  ls_ret

ib_http = false 

ll_web = this.event ue_web_check(false)
If ll_web <= 0 then 
//	gb_web.visible 		= false
//	st_web.visible 		= false
	pb_web.enabled 		= false
	pb_web_all.enabled 	= false
ELSE 
	ll_tranx = UpperBound( gnv_appman.i_tran[]) + 1 
	gnv_appman.i_tran[ll_tranx ] = CREATE n_cst_vzt_tran //TRANSACTION
	i_web_tran = gnv_appman.i_tran[ll_tranx ] 
	ls_ret = inv_qgen.event ue_web_tran( ib_webdb, is_dparm, i_web_tran)
	if ls_ret = 'HTTP' then ib_http = true // is_dparm has the remote asp dparm
END IF
end event

event ue_web_gcc_from_guest(double adconfid);double ld_gccid, ld_guestid 

long ll_row, ll_maxrows, ll_start

if istr_parms.batch_do_one > 0 then 
	ll_start 	= istr_parms.batch_do_one 
	ll_maxrows 	= ll_start 
else	
	ll_maxrows 	= dw_mainlist.RowCOunt() 
	ll_start 	= 1
end if
//========================================================
//Create new gcc records for all rows in the current list  
//========================================================
FOR ll_row = ll_start to ll_maxrows
	ld_gccid = f_nvl(dw_mainlist.GetItemNUmber(ll_row , 'gcc_gccid'),0)
	if ld_gccid = 0 or istr_parms.batch_new_gcc 	= 1 then 
		ld_guestid = f_nvl(dw_mainlist.GetItemNUmber(ll_row , 'guest_account'),0)
		
		SELECT vzt_hew_gcc_from_guest(0, :ld_guestid, :id_surveyid, :adConfID) into :ld_gccid from dummy USING SQLCA ; 
		
		f_end_tran0( SQLCA, 'Auto Comment Card Save' , '', 'Save failed')
		dw_mainlist.SetItem(ll_row , 'gcc_gccid', ld_gccid )	
		dw_mainlist.ResetUpdate()
	end if	
NEXT	
end event

event ue_guest_web_filter();//Filter unique guests in the current list, so only one survey is
//created and emailed for each
string 	ls_filter , ls_or=''
is_guestfilter = ''
long ll_row , ll_maxrow , ll_duprow 

ll_row = 1 
ll_maxrow = dw_mainlist.RowCount()

do while ll_row <= ll_maxrow 
	ls_filter = '( guest_account = '+string(dw_mainlist.getItemNUmber(ll_row , 'guest_account')) + ' AND getrow() <> ' +  string (ll_row ) +')'
	ll_duprow = dw_mainlist.Find (ls_filter, ll_row, ll_maxrow )
	do while ll_duprow > 0  
		dw_mainlist.RowsDiscard( ll_duprow, ll_duprow, Primary! ) 
		ll_maxrow = dw_mainlist.RowCount()
		ll_duprow = dw_mainlist.Find (ls_filter, ll_row, ll_maxrow )
	loop
//	is_guestfilter = is_guestfilter + ls_or + ls_filter  
//	ls_or = ' or '
//	dw_mainlist.SetFilter (is_guestfilter )
//	dw_mainlist.Filter ()
	ll_row = ll_row + 1 
	ll_maxrow = dw_mainlist.RowCount()
loop
ll_maxrow = dw_mainlist.RowCount()
dw_mainlist.ResetUPdate()
end event

public function integer wf_gcc_selected ();if id_gcc <= 0 then 
	MessageBox("GCC Entry", "Must save new GCC or select an existing one~r~nbefore processing!", Exclamation!)
	Return -10
END IF 

return 1
end function

on w_gcc_feedback.create
int iCurrent
call super::create
this.dw_survey=create dw_survey
this.gb_web1=create gb_web1
this.gb_web=create gb_web
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.pb_task=create pb_task
this.pb_thankyou=create pb_thankyou
this.pb_apology=create pb_apology
this.pb_call=create pb_call
this.dw_gcc_history=create dw_gcc_history
this.dw_dupcheck=create dw_dupcheck
this.r_1=create r_1
this.pb_rebates=create pb_rebates
this.pb_amends=create pb_amends
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.dw_name_search=create dw_name_search
this.pb_web=create pb_web
this.st_web=create st_web
this.uo_comp=create uo_comp
this.gb_00=create gb_00
this.cb_websearch=create cb_websearch
this.uo_room=create uo_room
this.uo_prefix=create uo_prefix
this.uo_state=create uo_state
this.pb_web_all=create pb_web_all
this.st_web_all=create st_web_all
this.cbx_filled=create cbx_filled
this.st_7=create st_7
this.cb_reset=create cb_reset
this.dw_hourglass=create dw_hourglass
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_survey
this.Control[iCurrent+2]=this.gb_web1
this.Control[iCurrent+3]=this.gb_web
this.Control[iCurrent+4]=this.gb_6
this.Control[iCurrent+5]=this.gb_5
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
this.Control[iCurrent+8]=this.gb_3
this.Control[iCurrent+9]=this.gb_4
this.Control[iCurrent+10]=this.pb_task
this.Control[iCurrent+11]=this.pb_thankyou
this.Control[iCurrent+12]=this.pb_apology
this.Control[iCurrent+13]=this.pb_call
this.Control[iCurrent+14]=this.dw_gcc_history
this.Control[iCurrent+15]=this.dw_dupcheck
this.Control[iCurrent+16]=this.r_1
this.Control[iCurrent+17]=this.pb_rebates
this.Control[iCurrent+18]=this.pb_amends
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.st_3
this.Control[iCurrent+22]=this.st_4
this.Control[iCurrent+23]=this.st_5
this.Control[iCurrent+24]=this.st_6
this.Control[iCurrent+25]=this.dw_name_search
this.Control[iCurrent+26]=this.pb_web
this.Control[iCurrent+27]=this.st_web
this.Control[iCurrent+28]=this.uo_comp
this.Control[iCurrent+29]=this.gb_00
this.Control[iCurrent+30]=this.cb_websearch
this.Control[iCurrent+31]=this.uo_room
this.Control[iCurrent+32]=this.uo_prefix
this.Control[iCurrent+33]=this.uo_state
this.Control[iCurrent+34]=this.pb_web_all
this.Control[iCurrent+35]=this.st_web_all
this.Control[iCurrent+36]=this.cbx_filled
this.Control[iCurrent+37]=this.st_7
this.Control[iCurrent+38]=this.cb_reset
this.Control[iCurrent+39]=this.dw_hourglass
end on

on w_gcc_feedback.destroy
call super::destroy
destroy(this.dw_survey)
destroy(this.gb_web1)
destroy(this.gb_web)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.pb_task)
destroy(this.pb_thankyou)
destroy(this.pb_apology)
destroy(this.pb_call)
destroy(this.dw_gcc_history)
destroy(this.dw_dupcheck)
destroy(this.r_1)
destroy(this.pb_rebates)
destroy(this.pb_amends)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_name_search)
destroy(this.pb_web)
destroy(this.st_web)
destroy(this.uo_comp)
destroy(this.gb_00)
destroy(this.cb_websearch)
destroy(this.uo_room)
destroy(this.uo_prefix)
destroy(this.uo_state)
destroy(this.pb_web_all)
destroy(this.st_web_all)
destroy(this.cbx_filled)
destroy(this.st_7)
destroy(this.cb_reset)
destroy(this.dw_hourglass)
end on

event open;call super::open;if Not Isvalid( inv_qgen ) then inv_qgen = CREATE nvo_qgen
inv_qgen.idw_target = dw_survey
inv_qgen.ib_norefresh = true

is_accessflags = 'WR'
if npassuserrights >= 9 then is_accessflags = 'WRA'

if this.event ue_check_trial () < 0 then 
	close (this)
	return
END IF

gnv_appman.is_userid = cPassUserName

istr_parms.w_caller = this // set parent caller pointer for all calls

if f_nvl(gnv_appman.is_datemask ,'') <> ''  then 
	dw_gcc_history.Object.action_dt.EditMask.Mask = gnv_appman.is_datemask
end if

cb_newsearch.event clicked()
cb_new.visible = true 
dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()

dw_name_search.x 			= dw_mainlist.x
dw_name_search.y 			= dw_mainlist.y
dw_name_search.width 	= dw_mainlist.width
dw_name_search.height 	= dw_mainlist.height 
dw_name_search.visible	= false

this.event ue_web_open ()

dw_gcc_history.visible = false

end event

event ue_assign_menu;//override
end event

event ue_save_commit;//override
long			ll_row, ll_rc 	, ll_cnt

ll_rc = 1
// get last guest id before saving gcc
dwitemstatus ldstatus, gcc_room_status, gcc_arr_status, gcc_dep_status
dwitemstatus ls_uh_status, ls_ub_status, ls_ur_status, ls_us_status,ls_ug_status, ls_conf_id_status

ll_row	= dw_data.GetRow() 
If ll_row <= 0 then 
	MessageBox('Save Error','No guest data found on save.', Stopsign!)
	return 
END IF

// New web criteria
string 	ls_uh, ls_ub, ls_ur, ls_us , ls_ug
integer	li_conf 
li_conf 					= f_nvl(dw_data.GetItemNumber(ll_row,'conf_id') , 0)
ls_uh						= f_nvl(dw_data.GetItemString(ll_row,'usage_hotel') , 'N')
ls_ub						= f_nvl(dw_data.GetItemString(ll_row,'usage_bar') , 'N')
ls_ur 					= f_nvl(dw_data.GetItemString(ll_row,'usage_rest') , 'N')
ls_us						= f_nvl(dw_data.GetItemString(ll_row,'usage_spa') , 'N')
ls_ug						= f_nvl(dw_data.GetItemString(ll_row,'usage_hclub') , 'N')
	
ldstatus = dw_data.GetItemStatus( dw_data.GetRow(), 0, Primary!) 
If ldstatus = New! or ldstatus = NewModified! or ib_used_existing then 
	// new guest --------------------------------------------------------------------------------
	If not ib_used_existing then 
		SELECT max(account) into :id_account from guest ;
	END IF 
//	MessageBox('guest account',string(id_account))		
	string 		ls_room, ls_openedby
	datetime		ldt_in, ldt_out, ldt_ansdate, ldt_last_in, ldt_last_out
	
	//Now Save GCC and get the new gcc id -------
	ls_room	= dw_data.GetItemString( ll_row, 'guest_room_last_checkin')
	if ib_used_existing then 
		ls_room	= dw_data.GetItemString( ll_row, 'gcc_room')
		ldt_in	= dw_data.GetItemDatetime( ll_row, 'gcc_checkin_dt')
		ldt_out	= dw_data.GetItemDatetime( ll_row, 'gcc_depart_dt')
	ELSE
		ls_room	= dw_data.GetItemString( ll_row, 'guest_room_last_checkin')
		dw_data.SetItem( ll_row, 'gcc_room', ls_room)
		dw_data.SetItem( ll_row, 'guest_account', id_account)
	END IF	
	ldt_last_in	= dw_data.GetItemDatetime( ll_row, 'guest_last_checkin_dt')
	ldt_last_out= dw_data.GetItemDatetime( ll_row, 'guest_last_depart_dt')

	if IsNUll(ldt_last_in) OR (NOT IsNUll(ldt_in) AND ldt_in > ldt_last_in	) then 
		dw_data.SetItem( ll_row, 'guest_last_checkin_dt', ldt_in)
		dw_data.SetItem( ll_row, 'guest_last_depart_dt', ldt_out)
	END IF
	IF IsNUll(ldt_in) OR year(date(ldt_in)) < 1950 or IsNUll(ldt_out) OR year(date(ldt_out)) < 1950 then 
		ldt_in 	= ldt_last_in	
		ldt_out	= ldt_last_out
	END IF 
	ldt_ansdate = f_sysdate()
	ls_openedby = gnv_appman.is_userid 

	dw_data.SetItem( ll_row, 'gcc_checkin_dt'	, ldt_in)
	dw_data.SetItem( ll_row, 'gcc_depart_dt'	, ldt_out)

	INSERT INTO gcc 
         ( gccid,   
           guest_account,   
           room,   
           checkin_dt,   
           depart_dt,   
           surveyid,   
           ansdate,   
           openedby,   
           webkey,   
           webfilled ,
 				usage_hotel, usage_bar, usage_rest, usage_spa, usage_hclub, conf_id  
			  )  
	VALUES( 
			null, 	:id_account, 	:ls_room, 
			:ldt_in, :ldt_out, 		:id_surveyid, :ldt_ansdate, :ls_openedby, '','N'
			,:ls_uh, :ls_ub, :ls_ur, :ls_us, :ls_ug, :li_conf 
			) ;

	If SQLCA.SQLCODE <> 0 then ll_rc = -10 
	
	If ll_rc > 0 then
		SELECT max(gccid) into :id_gcc from gcc ;
		If SQLCA.SQLCODE <> 0 then ll_rc = -10 
		dw_data.SetItem( ll_row, 'gcc_gccid', id_gcc)
		
	END IF

//	MessageBox('gcc id',string(id_gcc))
	
	//update survey info so it can be saved 
	If ll_rc > 0 and not ib_readonly then
		istr_parms.gccid 			= id_gcc // set call parm here - common to all calls
		istr_parms.room  			= f_nvl(ls_room , '')
		istr_parms.guestemail  	= f_nvl(dw_data.GetItemString(ll_row,'guest_email') , '')
		istr_parms.guestname  	= trim(f_nvl(dw_data.GetItemString(ll_row,'guest_last_name') , '')) +', '+&
										trim(f_nvl(dw_data.GetItemString(ll_row,'guest_first_name') , ''))
		istr_parms.guest_phone 	= f_nvl(dw_data.GetItemString(ll_row,'guest_phone') , '')

		inv_qgen.in_headerid		= id_gcc
		inv_qgen.idt_ans_date	= ldt_ansdate
		inv_qgen.in_responderid	= id_account
		ll_rc = this.event ue_save_survey( ib_readonly) 
	END IF 
ELSE
	ll_row = dw_data.GetRow()
	If ll_rc > 0 and ll_row > 0 then 
		// save mods to gcc info on the main dw
		gcc_room_status	= dw_data.GetItemStatus( ll_row , 'gcc_room', Primary!) 	
		gcc_arr_status		= dw_data.GetItemStatus( ll_row , 'gcc_checkin_dt', Primary!) 	
		gcc_dep_status		= dw_data.GetItemStatus( ll_row , 'gcc_depart_dt', Primary!) 	
		ls_uh_status		= dw_data.GetItemStatus( ll_row , 'usage_hotel', Primary!) 	
		ls_ub_status		= dw_data.GetItemStatus( ll_row , 'usage_bar', Primary!) 	
		ls_ur_status		= dw_data.GetItemStatus( ll_row , 'usage_rest', Primary!) 	
		ls_us_status		= dw_data.GetItemStatus( ll_row , 'usage_spa', Primary!) 	
		ls_ug_status		= dw_data.GetItemStatus( ll_row , 'usage_hclub', Primary!) 	
		ls_conf_id_status	= dw_data.GetItemStatus( ll_row , 'conf_id', Primary!) 	

		if gcc_room_status = DataModified! or gcc_arr_status = DataModified! or gcc_dep_status	= DataModified! &
				or ls_uh_status = DataModified! or ls_ub_status = DataModified! & 
				or ls_ur_status = DataModified! or ls_us_status = DataModified! &
				or ls_ug_status = DataModified! or ls_conf_id_status = DataModified! & 
				then
			datetime ldt_gcc_checkin_dt, ldt_gcc_depart_dt

			ls_room					= f_nvl(dw_data.GetItemString(ll_row,'gcc_room') , '')
			ldt_gcc_checkin_dt	= dw_data.GetItemDateTime(ll_row,'gcc_checkin_dt') 
			ldt_gcc_depart_dt		= dw_data.GetItemDateTime(ll_row,'gcc_depart_dt') 
			
			UPDATE gcc SET room = :ls_room, checkin_dt = :ldt_gcc_checkin_dt, depart_dt = :ldt_gcc_depart_dt ,
				usage_hotel = :ls_uh, usage_bar = :ls_ub, usage_rest = :ls_ur, usage_spa = :ls_us, usage_hclub = :ls_ug,
				conf_id = :li_conf 
			WHERE  gccid = :id_gcc ;
			If SQLCA.SQLCODE <> 0 then ll_rc = -10 
		END IF
	END IF
	If ll_rc > 0 then ll_rc = this.event ue_save_survey( ib_readonly) 
END IF

if ll_rc > 0 then ib_used_existing = false // reset

dw_data.post SetFocus()
dw_data.post SetColumn('guest_last_checkin_dt')
dw_data.post SetColumn('guest_last_depart_dt')
dw_data.post SetColumn('gcc_checkin_dt')
dw_data.post SetColumn('gcc_depart_dt')
dw_data.post SetColumn('gcc_room')

f_end_tran( SQLCA, ll_rc, 'New Guest and/or Comment Card Save' , 'Save succeeded', 'Save failed')
if ll_rc > 0 then 
	dw_primary.ResetUpdate()
	dw_survey.ResetUpdate()
	dw_dupcheck.ResetUpdate()
	dw_gcc_history.ResetUpdate()
	dw_survey.ResetUpdate()
	dw_name_search.ResetUpdate()
	dw_data.ResetUpdate()
END IF

end event

event closequery;call super::closequery;long ll_row, ll_rc, ll_dm, ll_sm
ll_row = dw_data.GetRow() 
If ll_row <= 0 or dw_data.RowCount() <= 0 then return 0
dwitemstatus l_data, l_survey

l_data		= dw_data.GetItemStatus( ll_row, 0, Primary!)
l_survey		= dw_survey.GetItemStatus( 1, 0, Primary!)
ll_dm			= dw_data.ModifiedCount()
ll_sm			= dw_survey.ModifiedCount()
If ll_dm > 0 or ll_sm > 0 or & 
	l_data = NewModified! or l_data = DataModified! or &
	l_survey = NewModified! or l_survey = DataModified! then 
	ll_rc = MessageBox('Unsaved changes exist', 'Would you like to go back and save them?', Question!, YesNo!, 1 )
	If ll_rc = 1 then return 1
END IF 

return 0
end event

event resize;call super::resize; 
	if sizetype <> 1 then 
		dw_survey.height	= newheight - dw_survey.y * 2  
		dw_survey.width	= newwidth - dw_survey.x - dw_data.x 
		cb_websearch.y 	= cb_search.y
	End IF 
 
end event

event activate;If dw_gcc_history.visible then
	if id_gcc > 0 then dw_gcc_history.Retrieve( id_gcc)
end if
end event

event close;If IsValid( inv_dbcopy ) 	then DESTROY inv_dbcopy 
if isvalid(i_web_tran)		then 
	DISCONNECT Using i_web_tran;
	destroy i_web_tran
END IF
if isvalid(inv_qgen)		then DESTROY inv_qgen
if isvalid(inv_dbcopy)	then DESTROY inv_dbcopy



end event

event ue_reset_popups;call super::ue_reset_popups;	uo_comp.event ue_losefocus()
	uo_room.event ue_losefocus()
	uo_prefix.event ue_losefocus()
	uo_state.event ue_losefocus()

end event

event clicked;this.event ue_reset_popups()
end event

event ue_dfilter;call super::ue_dfilter;//		
//		string lsFilter 
//		int liRc
//		
//		if cbx_filled.checked then 
//			lsFilter =  'not ISNULL(year(gcc_ansdate)) and year(gcc_ansdate) > 2000 ' 
//			liRc = dw_data.SetFilter (lsFilter) 
//			dw_data.Filter ()
//		else
//			liRc = dw_data.SetFilter ('') 
//			dw_data.Filter ()
//		end if
//
//		if cbx_filled.checked then 
//			lsFilter =  'not ISNULL(year(gcc_ansdate)) and year(gcc_ansdate) > 2000 ' 
//			liRc = dw_mainlist.SetFilter (lsFilter) 
//			dw_mainlist.Filter ()
//		else
//			liRc = dw_mainlist.SetFilter ('') 
//			dw_mainlist.Filter ()
//		end if
//dw_primary.ShareData(dw_mainlist)
//
//
//
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_gcc_feedback
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_gcc_feedback
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_gcc_feedback
integer x = 5
integer y = 1132
integer width = 1632
integer height = 332
string dataobject = "d_gcc_list_web"
boolean hscrollbar = true
end type

event dw_mainlist::ue_rowselected;if row > 0 and row <= this.RowCount() AND ab_selected = true then
	//dw_survey.Reset()    gcc_surveyid
	cb_delete1.visible = false 
	cb_save.visible = false 
	cb_save.enabled = false
	

	if not ib_used_lookup then 
		id_surveyid = f_nvl(dw_data.GetItemNumber(row,'gcc_surveyid'), 0)
		id_gcc 		= f_nvl(dw_data.GetItemNumber(row,'gcc_gccid') , 0)
		inv_qgen.in_headerid		= id_gcc
		inv_qgen.idt_ans_date	= dw_data.GetItemDatetime(row,'gcc_ansdate')
		istr_parms.gccid = id_gcc // set call parm here - common to all calls
		istr_parms.room  = f_nvl(dw_data.GetItemString(row,'gcc_room') , '')
	end if
	
	inv_qgen.in_responderid	= dw_data.GetItemNumber(row,'guest_account')
	id_account					= inv_qgen.in_responderid	
		//---------------------------------------
	istr_parms.guestemail  = f_nvl(dw_data.GetItemString(row,'guest_email') , '')
	istr_parms.guestname  = trim(f_nvl(dw_data.GetItemString(row,'guest_last_name') , '')) +', '+&
									trim(f_nvl(dw_data.GetItemString(row,'guest_first_name') , ''))
	istr_parms.guest_phone = f_nvl(dw_data.GetItemString(row,'guest_phone') , '')
	
	cb_new.visible = true 
	//cb_delete1.visible = true 
	cb_save.visible = true 
	cb_save.enabled = true 
	dw_gcc_history.Retrieve( id_gcc)
	dw_survey.visible = false 
	ib_readonly = false
	dw_gcc_history.visible = true 
	
	
END IF	

return 1
end event

event dw_mainlist::doubleclicked;call super::doubleclicked;	if id_surveyid <= 0 or id_gcc <= 0 then 
		dw_survey.Reset()
		return 0
	END IF
	
	//datetime ldt_ansdate
	int		li_ret

	if dw_data.GetRow() <= 0 then return 0
	is_webfilled= dw_data.GetItemString( dw_data.GetRow() , 'gcc_webfilled') 
	is_webkey	= trim(f_nvl(dw_data.GetItemString( dw_data.GetRow() , 'gcc_webkey'),'')) 
	idt_ansdate = dw_data.GetItemDateTime( dw_data.GetRow() , 'gcc_ansdate') 

	if parent.event ue_web_copy() < 0 then return 0 
	
	inv_qgen.event ue_create_qset (id_surveyid, dw_survey)
	inv_qgen.event ue_load_user_answers ()
		
	ib_readonly = false
//	if dw_data.GetRow() > 0 then
			if POS( is_accessflags, 'A') <= 0 then // not admin 
				if DaysAfter ( date(idt_ansdate), date(f_sysdate() )) > 1  or is_webfilled = 'Y' then
					ib_readonly = true 
				end if
			end if 
//	end if 
	dw_survey.visible = true 
	dw_gcc_history.visible = false 
	
end event

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'gcc_date_t', 'gcc_ansdate D', 'gcc_ansdate A')
this.inv_field_sort.of_setcolumn( 'gcc_room_t', 'gcc_room A', 'gcc_room D')
this.inv_field_sort.of_setcolumn( 'guest_last_name_t', 'guest_last_name A, guest_first_name A', 'guest_last_name D, guest_first_name D')
this.inv_field_sort.of_setcolumn( 'guest_first_name_t', 'guest_first_name A, guest_last_name A', 'guest_first_name D, guest_last_name D')
this.inv_field_sort.of_setcolumn( 'guest_city_t', 'guest_city A, guest_last_name A, guest_first_name A', 'guest_city D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'guest_state_t', 'guest_state A, guest_last_name A, guest_first_name A', 'guest_state D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'guest_zip_t', 'guest_zip A, guest_last_name A, guest_first_name A', 'guest_zip D, guest_last_name A, guest_first_name A')
this.inv_field_sort.of_setcolumn( 'gcc_gccid_t', 'gcc_gccid A','gcc_gccid D')



end event

event dw_mainlist::ue_setmasks;call super::ue_setmasks;if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 
this.object.gcc_ansdate.EditMask.Mask	= gnv_appman.is_datemask

end event

type cb_last_search from w_vzt_base`cb_last_search within w_gcc_feedback
integer x = 2930
integer y = 1100
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_gcc_feedback
integer x = 1449
integer y = 1032
integer width = 169
integer taborder = 170
integer textsize = -8
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_gcc_feedback
integer x = 1120
integer y = 1180
integer width = 133
integer taborder = 250
boolean enabled = false
string text = "Del"
end type

type cb_save from w_vzt_base`cb_save within w_gcc_feedback
integer x = 1294
integer y = 1032
integer width = 151
integer taborder = 230
integer textsize = -8
end type

event cb_save::clicked;//override global save for now
long ll_rc, ll_row
// check if matching user exists before saving NEW 
dwitemstatus lstatus

is_editcol = '' 
ll_row = dw_data.GetRow() 
if ll_row <= 0 then return 
//if dw_data.is_editmode <> 'W' then return 

//ib_used_existing = false
if dw_data.AcceptText() <> 1 then return 

if ib_readonly then dw_survey.ResetUpdate()

lstatus = dw_data.GetItemStatus( ll_row, 0, Primary!)
If lstatus = New! or lstatus = NewMOdified! then 
	
//	if dw_data.AcceptText() <> 1 then return 
	if f_nvl(dw_data.object.guest_room_last_checkin [ll_row],'') = '' then
		ll_rc = MessageBox("WARNING","Guest Room is required. Save anyway?", question!, yesno!,2)
		if ll_rc = 2 then return
	end if
	dw_dupcheck.Reset()
	dw_dupcheck.insertRow(0) 
	dw_dupcheck.object.guest_last_name 	[1]= f_nvl( trim(dw_data.object.guest_last_name 	[dw_data.GetRow()]),'')
	if dw_dupcheck.object.guest_last_name 	[1]= '' then
		MessageBox("Data Error","Guest last name is required. ", stopsign!)
		return 
	end if
	
	dw_dupcheck.object.guest_first_name [1]= dw_data.object.guest_first_name	[dw_data.GetRow()]
	dw_dupcheck.object.guest_city 		[1]= dw_data.object.guest_city			[dw_data.GetRow()]
	dw_dupcheck.object.guest_state 		[1]= dw_data.object.guest_state			[dw_data.GetRow()]
	dw_dupcheck.object.guest_zip 			[1]= dw_data.object.guest_zip				[dw_data.GetRow()]
	dw_dupcheck.Search('')
	ll_rc = dw_dupcheck.RowCOunt()
	if ll_rc > 0 then 
		OpenWithParm( w_gcc_dupguest, dw_dupcheck) 
		long ll_dup_rc
		ll_dup_rc = long(Message.Stringparm )
		ib_used_existing = false
		if ll_dup_rc > 0 then 
			// find the row and use it
			ib_used_existing = true

			datetime	ldt_in, ldt_out
			string	ls_room	
			ls_room	= dw_data.GetItemString( 1, 'guest_room_last_checkin')		// save
			ldt_in	= dw_data.GetItemDatetime( 1, 'guest_last_checkin_dt')  		// gcc_checkin_dt
			ldt_out	= dw_data.GetItemDatetime( 1, 'guest_last_depart_dt')			// gcc_depart_dt
			
			id_account = dw_dupcheck.object.guest_account	[ll_rc]
			dw_data.object.guest_account	[1]	= id_account
			dw_data.object.guest_last_name [1] 	= dw_dupcheck.object.guest_last_name [ll_rc]
			dw_data.object.guest_first_name [1] = dw_dupcheck.object.guest_first_name [ll_rc]
			dw_data.object.guest_city [1] 		= dw_dupcheck.object.guest_city 	[ll_rc]
			dw_data.object.guest_state [1] 		= dw_dupcheck.object.guest_state [ll_rc]
			dw_data.object.guest_zip [1] 			= dw_dupcheck.object.guest_zip 	[ll_rc]
			dw_data.object.guest_addr1 [1] 		= dw_dupcheck.object.guest_addr1 [ll_rc]
			dw_data.object.guest_addr2 [1] 		= dw_dupcheck.object.guest_addr2 [ll_rc]
			dw_data.object.guest_phone [1] 		= dw_dupcheck.object.guest_phone [ll_rc]
			dw_data.object.guest_comp_name [1] 	= dw_dupcheck.object.guest_comp_name [ll_rc]
			dw_data.object.guest_email [1] 		= dw_dupcheck.object.guest_email 	[ll_rc]
			dw_data.object.guest_room_last_checkin [1] = dw_dupcheck.object.guest_room_last_checkin 	[ll_rc]
			dw_data.object.guest_guest_id [1] 		= dw_dupcheck.object.guest_guest_id 	[ll_rc]
//			dw_data.object.guest_last_checkin_dt [1] 	= dw_dupcheck.object.guest_last_checkin_dt 	[ll_rc]
//			dw_data.object.guest_last_depart_dt [1] 	= dw_dupcheck.object.guest_last_depart_dt 	[ll_rc]
			dw_data.ResetUpdate()
			dw_data.SetItem( 1, 'gcc_room', 			ls_room	)			//restore
			dw_data.SetItem( 1, 'gcc_checkin_dt', 	ldt_in	)
			dw_data.SetItem( 1, 'gcc_depart_dt', 	ldt_out	)
			dw_data.SetItem( 1, 'guest_room_last_checkin', ls_room	)
			dw_data.SetItem( 1, 'guest_last_checkin_dt', ldt_in	)
			dw_data.SetItem( 1, 'guest_last_depart_dt', 	ldt_out	)
			istr_parms.room  = f_nvl(dw_data.GetItemString(1,'gcc_room') , '')
			parent.event ue_save_all()
		ELSE
			parent.event ue_save_all() // dups found but continue inserting
		END IF
	ELSE // no dups
		parent.event ue_save_all()
	END IF 
Else
	if f_nvl(dw_data.object.gcc_room [ll_row],'') = '' then
		ll_rc = MessageBox("WARNING","Guest Room is required. Save anyway?", question!, yesno!,2)
		if ll_rc = 2 then return
	end if

	parent.event ue_save_all()
End If
if ii_savestatus >= 0 then 
	cb_reset.visible = false 
	if ib_web_request then 
		parent.event ue_web_letter(false)
	end if
end if 
ib_web_request = false
dw_name_search.visible = false
end event

type cb_select from w_vzt_base`cb_select within w_gcc_feedback
integer x = 809
integer y = 1032
integer width = 137
integer taborder = 220
integer textsize = -8
string text = "Edit"
end type

event cb_select::clicked;call super::clicked;ib_web_request = false
end event

type cb_new from w_vzt_base`cb_new within w_gcc_feedback
integer x = 672
integer y = 1032
integer width = 137
integer taborder = 240
integer textsize = -8
end type

event cb_new::clicked;//override 
int li_ret
long ll_row
	
ib_web_request = false // default to letter	
	
li_ret = 1			// default to new guest

If dw_mainlist.GetSelectedRow(0) > 0 then
	li_ret = MessageBox('New Survey / New Guest', 'Click "Yes" for new guest, "No" for new survey for selected guest.', Question!, YesNo!, 1) 
END IF 

IF li_ret = 1 then
	call super::clicked		// new guest
	inv_qgen.in_responderid	= 0
	ll_row = dw_primary.GetRow()
	if ll_row <= 0 then return
	dw_primary.SetItem( ll_row, 'guest_country', is_country  )
ELSE
	//used existing
	parent.event ue_used_existing() 
END IF

ib_readonly = false 

// dw_data.SetItem( 1, "gcc_room", '')
	
ll_row = dw_primary.GetRow()
if ll_row <= 0 then return

dw_primary.SetTaborder ( 'gcc_openedby', 0)
dw_primary.SetItem( ll_row , 'gcc_openedby', gnv_appman.is_userid)

long ll_ret
ll_ret = parent.event ue_web_check(false) //check without messages
if ll_ret > 0 then // web available
end if

// get survey id and type=(letter or web)
id_surveyid = f_qgen_get_survey(0)
if id_surveyid = 0 then return 
if id_surveyid < 0 then 
	id_surveyid = ABS( id_surveyid )
	ib_web_request = true 
end if 
//negative = internet
cb_reset.visible = true 
dw_primary.SetItem( ll_row, 'gcc_surveyid', id_surveyid )
id_gcc						= 0
inv_qgen.in_headerid		= 0
inv_qgen.idt_ans_date	= f_sysdate()
//---------------------------------------
istr_parms.gccid = 0
istr_parms.room  = ''

If not ib_web_request then
// create blank survey for letter surveys  
	inv_qgen.event ue_create_qset (id_surveyid, dw_survey)
	dw_survey.visible 		= true 
	dw_gcc_history.visible	= false 
END IF 

IF li_ret = 1 then // new guest 
//	gnv_appman.uf_share( dw_data, 'guest_room_last_checkin', gnv_appman.ids_shared[1])
	dw_data.SetItem( 1, "gcc_room", '')
	dw_data.SetItem( 1, "guest_room_last_checkin", '')
	dw_data.SetColumn( "guest_room_last_checkin")
ELSE
//	gnv_appman.uf_share( dw_data, 'gcc_room', gnv_appman.ids_shared[1])
	string ls_room
	ls_room = f_nvl(dw_data.GetItemString( 1, "guest_room_last_checkin"),'')
	If ls_room <> '' then
		dw_data.SetItem( 1, "gcc_room", ls_room)
	END IF 
	dw_data.SetColumn( "gcc_room")
END IF 
dw_data.POST SetFocus()
end event

type cb_newsearch from w_vzt_base`cb_newsearch within w_gcc_feedback
integer x = 18
integer y = 1032
integer width = 306
integer taborder = 210
integer textsize = -8
end type

event cb_newsearch::clicked;call super::clicked;dw_survey.Reset() 
cb_save.visible 		= false
dw_primary.post Setcolumn( 'guest_last_name')
dw_name_search.visible = false
cb_reset.visible = false
dw_data.modifyedit('S')
ib_web_request = false
cb_websearch.visible = true
end event

type cb_search from w_vzt_base`cb_search within w_gcc_feedback
integer x = 466
integer y = 1032
integer width = 197
integer taborder = 200
integer textsize = -8
end type

event cb_search::clicked;//override !!
//dw_primary.search('') 
//dw_primary.RefreshDataObject() 
ib_web_request = false
cb_websearch.visible = false
super::event clicked()
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_gcc_feedback
integer x = 1211
integer y = 672
integer width = 343
integer textsize = -7
end type

type st_stop from w_vzt_base`st_stop within w_gcc_feedback
integer x = 462
integer y = 1032
integer width = 151
end type

type dw_data from w_vzt_base`dw_data within w_gcc_feedback
integer x = 5
integer y = 4
integer width = 1632
integer height = 988
integer taborder = 120
string dataobject = "d_gcc_guest_entry"
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_data::constructor;call super::constructor;_ResetDataObjectOnSelect 	= true
is_editable[]	= { & 
'gcc_gccid','guest_room_last_checkin','gcc_room','guest_guest_id', &
'guest_last_checkin_dt','gcc_checkin_dt','guest_last_depart_dt','gcc_depart_dt', 'guest_prefix',&
'guest_last_name','guest_first_name',  'guest_comp_name', 'guest_addr1', & 
'guest_addr2','guest_city','guest_state','guest_zip','guest_country', 'guest_phone', 'guest_email','gcc_openedby',&
'conf_id', 'usage_hotel','usage_rest','usage_bar','usage_spa','usage_hclub' }

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_searchable[]	= { & 
'gcc_gccid','guest_room_last_checkin','gcc_room','guest_guest_id', &
'guest_last_checkin_dt','gcc_checkin_dt','guest_last_depart_dt','gcc_depart_dt','guest_prefix', &
'guest_last_name','guest_first_name',  'guest_comp_name', 'guest_addr1', & 
'guest_addr2','guest_city','guest_state','guest_zip','guest_country', 'guest_phone', 'guest_email','gcc_openedby', &
'conf_id', 'usage_hotel','usage_rest','usage_bar','usage_spa','usage_hclub' }


end event

event dw_data::itemchanged;call super::itemchanged;if row <= 0 then return 

If dwo.name = 'guest_email' then
  If pos( data , '@') <= 0 then
	  MessageBox("Validation Error", "e-mail id must contain the '@' sign")
	  return 0
	END IF 
END IF 

If dwo.name = 'guest_last_name' or dwo.name = 'guest_first_name' then
 	data = f_proper_case( data)
	if this.is_editmode = 'W' then this.POST SetItem( row, string( dwo.name), data)
END IF 

If dwo.name = 'gcc_room' then
	if this.is_editmode = 'W' then 
		long ll_pos
		// validate typed room 
		ll_pos = gnv_appman.ids_shared[1].Find( "area_number ='"+ trim(data) +"'",1,gnv_appman.ids_shared[1].RowCount())
		If ll_pos <= 0 then 
		  MessageBox("Validation Error", "Invalid room entered!")
		  return 0
		END IF
	end if 
END IF 

If (dwo.name = 'guest_last_checkin_dt'  or & 
	dwo.name = 'guest_last_depart_dt'  or & 
	dwo.name = 'gcc_checkin_dt'  or & 
	dwo.name = 'gcc_depart_dt' ) AND & 
	this.is_editmode = 'W' then 
	is_editcol = dwo.name 
	this.event POST ue_validate_page()
END IF 
end event

event dw_data::ue_setshares;//gnv_appman.uf_share( dw_data, 'guest_room_last_checkin', gnv_appman.ids_shared[1])
end event

event dw_data::doubleclicked;call super::doubleclicked;string ls_lookupprocessor, ls_newvalue, ls_autoreplace
window  lw_processor
st_lookup_parm   lst_parms

If row <= 0 or row > this.RowCount() then return
If this.accepttext() <> 1 then return 


If dwo.name = 'guest_last_checkin_dt' or dwo.name = 'guest_last_depart_dt' then
	ls_lookupprocessor 	= 'w_vzt_calendar'
	lst_parms.parmvalue = string( this.GetItemDateTime(row, string(dwo.name)),"mmm-dd-yyyy" )
	OpenWithParm(lw_processor, lst_parms, ls_lookupprocessor )
	ls_newvalue = message.stringparm 
	If ls_newvalue =  "CANCEL" then
   	 return
	Else
	   this.SetItem( row, string(dwo.name), datetime( date( ls_newvalue ), time("00:00 AM") ) )
	End If
End If
end event

event dw_data::clicked;call super::clicked;string ls_lookupprocessor, ls_newvalue, ls_autoreplace, ls_colname, ls_prot, ls_tab
window  lw_processor
st_lookup_parm   lst_parms
dwitemstatus ldi_status

If row <= 0 or row > this.RowCount() then return
If this.accepttext() <> 1 then return 

//this.Object.guest_last_checkin_dt.Protect = 1 then return 

If dwo.name = 'arr_dn' or dwo.name = 'dep_dn' then
	ldi_status = this.GetItemStatus ( row, 0, primary!)
	If dwo.name = 'arr_dn' then 
		If ldi_status = New! or ldi_status = NewModified! then 
			ls_colname = 'guest_last_checkin_dt'
		ELSE
			ls_colname = 'gcc_checkin_dt'			
		END IF
	END IF 
	If dwo.name = 'dep_dn' then 
		If ldi_status = New! or ldi_status = NewModified! then 
			ls_colname = 'guest_last_depart_dt' 
		ELSE
			ls_colname = 'gcc_depart_dt'			
		END IF
	END IF 

	ls_tab = this.Describe(ls_colname + ".TabSequence") 
	ls_prot= this.Describe(ls_colname + ".Protect") 
	If ls_prot = '1' or ls_tab = '0' then return 
	
	this.POST SetFocus()
	this.POST SetColumn( ls_colname )
	ls_lookupprocessor 	= 'w_vzt_calendar'
	lst_parms.parmvalue = string( this.GetItemDateTime(row, ls_colname),"yyyy mmm dd" )
	OpenWithParm(lw_processor, lst_parms, ls_lookupprocessor )
	st_lookup_ret lst_ret
	lst_ret = message.PowerObjectParm
	ls_newvalue = lst_ret.newvalue
	If ls_newvalue =  "CANCEL" then
   	 return
	Else
		datetime ldt_temp
		ldt_temp = datetime( date( ls_newvalue ), time("00:00 AM") )
	   this.SetItem( row, ls_colname, ldt_temp ) 
		is_editcol = ls_colname
		this.event POST ue_validate_page()
	End If
End If
end event

event dw_data::editchanged;if row <= 0 then return 
string ls_col1, ls_col2, ls_name
dwitemstatus ldws

ls_col1 = 'guest_last_name' 
ls_col2 = 'guest_comp_name' 

ls_name = trim(dwo.name)
ldws		= this.GetItemStatus( row, 0, Primary!)
 
If ldws = New! or ldws	= NewModified! and this.is_editmode = 'W' and ls_name = ls_col1 then
 	if len(data) = 4 then 
		long ll_row
		dw_name_search.reset()
		ll_row = dw_name_search.insertrow(0)
		dw_name_search.setitem( ll_row, ls_col1 , data )
		dw_name_search.Search('')
		dw_name_search.visible = true 
		this.Setcolumn( ls_col1)
		this.SetFocus()
		this.POST SelectText ( 5, 0)		
	end if
END IF 

If this.is_editmode = 'W' and ls_name = ls_col2 and not ib_comp_update then
 	//ldws = New! or ldws	= NewModified! and
	ib_comp_update = true
	uo_comp.event ue_caller_editchange( trim(data) )
	ib_comp_update = false
END IF

If this.is_editmode = 'W' and (ls_name = 'guest_room_last_checkin' or &
		ls_name = 'gcc_room') and not ib_comp_update then
	ib_comp_update = true 
	uo_room.is_caller_col = ls_name
	uo_room.event ue_caller_editchange( trim(data) )
	ib_comp_update = false
END IF

If this.is_editmode = 'W' and ls_name = 'guest_prefix' and not ib_comp_update then
	ib_comp_update = true 
	uo_prefix.is_caller_col = ls_name
	uo_prefix.event ue_caller_editchange( trim(data) )
	ib_comp_update = false
END IF

If this.is_editmode = 'W' and ls_name = 'guest_state' and not ib_comp_update then
	ib_comp_update = true 
	uo_state.is_caller_col = ls_name
	uo_state.event ue_caller_editchange( trim(data) )
	ib_comp_update = false
END IF


end event

event dw_data::ue_validate_page;//overr
datetime ldt_guest_last_checkin, ldt_guest_last_depart
datetime ldt_gcc_checkin, ldt_gcc_depart
long ll_row, ll_ret
string ls_gcc, ls_lname
ll_row = this.GetRow()
If ll_row <= 0 then return 0 

dwitemstatus ldstatus
ldstatus = this.GetItemStatus( ll_row, 0, Primary!) 

ldt_guest_last_checkin	= this.GetItemDateTime( ll_row , 'guest_last_checkin_dt')
ldt_guest_last_depart	= this.GetItemDateTime( ll_row , 'guest_last_depart_dt')
ldt_gcc_checkin			= this.GetItemDateTime( ll_row , 'gcc_checkin_dt')
ldt_gcc_depart				= this.GetItemDateTime( ll_row , 'gcc_depart_dt')
ls_lname						= trim(this.GetItemString( ll_row , 'guest_last_name'))

If (ldstatus = New! or ldstatus = NewModified! ) and (is_editcol = '' or is_editcol = 'guest_last_checkin_dt' or is_editcol = 'guest_last_depart_dt') then 
	If Not IsNull(ldt_guest_last_checkin) and Not IsNull(ldt_guest_last_depart	) then
		//If ldt_guest_last_depart <= ldt_guest_last_checkin and (is_editcol = '' or is_editcol = 'guest_last_checkin_dt' or is_editcol = 'guest_last_depart_dt') then
		//	MessageBox('Validation Error', 'Guest departure date must be later than arrival date.',Exclamation!)
		//	return -55
		//END
		If ldt_guest_last_depart < ldt_guest_last_checkin and (is_editcol = '' or is_editcol = 'guest_last_checkin_dt' or is_editcol = 'guest_last_depart_dt') then
			MessageBox('Validation Error', 'Guest departure date must not be earlier than arrival date.',Exclamation!)
			return -55
		END IF 
	END IF
	If IsNull(ldt_guest_last_checkin	) or  date(ldt_guest_last_checkin	) = date('01-01-1900') then
		If is_editcol = 'guest_last_checkin_dt' then 			
			MessageBox('Validation Error', 'Guest check-in date is null.')
			is_editcol = ''
			return -55
		ELSEif is_editcol = '' then
			ll_ret = MessageBox('Validation Error', 'Guest check-in date is null. Save anyway?',Question!, YesNo!, 2)
			If ll_ret = 2 then return -55
		END IF
	END IF
	If IsNull(ldt_guest_last_depart) or  date(ldt_guest_last_depart	) = date('01-01-1900') then
		If is_editcol = 'guest_last_depart_dt' then 	
			MessageBox('Validation Error', 'Guest departure date is null.')			
			is_editcol = ''
			return -55
		ELSEif is_editcol = '' then
			ll_ret = MessageBox('Validation Error', 'Guest departure date is null. Save anyway?',Question!, YesNo!, 2)
			If ll_ret = 2 then return -55
		END IF
	END IF

END IF 

If (ldstatus = NotModified! or ldstatus = DataModified!) and (is_editcol = '' or is_editcol = 'gcc_checkin_dt' or is_editcol = 'gcc_depart_dt') then 
	If Not IsNull(ldt_gcc_checkin) and Not IsNull(ldt_gcc_depart	) then
		//If ldt_gcc_depart	<= ldt_gcc_checkin and (is_editcol = '' or is_editcol = 'gcc_checkin_dt' or is_editcol = 'gcc_depart_dt') then
		//	MessageBox('Validation Error', 'GCC departure date must be later than arrival date.',Exclamation!)
		//	is_editcol = ''
		//	return -55
		//END IF 
		If ldt_gcc_depart	< ldt_gcc_checkin and (is_editcol = '' or is_editcol = 'gcc_checkin_dt' or is_editcol = 'gcc_depart_dt') then
			MessageBox('Validation Error', 'GCC departure date must not be earlier than arrival date.',Exclamation!)
			is_editcol = ''
			return -55
		END IF 
	END IF

	If IsNull(ldt_gcc_checkin) or date(ldt_gcc_checkin) = date('01-01-1900') then
		If is_editcol = 'gcc_checkin_dt' then 
			MessageBox('Validation Error', 'GCC check-in date is null.')
			is_editcol = ''
			return -55			
		ELSEif is_editcol = '' then
			ll_ret = MessageBox('Validation Error', 'GCC check-in date is null. Save anyway?',Question!, YesNo!, 2)
			If ll_ret = 2 then return -55
		END IF
	END IF
	
	If IsNull(ldt_gcc_depart) or  date(ldt_gcc_depart) = date('01-01-1900') then
		If is_editcol = 'gcc_depart_dt' then 
			MessageBox('Validation Error', 'GCC departure date is null.')
			is_editcol = ''
			return -55			
		ELSEif is_editcol = '' then
			ll_ret = MessageBox('Validation Error', 'GCC departure date is null. Save anyway?',Question!, YesNo!, 2)
			If ll_ret = 2 then return -55
		END IF			
	END IF

END IF

If (IsNull(ls_lname) or ls_lname='') and (is_editcol = '' or is_editcol = 'guest_last_name' ) then
	MessageBox('Validation Error', 'Guest last name is null.',Exclamation!)
	is_editcol = ''
	return -55
END IF
is_editcol = ''
return 0
end event

event dw_data::ue_setmasks;if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 

dw_data.Object.guest_last_checkin_dt.EditMask.Mask	= gnv_appman.is_datemask
dw_data.Object.guest_last_depart_dt.EditMask.Mask	= gnv_appman.is_datemask
dw_data.Object.gcc_checkin_dt.EditMask.Mask			= gnv_appman.is_datemask
dw_data.Object.gcc_depart_dt.EditMask.Mask			= gnv_appman.is_datemask
end event

event dw_data::itemfocuschanged;parent.event ue_reset_popups()

//
//If dwo.name = 'guest_addr1' then 
//	uo_comp.event ue_losefocus() 
//End IF
//
//If dwo.name = 'guest_guest_id' then 
//	uo_room.event ue_losefocus() 
//End IF
//
//If dwo.name = 'guest_last_name' then 
//	uo_prefix.event ue_losefocus() 
//End IF
//
//If dwo.name = 'guest_zip' then 
//	uo_state.event ue_losefocus() 
//End IF
//
//
end event

event dw_data::losefocus;//if not ib_comp_update then
// If dw_data.is_editmode <> 'S' then
//	uo_comp.event ue_losefocus()
//	uo_room.event ue_losefocus()
//	uo_prefix.event ue_losefocus()
//	uo_state.event ue_losefocus()
// end if
//end if
end event

event dw_data::retrieveend;call super::retrieveend;	string lsFilter 
		int liRc
		
		if cbx_filled.checked then 
			lsFilter =  'not ISNULL(year(gcc_ansdate))' 
			liRc = dw_data.SetFilter (lsFilter) 
			dw_data.Filter ()
		else
			liRc = dw_data.SetFilter ('') 
			dw_data.Filter ()
		end if
		
dw_primary.ShareDataOff() 
dw_primary.ShareData(dw_mainlist)

end event

type dw_print from w_vzt_base`dw_print within w_gcc_feedback
integer x = 3099
integer y = 1260
integer taborder = 260
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_gcc_feedback
end type

type dw_survey from datawindow within w_gcc_feedback
event ue_keydown pbm_dwnkey
boolean visible = false
integer x = 1646
integer y = 4
integer width = 1925
integer height = 1632
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_template02"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;integer li_maxvs, li_vs 
li_maxvs = integer( string( dw_survey.Object.DataWindow.VerticalScrollMaximum ))
li_vs 	= integer( string(dw_survey.Object.DataWindow.VerticalScrollPosition ))
if key = keypagedown! then 
	if li_vs < li_maxvs then 
		li_vs = MIN( li_vs + (li_maxvs / 5) , li_maxvs )
		dw_survey.Object.DataWindow.VerticalScrollPosition= li_vs
	end if 
end if 

if key = keypageup! then 
	if li_vs > 0  then 
		li_vs = MAX( li_vs - (li_maxvs / 5) , 0 )
		dw_survey.Object.DataWindow.VerticalScrollPosition= li_vs
	end if 
end if 
end event

event itemchanged;if dw_mainlist.GetSelectedRow(0) > 0 and not ib_readonly then
	cb_save.visible = true 
	cb_save.enabled = true
End IF

if  ib_readonly then 
	return 2
else
	return 0
end if 
end event

event clicked;parent.event ue_reset_popups()
end event

type gb_web1 from groupbox within w_gcc_feedback
integer x = 850
integer y = 1796
integer width = 265
integer height = 268
integer taborder = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_web from groupbox within w_gcc_feedback
integer x = 535
integer y = 1796
integer width = 265
integer height = 268
integer taborder = 50
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_6 from groupbox within w_gcc_feedback
integer x = 827
integer y = 1496
integer width = 261
integer height = 268
integer taborder = 40
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_gcc_feedback
integer x = 562
integer y = 1496
integer width = 261
integer height = 268
integer taborder = 70
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_gcc_feedback
integer x = 23
integer y = 1492
integer width = 261
integer height = 272
integer taborder = 360
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_gcc_feedback
integer x = 293
integer y = 1496
integer width = 261
integer height = 268
integer taborder = 350
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_gcc_feedback
integer x = 1093
integer y = 1496
integer width = 265
integer height = 268
integer taborder = 340
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_gcc_feedback
integer x = 1362
integer y = 1496
integer width = 265
integer height = 268
integer taborder = 370
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_task from picturebutton within w_gcc_feedback
integer x = 306
integer y = 1540
integer width = 233
integer height = 204
integer taborder = 270
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "gcc_task.bmp"
alignment htextalign = left!
end type

event clicked;parent.event ue_reset_popups()
if wf_gcc_selected() < 0 then return  
istr_parms.openmode = '0'

SetPointer( Hourglass!)
If IsValid( w_gcc_call_upd) then 
	MessageBox('Warning', 'Call Window already open for another guest and or task!.~r~nClose it first.', StopSign!)
END IF
OpenSheetWithParm( w_gcc_call_upd, istr_parms, gnv_appman.iw_frame, 0, Layered!)
end event

type pb_thankyou from picturebutton within w_gcc_feedback
integer x = 1102
integer y = 1540
integer width = 233
integer height = 204
integer taborder = 310
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "gcc_thx.bmp"
alignment htextalign = left!
end type

event clicked;parent.event ue_reset_popups()
if wf_gcc_selected() < 0 then return  
istr_parms.gccid = id_gcc
SetPointer( Hourglass!)
string ls_code, ls_message
long li_rc

str_response lstr_parms
OpenWIthParm( w_get_ty_type, lstr_parms)
lstr_parms = Message.PowerObjectParm
if not isValid( lstr_parms) then return 0
If lstr_parms.rc <= 0 then return 0


CHOOSE CASE lstr_parms.num1
	CASE 1
		OpenSheetWithParm( w_gcc_letter_thanks, istr_parms, gnv_appman.iw_frame, 0, Layered!)
	CASE 7
		OpenSheetWithParm( w_gcc_letter_thanks_welcome, istr_parms, gnv_appman.iw_frame, 0, Layered!)
	CASE 9
		OpenSheetWithParm( w_gcc_letter_thanks_feedback, istr_parms, gnv_appman.iw_frame, 0, Layered!)
	CASE 10
		OpenSheetWithParm( w_gcc_letter_thanks_preferred, istr_parms, gnv_appman.iw_frame, 0, Layered!)
	CASE 8
END CHOOSE


end event

type pb_apology from picturebutton within w_gcc_feedback
integer x = 1371
integer y = 1540
integer width = 233
integer height = 204
integer taborder = 330
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "gcc_apol.bmp"
alignment htextalign = left!
end type

event clicked;parent.event ue_reset_popups()
if wf_gcc_selected() < 0 then return  
SetPointer( Hourglass!)
OpenSheetWithParm( w_gcc_letter_apology, istr_parms, gnv_appman.iw_frame, 0, Layered!)
end event

type pb_call from picturebutton within w_gcc_feedback
integer x = 37
integer y = 1540
integer width = 233
integer height = 204
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "gcc_call.bmp"
alignment htextalign = left!
end type

event clicked;parent.event ue_reset_popups()
if wf_gcc_selected() < 0 then return  
istr_parms.openmode 	= 'G'
SetPointer( Hourglass!)
If IsValid( w_gcc_call_upd) then 
	MessageBox('Warning', 'Call Window already open for another guest and or task!.~r~nClose it first.', StopSign!)
END IF
OpenSheetWithParm( w_gcc_call_upd, istr_parms, gnv_appman.iw_frame, 0, Layered!)
end event

type dw_gcc_history from uo_vzt_dwbase within w_gcc_feedback
boolean visible = false
integer x = 1646
integer y = 4
integer width = 1911
integer height = 1224
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_gcc_history"
boolean vscrollbar = true
end type

event doubleclicked;call super::doubleclicked;long ll_row
double ls_id
ll_row	=row
if ll_row <= 0 then return 

string callNumber, action, statCode, clickedColNum, ls_code

callNumber 		= dw_gcc_history.GetItemString(ll_row,	"refnum") 
ls_code			= dw_gcc_history.GetItemString(ll_row,	"actioncode") 
ls_id				= dw_gcc_history.GetItemNumber(ll_row,	"id") 
CHOOSE CASE ls_code
	CASE 'TYL', 'APL', 'REL', 'AML', 'FRL', 'PGL', 'WSR', 'WL' // 12.18.2001
		istr_parms.id = ls_id 
		OpenSheetWithParm( w_gcc_letter_view, istr_parms, gnv_appman.iw_frame, 0, Layered!)
END CHOOSE

IF IsNumbER(callNumber) then 
 If Is_PasswordOK( Get_Event_Security( "CM" ) ) Then
	statCode 		= '1' //dw_gcc_history.GetItemString(ll_row,	"stat_code")
 
	if integer(statCode) < 10 then
 	  	action = '1'
	else
		action = '2'
	end if

	If IsValid( w_gcc_call_upd ) Then
  		MessageBox('Warning', 'Call Window already open for another guest and or task!.~r~nClose it first.', StopSign!)

//		w_gcc_call_upd.sCallNumber 	= callNumber
//		w_gcc_call_upd.openMode 		= action
//		w_gcc_call_upd.colToSet 		= 1
//		w_gcc_call_upd.TriggerEvent("ue_refresh")
//		
//		if w_gcc_call_upd.st_mode.text = 'Add' then // try to modify a closed call
//			SetPointer ( arrow! )
//		else
			open(w_gcc_call_upd)
//		end if 
	else
 		SetPointer( Hourglass!)
		istr_parms.CallNumber 	= callNumber
		istr_parms.openMode 		= action
		istr_parms.colToSet 		= integer(clickedColNum)
		 
		OpenSheetWithParm( w_gcc_call_upd, istr_parms, gnv_appman.iw_frame, 0, Layered!)
//		OpenSheetWithParm( w_gcc_call_upd, action+clickedColNum+callNumber, "w_gcc_call_upd", w_main, 0, Original! )
	end if
 end if // auth for call
end if // hist type check
end event

event constructor;call super::constructor;_selection_service = 'S' 
end event

event ue_setmasks;call super::ue_setmasks;if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 
this.Object.action_dt.EditMask.Mask	= gnv_appman.is_datemask

end event

event clicked;call super::clicked;parent.event ue_reset_popups()
end event

type dw_dupcheck from uo_vzt_dwbase within w_gcc_feedback
boolean visible = false
integer x = 1669
integer y = 1476
integer width = 1065
integer height = 208
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_gcc_guest_edit_dup"
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;is_searchable[] = { & 
'guest_room_last_checkin','guest_guest_id', &
'guest_last_checkin_dt','guest_last_depart_dt','guest_last_name', &
'guest_first_name','guest_addr1', & 
'guest_addr2','guest_phone','guest_city','guest_state','guest_zip', & 
'guest_comp_name','guest_email'}

end event

type r_1 from rectangle within w_gcc_feedback
long linecolor = 8388608
integer linethickness = 4
long fillcolor = 8421504
integer x = 5
integer y = 1008
integer width = 1627
integer height = 116
end type

type pb_rebates from picturebutton within w_gcc_feedback
integer x = 581
integer y = 1540
integer width = 233
integer height = 204
integer taborder = 300
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "gcc_reb.bmp"
alignment htextalign = left!
end type

event clicked;parent.event ue_reset_popups()
if wf_gcc_selected() < 0 then return  
istr_parms.openmode 	= 'RE'
SetPointer( Hourglass!)
If IsValid( w_gcc_call_upd) then 
	MessageBox('Warning', 'Call Window already open for another guest and or task!.~r~nClose it first.', StopSign!)
END IF
OpenSheetWithParm( w_gcc_call_upd, istr_parms, gnv_appman.iw_frame, 0, Layered!)
end event

type pb_amends from picturebutton within w_gcc_feedback
integer x = 841
integer y = 1540
integer width = 233
integer height = 204
integer taborder = 280
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "gcc_amd.bmp"
alignment htextalign = left!
end type

event clicked;parent.event ue_reset_popups()
if wf_gcc_selected() < 0 then return  
istr_parms.openmode 	= 'AM'
SetPointer( Hourglass!)
If IsValid( w_gcc_call_upd) then 
	MessageBox('Warning', 'Call Window already open for another guest and or task!.~r~nClose it first.', StopSign!)
END IF
OpenSheetWithParm( w_gcc_call_upd, istr_parms, gnv_appman.iw_frame, 0, Layered!)
end event

type st_1 from statictext within w_gcc_feedback
integer x = 41
integer y = 1484
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Call Guest"
boolean focusrectangle = false
end type

type st_2 from statictext within w_gcc_feedback
integer x = 306
integer y = 1484
integer width = 238
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enter Task"
boolean focusrectangle = false
end type

type st_3 from statictext within w_gcc_feedback
integer x = 1394
integer y = 1484
integer width = 201
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Apology"
boolean focusrectangle = false
end type

type st_4 from statictext within w_gcc_feedback
integer x = 594
integer y = 1484
integer width = 201
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rebates"
boolean focusrectangle = false
end type

type st_5 from statictext within w_gcc_feedback
integer x = 859
integer y = 1484
integer width = 201
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Amends"
boolean focusrectangle = false
end type

type st_6 from statictext within w_gcc_feedback
integer x = 1093
integer y = 1484
integer width = 247
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Thank You"
boolean focusrectangle = false
end type

type dw_name_search from uo_vzt_dwbase within w_gcc_feedback
integer x = 1673
integer y = 1704
integer width = 1714
integer height = 308
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_gcc_guest_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  

is_editable[]	= { 'guest_last_name','guest_first_name' }

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}
is_searchable[]	= is_editable[]	
end event

event clicked;call super::clicked;if row <= 0 then return 
long ll_row
string ls_col1, ls_openedby

if dw_primary.RowCount() > 0 then 
	ls_openedby = dw_primary.GetItemString( dw_primary.GetRow(), 'gcc_openedby')
end if	
dw_primary.RowsDiscard(1,dw_primary.RowCOunt(), Primary!)
ll_row = dw_primary.InsertRow(0)
dw_primary.modifyedit('S')
//ll_row = dw_primary.GetRow()
if ll_row <= 0 then return 

dw_primary.setitem( ll_row, 'guest_last_name' ,  this.GetItemString( row, 'guest_last_name' ) )
dw_primary.setitem( ll_row, 'guest_first_name' , this.GetItemString( row, 'guest_first_name' ) )
dw_primary.setitem( ll_row, 'guest_middle_init', f_nvl(this.GetItemString( row, 'guest_middle_init' ),'') )
//dw_primary.setitem( ll_row, 'guest_title' ,		this.GetItemString( row, 'guest_title' ) )
//dw_primary.setitem( ll_row, 'guest_addr1' ,		this.GetItemString( row, 'guest_addr1' ) )
//dw_primary.setitem( ll_row, 'guest_addr2' ,		this.GetItemString( row, 'guest_addr2' ) )
//dw_primary.setitem( ll_row, 'guest_country' ,		this.GetItemString( row, 'guest_country' ) )
//dw_primary.setitem( ll_row, 'guest_comp_name' ,		this.GetItemString( row, 'guest_comp_name' ) )
//
dw_primary.setitem( ll_row, 'guest_city' , 		this.GetItemString( row, 'guest_city' ) )
dw_primary.setitem( ll_row, 'guest_state' , 		this.GetItemString( row, 'guest_state' ) )
dw_primary.setitem( ll_row, 'guest_zip' , 		this.GetItemString( row, 'guest_zip' ) )
//dw_primary.SetItem( ll_row, 'guest_account',		this.GetItemNumber( row, 'guest_account' ) )
//dw_primary.SetItem( ll_row, 'guest_guest_id',	this.GetItemNumber( row, 'guest_guest_id' ) )
//dw_primary.SetItem( ll_row, 'guest_guest_no',	this.GetItemNumber( row, 'guest_guest_no' ) )
cb_search.visible = true 
//return 

ib_used_lookup = true 

dw_primary.Search('')

if dw_primary.RowCount() > 0 then 
	dw_primary.ShareData(dw_mainlist)
	dw_primary.setitem( 1, 'gcc_openedby' ,  ls_openedby)
	dw_mainlist.SetRow(1)
	dw_mainlist.ScrollToRow(1)
	dw_mainlist.Selectrow(1, true)
	dw_mainlist.event ue_rowSelected(1, true)
	dw_mainlist.visible = true 

		parent.event ue_used_existing () 		
	//	gnv_appman.uf_share( dw_primary, 'guest_room_last_checkin', gnv_appman.ids_shared[1])
		dw_primary.SetColumn( "guest_room_last_checkin")

		dw_primary.POST SetFocus()
		dw_survey.visible = true 
		dw_gcc_history.visible = false 
End IF 
ib_used_lookup = false
this.visible = false

////overr
//long ll_row 
//
//ll_row = dw_primary.GetRow() 
//dwitemstatus ldws
//ldws		= dw_primary.GetItemStatus( dw_primary.GetRow() , 0, Primary!)
//If ll_row <= 0 then 
//	call super::clicked 	
//ELSE
//	If ldws = New! or ldws	= NewModified! and dw_primary.is_editmode = 'W' then // selecting on new 
//		// behave like new survey for existing guest was requested after this point
//		call super::clicked 	
//		
//		dw_primary.ModifyEdit('W')
//		parent.event ue_used_existing () 
//		gnv_appman.uf_share( dw_primary, 'guest_room_last_checkin', gnv_appman.ids_shared[1])
//		dw_primary.SetColumn( "guest_room_last_checkin")
//		dw_primary.POST SetFocus()
//		dw_survey.visible = true 
//		dw_gcc_history.visible = false 
//	Else
//		call super::clicked 	
//	End IF 
//End IF 
//
end event

type pb_web from picturebutton within w_gcc_feedback
integer x = 549
integer y = 1844
integer width = 233
integer height = 204
integer taborder = 290
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "gcc_web.bmp"
string disabledname = "gcc_web_d.bmp"
alignment htextalign = left!
end type

event clicked;int li_ret 
boolean lb_prompt

lb_prompt=false
li_ret = MessageBox('WEB Survey Group Submission', 'Sending an internet survey request for '+ &
			+ ' an existing survey ~r~n will erase it for all guests in the group.' + &
			+ ' Click "No" and then "New" for new survey.' + &
			+ '~r~n~r~nWould you like to continue?' + & 
			+ '~r~n~r~nGuests without email ids will be skipped automatically.' & 
						, question!, YesNo!, 2) 
If li_ret = 1 then 
	istr_parms.batch_do_one = dw_mainlist.GetRow() 
	parent.event ue_web_letter_all( )
END IF
//int li_ret
//li_ret = MessageBox('WEB Survey Submission', 'Sending an internet survey request for '+ &
//			+ ' an existing survey ~r~n will erase it. ' + &
//			+ ' Click "No" and then "New" for new survey.' + &
//			+ '~r~n~r~nWould you like to continue?', question!, YesNo!, 2)
//If li_ret = 1 then 
//	parent.event ue_web_letter(true)
//END IF
end event

type st_web from statictext within w_gcc_feedback
integer x = 594
integer y = 1788
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Web"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_comp from uo_vzt_company within w_gcc_feedback
integer x = 453
integer y = 328
integer height = 436
integer taborder = 130
boolean bringtotop = true
boolean border = false
long backcolor = 80269528
end type

event ue_caller_init;call super::ue_caller_init;this.idw_caller 		= dw_data
this.is_caller_col 	= 'guest_comp_name'

end event

event ue_caller_posteditchange;call super::ue_caller_posteditchange;ib_history_visible = dw_gcc_history.visible
if matchedrows > 0 then 
//	dw_gcc_history.visible = false
end if
end event

event ue_caller_postselection;if ib_history_visible then
//	dw_gcc_history.visible = ib_history_visible 
//	 dw_data.post SetColumn( 'guest_comp_name')
end if
dw_data.post SetColumn( 'guest_addr1')
dw_data.post setfocus()

end event

event ue_losefocus;call super::ue_losefocus;	this.visible = false
	if not dw_survey.visible then
		dw_gcc_history.visible = true
	end if
end event

on uo_comp.destroy
call uo_vzt_company::destroy
end on

type gb_00 from groupbox within w_gcc_feedback
integer x = 5
integer y = 1456
integer width = 1637
integer height = 324
integer taborder = 80
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_websearch from commandbutton within w_gcc_feedback
boolean visible = false
integer x = 329
integer y = 1032
integer width = 128
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&WS"
end type

event clicked;this.visible = false
cb_search.visible = false
ib_searchinprogress = true  
if is_accessflags = '' THEN return 
cb_newsearch.show()
//parent.event ue_search() 

string ls_web_ff
//ls_web_ff = " AND gcc.gccid in ( SELECT qa.headerid " + &
//				" FROM qgen_qset_answers qa " + &
//				" WHERE qa.freeform <> '' " + &
//				" AND ( qa.ddvalue  = '' or qa.ddvalue  IS NULL )) " 
//				// web drop down not filled
//
//ls_web_ff = " AND gcc.ansdate > vzt_getdate() - 7 AND gcc.gccid in " + &
//				" ( SELECT convert(double, qa.headerid ) " + &
//				" FROM qgen_qset_answers qa " + &
//				" WHERE qa.ansdate > vzt_getdate() - 7 AND qa.freeform <> '' " + &
//				" ) " 
//
ls_web_ff = " AND gcc.webfilled = 'Y' AND gcc.gccid in " + &
				" ( SELECT convert(double, qa.headerid ) " + &
				" FROM qgen_qset_answers qa " + &
				" WHERE qa.freeform <> '' " + &
				" ) " // web filled with a freeform

dw_data.search( ls_web_ff ) //- put in the descendant 
dw_primary.RefreshDataObject() 

iw_mywindow.POST Event ue_postsearch()

ib_web_request = false
end event

type uo_room from uo_vzt_room within w_gcc_feedback
integer x = 334
integer y = 80
integer taborder = 140
boolean bringtotop = true
long backcolor = 80269528
end type

on uo_room.destroy
call uo_vzt_room::destroy
end on

event ue_caller_init;call super::ue_caller_init;// copy and update in descendant
this.idw_caller 		= dw_data
this.is_caller_col 	= 'gcc_room'

end event

event ue_losefocus;call super::ue_losefocus;	this.visible = false
	if not dw_survey.visible then
		dw_gcc_history.visible = true
	end if
end event

event ue_caller_posteditchange;call super::ue_caller_posteditchange;ib_history_visible = dw_gcc_history.visible
if matchedrows > 0 then 
//	dw_gcc_history.visible = false
end if
end event

event ue_caller_postselection;if ib_history_visible then
//	dw_gcc_history.visible = ib_history_visible 
//	 dw_data.post SetColumn( 'guest_comp_name')
end if
dw_data.post SetColumn( 'guest_guest_id')
dw_data.post setfocus()

end event

type uo_prefix from uo_vzt_prefix within w_gcc_feedback
integer x = 37
integer y = 244
integer taborder = 160
boolean bringtotop = true
long backcolor = 80269528
end type

on uo_prefix.destroy
call uo_vzt_prefix::destroy
end on

event ue_caller_posteditchange;call super::ue_caller_posteditchange;ib_history_visible = dw_gcc_history.visible
if matchedrows > 0 then 
//	dw_gcc_history.visible = false
end if
end event

event ue_caller_init;call super::ue_caller_init;// copy and update in descendant
this.idw_caller 		= dw_data
this.is_caller_col 	= 'guest_prefix'

end event

event ue_caller_postselection;if ib_history_visible then
//	dw_gcc_history.visible = ib_history_visible 
//	 dw_data.post SetColumn( 'guest_comp_name')
end if
dw_data.post SetColumn( 'guest_last_name')
dw_data.post setfocus()

end event

type uo_state from uo_vzt_state within w_gcc_feedback
integer x = 1015
integer y = 560
integer taborder = 150
boolean bringtotop = true
long backcolor = 80269528
end type

on uo_state.destroy
call uo_vzt_state::destroy
end on

event ue_caller_init;call super::ue_caller_init;// copy and update in descendant
this.idw_caller 		= dw_data
this.is_caller_col 	= 'guest_state'

end event

event ue_caller_posteditchange;call super::ue_caller_posteditchange;ib_history_visible = dw_gcc_history.visible
if matchedrows > 0 then 
//	dw_gcc_history.visible = false
end if
end event

event ue_caller_postselection;if ib_history_visible then
//	dw_gcc_history.visible = ib_history_visible 
//	 dw_data.post SetColumn( 'guest_comp_name')
end if
dw_data.post SetColumn( 'guest_zip')
dw_data.post setfocus()

end event

type pb_web_all from picturebutton within w_gcc_feedback
integer x = 864
integer y = 1844
integer width = 233
integer height = 204
integer taborder = 290
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "gcc_web.bmp"
string disabledname = "gcc_web_d.bmp"
alignment htextalign = left!
end type

event clicked;int li_ret 
boolean lb_prompt

lb_prompt=false
li_ret = MessageBox('WEB Survey Group Submission', 'Sending an internet survey request '+ &
			+ '~r~nwill create survey entries for all clients in the current selection.' + &
			+ ' 	' + &
			+ '~r~n~r~nWould you like to continue?' + & 
			+ '~r~n~r~nGuests without email ids will be skipped automatically.' & 
						, question!, YesNo!, 2) 
If li_ret = 1 then 
	parent.event ue_guest_web_filter()
	istr_parms.batch_do_one 	= 0
	istr_parms.batch_new_gcc 	= 1
	parent.event ue_web_letter_all( )
END IF
end event

type st_web_all from statictext within w_gcc_feedback
integer x = 873
integer y = 1788
integer width = 219
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Web All"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_filled from checkbox within w_gcc_feedback
integer x = 951
integer y = 1036
integer width = 78
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 8421504
end type

type st_7 from statictext within w_gcc_feedback
integer x = 1015
integer y = 1044
integer width = 128
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 8421504
string text = "filled"
boolean focusrectangle = false
end type

type cb_reset from commandbutton within w_gcc_feedback
boolean visible = false
integer x = 1129
integer y = 1032
integer width = 160
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset"
end type

event clicked;inv_qgen.event ue_create_qset (id_surveyid, dw_survey)
end event

type dw_hourglass from datawindow within w_gcc_feedback
boolean visible = false
integer x = 1106
integer y = 452
integer width = 1157
integer height = 504
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_web_survey_wait_prepare"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

