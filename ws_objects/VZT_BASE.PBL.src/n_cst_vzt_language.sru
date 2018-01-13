$PBExportHeader$n_cst_vzt_language.sru
forward
global type n_cst_vzt_language from nonvisualobject
end type
end forward

global type n_cst_vzt_language from nonvisualobject
end type
global n_cst_vzt_language n_cst_vzt_language

type variables
datastore 		ids_text
string 		is_language, is_language_multi //Y/N
end variables

forward prototypes
public function string of_get_text (string as_id)
end prototypes

public function string of_get_text (string as_id);long 		ll_row
string 	ls_return

If Not IsValid( ids_text) then return 'ids_text does not exist'
If ids_text.RowCount() <= 0 then return 'No Text in DB'

ll_row = ids_text.Find( "id = '"+ trim(as_id)+"'" , 1, ids_text.RowCount() ) 
If ll_row <=0 then Return 'textid '+ string( as_id) + 'not found.'

ls_return = ids_text.GetItemString( ll_row, 'text' )
return ls_return

end function

on n_cst_vzt_language.create
TriggerEvent( this, "constructor" )
end on

on n_cst_vzt_language.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;select language,language_multi INTO :is_language, :is_language_multi from VZT_SYSOPTIONS where id = 1 ; 

is_language 		= f_nvl( upper(is_language) , '')			
is_language_multi	= f_nvl( upper(is_language_multi) , '')	
If is_language = '' then return // or is_language_multi <> 'Y' 

ids_text = CREATE datastore
ids_text.DataObject = 'd_text_list_one_language'
ids_text.SetTransObject( SQLCA)

long ll_rows
ll_rows = ids_text.Retrieve ( is_language )
//If ll_rows <=0 then 
//	MessageBox('Language Support Error.', 'No definition for "'+is_language +'"')
//	return 
//END IF


end event

event destructor;if IsValid( ids_text) THen Destroy ids_text
end event

