$PBExportHeader$w_init_login.srw
forward
global type w_init_login from window
end type
type p_1 from picture within w_init_login
end type
type pb_cancel from picturebutton within w_init_login
end type
type pb_ok from picturebutton within w_init_login
end type
type sle_password from singlelineedit within w_init_login
end type
type sle_user from singlelineedit within w_init_login
end type
type st_3 from statictext within w_init_login
end type
type st_2 from statictext within w_init_login
end type
end forward

global type w_init_login from window
integer width = 1422
integer height = 920
boolean titlebar = true
string title = "Login"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217728
string icon = "AppIcon!"
boolean center = true
p_1 p_1
pb_cancel pb_cancel
pb_ok pb_ok
sle_password sle_password
sle_user sle_user
st_3 st_3
st_2 st_2
end type
global w_init_login w_init_login

type variables
string init_user
integer password_attempt=0
end variables

on w_init_login.create
this.p_1=create p_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.sle_password=create sle_password
this.sle_user=create sle_user
this.st_3=create st_3
this.st_2=create st_2
this.Control[]={this.p_1,&
this.pb_cancel,&
this.pb_ok,&
this.sle_password,&
this.sle_user,&
this.st_3,&
this.st_2}
end on

on w_init_login.destroy
destroy(this.p_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.sle_password)
destroy(this.sle_user)
destroy(this.st_3)
destroy(this.st_2)
end on

event open;init_user = ProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
												"Login", "userid", '' )
sle_user.text = init_user

				
end event

event close;if init_user <> sle_user.text then
	SetProfileString(gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile,&
							"Login","userid",sle_user.text)
end if
end event

type p_1 from picture within w_init_login
integer x = 215
integer y = 88
integer width = 946
integer height = 160
string picturename = "HotelEXPERT.bmp"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_init_login
integer x = 763
integer y = 656
integer width = 251
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
string text = "Cancel"
boolean cancel = true
string picturename = "BlankCB.bmp"
vtextalign vtextalign = top!
end type

event clicked;init_user_right = 0
close(parent)
end event

type pb_ok from picturebutton within w_init_login
integer x = 471
integer y = 656
integer width = 251
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
string text = "OK"
boolean default = true
string picturename = "BlankCB.bmp"
vtextalign vtextalign = top!
end type

event clicked;string chk_id, chk_password, chk_rights

select user_id, user_password, user_rights
into :chk_id, :chk_password, :chk_rights
from user_rights
where user_id=:sle_user.text;

if sqlca.sqlcode = 100 then
	MessageBox("Login Error","User ID does not exists. Try again!")
	sle_user.SetFocus()
	return
end if

if sqlca.sqlcode < 0 then
	MessageBox("DB Error",sqlca.sqlerrtext)
	return
end if

if chk_password<>sle_password.text then
	password_attempt++
	if password_attempt >=3 then
		MessageBox("Login Error","Invalid password attempted too many times. Application will close!")
		chk_rights='0' //force to close
	else
		MessageBox("Login Error","Invalid password. Try again!")	
		sle_password.SetFocus()
		return	
	end if
end if

init_user_right = integer(chk_rights)
close (parent)
end event

type sle_password from singlelineedit within w_init_login
integer x = 576
integer y = 460
integer width = 448
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 134217729
long backcolor = 134217739
boolean password = true
borderstyle borderstyle = styleshadowbox!
end type

type sle_user from singlelineedit within w_init_login
integer x = 576
integer y = 320
integer width = 448
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 134217729
long backcolor = 134217739
textcase textcase = lower!
borderstyle borderstyle = styleshadowbox!
end type

type st_3 from statictext within w_init_login
integer x = 229
integer y = 480
integer width = 320
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 27354725
long backcolor = 134217728
string text = "Password"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_init_login
integer x = 251
integer y = 340
integer width = 302
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 27354725
long backcolor = 134217728
string text = "User ID"
alignment alignment = right!
boolean focusrectangle = false
end type

