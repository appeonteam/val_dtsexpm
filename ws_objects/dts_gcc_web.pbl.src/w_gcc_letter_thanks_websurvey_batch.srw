$PBExportHeader$w_gcc_letter_thanks_websurvey_batch.srw
forward
global type w_gcc_letter_thanks_websurvey_batch from w_gcc_letter_thanks_websurvey
end type
type dw_hourglass from datawindow within w_gcc_letter_thanks_websurvey_batch
end type
end forward

global type w_gcc_letter_thanks_websurvey_batch from w_gcc_letter_thanks_websurvey
integer width = 5481
integer height = 2032
event ue_prepare_email ( )
dw_hourglass dw_hourglass
end type
global w_gcc_letter_thanks_websurvey_batch w_gcc_letter_thanks_websurvey_batch

type variables
str_web_confirm istr_webparms
double 		id_qsetid
datawindow	idw_list
long		il_max_loop, il_current, il_hglass_row
end variables

event ue_prepare_email();string ls_lname, ls_prefix, ls_survey_descr, ls_email
long ll_ret

if istr_webparms.cancel then return 

id_qsetid = istr_parms.id // one qset for the batch


IF istr_parms.batch_auto = 'Y' then
	ll_ret = istr_parms.batch_uo.event dynamic ue_web_letter_all_next (istr_parms) // get next parms from caller win
ELSE
	ll_ret = istr_parms.w_caller.event dynamic ue_web_letter_all_next (istr_parms) // get next parms from caller win
END IF
if ll_ret <= 0 then return 

//ls_lname 	= f_nvl(dw_guest.GetItemString( 1, "last_name"), '') 
//ls_prefix	= f_nvl(dw_guest.GetItemString( 1, "prefix"), '') 
//ls_email		= trim(f_nvl(dw_guest.GetItemString( 1, "email"), '')) 

ls_lname 	= f_nvl(idw_list.GetItemString( il_current, "guest_last_name"), '') 
ls_prefix	= f_nvl(idw_list.GetItemString( il_current, "guest_prefix"), '') 
ls_email		= trim(f_nvl(idw_list.GetItemString( il_current, "guest_email"), '')) 

this.event 	ue_replace_tags_batch ( ls_prefix, ls_lname, istr_parms.gcc_url )

SELECT descr INTO :ls_survey_descr FROM qgen_qset WHERE qsetid = :id_qsetid;

istr_webparms.lname 			= ls_lname
istr_webparms.emailtext 	= is_mailtext
istr_webparms.last_action 	= istr_webparms.action 
istr_webparms.survey			= ls_survey_descr
istr_webparms.subject		= sle_1.text
istr_webparms.action 		= ''
istr_webparms.email			= ls_email 

if istr_parms.batch_do_one > 0 then
	dw_hourglass.SetItem( il_hglass_row, 'x', 1 )
	istr_webparms.x				= 1 
ELSE
	dw_hourglass.SetItem( il_hglass_row, 'x', il_current )
	istr_webparms.x				= il_current
END IF

if istr_webparms.prompt then 
	// Prompt user for the options 
	OpenWithParm( w_web_batch_prompt, istr_webparms) 
	istr_webparms	= Message.PowerObjectparm 
	dw_hourglass.visible = true 
ELSE
	// Display hourglass dw instead 
	dw_hourglass.SetItem( il_hglass_row, 'x', il_current)
	dw_hourglass.visible = true 
END IF

If istr_webparms.run and ls_email <> '' then 
	if ll_ret > 0 then this.event ue_emailletter()
END IF

end event

on w_gcc_letter_thanks_websurvey_batch.create
int iCurrent
call super::create
this.dw_hourglass=create dw_hourglass
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_hourglass
end on

on w_gcc_letter_thanks_websurvey_batch.destroy
call super::destroy
destroy(this.dw_hourglass)
end on

event open;call super::open;//If istr_parms.batch_auto = 'Y' then
//	istr_webparms.prompt = false 
//	istr_webparms.prompt = false
//ELSE
	istr_webparms.prompt = true 
	istr_webparms.prompt = true 
//END IF

dw_hourglass.visible = false
dw_hourglass.reset()
il_hglass_row = dw_hourglass.InsertRow(0)

idw_list = istr_parms.dw_distribution 
if istr_parms.batch_do_one > 0 then
	il_max_loop = 1 
ELSE
	il_max_loop = idw_list.RowCount()
END IF

istr_webparms.y	= il_max_loop 
il_current = 0
dw_hourglass.SetItem( il_hglass_row, 'x', il_current)
dw_hourglass.SetItem( il_hglass_row, 'y', il_max_loop )





end event

event close;call super::close;	istr_parms.batch_do_one = 0 //
end event

type cb_dfilter from w_gcc_letter_thanks_websurvey`cb_dfilter within w_gcc_letter_thanks_websurvey_batch
end type

type uo_trace01 from w_gcc_letter_thanks_websurvey`uo_trace01 within w_gcc_letter_thanks_websurvey_batch
end type

type dw_mainlist from w_gcc_letter_thanks_websurvey`dw_mainlist within w_gcc_letter_thanks_websurvey_batch
integer y = 1400
integer height = 400
end type

type cb_last_search from w_gcc_letter_thanks_websurvey`cb_last_search within w_gcc_letter_thanks_websurvey_batch
end type

type cb_close from w_gcc_letter_thanks_websurvey`cb_close within w_gcc_letter_thanks_websurvey_batch
integer y = 1660
integer height = 108
integer taborder = 130
integer textsize = -10
end type

type cb_delete1 from w_gcc_letter_thanks_websurvey`cb_delete1 within w_gcc_letter_thanks_websurvey_batch
integer taborder = 190
end type

type cb_save from w_gcc_letter_thanks_websurvey`cb_save within w_gcc_letter_thanks_websurvey_batch
integer taborder = 170
end type

type cb_select from w_gcc_letter_thanks_websurvey`cb_select within w_gcc_letter_thanks_websurvey_batch
integer x = 3593
integer y = 1776
integer taborder = 160
end type

type cb_new from w_gcc_letter_thanks_websurvey`cb_new within w_gcc_letter_thanks_websurvey_batch
integer taborder = 180
end type

type cb_newsearch from w_gcc_letter_thanks_websurvey`cb_newsearch within w_gcc_letter_thanks_websurvey_batch
integer taborder = 150
end type

type cb_search from w_gcc_letter_thanks_websurvey`cb_search within w_gcc_letter_thanks_websurvey_batch
integer taborder = 140
end type

type st_foundrecs from w_gcc_letter_thanks_websurvey`st_foundrecs within w_gcc_letter_thanks_websurvey_batch
integer x = 3858
integer y = 1772
end type

type st_stop from w_gcc_letter_thanks_websurvey`st_stop within w_gcc_letter_thanks_websurvey_batch
end type

type dw_data from w_gcc_letter_thanks_websurvey`dw_data within w_gcc_letter_thanks_websurvey_batch
integer y = 1272
integer taborder = 120
end type

event dw_data::rowfocuschanged;call super::rowfocuschanged;If currentrow > 0 then 
	mle_1.text 		= dw_data.GetitemString( currentrow, 'longdesc')
	is_orig_text 	= dw_data.GetitemString( currentrow, 'longdesc')
	is_mailtext 	= is_orig_text
	
End IF
end event

type dw_print from w_gcc_letter_thanks_websurvey`dw_print within w_gcc_letter_thanks_websurvey_batch
integer taborder = 200
end type

type uo_ddcal from w_gcc_letter_thanks_websurvey`uo_ddcal within w_gcc_letter_thanks_websurvey_batch
end type

type ole_1 from w_gcc_letter_thanks_websurvey`ole_1 within w_gcc_letter_thanks_websurvey_batch
integer taborder = 90
end type

type cb_oleedit from w_gcc_letter_thanks_websurvey`cb_oleedit within w_gcc_letter_thanks_websurvey_batch
boolean visible = false
end type

type cb_getfile from w_gcc_letter_thanks_websurvey`cb_getfile within w_gcc_letter_thanks_websurvey_batch
integer taborder = 110
end type

type cb_history from w_gcc_letter_thanks_websurvey`cb_history within w_gcc_letter_thanks_websurvey_batch
boolean visible = false
integer taborder = 210
end type

type cb_mail from w_gcc_letter_thanks_websurvey`cb_mail within w_gcc_letter_thanks_websurvey_batch
integer y = 1684
integer width = 471
integer height = 112
integer taborder = 220
integer textsize = -10
integer weight = 700
boolean enabled = true
string text = "e-mail letters"
end type

event cb_mail::clicked;//override 
long 	ll_ret, ll_guest_row
string ls_url , ls_lname, ls_prefix 

ll_ret = 1
is_orig_text = mle_1.text	// save user mods for the whole batch 
is_mailtext = is_orig_text 

//parent.event ue_prepare_email() 
//if istr_webparms.cancel = true then ll_ret = -100 // stop batch

istr_webparms.cancel = false 
il_current = 0
DO WHILE NOT istr_webparms.cancel and il_current < il_max_loop
	//dw_hourglass.visible = true 
	
	if istr_parms.batch_do_one > 0 then
		il_current = istr_parms.batch_do_one 
	ELSE
		il_current ++ 
	END IF
	
	ll_guest_row = dw_guest.retrieve (istr_parms.gccid) 
	is_mailtext = is_orig_text 
	parent.event ue_prepare_email() 
	if istr_webparms.cancel = true then ll_ret = -100 // stop batch
LOOP
dw_hourglass.visible = false

parent.post event menu_exit()


end event

type sle_1 from w_gcc_letter_thanks_websurvey`sle_1 within w_gcc_letter_thanks_websurvey_batch
integer x = 1970
integer y = 1544
integer height = 84
end type

type st_1 from w_gcc_letter_thanks_websurvey`st_1 within w_gcc_letter_thanks_websurvey_batch
integer x = 1577
integer y = 1544
integer height = 88
end type

type st_2 from w_gcc_letter_thanks_websurvey`st_2 within w_gcc_letter_thanks_websurvey_batch
end type

type sle_2 from w_gcc_letter_thanks_websurvey`sle_2 within w_gcc_letter_thanks_websurvey_batch
end type

type st_3 from w_gcc_letter_thanks_websurvey`st_3 within w_gcc_letter_thanks_websurvey_batch
end type

type mle_msg from w_gcc_letter_thanks_websurvey`mle_msg within w_gcc_letter_thanks_websurvey_batch
integer taborder = 80
end type

type dw_guest from w_gcc_letter_thanks_websurvey`dw_guest within w_gcc_letter_thanks_websurvey_batch
integer x = 3054
integer y = 1564
integer width = 1879
integer height = 188
boolean hscrollbar = true
boolean resizable = true
end type

type gb_1 from w_gcc_letter_thanks_websurvey`gb_1 within w_gcc_letter_thanks_websurvey_batch
end type

type rb_word from w_gcc_letter_thanks_websurvey`rb_word within w_gcc_letter_thanks_websurvey_batch
end type

type rb_txt from w_gcc_letter_thanks_websurvey`rb_txt within w_gcc_letter_thanks_websurvey_batch
end type

type mle_1 from w_gcc_letter_thanks_websurvey`mle_1 within w_gcc_letter_thanks_websurvey_batch
integer y = 900
integer taborder = 100
end type

type st_tags from w_gcc_letter_thanks_websurvey`st_tags within w_gcc_letter_thanks_websurvey_batch
end type

type dw_hourglass from datawindow within w_gcc_letter_thanks_websurvey_batch
integer x = 1760
integer y = 556
integer width = 965
integer height = 504
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_web_survey_wait"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

