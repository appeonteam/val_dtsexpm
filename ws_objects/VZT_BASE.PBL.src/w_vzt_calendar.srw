$PBExportHeader$w_vzt_calendar.srw
$PBExportComments$Window to demonstrate the user object drop down calendar
forward
global type w_vzt_calendar from window
end type
type cb_ok from commandbutton within w_vzt_calendar
end type
type cb_1 from commandbutton within w_vzt_calendar
end type
type uo_1 from u_vzt_ddcal within w_vzt_calendar
end type
end forward

global type w_vzt_calendar from window
integer x = 1271
integer y = 700
integer width = 837
integer height = 848
windowtype windowtype = response!
long backcolor = 134217728
cb_ok cb_ok
cb_1 cb_1
uo_1 uo_1
end type
global w_vzt_calendar w_vzt_calendar

type variables
st_date_range  ist_range
st_lookup_parm   istr_parms
end variables

event open;string  	ls_parmvalue
date		ldt_date
long		ll_year
istr_parms = message.PowerObjectPArm
ls_parmvalue = istr_parms.parmvalue
uo_1.sle_date.text=ls_parmvalue 
ldt_date = date(ls_parmvalue) 
ll_year  = Year( ldt_date) 
if IsNull( ldt_date) or ( ll_year < 1910 AND ll_year > 1850) then ldt_date = today()
uo_1.init_cal(ldt_date )
 
end event

on w_vzt_calendar.create
this.cb_ok=create cb_ok
this.cb_1=create cb_1
this.uo_1=create uo_1
this.Control[]={this.cb_ok,&
this.cb_1,&
this.uo_1}
end on

on w_vzt_calendar.destroy
destroy(this.cb_ok)
destroy(this.cb_1)
destroy(this.uo_1)
end on

event deactivate;cb_1.EVENT CLICKED()
end event

type cb_ok from commandbutton within w_vzt_calendar
integer x = 82
integer y = 748
integer width = 256
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;//Return the date selected to the menu script
st_lookup_ret		lst_retparms

lst_retparms.newvalue = String(uo_1.id_date_selected, uo_1.is_dateformat)
lst_retparms.newdescr = lst_retparms.newvalue 

if gnv_aPPMAN.is_debugmode = 'Y' then 
//	messagebox("leaving vzt calendar", String(uo_1.id_date_selected, uo_1.is_dateformat) + '~r~nMask:'+ uo_1.is_dateformat)
END IF 

closewithreturn(parent, lst_retparms )



end event

type cb_1 from commandbutton within w_vzt_calendar
integer x = 480
integer y = 748
integer width = 256
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;//messagebox("leaving calendar",String(uo_1.id_date_selected,"mm/dd/yyyy"))
st_lookup_ret		lst_retparms

lst_retparms.newvalue ='CANCEL'

closewithreturn(parent, lst_retparms )



end event

type uo_1 from u_vzt_ddcal within w_vzt_calendar
integer width = 818
integer height = 764
long backcolor = 134217728
end type

on uo_1.destroy
call u_vzt_ddcal::destroy
end on

event doubleclicked;cb_ok.post event clicked()
end event

