$PBExportHeader$w_vzt_base_lookup.srw
forward
global type w_vzt_base_lookup from window
end type
type cb_inv from commandbutton within w_vzt_base_lookup
end type
type cb_clear from commandbutton within w_vzt_base_lookup
end type
type dw_1 from uo_vzt_dwbase within w_vzt_base_lookup
end type
type cb_1 from commandbutton within w_vzt_base_lookup
end type
type cb_cancel from commandbutton within w_vzt_base_lookup
end type
type cb_select from commandbutton within w_vzt_base_lookup
end type
end forward

global type w_vzt_base_lookup from window
integer x = 1056
integer y = 484
integer width = 933
integer height = 812
windowtype windowtype = response!
long backcolor = 79349703
event ue_preopen ( )
event ue_find_single_value ( string as_value )
event ue_select_input_options ( )
event ue_select_all ( )
cb_inv cb_inv
cb_clear cb_clear
dw_1 dw_1
cb_1 cb_1
cb_cancel cb_cancel
cb_select cb_select
end type
global w_vzt_base_lookup w_vzt_base_lookup

type variables
String  is_parmvalue, is_code_colname, is_name_colname
string is_datatype // type of code
string 	is_lookup_name, is_parmdescr
st_lookup_parm  	istr_parms
st_lookup_ret	istr_ret
end variables

event ue_preopen();If LEN(trim(istr_parms.selection)) > 0 then 
	dw_1._selection_service = TRIM(istr_parms.selection)   // 'S' single, 'M' - multi
ELSE
	dw_1._selection_service = 'M'  // 'S' single, 'M' - multi
END IF 

IF dw_1._selection_service <> 'M' then 
	cb_1.visible = false
	cb_inv.visible = false
end if

if f_nvl(istr_parms.codecol,'') 		= '' then is_code_colname 	= "code"
if f_nvl(istr_parms.desccol,'') 		= '' then is_name_colname 	= "descr" 
is_lookup_name	= ''
//copy and override in the descendant !!!
end event

event ue_find_single_value;string 	ls_exp 
long		ll_row

IF POS(is_datatype, "decimal") > 0 or is_datatype = 'number' or istr_parms.numlist = 'Y' THEN 
	If POS(is_datatype, "string") > 0 or POS(is_datatype, "char") > 0 then
	   ls_exp = is_code_colname+ " = '" + as_value+"'"		//still use quotes for strings even if numlist
	ELSE
	   ls_exp = is_code_colname + " = " + as_value
	END IF
ELSE
   ls_exp = is_code_colname+ " = '" + as_value+"'"
END IF

ll_row = dw_1.Find( ls_exp, 1, dw_1.RowCount())

IF ll_row  > 0 then
      dw_1.SetRow( ll_row)
      dw_1.ScrollToRow( ll_row)
      dw_1.SelectRow(ll_row, true)
else
    //messagebox("Attention","Can't find a row with a value of " + as_value)
end if 

end event

event ue_select_input_options;string ls_parm, ls_singlevalue
// Parse the input string according to single/multiple selection flag
CHOOSE CASE dw_1._selection_service 
	CASE 'S'
      dw_1.SelectRow(0, false)
		this.event ue_find_single_value( is_parmvalue )
	CASE 'M'
		long 		ll_comma
		ls_parm 	= is_parmvalue
		ls_parm 	= f_replace (ls_parm, "'", '') // get rid of quotes, if any.
		ll_comma = POS( ls_parm , ',')
		If ls_parm <> '*ALL*' then
			DO WHILE ll_comma > 0 	
				ls_singlevalue = TRIM(MID( ls_parm, 1, ll_comma - 1 )) // isolate one value element
				this.event ue_find_single_value( ls_singlevalue )
				If LEN(ls_parm) >= ll_comma + 1 then 
					ls_parm 	= MID( ls_parm, ll_comma + 1 ) // the rest of the string array
					ll_comma = POS( ls_parm , ',')				
				Else
					ll_comma = 0
				END IF
			LOOP
			If len(trim(ls_parm)) > 0 then this.event ue_find_single_value( ls_parm ) // the last value
		END IF // skip selection for ALL
CASE ELSE

END CHOOSE
	
end event

event ue_select_all;IF istr_parms.numlist = 'Y' then
 	is_parmvalue = '0' 
Else
	is_parmvalue = '*ALL*' 
	is_parmdescr = '*ALL*' 
End If
end event

on w_vzt_base_lookup.create
this.cb_inv=create cb_inv
this.cb_clear=create cb_clear
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.cb_select=create cb_select
this.Control[]={this.cb_inv,&
this.cb_clear,&
this.dw_1,&
this.cb_1,&
this.cb_cancel,&
this.cb_select}
end on

on w_vzt_base_lookup.destroy
destroy(this.cb_inv)
destroy(this.cb_clear)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.cb_select)
end on

event open;long  ll_rows, ll_lookup_width 
string  ls_exp , ls_desc 

istr_parms 			= message.PowerObjectParm 
is_parmvalue		= istr_parms.parmvalue
is_code_colname	= istr_parms.codecol
is_name_colname	= istr_parms.desccol

if f_nvl(istr_parms.dataobject, '') <> '' then 
	dw_1.dataobject = istr_parms.dataobject
	dw_1.SetTransObject(SQLCA)
END IF

if istr_parms.x > 0 then this.x = istr_parms.x + 20
if istr_parms.y > 0 then this.y = istr_parms.y - 150

this.event ue_preopen() // descendants set the parms
if dw_1._selection_service = 'S' then cb_inv.enabled = false

ls_desc = is_code_colname + ".ColType"
is_datatype = dw_1.Describe( ls_desc)
is_datatype = lower( is_datatype )


ll_lookup_width = integer(dw_1.Describe( is_name_colname+'.x')) + integer(dw_1.Describe(is_name_colname+'.width'))
if ll_lookup_width > dw_1.width then 
	dw_1.width = ll_lookup_width + 30
	this.width = ll_lookup_width + 70
END IF

If dw_1.RowCount() <= 0 then
	If len(is_lookup_name) > 0 then 
		ll_rows = dw_1.Retrieve(is_lookup_name)
	ELSE 
		ll_rows = dw_1.Retrieve()
	END IF 
END IF 

this.event ue_select_input_options()

dw_1.SetTabOrder(is_code_colname, 0)
dw_1.SetTabOrder(is_name_colname, 0)
ls_exp = is_code_colname+ ".border='0' " + is_name_colname+".border = '0'"
dw_1.Modify( ls_exp ) 
dw_1.visible = true 
IF dw_1._selection_service <> 'M' then 
	cb_1.visible = false
	cb_inv.visible = false
end if
//dw_1.ModifyEdit("R")  
end event

type cb_inv from commandbutton within w_vzt_base_lookup
integer x = 206
integer y = 728
integer width = 101
integer height = 60
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inv"
end type

event clicked;long ll_row, ll_maxrow 

if dw_1._selection_service <> 'M' then return 

ll_maxrow = dw_1.RowCOunt() 
FOR ll_row = 1 to ll_maxrow 
	if dw_1.GetSelectedRow( ll_row - 1 ) = ll_row then // current row selected - inverse
		dw_1.SelectRow( ll_row , false )  
	Else
		dw_1.SelectRow( ll_row , true ) 		
	End If 
NExt 

//Closewithreturn(parent,istr_ret)


end event

type cb_clear from commandbutton within w_vzt_base_lookup
integer x = 562
integer y = 728
integer width = 142
integer height = 60
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;dw_1.SelectRow( 0, false) 
end event

type dw_1 from uo_vzt_dwbase within w_vzt_base_lookup
integer x = 5
integer y = 4
integer width = 901
integer height = 716
string dataobject = "d_vzt_lookup01"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi
end event

event doubleclicked;call super::doubleclicked;if row > 0 then cb_select.POST Event clicked()
end event

type cb_1 from commandbutton within w_vzt_base_lookup
integer x = 315
integer y = 728
integer width = 238
integer height = 60
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select All"
end type

event clicked;parent.event ue_select_all() 

istr_ret.newvalue = is_parmvalue
istr_ret.newdescr = is_parmdescr 

Closewithreturn(parent,istr_ret)


end event

type cb_cancel from commandbutton within w_vzt_base_lookup
integer x = 713
integer y = 728
integer width = 192
integer height = 60
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
end type

event clicked;istr_ret.newvalue = "CANCEL"

closewithreturn(parent, istr_ret)
end event

type cb_select from commandbutton within w_vzt_base_lookup
integer x = 5
integer y = 728
integer width = 192
integer height = 60
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
boolean default = true
end type

event clicked;long 		ll_row
string 	ls_comma, ls_quote

is_parmvalue 	= '' 
ls_comma 		= ''
ll_row 			= dw_1.GetSelectedRow(0) 
ls_quote 		= "'"
IF POS(is_datatype, "decimal") > 0 THEN ls_quote = ''

If ll_row > 0 then
	CHOOSE CASE dw_1._selection_service 
		CASE 'S'  //single
			IF POS(is_datatype, "decimal") > 0 or istr_parms.numlist = 'Y' THEN 
				If POS(is_datatype, "decimal") > 0 then // numlist can be a number or string without quotes
					is_parmvalue = trim(String(dw_1.GetItemNumber( ll_row , is_code_colname )))
				ELSE
					is_parmvalue = dw_1.GetItemString( ll_row , is_code_colname )
				END IF
			else
				is_parmvalue = dw_1.GetItemString( ll_row , is_code_colname )
			END IF
			is_parmdescr = dw_1.GetItemString( ll_row , is_name_colname )
		CASE 'M'  //multi 
			DO WHILE ll_row > 0 
				If is_parmvalue = '' then 
					IF POS(is_datatype, "decimal") > 0 or is_datatype = 'number' THEN
						is_parmvalue = ls_quote + trim(string(dw_1.GetItemNumber(ll_row, is_code_colname ))) + ls_quote
						If istr_parms.numlist = 'Y' then is_parmvalue = f_replace (is_parmvalue, "'", '')//no quotes 
					ElseIf istr_parms.numlist = 'Y' then // no quotes 
						If POS(is_datatype, "char") > 0 or POS(is_datatype, "string") > 0 then 
							is_parmvalue = trim(dw_1.GetItemString(ll_row, is_code_colname )) 							
						ELSE
							is_parmvalue = trim(string(dw_1.GetItemNumber(ll_row, is_code_colname )))
							is_parmvalue = f_replace (is_parmvalue, "'" , '')//no quotes 
						END IF
					Else
						is_parmvalue = ls_quote + trim(dw_1.GetItemString(ll_row, is_code_colname )) + ls_quote						
					END IF
				is_parmdescr = trim( dw_1.GetItemString( ll_row , is_name_colname ))
				ELSE
					IF POS(is_datatype, "decimal") > 0 and not istr_parms.numlist = 'Y' THEN					
						is_parmvalue = is_parmvalue + ", "+ls_quote +trim(string(dw_1.GetItemNumber(ll_row, is_code_colname ))) + ls_quote						
					ElseIf istr_parms.numlist = 'Y' then // no quotes
						If POS(is_datatype, "char") > 0 or POS(is_datatype, "string") > 0 then 
							is_parmvalue = is_parmvalue + ", "+ trim(string(dw_1.GetItemString(ll_row, is_code_colname )))
						ELSE
							is_parmvalue = is_parmvalue + ", "+ trim(string(dw_1.GetItemNumber(ll_row, is_code_colname )))							
							is_parmvalue = f_replace (is_parmvalue, "'", '')//no quotes 
						END IF
					Else
						is_parmvalue = is_parmvalue + ", "+ls_quote +trim(dw_1.GetItemString(ll_row, is_code_colname )) + ls_quote
					END IF						
				is_parmdescr = is_parmdescr + ', '+ trim(dw_1.GetItemString( ll_row , is_name_colname ))
				END IF
				ll_row = dw_1.GetSelectedRow( ll_row )
			LOOP
				
	END CHOOSE
END IF
if trim(is_parmvalue) = '' then  parent.event ue_select_all ()	// default to all

istr_ret.newvalue = is_parmvalue
istr_ret.newdescr = is_parmdescr 

Closewithreturn(parent,istr_ret)


end event

