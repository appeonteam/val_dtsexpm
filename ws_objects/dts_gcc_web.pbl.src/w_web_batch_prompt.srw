$PBExportHeader$w_web_batch_prompt.srw
forward
global type w_web_batch_prompt from w_vzt_base_response
end type
end forward

global type w_web_batch_prompt from w_vzt_base_response
integer width = 2720
integer height = 2348
end type
global w_web_batch_prompt w_web_batch_prompt

type variables
str_web_confirm 	istr_webparms
long 		il_row
end variables

on w_web_batch_prompt.create
call super::create
end on

on w_web_batch_prompt.destroy
call super::destroy
end on

event open;
istr_webparms = Message.PowerObjectParm

dw_response.Reset()
il_row = dw_response.InsertRow(0) 

dw_response.SetItem( il_row , 'to', istr_webparms.lname + '<' + istr_webparms.email + '>'	) 
dw_response.SetItem( il_row , 'subject', istr_webparms.subject ) 
dw_response.SetItem( il_row , 'emailtext', istr_webparms.emailtext ) 
dw_response.SetItem( il_row , 'survey', istr_webparms.survey) 
dw_response.SetItem( il_row , 'x', istr_webparms.x) 
dw_response.SetItem( il_row , 'y', istr_webparms.y) 



end event

event ue_ok;// overr

dw_response.AcceptText() 

istr_webparms.action = dw_response.GetItemString( il_row, 'action')

If istr_webparms.action = 'COBA' then 
	istr_webparms.run 	= true	// continue no conf 
	istr_webparms.cancel = false
	istr_webparms.prompt	= false
END IF

If istr_webparms.action = 'CANB' then 
	istr_webparms.cancel = true
	istr_webparms.run 	= false  
END IF

If istr_webparms.action = 'SKCO' then 
	istr_webparms.cancel = false
	istr_webparms.run 	= false  
END IF

If istr_webparms.action = 'COCO' then 
	istr_webparms.prompt = true
	istr_webparms.run 	= true
	istr_webparms.cancel = false 
END IF
//this.event ue_process_ok()
closeWithReturn (this, istr_webparms) 

end event

type dw_response from w_vzt_base_response`dw_response within w_web_batch_prompt
integer x = 27
integer y = 0
integer width = 2674
integer height = 1988
string dataobject = "d_web_batch_prompt"
end type

event dw_response::clicked;//over
end event

type cb_2 from w_vzt_base_response`cb_2 within w_web_batch_prompt
boolean visible = false
integer y = 1340
integer width = 238
integer height = 92
integer taborder = 30
boolean enabled = false
boolean default = false
end type

type cb_1 from w_vzt_base_response`cb_1 within w_web_batch_prompt
integer x = 1184
integer y = 2092
integer width = 293
integer taborder = 20
boolean default = true
end type

