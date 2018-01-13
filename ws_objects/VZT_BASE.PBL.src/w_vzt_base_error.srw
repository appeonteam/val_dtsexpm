$PBExportHeader$w_vzt_base_error.srw
forward
global type w_vzt_base_error from w_vzt_base_response
end type
type cb_3 from commandbutton within w_vzt_base_error
end type
type sle_1 from singlelineedit within w_vzt_base_error
end type
end forward

global type w_vzt_base_error from w_vzt_base_response
int Width=1719
int Height=1212
event ue_sendmail ( )
cb_3 cb_3
sle_1 sle_1
end type
global w_vzt_base_error w_vzt_base_error

event ue_sendmail;if Not IsValid( gnv_appman.inv_mail) then gnv_appman.inv_mail = CREATE uo_vzt_mail
end event

on w_vzt_base_error.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.sle_1
end on

on w_vzt_base_error.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.sle_1)
end on

event open;long ll_row

this.title = error.is_errortype
sle_1.text = 'sales@vztech.com'

ll_row = dw_response.InsertRow(0)
If ll_row > 0 then 
	dw_response.object.msg_header [1] = error.is_errortext
	dw_response.object.msg_detail [1] = '' // error.is_errortext
END IF
end event

event close;this.event ue_ok()
end event

type dw_response from w_vzt_base_response`dw_response within w_vzt_base_error
int X=23
int Y=4
int Width=1655
int Height=988
string DataObject="d_vzt_error"
end type

event dw_response::constructor;call super::constructor;_selection_service = '' 
end event

type cb_2 from w_vzt_base_response`cb_2 within w_vzt_base_error
int X=585
int Width=539
int Height=68
int TabOrder=30
string Text="e-mail to Tech Support"
boolean Default=false
boolean Cancel=false
int TextSize=-8
FontCharSet FontCharSet=Ansi!
end type

event cb_2::clicked;call super::clicked;string 	ls_dist_list_id, ls_id, ls_now, ls_output_id
long		ll_maxrows, ll_row, ll_ret, ll_rc
datetime	ldt_now
blob 		lblob 


if not IsValid( gnv_appman.inv_mail) then gnv_appman.inv_mail = CREATE uo_vzt_mail 
if not gnv_appman.inv_mail.ib_logged_on then ll_rc = gnv_appman.inv_mail.uf_mail_logon() 

If ll_rc < 0 then 
//MessageBox('Email Send', 'Failed to logon to email.')
  return 
END IF 

string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
string ls_subject 

If IsValid( gnv_appman.ia_myapp) then 
	ls_subject = f_nvl(gnv_appman.ia_myapp.appname,'Application') + ' error.'
ELSE
	ls_subject =  'Application error.'
END IF

ls_mailtoname	[1]	= 'Tech Support'
ls_mailtoid		[1]	= 'victorz@yahoo.com'

ll_ret = gnv_appman.inv_mail.uf_mail_send_no_logon( ls_subject,error.is_errortext , ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
	
IF ll_ret >= 0 then 
	MessageBox('Email Send', 'Error report e-mailed.')
ELSE
	MessageBox('Email Send', 'Failed to e-maile error report.')
END IF 
 
end event

type cb_1 from w_vzt_base_response`cb_1 within w_vzt_base_error
int X=18
int Width=137
int Height=68
int TabOrder=20
int TextSize=-8
FontCharSet FontCharSet=Ansi!
end type

type cb_3 from commandbutton within w_vzt_base_error
int X=160
int Y=1016
int Width=416
int Height=68
int TabOrder=40
string Text="Copy to Clipboard"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Clipboard( error.is_errortext)
end event

type sle_1 from singlelineedit within w_vzt_base_error
int X=1134
int Y=1016
int Width=562
int Height=68
int TabOrder=40
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

