$PBExportHeader$w_sort_by2.srw
forward
global type w_sort_by2 from window
end type
type cb_cancel from u_cb_base within w_sort_by2
end type
type cb_ok from u_cb_base within w_sort_by2
end type
type cb_delete from u_cb_base within w_sort_by2
end type
type cb_insert from u_cb_base within w_sort_by2
end type
type cb_add from u_cb_base within w_sort_by2
end type
type cb_delall from u_cb_base within w_sort_by2
end type
type dw_1 from datawindow within w_sort_by2
end type
end forward

global type w_sort_by2 from window
integer x = 82
integer y = 184
integer width = 2048
integer height = 1252
boolean titlebar = true
string title = "Specify Sort Columns"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
cb_cancel cb_cancel
cb_ok cb_ok
cb_delete cb_delete
cb_insert cb_insert
cb_add cb_add
cb_delall cb_delall
dw_1 dw_1
end type
global w_sort_by2 w_sort_by2

type variables
u_dw_maint_tab idw_maint

end variables

on open;Integer li_col_count, li_loop_count, li_len
Long ll_new_row, ll_parse_pos
String ls_col_name, ls_col_count, ls_dw_sort
String ls_parse_col, ls_parse_ord
DataWindowChild ldwc_columns

// creates an instance of the dddw as a datawindow child which will be
// populated with sort columns for the current application datawindow
// updates ldwc_columns by reference

idw_maint = Message.PowerObjectParm

//dw_1.SetRowFocusIndicator( Hand! )

dw_1.dwGetChild( "s_column_name" , ldwc_columns )

// determine current datasort, if any
ls_dw_sort = idw_maint.dwDescribe("datawindow.table.sort")

// parse current sort order and populate the main datawindow with the
// selected sort columns if datawindow sort attribute is not empty
DO WHILE LEN(ls_dw_sort) <> 0 AND ls_dw_sort <> "?"
	ll_parse_pos = Pos(ls_dw_sort," ")
	ls_parse_col = Mid(ls_dw_sort,1,(ll_parse_pos - 1))
	ls_dw_sort   = Right(ls_dw_sort,LEN(ls_dw_sort) - ll_parse_pos)
	ls_parse_ord = Mid(ls_dw_sort,1,1)
	li_len = LEN(ls_dw_sort)
	ls_dw_sort   = Right(ls_dw_sort,(li_len - 3))
	ll_new_row   = dw_1.InsertRow(0)
	dw_1.SetItem(ll_new_row,"s_column_name",ls_parse_col)
	dw_1.SetItem(ll_new_row,"s_asc_desc",ls_parse_ord)
LOOP

// check to see whether any sort columns have been specified
li_col_count = UpperBound( idw_maint.isa_sortcols )
IF li_col_count > 0 THEN
	FOR li_loop_count = 1 TO li_col_count
		ll_new_row = ldwc_columns.InsertRow(0)
		ldwc_columns.SetItem( ll_new_row, "s_column_name", idw_maint.isa_sortcols[li_loop_count])
		ldwc_columns.SetItem( ll_new_row, "s_column_desc", idw_maint.isa_sortdesc[li_loop_count])
	NEXT
ELSE
	// find the number of columns on the current application datawindow
	ls_col_count = idw_maint.dwDescribe( "datawindow.column.count" )

	// for each column on the current application datawindow, find the column
	// name and add it to the drop down data window (ldwc_columns) on the 
	// sort_by datawindow.  
	li_col_count = Integer(ls_col_count)
	FOR li_loop_count = 1 TO li_col_count
		ll_new_row = ldwc_columns.InsertRow(0)
		idw_maint.SetColumn( li_loop_count )
	   ls_col_name = idw_maint.GetColumnName()
		ldwc_columns.SetItem( ll_new_row, "s_column_name", ls_col_name)
		ldwc_columns.SetItem( ll_new_row, "s_column_desc", ls_col_name)
	NEXT
END IF

// Add a row to the dw if there are none
IF dw_1.RowCount() = 0 THEN
	cb_add.PostEvent( Clicked! )
END IF
end on

on w_sort_by2.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_add=create cb_add
this.cb_delall=create cb_delall
this.dw_1=create dw_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.cb_delete,&
this.cb_insert,&
this.cb_add,&
this.cb_delall,&
this.dw_1}
end on

on w_sort_by2.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_add)
destroy(this.cb_delall)
destroy(this.dw_1)
end on

type cb_cancel from u_cb_base within w_sort_by2
integer x = 1650
integer y = 176
integer width = 306
integer height = 88
integer textsize = -8
integer weight = 700
string text = "&Cancel"
boolean cancel = true
end type

on clicked;call u_cb_base::clicked;Close( Parent )
end on

type cb_ok from u_cb_base within w_sort_by2
integer x = 1650
integer y = 52
integer width = 306
integer height = 88
integer textsize = -8
integer weight = 700
string text = "&OK"
boolean default = true
end type

on clicked;call u_cb_base::clicked;Integer li_loop_count
Long ll_rows
String  ls_sort_string, ls_dw_sort

ls_sort_string = ""
ll_rows = dw_1.RowCount()

// Develop sort string based on columns selected in sort_by window
FOR li_loop_count = 1 TO ll_rows
	ls_sort_string = ls_sort_string + &
                     dw_1.GetItemString(li_loop_count,"s_column_name") + &
                     " " + dw_1.GetItemString(li_loop_count,"s_asc_desc") + ","
NEXT

// Trim last ',' off the end of ls_sort_string
IF Len( ls_sort_string ) <> 0 THEN
	ls_sort_string = Left( ls_sort_string, Len( ls_sort_string ) -1 )
END IF

// Now actually sort the datawindow
IF Len( ls_sort_string ) <> 0 THEN
	idw_maint.SetSort( ls_sort_string )
	idw_maint.Sort()
END IF

Close( Parent )

end on

type cb_delete from u_cb_base within w_sort_by2
integer x = 1650
integer y = 760
integer width = 306
integer height = 88
integer textsize = -8
integer weight = 700
string text = "&Delete"
end type

on clicked;call u_cb_base::clicked;dw_1.DeleteRow(0)
end on

type cb_insert from u_cb_base within w_sort_by2
integer x = 1650
integer y = 884
integer width = 306
integer height = 88
integer textsize = -8
integer weight = 700
string text = "&Insert"
end type

on clicked;call u_cb_base::clicked;integer li_current_row, li_new_row

IF dw_1.RowCount() = 0  THEN
	li_current_row = 0
ELSE
	li_current_row = dw_1.GetRow()
END IF

li_new_row = dw_1.InsertRow( li_current_row )
dw_1.SetRow( li_new_row )

dw_1.SetFocus()
end on

type cb_add from u_cb_base within w_sort_by2
integer x = 1650
integer y = 1008
integer width = 306
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "&Add"
end type

on clicked;call u_cb_base::clicked;long ll_new_row

ll_new_row = dw_1.InsertRow(0)
dw_1.SetItem( ll_new_row, "s_asc_desc", "A" )
dw_1.SetRow(ll_new_row)

dw_1.SetFocus()
end on

type cb_delall from u_cb_base within w_sort_by2
integer x = 1650
integer y = 636
integer width = 306
integer height = 88
integer textsize = -8
integer weight = 700
string text = "D&elete All"
end type

on clicked;call u_cb_base::clicked;Integer i, li_row_count

li_row_count = dw_1.RowCount()

FOR i = 1 TO li_row_count
	dw_1.DeleteRow(0)
NEXT
end on

type dw_1 from datawindow within w_sort_by2
integer x = 32
integer y = 40
integer width = 1591
integer height = 1072
integer taborder = 20
string dataobject = "d_sort_by"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

