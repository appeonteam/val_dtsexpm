$PBExportHeader$w_gcc_letter_view.srw
forward
global type w_gcc_letter_view from w_gcc_letter
end type
end forward

global type w_gcc_letter_view from w_gcc_letter
string title = "GCC Letter Viewer"
end type
global w_gcc_letter_view w_gcc_letter_view

on w_gcc_letter_view.create
call super::create
end on

on w_gcc_letter_view.destroy
call super::destroy
end on

event ue_get_data;//overr

blob ole_blob

SELECT msgtext into :is_msgtext FROM gcc_history WHERE id = :istr_parms.id;
is_msgtext = trim(f_nvl(is_msgtext, ''))

If len (is_msgtext) <= 0 then 
	ole_1.visible = true
 	SELECTBLOB object  into :ole_blob FROM gcc_history WHERE id = :istr_parms.id;
	if SQLCA.SQLCode <> 0 then	MessageBox("GCC OLE BLOB RETRIEVE SQL error",SQLCA.SQLErrText,Information!)
	ole_1.objectdata = ole_blob		 
	mle_msg.visible = false

ELSE
	ole_1.visible 			= false
	mle_msg.text 			= is_msgtext
	mle_msg.visible 		= true
	cb_oleedit.visible 	= false
END IF


end event

event ue_markprinted;//override
end event

event resize;call super::resize;if sizetype <> 1 then 
		mle_msg.x 		= ole_1.x
		mle_msg.y 		= ole_1.y
		ole_1.height	= 	newheight - (3* ii_resizeband_y ) - cb_oleedit.height		
		mle_msg.height	= ole_1.height	
		mle_msg.width	= ole_1.width		
	
End IF 

end event

event open;call super::open;ib_fill_bookmarks=false
ib_ole_save = false  
end event

type dw_mainlist from w_gcc_letter`dw_mainlist within w_gcc_letter_view
boolean visible = false
end type

type cb_last_search from w_gcc_letter`cb_last_search within w_gcc_letter_view
end type

type cb_close from w_gcc_letter`cb_close within w_gcc_letter_view
end type

type cb_delete1 from w_gcc_letter`cb_delete1 within w_gcc_letter_view
end type

type cb_save from w_gcc_letter`cb_save within w_gcc_letter_view
end type

type cb_select from w_gcc_letter`cb_select within w_gcc_letter_view
end type

type cb_new from w_gcc_letter`cb_new within w_gcc_letter_view
end type

type cb_newsearch from w_gcc_letter`cb_newsearch within w_gcc_letter_view
end type

type cb_search from w_gcc_letter`cb_search within w_gcc_letter_view
end type

type st_foundrecs from w_gcc_letter`st_foundrecs within w_gcc_letter_view
end type

type st_stop from w_gcc_letter`st_stop within w_gcc_letter_view
end type

type dw_data from w_gcc_letter`dw_data within w_gcc_letter_view
end type

type dw_print from w_gcc_letter`dw_print within w_gcc_letter_view
end type

type ole_1 from w_gcc_letter`ole_1 within w_gcc_letter_view
integer y = 24
integer width = 3186
integer height = 1552
end type

event ole_1::doubleclicked;//override 
//r/o to view
end event

type cb_oleedit from w_gcc_letter`cb_oleedit within w_gcc_letter_view
end type

type cb_getfile from w_gcc_letter`cb_getfile within w_gcc_letter_view
end type

type cb_history from w_gcc_letter`cb_history within w_gcc_letter_view
boolean visible = false
boolean enabled = false
end type

type cb_mail from w_gcc_letter`cb_mail within w_gcc_letter_view
boolean visible = false
end type

type sle_1 from w_gcc_letter`sle_1 within w_gcc_letter_view
boolean visible = false
end type

type st_1 from w_gcc_letter`st_1 within w_gcc_letter_view
boolean visible = false
end type

type st_2 from w_gcc_letter`st_2 within w_gcc_letter_view
boolean visible = false
end type

type sle_2 from w_gcc_letter`sle_2 within w_gcc_letter_view
boolean visible = false
end type

type st_3 from w_gcc_letter`st_3 within w_gcc_letter_view
boolean visible = false
end type

type mle_msg from w_gcc_letter`mle_msg within w_gcc_letter_view
integer x = 18
integer y = 76
integer width = 3264
integer height = 1576
boolean displayonly = true
end type

type dw_guest from w_gcc_letter`dw_guest within w_gcc_letter_view
end type

