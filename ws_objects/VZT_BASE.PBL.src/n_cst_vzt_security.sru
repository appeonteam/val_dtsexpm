$PBExportHeader$n_cst_vzt_security.sru
forward
global type n_cst_vzt_security from nonvisualobject
end type
end forward

global type n_cst_vzt_security from nonvisualobject
event type integer ue_refresh ( )
end type
global n_cst_vzt_security n_cst_vzt_security

type variables
datastore	ids_user_rights, ids_group_rights
string 		is_userid, is_groupid, is_supervisor, is_admin
time 			it_last_refresh
long 			il_refresh_seconds=30
transaction	it_tran


end variables

forward prototypes
public function string uf_user_has_rights (string as_object, boolean ab_message)
public function string uf_user_has_rights (string as_object)
public function string uf_user_has_rights (string as_class, string as_object, boolean ab_message)
public function boolean uf_same_group_as (string as_userid2)
public function string uf_get_groupid (string as_userid2)
public function integer uf_settran (ref transaction atran)
public function integer of_enable (long al_userid)
public function string of_check_access (string as_window, string as_control)
public function integer of_check_column_access (ref datawindow adw, string as_window, string as_dw, string as_columns[])
public function string of_check_tab_access (string as_window, ref tab a_tab)
public function string of_create_template (string as_window, ref tab a_tab)
end prototypes

event type integer ue_refresh();long ll_rc	

ll_rc = ids_group_rights.Retrieve( gnv_appman.id_userid)
ll_rc = ids_user_rights.Retrieve( gnv_appman.id_userid)

it_last_refresh = time( f_sysdatet( it_tran) )

SELECT admin, supervisor 
INTO   :is_admin, :is_supervisor 
FROM VZT_USERS
WHERE contact_id = :gnv_appman.id_userid ;

gnv_appman.is_supervisor 	= this.is_supervisor
gnv_appman.is_admin		= this.is_admin

return ll_rc
end event

public function string uf_user_has_rights (string as_object, boolean ab_message);return this.uf_user_has_rights( 'WINDOW', as_object, ab_message)
end function

public function string uf_user_has_rights (string as_object);return this.uf_user_has_rights( 'WINDOW', as_object, false )
end function

public function string uf_user_has_rights (string as_class, string as_object, boolean ab_message);boolean 	lb_has_rights
string 	ls_expr, ls_flags, ls_temp_flags
long		ll_gpermit, ll_grestrict, ll_permit, ll_restrict, ll_rows
lb_has_rights =  false

// For performance: refresh rights every so often but not every time... 
If SecondsAfter( it_last_refresh, time( f_sysdatet( it_tran))) >= il_refresh_seconds then this.event ue_refresh()

ll_rows 		= ids_user_rights.RowCount()
ls_flags =  'R'
// Check user access rights in steps.
// check for global access 
ls_expr 		= " objectclass= '" +UPPER(as_class) +"' AND objectname = '*' AND permissionflag = " 
ll_gpermit	= ids_user_rights.Find( ls_expr+"'1'" , 0, ll_rows ) 
if ll_gpermit	> 0 then 
	ls_temp_flags = trim( ids_user_rights.object.accessflags [ ll_gpermit 	])
	If IsNull( ls_temp_flags ) then ls_temp_flags ='R'
	ls_flags = ls_temp_flags + ls_flags 
	lb_has_rights = true 
End If 

ll_grestrict= ids_user_rights.Find( ls_expr+"'0'" , 0, ll_rows )
if ll_grestrict	> 0 then lb_has_rights = false

// check for group object access 
ls_expr 		= " userid = '"+ is_groupid+ "' AND objectclass = '" +UPPER(as_class)+"' AND objectname = '" + as_object +"' AND permissionflag = " 
ll_permit 	= ids_user_rights.Find( ls_expr+ "'1'", 0, ll_rows )
if ll_permit 	> 0 then 
	ls_temp_flags = trim( ids_user_rights.object.accessflags [ ll_permit 	])
	If IsNull( ls_temp_flags ) then ls_temp_flags ='R'
	ls_flags = ls_temp_flags 
	lb_has_rights = true 
End If

ll_restrict = ids_user_rights.Find( ls_expr+ "'0'", 0, ll_rows )
if ll_restrict > 0 then lb_has_rights = false

// check for user object access /overrides the group rights and flags 
ls_expr 		= " userid = '"+ is_userid+ "' AND objectclass = '" +UPPER(as_class)+ "' AND objectname = '" + as_object +"' AND permissionflag = " 
ll_permit 	= ids_user_rights.Find( ls_expr+"'1'", 0, ll_rows )
if ll_permit 	> 0 then 
	ls_temp_flags = trim( ids_user_rights.object.accessflags [ ll_permit 	])
	If IsNull( ls_temp_flags ) then ls_temp_flags ='R'
	ls_flags = ls_temp_flags 
	lb_has_rights = true 
End If

ll_restrict = ids_user_rights.Find( ls_expr+"'0'" , 0, ll_rows ) 
if ll_restrict > 0 then lb_has_rights = false

If lb_has_rights and IsNull(ls_flags) THEN ls_flags = 'R'
If NOT lb_has_rights AND ab_message THEN MessageBox("Access Security", "You have insufficient rights to '" +as_object +"'", StopSign!)
If NOT lb_has_rights THEN ls_flags = ''

return ls_flags //+ "//" + as_class+ "//" + as_object + "//" + string( ll_rows ) + "//" + is_userid + "//" + is_groupid
end function

public function boolean uf_same_group_as (string as_userid2);boolean lb_answer
string ls_group2 

lb_answer = false
SELECT groupname into :ls_group2 FROM ocmusers WHERE userid = :as_userid2 USING it_tran;
If trim(ls_group2) = trim( is_groupid) then lb_answer = true 

return lb_answer

end function

public function string uf_get_groupid (string as_userid2);string ls_group2 

SELECT groupname into :ls_group2 FROM ocmusers WHERE userid = :as_userid2 USING it_tran;
If IsNull(ls_group2) then ls_group2 = ''
ls_group2 = trim(ls_group2) 

return ls_group2

end function

public function integer uf_settran (ref transaction atran);it_tran = atran 
ids_user_rights.Reset() 
ids_user_rights.dataobject = 'd_permission_list'
ids_user_rights.SetTransObject (it_tran) 
string ls_newsql , ls_rc 
ls_newsql = ids_user_rights.getSQLSelect()
// leave existing WHERE and user argument... add group id
ls_newsql = ls_newsql + " or userid = '" +  is_groupid + "' "
f_replace ( ls_newsql , "'", "~~'" ) 
ls_rc = ids_user_rights.Modify("DataWindow.Table.Select='"+ ls_newsql + "'")
If ls_rc <> '' then
//	MessageBox("Security Initialization Error", "Failed to retrieve user access data", StopSign!)
	HALT
End IF
this.EVENT ue_refresh() 
return 1
end function

public function integer of_enable (long al_userid);long ll_ret

ids_group_rights.dataobject 	= 'd_vzt_user_security_group_info'
ids_user_rights.dataobject  		= 'd_vzt_user_security_info'

ids_user_rights.SettransObject(SQLCA)
ids_group_rights.SettransObject(SQLCA)

ll_ret = ids_group_rights.Retrieve(al_userid)
ll_ret = ids_user_rights.Retrieve(al_userid)

return 1 
end function

public function string of_check_access (string as_window, string as_control);string 	ls_gr_access, ls_user_access, ls_ret, ls_expr, ls_access 
long 		ll_row

ls_ret = ''

// Check group access 
ls_expr = "window='"+as_window+"' AND control='"+as_control+"' "
ll_row = 1 
do while ll_row > 0 and ll_row < ids_group_rights.RowCount() 
	ll_row = ids_group_rights.Find( ls_expr, ll_row, ids_group_rights.RowCount() )	
	IF ll_row > 0 then 
			ls_access = ids_group_rights.GetItemString( ll_row , 'access_create') 
			if ls_access = 'Y' then ls_gr_access = ls_gr_access + 'C'
			ls_access = ids_group_rights.GetItemString( ll_row , 'access_read') 
			if ls_access = 'Y' then ls_gr_access = ls_gr_access + 'R'
			ls_access = ids_group_rights.GetItemString( ll_row , 'access_update') 
			if ls_access = 'Y' then ls_gr_access = ls_gr_access + 'U'
			ls_access = ids_group_rights.GetItemString( ll_row , 'access_delete') 
			if ls_access = 'Y' then ls_gr_access = ls_gr_access + 'D' 
			ll_row ++ 
	END IF
loop

// Check user access 
ls_expr = "window='"+as_window+"' AND control='"+as_control+"' "
ll_row = 1 
do while ll_row > 0 and ll_row < ids_user_rights.RowCount() 
	ll_row = ids_user_rights.Find( ls_expr, ll_row, ids_user_rights.RowCount() )	
	IF ll_row > 0 then 
			ls_access = ids_user_rights.GetItemString( ll_row , 'access_create') 
			if ls_access = 'Y' then ls_user_access = ls_user_access + 'C'
			ls_access = ids_user_rights.GetItemString( ll_row , 'access_read') 
			if ls_access = 'Y' then ls_user_access = ls_user_access + 'R'
			ls_access = ids_user_rights.GetItemString( ll_row , 'access_update') 
			if ls_access = 'Y' then ls_user_access = ls_user_access + 'U'
			ls_access = ids_user_rights.GetItemString( ll_row , 'access_delete') 
			if ls_access = 'Y' then ls_user_access = ls_user_access + 'D' 
			ll_row ++ 
	END IF
loop

// MessageBox('access check', 'user: ' + ls_user_access + ', group: ' + ls_gr_access )
ls_ret = ls_gr_access
// specific user access overrides the group
If ls_user_access <> '' then ls_ret = ls_user_access 

return ls_ret 
end function

public function integer of_check_column_access (ref datawindow adw, string as_window, string as_dw, string as_columns[]);	// For all the columns in the parms check what access is and 
// set protect if R/O or make invisibe if no access at all 
long 		ll_col
string 	ls_access, ls_object

For ll_col = 1 to UpperBound(as_columns)  
	If as_dw = 'tableids' then 
		ls_object = 'tableids' 
	ELSE
		ls_object = as_dw+'.'+as_columns[ll_col] 
	END IF
	
	ls_access = this.of_check_access(as_window, ls_object )
	
	if pos(ls_access, 'R') <= 0 and pos(ls_access, 'U') <= 0 then 
		adw.Modify(as_columns[ll_col] + ".Visible='0'")		// make invisible if no Read
	end if
	
	if pos(ls_access, 'U') <= 0 then 
		adw.Modify(as_columns[ll_col] + ".Background.Color='"+string(RGB(148,165,115))+"'")		// make R/O if no Write 
//		adw.Modify(as_columns[ll_col] + ".Background.Color='"+string(RGB(155,198,165))+"'")		// make R/O if no Write 
//		adw.Modify(as_columns[ll_col] + ".Background.Color='"+string(RGB(200,200,200))+"'")		// make R/O if no Write 
//		adw.Modify(as_columns[ll_col] + ".Edit.DisplayOnly=Yes" )		// make R/O if no Write 
		adw.SetTabOrder(as_columns[ll_col], 0) 	// make R/O if no Update rights  
	end if
Next

return 1

end function

public function string of_check_tab_access (string as_window, ref tab a_tab);int  				li_tabs 
userobject 		luo
windowobject 	lwo
int 				lidw
datawindow		ldw

string ls_tab_access, ls_tabpage

If gnv_appman.is_admin = 'Y' then return ''

FOR li_tabs = 1 to UpperBound( a_tab.Control[ ]	)
	luo = a_tab.Control[li_tabs ] 
	if Isvalid(luo) then 
		ls_tabpage = luo.Classname()
		ls_tab_access= gnv_appman.inv_security.of_check_access( as_window, ls_tabpage ) 
		If ls_tab_access = '' then
			luo.enabled = false
			luo.visible	= false
		END IF
		
	end if
next
	
return ''
//ClassName	

end function

public function string of_create_template (string as_window, ref tab a_tab);int  				li_tabs 
userobject 		luo
windowobject 	lwo
int 				lidw
datawindow		ldw

string ls_tab_access, ls_tabpage, ls_name, ls_app
		
ls_app = upper( gnv_appman.is_apptitle )

FOR li_tabs = 1 to UpperBound( a_tab.Control[ ]	)
	luo = a_tab.Control[li_tabs ] 
	if Isvalid(luo) then 
		ls_tabpage = luo.Classname()
		ls_name		= '    Tab '+ luo.text 
		INSERT INTO vzt_users_access_template ("object_type", "window", "control", "description", "application" ) 
		VALUES ( 'tabpage',  :as_window, :ls_tabpage, :ls_name, :ls_app) ;
	end if
next
commit;

return ''
//ClassName	

end function

on n_cst_vzt_security.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_vzt_security.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;if isNull(gnv_appman.is_userid) OR isNull(gnv_appman.is_groupid) then
	MessageBox("VZT Security Initialization Error", "Userid and/or groupid not specified.", StopSign!)
	halt
end if

is_userid  = gnv_appman.is_userid
is_groupid = gnv_appman.is_groupid

if IsNull( is_groupid ) then is_groupid = ''

long ll_rows
ids_user_rights 	= CREATE datastore 
ids_group_rights 	= CREATE datastore 

If IsValid(SQLCA) then this.uf_settran( SQLCA) 


end event

event destructor;If IsValid( ids_user_rights ) then DESTROY ids_user_rights 
end event

