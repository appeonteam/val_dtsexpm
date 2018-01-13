$PBExportHeader$w_openlog.srw
forward
global type w_openlog from window
end type
type cb_2 from commandbutton within w_openlog
end type
type cb_1 from commandbutton within w_openlog
end type
type dw_1 from datawindow within w_openlog
end type
end forward

global type w_openlog from window
string tag = "HotelEXPERT Paging System Logo"
integer x = 407
integer y = 176
integer width = 2130
integer height = 1108
windowtype windowtype = response!
long backcolor = 80269528
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_openlog w_openlog

on w_openlog.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_openlog.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.insertrow(0)

//messagebox("width",string(this.width))

pointer oldPointer
int li_len
oldPointer = SetPointer( HourGlass! )
time tNow
date dToday
string cReadINI

If not System_Setup() Then
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
//cb_1.Text = cb_1.Text + Space(1) + cAppName


//st_regname.Text 		= cRegName
//st_regcompany.Text 	= cRegCompany
//st_regsite.Text 		= cRegSite

dw_1.SetItem( 1, 'regname', cRegName)
dw_1.SetItem( 1, 'RegCompany', cRegCompany)
dw_1.SetItem( 1, 'RegSite', cRegSite)


//st_regversion.Text 	= cAppVersion
//st_regserialno.Text 	= cRegSerNumber
//st_title_banner.Text = cSysName+" - "+cAppName+" "+cAppVersion+&
//									" for " + cOSName // + " " + cOSVersion
	// This reduces screen flash and sets the pointer before screen paint
This.Visible = True


//this.nTimeoutSecs = ProfileInt( cINIPath +cINIFile, "Application", &
//							"LogoTimeoutSeconds", 60 )

// We'll trigger a Clicked for the [OK] button to timeout.
tNow 		= Now()
dToday  	= Today()
//dtClick 	= DateTime( dToday, RelativeTime( tNow, &
//									Abs( this.nTimeoutSecs ) ) )
// traversed midnight?
//If Time( dtClick ) < tNow Then
//	dtClick = DateTime( RelativeDate( Date(dtClick), 1 ), &
//								Time( dtClick ) )
//End If
Timer( 10, this )
SetPointer( oldPointer )
end event

event timer;close(this)
end event

event mousemove;SetMicroHelp(This.Tag)
end event

event activate;this.move(400,500)
end event

type cb_2 from commandbutton within w_openlog
event mousemove pbm_mousemove
string tag = "Click here to cancel Paging System!"
integer x = 494
integer y = 900
integer width = 288
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancel"
boolean cancel = true
end type

event mousemove;SetMicroHelp(This.Tag)
end event

event clicked;CloseWithReturn (parent, 'cancel')
end event

type cb_1 from commandbutton within w_openlog
event mousemove pbm_mousemove
string tag = "Click here to continue!"
integer x = 160
integer y = 900
integer width = 288
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&OK"
boolean default = true
end type

event mousemove;SetMicroHelp(This.Tag)
end event

event clicked;close(parent)
end event

type dw_1 from datawindow within w_openlog
integer x = 5
integer y = 4
integer width = 2094
integer height = 1080
integer taborder = 10
string dataobject = "d_pager_about"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

