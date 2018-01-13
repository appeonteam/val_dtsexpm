$PBExportHeader$w_foi_test.srw
forward
global type w_foi_test from Window
end type
type dw_namelist from datawindow within w_foi_test
end type
end forward

global type w_foi_test from Window
int X=845
int Y=387
int Width=1653
int Height=755
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
dw_namelist dw_namelist
end type
global w_foi_test w_foi_test

type variables
string  is_interface = 'FIDELIO'
boolean	ib_add_lrc = FALSE
long	il_lock_sqlcode
//tran parms
string  	is_trantype, is_parm1, is_parm2, is_parm3
string  	is_result, is_singlethread
datastore	ids_guest_info
string 	is_messagetype
string	is_guestnumber, is_roomnumber
str_response	istr_response
end variables

on w_foi_test.create
this.dw_namelist=create dw_namelist
this.Control[]={this.dw_namelist}
end on

on w_foi_test.destroy
destroy(this.dw_namelist)
end on

event open;is_result = 'b02..3456789..345678027777788888AAAAABBBB,CCCCCDDDDD12341111122222EEEEEBBBB,CCCCCDDDDD1234'

long ll_guests_in_room, ll_counter, ll_row, ll_offset
string ls_temp
str_response	lstr_response

ls_temp = MID (is_result, 21, 2) 
If NOT IsNUmber( ls_temp ) then 
	MessageBox('GEAC Interface Error', 'Number of guests in the room is not numeric!', StopSign!)
	RETURN -1
END IF
ll_guests_in_room = long ( ls_temp )

ll_offset = 23
FOR ll_counter = 1 to ll_guests_in_room
	ll_row = dw_namelist.InsertRow(0)
	IF ll_row <= 0 then EXIT
	ls_temp = MID( is_result, ll_offset , 10)
	dw_namelist.SetItem( ll_row, 'guest_number', ls_temp )
	ls_temp = MID( is_result, ll_offset + 10, 20) 
	dw_namelist.SetItem( ll_row, 'guest_name', ls_temp )
	ll_offset = ll_offset + 34
NEXT 

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
RETURN 1



end event

type dw_namelist from datawindow within w_foi_test
int X=40
int Y=32
int Width=1532
int Height=365
int TabOrder=10
string DataObject="d_foi_namelist"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

