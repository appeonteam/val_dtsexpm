$PBExportHeader$uo_vzt_report_output.sru
forward
global type uo_vzt_report_output from nonvisualobject
end type
end forward

global type uo_vzt_report_output from nonvisualobject
event type integer ue_save_report_output ( ref datastore dw_schedule,  ref datastore ldw_rpt,  string as_userid,  ref transaction a_tran )
event type integer ue_read_report_output ( string as_outputid,  ref blob a_blob_target,  ref datawindow adw_parms,  ref datawindow adw_rpt,  string as_mode )
end type
global uo_vzt_report_output uo_vzt_report_output

event ue_save_report_output;int li_rc 
li_rc = 1 
 
		string ls_id, ls_title, ls_reportid, ls_seclevel, ls_msg, ls_scheduleid, ls_keeplast
		datetime ldt_finished

		ls_keeplast		= dw_schedule.object.keeplast [ 1]
		ls_scheduleid	= dw_schedule.object.id 		[ 1]
		ls_reportid 	= dw_schedule.object.reportid [ 1]
		ls_seclevel 	= dw_schedule.object.securitylevel[ 1]
		ls_title 		= dw_schedule.object.title 	[ 1]
		dw_schedule.SetTransObject( a_tran )
		
		ldt_finished 	= datetime( today(), now()) 
		ls_id = as_userid + string( ldt_finished, "mmddhhmmssfff a/p") 

		If ls_keeplast	<> 'Y' then 
			ls_msg = ' deleting old data from report output table.'			
			DELETE FROM VZT_REPORTOUTPUT where scheduleid = :ls_scheduleid USING a_tran;
			If a_tran.sqlcode <> 0 then	li_rc = -5
		End If 
		
		If li_rc > 0 then 
			ls_msg = ' inserting into report output table.'
			INSERT INTO VZT_REPORTOUTPUT
			VALUES ( :ls_id, 
						:ls_reportid, 
						:as_userid, 
						:ls_title , 
						:ldt_finished, 
						null,  
						:ls_seclevel,  
						:ls_scheduleid) USING a_tran;
			If a_tran.sqlcode <> 0 then	li_rc = -10
		End If 
		 
		If li_rc > 0 then 
			setpointer(Hourglass!)
			long ll_len, ll_next = 1, ll_page , ll_max_pages
			blob blob_syntax_and_data 
			string ls_rpt_do='' 

			ls_msg = ' saving report data.'

//			f_ds_to_syntax_and_data( ldw_rpt, true, blob_syntax_and_data ) // report object 
			 
			UPDATEBLOB VZT_REPORTOUTPUT SET RPTOUTPUT = :blob_syntax_and_data
			WHERE ID = :ls_id USING a_tran ;
		End IF 
		If a_tran.sqlcode <> 0 then	li_rc = -20

		If li_rc > 0 then 
			ls_msg = ' updating batch schedule.'
			dw_schedule.object.message 		[1] = "Report completed."
			dw_schedule.object.outputid 		[1] = ls_id 
			dw_schedule.object.status 			[1] = "FINISHED"
			dw_schedule.object.finisheddate 	[1] = ldt_finished
			If dw_schedule.Update (false, true) < 0 then li_rc = -30
		End If
		If li_rc < 0 then dw_schedule.object.message [1] = "error while "+ls_msg + ", "+ trim(a_tran.SQLerrtext)
		f_end_tran(a_tran, li_rc, '', '', '') 		
		If li_rc < 0 then // save error info to schedule queue
			dw_schedule.object.status [1] = "ERROR"
			li_rc = dw_schedule.Update (false, true) 
			f_end_tran(a_tran, li_rc, '', '', '') 
		End If

return 1 

end event

event ue_read_report_output;	blob l_blob
	
	SELECTBLOB RPTOUTPUT INTO :a_blob_target FROM VZT_REPORTOUTPUT WHERE ID = :as_outputid ;
	l_blob = a_blob_target 
	
	
	if len(l_blob ) < 12 then 
	//	this.event dynamic ue_error( "VZT Report Display Creation Error", "Report output definition is missing Report Output Table.") 		
		return -1
	END IF 
	
	
	f_dw_to_syntax_and_data( adw_parms, false, l_blob  ) 
	
	if len(l_blob) < 12 then 
//		this.event ue_error( "VZT Report Display Creation Error", "Report definition is missing from Report Output Table.") 		
		return -1 
	END IF 
	f_dw_to_syntax_and_data( adw_rpt, false, l_blob  ) 
	
	return 1
end event

on uo_vzt_report_output.create
TriggerEvent( this, "constructor" )
end on

on uo_vzt_report_output.destroy
TriggerEvent( this, "destructor" )
end on

