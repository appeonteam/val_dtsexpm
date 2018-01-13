$PBExportHeader$n_cst_vzt_error.sru
forward
global type n_cst_vzt_error from error
end type
end forward

global type n_cst_vzt_error from error
end type
global n_cst_vzt_error n_cst_vzt_error

type variables
long 	il_sqldbcode
string 	is_sqlerrtext
string 	is_sqlsyntax
dwbuffer	i_buffer
string 	is_errortype
string 	is_errortext, is_errortext_detail

string	ls_cr_lf = '~r~n'
str_response 	istr_parms

string 	is_trace[] // string array to display additional app info 
end variables

forward prototypes
public function integer of_dberror (long sqldbcode, string sqlsyntax, string sqlerrtext, dwbuffer buffer, long row, string as_dataobject)
public function integer of_systemerror ()
public function integer of_writeerrorfile (string as_title, string as_errortext, string as_filename)
public function string of_trace_display ()
end prototypes

public function integer of_dberror (long sqldbcode, string sqlsyntax, string sqlerrtext, dwbuffer buffer, long row, string as_dataobject);il_sqldbcode	= sqldbcode
is_sqlerrtext	= f_nvl(sqlerrtext,'')
is_sqlsyntax	= f_nvl(sqlsyntax, '')
i_buffer			= buffer
is_errortype	= 'Datawindow DB Error'
transaction		l_tran

l_tran = SQLCA
// Log error to disk
// construct the error message
is_errortext = String( Today() ) + " " + String( Now() ) 			+ ls_cr_lf + &
				"Database Error Number:  " + String( il_sqldbcode ) 	+ ls_cr_lf + &
				"Database Error Message: " + is_sqlerrtext 				+ ls_cr_lf + & 
				this.of_trace_display()

If sqlca.SQLCode < 0 Then 
	is_errortext += ls_cr_lf + ls_cr_lf + &
				"SQLCode      : " + String( l_tran .SQLCode ) + ls_cr_lf + &
				"SQLDBCode    : " + l_tran .SQLErrText + ls_cr_lf + &
				"SQLErrText   : " + l_tran .SQLReturnData + ls_cr_lf + ls_cr_lf + &
				"DBMS         : " + l_tran .DBMS + ls_cr_lf + &
				"Database     : " + l_tran .Database + ls_cr_lf + &
				"Userid       : " + l_tran .Userid + ls_cr_lf + &
				"DBParm       : " + l_tran .DBParm + ls_cr_lf + &
				"DBPass       : " + l_tran .DBPass + ls_cr_lf + &
				"Lock         : " + l_tran .Lock + ls_cr_lf + &
				"Logid        : " + l_tran .Logid + ls_cr_lf + &
				"LogPass      : " + l_tran .LogPass + ls_cr_lf + &
				"ServerName   : " + l_tran .Lock + ls_cr_lf + &
				"SQLnRows     : " + String( l_tran .SQLnRows ) + ls_cr_lf + &
				"SQLReturnData: " + l_tran .SQLReturnData + ls_cr_lf
END IF

OpenWithParm ( w_vzt_error, istr_parms ) 
istr_parms = Message.PowerObjectParm 
If Not IsValid( istr_parms ) or istr_parms.rc <= 0 then return -1
//MessageBox( "Database Error!", cDBErrorMessage )

this.of_writeerrorfile( is_errortype, is_errortext, '') 

return 1
end function

public function integer of_systemerror ();boolean 	lb_display = true
boolean 	lb_halt = true

is_errortype = 'System Error'

Choose Case error.number
	Case 1 	// divide by zero
		lb_display = True
		lb_halt    = True
	Case 2	// Null object reference
		lb_display = True
		lb_halt    = True
	Case 3, 4, 5, 6	// Array boundary exceeded, Enumerated value is out of range for function,
				// Negative value encountered in fuction, Invalid datawindow row/column specified
		lb_display = True
		lb_halt    = True
	Case 7	// Unresolvable external when linking reference
		lb_display = True
		lb_halt    = True
	Case 8, 9, 10, 12	// Reference of array with NULL subscript, DLL function not found in curr app
				// Unsupported argument type in DLL function, Datawindow column type 
				// doesn't match GetItem type
		lb_display = True
		lb_halt    = True
	Case 13, 14, 15, 16	// Unresolved attribute ref, Error opening DLL Lib for external func
				// Error calling external function, Maximum string size exceeded
		lb_display = True
		lb_halt    = True
	Case 17, 50, 51		// Datawindow referenced in datawindow object doesn't exist
				// Application reference could not be resolved, failure loading dynamic library
		lb_display = True
		lb_halt    = True
	Case Else
		lb_display = True
		lb_halt    = True
End Choose

// Log error to disk
// construct the error message
is_errortext = string( Today() ) + " " + &
				String( Now() ) + ls_cr_lf + &
				"Error Number: " + String( error.number ) + ", " + &
				error.text + ls_cr_lf + &
				"Occurred in window : " + error.windowmenu + ls_cr_lf + &
				"         in object : " + error.object + ls_cr_lf + &
				"         in event  : " + error.objectevent + ls_cr_lf + &
				"         on line   : " + String( error.line ) + ls_cr_lf + & 
				this.of_trace_display()

//messagebox("System Error","systemerror event" + '  ' + string(error.number)+'~r~n~r~n' + ls_errtext)
//If lb_display Then MessageBox( "Execution Error", cSysErrorMessage )

str_response lstr_parms
OpenWithParm ( w_vzt_error, lstr_parms ) 
lstr_parms = Message.PowerObjectParm 
If Not IsValid( lstr_parms ) or lstr_parms.rc <= 0 then return -1

this.of_writeerrorfile( is_errortype, is_errortext, '') 

If lb_halt Then HALT CLOSE

end function

public function integer of_writeerrorfile (string as_title, string as_errortext, string as_filename);int li_handle
string ls_file

ls_file = trim(as_filename)
If f_nvl(cSysErrorFile,'') = '' then cSysErrorFile = 'C:\windows\temp\VZT_ERROR.TXT'
if ls_file = '' or IsNull (ls_file ) then ls_file = cSysErrorFile

// Open error file
li_handle = FileOpen( ls_file , linemode!, write! )
If li_handle >= 0 Then
	// write the message into the text file
	FileWrite( li_handle, &
			"*---"+ as_title +"-------------------------" + ls_cr_lf + &
			as_errortext + &
			"*-------------------------------------------" + ls_cr_lf )
	FileClose( li_handle ) 	// close the text file
Else
	MessageBox( "!!! ERROR ERROR...CANNOT RECORD ERROR INFORMATION !!!", &
					"Unable to record Error Info to File: "+cSYSErrorFile + "  " + &
					"Because " + cAppName + " is unable to record the following " + &
					"error information, please WRITE THE FOLLOWING MESSAGE DOWN " + &
					"WORD-FOR-WORD and give it to your supervisor so " + &
					"support personnel have the required information to resolve " + &
					"the problem." )

	MessageBox( as_title, "WRITE THIS DOWN OR PASTE IT TO A TEXT EDITOR:~r~n~r~n" + as_errortext ) 
	Clipboard (as_errortext )
End If

return 1
end function

public function string of_trace_display ();string 	ls_ret
ls_ret	= ''

If upperbound( is_trace[] ) > 0 then 
	int 		li_count
	ls_ret	= ls_cr_lf 
	FOR li_count = 1 to upperbound( is_trace[] ) 
		ls_ret = ls_ret + f_nvl(is_trace[ li_count ],'') + ls_cr_lf 
	NEXT
END IF
return ls_ret	
end function

on n_cst_vzt_error.create
call error::create
TriggerEvent( this, "constructor" )
end on

on n_cst_vzt_error.destroy
call error::destroy
TriggerEvent( this, "destructor" )
end on

