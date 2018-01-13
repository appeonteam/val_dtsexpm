$PBExportHeader$w_qgen_question_goal_edit.srw
forward
global type w_qgen_question_goal_edit from w_base_response
end type
end forward

global type w_qgen_question_goal_edit from w_base_response
int Width=745
int Height=840
end type
global w_qgen_question_goal_edit w_qgen_question_goal_edit

type variables
double id_questionid
end variables

on w_qgen_question_goal_edit.create
call super::create
end on

on w_qgen_question_goal_edit.destroy
call super::destroy
end on

event open;istr_parms = message.PowerObjectparm
id_questionid = istr_parms.num1 
if id_questionid < 0 then return // 0 - global goal?? 

int li_year, li_year_row, li_row
decimal		ld_score
dw_response.Retrieve( id_questionid, 'YEAR' )

ld_score = istr_parms.value1
For li_year = year ( today() ) - 1 TO year ( today() ) + 1  
	li_year_row = dw_response.Find( 'goal_year = ' + string (li_year) , 1, dw_response.RowCount() )
	IF li_year_row <= 0 then 
		li_row = dw_response.InsertRow(0) 
		dw_response.SetItem ( li_row , 'goal_questionid', 	id_questionid)
		dw_response.SetItem ( li_row , 'goal_year', 			li_year )
		dw_response.SetItem ( li_row , 'goal_period', 		'YEAR' )
		dw_response.SetItem ( li_row , 'goal_value', 		ld_score)
		
//		INSERT INTO qgen_question_goals 
//		VALUES ( :id_questionid, :li_year , 'YEAR', :ld_score) ;
	END IF 
NEXT

IF dw_response.Update (true, true) > 0 then
	COMMIT;
ELSE
	ROLLBACK;
END IF

dw_response.post setfocus()
end event

event ue_process_ok;call super::ue_process_ok;IF dw_response.Update (true, true) > 0 then
	COMMIT;
ELSE
	ROLLBACK;
END IF

end event

type dw_response from w_base_response`dw_response within w_qgen_question_goal_edit
int X=18
int Y=12
int Width=695
int Height=584
string DataObject="d_question_goals_list"
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
end type

event dw_response::constructor;call super::constructor;_selection_service = ''
end event

type cb_2 from w_base_response`cb_2 within w_qgen_question_goal_edit
int X=439
int Y=640
int Height=88
end type

type cb_1 from w_base_response`cb_1 within w_qgen_question_goal_edit
int X=37
int Y=640
int Height=88
end type

