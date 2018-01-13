$PBExportHeader$w_vzt_mail_queue.srw
forward
global type w_vzt_mail_queue from w_vzt_base
end type
type cb_mail_logon from commandbutton within w_vzt_mail_queue
end type
end forward

global type w_vzt_mail_queue from w_vzt_base
int Width=2575
int Height=1018
boolean TitleBar=true
string Title="Mail Inbox Queue"
cb_mail_logon cb_mail_logon
end type
global w_vzt_mail_queue w_vzt_mail_queue

type variables
uo_vzt_mail	inv_mail 
end variables

on w_vzt_mail_queue.create
int iCurrent
call super::create
this.cb_mail_logon=create cb_mail_logon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_mail_logon
end on

on w_vzt_mail_queue.destroy
call super::destroy
destroy(this.cb_mail_logon)
end on

event close;If IsValid( inv_mail ) then inv_mail.uf_mail_logoff()
If IsValid( inv_mail ) then DESTROY inv_mail 


end event

event open;call super::open;ib_resizeenabled = true 

inv_mail = CREATE uo_vzt_mail
inv_mail.uf_mail_get_inbox( true ) 
inv_mail.ids_mail_queue.ShareData ( dw_data) 

end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		
		cb_mail_logon.y=newheight - ii_resizeband_y - cb_mail_logon.height
		
	End IF 
End IF 	
end event

event ue_assign_menu;//over
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_mail_queue
boolean Visible=false
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_mail_queue
int X=2377
int Y=1043
int TabOrder=20
end type

type cb_close from w_vzt_base`cb_close within w_vzt_mail_queue
int TabOrder=40
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_mail_queue
int TabOrder=100
end type

type cb_save from w_vzt_base`cb_save within w_vzt_mail_queue
int X=2158
int Y=1043
int TabOrder=80
boolean Visible=false
end type

type cb_select from w_vzt_base`cb_select within w_vzt_mail_queue
int X=1938
int Y=1043
int TabOrder=70
boolean Visible=false
end type

type cb_new from w_vzt_base`cb_new within w_vzt_mail_queue
int X=2736
int Y=1043
int TabOrder=90
boolean Visible=false
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_mail_queue
int X=1360
int Y=1043
int TabOrder=60
boolean Visible=false
end type

type cb_search from w_vzt_base`cb_search within w_vzt_mail_queue
int X=1712
int Y=1043
int TabOrder=50
boolean Visible=false
end type

type dw_data from w_vzt_base`dw_data within w_vzt_mail_queue
int Y=29
int Height=771
int TabOrder=30
string DataObject="d_vzt_mail_queue"
end type

type dw_print from w_vzt_base`dw_print within w_vzt_mail_queue
int TabOrder=110
end type

type cb_mail_logon from commandbutton within w_vzt_mail_queue
int X=37
int Y=816
int Width=333
int Height=77
int TabOrder=120
boolean BringToTop=true
string Text="Mail Logoff"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;If Not IsValid( inv_mail ) then return 

If this.text = 'Mail Logon' then
	inv_mail.uf_mail_logon()
	this.text = 'Mail Logoff'
ELSE
	inv_mail.uf_mail_logoff()
	this.text = 'Mail Logon'
END IF 
end event

