$PBExportHeader$w_vzt_prearrival_alert.srw
forward
global type w_vzt_prearrival_alert from w_vzt_rpt_processor
end type
end forward

global type w_vzt_prearrival_alert from w_vzt_rpt_processor
end type
global w_vzt_prearrival_alert w_vzt_prearrival_alert

type variables
end variables

on w_vzt_prearrival_alert.create
int iCurrent
call super::create
end on

on w_vzt_prearrival_alert.destroy
call super::destroy
end on

event ue_http_get_url;call super::ue_http_get_url;// this report url is: 

//is_url = inv_websurvey.is_url 
//is_page = 'qgen_getwebsurveys.asp'
//is_args = 'd='+ inv_websurvey.is_dparm + '&action=rpt'

	
end event

event ue_post_retrieve;call super::ue_post_retrieve;//After all report procesing stuff is over - reset the date sent

long 		ll_row, ll_maxrow, ll_trigger, li_callnum
double 	ll_svc_cont_id, ll_vendor_id
string 	ls_ret, ls_problem_number, ls_subproblem_number, ls_default_status
date		ldt_exp_date
double	ll_account, ll_amount 
string	ls_resp_problem_desc, ls_resp_subproblem_desc  
string	ls_name
datetime ld_checkin_dt, ld_depart_dt 
integer	li_offset, li_resp_offset, li_resp_depart_offset, li_depart_offset		

ll_maxrow = adw_rpt.RowCOunt() 

FOR ll_row = 1 to ll_maxrow 
	//	ll_trigrow = f_isvalidcolumn (adw_rpt, 'vzt_trigger')
//	ll_trigger 			= adw_rpt.GetItemNUmber( ll_row, 'vzt_trigger')
	ll_account 			= adw_rpt.GetItemNUmber( ll_row, 'guest_account')
	ll_amount  			= adw_rpt.GetItemNUmber( ll_row, 'amount')
	ls_problem_number	= adw_rpt.GetItemString( ll_row, 'problem_number')
	ls_subproblem_number	= adw_rpt.GetItemString( ll_row, 'SUBproblem_num')
	ls_default_status		= adw_rpt.GetItemString( ll_row, 'default_status')
	
	ls_resp_problem_desc	= adw_rpt.GetItemString( ll_row, 'resp_problem')
	if ls_resp_problem_desc = '' then ls_resp_problem_desc = adw_rpt.GetItemString( ll_row, 'closedcalls_problem')		
	
	ls_resp_subproblem_desc	= adw_rpt.GetItemString( ll_row, 'resp_subproblem')
	if ls_resp_subproblem_desc	= '' then ls_resp_subproblem_desc	= adw_rpt.GetItemString( ll_row, 'closedcalls_subproblem')		
	
	ls_name= trim(adw_rpt.GetItemString( ll_row, 'guest_last_name'))  
	ls_name= ls_name + ', ' +trim(adw_rpt.GetItemString( ll_row, 'guest_first_name'))  
	ld_checkin_dt				= adw_rpt.GetItemDateTime( ll_row, 'checkin_dt')
	ld_depart_dt 				= adw_rpt.GetItemDateTime( ll_row, 'depart_dt')
	
	li_offset		 			= adw_rpt.GetItemNUmber	 ( ll_row, 'tasking_offset')
	li_resp_offset				= adw_rpt.GetItemNUmber	 ( ll_row, 'resp_offset')
	If NOT IsNull (li_resp_offset) then li_offset = li_resp_offset // use response task offset if any
	
	li_depart_offset			= adw_rpt.GetItemNUmber	 ( ll_row, 'depart_offset')
	li_resp_depart_offset	= adw_rpt.GetItemNUmber	 ( ll_row, 'resp_depart_offset')
	If NOT IsNull (li_resp_depart_offset) then li_depart_offset = li_resp_depart_offset // use response task offset if any
	
//	If ll_trigger < 0 then // reset the date – the alert will be sent adw_rpt.GetItemString( ll_row, 'SUBproblem_number')
	li_callnum=0;
	 
  	SELECT vzt_hew_prearrival_task(0, 
		:ls_problem_number, :ls_subproblem_number, :ls_default_status,
		:ls_resp_problem_desc, :ls_resp_subproblem_desc,
		:ls_name, :ll_account, :ll_amount, 
		:ld_checkin_dt, :ld_depart_dt, :li_offset, :li_depart_offset
		) 
		INTO :li_callnum FROM DUmmy
			  ;

		f_end_tran0 (SQLCA, "PREARRIVAL Alert Error", "","DBERROR:")
	
NEXT	




return 1
end event

type cb_dfilter from w_vzt_rpt_processor`cb_dfilter within w_vzt_prearrival_alert
end type

type uo_trace01 from w_vzt_rpt_processor`uo_trace01 within w_vzt_prearrival_alert
end type

type dw_mainlist from w_vzt_rpt_processor`dw_mainlist within w_vzt_prearrival_alert
end type

type cb_last_search from w_vzt_rpt_processor`cb_last_search within w_vzt_prearrival_alert
end type

type cb_close from w_vzt_rpt_processor`cb_close within w_vzt_prearrival_alert
end type

type cb_delete1 from w_vzt_rpt_processor`cb_delete1 within w_vzt_prearrival_alert
end type

type cb_save from w_vzt_rpt_processor`cb_save within w_vzt_prearrival_alert
end type

type cb_select from w_vzt_rpt_processor`cb_select within w_vzt_prearrival_alert
end type

type cb_new from w_vzt_rpt_processor`cb_new within w_vzt_prearrival_alert
end type

type cb_newsearch from w_vzt_rpt_processor`cb_newsearch within w_vzt_prearrival_alert
end type

type cb_search from w_vzt_rpt_processor`cb_search within w_vzt_prearrival_alert
end type

type st_foundrecs from w_vzt_rpt_processor`st_foundrecs within w_vzt_prearrival_alert
end type

type st_stop from w_vzt_rpt_processor`st_stop within w_vzt_prearrival_alert
end type

type dw_data from w_vzt_rpt_processor`dw_data within w_vzt_prearrival_alert
end type

type dw_print from w_vzt_rpt_processor`dw_print within w_vzt_prearrival_alert
end type

type uo_ddcal from w_vzt_rpt_processor`uo_ddcal within w_vzt_prearrival_alert
end type

type uo_zoom from w_vzt_rpt_processor`uo_zoom within w_vzt_prearrival_alert
end type

type cbx_preview from w_vzt_rpt_processor`cbx_preview within w_vzt_prearrival_alert
end type

type tab_1 from w_vzt_rpt_processor`tab_1 within w_vzt_prearrival_alert
end type

type dw_repdef from w_vzt_rpt_processor`dw_repdef within w_vzt_prearrival_alert
end type

type dw_repout from w_vzt_rpt_processor`dw_repout within w_vzt_prearrival_alert
end type

type cb_run_again from w_vzt_rpt_processor`cb_run_again within w_vzt_prearrival_alert
end type

type cb_show_sql from w_vzt_rpt_processor`cb_show_sql within w_vzt_prearrival_alert
end type

type cb_show_syntax from w_vzt_rpt_processor`cb_show_syntax within w_vzt_prearrival_alert
end type

type dw_parms from w_vzt_rpt_processor`dw_parms within w_vzt_prearrival_alert
end type

type dw_def from w_vzt_rpt_processor`dw_def within w_vzt_prearrival_alert
end type

type dw_rpt from w_vzt_rpt_processor`dw_rpt within w_vzt_prearrival_alert
end type

type dw_schedule from w_vzt_rpt_processor`dw_schedule within w_vzt_prearrival_alert
end type

type cbx_cover from w_vzt_rpt_processor`cbx_cover within w_vzt_prearrival_alert
end type

type dw_cover from w_vzt_rpt_processor`dw_cover within w_vzt_prearrival_alert
end type

type st_data from w_vzt_rpt_processor`st_data within w_vzt_prearrival_alert
end type

type dw_distribution from w_vzt_rpt_processor`dw_distribution within w_vzt_prearrival_alert
end type

type p_1 from w_vzt_rpt_processor`p_1 within w_vzt_prearrival_alert
end type

type dw_remote_connections from w_vzt_rpt_processor`dw_remote_connections within w_vzt_prearrival_alert
end type

