$PBExportHeader$w_vzt_contact_lookup.srw
forward
global type w_vzt_contact_lookup from w_vzt_base_lookup
end type
type dw_2 from datawindow within w_vzt_contact_lookup
end type
type cb_2 from commandbutton within w_vzt_contact_lookup
end type
type cb_3 from commandbutton within w_vzt_contact_lookup
end type
end forward

global type w_vzt_contact_lookup from w_vzt_base_lookup
integer width = 2683
integer height = 908
dw_2 dw_2
cb_2 cb_2
cb_3 cb_3
end type
global w_vzt_contact_lookup w_vzt_contact_lookup

on w_vzt_contact_lookup.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_3
end on

on w_vzt_contact_lookup.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_3)
end on

event open;call super::open;dw_1._selection_service = 'S'  

dw_2.SetTransObject(SQLCA)
dw_2.REtrieve() // empty since 1=2
dw_2.InsertRow(0)
end event

type cb_inv from w_vzt_base_lookup`cb_inv within w_vzt_contact_lookup
boolean visible = false
integer x = 210
integer y = 816
integer width = 110
integer height = 72
end type

type cb_clear from w_vzt_base_lookup`cb_clear within w_vzt_contact_lookup
integer x = 571
integer y = 816
integer width = 151
integer height = 72
end type

type dw_1 from w_vzt_base_lookup`dw_1 within w_vzt_contact_lookup
integer width = 2606
integer height = 604
string dataobject = "d_contact_lookup"
end type

event dw_1::constructor;call super::constructor;_selection_service = 'S'   

this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'descr_t', 'descr A', 'descr D')
this.inv_field_sort.of_setcolumn( 'lastname_t', 'lastname A, descr A', 'lastname D, descr D')
this.inv_field_sort.of_setcolumn( 'contacttype_t', 'contacttype A, lastname A, descr A', 'contacttype D, descr A, lastname A')
this.setsort( 'contacttype A, lastname A, descr A')

end event

type cb_1 from w_vzt_base_lookup`cb_1 within w_vzt_contact_lookup
boolean visible = false
integer x = 320
integer y = 816
integer width = 247
integer height = 72
end type

type cb_cancel from w_vzt_base_lookup`cb_cancel within w_vzt_contact_lookup
integer x = 1093
integer y = 816
integer width = 201
integer height = 72
end type

type cb_select from w_vzt_base_lookup`cb_select within w_vzt_contact_lookup
integer y = 816
integer width = 201
integer height = 72
end type

type dw_2 from datawindow within w_vzt_contact_lookup
integer x = 5
integer y = 608
integer width = 2459
integer height = 188
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_contact_lookup_filter"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_vzt_contact_lookup
integer x = 2473
integer y = 612
integer width = 133
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filter"
end type

event clicked;string ls_filter, ls_expr, ls_and , ls_col, ls_value
string ls_cols[]
int		li_cnt

ls_cols[] = {'descr', 'lastname', 'contacttype', 'title'}

if dw_2.Rowcount() < 0 then return 
if dw_2.AcceptText() <> 1 then return 

ls_filter = ''
ls_and 	 = ''

For li_cnt = 1 to UpperBound(ls_cols[])
	ls_col  = ls_cols[ li_cnt ]
	ls_expr = ls_and + ' match( UPPER('+ls_col + "), '^" 
	ls_value = UPPER( f_nvl(trim(dw_2.GetItemString( 1, ls_col)) ,'') )
	ls_expr+=  ls_value +"' )" 
	If ls_value <> '' then
		ls_and  = ' AND '
		ls_filter = ls_filter + ls_expr 
	END IF
NEXT

dw_1.SetFilter( ls_filter )
dw_1.Filter()

end event

type cb_3 from commandbutton within w_vzt_contact_lookup
integer x = 2473
integer y = 704
integer width = 133
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;dw_1.SetFilter( '')
dw_1.Filter()

end event

