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
event type string ue_web_tran ( ref boolean ab_webdb,  ref string as_dparm,  ref transaction at_web_tran )
event type integer ue_find_survey_syntax ( double ad_qsetid,  boolean ab_save )
event type integer ue_save_survey ( double ad_idgcc,  boolean ab_readonly )
event ue_target_dclick ( )
event ue_save_qset_html_http ( integer ai_property_id )
end type
global nvo_qgen nvo_qgen

type variables
// HTTP interface
string 	is_url , is_dparm 
boolean	ib_webdb, ib_http , ib_local_db_only // ignore web db even if in sysoptions


// web qset graphics:
string	is_web_title_pic_left, is_web_title_pic_right, is_web_title_pic_top, is_web_title_pic_bottom, 	is_web_title_pic_bg   
string	is_web_qpic_left, is_web_qpic_right, is_web_qpic_top, is_web_qpic_bottom, is_web_qpic_bg  

datastore  	ids_qset_template_q, ids_qset_template_a
datastore	ids_dropdowns[]
datastore  	ids_answers, ids_presentation // d_presentation_web

long  		il_maxds, il_maxddcol,  il_ddcoldsndx[]
string      is_cols[], is_ddcols[], is_html_temp, is_syntax[] 
double    	in_qsetid, in_surveys[], in_responderid, in_headerid
datawindow 	idw_target
datetime   	idt_ans_date // date to use from caller
boolean		ib_norefresh
integer 		ii_target_x, ii_target_w
integer		ii_ystart, ii_y_before_q, ii_y_q_to_a, ii_level=0
integer		ii_x_start_q, ii_x_start_a,  ii_html_table_cols=6
blob			ib_html
boolean		ib_html_only, ib_html_comments=true
integer		ii_input_index=0
string		is_html_table_q_bgcolor='#eccc55', crlf='~r~n'
string		is_html_table_a_bgcolor='#ffaa44'
string		is_html_table_t_bgcolor='#22ffff'
string		is_html_table_l_bgcolor='#dd3355' //level (section)
string		is_fontface, is_fontsize, is_bold, is_italic, is_under   
string    	is_fgcolor, is_bgcolor, is_id, is_border, is_borderthickness 
string		is_keep_ans_table

end variables

forward prototypes
public function string uf_getstring (string as_colname, string as_coltype)
public function string uf_img_tag (string as_picfile, integer ai_spacing)
end prototypes

event type integer ue_create_qset(double an_qsetid, ref datawindow adw_target);idw_target = adw_target

string	ls_descr, ls_hier, ls_colname, ls_table_cmd, ls_column_cmd, ls_rc
long		ll_questions , ll_y, ll_delta_y, ll_answers, ll_present 
int		li_colid
string	ls_title_size, ls_html='' 
boolean	lb_fast

if not IsValid(adw_target) or IsNUll(adw_target) then ib_html_only = true // HTML 
ib_html = blob('')

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
		// ======= idw_target.POST ResetUpdate()
		If IsValid(ids_answers) then ids_answers.reset()
		return 1// fast option
	end if		
End If

in_qsetid = an_qsetid 
//---------------------------------------------------
//	Get current QSET options
//---------------------------------------------------
SELECT 	y_start, 	y_before_q, 	y_q_to_a, 		x_start_a, 		x_start_q , 	descr, 		use_hierarchy ,
 			web_title_pic_left, web_title_pic_right, web_title_pic_top, web_title_pic_bottom, 	web_title_pic_bg,   
         web_qpic_left, web_qpic_right, web_qpic_top, web_qpic_botom, web_qpic_bg  
INTO		:ii_ystart, :ii_y_before_q, :ii_y_q_to_a, :ii_x_start_a, :ii_x_start_q, :ls_descr, :ls_hier,
			:is_web_title_pic_left, :is_web_title_pic_right, :is_web_title_pic_top, :is_web_title_pic_bottom, 	:is_web_title_pic_bg,   
			:is_web_qpic_left, :is_web_qpic_right, :is_web_qpic_top, :is_web_qpic_bottom, :is_web_qpic_bg  

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
	// HTML Qset title row 

		ls_title_size = '3'
	
		if trim(f_nvl(is_web_title_pic_top,'')) <> '' then // top picture file 
			ls_html +='<TR CLASS=qtr01>'+crlf 
			ls_html +='<TD CLASS=qstitle01 COLSPAN="'+string(ii_html_table_cols) +'" WIDTH=100%>'
			ls_html += uf_img_tag(is_web_title_pic_top,0) +  '</TD></TR>'
		end if
		
		ls_html +='<TR CLASS=qtr01>'+crlf+'<CENTER>'
		ls_html +='<TD CLASS=qstitle01 COLSPAN="'+string(ii_html_table_cols) +'" WIDTH=100%>'
		ls_html += uf_img_tag(is_web_title_pic_left,3) +ls_descr + uf_img_tag(is_web_title_pic_right,3) + '</TD></CENTER></TR>' + crlf // close the title row 

		if trim(f_nvl(is_web_title_pic_bottom,'')) <> '' then // bottom picture file 
			ls_html +='<TR CLASS=qtr01>'+crlf
			ls_html +='<TD CLASS=qstitle01 COLSPAN="'+string(ii_html_table_cols) +'" WIDTH=100%>'
			ls_html += uf_img_tag(is_web_title_pic_bottom,0) +  '</TD></TR>'
		end if
	
		ib_html = ib_html + blob(ls_html )

	this.event ue_create_qset_hier_level( ls_h_id, li_colid, ll_y, ls_column_cmd, ls_table_cmd, ib_html ) 
ELSE // not a hierarchical qset
	ls_html +='<TR CLASS=qtr01>'+crlf+ '<CENTER>'
	ls_html +='<TD CLASS=qstitle01 COLSPAN="'+string(ii_html_table_cols) +'" WIDTH=100%>'
	ls_html += uf_img_tag(is_web_title_pic_left,3) +ls_descr + uf_img_tag(is_web_title_pic_right,3) + '</TD></CENTER></TR>' + crlf // close the title row 
	ib_html = ib_html + blob(ls_html )
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
	idw_target.SetItemStatus(1, 0,Primary!, Notmodified!)
	//  idw_target.post ResetUpdate()
//	this.event ue_find_survey_syntax( an_qsetid, true) 
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

event ue_create_user_answers();// create or update user answers datastore 
long 		ll_questions, ll_q, ll_choices, ll_qid, ll_ansrow , ll_answerid
double	ll_answer_value
string 	ls_qtype, ls_colname
long 		ll_answers, 	ll_ans_1q, ll_a, ll_checkna
string	ls_ddsql, ls_dddo, ls_ddcodecol, ls_dddispcol, ls_ddcoltype, ls_ddlookup,ls_ddltype
string 	ls_fftext, ls_ddvalue, ls_ffcolname, ls_ffRBcolname, ls_ffRB_POSNEG
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
			 	ls_colname 		= 'add'+string(ll_qid,'000000000')+ 'l'+ string( li_line, '00')
			 	ls_ffcolname	= 'aff'+string(ll_qid,'000000000')+ 'l'+ string( li_line, '00') 
			 	ls_ffRBcolname	= 'affrb'+string(ll_qid,'000000000')+ 'l'+ string( li_line, '00') 
				ls_fftext		= idw_target.GetItemString( 1, ls_ffcolname )
				ls_ffRB_POSNEG = f_nvl(idw_target.GetItemString( 1, ls_ffRBcolname),'')
				
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
			
				ids_answers.SetItem( ll_ansrow, "POSNEG", 		ls_ffRB_POSNEG)
				
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

event type integer ue_load_user_answers();// load user answers if any from database 

this.event ue_retrieve_user_answers() // create or update user answers datastore 

long 		ll_questions, ll_q, ll_choices, ll_qid, ll_ansrow, ll_ansrows, ll_answerid,ll_row
double	ll_answer_value
string 	ls_qtype, ls_colname, ls_expr
long 		ll_answers, ll_ans_1q, ll_a
string	ls_ddlookup, ls_ddltype, ls_ddcodecol, ls_dddispcol, ls_ddcoltype
string 	ls_fftext, ls_ddvalue, ls_ffcolname, ls_ffRBcolname, ls_posneg
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
				ls_ffRBcolname= 'affrb'+string(ll_qid,'000000000') + 'l'+string( ll_answerid, '00') 
				ls_fftext = ids_answers.GetItemString ( ll_row, 'freeform' )
				ls_posneg = ids_answers.GetItemString ( ll_row, 'posneg' )
				
				if POS( ls_fields	, ls_ffcolname) 	> 0 then  idw_target.SetItem( 1, ls_ffcolname, 	 ls_fftext )
				if POS( ls_fields	, ls_ffRBcolname) > 0 then  idw_target.SetItem( 1, ls_ffRBcolname, ls_posneg)

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
idw_target.SetItemStatus(1, 0,Primary!, Notmodified!)
//idw_target.ResetUpdate()
return 1
end event

event ue_retrieve_user_answers();if Not IsValid( ids_answers) then 
	ids_answers = create DATASTORE 
	ids_answers.dataobject = 'd_qset_answers01'
	ids_answers.SetTransObject( SQLCA )
End IF //

long ll_answers, ll_user_answers, ll_rc

ll_user_answers = ids_answers.RowCount()
// get saved answers if any
If ll_user_answers <= 0 then ll_user_answers = ids_answers.Retrieve( in_responderid, idt_ans_date, in_qsetid )
If gnv_appman.is_debugmode = 'Y' then 
	ids_answers.SaveAs ('c:\qset_answers.xls', EXCEL5!, true ) 
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

event ue_create_qset_section(ref integer ai_colid, ref long al_y, ref string as_column_cmd, ref string as_table_cmd, ref blob ab_html);long 		ll_questions, ll_q, ll_choices, ll_delta_x, ll_x  , ll_ans_width
long 		ll_answers, 	ll_ans_1q,ll_qid, ll_a, ll_answerid, ll_height, ll_rbheight
string 	ls_qtype, 	ls_qtext, ls_rc, ls_rbx
string 	ls_colid, ls_valtext, ls_answidth, ls_answerx, ls_valhdr,ls_colname, ll_showqnum
int 		li_ansperline, li_repeat, li_line, li_sortorder
string	ls_ddlookup, ls_ddltype, ls_ddcodecol, ls_dddispcol, ls_ddcoltype, ls_ffcolname
string 	ls_cb_x, ls_rbcols, ls_cmd
string	ls_font, ls_fontsize, ls_bgcolor, ls_fgcolor, ls_bold, ls_ita, ls_under, ls_mode
string 	ls_answidth_pct, ls_qtext_width_pct, ls_html_ans_span, ls_rb_width , ls_qtwidth
string	ls_ffRBcolname, ls_answidthpct_expr
int		li_ans_rows , li_answidth_pct 

//html	variables
string	ls_html_qnum, ls_html_bold, ls_html, ls_html_ans_on_same_row='N'
string	ls_html_qtext_span, ls_html_dd, ls_html_ans_text, ls_html_ans_id, ls_html_input_name
string 	ls_html_qid, ls_html_colname , ls_html_ffcolname, ls_weblookup, ls_ans_width_pct
int		li_html_ansperline, li_html_ans , li_ans_area , li_ans_webwidth, li_ans_webheight 

long		ll_present_id, ll_present_y_before, ll_present_y_after  , ll_prow

ll_delta_x			= 10
ls_answerx 			= string( ii_x_start_a )
ls_html				= '' //clear for section 
is_keep_ans_table = 'N'

ll_questions 	= ids_qset_template_q.RowCount()
FOR ll_q = 1 to ll_questions

	// ===========================================================================
	// Get presentation info 
	// ===========================================================================
	ll_present_y_before = 0  
	ll_present_y_after  = 0

	ll_present_id	= ids_qset_template_q.Object.present_id [ll_q] 
	If ll_present_id > 0 then 
		ll_prow = ids_presentation.Retrieve( ll_present_id)  
		If ll_prow = 1 then 
			ll_present_y_before = ids_presentation.GetItemNumber( ll_prow, 'y_before')
			ll_present_y_after  = ids_presentation.GetItemNumber( ll_prow, 'y_after')
		END IF
	END IF
	
	// Create fields for every q. depending on qtype
	ls_qtype   = ids_qset_template_q.Object.qgen_questions_qtypeid [ll_q]
	ll_choices = ids_qset_template_q.Object.qgen_qtypes_maxchoices [ll_q]
	ll_qid 	  = ids_qset_template_q.Object.questionid 				[ll_q]
	ls_html_qid= string(ll_qid)
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
	ls_weblookup= f_nvl(ids_qset_template_q.Object.weblookup			[ll_q],'')
	
	ls_font		= string(f_nvl(ids_qset_template_q.Object.fontface [ll_q],''))
	ls_fontsize	= string(f_nvl(ids_qset_template_q.Object.fontsize [ll_q],0))
	ls_bgcolor	= string(f_nvl(ids_qset_template_q.Object.bgcolor [ll_q],0))
	ls_mode = '0'
	IF ls_bgcolor = '999999999' then ls_mode = '1'
	ls_fgcolor	 = string(f_nvl(ids_qset_template_q.Object.fgcolor [ll_q],0))
	ls_bold		 = string(f_nvl(ids_qset_template_q.Object.bold [ll_q],''))
	ls_html_bold = ls_bold	
	
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
		If is_keep_ans_table = 'Y' then // already in Scale Title mode - must be new TITLE HEADER - 
			ls_html +='</TABLE></TD></TR>'+crlf // CLOSE answer choices table, outer TD and outer TR
			if ib_html_comments then ls_html += '<!-- closed ans choices table and TD for outer table on non-scale q. -->'+crlf		  						
		END IF 
		is_keep_ans_table = 'Y' // use one table for the whole section
	else
		if is_keep_ans_table = 'Y' and POS( ls_qtype, 'SC') <= 0 then //end of titled section
			is_keep_ans_table = 'N' // reset on first non scale 
			ls_html +='</TABLE></TD></TR>'+crlf // CLOSE answer choices table, outer TD and outer TR
			if ib_html_comments then ls_html += '<!-- closed ans choices table and TD for outer table on non-scale q. -->'+crlf		  						
		else // new row in a titled section
			ls_html +='<TR CLASS=ATR01 ></TR>'+crlf // add empty row for looks
		end if
	end if

	//HTML -- create q text column   
	if ls_html_ans_on_same_row = 'Y' or ls_html_ans_on_same_row = 'T' or ls_qtype = 'SCT' then 
		ls_html_qtext_span 	= '1'
		ls_qtext_width_pct 	= '100%'
		ls_ans_width_pct 		= '100%'
		ls_html_ans_span 		= string( MIN ( ii_html_table_cols - 1, 1) ) 
		li_ans_area 			= 40 // only half the screen
	ELSE
		ls_html_qtext_span 	= string(ii_html_table_cols)
		ls_qtext_width_pct 	= '100%'
		ls_ans_width_pct 		= '100%'
		ls_html_ans_span 		= ls_html_qtext_span // same cols as q
		li_ans_area 			= 100 // all screen width
	END IF
	if ib_html_comments then ls_html += '<!-- question start--'+ string(ll_q)+ ' -->'+crlf

	//=============================================================================
	// if y-before specified = add a spacer row 
	//=============================================================================
	if ll_present_y_before > 16 then  
		ls_html +='<TR CLASS=qtr01>'+crlf 
		ls_html += '<TD CLASS=QTD01 VALIGN="baseline" COLSPAN="22" WIDTH=100% >'+crlf
  		ls_html += '   </TD></TR>'
	end if
	
	//=============================================================================
	// top picture file in its own row 
	//=============================================================================
	if trim(f_nvl(is_web_qpic_top,'')) <> '' then // 
		ls_html +='<TR CLASS=qtr01>'+crlf 
		ls_html += '<TD CLASS=QTD01 VALIGN="baseline" COLSPAN="'+ls_html_qtext_span +'" WIDTH='+ ls_qtext_width_pct +'>'+crlf
  		ls_html += uf_img_tag(is_web_qpic_top,0) +  '</TD></TR>'
	end if
	
	If is_keep_ans_table = 'Y' then 
		if ls_qtype = 'SCT' then 
			ls_html +='<TR CLASS=QTR01 >'+crlf // add outer TR for title row only
		else
			// added later ls_html +='<TR CLASS=QTR01 >'+crlf // add inner TR for scale rows
		end if
	else
		ls_html +='<TR CLASS=QTR01 >'+crlf
	end if
	
	if ls_html_ans_on_same_row = 'N' and ls_qtype <> 'SCT' then // add row
		ls_html += '<TD CLASS=QTD01 VALIGN="baseline" COLSPAN="'+ls_html_qtext_span +'" WIDTH='+ ls_qtext_width_pct +'>'+crlf
  		ls_html 	+= uf_img_tag(is_web_qpic_left,3) + ls_qtext + uf_img_tag(is_web_qpic_right,3);
  		ls_html	+=	'</TD>'+ crlf
		// if answers are not on same row - start new row 
	  	ls_html	+=	'</TR>'+crlf 
	
		if trim(f_nvl(is_web_qpic_bottom,'')) <> '' then // bottom picture file 
			ls_html +='<TR CLASS=qtr01>'+crlf 
			ls_html += '<TD CLASS=QTD01 VALIGN="baseline" COLSPAN="'+ls_html_qtext_span +'" WIDTH='+ ls_qtext_width_pct +'>'+crlf
  			ls_html += uf_img_tag(is_web_qpic_bottom,0) +  '</TD></TR>'
		end if
	
		ls_html 	+= '<TR CLASS=ATR01 >'+crlf // outer table row
	else // same row, or titles qtext - style as question except when in ans table
		// use answer table - column 1 - for question text
	end if
	if ib_html_comments then ls_html 	+= '<!-- answers start -->'+crlf		  	
	
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
		ls_cmd = ' create text(band=detail alignment="0" text="' +string(li_sortorder) +'."'+ &
		' border="0" x="'+ls_text_x+'" y="'+string(al_y)+'" height="16" width="20" '+ ls_fontexpr
		ls_text_x = string(ii_x_start_q + 20)
		
		ls_html_qnum = string(li_sortorder) 
	END IF  

	IF ll_ans_width > 0 then // indiv. answer widths specified use qwidth for question
		ls_qtwidth = ls_answidth
	ELSE
		ls_qtwidth = '450'
	END IF
	
	ls_cmd += ' create text(band=detail alignment="0" text="' +ls_qtext+ &
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

		// VZ 2006 06 28 - add table around FREE FORM 
	
  		ls_html	+=	crlf+'<TD CLASS=ATD01 VALIGN="TOP" COLSPAN="1" WIDTH=1%>' +crlf 
		ls_html	+= crlf+'<TABLE CLASS=ATABLE01 WIDTH=100% CELLPADDING=0 CELLSPACING=0 BORDERWIDTH=0>' // ans choices table
	
		//===== FREE FORM with/without DD loop =======
		FOR li_line=1 to li_repeat 

		ls_html 	+='<TR CLASS=QTR01>'+crlf // VZ 2006 06 28
 
		 IF ls_ddlookup <> '' then 
	     IF ls_ddltype = 'dddw' then  
			ls_cb_x =string( ii_x_start_a)
			ai_colid = ai_colid + 1
			ls_colid = string( ai_colid )
			ls_colname = 'add'+string(ll_qid,'000000000') + 'l'+ string( li_line, '00')
			ls_html_colname = 'add_q'+string(ll_qid) + 'l'+ string( li_line) 
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
				//HTML Create dropdowns: SELECT				
				ls_html_dd 	=	f_vzt_html_select_from_ds (ids_dropdowns[il_maxds], ls_ddcodecol, ls_dddispcol, SQLCA, '' )
				
			END IF 
			il_ddcoldsndx[il_maxddcol]= il_maxds  

			//HTML Create dropdowns: SELECT
			If ib_html_only then
				if ib_html_comments then ls_html += '<!-- web dropdown start -->'+crlf		  				
//		  		ls_html	+=	'<TD VALIGN="TOP" ALIGN="LEFT" COLSPAN="1" WIDTH=40%><font face="'+ls_font+'" SIZE=-2>'+crlf // WIDTH=100%
				
				
				If ls_weblookup <> 'Y'  then	//skip web dropdown, use placeholder
					if ib_html_comments then ls_html 	+= '<!-- web dropdown hidden -->'+crlf		  				
			  		ls_html	+=	'<TD CLASS=ATD01 VALIGN="TOP" COLSPAN="1" WIDTH=1%>' +crlf 
					ls_html	+=	'<CENTER><b>'
					ls_html	+=	'<INPUT TYPE="HIDDEN" NAME="'+ls_html_colname+ '" value="">'+crlf
				Else 		
			  		ls_html	+=	'<TD CLASS=ATD01 VALIGN="TOP" COLSPAN="1" WIDTH=40%>' +crlf 
					ls_html	+=	'<CENTER><b>'
					if ib_html_comments then ls_html += '<!-- web dropdown as select -->'+crlf		  				
					ls_html	+=	'<SELECT CLASS=ASEL01 NAME="'+ls_html_colname+'" >'+crlf
					ls_html	+= ls_html_dd 	
					ls_html	+=	'</SELECT>'
					if ib_html_comments then ls_html += '<!-- web dropdown as select end -->'+crlf		  							
				END IF
				ls_html	+=	'</CENTER>'
				ls_html	+=	'</TD>'+crlf // end column 
				ii_input_index	++ 
			end if //html only 
			
	 	  ELSEif ls_ddltype = 'dduo'	then // dd user object
					// user object dd type not supported
		  ELSE 	// other ltype not supported
		  END IF // ltype 
		 End If // lookup specified
		 
		 	//---------------------------------------------------------------------
			// Create free form answers after possible dropdown 
			//---------------------------------------------------------------------		
			ls_ffcolname = 'aff'+string(ll_qid,'000000000') + 'l'+ string( li_line, '00')
			ls_html_ffcolname = 'aff_q'+string(ll_qid) + 'l'+ string( li_line)
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
			' background.mode="2" background.color="16777215" )  ' 
			as_column_cmd += ls_cmd  

			//---------------------------------------------------------------------
			// Create POS/NEG radio buttons after free form answers 
			//---------------------------------------------------------------------		
			ls_ffRBcolname = 'affrb'+string(ll_qid,'000000000') + 'l'+ string( li_line, '00')
			ai_colid = ai_colid + 1
			ls_colid = string( ai_colid ) 
			ls_valtext = 'Pos~t'+ 'P/Neg~tN'
			ls_rb_width = '80'
			
			is_cols[UpperBound(is_cols[])+1]= ls_ffRBcolname 
		 	as_table_cmd += ' column=(type=char(1) updatewhereclause=no name='+ls_ffRBcolname+' dbname="'+ls_ffRBcolname+'" values="' +ls_valtext+ '" ) '			
			ls_rbx 	= string( integer( ls_cb_x) + integer(ls_answidth) + 20 ) // 
			ls_cmd = ' create column(band=detail id='+ ls_colid+ ' alignment="1" tabsequence='+ string( ai_colid*10) +&
			 		' border="0" color="0" x="'+ ls_rbx+'" y="'+string(al_y)+'" height="'+string(ll_height)+'"'+ &
				  	' width="'+ls_rb_width +'" format="[general]"  name='+ls_ffRBcolname + & 
			 		' radiobuttons.columns=2 visible="1~tif(len(trim('+ ls_ffcolname + ')) > 0, 1,0)" ' + &
					' radiobuttons.scale=no radiobuttons.threed=yes  ' + & 
					' font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" ) '
			as_column_cmd += ls_cmd  
				
			//---------------------------------------------------------------------
			// End of POS/NEG radio buttons after free form answers 
			//---------------------------------------------------------------------		
				
			//--------------------
			// Free Form html 
			//--------------------
			if ib_html_comments then ls_html 	+= '<!-- free form start -->'+crlf		  				
//		  	ls_html	+=	'<TD VALIGN="TOP" ALIGN="LEFT" COLSPAN="1" WIDTH=40%><font face="'+ls_font+'" SIZE=-2>'+crlf 
		  	ls_html	+=	'<TD CLASS=ATD01 VALIGN="TOP" COLSPAN="1" WIDTH=40%>'+crlf 
			If ids_qset_template_a.RowCount() > 0 then // get height/width if specified
				li_ans_webwidth 	= f_nvl(ids_qset_template_a.GetItemNumber( 1, "webwidth"),0) 
				li_ans_webheight 	= f_nvl(ids_qset_template_a.GetItemNumber( 1, "webheight"),0)
			END IF
			if li_ans_webwidth 	<= 0 then li_ans_webwidth 	= 50  //cols
			if li_ans_webheight 	<= 0 then li_ans_webheight = 2  // rows 
//	      ls_html	+=	'<input CLASS=AFF01 type="text" size="60" name="'+ls_html_ffcolname 
	      ls_html	+=	'<TEXTAREA CLASS=AFF01 ROWS="' +string(li_ans_webheight )+ '" cols="'+string(li_ans_webwidth) +'" name="'+ls_html_ffcolname 
			ls_html	+=	'" ></TEXTAREA></TD>'+crlf
			ii_input_index ++ 		
//			as_column_cmd += ls_cmd  

			if li_line < li_repeat then 
				al_y = al_y + ll_height + 4
			ELSE
				al_y = al_y + ll_height
			END IF
		// start new HTML table row for repeated lines only
			if li_line < li_repeat then 
				if ib_html_comments then ls_html 	+= '<!-- question repeat: '+ string( li_line ) +' -->'+crlf		  				
			  	ls_html	+=	'</TR>'+crlf+'<TR CLASS=ATR01 >'
//				ls_html	+= '<TD VALIGN="TOP" ALIGN="LEFT" COLSPAN="1" WIDTH=40%><font face="'+ls_font+'" SIZE=-2>' +crlf
			end if 

			ls_html 	+='</TR>'+crlf+crlf+crlf // VZ 2006 06 28

		NEXT // line repeat loop

		// VZ 2006 06 28 - add table around FREE FORM 
		ls_html	+= crlf+'</TABLE>' // ans choices table
  		ls_html	+=	'</TD>' +crlf 
		
		//===== END IF FREE FORM Repeat loop ==============
		  	ls_html	+=	'</TR>'+crlf // end of FF row
		if ib_html_comments then ls_html 	+= '<!-- end of freeform -->'+crlf		  				
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
			ls_html_colname = 'arb_q'+string(ll_qid)
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
				ls_html_colname = 'acb_q'+string(ll_qid)+'a'+string( ll_answerid)
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
				
				ls_cmd += ' create text(band=detail alignment="2" text="' +ls_valhdr + &
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

		//HTML fields 
		if ll_choices = 1 and POS( 'FF1,FF2,FF3,FF4', ls_qtype ) <=0 then
	    	li_html_ansperline = li_ansperline + 1 // adjust for NA - radio buttons 
		else
			li_html_ansperline = li_ansperline
	  	end if
		ls_html_ans_text 	=''
		ls_html_ans_id 	=''
		li_html_ans = 0;
		if ib_html_comments then ls_html	+= '<!-- ans choices table start TD for outer table -->'+crlf	

		if ls_html_ans_on_same_row = 'Y' or ls_html_ans_on_same_row = 'T' & 
			or (is_keep_ans_table = 'Y' and ls_qtype = 'SCT') then 
			ls_html 	+= '<TD CLASS=QTD01 VALIGN="TOP" COLSPAN="1" WIDTH=100%>' 
		ELSE 
			if is_keep_ans_table <> 'Y' then // skip outer table TD for titled scales 
				ls_html 	+= '<TD CLASS=QTD01 VALIGN="TOP" COLSPAN="'+ls_html_ans_span +'" WIDTH='+ls_ans_width_pct+'>'
			//	ls_html 	+= '<TD CLASS=QTD01 VALIGN="TOP" COLSPAN="10" WIDTH=100%>'
			END IF
		END IF 
		If is_keep_ans_table = 'N' or (is_keep_ans_table = 'Y' and ls_qtype = 'SCT') then 
			//ls_html	+= crlf+'<TABLE CLASS=ATABLE01 WIDTH=100% CELLPADDING=0 CELLSPACING=0 BORDERWIDTH=0>' // ans choices table
			ls_html	+= crlf+'<TABLE CLASS=ATABLE01 WIDTH=100% CELLPADDING=1 CELLSPACING=1 BORDERWIDTH=0>' // ans choices table
		END IF 
		ls_html 	+= this.event ue_html_get_answer_tr(ls_html_ans_on_same_row, ls_qtext, ls_qtype) // answer table row tags
 		
 		if ls_qtype <> 'SCT' then ii_input_index ++ 
		ls_html_input_name = 'acb_q'+string(ll_qid)+'a'+string( ll_answerid)
		
		if ll_choices=1 then	
			li_ans_rows = ll_ans_1q / li_ansperline 
//			If li_ansperline then 
				li_answidth_pct	 = round(li_ans_area / (li_ansperline + 1 ) ,0)
				if li_answidth_pct	< 20 then li_answidth_pct	= 0  
				ls_answidth_pct	 = string( li_answidth_pct ) 
// vz 06/06/2005	ls_answidth_pct	 = string( round( li_ans_area / (ll_ans_1q + 1 ),0)) // use ll_ans_1q space evenly, including No Answer		  
//			ELSE
//				ls_answidth_pct	 = string( li_ans_area / (li_ansperline )) 
//			END IF
		ELSE
			li_answidth_pct	 = round(li_ans_area  / (li_ansperline ),0)
			if li_answidth_pct	< 20 then li_answidth_pct	= 0  
			ls_answidth_pct	 = string(li_answidth_pct ) // space evenly
		END IF
		If li_answidth_pct < 20 then 	
			ls_answidthpct_expr = ' WIDTH=' + ls_answidth_pct+'%' 
		ELSE
			ls_answidthpct_expr = '' // let browser take care of that
		END IF	
		For ll_a = 1 to ll_ans_1q
			ls_html_ans_text 	= trim( ids_qset_template_a.GetItemString( ll_a, "answertxt"))
			ls_html_ans_id 	= string(ids_qset_template_a.GetItemNumber( ll_a, "answerid"))
			if ls_qtype <> 'SCT' then 
	    		ls_html += crlf+'<TD CLASS=ATD01 VALIGN="MIDDLE" ALIGN="LEFT" COLSPAN="1" WIDTH=20>' // rb col
				ls_html += '<INPUT '

				if ll_choices=1 then
					ls_html +=' CLASS=ARB01 TYPE="RADIO" '
					ls_html +=' VALUE="'+ls_html_ans_id+'" '
					ls_html_input_name = 'arb_q'+string(ll_qid)
				else
					ii_input_index ++ 
	//				ls_html_input_name ='parmvalue'+string(ii_input_index )
					ls_html_input_name = 'acb_q'+string(ll_qid)+'a'+ ls_html_ans_id
					ls_html +=' CLASS=ACBX01 TYPE="CHECKBOX" '
					ls_html +=' VALUE="1"'
				end if
				ls_html +=' NAME='+ls_html_input_name +'></TD>'
				ls_html +='</TD>' 
		   else 
//				ls_html +='<INPUT TYPE="RADIO"  VALUE="16"  NAME=xxx>' //test!!!
			end if // titles check
	
			li_html_ans ++
			if ib_html_comments then ls_html += '<!-- radio button text col reached-->'
			if ls_qtype = 'SCT' then // title column 
	    		ls_html += crlf+'<TD CLASS=TTXT01 VALIGN="BASELINE" ALIGN="MIDDLE" COLSPAN="2" >' // title col spans 2
			else
				ls_html += crlf+'<TD CLASS=ATXT01 VALIGN="BASELINE" ALIGN="LEFT" COLSPAN="1" '+ls_answidthpct_expr+'>' // rb col
			end if
			If ls_html_ans_on_same_row = 'T' and ls_qtype <> 'SCT' then // titles above and not titles type 
				ls_html += 		'</TD>' // skip ans title text
			ELSE // do text			
				ls_html += ls_html_ans_text 	+'</TD>'
			End If 
			
			if li_html_ans = li_html_ansperline then 			// -- go to next row
		   	ls_html += crlf+' </TR>'
				if ib_html_comments then ls_html += '<!-- new ans row since ansperline='+string(li_html_ansperline)+' reached-->'+crlf		  						
				ls_html += this.event ue_html_get_answer_tr(ls_html_ans_on_same_row, ls_qtext, ls_qtype) // answer table row tags
		   	li_html_ans = 0
			end if
		Next			  

//  -- add NA radio button
		if ll_choices = 1 and POS( 'FF1,FF2,FF3,FF4', ls_qtype ) <=0 then // NA
		 if ls_qtype <> 'SCT' then 
		    ls_html += crlf+'<TD CLASS=ATD01 VALIGN="MIDDLE" ALIGN="LEFT" COLSPAN="1" WIDTH=20>' 
			 ls_html +='<INPUT CLASS=ARB01 '
	   	 ls_html +=' TYPE= "RADIO" '
		    ls_html +=' NAME='+ls_html_input_name +''
	   	 ls_html +=' VALUE = "999999000" CHECKED></TD>'
		 
  		 	ls_html += crlf+'<TD CLASS=ATXT01 VALIGN="BASELINE" ALIGN="LEFT" COLSPAN="1" '+ls_answidthpct_expr+'>' // rb col
			 
		 	If ls_html_ans_on_same_row = 'Y' then	ls_html += 'N/A</TD>'+crlf
		 	If ls_html_ans_on_same_row = 'N' then	ls_html += 'No Answer</TD>'+crlf
		 	If ls_html_ans_on_same_row = 'T' then	ls_html += '</TD>'+crlf // titles above
		 else // titles NA
		   ls_html += crlf+'<TD CLASS=TTXT01 VALIGN="MIDDLE" ALIGN="MIDDLE" COLSPAN="2" >' 
			ls_html += 'N/A</TD>'+crlf
		 end if
		end if 		// -- NA

		ls_html +='</TR>' 
		if ib_html_comments then ls_html += '<!-- TR for inner answer table -->'+crlf		  
		If is_keep_ans_table <> 'Y' then ls_html +='</TABLE></TD>'+crlf	// CLOSE answer choices table
		if ib_html_comments then ls_html += '<!-- ans choices table end TD for outer table -->'+crlf		  						
	ELSE			// ll_ans_1q = 0
	End IF		// ll_ans_1q > 0 

	if is_keep_ans_table <> 'Y' then 
		ls_html +='</TR>'+crlf	// CLOSE question row
		if ib_html_comments then ls_html += '<!-- question end--'+string(ll_q)+' -->'+crlf
	end if
	
NEXT				// qestions loop
If is_keep_ans_table = 'Y' then // last q in section is a scale - close the tables
	ls_html +='</TABLE></TD>'+crlf	// CLOSE answer choices table
	if ib_html_comments then ls_html += '<!-- ans choices table end for titled section -->'+crlf		  						
	ls_html +='</TR>'+crlf	// CLOSE question row - outer table
	if ib_html_comments then ls_html += '<!-- last question end--'+string(ll_q)+' for keep ans table -->'+crlf
end if 
is_html_temp = f_nvl(string ( ib_html) ,'-* NULL *-')
ib_html = ib_html + blob( ls_html)
end event

event type integer ue_create_qset_hier_level(string as_parent_id, ref integer ai_colid, ref long al_y, ref string as_column_cmd, ref string as_table_cmd, ref blob ab_html);datastore lds_hier 

lds_hier = create DATASTORE 
lds_hier.dataobject = 'd_qgen_hierarchy_web'
lds_hier.SetTransObject( SQLCA )

long 					ll_row, ll_maxrow
string 				ls_leafind, ls_id, ls_level
double   			ld_present_id
str_vzt_present 	lstr_present 
string ls_text_x , ls_fontexpr, ls_qtext, ls_rc, ls_cmd
string ls_html

string ls_web_section_pic_top, ls_web_section_pic_bot, ls_web_section_pic_left, ls_web_section_pic_right, ls_web_section_pic_bg 	

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
		is_html_temp = f_nvl(string ( ib_html) ,'-* NULL *-')
		exit 
	ELSE
		// Create section header text and process children on next level 
		ld_present_id 				= f_nvl(lds_hier.object.present_id[ ll_row ],0)
		lstr_present 				= f_vzt_get_present( ld_present_id ) // get hier text font 
		ls_web_section_pic_top 	= f_nvl(lds_hier.object.web_pic_top[ ll_row ],'')
		ls_web_section_pic_bot 	= f_nvl(lds_hier.object.web_pic_bottom[ ll_row ],'')
		ls_web_section_pic_left	= f_nvl(lds_hier.object.web_pic_left[ ll_row ],'')
		ls_web_section_pic_right= f_nvl(lds_hier.object.web_pic_right[ ll_row ],'')
		ls_web_section_pic_bg 	= f_nvl(lds_hier.object.web_pic_bg[ ll_row ],'')
		
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
		//HTML: Question or level title text
		ls_html = ''
		if ib_html_comments then ls_html = '<!-- Level '+ string( f_nvl(ii_level,0), '00') +' title text -->'+crlf

		if trim(f_nvl(ls_web_section_pic_top,'')) <> '' then // top picture file 
			ls_html +='<TR CLASS=QTR01 >'+crlf +'<TD CLASS=sectlvl' + ls_level+ ' COLSPAN="'+ string(ii_html_table_cols) +'" valign="top" align="left" WIDTH=100%>'
			ls_html += uf_img_tag(ls_web_section_pic_top,0) +  '</TD></TR>'
		end if
	
		ls_html +='<TR CLASS=QTR01 >'+crlf +'<TD CLASS=sectlvl' + ls_level+ ' COLSPAN="'+ string(ii_html_table_cols) +'" valign="top" align="left" WIDTH=100%>'
		ls_html += uf_img_tag(ls_web_section_pic_left,3) + ls_qtext + uf_img_tag(ls_web_section_pic_right,3) +'</TD></TR>' + crlf // close the row 

		if trim(f_nvl(ls_web_section_pic_bot,'')) <> '' then // bottom picture file 
			ls_html +='<TR CLASS=QTR01 >'+crlf +'<TD CLASS=sectlvl' + ls_level+ ' COLSPAN="'+ string(ii_html_table_cols) +'" valign="top" align="left" WIDTH=100%>'
			ls_html += uf_img_tag(ls_web_section_pic_bot,0) +  '</TD></TR>'
		end if
		
		
		is_html_temp = f_nvl(string ( ib_html) ,'-* NULL *-')
		ib_html += blob(ls_html ) 
		this.event ue_create_qset_hier_level( ls_id, ai_colid, al_y, as_column_cmd, as_table_cmd, ab_html ) 
		
	END IF 
NEXT 

destroy lds_hier 
ii_level = ii_level - 1 
return 0

end event

event ue_save_qset_html(integer ai_property_id, ref transaction a_tran);//HTML Creation
string 	ls_code, ls_message
long		li_rc, ll_id, ll_property_id
	
//	// PRESERVE ID if exists
//	SELECT id INTO :ll_id FROM vzt_html WHERE qsetID = :in_qsetid AND property_id=0;
ll_property_id = ai_property_id 
ll_id = ll_property_id * 10000 + in_qsetid		// 99990015

DELETE vzt_html WHERE qsetID = :in_qsetid AND property_id= :ll_property_id USING a_tran ;
INSERT INTO vzt_html (qsetID, property_id, id ) VALUES (:in_qsetid , :ll_property_id, :ll_id ) USING a_tran ;
	
is_html_temp = string( ib_html)
	
UPDATEBLOB vzt_html SET page = :ib_html 
WHERE qsetID = :in_qsetid AND property_id=:ll_property_id USING a_tran ; 
	
If a_tran.sqlcode <> 0 then	
	ls_code 		= string(a_tran.sqlcode) 
	ls_message 	= f_nvl(a_tran.sqlerrtext,'*')
	li_rc = -10
END IF 
f_end_tran (a_tran, li_rc , 'QSET HTML Creation', '','Survey HTML Creation failed.'+'~r~n~r~nSQL Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )


end event

event type string ue_get_qset_html_header(double ad_qsetid);string ls_html

//ls_html	='<HTML><HEAD></HEAD><BODY>';
//ls_html	+='<FORM>';
ls_html	+='<!-- Copyright VZTECH Systems, Inc. 2001-2004 All rights reserved. -->~r~n';
ls_html	+='<!-- No part of this program can be used without written permission from VZTECH Systems, Inc.-->~r~n';
ls_html	+='<!-- 203 Mountain Ave, Hawthorne NJ 07506, (201) 755-7670 -->~r~n';
ls_html	+='<TABLE WIDTH=100% CELLPADDING=1 CELLSPACING=1 BORDERWIDTH=1>~r~n';
  
return ls_html


end event

event ue_get_qset_html_footer;string ls_html

ls_html 	= '</TABLE>'
//ls_html 	+= '</FORM>';
//ls_html	+='</BODY></HTML>';
  
return ls_html


  
end event

event ue_html_w1q;//  declare li_tot integer
string  ls_html 
//  declare ls_value varchar(100)
//  declare ls_name varchar(100)
//  --
//  declare ll_choices integer
//  declare ls_questionid decimal(9)
//  declare ls_questiontxt varchar(200)
//  declare ls_qtypeid char(3)
//  declare li_weight integer
//  declare li_width integer
//  declare li_ansperline integer
//  declare ls_ddlookuptype varchar(20)
//  declare ls_ddcodecol varchar(100)
//  declare ls_dddispcol varchar(100)
//  declare ls_ddlookup varchar(100)
//  declare ls_ddcodecoltype varchar(10)
//  declare li_repeat integer
//  declare li_height integer
//  declare ls_fontface varchar(50)
//  declare li_fontsize integer
//  declare ls_bold char(1)
//  declare ls_italic char(1)
//  declare ls_under char(1)
//  declare ls_fgcolor double
//  declare ls_bgcolor double
//  declare ls_defgraphtype char(2)
//  declare ls_descr varchar(100)
//  declare ls_scorable char(1)
//  declare li_ans integer
//  --
//  select q.questionid,
//    q.questiontxt,
//    q.qtypeid,
//    q.weight,
//    q.width,
//    q.ansperline,
//    q.ddlookuptype,
//    q.ddcodecol,
//    q.dddispcol,
//    q.ddlookup,
//    q.ddcodecoltype,
//    q.repeat,
//    q.height,
//    q.fontface,
//    q.fontsize,
//    q.bold,
//    q.italic,
//    q.under,
//    q.fgcolor,
//    q.bgcolor,
//    q.defgraphtype,
//    q.descr,
//    q.scorable into ls_questionid,
//    ls_questiontxt,
//    ls_qtypeid,
//    li_weight,
//    li_width,
//    li_ansperline,
//    ls_ddlookuptype,
//    ls_ddcodecol,
//    ls_dddispcol,
//    ls_ddlookup,
//    ls_ddcodecoltype,
//    li_repeat,
//    li_height,
//    ls_fontface,
//    li_fontsize,
//    ls_bold,
//    ls_italic,
//    ls_under,
//    ls_fgcolor,
//    ls_bgcolor,
//    ls_defgraphtype,
//    ls_descr,
//    ls_scorable from qgen_questions as q
//    where q.questionid=ai_qid
//  -- create q text column   
//  select maxchoices into ll_choices from qgen_qtypes where qtypeid=ls_qtypeid
//  set ls_html='<TR BGCOLOR="#ecbc59"><TD COLSPAN="'+string(ai_cols)+'" WIDTH=100%><font face="'+ls_fontface+'" SIZE=-2>'
//
//  if ls_bold='Y' then
//    set ls_html=ls_html+'<B>'
//  end if
//  
//  set ls_html=ls_html+ls_questiontxt
//  if ls_bold='Y' then
//    set ls_html=ls_html+'</B>'
//  end if
//  
//  set ls_html=ls_html+'</FONT></TD></TR>'
//  -- adjust ansperline for NA
//  if ll_choices=1 and ls_qtypeid not in('FF1','FF2','FF3','FF4') then
//    set li_ansperline=li_ansperline+1
//  end if
//  
//  --
//  -- create ans choices
//  --
//  set li_ans=0
//  set ls_html=ls_html+'<TR BGCOLOR="#ffffff">'
//  set @input_index=@input_index+1
//  set ls_name='parmvalue'+string(@input_index) -- same name for rb's
//  answerloop: for ansfor as thisans dynamic scroll cursor for
//    select ac.answerid as ld_answerid,
//      ac.answertxt as ls_answertxt,
//      ac.score as li_score,
//      ac.sortorder as li_sortorder
//      from qgen_answer_choices as ac
//      where ac.questionid=ai_qid order by sortorder asc do
//    set ls_html=ls_html+'<TD><font face="'+ls_fontface+'" SIZE=-2><INPUT '
//    --if checked then
//    --  set ls_html=ls_html+' CHECKED '
//    --end if
//    if ll_choices=1 then
//      set ls_html=ls_html+' TYPE= "RADIO" '
//      set ls_html=ls_html+' VALUE = "'+string(ld_answerid)+'" '
//    else
//      set @input_index=@input_index+1
//      set ls_name='parmvalue'+string(@input_index)
//      set ls_html=ls_html+' TYPE= "CHECKBOX" '
//      set ls_html=ls_html+' VALUE = "1"'
//    end if
//    
//    set li_ans=li_ans+1
//    set ls_html=ls_html+' NAME= "'+ls_name+'"> '
//    set ls_html=ls_html+ls_answertxt+'</FONT></TD>'
//    if li_ans=li_ansperline then -- ; to next row
//      set ls_html=ls_html+' </TR><TR> '
//      set li_ans=0
//    end if
//  end for
//  -- add NA radio button
//  if ll_choices=1 and ls_qtypeid not in('FF1','FF2','FF3','FF4') then
//    set ls_html=ls_html+'<TD WIDTH=><font face="'+ls_fontface+'" SIZE=-2><INPUT '
//    set ls_html=ls_html+' CHECKED '
//    set ls_html=ls_html+' NAME= "'+ls_name+'" '
//    set ls_html=ls_html+' TYPE= "RADIO" '
//    set ls_html=ls_html+' VALUE = "999999000">No Answer</FONT></TD>'
//    set ls_html=ls_html+'</TR>'
//  end if -- NA
//   --  
  return(ls_html)

end event

event ue_html_create_qset;//blob 			lb_header, lb_footer, lb_styles
string			lb_header, lb_footer, lb_styles
datawindow	ldw_dummy


// Get HTML styles for this property.
lb_styles  	= this.event ue_html_get_styles( ai_property_id, ad_qsetid) 
lb_header  	= this.event ue_get_qset_html_header( ad_qsetid)
lb_footer	= this.event ue_get_qset_html_footer( ad_qsetid)

ii_input_index = 0

ib_html_only = true
this.event ue_create_qset( ad_qsetid , ldw_dummy )

is_html_temp = f_nvl( string( ib_html),'***null***')

if IsNull( lb_header) 	then lb_header = '***null***'
if IsNull( lb_footer) 	then lb_footer = '***null***'
if IsNull( ib_html) 		then ib_html 	= blob('***null***')
if IsNull( lb_styles) 	then lb_styles = '***null***'

ib_html 			= blob(lb_header) + blob(lb_styles) + ib_html + blob(lb_footer)
is_html_temp = f_nvl( string( ib_html),'***null***')

ib_html_only 	= false

return ib_html 
end event

event ue_html_avail_surveys_header;string ls_html
ls_html	= '<center><font SIZE=-1 face="Helvetica" >';
ls_html	=ls_html+'<table border=0 cellpadding=3 cellspacing=2 width=100% BGCOLOR="#a5dafa" >';
ls_html	=ls_html+'<tr BGCOLOR="#ecbc59"><font face="Arial" SIZE=-1>';
ls_html	=ls_html+'<td ><font face="Arial" size="+1"><b>';
ls_html	=ls_html+'<CENTER>Available Surveys:</b></td></center></font></tr>';
ls_html	=ls_html+'<tr BGCOLOR="#a5dafa"><font face="Arial" SIZE=-1><td>';
ls_html	=ls_html+'<form name="form_avsurveys" method=post action="/cgi-shl/pbcgi60.exe/vzt_rpt/u_vzt_web_rpt/f_qgen_qset?">';
ls_html	=ls_html+'<CENTER><font face="Arial, Helvetica"><b>';
ls_html	=ls_html+'<SELECT NAME="as_qsetid" SIZE="5" >';

return ls_html
end event

event ue_html_avail_surveys_footer;string ls_html

ls_html=ls_html+'</SELECT>';
ls_html=ls_html+'</CENTER>';
ls_html=ls_html+'<input type="submit" name="as_request" value="Select Survey">';
ls_html=ls_html+'</CENTER></font></b>';
//ls_html=ls_html+'</form></font></td>';
  
return ls_html
end event

event ue_html_avail_surveys;string ls_html
ls_html =  this.event ue_html_avail_surveys_header()
//ls_html += f_vzt_html_select_from_ds ()
ls_html += this.event ue_html_avail_surveys_footer()

return ls_html
end event

event type string ue_html_get_answer_tr(string as_same_row, string as_qtext, string as_qtype);string ls_html 	

ls_html 	=''
ls_html 	+= crlf+'<TR CLASS=ATR01 >' // #ffffff white 
if as_same_row = 'Y' or as_same_row = 'T' or as_qtype = 'SCT' then 
	If as_qtype = 'SCT' then
//		ls_html += crlf+'<TD CLASS=THDR01 VALIGN="BASELINE" ALIGN="LEFT" COLSPAN="1" WIDTH=50%>' 
		ls_html += crlf+'<TD CLASS=THDR01 VALIGN="BASELINE" ALIGN="LEFT" COLSPAN="1" WIDTH=50%>' 
	else
		ls_html += crlf+'<TD CLASS=QTD01 VALIGN="BASELINE" ALIGN="LEFT" COLSPAN="1" WIDTH=60%>' 
	end if
	//	if as_qtype = 'SCT' then as_qtext = '--------'  // testing only
		ls_html += as_qtext;
  		ls_html	+=	'</TD>'+ crlf
		// no spacer on same row
else
	ls_html 	+= '<TD CLASS=ATD01 VALIGN="TOP" ALIGN="LEFT" COLSPAN="1"><img src="spacer.gif" height="4" width="50" border="0"></TD>' // left alignment (pad) column
end if
return ls_html 	
end event

event ue_html_get_styles;return ' ' // styles are dynamically refreshed from db



blob lb_html
string ls_html ='', ls_style_name, ls_style
datastore lds_styles 
long ll_maxrows, ll_row

crlf = "~r~n"

lds_styles = CREATE datastore
lds_styles.dataobject = 'd_html_styles_by_prop' 
lds_styles.SetTransObject(SQLCA)
ll_maxrows = lds_styles.Retrieve( ai_property_id, ad_qsetid)

ls_html += crlf +"<STYLE TYPE=~"text/css~">" + crlf
ls_html += "<!-- " + crlf 
//.dw5{COLOR:#008080;BACKGROUND:#ffdfdf;FONT:8pt "Arial", sans-serif;FONT-STYLE:normal;FONT-WEIGHT:normal;TEXT-DECORATION:none}
If ll_maxrows > 0 then
	FOR ll_row = 1 TO ll_maxrows
		ls_style_name 	=  f_nvl( lds_styles.GetItemString( ll_row, "style_name"),'')
		ls_style			=  f_nvl( lds_styles.GetItemString( ll_row, "style"),'')
		ls_html 			+=	"." + trim(ls_style_name) + '{' + trim(ls_style ) + '}' + crlf
	NEXT
END IF

ls_html += "-->" + crlf
ls_html += "</STYLE>" + crlf

//MessageBox("Styles", ls_html)
DESTROY lds_styles  
return ls_html 
end event

event type string ue_web_tran(ref boolean ab_webdb, ref string as_dparm, ref transaction at_web_tran);SELECT  option12, option10 INTO  :as_dparm, :is_url from vzt_sysoptions where id = 1;
//--------------------------------------------------------------------

ab_webdb = false // default: same db for web 

IF POS ( lower(as_dparm), 'http') > 0 then
	//Using HTTP to sync.
	as_dparm = trim( MID (as_dparm, 5))
	is_dparm = as_dparm 
	ab_webdb = true
	ib_webdb = true
	ib_http = true
	return 'HTTP' 
END IF

if POS ( lower(SQLCA.dbparm), lower( 'dsn='+ as_dparm) ) > 0 then return '' // same db

ab_webdb = true // different db for web entry 
//at_web_tran = CREATE transaction


at_web_tran.dbms  	= 'ODBC'
at_web_tran.dbparm = "Connectstring='DSN="+ as_dparm+";uid=dba;pwd=sql'"

CONNECT USING at_web_tran;

// It is a good idea to check if the connection was established.
IF at_web_tran.SQLCode <> 0 THEN
	MessageBox( "Connect Error", "A connection to the web database (" + as_dparm + &
				  " ) failed. ~r~n~r~nError Text:"+ at_web_tran.sqlerrtext ,StopSign!)

END IF
if gnv_appman.is_debugmode = 'Y' then 
	long ll_count 
	SELECT count(*) into :ll_count FROM gcc USING at_web_tran;
	ll_count = ll_count 
end if

return ''
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

event ue_save_qset_html_http(integer ai_property_id);//HTML Creation
string 	ls_code, ls_message
long		ll_rc, ll_id, ll_property_id
string ls_http_url, ls_http_args, ls_ret 	
	
ll_property_id = ai_property_id 
ll_id = ll_property_id * 10000 + in_qsetid		// 99990015

is_html_temp = string( ib_html)
is_html_temp = f_replace (is_html_temp, "'", '`')
is_html_temp = f_replace (is_html_temp, '~r~n', '')
clipboard (is_html_temp) 	
ls_http_url 	= is_url + "qgen_getwebsurveys.asp" 
ls_http_args 	 = 'd='+is_dparm + '&action=setup'+'&p='+string(ll_property_id) 
ls_http_args 	+= "&qs="+string(in_qsetid)+"&hid="+string(ll_id)
ls_http_args 	+= "&b=" + is_html_temp // f_random_string(2000) 
ls_ret 			= f_vzt_html_get_data( ls_http_url, ls_http_args )  
If ls_ret <> 'OK' then
	Clipboard( ls_http_url + ls_http_args)
	Messagebox("HTTP QSET Creation Error", "Common URL:" + is_url + "~r~n" + "Full URL:"+ ls_http_url+ "~r~n" + "Args:"+ ls_http_args) 
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

public function string uf_img_tag (string as_picfile, integer ai_spacing);string ls_file

ls_file = trim(f_nvl(as_picfile, ''))

If ls_file <> '' then 
	ls_file = '<img SRC="'+ls_file + '" >'
	CHOOSE CASE ai_spacing
	CASE 1
		ls_file = '&nbsp;'+ls_file  // left only 
	CASE 2
		ls_file = ls_file + '&nbsp;' // right only 
	CASE 3
		ls_file = '&nbsp;'+ls_file + '&nbsp;' // both  
	END CHOOSE

end if

return ls_file
end function

on nvo_qgen.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_qgen.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;if IsValid( ids_answers) 			then DESTROY ids_answers
if IsValid( ids_qset_template_a) then DESTROY ids_qset_template_a
if IsValid( ids_qset_template_q) then DESTROY ids_qset_template_q
if IsValid( ids_presentation ) 	then DESTROY ids_presentation 

this.event ue_clear_ddds()
end event

event constructor;if Not IsValid( ids_qset_template_q) then 
	ids_qset_template_q = create DATASTORE 
	ids_qset_template_q.dataobject = 'd_qlist02q_hier' // 'd_qlist02q' //  
	ids_qset_template_q.SetTransObject( SQLCA )
End If

if Not IsValid( ids_qset_template_a) then 	
	ids_qset_template_a = create DATASTORE 
	ids_qset_template_a.dataobject = 'd_qlist02a'
	ids_qset_template_a.SetTransObject( SQLCA )
End IF 

if Not IsValid( ids_presentation ) then 	
	ids_presentation = create DATASTORE 
	ids_presentation.dataobject = 'd_presentation_web'
	ids_presentation.SetTransObject( SQLCA )
End IF 


end event

