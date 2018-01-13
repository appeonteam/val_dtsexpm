$PBExportHeader$w_qgen_question_copy.srw
forward
global type w_qgen_question_copy from w_qgen_question_edit
end type
type cb_1 from commandbutton within w_qgen_question_copy
end type
type cb_cancel from commandbutton within w_qgen_question_copy
end type
type st_1 from statictext within w_qgen_question_copy
end type
end forward

global type w_qgen_question_copy from w_qgen_question_edit
integer height = 1820
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269528
event ue_afterall ( )
event ue_ok ( )
event ue_cancel ( )
cb_1 cb_1
cb_cancel cb_cancel
st_1 st_1
end type
global w_qgen_question_copy w_qgen_question_copy

event ue_afterall;dw_data.enabled = false
dw_answers.enabled = false

cb_new.visible = false
cb_newsearch.visible = false
cb_search.visible = false
cb_save.visible = false
cb_delete1.visible = false
cb_select.visible = false
cb_ins.visible = false
cb_del.visible = false
st_foundrecs.visible = false


end event

event ue_ok;long ll_target_row, ll_tans_row, ll_qrow, ll_ans_rows, ll_tans_maxrows, ll_tarow
double ld_null
ll_target_row	= istr_qcopy.dw_questions.GetRow()
ll_qrow			= dw_data.GetRow()
ll_ans_rows		= dw_answers.RowCount()
ll_tans_row		= istr_qcopy.dw_answers.RowCount()

if ll_target_row <=0 or ll_qrow <=0 then 
	istr_qcopy.ret = 'cancel'
else
	setnull( ld_null)
	istr_qcopy.ret = 'ok'
	dw_data.RowsCopy(ll_qrow, ll_qrow, Primary!, istr_qcopy.dw_questions, ll_target_row, Primary!)
	istr_qcopy.dw_questions.SetItem( istr_qcopy.dw_questions.GetRow(), 'questionid', ld_null)
	if ll_ans_rows	> 0 then // copy answer choices except ids !! 
		ll_tans_row = ll_tans_row + 1 
		dw_answers.RowsCopy(1, ll_ans_rows, Primary!, istr_qcopy.dw_answers, ll_tans_row, Primary!)
		ll_tans_maxrows = istr_qcopy.dw_answers.RowCount()
		If ll_tans_maxrows >= ll_tans_row then
			FOR ll_tarow = ll_tans_row to ll_tans_maxrows 
				istr_qcopy.dw_answers.SetItem( ll_tarow, 'answerid', ld_null)
			NEXT
		END IF
	end if
end if

CloseWithReturn( this, istr_qcopy)
end event

event ue_cancel;istr_qcopy.ret = 'cancel'
CloseWithReturn( this, istr_qcopy)
end event

on w_qgen_question_copy.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.st_1
end on

on w_qgen_question_copy.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.st_1)
end on

event open;call super::open;cb_search.event clicked()
this.post event ue_afterall()

istr_qcopy = Message.PowerobjectParm

end event

type uo_trace01 from w_qgen_question_edit`uo_trace01 within w_qgen_question_copy
end type

type dw_mainlist from w_qgen_question_edit`dw_mainlist within w_qgen_question_copy
end type

event dw_mainlist::clicked;call super::clicked;parent.post event ue_afterall()

end event

type cb_last_search from w_qgen_question_edit`cb_last_search within w_qgen_question_copy
end type

type cb_close from w_qgen_question_edit`cb_close within w_qgen_question_copy
boolean visible = false
integer taborder = 70
end type

type cb_delete1 from w_qgen_question_edit`cb_delete1 within w_qgen_question_copy
integer taborder = 140
end type

type cb_save from w_qgen_question_edit`cb_save within w_qgen_question_copy
boolean visible = false
integer taborder = 120
end type

type cb_select from w_qgen_question_edit`cb_select within w_qgen_question_copy
boolean visible = false
integer taborder = 110
end type

type cb_new from w_qgen_question_edit`cb_new within w_qgen_question_copy
boolean visible = false
integer taborder = 130
end type

type cb_newsearch from w_qgen_question_edit`cb_newsearch within w_qgen_question_copy
boolean visible = false
integer taborder = 100
end type

type cb_search from w_qgen_question_edit`cb_search within w_qgen_question_copy
boolean visible = false
integer taborder = 80
end type

type st_foundrecs from w_qgen_question_edit`st_foundrecs within w_qgen_question_copy
long backcolor = 25278968
end type

type st_stop from w_qgen_question_edit`st_stop within w_qgen_question_copy
end type

type dw_data from w_qgen_question_edit`dw_data within w_qgen_question_copy
integer taborder = 60
boolean enabled = false
end type

type dw_print from w_qgen_question_edit`dw_print within w_qgen_question_copy
integer taborder = 150
end type

type dw_answers from w_qgen_question_edit`dw_answers within w_qgen_question_copy
boolean visible = true
integer x = 1618
boolean enabled = false
end type

type cb_ins from w_qgen_question_edit`cb_ins within w_qgen_question_copy
boolean visible = false
integer taborder = 160
end type

type cb_del from w_qgen_question_edit`cb_del within w_qgen_question_copy
boolean visible = false
integer taborder = 170
end type

type r_1 from w_qgen_question_edit`r_1 within w_qgen_question_copy
long fillcolor = 25278968
integer height = 148
end type

type cb_qcopy from w_qgen_question_edit`cb_qcopy within w_qgen_question_copy
boolean visible = false
integer taborder = 90
end type

type dw_lookupsql from w_qgen_question_edit`dw_lookupsql within w_qgen_question_copy
end type

type r_2 from w_qgen_question_edit`r_2 within w_qgen_question_copy
end type

type st_22 from w_qgen_question_edit`st_22 within w_qgen_question_copy
end type

type cb_goals from w_qgen_question_edit`cb_goals within w_qgen_question_copy
boolean visible = false
integer x = 2126
integer y = 1876
end type

type cb_1 from commandbutton within w_qgen_question_copy
integer x = 1079
integer y = 1648
integer width = 421
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;parent.event ue_ok()
end event

type cb_cancel from commandbutton within w_qgen_question_copy
integer x = 1669
integer y = 1648
integer width = 421
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
boolean default = true
end type

event clicked;parent.event ue_cancel()
end event

type st_1 from statictext within w_qgen_question_copy
integer x = 146
integer y = 1636
integer width = 832
integer height = 124
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 25278968
boolean enabled = false
string text = "Question copy"
boolean focusrectangle = false
end type

