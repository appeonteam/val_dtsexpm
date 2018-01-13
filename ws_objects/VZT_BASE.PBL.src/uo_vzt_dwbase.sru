$PBExportHeader$uo_vzt_dwbase.sru
forward
global type uo_vzt_dwbase from datawindow
end type
end forward

global type uo_vzt_dwbase from datawindow
integer width = 791
integer height = 496
integer taborder = 10
string dragicon = "Drag1pg.ico"
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event type integer ue_preretrieve_on_search ( string as_sql )
event type integer ue_rowselected ( long row,  boolean ab_selected )
event type integer ue_update_keys_on_new ( long row )
event ue_refresh_identity ( )
event type long ue_insert_new ( string as_colname )
event mousemove pbm_mousemove
event ue_gr_rbuttondown ( integer xpos,  integer ypos,  long row,  ref dwobject dwo )
event ue_gr_rbuttonup pbm_dwnrbuttonup
event ue_setshares ( )
event type integer ue_delete_selected ( long al_row )
event ue_selected_row_up ( )
event ue_selected_row_down ( )
event ue_expl_sort ( long row,  ref dwobject dwo )
event type integer ue_validate_page ( )
event ue_localize ( )
event ue_setmasks ( )
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
event constructor_settran ( )
event ue_dragdrop ( )
event ue_dragdrop_sel_drop_sql ( long al_source_row )
event ue_dragdrop_sel_drop_commit ( )
event ue_dragdrop_avl_drop_sql ( long al_source_row )
event ue_dragdrop_avl_drop_commit ( )
event ue_dragdrop_refresh ( )
event constructor_post ( )
event ue_refresh ( )
event ue_get_identity ( )
event ue_setrand ( long al_row )
event ue_search_replace_args ( ref string as_sql )
event ue_audit_get_stamp ( long al_row )
event type string ue_audit_get_msg ( )
end type
global uo_vzt_dwbase uo_vzt_dwbase

type variables
w_vzt_base iw_Window

// HTTP retrieval option
boolean ib_http
string	is_url, is_args

// date lookup
string is_editcol 

boolean	ib_audit, ib_no_audit

// identity stuff
double 	id_main_id_local // id value for retrieve (could be fkey)
double   	id_last_id			// last id key for this dw
int			ii_id_index 
string		is_id_table, is_id_col='id' , is_rand
boolean  ib_identity , ib_dorand = false

//field search
n_cst_dw_field_sort 	inv_field_sort

// graph stuff
uo_vzt_dwbase  idw_next
boolean  ib_graph=false
string	is_graphname='gr_1', is_category
statictext  ist_display

//drag n drop
boolean	_dragable = false, _dragdrop_auto = false
boolean	_dropable = false
boolean	_drop_selected_DW = false // selected options
boolean	_drop_available_DW = false // available options
boolean  _dclick_prompt = false  
string		is_ddicon_on_entry, is_rec_name
string 	is_drag_src_idcol='id', is_drag_trg_idcol='targ_id'
string   	is_drag_src_do 
double   id_source_id
datawindow _dw_droptarget
datawindow _dw_dropsource 

//=================================
string			is_orig_sql=''
string 		is_last_search_SQL
boolean		ib_search_again // 
//=================================
string 		readBGcolor, writeBGcolor, reqBGcolor, searchBGcolor
boolean   	ib_sortservice = true
string			is_sortedborder, is_savedborder, is_search_case
string			is_auto_like 
transaction 	is_tran
boolean   	ib_poweredit= false
string			is_lastsortedcol
boolean		_SetNullonNewSearch 		= false
boolean		_ResetMaskOnSearch 		= false
boolean		_ResetDataObjectOnSelect 	= false
datastore  	ids_copy

boolean		_NewSearchInprogress=false  //PRIVATE

boolean  		_set_bg_opaque_on_search = false// 
string       	_selection_service = '' 
statictext 	  ist_x_of_y // row poiter 

string 	is_required[] // auto validateable columns
string 	is_editable[] // editable columns
string 	is_searchable[] // searchable columns
string 	is_protected[] // non-editable columns
string 	is_restricted[] // columns requiring update authorization
string 	is_saveas_keys[] // columns that must be updated for save as new
string 	fkeycols [],  fkeyvals[]
string   	is_editmode
end variables

forward prototypes
public function integer search (string as_append)
public function integer modifyedit (string as_parm)
public subroutine refreshdataobject ()
public function integer newsearch ()
public function integer uf_setnull (ref datawindow adw_target, long al_srow, long al_scol, long al_erow, long al_ecol)
public function integer search_again ()
public subroutine of_setfieldsort (boolean ab_set)
public function integer uf_validaterequired ()
end prototypes

event ue_preretrieve_on_search;return 1
end event

event type long ue_insert_new(string as_colname);	long			ll_newrow
 
	ll_newrow = this.InsertRow(0)
	this.SetRow(ll_newrow)
	this.ScrollToRow(ll_newrow)
//	this.SetItemStatus( ll_newrow, 'sortorder', Primary!, NotModified!)
//	this.SetItemStatus( ll_newrow, 'sortorder', Primary!, New!)
	this.SetColumn( as_colname )

	//identity 
	if ib_identity then 
		this.event ue_get_identity ()
		this.SetItem( ll_newrow, is_id_col, id_last_id)
	END IF	
	
	this.POST SetFocus()

return ll_newrow
end event

event mousemove;if ib_graph then 
	int li_series, li_category
	string is_series, is_series_label, is_category_label, cHelpString

	this.ObjectAtPointer( is_graphname, li_series, li_category )
	IF li_category > 0 THEN	// did the user click on a graph element?
		is_category 		= CategoryName	( is_graphname, li_category ) // get the category name
		is_series 			= SeriesName		( is_graphname, li_series )
		is_category_label = this.Describe	( is_graphname + ".Category.Label" )
		is_series_label 	= this.Describe	( is_graphname + ".Series.Label" )	

		// populate the statictext box
		if isvalid ( w_main ) then w_main.SetMicroHelp( "[Graph info] > " + is_category + " >> " +&
		is_series_label + " >> " + is_series + " >> " + &
		String( GetData( is_graphname,  li_series, li_category ) ) )
	ELse 
		if IsValid( w_main ) then w_main.SetMicroHelp( This.Tag )
	END IF
END IF // end graph

end event

event ue_gr_rbuttonup;IF IsValid( ist_display) THEN ist_display.visible = false

end event

event ue_delete_selected;return 1
end event

event ue_expl_sort;if not ib_sortservice then return 

//
//string		ls_name, tagstr, ls_ascdesc
//integer		ls_name_length, sortpos
//
//IF dwo.Type = "text" THEN
//	ls_name = dwo.Name
//
//	if isNull(ls_name) or len(trim(ls_name)) <= 2 then return
//	If Mid(ls_name, len(ls_name)-1, 2) <> "_t" then return 
//
//	ls_name_length = Len(ls_name)
//	if ls_name_length <= 0 then
//		return
//	end if
//	
//	if  f_nvl(is_lastsortedcol,'') <> '' then
//		this.Modify(is_lastsortedcol + ".Border = '" + is_savedborder + "'")
//	end if
//	
//	ls_ascdesc = Char(this.Describe(ls_name + ".TAG"))
//
//	if isNull(ls_ascdesc) OR (ls_ascdesc <> "A" AND ls_ascdesc <> "D") then
//		ls_ascdesc = "A"
//		this.Modify(ls_name + ".tag='" + ls_ascdesc + "'")
//	end if
//
//	if is_lastsortedcol = ls_name then
//		if ls_ascdesc = "A" then
//			ls_ascdesc = "D"
//		else
//			ls_ascdesc = "A"
//		end if
//		this.Modify(ls_name + ".tag='" + ls_ascdesc + "'")
//	end if
//	
//	is_lastsortedcol = ls_name
//		
//	this.modify(ls_name + ".Border = '" + is_sortedborder + "'")
//
//	string ls_order
//	ls_order = Left(ls_name, ls_name_length - 2) + " " + ls_ascdesc
//	
//	This.SetSort( ls_order )
//	This.Sort()
//	this.SelectRow(0, false) 
//	this.ScrollToRow(0)
//END IF
//
end event

event ue_validate_page;return 0
end event

event ue_localize;if gnv_appman.inv_language.is_language = 'ENGLISH-US' then 
	Return // we are cool here 
ELSE

END IF
end event

event ue_setmasks;//if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 
//this.Object.date_column.EditMask.Mask	= gnv_appman.is_datemask

end event

event ue_lbuttondown;If IsValid( inv_field_sort) then 
	String dwobject
	datawindow ldw_this
	ldw_this = this
	dwobject = this.GetObjectAtPointer()
	inv_field_sort.event ue_lbuttondown( ldw_this, dwobject )
END IF

end event

event ue_lbuttonup;If IsValid( inv_field_sort) then 
	String dwobject
	datawindow ldw_this
	ldw_this = this
	dwobject = this.GetObjectAtPointer()
	inv_field_sort.event ue_lbuttonup( ldw_this, dwobject )
END IF

end event

event constructor_settran;is_tran = SQLCA // default tran
//is_tran = gnv_appman.i_tran[1] 

end event

event ue_dragdrop_sel_drop_commit();commit ;
end event

event ue_dragdrop_avl_drop_commit();commit ;
end event

event ue_dragdrop_refresh();this.retrieve (id_main_id_local ) // default d-d refresh 
end event

event ue_refresh();//refresh on id change –reretrieve data
if id_main_id_local > 0 and ib_identity then 
	this.Retrieve(id_main_id_local) // default refresh
END IF	
end event

event ue_get_identity();if not isValid(is_tran) then is_tran = SQLCA
		
SELECT GET_IDENTITY(:is_id_table) INTO :id_last_id FROM dummy 
USING is_tran;

IF id_last_id <=0 then
	MessageBox('VZT IDENTITY ERROR', "ue_insert_new: Failed to get Identity for table "+ is_id_table )
END IF
		

end event

event ue_setrand(long al_row);if ib_dorand then
	long 	ll_row 
	string	ls_rand
	
	If al_row > 0 then 
		ll_row = al_row
	Else
		ll_row = this.GetRow()
		If ll_row > 0 then 
			is_rand = f_random_string(10) 
			this.SetItem( ll_row, 'rand', ls_rand) 
		END IF
	END IF
	
end if


end event

event ue_search_replace_args(ref string as_sql);// Replace any args with literals 

end event

event ue_audit_get_stamp(long al_row);If ib_audit and not ib_no_audit then 
	string ls_msg 	
	
	this.SetItem( al_row, 'last_update_dte', f_sysdate() )
	this.SetItem( al_row, 'last_update_by',  gnv_appman.id_userid ) 

	ls_msg 	=this.event ue_audit_get_msg ()
	this.SetItem( al_row, 'audit_msg',  ls_msg)
end if
end event

event type string ue_audit_get_msg();return '*'
end event

public function integer search (string as_append);string			ls_coltype, ls_colname, ls_col_dbname, ls_cond, ls_colvalue, ls_newsql
long			ll_where_pos, ll_order_pos, ll_group_pos, ll_rc, ll_insertion
string			col_string, ls_search_cond, ls_search_connector , ls_sql_1, ls_sql_2, ls_sql , ls_1stconnect
date			ld_coldate
datetime		ldt_coldt 
long 			ll_rows // search rows returned


If NOT ib_search_again THEN 
//===========================================
if this.acceptText() <> 1 then return -2
_NewSearchInprogress = false 
if this.setRow(1) <> 1 then return -1
this.SetRedraw(false)

if is_orig_sql='' then is_orig_sql= this.getSQLSelect() // remember original dw SQL statement 
ls_sql = is_orig_sql

// find keyword positions 
ll_where_pos 	= Pos(UPPER(ls_sql), " WHERE " ) 	
ll_group_pos	= Pos(UPPER(ls_sql), "GROUP BY")
ll_order_pos	= Pos(UPPER(ls_sql), "ORDER BY")

// make sure we append to the correct place depending on the keywords used in the statement
If ll_where_pos > 0 then 
	If ll_group_pos > 0 then 
		ls_sql_1 = MID( ls_sql, 1, ll_group_pos - 1 ) 
		ls_sql_2	= MID( ls_sql, ll_group_pos, LEN(ls_SQL) ) 
	ELSE
		If ll_order_pos > 0 then 
			ls_sql_1 = MID( ls_sql, 1, ll_order_pos - 1 ) 
			ls_sql_2	= MID( ls_sql, ll_order_pos, LEN(ls_SQL) ) 
		ELSE
			//straight where , no group or order 
			ls_sql_1 = ls_sql 
			ls_sql_2	= ''
		END IF 
	END IF 
ELSE 
	// no where 	
	If ll_group_pos > 0 then 
		ls_sql_1 = MID( ls_sql, 1, ll_group_pos - 1 ) + ' WHERE 1=1 ' 
		ls_sql_2	= MID( ls_sql, ll_group_pos, LEN(ls_SQL) ) 
	ELSE
		If ll_order_pos > 0 then 
			ls_sql_1 = MID( ls_sql, 1, ll_order_pos - 1 ) + ' WHERE 1=1 ' 
			ls_sql_2	= MID( ls_sql, ll_order_pos, LEN(ls_SQL) ) 
		ELSE
			// no where default to no group or order 
			ls_sql_1 = ls_sql + ' WHERE 1=1 '
			ls_sql_2	= ''		
		END IF 
	END IF 	
END IF 

long ll_s, ll_max_search, ll_table_pos

ll_max_search = UpperBound( is_searchable[]) 
If ll_max_search <= 0 then 
	is_searchable[] =  is_editable[]
	ll_max_search = UpperBound( is_searchable[]) 
END IF 

ls_search_connector 	= ''
ls_search_cond			= ''
FOR ll_s = 1 TO ll_max_search 
	ls_colname 		=  is_searchable[ ll_s ]
	If IsNull(ls_colname ) or trim(ls_colname ) = '' then continue 
	ls_coltype 		= Upper(this.describe(ls_colname  + ".coltype"))
	ls_col_dbname 	= Upper(this.describe(ls_colname  + ".dbname" ))
	ll_table_pos	= Pos(ls_col_dbname, ".")
	if ll_rc <> 0 then ls_col_dbname = '"' + Mid(ls_col_dbname, 1, ll_table_pos - 1) + '"."' + Mid(ls_col_dbname, ll_rc +1) + '"'

	setNull(ls_cond)
	
	if isNull(ls_coltype) OR isNull(ls_col_dbname) or & 
	 	ls_coltype = "?" OR ls_coltype = "!" OR ls_col_dbname = "?" OR ls_col_dbname = "!" then
		MessageBox("Search Describe Error", "Column="+ ls_coltype + ", DBNAME="+ ls_col_dbname)
		continue
	end if

	CHOOSE CASE ls_coltype
	CASE "DATE"
		ld_coldate	= this.getItemDate(1, ls_colname)
		if isNull(ld_coldate ) then continue
		IF is_tran.dbms = 'ODBC' then 
			ls_colvalue = string (ld_coldate , "yyyy-mm-dd" )
			ls_cond = "(" + ls_col_dbname + " BETWEEN {ts '"+ls_colvalue+" 00:00:00.000000'} AND {ts '"+ls_colvalue+" 23:59:59.777000'})" 
		ELSEIF MID(is_tran.dbms, 1,3) = 'ORA' then
			ls_colvalue = string ( ld_coldate, "mm/dd/yyyy" )
			ls_cond = "(" + ls_col_dbname + " = TO_DATE('" + ls_colvalue + "', 'MM/DD/YYYY'))" // ORACLE 
		ELSE
		END IF 

	CASE "DATETIME"
		ldt_coldt = this.getItemDateTime(1, ls_colname)
		if isNull(ldt_coldt ) then continue
		IF is_tran.dbms = 'ODBC' then 
			ls_colvalue = string ( ldt_coldt, "yyyy-mm-dd" )
			ls_cond = "(" + ls_col_dbname + " BETWEEN {ts '"+ls_colvalue+" 00:00:00.000000'} AND {ts '"+ls_colvalue+" 23:59:59.777000'})" 
		ELSEIF MID(is_tran.dbms, 1,3) = 'ORA' then
			ls_colvalue = string ( ldt_coldt, "mm/dd/yyyy" )
			if isNull(ls_colvalue ) then continue
			ls_cond = "( "+ls_col_dbname+" BETWEEN TO_DATE('"+ls_colvalue+"', 'MM/DD/YYYY') AND TO_DATE('"+ls_colvalue + "', 'MM/DD/YYYY')+1 )" // oracle
		ELSE
		END IF 
			
	CASE "NUMBER", "LONG"
		ls_colvalue = string( this.getItemNumber(1, ls_colname))
		if isNull(ls_colvalue ) then continue
		ls_cond = "(" + ls_col_dbname + " = " + ls_colvalue + ")"
		
	CASE ELSE
		if Pos(ls_coltype, "CHAR") <> 0 then
			col_string = Trim(this.getItemString(1, ls_colname))
			if isNull(col_string) or Len(col_string) <= 0 then continue

			col_string = f_replace ( col_string, "'", "''") 
			
			string ls_upper, ls_upper_end					// vz 2004-01-29
			ls_upper = '' 										// vz 2004-01-29
			ls_upper_end = '' 								// vz 2004-01-29
			if is_search_case = 'N' then 					// vz 2004-01-29
				col_string = upper( col_string) 			// vz 2004-01-29
				ls_upper = ' upper( ' 						// vz 2004-01-29
				ls_upper_end = ' ) '							// vz 2004-01-29
			end if
			if  is_auto_like = 'Y' then col_string += '%' 
			
			if Pos(col_string, "%") <> 0 OR Pos(col_string, "_") <> 0 then
				ls_cond = "( "+ls_upper + ls_col_dbname + ls_upper_end + " LIKE '" + col_string + "')" // vz 2004-01-29
			else
				ls_cond = "( "+ls_upper + ls_col_dbname + ls_upper_end + " = '" + col_string + "')"     // vz 2004-01-29
			end if
		
			// If quoted string is passed treat it as "IN" list and parse it - VZ
			string ls_col_orig, ls_in_clause, ls_connector 
			int    li_pos
			ls_col_orig = trim(col_string)
			if Mid( ls_col_orig , 1, 1) = "'" and Mid( ls_col_orig , len( ls_col_orig ), 1) = "'" then
				ls_col_orig = Mid( ls_col_orig , 2, len( ls_col_orig)-2) // strip quotes
				ls_in_clause = " IN (" 
				ls_connector = " '"
				DO WHILE POS( ls_col_orig , ",") > 1
					li_pos = POS( ls_col_orig , ",")
					ls_in_clause = ls_in_clause + ls_connector + MID(ls_col_orig, 1, li_pos - 1) +"' "					
					ls_connector = ", '" 					
					If Len( ls_col_orig ) > li_pos then 
						ls_col_orig = MID(ls_col_orig, li_pos + 1) 
					Else
						ls_col_orig =''
					End If
				LOOP
				If ls_col_orig <> '' then
					ls_in_clause = ls_in_clause + ls_connector + ls_col_orig +"' "
				End If
				ls_in_clause = ls_in_clause + " ) "		
				if is_search_case = 'N' then ls_in_clause = UPPER( ls_in_clause) 
				ls_cond =   "( " + ls_col_dbname + ls_in_clause  + " )" 
			End If
			
		elseif Pos(ls_coltype, "DECIMAL(0)") <> 0 then
			ls_colvalue = string( this.getItemNumber(1, ls_colname))
			if isNull(ls_colvalue) then continue
			ls_cond = "(" + ls_col_dbname + " = " + ls_colvalue + ")"
			
		elseif Pos(ls_coltype, "DECIMAL") <> 0 then
			ls_colvalue = string( this.getItemDecimal(1, ls_colname))
			if isNull(ls_colvalue) then continue
			ls_cond = "(" + ls_col_dbname + " = " + ls_colvalue + ")"
		else
			continue // ignore all other types like TIME etc.
		end if
	END CHOOSE

	if f_nvl(ls_cond,'')='' then continue
	ls_search_cond = ls_search_cond + ls_search_connector + ls_cond
	ls_search_connector = ' AND '
NEXT

If f_nvl(ls_search_cond,'') <> '' then 
	ls_newsql = ls_sql_1 + ' AND ' + ls_search_cond + ' ' + ls_sql_2 
ELSE
	ls_newsql = ls_sql_1 + ' ' + ls_sql_2 
END IF 

if Len(as_append) > 0 then  ls_newsql = ls_newsql + " " + as_append

If gnv_appman.is_debugmode = 'Y' then 
	f_vzt_Clipboard( ls_newsql ) // uses global f-n and not dw function !!!!! 
	MessageBox('DEBUG: dw search','Search SQL (copied to clipboard):~r~n' + ls_newsql )
END IF

ls_newsql = f_replace( ls_newsql , "/*:*/'admin'" , 		"'"+gnv_appman.is_admin+"'") 			// access controls 
ls_newsql = f_replace( ls_newsql , "/*:*/'supervisor'" , 	"'"+gnv_appman.is_supervisor+"'")	// access controls 
ls_newsql = f_replace( ls_newsql , "/*:*/9999" , 			string( gnv_appman.id_userid))  		// access controls 

If POS( ls_newsql , ':' ) > 0 then 
	this.event ue_search_replace_args (ls_newsql ) 
END IF
//===============================================================
ELSE 		// last search repeat 
	ls_newsql = is_last_search_SQL
END IF 	// last search repeat 

if this.setSQLSelect( ls_newsql ) <> 1 then
	f_vzt_Clipboard(ls_newsql) // uses global f-n and not dw function !!!!! 
	messageBox("Search New SQL Error", ls_newsql)
	this.SetRedraw(true)
	return -10
end if

ll_rc = this.EVENT ue_preretrieve_on_search( ls_newsql)
If ll_rc < 0 then 
	this.SetRedraw(true)
	return -20
End If

is_last_search_SQL = ls_newsql 
ll_rows = this.Retrieve()

If gnv_appman.is_debugmode = 'Y' then 
	MessageBox('DEBUG: dw search','Search...Retrieve() returned: ' + string(ll_rows ) )
END IF

this.RefreshDataObject()
if ib_poweredit then 
	ll_rc = this.modifyedit ("W") 
Else
	ll_rc = this.modifyedit ("R") 
END IF 

this.SetRedraw(true)
this.setFocus()

ib_search_again = false

return ll_rows 

end function

public function integer modifyedit (string as_parm);string		ls_colexpr, ls_expr , ls_rc , ls_visible, ls_bg_spec, ls_bg_expr 
long		ll_editcol, ll_maxeditcol, ll_rc
string		ls_title, ls_col ,   ls_array[]
long 		ll_s, ll_maxs, ll_e, ll_maxe

ls_title = "Datawindow Mode Change"
as_parm 	= Upper(MID(as_parm, 1, 1))
is_editmode = as_parm

this.setRedraw(FALSE)

ll_maxs = UpperBound( is_searchable[])
ll_maxe = UpperBound( is_editable[])

ls_array[]		= is_editable[]
ll_maxeditcol 	= UpperBound( is_editable[])

CHOOSE CASE as_parm
	CASE "R" // READ (PROTECTED) 
		ls_colexpr = ".background.color='" + readBGcolor + "'"  
		If _set_bg_opaque_on_search then // make sure background is set when required 
			ls_bg_spec = ".background.mode='1'" // make transparent for read
		End If
		this.Object.Datawindow.readonly="YES" // set the whole dw just in case
	CASE 'W','E' // "W" write mode or edit mode - use as synonims 
		ls_colexpr = ".background.color='" + writeBGcolor + "'"  
		If _set_bg_opaque_on_search then // make sure bg is visible on search 
			ls_bg_spec = ".background.mode='1'" // make transparent for EDIT 
		End If
		this.Object.Datawindow.readonly="NO" 
	CASE "S" // SEARCH 
		ls_colexpr = ".background.color='" + searchBGcolor  + "'"    
		If _set_bg_opaque_on_search then // make sure background is set when required 
			ls_bg_spec = ".background.mode='0'" // make opaque 
		End If
		this.Object.Datawindow.readonly="NO" 
		ls_array []		= is_searchable[]
		ll_maxeditcol 	= UpperBound( is_searchable[])
END CHOOSE

IF ll_maxeditcol <= 0 then 
	this.setRedraw(true)
	Return 0 
END IF 

FOR ll_editcol = 1 to ll_maxeditcol 
 	ls_expr = ls_array[ll_editcol] + ls_colexpr
	 
	If _set_bg_opaque_on_search then ls_bg_expr = ls_array[ll_editcol] + ls_bg_spec 
	ls_visible = f_nvl(trim( this.Describe( ls_array[ll_editcol]+".visible")),'**')
	if MID( ls_visible + '*', 1, 1) = '"' then ls_visible = MID( ls_visible + '**', 2, 1)
	
	If ls_visible = '1' then // only do things for visible columns 
		ls_rc = this.modify( ls_expr )	
		if ls_rc <> "" then
			messageBox(ls_title, "Invalid column expression:~r~n"+ls_expr )
			this.setRedraw(TRUE)
			return -10
		end if
		If _set_bg_opaque_on_search then this.modify( ls_bg_expr )	

		if as_parm = "W" or as_parm = 'E' or as_parm = 'S' then	// unprotect fields for data entry
			ll_rc = this.setTabOrder(ls_array[ll_editcol], ll_editcol) 
			if ll_rc < 0 then
				messageBox(ls_title, "Set tab failed:"+ls_array[ll_editcol]+','+string( ll_editcol) )
				this.setRedraw(TRUE)
				return -10
			end if
			
			//=====================================================
			// Protect searchable cols that are not in editable array on W, E =
			//=====================================================
			if as_parm = "W" or as_parm = 'E' then
				boolean lb_found
				FOR ll_s = 1 to ll_maxs 
					lb_found = false
				 	ls_col = is_searchable[ll_s]  
					FOR ll_e = 1 to ll_maxe
						If is_editable[ll_e] = ls_col then 
							lb_found = true
						end if
					NEXT 
					If not lb_found then 
						ll_rc = this.setTabOrder(ls_col, 0) // protect col. via tab rather than displayonly
						if ll_rc < 0 then				
							messageBox(ls_title, "modifyedit: Reset searchable taborder failed on "+ls_col)
							this.setRedraw(TRUE)
							return -11
						end if
					End if 
						
				NEXT // all searchable cols
			end if
			//=====================================================
			
		else
			// reset tabs for read only
			ll_rc = this.setTabOrder(ls_array[ll_editcol], 0) // protect col. via tab rather than displayonly
			if ll_rc < 0 then				
				messageBox(ls_title, "Reset tab failed")
				this.setRedraw(TRUE)
				return -10
			end if
		end if
	end if // column visible 		
NEXT

this.ResetUpdate()
this.setRedraw(TRUE)
return 1

end function

public subroutine refreshdataobject ();
if _resetdataobjectonselect then 
	// refresh dataobject and keep the data
	ids_copy = CREATE Datastore
	ids_copy.dataobject 		= this.dataobject 
	if this.RowCount() > 0 then
		ids_copy.object.data = this.object.data 
	End If

	this.dataobject = ids_copy.dataobject 
	this.Settransobject(SQLCA)
	if ids_copy.RowCount() > 0 then
		this.object.data 	= ids_copy.object.data 
		this.ResetUpdate()
		this.SetItemStatus( 1, 0, Primary!, NotModified!)
	End If 
	DESTROY ids_copy 
	this.event ue_setshares()
	this.event ue_setmasks()
End IF


end subroutine

public function integer newsearch ();this.reset() 
long ll_row
ll_row = this.insertRow(0) 

this.modifyedit ("S")

long 				ll_colcount, ll_col, ll_max
datawindow 	ldw_this
string 			ls_editstyle, ls_status, ls_coltype 

ldw_this 		= this 

ll_colcount = long( this.Object.DataWindow.Column.Count )
if _SetNullonNewSearch then this.uf_setNull ( ldw_this ,1, 1, 1, ll_colcount )

If _ResetMaskOnSearch then 
	_NewSearchInprogress = true 
	ll_max = UpperBound(	is_searchable[])
	If ll_max <= 0 then return 0 
	For ll_col = 1 to ll_max  
		ls_status 		= ldw_this.Describe(is_searchable[ll_col] + ".Name") 
		ls_editstyle 	= ldw_this.Describe(is_searchable[ll_col] + ".Edit.Style") 
		ls_coltype 		= upper(trim( ldw_this.Describe(is_searchable[ll_col] + ".Coltype"))) + 'XXXXX' 
		If upper(ls_editstyle) = 'EDITMASK' then 
			If mid(ls_coltype, 1, 3) = 'DEC' or mid(ls_coltype, 1, 4) = 'DATE' then 
				// skip it for the above types 
			ELSE
				// reset edit mask for freeform data entry on search
				ls_status = ldw_this.Modify(is_searchable[ll_col] + ".EditMask.mask='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'") 
			End If
		End If
		If upper(ls_editstyle) = 'EDIT' then 		
			ls_status = ldw_this.Modify(is_searchable[ll_col] + ".Edit.Limit=0") 	
			ls_status = ldw_this.Modify(is_searchable[ll_col] + ".Edit.Required=No") 					
			ls_status = ldw_this.Modify(is_searchable[ll_col] + ".Edit.AutoHScroll=Yes") 											
		End If
	Next 
End If

this.ResetUpdate() // erase any possible changes
this.setFocus()
return 1

end function

public function integer uf_setnull (ref datawindow adw_target, long al_srow, long al_scol, long al_erow, long al_ecol);string 	ls_null, ls_coltype
long 		ll_col, ll_maxcol , ll_null, ll_row
decimal	ld_null
date 		ldt_null
time 		lt_null
datetime ldtm_null

SetNull( ls_null)
SetNull( ll_null)
SetNull( ld_null)
SetNull( ldtm_null )
SetNull( ldt_null )

FOr ll_row= al_srow  to al_erow
 FOr ll_col= al_scol  to al_ecol
	ls_coltype = trim( adw_target.Describe("#"+ string( ll_col ) + ".Coltype")) + 'xxxxx' 
	CHOOSE CASE mid(ls_coltype, 1, 5) 
	CASE 'char('
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ls_null
	CASE 'longx'
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ll_null		
	CASE 'ulong'
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ll_null		
	CASE 'realx'
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ld_null		
	CASE 'decim'
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ld_null		
	CASE 'numbe'
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ll_null
	CASE 'datex'
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ldt_null
	CASE 'datet'		
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = ldtm_null
	CASE 'timex'		
		adw_target.object.data[ ll_row, ll_col, ll_row, ll_col] = lt_null
	CASE ELSE

	END CHOOSE
 next
next

return 1
end function

public function integer search_again ();long ll_rc 
If LEN(is_last_search_SQL ) <= 0 then return 0

this.RefreshDataObject()

ll_rc = this.setSQLSelect( is_last_search_SQL ) 
if ll_rc <> 1 then
	messageBox("Search Again New SQL Error", is_last_search_SQL )
	// return -2
end if

ll_rc = this.modifyedit ("READ") 
If ll_rc < 0 then return -10

ll_rc = this.EVENT ue_preretrieve_on_search( is_last_search_SQL)
If ll_rc < 0 then return -20

ll_rc = this.Retrieve()
this.setFocus()

return 1

end function

public subroutine of_setfieldsort (boolean ab_set);if ab_set then 
	inv_field_sort = CREATE n_cst_dw_field_sort 
	inv_field_sort.idw_requestor_dw	= this
ELSE
	If IsValid( inv_field_sort ) then destroy inv_field_sort 
END IF
end subroutine

public function integer uf_validaterequired ();long ll_ret, ll_req_count
datawindow ldw_this
integer li_column, li_update_dw 
string  ls_colname , ls_visible

ldw_this = this
// make sure all required columns in ALL updateable dw's are filled in
ll_req_count = upperbound( this.is_required[] )
if  ll_req_count <= 0 then return 1
	For li_column = 1 to ll_req_count
		ls_colname = this.is_required[ li_column] 
		If not IsNull( ls_colname) and trim(ls_colname) <> '' then 
			ls_visible = trim( this.Describe( ls_colname+".Visible" ))
			If ls_visible = '1' then 
				If f_is_column_null( 1, ls_colname, ldw_this) then 
					this.modify( ls_colname+".Background.Color='"+ STRING(RGB(255,255,0))+ "'")
					ll_ret = -1
				ELSE
					this.modify( ls_colname+".Background.Color='"+ STRING(RGB(255,255,255)) +"'")
				End If
			End If				//visible
		End If			
	Next

return ll_ret
end function

event clicked;if IsValid(iw_Window) then iw_Window.event ue_date_lookup_end()

if _dragable and row > 0 then 
		this.dragicon = 'Drag1pg.ico'
		this.POST Drag(Begin!)
End If

this.event ue_expl_sort (row, dwo)

If upper(this.object.DataWindow.Print.Preview) = 'YES' then
	this.SelectRow( 0, false) 	// reset selection - because selected rows do not display in preview mode
Else
 CHOOSE CASE _selection_service 
	CASE '' 
	CASE 'S' 		
		If row > 0 then 
			this.SelectRow( 0, false) 
			this.SelectRow( row, true) 
			this.SetRow( row) 
			this.ScrollToRow( row) 			
			this.EVENT ue_rowselected( row, true)
		End IF
	CASE 'M' 
		If row > 0 then 
			long ll_row 
			this.SetRow( row) 
			this.ScrollToRow( row) 			
			
			ll_row = this.GetSelectedRow( row - 1 )
			If ll_row = row then 
				this.SelectRow( row, false) 
				this.EVENT ue_rowselected( row, false)				
			Else
				this.SelectRow( row, true) 
				this.EVENT ue_rowselected( row, true)				
			End IF
	
		End IF
		
 END CHOOSE
End If // pr preview check...

end event

event updatestart;long ll_row , ll_max_row

ll_max_row = this.rowcount() 
If ll_max_row > 0 then 
	For ll_row = 1 to ll_max_row 
		If this.GetItemStatus( ll_row , 0, Primary!) = NewModified! then 
			// update row with the foreign and primary key data 		
			this.event ue_update_keys_on_new ( ll_row ) 
			if ib_dorand then this.event ue_setrand (ll_row) 
		End If 
	Next 
End If 
end event

event sqlpreview;sqlsyntax = sqlsyntax
sqlsyntax = sqlsyntax
end event

event doubleclicked;If ib_graph then
	int li_category, li_series
	IF IsValid( idw_next) THEN					// Is there a datawindow to drill down into?
		this.ObjectAtPointer( is_graphname, li_series, li_category ) // Get the object clicked on
		IF li_category > 0 THEN					// did the user click on a graph element?
			is_category = CategoryName( is_graphname, li_category ) // get the category name
			this.TriggerEvent( "ue_retrievenext" )
		END IF
	END IF
	return 
END IF // end of graph stuff 
//-----------
If row > 0 and row <= this.RowCount() then
	
	If _drop_selected_DW then 
		// delete on double click
		 	int li_rc
		If _dclick_prompt then 
			li_rc = MessageBox(is_rec_name +' Deletion', 'Are you sure you want to delete this '+ is_rec_name + ' record?', question!, YesNo!, 2)
		ELSE
			li_rc = 1
		END IF 	
		If li_rc = 1 then
			If this.event ue_delete_selected( row) > 0 then 
				this.DeleteRow( row) 
			end if	
	   	this.event ue_dragdrop_sel_drop_commit ()
			this.event ue_dragdrop_refresh () // refresh 
	  		if isValid(_dw_dropsource ) then _dw_dropsource.event dynamic ue_dragdrop_refresh () // refresh 
		END IF
	End If

	If _drop_available_DW then 
		// append on double click
		If IsValid( _dw_droptarget) then 
			dragobject ldrag_this
			ldrag_this = this
			_dw_droptarget.event DragDrop( ldrag_this, row, dwo )
		End If			
	End If

End If


end event

event constructor;this.event constructor_settran ()
this.SetTransObject(is_tran )	

if IsValid(gnv_appman) then 
	is_search_case					= f_nvl(gnv_appman.is_search_case,'N') // default search case (Y sens, N no)
else 
	is_search_case					= 'N'
end if

is_auto_like					= 'Y'
is_sortedborder 				= "6"

ib_poweredit					= false
_SetNullonNewSearch 			= true
_ResetMaskOnSearch 			= false
_ResetDataObjectOnSelect 	= false
_dragable 						= false
_dropable 						= false
_dragdrop_auto 				= false // built in d-d 
_drop_selected_DW 			= false // selected options
_drop_available_DW 			= false // available options
_set_bg_opaque_on_search 	= false // set bg mode to opaque on search (useful with bitmap forms like HCFA for EMG)
_selection_service = ''  // 'S' single, 'M' - multi
// ist_x_of_y = st_numentries // uncomment in the descendant for row counter text

// Uncomment these lines in the descendant if you want to update dw via SAVE btn.
//------------------------------------------
//ii_updatable_count = ii_updatable_count + 1 
//idw_updateable[ ii_updatable_count] = this 

if IsValid( gnv_appman) then 
	readBGcolor 	= gnv_appman.ReadBGcolor
	writeBGcolor	= gnv_appman.writeBGcolor
	reqBGcolor		= gnv_appman.reqBGcolor
	searchBGcolor	= gnv_appman.searchBGcolor
	if gnv_appman.inv_language.is_language_multi = 'Y' then this.event ue_localize()
	 
Else
	readBGcolor = string( RGB( 192,192,192) )
	writeBGcolor= string( RGB( 255,255,255) )
	reqBGcolor	= string( RGB( 255,255,180) )
	searchBGcolor= string( RGB( 255,200,200) )
	
END IF 
this.event ue_setmasks()

//is_editable[]	={''}
//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}
//is_searchable[]	={''}

//this.of_setfieldsort( true) 
//this.inv_field_sort.of_setcolumn( colname, 'expr1', 'expr flip')
this.event post constructor_post ()
end event

event itemchanged;// accept validation errors on SQL search strings 
If _NewSearchInprogress then return 0

If ib_audit and NOT ib_no_audit then
	this.event ue_audit_get_stamp ( row ) 
END IF 
end event

event itemerror;// accept validation errors on SQL search strings 
If _NewSearchInprogress then return 2


end event

event rbuttondown;if ib_graph then 
	this.event ue_gr_rbuttondown (xpos, ypos, row, dwo)
	return 
end if 


end event

event retrieveend;If IsValid( ist_x_of_y ) then 
	ist_x_of_y.Text = string( this.GeTRow() ) + " of " + string(this.rowCount()) 
End If
If _selection_service = 'S' AND this.GetRow() = 1 Then this.selectrow( 1, true) 
	
end event

event rowfocuschanged;If IsValid( ist_x_of_y ) then 
	ist_x_of_y.Text = string(currentrow) + " of " + string(this.rowCount())
End If

end event

event dragwithin;if _dropable then
		this.is_ddicon_on_entry = source.dragicon 
		this.dragicon = 'Drop1pg.ico'
end if
end event

event dragleave;if _dropable then
		source.dragicon = this.is_ddicon_on_entry 
		//this.dragicon = 'Drop1pg.ico'
end if
end event

event destructor;If IsValid( inv_field_sort) then DESTROY inv_field_sort

end event

on uo_vzt_dwbase.create
end on

on uo_vzt_dwbase.destroy
end on

event dragdrop;if not _dragdrop_auto then return 
datawindow ldw_source 
long ll_source_row, ll_row, ll_sort
string 	ls_expr, ls_practiceid, ls_locationid, ls_request = 'ADD'

if  not _dropable then return 
ldw_source = source 
If IsValid( ldw_source ) then 
	// =================================================
	if ldw_source.dataobject = is_drag_src_do  then // 'd_parts_list_vavail' 
		ll_source_row = ldw_source.GetSelectedRow( 0) 
		ll_sort = this.RowCount() + 1
		DO WHILE ll_source_row > 0 

			id_source_id = ldw_source.GetItemNumber ( ll_source_row , is_drag_src_idcol) 
			ls_expr = is_drag_trg_idcol + " = " + string( id_source_id) 
			
			if this._drop_selected_DW then  
				// check if already there
				If this.Find( ls_expr , 0, this.RowCount() ) = 0 then // assign only if not exist already 
			 	  this.event ue_dragdrop_sel_drop_sql ( ll_source_row)
				end if // find
			else	  // drop on availlable  
	 		  this.event ue_dragdrop_avl_drop_sql ( ll_source_row)
			End if				
			If ll_source_row < ldw_source.RowCount() then 
				ll_source_row = ldw_source.GetSelectedRow( ll_source_row) // get next selected
			ELSE
				ll_source_row = 0
			END IF 
			ll_sort += 10
		LOOP // while rows selected 
		
		// Refresh accordingly 
		if this._drop_selected_DW then  
		  this.event ue_dragdrop_sel_drop_commit ()
		else
		  this.event ue_dragdrop_avl_drop_commit ()
		END IF 
	  	this.event ue_dragdrop_refresh () // refresh 
	  	source.event dynamic ue_dragdrop_refresh () // refresh 
	
	End If
	ldw_source.SelectRow( 0, false) // reset all selections
End If // valid source
end event

event buttonclicked;if row <= 0 or row > this.rowcount() then return

string ls_colname , ls_lookupprocessor ,ls_newvalue 
st_lookup_ret lst_ret
window  lw_processor
st_lookup_parm   lst_parms
datetime ldt_temp
integer		li_x, li_y 
uo_vzt_dwbase ldw	

ldw = this

if POS(dwo.name, '_ddlk') > 0 then
	If IsValid(iw_Window) then
		ls_colname = MID( dwo.name, 1, LEN(trim(string(dwo.name)))-5)  
		li_x = integer(this.Describe(ls_colname+".X")) + this.x  
		li_y = integer(this.Describe(ls_colname+".y")) + this.y + integer(this.Describe(ls_colname+".height")) 
		iw_Window.event ue_date_lookup_start(ldw, ls_colname, li_x,li_y) 
	END IF
end if 


if dwo.name = 'b_website' then
	//display website
	if this.GetItemString( row, "type") = "WEBSITE" then
		gnv_appman.uf_goto_url ( this.GetItemString( row, "address") )
	end if
end if

if dwo.name = 'b_email' then
	gnv_appman.uf_start_mail()
	int li_ret
	li_ret = 1
//		if not gnv_appman.inv_mail.ib_logged_on then 
//			li_ret = gnv_appman.inv_mail.uf_mail_logon() 
//			If li_ret = 1 then 
//		//		MessageBox('Batch Schedule Mail Logon', 'Logon Successful' ) 
//			ELSE
//				MessageBox('Mail Logon', 'Logon Failed' ) 
//			END IF
//		END IF	
		string ls_name[], ls_email[], ls_attach[]
		ls_name[1] 	= ''
//		ls_attach[]	= {''}
		ls_email[1] = trim(this.GEtItemString(row, "email"))
		gnv_appman.inv_mail.uf_mail_send('','',ls_name[],ls_email,ls_attach)
//		gnv_appman.inv_mail.uf_mail_send_no_logon('','',ls_name,ls_email,ls_attach)
		li_ret = gnv_appman.inv_mail.uf_mail_logoff() 
		// use templates later 
	
end if
//=============================================================
// date  lookups
//=============================================================
if POS(dwo.name, '_dlk') > 0 then
 	 
	ls_colname = dwo.name
	ls_colname = f_replace(ls_colname, '_dlk','') 
	is_editcol = ''	

	this.POST SetFocus()
	this.POST SetColumn( ls_colname )
	ls_lookupprocessor 	= 'w_vzt_calendar'
	lst_parms.parmvalue = string( this.GetItemDateTime(row, ls_colname),"yyyy mmm dd" )
	OpenWithParm(lw_processor, lst_parms, ls_lookupprocessor )
	lst_ret = message.PowerObjectParm
	ls_newvalue = lst_ret.newvalue
	If ls_newvalue =  "CANCEL" then
   	 return
	Else
		ldt_temp = datetime( date( ls_newvalue ), time("00:00 AM") )
	   this.SetItem( row, ls_colname, ldt_temp ) 
		is_editcol = ls_colname
		this.event POST ue_validate_page()
	End If
end if

//colors 

if POS(dwo.name, '_clr') > 0 or POS(dwo.name, '_cln') > 0 then

	ls_colname = MID( dwo.name, 1, LEN(trim(string(dwo.name)))-4)  
	
	this.POST SetFocus()
	this.POST SetColumn( ls_colname )
	
	ls_lookupprocessor 	= 'w_vzt_color'
	if POS(dwo.name, '_clr') > 0 then 
		lst_parms.parmvalue = this.GetItemString(row, ls_colname)
	else
		lst_parms.parmvalue = string(this.GetItemNumber(row, ls_colname))
	end if
	
	OpenWithParm(lw_processor, lst_parms, ls_lookupprocessor )
	ls_newvalue = message.StringParm
	If ls_newvalue =  "CANCEL" then
		 return
	Else
		if POS(dwo.name, '_clr') > 0 then 
		   this.SetItem( row, ls_colname,   ls_newvalue  )
		else
		   this.SetItem( row, ls_colname,  long( ls_newvalue)  )
		End If
	End If
End If




end event

