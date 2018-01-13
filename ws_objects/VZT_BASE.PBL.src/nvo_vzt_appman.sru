$PBExportHeader$nvo_vzt_appman.sru
forward
global type nvo_vzt_appman from nonvisualobject
end type
end forward

global type nvo_vzt_appman from nonvisualobject
event ue_create_shared_ds ( )
event ue_destroy_shared_ds ( )
event ue_getsysoptions ( )
event type string ue_getuserrights ( string as_object_type,  string as_object )
event type integer ue_dbconnect ( ref transaction a_tran,  boolean ab_issuemessage,  string as_parm )
event ue_dbconnect_getdefault ( ref transaction a_tran )
event ue_dbconnect_getini ( )
end type
global nvo_vzt_appman nvo_vzt_appman

type prototypes
// This lil' ditty gets the path of Win.com and the *.INI's
Function uint GetWindowsDirectoryA( REF STRING WinDir, INT cbSysPath ) library "kernel32.dll" alias for "GetWindowsDirectoryA;Ansi"

//set directory
FUNCTION boolean SetCurrentDirectoryA(ref string cdir) LIBRARY "kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"
end prototypes

type variables
string 	readBGcolor, writeBGcolor, reqBGcolor, searchBGcolor
string 	is_search_case, is_cparm, is_unicode
string		is_debugmode
string 	is_language, is_datemask, is_timemask, is_tempdir,  is_phonemask
string 	is_reportfromsyntax,     is_default_db, is_cmsg
string	is_replace_apostrophe='Y', is_error_email, is_dft_dsn, is_country,  is_support_email

n_cst_vzt_security  	inv_security
double		id_userid
string			is_supervisor, is_admin, is_userid, is_groupid, is_fname, is_lname 
boolean		ib_audit

encoding 	i_encoding , i_encoding_web
string			is_encoding, is_encoding_web
 
uo_vzt_mail			inv_mail
string 				is_mail_subject ,   is_pw

string cScreenSettingpath = ""
string cScreenSettingFile = "ScrnSetting.dat"
string cRoomAllowDup = ""
string cDupCallException=""

n_cst_vzt_language 	inv_language
n_cst_vzt_tran 			i_tran []
window					iw_frame

datastore            		ids_shared[]
string               		is_inipath, is_inifile, is_shared_do[],  is_use_styles
application   			ia_myapp
string               		is_apptitle
date                 		id_last_updated
string               		is_version

string						is_DBMS='ODBC' //default
inet						iinet_base

str_response			istr_response
datastore				ids_styles
string						is_pager_type  

end variables

forward prototypes
public function integer uf_initialize (ref application aa_myapp, string as_commandparm)
public function integer uf_share (ref datastore adw_target, string as_child_col, ref datastore ads_source)
public function integer uf_dbconnect (ref transaction a_tran, boolean ab_issuemessage)
public function integer uf_dbdisconnect (ref transaction a_tran, boolean ab_issuemessage)
public subroutine uf_startsecurity ()
public subroutine uf_startsecurity (ref transaction atran)
public function string uf_get_code_from_display (string as_codecol, string as_dispcol, string as_dispvalue, ref datastore ads_lookup)
public function boolean uf_isreportfromsyntax ()
public function string uf_windir ()
public function integer uf_dbconnect (ref transaction a_tran, boolean ab_issuemessage, string as_parm)
public function string uf_goto_url (string as_url)
public subroutine uf_start_mail ()
public function integer uf_share (ref datawindow adw_target, string as_child_col, ref datastore ads_source)
public function integer uf_share (ref datawindow adw_target, string as_child_col, ref datawindow ads_source)
public subroutine uf_enable_styles ()
public function long uf_find_style (string as_stylename)
end prototypes

event ue_create_shared_ds;long ll_ds, ll_max_ds

ll_max_ds = Upperbound(is_shared_do[])
If ll_max_ds > 0 then
	For ll_ds = 1 to ll_max_ds
		if len( is_shared_do[ll_ds]) > 0 then 
			ids_shared[ll_ds] = CREATE datastore 
			ids_shared[ll_ds].dataobject = is_shared_do[ll_ds]
			ids_shared[ll_ds].SetTransObject( SQLCA)
		End if
	Next
END IF
end event

event ue_destroy_shared_ds;long ll_ds, ll_max_ds

ll_max_ds = Upperbound(ids_shared[])
If ll_max_ds > 0 then
	For ll_ds = 1 to ll_max_ds
		if isValid( ids_shared[ll_ds]) then DESTROY ids_shared[ll_ds]
	Next
END if
end event

event ue_getsysoptions();  SELECT 
			readbgcolor,
			writebgcolor,   
         searchbgcolor,   
         reqbgcolor    ,
			search_case,
			debugmode,
			datemask1,
			datemask2,
			option03,
			reportfromsyntax,
			option16, 
			isnull(phonemask ,''),
			isnull(use_styles ,'N'),
			option17,
			pager_type	,
			unicode ,
			encoding ,
			encoding_web
   INTO 
			:readbgcolor,
			:writebgcolor,   
         :searchbgcolor,   
         :reqbgcolor   ,
			:is_search_case,
			:is_debugmode,
			:is_datemask,
			:is_timemask,
			:is_tempdir,
			:is_reportfromsyntax	,		
			:is_replace_apostrophe,
			:is_phonemask,
			:is_use_styles,
			:is_country,
			:is_pager_type	,
			:is_unicode, 
			:is_encoding,
			:is_encoding_web
    FROM vzt_sysoptions  
   WHERE vzt_sysoptions.id = 1   ;
	
	choose case is_encoding
	case  '1'
		i_encoding = EncodingANSI!
	case  '2'
		i_encoding = EncodingUTF8!
	case  '3'
		i_encoding = 	EncodingUTF16LE! // (default)
	case  '4'
		i_encoding = EncodingUTF16BE!
	case else
		 setnull( i_encoding )
		 is_encoding = ''
	end choose
	
	choose case is_encoding_web
	case  '1'
		i_encoding_web 	= EncodingANSI!
	case  '2'
		i_encoding_web	= EncodingUTF8!
	case  '3'
		i_encoding_web	= 	EncodingUTF16LE! // (default)
	case  '4'
		i_encoding_web	= EncodingUTF16BE!
	case else
		 setnull( i_encoding_web )
		 is_encoding_web = ''
	end choose
	
//f_end_tran0(SQLCA,'vzt_appman,ue_getsysoptions','','dberror:')
end event

event type string ue_getuserrights(string as_object_type, string as_object);if not IsValid(inv_security) then
	uf_startsecurity() 
end if	
return inv_security.uf_user_has_rights( as_object_type, as_object, false )
end event

event type integer ue_dbconnect(ref transaction a_tran, boolean ab_issuemessage, string as_parm);this.uf_dbdisconnect( a_tran, false) 
string ls_msg 
if as_parm = '' then
	//use ini file if no specific dbparm was passed 
	If FileExists ( is_inifile ) then // read from it 
		a_tran.dbms 				= ProfileString( is_inifile, "LOGIN",  "dbms", 			"")
		a_tran.database 			= ProfileString( is_inifile, "LOGIN",  "database", 	"")
		a_tran.servername 		= ProfileString( is_inifile, "LOGIN",  "servername", 	"")
		a_tran.logid				= ProfileString( is_inifile, "LOGIN",  "logid", 		"")
		a_tran.logpass 			= ProfileString( is_inifile, "LOGIN",  "logpass", 		"")
		a_tran.userid 				= ProfileString( is_inifile, "LOGIN",  "userid", 		"")
		a_tran.dbpass 				= ProfileString( is_inifile, "LOGIN",  "dbpass", 		"")
		a_tran.dbparm 				= ProfileString( is_inifile, "LOGIN",  "dbparm", 		"")
		ls_msg 						= ' Used INI file.'
	ELSE
		this.event ue_dbconnect_getdefault( a_tran ) // set default transaction values
		ls_msg 						= ' Used default connection profile.'
	END IF 
ELSEif ISNUMBER(as_parm) then
	//use ini file if no specific dbparm was passed 
	If FileExists ( is_inifile ) then // read from it 
		a_tran.dbms 				= ProfileString( is_inifile, "LOGIN"+as_parm,  "dbms", 			"")
		a_tran.database 			= ProfileString( is_inifile, "LOGIN"+as_parm,  "database", 	"")
		a_tran.servername 		= ProfileString( is_inifile, "LOGIN"+as_parm,  "servername", 	"")
		a_tran.logid				= ProfileString( is_inifile, "LOGIN"+as_parm,  "logid", 		"")
		a_tran.logpass 			= ProfileString( is_inifile, "LOGIN"+as_parm,  "logpass", 		"")
		a_tran.userid 				= ProfileString( is_inifile, "LOGIN"+as_parm,  "userid", 		"")
		a_tran.dbpass 				= ProfileString( is_inifile, "LOGIN"+as_parm,  "dbpass", 		"")
		a_tran.dbparm 				= ProfileString( is_inifile, "LOGIN"+as_parm,  "dbparm", 		"")
		ls_msg 						= ' Used INI file.'
	END IF 
ELSE
	// use explicit parm for additional trans
		a_tran.dbms 				= 'ODBC'
		a_tran.database 			= ''
		a_tran.servername 		= ''
		a_tran.logid				= ''
		a_tran.logpass 			= ''
		a_tran.userid 				= ''
		a_tran.dbpass 				= ''
		a_tran.dbparm 				= as_parm  
		ls_msg 						= ' Used dbparm:' + as_parm
END IF
	
connect using a_tran;

if a_tran.sqlcode <> 0 then
	connect using a_tran;
	if a_tran.sqlcode <> 0 then
		connect using a_tran;
		if a_tran.sqlcode <> 0 then
			If ab_issuemessage then
				messagebox("Connect Error", a_tran.sqlerrtext)
				return -1
			END IF
//			halt
		end if
	end if
end if

//save message for later 
	is_cmsg = '' + &
	'~r~n a_tran.dbms 	='+a_tran.dbms  + &
	'~r~n a_tran.database 	='+a_tran.database + &
	'~r~n a_tran.servername	='+a_tran.servername + &
	'~r~n a_tran.logid	='+a_tran.logid + &
	'~r~n a_tran.logpass 	='+a_tran.logpass + &
	'~r~n a_tran.userid 	='+a_tran.userid + &
	'~r~n a_tran.dbpass 	='+a_tran.dbpass + &
	'~r~n a_tran.dbparm 	='+a_tran.dbparm + &
	'~r~n~r~n'+ ls_msg 

return 1
end event

event ue_dbconnect_getdefault;If POS(is_DBMS, 'ORA') > 0 then 
 	a_tran.dbms 				= "O73 ORACLE v7.3"
	a_tran.database 			= "xxxx"
	a_tran.servername 		= "@TNS:xxxx"
	a_tran.logid				= "xxxx"
	a_tran.logpass 			= "pppp"
END IF 
IF is_DBMS = 'ODBC' then
	a_tran.dbms 				= "ODBC"
	a_tran.database 			= "gcc_demo"
	a_tran.servername 		= ""
	a_tran.logid				= "dba"
	a_tran.userid				= "dba"
	a_tran.logpass 			= "sql"
	a_tran.dbpass 				= "sql"
	If is_dft_dsn = '' then 
		a_tran.dbparm 				= "Connectstring='DSN=gcc_demo'"
	ELSE
		a_tran.dbparm 				= "Connectstring='DSN="+ is_dft_dsn + "'"
	END IF
END IF 

end event

event ue_dbconnect_getini();this.is_inipath = is_cparm			 
if len(this.is_inipath) > 0 then 
	if right( this.is_inipath, 1) <> '\' then this.is_inipath += '\' // add closing slash
end if

// use INI in local directory or command parm, if exists. if not - use the one in WIN DIR
if right( this.is_inipath, 4) <> '.INI' then 
	// allow a path or a full ini file path on command parm
	is_inifile = this.is_inipath + trim(ia_myapp.appname)+".ini"  
else
	is_inifile = this.is_inipath 
end if

If Not FileExists( is_inifile ) Then
	is_inipath = this.uf_windir() 
	is_inifile = this.is_inipath + trim(ia_myapp.appname)+".ini"  
End If

If Not FileExists( is_inifile ) Then
	is_inifile = this.is_inipath + "HE_DTS.ini"  // last resort 
End If

If Not FileExists( is_inifile ) Then
	is_inifile = '' // use default 
End If


end event

public function integer uf_initialize (ref application aa_myapp, string as_commandparm);ia_myapp = aa_myapp

is_cparm			 =	f_nvl(as_commandparm,'') // must have closing slash
this. event ue_dbconnect_getini()

IF gnv_appman.is_apptitle  <> 'VZT Report Viewer' and  & 
	gnv_appman.is_apptitle  <> 'DTS MAXIMO INTERFACE' then 
	if this.uf_dbconnect( SQLCA, true) < 0 then 
		halt
	end if

	this.event ue_getsysoptions()
	setNull(is_userid)
	setNull(is_groupid)

END IF

if this.is_debugmode = 'Y' then 
	MessageBox( ia_myapp.appname + ' DEBUG: Appman. uf_initialize()', 'INI file is: "'+ is_inifile + &
				'", Command Parm: "'+ is_cparm+'"' + &
				'~r~n ue_dbconnect():' + is_cmsg )
end if
is_cmsg = ''
return 1
end function

public function integer uf_share (ref datastore adw_target, string as_child_col, ref datastore ads_source);DataWindowChild ldwc_secondary
integer rtncode

if ads_source.RowCount() = 0 then ads_source.Retrieve()
If IsNUll( as_child_col) or as_child_col = '' then 
	if	ads_source.ShareData( adw_target) <> 1 then MessageBox('VZT Appman Share Error', 'Failed to share "'+ads_source.dataobject+'" to "'+adw_target.dataobject+'"', StopSign!)
ELSE
	rtncode = adw_target.GetChild(as_child_col, ldwc_secondary)
	IF rtncode = -1 THEN 
		MessageBox( "VZT Appman Share Error", "'"+as_child_col+ "' - not a DataWindowChild")
		return -1
	ELSE
		if ads_source.ShareData( ldwc_secondary ) <> 1 then MessageBox('VZT Appman Share Error', 'Failed to share "'+ads_source.dataobject+'" to column "'+ as_child_col +'" in "'+adw_target.dataobject+'"', StopSign!)
	END IF
END IF
return 1
end function

public function integer uf_dbconnect (ref transaction a_tran, boolean ab_issuemessage);// simple local db connect
return this.event ue_dbconnect( a_tran, ab_issuemessage,'') 

end function

public function integer uf_dbdisconnect (ref transaction a_tran, boolean ab_issuemessage);if not isValid( a_tran) then return -2
disconnect using a_tran;

if a_tran.sqlcode <> 0 then
	rollback using a_tran;
	If ab_issuemessage then
		messagebox("Connect Error", a_tran.sqlerrtext)
		return -1
	END IF
END IF
return 1


end function

public subroutine uf_startsecurity ();inv_security =  CREATE n_cst_vzt_security 

end subroutine

public subroutine uf_startsecurity (ref transaction atran);inv_security =  CREATE n_cst_vzt_security 
inv_security.uf_settran( atran) 


end subroutine

public function string uf_get_code_from_display (string as_codecol, string as_dispcol, string as_dispvalue, ref datastore ads_lookup);string 	ls_expr
long		ll_row
ls_expr 	= as_dispcol + ' = "' + as_dispvalue + '"'
ll_row	= ads_lookup.Find ( ls_expr, 1, ads_lookup.RowCount() )

if ll_row <= 0 then 
	MessageBox('VZT Lookup Error', 'Value not found: "'+ as_dispvalue +&
			'~r~nCode column:'+ as_codecol + &
			'~r~nDisplay column:'+ as_dispcol , Exclamation! ) 
			return ''
ELSE
	return f_get_string_value_ds( as_codecol, ll_row, ads_lookup )
END IF 
end function

public function boolean uf_isreportfromsyntax ();If is_reportfromsyntax = 'Y' then 
	return true 
Else
	return false
END IF
end function

public function string uf_windir ();string 	ls_dir
int		ii_len=1024

	ls_dir = Space( ii_len )
	GetWindowsDirectoryA( ls_dir, ii_len )
	ls_dir	= Trim( Upper( ls_dir ) )
	If Right( ls_dir, 1 ) <> "\" Then	ls_dir += "\"

return ls_dir
end function

public function integer uf_dbconnect (ref transaction a_tran, boolean ab_issuemessage, string as_parm);// additional trans connect via as_parm
return this.event ue_dbconnect( a_tran, ab_issuemessage, as_parm) 


end function

public function string uf_goto_url (string as_url);GetContextService("Internet", iinet_base)
iinet_base.HyperlinkToURL(as_url)
return ''
end function

public subroutine uf_start_mail ();if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail
end subroutine

public function integer uf_share (ref datawindow adw_target, string as_child_col, ref datastore ads_source);DataWindowChild ldwc_secondary
integer 	rtncode
long 		ll_rows

if ads_source.RowCount() = 0 then 
	ll_rows = ads_source.Retrieve()
	If ll_rows <= 0 then MessageBox('VZT Share Warning', 'No data found for shared datastore '+ string(f_nvl(ads_source.dataobject,'*unspecified*')), Exclamation!)
END IF
If IsNUll( as_child_col) or as_child_col = '' then 
	ads_source.ShareData( adw_target) 
ELSE
	rtncode = adw_target.GetChild(as_child_col, ldwc_secondary)
	IF rtncode = -1 THEN 
		MessageBox( "Share Error", "'"+as_child_col+ "' - not a DataWindowChild")
		return -1
	ELSE
		ads_source.ShareData( ldwc_secondary ) 
	END IF
END IF
return 1
end function

public function integer uf_share (ref datawindow adw_target, string as_child_col, ref datawindow ads_source);DataWindowChild ldwc_secondary
integer 	rtncode
long 		ll_rows

if ads_source.RowCount() = 0 then 
	ll_rows = ads_source.Retrieve()
	If ll_rows <= 0 then MessageBox('VZT Share Warning', 'No data found for shared datastore '+ string(f_nvl(ads_source.dataobject,'*unspecified*')), Exclamation!)
END IF
If IsNUll( as_child_col) or as_child_col = '' then 
	ads_source.ShareData( adw_target) 
ELSE
	rtncode = adw_target.GetChild(as_child_col, ldwc_secondary)
	IF rtncode = -1 THEN 
		MessageBox( "Share Error", "'"+as_child_col+ "' - not a DataWindowChild")
		return -1
	ELSE
		ads_source.ShareData( ldwc_secondary ) 
	END IF
END IF
return 1
end function

public subroutine uf_enable_styles ();IF not ISvalid(ids_styles) then 
	ids_styles = CREATE DATASTORE
	ids_styles.dataobject = 'd_style_list'
	ids_styles.SetTransObject(SQLCA) 
	If ids_styles.ROwCOunt() = 0 then ids_styles.Retrieve()
END IF 	
end subroutine

public function long uf_find_style (string as_stylename);long ll_row
string lsExpr
ll_row = 0 
IF ISvalid(ids_styles) then 
	lsExpr = 'POS(stname, "'+ as_stylename +'") > 0'
	ll_row = ids_styles.Find( lsExpr, 1, ids_styles.RowCount() ) 
END IF 	
return ll_row
end function

on nvo_vzt_appman.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_vzt_appman.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;// destroy all services
If IsValid( inv_security) 	then DESTROY inv_security
If IsValid( inv_language) 	then DESTROY inv_language
If IsValid( inv_mail) 		then DESTROY inv_mail

this.event ue_destroy_shared_ds()

//clean up

If IsValid( sqlca) 	then 
	disconnect using sqlca;
	if sqlca.sqlcode <> 0 then
		rollback using sqlca;
	end if
end if


end event

event constructor;readbgcolor = readbgcolor // noop for trace 
this.event POST ue_create_shared_ds()
inv_language =  CREATE n_cst_vzt_language
this.event ue_getsysoptions()


end event

