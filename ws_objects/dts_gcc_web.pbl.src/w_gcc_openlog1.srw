$PBExportHeader$w_gcc_openlog1.srw
forward
global type w_gcc_openlog1 from window
end type
type st_7 from statictext within w_gcc_openlog1
end type
type st_vz2 from statictext within w_gcc_openlog1
end type
type p_1 from picture within w_gcc_openlog1
end type
type st_5 from statictext within w_gcc_openlog1
end type
type st_4 from statictext within w_gcc_openlog1
end type
type st_regsite from statictext within w_gcc_openlog1
end type
type st_regserialno from statictext within w_gcc_openlog1
end type
type st_9 from statictext within w_gcc_openlog1
end type
type st_8 from statictext within w_gcc_openlog1
end type
type st_regversion from statictext within w_gcc_openlog1
end type
type st_regcompany from statictext within w_gcc_openlog1
end type
type st_regname from statictext within w_gcc_openlog1
end type
type st_6 from statictext within w_gcc_openlog1
end type
type st_3 from statictext within w_gcc_openlog1
end type
type st_1 from statictext within w_gcc_openlog1
end type
type st_warning from statictext within w_gcc_openlog1
end type
type cb_2 from commandbutton within w_gcc_openlog1
end type
type cb_1 from commandbutton within w_gcc_openlog1
end type
type mle_1 from multilineedit within w_gcc_openlog1
end type
type gb_2 from groupbox within w_gcc_openlog1
end type
type gb_1 from groupbox within w_gcc_openlog1
end type
type p_2 from picture within w_gcc_openlog1
end type
type p_3 from picture within w_gcc_openlog1
end type
type gb_3 from groupbox within w_gcc_openlog1
end type
end forward

global type w_gcc_openlog1 from window
boolean visible = false
integer width = 2551
integer height = 768
windowtype windowtype = popup!
long backcolor = 134217728
string icon = "gcc1.ico"
st_7 st_7
st_vz2 st_vz2
p_1 p_1
st_5 st_5
st_4 st_4
st_regsite st_regsite
st_regserialno st_regserialno
st_9 st_9
st_8 st_8
st_regversion st_regversion
st_regcompany st_regcompany
st_regname st_regname
st_6 st_6
st_3 st_3
st_1 st_1
st_warning st_warning
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
gb_2 gb_2
gb_1 gb_1
p_2 p_2
p_3 p_3
gb_3 gb_3
end type
global w_gcc_openlog1 w_gcc_openlog1

type variables
long nTimeoutSecs
datetime dtClick
end variables

event open;pointer oldPointer
int li_len
oldPointer = SetPointer( HourGlass! )
time tNow
date dToday
string cReadINI 
boolean lbsys

// Create appman after connect
gnv_appman = CREATE nvo_vzt_metro_appman     

gnv_appman.is_apptitle		= 'Commentator'
gnv_appman.id_last_updated = date( '06/10/2005') 
gnv_appman.is_version		= '2.7'

lbsys = f_System_Setup()   
If not lbsys  Then
	MessageBox( "System Initialization ERROR", &
	  "Unable to complete SYSTEM SETUP!  Shutting down system.", StopSign! )
	HALT
End If

If nScreenWidth > This.Width Then
	This.X = (nScreenWidth / 2) - (This.Width / 2)
Else
	This.X = 0
	nScreenWidth = This.Width
End If
If nScreenHeight > This.Height Then
	This.Y = (nScreenHeight / 2) - (This.Height / 2)
Else
	This.Y = 0
	nScreenHeight = This.Height
End If
cb_1.Text = cb_1.Text + Space(1) + 'GCC'
st_regname.Text 		= cRegName
st_regcompany.Text 	= cRegCompany
st_regsite.Text 		= cRegSite
st_regversion.Text 	= cAppVersion
st_regserialno.Text 	= cRegSerNumber

cAppName			= 'Commentator'

cAppDB   		= ProfileString(cINIPath + cINIFile, "Database", "DBName", 			"<?>")
cAppDBms 		= ProfileString(cINIPath + cINIFile, "Database", "DBMS", 			"")
cAppServerName = ProfileString(cINIPath + cINIFile, "Database", "DBServerName", 	"")
cAppLogpass 	= ProfileString(cINIPath + cINIFile, "Database", "DBLogPass", 		"")
cAppDBpass  	= ProfileString(cINIPath + cINIFile, "Database", "DBPass", 			"")
cAppDBparm  	= ProfileString(cINIPath + cINIFile, "Database", "DBParm", 			"")
cAppDBUserid  	= ProfileString(cINIPath + cINIFile, "Database", "DBUserid", 		"")
cAppDBLogid  	= ProfileString(cINIPath + cINIFile, "Database", "DBLogid", 		"")
cAppDBtype   	= ProfileString(cINIPath + cINIFile, "Database", "DBType", "")

sqlca.database   = cAppDB
sqlca.servername = cappservername
sqlca.logid      = cappdblogid
sqlca.userid     = cappdbuserid
sqlca.dbms       = cappdbms
sqlca.logpass    = capplogpass
sqlca.logid      = cappdblogid
sqlca.dbpass     = cappdbpass
sqlca.dbparm     = cAppDBparm 

CONNECT USING SQLCA;

// It is a good idea to check if the connection was established.
IF SQLCA.SQLCode <> 0 THEN
	messagebox("Connect",sqlca.sqlerrtext)
	MessageBox( "Connect Error", "A connection to the " + cAppName+&
										  " database could not"+&
								        " be established!", &
					StopSign! )
	HALT Close
END IF

execute immediate "SET TEMPORARY OPTION CONNECTION_AUTHENTICATION='Company=Metromedia &
Software;Application=HotelEXPERT;Signature=000fa55157edb8e14d818eb4fe3db41447146f1571g0ee85a830235a7b1519fd17606a739db658a1037'" using SQLCA;

// 10/18/97 SFm SQL Server {
// Set sql server to recognize quoted table and column names
IF cappdbtype = 'MSSQL' THEN
   execute immediate "set quoted_identifier on" ;
END IF
//} end

// don't make these [OK]/[Cancel] buttons visible 'til we're ready
cb_1.Visible = True
cb_2.Visible = True
cReadINI = ProfileString( cINIPath+cINIFile, "Application", "LogoCancelButton", "yes" )
li_len =Pos( Upper( Left( cReadINI, 1 ) ), "Y" )
If Pos( Upper( Left( cReadINI, 1 ) ), "Y" ) > 0 Then
	cb_2.Enabled = True
Else
	cb_2.Enabled = False
End If

// little accelerator-key problem
cb_1.SetFocus()	// [OK] button

// The number of seconds we leave the logo on-screen before we go into the app
// [Enter] goes automatically
this.nTimeoutSecs = ProfileInt( cINIPath +cINIFile, "Application", "LogoTimeoutSeconds", 60 )

//// We'll trigger a Clicked for the [OK] button to timeout.
tNow 		= Now()
dToday  	= Today()
dtClick 	= DateTime( dToday, RelativeTime( tNow, Abs( this.nTimeoutSecs ) ) )
// traversed midnight?
If Time( dtClick ) < tNow Then
	dtClick = DateTime( RelativeDate( Date(dtClick), 1 ), &
								Time( dtClick ) )
End If

Timer( .55, this )  // VZ NO SPLASH as requested. 
this.visible = true  

SetPointer( oldPointer )

gnv_appman.event ue_getsysoptions()
//cb_1.Event Clicked()



end event

event timer;time tNow
date dToday
datetime dtClicked

dToday		= Today()
tNow 			= Now()
dtClicked 	= dtClick

Timer( 0, this )
If DateTime( dToday, tNow ) >= dtClick Then
	Beep(2)
	// If over 0 then click [OK], under 0 click [Cancel], 0 then do nada
	// if setting from ABS setting conflicts with button availability, then
	// respect button availability (button overrides > or < 0).  With this
	// decision, you prevent the Click! event so the windows message queue
	// won't overload with unsent messages. (Enabled=False prevents receipt
	// of message from windows to PB3 runtime DLL's.)
	// Now we'll proceed to (perhaps) click the proper button
	//
	If this.ntimeoutsecs > 0 Then
		If cb_1.Enabled = True Then		// don't rack up the queue
			cb_1.TriggerEvent( Clicked! )
		End If
	ElseIf this.ntimeoutsecs < 0 Then
		If cb_2.Enabled = True Then		// don't rack up the queue
			cb_2.TriggerEvent( Clicked! )
		End If
	Else
		Timer( 0.55, this )
	End If
Else
	Timer( 0.55, this )
End If

end event

on closequery;If cb_2.Enabled = False Then
	Beep(1)
	Message.ReturnValue=1	// don't allow close
End If
end on

on w_gcc_openlog1.create
this.st_7=create st_7
this.st_vz2=create st_vz2
this.p_1=create p_1
this.st_5=create st_5
this.st_4=create st_4
this.st_regsite=create st_regsite
this.st_regserialno=create st_regserialno
this.st_9=create st_9
this.st_8=create st_8
this.st_regversion=create st_regversion
this.st_regcompany=create st_regcompany
this.st_regname=create st_regname
this.st_6=create st_6
this.st_3=create st_3
this.st_1=create st_1
this.st_warning=create st_warning
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.p_2=create p_2
this.p_3=create p_3
this.gb_3=create gb_3
this.Control[]={this.st_7,&
this.st_vz2,&
this.p_1,&
this.st_5,&
this.st_4,&
this.st_regsite,&
this.st_regserialno,&
this.st_9,&
this.st_8,&
this.st_regversion,&
this.st_regcompany,&
this.st_regname,&
this.st_6,&
this.st_3,&
this.st_1,&
this.st_warning,&
this.cb_2,&
this.cb_1,&
this.mle_1,&
this.gb_2,&
this.gb_1,&
this.p_2,&
this.p_3,&
this.gb_3}
end on

on w_gcc_openlog1.destroy
destroy(this.st_7)
destroy(this.st_vz2)
destroy(this.p_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_regsite)
destroy(this.st_regserialno)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_regversion)
destroy(this.st_regcompany)
destroy(this.st_regname)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.st_warning)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.p_2)
destroy(this.p_3)
destroy(this.gb_3)
end on

type st_7 from statictext within w_gcc_openlog1
integer x = 133
integer y = 1452
integer width = 2427
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
boolean enabled = false
string text = "WEB Enabled Version"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_vz2 from statictext within w_gcc_openlog1
integer x = 1559
integer y = 560
integer width = 805
integer height = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 33554432
long backcolor = 134217728
boolean enabled = false
string text = " See About screen for additional copyright info"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_gcc_openlog1
integer x = 96
integer y = 76
integer width = 2304
integer height = 404
boolean originalsize = true
string picturename = "Web_Commentator_Logon_Banner_Large.jpg"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_gcc_openlog1
integer x = 800
integer y = 304
integer width = 1138
integer height = 36
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_gcc_openlog1
integer x = 855
integer y = 1896
integer width = 576
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "For the following location:"
boolean focusrectangle = false
end type

type st_regsite from statictext within w_gcc_openlog1
integer x = 937
integer y = 1968
integer width = 864
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regserialno from statictext within w_gcc_openlog1
integer x = 1207
integer y = 1568
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_9 from statictext within w_gcc_openlog1
integer x = 1134
integer y = 2000
integer width = 238
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Serial No.:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_gcc_openlog1
integer x = 882
integer y = 2000
integer width = 238
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Version:"
boolean focusrectangle = false
end type

type st_regversion from statictext within w_gcc_openlog1
integer x = 928
integer y = 1568
integer width = 229
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regcompany from statictext within w_gcc_openlog1
integer x = 937
integer y = 1816
integer width = 864
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regname from statictext within w_gcc_openlog1
integer x = 937
integer y = 1620
integer width = 864
integer height = 68
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_gcc_openlog1
integer x = 855
integer y = 1556
integer width = 640
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "This product is registered to:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_gcc_openlog1
integer x = 155
integer y = 616
integer width = 768
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 33554432
long backcolor = 134217728
boolean enabled = false
string text = "All Rights Reserved"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_gcc_openlog1
integer x = 133
integer y = 552
integer width = 800
integer height = 96
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 33554432
long backcolor = 134217728
boolean enabled = false
string text = " Copyright © 2000-2006"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_warning from statictext within w_gcc_openlog1
integer x = 128
integer y = 1572
integer width = 242
integer height = 68
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16777215
boolean enabled = false
string text = "Warning:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_gcc_openlog1
boolean visible = false
integer x = 1769
integer y = 1552
integer width = 773
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Cancel - Abort Startup"
end type

on clicked;DISCONNECT ;
HALT CLOSE
end on

type cb_1 from commandbutton within w_gcc_openlog1
boolean visible = false
integer x = 105
integer y = 1564
integer width = 800
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&OK - Start"
boolean default = true
end type

event clicked;Open( w_gcc_main )
post Open( w_gcc_main )

end event

type mle_1 from multilineedit within w_gcc_openlog1
integer x = 110
integer y = 1688
integer width = 2464
integer height = 204
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "Warning:    This software is protected by copyright law and international treaties.  Unauthorized distribution and/or duplication  of this software, or any portion of it, may result in severe criminal and/or civil penalties and will be pursued to the maximum extent of the law."
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_gcc_openlog1
integer x = 832
integer y = 1600
integer width = 1029
integer height = 676
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_gcc_openlog1
integer x = 73
integer y = 512
integer width = 2373
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217728
borderstyle borderstyle = styleraised!
end type

type p_2 from picture within w_gcc_openlog1
integer x = 119
integer y = 1648
integer width = 631
integer height = 624
boolean originalsize = true
string picturename = "helogo1.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type p_3 from picture within w_gcc_openlog1
integer x = 1938
integer y = 1648
integer width = 631
integer height = 624
boolean originalsize = true
string picturename = "helogo1.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_gcc_openlog1
integer x = 73
integer y = 40
integer width = 2368
integer height = 472
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217728
borderstyle borderstyle = styleraised!
end type

