$PBExportHeader$uo_vzt_tcp_metro.sru
forward
global type uo_vzt_tcp_metro from uo_vzt_tcp_base
end type
type cb_2 from commandbutton within uo_vzt_tcp_metro
end type
type sle_room from singlelineedit within uo_vzt_tcp_metro
end type
type dw_namelist from datawindow within uo_vzt_tcp_metro
end type
type cb_3 from commandbutton within uo_vzt_tcp_metro
end type
type cb_getinfo from commandbutton within uo_vzt_tcp_metro
end type
type p_wait from picture within uo_vzt_tcp_metro
end type
type st_waiting from statictext within uo_vzt_tcp_metro
end type
type dw_dupcheck from uo_gcc_dupcheck within uo_vzt_tcp_metro
end type
type cb_4 from commandbutton within uo_vzt_tcp_metro
end type
type cb_fid_getnametest from commandbutton within uo_vzt_tcp_metro
end type
type uo_trace from nvo_trace within uo_vzt_tcp_metro
end type
type uo_rr from uo_room_registry within uo_vzt_tcp_metro
end type
type st_msg from statictext within uo_vzt_tcp_metro
end type
type cb_5 from commandbutton within uo_vzt_tcp_metro
end type
type cb_6 from commandbutton within uo_vzt_tcp_metro
end type
type cb_7 from commandbutton within uo_vzt_tcp_metro
end type
type cb_8 from commandbutton within uo_vzt_tcp_metro
end type
type cb_9 from commandbutton within uo_vzt_tcp_metro
end type
type cb_10 from commandbutton within uo_vzt_tcp_metro
end type
type dw_guest_info from uo_vzt_dwbase within uo_vzt_tcp_metro
end type
type st_1 from statictext within uo_vzt_tcp_metro
end type
type sle_amt from singlelineedit within uo_vzt_tcp_metro
end type
type st_2 from statictext within uo_vzt_tcp_metro
end type
type st_3 from statictext within uo_vzt_tcp_metro
end type
type sle_stat from singlelineedit within uo_vzt_tcp_metro
end type
type cb_11 from commandbutton within uo_vzt_tcp_metro
end type
type dw_shares from uo_gcc_dupcheck within uo_vzt_tcp_metro
end type
type dw_fid from uo_gcc_dupcheck within uo_vzt_tcp_metro
end type
type cb_reset from commandbutton within uo_vzt_tcp_metro
end type
type dw_pms_queue from uo_gcc_dupcheck within uo_vzt_tcp_metro
end type
type cb_12 from commandbutton within uo_vzt_tcp_metro
end type
type cb_13 from commandbutton within uo_vzt_tcp_metro
end type
type dw_pms_queue_out from uo_gcc_dupcheck within uo_vzt_tcp_metro
end type
type cb_14 from commandbutton within uo_vzt_tcp_metro
end type
type cb_15 from commandbutton within uo_vzt_tcp_metro
end type
type gb_1 from groupbox within uo_vzt_tcp_metro
end type
end forward

global type uo_vzt_tcp_metro from uo_vzt_tcp_base
integer width = 3717
integer height = 2008
long backcolor = 79741120
event ue_fidelio_init ( )
event ue_fidelio_tran ( string as_trantype,  string as_parm1,  string as_parm2,  string as_parm3,  string as_parm4 )
event type integer ue_fidelio_parse ( string as_input )
event type string ue_fidelio_parse_field ( string as_input,  string as_tag,  string as_delim )
event type integer ue_tran ( string as_trantype,  string as_parm1,  string as_parm2,  string as_parm3,  string as_parm4 )
event ue_geac_tran ( string as_trantype,  string as_parm1,  string as_parm2,  string as_parm3,  string as_parm4 )
event type integer ue_geac_parse ( string as_input )
event ue_geac_onreceive ( string as_incoming )
event ue_fidelio_onreceive ( string as_incoming )
event ue_get_lock ( )
event ue_free_lock ( )
event ue_end_tran ( )
event type integer ue_geac_getname ( )
event type string ue_fidelio_getname ( string as_input,  string as_delim )
event ue_getroominfo ( string as_room )
event ue_timeoutcheck ( )
event ue_getroomauto ( )
event type double ue_save_guest ( boolean ab_insertcall,  string as_problem,  string as_subproblem )
event ue_fill_guest_name ( )
event type integer ue_validate_interface ( )
event ue_sendreturn ( string as_room,  string as_callnum,  string as_guestnum )
event type integer ue_retrieve_guest ( long al_guestid )
event ue_parent_setcolumn ( string as_colname,  string as_value )
event ue_file_tran ( string as_trantype,  string as_parm1,  string as_parm2,  string as_parm3,  string as_parm4 )
event ue_fidelio_le ( )
event ue_file_getname ( )
event ue_update_room ( long ll_row )
event ue_get_message ( )
event ue_parent_save ( )
event ue_closequery ( )
event ue_fidelio_restart ( )
event ue_get_room_reg_info ( string as_room )
event ue_fidelio_roominfo ( )
event ue_fidelio_queue_in ( )
event ue_update_room_reg ( )
event ue_pms_queue_out ( )
cb_2 cb_2
sle_room sle_room
dw_namelist dw_namelist
cb_3 cb_3
cb_getinfo cb_getinfo
p_wait p_wait
st_waiting st_waiting
dw_dupcheck dw_dupcheck
cb_4 cb_4
cb_fid_getnametest cb_fid_getnametest
uo_trace uo_trace
uo_rr uo_rr
st_msg st_msg
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
dw_guest_info dw_guest_info
st_1 st_1
sle_amt sle_amt
st_2 st_2
st_3 st_3
sle_stat sle_stat
cb_11 cb_11
dw_shares dw_shares
dw_fid dw_fid
cb_reset cb_reset
dw_pms_queue dw_pms_queue
cb_12 cb_12
cb_13 cb_13
dw_pms_queue_out dw_pms_queue_out
cb_14 cb_14
cb_15 cb_15
gb_1 gb_1
end type
global uo_vzt_tcp_metro uo_vzt_tcp_metro

type variables
string  is_interface = 'FIDELIO', is_lock  

string  is_posting_code='C', is_maid_status='3'
decimal id_posting_amt
boolean ib_restart , 	ib_db_refresh=false, ib_async=false, ib_online=false 

string  is_oldroom , is_lname,is_fname , is_street1, is_street2, is_city, is_st 
string  is_zip, is_country , is_temp_room, is_vip, is_guest_share2, is_temp_share 
string  is_company, is_phone, is_guest_share, is_gc_action='', is_pms_guest_no 
datetime	idt_arr, idt_dep 
integer ii_adults, ii_version=1

// current Room Reg INFO vars
string	is_rr_guest_lname, is_rr_guest_fname, is_rr_date_from, is_rr_date_to
string	is_rr_addr1, is_rr_addr2, is_rr_city  
string	is_rr_state, is_rr_zip, is_rr_country, is_rr_phone, is_guest_title 
double	il_rr_guest_account 

long	il_lock_sqlcode, il_guests_in_room
//tran parms
string  	is_parm1, is_parm2, is_parm3, is_parm4 
string  	is_result, is_singlethread, is_terminal_id='123456789'
//datastore	ids_guest_info
string 	is_messagetype, is_guestnumber, is_roomnumber
string	is_HE_RetDesc, is_HE_Retcode, is_HE_CallNum
str_response	istr_response
datawindow	idw_target 
string 	is_autorequest, is_uselrc, is_roomstatus, is_hide_detail
time		it_transtart
window	iw_parent

boolean	ib_usedexisting=false, ib_multiple_guests
boolean	ib_server=false //running as a schedule server, no messages

string is_result_title, is_result_msg
end variables

forward prototypes
public function string of_get_ts_fid ()
public subroutine of_set_terminal_id (string as_parm1)
public function datawindow of_getinfo ()
public subroutine of_init (ref window aw_parent, ref datawindow adw_target, ref commandbutton abtn_button, integer ai_space)
public function datetime of_get_fidelio_date (string as_date)
public function integer of_messagebox (string as_title, string as_msg)
end prototypes

event ue_fidelio_init();string st[], s
integer li_cnt 
s = CHAR(3)+CHAR(2) 
//	st[1] = 'LD|'+of_get_ts_fid()+'|V#1.01|IFPO|' + ETX 
//==============================================================================
st[UpperBound(st)+1] = 'LD|'+of_get_ts_fid()+'|V#4.08|IFPB|' + ETX //describe the link
If ii_version = 1 then 
	st[UpperBound(st)+1] = 'LR|RIPR|FLPI|' + ETX 								//decribe the inquiry  msg
	st[UpperBound(st)+1] = 'LR|RIPL|FLG#GAGDRNGNA0A1A2A3A4A5A6A7A8|' + ETX //decribe the inquiry response 
	st[UpperBound(st)+1] = 'LR|RIPA|FLDATIASCTRN|' + ETX // descr error record format we need from them
END IF
If ii_version = 2 then 
	st[UpperBound(st)+1] = 'LR|RIGI|FLRNG#GSSFGNGFGTGAGDGLGVDATIA0A1A2A3A4A5A6A7A8A9|' + ETX // descr guest in
	st[UpperBound(st)+1] = 'LR|RIGC|FLRNG#GSGNGFGTGAGDGLGVDATIA0A1A2A3A4A5A6A7A8A9RO|' + ETX // descr guest change
	st[UpperBound(st)+1] = 'LR|RIGO|FLRNG#GSDATI|' + ETX // descr guest out 
	st[UpperBound(st)+1] = 'LR|RIRE|FLRNRS|' + ETX // descr maid status 
	st[UpperBound(st)+1] = 'LR|RIPS|FLRNPTDATITACT|' + ETX // descr posting message
	st[UpperBound(st)+1] = 'LR|RIPA|FLDATIASRN|' + ETX // descr error record format we need from them
END IF
//==============================================================================
st[UpperBound(st)+1] = 'LA|'+of_get_ts_fid()+'|' + ETX // indicate no more messages to be  described 
//==============================================================================
ii_commandwait = 0//2
sle_wait.text = string(ii_commandwait )
	
For li_cnt = 1 to UpperBound(st) 
	st[li_cnt] = STX + st[li_cnt]
	if is_last_error = '' then this.of_setstate ('FIDELIO_LINKINIT_START'+string(li_cnt))
	if li_cnt = UpperBound(st) then this.of_setstate ('FIDELIO_LINKINIT') // end init status
	if is_last_error = '' then this.event ue_send (st[li_cnt]) //describe the link
NEXT	
//	s1 = STX + s1 //+ of_calc_lrc ( s1) 
ii_commandwait = 0
sle_wait.text = string(ii_commandwait )
	
//if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT_START1')
//if is_last_error = '' then this.event ue_send (s1) //describe the link
//if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT_START2')
//if is_last_error = '' then this.event ue_send (s2)	//decribe the inquiry  msg
//if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT_START3')
//if is_last_error = '' then this.event ue_send (s3) //decribe the inquiry response 
//if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT_START4')
//if is_last_error = '' then this.event ue_send (s4) //decribe the error  response record
//if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT')
//if is_last_error = '' then this.event ue_send (s5)	// indicate no more messages to be  described 
//


end event

event ue_fidelio_tran(string as_trantype, string as_parm1, string as_parm2, string as_parm3, string as_parm4);// 1. Process call parms
IF LEN(as_trantype) > 0 then is_trantype 	= as_trantype
IF LEN(as_parm1) > 0 	then is_parm1 		= as_parm1
IF LEN(as_parm2) > 0 	then is_parm2 		= as_parm2
IF LEN(as_parm3) > 0 	then is_parm3 		= as_parm3
IF LEN(as_parm4) > 0 	then is_parm4 		= as_parm4

choose case is_trantype
  //=======================================================================
  case 'SERVERDISC_NO_LE' 
  //=======================================================================
		this.event ue_disconnect ()
		this.event ue_free_lock ()
		this.event ue_end_tran() 
  //=======================================================================
  case 'SERVERDISC' 
  //=======================================================================
  		this.event ue_fidelio_le()
		this.event ue_disconnect ()
		this.event ue_free_lock ()
		this.event ue_end_tran() 
  //=======================================================================
  case 'SERVER_DB_RESET' 
  //=======================================================================
 	ib_db_refresh = true 
	if is_last_error = '' then this.event ue_send (STX+'DR|'+of_get_ts_fid() +'|'+ ETX)	 
	if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY') //FIDELIO_MAID_STAT_SENT

  //=======================================================================
  case 'SERVERPOST' 
  //=======================================================================
	If is_state = 'FIDELIO_READY' then 
		ii_commandwait = 0
		sle_wait.text = string(ii_commandwait )
		is_input 		= '' 
		is_roomnumber = is_parm1 
		if is_last_error = '' then this.event ue_send (STX+'PS|PT'+is_posting_code+'|TA'+string(id_posting_amt)+'|RN'+is_roomnumber +'|'+ of_get_ts_fid() +'|CT'+is_parm2+'|'+ ETX)	 // send room clean
 		if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY') //FIDELIO_MAID_STAT_SENT
	END IF
   //=======================================================================
  case 'SERVERMAID' 
  //=======================================================================
  // 1 Dirty Vacant, 2 Dirty Occupied, 3 Clean Vacant, 4 clean occupied
  // 5 inspected vacant, 6 inspected occupied // in instructions = 1 C/V
	
	If is_state = 'FIDELIO_READY' then 
		ii_commandwait = 0
		sle_wait.text = string(ii_commandwait )
		 is_input 		= '' 
		 is_roomnumber = is_parm1
		 is_maid_status= is_parm2 // '3' usually
		 if is_last_error = '' then this.event ue_send (STX+'RE|RN'+is_roomnumber +'|RS'+is_maid_status+'|'+ ETX)	 // send room clean no date needed ==>of_get_ts_fid() 
 		 if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY') //FIDELIO_MAID_STAT_SENT
	END IF
  //=======================================================================
  case 'SERVER_GUESTCHANGE' 
  //=======================================================================
  		is_gc_action = ''
		sle_out.text = is_input
		this.event ue_fidelio_parse (is_input) // get room old and new
		
		this.event ue_get_room_reg_info( is_roomnumber) // GET CURRENT OCCUPANT INFO
		
		IF is_oldroom <> '' then 
			is_gc_action = 'ROOM MOVE' 
		ELSE
			is_gc_action = 'INFO CHANGE'	
		END IF 	
		choose case is_gc_action 
//		case 'SHARE OUT'
//			is_roomstatus = 'SO'
			
		case 'ROOM MOVE'
			is_temp_room = is_roomnumber
			is_temp_share= is_guest_share2 

			// 1. guest IN into new room (main or share) 
			is_roomstatus = 'O' 
			this.event ue_fill_guest_name()
		
//			is_guest_share= is_guest_share2 // use old share on old room check-out 
//			is_roomnumber = is_oldroom
//			// 1. guest OUT from old room (main or share)
//			is_roomstatus = 'V' 
//			this.event ue_fill_guest_name() 
//			
			
	 	 CASE ELSE // misc change
			is_roomstatus = 'O' 
			this.event ue_fill_guest_name() 
		end choose

		if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY')
  //=======================================================================
  case 'SERVER_GUESTOUT' 
  //=======================================================================
		sle_out.text = is_input
		this.event ue_fidelio_parse (is_input) // get room 
		is_roomstatus = 'V' 
		this.event ue_fill_guest_name() 
		if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY')
//		this.POST event ue_tran( 'SERVERROOM', is_roomnumber ,'','','')  
  //=======================================================================
  case 'SERVER_GUESTIN' 
  //=======================================================================
		sle_out.text = is_input
		this.event ue_fidelio_parse (is_input) // get room 
		is_roomstatus = 'O' 
		this.event ue_fill_guest_name() 
		if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY')
//		this.POST event ue_tran( 'SERVERROOM', is_roomnumber ,'','','') 

  //=======================================================================
  case 'SERVERINIT' 
  //=======================================================================
//	this.event ue_disconnect ()
//   this.event ue_free_lock ()
//	this.event ue_get_lock ()
	// 2. connect
	If is_state = 'NOT CONNECTED' or is_state='' then 
		is_input 	= '' // ignore stuff sent by fidelio without our request.
		mle_in.text = ''
		if this.event ue_connect ('',0) < 0 then return 
 		return
	END IF

	If is_state = 'CONNECTED' then 
		is_input 	= '' // ignore stuff sent by fidelio without our request.
		mle_in.text = ''
		// 3. check link status before sending requests.
		ii_commandwait = 0
		sle_wait.text = string(ii_commandwait )
		if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT_REQUESTED_STATUS')
		if is_last_error = '' then this.event ue_send (STX+'LS|'+of_get_ts_fid() + ETX)
		// if all ok, receive script will call us back to continue... with FIDELIO_READY status 
		return 
	END IF

//	If is_state = 'FIDELIO_READY' then 
//		MessageBox('FIDELIO_READY','FIDELIO_READY')		
//	END IF
	//=======================================================================
  case 'SERVERROOM' 
	//=======================================================================
	If is_state = 'FIDELIO_READY' then 
		ii_commandwait = 0
		sle_wait.text = string(ii_commandwait )

		IF is_trantype = 'SERVERROOM' then 
		 is_input 		= '' 
		 is_roomnumber = is_parm1
 		 if is_last_error = '' then this.of_setstate	 ('FIDELIO_ROOM_INFO_SENT')
		 if is_last_error = '' then this.event ue_send (STX+'PR|PI'+is_roomnumber +'|'+ETX)	 // get room info... 
		END IF
	END IF

	If is_state = 'FIDELIO_ROOM_INFO_RECEIVED' then 
		// parse info and pass it back to caller.
		sle_out.text = is_result
		if is_roomstatus <> 'I' and is_roomstatus <> 'V' then is_roomstatus = 'O' 
		this.event ue_fidelio_parse (is_result) 
		this.event ue_fill_guest_name() 
		if is_last_error = '' then 
			this.of_setstate	 ('FIDELIO_READY')
		end if	
	End If	
	//=======================================================================
  case 'ROOMINFO'
	//=======================================================================
	// 2. connect
	If is_state = 'NOT CONNECTED' or is_state='' then 
		is_input 	= '' // ignore stuff sent by fidelio without our request.
		mle_in.text = ''
		if this.event ue_connect ('',0) < 0 then return 
		return
	END IF

	If is_state = 'CONNECTED' then 
		is_input 	= '' // ignore stuff sent by fidelio without our request.
		mle_in.text = ''
		// 3. check link status before sending requests.
		ii_commandwait = 0
		sle_wait.text = string(ii_commandwait )
		if is_last_error = '' then this.of_setstate	 ('FIDELIO_LINKINIT_REQUESTED_STATUS')
		if is_last_error = '' then this.event ue_send (STX+'LS|'+of_get_ts_fid() + ETX)
		// if all ok, receive script will call us back to continue... with FIDELIO_READY status 
		return 
//		if is_last_error = '' then this.of_setstate	 ('FIDELIO_READY')
	END IF

	If is_state = 'FIDELIO_READY' then 
		ii_commandwait = 0
		sle_wait.text = string(ii_commandwait )

		IF is_trantype = 'ROOMINFO' then 
		 is_input 		= '' 
		 is_roomnumber = is_parm1
 		 if is_last_error = '' then this.of_setstate	 ('FIDELIO_ROOM_INFO_SENT')
		 if is_last_error = '' then this.event ue_send (STX+'PR|PI'+is_roomnumber +'|'+ETX)	 // get room info... 
		END IF
	END IF

	If is_state = 'FIDELIO_ROOM_INFO_RECEIVED' then 
		// parse info and pass it back to caller.
		sle_out.text = is_result
		if is_roomstatus <> 'I' and is_roomstatus <> 'V' then is_roomstatus = 'O' 
		this.event ue_fidelio_parse (is_result)
		this.event ue_fill_guest_name() 
		this.event ue_fidelio_le()
		this.event ue_disconnect ()
		this.event ue_free_lock ()
		this.event ue_end_tran() 
	END IF // 'ROOMINFO' 
end choose 
end event

event type integer ue_fidelio_parse(string as_input);// RO=Old Room Number on guest change
// GV=VIP status = 1 is VIP? 

// RN=Room Number
// G#=PMS guest #
// GN=Guest Name (Last, First)
// GF=Guest First Name 
// GA=Arrival Date
// GD=Departure Date
// GS=Guest share ======== i.e. GSY 
// GT=Guest title

// A0=SPG#
// A1=Address (Street1, Street2, City, State, Zip, Country)
// A2=Company Name
// A3=Telephone#
// A4=# Guests in Room (Adults, Children)
// A5=Specials codes
// A6=Block Code 
// A7=Room Type
// A8=Group Name
string ls_delim = '|'
string ls_ftag[] = {'RN','G#','GN','GA','GD','A0','A1','A2','A3','A4','A5','A6','A7','A8'}
string ls_cols[] = {'guest_room_last_checkin','guest_guest_no','guest_last_name','guest_first_name'}
long 	ll_spos, ll_epos , ll_cpos
string ls_data, ls_input 

// get single guest if many returned
If POS(is_trantype, 'SERVER') > 0 then
	ls_input = as_input 
ELSE	
	ls_input = this.event ue_fidelio_getname ( as_input , ls_delim) 
END IF

If dw_guest_info.RowCount() = 0 then dw_guest_info.InsertRow(0)

// room (or new room on guest change)
ls_data = this.event ue_fidelio_parse_field( ls_input , 'RN', ls_delim) 
if ls_data <> '' then is_roomnumber = ls_data
dw_guest_info.SetItem( 1, 'guest_room_last_checkin', ls_data) 

// old room on guest change)
is_oldroom = ''
is_oldroom = this.event ue_fidelio_parse_field( ls_input , 'RO', ls_delim) 

// guest share 
is_guest_share = ''
is_guest_share = this.event ue_fidelio_parse_field( ls_input , 'GS', ls_delim) 
if is_guest_share = '1' then is_guest_share = 'Y' // else blank

is_guest_share2=''
if is_guest_share <> '' then // find share parm 2 (old share on room change)
 long pos1 , pos2
 pos1 = POS(ls_input, ls_delim + 'GS')
 if pos1 > 0 then 
	pos2 = POS(ls_input, ls_delim + 'GS', pos1+3)
	if pos2 > 0 then 
		is_guest_share2 = mid(ls_input, pos2+3,1)
	end if	
 end if	
end if

// guest no
is_pms_guest_no = ''
is_pms_guest_no = this.event ue_fidelio_parse_field( ls_input , 'G#', ls_delim) 
if IsNumber(ls_data ) then dw_guest_info.SetItem( 1, 'guest_guest_no', long(is_pms_guest_no)) 

// guest VIP status
is_vip = ''
is_vip = this.event ue_fidelio_parse_field( ls_input , 'GV', ls_delim) 
//if is_vip = '1' then is_vip = 'Y' // else blank
dw_guest_info.SetItem( 1, 'guest_sr_code_5', is_vip) 


// guest first name
is_fname ='' 
is_fname = this.event ue_fidelio_parse_field( ls_input , 'GF', ls_delim)
// guest last name
ls_data = this.event ue_fidelio_parse_field( ls_input , 'GN', ls_delim)
ll_cpos = POS( ls_data , ',')
If ll_cpos > 1 AND ll_cpos < LEN(ls_data) then 
	is_lname = MID( ls_data, 1, ll_cpos - 1)
   if is_fname ='' then	is_fname = MID( ls_data, ll_cpos + 1)
ELSE
	is_lname = f_replace( ls_data , ',' , '')
END IF 

dw_guest_info.SetItem( 1, 'guest_last_name', 	is_lname) 
dw_guest_info.SetItem( 1, 'guest_first_name', 	is_fname) 


// guest title 
is_guest_title ='' 
is_guest_title = this.event ue_fidelio_parse_field( ls_input , 'GT', ls_delim)
//dw_guest_info.SetItem( 1, 'guest_title', 	is_guest_title ) 

string 	ls_year , ls_century, ls_date, ls_mm, ls_dd, ls_ddlim

ls_ddlim = '-'

// arrival date
ls_data = this.event ue_fidelio_parse_field( ls_input , 'GA', ls_delim) 
idt_arr = of_get_fidelio_date( ls_data)
dw_guest_info.SetItem( 1, 'guest_last_checkin_dt', idt_arr )

// departure date
ls_data = this.event ue_fidelio_parse_field( ls_input , 'GD', ls_delim) 
idt_dep = of_get_fidelio_date( ls_data)
dw_guest_info.SetItem( 1, 'guest_last_depart_dt', idt_dep )

// SPG ID
ls_data = this.event ue_fidelio_parse_field( ls_input , 'A0', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_pg_id', ls_data )

// A1=Address (Street1, Street2, City, State, Zip, Country)
ls_data 	  =''
is_street1 =''
is_street2 =''
is_city	  =''
is_st		  =''	
is_zip	  =''
is_country =''

ls_data = this.event ue_fidelio_parse_field( ls_input , 'A1', ls_delim) 
ll_cpos = POS( ls_data , ',')
If ll_cpos > 0 then 				
	//street 1
	If ll_cpos > 1 then is_street1 = MID(ls_data, 1, ll_cpos -1 )
	ls_data = MID( ls_data, ll_cpos + 1)
	dw_guest_info.SetItem( 1, 'guest_addr1', is_street1) 
ELSE
	// no commas just set the address 1 line
	is_street1 = ls_data
	dw_guest_info.SetItem( 1, 'guest_addr1', is_street1) 
END IF 
ll_cpos = POS( ls_data , ',') 
If ll_cpos > 0 then 
	//street 2
	If ll_cpos > 1 then is_street2 = MID(ls_data, 1, ll_cpos -1 )
	ls_data = MID( ls_data, ll_cpos + 1)
	dw_guest_info.SetItem( 1, 'guest_addr2', is_street2) 
END IF 
ll_cpos = POS( ls_data , ',') 
If ll_cpos > 0 then 
	//city 
	If ll_cpos > 1 then is_city = MID(ls_data, 1, ll_cpos -1 )
	ls_data = MID( ls_data, ll_cpos + 1)
	dw_guest_info.SetItem( 1, 'guest_city', is_city ) 
END IF 
ll_cpos = POS( ls_data , ',') 
If ll_cpos > 0 then 
	//state
	If ll_cpos > 1 then is_st = MID(ls_data, 1, ll_cpos -1 )
	ls_data = MID( ls_data, ll_cpos + 1)
	dw_guest_info.SetItem( 1, 'guest_state', is_st  ) 
END IF 
ll_cpos = POS( ls_data , ',') 
If ll_cpos > 0 then 
	//zip
	If ll_cpos > 1 then is_zip = MID(ls_data, 1, ll_cpos -1 )
	ls_data = MID( ls_data, ll_cpos + 1)
	dw_guest_info.SetItem( 1, 'guest_zip', is_zip ) 
END IF 

If len( trim(ls_data )) > 1 then 
	//country
	is_country = trim(ls_data) 
	If is_country = 'US' then is_country = 'USA' 
	dw_guest_info.SetItem( 1, 'guest_country', is_country ) 
END IF 

// company name
is_company = ''
is_company = this.event ue_fidelio_parse_field( ls_input , 'A2', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_comp_name', is_company) 

// phone no
is_phone =''
is_phone = this.event ue_fidelio_parse_field( ls_input , 'A3', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_phone', is_phone) 

// No of Adults 
ls_data = this.event ue_fidelio_parse_field( ls_input , 'A4', ls_delim) 
ll_cpos = POS( ls_data , ',')
IF ll_cpos > 1 then 
	ls_data = MID (ls_data , 1, ll_cpos - 1)
ELSE
	ls_data = f_replace( ls_data , ',' , '')
	ls_data = f_replace( ls_data , '0' , '')
END IF
If IsNUmber(ls_data ) then 
	ii_adults =dec(ls_data)
	dw_guest_info.SetItem( 1, 'guest_no_adult', ii_adults ) 
end if

// spec code
ls_data = this.event ue_fidelio_parse_field( ls_input , 'A5', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_sr_code_1', MID(ls_data,1,4)) 

// block code
ls_data = this.event ue_fidelio_parse_field( ls_input , 'A6', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_block_code', ls_data) 

// room type
ls_data = this.event ue_fidelio_parse_field( ls_input , 'A7', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_accom_code', ls_data) 

// group name
ls_data = this.event ue_fidelio_parse_field( ls_input , 'A8', ls_delim) 
dw_guest_info.SetItem( 1, 'guest_grp_mstr_name', ls_data) 

return 1



end event

event ue_fidelio_parse_field;long 	ll_len, ll_spos ,ll_epos 
string ls_data 

ll_len = len(as_tag) + len(as_delim) 

ll_spos = POS ( as_input, as_delim + as_tag, 1)
If ll_spos <= 0 then return ''
ll_epos = POS( as_input, as_delim, ll_spos + ll_len )
ls_data = MID( as_input, ll_spos + ll_len, ll_epos - ll_spos - ll_len )
ls_data = f_replace( ls_data , 's%c','')
ls_data = f_replace( ls_data , 's%' ,'')
ls_data = trim( ls_data )
return ls_data 
end event

event type integer ue_tran(string as_trantype, string as_parm1, string as_parm2, string as_parm3, string as_parm4);
this.event ue_get_lock() 
IF il_lock_sqlcode = 0 then 
		// do the tran
		it_transtart = now() 
		dw_guest_info.reset()
		if not ib_server then 
			If is_interface = 'FIDELIO' or is_interface = 'GEAC' then
				p_wait.visible 		= true
				st_waiting.visible 	= true
				st_message.visible 	= true
				st_state.visible 		= true
			END IF
		ELSE
			If is_interface = 'FIDELIO' or is_interface = 'FIDELIO_SERVER' or is_interface = 'GEAC' then
				p_wait.visible 		= true
				st_waiting.visible 	= true
				st_message.visible 	= true
				st_state.visible 		= true
			END IF
		end if	
		dw_guest_info.visible 	= false
		il_guests_in_room = 0
		ib_multiple_guests = false

		is_roomstatus = '' // reset
		If is_interface = 'FIDELIO_SERVER' and as_trantype = 'ROOMINFO' then 
			this.event ue_FILE_tran	(as_trantype, as_parm1, as_parm2, as_parm3, as_parm4)
		ElseIf is_interface = 'FIDELIO' or is_interface = 'FIDELIO_SERVER' then 
			this.event ue_fidelio_tran	( as_trantype, as_parm1, as_parm2, as_parm3, as_parm4)
		ElseIf is_interface = 'GEAC' then 
			this.event ue_GEAC_tran		( as_trantype, as_parm1, as_parm2, as_parm3, as_parm4)
		ElseIf is_interface = 'FILE' or is_interface = 'ONQ' or is_interface = 'OPERA' then // get user info from our db
			this.event ue_FILE_tran	(as_trantype, as_parm1, as_parm2, as_parm3, as_parm4)
		ELSE
		END IF 

END IF
return 1
end event

event ue_geac_tran;// 1. Process call parms
IF LEN(as_trantype) > 0 then is_trantype 	= as_trantype
IF LEN(as_parm1) > 0 	then is_parm1 		= as_parm1
IF LEN(as_parm2) > 0 	then is_parm2 		= as_parm2
IF LEN(as_parm3) > 0 	then is_parm3 		= as_parm3
IF LEN(as_parm4) > 0 	then is_parm4 		= as_parm4

//ole_tcp1.object.localport = 22375
//IF is_trantype = 'ROOMINFO' then  	
	
// 2. connect
If is_state = 'NOT CONNECTED' then 
	is_input 	= '' // ignore stuff sent without our request.
	mle_in.text = '' 
	this.POST event ue_connect ('',0) 		// < 0 then return 
	return 
END IF

If is_state = 'CONNECTED' then 
	is_input 	= '' // ignore stuff sent without our request.
	if is_last_error = '' then this.of_setstate	 ('GEAC_READY')
END IF
//----------------------------------------------------------------

If is_state = 'GEAC_READY' then 
	ii_commandwait = 0
	sle_wait.text = string(ii_commandwait )
	is_input 			= '' 
	
	CHOOSE CASE is_trantype 

		CASE 'ROOMINFO' 
			is_guestnumber	=	'0000000000'
			is_roomnumber		=  LEFT(TRIM(is_parm1) + '         ',8)
			is_command 		= '00'+ is_terminal_id + is_roomnumber + is_guestnumber	+ ETX
			is_command 		= STX + is_command + of_calc_lrc( is_command )
			if is_last_error = '' then 
				this.of_setstate	 ('GEAC_ROOM_INFO_SENT') 
				this.event ue_send ( is_command )	 // get room info... 
				ii_NAK_count = 0
			end if

		CASE 'RETURN' 
			is_roomnumber		= LEFT(TRIM(is_parm1) + FILL(' ',8), 8) 
			is_guestnumber		= LEFT(TRIM(is_parm2) + FILL(' ',10),10)	
			is_HE_CallNum		= LEFT(TRIM(is_parm3) + FILL(' ',6),6)	
			is_HE_RetDesc		= LEFT(TRIM(is_parm4) + FILL(' ',25),25)	
			is_HE_Retcode		= 'HE' // hardcoded HE for GEAC, code for Fidelio 
			is_command 			= '03'+ is_terminal_id + is_HE_CallNum+ is_roomnumber + is_guestnumber + is_HE_Retcode+ is_HE_RetDesc + ETX
			is_command 			= STX + is_command + of_calc_lrc( is_command ) 
			if is_last_error = '' then 
				this.of_setstate	 ('GEAC_RETURN_SENT') 
				this.event ue_send ( is_command )	 
				ii_NAK_count = 0
			end if

	END CHOOSE

END IF // 'GEAC_READY' 
//----------------------------------------------------------------

If is_state = 'GEAC_NAMELIST_RECEIVED' then 
	// parse info and get user's selection 
	if this.event ue_geac_getname() < 0 then // operator cancelled
		this.event ue_disconnect ()
		this.event ue_end_tran() 
	ELSE
		//	send another request
		is_input 			= '' 
		is_command 		= '00__3456789'+ is_roomnumber + is_guestnumber	+ ETX
		is_command 		= STX + is_command + of_calc_lrc( is_command )
		if is_last_error = '' then 
			this.of_setstate	 ('GEAC_ROOM_INFO_SENT') 
			this.event ue_send ( is_command )	 // get room info... 
			ii_NAK_count = 0
		end if

	END IF
END IF


If is_state = 'GEAC_ROOM_INFO_RECEIVED' then 
	// parse info and pass it back to caller.
	this.of_setstate( 'GEAC_ROOM_INFO_COMPLETED')
	sle_out.text = is_result
	is_roomstatus = 'O' //occupied
	this.event ue_geac_parse (is_result)
	this.event ue_disconnect ()
	this.event ue_end_tran() 
END IF

//END IF // 'ROOMINFO' 
end event

event ue_geac_parse;//02__3456789    6922262000120420001208                    TINTLE, STEVEN                                                                         North Reading  MA01864     USA                                             362     S
//123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_
//				 													 50																100																150															 200					  220
//				 AAAAAAAAAAyyyymmddyyyymmdd...../////...../////

//	Field Description			Data Type			Position		Length
//	-----------------			----------------	--------		------
//	Message Type (02)			Numeric					1				2
//	Hotel Expert Terminal #	Numeric/IP Addr		3				9
//	Geac Guestnum				Numeric					12				10
//	Arrival Date				Date						22				8
//	Departure Date				Date						30				8
//	SPG #							Alpha	Numeric			38				20
//	Name (Last, First)		Alpha Numeric			58				30
//	Address						Alpha Numeric			88				40
//	City							Alpha Numeric			128			15
//	State							Alpha Numeric			143			2
//	Zip Code						Alpha Numeric			145			10
//	Country Code				Alpha Numeric			155			3
//	Company Name				Alpha Numeric			158			20
//	Group Name					Alpha Numeric			178			25
//	Room Number					Alpha Numeric			203			8

string ls_cols[] = {'guest_room_last_checkin','guest_guest_no','guest_last_name','guest_first_name'}
long 	ll_spos, ll_epos , ll_cpos
string ls_data, ls_fname, ls_lname

If dw_guest_info.RowCount() = 0 then dw_guest_info.InsertRow(0)
as_input =MID(as_input, 2)
// room
ls_data = trim( MID(as_input, 203, 8) )
dw_guest_info.SetItem( 1, 'guest_room_last_checkin', ls_data) 

// guest no
ls_data = trim( MID(as_input, 12, 10) )
if IsNumber(ls_data ) then dw_guest_info.SetItem( 1, 'guest_guest_no', long(ls_data)) 

// guest name
ls_data = trim( MID(as_input, 58, 30) )
ll_cpos = POS( ls_data , ',')
If ll_cpos > 1 AND ll_cpos < LEN(ls_data) then 
	ls_lname = MID( ls_data, 1, ll_cpos - 1)
	ls_fname = MID( ls_data, ll_cpos + 1)
ELSE
	ls_lname = f_replace( ls_data , ',' , '')
	ls_fname = ' '
END IF 
ls_lname = trim( ls_lname )
ls_fname = trim( ls_fname )
dw_guest_info.SetItem( 1, 'guest_last_name', 	ls_lname) 
dw_guest_info.SetItem( 1, 'guest_first_name', 	ls_fname) 

string ls_year , ls_century
datetime ldt_temp
// arrival date
ls_data = trim( MID(as_input, 22, 8) )
ls_data = f_nvl( ls_data, '')
ls_data = trim(ls_data) 
ls_year = MID(ls_data, 1, 4) 
ls_data = MID(ls_data, 5, 2)+ '-'+MID(ls_data, 7, 2) + '-' + ls_year 
ldt_temp =  datetime(date(ls_data))
dw_guest_info.SetItem( 1, 'guest_last_checkin_dt', ldt_temp )

// departure date
ls_data = trim( MID(as_input, 30, 8) )
ls_data = f_nvl( ls_data, '')
ls_data = trim(ls_data) 
ls_year = MID(ls_data, 1, 4) 
ls_data = MID(ls_data, 5, 2)+ '-'+MID(ls_data, 7, 2) + '-' + ls_year 
ldt_temp =  datetime(date(ls_data))
dw_guest_info.SetItem( 1, 'guest_last_depart_dt', ldt_temp )

// SPG ID
ls_data = trim( MID(as_input, 38, 20) )
dw_guest_info.SetItem( 1, 'guest_pg_id', ls_data )

// Address 
ls_data = trim( MID(as_input, 88, 40) )
dw_guest_info.SetItem( 1, 'guest_addr1', ls_data ) 
dw_guest_info.SetItem( 1, 'guest_addr2', '') 
ls_data = trim( MID(as_input, 128, 15) )
dw_guest_info.SetItem( 1, 'guest_city', ls_data ) 
ls_data = trim( MID(as_input, 143, 2) )
dw_guest_info.SetItem( 1, 'guest_state', ls_data ) 
ls_data = trim( MID(as_input, 145, 10) )
dw_guest_info.SetItem( 1, 'guest_zip', ls_data ) 
ls_data = trim( MID(as_input, 155, 3) )
dw_guest_info.SetItem( 1, 'guest_country', ls_data ) //???????? code??????

//	Company Name				Alpha Numeric			157			20

// company name
ls_data = trim( MID(as_input, 158, 20) )
dw_guest_info.SetItem( 1, 'guest_comp_name', ls_data) 

// phone no
//ls_data = trim( MID(as_input, 158, 20) )
//dw_guest_info.SetItem( 1, 'guest_phone', ls_data) 

// No of Adults 
if	not ib_multiple_guests then il_guests_in_room = 1
dw_guest_info.SetItem( 1, 'guest_no_adult', il_guests_in_room ) 

// spec code
ls_data = ''
dw_guest_info.SetItem( 1, 'guest_sr_code_1', MID(ls_data,1,4)) 

// block code
ls_data = ''
dw_guest_info.SetItem( 1, 'guest_block_code', ls_data) 

// room type
ls_data = ''

// group name
ls_data = ''
dw_guest_info.SetItem( 1, 'guest_grp_mstr_name', ls_data) 
this.event ue_fill_guest_name() 
return 1



end event

event ue_geac_onreceive(string as_incoming);// resend for NAKs
If as_incoming = NAK then 
	if ii_NAK_count < ii_NAK_max and is_last_error = '' then
		IF ii_NAK_wait > 0 then f_wait ( ii_NAK_wait ) // wait if necessary
	 	this.event ue_send ( is_command )	 // get room info... 
		ii_NAK_count ++
	 	return 
	else
		of_MessageBox('GEAC Request Response', 'NAK count exceeded while trying to send:~r~n~r~n'+ is_command)		
		this.event ue_disconnect()
		this.event ue_end_tran()
		return

	end if
End IF 

If as_incoming = ACK then 
	If as_incoming = ACK then 	
		this.of_setstate( 'GEAC_RETURN_COMPLETED')
		this.event ue_disconnect()
		this.event ue_end_tran()
	END IF
	return 
End If
	
long	ll_inlen
as_incoming = f_nvl(as_incoming,'')
ll_inlen		= LEN( as_incoming)
If ll_inlen <=1 then return 
// Verify no data errors and send NAK or ACK back (it rhymes!) - ONLY if USE LRC OPtion is active !!!!
If ll_inlen >= 3 and is_uselrc = 'Y' then 
	string ls_input, ls_lrc
	ls_input = MID( as_incoming, 2, ll_inlen - 2)
	ls_lrc 	= MID( as_incoming, ll_inlen, 1 )		// last char
	If ls_input <> of_calc_lrc( is_command ) then 
		IF ii_out_NAK_wait > 0 then f_wait ( ii_out_NAK_wait ) // wait if necessary
	 	this.event ue_send ( NAK )	 
	   ii_out_NAK_count ++
 		return 
	ELSE 
	 	this.event ue_send ( ACK )	 
 	   ii_out_NAK_count = 0
	END IF 
end if		
		
CHOOSE CASE  this.is_state 

 CASE 'GEAC_ROOM_INFO_SENT'

	If MID( f_nvl(as_incoming,''), 2, 2) = '04' and LEN( as_incoming) >= 14 then 
		// Failure response
		is_messagetype = MID( as_incoming, 2, 	2)
		string ls_geac_error 
		ls_geac_error = MID(  as_incoming, 13, 2)

		CHOOSE CASE ls_geac_error 
			CASE 'IR'
				of_MessageBox('GEAC Request Response', 'Invalid room:'+ is_roomnumber)
				this.of_setstate( 'GEAC_ROOM_INFO_ERROR')
				is_roomstatus = 'I' // invalid
			CASE 'VR'
				of_MessageBox('GEAC Request Response', 'Vacant room:' + is_roomnumber)
				this.of_setstate( 'GEAC_ROOM_VACANT')
				is_roomstatus = 'V' // vacant
		END CHOOSE

		this.event ue_disconnect()
		this.event ue_end_tran()
		return
	END IF

	is_result = as_incoming
	IF MID( is_result , 2, 2 ) = '01' then 
		this.of_setstate( 'GEAC_NAMELIST_RECEIVED')		
		il_guests_in_room = 0
		ib_multiple_guests = true

	ELSEIF MID( is_result , 2, 2 ) = '02' then 
		this.of_setstate( 'GEAC_ROOM_INFO_RECEIVED')
	END IF
	this.event ue_geac_tran('','','','','') 

 CASE 'GEAC_RETURN_SENT'
	If as_incoming = ACK then 	
		this.of_setstate( 'GEAC_RETURN_COMPLETED')
		this.event ue_disconnect()
		this.event ue_end_tran()
	END IF
	
END CHOOSE



end event

event ue_fidelio_onreceive(string as_incoming);as_incoming = f_nvl(as_incoming ,'')
is_input = f_nvl(is_input,'')
int 		li_pos1, li_pos2

// trace 1 !!!!!!!!!!!!!! not ue_trace !!!!!!!!!!!!
uo_trace1.event ue_trace('ue_fidelio_onreceive,'+string(datetime(today(),now())) &
	+ 'state: '+ is_state, is_input)

// regardless of state LE 
if ii_version = 2 then 
	If POS( is_input , 'DE|DA') > 0 then 	// db refresh END  
		ib_db_refresh=false
//		this.event ue_parent_save () 
		this.event ue_update_room_reg () 
		this.of_setstate( 'FIDELIO_READY') 
	END IF
	
	If POS( is_input , 'LE|DA') > 0 then 	// LINK END (FID SHUTDOWN)
		if is_state <> 'FIDELIO_LE_ACK_WAIT' then
			//MessageBox('FIDELIO Interface Shutdown','FIDELIO Originated Link Shutdown')
			this.event ue_tran( 'SERVERDISC_NO_LE', '' ,'','','') //  
			ib_restart = true 
			this.of_setstate( 'RESTART')  //
		ELSE 
			this.event ue_tran( 'SERVERDISC_NO_LE', '' ,'','','') //  
			this.of_setstate( 'NOT CONNECTED')  //
		end if	
	end if 
end if 

if ib_async and ib_online and POS(this.is_state, 'LINKINIT') <= 0 then // just save cmd to the queue

	  INSERT INTO "pms_queue"  
         ( "sent_ind",   
           "cmd",   
           "inbound" )  
	  VALUES ( 'N',   
           :is_input ,   
           'Y' )  ;
	RETURN 
END IF


CHOOSE CASE  this.is_state 

//====================================================================
// FIDELIO ORIGINATED MSGS 
//====================================================================
 CASE 'FIDELIO_READY' 
	If POS( is_input , 'GI|') > 0 then 	// GUEST IN 
		this.of_setstate( 'SERVER_GUESTIN')  //
		this.event ue_fidelio_tran('SERVER_GUESTIN','','','','') 
	end if 
	//-------------------------------------------------------------
	If POS( is_input , 'GO|') > 0 then 	// GUEST OUT
		this.of_setstate( 'SERVER_GUESTOUT')  //
		this.event ue_fidelio_tran('SERVER_GUESTOUT','','','','') 
	end if 
	//-------------------------------------------------------------
	If POS( is_input , 'GC|') > 0 then 	// GUEST CHANGE (ROOM) 
		this.of_setstate( 'SERVER_GUESTCHANGE')  //
		this.event ue_fidelio_tran('SERVER_GUESTCHANGE','','','','') 
	end if 
	
//====================================================================
 CASE 'FIDELIO_POSTANSWERWAIT' 
	If POS( is_input , 'PA|') > 0 then 	// waiting for PostAnswer PA after PS cmd
		If POS( is_input , '|ASOK|') > 0 then 	
			this.event dynamic ue_pmsqueue_marksent() 
		END IF	
		this.of_setstate( 'FIDELIO_READY') 
	end if 
 CASE 'FIDELIO_LINKINIT' 
	If POS( is_input , 'LA|') > 0 then 	// waiting for LA after last init cmd
		this.of_setstate( 'FIDELIO_READY') 
		ib_restart = false
		this.event ue_fidelio_tran('','','','','') 
	end if 

 CASE  'FIDELIO_LINKINIT_REQUESTED_STATUS' 
	If 1=1 or POS( is_input , 'LS|') > 0 then // ALWAYS INIT LINK !!!!!!!!!!!
		// need to init link 
		this.event ue_fidelio_init() // goes through commands and back to us
		this.of_setstate( 'FIDELIO_READY')
		this.event ue_fidelio_tran('','','','','') // VZ 2005-08-22 

		return
		
	ELSEIF POS( is_input, 'LA|') > 0 then 
		// already alive - just get/send info
		this.of_setstate( 'FIDELIO_READY')
		this.event ue_fidelio_tran('','','','','') 
		
	ELSE
		// wait for the right response !!!!!!!!
		is_input = '' // ignore out of sequence messages

		// this.of_setstate( 'FIDELIO_STATUS_CHECK_ERROR')
		// MessageBox('Hotel Expert FIDELIO Interface Error', 'Invalid Link Status response from Fidelio:~r~n'+ string(f_nvl(is_input,'')), stopsign!)		
		return
	END IF

 CASE 'FIDELIO_ROOM_INFO_SENT' 
	If POS( as_incoming, 'PL|RN') > 0 then 
		is_result = as_incoming
		this.of_setstate( 'FIDELIO_ROOM_INFO_RECEIVED')
		this.event ue_fidelio_tran('','','','','') 
	ELSEif POS( as_incoming, 'PA|') > 0 and POS( as_incoming, '|CTINVALID ROOM') > 0 then 
		is_roomstatus = 'I' 
		
		if ib_server then // go through the tran anyway
			this.of_setstate( 'FIDELIO_ROOM_INFO_RECEIVED')
			this.event ue_fidelio_tran('','','','','') 
			return 
		end if
		
		this.event ue_fidelio_le()
		this.event ue_disconnect()
		this.event ue_free_lock()
		of_MessageBox('FIDELIO Request Response', 'Invalid room:'+ is_roomnumber)
		is_input = '' 
		this.event ue_end_tran()
		return
	ELSEif POS( as_incoming, 'PA|') > 0 then 
// assumption acording to fidelio - any msg - room empty... 
//		( POS( as_incoming, '|CTROOM VACANT') > 0 or POS( as_incoming, '|CTCHECKED OUT') > 0 ) then 
		is_roomstatus = 'V' // VZ 2004-11

		if ib_server then // go through the tran anyway
			this.of_setstate( 'FIDELIO_ROOM_INFO_RECEIVED')
			this.event ue_fidelio_tran('','','','','') 
			return 
		end if
		
		this.event ue_fidelio_le()
		this.event ue_disconnect()
		this.event ue_free_lock()
		of_MessageBox('FIDELIO Request Response', 'Vacant room:'+ is_roomnumber)
		is_input = '' 
		this.event ue_end_tran()
		return
	elseif POS( as_incoming, 'XX|') > 0 then // namelist????? !!!!!!!!!!!!!!!!
		is_result = as_incoming
		IF MID( is_result , 2, 2 ) = '01' then 
			this.of_setstate( 'FIDELIO_NAMELIST_RECEIVED')		
			il_guests_in_room = 0
			ib_multiple_guests = true
		END IF
		this.event ue_fidelio_tran('','','','','') 
	end if

 CASE 'FIDELIO_RETURN_SENT'
	If as_incoming = ACK then 	
		this.of_setstate( 'FIDELIO_RETURN_COMPLETED')
		this.event ue_fidelio_le()
		this.event ue_disconnect()
		this.event ue_free_lock()
		this.event ue_end_tran()
		return
	END IF
	
END CHOOSE






end event

event ue_get_lock;string ls_msg

is_lock = ''
ls_msg = ''
uo_trace.event ue_trace('ue_get_lock start:' + string(datetime(today(),now())), ls_msg)

IF is_singlethread = 'Y' then
	// get a lock
	long		ll_sqlcode
	is_lock = cPassUserName + ':' + STRING( NOW() ) 
	UPDATE FOILOCK SET TLOCK = :is_lock ;
	il_lock_sqlcode = SQLCA.SQLCODE
	If il_lock_sqlcode <> 0 then
		MessageBox( 'Front Office Interface Error', 'Could not obtain the lock.')
	END IF 
ELSE 
	il_lock_sqlcode = 0
END IF
ls_msg = 'is_singlethread='+ f_nvl(is_singlethread ,'')+ ',il_lock_sqlcode='+ string(il_lock_sqlcode)+',is_lock='+ f_nvl(is_lock,'') 
uo_trace.event ue_trace('ue_get_lock end:' + string(datetime(today(),now())), ls_msg)



end event

event ue_free_lock;string ls_msg
ls_msg = 'is_singlethread='+ f_nvl(is_singlethread ,'')+ ',il_lock_sqlcode='+ string(il_lock_sqlcode)+',is_lock='+ f_nvl(is_lock,'') 
uo_trace.event ue_trace('ue_free_lock start:' + string(datetime(today(),now())), ls_msg)
IF is_singlethread = 'Y' then
	// free a lock
	if is_lock <> '' then 
		If il_lock_sqlcode = 0 then
			COMMIT;
			ls_msg += ', <<<COMMIT>>> '
		ELSE 
			ROLLBACK;
			ls_msg += ', <<<ROLLBACK>>> '
		END IF
	END IF
ELSE 
	il_lock_sqlcode = 0
END IF
is_lock =''
uo_trace.event ue_trace('ue_free_lock end:' + string(datetime(today(),now())), ls_msg)

end event

event ue_end_tran();// Perform end of tran processing - return data and free locks
this.event ue_free_lock() 

if not ib_server then
	st_message.visible 	= false
	st_state.visible 		= false
end if
p_wait.visible 		= false
st_waiting.visible 	= false

il_guests_in_room = 0
ib_multiple_guests = false

// Position target dw cursor

end event

event ue_geac_getname;long ll_counter, ll_row, ll_offset
string ls_temp
str_response	lstr_response

ls_temp = MID (is_result, 21, 2) 
If NOT IsNUmber( ls_temp ) then 
	MessageBox('GEAC Interface Error', 'Number of guests in the room is not numeric!~r~nField:'+ls_temp+'~r~n~r~nBuffer:~r~n'+is_result, StopSign!)
	RETURN -1
END IF
il_guests_in_room = long ( ls_temp )

ll_offset = 23
dw_namelist.Reset()
FOR ll_counter = 1 to il_guests_in_room
	ll_row = dw_namelist.InsertRow(0)
	IF ll_row <= 0 then EXIT
	ls_temp = MID( is_result, ll_offset , 10)
	dw_namelist.SetItem( ll_row, 'guest_number', ls_temp )
	ls_temp = MID( is_result, ll_offset + 10, 20) 
	dw_namelist.SetItem( ll_row, 'guest_name', ls_temp )
	ll_offset = ll_offset + 34
NEXT 

if il_guests_in_room  = 1 then 
	is_guestnumber = dw_namelist.GetItemString( ll_row, 'guest_number')
else
	//display response window 
	istr_response.dw1 = dw_namelist
	OpenWithParm ( w_foi_guest_selection, istr_response) 
	lstr_response = Message.PowerObjectParm
	If Not IsValid( lstr_response ) then 
		MessageBox('GEAC Interface Error', 'Invalid structure returned from guest selection!', StopSign!)
		return -1
	END IF 
	If lstr_response.rc < 0 then RETURN -1 // cancel 
	is_guestnumber = lstr_response.string1 // set selection
END IF
RETURN 1



end event

event type string ue_fidelio_getname(string as_input, string as_delim);// RN=Room Number
// G#=PMS Conf#
// GN=Guest Name (Last, First)
// GA=Arrival Date
// GD=Departure Date
// A0=SPG#
// A1=Address (Street1, Street2, City, State, Zip, Country)
// A2=Company Name
// A3=Telephone#
// A4=# Guests in Room (Adults, Children)
// A5=Specials codes
// A6=Block Code 
// A7=Room Type
// A8=Group Name

//as_input  = "PL|RN205|G#5|GNGuest5|GA980317|GD980322|A055555550 - Guest5|"
//as_input +=	"A155555550|A2%.2s%s%c|A3%.2s%s%c|A4%.2s%s%c|"
//as_input +=	"A5%.2s%s%c|A6%.2s%s%c|A7%.2s%s%c|A8%.2s%s%c"
//as_input +=	"|RN205|G#6|GNGuest5|GA980317|GD980322|A055555551 - Guest5|"
//as_input +=	"A155555551|A2%.2s%s%c|A3%.2s%s%c|A4%.2s%s%c|"
//as_input +=	"A5%.2s%s%c|A6%.2s%s%c|A7%.2s%s%c|A8%.2s%s%c|"

long 				ll_guests_in_room, ll_counter, ll_row, ll_startpos, ll_length 
string 			ls_temp, ls_ret, ls_input , ls_data, ls_name, ls_rec
str_response	lstr_response

dw_namelist.Reset()
// if/ while more than one guest record passed as input
ls_input = as_input // first guest record 
ll_startpos	= 1 
//get length of the current guest record
ll_length = POS( ls_input , as_delim + 'RN', 10) 

If ll_length > 0 then // multiple guest records 

	DO WHILE len(ls_input) > 0 
		ll_row = dw_namelist.InsertRow(0)
		IF ll_row <= 0 then EXIT	

		// guest no
		ls_data = this.event ue_fidelio_parse_field( ls_input , 'G#', as_delim) 
		dw_namelist.SetItem( ll_row, 'guest_number', ls_data  )
		
		// guest name
		ls_name = this.event ue_fidelio_parse_field( ls_input , 'GN', as_delim)
		dw_namelist.SetItem( ll_row, 'guest_name', ls_name )
		
		// guest_record		
		if ll_length > 0 then
			ls_data = MID ( ls_input, 1 , ll_length - 1 ) + as_delim		
			ls_input 	= MID ( ls_input, ll_length ) // the rest of input string
			ll_length 	= POS( ls_input , as_delim + 'RN', 10) 
		else
			ls_data 		= ls_input 		
			ls_input 	= ''
		end if
		ls_rec = ls_data 
		dw_namelist.SetItem( ll_row, 'guest_record', ls_rec)

		if ib_server then EXIT 

	LOOP
	
	this.event ue_free_lock ()
	this.event ue_disconnect ()
	
	if not ib_server then
		//display response window 
		istr_response.dw1 = dw_namelist
		OpenWithParm ( w_foi_guest_selection, istr_response) 
		lstr_response = Message.PowerObjectParm
		If Not IsValid( lstr_response ) then 
			MessageBox('FIDELIO Interface Error', 'Invalid structure returned from guest selection!', StopSign!)
			return ''
		END IF 
		If lstr_response.rc < 0 then RETURN '' // cancel 
		ls_ret = lstr_response.string2 // set selection
	END IF // server check 
	
	ls_ret = ls_rec // USE FIRST GUEST IN SHARE 
ELSE 
	ls_ret = ls_input
END IF
RETURN ls_ret



end event

event ue_getroominfo(string as_room);is_result_title = ''
is_result_msg = ''
st_msg.text = ''

If NOT IsValid( idw_target ) then 
	MessageBox( is_interface + ' Initialization Error ', 'Must specify target datawindow in foi object constructor!', StopSign!)
	return
END IF
as_room = f_nvl(as_room ,'') 
If as_room = '' then 
	If idw_target.rowcount() > 0 then 
		as_room = f_nvl( string(idw_target.object.room [idw_target.GetRow()]) ,'')
	END IF 
END IF

If gnv_appman.is_debugmode = 'Y' and as_room = '' then as_room = trim(sle_room.text)

If as_room = '' or IsNull(as_room ) then 
	MessageBox( is_interface + ' Request Error ', 'Must specify room.')
	return 
END IF

// Client room requests always FILE = from room_registry 2005-08-09
//is_interface = 'FILE' 

this.event ue_tran( 'ROOMINFO', as_room ,'','','') 


end event

event ue_timeoutcheck;// if SecondsAfter ( it_transtart, now() )  
// time out occured - close up shop or wait more 

end event

event ue_getroomauto();//should be called from itemchanged etc. 
if is_autorequest = 'Y' then 
	this.event ue_getroominfo('')
end if 

end event

event type double ue_save_guest(boolean ab_insertcall, string as_problem, string as_subproblem);//Save only if caller category is GST and code is returnable
//otherwise - no need to save guest info

// RETURNS ACCOUNT !!!!!!

double id_account 

if this.event ue_validate_interface() < 0 then return -10
long ll_row, ll_ret , ll_target_row, ll_answer

ll_row = dw_guest_info.GetRow() 
// Check for empty guest info
boolean lb_empty_guest 
string ls_lname, ls_fname, ls_ret 

ls_lname = '' 
ls_fname = '' 

If ll_row <= 0 then 
	lb_empty_guest = true 
ELSE
	ls_lname = trim( f_nvl(string(dw_guest_info.object.guest_last_name 	[ll_row ]),''))
	ls_fname = trim( f_nvl(string(dw_guest_info.object.guest_first_name	[ll_row ]),''))
	// update room registry 
	this.event ue_update_room(ll_row)
END IF
// end of empty guest check 
	
ll_row = idw_target.GetRow()
string ls_category 
ls_category = f_nvl(idw_target.GetItemString( ll_row, "caller_category"),'')

If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'Category: '+ls_category )
If ls_category <> "GST" or ls_category = '' or IsNull(ls_category) then return 0

return 0
////////////////////////////////////////////////////////////////////
// NEW inteRFACE DOES NOT NEED TO SAVE GUESTS => ALREADY IN db
////////////////////////////////////////////////////////////////////

// Do not save guest if non returnable subproblem
string ls_retcode, ls_retcode_desc
// ab_insertcall as_problem as_subproblem 
SELECT retcode INTO :ls_retcode	FROM subproblem WHERE subproblem_number = :as_subproblem AND problem_number = :as_problem ;
ls_retcode	= f_nvl( ls_retcode, '')

If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'Retcode: '+ls_retcode	)

IF IsNUll( ls_retcode) or trim(ls_retcode) = '' then 
	return 0 // no need to save guest - subproblem non returnable to PMS
end if

SELECT descr 	INTO :ls_retcode_desc 	FROM RETCODES WHERE code = :ls_retcode;

If dw_guest_info.AcceptText() <> 1 then 
	MessageBox('Save Guest Error', 'Guest info validation failed.')
	return 0 
END IF

If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'Guest name: '+ls_fname +' '+ ls_lname  )
If ls_lname = '' or ls_fname = '' then lb_empty_guest = true 

If lb_empty_guest then 
	ll_answer =	MessageBox('Guest Info Error', 'Guest information is needed for this type of call. Would you like to save the call anyway?', exclamation!,yesno!, 2)
	If ll_answer = 2 then return -2000
END IF 

// Check for dups
If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'Checking for duplicate guests.')

	ib_usedexisting = false
	
	dw_dupcheck.Reset()
	dw_dupcheck.insertRow(0)
	dw_dupcheck.object.guest_last_name 	[1]= ls_lname // dw_guest_info.object.guest_last_name 	[ll_row ]
	dw_dupcheck.object.guest_first_name [1]= ls_fname // dw_guest_info.object.guest_first_name	[ll_row ]
	dw_dupcheck.object.guest_city 		[1]= ''//dw_guest_info.object.guest_city			[ll_row ]
	dw_dupcheck.object.guest_state 		[1]= ''//dw_guest_info.object.guest_state			[ll_row ]
	dw_dupcheck.object.guest_zip 			[1]= ''//dw_guest_info.object.guest_zip				[ll_row ]
	
	ll_ret = dw_dupcheck.event ue_askuser() 

	If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'Dup. check return: '+string( ll_ret  ))

	If ll_ret > 0 then 
		ib_usedexisting = true 

		id_account 													= dw_dupcheck.object.guest_account	[ll_ret]
		dw_guest_info.object.guest_account	[ll_row]		= id_account 

		dw_guest_info.object.guest_last_name [ll_row] 	= dw_dupcheck.object.guest_last_name [ll_ret]
		dw_guest_info.object.guest_first_name [ll_row] 	= dw_dupcheck.object.guest_first_name [ll_ret]
		dw_guest_info.object.guest_city [ll_row] 			= dw_dupcheck.object.guest_city 	[ll_ret]
		dw_guest_info.object.guest_state [ll_row] 		= dw_dupcheck.object.guest_state [ll_ret]
		dw_guest_info.object.guest_zip [ll_row] 			= dw_dupcheck.object.guest_zip 	[ll_ret]
		dw_guest_info.object.guest_addr1 [ll_row] 		= dw_dupcheck.object.guest_addr1 [ll_ret]
		dw_guest_info.object.guest_addr2 [ll_row] 		= dw_dupcheck.object.guest_addr2 [ll_ret]
		dw_guest_info.object.guest_phone [ll_row] 		= dw_dupcheck.object.guest_phone [ll_ret]
		dw_guest_info.object.guest_comp_name [ll_row] 	= dw_dupcheck.object.guest_comp_name [ll_ret]
		dw_guest_info.object.guest_email [ll_row] 		= dw_dupcheck.object.guest_email 	[ll_ret]
		dw_guest_info.object.guest_room_last_checkin [ll_row] = dw_dupcheck.object.guest_room_last_checkin 	[ll_ret]
		dw_guest_info.object.guest_guest_id [ll_row] 	= dw_dupcheck.object.guest_guest_id 	[ll_ret]
//		dw_guest_info.object.guest_last_checkin_dt [ll_row]= dw_dupcheck.object.guest_last_checkin_dt 	[ll_ret]
//		dw_guest_info.object.guest_last_depart_dt [ll_row] = dw_dupcheck.object.guest_last_depart_dt 	[ll_ret]
		dw_guest_info.ResetUpdate()
		If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'used existing guest id: '+string( id_account  ))
		return id_account // existing
	ELSE
		ib_usedexisting = false		
		// get new account id 
		SELECT max(account) into :id_account from guest ;
		If IsNull( id_account) then id_account = 0
		id_account = id_account + 1 

		ll_row = dw_guest_info.GetRow() 
		
		If gnv_appman.is_debugmode = 'Y' then MessageBox('DEBUG: ue_save_guest', 'guest_info row:'+ string(ll_row )+', used new guest id: '+string( id_account  )) 
		
		dw_guest_info.object.guest_account	[ll_row]		= id_account 		
		dw_guest_info.SetItemStatus( ll_row, 0, Primary!, New!)
		dw_guest_info.SetItemStatus( ll_row, 0, Primary!, NewModified!)
		
		If dw_guest_info.Update( false, true) <> 1 then 
			ROLLBACK;
			MessageBox('Database Insert Error', 'Failed to create new guest record.',exclamation!)
			return -1
		END IF

		////rrrrrrrrrrrrrrrr
		return id_account
	END IF 

end event

event ue_fill_guest_name();if this.event ue_validate_interface() < 0 then return 

long  ll_guest_row, ll_row
string  ls_rand
string ls_expr


ls_rand = f_random_string ( 20 ) 

if not isValid( dw_guest_info) then 
	MessageBox('Interface Error', 'Guest info datawindow is invalid.', exclamation!)
	return
end if

ll_guest_row = dw_guest_info.GetRow() 
if ll_guest_row <= 0 then 	return
ll_row = idw_target.GetRow()

if ib_server then 
		ls_expr =  "room = '"+ trim(is_roomnumber)+"'" 
		// Find Room Row first 
		ll_row = idw_target.Find( ls_expr, 1, idw_target.RowCount())
		if ll_row <= 0 then  
			//MessageBox('Room Registry Error', 'Room not found, expr:'+ls_expr)
			mle_in.text = 	mle_in.text +'~r~n' + 'Room not found, expr:'+ls_expr
			ll_row = idw_target.InsertRow(0) 
		End if 	
end if
//finally fill in the data 
string ls_category, ls_name
if is_roomstatus = 'O' then
//	ls_category = idw_target.GetItemString( ll_row, "caller_category")
//	If ls_category = "GST" or ls_category = '' or IsNull(ls_category) then
	ls_name = f_nvl( dw_guest_info.GetItemString( ll_guest_row, 'guest_last_name' ),'*')
	if upper(trim(ls_name)) <> "VACANT" then ls_name = ls_name +', '+f_nvl( dw_guest_info.GetItemString( ll_guest_row, 'guest_first_name' ),'')
	
	idw_target.SetItem( ll_row, "guest", ls_name )
	this.event ue_parent_setcolumn ("guest", ls_name )
	
	idw_target.SetItem( ll_row, "caller_category", "GST" )
//	iw_parent.event dynamic ue_pms_setcolumn ("caller_category", "GST")
	this.event ue_parent_setcolumn ("caller_category", "GST")
//	END IF

//=====================================================================
// SERVER  
//=====================================================================
	if ib_server then 
		idw_target.SetItem( ll_row, "room", is_roomnumber)
		
		choose case is_gc_action
		case  'ROOM MOVE'
			idw_target.SetItem( ll_row, "msg", 'ROOM MOVE')
		case  'INFO CHANGE'
			idw_target.SetItem( ll_row, "msg", 'INFO CHANGE')
		case else
			idw_target.SetItem( ll_row, "msg", 'OCCUPIED')
		end choose

		is_gc_action =''
		
		idw_target.SetItem( ll_row, "guest_fname", f_nvl( dw_guest_info.GetItemString( ll_guest_row, 'guest_first_name' ),''))
		idw_target.SetItem( ll_row, "guest_lname", f_nvl( dw_guest_info.GetItemString( ll_guest_row, 'guest_last_name' ),''))
		string ls_date_from, ls_date_to
		ls_date_from	= string(dw_guest_info.GetItemDateTime( ll_guest_row, 'guest_last_checkin_dt'), gnv_appman.is_datemask ) 
		ls_date_to		= string(dw_guest_info.GetItemDateTime( ll_guest_row, 'guest_last_depart_dt'), gnv_appman.is_datemask ) 
		idw_target.SetItem( ll_row, "date_from", 	ls_date_from)
		idw_target.SetItem( ll_row, "date_to", 	ls_date_to) 
		idw_target.SetItem( ll_row, "rand", 		ls_rand) 
		idw_target.SetItem( ll_row, 'addr1', dw_guest_info.GetItemString( 1, 'guest_addr1' ) )
		idw_target.SetItem( ll_row, 'addr2', dw_guest_info.GetItemString( 1, 'guest_addr2' ) )
		idw_target.SetItem( ll_row, 'city', dw_guest_info.GetItemString( 1, 'guest_city'  ) )
		idw_target.SetItem( ll_row, 'state', dw_guest_info.GetItemString( 1, 'guest_state'  )) 
		idw_target.SetItem( ll_row, 'zip', dw_guest_info.GetItemString( 1, 'guest_zip'  ) )
		idw_target.SetItem( ll_row, 'country', dw_guest_info.GetItemString( 1, 'guest_country') ) 
		idw_target.SetItem( ll_row, 'company_name', dw_guest_info.GetItemString( 1, 'guest_comp_name' ) )
		idw_target.SetItem( ll_row, 'phone', dw_guest_info.GetItemString( 1, 'guest_phone' ) )
		idw_target.SetItem( ll_row, 'aduts_num', dw_guest_info.GetItemNumber( 1, 'guest_no_adult' ) )
		idw_target.SetItem( ll_row, 'reg_code', dw_guest_info.GetItemString( 1, 'guest_accom_code' ) )

		idw_target.SetItem( ll_row, "share3_fname", is_pms_guest_no) // pms guest num
		idw_target.SetItem( ll_row, "share3_lname", is_vip) // pms guest VIP
		idw_target.SetItem( ll_row, "share2_fname", is_guest_share) // pms share ind
		idw_target.SetItem( ll_row, "share2_lname", is_oldroom) // from room
		idw_target.SetItem( ll_row, "share1_fname", is_guest_title ) // Mr. Mrs.

//		idw_target.SetItem( ll_row, '', dw_guest_info.GetItemString( 1, 'guest_grp_mstr_name' ) )
//		idw_target.SetItem( ll_row, '', dw_guest_info.GetItemString( 1, 'guest_sr_code_1' ) )
//		idw_target.SetItem( ll_row, '', dw_guest_info.GetItemString( 1, 'guest_block_code' ) )
	end if 
	//this.event ue_parent_save () 

ELSEIF is_roomstatus = 'V' then
	idw_target.SetItem( ll_row, "guest", '')
	this.event ue_parent_setcolumn ("guest", '' )
	
	idw_target.SetItem( ll_row, "caller_category", "" )
	this.event ue_parent_setcolumn ("caller_category", "")

	if ib_server then
		idw_target.SetItem( ll_row, "room", is_roomnumber)
		idw_target.SetItem( ll_row, "rand", 		ls_rand) 		
		idw_target.SetItem( ll_row, "msg", 'VACANT' )
		idw_target.SetItem( ll_row, "guest_fname", '')
		idw_target.SetItem( ll_row, "guest_lname", '')
		idw_target.SetItem( ll_row, "date_from", '')
		idw_target.SetItem( ll_row, "date_to", '')
		idw_target.SetItem( ll_row, "share3_fname", is_pms_guest_no)// pms guest num
		idw_target.SetItem( ll_row, "share3_lname", is_vip) 			// pms guest VIP
		idw_target.SetItem( ll_row, "share2_fname", is_guest_share) // pms share ind
		idw_target.SetItem( ll_row, "share2_lname", is_oldroom) // old room on moves
		idw_target.SetItem( ll_row, "share1_fname", is_guest_title ) // Mr. Mrs.
//		idw_target.SetItem( ll_row, "rand", ls_rand) 
//		this.event ue_parent_save () 
	end if 
	
ELSEIF is_roomstatus = 'I' then
	idw_target.SetItem( ll_row, "guest", '')
	this.event ue_parent_setcolumn ("guest", '' )
	
	idw_target.SetItem( ll_row, "caller_category", "" )
	this.event ue_parent_setcolumn ("caller_category", "")
	
	if ib_server then
		idw_target.SetItem( ll_row, "msg", 'INVALID')
		idw_target.SetItem( ll_row, "guest_fname", '')
		idw_target.SetItem( ll_row, "guest_lname", '')
		idw_target.SetItem( ll_row, "share3_fname", '') // pms guest num
		idw_target.SetItem( ll_row, "share3_lname", '') // pms guest VIP
		idw_target.SetItem( ll_row, "share2_fname", '') // pms share ind
		//this.event ue_parent_save () 
	end if 
ELSEIF is_roomstatus = 'SO' then // share out 
	if ib_server then
		idw_target.SetItem( ll_row, "msg", 'SHARE OUT')
		idw_target.SetItem( ll_row, "guest_fname", '')
		idw_target.SetItem( ll_row, "guest_lname", '')
		idw_target.SetItem( ll_row, "share3_fname", is_pms_guest_no) // pms guest num
		idw_target.SetItem( ll_row, "share3_lname", is_vip) // pms guest VIP
		idw_target.SetItem( ll_row, "share2_fname", 'Y') // pms share ind
		//this.event ue_parent_save () 
	end if 

END IF 
//if not ib_db_refresh then
//	this.event ue_parent_save () 
if is_interface = 'FIDELIO_SERVER' and ib_server then 
	this.event ue_update_room_reg () 
END IF
//end if

end event

event type integer ue_validate_interface();int li_ret

If 	is_interface <> 'FIDELIO' 	and is_interface <> 'FIDELIO_SERVER' &
and 	is_interface <> 'GEAC' 		and is_interface <> 'FILE' & 
and 	is_interface <> 'ONQ' 		and is_interface <> 'OPERA' then return -1

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

event ue_sendreturn(string as_room, string as_callnum, string as_guestnum);if this.event ue_validate_interface() < 0 then return 


//----------------------------------------------------------------------------
// Verify subproblem is returnable
//----------------------------------------------------------------------------
string ls_retcode, ls_retcode_desc, ls_problem ,ls_subproblem 

SELECT  problem, subproblem INTO :ls_problem ,:ls_subproblem 
FROM timercalls p 
WHERE p.call_number = :as_callnum 
		;
if f_nvl(ls_problem , '') = '' then 
	SELECT  problem, subproblem INTO :ls_problem ,:ls_subproblem 
	FROM pendingcalls p  
	WHERE p.call_number = :as_callnum  
		;
End If 

if f_nvl(ls_problem , '') = '' then return 
// Do not return if non returnable subproblem

SELECT retcode INTO :ls_retcode			FROM subproblem WHERE subproblem_number = :ls_subproblem AND problem_number = :ls_problem ;
IF IsNUll( ls_retcode) or trim(ls_retcode) = '' then return // no need to save guest - subproblem non returnable 


//----------------------------------------------------------------------------
// Validate room num
//----------------------------------------------------------------------------
as_room = f_nvl(as_room ,'') 
If as_room = '' then 
	If idw_target.rowcount() > 0 then 
		as_room = f_nvl( string(idw_target.object.room [idw_target.GetRow()]) ,'')
	END IF 
END IF

If gnv_appman.is_debugmode = 'Y' and as_room = '' then as_room = trim(sle_room.text)

If as_room = '' or IsNull(as_room ) then 
	of_MessageBox( is_interface + ' Return Request Error ', 'Must specify room.')
	return 
END IF

//----------------------------------------------------------------------------
// Validate guest num
//----------------------------------------------------------------------------
as_guestnum = f_nvl(as_guestnum ,'') 
if as_guestnum = '' then 
	SELECT string(g.guest_no ) INTO :as_guestnum 
	FROM timercalls p, guest g 
	WHERE p.call_number = :as_callnum AND 
			g.guest_no = p.guest_id
			;
	if f_nvl(as_guestnum, '') = '' then 
		SELECT string(g.guest_no ) INTO :as_guestnum 
		FROM pendingcalls p, guest g 
		WHERE p.call_number = :as_callnum AND 
			g.guest_no = p.guest_id
			;

	End If 
End If 
If as_guestnum  = '' or IsNull(as_guestnum  ) then 
	of_MessageBox( 'HotelEXPERT '+ is_interface + ' Return Request Error ', 'Guest number is missing.')
	return 
END IF

// returnable 
SELECT descr 	INTO :ls_retcode_desc 	FROM RETCODES WHERE code = :ls_retcode;

this.event ue_tran( 'RETURN', as_room , as_guestnum, as_callnum, ls_retcode_desc ) // '205'


end event

event ue_retrieve_guest;if this.event ue_validate_interface() < 0 then return -1
dw_guest_info.Retrieve( al_guestid)	
return 1
end event

event ue_parent_setcolumn;//put code in ancestor window
end event

event ue_file_tran(string as_trantype, string as_parm1, string as_parm2, string as_parm3, string as_parm4);CHOOSE CASE as_trantype 
		

CASE 'ROOMINFO' 

// table vars 
string	room_code,   guest_lname,   guest_fname
string	addr1, addr2, city, state,  zip,  country, company_name
string	email, freq_guest_num,  phone
string 	aduts_num	
date		  dt_f, dt_t
datetime   arr_date  , dep_date
string	reg_code,  share1_lname,   share1_fname
string	share2_lname, share2_fname
string	share3_lname, share3_fname  , date_from, date_to

// 
SELECT 	room_code, guest_lname,  guest_fname,   
         addr1, addr2, city, state, zip, country,   
         company_name, 
         email,   
         freq_guest_num,   
         aduts_num,   
         phone,   
         date_from,   date_to,
         reg_code,   
         share1_lname, share1_fname,   
         share2_lname, share2_fname,   
         share3_lname, share3_fname  
	INTO 
		:room_code, :guest_lname, :guest_fname,
		:addr1, :addr2, :city, :state,  :zip,  :country, :company_name,
		:email, :freq_guest_num,  :aduts_num,  :phone,
		:date_from, :date_to,
		:reg_code,  
		:share1_lname, :share1_fname,
		:share2_lname, :share2_fname,
		:share3_lname, :share3_fname 

    FROM room_registry WHERE room_code = :as_parm1 ;
	 
If SQLCA.sqlcode < 0 then 
	of_MessageBox('FOI File SQL Error', 'code='+string(SQLCA.sqlcode )+', errmsg='+ SQLCA.sqlerrtext ) 
END IF

is_roomstatus = 'O' // preset occupied
IF IsNull( room_code) or trim(room_code)='' then is_roomstatus = 'I'
//IF IsNull( share1_lname) or trim(share1_lname)='VACANT' then is_roomstatus = 'V'
IF IsNull( guest_lname) or trim(guest_lname)='' then is_roomstatus = 'V'
//or UPPER(trim(guest_lname))='VACANT'  

If is_roomstatus = 'O' then
	//-----------
	If dw_guest_info.RowCount() = 0 then dw_guest_info.InsertRow(0)

	dw_guest_info.SetItem( 1, 'guest_room_last_checkin', room_code) // room
	//dw_guest_info.SetItem( 1, 'guest_guest_no', long(ls_data)) 

	If IsDate (date_from) then 
		dt_f = date(date_from)
	else // reverse mask if system mask does not match data
		dt_f = date(MID(TRIM(date_from),4,2)+'-'+MID(TRIM(date_from),1,2) +'-20'+MID(TRIM(date_from),7,2))
	end if		
	If IsDate (date_to) then 
		dt_t = date(date_to)
	else // reverse mask if system mask does not match data
		dt_t = date(MID(TRIM(date_to),4,2)+'-'+MID(TRIM(date_to),1,2) +'-20'+MID(TRIM(date_to),7,2))
	end if		
	
	arr_date = datetime( dt_f, time('00:00:00') )
	dep_date = datetime( dt_t, time('00:00:00') )
	
	dw_guest_info.SetItem( 1, 'guest_last_checkin_dt', arr_date)		// arrival date
	dw_guest_info.SetItem( 1, 'guest_last_depart_dt', 	dep_date)		// departure date
	dw_guest_info.SetItem( 1, 'guest_pg_id', 		freq_guest_num ) 				// SPG ID

	// Address 
	dw_guest_info.SetItem( 1, 'guest_addr1', 		addr1 	) 
	dw_guest_info.SetItem( 1, 'guest_addr2', 		addr2 	) 
	dw_guest_info.SetItem( 1, 'guest_city', 		city 		) 
	dw_guest_info.SetItem( 1, 'guest_state', 		state 	) 
	dw_guest_info.SetItem( 1, 'guest_zip', 		zip 		) 
	dw_guest_info.SetItem( 1, 'guest_country', 	country 	) 

	dw_guest_info.SetItem( 1, 'guest_comp_name', company_name) 			// company name
	dw_guest_info.SetItem( 1, 'guest_phone', 		phone)
	// phone no
	
	//if	not ib_multiple_guests then il_guests_in_room = 1
	il_guests_in_room = 1

 if is_interface = 'FIDELIO_SERVER' then 
	dw_namelist.dataobject = 'd_foi_namelist_fid' 
	dw_namelist.SetTransobject (SQLCA) 
	il_guests_in_room  = dw_namelist.Retrieve(room_code)

 else
		
	dw_namelist.Reset() 
	IF is_interface = 'FILE' then  
		If IsNUmber(aduts_num) then il_guests_in_room = integer (aduts_num) 
		long ll_row
		ll_row = dw_namelist.InsertRow(0)
		IF ll_row > 0 then 
			dw_namelist.SetItem( ll_row, 'guest_number', 1 )
			dw_namelist.SetItem( ll_row, 'guest_name', trim(f_nvl(guest_lname,'')) +', '+trim(f_nvl(guest_fname,''))   )
			dw_namelist.SetItem( ll_row, 'guest_last_name', trim(f_nvl(guest_lname,'')) )
			dw_namelist.SetItem( ll_row, 'guest_first_name', trim(f_nvl(guest_fname,'')) )
		END IF

		If TRIM(f_nvl(share1_lname,'')) <> '' then 
			ll_row = dw_namelist.InsertRow(0)
			il_guests_in_room = 2
			IF ll_row > 0 then 
				dw_namelist.SetItem( ll_row, 'guest_number', 2 )
				dw_namelist.SetItem( ll_row, 'guest_name', trim(f_nvl(share1_lname,'')) +', '+trim(f_nvl(share1_fname,''))   )
				dw_namelist.SetItem( ll_row, 'guest_last_name', trim(f_nvl(share1_lname,'')) )
				dw_namelist.SetItem( ll_row, 'guest_first_name', trim(f_nvl(share1_fname,'')) )
			END IF
		END IF
		If TRIM(f_nvl(share2_lname,'')) <> '' then 
			il_guests_in_room = 3
			ll_row = dw_namelist.InsertRow(0)
			IF ll_row > 0 then 
				dw_namelist.SetItem( ll_row, 'guest_number', 3 )
				dw_namelist.SetItem( ll_row, 'guest_name', trim(f_nvl(share2_lname,'')) +', '+trim(f_nvl(share2_fname,''))   )
				dw_namelist.SetItem( ll_row, 'guest_last_name', trim(f_nvl(share2_lname,'')) )
				dw_namelist.SetItem( ll_row, 'guest_first_name', trim(f_nvl(share2_fname,'')) )
			END IF
		END IF
		If TRIM(f_nvl(share3_lname,'')) <> '' then 
			il_guests_in_room = 4
			ll_row = dw_namelist.InsertRow(0)
			IF ll_row > 0 then 
				dw_namelist.SetItem( ll_row, 'guest_number', 4 )
				dw_namelist.SetItem( ll_row, 'guest_name', trim(share3_lname) +', '+trim(share3_fname)   )
				dw_namelist.SetItem( ll_row, 'guest_last_name', trim(f_nvl(share3_lname,'')) )
				dw_namelist.SetItem( ll_row, 'guest_first_name', trim(f_nvl(share3_fname,'')) )
			END IF
		END IF
	ELSE
		// ONQ, OPERA etc.... Process shares the NEW WAY (if any) 
	END IF // FILE vs ONQ etc
	//=============================================================
	dw_guest_info.SetItem( 1, 'guest_no_adult', 	il_guests_in_room ) 			// No of Adults 
	
 END IF // FIDELIO SERVER interface type check
	
	If il_guests_in_room > 1 then 
		this.event ue_file_getname()
	ELSE
		dw_guest_info.SetItem( 1, 'guest_last_name', 	trim(f_nvl(guest_lname,''))) 
		dw_guest_info.SetItem( 1, 'guest_first_name', 	trim(f_nvl(guest_fname,''))) 
	END IF
	
	dw_guest_info.SetItem( 1, 'guest_sr_code_1', '')		 				// spec code
	dw_guest_info.SetItem( 1, 'guest_block_code','') 						// block code
	dw_guest_info.SetItem( 1, 'guest_grp_mstr_name', '') 					// group name
	this.event ue_fill_guest_name() 
	
END IF // room status Occupied check



this.event ue_end_tran() 
this.event ue_disconnect() 
END CHOOSE

end event

event ue_fidelio_le();string s, s1, s2, s3, s4 ,s5
s = CHAR(3)+CHAR(2) 
s1 = 'LE|'+of_get_ts_fid()+'|' + ETX 
s1 = STX + s1 
	
if is_last_error = '' then this.event ue_send (s1) //link end



end event

event ue_file_getname();long ll_counter, ll_row, ll_offset
string ls_temp
str_response	lstr_response

//display response window 
istr_response.dw1 = dw_namelist
OpenWithParm ( w_foi_guest_selection, istr_response) 
lstr_response = Message.PowerObjectParm
If Not IsValid( lstr_response ) then 
	of_MessageBox('Interface Error', 'Invalid structure returned from guest selection!')
	return 
END IF 
If lstr_response.rc < 0 or Not IsNumber(lstr_response.string1) then 
	ll_row = 1 
ELSE
	ll_row = lstr_response.num1
END IF
if ll_row > 0 and ll_row <= dw_namelist.RowCount() then 
	dw_guest_info.SetItem( 1, 'guest_last_name', 	trim(f_nvl(dw_namelist.getItemString(ll_row, 'guest_last_name'),''))) 
	dw_guest_info.SetItem( 1, 'guest_first_name', 	trim(f_nvl(dw_namelist.getItemString(ll_row, 'guest_first_name'),''))) 
END IF




end event

event ue_update_room(long ll_row);		//=================================================================
		// update room registry 
		//=================================================================
		if ll_row <= 0 then return 
		
		uo_rr.event dynamic ue_reset_vars()
		
		uo_rr.guest_lname		= string(dw_guest_info.object.guest_last_name [ll_row] )
		uo_rr.guest_fname		= string(dw_guest_info.object.guest_first_name [ll_row] 	)
		uo_rr.addr1				= string(dw_guest_info.object.guest_addr1 [ll_row] )
		uo_rr.addr2				= string(dw_guest_info.object.guest_addr2 [ll_row] )
		uo_rr.city				= string(dw_guest_info.object.guest_city [ll_row] 	)
		uo_rr.state				= string(dw_guest_info.object.guest_state [ll_row] )
		uo_rr.zip				= string(dw_guest_info.object.guest_zip [ll_row] 	)
		uo_rr.country			= ''
		uo_rr.company_name	= string(dw_guest_info.object.guest_comp_name [ll_row] )	
		uo_rr.email				= string(dw_guest_info.object.guest_email [ll_row] 	)
		uo_rr.freq_guest_num	= ''

		uo_rr.adults_num		= ''

		uo_rr.phone				= string(dw_guest_info.object.guest_phone [ll_row] 	)	
		
		uo_rr.arr_date  		= string(dw_guest_info.getitemdatetime(ll_row, "guest_last_checkin_dt"), gnv_appman.is_datemask)
		uo_rr.dep_date  		= string(dw_guest_info.getitemdatetime(ll_row, "guest_last_depart_dt" ), gnv_appman.is_datemask )
		
		uo_rr.reg_code			= ''
		uo_rr.share1_lname	= ''
		uo_rr.share1_fname	= ''
		uo_rr.share2_lname	= ''
		uo_rr.share2_fname 	= is_guest_share 
		uo_rr.share3_lname	= is_vip 
		uo_rr.share3_fname  	= is_pms_guest_no 

		uo_rr.room_code = dw_guest_info.object.guest_room_last_checkin [ll_row] 
		string ls_ret 
		ls_ret = uo_rr.event ue_update_room()
		uo_trace.event ue_trace('ue_update_room: ' + string(datetime(today(),now())), ls_ret)

		//=================================================================

end event

event ue_get_message();//put code in parent object to get the last message
end event

event ue_parent_save();//ut code in anc window
end event

event ue_closequery();//if Isvalid (ids_guest_info) then DESTROY ids_guest_info 
If is_interface = 'FIDELIO'or is_interface = 'FIDELIO_SERVER' then 
	If is_state <> '' and  is_state <> 'NOT CONNECTED' then 
		// send LE and wait for LE back 
		if is_last_error = '' then this.of_setstate ('FIDELIO_LE_ACK_WAIT') 
		this.event ue_fidelio_le()
		integer ii
		FOR ii = 1 to 10 
			yield ()
			f_wait (1) 
			If is_state = 'NOT CONNECTED' then EXIT 
		NEXT 	
		If ii > 10 then 
			MessageBox('Fidelio LINK END Error','Timeout waiting for LE from Fidelio')
		END IF	
	END IF
END IF

this.event ue_disconnect()
this.event ue_free_lock ()
this.event ue_end_tran()


end event

event ue_fidelio_restart();// parent.event ue_tran( 'SERVERDISC', '' ,'','','') //  
if is_state = 'RESTART' or is_state = 'NOT CONNECTED' or ib_restart then
	of_setstate('NOT CONNECTED')
	this.event ue_tran( 'SERVERINIT', '' ,'','','')  
	ib_restart = false
ELSE
	// timer event process 
	this.event ue_pms_queue_out()
end if

end event

event ue_get_room_reg_info(string as_room);  SELECT "guest_lname", "guest_fname",   
         "date_from",  "date_to",   
         "addr1",   "addr2",   
         "city",   "state",  "zip",   
         "country", "phone",   
         "guest_account"
	 INTO :is_rr_guest_lname, :is_rr_guest_fname, 
	 		:is_rr_date_from, :is_rr_date_to, 
			:is_rr_addr1, :is_rr_addr2, 
			:is_rr_city , :is_rr_state, :is_rr_zip, 
			:is_rr_country, :is_rr_phone, 
			:il_rr_guest_account 
		
    FROM "room_registry"  WHERE room_code = :as_room ;

end event

event ue_fidelio_roominfo();// fidelio V2 room info

// table vars 
string	room_code,   guest_lname,   guest_fname
string	addr1, addr2, city, state,  zip,  country, company_name
string	email, freq_guest_num,  phone
string 	aduts_num	
date		  dt_f, dt_t
datetime   arr_date  , dep_date
string	reg_code,  share1_lname,   share1_fname
string	share2_lname, share2_fname
string	share3_lname, share3_fname  , date_from, date_to

// 
SELECT 	room_code, guest_lname,  guest_fname,   
         addr1, addr2, city, state, zip, country,   
         company_name, 
         email,   
         freq_guest_num,   
         aduts_num,   
         phone,   
         date_from,   date_to,
         reg_code,   
         share1_lname, share1_fname,   
         share2_lname, share2_fname,   
         share3_lname, share3_fname  
	INTO 
		:room_code, :guest_lname, :guest_fname,
		:addr1, :addr2, :city, :state,  :zip,  :country, :company_name,
		:email, :freq_guest_num,  :aduts_num,  :phone,
		:date_from, :date_to,
		:reg_code,  
		:share1_lname, :share1_fname,
		:share2_lname, :share2_fname,
		:share3_lname, :share3_fname 

    FROM room_registry WHERE room_code = :is_roomnumber ;
	 
If SQLCA.sqlcode < 0 then 
	of_MessageBox('FOI File SQL Error', 'code='+string(SQLCA.sqlcode )+', errmsg='+ SQLCA.sqlerrtext ) 
END IF

is_roomstatus = 'O' // preset occupied
IF IsNull( room_code) or trim(room_code)='' then is_roomstatus = 'I'
//IF IsNull( share1_lname) or trim(share1_lname)='VACANT' then is_roomstatus = 'V'
IF IsNull( guest_lname) or trim(guest_lname)='' then is_roomstatus = 'V'
//or UPPER(trim(guest_lname))='VACANT'  
If is_roomstatus = 'O' then
	//-----------
	If dw_guest_info.RowCount() = 0 then dw_guest_info.InsertRow(0)

	dw_guest_info.SetItem( 1, 'guest_room_last_checkin', room_code) // room
	//dw_guest_info.SetItem( 1, 'guest_guest_no', long(ls_data)) 

	If IsDate (date_from) then 
		dt_f = date(date_from)
	else // reverse mask if system mask does not match data
		dt_f = date(MID(TRIM(date_from),4,2)+'-'+MID(TRIM(date_from),1,2) +'-20'+MID(TRIM(date_from),7,2))
	end if		
	If IsDate (date_to) then 
		dt_t = date(date_to)
	else // reverse mask if system mask does not match data
		dt_t = date(MID(TRIM(date_to),4,2)+'-'+MID(TRIM(date_to),1,2) +'-20'+MID(TRIM(date_to),7,2))
	end if		
	
	arr_date = datetime( dt_f, time('00:00:00') )
	dep_date = datetime( dt_t, time('00:00:00') )
	
	dw_guest_info.SetItem( 1, 'guest_last_checkin_dt', arr_date)		// arrival date
	dw_guest_info.SetItem( 1, 'guest_last_depart_dt', 	dep_date)		// departure date
	dw_guest_info.SetItem( 1, 'guest_pg_id', 		freq_guest_num ) 				// SPG ID

	// Address 
	dw_guest_info.SetItem( 1, 'guest_addr1', 		addr1 	) 
	dw_guest_info.SetItem( 1, 'guest_addr2', 		addr2 	) 
	dw_guest_info.SetItem( 1, 'guest_city', 		city 		) 
	dw_guest_info.SetItem( 1, 'guest_state', 		state 	) 
	dw_guest_info.SetItem( 1, 'guest_zip', 		zip 		) 
	dw_guest_info.SetItem( 1, 'guest_country', 	country 	) 

	dw_guest_info.SetItem( 1, 'guest_comp_name', company_name) 			// company name
	dw_guest_info.SetItem( 1, 'guest_phone', 		phone)
	// phone no
	
	//===========================================================================
	// multiple_guests then il_guests_in_room = 1
	//===========================================================================
	il_guests_in_room = dw_shares.Retrieve( room_code)
	dw_namelist.Reset() 
	long ll_row, ll_share_row
	IF il_guests_in_room > 0 then // fill main guest 
		ll_row = dw_namelist.InsertRow(0)
		IF ll_row > 0 then 
			dw_namelist.SetItem( ll_row, 'guest_number', 	trim(f_nvl(share3_fname,'')) )
			dw_namelist.SetItem( ll_row, 'guest_name', 		trim(f_nvl(guest_lname,'')) +', '+trim(f_nvl(guest_fname,''))   )
			dw_namelist.SetItem( ll_row, 'guest_last_name', trim(f_nvl(guest_lname,'')) )
			dw_namelist.SetItem( ll_row, 'guest_first_name',trim(f_nvl(guest_fname,'')) )
		END IF
	END IF
	
	// fill shares  
	FOR ll_share_row = 1 to il_guests_in_room 
		ll_row = dw_namelist.InsertRow(0)
		IF ll_row > 0 then 
			dw_namelist.SetItem( ll_row, 'guest_number', 	dw_shares.GetItemString(ll_share_row, 'share3_fname') )
			dw_namelist.SetItem( ll_row, 'guest_name', 		trim(f_nvl(dw_shares.GetItemString(ll_share_row,'guest_lname'),'')) +', '+trim(f_nvl(dw_shares.GetItemString(ll_share_row,'guest_fname'),''))   )
			dw_namelist.SetItem( ll_row, 'guest_last_name', trim(f_nvl(dw_shares.GetItemString(ll_share_row,'guest_lname'),'')) )
			dw_namelist.SetItem( ll_row, 'guest_first_name',trim(f_nvl(dw_shares.GetItemString(ll_share_row,'guest_fname'),'')) )
		END IF
	NEXT 
		
	//=============================================================
	dw_guest_info.SetItem( 1, 'guest_no_adult', 	il_guests_in_room ) 			// No of Adults 
	If il_guests_in_room > 1 then 
		this.event ue_file_getname()
	ELSE
		dw_guest_info.SetItem( 1, 'guest_last_name', 	trim(f_nvl(guest_lname,''))) 
		dw_guest_info.SetItem( 1, 'guest_first_name', 	trim(f_nvl(guest_fname,''))) 
	END IF
	dw_guest_info.SetItem( 1, 'guest_sr_code_1', '')		 				// spec code
	dw_guest_info.SetItem( 1, 'guest_block_code','') 						// block code
	dw_guest_info.SetItem( 1, 'guest_grp_mstr_name', '') 					// group name
	this.event ue_fill_guest_name() 
END IF

this.event ue_end_tran() 
this.event ue_disconnect() 


end event

event ue_fidelio_queue_in();long ll_q_row, ll_maxrows

ll_maxrows = dw_pms_queue.Retrieve()
ll_q_row		= dw_pms_queue.GETRow()

FOR ll_q_row = 1 to ll_maxrows
	of_setstate('FIDELIO_READY')
	is_input = dw_pms_queue.GetItemString( ll_q_row, 'cmd')
	this.event ue_fidelio_onreceive( is_input)  
	
	this.event ue_update_room_reg () 

NEXT 

//ll_q_row		= dw_pms_queue.GETRow()
//DO WHILE ll_q_row > 0 
//	dw_pms_queue.DeleteRow( ll_q_row)
//	ll_q_row		= dw_pms_queue.GETRow()
//LOOP 
//
//IF dw_pms_queue.UPDATE(true,true) = 1 then 
//	COMMIT;
//ELSE
//	ROLLBACK;
//END IF
//	
end event

event ue_update_room_reg();	IF idw_target.UPDATE(true,true) = 1 then 
		COMMIT;
	ELSE
		ROLLBACK;
	END IF

idw_target.Retrieve()
end event

event ue_pms_queue_out();long 		ll_q_row, ll_maxrows
string 	ls_room, ls_stat, ls_descr
string	ls_posting_code

ll_maxrows 	= dw_pms_queue_out.Retrieve()
ll_q_row		= dw_pms_queue_out.GETRow()

FOR ll_q_row = 1 to ll_maxrows

	ls_room = f_nvl(dw_pms_queue_out.GetItemString( ll_q_row, 'room'),'*HE-TBA*')
	ls_stat = f_nvl(dw_pms_queue_out.GetItemString( ll_q_row, 'post_code'),'')
	ls_descr= f_nvl(dw_pms_queue_out.GetItemString( ll_q_row, 'descr'),'')
	id_posting_amt  = f_nvl(integer(dw_pms_queue_out.GetItemNumber( ll_q_row, 'post_amt')),0)
	//========================================================================
	if id_posting_amt > 0 then 
		ls_posting_code = 'C' 
		//		this.event ue_tran( 'SERVERPOST', ls_room ,ls_descr,'','') 
		If is_state = 'FIDELIO_READY' then 
			//ii_commandwait = 0
			//is_input 		= '' 
			if is_last_error = '' then this.event ue_send (STX+'PS|PT'+ls_posting_code+'|TA'+string(id_posting_amt)+'|RN'+ls_room +'|'+ of_get_ts_fid() +'|CT'+ls_descr+'|'+ ETX)	 // send room clean
			dw_pms_queue_out.SetItem(ll_q_row, 'sent_ind', 'Y')
		END IF
	END IF
	
	If POS(ls_descr, 'CLEAN & VACANT') > 0 then 
		// this.event ue_tran( 'SERVERMAID', ls_room ,ls_stat,'','') 
		// 1 Dirty Vacant, 2 Dirty Occupied, 3 Clean Vacant, 4 clean occupied
	  	// 5 inspected vacant, 6 inspected occupied // in instructions = 1 C/V
	
		If is_state = 'FIDELIO_READY' then 
		 	// ls_stat // '3' usually
			//ii_commandwait = 0
			//is_input 		= '' 
		 	if is_last_error = '' then this.event ue_send (STX+'RE|RN'+ls_room +'|RS'+ls_stat+'|'+ ETX)	 // send room clean no date needed ==>of_get_ts_fid() 
			dw_pms_queue_out.SetItem(ll_q_row, 'sent_ind', 'Y')
		END IF
	END IF
	
	//========================================================================
	IF dw_pms_queue_out.UPDATE(true,true) = 1 then 
		DELETE FROM PMS_QUEUE WHERE SENT_IND = 'Y';
		COMMIT;
	ELSE
		ROLLBACK;
	END IF

NEXT 


end event

public function string of_get_ts_fid ();string ls_time
datetime ldt

ldt = f_sysdate()

ls_time = 'DA'+ MID(string(year(date(ldt)),'0000'),3,2)+string(month(date(ldt)),'00')+ string(day(date((ldt))),'00')
ls_time = ls_time + '|TI' + string(hour(time(ldt)),'00') + string(minute(time(ldt)),'00') +string(second(time(ldt)),'00') 

return ls_time
end function

public subroutine of_set_terminal_id (string as_parm1);is_terminal_id = LEFT( TRIM( f_nvl(as_parm1,'')) + FILL(' ',9), 9)
end subroutine

public function datawindow of_getinfo ();return dw_guest_info
end function

public subroutine of_init (ref window aw_parent, ref datawindow adw_target, ref commandbutton abtn_button, integer ai_space);idw_target 	= adw_target 
iw_parent	= aw_parent
// position button 
If isValid( abtn_button ) then 
	this.y 				= abtn_button.y - 10
	cb_getinfo.x 		= abtn_button.x + abtn_button.width + ai_space 
	cb_getinfo.y 		= 7 
	cb_getinfo.height	= abtn_button.height	
	dw_guest_info.y	= cb_getinfo.height	+ 20 
END IF
end subroutine

public function datetime of_get_fidelio_date (string as_date);string 	ls_year , ls_century, ls_date, ls_mm, ls_dd, ls_ddlim
datetime ldt_temp

ls_ddlim = '-'

as_date = f_nvl(as_date, '')
as_date = trim(as_date) 

ls_year 	= MID(as_date, 1, 2) 
ls_mm		= MID(as_date, 3, 2)
ls_dd		= MID(as_date, 5, 2)
ls_century = '20' 
if ls_year > '60' then ls_century = '19' 

If f_vzt_year_first() then 
	// YYYY-MM-DD
	ls_date = ls_century + ls_year + ls_ddlim + ls_mm + ls_ddlim + ls_dd 
ELSE
	// MM-DD-YYYY 
	ls_date = ls_mm + ls_ddlim + ls_dd + ls_ddlim + ls_century + ls_year 
END IF
	
ldt_temp =  datetime(date(ls_date), time('00:00:00')) 
If year(date(ldt_temp)) = 1900 then // did not work 
	If f_vzt_year_first() then 
		// YYYY-DD-MM
		ls_date = ls_century + ls_year + ls_ddlim + ls_dd + ls_ddlim + ls_mm 
	ELSE
		// DD-MM-YYYY 
		ls_date = ls_dd + ls_ddlim + ls_mm + ls_ddlim + ls_century + ls_year 
	END IF
	ldt_temp =  datetime(date(ls_date), time('00:00:00'))
END IF

return ldt_temp 
end function

public function integer of_messagebox (string as_title, string as_msg);is_result_title 	= as_title
is_result_msg		= as_msg

if ib_server then
	st_msg.visible = true 
	st_msg.text = as_title + ' ' + as_msg
	uo_trace.event ue_trace(string(datetime(today(),now())) + ' '+ as_title , as_msg)
	this.post event ue_get_message()
else
	MessageBox(as_title, as_msg, Stopsign!)
end if
return 1
end function

on uo_vzt_tcp_metro.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.sle_room=create sle_room
this.dw_namelist=create dw_namelist
this.cb_3=create cb_3
this.cb_getinfo=create cb_getinfo
this.p_wait=create p_wait
this.st_waiting=create st_waiting
this.dw_dupcheck=create dw_dupcheck
this.cb_4=create cb_4
this.cb_fid_getnametest=create cb_fid_getnametest
this.uo_trace=create uo_trace
this.uo_rr=create uo_rr
this.st_msg=create st_msg
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.dw_guest_info=create dw_guest_info
this.st_1=create st_1
this.sle_amt=create sle_amt
this.st_2=create st_2
this.st_3=create st_3
this.sle_stat=create sle_stat
this.cb_11=create cb_11
this.dw_shares=create dw_shares
this.dw_fid=create dw_fid
this.cb_reset=create cb_reset
this.dw_pms_queue=create dw_pms_queue
this.cb_12=create cb_12
this.cb_13=create cb_13
this.dw_pms_queue_out=create dw_pms_queue_out
this.cb_14=create cb_14
this.cb_15=create cb_15
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.sle_room
this.Control[iCurrent+3]=this.dw_namelist
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_getinfo
this.Control[iCurrent+6]=this.p_wait
this.Control[iCurrent+7]=this.st_waiting
this.Control[iCurrent+8]=this.dw_dupcheck
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_fid_getnametest
this.Control[iCurrent+11]=this.uo_trace
this.Control[iCurrent+12]=this.uo_rr
this.Control[iCurrent+13]=this.st_msg
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.cb_6
this.Control[iCurrent+16]=this.cb_7
this.Control[iCurrent+17]=this.cb_8
this.Control[iCurrent+18]=this.cb_9
this.Control[iCurrent+19]=this.cb_10
this.Control[iCurrent+20]=this.dw_guest_info
this.Control[iCurrent+21]=this.st_1
this.Control[iCurrent+22]=this.sle_amt
this.Control[iCurrent+23]=this.st_2
this.Control[iCurrent+24]=this.st_3
this.Control[iCurrent+25]=this.sle_stat
this.Control[iCurrent+26]=this.cb_11
this.Control[iCurrent+27]=this.dw_shares
this.Control[iCurrent+28]=this.dw_fid
this.Control[iCurrent+29]=this.cb_reset
this.Control[iCurrent+30]=this.dw_pms_queue
this.Control[iCurrent+31]=this.cb_12
this.Control[iCurrent+32]=this.cb_13
this.Control[iCurrent+33]=this.dw_pms_queue_out
this.Control[iCurrent+34]=this.cb_14
this.Control[iCurrent+35]=this.cb_15
this.Control[iCurrent+36]=this.gb_1
end on

on uo_vzt_tcp_metro.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.sle_room)
destroy(this.dw_namelist)
destroy(this.cb_3)
destroy(this.cb_getinfo)
destroy(this.p_wait)
destroy(this.st_waiting)
destroy(this.dw_dupcheck)
destroy(this.cb_4)
destroy(this.cb_fid_getnametest)
destroy(this.uo_trace)
destroy(this.uo_rr)
destroy(this.st_msg)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.dw_guest_info)
destroy(this.st_1)
destroy(this.sle_amt)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_stat)
destroy(this.cb_11)
destroy(this.dw_shares)
destroy(this.dw_fid)
destroy(this.cb_reset)
destroy(this.dw_pms_queue)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.dw_pms_queue_out)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.gb_1)
end on

event constructor;call super::constructor;//---------------------------------------------------------------	
//-editchanged event in the caller:-------------------------------
//	uo_1.post event ue_getroomauto() // FOI Interface request 
//---------------------------------------------------------------	
// constructor in the caller:-------------------------------
//window lw_window
//lw_window	= parent
//this.of_init( lw_window	, dw_1, cb_close, 60 )  		
//---------------------------------------------------------------	
// in openlog1
//gnv_appman.event ue_getsysoptions() // 
if not ib_server then 
	st_message.visible 	= false
	st_state.visible 		= false
end if
p_wait.visible 		= false
st_waiting.visible 	= false

ib_add_lrc = FALSE

If upper( gnv_appman.is_debugmode)  = 'N' then 
	this.height = 360 
	uo_trace.visible = false
ELSE
	this.height = 1620 // 900
END IF 

STX = CHAR(2)
ETX = CHAR(3)

string 	ls_ip
int		ls_port 
// Get Front Office options 

 SELECT 	"foioptions"."foisystem",   
         "foioptions"."singlethread",   
         "foioptions"."host_ip",   
         "foioptions"."host_port",   
         "foioptions"."initwait",   
         "foioptions"."nak_max",   
         "foioptions"."out_nak_max",   
         "foioptions"."nak_wait",   
         "foioptions"."out_nak_wait"  ,
			"foioptions"."autorequest"  ,
			"foioptions"."uselrc"  ,
			"foioptions"."hide_detail"

INTO 		:is_interface, :is_singlethread,	:ls_ip,	:ls_port, 
			:ii_commandwait, :ii_nak_max, :ii_out_nak_max, :ii_NAK_wait, :ii_out_NAK_wait ,
			:is_autorequest , :is_uselrc, :is_hide_detail
    FROM "foioptions"  WHERE id = 1;

is_interface	 = UPPER( is_interface	)
is_singlethread = UPPER( is_singlethread )

If is_autorequest = 'Y' or f_nvl(is_autorequest ,'')='' then cb_getinfo.visible = false 

sle_wait.text = string(ii_commandwait )

ib_ole_used = false
// '127.0.0.1', 5010)
//if ib_server then 
 If is_interface = 'FIDELIO' or is_interface = 'FIDELIO_SERVER' or is_interface = 'GEAC' then 
	this.of_sethost ( ls_ip, ls_port) 
	ib_ole_used = true 
 END IF
//end if

ii_NAK_max = 2

//ids_guest_info = CREATE datastore
//ids_guest_info.dataobject = 'd_foi_guest_edit'

long ll_row
If is_hide_detail = 'Y' or f_nvl(is_hide_detail ,'')='' then 
	dw_guest_info.visible = false
	uo_trace.visible = false
end if


ll_row = dw_guest_info.InsertRow(0)

If ll_row > 0 then 
	dw_guest_info.SetItem(1, 'foisystem', this.is_Interface) 
END IF

end event

event ue_onreceive;call super::ue_onreceive;if this.is_state = 'CONNECTED' or this.is_state = 'NOT CONNECTED' then 
	is_input = '' // ignore stuff sent without our request.
	mle_in.text = ''
	return 
END IF

CHOOSE CASE is_interface 
	CASE 'FIDELIO', 'FIDELIO_SERVER' 
		this.event ue_fidelio_onreceive( as_incoming)
	CASE 'GEAC'
		this.event ue_geac_onreceive( as_incoming)
END CHOOSE



end event

event ue_connected;if is_last_error = '' then this.of_setstate	 ('CONNECTED')

if is_interface = 'FIDELIO' or is_interface = 'FIDELIO_SERVER' then 
	this.event ue_fidelio_tran('','','','','') 
elseif is_interface = 'GEAC'  then 
	this.event ue_geac_tran('','','','','') 
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

event ue_send_pre;//overr
IF ib_add_lrc then as_string = as_string + of_calc_lrc( as_string ) // add check sum char
return as_string 
end event

event destructor;call super::destructor;//if Isvalid (ids_guest_info) then DESTROY ids_guest_info 
If is_interface = 'FIDELIO' or is_interface = 'FIDELIO_SERVER' then 
	If is_state <> '' and  is_state <> 'NOT CONNECTED' then 
		this.event ue_fidelio_le()
	END IF
END IF

this.event ue_disconnect()
this.event ue_free_lock ()
this.event ue_end_tran()


end event

event ue_disconnect;call super::ue_disconnect;if not ib_server then
	st_message.visible 	= false
	st_state.visible 		= false
end if
p_wait.visible 		= false
st_waiting.visible 	= false

If is_hide_detail = 'Y' then 
	dw_guest_info.visible = false
ELSE
	dw_guest_info.visible 	= true
END IF	
if dw_guest_info.rowcount() = 0 then dw_guest_info.insertrow(0)

end event

event ue_constructor;call super::ue_constructor;If is_interface = 'FILE' or is_interface = 'ONQ' or is_interface = 'OPERA' or & 
	(not ib_server and is_interface = 'FIDELIO_SERVER') then 
	ib_ole_used = false 
END IF

if ib_server then
	st_message.visible 	= true
	st_state.visible 		= true
end if

end event

type cbx_keep from uo_vzt_tcp_base`cbx_keep within uo_vzt_tcp_metro
integer x = 2839
integer y = 384
boolean checked = false
end type

type ole_tcp1 from uo_vzt_tcp_base`ole_tcp1 within uo_vzt_tcp_metro
integer x = 3314
integer y = 548
integer taborder = 110
end type

type uo_trace1 from uo_vzt_tcp_base`uo_trace1 within uo_vzt_tcp_metro
integer x = 46
integer y = 804
end type

type cbx_crlf from uo_vzt_tcp_base`cbx_crlf within uo_vzt_tcp_metro
integer x = 2432
integer y = 380
integer width = 183
end type

type cbx_wrap from uo_vzt_tcp_base`cbx_wrap within uo_vzt_tcp_metro
integer x = 2203
integer y = 384
end type

type cb_info from uo_vzt_tcp_base`cb_info within uo_vzt_tcp_metro
integer x = 2053
integer y = 384
integer width = 142
integer height = 60
integer taborder = 90
end type

type st_wait from uo_vzt_tcp_base`st_wait within uo_vzt_tcp_metro
integer x = 704
integer y = 448
end type

type sle_wait from uo_vzt_tcp_base`sle_wait within uo_vzt_tcp_metro
integer x = 704
integer y = 500
integer height = 68
integer taborder = 130
end type

type st_state from uo_vzt_tcp_base`st_state within uo_vzt_tcp_metro
integer x = 1682
integer y = 176
integer width = 1129
integer height = 92
integer weight = 400
string facename = "Arial Narrow"
end type

type cb_1 from uo_vzt_tcp_base`cb_1 within uo_vzt_tcp_metro
integer x = 1335
integer y = 384
integer width = 155
integer height = 60
integer taborder = 100
end type

type st_message from uo_vzt_tcp_base`st_message within uo_vzt_tcp_metro
integer x = 18
integer y = 128
integer width = 1056
integer height = 204
integer weight = 400
string facename = "Arial Narrow"
end type

type cb_disconnect from uo_vzt_tcp_base`cb_disconnect within uo_vzt_tcp_metro
integer x = 1751
integer y = 384
integer height = 60
integer taborder = 150
end type

type cb_connect from uo_vzt_tcp_base`cb_connect within uo_vzt_tcp_metro
integer x = 1495
integer y = 384
integer height = 60
integer taborder = 180
end type

type st_port from uo_vzt_tcp_base`st_port within uo_vzt_tcp_metro
integer x = 521
integer y = 448
end type

type st_host from uo_vzt_tcp_base`st_host within uo_vzt_tcp_metro
integer x = 55
integer y = 448
integer width = 219
end type

type sle_port from uo_vzt_tcp_base`sle_port within uo_vzt_tcp_metro
integer x = 521
integer y = 500
integer height = 68
integer taborder = 120
string text = "444"
end type

type sle_host from uo_vzt_tcp_base`sle_host within uo_vzt_tcp_metro
integer x = 55
integer y = 500
integer width = 466
integer height = 68
integer taborder = 190
string text = "snpp.nextel.com"
end type

type st_out from uo_vzt_tcp_base`st_out within uo_vzt_tcp_metro
integer x = 23
integer y = 388
integer width = 229
string text = "Out Text:"
end type

type sle_out from uo_vzt_tcp_base`sle_out within uo_vzt_tcp_metro
integer x = 251
integer y = 380
integer width = 1074
integer height = 68
integer taborder = 50
end type

type mle_in from uo_vzt_tcp_base`mle_in within uo_vzt_tcp_metro
integer x = 919
integer y = 460
integer width = 1938
integer height = 308
long textcolor = 0
long backcolor = 16777215
boolean displayonly = false
end type

type st_in from uo_vzt_tcp_base`st_in within uo_vzt_tcp_metro
integer x = 2610
integer y = 384
integer width = 247
integer height = 72
string text = "In Text:"
end type

type cb_2 from commandbutton within uo_vzt_tcp_metro
integer x = 1696
integer y = 1436
integer width = 663
integer height = 60
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SAMPLE CALL: get room info"
end type

event clicked;string ls_room
ls_room = sle_room.text
parent.event ue_tran( 'ROOMINFO', ls_room ,'','','') // '205'

end event

type sle_room from singlelineedit within uo_vzt_tcp_metro
integer x = 2546
integer y = 1044
integer width = 215
integer height = 68
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1023"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_namelist from datawindow within uo_vzt_tcp_metro
integer x = 59
integer y = 580
integer width = 846
integer height = 228
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_foi_namelist"
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_3 from commandbutton within uo_vzt_tcp_metro
integer x = 1696
integer y = 1500
integer width = 663
integer height = 60
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SAMPLE CALL: return code"
end type

event clicked;string ls_room
ls_room = sle_room.text
parent.event ue_tran( 'RETURN', ls_room ,'692226','123456','Slow Check-In') // '205'

end event

type cb_getinfo from commandbutton within uo_vzt_tcp_metro
integer x = 2555
integer width = 256
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get Info"
end type

event clicked;parent.event ue_getroominfo('')
end event

type p_wait from picture within uo_vzt_tcp_metro
integer x = 1074
integer y = 100
integer width = 608
integer height = 244
boolean bringtotop = true
string picturename = "c:\data\vztech\metromedia\stpwtch2a.bmp"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;parent.event ue_disconnect ()
end event

type st_waiting from statictext within uo_vzt_tcp_metro
integer x = 1403
integer y = 124
integer width = 265
integer height = 208
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
boolean enabled = false
string text = "Waiting for guest info"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_dupcheck from uo_gcc_dupcheck within uo_vzt_tcp_metro
integer x = 9
integer y = 1436
integer width = 1650
integer height = 104
integer taborder = 30
boolean bringtotop = true
end type

type cb_4 from commandbutton within uo_vzt_tcp_metro
boolean visible = false
integer x = 3049
integer y = 736
integer width = 297
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dup search"
end type

event clicked;long ll_ret
ll_ret = dw_dupcheck.event ue_askuser() 
ll_ret = ll_ret
end event

type cb_fid_getnametest from commandbutton within uo_vzt_tcp_metro
integer x = 1696
integer y = 1376
integer width = 663
integer height = 60
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "TEST CALL Fidelio getname"
end type

event clicked;string as_input
as_input  = "PL|RN205|G#5|GNGuest5|GA980317|GD980322|A055555550 - Guest5|"
as_input +=	"A155555550|A2%.2s%s%c|A3%.2s%s%c|A4%.2s%s%c|"
as_input +=	"A5%.2s%s%c|A6%.2s%s%c|A7%.2s%s%c|A8%.2s%s%c"
as_input +=	"|RN205|G#6|GNGuest5|GA980317|GD980322|A055555551 - Guest5|"
as_input +=	"A155555551|A2%.2s%s%c|A3%.2s%s%c|A4%.2s%s%c|"
as_input +=	"A5%.2s%s%c|A6%.2s%s%c|A7%.2s%s%c|A8%.2s%s%c|"

parent.event ue_fidelio_getname( as_input, '|')

end event

type uo_trace from nvo_trace within uo_vzt_tcp_metro
integer x = 2834
integer taborder = 170
boolean bringtotop = true
boolean border = false
long backcolor = 80269524
end type

on uo_trace.destroy
call nvo_trace::destroy
end on

type uo_rr from uo_room_registry within uo_vzt_tcp_metro
boolean visible = false
integer x = 3072
integer y = 536
integer width = 183
integer height = 136
integer taborder = 180
boolean bringtotop = true
boolean border = true
end type

on uo_rr.destroy
call uo_room_registry::destroy
end on

type st_msg from statictext within uo_vzt_tcp_metro
boolean visible = false
integer x = 18
integer y = 16
integer width = 2414
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_5 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 836
integer width = 631
integer height = 60
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Server Connect"
end type

event clicked;// parent.event ue_tran( 'SERVERDISC', '' ,'','','') //  
parent.event ue_tran( 'SERVERINIT', '' ,'','','')  

end event

type cb_6 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 1056
integer width = 631
integer height = 60
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "TEST CALL: Room Info"
end type

event clicked;string ls_room
ls_room = sle_room.text
parent.event ue_tran( 'SERVERROOM', ls_room ,'','','') // '205'

end event

type cb_7 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 900
integer width = 626
integer height = 60
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Server Disconnect"
end type

event clicked;parent.event ue_tran( 'SERVERDISC', '' ,'','','') //  
end event

type cb_8 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 964
integer width = 626
integer height = 60
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Server LE (Link End)"
end type

event clicked;parent.event ue_fidelio_le()
end event

type cb_9 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 1120
integer width = 631
integer height = 60
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "TEST CALL: Maid Status"
end type

event clicked;string ls_room, ls_stat
ls_room = sle_room.text
ls_stat = sle_stat.text
parent.event ue_tran( 'SERVERMAID', ls_room ,ls_stat,'','') // 

end event

type cb_10 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 1184
integer width = 631
integer height = 60
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "TEST CALL: Post Charge"
end type

event clicked;string ls_room 
ls_room = sle_room.text
is_posting_code = 'C' 
id_posting_amt  = integer(sle_amt.text)
parent.event ue_tran( 'SERVERPOST', ls_room ,'*sample post*','','') 

end event

type dw_guest_info from uo_vzt_dwbase within uo_vzt_tcp_metro
integer x = 5
integer y = 80
integer width = 2848
integer height = 280
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_foi_guest_edit"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type st_1 from statictext within uo_vzt_tcp_metro
integer x = 2382
integer y = 1052
integer width = 155
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30388123
string text = "Room:"
boolean focusrectangle = false
end type

type sle_amt from singlelineedit within uo_vzt_tcp_metro
integer x = 2546
integer y = 1188
integer width = 215
integer height = 68
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "2500"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within uo_vzt_tcp_metro
integer x = 2382
integer y = 1188
integer width = 155
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30388123
string text = "Amt:"
boolean focusrectangle = false
end type

type st_3 from statictext within uo_vzt_tcp_metro
integer x = 2382
integer y = 1120
integer width = 155
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30388123
string text = "Stat:"
boolean focusrectangle = false
end type

type sle_stat from singlelineedit within uo_vzt_tcp_metro
integer x = 2546
integer y = 1116
integer width = 215
integer height = 68
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "3"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_11 from commandbutton within uo_vzt_tcp_metro
integer x = 1714
integer y = 1288
integer width = 626
integer height = 60
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Server DB Refresh"
end type

event clicked;cb_reset.event clicked()

parent.event ue_tran( 'SERVER_DB_RESET', '' ,'','','') //  
end event

type dw_shares from uo_gcc_dupcheck within uo_vzt_tcp_metro
integer x = 2373
integer y = 1376
integer width = 713
integer height = 192
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_room_registry_area_sh"
boolean hsplitscroll = false
end type

type dw_fid from uo_gcc_dupcheck within uo_vzt_tcp_metro
integer x = 9
integer y = 892
integer width = 1655
integer height = 536
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_fid_cmd"
boolean vscrollbar = true
end type

event constructor_settran;call super::constructor_settran;long ll_row

For ll_row = 1 to 99 
 InsertRow(this,0)
NEXT 

ll_row = 0

ll_row++; this.setitem (ll_row, 'cmd', 'GO|RN04|GSN|DA050902|TI142842|')
ll_row++; this.setitem (ll_row, 'cmd', 'GO|RN05|GSN|DA050902|TI142842|')
ll_row++; this.setitem (ll_row, 'cmd', 'GI|RN04|G#22|GSN|SF|GNAvon, Mr. and Mrs.|GFJohn|GTMr. and Mrs.|GA040318|GD040328|GLEA|GV1|DA050902|TI142749|A0D21345|A14567 Nowhere Drive, ,Richmond, VA, 24036, US|A2|A3703-111-2145|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd', 'GI|RN04|G#47|GSY|SF|GNJohnson, Mr.|GFJay|GTMr.|GA040318|GD040328|GLEA|GV0|DA050902|TI142749|A0|A19213 Baker road, ,columbus, OH, 45874, US|A2|A3654-874-9874|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd', 'GC|RN05|GSY|G#47|DA050902|TI145552|RO04|GSN| = share move=') // share move
ll_row++; this.setitem (ll_row, 'cmd', '=name chg= GC|RN04|G#22|GSY|GNAvons, Mr. and Mrs.|GFJohn|GTMr. and Mrs.|GA040318|GD040328|GLEA|GV5|DA050902|TI145214|A0D21345|A167 Anywhere street, ,Richmond, VA, 24036, US|A2|A3703-111-2145|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd', 'GC|RN05|GSN|G#22|DA050902|TI145549|RO04|GSY| =main move=')
ll_row++; this.setitem (ll_row, 'cmd', 'GI|RN2019|G#94|GSN|GNLastest, Mr.|GFNow|GTMr.|GA040318|GD040319|GLEA|GV0|DA050902|TI143742|A0|A1, ,, , ,|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')

//name change 
ll_row++; this.setitem (ll_row, 'cmd', '=name chg shr= GC|RN05|G#47|GSN|GNJohnson, Mr.  Jay|GFJay|GTMr.  Jay|GA040318|GD040328|GLEA|GV0|DA050902|TI145550|A0|A19213 Baker road, ,columbus, OH, 45874, US|A2|A3654-874-9874|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd', 'GO|RN01|GSN|DA050902|TI142842|')

ll_row++; this.setitem (ll_row, 'cmd', 'GI|RN2000|G#58|GSN|SF|GNAnderson, LaJuana|GFLaJuana|GTLaJuana|GA040318|GD040321|GLFR|GV0|DA050902|TI142750|A0R2345|A112 PMS road, ,Baltimore, MD, 21218, US|A2|A3410-1234465|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd', 'GC|RN2000|G#58|GSN|GNAnderson, LaJuana|GFLaJuana|GTLaJuana|GA040318|GD040326|GLFR|GV0|DA050902|TI144447|A0R2345|A112 PMS road, ,Baltimore, MD, 21218, US|A2|A3410-1234465|A41, 0|A5|A6|A7ROH|A8|A9|')

//
//ll_row++; this.setitem (ll_row, 'cmd','GO|RN04|GSN|DA051005|TI114527| ==new share move= ')
//ll_row++; this.setitem (ll_row, 'cmd','GO|RN05|GSN|DA051005|TI114527|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#108|GSN|SF|GNMouse|GFMighty|GTMr. and Mrs.|GA040318|GD040402|GLEA|GV1|DA051005|TI114545|A0|A1235 Catty St, Apt 1,Baltimore, MD, 21234, US|A2|A34103238756|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#109|GSY|SF|GNBunny|GFBabs|GTMs.|GA040318|GD040402|GLEA|GV4|DA051005|TI114545|A0|A165 Karrot Rd, ,Baltimore, MD, 21258, US|A2|A34109867645|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSN|G#109|DA051005|TI115715|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#108|GSN|GNMouse|GFMighty|GTMr. and Mrs.  Mighty|GA040318|GD040402|GLEA|GV1|DA051005|TI115716|A0|A1235 Catty St, Apt 1,Baltimore, MD, 21234, US|A2|A34103238756|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#108|DA051005|TI115718|RO04|GSN|')

ll_row++; this.setitem (ll_row, 'cmd','==== 4 guests in room ====')

ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#117|GSN|GNOne|GFGary|GTMr.|GA040318|GD040319|GLEA|GV0|DA051013|TI155710|A0|A11 alpha st, ,baltimore, MD, 21238, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#119|GSY|GNThree|GFEZas|GTMr.|GA040318|GD040319|GLEA|GV0|DA051013|TI155713|A0|A13 Charlie St, ,baltimore, MD, 21256, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#118|GSY|GNTwo|GFChris|GTMr.|GA040318|GD040319|GLEA|GV1|DA051013|TI155716|A0|A12 Bravo way, ,Baltimore, MD, 21265, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#120|GSY|GNFour|GFChris|GTMr.|GA040318|GD040319|GLEA|GV1|DA051013|TI155716|A0|A12 Bravo way, ,Baltimore, MD, 21265, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#117|GSY|GNOnze|GFGary|GTMr.|GA040318|GD040319|GLEA|GV0|DA051013|TI160013|A0|A11 alpha st, ,baltimore, MD, 21238, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSN|G#117|DA051013|TI161654|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#119|GSY|GNThree|GFEZas|GTMr.  EZas|GA040318|GD040319|GLEA|GV0|DA051013|TI161655|A0|A13 Charlie St, ,baltimore, MD, 21256, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#119|DA051013|TI161703|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#118|GSN|GNTwo|GFChris|GTMr.  Chris|GA040318|GD040319|GLEA|GV1|DA051013|TI161704|A0|A12 Bravo way, ,Baltimore, MD, 21265, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#118|DA051013|TI161708|RO04|GSN|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#120|DA051013|TI161708|RO04|GSN|')

ll_row++; this.setitem (ll_row, 'cmd','GO|RN05|G#117|GSY|DA051013|TI162739|')
ll_row++; this.setitem (ll_row, 'cmd','GO|RN05|G#118|GSY|DA051013|TI162739|')
ll_row++; this.setitem (ll_row, 'cmd','GO|RN05|G#119|GSY|DA051013|TI162741|')
ll_row++; this.setitem (ll_row, 'cmd','GO|RN05|G#120|GSY|DA051013|TI162741|')

ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|G#119|GSY|GNThree|GFEZas|GTMr.  EZas|GA040318|GD040319|GLEA|GV0|DA051013|TI162739|A0|A13 Charlie St, ,baltimore, MD, 21256, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|G#118|GSN|GNTwo|GFChris|GTMr.  Chris|GA040318|GD040319|GLEA|GV1|DA051013|TI162741|A0|A12 Bravo way, ,Baltimore, MD, 21265, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GO|RN05|G#118|GSN|DA051013|TI162748|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN05|G#117|GSN|GNOnze|GFGary|GTMr.|GA040318|GD040319|GLEA|GV0|DA051013|TI162902|A0|A11 alpha st, ,baltimore, MD, 21238, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN05|G#119|GSY|GNThree|GFEZas|GTMr.|GA040318|GD040319|GLEA|GV0|DA051013|TI162907|A0|A13 Charlie St, ,baltimore, MD, 21256, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN05|G#118|GSY|GNTwo|GFChris|GTMr.|GA040318|GD040319|GLEA|GV1|DA051013|TI162909|A0|A12 Bravo way, ,Baltimore, MD, 21265, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|GSN|G#117|DA051013|TI163130|RO05|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|G#119|GSY|GNThree|GFEZas|GTMr.  EZas|GA040318|GD040319|GLEA|GV0|DA051013|TI163131|A0|A13 Charlie St, ,baltimore, MD, 21256, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|GSY|G#119|DA051013|TI163134|RO05|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|G#118|GSN|GNTwo|GFChris|GTMr.  Chris|GA040318|GD040319|GLEA|GV1|DA051013|TI163135|A0|A12 Bravo way, ,Baltimore, MD, 21265, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|GSY|G#118|DA051013|TI163137|RO05|GSN|')

ll_row++; this.setitem (ll_row, 'cmd','==== 3 guests in room Val ====')

ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#128|GSN|GNBolling|GFChris|GTDr.|GA040318|GD040319|GLEA|GV1|DA051108|TI163725|A0|A12 hipple St, ,baltimore, MD, 21212, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#130|GSY|GNclyde|GFBinnie|GTMs.|GA040318|GD040319|GLEA|GV4|DA051108|TI163729|A0|A1985 E. St, ,Wshington Dc, DC, 2002, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#129|GSY|GNSimple|GFgoodin|GTMr.|GA040318|GD040323|GLEA|GV1|DA051108|TI163733|A0|A1715 Clarke St., ,Columbia, , , US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSN|G#128|DA051108|TI163839|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#129|GSN|GNSimple|GFgoodin|GTMr.  goodin|GA040318|GD040323|GLEA|GV1|DA051108|TI163840|A0|A1715 Clarke St., ,Columbia, , , US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#130|DA051108|TI163842|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#129|GSN|GNSimple|GFgoodin|GTMr.  goodin|GA040318|GD040323|GLEA|GV1|DA051108|TI163843|A0|A1715 Clarke St., ,Columbia, , , US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#129|DA051108|TI163845|RO04|GSN|')

ll_row++; this.setitem (ll_row, 'cmd','==== 2014 = 04 Val ====')

ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#39|GSN|SF|GNRoust|GFJulie|GTMrs.|GA040318|GD040324|GLEA|GV0|DA051129|TI121554|A0|A1, ,, , ,|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#51|GSY|SF|GNLewis|GFRaymond|GTMr. and Mrs.|GA040318|GD040324|GLEA|GV1|DA051129|TI121555|A0|A1, ,, , ,|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#51|GSY|GNLewis|GFRandall|GTMr.|GA040318|GD040324|GLEA|GV2|DA051129|TI122544|A0|A1, ,, , ,|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')

ll_row++; this.setitem (ll_row, 'cmd','==== 12/09 03 ppl, 1 left behind  ====')

ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#133|GSN|GNLo|GFYuare|GTMr. and Mrs.|GA040318|GD040319|GLEA|GV2|DA051206|TI153240|A0|A11Winters Lane, ,Baqltimo, MD, 21245, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#132|GSY|GNHi|GFIam|GTMr.|GA040318|GD040319|GLEA|GV1|DA051206|TI153241|A0|A1123 History rooad, ,Baltimore, MD, 21239, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GI|RN04|G#134|GSY|GNMid|GFWer|GTMr.|GA040318|GD040319|GLEA|GV1|DA051206|TI153358|A0|A1, ,, , , US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#132|GSY|GNHi|GFIam|GTMr.|GA040318|GD040319|GLEA|GV4|DA051206|TI153611|A0|A1321 History rooad, ,Baltimore, MD, 21239, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSN|G#132|DA051206|TI153942|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#133|GSN|GNLo|GFYuare|GTMr. and Mrs.  Yuare|GA040318|GD040319|GLEA|GV2|DA051206|TI153943|A0|A11Winters Lane, ,Baqltimo, MD, 21245, US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#133|DA051206|TI153945|RO04|GSY|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN04|G#134|GSN|GNMid|GFWer|GTMr.  Wer|GA040318|GD040319|GLEA|GV1|DA051206|TI153946|A0|A1, ,, , , US|A2|A3|A41, 0|A5|A6|A7ROH|A8|A9|')
ll_row++; this.setitem (ll_row, 'cmd','GC|RN05|GSY|G#134|DA051206|TI153948|RO04|GSN|')

end event

event doubleclicked;call super::doubleclicked;if row <= 0 then return 

of_setstate('FIDELIO_READY')
is_input = this.GetItemString(row, 'cmd')
parent.event ue_fidelio_onreceive( is_input)  

end event

type cb_reset from commandbutton within uo_vzt_tcp_metro
integer x = 2373
integer y = 1288
integer width = 393
integer height = 68
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset Room Reg"
end type

event clicked;string ls_trig

 SELECT roomreg_trig INTO :ls_trig FROM vzt_sysoptions where id =1;
 UPDATE vzt_sysoptions SET roomreg_trig = 'N';
  
  UPDATE "room_registry"  
     SET "guest_lname" = null,   
         "guest_fname" = null,   
         "date_from" = null,   
         "date_to" = null,   
         "freq_guest_num" = null,   
         "addr1" = null,   
         "addr2" = null,   
         "city" = null,   
         "state" = null,   
         "zip" = null,   
         "country" = null,   
         "company_name" = null,   
         "aduts_num" = null,   
         "phone" = null,   
         "reg_code" = null,   
         "room_type" = null,   
         "share1_lname" = null,   
         "share1_fname" = null,   
         "share2_lname" = null,   
         "share2_fname" = null,   
         "share3_lname" = null,   
         "share3_fname" = null,   
         "email" = null,   
         "msg" = 'VACANT',   
         "rand" = '12121',   
         "guest_account" = 0  ; 

DELETE FROM "room_registry_shares"  ;

UPDATE vzt_sysoptions SET roomreg_trig = :ls_trig;

parent.event ue_parent_save () 

//commit;

end event

type dw_pms_queue from uo_gcc_dupcheck within uo_vzt_tcp_metro
integer x = 9
integer y = 1772
integer width = 3081
integer height = 220
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_pms_queue_list_in"
end type

type cb_12 from commandbutton within uo_vzt_tcp_metro
integer x = 923
integer y = 800
integer width = 439
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Process In Queue"
end type

event clicked;parent.event ue_fidelio_queue_in() 
end event

type cb_13 from commandbutton within uo_vzt_tcp_metro
integer x = 1376
integer y = 800
integer width = 302
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear Queue"
end type

event clicked;delete from pms_queue; 

COMMIT;
end event

type dw_pms_queue_out from uo_gcc_dupcheck within uo_vzt_tcp_metro
integer x = 9
integer y = 1564
integer width = 2871
integer height = 200
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_pms_queue_list"
boolean vscrollbar = true
end type

type cb_14 from commandbutton within uo_vzt_tcp_metro
integer x = 2885
integer y = 1568
integer width = 160
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retr Q"
end type

event clicked;dw_pms_queue_out.Retrieve() 
end event

type cb_15 from commandbutton within uo_vzt_tcp_metro
integer x = 2377
integer y = 836
integer width = 165
integer height = 60
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Q out"
end type

event clicked;parent.event ue_pms_queue_out()

end event

type gb_1 from groupbox within uo_vzt_tcp_metro
integer x = 1673
integer y = 776
integer width = 1125
integer height = 596
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30388123
string text = "FIDELIO V2"
end type

