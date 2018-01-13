$PBExportHeader$w_vzt_get_part_task.srw
forward
global type w_vzt_get_part_task from w_vzt_base
end type
type cb_1 from commandbutton within w_vzt_get_part_task
end type
type cb_2 from commandbutton within w_vzt_get_part_task
end type
end forward

global type w_vzt_get_part_task from w_vzt_base
integer x = 1417
integer y = 576
integer width = 1851
integer height = 940
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
cb_1 cb_1
cb_2 cb_2
end type
global w_vzt_get_part_task w_vzt_get_part_task

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

event ue_process_ok();long ll_selrow
ll_selrow = dw_mainlist.GetSelectedRow(0) 
If ll_selrow > 0 then
   istr_parms.string1 = dw_mainlist.GetItemString( ll_selrow, 'problem_number')
   istr_parms.string2 = dw_mainlist.GetItemString( ll_selrow, 'subproblem_subproblem_desc')
   istr_parms.string3 = dw_mainlist.GetItemString( ll_selrow, 'subproblem_number')

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

on w_vzt_get_part_task.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
end on

on w_vzt_get_part_task.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;istr_parms = message.PowerObjectparm

dw_mainlist.Retrieve(istr_parms.num1)

dw_mainlist.post setfocus()
end event

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_get_part_task
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_get_part_task
integer width = 1810
integer height = 732
string dataobject = "d_part_task_map_list"
end type

event dw_mainlist::doubleclicked;call super::doubleclicked;parent.event post ue_ok()
end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_get_part_task
integer x = 1824
integer y = 756
integer width = 215
integer height = 80
integer taborder = 20
boolean enabled = false
end type

type cb_close from w_vzt_base`cb_close within w_vzt_get_part_task
boolean visible = false
integer taborder = 50
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_get_part_task
integer x = 1783
integer taborder = 120
boolean enabled = false
end type

type cb_save from w_vzt_base`cb_save within w_vzt_get_part_task
boolean visible = false
integer x = 1870
integer y = 680
integer taborder = 90
end type

type cb_select from w_vzt_base`cb_select within w_vzt_get_part_task
boolean visible = false
integer x = 1979
integer y = 596
integer taborder = 80
end type

type cb_new from w_vzt_base`cb_new within w_vzt_get_part_task
boolean visible = false
integer x = 1893
integer y = 776
integer taborder = 110
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_get_part_task
boolean visible = false
integer x = 2112
integer y = 684
integer taborder = 70
end type

type cb_search from w_vzt_base`cb_search within w_vzt_get_part_task
boolean visible = false
integer x = 2222
integer y = 588
integer taborder = 60
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_get_part_task
boolean visible = false
end type

type st_stop from w_vzt_base`st_stop within w_vzt_get_part_task
end type

type dw_data from w_vzt_base`dw_data within w_vzt_get_part_task
boolean visible = false
integer x = 2258
integer y = 572
integer width = 219
integer height = 228
integer taborder = 30
string dataobject = "d_dddw_active_syrveys"
end type

type dw_print from w_vzt_base`dw_print within w_vzt_get_part_task
integer taborder = 130
end type

type cb_1 from commandbutton within w_vzt_get_part_task
integer x = 576
integer y = 784
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

type cb_2 from commandbutton within w_vzt_get_part_task
integer x = 1010
integer y = 784
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

