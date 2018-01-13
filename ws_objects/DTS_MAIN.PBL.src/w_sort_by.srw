$PBExportHeader$w_sort_by.srw
$PBExportComments$Sort dialog box.
forward
global type w_sort_by from window
end type
type cb_default from u_cb_base within w_sort_by
end type
type cb_cancel from u_cb_base within w_sort_by
end type
type cb_ok from u_cb_base within w_sort_by
end type
type cb_delete from u_cb_base within w_sort_by
end type
type cb_insert from u_cb_base within w_sort_by
end type
type cb_add from u_cb_base within w_sort_by
end type
type cb_delall from u_cb_base within w_sort_by
end type
type dw_1 from datawindow within w_sort_by
end type
end forward

global type w_sort_by from window
integer x = 82
integer y = 184
integer width = 2075
integer height = 1252
boolean titlebar = true
string title = "Specify Sort Columns"
windowtype windowtype = response!
long backcolor = 79741120
cb_default cb_default
cb_cancel cb_cancel
cb_ok cb_ok
cb_delete cb_delete
cb_insert cb_insert
cb_add cb_add
cb_delall cb_delall
dw_1 dw_1
end type
global w_sort_by w_sort_by

type variables
u_dw_maint idw_maint
end variables

forward prototypes
public subroutine wf_center_window ()
end prototypes

public subroutine wf_center_window ();environment env
integer rtn

rtn = GetEnvironment(env)

IF rtn <> 1 THEN RETURN


This.x = pixelstounits(( env.screenwidth / 2 )  - (unitstopixels(this.width / 2,xunitstopixels!)),xpixelstounits!)
this.y = pixelstounits(( env.screenheight / 2 ) - (unitstopixels(this.height / 2,yunitstopixels!)),ypixelstounits!)


end subroutine

event open;
// 2/16/97 sfm  centers window
wf_center_window()

Integer li_col_count, li_loop_count, li_len
Long ll_new_row, ll_parse_pos
String ls_col_name, ls_col_count, ls_dw_sort, ls_col_nm, ls_col_dsc
String ls_parse_col, ls_parse_ord, ls_dw
DataWindowChild ldwc_columns

// creates an instance of the dddw as a datawindow child which will be
// populated with sort columns for the current application datawindow
// updates ldwc_columns by reference

idw_maint = Message.PowerObjectParm
ls_dw = idw_maint.dataobject
//dw_1.SetRowFocusIndicator( Hand! )

dw_1.GetChild( "s_column_name" , ldwc_columns )

// determine current datasort, if any
ls_dw_sort = idw_maint.Describe("datawindow.table.sort")

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
		ls_col_nm = idw_maint.isa_sortcols[li_loop_count]
		ls_col_dsc = idw_maint.isa_sortdesc[li_loop_count]
		ldwc_columns.SetItem( ll_new_row, "s_column_name", idw_maint.isa_sortcols[li_loop_count])
		ldwc_columns.SetItem( ll_new_row, "s_column_desc", idw_maint.isa_sortdesc[li_loop_count])
	NEXT
ELSE
	// find the number of columns on the current application datawindow
	ls_col_count = idw_maint.Describe( "datawindow.column.count" )

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

idw_maint.setfocus()


// Add a row to the dw if there are none
IF dw_1.RowCount() = 0 THEN
	cb_add.PostEvent( Clicked! )
END IF


CHOOSE CASE idw_maint.iw_parent.classname()
	CASE 'w_timer_calls', 'w_pending_calls','w_closed_calls'
		cb_default.visible = TRUE
	CASE ELSE
		cb_default.visible = FALSE
END CHOOSE	

cb_add.SetFocus()
end event

on w_sort_by.create
this.cb_default=create cb_default
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_add=create cb_add
this.cb_delall=create cb_delall
this.dw_1=create dw_1
this.Control[]={this.cb_default,&
this.cb_cancel,&
this.cb_ok,&
this.cb_delete,&
this.cb_insert,&
this.cb_add,&
this.cb_delall,&
this.dw_1}
end on

on w_sort_by.destroy
destroy(this.cb_default)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_add)
destroy(this.cb_delall)
destroy(this.dw_1)
end on

type cb_default from u_cb_base within w_sort_by
integer x = 1659
integer y = 300
integer width = 347
integer height = 108
integer taborder = 31
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "De&fault"
end type

event clicked;call super::clicked;Integer li_loop_count
Long    ll_rows
String  ls_sort_string, ls_dw_sort,abc
Integer li_rc

li_rc =  Messagebox("Responder", "Would you like to save this sort order as the windows default ?",& 
            exclamation!,yesno!,1)

IF li_rc = 2 THEN return



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
abc = idw_maint.iw_parent.classname()

CHOOSE CASE	idw_maint.iw_parent.classname()			
	CASE 'w_closed_calls'
		SetprofileString( cINIPath+"he_dts.ini", "Closed", "DefaultSort",ls_sort_string) 
	CASE 'w_timer_calls'
		SetprofileString( cINIPath+"he_dts.ini", "Timer", "DefaultSort", ls_sort_string)
  CASE 'w_pending_calls'
		SetprofileString( cINIPath+"he_dts.ini", "Pending", "DefaultSort",ls_sort_string)
      
END CHOOSE
	
end event

type cb_cancel from u_cb_base within w_sort_by
integer x = 1659
integer y = 176
integer width = 352
integer height = 108
integer taborder = 30
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "&Cancel"
boolean cancel = true
end type

on clicked;call u_cb_base::clicked;Close( Parent )
end on

type cb_ok from u_cb_base within w_sort_by
integer x = 1659
integer y = 52
integer width = 352
integer height = 108
integer taborder = 20
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
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

type cb_delete from u_cb_base within w_sort_by
integer x = 1659
integer y = 760
integer width = 352
integer height = 108
integer taborder = 50
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "&Delete"
end type

on clicked;call u_cb_base::clicked;dw_1.DeleteRow(0)
end on

type cb_insert from u_cb_base within w_sort_by
integer x = 1659
integer y = 884
integer width = 352
integer height = 108
integer taborder = 60
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "&Insert"
end type

event clicked;integer li_current_row, li_new_row

IF dw_1.RowCount() = 0  THEN
	li_current_row = 0
ELSE
	li_current_row = dw_1.GetRow()
END IF

li_new_row = dw_1.InsertRow( li_current_row )

dw_1.SetItem( li_new_row, "s_asc_desc", "A" )

dw_1.SetRow( li_new_row )

dw_1.SetFocus()



end event

type cb_add from u_cb_base within w_sort_by
integer x = 1659
integer y = 1008
integer width = 352
integer height = 108
integer taborder = 70
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

type cb_delall from u_cb_base within w_sort_by
integer x = 1659
integer y = 636
integer width = 352
integer height = 108
integer taborder = 40
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Lucida Sans"
string text = "D&elete All"
end type

on clicked;call u_cb_base::clicked;Integer i, li_row_count

li_row_count = dw_1.RowCount()

FOR i = 1 TO li_row_count
	dw_1.DeleteRow(0)
NEXT
end on

type dw_1 from datawindow within w_sort_by
integer x = 32
integer y = 40
integer width = 1591
integer height = 1072
integer taborder = 10
string dataobject = "d_sort_by"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

