$PBExportHeader$w_get_survey_list_old.srw
forward
global type w_get_survey_list_old from w_base_response
end type
type dw_default from datawindow within w_get_survey_list_old
end type
end forward

global type w_get_survey_list_old from w_base_response
int Width=1001
int Height=804
boolean TitleBar=false
long BackColor=80269528
boolean ControlMenu=false
event type integer ue_web_check ( boolean ab_message )
dw_default dw_default
end type
global w_get_survey_list_old w_get_survey_list_old

type variables
string 	is_web_default, is_dparm, is_url, IS_PROPID
long	il_web_available
end variables

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

on w_get_survey_list_old.create
int iCurrent
call super::create
this.dw_default=create dw_default
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_default
end on

on w_get_survey_list_old.destroy
call super::destroy
destroy(this.dw_default)
end on

event open;istr_parms = message.PowerObjectparm

dw_response.Retrieve()

SELECT option10 , option11, option12, option14 
INTO :is_url, :is_propid, :is_dparm, :is_web_default 
from vzt_sysoptions where id = 1;

il_web_available = this.event ue_web_check(false) 
if istr_parms.num1 = 1 then il_web_available = 0 // 

dw_default.insertRow(0)
If il_web_available > 0 then 
	dw_default.visible = true 
	dw_default.SetItem( 1, 'webdefault', is_web_default)
ELSE
	dw_default.visible = false
	dw_default.SetItem( 1, 'webdefault', 'L')
END IF

dw_response.post setfocus()
end event

event ue_process_ok;call super::ue_process_ok;long ll_selrow
ll_selrow = dw_response.GetSelectedRow(0) 
If ll_selrow > 0 then
	If dw_default.visible then
	  istr_parms.string1 = dw_default.GetItemString( 1, 'webdefault')
	ELSE
	  istr_parms.string1 = 'L' // letter 
	END IF 
	istr_parms.num1 = dw_response.GetItemNumber( ll_selrow, 'qsetid')
	if istr_parms.string1 = 'W' then  istr_parms.num1 = istr_parms.num1 * (-1)
END IF 	



end event

type dw_response from w_base_response`dw_response within w_get_survey_list_old
int X=14
int Y=8
int Width=955
int Height=560
string DataObject="d_dddw_active_syrveys"
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
end type

type cb_2 from w_base_response`cb_2 within w_get_survey_list_old
int X=594
int Y=680
int Height=80
int TabOrder=40
boolean Default=false
boolean Cancel=false
end type

type cb_1 from w_base_response`cb_1 within w_get_survey_list_old
int X=160
int Y=680
int Height=80
int TabOrder=20
end type

type dw_default from datawindow within w_get_survey_list_old
int X=27
int Y=580
int Width=910
int Height=76
int TabOrder=30
boolean BringToTop=true
string DataObject="d_web_default"
boolean Border=false
boolean LiveScroll=true
end type

