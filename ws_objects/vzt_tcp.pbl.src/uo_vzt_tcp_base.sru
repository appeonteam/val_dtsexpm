$PBExportHeader$uo_vzt_tcp_base.sru
forward
global type uo_vzt_tcp_base from userobject
end type
type cbx_keep from checkbox within uo_vzt_tcp_base
end type
type ole_tcp1 from olecustomcontrol within uo_vzt_tcp_base
end type
type uo_trace1 from nvo_trace within uo_vzt_tcp_base
end type
type cbx_crlf from checkbox within uo_vzt_tcp_base
end type
type cbx_wrap from checkbox within uo_vzt_tcp_base
end type
type cb_info from commandbutton within uo_vzt_tcp_base
end type
type st_wait from statictext within uo_vzt_tcp_base
end type
type sle_wait from singlelineedit within uo_vzt_tcp_base
end type
type st_state from statictext within uo_vzt_tcp_base
end type
type cb_1 from commandbutton within uo_vzt_tcp_base
end type
type st_message from statictext within uo_vzt_tcp_base
end type
type cb_disconnect from commandbutton within uo_vzt_tcp_base
end type
type cb_connect from commandbutton within uo_vzt_tcp_base
end type
type st_port from statictext within uo_vzt_tcp_base
end type
type st_host from statictext within uo_vzt_tcp_base
end type
type sle_port from singlelineedit within uo_vzt_tcp_base
end type
type sle_host from singlelineedit within uo_vzt_tcp_base
end type
type st_out from statictext within uo_vzt_tcp_base
end type
type sle_out from singlelineedit within uo_vzt_tcp_base
end type
type mle_in from multilineedit within uo_vzt_tcp_base
end type
type st_in from statictext within uo_vzt_tcp_base
end type
end forward

global type uo_vzt_tcp_base from userobject
integer width = 1449
integer height = 908
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event type integer ue_connect ( string as_host,  long al_port )
event ue_disconnect ( )
event ue_send ( string as_string )
event ue_onreceive ( string as_incoming )
event type string ue_send_pre ( string as_string )
event ue_connected ( )
event ue_sent_data ( )
event ue_info ( )
event type integer ue_send_command ( string as_cur_state,  string as_command,  string as_new_state,  boolean ab_reset_nack,  boolean ab_init )
event type integer ue_send_command_resp ( )
event ue_constructor ( )
event ue_destructor ( )
event ue_constructor_get_parms ( )
cbx_keep cbx_keep
ole_tcp1 ole_tcp1
uo_trace1 uo_trace1
cbx_crlf cbx_crlf
cbx_wrap cbx_wrap
cb_info cb_info
st_wait st_wait
sle_wait sle_wait
st_state st_state
cb_1 cb_1
st_message st_message
cb_disconnect cb_disconnect
cb_connect cb_connect
st_port st_port
st_host st_host
sle_port sle_port
sle_host sle_host
st_out st_out
sle_out sle_out
mle_in mle_in
st_in st_in
end type
global uo_vzt_tcp_base uo_vzt_tcp_base

type variables
string  	is_host, is_last_error, ls_last_errnum, is_input
long	il_port
boolean	ib_echo, ib_display_errors=true , ib_wrap=false, ib_crlf=false
boolean 	ib_add_lrc=FALSE, ib_tran_done=false
boolean	ib_emsg=true , ib_reconnect=false, ib_ole_used=true
string	STX = '', ETX = '', ACK='', NAK=''
string	is_state, is_command, is_ret_parsed[], is_resp[]
int	ii_commandwait=0 // wait time after each send
int 	ii_tran_success=0, ii_timeout = 10, ii_resp_count
int	ii_resp_max
string	is_trantype, is_err_msg, crlf='~r~n'

constant  int ii_tcpClosed=0
constant  int ii_tcpConnecting=1
constant  int ii_tcpConnected=2
constant  int ii_tcpClosing=3

int	ii_NAK_count=0, ii_NAK_max=2
int	ii_out_NAK_count=0, ii_out_NAK_max=2
int	ii_NAK_wait=2, ii_out_NAK_wait=2
end variables

forward prototypes
public subroutine of_setenable (boolean b)
public function integer of_sethost (string as_host, long al_port)
public function integer of_setstate (string as_state)
public function string of_calc_lrc (string as_string)
public function string of_geterror ()
public subroutine of_setmsg (boolean ab_msg)
public function integer of_verify_connection ()
public function integer of_keep (boolean ab_keep)
end prototypes

event type integer ue_connect(string as_host, long al_port);mle_in.Text = ""                			// Clear the log window
if len(as_host) > 0 then 
	is_Host =  as_Host 
	il_Port =  al_Port 
Else
	is_Host =  sle_host.text
	il_Port =  long(sle_port.text)
END IF 
ib_echo = True
if il_Port = 7 Then 	ib_echo = False // If this is the echo port, don't echo

uo_trace1.event ue_trace( "ue_connect","is_Host="+is_Host+', port:'+string(il_Port ))
// Don't block
is_last_error =''
ole_tcp1.object.Timeout = 0		
ole_tcp1.object.connect(is_Host, il_Port)

ii_NAK_count 		= 0 
ii_out_NAK_count 	= 0 
		
int li_ret
li_ret = 1
If len(is_last_error) > 0 then
	li_ret = -1
Else
	If this.visible then st_message.text = 'Connecting to '+ is_host +' at port ' + string( il_port)
	of_setstate( 'CONNECTING') 
END IF
return li_ret
end event

event ue_disconnect;If ib_ole_used then ole_tcp1.object.close
is_last_error		= ''
ib_echo = True
ii_NAK_count 		= 0 
ii_out_NAK_count 	= 0 

this.of_setstate	 ('NOT CONNECTED')
end event

event ue_send(string as_string);string ls_string 
if is_state = 'NOT CONNECTED' or is_state = 'RESTART' then return

ls_string = this.event ue_send_pre(as_string)
mle_in.text = mle_in.text + crlf + 'client:' + ls_string + '<END>' 

uo_trace1.event ue_trace( "vzt_tcp_base ue_send","before ver. connection. ls_string="+ls_string+crlf+'state='+is_state)
this.of_verify_connection() // VZ 2006 0202
uo_trace1.event ue_trace( "vzt_tcp_base ue_send","after ver. connection. ls_string="+ls_string+crlf+'state='+is_state)


long ll_retry 
long ll_state 
FOR ll_retry = 1 to 30 
	ll_state = ole_Tcp1.object.State 
	if ll_state  = ii_tcpConnected Then
		ole_tcp1.object.send(ls_string)
		ll_retry = 9999
	else
		uo_trace1.event ue_trace( "vzt_tcp_base ue_send","RETRY ll_retry="+string(ll_retry)+crlf+ 'll_state='+string(ll_state)) 
		f_wait(2)
	end if
NEXT

if ii_commandwait > 0 then 
	if this.visible then sle_wait.backcolor = RGB( 200, 100, 100)
	f_wait( ii_commandwait )
	if this.visible then sle_wait.backcolor = RGB( 255, 255, 255)
End If 


end event

event ue_onreceive;// do something on remote input


end event

event ue_send_pre;// default processing: wrap in STX ETX if any

IF ib_add_lrc then as_string = as_string + of_calc_lrc( as_string ) // add check sum char

if ib_wrap then
	return STX + as_string + ETX
elseif ib_crlf then
	return as_string + '~r~n' 
else
	return as_string  
end if 
end event

event ue_connected;If this.visible then st_message.text = 'Connected to '+ is_host +' at port ' + string( il_port)
of_setstate( 'CONNECTED') 


end event

event ue_sent_data;// ole_tcp1.SendBufferCount

end event

event ue_info;string ls_info

ls_info = ''
ls_info += '~n~rState: ' + string( ole_Tcp1.object.State ) 
ls_info += '~n~rHost: ' + ole_Tcp1.object.RemoteAddress  
ls_info += '~n~rPort: ' + string( ole_Tcp1.object.RemotePort) 
ls_info += '~n~rLocalAddress : ' + ole_Tcp1.object.LocalAddress  
ls_info += '~n~rLocal Port: ' + string( ole_Tcp1.object.LocalPort) 

MessageBox('VZT TCP Status Info', ls_info)
end event

event ue_send_command;IF ab_init then 
	ii_commandwait = 0
	sle_wait.text 	= string(ii_commandwait )
	is_input 		= '' 
	is_ret_parsed  = {''}
END IF

If as_cur_state = is_state then 				//'PAGE1_PAGE_OK' 
	is_command 	= as_command 					
	If trim(is_command) = 'PAGER' then // pager id missing
		is_last_error = 'pager id missing'
		this.event post dynamic ue_disconnect()
		this.event post dynamic ue_end_tran()
	END IF
	if is_last_error = '' then 
		this.of_setstate	 (as_new_state) 		// 'PAGE1_MESS') 
		if ab_reset_nack then ii_NAK_count = 0
		this.event ue_send ( is_command )
		return 1
	end if
END IF

return 0
end event

event ue_constructor;if isValid(ole_tcp1) and ib_ole_used then ole_tcp1.object.timeout = 0

end event

event ue_destructor;if ib_ole_used then 
	ole_tcp1.object.close
end if
end event

public subroutine of_setenable (boolean b); 
if b Then
	st_message.text 	= "Connected to " + ole_Tcp1.object.RemoteAddress + " on port " + string(ole_Tcp1.object.RemotePort)
else
   st_message.text	= 'Not Connected'
end if


end subroutine

public function integer of_sethost (string as_host, long al_port);is_host = as_host
il_port = al_port

if sle_port.visible and sle_host.visible then
	sle_host.text = as_host
	sle_port.text = string( il_port )
end if

return 0
end function

public function integer of_setstate (string as_state);is_state = as_state
if st_state.visible then st_state.text = as_state
return 0
end function

public function string of_calc_lrc (string as_string);string 	ls_lrc, ls_curr_char 	
int 		li_len, li_char, 			li_byte, li_power, li_temp_char
int		li_bits[8] = {0,0,0,0,0,0,0,0} 

ls_lrc=CHAR(0)

//as_string ='12345' + char(3) 
li_len = LEN (as_string)

li_byte = 0 
IF li_len > 0 then 
	FOR li_char = 1 to li_len  
		ls_curr_char = MID(as_string, li_char,1)
		li_temp_char = ASC( ls_curr_char )
	 	int li_bit
		FOR li_bit = 1 to 8 
			li_power = 2^(8 - li_bit) 
			IF li_temp_char >= li_power then 				// '1'
				li_temp_char = li_temp_char - li_power 
				if li_bits[li_bit] = 1 then 
					li_bits[li_bit] = 0 
				else
					li_bits[li_bit] = 1
				end if
			ELSE												// '0'
				// 0 OR X = X, so no code needed 
			END IF
		NEXT 
	NEXT 
	
END IF

li_temp_char = 0
FOR li_bit = 1 to 8 
	if li_bits[li_bit] = 1 then li_temp_char = li_temp_char +  2^(8 - li_bit) 
NEXT 
ls_lrc = CHAR(li_temp_char )

return ls_lrc
end function

public function string of_geterror ();return is_err_msg
end function

public subroutine of_setmsg (boolean ab_msg);ib_emsg = ab_msg
end subroutine

public function integer of_verify_connection ();int li_ret
long ll_state

li_ret = 1
ll_state = ole_Tcp1.object.State 
uo_trace1.event ue_trace( "vzt_tcp_base of_verify_connection"," state="+string(ll_state))
if ll_state  = ii_tcpConnected Then
	// all ok
ELSE
	uo_trace1.event ue_trace( "vzt_tcp_base of_verify_connection","NOT CONNECTED, reconnecting... "+'state='+string(ll_state))
	this.event ue_connect ('',0) // try reconnecting
	ll_state = ole_Tcp1.object.State 
	if ll_state  <> ii_tcpConnected then
		uo_trace1.event ue_trace( "vzt_tcp_base of_verify_connection","FAILED reconnecting... "+'state='+string(ll_state))
		li_ret = -1
	end if
END IF

return li_ret

end function

public function integer of_keep (boolean ab_keep);cbx_keep.checked = ab_keep
return 1
end function

on uo_vzt_tcp_base.create
this.cbx_keep=create cbx_keep
this.ole_tcp1=create ole_tcp1
this.uo_trace1=create uo_trace1
this.cbx_crlf=create cbx_crlf
this.cbx_wrap=create cbx_wrap
this.cb_info=create cb_info
this.st_wait=create st_wait
this.sle_wait=create sle_wait
this.st_state=create st_state
this.cb_1=create cb_1
this.st_message=create st_message
this.cb_disconnect=create cb_disconnect
this.cb_connect=create cb_connect
this.st_port=create st_port
this.st_host=create st_host
this.sle_port=create sle_port
this.sle_host=create sle_host
this.st_out=create st_out
this.sle_out=create sle_out
this.mle_in=create mle_in
this.st_in=create st_in
this.Control[]={this.cbx_keep,&
this.ole_tcp1,&
this.uo_trace1,&
this.cbx_crlf,&
this.cbx_wrap,&
this.cb_info,&
this.st_wait,&
this.sle_wait,&
this.st_state,&
this.cb_1,&
this.st_message,&
this.cb_disconnect,&
this.cb_connect,&
this.st_port,&
this.st_host,&
this.sle_port,&
this.sle_host,&
this.st_out,&
this.sle_out,&
this.mle_in,&
this.st_in}
end on

on uo_vzt_tcp_base.destroy
destroy(this.cbx_keep)
destroy(this.ole_tcp1)
destroy(this.uo_trace1)
destroy(this.cbx_crlf)
destroy(this.cbx_wrap)
destroy(this.cb_info)
destroy(this.st_wait)
destroy(this.sle_wait)
destroy(this.st_state)
destroy(this.cb_1)
destroy(this.st_message)
destroy(this.cb_disconnect)
destroy(this.cb_connect)
destroy(this.st_port)
destroy(this.st_host)
destroy(this.sle_port)
destroy(this.sle_host)
destroy(this.st_out)
destroy(this.sle_out)
destroy(this.mle_in)
destroy(this.st_in)
end on

event constructor;// PowerTCP in non-blocking mode.
// Set Timeout to Zero!
ib_echo = true 

this.event ue_constructor_get_parms ()
this.event post ue_constructor ()
of_SetEnable(False)
is_last_error = '' 
this.of_setstate	 ('NOT CONNECTED')
ib_crlf = cbx_crlf.CHECKED 
is_ret_parsed = {'','','','','','','','','','','','','','','','','','','',''}
//is_before_line_char 	= ''
//is_after_line_char		= ''
//ii_commandwait = 1 // seconds to wait after send 
end event

event destructor;cbx_keep.checked = false 
this.event ue_destructor ()

end event

type cbx_keep from checkbox within uo_vzt_tcp_base
integer x = 649
integer y = 352
integer width = 233
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "keep"
boolean checked = true
end type

type ole_tcp1 from olecustomcontrol within uo_vzt_tcp_base
event state ( )
event ocx_error ( integer number,  string description )
event receive ( )
event send ( )
integer x = 23
integer y = 768
integer width = 128
integer height = 112
integer taborder = 30
borderstyle borderstyle = stylelowered!
string binarykey = "uo_vzt_tcp_base.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event state();// State has changed!
// Enable or disable what needs to be enabled or disabled
long ll_state 
ll_state = ole_Tcp1.object.State 
uo_trace1.event ue_trace( "ocx_state","ll_state ="+string(ll_state ))

if ll_state  = ii_tcpConnected Then
	of_SetEnable(True)
	parent.event post ue_connected()
else
  	of_SetEnable(False) 
	parent.of_setstate	 ('NOT CONNECTED') //ll_state  = ii_tcpClosing or 
	if (ll_state = ii_tcpClosed ) and cbx_keep.checked then 
		parent.event ue_connect('',0)
	end if
	if (ll_state = ii_tcpClosing ) and cbx_keep.checked then 
		f_wait(2)
	end if
end if
is_last_error = '' // reset error 
end event

event ocx_error(integer number, string description);// Display truncated message for select error numbers
// Otherwise display number and raw message

if not ib_display_errors then return 

ls_last_errnum = string ( number ) 

Choose Case ls_last_errnum
	Case '11001'
	 is_last_error = "Host not Found!" 
	Case '10057'
	 is_last_error = "Send attempted without connection!"
	Case else
	 is_last_error = "Error #" + ls_last_errnum + ": " + description
End choose

uo_trace1.event ue_trace( "ocx_error","is_last_error="+is_last_error+crlf+'ls_last_errnum='+ls_last_errnum)

parent.POST event ue_disconnect() 
if ib_emsg then messagebox("VZT TCP Error", is_last_error, exclamation! )
st_message.text = is_last_error


end event

event receive;string ls_input										// var to receive into
ole_tcp1.object.receive(REF ls_input)		 	// Receive the string (MUST BE BY REF!!!)
is_input = ls_input 
if parent.visible then 
	mle_in.text = mle_in.text + '~r~n' + 'server:'+ ls_input 	// Display the string	
end if
parent.event ue_onreceive ( ls_input ) 
end event

event send;parent.event ue_sent_data ()
end event

type uo_trace1 from nvo_trace within uo_vzt_tcp_base
integer x = 183
integer y = 784
integer width = 873
integer taborder = 20
long backcolor = 30388123
end type

on uo_trace1.destroy
call nvo_trace::destroy
end on

type cbx_crlf from checkbox within uo_vzt_tcp_base
integer x = 1147
integer y = 352
integer width = 229
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "crlf"
boolean checked = true
end type

event clicked;ib_crlf = cbx_crlf.CHECKED 
end event

type cbx_wrap from checkbox within uo_vzt_tcp_base
integer x = 905
integer y = 352
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "wrap"
end type

event clicked;ib_wrap = cbx_wrap.CHECKED 
end event

type cb_info from commandbutton within uo_vzt_tcp_base
integer x = 1083
integer y = 496
integer width = 297
integer height = 52
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "info"
end type

event clicked;parent.event ue_info()
end event

type st_wait from statictext within uo_vzt_tcp_base
integer x = 626
integer y = 500
integer width = 178
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "wait"
boolean focusrectangle = false
end type

type sle_wait from singlelineedit within uo_vzt_tcp_base
integer x = 626
integer y = 552
integer width = 178
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;if IsNumber(this.text) then ii_commandwait=Integer (this.text)
end event

type st_state from statictext within uo_vzt_tcp_base
integer x = 5
integer y = 708
integer width = 1408
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Not connected......"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within uo_vzt_tcp_base
integer x = 1083
integer y = 424
integer width = 297
integer height = 68
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "send"
end type

event clicked;parent.event ue_send (trim(sle_out.Text) )
end event

type st_message from statictext within uo_vzt_tcp_base
integer x = 5
integer y = 648
integer width = 1408
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Not connected......"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_disconnect from commandbutton within uo_vzt_tcp_base
integer x = 1083
integer y = 552
integer width = 297
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "disconnect"
end type

event clicked;parent.event ue_disconnect ()

end event

type cb_connect from commandbutton within uo_vzt_tcp_base
integer x = 818
integer y = 552
integer width = 247
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "connect"
end type

event clicked;parent.event ue_connect ('',0)
end event

type st_port from statictext within uo_vzt_tcp_base
integer x = 439
integer y = 500
integer width = 178
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "port:"
boolean focusrectangle = false
end type

type st_host from statictext within uo_vzt_tcp_base
integer y = 500
integer width = 178
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "host:"
boolean focusrectangle = false
end type

type sle_port from singlelineedit within uo_vzt_tcp_base
integer x = 439
integer y = 552
integer width = 178
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "7"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_host from singlelineedit within uo_vzt_tcp_base
integer y = 552
integer width = 425
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "127.0.0.1"
borderstyle borderstyle = stylelowered!
end type

type st_out from statictext within uo_vzt_tcp_base
integer x = 5
integer y = 352
integer width = 443
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Outgoing Text:"
boolean focusrectangle = false
end type

type sle_out from singlelineedit within uo_vzt_tcp_base
event keydown pbm_keydown
integer y = 416
integer width = 1061
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

event keydown;if Key = KeyEnter! then
	if ib_echo then mle_in.ReplaceText(sle_out.Text + "~r~n")
	//ole_tcp1.object.send(sle_out.Text + "~r~n")
	parent.event ue_send (sle_out.Text )
	sle_out.Text = ""
end if
end event

type mle_in from multilineedit within uo_vzt_tcp_base
event keydown pbm_keydown
integer x = 9
integer y = 52
integer width = 1367
integer height = 300
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8388608
boolean vscrollbar = true
boolean autohscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_in from statictext within uo_vzt_tcp_base
integer x = 5
integer width = 489
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Incoming Text:"
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Euo_vzt_tcp_base.bin 
2C00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000b71a88b001c6367900000003000000800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000340000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004ca4fc24b11d1c65c00006faa0000000000000000b71a88b001c63679b71a88b001c63679000000000000000000000000fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00350031003000310032002d0038002d003000350037002d0033003500330039003a00370038003200320039003800320032003200000000000000000000000000000300000002e5000002e50000000b753000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080076640000000000000000202eff2000000024000000180000000c0000000400000002000000110000002000000190000000000000000200000003212200200020002e43000000000000ff0000004000000021000000250000001100000000000000000000000000000000000000000000000008006c6100000000000001e400000170000000000000002500000013000000000000000000000190ff00000032010203006f004d00650064006e007200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f004d00650064006e0072000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000100000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Euo_vzt_tcp_base.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
