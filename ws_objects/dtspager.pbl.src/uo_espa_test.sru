$PBExportHeader$uo_espa_test.sru
forward
global type uo_espa_test from userobject
end type
type cb_3 from commandbutton within uo_espa_test
end type
type cb_bcc from commandbutton within uo_espa_test
end type
type cb_wait from commandbutton within uo_espa_test
end type
type cb_1 from commandbutton within uo_espa_test
end type
type dw_strings from datawindow within uo_espa_test
end type
type dw_ascii from datawindow within uo_espa_test
end type
type cb_sendstring from commandbutton within uo_espa_test
end type
type sle_1 from singlelineedit within uo_espa_test
end type
type cb_clear from commandbutton within uo_espa_test
end type
type st_1 from statictext within uo_espa_test
end type
type cb_send from commandbutton within uo_espa_test
end type
type cb_2 from commandbutton within uo_espa_test
end type
type cb_closelink from commandbutton within uo_espa_test
end type
type dw_parms from datawindow within uo_espa_test
end type
end forward

global type uo_espa_test from userobject
integer width = 3177
integer height = 908
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_3 cb_3
cb_bcc cb_bcc
cb_wait cb_wait
cb_1 cb_1
dw_strings dw_strings
dw_ascii dw_ascii
cb_sendstring cb_sendstring
sle_1 sle_1
cb_clear cb_clear
st_1 st_1
cb_send cb_send
cb_2 cb_2
cb_closelink cb_closelink
dw_parms dw_parms
end type
global uo_espa_test uo_espa_test

type variables
w_send_page	w_sp
//string		crlf='~r~n'
string		is_pager, is_msg
end variables

forward prototypes
public subroutine of_setascii (string as_name, integer ai_code)
end prototypes

public subroutine of_setascii (string as_name, integer ai_code);long ll_row
ll_row = dw_ascii.insertrow(0)
if ll_row > 0 then
	dw_ascii.setitem ( ll_row, 'name', as_name)
	dw_ascii.setitem ( ll_row, 'code', ai_code )
end if

end subroutine

on uo_espa_test.create
this.cb_3=create cb_3
this.cb_bcc=create cb_bcc
this.cb_wait=create cb_wait
this.cb_1=create cb_1
this.dw_strings=create dw_strings
this.dw_ascii=create dw_ascii
this.cb_sendstring=create cb_sendstring
this.sle_1=create sle_1
this.cb_clear=create cb_clear
this.st_1=create st_1
this.cb_send=create cb_send
this.cb_2=create cb_2
this.cb_closelink=create cb_closelink
this.dw_parms=create dw_parms
this.Control[]={this.cb_3,&
this.cb_bcc,&
this.cb_wait,&
this.cb_1,&
this.dw_strings,&
this.dw_ascii,&
this.cb_sendstring,&
this.sle_1,&
this.cb_clear,&
this.st_1,&
this.cb_send,&
this.cb_2,&
this.cb_closelink,&
this.dw_parms}
end on

on uo_espa_test.destroy
destroy(this.cb_3)
destroy(this.cb_bcc)
destroy(this.cb_wait)
destroy(this.cb_1)
destroy(this.dw_strings)
destroy(this.dw_ascii)
destroy(this.cb_sendstring)
destroy(this.sle_1)
destroy(this.cb_clear)
destroy(this.st_1)
destroy(this.cb_send)
destroy(this.cb_2)
destroy(this.cb_closelink)
destroy(this.dw_parms)
end on

event constructor;dw_parms.insertrow(0)

dw_strings.insertrow(0)
dw_strings.SetItem( 1, 'name', 'ATZ&FS0=1&D0Q1&W0'+ CHAR(13) )
dw_strings.insertrow(0)
dw_strings.SetItem( 2, 'name', 'ATDT011496128963496'+ CHAR(13) )


 of_setascii( 'SOH',   1)
 of_setascii( 'STX ',  2)
 of_setascii( 'ETX ',  3)
 of_setascii( 'EOT ',  4)
 of_setascii( 'ENQ ',  5)
 of_setascii( 'ACK ',  6)
 of_setascii( 'NAK ',  21) 
 of_setascii( 'CR ',  13)
 of_setascii( 'LF ',  10)

 of_setascii( 'BS ',  8)
 of_setascii( 'HT ',  9)
 of_setascii( 'NL ',  10)
 of_setascii( 'VT ',  11)
 of_setascii( 'SO ',  14)

 of_setascii( 'SYN ',  22)
 of_setascii( 'ETB ',  23)
 of_setascii( 'CAN ',  24)
 of_setascii( 'EM ',  25)
 of_setascii( 'SUB ',  26)
 of_setascii( 'ESC ',  27)
 of_setascii( 'FS ',  28)
 of_setascii( 'GS ',  29)
 of_setascii( 'RS ',  30)
 of_setascii( 'US ',  31)

dw_ascii.setsort( 'name A')
dw_ascii.sort()

end event

type cb_3 from commandbutton within uo_espa_test
integer x = 2263
integer y = 256
integer width = 357
integer height = 64
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "copy"
end type

event clicked;Clipboard( w_sp.mle_1.text)
end event

type cb_bcc from commandbutton within uo_espa_test
integer x = 2263
integer y = 192
integer width = 357
integer height = 64
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "BCC msg"
end type

event clicked;string ls_bcc
is_msg	= dw_parms.GetItemString( 1, "msg")
ls_bcc = f_vzt_calc_lrc( is_msg)
sle_1.text = ls_bcc 




end event

type cb_wait from commandbutton within uo_espa_test
integer x = 3081
integer y = 656
integer width = 78
integer height = 80
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "w"
end type

event clicked;w_sp.wf_wait_espa('', 0, 'connecting...')
end event

type cb_1 from commandbutton within uo_espa_test
integer x = 2971
integer y = 656
integer width = 101
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cb"
end type

event clicked;sle_1.text = ''
end event

type dw_strings from datawindow within uo_espa_test
integer x = 2263
integer y = 740
integer width = 887
integer height = 148
integer taborder = 20
string dataobject = "d_espa_test_strings"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row <= 0 then 
	CHOOSE CASE dwo.name 
		CASE  'tchar'
			this.setsort( 'name A')
			this.sort()
		CASE  'tcode'		
			this.setsort( 'code A')
			this.sort()
	END CHOOSE
ELSE
	// get char 
	integer li_code
	string ls_name
//	li_code = dw_ascii.getitemnumber( row, 'code') 
	ls_name = this.getitemString( row, 'name') 
//	w_sp.wf_trace( 'string:' + ls_name )
	sle_1.text = ls_name 
END IF 


end event

type dw_ascii from datawindow within uo_espa_test
integer x = 2633
integer y = 8
integer width = 448
integer height = 536
integer taborder = 40
string dataobject = "d_ascii"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row <= 0 then 
	CHOOSE CASE dwo.name 
		CASE  'tchar'
			dw_ascii.setsort( 'name A')
			dw_ascii.sort()
		CASE  'tcode'		
			dw_ascii.setsort( 'code A')
			dw_ascii.sort()
	END CHOOSE
ELSE
	// get char 
	integer li_code
	string ls_name
	li_code = dw_ascii.getitemnumber( row, 'code') 
	ls_name = dw_ascii.getitemString( row, 'name') 
	w_sp.wf_trace( 'ascii,' + ls_name + ':' + string(li_code ) )
	sle_1.text = sle_1.text + char( li_code )
END IF 


end event

type cb_sendstring from commandbutton within uo_espa_test
integer x = 2615
integer y = 656
integer width = 352
integer height = 80
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Send String"
end type

event clicked;string ls_text
ls_text = sle_1.text
w_sp.wf_send_string(ls_text, 0, 'test string') 

end event

type sle_1 from singlelineedit within uo_espa_test
integer x = 2263
integer y = 548
integer width = 818
integer height = 92
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_clear from commandbutton within uo_espa_test
integer x = 2267
integer y = 656
integer width = 334
integer height = 80
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear Trace"
end type

event clicked;w_sp.mle_1.text = '' 
end event

type st_1 from statictext within uo_espa_test
integer x = 2277
integer y = 484
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "DAKS-ESPA"
boolean focusrectangle = false
end type

type cb_send from commandbutton within uo_espa_test
integer x = 2263
integer y = 64
integer width = 357
integer height = 60
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Send"
end type

event clicked;//send_tap_page(sle_pager.text,sle_msg.text)
//timer(0)
is_pager = dw_parms.GetItemString( 1, "pagernum")
is_msg	= dw_parms.GetItemString( 1, "msg")

if w_sp.wf_send_espa_msg(is_pager, is_msg) then
//	w_sp.mle_1.text = w_sp.mle_1.text + crlf+ "Page sent!" + crlf
else
//	w_sp.mle_1.text = w_sp.mle_1.text + crlf+ "Page send error!" +crlf
end if
//timer(0)

end event

type cb_2 from commandbutton within uo_espa_test
integer x = 2263
integer y = 4
integer width = 357
integer height = 60
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Open Port"
end type

event clicked;//gs_settings = dw_parms.GetItemString(1, "settings") 
//gi_comport = integer(dw_parms.GetItemString(1, "port") )
w_sp.wf_portopen()
end event

type cb_closelink from commandbutton within uo_espa_test
integer x = 2263
integer y = 128
integer width = 357
integer height = 64
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close Link"
end type

event clicked;w_sp.wf_send_string(CHAR(CODE_EOT),0, 'Closing transmission...')
//w_sp.mle_1.text = w_sp.mle_1.text + crlf + '--link closed EOT sent----------' + crlf
end event

type dw_parms from datawindow within uo_espa_test
integer x = 5
integer y = 4
integer width = 2226
integer height = 396
integer taborder = 10
string dataobject = "d_espa_test"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

