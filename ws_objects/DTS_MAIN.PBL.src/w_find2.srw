$PBExportHeader$w_find2.srw
forward
global type w_find2 from window
end type
type cb_cancel from commandbutton within w_find2
end type
type cb_ok from commandbutton within w_find2
end type
type st_1 from statictext within w_find2
end type
type cbx_partial from checkbox within w_find2
end type
type cbx_sort from checkbox within w_find2
end type
type cbx_case from checkbox within w_find2
end type
type ddlb_find from dropdownlistbox within w_find2
end type
type sle_find from singlelineedit within w_find2
end type
end forward

global type w_find2 from window
integer x = 672
integer y = 264
integer width = 827
integer height = 984
boolean titlebar = true
string title = "Find Data"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
cb_cancel cb_cancel
cb_ok cb_ok
st_1 st_1
cbx_partial cbx_partial
cbx_sort cbx_sort
cbx_case cbx_case
ddlb_find ddlb_find
sle_find sle_find
end type
global w_find2 w_find2

type variables
u_dw_maint_tab idw_maint
end variables

on open;Integer i,  li_elements

idw_maint = Message.PowerObjectParm

// how many elements in find array ?
li_elements = Upperbound( idw_maint.isa_findcols )

// If there are no developer defined columns to find on,
// give an error message
IF li_elements = 0 THEN
	MessageBox( "Sorry...", "...There are no search columns defined", StopSign!)
	Close( This )	
ELSE
	// The developer has defined find columns

	// fill ddlb with display and data values
	FOR i = 1 TO li_elements
		Additem( ddlb_find, idw_maint.isa_finddesc[i] )
	NEXT

	// Put the first element into the ddlb.text
	ddlb_find.text = ddlb_find.Text( 1 )

END IF
end on

on w_find2.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_1=create st_1
this.cbx_partial=create cbx_partial
this.cbx_sort=create cbx_sort
this.cbx_case=create cbx_case
this.ddlb_find=create ddlb_find
this.sle_find=create sle_find
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.st_1,&
this.cbx_partial,&
this.cbx_sort,&
this.cbx_case,&
this.ddlb_find,&
this.sle_find}
end on

on w_find2.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.cbx_partial)
destroy(this.cbx_sort)
destroy(this.cbx_case)
destroy(this.ddlb_find)
destroy(this.sle_find)
end on

type cb_cancel from commandbutton within w_find2
integer x = 443
integer y = 728
integer width = 306
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&Cancel"
boolean cancel = true
end type

on clicked;Close( Parent )
end on

type cb_ok from commandbutton within w_find2
integer x = 87
integer y = 728
integer width = 306
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "&OK"
boolean default = true
end type

on clicked;Integer li_index, li_success, li_sort_success
String ls_text, ls_column, ls_expression, ls_datatype, ls_dwstring
String ls_sort_expression, ls_operator

// don't find if no data in sle_find
IF sle_find.text = "" THEN
	MessageBox( "Find Row", "Please enter a value to find.", Exclamation! )
	RETURN
END IF

// what is the datawindow column to find on ?
ls_text = ddlb_find.text

// find the index (assumes that the ddlb is not sorted !)
li_index = ddlb_find.SelectItem( ls_text, 0 )

// get the column from the window structure
ls_column = idw_maint.isa_findcols[li_index]

// what is the datatype of the column
ls_dwstring = ls_column + ".coltype"
ls_datatype = idw_maint.dwDescribe( ls_dwstring )

// Check if datatype is a valid type to search on and if the
// user entered the proper datatype

ls_datatype = Upper( Left( ls_datatype, 2) )

CHOOSE CASE ls_datatype
CASE "NU"
	IF NOT IsNumber( sle_find.text ) THEN
		MessageBox( "Impoper Data Type", "Please enter a number.", Exclamation! )
		RETURN
	END IF 
CASE "DA"
	IF NOT IsDate( sle_find.text ) THEN
		MessageBox( "Impoper Data Type", "Please enter a date.", Exclamation! )
		RETURN
	END IF 
END CHOOSE

IF	cbx_partial.checked THEN
	ls_operator = ">="
ELSE
	ls_operator = "="
END IF

IF Upper(Left( ls_datatype, 1 )) = "C" THEN
	IF cbx_case.checked THEN
		ls_expression = ls_column + ls_operator + "~"" + sle_find.text + "~""
	ELSE
		ls_expression = "Upper("+ ls_column +")"+ ls_operator + "Upper(~"" + sle_find.text + "~")"
	END IF	
ELSE
	ls_expression = ls_column + ls_operator + sle_find.text  
END IF

// If we are sorting, sort before the find
IF cbx_sort.checked THEN
	ls_sort_expression =  ls_column + " A"
	li_sort_success = idw_maint.SetSort( ls_sort_expression )
	li_sort_success = idw_maint.Sort()
END IF

// Do the search
li_success = idw_maint.dwFind( ls_expression, 1, Rowcount( idw_maint ) )

IF li_success = 0 THEN
	MessageBox( "Find Row", "Sorry, could not find " + sle_find.text + ".", &
					Exclamation! )
ELSE
	idw_maint.SetRow( li_success )
	idw_maint.ScrollToRow( li_success )
	Close( Parent )
END IF

end on

type st_1 from statictext within w_find2
integer x = 14
integer y = 40
integer width = 187
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "Find:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_partial from checkbox within w_find2
integer x = 64
integer y = 364
integer width = 686
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long textcolor = 33554432
long backcolor = 134217750
string text = "Find Closest Match"
end type

on clicked;IF this.checked THEN
	cbx_sort.checked = true
END IF
end on

type cbx_sort from checkbox within w_find2
integer x = 64
integer y = 260
integer width = 699
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long textcolor = 33554432
long backcolor = 134217750
string text = "Sort by Find Criteria"
end type

on clicked;IF NOT this.checked THEN
	cbx_partial.checked = FALSE
END IF
end on

type cbx_case from checkbox within w_find2
integer x = 64
integer y = 156
integer width = 567
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long textcolor = 33554432
long backcolor = 134217750
string text = "Case Sensitive"
end type

type ddlb_find from dropdownlistbox within w_find2
integer x = 55
integer y = 492
integer width = 718
integer height = 396
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_find from singlelineedit within w_find2
integer x = 219
integer y = 28
integer width = 512
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

