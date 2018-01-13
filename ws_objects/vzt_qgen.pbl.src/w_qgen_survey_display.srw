$PBExportHeader$w_qgen_survey_display.srw
forward
global type w_qgen_survey_display from w_vzt_base
end type
end forward

global type w_qgen_survey_display from w_vzt_base
integer height = 1932
string title = "Survey Display"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
end type
global w_qgen_survey_display w_qgen_survey_display

type variables
nvo_qgen    	inv_qgen
double 			id_surveyid
str_dts_call	istr_parms


end variables

on w_qgen_survey_display.create
int iCurrent
call super::create
end on

on w_qgen_survey_display.destroy
call super::destroy
end on

event open;call super::open;istr_parms = Message.POwerObjectPArm

//if id_surveyid <= 0 then	return 0
this.title = this.title +' for '+ istr_parms.guestname 
	
this.windowstate = maximized!
	
inv_qgen = CREATE nvo_qgen
	
inv_qgen.in_headerid		= istr_parms.gccid
inv_qgen.idt_ans_date	= istr_parms.ansdate
inv_qgen.in_responderid	= istr_parms.account 

inv_qgen.event ue_create_qset (istr_parms.id, dw_data)
inv_qgen.event ue_load_user_answers ()

dw_data.modifyedit ("R" ) 
dw_data.visible = true 
//dw_gcc_history.visible = false 
	
end event

event close;call super::close;if isValid(inv_qgen) then destroy inv_qgen
end event

type uo_trace01 from w_vzt_base`uo_trace01 within w_qgen_survey_display
integer x = 2505
integer y = 1784
boolean enabled = false
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_qgen_survey_display
boolean visible = false
integer x = 2290
integer width = 183
integer height = 84
boolean enabled = false
end type

type cb_last_search from w_vzt_base`cb_last_search within w_qgen_survey_display
integer x = 1047
integer y = 1792
boolean enabled = false
end type

type cb_close from w_vzt_base`cb_close within w_qgen_survey_display
boolean visible = false
integer x = 2295
integer y = 1792
boolean enabled = false
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_qgen_survey_display
integer x = 1577
integer y = 1792
boolean enabled = false
end type

type cb_save from w_vzt_base`cb_save within w_qgen_survey_display
boolean visible = false
integer x = 827
integer y = 1792
boolean enabled = false
end type

type cb_select from w_vzt_base`cb_select within w_qgen_survey_display
boolean visible = false
integer x = 608
integer y = 1792
boolean enabled = false
end type

type cb_new from w_vzt_base`cb_new within w_qgen_survey_display
boolean visible = false
integer x = 1403
integer y = 1792
boolean enabled = false
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_qgen_survey_display
boolean visible = false
integer x = 18
integer y = 1792
integer width = 352
boolean enabled = false
end type

type cb_search from w_vzt_base`cb_search within w_qgen_survey_display
boolean visible = false
integer x = 379
integer y = 1792
boolean enabled = false
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_qgen_survey_display
boolean visible = false
integer x = 2030
integer y = 1796
end type

type st_stop from w_vzt_base`st_stop within w_qgen_survey_display
integer x = 2094
integer y = 1792
boolean enabled = false
end type

type dw_data from w_vzt_base`dw_data within w_qgen_survey_display
integer y = 8
integer width = 2720
integer height = 1752
string dataobject = "d_template02"
end type

type dw_print from w_vzt_base`dw_print within w_qgen_survey_display
integer x = 1847
integer y = 1796
boolean enabled = false
end type

