$PBExportHeader$w_gcc_letter_employee_tx.srw
forward
global type w_gcc_letter_employee_tx from w_gcc_letter
end type
end forward

global type w_gcc_letter_employee_tx from w_gcc_letter
string title = "GCC Employee Recognition Letter"
end type
global w_gcc_letter_employee_tx w_gcc_letter_employee_tx

type variables
string is_employee_number
end variables

on w_gcc_letter_employee_tx.create
call super::create
end on

on w_gcc_letter_employee_tx.destroy
call super::destroy
end on

event open;call super::open;
id_oleid 		= 6
is_action_code = 'ERL'
is_descr			= 'Employee recognition letter'
sle_1.text		= 'Thank you for your outstanding work...'


end event

event ue_export_link;//override
long ll_rows, ll_comma
string ls_name, ls_fname, ls_lname
is_employee_number = istr_parms.dtsparm
ll_rows = dw_guest.retrieve ( is_employee_number ) 
If ll_rows < 1 then 
	MessageBox('GCC Employee Recognition', 'Employee "'+ string(f_nvl(is_employee_number , '*unspecified*' )) + '" not found.' )
	return 
End If

ls_name 	= dw_guest.object.employee [1] 
ll_comma = POS (ls_name , ',')
If ll_comma > 0 and ll_comma < len(ls_name ) then
	ls_fname = MID( ls_name, ll_comma + 1)
	ls_lname = MID( ls_name, 1, ll_comma - 1)
	dw_guest.object.firstname[1] = ls_fname 
	dw_guest.object.lastname[1]  = ls_lname 
ELSE
	dw_guest.object.firstname[1] = ls_name 
	dw_guest.object.lastname[1]  = ''
	
END IF

if dw_guest.SaveAs( is_tempdir + is_tempxls, Excel5!, True) < 0 then MessageBox('Directory Error', 'Temp XLS file could not be created!', stopsign!)

sle_1.text = 'Hello...'
sle_2.text = 'GCCEMAIL'
end event

event ue_write_history;//override 
blob 		lb_object
string 	ls_error, ls_code
lb_object = ole_1.objectdata
f_write_gcc_history( 0, is_action_code, lb_object, is_descr+' '+as_parm, is_employee_number,'' )
end event

event ue_ole_set_bookmarks;//is_bookmarks[] = {"prefix01", "prefix02", "fname", 		"lname", 	"lname1", 	"title", "company","addr1", "addr2", "city", "state", "zip", "country", "offer" }
//is_cols [] 		= {"@@", 	"@@", 	"@@", 	"employee","last_name","title", "comp_name","addr1", "addr2", "city", "state", "zip", "country","offer" }

is_bookmarks[] = {"company", "lname", "lname1"}
is_cols [] 		= {"dept_longdesc", "employee", "employee" }

end event

type dw_mainlist from w_gcc_letter`dw_mainlist within w_gcc_letter_employee_tx
end type

type cb_last_search from w_gcc_letter`cb_last_search within w_gcc_letter_employee_tx
end type

type cb_close from w_gcc_letter`cb_close within w_gcc_letter_employee_tx
end type

type cb_delete1 from w_gcc_letter`cb_delete1 within w_gcc_letter_employee_tx
end type

type cb_save from w_gcc_letter`cb_save within w_gcc_letter_employee_tx
end type

type cb_select from w_gcc_letter`cb_select within w_gcc_letter_employee_tx
end type

type cb_new from w_gcc_letter`cb_new within w_gcc_letter_employee_tx
end type

type cb_newsearch from w_gcc_letter`cb_newsearch within w_gcc_letter_employee_tx
end type

type cb_search from w_gcc_letter`cb_search within w_gcc_letter_employee_tx
end type

type st_foundrecs from w_gcc_letter`st_foundrecs within w_gcc_letter_employee_tx
end type

type st_stop from w_gcc_letter`st_stop within w_gcc_letter_employee_tx
end type

type dw_data from w_gcc_letter`dw_data within w_gcc_letter_employee_tx
end type

type dw_print from w_gcc_letter`dw_print within w_gcc_letter_employee_tx
end type

type ole_1 from w_gcc_letter`ole_1 within w_gcc_letter_employee_tx
end type

type cb_oleedit from w_gcc_letter`cb_oleedit within w_gcc_letter_employee_tx
end type

type cb_getfile from w_gcc_letter`cb_getfile within w_gcc_letter_employee_tx
end type

type cb_history from w_gcc_letter`cb_history within w_gcc_letter_employee_tx
end type

type cb_mail from w_gcc_letter`cb_mail within w_gcc_letter_employee_tx
end type

type sle_1 from w_gcc_letter`sle_1 within w_gcc_letter_employee_tx
end type

type st_1 from w_gcc_letter`st_1 within w_gcc_letter_employee_tx
end type

type st_2 from w_gcc_letter`st_2 within w_gcc_letter_employee_tx
end type

type sle_2 from w_gcc_letter`sle_2 within w_gcc_letter_employee_tx
end type

type st_3 from w_gcc_letter`st_3 within w_gcc_letter_employee_tx
end type

type mle_msg from w_gcc_letter`mle_msg within w_gcc_letter_employee_tx
end type

type dw_guest from w_gcc_letter`dw_guest within w_gcc_letter_employee_tx
integer x = 695
integer y = 276
integer width = 2267
integer height = 360
string dataobject = "d_gcc_employee_for_letter"
boolean resizable = true
borderstyle borderstyle = StyleRaised!
end type

