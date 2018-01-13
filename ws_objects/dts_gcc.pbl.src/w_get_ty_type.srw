$PBExportHeader$w_get_ty_type.srw
forward
global type w_get_ty_type from w_base_response
end type
end forward

global type w_get_ty_type from w_base_response
integer width = 1001
integer height = 908
end type
global w_get_ty_type w_get_ty_type

on w_get_ty_type.create
call super::create
end on

on w_get_ty_type.destroy
call super::destroy
end on

event open;long ll_row

ll_row = dw_response.InsertRow(0)
dw_response.SetItem( ll_row, "qsetid", 1)
dw_response.SetItem( ll_row, "descr", "Standard Thank You Letter")
dw_response.SelectRow(ll_row, true)
dw_response.event ue_rowSelected(ll_row, true)

ll_row = dw_response.InsertRow(0)
dw_response.SetItem( ll_row, "qsetid", 7)
dw_response.SetItem( ll_row, "descr", "Welcome Letter")

ll_row = dw_response.InsertRow(0)
dw_response.SetItem( ll_row, "qsetid", 10)
dw_response.SetItem( ll_row, "descr", "Preferred Guest Letter")

ll_row = dw_response.InsertRow(0)
dw_response.SetItem( ll_row, "qsetid", 9)
dw_response.SetItem( ll_row, "descr", "Feedback Request Letter")

//ll_row = dw_response.InsertRow(0)
//dw_response.SetItem( ll_row, "qsetid", 8)
//dw_response.SetItem( ll_row, "descr", "Internet Survey Request Letter")

dw_response.ResetUpdate()


end event

event ue_process_ok;call super::ue_process_ok;long ll_selrow
ll_selrow = dw_response.GetSelectedRow(0) 
If ll_selrow > 0 then
	istr_parms.num1 = dw_response.GetItemNumber( ll_selrow, 'qsetid')
END IF 	

end event

type dw_response from w_base_response`dw_response within w_get_ty_type
integer x = 14
integer y = 8
integer width = 955
integer height = 656
string dataobject = "d_gcc_ty_letter_type"
boolean vscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from w_base_response`cb_2 within w_get_ty_type
integer x = 603
integer y = 688
integer height = 80
boolean default = false
end type

type cb_1 from w_base_response`cb_1 within w_get_ty_type
integer x = 169
integer y = 688
integer height = 80
boolean default = true
end type

