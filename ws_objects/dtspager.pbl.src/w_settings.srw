$PBExportHeader$w_settings.srw
$PBExportComments$system settings screen
forward
global type w_settings from window
end type
type cb_update from commandbutton within w_settings
end type
type cb_2 from commandbutton within w_settings
end type
type cb_1 from commandbutton within w_settings
end type
type dw_settings from datawindow within w_settings
end type
end forward

global type w_settings from window
integer x = 1189
integer y = 556
integer width = 2117
integer height = 1228
boolean titlebar = true
string title = "System Settings"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79349703
event ue_ok ( )
event ue_set_new_values ( )
cb_update cb_update
cb_2 cb_2
cb_1 cb_1
dw_settings dw_settings
end type
global w_settings w_settings

event ue_ok;if dw_settings.RowCOunt() > 0 then 
this.event 	ue_set_new_values()
If IsValid( w_send_page ) then w_send_page.event ue_settest()

end if

close(this)
end event

event ue_set_new_values();	if dw_settings.Accepttext() <> 1 then return 
	gi_comport 		= integer( dw_settings.GetItemString( 1, "port" ))
	gs_settings 	= dw_settings.GetItemString( 1, "settings" )
	cpagesyscd 		= dw_settings.GetItemString( 1, "system" )
	gs_debugmode	= dw_settings.GetItemString( 1, "debug" )
	gs_trace			= dw_settings.GetItemString( 1, "trace" )
	
	MAX_RETRIES		= dw_settings.GetItemNumber( 1, "maxretry"  )
	MAX_NAKRETRIES = dw_settings.GetItemNumber( 1, "maxnakretry" )
	MAX_DELAY		= dw_settings.GetItemNumber( 1, "maxdelay"  )

	nPagerIdDigit  = dw_settings.GetItemNumber( 1, "pagerdigits"  )
	
	//messagebox("settings","comport:" + string(gi_comport)+" settings:"+gs_settings+" pageCd:"+cpagesyscd)

end event

on w_settings.create
this.cb_update=create cb_update
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_settings=create dw_settings
this.Control[]={this.cb_update,&
this.cb_2,&
this.cb_1,&
this.dw_settings}
end on

on w_settings.destroy
destroy(this.cb_update)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_settings)
end on

event open;dw_settings.SetTransObject(sqlca)
dw_settings.insertRow(0)

dw_settings.SetItem( 1, "port", string(gi_comport))
dw_settings.SetItem( 1, "settings", gs_settings)
if cpagesyscd = '' then
	cpagesyscd = 'SN2'
end if
dw_settings.SetItem( 1, "system", cpagesyscd)

dw_settings.SetItem( 1, "debug" , gs_debugmode)
dw_settings.SetItem( 1, "trace" , gs_trace	)
dw_settings.SetItem( 1, "maxretry" , MAX_RETRIES	)
dw_settings.SetItem( 1, "maxnakretry" , MAX_NAKRETRIES)
dw_settings.SetItem( 1, "maxdelay" , MAX_DELAY	)

dw_settings.SetItem( 1, "snpp_addr" , gs_snpp_addr)
dw_settings.SetItem( 1, "snpp_port" , gs_snpp_port)

dw_settings.SetItem( 1, "pagerdigits" , nPagerIdDigit)


end event

type cb_update from commandbutton within w_settings
integer x = 1737
integer y = 656
integer width = 329
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Update INI"
end type

event clicked;parent.event 	ue_set_new_values()

string ls_ini
ls_ini			= cINIPath + cINIFile
SetProfileString (ls_ini,"Paging Systems", "PagingSysCd", cPageSysCd)
SetProfileString (ls_ini,"Paging Systems", "ModemBaud", baud)
SetProfileString (ls_ini,"Paging Systems", "CommPort", string(gi_comport))
SetProfileString (ls_ini,"Paging Systems", "Settings", gs_settings)
SetProfileString (ls_ini,"Paging Systems", "Debug", gs_debugmode)
SetProfileString (ls_ini,"Paging Systems", "Trace", gs_trace	)
SetProfileString (ls_ini,"Paging Systems", "MaxRetries",string(MAX_RETRIES ))
SetProfileString (ls_ini,"Paging Systems", "MaxNakRetries",string(MAX_NAKRETRIES))
SetProfileString (ls_ini,"Paging Systems", "MaxDelay",string(MAX_DELAY)	)
SetProfileString (ls_ini,"Paging Systems", "ReadSeconds",string(nPagingRefresh)	)

SetProfileString (ls_ini,"Paging Systems", "SNPPADDR", gs_snpp_addr)
SetProfileString (ls_ini,"Paging Systems", "SNPPPORT", gs_snpp_port)

SetProfileString (ls_ini,"Paging Systems", "PagerIdDigit", string(nPagerIdDigit))

//max_chars_per_blk = SetProfileString (ls_ini,"Paging Systems", "MaxCharsPerBlk","80")
//hiddenDialupBox = SetProfileString (ls_ini,"Paging Systems", "HiddenDialBox","N")
//modem_init_str = SetProfileString (ls_ini,"Paging Systems", "settings",gs_settings)
//modem_dial_str = SetProfileString (ls_ini,"Paging Systems", "ModemDialStr","")
//nPagingRefresh = ProfileInt 	 (cINIPath + cINIFile,"Paging Systems", "ReadSeconds",60)
//nPagerIdDigit  = ProfileInt 	 (cINIPath + cINIFile,"Paging Systems", "PagerIdDigit",7)
//access_number 	= ProfileString (cINIPath + cINIFile,"Paging Systems", "AccessNumber","<?>")
//debug_file 		= ProfileString (cINIPath + cINIFile,"Paging Systems", "DebugFile","<?>")

end event

type cb_2 from commandbutton within w_settings
integer x = 1737
integer y = 220
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
boolean default = true
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_settings
integer x = 1737
integer y = 44
integer width = 329
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;parent.event ue_ok()
end event

type dw_settings from datawindow within w_settings
integer x = 14
integer y = 16
integer width = 1659
integer height = 1052
integer taborder = 10
string dataobject = "d_settings_new"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

