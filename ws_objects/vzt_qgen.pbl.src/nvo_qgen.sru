$PBExportHeader$nvo_qgen.sru
forward
global type nvo_qgen from nonvisualobject
end type
end forward

global type nvo_qgen from nonvisualobject
event type integer ue_create_qset ( double an_qsetid,  ref datawindow adw_target )
event type integer ue_save_qset ( )
event ue_create_user_answers ( )
event type integer ue_load_user_answers ( )
event ue_retrieve_user_answers ( )
event ue_save_qset_with_commit ( )
event ue_clear_ddds ( )
event ue_create_qset_section ( ref integer ai_colid,  ref long al_y,  ref string as_column_cmd,  ref string as_table_cmd,  ref blob ab_html )
event type integer ue_create_qset_hier_level ( string as_parent_id,  ref integer ai_colid,  ref long al_y,  ref string as_column_cmd,  ref string as_table_cmd,  ref blob ab_html )
event ue_save_qset_html ( integer ai_property_id,  ref transaction a_tran )
event type string ue_get_qset_html_header ( double ad_qsetid )
event type string ue_get_qset_html_footer ( double ad_qsetid )
event type string ue_html_w1q ( integer ai_cols,  long ai_qid )
event type blob ue_html_create_qset ( integer ai_property_id,  double ad_qsetid )
event type string ue_html_avail_surveys_header ( )
event type string ue_html_avail_surveys_footer ( )
event type string ue_html_avail_surveys ( )
event type string ue_html_get_answer_tr ( string as_same_row,  string as_qtext,  string as_qtype )
event type string ue_html_get_styles ( integer ai_property_id,  double ad_qsetid )
event ue_web_tran ( ref boolean ab_webdb,  ref string as_dparm,  ref transaction at_web_tran )
event type integer ue_find_survey_syntax ( double ad_qsetid,  boolean ab_save )
event type integer ue_save_survey ( double ad_idgcc,  boolean ab_readonly )
event ue_target_dclick ( )
end type
global nvo_qgen nvo_qgen

type variables
datastore      ids_qset_template_q, ids_qset_template_a
datastore	    ids_dropdowns[]
datastore      ids_answers
long  il_maxds, il_maxddcol,  il_ddcoldsndx[]
string      is_cols[], is_ddcols[], is_html_temp, is_syntax[] 
double    	in_qsetid, in_surveys[], in_responderid, in_headerid
datawindow 	idw_target
datetime      	idt_ans_date // date to use from caller
boolean		ib_norefresh
integer 	ii_target_x, ii_target_w
integer	ii_ystart, ii_y_before_q, ii_y_q_to_a, ii_level=0
integer	ii_x_start_q, ii_x_start_a,  ii_html_table_cols=6
blob	ib_html
boolean	ib_html_only
integer	ii_input_index=0
string	is_fontface, is_fontsize, is_bold, is_italic, is_under   
string    	is_fgcolor, is_bgcolor, is_id, is_border, is_borderthickness 
string	is_keep_ans_table

end variables

forward prototypes
public function string uf_getstring (string as_colname, string as_coltype)
end prototypes

event ue_create_qset;idw_target = adw_target

string	ls_descr, ls_hier, ls_colname, ls_table_cmd, ls_column_cmd, ls_rc
long		ll_questions , ll_y, ll_delta_y, ll_answers, ll_present 
int		li_colid
string	ls_title_size, ls_html='' 
boolean	lb_fast

if not IsValid(adw_target) or IsNUll(adw_target) then ib_html_only = true // HTML 

If ib_norefresh and not ib_html_only &
	and IsValid(idw_target) then 
	lb_fast = true 
	If in_qsetid = an_qsetid then // same as prior qset 
		// do nothing
	ELSE
		// Find it in saved syntax
		lb_fast = false // for now
//		if this.event ue_find_survey_syntax( an_qsetid, false) < 0 then lb_fast = false // not there 
	END IF
	If lb_fast then 		// if still fast ... 
		idw_target.Reset()
		idw_target.Insertrow(0)
		idw_target.ResetUpdate()
		If IsValid(ids_answers) then ids_answers.reset()
		return 1// fast option
	end if		
End If

in_qsetid = an_qsetid 
//---------------------------------------------------
//	Get current QSET options
//---------------------------------------------------
SELECT 	y_start, 	y_before_q, 	y_q_to_a, 		x_start_a, 		x_start_q , 	descr, 		use_hierarchy 
INTO		:ii_ystart, :ii_y_before_q, :ii_y_q_to_a, :ii_x_start_a, :ii_x_start_q, :ls_descr, :ls_hier
FROM 		qgen_qset WHERE qgen_qset.qsetid = :in_qsetid;

If ls_hier = 'Y' then 
	ids_qset_template_q.dataobject = 'd_qlist02q_hier'
	ids_qset_template_q.SetTransObject( SQLCA )	
ELSE
	ids_qset_template_q.dataobject = 'd_qlist02q'
	ids_qset_template_q.SetTransObject( SQLCA )	
	ll_questions 	= ids_qset_template_q.Retrieve( in_qsetid )
	IF ll_questions <= 0 then 
		MessageBox("Questionnaire creation error", "No question data found for qset '"+string(in_qsetid ) )
		Return -1
	END IF 
END IF 
	
ids_qset_template_a.SetFilter('1=1')
ids_qset_template_a.FIlter()
ll_answers   	= ids_qset_template_a.Retrieve( in_qsetid )
//IF ll_answers <= 0 then // No answers is OK for all FF1 FF2 questionnnaires 
//	MessageBox("Questionnaire creation error", "No answer data found for qset "+string(in_qsetid ) )
//	Return -1
//END IF 

if not ib_html_only then idw_target.SetRedraw(false)
this.event ue_clear_ddds()
if not ib_html_only then 
	idw_target.Reset()
	idw_target.dataobject = 'd_template02'
	idw_target.object.qset_title.text = ls_descr
end if

If IsValid(ids_answers) then ids_answers.reset()

ll_delta_y		= 5
ll_y				= ii_ystart
ls_column_cmd 	= ''
ls_table_cmd 	= 'table(column=(type=char(1) updatewhereclause=no name=fftext dbname="zzz" ) '
li_colid			= 1


If ls_hier = 'Y' then
	string 	ls_h_id, ls_h_pid , ls_qsetid
	//---------------------------------------------------
	// process hier levels and do section by section 
	//---------------------------------------------------
	// get qset hid 
	ls_qsetid = string( in_qsetid )
	SELECT ID, PARENT_ID, present_id INTO :ls_h_id, :ls_h_pid, :ll_present from vzt_hierarchy 
	WHERE treetype = 'QSETORG' AND 
			NODETYPE = 'QSET' 	and 
			reportid = :ls_qsetid;
	SELECT "fontface",   
			"fontsize",   
         "bold",   
         "italic",   
         "under",   
         "fgcolor",   
         "bgcolor",   
         "id",   
         "border",   
         "borderthickness"   
			INTO :is_fontface,   
			:is_fontsize,   
         :is_bold,   
         :is_italic,   
         :is_under,   
         :is_fgcolor,   
         :is_bgcolor,   
         :is_id,   
         :is_border,   
         :is_borderthickness    
    FROM "vzt_presentation" where id = :ll_present  ;
		ls_title_size = '3'

	this.event ue_create_qset_hier_level( ls_h_id, li_colid, ll_y, ls_column_cmd, ls_table_cmd, ib_html ) 
	//this.event ue_create_qset_section(li_colid, ll_y, ls_column_cmd, ls_table_cmd) // single section 
ELSE
	this.event ue_create_qset_section(li_colid, ll_y, ls_column_cmd, ls_table_cmd, ib_html) // single section 

END IF

if not ib_html_only then 		
	// Now do table and column modifies
	ll_y += 2 * ll_delta_y
	ls_table_cmd += ')'
	ls_rc = idw_target.Modify( ls_table_cmd )
	ls_rc = idw_target.Modify( ls_column_cmd )
	ls_rc = idw_target.Modify("DataWindow.Detail.Height='"+string(ll_y)+"'")
end if

//---------------------------------------------------
//Now for all dropdowns set the shares
//---------------------------------------------------
if not ib_html_only then 		
	long ll_ddcol, ll_rc
	datawindowchild ldc_dropdown
	If il_maxddcol > 0 then
		For ll_ddcol = 1 to il_maxddcol
			ls_colname = is_ddcols[ll_ddcol] 
			ll_rc = idw_target.GetChild( ls_colname, ldc_dropdown) 
			If ll_rc <> 1 then MessageBox('QGEN QSET Creation Error','GetChild failed for column:'+ls_colname, Exclamation!)
			ll_rc = ids_dropdowns[il_ddcoldsndx[ll_ddcol]].ShareData( ldc_dropdown )
			If ll_rc <> 1 then MessageBox('QGEN QSET Creation Error','Share failed for column:'+ls_colname, Exclamation!)
		Next
	END IF 
end if

If ls_hier = 'Y' then // switch back to flat qset for answers save/load 
	ids_qset_template_q.dataobject = 'd_qlist02q'
	ids_qset_template_q.SetTransObject( SQLCA )	
	ll_questions 	= ids_qset_template_q.Retrieve( in_qsetid )
	IF ll_questions <= 0 then 
		MessageBox("Questionnaire creation error", "No question data found for qset '"+string(in_qsetid ) )
		Return -1
	END IF 
END IF 

if not ib_html_only then 		
	idw_target.SetRedraw(true)
	idw_target.Insertrow(0)
	idw_target.ResetUpdate()
end if

return 1

end event

event ue_save_qset;long ll_rc
time lt_times[]
if not isValid(idw_target) then return -5
if idw_target.AcceptText() <> 1 then return -10
lt_times[1] = now()
this.event ue_retrieve_user_answers() // create or update user answers datastore 
lt_times[2] = now()
this.event ue_create_user_answers() // create or update user answers datastore 
lt_times[3] = now()
ll_rc = ids_answers.Update( false, true) 
lt_times[4] = now()
if gnv_appman.is_debugmode = 'Y' then
	MessageBox('QSET Save Timings', &
			'Start time: ' + string( lt_times[1] ) + '~r~n' + &
			'after ue_retrieve_user_answers time: ' + string( lt_times[2] ) + '~r~n' + &
			'after ue_create_user_answers time: ' + string( lt_times[3] ) + '~r~n' + &
			'after Update time: ' + string( lt_times[4] ) + '~r~n' + &
			'Total seconds: ' + string( SecondsAfter ( lt_times[1], lt_times[4]))  )
END IF

return ll_rc
end event

event ue_create_user_answers;// create or update user answers datastore 
long ll_questions, ll_q, ll_choices, ll_qid, ll_ansrow , ll_answerid
double	ll_answer_value
string ls_qtype, ls_colname
long ll_answers, 	ll_ans_1q, ll_a, ll_checkna
string	ls_ddsql, ls_dddo, ls_ddcodecol, ls_dddispcol, ls_ddcoltype, ls_ddlookup,ls_ddltype
string 	ls_fftext, ls_ddvalue, ls_ffcolname
integer 	li_repeat, li_line

ll_questions = ids_qset_template_q.RowCount()

If ll_questions > 0 then
	FOR ll_q = 1 to ll_questions 
	
		ls_qtype   = ids_qset_template_q.Object.qgen_questions_qtypeid [ll_q]
		ll_choices = ids_qset_template_q.Object.qgen_qtypes_maxchoices [ll_q]
		ll_qid 	  = ids_qset_template_q.Object.questionid [ll_q]
	
		li_repeat	= ids_qset_template_q.Object.repeat		 		[ll_q] 
		ls_ddlookup	= f_nvl(ids_qset_template_q.Object.ddlookup	[ll_q],'')
		ls_ddltype	= f_nvl(ids_qset_template_q.Object.ddlookuptype	[ll_q],'')
		ls_ddcodecol= f_nvl(ids_qset_template_q.Object.ddcodecol [ll_q],'')
		ls_dddispcol= f_nvl(ids_qset_template_q.Object.dddispcol [ll_q],'')
		ls_ddcoltype= f_nvl(ids_qset_template_q.Object.ddcoltype [ll_q],'')
		
		ids_qset_template_a.SetFilter ("questionid = "+string(ll_qid) )
		ids_qset_template_a.Filter() 
		ids_qset_template_a.SetSort('questionid A, sortorder A') 
		ids_qset_template_a.Sort()

		ll_ans_1q = ids_qset_template_a.RowCount() 
		error.is_trace[1] = 'QGEN Question:' + string( ll_qid ) +', Qtype: ' + ls_qtype   
		// Save Pull Down and freeform answers 
		IF POS(ls_qtype, 'FF') > 0 or ls_ddlookup <> '' then 
	   	if f_nvl(li_repeat,0) <= 0 then li_repeat = 1 
			FOR li_line= 1 to li_repeat //-------------------
			 	ls_colname 	= 'add'+string(ll_qid,'000000000')+ 'l'+ string( li_line, '00')
			 	ls_ffcolname= 'aff'+string(ll_qid,'000000000')+ 'l'+ string( li_line, '00') 
				ls_fftext	= idw_target.GetItemString( 1, ls_ffcolname )
				ll_ansrow 	= ids_answers.Find('questionid='+string(ll_qid)+' and answerid='+string( li_line), 1, ids_answers.RowCount())
				IF ll_ansrow <= 0 then ll_ansrow = ids_answers.InsertRow(0)
				//	fill common fields 
				ids_answers.SetItem( ll_ansrow, "qsetid", 		in_qsetid)
				ids_answers.SetItem( ll_ansrow, "questionid", 	ll_qid)
				ids_answers.SetItem( ll_ansrow, "answerid", 		li_line)
				ids_answers.SetItem( ll_ansrow, "responderid", 	in_responderid)
				ids_answers.SetItem( ll_ansrow, "ansdate", 		idt_ans_date)
				ids_answers.SetItem( ll_ansrow, "checked", 		0) 
				ids_answers.SetItem( ll_ansrow, "freeform", 		ls_fftext)
				ids_answers.SetItem( ll_ansrow, "headerid", 		in_headerid)
				
				If ls_ddlookup <> '' then 
					ls_ddvalue		= uf_getstring( ls_colname, ls_ddcoltype)
					ids_answers.SetItem( ll_ansrow, "ddvalue", 	ls_ddvalue)
				END IF 
			NEXT // repeat
		End If
		//-------------------------------------	
		If ll_ans_1q > 0 and ls_qtype <> 'SCT' then 
		 If ll_choices = 1 then 
			ls_colname = 'arb'+string(ll_qid,'000000000') 
			ll_answer_value = idw_target.GetItemNumber( 1, ls_colname )
			ll_checkna = 1 
		  For ll_a = 1 to ll_ans_1q
			ll_answerid = ids_qset_template_a.GetItemNumber( ll_a, "answerid")
//			ll_ansrow = ids_answers.Find('questionid='+string(ll_qid), 1, ids_answers.RowCount())
			ll_ansrow = ids_answers.Find('questionid='+string(ll_qid) + ' and answerid='+ string(ll_answerid) , 1, ids_answers.RowCount())
			IF ll_ansrow <= 0 then ll_ansrow = ids_answers.InsertRow(0)
			//	fill common fields 
			ids_answers.SetItem( ll_ansrow, "qsetid", 		in_qsetid)
			ids_answers.SetItem( ll_ansrow, "questionid", 	ll_qid)
			ids_answers.SetItem( ll_ansrow, "answerid", 		ll_answerid)
			ids_answers.SetItem( ll_ansrow, "responderid", 	in_responderid)
			ids_answers.SetItem( ll_ansrow, "ansdate", 		idt_ans_date)
			ids_answers.SetItem( ll_ansrow, "checked", 		0)
			if ll_answer_value = ll_answerid then 
				ids_answers.SetItem( ll_ansrow, "checked", 1) 
				ll_checkna = 0 
			END IF 
			ids_answers.SetItem( ll_ansrow, "headerid", 		in_headerid)
		  Next // ans choices
		  // do na
			ll_ansrow = ids_answers.Find('questionid='+string(ll_qid) + ' and answerid=999999000',1, ids_answers.RowCount())
			IF ll_ansrow <= 0 then ll_ansrow = ids_answers.InsertRow(0)
			ids_answers.SetItem( ll_ansrow, "qsetid", 		in_qsetid)
			ids_answers.SetItem( ll_ansrow, "questionid", 	ll_qid)
			ids_answers.SetItem( ll_ansrow, "answerid", 		999999000)
			ids_answers.SetItem( ll_ansrow, "responderid", 	in_responderid)
			ids_answers.SetItem( ll_ansrow, "ansdate", 		idt_ans_date)
			ids_answers.SetItem( ll_ansrow, "checked", 		ll_checkna)
			ids_answers.SetItem( ll_ansrow, "headerid", 		in_headerid)
		 Elseif ll_choices > 1 then 
			ll_checkna = 1  
			For ll_a = 1 to ll_ans_1q
				ll_answerid = ids_qset_template_a.GetItemNumber( ll_a, "answerid")
				ls_colname = 'acb'+string(ll_qid,'000000000')+string( ll_answerid, '000000000')
				ll_ansrow = ids_answers.Find('questionid='+string(ll_qid) + ' and answerid='+ string(ll_answerid) , 1, ids_answers.RowCount())
				IF ll_ansrow <= 0 then ll_ansrow = ids_answers.InsertRow(0)
				ll_answer_value = f_nvl(idw_target.GetItemNumber( 1, ls_colname ),0)
				if ll_answer_value = 1 then ll_checkna = 0
				//	fill common fields 
				ids_answers.SetItem( ll_ansrow, "qsetid", 		in_qsetid)
				ids_answers.SetItem( ll_ansrow, "questionid", 	ll_qid)
				ids_answers.SetItem( ll_ansrow, "answerid", 		ll_answerid)
				ids_answers.SetItem( ll_ansrow, "responderid", 	in_responderid)
				ids_answers.SetItem( ll_ansrow, "ansdate", 		idt_ans_date)
				ids_answers.SetItem( ll_ansrow, "checked", 		ll_answer_value)
				ids_answers.SetItem( ll_ansrow, "headerid", 		in_headerid)
			Next 
			// do na
			ll_ansrow = ids_answers.Find('questionid='+string(ll_qid) + ' and answerid=999999000',1, ids_answers.RowCount())
			IF ll_ansrow <= 0 then ll_ansrow = ids_answers.InsertRow(0)
			ids_answers.SetItem( ll_ansrow, "qsetid", 		in_qsetid)
			ids_answers.SetItem( ll_ansrow, "questionid", 	ll_qid)
			ids_answers.SetItem( ll_ansrow, "answerid", 		999999000)
			ids_answers.SetItem( ll_ansrow, "responderid", 	in_responderid)
			ids_answers.SetItem( ll_ansrow, "ansdate", 		idt_ans_date)
			ids_answers.SetItem( ll_ansrow, "checked", 		ll_checkna)
			ids_answers.SetItem( ll_ansrow, "headerid", 		in_headerid)
		 ELSE
		 END IF 
		END IF // ans exist for this q 
	Next 
END IF
error.is_trace[1] = ''
end event

event ue_load_user_answers;// load user answers if any from database 

this.event ue_retrieve_user_answers() // create or update user answers datastore 

long 		ll_questions, ll_q, ll_choices, ll_qid, ll_ansrow, ll_ansrows, ll_answerid,ll_row
double	ll_answer_value
string 	ls_qtype, ls_colname, ls_expr
long 		ll_answers, ll_ans_1q, ll_a
string	ls_ddlookup, ls_ddltype, ls_ddcodecol, ls_dddispcol, ls_ddcoltype
string 	ls_fftext, ls_ddvalue, ls_ffcolname
integer	li_repeat

string  	ls_fields


ll_questions = ids_qset_template_q.RowCount()
ll_answers	 = ids_answers.RowCount() 
ls_fields	 = idw_target.Object.DataWindow.Objects
If ll_answers <= 0 then return 0

if ll_questions >0 then
FOR ll_q = 1 to ll_questions 
	
		ls_qtype   = ids_qset_template_q.Object.qgen_questions_qtypeid [ll_q]
		ll_choices = ids_qset_template_q.Object.qgen_qtypes_maxchoices [ll_q]
		ll_qid 	  = ids_qset_template_q.Object.questionid [ll_q]

		li_repeat	= ids_qset_template_q.Object.repeat		 		[ll_q]
		ls_ddlookup	= f_nvl(ids_qset_template_q.Object.ddlookup	[ll_q],'')
		ls_ddltype	= f_nvl(ids_qset_template_q.Object.ddlookuptype	[ll_q],'')
		ls_ddcodecol= f_nvl(ids_qset_template_q.Object.ddcodecol [ll_q],'')
		ls_dddispcol= f_nvl(ids_qset_template_q.Object.dddispcol [ll_q],'')
		ls_ddcoltype= f_nvl(ids_qset_template_q.Object.ddcoltype [ll_q],'')
		
		ids_qset_template_a.SetFilter ("questionid = "+string(ll_qid) )
		ids_qset_template_a.Filter() 
		ids_qset_template_a.SetSort('questionid A, sortorder A') 
		ids_qset_template_a.Sort()
		
		ll_ans_1q = ids_qset_template_a.RowCount() 

		// set Pull Down and freeform answers 
		IF POS(ls_qtype,'FF') > 0 or ls_ddlookup <> '' then 
 		 	ls_expr		= 'questionid='+string(ll_qid)  
			ids_answers.SetFilter( ls_expr) 
			ids_answers.Filter() 
			ids_answers.Sort() 
			ll_ansrows = ids_answers.RowCount() 
			If ll_ansrows > 0 then
			 FOR ll_row = 1 to ll_ansrows 
				ll_answerid = ids_answers.GetItemnumber ( ll_row, 'answerid' )
				ls_colname 	= 'add'+string(ll_qid,'000000000') + 'l'+string( ll_answerid, '00')
		 		ls_ffcolname= 'aff'+string(ll_qid,'000000000') + 'l'+string( ll_answerid, '00') 
				ls_fftext = ids_answers.GetItemString ( ll_row, 'freeform' )
				if POS( ls_fields	, ls_ffcolname) > 0 then  idw_target.SetItem( 1, ls_ffcolname, 	ls_fftext )
				If ls_ddlookup <> '' then // set dropdown column value
					ls_ddvalue = ids_answers.GetItemString ( ll_row, 'ddvalue' ) // !!!!!!!!
				 	if POS( ls_fields, ls_colname) > 0 then idw_target.SetItem( 1, ls_colname, ls_ddvalue)
				END IF
			 NEXT
			END IF   
		END IF 
		 
		If ll_ans_1q > 0 then 
	
		 If ll_choices = 1 then 
			ls_colname 	= 'arb'+string(ll_qid,'000000000')
			ls_expr		= 'questionid='+string(ll_qid)+ ' AND checked > 0 ' 
			ids_answers.SetFilter( ls_expr) 
			ids_answers.Filter() 
			ll_ansrows = ids_answers.RowCount() 
			If ll_ansrows > 0 then 
				For ll_a = 1 to ll_ansrows
					ll_answerid = ids_answers.GetItemnumber ( ll_a, 'answerid' ) 
					If ll_answerid > 999000000 then continue 
					idw_target.SetItem( 1, ls_colname, ll_answerid ) // set value to ansid
				NEXT
			END IF   
		 Elseif ll_choices > 1 then 
			ls_expr		= 'questionid='+string(ll_qid) 
			ids_answers.SetFilter( ls_expr) 
			ids_answers.Filter() 
			ll_ansrows = ids_answers.RowCount() 
			If ll_ansrows > 0 then 
				For ll_a = 1 to ll_ansrows
					ll_answerid = ids_answers.GetItemnumber ( ll_a, 'answerid' )
					If ll_answerid > 999000000 then continue 
					ls_colname = 'acb'+string(ll_qid,'000000000')+string( ll_answerid, '000000000')
					ll_answer_value = ids_answers.GetItemNumber( ll_a, "checked") 
					idw_target.SetItem( 1, ls_colname, ll_answer_value )
				NEXT
			END IF   
		 ELSE
		 END IF 
		END IF // ans exist for this q 
	Next 
END IF
ids_answers.SetFilter( '1=1') 
ids_answers.Filter() 
ids_answers.SOrt() 
idw_target.ResetUpdate()
return 1
end event

event ue_retrieve_user_answers;if Not IsValid( ids_answers) then 
	ids_answers = create DATASTORE 
	ids_answers.dataobject = 'd_qset_answers01'
	ids_answers.SetTransObject( SQLCA )
End IF //

long ll_answers, ll_user_answers, ll_rc

ll_user_answers = ids_answers.RowCount()
// get saved answers if any
If ll_user_answers <= 0 then ll_user_answers = ids_answers.Retrieve( in_responderid, idt_ans_date, in_qsetid )
If gnv_appman.is_debugmode = 'Y' then 
	MessageBox('qgen retr answers','Header ID:'+string(in_responderid) & 
			+ '~r~nAns Date:'+ string(idt_ans_date) &
			+ '~r~nQset:'+ string(in_qsetid) &
			+ '~r~nCount:'+ string(ll_user_answers ) &
			)
END IF
end event

event ue_save_qset_with_commit;long ll_rc
if not isValid(idw_target) or not Isvalid(ids_answers) then return
ll_rc = this.event ue_save_qset ()
If ll_rc <> 1 then
	ROLLBACK;
	MessageBox('Save Answers', 'Save failed.', stopsign!)
ELSE
	COMMIT;
	MessageBox('Save Answers', 'Save successful.')
END IF 


end event

event ue_clear_ddds;long ll_ddcol, ll_rc
string ls_colname
If il_maxddcol > 0 then
	For ll_ddcol = 1 to il_maxddcol
		ls_colname = is_ddcols[ll_ddcol] 
		If IsValid( ids_dropdowns[il_ddcoldsndx[ll_ddcol]]) then 
			ids_dropdowns[il_ddcoldsndx[ll_ddcol]].ShareDataOff()
			DESTROY ids_dropdowns[il_ddcoldsndx[ll_ddcol]]
		End If
	Next
END IF 
is_ddcols[] = {''}
il_maxddcol = 0
end event

event ue_create_qset_section;long 		ll_questions, ll_q, ll_choices, ll_delta_x, ll_x  , ll_ans_width
long 		ll_answers, 	ll_ans_1q,ll_qid, ll_a, ll_answerid, ll_height, ll_rbheight
string 	ls_qtype, 	ls_qtext, ls_rc, ls_rbx
string 	ls_colid, ls_valtext, ls_answidth, ls_answerx, ls_valhdr,ls_colname, ll_showqnum
int 		li_ansperline, li_repeat, li_line, li_sortorder
string	ls_ddlookup, ls_ddltype, ls_ddcodecol, ls_dddispcol, ls_ddcoltype, ls_ffcolname
string 	ls_cb_x, ls_rbcols, ls_cmd
string	ls_font, ls_fontsize, ls_bgcolor, ls_fgcolor, ls_bold, ls_ita, ls_under, ls_mode
string 	ls_answidth_pct, ls_qtext_width_pct, ls_html_ans_span, ls_rb_width , ls_qtwidth

string 	ls_html_ans_on_same_row = 'N'

ll_delta_x			= 10
ls_answerx 			= string( ii_x_start_a )
is_keep_ans_table = 'N'

ll_questions 	= ids_qset_template_q.RowCount()
FOR ll_q = 1 to ll_questions
	// Create fields for every q. depending on qtype
	ls_qtype   = ids_qset_template_q.Object.qgen_questions_qtypeid [ll_q]
	ll_choices = ids_qset_template_q.Object.qgen_qtypes_maxchoices [ll_q]
	ll_qid 	  = ids_qset_template_q.Object.questionid 				[ll_q]
	ls_qtext	  = ids_qset_template_q.Object.qgen_questions_questiontxt [ll_q]
	ls_answidth= string( ids_qset_template_q.Object.width 			[ll_q])
	li_ansperline= f_nvl(ids_qset_template_q.Object.ansperline 		[ll_q],0)
	IF li_ansperline <= 0 then li_ansperline = 1

	ls_html_ans_on_same_row = f_nvl(ids_qset_template_q.Object.same_row	[ll_q],'N')
	if trim(ls_html_ans_on_same_row) = '' then ls_html_ans_on_same_row = 'N'

	ll_showqnum = upper(ids_qset_template_q.Object.showqnum			[ll_q])
	li_sortorder= f_nvl(ids_qset_template_q.Object.sortorder			[ll_q], 0)
	li_repeat	= ids_qset_template_q.Object.repeat		 				[ll_q]
	ll_height	= ids_qset_template_q.Object.height		 				[ll_q]	
	
	ls_ddlookup	= f_nvl(ids_qset_template_q.Object.ddlookup			[ll_q],'')
	ls_ddltype	= f_nvl(ids_qset_template_q.Object.ddlookuptype		[ll_q],'')
	ls_ddcodecol= f_nvl(ids_qset_template_q.Object.ddcodecol 		[ll_q],'')
	ls_dddispcol= f_nvl(ids_qset_template_q.Object.dddispcol 		[ll_q],'')
	ls_ddcoltype= f_nvl(ids_qset_template_q.Object.ddcoltype 		[ll_q],'')
	
	ls_font		= string(f_nvl(ids_qset_template_q.Object.fontface [ll_q],''))
	ls_fontsize	= string(f_nvl(ids_qset_template_q.Object.fontsize [ll_q],0))
	ls_bgcolor	= string(f_nvl(ids_qset_template_q.Object.bgcolor [ll_q],0))
	ls_mode = '0'
	IF ls_bgcolor = '999999999' then ls_mode = '1'
	ls_fgcolor	 = string(f_nvl(ids_qset_template_q.Object.fgcolor [ll_q],0))
	ls_bold		 = string(f_nvl(ids_qset_template_q.Object.bold [ll_q],''))
	
	// Filter answer choices for this question 
	ids_qset_template_a.SetFilter ("questionid = "+string(ll_qid) )
	ids_qset_template_a.Filter() 
	ids_qset_template_a.SetSort('questionid A, sortorder A') 
	ids_qset_template_a.Sort()
	ll_ans_1q = ids_qset_template_a.RowCount() 
	
	// determine if individual widths specified for answer choices
	ll_ans_width 	= 0
	If ll_ans_1q > 0 then
		For ll_a = 1 to ll_ans_1q
			ll_ans_width = ll_ans_width + f_nvl(ids_qset_template_a.GetItemNumber( ll_a, "width"),0)
		Next 
	end if
	
	if ls_qtype = 'SCT' then 
		is_keep_ans_table = 'Y' // use one table for the whole section
	else
		if is_keep_ans_table = 'Y' and POS( ls_qtype, 'SC') <= 0 then //end of titled section
			is_keep_ans_table = 'N' // reset on first non scale 
		else // new row in a titled section
		end if
	end if

	ls_bold = '400'
	if ls_bold = 'Y' then ls_bold = '700'
		
	ls_ita		= string(f_nvl(ids_qset_template_q.Object.italic [ll_q],''))
	ls_under		= string(f_nvl(ids_qset_template_q.Object.under [ll_q],''))
		
	ll_x = ii_x_start_q
	al_y = al_y + ii_y_before_q  //zzzzzz 
//	ls_cmd = 'create text(band=detail alignment="2" text="' +ls_qtext+ '" border="0" color="0" x="'+'5'+'" y="'+string(al_y)+'" height="52" width="643"  name="qtxt'+string(ll_q,'0000') + '" font.face="MS Sans Serif" font.height="-8" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'
	string ls_text_x , ls_fontexpr
	ls_cmd = ''
	ls_text_x = string(ii_x_start_q)
	ls_fontexpr = ' font.face="'+ls_font+'" font.height="-'+ls_fontsize+'" font.weight="'+ls_bold+'" '+&
		' font.family="2" font.pitch="2" font.charset="0" background.mode="'+ls_mode+'" '+ &
		' color="'+ls_fgcolor+'" background.color="'+ls_bgcolor+'" )' // 553648127 silver
	If ll_showqnum = 'Y' then 
		ls_cmd = 'create text(band=detail alignment="0" text="' +string(li_sortorder) +'."'+ &
		' border="0" x="'+ls_text_x+'" y="'+string(al_y)+'" height="16" width="20" '+ ls_fontexpr
		ls_text_x = string(ii_x_start_q + 20)
		
	END IF  

	IF ll_ans_width > 0 then // indiv. answer widths specified use qwidth for question
		ls_qtwidth = ls_answidth
	ELSE
		ls_qtwidth = '450'
	END IF
	
	ls_cmd += 'create text(band=detail alignment="0" text="' +ls_qtext+ &
		'" border="0" x="'+ls_text_x+'" y="'+string(al_y)+&
		'" height="16" width="'+ ls_qtwidth +'" '+ ls_fontexpr 
		
	al_y = al_y + 16 // add height of text
	if not ib_html_only then ls_rc = idw_target.Modify( ls_cmd )
	If ls_rc <> '' then 
		clipboard( ls_cmd)
		MessageBox('Question field generation failed', &
		'Command in error (copied to cliboard):~r~n'+ ls_cmd + '~r~n~r~n' + ls_rc)
	End If 
	//---------------------------------------------------------------------
	// Create dropdowns if requested 
	//---------------------------------------------------------------------
	IF POS( ls_qtype, 'FF') > 0 then 
	 	if f_nvl(li_repeat,0) <= 0 then li_repeat = 1 
	 	al_y = al_y + ii_y_q_to_a
		FOR li_line=1 to li_repeat //------------------- 
		 IF ls_ddlookup <> '' then 
	     IF ls_ddltype = 'dddw' then  
			ls_cb_x =string( ii_x_start_a)
			ai_colid = ai_colid + 1
			ls_colid = string( ai_colid )
			ls_colname = 'add'+string(ll_qid,'000000000') + 'l'+ string( li_line, '00')
			is_cols[UpperBound(is_cols[])+1]= ls_colname
			as_table_cmd += ' column=(type='+ls_ddcoltype+' updatewhereclause=no name='+ls_colname+' dbname="'+ls_colname+'") '			
			//	name=ddcol_string dddw.name=d_dddw_lookup 			dddw.displaycolumn=descr dddw.datacolumn=code 		dddw.percentwidth=100 dddw.lines=0 dddw.limit=0 dddw.allowedit=no dddw.useasborder=yes dddw.case=any dddw.vscrollbar=yes  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )
 			ls_cmd = ' create column(band=detail id='+ ls_colid+ &
			' alignment="1" tabsequence='+ string( ai_colid*10) + & 
			' border="0" color="0" x="'+ls_cb_x+'" y="'+string(al_y)+'" '+ &
			' height="'+string(ll_height)+'" width="'+ls_answidth+'" format="[general]"  name='+ls_colname + &
			' dddw.name='+ls_ddlookup+' dddw.displaycolumn='+ls_dddispcol+' dddw.datacolumn='+ls_ddcodecol+ &	
			' dddw.percentwidth=100 dddw.lines=0 dddw.limit=0 dddw.allowedit=no ' + & 
			' dddw.useasborder=yes dddw.case=any dddw.vscrollbar=yes  ' + & 
			' font.face="Arial" font.height="-8" font.weight="400"  font.family="2" '+ & 
			' font.pitch="2" font.charset="0" '+ & 
			' background.mode="2" background.color="16777215" ) ' 
			as_column_cmd += ls_cmd  
			il_maxddcol ++ 
			is_ddcols[il_maxddcol] 						= ls_colname
			If li_line = 1 then 
				il_maxds ++ // share the datastore from first line 
				ids_dropdowns[il_maxds] 				= create DATASTORE 
				ids_dropdowns[il_maxds].dataobject 	= ls_ddlookup
				ids_dropdowns[il_maxds].SetTransObject( SQLCA )
				ids_dropdowns[il_maxds].Retrieve()		
				
			END IF 
			il_ddcoldsndx[il_maxddcol]= il_maxds  

	 	  ELSEif ls_ddltype = 'dduo'	then // dd user object
					// user object dd type not supported
		  ELSE 	// other ltype not supported
		  END IF // ltype 
		 End If // lookup specified
			//---------------------------------------------------------------------
			// Create free form answers after possible dropdown 
			//---------------------------------------------------------------------		
			ls_ffcolname = 'aff'+string(ll_qid,'000000000') + 'l'+ string( li_line, '00')
			ai_colid = ai_colid + 1
			ls_colid = string( ai_colid )
			as_table_cmd += ' column=(type=char(300) updatewhereclause=no name='+ls_ffcolname+' dbname="'+ls_ffcolname+'") '
			
			IF ls_ddlookup <> '' then // make x offset to the right if lookup specified
				ls_cb_x = string( integer(ls_cb_x) + integer(ls_answidth) +ll_delta_x  )
			ELSE
				ls_cb_x =string( ii_x_start_a)
			END IF 
			
			ls_cmd = ' create column(band=detail id='+ ls_colid+ &
			' alignment="0" tabsequence='+ string( ai_colid*10) + & 
			' border="5" color="0" x="'+ls_cb_x+'" y="'+string(al_y)+'" '+ &
			' edit.limit=0 edit.case=any edit.autoselect=yes edit.nilisnull=yes edit.autovscroll=yes edit.vscrollbar=yes ' + & 
			' height="'+string(ll_height)+'" width="'+ls_answidth+'" format="[general]"  name='+ls_ffcolname + &
			' font.face="Arial" font.height="-8" font.weight="400"  font.family="2" '+ & 
			' font.pitch="2" font.charset="0" '+ & 
			' background.mode="2" background.color="16777215" ) ' 
			 
			ii_input_index ++ 		
			as_column_cmd += ls_cmd  

			if li_line < li_repeat then 
				al_y = al_y + ll_height + 4
			ELSE
				al_y = al_y + ll_height
			END IF
		NEXT // line repeat loop
	END IF // 'FF'

	If ll_ans_1q > 0 then // answer choices exist 
		IF ls_qtype <> 'SCT' and POS( ls_qtype, 'FF') <= 0 then
		 IF ll_choices = 1 then
			// do radio buttons 
			//--------------------------------------------
			// Create (Value)-(Display text) pairs, 
			ls_valtext 		=''
			For ll_a = 1 to ll_ans_1q
				If is_keep_ans_table = 'Y' then // using same titles for the whole rb section
					ls_valtext += '~t'+ string(ids_qset_template_a.GetItemNumber( ll_a, "answerid"))+'/'
				ELSE
					ls_valtext += trim( ids_qset_template_a.GetItemString( ll_a, "answertxt"))+'~t'+ string(ids_qset_template_a.GetItemNumber( ll_a, "answerid"))+'/'
				END IF
			Next 
			If ll_ans_width > 0 then 
				ls_rb_width = string( ll_ans_width  )
			Else
				ls_rb_width = ls_answidth 
			End If
			If ls_html_ans_on_same_row = 'Y' or ls_html_ans_on_same_row = 'T' then 
				// keep the same y 
				al_y 		= al_y - 16 // subtr back height of text
				ls_rbx 	= string( integer( ls_text_x) + integer(ls_qtwidth) + 20 ) // add text width 
			ELSE	
				al_y 		= al_y + ii_y_q_to_a //zzzzzzzzzz
				ls_rbx 	= ls_answerx
			END IF
			ai_colid = ai_colid + 1
			ls_colid = string( ai_colid )
//			ls_cmd = 'create column(band=detail id=2 alignment="1" tabsequence=20 border="0" color="0" x="96" y="'+string(al_y)+'" height="64" width="1243" format="[general]"  name=arb'+string(ll_q,'0000')+' radiobuttons.columns=3 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912")'
//			ls_table_cmd += ' column=(type=number updatewhereclause=no name=arb'+string(ll_q,'0000')+' dbname="arb'+string(ll_q,'0000')+'" values="VAL1~t5555/VAL2~t6666/VAL3~t7777/" ) '
			ls_colname = 'arb'+string(ll_qid,'000000000')
			is_cols[UpperBound(is_cols[])+1]= ls_colname 
		 	ll_rbheight = MAX(ll_height,ceiling(ll_ans_1q/li_ansperline))
			as_table_cmd += ' column=(type=number updatewhereclause=no name='+ls_colname+' dbname="'+ls_colname+'" values="' +ls_valtext+ '" ) '			
	 		ls_cmd = ' create column(band=detail id='+ ls_colid+ ' alignment="1" tabsequence='+ string( ai_colid*10) +&
			 		' border="0" color="0" x="'+ ls_rbx+'" y="'+string(al_y)+'" height="'+string(ll_rbheight)+'"'+ &
				  	' width="'+ls_rb_width +'" format="[general]"  name=arb'+string(ll_q,'0000')+ & 
			 		' radiobuttons.columns='+string(li_ansperline)+ &
					' radiobuttons.scale=no radiobuttons.threed=yes  ' + & 
					' font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'
			as_column_cmd += ls_cmd  //+string(ll_colid) + 
			al_y = al_y + ll_rbheight

		Elseif ll_choices > 1 then // create check boxes
			al_y = al_y + ii_y_q_to_a
			
			int li_col
			li_col = 1 
			ls_cb_x = ls_answerx
			For ll_a = 1 to ll_ans_1q 
				ai_colid = ai_colid + 1
				ls_colid = string( ai_colid )
				ll_answerid = ids_qset_template_a.GetItemNumber( ll_a, "answerid")
				ls_colname = 'acb'+string(ll_qid,'000000000')+string( ll_answerid, '000000000')
				is_cols[UpperBound(is_cols[])+1]= ls_colname
				ls_valhdr = trim( ids_qset_template_a.GetItemString( ll_a, "answertxt"))
				ls_valtext = ls_valhdr +'~t1/'+ ls_valhdr +'~t0'
				as_table_cmd += ' column=(type=number updatewhereclause=no name='+ls_colname+' dbname="'+ls_colname+'" values="' +ls_valtext+ '" ) '			
		 		ls_cmd = ' create column(band=detail id='+ ls_colid+ ' alignment="1" tabsequence='+ string( ai_colid*10) +' border="0" color="0" x="'+ls_cb_x+'" y="'+string(al_y)+'" height="'+string(ll_height)+'" width="'+ls_answidth+'" format="[general]"  name=arb'+string(ll_q,'0000')+' checkbox.text="'+ls_valhdr+'" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'
				as_column_cmd += ls_cmd  //+string(ll_colid) +
				ls_cb_x = string( integer(ls_answidth) + integer(ls_cb_x))
				li_col ++
				If ll_a < ll_ans_1q and li_col > li_ansperline then
					ls_cb_x = ls_answerx
					al_y += ll_height + 2
					li_col=1
				ELSE 
					if ll_a = ll_ans_1q then al_y += ll_height
				End If
			Next 
		 ELSE		// ll_choices
		 END IF 	// ll_choices
		ELSE		// SCT qtype : create text boxes similar check boxes - individual fields
			string ls_ttxt_width , ls_tx
			// keep the same y 
			al_y 		= al_y - 16 // subtr back height of text
			ls_tx 	= string( integer( ls_text_x) + integer(ls_qtwidth) + 20 ) // add text width 
			For ll_a = 1 to ll_ans_1q 
				ll_answerid = ids_qset_template_a.GetItemNumber( ll_a, "answerid")
				ls_ttxt_width = string( f_nvl(ids_qset_template_a.GetItemNumber( ll_a, "width"),100))
				ls_valhdr = trim( ids_qset_template_a.GetItemString( ll_a, "answertxt"))
				
				ls_cmd += 'create text(band=detail alignment="2" text="' +ls_valhdr + &
				'" border="0" x="'+ls_tx +'" y="'+string(al_y) + &
				'" height="16" width="'+ ls_ttxt_width +'" '+ ls_fontexpr 
				
				ls_tx = string( integer(ls_tx) + integer(ls_ttxt_width)  )
				if ll_a = ll_ans_1q then al_y += ll_height
			 Next 
				if not ib_html_only then ls_rc = idw_target.Modify( ls_cmd )
				If ls_rc <> '' then 
					clipboard( ls_cmd)
					MessageBox('Scale Section title generation failed', &
					'Command in error (copied to cliboard):~r~n'+ ls_cmd + '~r~n~r~n' + ls_rc)
				End If 

			END IF 	// SCT qtype

	ELSE			// ll_ans_1q = 0
	End IF		// ll_ans_1q > 0 

NEXT				// questions loop

end event

event ue_create_qset_hier_level;datastore lds_hier 

lds_hier = create DATASTORE 
lds_hier.dataobject = 'd_qgen_hierarchy'
lds_hier.SetTransObject( SQLCA )

long 					ll_row, ll_maxrow
string 				ls_leafind, ls_id, ls_level
double   			ld_present_id
str_vzt_present 	lstr_present 
string ls_text_x , ls_fontexpr, ls_qtext, ls_rc, ls_cmd

ii_level = ii_level + 1 
		
ll_maxrow = lds_hier.retrieve ( trim(as_parent_id ))
if ll_maxrow <= 0 then 
//	MessageBox( 'QSET creation error', 'Failed to retrieve hierarchy section for parentid:' + as_parent_id)
	return 0 
end if

FOR ll_row = 1 to ll_maxrow
	ls_qtext			= f_nvl(lds_hier.object.name[ ll_row ],'')
	ls_leafind 		= lds_hier.object.leafind [ ll_row ]
	If ls_leafind 	= 'Y' then 
		// create question section and return 
		ids_qset_template_q.Retrieve( as_parent_id ) // retrieve section 
		this.event ue_create_qset_section(ai_colid, al_y, as_column_cmd, as_table_cmd, ab_html) // single section 
		exit 
	ELSE
		// Create text and process children on next level 
		ld_present_id 	= f_nvl(lds_hier.object.present_id[ ll_row ],0)
		lstr_present 	= f_vzt_get_present( ld_present_id ) // get hier text font 
		
		if not ib_html_only then 		
			al_y = al_y + ii_y_before_q  + lstr_present.Y_BEFORE
			ls_text_x = string(ii_x_start_q + lstr_present.x) 

			ls_fontexpr = ' font.face="'+lstr_present.fontface+'" font.height="-'+string(abs(lstr_present.fontsize))+'" font.weight="'+lstr_present.fontweight+'" '+&
			' font.family="2" font.italic="'+lstr_present.fontitalic+'" font.underline="'+lstr_present.fontunderline+'" font.pitch="2" font.charset="0" background.mode="'+lstr_present.mode +'" '+ &
			' color="'+string(lstr_present.fontfgcolor)+'" background.color="'+string(lstr_present.fontbgcolor)+'" )' // 553648127 silver
			ls_cmd += 'create text(band=detail alignment="0" text="' +ls_qtext+ &
			'" border="0" x="'+ls_text_x+'" y="'+string(al_y)+&
			'" height="'+string(lstr_present.height)+'" width="450" '+ ls_fontexpr
			al_y = al_y + lstr_present.height + lstr_present.y_after 
			ls_rc = idw_target.Modify( ls_cmd )
			if ls_rc <> '' then MessageBox('QGEN Title creation', 'Title creation failed on item "'+ ls_qtext+ '~r~n~r~nFailing String:~r~n'+ls_cmd ) 
		end if
		
		ls_id = lds_hier.object.id[ ll_row ] 
		
		ls_level	= string( f_nvl(ii_level,0), '00') 
		this.event ue_create_qset_hier_level( ls_id, ai_colid, al_y, as_column_cmd, as_table_cmd, ab_html ) 
		
	END IF 
NEXT 

destroy lds_hier 
ii_level = ii_level - 1 
return 0

end event

event ue_get_qset_html_header;return 'functionality not available'
end event

event ue_get_qset_html_footer;return 'functionality not available'
end event

event ue_html_w1q;return 'functionality not available'
end event

event ue_html_avail_surveys_header;return 'function not available'
end event

event ue_html_avail_surveys_footer;return 'function not available'
end event

event ue_html_avail_surveys;return 'function not available'
end event

event ue_html_get_answer_tr;return 'functionality not available'
end event

event ue_html_get_styles;return 'functionality not available'
end event

event ue_find_survey_syntax;string ls_syntax, ls_preview 
int		li_index, li_dim

li_dim = upperbound(in_surveys[])
ls_preview = '...............'
FOR li_index=1 to li_dim 
	If in_surveys[li_index] = ad_qsetid then // found 
		If not ab_save then // load target dw
			idw_target.Create( is_syntax[li_index] , ls_preview ) 
			return 1
		END IF
	END IF
NEXT 

// if not found and saving... 
If ab_save then // load target dw
	ls_syntax = idw_target.Describe("DataWindow.Syntax") 
	is_syntax[li_dim+1] = ls_syntax
	in_surveys[li_dim+1]= ad_qsetid
	return 2
END IF 

return -1 // not found

end event

event ue_save_survey;if idw_target.rowcount() > 0 and not ab_readonly then 
	long ll_rc, ll_cnt
	string ls_sql
	// check if existing survey 
	SELECT count(*) INTO :ll_cnt FROM qgen_qset_answers WHERE headerid = :ad_idgcc ;
	ll_cnt = f_nvl( ll_cnt, 0)
	If gnv_appman.is_debugmode = 'Y' then
		ls_sql = "SELECT count(*) FROM qgen_qset_answers WHERE headerid = "+ string(ad_idgcc) 
		clipboard( ls_sql)
		MessageBox( 'DEBUG w_gcc_feedback.ue_save_survey()', ls_sql + '~r~n~r~n' & 
				+ '~r~nCount='+ string( ll_cnt) +'~r~nCopied to clipboard.')
	END IF		
	
	ll_rc = this.event ue_save_qset()
	if ll_rc > 0 and ll_cnt > 0 then 
		blob l_blob
		string	ls_openedby
		ls_openedby = gnv_appman.is_userid 
		l_blob = blob('')
		f_write_gcc_history( ad_idgcc, 'MOD', l_blob, 'Survey Modified' , ls_openedby, '')
	end if
end if
return ll_rc

end event

event ue_target_dclick;if ii_target_x < 100 then
	// maximize
	ii_target_w	= idw_target.width
	ii_target_x = idw_target.x
	idw_target.width = idw_target.width + idw_target.x - 10
	idw_target.x = 10 
//	idw_target.setItem( 1, 'state', 'X')
ELSE
	// minimize
	idw_target.width 	= ii_target_w	
	idw_target.x 		= ii_target_x
	ii_target_x			= 0
	ii_target_w			= 0
//	idw_target.setItem( 1, 'state', '')
END IF
	
end event

public function string uf_getstring (string as_colname, string as_coltype);string ls_value, ls_type

ls_type = lower(as_coltype) 
ls_value=''
If ls_type = 'number' then 
	ls_value = string(idw_target.GetItemNumber( 1, as_colname ))
ElseIf POS(ls_type,'string') > 0 or POS(ls_type,'char') > 0  then 
	ls_value = idw_target.GetItemString( 1, as_colname )
End If

return ls_value
end function

on nvo_qgen.create
TriggerEvent( this, "constructor" )
end on

on nvo_qgen.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;if IsValid( ids_answers) 			then DESTROY ids_answers
if IsValid( ids_qset_template_a) then DESTROY ids_qset_template_a
if IsValid( ids_qset_template_q) then DESTROY ids_qset_template_q
this.event ue_clear_ddds()
end event

event constructor;if Not IsValid( ids_qset_template_q) then 
	ids_qset_template_q = create DATASTORE 
	ids_qset_template_q.dataobject = 'd_qlist02q'
	ids_qset_template_q.SetTransObject( SQLCA )
End If

if Not IsValid( ids_qset_template_a) then 	
	ids_qset_template_a = create DATASTORE 
	ids_qset_template_a.dataobject = 'd_qlist02a'
	ids_qset_template_a.SetTransObject( SQLCA )
End IF 


end event

