﻿$PBExportHeader$w_vzt_web_auto_send.srw
forward
global type w_vzt_web_auto_send from w_vzt_rpt_processor
end type
end forward

global type w_vzt_web_auto_send from w_vzt_rpt_processor
end type
global w_vzt_web_auto_send w_vzt_web_auto_send

type variables
nvo_websurvey	inv_websurvey 
nvo_qgen	inv_qgen
end variables

on w_vzt_web_auto_send.create
int iCurrent
call super::create
end on

on w_vzt_web_auto_send.destroy
call super::destroy
end on

event close;call super::close;//After all report procesing stuff is over - send the surveys...
if istr_parms.live_trace = 'Y' then 
	INV_websurvey.is_live_trace = 'Y'
	gnv_appman.is_debugmode = 'Y' 
END IF

If gnv_appman.is_debugmode = 'Y' then
	messagebox('VZT WEB AUTO TRACE', 'before INV_websurvey.event ue_web_send_all')
END IF

INV_websurvey.event ue_web_survey_auto( idw_rpt )

If IsVALID (INV_websurvey) then DESTROY INV_websurvey
If IsVALID (inv_qgen		) 	then DESTROY inv_qgen		




end event

event open;//override

//inv_qgen			= CREATE nvo_qgen	
inv_websurvey 	= CREATE nvo_websurvey

inv_websurvey.event ue_web_tran( ) // connnect if any 

if gnv_appman.is_debugmode = 'Y' then 
	if inv_websurvey.ib_webdb then
		MessageBox('VZT web sync', 'web db connected')
	Else
		MessageBox('VZT web sync', 'web db NOT connected !!!')
	END IF
end if

if inv_websurvey.ib_webdb then
	ib_use_remote = true 
	ib_http = inv_websurvey.ib_HTTP 
	If NOT inv_websurvey.ib_HTTP then
		i_tran_remote = inv_websurvey.i_web_tran
	END IF
END IF

super::EVENT OPEN()
end event

event ue_http_get_url;call super::ue_http_get_url;// this report url is: 

is_url = inv_websurvey.is_url 
is_page = 'qgen_getwebsurveys.asp'
is_args = 'd='+ inv_websurvey.is_dparm + '&action=rpt'

	
end event

type cb_dfilter from w_vzt_rpt_processor`cb_dfilter within w_vzt_web_auto_send
end type

type uo_trace01 from w_vzt_rpt_processor`uo_trace01 within w_vzt_web_auto_send
end type

type dw_mainlist from w_vzt_rpt_processor`dw_mainlist within w_vzt_web_auto_send
end type

type cb_last_search from w_vzt_rpt_processor`cb_last_search within w_vzt_web_auto_send
end type

type cb_close from w_vzt_rpt_processor`cb_close within w_vzt_web_auto_send
end type

type cb_delete1 from w_vzt_rpt_processor`cb_delete1 within w_vzt_web_auto_send
end type

type cb_save from w_vzt_rpt_processor`cb_save within w_vzt_web_auto_send
end type

type cb_select from w_vzt_rpt_processor`cb_select within w_vzt_web_auto_send
end type

type cb_new from w_vzt_rpt_processor`cb_new within w_vzt_web_auto_send
end type

type cb_newsearch from w_vzt_rpt_processor`cb_newsearch within w_vzt_web_auto_send
end type

type cb_search from w_vzt_rpt_processor`cb_search within w_vzt_web_auto_send
end type

type st_foundrecs from w_vzt_rpt_processor`st_foundrecs within w_vzt_web_auto_send
end type

type st_stop from w_vzt_rpt_processor`st_stop within w_vzt_web_auto_send
end type

type dw_data from w_vzt_rpt_processor`dw_data within w_vzt_web_auto_send
end type

type dw_print from w_vzt_rpt_processor`dw_print within w_vzt_web_auto_send
end type

type uo_ddcal from w_vzt_rpt_processor`uo_ddcal within w_vzt_web_auto_send
end type

type uo_zoom from w_vzt_rpt_processor`uo_zoom within w_vzt_web_auto_send
end type

type cbx_preview from w_vzt_rpt_processor`cbx_preview within w_vzt_web_auto_send
end type

type tab_1 from w_vzt_rpt_processor`tab_1 within w_vzt_web_auto_send
end type

type dw_repdef from w_vzt_rpt_processor`dw_repdef within w_vzt_web_auto_send
end type

type dw_repout from w_vzt_rpt_processor`dw_repout within w_vzt_web_auto_send
end type

type cb_run_again from w_vzt_rpt_processor`cb_run_again within w_vzt_web_auto_send
end type

type cb_show_sql from w_vzt_rpt_processor`cb_show_sql within w_vzt_web_auto_send
end type

type cb_show_syntax from w_vzt_rpt_processor`cb_show_syntax within w_vzt_web_auto_send
end type

type dw_parms from w_vzt_rpt_processor`dw_parms within w_vzt_web_auto_send
end type

type dw_def from w_vzt_rpt_processor`dw_def within w_vzt_web_auto_send
end type

type dw_rpt from w_vzt_rpt_processor`dw_rpt within w_vzt_web_auto_send
end type

type dw_schedule from w_vzt_rpt_processor`dw_schedule within w_vzt_web_auto_send
end type

type cbx_cover from w_vzt_rpt_processor`cbx_cover within w_vzt_web_auto_send
end type

type dw_cover from w_vzt_rpt_processor`dw_cover within w_vzt_web_auto_send
end type

type st_data from w_vzt_rpt_processor`st_data within w_vzt_web_auto_send
end type

type dw_distribution from w_vzt_rpt_processor`dw_distribution within w_vzt_web_auto_send
end type

type p_1 from w_vzt_rpt_processor`p_1 within w_vzt_web_auto_send
end type

type dw_remote_connections from w_vzt_rpt_processor`dw_remote_connections within w_vzt_web_auto_send
end type

