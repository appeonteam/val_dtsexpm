$PBExportHeader$w_gcc_letter_thanks_websurvey.srw
forward
global type w_gcc_letter_thanks_websurvey from w_gcc_letter
end type
type gb_1 from groupbox within w_gcc_letter_thanks_websurvey
end type
type rb_word from radiobutton within w_gcc_letter_thanks_websurvey
end type
type rb_txt from radiobutton within w_gcc_letter_thanks_websurvey
end type
type mle_1 from multilineedit within w_gcc_letter_thanks_websurvey
end type
type st_tags from statictext within w_gcc_letter_thanks_websurvey
end type
end forward

global type w_gcc_letter_thanks_websurvey from w_gcc_letter
integer y = 124
integer width = 5472
integer height = 2104
string title = "GCC Feedback Request Letter "
event ue_replace_tags ( string as_prefix,  string as_lname,  string as_url )
event ue_replace_tags_batch ( string as_prefix,  string as_lname,  string as_url )
gb_1 gb_1
rb_word rb_word
rb_txt rb_txt
mle_1 mle_1
st_tags st_tags
end type
global w_gcc_letter_thanks_websurvey w_gcc_letter_thanks_websurvey

event ue_replace_tags;//	mle_1.text = dw_data.GetitemString( currentrow, 'longdesc')
//	is_mailtext = dw_data.GetitemString( currentrow, 'longdesc')

if istr_parms.batch <> 'Y' and istr_parms.batch <> 'P'  then 
	this.event ue_replace_tags_batch (as_prefix, as_lname, as_url)
	mle_1.text = is_mailtext	
	
END IF

end event

event ue_replace_tags_batch(string as_prefix, string as_lname, string as_url);	long ll_pos , ll_namepos 
	string ls_br = 'browser)', ls_nametag= ':NAME:' 
	string ls_urltag = ':URL:' , ls_removetag = ':REMOVE:' 
	string ls_url , ls_name

	ls_name = trim(f_nvl( as_prefix, '')) 
	if ls_name = '' then ls_name = 'Mr./Ms. '
	ls_name = ls_name +' '+ trim(f_nvl(as_lname, '')) //+', ~r~n~r~n'
	ls_name = trim(ls_name )
	
	ll_namepos = POS ( is_mailtext, ls_nametag )
	
	If ll_namepos > 0 then 
		f_replace( is_mailtext, ls_nametag, ls_name) 
	ELSE
		// do not relace the name if no tag 
		is_mailtext = ls_name + is_mailtext // if no tag - append to beginning 
	END IF

//	ls_url = '~r~n~r~n' + as_url + '~r~n'
	ls_url = as_url 

	ll_pos = POS ( is_mailtext, ls_urltag)
	If ll_pos > 0 then // put after "browser" or at the end 
		f_replace( is_mailtext, ls_urltag, ls_url) 
	ELSE
		is_mailtext		= is_mailtext	+ ls_url 
	END IF


// REMOVE FROM LIST URL 
	f_replace( ls_url, 'qgen1.asp','qgenr.asp' ) 

	ll_pos = POS ( is_mailtext, ls_removetag)
	If ll_pos > 0 then // put at the end if not specified 
		f_replace( is_mailtext, ls_removetag, ls_url) 
	ELSE
		is_mailtext		= is_mailtext	+ '~r~n~r~nTo remove from the list click here: ~r~n '+ ls_url 
	END IF


end event

on w_gcc_letter_thanks_websurvey.create
int iCurrent
call super::create
this.gb_1=create gb_1
this.rb_word=create rb_word
this.rb_txt=create rb_txt
this.mle_1=create mle_1
this.st_tags=create st_tags
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.rb_word
this.Control[iCurrent+3]=this.rb_txt
this.Control[iCurrent+4]=this.mle_1
this.Control[iCurrent+5]=this.st_tags
end on

on w_gcc_letter_thanks_websurvey.destroy
call super::destroy
destroy(this.gb_1)
destroy(this.rb_word)
destroy(this.rb_txt)
destroy(this.mle_1)
destroy(this.st_tags)
end on

event open;call super::open;dw_data.visible = false
dw_guest.visible = false
id_oleid 		= 8
is_action_code = 'WSR'
is_descr			= 'Web Survey Request'
sle_1.text		= 'Please let us know how you liked staying with us.'
ib_cc_bcc		= false
rb_txt.event clicked() //
dw_data.ShareData( dw_mainlist)


is_ole_doc = ''

cb_select.visible 	= false
st_foundrecs.visible = false

end event

event ue_emailgetparms;if istr_parms.batch <> 'Y' then	
	is_mailtext	= f_nvl(mle_1.text, '')
END IF
is_msgtext  = is_mailtext	// for history log

end event

event resize;// over
if sizetype <> 1 then 
		int  li_y, li_x
		li_y = 11
		li_x = 11
		dw_mainlist.y 	= newheight - ii_resizeband_y - dw_mainlist.height		
		dw_mainlist.x	= li_x
		
		cb_close.y 		= newheight - ii_resizeband_y - cb_close.height		
		cb_history.y 	= newheight - ii_resizeband_y - cb_history.height		
		cb_mail.y 		= newheight - ii_resizeband_y - cb_mail.height		
		cb_oleedit.y 	= newheight - ii_resizeband_y - cb_oleedit.height		

		sle_2.y 			= cb_oleedit.y - sle_2.height	- 15
		st_2.y 			= sle_2.y 			
		st_3.y			= sle_2.y 			
		sle_1.y 			= sle_2.y - sle_1.height	- 10
		st_1.y 			= sle_1.y 			
		st_tags.y		= sle_1.y  - st_tags.height  - 10 
		
		ole_1.x			= li_x
		ole_1.y			= li_y
//		ole_1.height	= - dw_data.height - li_x + newheight - dw_mainlist.height - li_y - 2 * ii_resizeband_y // cb_close.height - 50
		ole_1.height	=  newheight - dw_mainlist.height - li_y - 2 * ii_resizeband_y // cb_close.height - 50
		ole_1.width		= newwidth  - li_x * 2 

		mle_1.x 		= ole_1.x // dw_mainlist.y - dw_data.height - li_y
		mle_1.y 		= ole_1.y 
		mle_1.height	= ole_1.height	
		mle_1.width 	= ole_1.width 
		gb_1.y 			= newheight - ii_resizeband_y - gb_1.height		
		rb_word.y		= gb_1.y + (6 * li_y)
		rb_txt.y			= gb_1.y + (6 * li_y)
//		dw_data.visible = true
		cb_select.visible = false
		st_foundrecs.visible = false
End IF 
cb_getfile.visible = false		
end event

event ue_export_link;// override 

long llrows

llrows = dw_guest.retrieve (istr_parms.gccid) 
If llrows <= 0 then 
	Messagebox('Web Survey Error', 'Comment Card data missing.')
end if

//
//dw_guest.object.offer  [1] = istr_parms.offer
//dw_guest.object.amount [1] = istr_parms.amount
//dw_guest.object.gcc_url [1] = istr_parms.gcc_url
//if dw_guest.SaveAs( is_tempdir + is_tempxls, Excel5!, True) < 0 then MessageBox('Directory Error', 'Temp XLS file could not be created!', stopsign!)
//
//sle_1.text = 'Hello...'
//sle_2.text = 'GCCEMAIL'
end event

event activate;call super::activate;cb_select.visible 	= false
st_foundrecs.visible = false

end event

event clicked;call super::clicked;cb_select.visible 	= false
st_foundrecs.visible = false

end event

event menu_search;call super::menu_search;cb_select.visible 	= false
st_foundrecs.visible = false

end event

type cb_dfilter from w_gcc_letter`cb_dfilter within w_gcc_letter_thanks_websurvey
end type

type uo_trace01 from w_gcc_letter`uo_trace01 within w_gcc_letter_thanks_websurvey
end type

type dw_mainlist from w_gcc_letter`dw_mainlist within w_gcc_letter_thanks_websurvey
integer x = 709
integer y = 1612
integer height = 268
end type

event dw_mainlist::retrieveend;call super::retrieveend;cb_select.visible 	= false
st_foundrecs.visible = false

end event

type cb_last_search from w_gcc_letter`cb_last_search within w_gcc_letter_thanks_websurvey
integer x = 3351
integer y = 1440
end type

type cb_close from w_gcc_letter`cb_close within w_gcc_letter_thanks_websurvey
integer taborder = 110
end type

type cb_delete1 from w_gcc_letter`cb_delete1 within w_gcc_letter_thanks_websurvey
integer taborder = 170
end type

type cb_save from w_gcc_letter`cb_save within w_gcc_letter_thanks_websurvey
integer taborder = 150
end type

type cb_select from w_gcc_letter`cb_select within w_gcc_letter_thanks_websurvey
integer y = 1284
integer taborder = 140
boolean enabled = false
end type

type cb_new from w_gcc_letter`cb_new within w_gcc_letter_thanks_websurvey
integer taborder = 160
end type

type cb_newsearch from w_gcc_letter`cb_newsearch within w_gcc_letter_thanks_websurvey
integer taborder = 130
end type

event cb_newsearch::clicked;call super::clicked;cb_select.visible 	= false
st_foundrecs.visible = false

end event

type cb_search from w_gcc_letter`cb_search within w_gcc_letter_thanks_websurvey
integer taborder = 120
end type

event cb_search::clicked;call super::clicked;cb_select.visible 	= false
st_foundrecs.visible = false

end event

type st_foundrecs from w_gcc_letter`st_foundrecs within w_gcc_letter_thanks_websurvey
long textcolor = 67108864
end type

type st_stop from w_gcc_letter`st_stop within w_gcc_letter_thanks_websurvey
end type

type dw_data from w_gcc_letter`dw_data within w_gcc_letter_thanks_websurvey
boolean visible = true
integer x = 23
integer y = 1348
integer width = 1440
integer height = 116
integer taborder = 100
string dataobject = "d_vzt_ole_list"
end type

event dw_data::rowfocuschanged;call super::rowfocuschanged;If currentrow > 0 then 
//	mle_1.text = dw_data.GetitemString( currentrow, 'longdesc')
	is_orig_text 	= dw_data.GetitemString( currentrow, 'longdesc')
	is_mailtext 	= is_orig_text
	
	string ls_url , ls_lname, ls_prefix 
	long llrows
	llrows = dw_guest.RowCount()
	If llrows > 0 then
		ls_lname 	= f_nvl(dw_guest.GetItemString( 1, "last_name"), '') 
		ls_prefix	= f_nvl(dw_guest.GetItemString( 1, "prefix"), '') 
		if istr_parms.batch <> 'Y' and istr_parms.batch <> 'P' then 
			parent.event ue_replace_tags( ls_prefix, ls_lname, istr_parms.gcc_url )
		End IF
	ELSE
		MessageBox('Web Commentator Error','Current client info not found.')
	End IF
End IF

cb_select.visible 	= false
st_foundrecs.visible = false

end event

type dw_print from w_gcc_letter`dw_print within w_gcc_letter_thanks_websurvey
integer taborder = 180
end type

type uo_ddcal from w_gcc_letter`uo_ddcal within w_gcc_letter_thanks_websurvey
end type

type ole_1 from w_gcc_letter`ole_1 within w_gcc_letter_thanks_websurvey
integer x = 5
integer y = 236
integer width = 3035
integer height = 932
integer taborder = 80
end type

type cb_oleedit from w_gcc_letter`cb_oleedit within w_gcc_letter_thanks_websurvey
end type

type cb_getfile from w_gcc_letter`cb_getfile within w_gcc_letter_thanks_websurvey
integer x = 3506
integer y = 1488
integer taborder = 90
end type

type cb_history from w_gcc_letter`cb_history within w_gcc_letter_thanks_websurvey
integer taborder = 190
end type

type cb_mail from w_gcc_letter`cb_mail within w_gcc_letter_thanks_websurvey
integer taborder = 200
end type

event cb_mail::clicked;call super::clicked;is_ole_doc = ''

end event

type sle_1 from w_gcc_letter`sle_1 within w_gcc_letter_thanks_websurvey
integer width = 1431
end type

type st_1 from w_gcc_letter`st_1 within w_gcc_letter_thanks_websurvey
end type

type st_2 from w_gcc_letter`st_2 within w_gcc_letter_thanks_websurvey
boolean visible = false
end type

type sle_2 from w_gcc_letter`sle_2 within w_gcc_letter_thanks_websurvey
boolean visible = false
end type

type st_3 from w_gcc_letter`st_3 within w_gcc_letter_thanks_websurvey
boolean visible = false
end type

type mle_msg from w_gcc_letter`mle_msg within w_gcc_letter_thanks_websurvey
end type

type dw_guest from w_gcc_letter`dw_guest within w_gcc_letter_thanks_websurvey
boolean visible = true
integer x = 1518
integer y = 1188
integer width = 1522
integer height = 324
integer taborder = 70
end type

type gb_1 from groupbox within w_gcc_letter_thanks_websurvey
boolean visible = false
integer x = 3013
integer y = 1644
integer width = 425
integer height = 160
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "View"
end type

type rb_word from radiobutton within w_gcc_letter_thanks_websurvey
boolean visible = false
integer x = 3031
integer y = 1700
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Word"
end type

event clicked;mle_1.visible = false
ole_1.visible = true 
ib_attach = true
end event

type rb_txt from radiobutton within w_gcc_letter_thanks_websurvey
boolean visible = false
integer x = 3237
integer y = 1700
integer width = 174
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Text"
boolean checked = true
end type

event clicked;mle_1.visible = true 
//dw_data.visible = true 
ole_1.visible = false
ib_attach = false
end event

type mle_1 from multilineedit within w_gcc_letter_thanks_websurvey
integer x = 37
integer y = 284
integer width = 2720
integer height = 384
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_tags from statictext within w_gcc_letter_thanks_websurvey
integer x = 1568
integer y = 1516
integer width = 1175
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Available relaceable text tags: ~":NAME:~" and ~":URL:~"  "
boolean focusrectangle = false
end type

