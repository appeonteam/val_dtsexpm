$PBExportHeader$uo_vzt_tcp_metro_page.sru
forward
global type uo_vzt_tcp_metro_page from uo_vzt_tcp_base
end type
type cb_2 from commandbutton within uo_vzt_tcp_metro_page
end type
type p_wait from picture within uo_vzt_tcp_metro_page
end type
type st_waiting from statictext within uo_vzt_tcp_metro_page
end type
type st_pager from statictext within uo_vzt_tcp_metro_page
end type
type cb_2way from commandbutton within uo_vzt_tcp_metro_page
end type
type sle_pager from dropdownlistbox within uo_vzt_tcp_metro_page
end type
type cb_2way_status from commandbutton within uo_vzt_tcp_metro_page
end type
type sle_p2 from singlelineedit within uo_vzt_tcp_metro_page
end type
type sle_p3 from singlelineedit within uo_vzt_tcp_metro_page
end type
type sle_p5 from singlelineedit within uo_vzt_tcp_metro_page
end type
type sle_p4 from singlelineedit within uo_vzt_tcp_metro_page
end type
end forward

global type uo_vzt_tcp_metro_page from uo_vzt_tcp_base
integer width = 2894
integer height = 1208
long backcolor = 79741120
event type integer ue_tran ( string as_trantype,  string as_parm1,  string as_parm2,  string as_parm3,  string as_parm4 )
event ue_snpp_tran ( string as_trantype,  string as_parm1,  string as_parm2,  string as_parm3,  string as_parm4 )
event ue_snpp_onreceive ( string as_incoming )
event ue_get_lock ( )
event ue_free_lock ( )
event ue_end_tran ( )
event ue_timeoutcheck ( )
event type integer ue_validate_interface ( )
event ue_snpp_onreceive_check ( string as_state,  string as_incoming,  integer ai_sublen,  string as_response,  string as_newstate,  boolean ab_parse,  boolean ab_sendtran,  boolean ab_final )
event type integer ue_snpp_get_status ( ref datetime adt_date,  ref string as_retcode )
event type integer ue_snpp_get_tag ( ref string as_tag,  ref string as_pass )
cb_2 cb_2
p_wait p_wait
st_waiting st_waiting
st_pager st_pager
cb_2way cb_2way
sle_pager sle_pager
cb_2way_status cb_2way_status
sle_p2 sle_p2
sle_p3 sle_p3
sle_p5 sle_p5
sle_p4 sle_p4
end type
global uo_vzt_tcp_metro_page uo_vzt_tcp_metro_page

type variables
string  	is_interface = 'SN1'
//boolean	ib_add_lrc = FALSE
long	il_lock_sqlcode
//tran parms
string  	is_parm1, is_parm2, is_parm3, is_parm4
string  	is_result, is_singlethread
string 	is_messagetype
str_response	istr_response
datawindow	idw_target 
string 	is_autorequest, is_uselrc, is_roomstatus
time	it_transtart
window	iw_parent
string	is_msg_tag, is_passcode, is_ret_date, is_ret_code
end variables

forward prototypes
public subroutine of_init (ref window aw_parent, ref datawindow adw_target)
end prototypes

event ue_tran;
//this.event ue_get_lock() 
//IF il_lock_sqlcode = 0 then 
		// do the tran
		it_transtart = now() 
		is_last_error			= ''
		is_err_msg				= ''
		ii_tran_success		= 0
		ib_tran_done			= false
		ii_nak_count			= 0
		ii_out_nak_count 		= 0
		is_passcode				= ''
		is_msg_tag				= ''
		ls_last_errnum    	= ''
		is_ret_code				= ''
		is_ret_date				= ''

		// Parse responses, if any
		ii_resp_count			= 1
		ii_resp_max 			= f_vzt_parse( as_parm3, is_resp[], '/') 
		
		p_wait.visible 		= true
		st_waiting.visible 	= true
		st_message.visible 	= true
		st_state.visible 		= true
		this.visible			= true 
				
		If POS( is_interface, 'SN') > 0 then // SN1, SN2 etc
			this.event ue_snpp_tran	( as_trantype, as_parm1, as_parm2, as_parm3, as_parm4)
		END IF 

		time lt_start, lt_end 
		integer li_done
		
		li_done = 0
		lt_start = now()

		DO WHILE li_done = 0
			yield()
			lt_end = now()
			if Not IsVAlid( this) then return -20 
			If SecondsAfter( lt_start, lt_end ) >= ii_timeout then
				this.event ue_disconnect()
				this.event ue_end_tran()
				is_last_error = is_last_error + crlf + 'Timed Out'
				ii_tran_success = -10 
				li_done = -10 
			END IF
			If ib_tran_done then li_done = 1
		LOOP
		this.visible			= false 

return ii_tran_success

end event

event ue_snpp_tran;// 1. Process call parms
IF LEN(as_trantype) > 0 then is_trantype 	= as_trantype
IF LEN(as_parm1) > 0 	then is_parm1 		= as_parm1
IF LEN(as_parm2) > 0 	then is_parm2 		= as_parm2
IF LEN(as_parm3) > 0 	then is_parm3 		= as_parm3
IF LEN(as_parm4) > 0 	then is_parm4 		= as_parm4

// 2. connect
If is_state = 'NOT CONNECTED' then 
	is_input 	= '' // ignore stuff sent without our request.
	mle_in.text = '' 
	this.POST event ue_connect ('',0) 		// < 0 then return 
	return 
END IF

If is_state = 'CONNECTED' then 
	is_input 	= '' // ignore stuff sent without our request.
	if is_last_error = '' then this.of_setstate	 (is_trantype+'_READY')
END IF

// SIMPLE ONE WAY PAGE PROTOCOL - PAGE1 
this.event ue_send_command ('PAGE1_READY',  'PAGE '+  is_parm1, 'PAGE1_PAGE', true , true)	 
this.event ue_send_command ('PAGE1_PAGE_OK', 'MESS '+  is_parm2 , 'PAGE1_MESS', true, false)	 
this.event ue_send_command ('PAGE1_MESS_OK', 'SEND', 'PAGE1_SEND', true , false)	 
this.event ue_send_command ('PAGE1_SEND_OK', 'QUIT', 'PAGE1_QUIT', true , false)	 

// TWO way level 3 Employee page interface.	
this.event ue_send_command ('PAGE2_READY',  '2WAY', 'PAGE2_2WAY', true, true )	 
this.event ue_send_command ('PAGE2_2WAY_OK', 'PAGER '+is_parm1,'PAGE2_PAGER', true, false )	 
this.event ue_send_command ('PAGE2_PAGER_OK',	'DATA', 		'PAGE2_DATA', 		true , false)	 
this.event ue_send_command ('PAGE2_DATA_OK', is_parm2 + crlf + '.' ,	'PAGE2_DATA_SENT',true , false)	 
this.event ue_send_command ('PAGE2_DATA_SENT_OK','RType MULTICHOICE', 'PAGE2_RTYPE',true , false)	 

// Last resp state = is_trantype+'_MCRESP_LAST_OK'

// Setup all response choices
//this.event ue_send_command (is_trantype+'_RTYPE_OK', 'MCRESP CL Close_Call ', 'PAGE2_MCRESP_01',true, false )	 

this.event ue_send_command_resp () //check if MC responses requested by caller 

this.event ue_send_command ('PAGE2_MCRESP_LAST_OK', 'SEND', 'PAGE2_SEND',true , false)	 
this.event ue_send_command ('PAGE2_SEND_OK',  	  'QUIT ', 'PAGE2_QUIT', true , false)	 

// TWO way STATUS check interface. - same for employee and mgr pages	
this.event ue_send_command ('PAGE2RC_READY',  '2WAY', 'PAGE2RC_2WAY', true, true )	 
this.event ue_send_command ('PAGE2RC_2WAY_OK',  'MSTA '+is_parm1+' '+is_parm2, 'PAGE2RC_STATUS',true , false)	 
this.event ue_send_command ('PAGE2RC_STATUS_OK','QUIT ', 'PAGE2RC_QUIT', true , false)	 

return 
 
//this.event ue_send_command ('PAGE2_2WAY_OK',  	'NOQUEUE', 	'PAGE2_NOQUEUE', 	true )	 
//this.event ue_send_command ('PAGE2_NOQUEUE_OK', 'PAGER '+is_parm1,'PAGE2_PAGER', true )	 
//this.event ue_send_command ('PAGE2_PAGER_OK',  	'ACKREAD 1','PAGE2_ACKREAD', 	true )	 
//this.event ue_send_command ('PAGE2_MCRESP_OK_01', 'MSRESP 02 NO', 'PAGE2_MCRESP_02',true )	 
//this.event ue_send_command ('PAGE2_MCRESP_OK_02', 'MSRESP 03 CAN', 'PAGE2_MCRESP_03',true )	 
//this.event ue_send_command ('PAGE2_MCRESP_OK_03', 'SEND', 'PAGE2_SEND', true )	 

end event

event ue_snpp_onreceive;this.event ue_snpp_onreceive_check( 'NOT_CONNECTED/CONNECTED/CONNECTING',as_incoming,3,'220', trim(is_parm1) +'_READY',false,true,false) 
// Simple ONE way level one interface.	
this.event ue_snpp_onreceive_check( 'PAGE1_PAGE',as_incoming,3,'250','PAGE1_PAGE_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE1_MESS',as_incoming,3,'250','PAGE1_MESS_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE1_SEND',as_incoming,3,'250','PAGE1_SEND_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE1_QUIT',as_incoming,3,'221','PAGE1_COMPLETED',false,false,true) 
// TWO way level 3 interface.	
this.event ue_snpp_onreceive_check( 'PAGE2_2WAY', as_incoming,3,'250','PAGE2_2WAY_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE2_NOQUEUE',as_incoming,3,'250','PAGE2_NOQUEUE_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE2_PAGER', as_incoming,3,'850','PAGE2_PAGER_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE2_ACKREAD',as_incoming,3,'250','PAGE2_ACKREAD_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE2_DATA',as_incoming,3,'354','PAGE2_DATA_OK',false,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE2_DATA_SENT',as_incoming,3,'250','PAGE2_DATA_SENT_OK',false,true,false) //data accepted 

// _RTYPE - after RTYPE command, begin to send MCRESP... 
this.event ue_snpp_onreceive_check( is_trantype+'_RTYPE', as_incoming,3,'250', is_trantype+'_MCRESP_01',false,true,false) 

// after a resp code command set the state for next resp entry.
string ls_state
ls_state	= is_trantype+'_MCRESP_'+ string( MAX(ii_resp_count - 1, 1),'00')
this.event ue_snpp_onreceive_check( ls_state+'_SENT' ,as_incoming,3,'250', is_trantype+'_MCRESP_'+ string(ii_resp_count,'00'),false,true,false) 

this.event ue_snpp_onreceive_check( 'PAGE2_SEND', as_incoming,2,'86.87.96','PAGE2_SEND_OK',true,true,false) 
this.event ue_snpp_onreceive_check( 'PAGE2_QUIT',as_incoming,3,'221','PAGE2_COMPLETED',false,false,true) 
// TWO way level 3 status check.	
this.event ue_snpp_onreceive_check( 'PAGE2RC_2WAY', as_incoming,3,'250','PAGE2RC_2WAY_OK',false,true,false) 
If this.is_state = 'PAGE2RC_STATUS' then 
	this.event ue_snpp_onreceive_check( 'PAGE2RC_STATUS', as_incoming,2,'86.87.88','PAGE2RC_STATUS_OK',true,false,false) 
	if POS('861,860', MID(f_nvl(as_incoming,''),1,3)) > 0  then is_ret_code = 'D'  //86x-delivered 88x complete
	this.post event ue_snpp_tran('','','','','')
END IF
this.event ue_snpp_onreceive_check( 'PAGE2RC_QUIT',as_incoming,3,'221','PAGE2RC_COMPLETED',false,false,true) 

end event

event ue_get_lock;//IF is_singlethread = 'Y' then
//
//	// get a lock
//	string 	ls_lock
//	long		ll_sqlcode
//	ls_lock = STRING( NOW() )
//	UPDATE FOILOCK SET TLOCK = :ls_lock ;
//	il_lock_sqlcode = SQLCA.SQLCODE
//	If il_lock_sqlcode <> 0 then
//		MessageBox( 'Front Office Interface Error', 'Could not obtain the lock.')
//	END IF 
//ELSE 
//	il_lock_sqlcode = 0
//END IF
end event

event ue_free_lock;//IF is_singlethread = 'Y' then
//	// free a lock
//	If il_lock_sqlcode = 0 then
//		COMMIT;
//	ELSE 
//		ROLLBACK;
//	END IF
//ELSE 
	il_lock_sqlcode = 0
//END IF
//
//
end event

event ue_end_tran;// Perform end of tran processing - return data and free locks
//this.event ue_free_lock() 

p_wait.visible 		= false
st_waiting.visible 	= false
st_message.visible 	= false
st_state.visible 		= false

is_parm1 		= ''
is_parm2 		= ''
is_parm3 		= ''
is_parm4 		= ''

ii_nak_count		= 0
ii_out_nak_count 	= 0

ib_tran_done			= true

// Position target dw cursor

end event

event ue_timeoutcheck;// if SecondsAfter ( it_transtart, now() )  
// time out occured - close up shop or wait more 

end event

event ue_validate_interface;int li_ret

If is_interface <> 'FIDELIO' and is_interface <> 'GEAC' then return -1

if not isValid( idw_target) then 
	MessageBox('Interface Error', 'Target datawindow is invalid.', exclamation!)
	return -1 
end if

long ll_row

ll_row = idw_target.GetRow()
if ll_row <= 0 then
	MessageBox('Interface Error', 'Target datawindow has no data.', exclamation!)
	return -1 
end if

return 1
end event

event ue_snpp_onreceive_check;If POS( as_state,  is_state) <= 0  then return 

If POS( as_response,  MID( f_nvl(as_incoming,'') ,1, ai_sublen )) > 0  then 
		this.of_setstate( as_newstate)
		is_input = ''
		If ab_parse then 
			//parse input into tokens 
			f_vzt_parse( as_incoming, is_ret_parsed[], ' ') 
			is_msg_tag	= is_ret_parsed[ 2]   
			is_passcode = is_ret_parsed[ 3]
			
			is_ret_date = is_ret_parsed[ 3]   
			is_ret_code = is_ret_parsed[ 4]   
			
			sle_p2.text = is_ret_parsed[ 2]   
			sle_p3.text = is_ret_parsed[ 3]   
			sle_p4.text = is_ret_parsed[ 4]   
			sle_p5.text = is_ret_parsed[ 5]   
		END IF
		if ab_sendtran then this.post event ue_snpp_tran('','','','','') 
		if ab_final then 
			is_input = ''
			ii_tran_success = 1
			this.event ue_disconnect() 
			this.event ue_end_tran() 
		End If
ELSE	// failed ?
	string ls_error
	
	IF POS( upper(f_nvl(as_incoming,'')),'ONE') > 0 and & 
		POS( upper(f_nvl(as_incoming,'')),'WAY') > 0 and & 
		POS( upper(f_nvl(as_incoming,'')),'CAPABLE') > 0 then 
		// POS( f_nvl(as_incoming,''),'550') > 0  or
		// Not 2 way capable -> switch to one way page 
		this.event ue_disconnect() 
		this.post event ue_tran('PAGE1', is_parm1, is_parm2,'', is_parm4) //blank out parm3-ret codes 
		
	ELSEIF POS( f_nvl(as_incoming,''),'220') <= 0 then 
		ii_tran_success = -20
		is_err_msg = 'Received "'+f_nvl(as_incoming,'') + &
			'" while waiting for "'+ f_nvl(as_response,'') 
		ls_error = is_err_msg + +'"~r~n' + &
			'Current state:'+f_nvl(is_state,'') + 'Next state: '+ f_nvl(as_newstate,'') 
		this.event ue_disconnect() 
//		MESSAGEBOX('SNPP Interface Error (on receive)', ls_error )
		this.event ue_end_tran() 
	END IF
END IF

//RETURN 1


end event

event ue_snpp_get_status;If len( is_ret_date ) = 14 then 
	string ls_year, ls_month, ls_day, ls_hh, ls_mm, ls_ss 
	ls_year	= MID(is_ret_date, 1,4)
	ls_month	= MID(is_ret_date, 5,2)
	ls_day	= MID(is_ret_date, 7,2)
	ls_hh 	= MID(is_ret_date, 9,2)
	ls_mm 	= MID(is_ret_date, 11,2)
	ls_ss		= MID(is_ret_date, 13,2) 
	adt_date	= datetime( date( ls_year+'-'+ls_month+'-'+ls_day) ,time(ls_hh+':'+ls_mm+':'+ls_ss) )
ELSE
	adt_date	= f_sysdate()
END IF 
as_retcode	= is_ret_code

return 1
end event

event ue_snpp_get_tag;as_tag 	= is_msg_tag
as_pass	= is_passcode

return 1
end event

public subroutine of_init (ref window aw_parent, ref datawindow adw_target);idw_target 	= adw_target 
iw_parent	= aw_parent

end subroutine

on uo_vzt_tcp_metro_page.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.p_wait=create p_wait
this.st_waiting=create st_waiting
this.st_pager=create st_pager
this.cb_2way=create cb_2way
this.sle_pager=create sle_pager
this.cb_2way_status=create cb_2way_status
this.sle_p2=create sle_p2
this.sle_p3=create sle_p3
this.sle_p5=create sle_p5
this.sle_p4=create sle_p4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.p_wait
this.Control[iCurrent+3]=this.st_waiting
this.Control[iCurrent+4]=this.st_pager
this.Control[iCurrent+5]=this.cb_2way
this.Control[iCurrent+6]=this.sle_pager
this.Control[iCurrent+7]=this.cb_2way_status
this.Control[iCurrent+8]=this.sle_p2
this.Control[iCurrent+9]=this.sle_p3
this.Control[iCurrent+10]=this.sle_p5
this.Control[iCurrent+11]=this.sle_p4
end on

on uo_vzt_tcp_metro_page.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.p_wait)
destroy(this.st_waiting)
destroy(this.st_pager)
destroy(this.cb_2way)
destroy(this.sle_pager)
destroy(this.cb_2way_status)
destroy(this.sle_p2)
destroy(this.sle_p3)
destroy(this.sle_p5)
destroy(this.sle_p4)
end on

event constructor;call super::constructor;//---------------------------------------------------------------	
// constructor in the caller:-------------------------------
//window lw_window
//lw_window	= parent
//this.of_init( lw_window	, dw_1, cb_close, 60 )  		
//---------------------------------------------------------------	
// in openlog1
//gnv_appman.event ue_getsysoptions() //

ib_emsg			=false
ib_reconnect	=true

ib_wrap 		= false
ib_crlf 		= true 
ib_add_lrc 	= false

p_wait.visible 		= false
st_waiting.visible 	= false
st_message.visible 	= false
st_state.visible 		= false
If upper( gnv_appman.is_debugmode)  = 'Y' or gs_debugmode = 'Y' then 
	this.height = 1208 //984  // 360 
ELSE
	this.height = 320 //1620 // 900
END IF 

STX = CHAR(2)
ETX = CHAR(3)

string 	ls_ip
int		ls_port 

il_lock_sqlcode = 0
is_interface	 = UPPER( cpagesyscd	)
is_singlethread = UPPER( is_singlethread )
ls_ip				 = gs_snpp_addr
ls_port			 = INTEGER( gs_snpp_port)

sle_wait.text = string(ii_commandwait )

// '127.0.0.1', 5010)
If POS(is_interface, 'SN') > 0 OR gs_settings = 'TCP' then 
	this.of_sethost ( ls_ip, ls_port) 
END IF

ii_NAK_max = 2


end event

event ue_onreceive;call super::ue_onreceive;if this.is_state = 'CONNECTED' or this.is_state = 'NOT CONNECTED' then 
	is_input = '' // ignore stuff sent without our request.
	mle_in.text = ''
	return 
END IF

CHOOSE CASE is_interface 
	CASE 'SN1', 'SN2', 'SN3', 'SN4'
		this.event ue_snpp_onreceive( as_incoming)
	CASE ELSE
		is_last_error = 'Unknown interface: ' + is_interface 
END CHOOSE



end event

event ue_connected;if is_last_error = '' then this.of_setstate	 ('CONNECTED')

If POS( is_interface , 'SN') > 0 then
	this.event ue_snpp_tran('','','','','') 
end if 

end event

event ue_sent_data;call super::ue_sent_data;//if is_interface = 'FIDELIO' then 
//int li_count 
// li_count = ole_tcp1.object.SendBufferCount 
//
//If li_count > 0 then  
//	messagebox('count', string(li_count ) )
//	return // sent all prior 
//END IF


end event

event destructor;call super::destructor;//if Isvalid (ids_guest_info) then DESTROY ids_guest_info 

this.event ue_disconnect()
this.event ue_end_tran()


end event

event ue_disconnect;call super::ue_disconnect;p_wait.visible 		= false
st_waiting.visible 	= false
st_message.visible 	= false
st_state.visible 		= false

end event

event ue_send_command_resp;string ls_command , ls_state

ls_state		= is_trantype+'_MCRESP_'+string(ii_resp_count,'00')

If is_state <> ls_state then return 1

If ii_resp_max > 0 and ii_resp_count <= ii_resp_max then 
	
	ls_command 	= 'MCRES '+ is_resp[ii_resp_count] 
	this.event ue_send_command( ls_state, ls_command , ls_state+'_SENT', false, false ) 
	ii_resp_count ++ 
	
ELSE
	this.of_setstate( is_trantype+'_MCRESP_LAST_OK')
	this.post event ue_snpp_tran('','','','','')
END IF
return 1


end event

type cbx_keep from uo_vzt_tcp_base`cbx_keep within uo_vzt_tcp_metro_page
integer x = 1038
integer y = 384
boolean checked = false
end type

type ole_tcp1 from uo_vzt_tcp_base`ole_tcp1 within uo_vzt_tcp_metro_page
integer x = 2405
integer y = 796
integer taborder = 80
end type

type uo_trace1 from uo_vzt_tcp_base`uo_trace1 within uo_vzt_tcp_metro_page
end type

type cbx_crlf from uo_vzt_tcp_base`cbx_crlf within uo_vzt_tcp_metro_page
integer x = 1509
integer y = 380
integer width = 183
end type

type cbx_wrap from uo_vzt_tcp_base`cbx_wrap within uo_vzt_tcp_metro_page
integer x = 1280
integer y = 384
integer width = 219
end type

type cb_info from uo_vzt_tcp_base`cb_info within uo_vzt_tcp_metro_page
integer x = 2427
integer y = 384
integer width = 178
integer height = 60
end type

type st_wait from uo_vzt_tcp_base`st_wait within uo_vzt_tcp_metro_page
integer x = 704
integer y = 448
end type

type sle_wait from uo_vzt_tcp_base`sle_wait within uo_vzt_tcp_metro_page
integer x = 704
integer y = 500
integer height = 68
integer taborder = 140
end type

type st_state from uo_vzt_tcp_base`st_state within uo_vzt_tcp_metro_page
integer x = 1755
integer y = 108
integer width = 1102
integer weight = 400
string facename = "Arial Narrow"
end type

type cb_1 from uo_vzt_tcp_base`cb_1 within uo_vzt_tcp_metro_page
integer x = 1696
integer y = 384
integer width = 155
integer height = 60
integer taborder = 70
end type

type st_message from uo_vzt_tcp_base`st_message within uo_vzt_tcp_metro_page
integer x = 14
integer y = 108
integer width = 1056
integer weight = 400
string facename = "Arial Narrow"
end type

type cb_disconnect from uo_vzt_tcp_base`cb_disconnect within uo_vzt_tcp_metro_page
integer x = 2130
integer y = 384
integer height = 60
integer taborder = 150
end type

type cb_connect from uo_vzt_tcp_base`cb_connect within uo_vzt_tcp_metro_page
integer x = 1856
integer y = 384
integer width = 270
integer height = 60
integer taborder = 160
end type

type st_port from uo_vzt_tcp_base`st_port within uo_vzt_tcp_metro_page
integer x = 521
integer y = 448
end type

type st_host from uo_vzt_tcp_base`st_host within uo_vzt_tcp_metro_page
integer x = 55
integer y = 444
integer width = 219
end type

type sle_port from uo_vzt_tcp_base`sle_port within uo_vzt_tcp_metro_page
integer x = 521
integer y = 500
integer height = 68
integer taborder = 130
string text = "444"
end type

type sle_host from uo_vzt_tcp_base`sle_host within uo_vzt_tcp_metro_page
integer x = 55
integer y = 500
integer width = 466
integer height = 68
integer taborder = 170
string text = "snpp.nextel.com"
end type

type st_out from uo_vzt_tcp_base`st_out within uo_vzt_tcp_metro_page
integer x = 59
integer y = 592
integer width = 169
string text = "Pager:"
end type

type sle_out from uo_vzt_tcp_base`sle_out within uo_vzt_tcp_metro_page
integer x = 288
integer y = 380
integer width = 736
integer height = 68
integer taborder = 20
string text = "my test message"
end type

type mle_in from uo_vzt_tcp_base`mle_in within uo_vzt_tcp_metro_page
integer x = 919
integer y = 452
integer width = 1938
integer height = 728
long textcolor = 0
long backcolor = 16777215
boolean displayonly = false
end type

type st_in from uo_vzt_tcp_base`st_in within uo_vzt_tcp_metro_page
integer x = 2619
integer y = 392
integer width = 215
string text = "In Text:"
end type

type cb_2 from commandbutton within uo_vzt_tcp_metro_page
integer x = 69
integer y = 668
integer width = 699
integer height = 52
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SAMPLE ONE WAY PAGE"
end type

event clicked;string 	ls_pager
int 		li_ret
ls_pager = sle_pager.text 
li_ret = parent.event ue_tran( 'PAGE1', ls_pager , sle_out.text ,'','') 

MessageBox('Trans. Return', 'RC=' + string (li_ret))


end event

type p_wait from picture within uo_vzt_tcp_metro_page
integer x = 1074
integer y = 8
integer width = 654
integer height = 276
boolean bringtotop = true
string picturename = "Stpwtch2a.BMP"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;parent.event ue_disconnect ()
parent.event ue_end_tran ()
end event

type st_waiting from statictext within uo_vzt_tcp_metro_page
integer x = 1440
integer y = 24
integer width = 270
integer height = 252
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
boolean enabled = false
string text = "Sending Page Click to Cancel"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_pager from statictext within uo_vzt_tcp_metro_page
integer x = 32
integer y = 384
integer width = 261
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
string text = "Msg Text:"
boolean focusrectangle = false
end type

type cb_2way from commandbutton within uo_vzt_tcp_metro_page
integer x = 69
integer y = 720
integer width = 699
integer height = 52
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SAMPLE TWO WAY PAGE"
end type

event clicked;int 		li_ret
If trim(sle_pager.text) = '' then 
	MessageBox('Trans. Error', 'pager id missing' )
end if
li_ret = parent.event ue_tran( 'PAGE2', sle_pager.text, sle_out.text ,'','') 


end event

type sle_pager from dropdownlistbox within uo_vzt_tcp_metro_page
integer x = 238
integer y = 572
integer width = 526
integer height = 228
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"9149068635","9172957853","9172957873"}
borderstyle borderstyle = stylelowered!
end type

type cb_2way_status from commandbutton within uo_vzt_tcp_metro_page
integer x = 69
integer y = 772
integer width = 699
integer height = 52
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SAMPLE TWO WAY status"
end type

event clicked;int 		li_ret
li_ret = parent.event ue_tran( 'PAGE2RC', sle_pager.text, sle_p3.text ,'','') 

MessageBox('Trans. Return', 'RC=' + string (li_ret))


end event

type sle_p2 from singlelineedit within uo_vzt_tcp_metro_page
integer x = 69
integer y = 828
integer width = 334
integer height = 64
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_p3 from singlelineedit within uo_vzt_tcp_metro_page
integer x = 416
integer y = 828
integer width = 352
integer height = 68
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_p5 from singlelineedit within uo_vzt_tcp_metro_page
integer x = 416
integer y = 900
integer width = 352
integer height = 68
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_p4 from singlelineedit within uo_vzt_tcp_metro_page
integer x = 69
integer y = 900
integer width = 334
integer height = 64
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

