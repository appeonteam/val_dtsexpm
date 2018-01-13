$PBExportHeader$n_cst_dbcopy.sru
forward
global type n_cst_dbcopy from nonvisualobject
end type
end forward

global type n_cst_dbcopy from nonvisualobject
end type
global n_cst_dbcopy n_cst_dbcopy

type variables
datastore		ids_data
transaction	itran_from, itran_to
string is_url, is_data //is_dparm, is_key, 
end variables

forward prototypes
public function integer of_init (string as_do, ref transaction atran_from, ref transaction atran_to)
public function integer of_copy (boolean ab_commit)
public function integer of_copy_http (string as_args, boolean ab_commit)
public function integer of_init_http (string as_do, ref transaction atran_to, string as_url)
end prototypes

public function integer of_init (string as_do, ref transaction atran_from, ref transaction atran_to);ids_data.dataobject 		=	as_do  //'d_answers_list'
ids_data.SetTransObject ( atran_from ) 

itran_from	= atran_from
itran_to		= atran_to

// ids_data.Retrieve( ld_gccid ) - must be in the container script
return 1 
end function

public function integer of_copy (boolean ab_commit);int	li_ret
long	ll_maxrow, ll_row

ids_data.SetTransObject ( itran_to)
ll_maxrow = ids_data.RowCount()

FOR ll_row = 1 to ll_maxrow
	ids_data.SetItemStatus( ll_row , 0, Primary!, New!) 
	ids_data.SetItemStatus( ll_row , 0, Primary!, NewModified!) 
NEXT

If ids_data.UPDATE() = 1 then
	if ab_commit then 
		COMMIT USING itran_to;
	end if
	If gnv_appman.is_debugmode = 'Y' then 
		if ab_commit then 
			MessageBox('VZT dbcopy','Update sucessful.Commited. count ='+string(ll_maxrow ))
		Else
			MessageBox('VZT dbcopy','Update sucessful.Commit not requested. count ='+string(ll_maxrow ))
		end if
	END IF
	
ELSE
	ROLLBACK USING itran_to;
	MessageBox('VZT DBCOPY', 'Failed to copy records to target database.', StopSign!)
	li_ret = -10
END IF

return li_ret
end function

public function integer of_copy_http (string as_args, boolean ab_commit);int		li_ret
long		ll_maxrow, ll_row
string 	ls_args

is_data = f_vzt_html_get_data( is_url, as_args ) 
If gnv_appman.is_debugmode = 'Y' then
	messagebox("http copy 1 ", is_data)
	Clipboard (is_data)
END IF

If lower(is_data)="incomplete" then 
	return -5
END IF
//messagebox("http copy 3 ", ls_data)
ids_data.SetTransObject ( itran_to)
li_ret = ids_data.ImportString( is_data ) 
If li_ret < 0 then 
	messagebox("http copy 4 Import Failed", "import rc:" + string(li_ret) )
END IF

ll_maxrow = ids_data.RowCount()
FOR ll_row = 1 to ll_maxrow
	ids_data.SetItemStatus( ll_row , 0, Primary!, New!) 
	ids_data.SetItemStatus( ll_row , 0, Primary!, NewModified!) 
NEXT

If ids_data.UPDATE() = 1 then
	if ab_commit then 
		COMMIT USING itran_to;
	end if
	If gnv_appman.is_debugmode = 'Y' then 
		if ab_commit then 
			MessageBox('VZT dbcopy','Update sucessful.Commited. count ='+string(ll_maxrow ))
		Else
			MessageBox('VZT dbcopy','Update sucessful.Commit not requested. count ='+string(ll_maxrow ))
		end if
	END IF
	
ELSE
	ROLLBACK USING itran_to;
	MessageBox('VZT DBCOPY', 'Failed to copy records to target database.', StopSign!)
	li_ret = -10
END IF

return li_ret
end function

public function integer of_init_http (string as_do, ref transaction atran_to, string as_url);ids_data.dataobject 		=	as_do  //'d_answers_list'
ids_data.SetTransObject ( atran_to ) 

itran_to		= atran_to
is_url		= trim(as_url)
//is_dparm		= trim(as_dparm)
//is_key		= trim(as_webkey)
// ids_data.Retrieve( ld_gccid ) - must be in the container script
return 1 
end function

on n_cst_dbcopy.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dbcopy.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_data = CREATE datastore 

end event

event destructor;if isValid(ids_data) then DESTROY ids_data
end event

