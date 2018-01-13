$PBExportHeader$w_openlog1.srw
$PBExportComments$Opening Logo Screen
forward
global type w_openlog1 from window
end type
type st_6 from statictext within w_openlog1
end type
type st_regname from statictext within w_openlog1
end type
type st_regcompany from statictext within w_openlog1
end type
type st_4 from statictext within w_openlog1
end type
type st_regsite from statictext within w_openlog1
end type
type st_8 from statictext within w_openlog1
end type
type st_9 from statictext within w_openlog1
end type
type st_regversion from statictext within w_openlog1
end type
type st_regserialno from statictext within w_openlog1
end type
type cb_1 from commandbutton within w_openlog1
end type
type cb_2 from commandbutton within w_openlog1
end type
type gb_2 from groupbox within w_openlog1
end type
type pb_logoleft from picturebutton within w_openlog1
end type
type pb_logoright from picturebutton within w_openlog1
end type
type mle_1 from multilineedit within w_openlog1
end type
type st_warning from statictext within w_openlog1
end type
type st_1 from statictext within w_openlog1
end type
type st_3 from statictext within w_openlog1
end type
type st_title_banner from statictext within w_openlog1
end type
type p_1 from picture within w_openlog1
end type
end forward

global type w_openlog1 from window
boolean visible = false
integer width = 2629
integer height = 1424
windowtype windowtype = popup!
long backcolor = 12632256
boolean center = true
st_6 st_6
st_regname st_regname
st_regcompany st_regcompany
st_4 st_4
st_regsite st_regsite
st_8 st_8
st_9 st_9
st_regversion st_regversion
st_regserialno st_regserialno
cb_1 cb_1
cb_2 cb_2
gb_2 gb_2
pb_logoleft pb_logoleft
pb_logoright pb_logoright
mle_1 mle_1
st_warning st_warning
st_1 st_1
st_3 st_3
st_title_banner st_title_banner
p_1 p_1
end type
global w_openlog1 w_openlog1

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

If not f_System_Setup() Then
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
cb_1.Text = cb_1.Text //+ Space(1) + cAppName
st_regname.Text 		= cRegName
st_regcompany.Text 	= cRegCompany
st_regsite.Text 		= cRegSite
st_regversion.Text 	= cAppVersion
st_regserialno.Text 	= cRegSerNumber
st_title_banner.Text = cSysName+" - "+cAppName+" "+cAppVersion+&
									" for " + cOSName + " " + cOSVersion
//	// This reduces screen flash and sets the pointer before screen paint
This.Visible = True

// The SQLCA transaction object is hard coded here instead of reading the
// values from an .INI file.  The sample app MUST use the database
// "SAMPLE".

// In an actual application, the values should be read from an application
// specific .INI file.

//* change 06/01/95 mn
//SQLCA.DBMS = "ODBC"
//SQLCA.DBMS = ProfileString( cINIPath +&
//							"he_dts.ini", "Database", &
//							"DBMS", "ODBC" )
//
////SQLCA.DbParm = "Connectstring='DSN=DTSMAIN;UID=DBA;PWD=SQL'"
//SQLCA.DbParm = ProfileString( cINIPath +&
//							"he_dts.ini", "Database", &
//							"DBParm", "Connectstring='DSN=DTSNEWDB;UID=DBA;PWD=SQL'" )
//
//// PowerSoft recommends expicitly specifying SQLCA even though
//// it is the default.

//* new connect strings
//sqlca.DBMS       = ProfileString ("pb.ini", "database", "dbms",       "")
//sqlca.database   = ProfileString ("pb.ini", "database", "database",   "")
//sqlca.userid     = ProfileString ("pb.ini", "database", "userid",     "")
//sqlca.dbpass     = ProfileString ("pb.ini", "database", "dbpass",     "")
//sqlca.logid      = ProfileString ("pb.ini", "database", "logid",      "")
//sqlca.logpass    = ProfileString ("pb.ini", "database", "LogPassWord", "")
//sqlca.servername = ProfileString ("pb.ini", "database", "servername", "")
//sqlca.dbparm     = ProfileString ("pb.ini", "database", "dbparm",     "")


// 10/26/97 SFM New sql settings from INI file
// sfm 10/25/97  Database Settings 
cAppDB   = ProfileString(cINIPath + cINIFile, "Database", &
									"DBName", "<?>")
cAppDBms = ProfileString(cINIPath + cINIFile, "Database", &
									"DBMS", "")
cAppServerName = ProfileString(cINIPath + cINIFile, "Database", &
									"DBServerName", "")
cAppLogpass = ProfileString(cINIPath + cINIFile, "Database", &
									"DBLogPass", "")
cAppDBpass  = ProfileString(cINIPath + cINIFile, "Database", &
									"DBPass", "")
cAppDBparm  = ProfileString(cINIPath + cINIFile, "Database", &
									"DBParm", "")
cAppDBUserid  = ProfileString(cINIPath + cINIFile, "Database", &
									"DBUserid", "")
cAppDBLogid  = ProfileString(cINIPath + cINIFile, "Database", &
									"DBLogid", "")

cAppDBtype   = ProfileString(cINIPath + cINIFile, "Database", &
									"DBType", "")

cDateFormatStr = ProfileString( cINIPath + cINIFile, "Intl", &
									"DateFormat", "mm/dd/yyyy")
cDateTimeFormatStr = ProfileString( cINIPath + cINIFile, "Intl", &
									"DateTimeFormat", "mm/dd/yyyy hh:mm")
cTimeFormatStr = ProfileString( cINIPath + cINIFile, "Intl", &
									"TimeFormat", "hh:mm:ss")
cReportDateTimeFormatStr = ProfileString( cINIPath + cINIFile, "Intl", &
									"ReportDateTimeFormat", "mm/dd/yyyy hh:mm")
cReportDateFormatStr = ProfileString( cINIPath + cINIFile, "Intl", &
									"ReportDateFormat", "mm/dd/yy")
						
cReportLongDateFormatStr = ProfileString( cINIPath + cINIFile, "Intl", &
									"ReportLongDateFormat", "dddd, mmmm dd, yyyy")
									
cReportLongDateFormatStr1 = ProfileString( cINIPath + cINIFile, "Intl", &
									"ReportLongDateFormat1", "ddd, mmmm d, yyyy")

cReportLongDateFormatStr2 = ProfileString( cINIPath + cINIFile, "Intl", &
									"ReportLongDateFormat2", "mmmm d, yyyy")

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

execute immediate "SET TEMPORARY OPTION CONNECTION_AUTHENTICATION='Company=Metromedia Software;Application=HotelEXPERT;Signature=000fa55157edb8e14d818eb4fe3db41447146f1571g0ee85a830235a7b1519fd17606a739db658a1037'" using SQLCA;


// 10/18/97 SFm SQL Server {
// Set sql server to recognize quoted table and column names
IF cappdbtype = 'MSSQL' THEN 
   execute immediate "set quoted_identifier on" ;
END IF
//} end

//--exp start----------------------------------------------------------
//check expiration
integer li_expired
select vzt_he_expired() into :li_expired from dummy;
If li_expired < 0 then
	timer(0)
	post timer(0)
	MessageBox('Software Expired', 'This copy of HotelEXPERT is expired. Please contact Metromedia Software Support', Exclamation!)
	post close(this)
END IF

If li_expired > 0 then
	MessageBox('Software Is About to Expire', 'This copy of HotelEXPERT is about to expire in '+string(li_expired) +' days. Please contact Metromedia Software Support', Exclamation!)
END IF

//--exp end----------------------------------------------------------


// don't make these [OK]/[Cancel] buttons visible 'til we're ready
cb_1.Visible = True
cb_2.Visible = True
cReadINI = ProfileString( cINIPath+cINIFile, "Application", &
								"LogoCancelButton", "yes" )
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
this.nTimeoutSecs = ProfileInt( cINIPath +cINIFile, "Application", &
							"LogoTimeoutSeconds", 60 )

if this.nTimeoutSecs > 5 then this.nTimeoutSecs = 5 // max out at 5 sec. m.n. 5/20/07

// We'll trigger a Clicked for the [OK] button to timeout.
tNow 		= Now()
dToday  	= Today()
dtClick 	= DateTime( dToday, RelativeTime( tNow, &
									Abs( this.nTimeoutSecs ) ) )
// traversed midnight?
If Time( dtClick ) < tNow Then
	dtClick = DateTime( RelativeDate( Date(dtClick), 1 ), &
								Time( dtClick ) )
End If
Timer( .55, this )
SetPointer( oldPointer )

end event

on timer;time tNow
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

end on

on closequery;If cb_2.Enabled = False Then
	Beep(1)
	Message.ReturnValue=1	// don't allow close
End If
end on

on w_openlog1.create
this.st_6=create st_6
this.st_regname=create st_regname
this.st_regcompany=create st_regcompany
this.st_4=create st_4
this.st_regsite=create st_regsite
this.st_8=create st_8
this.st_9=create st_9
this.st_regversion=create st_regversion
this.st_regserialno=create st_regserialno
this.cb_1=create cb_1
this.cb_2=create cb_2
this.gb_2=create gb_2
this.pb_logoleft=create pb_logoleft
this.pb_logoright=create pb_logoright
this.mle_1=create mle_1
this.st_warning=create st_warning
this.st_1=create st_1
this.st_3=create st_3
this.st_title_banner=create st_title_banner
this.p_1=create p_1
this.Control[]={this.st_6,&
this.st_regname,&
this.st_regcompany,&
this.st_4,&
this.st_regsite,&
this.st_8,&
this.st_9,&
this.st_regversion,&
this.st_regserialno,&
this.cb_1,&
this.cb_2,&
this.gb_2,&
this.pb_logoleft,&
this.pb_logoright,&
this.mle_1,&
this.st_warning,&
this.st_1,&
this.st_3,&
this.st_title_banner,&
this.p_1}
end on

on w_openlog1.destroy
destroy(this.st_6)
destroy(this.st_regname)
destroy(this.st_regcompany)
destroy(this.st_4)
destroy(this.st_regsite)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_regversion)
destroy(this.st_regserialno)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.gb_2)
destroy(this.pb_logoleft)
destroy(this.pb_logoright)
destroy(this.mle_1)
destroy(this.st_warning)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_title_banner)
destroy(this.p_1)
end on

type st_6 from statictext within w_openlog1
integer x = 709
integer y = 780
integer width = 782
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 29743221
boolean enabled = false
string text = "This product is registered to:"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regname from statictext within w_openlog1
integer x = 942
integer y = 856
integer width = 864
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regcompany from statictext within w_openlog1
integer x = 942
integer y = 928
integer width = 864
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_openlog1
integer x = 933
integer y = 1004
integer width = 576
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 29939334
boolean enabled = false
string text = "For the following site:"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regsite from statictext within w_openlog1
integer x = 933
integer y = 1088
integer width = 864
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_openlog1
integer x = 933
integer y = 1188
integer width = 238
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 29939334
boolean enabled = false
string text = "Version:"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_9 from statictext within w_openlog1
integer x = 1184
integer y = 1188
integer width = 238
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 29939334
boolean enabled = false
string text = "Serial No.:"
long bordercolor = 16776960
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regversion from statictext within w_openlog1
integer x = 933
integer y = 1252
integer width = 242
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_regserialno from statictext within w_openlog1
integer x = 1184
integer y = 1252
integer width = 603
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_openlog1
boolean visible = false
integer x = 2953
integer y = 1556
integer width = 384
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&OK - Start"
boolean default = true
end type

on clicked;// Open Main-Menu screen
Open( w_main )

// now close logo screen
//w_openlog1.cb_2.Enabled = True	// for closequery event to succeed...this enforces this as the only way
//Close(w_openlog1)
end on

type cb_2 from commandbutton within w_openlog1
boolean visible = false
integer x = 2949
integer y = 1436
integer width = 389
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean enabled = false
string text = "&Cancel - Abort"
end type

on clicked;DISCONNECT ;
HALT CLOSE
end on

type gb_2 from groupbox within w_openlog1
integer x = 823
integer y = 260
integer width = 1065
integer height = 676
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217728
borderstyle borderstyle = styleraised!
end type

type pb_logoleft from picturebutton within w_openlog1
integer x = 110
integer y = 312
integer width = 645
integer height = 636
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\BMPS\HE\CleanLogoTexturizer.jpg"
end type

type pb_logoright from picturebutton within w_openlog1
boolean visible = false
integer x = 1957
integer y = 316
integer width = 645
integer height = 636
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\BMPS\HE\CleanLogoTexturizer.jpg"
end type

type mle_1 from multilineedit within w_openlog1
integer x = 206
integer y = 1024
integer width = 2350
integer height = 204
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
boolean enabled = false
string text = "Warning:    This software is protected by copyright law and international treaties.  Unauthorized distribution and/or duplication  of this software, or any portion of it, may result in severe criminal and/or civil penalties and will be pursued to the maximum extent of the law."
borderstyle borderstyle = stylelowered!
end type

type st_warning from statictext within w_openlog1
integer x = 242
integer y = 1036
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

type st_1 from statictext within w_openlog1
integer x = 1577
integer y = 472
integer width = 800
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean italic = true
long textcolor = 134217729
long backcolor = 134217728
boolean enabled = false
string text = " Copyright © 1996-2004"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_openlog1
integer x = 1742
integer y = 608
integer width = 768
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean italic = true
long textcolor = 134217729
long backcolor = 134217728
boolean enabled = false
string text = "All Rights Reserved"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_title_banner from statictext within w_openlog1
boolean visible = false
integer x = 78
integer y = 72
integer width = 2574
integer height = 184
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean italic = true
long textcolor = 134217737
long backcolor = 10789024
boolean enabled = false
string text = "HotelEXPERT"
alignment alignment = center!
boolean border = true
long bordercolor = 33554431
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type p_1 from picture within w_openlog1
integer x = 32
integer y = 28
integer width = 2565
integer height = 1356
boolean bringtotop = true
string picturename = "SystemHE.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

