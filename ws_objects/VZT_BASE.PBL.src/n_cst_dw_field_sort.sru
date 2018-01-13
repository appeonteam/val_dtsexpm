$PBExportHeader$n_cst_dw_field_sort.sru
forward
global type n_cst_dw_field_sort from nonvisualobject
end type
end forward

global type n_cst_dw_field_sort from nonvisualobject
event type integer ue_lbuttondown ( ref datawindow adw_requestor,  string as_oap )
event type integer ue_lbuttonup ( ref datawindow adw_requestor,  string as_oap )
end type
global n_cst_dw_field_sort n_cst_dw_field_sort

type variables
string is_col_name[ ]
string is_col_expr[ ]
string is_col_expr_flip[ ]
string is_last_sorted
datawindow idw_requestor_dw
integer ii_column_count

end variables

forward prototypes
public function string of_parse_tab_left (string as_tabbed)
public function string of_parse_tab_right (string as_tabbed)
public function integer of_column_index (ref datawindow adw_requestor, string as_col_name)
public function integer of_setcolumn (string as_col_name, string as_col_expr, string as_col_expr_flip)
end prototypes

event ue_lbuttondown;If IsValid( adw_requestor) then
	string ls_colname
	integer li_index
	ls_colname =  this.of_parse_tab_left( as_oap ) 
	li_index = of_column_index( adw_requestor,  ls_colname )
	If li_index  > 0 then
	 adw_requestor.Modify( ls_colname + ".border = 5" )
	End If
End If
return 1


end event

event type integer ue_lbuttonup(ref datawindow adw_requestor, string as_oap);If IsValid( adw_requestor) then
	string ls_colname, ls_msg
	integer li_index, li_ret 
	ls_msg =  "~r~n(if the dw is sharing data - primary columns should be used." 
	ls_colname =  this.of_parse_tab_left( as_oap ) 
	li_index = of_column_index( adw_requestor,  ls_colname )
	If li_index  > 0 then
	 adw_requestor.Modify( ls_colname + ".border = 6" )
	 If is_last_sorted = is_col_expr[ li_index ] then
		If is_col_expr_flip[ li_index ] <> "" then
 		    is_last_sorted = is_col_expr_flip[ li_index ]
			 li_ret = adw_requestor.SetSort( is_last_sorted )	 
			 if li_ret = -1 then 
				ls_msg = "do:"+ adw_requestor.dataobject + ", Expr=" + is_last_sorted + ls_msg
				MessageBox( "Field sort failed", ls_msg)
				clipboard(is_last_sorted )
			end if
		 	 adw_requestor.Sort() 
		End If				  
	 ELSE
		 is_last_sorted = is_col_expr[ li_index ]
		 li_ret = adw_requestor.SetSort( is_last_sorted )	 
			 if li_ret = -1 then 				
				ls_msg = "do:"+ adw_requestor.dataobject + ", Expr=" + is_last_sorted + ls_msg
				MessageBox( "VZT Field sort failed", ls_msg )
				clipboard(is_last_sorted )
			end if
	 	 adw_requestor.Sort() 
	 End If	
	End If
End If
return 1
end event

public function string of_parse_tab_left (string as_tabbed);string ls_left, ls_right
integer li_tab

li_tab = Pos( as_tabbed, "~t", 1)
ls_left = Left( as_tabbed, li_tab - 1)
ls_right = Mid( as_tabbed, li_tab + 1)

return ls_left
end function

public function string of_parse_tab_right (string as_tabbed);string ls_left, ls_right
integer li_tab

li_tab = Pos( as_tabbed, "~t", 1)
ls_left = Left( as_tabbed, li_tab - 1)
ls_right = Mid( as_tabbed, li_tab + 1)

return ls_right
end function

public function integer of_column_index (ref datawindow adw_requestor, string as_col_name);// find the column in the array
integer li_index

li_index = 1
IF ii_column_count < 1 then RETURN 0

DO WHILE li_index <= ii_column_count
	If is_col_name[ li_index] = as_col_name then EXIT
	li_index ++
LOOP

IF li_index > ii_column_count then li_index = 0

return li_index 
end function

public function integer of_setcolumn (string as_col_name, string as_col_expr, string as_col_expr_flip);integer li_count

If IsNull( as_col_name + as_col_expr + as_col_expr_flip ) then return -1

//If ii_column_count > 0 then // find existing definition
//	DO WHILE li_count <= ii_column_count 
//		IF adw_requestor = idw_requestor_dw[ li_count] and is_col_name[ li_count] = as_col_name then EXIT
//		li_count ++
//	LOOP
//ELSE
//	ii_column_count = 1
//END IF

li_count = Upperbound( is_col_name[]) + 1 
is_col_name[ li_count] 			= as_col_name 
is_col_expr[ li_count] 			= as_col_expr
is_col_expr_flip[ li_count]	= as_col_expr_flip
ii_column_count = li_count

return 1
end function

on n_cst_dw_field_sort.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dw_field_sort.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

