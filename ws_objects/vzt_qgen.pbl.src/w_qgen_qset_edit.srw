$PBExportHeader$w_qgen_qset_edit.srw
forward
global type w_qgen_qset_edit from w_vzt_base
end type
type r_1 from rectangle within w_qgen_qset_edit
end type
type tab_1 from tab within w_qgen_qset_edit
end type
type tabpage_1 from userobject within tab_1
end type
type dw_qset from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_qset dw_qset
end type
type tabpage_2 from userobject within tab_1
end type
type dw_selected from uo_vzt_dwbase within tabpage_2
end type
type dw_available from uo_vzt_dwbase within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type cb_up from commandbutton within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_selected dw_selected
dw_available dw_available
st_1 st_1
st_2 st_2
cb_up cb_up
cb_1 cb_1
end type
type tabpage_3 from userobject within tab_1
end type
type dw_survey from uo_vzt_dwbase within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_survey dw_survey
end type
type tab_1 from tab within w_qgen_qset_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_qgen_qset_edit from w_vzt_base
integer width = 2487
integer height = 1784
string title = "Survey Maintenance"
r_1 r_1
tab_1 tab_1
end type
global w_qgen_qset_edit w_qgen_qset_edit

type variables
double id_qsetid
nvo_qgen inv_qgen
end variables

on w_qgen_qset_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.tab_1
end on

on w_qgen_qset_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.tab_1)
end on

event open;call super::open;if Not Isvalid( inv_qgen ) then inv_qgen = CREATE nvo_qgen
inv_qgen.idw_target = tab_1.tabpage_3.dw_survey

it_main_tab = tab_1

is_accessflags = 'WR'
dw_primary = tab_1.tabpage_1.dw_qset

if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_newsearch.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()


end event

event ue_assign_menu;//overr
end event

type uo_trace01 from w_vzt_base`uo_trace01 within w_qgen_qset_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_qgen_qset_edit
integer x = 5
integer y = 8
integer width = 2377
integer height = 336
string dataobject = "d_qset_list"
end type

event dw_mainlist::ue_rowselected;if row > 0 and row <= this.RowCount() AND ab_selected = true then
	id_qsetid = f_nvl(dw_primary.GetItemNumber(row,'qsetid') , 0)

	cb_new.visible 		= true 

	if id_qsetid <= 0 then 
		tab_1.tabpage_2.dw_selected.Reset()
		tab_1.tabpage_2.dw_available.Reset()
		return 1
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		tab_1.tabpage_2.dw_selected.Retrieve( id_qsetid)
		tab_1.tabpage_2.dw_available.Retrieve( id_qsetid)
		if IsValid( inv_qgen) and id_qsetid > 0 then 
			inv_qgen.event ue_create_qset( id_qsetid, tab_1.tabpage_3.dw_survey) 
		End If
	 
//		 cb_ins.visible			= true
//		 cb_del.visible			= true
	END IF 

	
END IF	

return 1


end event

type cb_last_search from w_vzt_base`cb_last_search within w_qgen_qset_edit
integer x = 1074
integer y = 1532
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_qgen_qset_edit
integer x = 2075
integer y = 1532
integer taborder = 40
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_qgen_qset_edit
integer x = 1605
integer y = 1532
integer taborder = 110
end type

type cb_save from w_vzt_base`cb_save within w_qgen_qset_edit
integer x = 855
integer y = 1532
integer taborder = 90
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
		tab_1.tabpage_2.dw_selected.Retrieve( id_qsetid)
		tab_1.tabpage_2.dw_available.Retrieve( id_qsetid)
END IF
end event

type cb_select from w_vzt_base`cb_select within w_qgen_qset_edit
integer x = 635
integer y = 1532
integer taborder = 80
end type

type cb_new from w_vzt_base`cb_new within w_qgen_qset_edit
integer x = 1431
integer y = 1532
integer taborder = 100
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_qgen_qset_edit
integer x = 59
integer y = 1532
integer taborder = 70
end type

event cb_newsearch::clicked;call super::clicked; 
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_qgen_qset_edit
integer x = 407
integer y = 1532
integer taborder = 60
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_qgen_qset_edit
integer x = 1806
integer y = 1532
integer width = 251
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_qgen_qset_edit
integer x = 1865
integer y = 1532
end type

type dw_data from w_vzt_base`dw_data within w_qgen_qset_edit
boolean visible = false
integer x = 1691
integer y = 240
integer width = 667
integer height = 484
integer taborder = 30
end type

event dw_data::constructor;call super::constructor;//this.ib_poweredit = true 
//
////is_protected[]	={''}
////is_restricted[]	={''}
////is_required[]	={''}
//
//is_editable[]	={'questiontxt', 'qtypeid', 'width','ansperline', & 
//			'ddlookuptype','ddcodecol','dddispcol',  		&
//			'ddlookup','ddcoltype','repeat','height','weight','fontface','fontsize','bold', &
//			'italic', 'under', 'fgcolor','bgcolor'}
//
//is_searchable[]	=  is_editable[]
//

end event

event dw_data::ue_refresh_identity;//long ll_row
//If this.GetRow() <= 0 then return  
//
//if f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0) = 0 then 
//	
//	SELECT max(questionid) into :id_questionid from qgen_questions ;
//	//MessageBox('qid',string(id_questionid))
//	this.setitem( this.GetRow(), 'questionid', id_questionid)
//	
//END IF
end event

event dw_data::itemchanged;call super::itemchanged;//if row <= 0 or row > this.RowCount() then return 
//
//dwitemstatus l_status
//long			ll_newrow
//
//l_status = this.GetItemStatus( row, 0, Primary!) 
//If l_status = New! or l_status = NewModified! then
//	If dwo.name = 'qtypeid' then 
//		If POS(data, 'YN') > 0 then 
//			this.SetItem( this.GetRow(), 'width', 150)
//			If dw_answers.RowCount() = 0 then // Do YES/NO automatically
//			
//		 		ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
//				if ll_newrow <= 0 then return 
//				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
//				dw_answers.SetItem( ll_newrow, 'answertxt', 'Yes')
//			
//		 		ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
//				if ll_newrow <= 0 then return 
//				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
//				dw_answers.SetItem( ll_newrow, 'answertxt', 'No')
//		
//			END IF
//		END IF
//		If POS(data, 'TF') > 0 then 
//			this.SetItem( this.GetRow(), 'width', 170)
//			If dw_answers.RowCount() = 0 then // Do True/False automatically
//	
//				ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
//				if ll_newrow <= 0 then return 
//				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
//				dw_answers.SetItem( ll_newrow, 'answertxt', 'True')
//			
//		 		ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
//				if ll_newrow <= 0 then return 
//				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
//				dw_answers.SetItem( ll_newrow, 'answertxt', 'False')
//			END IF
//		END IF
//	END IF
//	
//END IF // new row
end event

type dw_print from w_vzt_base`dw_print within w_qgen_qset_edit
integer x = 2999
integer y = 1572
integer taborder = 120
end type

type r_1 from rectangle within w_qgen_qset_edit
integer linethickness = 8
long fillcolor = 8421504
integer x = 32
integer y = 1508
integer width = 2386
integer height = 116
end type

type tab_1 from tab within w_qgen_qset_edit
integer x = 23
integer y = 360
integer width = 2377
integer height = 1096
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;

CHOOSE CASE newindex
	CASE 3
		if IsValid( inv_qgen) and id_qsetid > 0 then 
			inv_qgen.event ue_create_qset( id_qsetid, tab_1.tabpage_3.dw_survey) 
		End If
END CHOOSE

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2341
integer height = 968
long backcolor = 79741120
string text = "QSET Details"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditDataTabular!"
long picturemaskcolor = 553648127
dw_qset dw_qset
end type

on tabpage_1.create
this.dw_qset=create dw_qset
this.Control[]={this.dw_qset}
end on

on tabpage_1.destroy
destroy(this.dw_qset)
end on

type dw_qset from uo_vzt_dwbase within tabpage_1
integer x = 59
integer y = 24
integer width = 1609
integer height = 836
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_qset_edit"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_refresh_identity;long ll_row, ll_id
If this.GetRow() <= 0 then return  

ll_id = f_nvl(this.GetitemNumber( this.GetRow(), 'qsetid'),0)
if ll_id = 0 then 
	SELECT max(qsetid) into :id_qsetid from qgen_qset ;
	//MessageBox('qid',string(id_questionid))
	this.setitem( this.GetRow(), 'qsetid', id_qsetid)
ELSE
	id_qsetid = ll_id 
END IF
end event

event constructor;call super::constructor;this.ib_poweredit = true 
_SetNullonNewSearch 			= true
_ResetMaskOnSearch 			= false
_ResetDataObjectOnSelect 	= false
//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'sortorder', 'descr', 'y_start','y_before_q', 'active', 'showqnum' ,& 
			'y_q_to_a','x_start_q','x_start_a' }

is_searchable[]	=  is_editable[]

dw_primary = this 
wf_setupdateable( dw_primary, 'Qset Detail', true, true)
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2341
integer height = 968
long backcolor = 79741120
string text = "Questions"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Where!"
long picturemaskcolor = 553648127
dw_selected dw_selected
dw_available dw_available
st_1 st_1
st_2 st_2
cb_up cb_up
cb_1 cb_1
end type

on tabpage_2.create
this.dw_selected=create dw_selected
this.dw_available=create dw_available
this.st_1=create st_1
this.st_2=create st_2
this.cb_up=create cb_up
this.cb_1=create cb_1
this.Control[]={this.dw_selected,&
this.dw_available,&
this.st_1,&
this.st_2,&
this.cb_up,&
this.cb_1}
end on

on tabpage_2.destroy
destroy(this.dw_selected)
destroy(this.dw_available)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_up)
destroy(this.cb_1)
end on

type dw_selected from uo_vzt_dwbase within tabpage_2
integer y = 68
integer width = 1170
integer height = 800
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_qset_edit_qlist_selected"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dropable 						= true
_drop_selected_DW 			= true  
_drop_available_DW 			= false // available options
_selection_service 			= 'M'  

tab_1.tabpage_2.dw_available._dw_droptarget = this
end event

event dragdrop;datawindow ldw_source
long ll_source_row, ll_row, ll_sort
double	ld_questionid
string 	ls_expr, ls_practiceid, ls_locationid, ls_request = 'ADD'
			
ldw_source = source 
If IsValid( ldw_source ) then 
	// insert row and populate it from object list 
	if ldw_source.dataobject = 'd_qset_edit_qlist_available' then 
		ll_source_row = ldw_source.GetSelectedRow( 0) 
		//ll_sort = this.RowCount() + 10
		ll_sort = this.GetItemNumber( this.RowCount(), 'sortorder') + 10
		
		DO WHILE ll_source_row > 0 

			ld_questionid = ldw_source.GetItemNumber ( ll_source_row , 'questionid') 
			ls_expr = " questionid = " + string(ld_questionid ) 
			
			If this.Find( ls_expr , 0, this.RowCount() ) = 0 then // assign only if not exist already 
				INSERT INTO qgen_qset_questions 
				VALUES( :id_qsetid, :ld_questionid, :ll_sort ) ;
			End if				// find
			If ll_source_row < ldw_source.RowCount() then 
				ll_source_row = ldw_source.GetSelectedRow( ll_source_row) // get next selected
			ELSE
				ll_source_row = 0
			END IF 
			ll_sort += 10
		LOOP // while rows selected 
		COMMIT ;
		this.Retrieve( id_qsetid) 
		ldw_source.Retrieve( id_qsetid) 
		this.Sort() 
	End If
	ldw_source.SelectRow( 0, false) // reset all selections
End If
end event

event ue_delete_selected;call super::ue_delete_selected;double ld_questionid

ld_questionid = this.GetItemNumber ( al_row , 'questionid') 
DELETE FROM qgen_qset_questions 
WHERE 
			qsetid 		= :id_qsetid and 
			questionid 	= :ld_questionid;
			
return f_dbcheck( SQLCA, 'Selected QSET Questions', '', 'Delete failed.', true) 



end event

event ue_selected_row_up;long ll_row, ll_thissort, ll_newrow
long ll_this_sort, ll_prev_sort, ll_questionid


ll_row = this.GetSelectedRow( 0) 
if ll_row <= 1 or ll_row > This.RowCount() then return

ll_this_sort = this.GetItemNumber( ll_row		, 'sortorder')
ll_questionid= this.GetItemNumber( ll_row		, 'questionid')
ll_prev_sort = this.GetItemNumber( ll_row -1	, 'sortorder')
If ll_this_sort = ll_prev_sort then ll_prev_sort = ll_prev_sort - 1

this.SetItem( ll_row			, 'sortorder', ll_prev_sort )
this.SetItem( ll_row - 1 	, 'sortorder', ll_this_sort )

If this.Update( false, true) = 1 then 
	COMMIT;
ELSE
	ROLLBACK;
END IF

this.sort()
this.selectrow(0, false)
ll_newrow = this.Find( 'questionid = '+string( ll_questionid) , 0, this.RowCount() )
if ll_newrow > 0 then 
	this.selectrow(ll_newrow , true)
Else
	this.selectrow(ll_row - 1, true)
END IF

end event

event ue_selected_row_down;long ll_row, ll_thissort, ll_newrow
long ll_this_sort, ll_next_sort , ll_questionid

ll_row = this.GetSelectedRow( 0) 
if ll_row <= 0 or ll_row >= This.RowCount() then return

ll_this_sort = this.GetItemNumber( ll_row		, 'sortorder')
ll_questionid= this.GetItemNumber( ll_row		, 'questionid')
ll_next_sort = this.GetItemNumber( ll_row +1	, 'sortorder')
If ll_this_sort = ll_next_sort then ll_next_sort = ll_next_sort + 1

this.SetItem( ll_row			, 'sortorder', ll_next_sort )
this.SetItem( ll_row + 1 	, 'sortorder', ll_this_sort )

If this.Update( false, true) = 1 then 
	COMMIT;
ELSE
	ROLLBACK;
END IF

this.sort()
this.selectrow(0, false)
ll_newrow = this.Find( 'questionid = '+string( ll_questionid) , 0, this.RowCount() )
if ll_newrow > 0 then 
	this.selectrow(ll_newrow , true)
Else
	this.selectrow(ll_row + 1, true)
END IF

end event

event doubleclicked;call super::doubleclicked;dw_available.Retrieve( id_qsetid)
end event

type dw_available from uo_vzt_dwbase within tabpage_2
integer x = 1179
integer y = 68
integer width = 1157
integer height = 800
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_qset_edit_qlist_available"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= true
_dropable 						= false
_drop_available_DW 			= true // available options
_selection_service = 'M'  
end event

type st_1 from statictext within tabpage_2
integer x = 133
integer y = 4
integer width = 526
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269528
boolean enabled = false
string text = "Selected questions:"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_2
integer x = 1385
integer y = 12
integer width = 521
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Available Questions:"
boolean focusrectangle = false
end type

type cb_up from commandbutton within tabpage_2
integer x = 233
integer y = 880
integer width = 334
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Move Up"
end type

event clicked;tab_1.tabpage_2.dw_selected.event ue_selected_row_up ()
end event

type cb_1 from commandbutton within tabpage_2
integer x = 608
integer y = 880
integer width = 334
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Move Down"
end type

event clicked;tab_1.tabpage_2.dw_selected.event ue_selected_row_down ()
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2341
integer height = 968
long backcolor = 79741120
string text = "Preview"
long tabbackcolor = 79741120
string picturename = "Options!"
long picturemaskcolor = 553648127
dw_survey dw_survey
end type

on tabpage_3.create
this.dw_survey=create dw_survey
this.Control[]={this.dw_survey}
end on

on tabpage_3.destroy
destroy(this.dw_survey)
end on

type dw_survey from uo_vzt_dwbase within tabpage_3
integer x = 9
integer y = 8
integer width = 2318
integer height = 952
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_template02"
boolean hscrollbar = true
boolean vscrollbar = true
end type

