$PBExportHeader$w_vzt_contact_edit.srw
forward
global type w_vzt_contact_edit from w_vzt_base
end type
type dw_answers from uo_vzt_dwbase within w_vzt_contact_edit
end type
type cb_ins from commandbutton within w_vzt_contact_edit
end type
type cb_del from commandbutton within w_vzt_contact_edit
end type
type r_1 from rectangle within w_vzt_contact_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_contact_edit
end type
end forward

global type w_vzt_contact_edit from w_vzt_base
integer width = 2917
integer height = 1520
string title = "Contact Maintenance"
dw_answers dw_answers
cb_ins cb_ins
cb_del cb_del
r_1 r_1
dw_contact_address dw_contact_address
end type
global w_vzt_contact_edit w_vzt_contact_edit

type variables
long 	il_contactid
end variables

on w_vzt_contact_edit.create
int iCurrent
call super::create
this.dw_answers=create dw_answers
this.cb_ins=create cb_ins
this.cb_del=create cb_del
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_answers
this.Control[iCurrent+2]=this.cb_ins
this.Control[iCurrent+3]=this.cb_del
this.Control[iCurrent+4]=this.r_1
this.Control[iCurrent+5]=this.dw_contact_address
end on

on w_vzt_contact_edit.destroy
call super::destroy
destroy(this.dw_answers)
destroy(this.cb_ins)
destroy(this.cb_del)
destroy(this.r_1)
destroy(this.dw_contact_address)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_newsearch.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()


end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)
end event

event ue_cb_new;call super::ue_cb_new;cb_del.visible	= false
cb_ins.visible = false
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_contact_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_contact_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_contact_edit
integer x = 9
integer width = 2743
integer height = 336
string dataobject = "d_contact_list"
boolean hsplitscroll = false
end type

event dw_mainlist::ue_rowselected;if row > 0 and row <= this.RowCount() AND ab_selected = true then
	il_contactid = f_nvl(dw_data.GetItemNumber(row,'id') , 0)

	cb_new.visible 		= true 

	if il_contactid <= 0 then 
		dw_answers.Reset()
		return 1
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		dw_answers.Retrieve( il_contactid )
		dw_contact_address.Retrieve( il_contactid )
		dw_answers.visible 	= true 	
		cb_ins.visible			= true
		cb_del.visible			= true
	END IF 

	
END IF	

return 1


end event

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'firstname_t', 'firstname A', 'firstname D')
this.inv_field_sort.of_setcolumn( 'lastname_t', 'lastname A, firstname A', 'lastname D, firstname D')
this.inv_field_sort.of_setcolumn( 'contacttype_t', 'contacttype A, lastname A, firstname A', 'contacttype D, firstname A, lastname A')
this.setsort( 'contacttype A, lastname A, firstname A')


end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_contact_edit
integer x = 901
integer y = 1260
integer width = 302
integer taborder = 20
integer textsize = -8
end type

type cb_close from w_vzt_base`cb_close within w_vzt_contact_edit
integer x = 2519
integer y = 1260
integer taborder = 50
integer textsize = -8
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_contact_edit
integer x = 1362
integer y = 1260
integer width = 178
integer taborder = 110
integer textsize = -8
end type

type cb_save from w_vzt_base`cb_save within w_vzt_contact_edit
integer x = 722
integer y = 1260
integer width = 165
integer taborder = 90
integer textsize = -8
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
	dw_answers.event ue_refresh_identity()
	dw_answers.Retrieve( il_contactid)
END IF
end event

type cb_select from w_vzt_base`cb_select within w_vzt_contact_edit
integer x = 562
integer y = 1260
integer width = 151
integer taborder = 80
integer textsize = -8
end type

type cb_new from w_vzt_base`cb_new within w_vzt_contact_edit
integer x = 1211
integer y = 1260
integer width = 137
integer taborder = 100
integer textsize = -8
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_contact_edit
integer x = 41
integer y = 1260
integer width = 306
integer taborder = 70
integer textsize = -8
end type

event cb_newsearch::clicked;call super::clicked;dw_answers.visible 	= false
cb_ins.visible			= false
cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_contact_edit
integer x = 357
integer y = 1260
integer width = 197
integer taborder = 60
integer textsize = -8
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_contact_edit
integer x = 1545
integer y = 1260
integer width = 247
integer textsize = -8
long backcolor = 67108864
end type

type st_stop from w_vzt_base`st_stop within w_vzt_contact_edit
integer x = 1563
integer y = 1260
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_contact_edit
integer x = 9
integer y = 364
integer width = 2743
integer height = 308
integer taborder = 40
string dataobject = "d_contact_edit"
boolean vscrollbar = false
boolean hsplitscroll = false
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'firstname', 'lastname','title', 'dob', 'contacttype', 'contactsubtype'} // 'id',

is_searchable[]	=  is_editable[]


end event

event dw_data::ue_refresh_identity;//long ll_row, ll_id
//ll_row = this.GetRow() 
//if ll_row <= 0 then return  
//
//ll_id = f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0)
//if ll_id = 0 then 
//	SELECT max(questionid) into :id_questionid from qgen_questions ;
//	this.setitem( this.GetRow(), 'questionid', id_questionid)
////	MessageBox('qid',string(id_questionid))
//ELSE
//	id_questionid = ll_id 
//END IF
//
//
end event

event dw_data::ue_update_keys_on_new;If row <= 0 then return 1

long ll_id, ll_row, ll_count
ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)

if ll_id = 0 then 
	SELECT max(id) + 1 into :ll_id from vzt_contact ;
	this.setitem( row, 'id', ll_id )
END IF
return 1
end event

type dw_print from w_vzt_base`dw_print within w_vzt_contact_edit
integer x = 2674
integer y = 1128
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_contact_edit
integer x = 2263
integer y = 292
end type

type dw_answers from uo_vzt_dwbase within w_vzt_contact_edit
boolean visible = false
integer x = 9
integer y = 688
integer width = 2743
integer height = 528
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_address_edit"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;wf_setupdateable( dw_answers, "Addresses", false, false)

end event

event ue_update_keys_on_new;return 1
//If row <= 0 then return 1
////this.SetItem( row, 'id', il_contactid) 
//
//long ll_id, ll_row, ll_count
//
//ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)
//if ll_id = 0 then 
//	SELECT max(id) into :ll_id from vzt_address ;
//	ll_id = f_nvl(ll_id,0) + row 
//	this.setitem( row, 'id', ll_id )
//
//	string ls_expr
//	ls_expr = ' contact_id = ' + string( il_contactid ) + ' AND address_id = ' + string( ll_id  )
//	ll_row = dw_contact_address.Find( ls_expr, 1, dw_contact_address.RowCount() )
//	SELECT count(*) into :ll_count from vzt_contact_address 
//		where contact_id = :il_contactid AND address_id = :ll_id ; 
//	IF ll_count <= 0 then 
//		// make trigger !!!!!!!!!!!!! 
//		INSERT INTO vzt_contact_address VALUES ( :ll_id , :il_contactid  ) ;
//	END IF 
//END IF
//return 1
end event

event itemchanged;call super::itemchanged;if row <= 0 then return 

CHOOSE CASE dwo.name
	CASE 'primary'
		If data = 'N' then 
			long ll_row , ll_maxrow
			boolean lb_primary
			ll_maxrow = this.rowcount()  
			lb_primary = false
			FOR ll_row = 1 to ll_maxrow 
				If ll_row <> row and this.object.primary [ll_row] = 'Y' then lb_primary = true 
			NEXT 
			If not lb_primary then 
				MessageBox('Warning!', 'One address should be designated as primary!')
			END IF
		END IF
END CHOOSE

end event

event ue_refresh_identity;call super::ue_refresh_identity;//address save succeeded 
// need to insert contact address relation records 
long ll_id, ll_row, ll_count, ll_cnt
ll_count = this.rowcount() 
If ll_count <= 0 then return 

FOR ll_row = 1 to ll_count 
	string ls_addr , ls_type, ls_prim, ls_rand
	
	ll_id 	= f_nvl(this.GetitemNumber( ll_row , 'id'),0)
	ls_addr 	= f_nvl(this.GetitemString( ll_row , 'address'),'')
	ls_type 	= f_nvl(this.GetitemString( ll_row , 'type'),'')
	ls_prim 	= f_nvl(this.GetitemString( ll_row , 'primary'),'')
	ls_rand 	= f_nvl(this.GetitemString( ll_row , 'rand'),'')
	
	If ll_id = 0 AND ls_rand <> '' then 
		SELECT MAX(id) INTO :ll_id FROM vzt_address 
			WHERE "rand" = :ls_rand;
			
		ll_id = f_nvl(ll_id,0)
	
		if gnv_appman.is_debugmode = 'Y' then
			MessageBox("Database Error","(select) ll_id="+string(ll_id))
		END IF	

		If ll_id > 0 then 
			this.Setitem( ll_row , 'id', ll_id 	)
			this.ResetUpdate()
		END IF
		
	END IF
	
	If ll_id = 0 then 
		SELECT @@IDENTITY INTO :ll_id FROM DUMMY ;

		ll_id = f_nvl(ll_id,0)
	
		if gnv_appman.is_debugmode = 'Y' then
			MessageBox("Database Error","(@@identity)ll_id="+string(ll_id))
		END IF	
	END IF
	
	If ll_id = 0 then 
		SELECT MAX(id)  INTO :ll_id FROM vzt_address;
		ll_id = f_nvl(ll_id,0)
		if gnv_appman.is_debugmode = 'Y' then
			MessageBox("Database Error","(@@identity)ll_id="+string(ll_id))
		END IF	
	END IF

	
  	if ll_id <> 0 then 

		SELECT count(*) into :ll_cnt from vzt_contact_address 
			where contact_id = :il_contactid AND address_id = :ll_id ; 
		IF ll_cnt <= 0 or IsNUll(ll_count) then 
			INSERT INTO vzt_contact_address (address_id, contact_id) 
					VALUES ( :ll_id , :il_contactid  ) ;
		END IF 
	ELSE
		MessageBox("Database Error","Address ID missing on Identity Refresh")
  	END IF
NEXT

return 
end event

type cb_ins from commandbutton within w_vzt_contact_edit
integer x = 1874
integer y = 1260
integer width = 233
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ins Addr"
end type

event clicked;if dw_answers.visible then 
	long			ll_newrow
 	ll_newrow = dw_answers.EVENT ue_insert_new( 'address') 
	if ll_newrow <= 0 then return 

	dw_answers.SetItem( ll_newrow, 'type', 	'EMAIL')
	dw_answers.SetItem( ll_newrow, 'primary', 'N')
	dw_answers.SetItem( ll_newrow, 'rand', 	f_random_string(20))

	If dw_answers.RowCount() = 1 then 
		dw_answers.SetItem( ll_newrow, 'type', 	'EMAIL')
		dw_answers.SetItem( ll_newrow, 'descr', 	'Primary email address')
		dw_answers.SetItem( ll_newrow, 'primary', 'Y') 
		
	END IF 

End IF 
end event

type cb_del from commandbutton within w_vzt_contact_edit
integer x = 2162
integer y = 1260
integer width = 238
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Del Addr"
end type

event clicked;if dw_answers.visible then 
	long ll_row , ll_address 
	string ls_expr
	ll_row = dw_answers.GetRow() 
	If ll_row <= 0 then return 
	ll_address = dw_answers.object.id [ll_row ]
	ls_expr = ' contact_id = ' + string( il_contactid ) + ' AND address_id = ' + string( ll_address )
	dw_answers.DeleteRow(0) 
	ll_row = dw_contact_address.Find( ls_expr, 1, dw_contact_address.RowCount() )
	// make trigger !!!!!!!!!!!!! 
	if ll_row <= 0 then return 
	dw_contact_address.DeleteRow( ll_row ) 
	
end if 
end event

type r_1 from rectangle within w_vzt_contact_edit
boolean visible = false
integer linethickness = 12
long fillcolor = 8421504
integer x = 2464
integer y = 1240
integer width = 270
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_contact_edit
boolean visible = false
integer x = 2441
integer y = 104
integer width = 645
integer height = 572
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_contact_address_edit"
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)
end event

