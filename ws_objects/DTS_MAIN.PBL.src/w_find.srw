$PBExportHeader$w_find.srw
$PBExportComments$Find dialog box.
forward
global type w_find from window
end type
type cb_cancel from commandbutton within w_find
end type
type cb_ok from commandbutton within w_find
end type
type st_1 from statictext within w_find
end type
type cbx_partial from checkbox within w_find
end type
type cbx_sort from checkbox within w_find
end type
type cbx_case from checkbox within w_find
end type
type ddlb_find from dropdownlistbox within w_find
end type
type sle_find from singlelineedit within w_find
end type
type gb_1 from groupbox within w_find
end type
end forward

global type w_find from window
integer x = 672
integer y = 264
integer width = 905
integer height = 1092
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
gb_1 gb_1
end type
global w_find w_find

type variables
u_dw_maint idw_maint
end variables

forward prototypes
public function integer wf_find_desc (string column_in, string desc_in, string operator_in, ref string expression_in, integer code_column_num_in)
public subroutine wf_center_window ()
end prototypes

public function integer wf_find_desc (string column_in, string desc_in, string operator_in, ref string expression_in, integer code_column_num_in);int li_success, li_dddw_found, l
string ls_dddw_expression,  ls_code
decimal ld_code
DataWindowChild dwc

if idw_maint.dwGetChild(column_in,dwc) < 0 then
	MessageBox("DB Error", "dwGetChild error: " + sqlca.sqlerrtext)
end if
dwc.SetTransObject(SQLCA)
ls_dddw_expression = "Upper("+desc_in+")"+ operator_in + "Upper(~"" + sle_find.text + "~")"
li_dddw_found = dwc.find(ls_dddw_expression, 1, Rowcount(dwc)) 
if li_dddw_found > 0 then
	if column_in = 'probsubprob_number' then
		ld_code = dwc.GetItemNumber(li_dddw_found, code_column_num_in)
		expression_in = column_in + operator_in + string(ld_code) 
	else
		ls_code = dwc.GetItemString(li_dddw_found, code_column_num_in)
		expression_in = column_in + operator_in + "~"" + ls_code + "~"" 
	end if
	li_success = idw_maint.dwFind( expression_in, 1, Rowcount( idw_maint ) )
else
	MessageBox("Not Found", "No match "+desc_in + " to "+ column_in)
	li_success = 0
end if

return li_success

end function

public subroutine wf_center_window ();environment env
integer rtn

rtn = GetEnvironment(env)

IF rtn <> 1 THEN RETURN


This.x = pixelstounits(( env.screenwidth / 2 )  - (unitstopixels(this.width / 2,xunitstopixels!)),xpixelstounits!)
this.y = pixelstounits(( env.screenheight / 2 ) - (unitstopixels(this.height / 2,yunitstopixels!)),ypixelstounits!)


end subroutine

event open;// 2/15/97 sfm center window
wf_center_window()


Integer i,  li_elements

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
end event

on w_find.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_1=create st_1
this.cbx_partial=create cbx_partial
this.cbx_sort=create cbx_sort
this.cbx_case=create cbx_case
this.ddlb_find=create ddlb_find
this.sle_find=create sle_find
this.gb_1=create gb_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.st_1,&
this.cbx_partial,&
this.cbx_sort,&
this.cbx_case,&
this.ddlb_find,&
this.sle_find,&
this.gb_1}
end on

on w_find.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.cbx_partial)
destroy(this.cbx_sort)
destroy(this.cbx_case)
destroy(this.ddlb_find)
destroy(this.sle_find)
destroy(this.gb_1)
end on

type cb_cancel from commandbutton within w_find
integer x = 457
integer y = 808
integer width = 320
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Cancel"
boolean cancel = true
end type

on clicked;Close( Parent )
end on

type cb_ok from commandbutton within w_find
integer x = 73
integer y = 808
integer width = 320
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&OK"
boolean default = true
end type

event clicked;Integer li_index, li_success, li_sort_success, li_dddw_found, li_code_column_num
String ls_text, ls_column, ls_expression, ls_datatype, ls_dwstring
String ls_sort_expression, ls_operator, ls_dddw_expression, ls_code
string ls_desc

// don't find if no data in sle_find
IF sle_find.text = "" THEN
	sle_find.SetFocus()
	MessageBox( "Find Row", "Please enter a value to find.", Exclamation! )
	sle_find.SetFocus()
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
ls_datatype = idw_maint.Describe( ls_dwstring )

// Check if datatype is a valid type to search on and if the
// user entered the proper datatype

ls_datatype = Upper( Left( ls_datatype, 2) )

CHOOSE CASE ls_datatype
CASE "NU"
	IF NOT IsNumber( sle_find.text ) THEN
		MessageBox( "Impoper Data Type", "Please enter a number for a valid " + ls_column + ".", Exclamation! )
		RETURN
	END IF 
CASE "DA"
	IF NOT IsDate( sle_find.text ) THEN
		MessageBox( "Impoper Data Type", "Please enter a date for a valid " + ls_column + ".", Exclamation! )
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
	IF Upper(Left( ls_datatype, 2 )) = "DA" THEN
		ls_expression = "date(" + ls_column + ") " + ls_operator + " date('" + sle_find.text + "')"
	else
		ls_expression = ls_column + ls_operator + sle_find.text  
	end if
END IF

// If we are sorting, sort before the find
IF cbx_sort.checked THEN
	ls_sort_expression =  ls_column + " A"
	li_sort_success = idw_maint.SetSort( ls_sort_expression )
	li_sort_success = idw_maint.Sort()
END IF

// Do the search
//

if ls_column = 'stat_code' or (ls_column = 'problem_number' or &
	ls_column = 'probsubprob_number')  then
	Choose Case ls_column
		Case 'stat_code'
			ls_desc = 'stat_desc'
			li_code_column_num = 2
		Case 'problem_number'
			ls_desc = 'problem_desc'
			li_code_column_num = 1
		Case 'probsubprob_number'
			ls_desc = 'subproblem_desc'
			li_code_column_num = 11
	End Choose
			
// the followings are to find stat desc on instead of code in dddw
	li_success = wf_find_desc(ls_column, ls_desc, ls_operator, &
					 ls_expression, li_code_column_num)
else
	li_success = idw_maint.Find( ls_expression, 1, Rowcount( idw_maint ) )
end if


IF li_success = 0 THEN
	MessageBox( "Find Row", "Sorry, could not find a  for a valid [" + &
					ls_column + "] of [" + sle_find.text + "].", &
					Exclamation! )
ELSE
	// to be picked-up by button calling this win from another
//	message.StringParm = ls_expression	
	cGenFind = ls_expression

	idw_maint.SetRow( li_success )
	idw_maint.ScrollToRow( li_success )
	idw_maint.SetColumn(ls_column) 
	if (idw_maint.DataObject = 'd_pending_calls') or (idw_maint.DataObject = 'd_closed_calls') then
		idw_maint.SelectRow( li_success, true )
	end if
	Close( Parent )
END IF

end event

type st_1 from statictext within w_find
integer x = 55
integer y = 84
integer width = 187
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "Find:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_partial from checkbox within w_find
integer x = 73
integer y = 480
integer width = 686
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Find Closest Match"
end type

event clicked;IF this.checked THEN
	cbx_sort.checked = true
END IF
end event

type cbx_sort from checkbox within w_find
integer x = 73
integer y = 376
integer width = 699
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Sort by Find Criteria"
end type

on clicked;IF NOT this.checked THEN
	cbx_partial.checked = FALSE
END IF
end on

type cbx_case from checkbox within w_find
integer x = 73
integer y = 272
integer width = 567
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217750
string text = "Case Sensitive"
end type

type ddlb_find from dropdownlistbox within w_find
integer x = 27
integer y = 628
integer width = 782
integer height = 336
integer taborder = 50
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

type sle_find from singlelineedit within w_find
integer x = 261
integer y = 72
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

type gb_1 from groupbox within w_find
integer x = 41
integer y = 180
integer width = 763
integer height = 396
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217750
string text = "Options"
end type

