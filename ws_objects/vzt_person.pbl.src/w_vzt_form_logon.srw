$PBExportHeader$w_vzt_form_logon.srw
forward
global type w_vzt_form_logon from w_vzt_base_logon
end type
type dw_logon from datawindow within w_vzt_form_logon
end type
end forward

global type w_vzt_form_logon from w_vzt_base_logon
integer y = 240
integer width = 1449
integer height = 1456
boolean border = true
dw_logon dw_logon
end type
global w_vzt_form_logon w_vzt_form_logon

on w_vzt_form_logon.create
int iCurrent
call super::create
this.dw_logon=create dw_logon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_logon
end on

on w_vzt_form_logon.destroy
call super::destroy
destroy(this.dw_logon)
end on

event resize;//lead1.width = this.width
//lead1.height = this.height

end event

event open;call super::open;dw_logon.insertrow(0)
dw_logon.object.version [1] 		= gnv_appman.is_version
dw_logon.object.lastupdated [1] 	= gnv_appman.id_last_updated 

//dw_logon.x = (this.width - dw_logon.width) / 2
//dw_logon.y = (this.height - dw_logon.height ) / 2

sle_loginid.SetFocus()

cb_ok.post event clicked()
end event

type cb_exit from w_vzt_base_logon`cb_exit within w_vzt_form_logon
integer x = 713
integer y = 1164
integer width = 306
integer height = 96
end type

event cb_exit::clicked;halt close 
//closewithreturn(parent, '0')
end event

type cb_ok from w_vzt_base_logon`cb_ok within w_vzt_form_logon
integer x = 311
integer y = 1164
integer width = 306
integer height = 96
string text = "OK"
end type

event cb_ok::clicked;integer	li_rc
string 	ls_pw

SetPointer (hourglass!)

gnv_appman.is_userid 	= sle_loginid.text  
ls_pw							= sle_password.text  

if f_nvl(ls_pw,'') = '' then  return 
 
	SELECT 	"FIRSTNAME", "LASTNAME", "GROUPID"
	INTO 		:gnv_appman.is_fname, 
				:gnv_appman.is_lname, 
				:gnv_appman.is_groupid 
				 
	FROM 		"VZT_USERS"
	WHERE 	( "USERID" 		= :gnv_appman.is_userid ) AND  
	         ( "PASSWORD" 	= :ls_pw )   
				;
if f_nvl(gnv_appman.is_fname,'') = '' then 
	messageBox("VZT Login Failure", "Access Denied. Invalid userid or password.", Exclamation!)
	return 
end if
 
gnv_appman.is_groupid = Trim(gnv_appman.is_groupid)

closewithreturn(parent, 'OK')

end event

type st_password from w_vzt_base_logon`st_password within w_vzt_form_logon
integer x = 1728
integer y = 1320
integer width = 398
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial Narrow"
long textcolor = 17343990
long backcolor = 25250304
alignment alignment = right!
end type

type sle_password from w_vzt_base_logon`sle_password within w_vzt_form_logon
integer x = 562
integer y = 868
integer width = 791
integer height = 84
fontcharset fontcharset = ansi!
long textcolor = 8388736
string text = "sys"
end type

type sle_loginid from w_vzt_base_logon`sle_loginid within w_vzt_form_logon
integer x = 562
integer y = 760
integer width = 791
integer height = 96
integer textsize = -14
fontcharset fontcharset = ansi!
long textcolor = 8388736
string text = "sys"
end type

type st_loginid from w_vzt_base_logon`st_loginid within w_vzt_form_logon
integer x = 1728
integer y = 1188
integer width = 398
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial Narrow"
long textcolor = 17343990
long backcolor = 25250304
alignment alignment = right!
end type

type dw_logon from datawindow within w_vzt_form_logon
integer x = 9
integer y = 8
integer width = 1413
integer height = 1428
string dataobject = "d_vzt_form_logon"
boolean border = false
boolean livescroll = true
end type

