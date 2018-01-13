$PBExportHeader$w_foi_guest_selection.srw
forward
global type w_foi_guest_selection from w_vzt_base_response
end type
type st_1 from statictext within w_foi_guest_selection
end type
end forward

global type w_foi_guest_selection from w_vzt_base_response
integer width = 1367
integer height = 772
string title = "Guest Selection"
st_1 st_1
end type
global w_foi_guest_selection w_foi_guest_selection

on w_foi_guest_selection.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_foi_guest_selection.destroy
call super::destroy
destroy(this.st_1)
end on

event open;istr_parms = Message.PowerObjectParm
if not IsValid( istr_parms ) then
	POSt CLOSE(this)
	return
END IF

dw_response.dataobject = istr_parms.dw1.dataobject
int li_rc
li_rc = istr_parms.dw1.ShareData( dw_response) 
if dw_response.RowCount() > 0 then 
	dw_response.SelectRow(0, false)
	dw_response.SelectRow(1, true)
END IF
dw_response.post SetFocus()
end event

event close;dw_response.ShareDataOff( ) 
end event

event ue_process_ok;call super::ue_process_ok;long ll_selrow
ll_selrow = dw_response.GetSelectedRow(0) 
If ll_selrow > 0 then
	istr_parms.rc			= 1 
	istr_parms.string1 	= dw_response.GetItemString( ll_selrow, 'guest_number')
	istr_parms.string2 	= dw_response.GetItemString( ll_selrow, 'guest_record')
	istr_parms.num1		= ll_selrow
END IF 	

end event

type dw_response from w_vzt_base_response`dw_response within w_foi_guest_selection
integer x = 32
integer y = 144
integer width = 1289
integer height = 388
string dataobject = "d_foi_namelist"
boolean vscrollbar = true
boolean border = true
boolean hsplitscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_2 from w_vzt_base_response`cb_2 within w_foi_guest_selection
integer x = 791
integer y = 556
integer height = 84
boolean default = false
end type

type cb_1 from w_vzt_base_response`cb_1 within w_foi_guest_selection
integer x = 357
integer y = 556
integer height = 84
boolean default = true
end type

type st_1 from statictext within w_foi_guest_selection
integer x = 32
integer y = 4
integer width = 1280
integer height = 136
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Multiple guests were found in the room. Please select one guest from the list:"
alignment alignment = center!
boolean focusrectangle = false
end type

