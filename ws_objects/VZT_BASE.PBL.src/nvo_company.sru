$PBExportHeader$nvo_company.sru
forward
global type nvo_company from nonvisualobject
end type
end forward

global type nvo_company from nonvisualobject
end type
global nvo_company nvo_company

type variables
datastore ids_employer[]
string       is_alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
boolean   ib_retrieve_on_init = false
boolean   ib_retrieve_live = false
boolean	ib_one_ds = true // use one ds for low num of companies
string	is_caller_col = 'company', is_do='d_dddw_company_caps'
end variables

forward prototypes
public function integer uf_search (string as_employer, datawindow adw_target)
public function string uf_strip (string as_source)
public function integer uf_add_employer (string as_employer)
public subroutine uf_refresh (integer ai_index)
public function integer uf_get_index (string as_employer)
public function integer uf_search_one_ds (integer ai_index, datawindow adw_target, string as_expression)
public function integer uf_search_one_ds (datawindow adw_target, string as_expression)
public function integer uf_init (boolean ab_retrieve_on_init, boolean ab_retrieve_live, string as_caller_col, boolean ab_one_ds, string as_do)
end prototypes

public function integer uf_search (string as_employer, datawindow adw_target);//
//Setpointer (HourGlass!)
string ls_empname, ls_expr[] , ls_strip, ls_temp , ls_expression ='', ls_saint_strip
string ls_temp1, ls_temp2, ls_or , ls_pattern 
long ll_pos,  ll_andpos, ll_expindex, ll_andpos1
int 	li_index

ls_empname = UPPER(TRIM(as_employer))
IF len(ls_empname ) <=0 then return 1

li_index = this.uf_get_index( ls_empname ) 
ls_strip   = 	this.uf_strip( ls_empname )
//IF POS( "._'-", MID( ls_empname, 1,1) ) > 0 then 
// match dots to spaces and empty strings 
ls_temp = ls_empname
ll_pos = POS( ls_temp , '.', 1)    
ls_expr[1] = ''
ls_expr[1] = '^[ ]*' // match start and blanks 
FOR ll_pos = 1 to len( ls_strip) 
	ls_expr[1] +=  MID(ls_strip, ll_pos, 1) + "[ \-_\.'/,]*"
NEXT 	

ls_expr[1] = 'match( ' + is_caller_col + ' , "'+ls_expr[1]+'") '
ls_expr[2] = 'match( ' + is_caller_col + ' , "^' + trim(ls_empname)+ '.*$")'

// Add '&' to 'AND' pattern 
ls_pattern = '&'
ll_andpos = POS( ls_strip, ls_pattern) 
ll_expindex = Upperbound(ls_expr) + 1
IF ll_andpos <= 0 then 
	ls_pattern = 'AND'
	ll_andpos = POS( ls_strip, ls_pattern) 
END IF 
If ll_andpos > 0 then 
	ls_temp1 = '^[ ]*'
	FOR ll_pos = 1 to ll_andpos - 1
		ls_temp1 +=  MID(ls_strip, ll_pos, 1) + "[ \-_\.'/,]*"
	NEXT 	
	If ll_andpos + len( ls_pattern ) <= len( ls_strip) then 
		ls_temp2 = '[ ]*'
		FOR ll_pos = ll_andpos + len(ls_pattern ) to len( ls_strip) 
			ls_temp2 +=  MID(ls_strip, ll_pos, 1) + "[ \-_\.'/,]*"
		NEXT 	
	end If 
	If ls_pattern = '&' then 
		ls_expr[ll_expindex]= 'match( ' + is_caller_col + ' , "'+ ls_temp1 + 'AND' + ls_temp2 + '") '
	Else
		ls_expr[ll_expindex]= 'match( ' + is_caller_col + ' , "'+ ls_temp1 + '&' + ls_temp2 +'") OR match(employer, "'+ ls_temp1 + 'AND' + ls_temp2 + '") '		
	END IF 
END IF 

// Add ST. STREET/ SAINT pattern 
ls_pattern = 'ST.'
ll_andpos = POS( ls_empname, ls_pattern) 
IF ll_andpos <= 0 then 
	ls_pattern = 'ST '
	ll_andpos = POS( ls_empname, ls_pattern) 
END IF 
IF ll_andpos <= 0 then 
	ls_pattern = 'SAINT'
	ll_andpos = POS( ls_empname, ls_pattern) 
END IF 
If ll_andpos > 0 then 
	ll_expindex = Upperbound(ls_expr) + 1
	ls_saint_strip = this.uf_strip( MID( ls_empname, 1, ll_andpos - 1) )
	ll_andpos1 = LEN( ls_saint_strip ) + 1 
	ls_temp1 = this.uf_strip( MID( ls_empname, ll_andpos+LEN(ls_pattern)) )
	ls_saint_strip += ls_pattern + ls_temp1
	ls_temp1 = '^[ ]*'
	ll_andpos = ll_andpos1 
	FOR ll_pos = 1 to ll_andpos - 1
		ls_temp1 +=  MID(ls_saint_strip , ll_pos, 1) + "[ \-_\.'/,]*"
	NEXT 	
	If ll_andpos + len( ls_pattern ) < len( ls_saint_strip ) then 
		ls_temp2 = '[ ]*'
		FOR ll_pos = ll_andpos + len(ls_pattern ) to len( ls_saint_strip ) 
			ls_temp2 +=  MID(ls_saint_strip, ll_pos, 1) + "[ \-_\.'/,]*"
		NEXT 	
	end If 
	ls_expr[ll_expindex]= 'match( ' + is_caller_col + ' , "'+ ls_temp1 + 'ST' + ls_temp2 +'") OR match(employer, "'+ ls_temp1 + 'SAINT' + ls_temp2 + '") '
	IF (ls_pattern = 'ST ' or 	ls_pattern = 'ST.') and POS( ls_empname, ls_pattern) > 1 then // add STREET 
		ls_expr[ll_expindex] += ' OR match(employer, "'+ ls_temp1 + 'STREET' + ls_temp2 +'") '
	END IF 
END IF 

// Add wrong vowels search
string 	ls_letter
int		li_letter
// Any vowels ??? 
If len( ls_strip) > 3  AND MATCH( ls_strip, '^.*[AUOEAI]+.*$') then 
	ll_expindex = Upperbound(ls_expr) + 1 
	ls_expr[ll_expindex]= '^[ ]*'
	for li_letter = 1 to len( ls_strip)
		ls_letter = MID(ls_strip, li_letter, 1)
		IF POS( 'AUOEAI', ls_letter ) > 0  then //this letter a vowel...
			ls_expr[ll_expindex] += '[AUOEAI]*' // match any vowels
		ELSE
			ls_expr[ll_expindex] += ls_letter 
		END IF
	Next 
	ls_expr[ll_expindex] = 'match( ' + is_caller_col + ' , "'+ ls_expr[ll_expindex] + '" ) '
End If

// Build complete matching expression 
For ll_expindex = 1 to Upperbound(ls_expr) 
	ls_expression += ls_or + ls_expr[ll_expindex]
	ls_or = ' OR '
Next 
//messagebox('expr', ls_expression)

adw_target.Reset()
this.uf_search_one_ds ( li_index, adw_target, ls_expression) 
// Now look for different starting letter abbreviations like "1st-FIRST" etc.
IF POS( ls_strip, '1ST') = 1 or ls_strip = '1' then this.uf_search_one_ds ( this.uf_get_index('F'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*FIRST.*")') 
IF POS( ls_strip, 'FIRST') = 1 then this.uf_search_one_ds ( this.uf_get_index('1'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*1ST.*")') 
IF POS( ls_strip, '2D') = 1 or POS( ls_strip, '2ND') = 1 or ls_strip = '2' then this.uf_search_one_ds ( this.uf_get_index('S'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*SECOND.*")') 
IF POS( ls_strip, 'SECOND') = 1 then this.uf_search_one_ds ( this.uf_get_index('2'), adw_target, 'match( ' + is_caller_col + ' , "'+"^[ ]2[ \-_\.'/,N]*D"+'")') 
IF POS( ls_strip, '3D') = 1 or POS( ls_strip, '3RD') = 1 or ls_strip = '3' then this.uf_search_one_ds ( this.uf_get_index('T'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*THIRD.*")') 
IF POS( ls_strip, '3D') = 1 then this.uf_search_one_ds ( this.uf_get_index('T'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*THREE[ \-]*D.*")') 
IF POS( ls_strip, 'THIRD') = 1 then this.uf_search_one_ds ( this.uf_get_index('3'), adw_target, 'match( ' + is_caller_col + ' , "'+"^[ ]3[ \-_\.'/,R]*D"+'")') 
IF POS( ls_strip, '4TH') = 1  or ls_strip = '4' then this.uf_search_one_ds ( this.uf_get_index('F'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*FOURTH.*")') 
IF POS( ls_strip, 'FOURTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('4'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*4TH.*")') 
IF POS( ls_strip, '5TH') = 1 or ls_strip = '5' then this.uf_search_one_ds ( this.uf_get_index('F'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*FIFTH.*")') 
IF POS( ls_strip, 'FIFTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('5'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*5TH.*")') 
IF POS( ls_strip, '6TH') = 1 or ls_strip = '6' then this.uf_search_one_ds ( this.uf_get_index('S'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*SIXTH.*")') 
IF POS( ls_strip, 'SIXTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('6'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*6TH.*")') 
IF POS( ls_strip, '7TH') = 1 or ls_strip = '7' then this.uf_search_one_ds ( this.uf_get_index('S'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*SEVENTH.*")') 
IF POS( ls_strip, 'SEVENTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('7'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*7TH.*")') 
IF POS( ls_strip, '8TH') = 1 or ls_strip = '8' then this.uf_search_one_ds ( this.uf_get_index('E'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*EIGHTH.*")') 
IF POS( ls_strip, 'EIGHTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('8'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*8TH.*")') 
IF POS( ls_strip, '9TH') = 1 or ls_strip = '9' then this.uf_search_one_ds ( this.uf_get_index('N'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*NINTH.*")') 
IF POS( ls_strip, 'NINTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('9'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*9TH.*")') 
IF POS( ls_strip, '10TH') = 1 or ls_strip = '10' then this.uf_search_one_ds ( this.uf_get_index('T'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*TENTH.*")') 
IF POS( ls_strip, 'TENTH') = 1 then this.uf_search_one_ds ( this.uf_get_index('1'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*10TH.*")') 
IF ls_strip = '1' then this.uf_search_one_ds ( this.uf_get_index('O'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*ONE.*")') 
IF ls_strip = '2' then this.uf_search_one_ds ( this.uf_get_index('T'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*TWO.*")') 
IF ls_strip = '3' then this.uf_search_one_ds ( this.uf_get_index('T'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*THREE.*")') 
IF ls_strip = '4' then this.uf_search_one_ds ( this.uf_get_index('F'), adw_target, 'match( ' + is_caller_col + ' , "^[ ]*FOUR.*")') 
adw_target.sort()
return 1
end function

public function string uf_strip (string as_source);string ls_result
ls_result = UPPER(Trim(as_source))
f_replace( ls_result , '.', '') 
f_replace( ls_result  , '_', '') 
f_replace( ls_result , '-', '') 
f_replace( ls_result , "'", '') 
return ls_result 
end function

public function integer uf_add_employer (string as_employer);long ll_id, ll_retries, ll_rc

as_employer = UPPER(TRIM( as_employer )) 
if as_employer = '' or IsNUll( as_employer) then return -20 

FOR ll_retries = 5 to 1 STEP -1
	SELECT max( employer_id) + 1 INTO :ll_id FROM EMPLOYER ; // Get new id 
	// Insert as pending...
	INSERT INTO EMPLOYER VALUES ( :as_employer, :ll_id, '', '', 'P', NULL, NULL,NULL, NULL,NULL,NULL, NULL ) ;
	if SQLCA.sqlcode = 0 then 
		COMMIT USING SQLCA;
		ll_retries = 0 
		ll_rc = 0
		int li_index
		li_index = this.uf_get_index( as_employer )  
		this.uf_refresh ( li_index ) 
		If li_index > 0 then
			If ids_employer[li_index].Find ( "employer ='"+ as_employer+"'", 1, ids_employer[li_index].RowCount()) = 0 then 
				long ll_row
				ll_row = ids_employer[li_index].InsertRow(0)
				ids_employer[li_index].SetItem( ll_row, 'employer', as_employer )
			END IF 
		END IF 
	Else
		ROLLBACK USING SQLCA;		
		ll_rc = -10
	END IF
NEXT

return ll_rc
end function

public subroutine uf_refresh (integer ai_index);if ai_index <= 0 or ai_index > UpperBound( ids_employer) then return 
ids_employer[ai_index ].Retrieve() 

end subroutine

public function integer uf_get_index (string as_employer);int li_index  

IF ib_one_ds then
	li_index = 1
ELSE
	li_index  = POS( is_alpha, MID(UPPER(TRIM(as_employer)),1, 1) )
	iF li_index  <= 0 OR li_index  > LEN(is_alpha) then return LEN(is_alpha) + 1
END IF 
RETURN li_index  

end function

public function integer uf_search_one_ds (integer ai_index, datawindow adw_target, string as_expression);long ll_rows , ll_start , ll_pos 
If ids_employer[ai_index].RowCount() <= 0 or ib_retrieve_live then 
	ids_employer[ai_index].Retrieve() 
end if
ll_rows = ids_employer[ai_index].RowCount() 
if ll_rows <= 0 then return 1

string ls_comp
ls_comp	= is_caller_col
ls_comp  = ids_employer[ai_index].GetItemstring( 1, is_caller_col) 
ll_start = 1 
ll_pos = ids_employer[ai_index].Find ( as_expression, ll_start , ll_rows )

DO WHILE ll_pos > 0 
	ids_employer[ai_index].RowsCopy ( ll_pos, ll_pos, Primary!, adw_target, 9999999, Primary!)
	If ll_pos > 0 and ll_pos < ll_rows then 
		ll_start = ll_pos + 1
		ll_pos = ids_employer[ai_index].Find ( as_expression, ll_start , ll_rows ) 
	Else
		ll_pos = 0
	End If
LOOP
return 1
end function

public function integer uf_search_one_ds (datawindow adw_target, string as_expression);long ll_rows , ll_start , ll_pos 
If ids_employer[1].RowCount() <= 0 or ib_retrieve_live then ids_employer[1].Retrieve() 

ll_rows = ids_employer[1].RowCount()
if ll_rows <= 0 then return 1

ll_start = 1 
ll_pos = ids_employer[1].Find ( as_expression, ll_start , ll_rows )

DO WHILE ll_pos > 0 
	ids_employer[1].RowsCopy ( ll_pos, ll_pos, Primary!, adw_target, 9999999, Primary!)
	If ll_pos > 0 and ll_pos < ll_rows then 
		ll_start = ll_pos + 1
		ll_pos = ids_employer[1].Find ( as_expression, ll_start , ll_rows ) 
	Else
		ll_pos = 0
	End If
LOOP
return 1
end function

public function integer uf_init (boolean ab_retrieve_on_init, boolean ab_retrieve_live, string as_caller_col, boolean ab_one_ds, string as_do);int li_index
string ls_newsql , ls_where, ls_rc  
string ls_special_where 

ib_retrieve_on_init 	= ab_retrieve_on_init
ib_retrieve_live		= ab_retrieve_live
ib_one_ds 				= ab_one_ds 
is_caller_col			= as_caller_col
is_do						= as_do

ls_special_where =	" WHERE "
ls_special_where +=	"( "
//ls_special_where +=	" EMPLOYER LIKE '1%' OR EMPLOYER LIKE '2%' OR EMPLOYER LIKE '3%' OR "
//ls_special_where +=	" EMPLOYER LIKE '4%' OR EMPLOYER LIKE '5%' OR EMPLOYER LIKE '6%' OR "
//ls_special_where +=	" EMPLOYER LIKE '7%' OR EMPLOYER LIKE '8%' OR EMPLOYER LIKE '9%' OR "
//ls_special_where +=	" EMPLOYER LIKE '0%' OR "
ls_special_where +=	" EMPLOYER LIKE '*%' OR EMPLOYER LIKE '@%' OR EMPLOYER LIKE '#%' OR " 
ls_special_where +=	" EMPLOYER LIKE '&%' OR EMPLOYER LIKE '!%' OR EMPLOYER LIKE ',%' OR " 
ls_special_where +=	" EMPLOYER LIKE '.%' OR EMPLOYER LIKE '/%' OR EMPLOYER LIKE '(%' " 
ls_special_where +=	" ) "

IF ib_one_ds then
	ids_employer[1 ] = CREATE datastore 
	ids_employer[1 ].dataobject = is_do 
	ids_employer[1 ].SetTransObject( SQLCA) 
	ids_employer[1 ].Retrieve() 
ELSE
	
 FOR li_index = 1 to len( is_alpha) + 1 
	ids_employer[li_index ] = CREATE datastore 
	ids_employer[li_index ].dataobject = is_do 
	ids_employer[li_index ].SetTransObject( SQLCA) 
	ls_newsql 	= ids_employer[li_index ].getSQLSelect()
	IF li_index > len( is_alpha) then 
		ls_where 	=  ls_special_where 
	ELSE
		ls_where 	=  " WHERE STATUS IN ('A','P') AND EMPLOYER LIKE '"+ MID( is_alpha, li_index,1) +"%'  "		
	END IF 
	ls_newsql 	= ls_newsql + ls_where
	f_replace ( ls_newsql , "'", "~~'" ) 
	ls_rc = ids_employer[li_index ].Modify("DataWindow.Table.Select='"+ ls_newsql + "'")
	if ls_rc <> ''  then 
		MessageBox("Employer Lookup Init Error", "Failed to append: "+ls_where , Stopsign!)
		EXIT
	End IF
	If ib_retrieve_on_init then this.uf_refresh ( li_index ) 
 NEXT 
END IF

return 1
end function

on nvo_company.create
TriggerEvent( this, "constructor" )
end on

on nvo_company.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;if isValid( ids_employer[1 ]) then destroy ids_employer[1 ] 
end event

