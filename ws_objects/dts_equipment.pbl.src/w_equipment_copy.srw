$PBExportHeader$w_equipment_copy.srw
forward
global type w_equipment_copy from w_vzt_base_response
end type
type cbx_main from checkbox within w_equipment_copy
end type
type cbx_pm from checkbox within w_equipment_copy
end type
type cbx_service from checkbox within w_equipment_copy
end type
end forward

global type w_equipment_copy from w_vzt_base_response
integer width = 4325
integer height = 1872
string title = "Select Equipment to Copy From"
cbx_main cbx_main
cbx_pm cbx_pm
cbx_service cbx_service
end type
global w_equipment_copy w_equipment_copy

on w_equipment_copy.create
int iCurrent
call super::create
this.cbx_main=create cbx_main
this.cbx_pm=create cbx_pm
this.cbx_service=create cbx_service
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_main
this.Control[iCurrent+2]=this.cbx_pm
this.Control[iCurrent+3]=this.cbx_service
end on

on w_equipment_copy.destroy
call super::destroy
destroy(this.cbx_main)
destroy(this.cbx_pm)
destroy(this.cbx_service)
end on

event ue_process_ok;call super::ue_process_ok;long ll_selrow, rc_1, rc_2, rc_3 
string ls_from, ls_to

ll_selrow = dw_response.GetSelectedRow(0) 
If ll_selrow > 0 then
//	istr_parms.num1 	= dw_response.GetItemNumber( ll_selrow, 'colnum')
	istr_parms.string2 = dw_response.GetItemString( ll_selrow, 'area_number') 
	
	ls_from 	= istr_parms.string2 
	ls_to		= istr_parms.string1
	
 	If 	cbx_main.checked 	then   
		select vzt_equipment_dup ( :istr_parms.string2 , :istr_parms.string1 ) INTO :rc_1 from dummy ;
		
	END IF;

	If 	cbx_pm.checked 		then   
		select vzt_equipment_dup_pm ( :istr_parms.string2 , :istr_parms.string1 ) INTO :rc_2 from dummy ; 
	END IF;
	
	If 	cbx_service.checked 	then   
		select vzt_equipment_dup_contracts ( :istr_parms.string2 , :istr_parms.string1 ) INTO :rc_3 from dummy ;
	END IF;

	If (rc_1 = 0 or rc_1 =100 ) and (rc_2 = 0 or rc_2 =100 ) and (rc_3 = 0 or rc_3 =100 ) then 
		commit;
	ELSE
		rollback;
		string ls_error=''
		If rc_1 <> 0 then ls_error = ls_error + '~r~n' + ' Failed to copy main details. '
		If rc_2 <> 0 then ls_error = ls_error + '~r~n' + ' Failed to copy PM information. '
		If rc_3 <> 0 then ls_error = ls_error + '~r~n' + ' Failed to copy Service Contracts information. '
		MessageBox( 'Equipment Copy Error', ls_error) 
	END IF;
		
END IF 	

end event

event open;call super::open;dw_response.Retrieve() 

istr_parms = Message.PowerObjectParm
end event

type dw_response from w_vzt_base_response`dw_response within w_equipment_copy
integer x = 27
integer y = 16
integer width = 4261
integer height = 1388
string dataobject = "d_equipment_by_category"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from w_vzt_base_response`cb_2 within w_equipment_copy
integer x = 2167
integer y = 1648
integer width = 347
integer height = 92
end type

type cb_1 from w_vzt_base_response`cb_1 within w_equipment_copy
integer x = 1733
integer y = 1648
integer width = 347
integer height = 92
integer weight = 700
fontcharset fontcharset = russiancharset!
end type

event cb_1::clicked;//overr
If  dw_response.GetSelectedRow(0) <= 0 then return 

If 	NOT  cbx_main.checked and NOT  cbx_pm.checked and NOT  cbx_service.checked then 
	MessageBox('Equipment Data Copy', 'You must check at least one type of data to be copied') 
	return 
END IF	
parent.event ue_ok()
end event

type cbx_main from checkbox within w_equipment_copy
integer x = 1582
integer y = 1476
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Details"
end type

type cbx_pm from checkbox within w_equipment_copy
integer x = 2011
integer y = 1476
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PM "
end type

type cbx_service from checkbox within w_equipment_copy
integer x = 2295
integer y = 1476
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Service Contracts"
end type

