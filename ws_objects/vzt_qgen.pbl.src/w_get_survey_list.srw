$PBExportHeader$w_get_survey_list.srw
forward
global type w_get_survey_list from w_vzt_base
end type
type dw_default from datawindow within w_get_survey_list
end type
type cb_1 from commandbutton within w_get_survey_list
end type
type cb_2 from commandbutton within w_get_survey_list
end type
end forward

global type w_get_survey_list from w_vzt_base
integer x = 1417
integer y = 576
integer width = 1147
integer height = 996
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269528
event ue_ok ( )
event ue_cancel ( )
event ue_process_ok ( )
event type long ue_web_check ( boolean ab_message )
dw_default dw_default
cb_1 cb_1
cb_2 cb_2
end type
global w_get_survey_list w_get_survey_list

type variables
string 	is_web_default, is_dparm, is_url, IS_PROPID
long	il_web_available
str_response	istr_parms
end variables

event ue_ok;istr_parms.rc = 1
this.event ue_process_ok()
If istr_parms.rc > 0 then closeWithReturn (this, istr_parms) 

//// sample call 
//OpenWIthParm( w_ssss, lstr_parms)
//
//lstr_parms = Message.PowerObjectParm
//if not isValid( lstr_parms) then return 0
//If lstr_parms.rc <= 0 then return 0
end event

event ue_cancel;istr_parms.rc = -1
closeWithReturn (this, istr_parms) 
end event

event ue_process_ok;long ll_selrow
ll_selrow = dw_mainlist.GetSelectedRow(0) 
If ll_selrow > 0 then
	If dw_default.visible then
	  istr_parms.string1 = dw_default.GetItemString( 1, 'webdefault')
	ELSE
	  istr_parms.string1 = 'L' // letter 
	END IF 
	istr_parms.num1 = dw_mainlist.GetItemNumber( ll_selrow, 'qsetid')
	if istr_parms.string1 = 'W' then  istr_parms.num1 = istr_parms.num1 * (-1)
END IF 	

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

on w_get_survey_list.create
int iCurrent
call super::create
this.dw_default=create dw_default
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_default
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_get_survey_list.destroy
call super::destroy
destroy(this.dw_default)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;istr_parms = message.PowerObjectparm

dw_mainlist.Retrieve()

SELECT option10 , option11, option12, option14 
INTO :is_url, :is_propid, :is_dparm, :is_web_default 
from vzt_sysoptions where id = 1;

il_web_available = this.event ue_web_check(false) 
if istr_parms.num1 = 1 then il_web_available = 0 // 

il_web_available = -100 /////////////////////////////////

dw_default.insertRow(0)
If il_web_available > 0 then 
	dw_default.visible = true 
	dw_default.SetItem( 1, 'webdefault', is_web_default)
ELSE
	dw_default.visible = false
	dw_default.SetItem( 1, 'webdefault', 'L')
END IF

dw_mainlist.post setfocus()
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_get_survey_list
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_get_survey_list
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_get_survey_list
integer width = 1111
integer height = 660
string dataobject = "d_dddw_active_syrveys"
boolean hsplitscroll = false
end type

event dw_mainlist::doubleclicked;call super::doubleclicked;parent.event post ue_ok()
end event

type cb_last_search from w_vzt_base`cb_last_search within w_get_survey_list
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_get_survey_list
boolean visible = false
integer taborder = 50
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_get_survey_list
integer taborder = 120
end type

type cb_save from w_vzt_base`cb_save within w_get_survey_list
boolean visible = false
integer x = 1870
integer y = 680
integer taborder = 90
end type

type cb_select from w_vzt_base`cb_select within w_get_survey_list
boolean visible = false
integer x = 1979
integer y = 596
integer taborder = 80
end type

type cb_new from w_vzt_base`cb_new within w_get_survey_list
boolean visible = false
integer x = 1893
integer y = 776
integer taborder = 110
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_get_survey_list
boolean visible = false
integer x = 2112
integer y = 684
integer taborder = 70
end type

type cb_search from w_vzt_base`cb_search within w_get_survey_list
boolean visible = false
integer x = 2222
integer y = 588
integer taborder = 60
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_get_survey_list
boolean visible = false
end type

type st_stop from w_vzt_base`st_stop within w_get_survey_list
end type

type dw_data from w_vzt_base`dw_data within w_get_survey_list
boolean visible = false
integer x = 2258
integer y = 572
integer width = 219
integer height = 228
integer taborder = 30
string dataobject = "d_dddw_active_syrveys"
end type

type dw_print from w_vzt_base`dw_print within w_get_survey_list
integer taborder = 130
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_get_survey_list
end type

type dw_default from datawindow within w_get_survey_list
integer y = 700
integer width = 1134
integer height = 160
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_web_default"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_get_survey_list
integer x = 160
integer y = 884
integer width = 247
integer height = 80
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;parent.event ue_ok()
end event

type cb_2 from commandbutton within w_get_survey_list
integer x = 594
integer y = 884
integer width = 247
integer height = 80
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
boolean default = true
end type

event clicked;parent.event ue_cancel()
end event

