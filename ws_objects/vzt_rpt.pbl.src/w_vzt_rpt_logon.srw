$PBExportHeader$w_vzt_rpt_logon.srw
forward
global type w_vzt_rpt_logon from w_vzt_base_logon
end type
type dw_logon from datawindow within w_vzt_rpt_logon
end type
end forward

global type w_vzt_rpt_logon from w_vzt_base_logon
int Y=240
int Width=1431
int Height=1440
boolean TitleBar=false
boolean Border=true
dw_logon dw_logon
end type
global w_vzt_rpt_logon w_vzt_rpt_logon

on w_vzt_rpt_logon.create
int iCurrent
call super::create
this.dw_logon=create dw_logon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_logon
end on

on w_vzt_rpt_logon.destroy
call super::destroy
destroy(this.dw_logon)
end on

event resize;//lead1.width = this.width
//lead1.height = this.height

end event

event open;call super::open;dw_logon.insertrow(0)
dw_logon.object.version [1] 		= gnv_appman.is_version
dw_logon.object.lastupdated [1] 	= gnv_appman.id_last_updated 

sle_loginid.SetFocus()
end event

type cb_exit from w_vzt_base_logon`cb_exit within w_vzt_rpt_logon
int X=704
int Y=1240
int Width=306
int Height=72
end type

event cb_exit::clicked;halt close 
//closewithreturn(parent, '0')
end event

type cb_ok from w_vzt_base_logon`cb_ok within w_vzt_rpt_logon
int X=302
int Y=1240
int Width=306
int Height=72
string Text="OK"
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

closewithreturn(parent, '1')

end event

type st_password from w_vzt_base_logon`st_password within w_vzt_rpt_logon
int X=1728
int Y=1320
int Width=398
int Height=88
Alignment Alignment=Right!
long TextColor=17343990
long BackColor=25250304
int TextSize=-12
int Weight=700
string FaceName="Arial Narrow"
FontCharSet FontCharSet=Ansi!
end type

type sle_password from w_vzt_base_logon`sle_password within w_vzt_rpt_logon
int X=507
int Y=1012
int Height=84
long TextColor=8388736
FontCharSet FontCharSet=Ansi!
end type

type sle_loginid from w_vzt_base_logon`sle_loginid within w_vzt_rpt_logon
int X=507
int Y=904
int Height=96
long TextColor=8388736
int TextSize=-14
FontCharSet FontCharSet=Ansi!
end type

type st_loginid from w_vzt_base_logon`st_loginid within w_vzt_rpt_logon
int X=1728
int Y=1188
int Width=398
int Height=88
Alignment Alignment=Right!
long TextColor=17343990
long BackColor=25250304
int TextSize=-12
int Weight=700
string FaceName="Arial Narrow"
FontCharSet FontCharSet=Ansi!
end type

type dw_logon from datawindow within w_vzt_rpt_logon
int X=9
int Y=8
int Width=1413
int Height=1436
string DataObject="d_vzt_rpt_logon"
boolean Border=false
boolean LiveScroll=true
end type

