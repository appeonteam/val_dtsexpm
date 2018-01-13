$PBExportHeader$uo_gcc_dupcheck.sru
forward
global type uo_gcc_dupcheck from uo_vzt_dwbase
end type
end forward

global type uo_gcc_dupcheck from uo_vzt_dwbase
int Width=1562
int Height=691
string DataObject="d_gcc_guest_edit_dup"
event type integer ue_askuser ( )
end type
global uo_gcc_dupcheck uo_gcc_dupcheck

event ue_askuser;long ll_rc 
this.Search('')
ll_rc = this.RowCOunt() 
if ll_rc > 0 then 
	OpenWithParm( w_gcc_dupguest, this)
	ll_rc = long(Message.Stringparm )
end if

return ll_rc 
end event

event constructor;call super::constructor;is_search_case		= 'N' // default search case (Y sens, N no)
is_auto_like		= 'Y'
is_searchable[] = { & 
'guest_room_last_checkin','guest_guest_id', &
'guest_last_checkin_dt','guest_last_depart_dt','guest_last_name', &
'guest_first_name','guest_addr1', & 
'guest_addr2','guest_phone','guest_city','guest_state','guest_zip', & 
'guest_comp_name','guest_email'}

end event

