$PBExportHeader$w_qgen_question_edit.srw
forward
global type w_qgen_question_edit from w_vzt_base
end type
type dw_answers from uo_vzt_dwbase within w_qgen_question_edit
end type
type cb_ins from commandbutton within w_qgen_question_edit
end type
type cb_del from commandbutton within w_qgen_question_edit
end type
type r_1 from rectangle within w_qgen_question_edit
end type
type cb_qcopy from commandbutton within w_qgen_question_edit
end type
type dw_lookupsql from uo_vzt_dwbase within w_qgen_question_edit
end type
type r_2 from rectangle within w_qgen_question_edit
end type
type st_22 from statictext within w_qgen_question_edit
end type
type cb_goals from commandbutton within w_qgen_question_edit
end type
end forward

global type w_qgen_question_edit from w_vzt_base
integer width = 3525
integer height = 1896
string title = "Question Maintenance"
dw_answers dw_answers
cb_ins cb_ins
cb_del cb_del
r_1 r_1
cb_qcopy cb_qcopy
dw_lookupsql dw_lookupsql
r_2 r_2
st_22 st_22
cb_goals cb_goals
end type
global w_qgen_question_edit w_qgen_question_edit

type variables
double 		id_questionid
str_qcopy		istr_qcopy
str_response	istr_response
datastore		ids_qgen_lookups
end variables

on w_qgen_question_edit.create
int iCurrent
call super::create
this.dw_answers=create dw_answers
this.cb_ins=create cb_ins
this.cb_del=create cb_del
this.r_1=create r_1
this.cb_qcopy=create cb_qcopy
this.dw_lookupsql=create dw_lookupsql
this.r_2=create r_2
this.st_22=create st_22
this.cb_goals=create cb_goals
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_answers
this.Control[iCurrent+2]=this.cb_ins
this.Control[iCurrent+3]=this.cb_del
this.Control[iCurrent+4]=this.r_1
this.Control[iCurrent+5]=this.cb_qcopy
this.Control[iCurrent+6]=this.dw_lookupsql
this.Control[iCurrent+7]=this.r_2
this.Control[iCurrent+8]=this.st_22
this.Control[iCurrent+9]=this.cb_goals
end on

on w_qgen_question_edit.destroy
call super::destroy
destroy(this.dw_answers)
destroy(this.cb_ins)
destroy(this.cb_del)
destroy(this.r_1)
destroy(this.cb_qcopy)
destroy(this.dw_lookupsql)
destroy(this.r_2)
destroy(this.st_22)
destroy(this.cb_goals)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_newsearch.event clicked()
cb_new.visible = true 
cb_goals.visible = false
//dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()
dw_data.Sharedata( dw_lookupsql)

ids_qgen_lookups = create datastore
ids_qgen_lookups.dataobject = 'd_dddw_question_lookups'
ids_qgen_lookups.SetTransObject ( SQLCA )
ids_qgen_lookups.Retrieve()
datawindowchild 	ldwc_lookup
dw_data.GetChild( 'ddlookup', ldwc_lookup)
ids_qgen_lookups.ShareData( ldwc_lookup)

end event

event ue_assign_menu;//
end event

event close;if IsValid( ids_qgen_lookups) then destroy ids_qgen_lookups
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_qgen_question_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_qgen_question_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_qgen_question_edit
integer x = 5
integer y = 8
integer width = 3465
integer height = 336
string dataobject = "d_qlist02q_list"
end type

event dw_mainlist::ue_rowselected;if row > 0 and row <= this.RowCount() AND ab_selected = true then
	id_questionid = f_nvl(dw_data.GetItemNumber(row,'questionid') , 0)

	cb_new.visible 		= true 

	if id_questionid <= 0 then 
		dw_answers.Reset()
		return 1
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		dw_answers.Retrieve( id_questionid)
		dw_answers.visible 	= true 	
		cb_ins.visible			= true
		cb_del.visible			= true
		cb_goals.visible 		= true

END IF 

	
END IF	

return 1


end event

type cb_last_search from w_vzt_base`cb_last_search within w_qgen_question_edit
integer x = 1061
integer y = 1644
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_qgen_question_edit
integer x = 2075
integer y = 1644
integer taborder = 50
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_qgen_question_edit
integer x = 1591
integer y = 1644
integer taborder = 130
end type

type cb_save from w_vzt_base`cb_save within w_qgen_question_edit
integer x = 841
integer y = 1644
integer taborder = 110
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
	dw_answers.Retrieve( id_questionid)
END IF
cb_qcopy.visible		= false

end event

type cb_select from w_vzt_base`cb_select within w_qgen_question_edit
integer x = 622
integer y = 1644
integer taborder = 100
end type

event cb_select::clicked;call super::clicked;cb_qcopy.visible		= false

end event

type cb_new from w_vzt_base`cb_new within w_qgen_question_edit
integer x = 1417
integer y = 1644
integer taborder = 120
end type

event cb_new::clicked;call super::clicked;cb_qcopy.visible		= true

end event

type cb_newsearch from w_vzt_base`cb_newsearch within w_qgen_question_edit
integer x = 46
integer y = 1644
integer taborder = 90
end type

event cb_newsearch::clicked;call super::clicked;dw_answers.visible 	= false
cb_ins.visible			= false
cb_del.visible			= false
cb_qcopy.visible		= false
cb_goals.visible 		= false

end event

type cb_search from w_vzt_base`cb_search within w_qgen_question_edit
integer x = 393
integer y = 1644
integer taborder = 70
end type

event cb_search::clicked;call super::clicked;cb_qcopy.visible = false
cb_goals.visible = true

end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_qgen_question_edit
integer x = 1801
integer y = 1644
integer width = 270
integer textsize = -8
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_qgen_question_edit
integer x = 1865
integer y = 1644
end type

type dw_data from w_vzt_base`dw_data within w_qgen_question_edit
integer x = 5
integer y = 348
integer width = 1600
integer height = 1268
integer taborder = 40
string dataobject = "d_qlist02q_edit"
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'questiontxt', 'descr', 'qtypeid', 'width','height', 'same_row',  &
			'repeat', 'ansperline', 'scorable' , 			& 
			'ddlookuptype','ddcodecol','dddispcol',  		&
			'ddlookup','ddcoltype', 'weblookup', 'weight','fontface','fontsize','bold', &
			'italic', 'under', 'fgcolor','bgcolor', 'defgraphtype', 'corp_id'}

is_searchable[]  = is_editable[]
//{'questiontxt', 'descr', 'qtypeid', 'same_row','scorable' }

_SetNullonNewSearch 			= true



end event

event dw_data::ue_refresh_identity;long ll_row, ll_id
ll_row = this.GetRow() 
if ll_row <= 0 then return  

ll_id = f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0)
if ll_id = 0 then 
	SELECT max(questionid) into :id_questionid from qgen_questions ;
	this.setitem( this.GetRow(), 'questionid', id_questionid)
//	MessageBox('qid',string(id_questionid))
ELSE
	id_questionid = ll_id 
END IF


end event

event dw_data::itemchanged;call super::itemchanged;if row <= 0 or row > this.RowCount() then return 

dwitemstatus l_status
long			ll_newrow, ll_lookuprow

l_status = this.GetItemStatus( row, 0, Primary!) 

If dwo.name = 'questiontxt' then 
	f_replace ( data, '"', '')
	if gnv_appman.is_replace_apostrophe = 'Y' then 
		f_replace ( data, "'", '')
	end if
	this.POST SetItem( row, 'questiontxt', data)
	
END IF

If dwo.name = 'ddlookup' then 
	ll_lookuprow = ids_qgen_lookups.Find ( 'trim(ddlookup) = "'+ trim(data) +'"',1,ids_qgen_lookups.rowcount())
	If	ll_lookuprow > 0 then
		this.POST SetItem( row, 'ddcodecol', ids_qgen_lookups.GetItemString(ll_lookuprow, 'ddcodecol'))
		this.POST SetItem( row, 'dddispcol', ids_qgen_lookups.GetItemString(ll_lookuprow, 'dddispcol'))
		this.POST SetItem( row, 'ddcoltype', ids_qgen_lookups.GetItemString(ll_lookuprow, 'ddcoltype'))
	END  IF
END IF

If l_status = New! or l_status = NewModified! then
	If dwo.name = 'qtypeid' then 
		If POS(data, 'YN') > 0 then 
			this.SetItem( this.GetRow(), 'width', 150)
			If dw_answers.RowCount() = 0 then // Do YES/NO automatically
			
		 		ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
				if ll_newrow <= 0 then return 
				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
				dw_answers.SetItem( ll_newrow, 'answertxt', 'Yes')
			
		 		ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
				if ll_newrow <= 0 then return 
				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
				dw_answers.SetItem( ll_newrow, 'answertxt', 'No')
		
			END IF
		END IF
		If POS(data, 'TF') > 0 then 
			this.SetItem( this.GetRow(), 'width', 170)
			If dw_answers.RowCount() = 0 then // Do True/False automatically
	
				ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
				if ll_newrow <= 0 then return 
				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
				dw_answers.SetItem( ll_newrow, 'answertxt', 'True')
			
		 		ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
				if ll_newrow <= 0 then return 
				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
				dw_answers.SetItem( ll_newrow, 'answertxt', 'False')
			END IF
		END IF
		If POS(data, 'FF') > 0 then 
			this.SetItem( this.GetRow(), 'width', 300)
			If dw_answers.RowCount() = 0 then // Do FreeForm area automatically
	
//				ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
//				if ll_newrow <= 0 then return 
//				dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
//				dw_answers.SetItem( ll_newrow, 'answertxt', 'FreeForm Attributes')
//				dw_answers.SetItem( ll_newrow, 'webwidth', 50)
//				dw_answers.SetItem( ll_newrow, 'webheight', 3)
//				dw_answers.SetItem( ll_newrow, 'width', 100)
//				dw_answers.SetItem( ll_newrow, 'height',16)
//			
			END IF
			
		END IF
	END IF
	
END IF // new row

return 0
end event

event dw_data::buttonclicked;string ls_lookupprocessor, ls_newvalue, ls_autoreplace, ls_colname
window  lw_processor
st_lookup_parm   lst_parms

If row <= 0 or row > this.RowCount() then return
If this.accepttext() <> 1 then return 

If dwo.name = 'btn_fg' or dwo.name = 'btn_bg' then
	If dwo.name = 'btn_fg' then ls_colname = 'fgcolor'
	If dwo.name = 'btn_bg' then ls_colname = 'bgcolor' 
	this.POST SetFocus()
	this.POST SetColumn( ls_colname )
	ls_lookupprocessor 	= 'w_vzt_color'
	lst_parms.parmvalue = string( this.GetItemNumber(row, ls_colname))
	OpenWithParm(lw_processor, lst_parms, ls_lookupprocessor )
	ls_newvalue = message.stringparm 
	If ls_newvalue =  "CANCEL" then
   	 return
	Else
	   this.SetItem( row, ls_colname,  long( ls_newvalue  ))
	End If
End If
end event

event dw_data::rowfocuschanged;call super::rowfocuschanged;if currentrow > 0 then
	dw_lookupsql.setrow( currentrow )
	dw_lookupsql.scrolltorow( currentrow )
end if
end event

event dw_data::ue_validate_page;call super::ue_validate_page;dw_lookupsql.acceptText()
dw_data.acceptText()
return 0
end event

type dw_print from w_vzt_base`dw_print within w_qgen_question_edit
integer x = 2999
integer y = 1572
integer taborder = 140
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_qgen_question_edit
end type

type dw_answers from uo_vzt_dwbase within w_qgen_question_edit
boolean visible = false
integer x = 1623
integer y = 348
integer width = 1847
integer height = 928
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_answers_edit"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;wf_setupdateable( dw_answers, "Answer Choices", false, false)

end event

event ue_update_keys_on_new;If row <= 0 then return 1
this.SetItem( row, 'questionid', id_questionid) 

long ll_id

ll_id = f_nvl(this.GetitemNumber( row, 'answerid'),0)
if ll_id = 0 then 
	SELECT max(answerid) into :ll_id from qgen_answer_choices WHERE answerid < 99990000 ;
	ll_id = ll_id + row 
	this.setitem( row, 'answerid', ll_id )
//	MessageBox('qid',string(id_questionid))
END IF
return 1
end event

event itemchanged;call super::itemchanged;if row <= 0 then return 

If dwo.name = 'answertxt' then 
	f_replace ( data, '"', '')
	if gnv_appman.is_replace_apostrophe = 'Y' then 
		f_replace ( data, "'", '')
	end if
	this.POST SetItem( row, 'answertxt', data)
END IF

end event

type cb_ins from commandbutton within w_qgen_question_edit
integer x = 2610
integer y = 1644
integer width = 165
integer height = 72
integer taborder = 150
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ins"
end type

event clicked;if dw_answers.visible then 
	long			ll_newrow
 	ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
	if ll_newrow <= 0 then return 
	dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
	
End IF 
end event

type cb_del from commandbutton within w_qgen_question_edit
integer x = 2779
integer y = 1644
integer width = 165
integer height = 72
integer taborder = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Del"
end type

event clicked;if dw_answers.visible then dw_answers.DeleteRow(0)
end event

type r_1 from rectangle within w_qgen_question_edit
integer linethickness = 8
long fillcolor = 8421504
integer x = 18
integer y = 1624
integer width = 3447
integer height = 112
end type

type cb_qcopy from commandbutton within w_qgen_question_edit
integer x = 2336
integer y = 1644
integer width = 174
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copy"
end type

event clicked;istr_qcopy.dw_questions = dw_data
istr_qcopy.dw_answers	= dw_answers	

OpenWithParm( w_qgen_question_copy, istr_qcopy, parent )



end event

type dw_lookupsql from uo_vzt_dwbase within w_qgen_question_edit
integer x = 1614
integer y = 1336
integer width = 1847
integer height = 276
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_qlist02q_edit_lookupsql"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type r_2 from rectangle within w_qgen_question_edit
integer linethickness = 8
long fillcolor = 8421504
integer x = 1623
integer y = 1280
integer width = 1838
integer height = 56
end type

type st_22 from statictext within w_qgen_question_edit
integer x = 1646
integer y = 1288
integer width = 279
integer height = 40
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 8421504
boolean enabled = false
string text = "LOOKUP SQL"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_goals from commandbutton within w_qgen_question_edit
integer x = 1061
integer y = 1644
integer width = 215
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Goals"
end type

event clicked;istr_response.num1 = id_questionid 

if dw_answers.RowCount() > 0 then 
	istr_response.value1 = dw_answers.GetItemNumber( 1, 'score')
Else
	istr_response.value1 = 0 
END IF

OpenWithParm( w_qgen_question_goal_edit, istr_response, parent )



end event

