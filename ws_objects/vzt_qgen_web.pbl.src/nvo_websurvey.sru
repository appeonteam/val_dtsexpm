$PBExportHeader$nvo_websurvey.sru
forward
global type nvo_websurvey from nonvisualobject
end type
end forward

global type nvo_websurvey from nonvisualobject
event type integer ue_web_init ( )
event type string ue_web_create_url ( )
event type integer ue_web_check ( boolean ab_message )
event type integer ue_web_copy ( string as_webkey,  string as_webfilled,  double ad_cardid,  ref transaction a_tran,  string as_dataobject )
event type string ue_ed_create_survey ( integer ai_sessionid,  ref datawindow adw_distlist,  double ad_qsetid,  boolean ab_print,  boolean ab_email )
event type integer ue_ed_create_class_survey ( integer ai_sessionid,  ref datawindow adw_distlist )
event type integer ue_web_db_prepare ( )
event type string ue_get_url ( double ad_qsetid,  ref string as_rand )
event type integer ue_web_copy_card ( string as_webkey,  string as_webfilled,  double ad_cardid,  ref transaction a_tran )
event type integer ue_web_copy_all ( ref transaction a_tran )
event ue_web_tran ( )
event ue_web_survey_auto ( ref uo_vzt_dwbase adw_pending_guests )
event ue_web_gcc_from_guest ( datawindow adw_pending_guests,  integer adconfid,  integer ai_surveyid )
event type integer ue_web_letter_all_next ( str_dts_call a_parms )
event ue_web_open ( )
event ue_prepare_email ( )
event ue_emailletter ( )
event ue_replace_tags_batch ( string as_prefix,  string as_lname,  string as_url )
end type
global nvo_websurvey nvo_websurvey

type variables
string   		is_url, is_link, is_propid, is_dparm, is_web_default
string   		is_webkeylen, is_router, is_webkey
boolean			ib_webdb, 		ib_HTTP 
n_cst_dbcopy  	inv_dbcopy 

double			id_surveyid,  id_gcc,  id_guest_account

str_dts_call		istr_parms
str_web_confirm	istr_webparms

n_cst_vzt_tran	i_web_tran
datastore 		ids_headers
datawindow		idw_pending_guests

string 			is_live_trace,		is_mailtext, is_mail_subj, is_orig_text, is_email, is_prefix
string			is_lname, is_survey_descr

nvo_qgen			inv_qgen

long												il_web_batch_row
//window 											iw_letter

end variables

forward prototypes
public function integer of_check_http ()
end prototypes

event type integer ue_web_init();string ls_1, ls_2, ls_num=''
int  li_len, li_char, li_num , li_gcc

SELECT option10 , option11, option12, option14 , option18,option20
INTO 	:is_url, :is_propid, :is_dparm, :is_web_default , :is_webkeylen, :is_router
from vzt_sysoptions where id = 1;

of_check_http ()

this.event ue_web_open ()

return 1
end event

event ue_web_check;		If trim(is_dparm ) ='' or IsNULL(is_dparm ) then 
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

event ue_web_copy;int 			li_ret 
datetime		ldt_ansdate

	IF ib_webdb then // use web db if necessary 
		IF len(as_webkey) > 0 and as_webfilled <> 'Y' then
			// First check other db if webfilled 

			SELECT webfilled, ansdate INTO :as_webfilled, :ldt_ansdate 
			FROM gcc WHERE gccid = :ad_cardid
			USING a_tran;

			IF as_webfilled = 'Y' then // need to copy to main db 
//				 ------------------------------------------------------------------------
			// update 1 card in main db + answers in webdb - do first to lock table
				UPDATE gcc SET webfilled = 'Y', ansdate = :ldt_ansdate 
				WHERE gccid = :ad_cardid USING SQLCA; 
				If SQLCA.sqlcode <> 0 then 
					ROLLBACK USING SQLCA;
					return -5
				END IF
				
				UPDATE qgen_qset_answers SET headerid = (-1) * headerid 
				WHERE headerid = :ad_cardid USING a_tran;
				If a_tran.sqlcode <> 0 then
					ROLLBACK USING a_tran;
					return -7
				END IF
				
				If not IsValid( inv_dbcopy ) then inv_dbcopy = CREATE n_cst_dbcopy 
				inv_dbcopy.of_init( as_dataobject, a_tran, SQLCA) // do, tran_from, tran_to
				inv_dbcopy.ids_data.Retrieve (ad_cardid)
				li_ret = inv_dbcopy.of_copy(true) // commit on to_tran 
				If li_ret >=0 then li_ret = f_end_tran0( a_tran, 'Final Web Answers Reset' , '', 'Flag update failed')
				If li_ret < 0 then return -10
		//	 ------------------------------------------------------------------------
			ELSE
			END IF
		END IF // web key len
	ELSE // not web db
	END IF
	IF len(is_webkey) > 0 and as_webfilled <> 'Y' then
		li_ret = MessageBox('WEB Survey', "Internet survey request has been sent, but is not filled out. ~r~n" &
				+"Would you like to edit it anyway?", Question!, YesNo!, 2)
		If li_ret = 2 then return -20
	END IF

return 1 // either no webdb or copied web answers successfully
end event

event ue_ed_create_survey;// get survey info 

	string 	ls_url, ls_rand, ls_code, ls_message, ls_email
	double	ld_qsetid, ld_guest_account, ld_gcc 
	long 		li_rc, ll_ret, ll_row, ll_studentid
	datetime	ld_date	
	
	ll_row = adw_distlist.GetRow()
	if ll_row <= 0 then return ''
	
	ll_studentid 	= adw_distlist.GetItemNumber( ll_row , 'vzt_person_id' )
	ls_email			= adw_distlist.GetItemString( ll_row , 'email' )
	
	If ad_qsetid <= 0 then 
		ld_qsetid 	= f_qgen_get_survey(0)
		ab_print 	= false // default to web
		If ld_qsetid > 0 then ab_print = true
		ld_qsetid 	= ABS( ld_qsetid )
	ELSE
		ld_qsetid = ad_qsetid 
	END IF
	
	if ld_qsetid <= 0 then return ''
	istr_parms.id = ld_qsetid

	ld_date = f_sysdate()

	// check if gcc record already created 
	SELECT gccid INTO :ld_gcc FROM gcc WHERE  
		reference_id 	= :ai_sessionid AND  
		guest_account 	= :ll_studentid AND 
		surveyid			= :ld_qsetid
	;
  
  If ld_gcc <= 0  or IsNull( ld_gcc) then 
		INSERT INTO GCC(reference_id,guest_account,ansdate, surveyid) 
 		values( :ai_sessionid,:ll_studentid,:ld_date,:ld_qsetid) ;

		If f_check_tran( SQLCA, li_rc, ls_code, ls_message, -5) > 0 then	
			SELECT gccid INTO :ld_gcc FROM gcc WHERE  
			reference_id 	= :ai_sessionid AND  
			guest_account 	= :ll_studentid AND 
			ansdate			= :ld_date AND 
			surveyid			= :ld_qsetid
			;
		END IF;
	END IF;

		ll_ret = this.event ue_web_check(true) //check with messages
		if ll_ret < 0 then return ''
		
		ls_url = this.event ue_get_url( ld_qsetid, ls_rand) // gets rand back
		
		// ------------------------------------------------------------------------------
		// Prepare and clean up for web data entry 
		// ------------------------------------------------------------------------------
		UPDATE gcc SET webkey = :ls_rand , webfilled = 'N', surveyid = :ld_qsetid 
		WHERE gccid = :ld_gcc USING SQLCA;
			
		If f_check_tran( SQLCA, li_rc, ls_code, ls_message, -10) > 0 then	
			DELETE FROM qgen_qset_answers WHERE headerid = :ld_gcc USING SQLCA;
		END IF;

		If f_check_tran( SQLCA, li_rc, ls_code, ls_message, -15) > 0 then	
			IF ib_webdb then // use web db if necessary 
				DELETE FROM gcc WHERE gccid = :ld_gcc USING i_web_tran;
				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -100) > 0 then	
					INSERT INTO gcc ( gccid, guest_account, ansdate, webkey, webfilled, surveyid  ) 
					VALUES ( :ld_gcc, :ll_studentid, :ld_date, :ls_rand, 'N', :ld_qsetid) USING i_web_tran;
				END IF
				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -105) > 0 then	
					DELETE FROM guest WHERE account = :ld_guest_account USING i_web_tran;
				END IF
				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -110) > 0 then	
					// Refresh guest info in the webdb as well
					string	ls_fname, ls_lname, ls_mi, ls_prefix, ls_comp_name

					ls_fname 		= adw_distlist.GetItemString( ll_row, 'first_name')
					ls_lname 		= adw_distlist.GetItemString( ll_row, 'last_name')
					ls_mi				= adw_distlist.GetItemString( ll_row, 'middle_init')
					ls_prefix 		= adw_distlist.GetItemString( ll_row, 'prefix')
					ls_comp_name	= adw_distlist.GetItemString( ll_row, 'comp_name')

					INSERT INTO guest ( account, first_name, last_name, middle_init, prefix, comp_name ) 
					VALUES ( :ld_guest_account , :ls_fname, :ls_lname, :ls_mi, :ls_prefix, :ls_comp_name) USING i_web_tran;
				END IF

				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -115) > 0 then	
					DELETE FROM qgen_qset_answers WHERE headerid = :ld_gcc USING i_web_tran;
				END IF
				f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -125) 
				f_end_tran (i_web_tran, li_rc , 'GCC Web Survey Request (webdb)', '','Failed to update GCC entry with web key data.'+'~r~n~r~nSQLCA Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )
		
			END IF
		END IF 
		
		f_end_tran (SQLCA, li_rc , 'GCC Web Survey Request', '','Failed to update GCC entry with web key data.'+'~r~n~r~nSQLCA Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )

		If ab_email then 				// for individual surveys 
			istr_parms.gcc_url		= ls_url 
			istr_parms.url [1]		= ls_url 
			istr_parms.dw_distribution = adw_distlist
			window ldw_sheet
			OpenSheetWithParm( ldw_sheet, istr_parms, 'w_vzt_letter_websurvey', gnv_appman.iw_frame, 0, Layered!)
		END IF

return ls_url
end event

event ue_ed_create_class_survey;	double	ld_qsetid, ld_guest_account, ld_gcc 
	long 		li_rc, ll_ret, ll_row, ll_student_row
	datetime	ld_date	
	boolean	lb_print
	string	ls_url[]
	
	ll_row = adw_distlist.RowCount()
	if ll_row <= 0 then return 1

	istr_parms.gcc_url			= '' // ls_url 
	istr_parms.guestemail		= ''
	istr_parms.dw_distribution = adw_distlist
	
	ld_qsetid 	= f_qgen_get_survey(0)  // 1=no option specified 
	lb_print 	= false // default to web
	If ld_qsetid > 0 then lb_print = true
	ld_qsetid 	= ABS( ld_qsetid )
	
	if ld_qsetid <= 0 then return 1 
	istr_parms.id = ld_qsetid

	setpointer(Hourglass!)
	FOR ll_student_row = 1 to ll_row
		adw_distlist.setrow( ll_student_row ) 
		ls_url[ll_student_row] = this.event ue_ed_create_survey( ai_sessionid, adw_distlist, ld_qsetid, lb_print, false) 
	NEXT 
	istr_parms.url = ls_url [] 
	window ldw_sheet
	OpenSheetWithParm( ldw_sheet, istr_parms, 'w_vzt_letter_websurvey', gnv_appman.iw_frame, 0, Layered!)
	
	return 1
end event

event type integer ue_web_db_prepare();if idw_pending_guests.RowCount() <= 0 or idw_pending_guests.Getrow() <= 0 then return -1

		string 	ls_rand, ls_code, ls_message, ls_success
		double	ld_idgcc_neg
		long 		li_rc, ll_ret, ll_row
		
		ll_row	= idw_pending_guests.Getrow() 
		
		if id_surveyid <= 0 then return -1
			
		ls_rand = f_random_string(10) 
		If POS( is_url, '160.79.255.6' ) <=0 and POS( is_url, 'localhost' ) <=0 and POS( is_url, 'vzpoll') <= 0 then
			MessageBox('Web Commentator error', 'Invalid URL Specified. Please call Support.', StopSign! )
		END IF
		is_link = is_url + "qgen1.asp?k=" +ls_rand+"&p=1"+"&q="+ string (id_surveyid ) +"&d=" + is_dparm
		
		if gnv_appman.is_debugmode = 'Y' then 
			Clipboard( is_link ) 
			MessageBox('GCC URL (copied to clipboard)', is_link )
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
		UPDATE gcc SET webkey = :ls_rand , webfilled = 'N', surveyid = :id_surveyid WHERE gccid = :id_gcc USING SQLCA;
		// ------------------------------------------------------------------------------
		if gnv_appman.is_debugmode = 'Y' then 
			MessageBox('updated local gcc', 'code='+ string(SQLCA.sqlcode) + ', err='+ string(f_nvl(SQLCA.sqlerrtext,'')) )
		end if
		
		If f_check_tran( SQLCA, li_rc, ls_code, ls_message, -10) > 0 then	
			DELETE FROM qgen_qset_answers WHERE headerid = :id_gcc USING SQLCA;
//			dw_hourglass.SetItem( il_hglass_row, 'x', 'Cleaning local answers (if any) ...')
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

				// ======================================================================================
				//  Get guest info for webdb and HTTP updates 
				// ======================================================================================
				string	ls_fname, ls_lname, ls_mi, ls_prefix, ls_comp_name

				ls_fname 		= idw_pending_guests.GetItemString( ll_row, 'guest_first_name')
				ls_lname 		= idw_pending_guests.GetItemString( ll_row, 'guest_last_name')
				ls_mi				= idw_pending_guests.GetItemString( ll_row, 'guest_middle_init')
				ls_prefix 		= idw_pending_guests.GetItemString( ll_row, 'guest_prefix')
				ls_comp_name	= idw_pending_guests.GetItemString( ll_row, 'guest_comp_name')

			  If ib_HTTP then // update webdb via HTTP
				// ======================================================================================
				//  HTTP
				// ======================================================================================
//				dw_hourglass.SetItem( il_hglass_row, 'x', 'Starting HTTP remote db link ...')

				string 	ls_http_return, ls_http_url, ls_http_args
				integer 	li_ret 
				
				ls_http_url 	= is_url + "qgen_prepweb.asp"

				ls_http_args  += "d=" 		+ f_nvl(is_dparm,'')
				ls_http_args  += "&w=" 		+ f_nvl(ls_rand,'')
				ls_http_args  += "&gcc=" 	+ f_nvl(string(id_gcc),'0000')  
				ls_http_args  += "&qs=" 	+ f_nvl(string(id_surveyid),'0000')
				ls_http_args  += "&ga=" 	+ f_nvl(string(id_guest_account),'0000') 
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
//					dw_hourglass.visible = false
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
//				dw_hourglass.SetItem( il_hglass_row, 'x', 'Starting direct remote db link ...')
				DELETE FROM gcc WHERE gccid IN ( :id_gcc, :ld_idgcc_neg) USING i_web_tran;
				
				if gnv_appman.is_debugmode = 'Y' then 
					MessageBox('deleted remote gcc', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) )
				end if

				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -100) > 0 then	
					INSERT INTO gcc ( gccid, guest_account, ansdate, webkey, webfilled, surveyid  ) 
					VALUES ( :id_gcc, :id_guest_account, vzt_getdate(), :ls_rand, 'N', :id_surveyid) USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('inserted remote gcc', 'code='+ string(i_web_tran.sqlcode) + 'err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						+'~r~n' + 'gcc='+ string(id_gcc)  & 
						+'~r~n' + 'guest='+ string(id_guest_account)  & 
						+'~r~n' + 'qset='+ string(id_surveyid)  & 
						)
					end if
				END IF

				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -105) > 0 then	
					DELETE FROM guest WHERE account = :id_guest_account USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('deleted remote guest', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						+'~r~n' + 'guest='+ string(id_guest_account)  & 
						)
					end if
				END IF
				If f_check_tran( i_web_tran, li_rc, ls_code, ls_message, -110) > 0 then	
					// Refresh guest info in the webdb as well
				
					INSERT INTO guest ( account, first_name, last_name, middle_init, prefix, comp_name ) 
					VALUES ( :id_guest_account , :ls_fname, :ls_lname, :ls_mi, :ls_prefix, :ls_comp_name) USING i_web_tran;
					if gnv_appman.is_debugmode = 'Y' then 
						MessageBox('inserted remote guest', 'code='+ string(i_web_tran.sqlcode) + ', err='+string(f_nvl(i_web_tran.sqlerrtext,'')) &
						+'~r~n' + 'guest='+ string(id_guest_account)  & 
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
//		dw_hourglass.SetItem( il_hglass_row, 'x', 'Finished remote db link ...')
		
		f_end_tran (SQLCA, li_rc , 'GCC Web Survey Request', ls_success,'Failed to update local GCC entry with web key data.'+'~r~n~r~nSQLCA Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )

//		dw_hourglass.visible = false
//		dw_hourglass.reset()
		return 1
	

end event

event ue_get_url;string 	ls_url
int  		li_webkeylen 

li_webkeylen = 30
if IsNumber(is_webkeylen ) then li_webkeylen = integer(is_webkeylen )
		
as_rand = f_random_string(li_webkeylen)
ls_url = is_url + "qgen_gcc01.asp?webkey=" + as_rand + "&propid="+ is_propid + "&qsetid="+ string	(ad_qsetid) +"&dparm=" + is_dparm

if gnv_appman.is_debugmode = 'Y' then 
	Clipboard( ls_url ) 
	MessageBox('GCC URL (copied to clipboard)', ls_url )
end if
		
return ls_url
end event

event ue_web_copy_card;return this.event ue_web_copy ( as_webkey,as_webfilled,ad_cardid,a_tran,'d_answers_list')
end event

event type integer ue_web_copy_all(ref transaction a_tran);int 			li_ret 
datetime		ldt_ansdate
datastore 	lds_headers
long			ll_hrow, ll_max_headers, ll_ret
double		ld_cardid 
string		ls_error, ls_http_data, ls_retcode
string 		ls_http_return, ls_http_url, ls_http_args
				
if not ib_webdb then return -2 
//============================================================================
// Get all not copied headers (card ids) from web db
//============================================================================
	lds_headers = CREATE datastore 
	lds_headers.dataobject = 'd_answers_headers_list_all'
	
	If ib_HTTP then 
		gnv_appman.is_debugmode = this.is_live_trace 
		//============================================================================
		// Use HTTP to copy new headers 
		//============================================================================
//		inv_dbcopy.of_init_http( 'd_answers_headers_list_all', SQLCA, is_url+"qgen_getwebheaders.asp",is_dparm, '') // do, tran_from, tran_to
//		li_ret = inv_dbcopy.of_copy_http (false) // copy data but don't save or commit 
		ls_http_url 	= is_url + "qgen_getwebsurveys.asp"
		ls_http_args 	= 'd='+is_dparm + '&action=headers'
		ll_ret 			= f_vzt_html_retrieve( ls_http_url, ls_http_args, lds_headers )  
		if ll_ret < 0 then // write trace 
		ELSE
			ll_max_headers = lds_headers.RowCount()
		end if 
	ELSE 
		//============================================================================
		// Use webdb connection to copy new  headers 
		//============================================================================
		lds_headers.SetTransObject( a_tran) 
		ll_max_headers = lds_headers.Retrieve() 
	END IF 
		
	If ll_max_headers <= 0 then 
		If gnv_appman.is_debugmode = 'Y' then 
			MessageBox('ue_Web copy','No new surveys found on remote db')
		END IF
		return -8 
	END IF
	
//============================================================================
// For all new headers (card ids) from web db - sync local db 
//============================================================================
	
	FOR ll_hrow = 1 TO ll_max_headers 
		ld_cardid 	= lds_headers.GetItemNumber( ll_hrow, 'headerid') 
		ldt_ansdate = lds_headers.GetItemDatetime( ll_hrow, 'ansdate') 
		// ------------------------------------------------------------
		// Clear old answers for cards being imported 
		// ------------------------------------------------------------
		DELETE FROM qgen_qset_answers WHERE headerid = :ld_cardid USING SQLCA;

		If SQLCA.sqlcode <> 0 then 
			ls_error = SQLCA.sqlerrtext
			ROLLBACK USING SQLCA;
			If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('ue_Web copy','Delete local qgen_answers Error.~r~n'+ ls_error )
			END IF
			return -4
		END IF
		
		If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('ue_Web copy','Deleted qgen_answers for gccid:'+string(ld_cardid) )
		END IF

		// ------------------------------------------------------------
		// Update webfilled ind on all related entries 
		// ------------------------------------------------------------
		UPDATE gcc SET webfilled = 'Y', ansdate = :ldt_ansdate 
		WHERE gccid = :ld_cardid USING SQLCA; 
		
		If SQLCA.sqlcode <> 0 then 
			ls_error = SQLCA.sqlerrtext
			ROLLBACK USING SQLCA;
			If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('Web copy','Failed Update of local webfilled flag for gccid:'+string(ld_cardid)+'~r~n'+ ls_error ) 
			END IF
			return -5
		ELSE
			If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('Web copy','Updated local webfilled flag for gccid:'+string(ld_cardid) )
			END IF
		END IF
	NEXT 
				
	If not IsValid( inv_dbcopy ) then inv_dbcopy = CREATE n_cst_dbcopy 

	If ib_HTTP then 
		//============================================================================
		// Use HTTP to copy ALL new details (answers)
		//============================================================================
		ls_http_url 	= is_url + "qgen_getwebsurveys.asp"
		ls_http_args 	= 'd='+is_dparm + '&action=details'
		inv_dbcopy.of_init_http( 'd_answers_list_all', SQLCA, is_url+"qgen_getwebsurveys.asp") //is_dparm, is_webkey // do, tran_from, tran_to
		li_ret = inv_dbcopy.of_copy_http (ls_http_args, false) // copy but no commit 
		//============================================================================
		// Use HTTP to mark all remote answers copied
		//============================================================================
		if li_ret > 0 then
			ls_http_url 	= is_url + "qgen_getwebsurveys.asp"
			ls_http_args 	= 'd='+is_dparm + '&action=reset'
			ls_http_return = f_vzt_html_get_data( ls_http_url, ls_http_args )  
		ELSE
			ROLLBACK USING SQLCA;
			If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('Web copy HTTP','HTTP Details copy failed.~r~n'+ ls_error)
			END IF 
			return -7

		END IF
	ELSE 
		//============================================================================
		// Use db conn to copy new details (answers)
		//============================================================================
		inv_dbcopy.of_init( 'd_answers_list_all', a_tran, SQLCA) // do, tran_from, tran_to
		inv_dbcopy.ids_data.Retrieve ()
		//============================================================================
		// Mark all answers copied using dbconn , to lock table but dont commit yet ...
		//============================================================================
		SELECT VZT_WEB_SYNC_END() INTO :ls_retcode FROM Dummy USING a_tran;
		
//		DELETE qgen_qset_answers WHERE headerid < 0 and headerid IN 
//		(SELECT DISTINCT (-1) * headerid FROM qgen_qset_answers where headerid > 0 )
//		USING a_tran; 
//
//		UPDATE qgen_qset_answers SET headerid = (-1) * headerid WHERE headerid > 0 USING a_tran; 
//	
		If a_tran.sqlcode <> 0 then
			ls_error = a_tran.sqlerrtext
			ROLLBACK USING a_tran;
			If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('Web copy','Update on remote (-1) * headerid failed.~r~n'+ ls_error)
			END IF 
			return -7
		ELSE
			If gnv_appman.is_debugmode = 'Y' then 
				MessageBox('Web copy','Update on remote (SYNC_END) successful.' )
			END IF 
		END IF

		//============================================================================
		// Use db conn to copy new details (answers)
		//============================================================================
		li_ret = inv_dbcopy.of_copy(true) // commit on to_tran - copied answers (details) 
	END IF // HTTP check
		
	string ls_okmsg=''
	If gnv_appman.is_debugmode = 'Y' then ls_okmsg = 'Flag (-1) update successful'
//	If li_ret >=0 then li_ret = f_end_tran0( a_tran, 'Final Web Answers Reset' , '', 'Flag update failed')
	If li_ret >=0 then li_ret = f_end_tran0( SQLCA, 'Final Web Copy Commit' , ls_okmsg, 'Flag update failed')
	If li_ret < 0 then return -10
	
	If IsValid( ids_headers ) then destroy ids_headers 
	If IsValid( inv_dbcopy ) then DESTROY 	inv_dbcopy 

return 1 // either no webdb or copied web answers successfully
end event

event ue_web_tran();string ls_dparm
SELECT  option12 INTO  :ls_dparm from vzt_sysoptions where id = 1;
//--------------------------------------------------------------------

//ab_webdb = false // default: same db for web 
if POS ( lower(SQLCA.dbparm), lower( 'dsn='+ ls_dparm) ) > 0 then return // same db

of_check_http ()
If ib_HTTP then return // no need to connect if by HTTP

ib_webdb = true // different db for web entry 
i_web_tran = CREATE transaction

i_web_tran.dbms  	= 'ODBC'
i_web_tran.dbparm = "Connectstring='DSN="+ ls_dparm+";uid=dba;pwd=sql'"

CONNECT USING i_web_tran;

IF i_web_tran.SQLCode <> 0 THEN 
	MessageBox( "Connect Error", "A connection to the web database (" + ls_dparm + &
				  " ) failed. ~r~n~r~nError Text:"+ i_web_tran.sqlerrtext ,StopSign!)

END IF

If gnv_appman.is_debugmode = 'Y' then 
	MessageBox( "WEB DB Connect info", "(" + ls_dparm )
END IF

end event

event ue_web_survey_auto(ref uo_vzt_dwbase adw_pending_guests);long 		ll_maxrows
boolean 	lb_switch
dwobject		ldwo
double ldConfID

ll_maxrows 	= adw_pending_guests.RowCount() 
If ll_maxrows 	<= 0 then return 

this.event ue_web_init ()

gnv_appman.istr_response.num1 = 0 //confid
idw_pending_guests	= adw_pending_guests
ldConfID  	= 0
gnv_appman.istr_response.num1 = 0

// Get the template text and the subject
SELECT subject, longdesc INTO :is_mail_subj, :is_orig_text 
FROM ole WHERE id = 'Default Web Survey Request';

SELECT ISNULL(web_survey_default,0) INTO :id_surveyid FROM "DBA"."vzt_sysoptions"  WHERE id = 1 ;

If id_surveyid	= 0 then
	SELECT MAX( qsetid) INTO :id_surveyid FROM "DBA"."qgen_qset" WHERE active = 'Y'  	;
END IF

SELECT descr INTO :is_survey_descr FROM qgen_qset WHERE qsetid = :id_surveyid;

//=======================================================================================
FOR il_web_batch_row = 1 to ll_maxrows 	
	id_gcc		= adw_pending_guests.GetItemNumber(il_web_batch_row, 'gcc_gccid' )
	is_mailtext	= is_orig_text 
	is_lname 	= f_nvl(idw_pending_guests.GetItemString( il_web_batch_row, "guest_last_name"), '') 
	is_prefix	= f_nvl(idw_pending_guests.GetItemString( il_web_batch_row, "guest_prefix"), '') 
	is_email		= trim(f_nvl(idw_pending_guests.GetItemString( il_web_batch_row, "guest_email"), '')) 
	id_guest_account = idw_pending_guests.GetItemNumber( 	il_web_batch_row, 'guest_account')
	
	this.event ue_web_db_prepare () 
	this.event ue_prepare_email () 

   UPDATE guest SET survey_pending = 'N' where account = :id_guest_account;
	commit;
	
NEXT 	

end event

event ue_web_gcc_from_guest(datawindow adw_pending_guests, integer adconfid, integer ai_surveyid);double ld_gccid, ld_guestid 

long ll_row, ll_maxrows, ll_start

if istr_parms.batch_do_one > 0 then 
	ll_start 	= istr_parms.batch_do_one 
	ll_maxrows 	= ll_start 
else	
	ll_maxrows 	= adw_pending_guests.RowCOunt() 
	ll_start 	= 1
end if
//========================================================
//Create new gcc records for all rows in the current list  
//========================================================
FOR ll_row = ll_start to ll_maxrows
	ld_gccid = f_nvl(adw_pending_guests.GetItemNUmber(ll_row , 'gcc_gccid'),0)
	if ld_gccid = 0 or istr_parms.batch_new_gcc 	= 1 then 
		ld_guestid = f_nvl(adw_pending_guests.GetItemNUmber(ll_row , 'guest_account'),0)
		
		SELECT vzt_hew_gcc_from_guest(0, :ld_guestid, :ai_surveyid, :adConfID) 
		into :ld_gccid from dummy USING SQLCA ; 
		
		f_end_tran0( SQLCA, 'Auto Comment Card Save' , '', 'Save failed')
		adw_pending_guests.SetItem(ll_row , 'gcc_gccid', ld_gccid )	
		adw_pending_guests.ResetUpdate()
	end if	
NEXT	
end event

event type integer ue_web_letter_all_next(str_dts_call a_parms);// process rows 2 and up for the web survey
// called from the letter window !!!!!!!!!!!!!!!!!!!!!
long 			ll_maxrows
dwobject		ldwo
int			li_ret

ll_maxrows 	= idw_pending_guests.RowCount() 
If ll_maxrows 	<= 0 then return -1

setNull(ldwo)

if istr_parms.batch_do_one > 0 then
	il_web_batch_row = istr_parms.batch_do_one 
 ELSE
	il_web_batch_row ++ 
END IF

If il_web_batch_row > ll_maxrows then return -1// no more guests

idw_pending_guests.Event clicked( 10, 10, il_web_batch_row, ldwo) 
id_surveyid	= istr_parms.id  
istr_parms.gccid	= idw_pending_guests.GetItemNumber(il_web_batch_row, 'gcc_gccid' )

li_ret = this.event ue_web_db_prepare () 
a_parms = istr_parms

return li_ret

end event

event ue_web_open();long ll_web, ll_tranx
string  ls_ret

ib_http = false 

//ll_web = this.event ue_web_check(false)

ll_tranx = UpperBound( gnv_appman.i_tran[]) + 1 
gnv_appman.i_tran[ll_tranx ] = CREATE n_cst_vzt_tran //TRANSACTION
i_web_tran = gnv_appman.i_tran[ll_tranx ] 
ls_ret = inv_qgen.event ue_web_tran( ib_webdb, is_dparm, i_web_tran)
if ls_ret = 'HTTP' then ib_http = true // is_dparm has the remote asp dparm

end event

event ue_prepare_email();
this.event 	ue_replace_tags_batch ( is_prefix, is_lname, is_url )

If is_email <> '' then 
	this.event ue_emailletter()
END IF


end event

event ue_emailletter();int li_ret
if len(is_email) > 0 then 
	string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]

	ls_mailtoname[1]	= is_lname
	ls_mailtoid[1]		= is_email
	
	li_ret = gnv_appman.inv_mail.uf_mail_logon() 
	
	if gnv_appman.inv_mail.uf_mail_send_no_logon( is_mail_subj, is_mailtext, ls_mailtoname[], &
				ls_mailtoid[], ls_attachfile[]) > 0 then 
	End IF
	
End If

end event

event ue_replace_tags_batch(string as_prefix, string as_lname, string as_url);	long ll_pos , ll_namepos 
	string ls_br = 'browser)', ls_nametag= ':NAME:' 
	string ls_urltag = ':URL:' 
	string ls_url , ls_name

	ls_name = trim(f_nvl( as_prefix, '')) 
	if ls_name = '' then ls_name = 'Mr./Ms. '
	ls_name = ls_name +' '+ trim(f_nvl(as_lname, '')) //+', ~r~n~r~n'
	ls_name = trim(ls_name )
	
	ll_namepos = POS ( is_mailtext, ls_nametag )
	
	If ll_namepos > 0 then 
		f_replace( is_mailtext, ls_nametag, ls_name) 
	ELSE
		// do not relace the name if no tag 
		is_mailtext = ls_name + is_mailtext // if no tag - append to beginning 
	END IF

//	ls_url = '~r~n~r~n' + as_url + '~r~n'
	ls_url = as_url 

	ll_pos = POS ( is_mailtext, ls_urltag)
	If ll_pos > 0 then // put after "browser" or at the end 
		f_replace( is_mailtext, ls_urltag, ls_url) 
	ELSE
		is_mailtext		= is_mailtext	+ ls_url 
	END IF

end event

public function integer of_check_http ();IF POS ( lower(is_dparm), 'http') > 0 then
	//Using HTTP to sync.
	is_dparm = trim( MID (is_dparm, 5))
	ib_webdb = true	
	ib_http = true	
	
END IF
return 1
end function

on nvo_websurvey.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_websurvey.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;inv_qgen = CREATE nvo_qgen			

this.event ue_web_init()

istr_parms.batch_uo = this
end event

event destructor;If IsValid( ids_headers) then DESTROY 	ids_headers
If IsValid( i_web_tran) then DESTROY 	i_web_tran
If IsValid( inv_dbcopy ) then DESTROY 	inv_dbcopy 
If IsValid( inv_qgen ) then DESTROY 	inv_qgen 


end event

