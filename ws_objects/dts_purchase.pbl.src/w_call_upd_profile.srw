$PBExportHeader$w_call_upd_profile.srw
forward
global type w_call_upd_profile from w_call_upd
end type
end forward

global type w_call_upd_profile from w_call_upd
integer height = 2036
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
event ue_post_open ( )
end type
global w_call_upd_profile w_call_upd_profile

event ue_post_open();//this.width = 1000

// use global structure to pass parms
sProblemNumber 	= gnv_appman.istr_response.string1
dw_1.SetITem(1, 'problem_problem_number',sProblemNumber )
wf_validate_problem(gnv_appman.istr_response.string1)
wf_validate_subproblem(gnv_appman.istr_response.string3)
sSubProblemNumber	= gnv_appman.istr_response.string3 // num
dw_1.SetITem(1, 'subproblem',gnv_appman.istr_response.string2)

dw_1.SetITem(1, 'closed_bydept',gnv_appman.istr_response.string5)
sClosedBydept=gnv_appman.istr_response.string5

dw_1.SetITem(1, 'repairman',gnv_appman.istr_response.string6)
sRepairman   	= gnv_appman.istr_response.string6

sresolution = string(gnv_appman.istr_response.num2)
dw_1.SetITem(1, 'resolution',sresolution)

ld_Amount		= gnv_appman.istr_response.VALUE1	
dw_1.SetITem(1, 'amount',ld_Amount)

dw_1.SetColumn('room') 

this.visible = true 
end event

on w_call_upd_profile.create
int iCurrent
call super::create
end on

on w_call_upd_profile.destroy
call super::destroy
end on

event open;call super::open;
this.post event ue_post_open()
end event

type pb_4 from w_call_upd`pb_4 within w_call_upd_profile
end type

type p_2 from w_call_upd`p_2 within w_call_upd_profile
end type

type pb_9 from w_call_upd`pb_9 within w_call_upd_profile
end type

type pb_8 from w_call_upd`pb_8 within w_call_upd_profile
end type

type pb_7 from w_call_upd`pb_7 within w_call_upd_profile
end type

type pb_6 from w_call_upd`pb_6 within w_call_upd_profile
end type

type pb_5 from w_call_upd`pb_5 within w_call_upd_profile
end type

type pb_3 from w_call_upd`pb_3 within w_call_upd_profile
end type

type dw_2 from w_call_upd`dw_2 within w_call_upd_profile
end type

type st_bannerleftchar from w_call_upd`st_bannerleftchar within w_call_upd_profile
end type

type st_bannerrightchar from w_call_upd`st_bannerrightchar within w_call_upd_profile
end type

type st_3 from w_call_upd`st_3 within w_call_upd_profile
end type

type st_2 from w_call_upd`st_2 within w_call_upd_profile
end type

type st_mode from w_call_upd`st_mode within w_call_upd_profile
end type

type st_banner from w_call_upd`st_banner within w_call_upd_profile
integer width = 389
end type

type p_1 from w_call_upd`p_1 within w_call_upd_profile
end type

type pb_2 from w_call_upd`pb_2 within w_call_upd_profile
end type

type pb_1 from w_call_upd`pb_1 within w_call_upd_profile
end type

type dw_1 from w_call_upd`dw_1 within w_call_upd_profile
string dataobject = "d_timercalls_upd_profile"
end type

type cb_copy from w_call_upd`cb_copy within w_call_upd_profile
end type

type cb_modify from w_call_upd`cb_modify within w_call_upd_profile
end type

type cb_closecall from w_call_upd`cb_closecall within w_call_upd_profile
end type

type cb_delete from w_call_upd`cb_delete within w_call_upd_profile
end type

type cb_save from w_call_upd`cb_save within w_call_upd_profile
end type

type cb_reset from w_call_upd`cb_reset within w_call_upd_profile
end type

type cb_close from w_call_upd`cb_close within w_call_upd_profile
end type

type cb_add from w_call_upd`cb_add within w_call_upd_profile
end type

type uo_1 from w_call_upd`uo_1 within w_call_upd_profile
end type

type cb_retrieve from w_call_upd`cb_retrieve within w_call_upd_profile
end type

