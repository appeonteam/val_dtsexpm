$PBExportHeader$w_qgen_survey_history_display.srw
forward
global type w_qgen_survey_history_display from w_qgen_survey_display
end type
end forward

global type w_qgen_survey_history_display from w_qgen_survey_display
integer width = 4357
integer height = 1632
boolean maxbox = true
end type
global w_qgen_survey_history_display w_qgen_survey_history_display

on w_qgen_survey_history_display.create
int iCurrent
call super::create
end on

on w_qgen_survey_history_display.destroy
call super::destroy
end on

event open;call super::open;dw_mainlist.Retrieve(istr_parms.gccid)
dw_mainlist.visible = true
dw_mainlist.enabled = true

end event

event resize;call super::resize;
	if sizetype <> 1 then 
		dw_data.height			= newheight - ii_resizeband_y 
		dw_mainlist.height	= newheight - ii_resizeband_y 
		
	End IF 

end event

type uo_trace01 from w_qgen_survey_display`uo_trace01 within w_qgen_survey_history_display
end type

type dw_mainlist from w_qgen_survey_display`dw_mainlist within w_qgen_survey_history_display
integer width = 2034
integer height = 1472
string dataobject = "d_gcc_history"
end type

event dw_mainlist::constructor;call super::constructor;_selection_service = 'S' 
end event

event dw_mainlist::doubleclicked;call super::doubleclicked;long ll_row
double ls_id
ll_row	=row
if ll_row <= 0 then return 

string callNumber, action, statCode, clickedColNum, ls_code

callNumber 		= this.GetItemString(ll_row,	"refnum") 
ls_code			= this.GetItemString(ll_row,	"actioncode") 
ls_id				= this.GetItemNumber(ll_row,	"id") 
CHOOSE CASE ls_code
	CASE 'TYL', 'APL', 'REL', 'AML', 'FRL', 'PGL', 'WSR', 'WL' // 12.18.2001
		istr_parms.id = ls_id 
		OpenSheetWithParm( w_gcc_letter_view, istr_parms, w_main, 0, Layered!)
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
		 
		OpenSheetWithParm( w_gcc_call_upd, istr_parms, w_main, 0, Layered!)
//		OpenSheetWithParm( w_gcc_call_upd, action+clickedColNum+callNumber, "w_gcc_call_upd", w_main, 0, Original! )
	end if
 end if // auth for call
end if // hist type check
end event

type cb_last_search from w_qgen_survey_display`cb_last_search within w_qgen_survey_history_display
integer x = 1157
integer y = 2092
end type

type cb_close from w_qgen_survey_display`cb_close within w_qgen_survey_history_display
integer x = 2405
integer y = 2092
end type

type cb_delete1 from w_qgen_survey_display`cb_delete1 within w_qgen_survey_history_display
integer x = 1687
integer y = 2092
end type

type cb_save from w_qgen_survey_display`cb_save within w_qgen_survey_history_display
integer x = 937
integer y = 2092
end type

type cb_select from w_qgen_survey_display`cb_select within w_qgen_survey_history_display
integer x = 718
integer y = 2092
end type

type cb_new from w_qgen_survey_display`cb_new within w_qgen_survey_history_display
integer x = 1513
integer y = 2092
end type

type cb_newsearch from w_qgen_survey_display`cb_newsearch within w_qgen_survey_history_display
integer x = 128
integer y = 2092
end type

type cb_search from w_qgen_survey_display`cb_search within w_qgen_survey_history_display
integer x = 489
integer y = 2092
end type

type st_foundrecs from w_qgen_survey_display`st_foundrecs within w_qgen_survey_history_display
integer x = 2139
integer y = 2096
end type

type st_stop from w_qgen_survey_display`st_stop within w_qgen_survey_history_display
integer x = 2203
integer y = 2092
end type

type dw_data from w_qgen_survey_display`dw_data within w_qgen_survey_history_display
integer y = 12
integer width = 2272
integer height = 1468
end type

type dw_print from w_qgen_survey_display`dw_print within w_qgen_survey_history_display
integer x = 1957
integer y = 2096
end type

