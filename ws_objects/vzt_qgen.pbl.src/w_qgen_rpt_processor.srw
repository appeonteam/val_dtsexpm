$PBExportHeader$w_qgen_rpt_processor.srw
forward
global type w_qgen_rpt_processor from w_vzt_rpt_processor
end type
end forward

global type w_qgen_rpt_processor from w_vzt_rpt_processor
boolean TitleBar=true
string Title="QGEN Report Processor"
end type
global w_qgen_rpt_processor w_qgen_rpt_processor

on w_qgen_rpt_processor.create
call super::create
end on

on w_qgen_rpt_processor.destroy
call super::destroy
end on

event ue_post_retrieve;string ls_text, ls_defgraphtype
long 		ll_row

ll_row = adw_rpt.GetRow()
if ll_row <= 0 then return 0

ls_text 				= adw_rpt.GetItemString( ll_row, 'questiontxt')
ls_defgraphtype	= adw_rpt.GetItemString( ll_row, 'defgraphtype') 
ls_text				= f_replace( ls_text , "'", '`')

adw_rpt.Modify ("gr_1.title='" + ls_text + "'")
adw_rpt.Modify ("gr_1.graphtype="+ ls_defgraphtype	)
return 1
end event

type cb_close from w_vzt_rpt_processor`cb_close within w_qgen_rpt_processor
int X=283
end type

type st_foundrecs from w_vzt_rpt_processor`st_foundrecs within w_qgen_rpt_processor
boolean BringToTop=true
end type

type st_stop from w_vzt_rpt_processor`st_stop within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_print from w_vzt_rpt_processor`dw_print within w_qgen_rpt_processor
boolean BringToTop=true
end type

type cbx_preview from w_vzt_rpt_processor`cbx_preview within w_qgen_rpt_processor
boolean BringToTop=true
end type

type tab_1 from w_vzt_rpt_processor`tab_1 within w_qgen_rpt_processor
boolean BringToTop=true
end type

type cb_run_again from w_vzt_rpt_processor`cb_run_again within w_qgen_rpt_processor
boolean BringToTop=true
end type

type cb_show_sql from w_vzt_rpt_processor`cb_show_sql within w_qgen_rpt_processor
boolean BringToTop=true
end type

type cb_show_syntax from w_vzt_rpt_processor`cb_show_syntax within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_parms from w_vzt_rpt_processor`dw_parms within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_def from w_vzt_rpt_processor`dw_def within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_rpt from w_vzt_rpt_processor`dw_rpt within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_schedule from w_vzt_rpt_processor`dw_schedule within w_qgen_rpt_processor
boolean BringToTop=true
end type

type cbx_cover from w_vzt_rpt_processor`cbx_cover within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_cover from w_vzt_rpt_processor`dw_cover within w_qgen_rpt_processor
int X=2619
int Y=1088
boolean BringToTop=true
end type

type dw_distribution from w_vzt_rpt_processor`dw_distribution within w_qgen_rpt_processor
boolean BringToTop=true
end type

type p_1 from w_vzt_rpt_processor`p_1 within w_qgen_rpt_processor
boolean BringToTop=true
end type

type dw_remote_connections from w_vzt_rpt_processor`dw_remote_connections within w_qgen_rpt_processor
boolean BringToTop=true
end type

