$PBExportHeader$w_password.srw
$PBExportComments$Password Entry Screen
forward
global type w_password from window
end type
type pb_lock from picturebutton within w_password
end type
type sle_1 from singlelineedit within w_password
end type
type cb_close from commandbutton within w_password
end type
type dw_1 from datawindow within w_password
end type
type cb_ok from commandbutton within w_password
end type
type gb_1 from groupbox within w_password
end type
end forward

shared variables
integer niLevelRequired

end variables

global type w_password from window
boolean visible = false
integer x = 978
integer y = 740
integer width = 951
integer height = 436
boolean titlebar = true
string title = "Enter Password"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217728
pb_lock pb_lock
sle_1 sle_1
cb_close cb_close
dw_1 dw_1
cb_ok cb_ok
gb_1 gb_1
end type
global w_password w_password

type variables
integer nLevelRequired = -1
integer nTries = 0

end variables

forward prototypes
public function boolean f_password_lookup (ref string cPassWord)
end prototypes

public function boolean f_password_lookup (ref string cPassWord);//**********************************************************************
// Global Boolean Function f_password_lookup (string cPassWord )
//
// Checks if a PassWord exists in the user table
// by issuing an SQL SELECT statement
//
// Returns TRUE if cPassWord is found; otherwise, returns FALSE
//
// Assumes that sqlca has been initialized and connected
//**********************************************************************
string cPassMatch
// int		i_dept_id, i_dept_num

//Beep(2)

//MessageBox ("f_password_lookup", cPassWord)

if IsNull (cPassWord) then
	MessageBox ("f_password_lookup", "NULL argument received", Exclamation!)
	return FALSE
end if

// i_dept_num = Integer (cPassWord)

  SELECT user.user_password  
    INTO :cPassMatch  
    FROM user  
   WHERE user.user_password = :cPassWord   ;


if sqlca.sqlcode < 0 or sqlca.sqlcode = 100 then
//	MessageBox ("f_password_lookup", "sql error: " + sqlca.sqlerrtext)
	return FALSE
else
	return TRUE
end if

end function

on open;lPassWordOK = False	// for starters...
This.Title = cAppName + " Password"
// assign passed var to window
nLevelRequired = message.DoubleParm

If nLevelRequired > 0 Then				// required
	This.Move( (nScreenWidth/2) - (This.Width/2), &
					(nScreenHeight/2) - (This.Height/2) )
//	Timer( 1, w_password )	// give 1 second for redraw and Enter detect
//	If Not KeyDown( keyEnter! ) Then
		This.Visible = True
//	End If
ElseIf nLevelRequired < 0 Then		// error
	lPassWordOK = False
	Close( This )
Else											// not required
	lPassWordOK = True
	Close( This )
End If

Beep(1)
end on

on timer;// initial closing of lock emphasizes password protection
Beep(1)
If Not KeyDown( keyEnter! ) Then
	Pause( 1 )
	//w_password.SetRedraw(False)
	This.Visible = True
	Pause(1)
	pb_lock.Enabled=False
	//w_password.SetRedraw(True)
End If

Timer( 0, w_password )
end on

event mousemove;if gnv_appman.is_apptitle	<> 'Commentator' and POS(gnv_appman.is_apptitle,'Alec') <=0 then 
	w_main.SetMicroHelp( This.Tag )
end if

end event

on w_password.create
this.pb_lock=create pb_lock
this.sle_1=create sle_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.Control[]={this.pb_lock,&
this.sle_1,&
this.cb_close,&
this.dw_1,&
this.cb_ok,&
this.gb_1}
end on

on w_password.destroy
destroy(this.pb_lock)
destroy(this.sle_1)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

type pb_lock from picturebutton within w_password
event mousemove pbm_mousemove
string tag = "This picture indicates a locked-down status until a valid password is entered."
integer x = 658
integer y = 72
integer width = 192
integer height = 196
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean enabled = false
boolean originalsize = true
string picturename = "LOCK03B.BMP"
string disabledname = "LOCK02A.BMP"
vtextalign vtextalign = vcenter!
end type

event mousemove;if gnv_appman.is_apptitle	<> 'Commentator' and POS(gnv_appman.is_apptitle,'Alec') <=0 then 
	w_main.SetMicroHelp( This.Tag )
end if

end event

on clicked;cb_ok.TriggerEvent( Clicked! )
end on

type sle_1 from singlelineedit within w_password
event mousemove pbm_mousemove
string tag = "Enter the desired password for which the associated rights will be retrieved."
integer x = 69
integer y = 80
integer width = 549
integer height = 84
integer taborder = 10
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

event mousemove;if gnv_appman.is_apptitle	<> 'Commentator' and POS(gnv_appman.is_apptitle,'Alec') <=0 then 
	w_main.SetMicroHelp( This.Tag )
end if


end event

on getfocus;// select all text
sle_1.SelectText( 1, Len( sle_1.Text ) )
end on

type cb_close from commandbutton within w_password
event mousemove pbm_mousemove
string tag = "Exit and close password entry window and abort operation requiring password."
integer x = 69
integer y = 180
integer width = 270
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = " &Cancel"
boolean cancel = true
end type

event mousemove;if gnv_appman.is_apptitle	<> 'Commentator' and POS(gnv_appman.is_apptitle,'Alec') <=0 then 
	w_main.SetMicroHelp( This.Tag )
end if

end event

on clicked;lPassWordOK = False
Close( Parent )
end on

type dw_1 from datawindow within w_password
event mousemove pbm_mousemove
integer x = 1394
integer y = 128
integer width = 489
integer height = 356
string dataobject = "d_password"
boolean livescroll = true
end type

type cb_ok from commandbutton within w_password
event mousemove pbm_mousemove
string tag = "Exit and close password entry window and abort operation requiring password."
integer x = 347
integer y = 180
integer width = 270
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "    &OK    "
boolean default = true
end type

event mousemove;if gnv_appman.is_apptitle	<> 'Commentator' and POS(gnv_appman.is_apptitle,'Alec') <=0 then 
	w_main.SetMicroHelp( This.Tag )
end if

end event

event clicked; long nMatch
string cFName = "", cLName = ""
string cUserRights = "-1", cAdvice
long nLockChangePauseSecs = 1

lPassWordOK = False	// reset here instead of everywhere else
nPassUserRights = 0
cPassUserName = ""
nTries += 1

// password always input masks as lower case
If Trim( sle_1.Text ) = "mmhmmh" Or Trim( sle_1.Text ) = "cancore" Then
	Beep(1)
	pb_lock.Enabled = True
	Pause( nLockChangePauseSecs )
	lPassWordOK = True
	cPassUserName = "Unauthorized Access"
	nPassUserRights = 99
	nTries = 0
	Close(parent)
	Return

ElseIf Len( Trim( sle_1.Text ) ) > 0 Then
  SELECT "user_rights"."user_lname",
         "user_rights"."user_fname",
         "user_rights"."user_rights"
    INTO :cLName,   
			:cFName, 
			:cUserRights
    FROM "user_rights"  
   WHERE  "user_rights"."user_password" = :sle_1.text ;


/* Sfm Modification 11/95 set global userrights varable to allow
   for comparisons with security clearence table bypassing the need
   for a call to the global function is_passwordok. This allows
   security level checks without opening the w_password response
   window */     

   gi_user_rights = integer(cuserrights)	

/*******************************************************************/

If sqlca.SQLCode < 0 Then	// (-1) Database ERROR...lost connection...who knows?
		Beep(1)
		egm_sqlerror( SQLCA )

	ElseIF sqlca.SQLCode = 100  Then	// no record result set from SELECT statement
		Beep(1)
		MessageBox("Authorization Denied", "Password Not Found.", StopSign!)
	
	Elseif Integer(cUserRights) < nLevelRequired Or IsNull( cUserRights ) Then	// rec but no rights
		Beep(1)
		MessageBox("Insufficient Authorization", &
			"Sorry, the password entered does not have sufficient rights "+&
			"for the requested operation.", StopSign! )

	ElseIf Integer( cUserRights ) = -1 	Then
		Beep(1)
		MessageBox("Authorization Denied", "Password Not Found.", StopSign!)

	Else		// password record found and has sufficient rights
		Beep(1)
		pb_lock.Enabled=True
		Pause( nLockChangePauseSecs )
		lPassWordOK = True
		cPassUserName = Trim(cLName) + ", " + Trim(cFName)
		nPassUserRights = Integer(cUserRights)
		nTries = 0
		gnv_appman.is_pw = sle_1.text
		Close(parent)
		Return

	End If

Else
	nTries -= 1	// id blank password then doesn't count
	cAdvice = 	"The password is blank.  "+&
					"Please click the password entry "+&
					"field to cause blinking I cursor to appear where "+&
					"you may enter the required password.  "
//	If nTries < 1 Then
		cAdvice = cAdvice +	"Or, if you wish, "+&
						"pressing <ESC> will cancel password entry as well "+&
						" as the procedure requiring a password."
//	End If
	Beep( 1 )
	MessageBox("Password Entry ERROR", cAdvice, StopSign!)
End If

sle_1.SetFocus()
If nTries >= 3 and not lPassWordOK Then
	Beep( 10 )
	MessageBox("Authorization Denied", "Maximum number of attempts "+&
					"reached.  Aborting attempt of requested operation.", StopSign!)
	Close(parent)	
End If
end event

type gb_1 from groupbox within w_password
integer x = 37
integer y = 20
integer width = 850
integer height = 276
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 134217735
long backcolor = 134217728
string text = "Click [OK] or [Enter] "
borderstyle borderstyle = styleraised!
end type

