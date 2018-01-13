$PBExportHeader$w_qgen_qset_tv_edit.srw
forward
global type w_qgen_qset_tv_edit from w_vzt_treeview_base
end type
type tab_1 from tab within w_qgen_qset_tv_edit
end type
type tabpage_1 from userobject within tab_1
end type
type dw_qset from uo_vzt_dwbase within tabpage_1
end type
type cb_new_qset from commandbutton within tabpage_1
end type
type cb_del_qset from commandbutton within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type dw_flat from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_qset dw_qset
cb_new_qset cb_new_qset
cb_del_qset cb_del_qset
cb_4 cb_4
dw_flat dw_flat
end type
type tabpage_2 from userobject within tab_1
end type
type st_3 from statictext within tabpage_2
end type
type dw_selected from uo_vzt_dwbase within tabpage_2
end type
type dw_available from uo_vzt_dwbase within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type cb_up from commandbutton within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_3 st_3
dw_selected dw_selected
dw_available dw_available
st_1 st_1
st_2 st_2
cb_up cb_up
cb_1 cb_1
end type
type tabpage_3 from userobject within tab_1
end type
type dw_survey from uo_vzt_dwbase within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_survey dw_survey
end type
type tabpage_4 from userobject within tab_1
end type
type tab_2 from tab within tabpage_4
end type
type tabpage_5 from userobject within tab_2
end type
type dw_question_tab from uo_vzt_dwbase within tabpage_5
end type
type tabpage_5 from userobject within tab_2
dw_question_tab dw_question_tab
end type
type tabpage_6 from userobject within tab_2
end type
type dw_answers_tab from uo_vzt_dwbase within tabpage_6
end type
type cb_ins from commandbutton within tabpage_6
end type
type cb_del from commandbutton within tabpage_6
end type
type tabpage_6 from userobject within tab_2
dw_answers_tab dw_answers_tab
cb_ins cb_ins
cb_del cb_del
end type
type tab_2 from tab within tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type
type tabpage_4 from userobject within tab_1
tab_2 tab_2
end type
type tabpage_7 from userobject within tab_1
end type
type dw_present from uo_vzt_dwbase within tabpage_7
end type
type dw_hier_edit from uo_vzt_dwbase within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_present dw_present
dw_hier_edit dw_hier_edit
end type
type tabpage_8 from userobject within tab_1
end type
type dw_xq from uo_vzt_dwbase within tabpage_8
end type
type dw_xqq from uo_vzt_dwbase within tabpage_8
end type
type dw_xh from uo_vzt_dwbase within tabpage_8
end type
type dw_xpr from uo_vzt_dwbase within tabpage_8
end type
type dw_xac from uo_vzt_dwbase within tabpage_8
end type
type cb_2 from commandbutton within tabpage_8
end type
type sle_exportfile from singlelineedit within tabpage_8
end type
type cb_3 from commandbutton within tabpage_8
end type
type dw_xqs from uo_vzt_dwbase within tabpage_8
end type
type tabpage_8 from userobject within tab_1
dw_xq dw_xq
dw_xqq dw_xqq
dw_xh dw_xh
dw_xpr dw_xpr
dw_xac dw_xac
cb_2 cb_2
sle_exportfile sle_exportfile
cb_3 cb_3
dw_xqs dw_xqs
end type
type tab_1 from tab within w_qgen_qset_tv_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type
type dw_validation from uo_vzt_dwbase within w_qgen_qset_tv_edit
end type
end forward

global type w_qgen_qset_tv_edit from w_vzt_treeview_base
integer width = 4210
integer height = 1968
string title = "Questionnaire Edit"
tab_1 tab_1
dw_validation dw_validation
end type
global w_qgen_qset_tv_edit w_qgen_qset_tv_edit

type variables
double 	id_qsetid, id_questionid
string	is_hierid
nvo_qgen inv_qgen
uo_vzt_dwbase   dw_answers, dw_question, dw_hier, dw_qs
uo_vzt_dwbase   dw_selectedq, dw_availableq, dw_font
datastore 	 	ids_qgen_lookups
end variables

on w_qgen_qset_tv_edit.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.dw_validation=create dw_validation
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.dw_validation
end on

on w_qgen_qset_tv_edit.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.dw_validation)
end on

event ue_preopen;call super::ue_preopen;is_treetype = 'QSETORG'

// The following lines are for setting up the resizing service
idrg_Vertical 		= tv_1 
idrg_Horizontal	= tab_1 // idw_Data
ist_Horizontal 	= st_horizontal1

end event

event open;call super::open;if Not Isvalid( inv_qgen ) then inv_qgen = CREATE nvo_qgen
inv_qgen.idw_target = tab_1.tabpage_3.dw_survey
is_treetype='QSETORG'
it_main_tab = tab_1

//is_accessflags = 'WR'
is_accessflags = gnv_appman.event ue_getuserrights('','w_qgen_tv_edit')

dw_primary = tab_1.tabpage_1.dw_qset

ids_qgen_lookups = create datastore
ids_qgen_lookups.dataobject = 'd_dddw_question_lookups'
ids_qgen_lookups.SetTransObject ( SQLCA )
ids_qgen_lookups.Retrieve()
datawindowchild 	ldwc_lookup
dw_data.GetChild( 'ddlookup', ldwc_lookup)
ids_qgen_lookups.ShareData( ldwc_lookup)


//if npassuserrights = 9 then is_accessflags = 'WRA'
//gnv_appman.is_userid = cPassUserName

//cb_newsearch.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
//dw_data.POST SetFocus()

if gnv_appman.is_debugmode = 'Y' or POS(is_accessflags, 'A') > 0 then 
	tab_1.tabpage_8.visible = true 	// export page
else
	tab_1.tabpage_8.visible = false 	// export page
end if

dw_answers  = tab_1.tabpage_4.tab_2.tabpage_6.dw_answers_tab
dw_question = tab_1.tabpage_4.tab_2.tabpage_5.dw_question_tab
dw_selectedq= tab_1.tabpage_2.dw_selected
dw_availableq=tab_1.tabpage_2.dw_available
dw_font		=tab_1.tabpage_7.dw_present
dw_hier		=tab_1.tabpage_7.dw_hier_edit
dw_qs			=tab_1.tabpage_1.dw_qset
end event

event resize;call super::resize;// resize tab pages
end event

event close;call super::close;if IsValid( inv_qgen ) then destroy nvo_qgen
if IsValid( ids_qgen_lookups) then destroy ids_qgen_lookups
end event

type uo_trace01 from w_vzt_treeview_base`uo_trace01 within w_qgen_qset_tv_edit
end type

type dw_mainlist from w_vzt_treeview_base`dw_mainlist within w_qgen_qset_tv_edit
end type

type cb_last_search from w_vzt_treeview_base`cb_last_search within w_qgen_qset_tv_edit
integer x = 3319
integer y = 2124
end type

type cb_close from w_vzt_treeview_base`cb_close within w_qgen_qset_tv_edit
integer x = 18
integer y = 1748
integer width = 224
integer taborder = 100
end type

type cb_delete1 from w_vzt_treeview_base`cb_delete1 within w_qgen_qset_tv_edit
integer x = 709
integer y = 1748
integer taborder = 160
end type

type cb_save from w_vzt_treeview_base`cb_save within w_qgen_qset_tv_edit
integer x = 256
integer width = 224
integer taborder = 140
end type

type cb_select from w_vzt_treeview_base`cb_select within w_qgen_qset_tv_edit
integer x = 2880
integer y = 2124
integer taborder = 130
end type

type cb_new from w_vzt_treeview_base`cb_new within w_qgen_qset_tv_edit
boolean visible = false
integer x = 498
integer width = 192
integer taborder = 150
boolean enabled = false
end type

type cb_newsearch from w_vzt_treeview_base`cb_newsearch within w_qgen_qset_tv_edit
integer x = 2304
integer y = 2124
integer taborder = 120
end type

type cb_search from w_vzt_treeview_base`cb_search within w_qgen_qset_tv_edit
integer x = 2651
integer y = 2124
integer taborder = 110
end type

type st_foundrecs from w_vzt_treeview_base`st_foundrecs within w_qgen_qset_tv_edit
integer x = 1349
integer y = 1760
end type

type st_stop from w_vzt_treeview_base`st_stop within w_qgen_qset_tv_edit
end type

type dw_data from w_vzt_treeview_base`dw_data within w_qgen_qset_tv_edit
integer taborder = 70
end type

type dw_print from w_vzt_treeview_base`dw_print within w_qgen_qset_tv_edit
integer taborder = 170
end type

type dw_detail from w_vzt_treeview_base`dw_detail within w_qgen_qset_tv_edit
boolean visible = false
integer x = 1669
integer y = 1620
integer width = 1426
integer height = 140
integer taborder = 80
end type

type tv_1 from w_vzt_treeview_base`tv_1 within w_qgen_qset_tv_edit
integer y = 12
integer height = 1712
integer taborder = 60
end type

event tv_1::selectionchanged;call super::selectionchanged;// if type = Q (qset) then retrieve detail info
end event

event tv_1::ue_processitem;call super::ue_processitem;//MessageBox( 'test', string( itvi_current.data)  + ':'+ string(itvi_current.level) ) 
double	ld_present_id
if Not IsValid( parent) then return 
if Not IsValid( ids_source) then return 

tab_1.tabpage_4.visible = false // question 

If il_current_item_row > 0 and il_current_item_row <= ids_source.rowCount() then 
	ld_present_id = double(ids_source.object.present_id [ il_current_item_row ])
END IF
If is_itemid <> '' 	then 
	dw_hier.Retrieve ( is_itemid ) 
	If ld_present_id = 0 then 
		// init presentation
		ld_present_id = this.event ue_init_presentation ( is_itemid, 'VZT_HIERARCHY')
	END IF 
END IF 

If ld_present_id > 0 then dw_font.Retrieve ( ld_present_id )

If 		itvi_current.level = 1 then 	// Top level 
//------------------------------------------------------------	
// Qset level 
//------------------------------------------------------------	
ElseIf 	itvi_current.level = 2 then  	// qset level
	id_qsetid = f_nvl(double( ids_source.GetItemString( il_current_item_row, 'reportid')) , 0)
	tab_1.tabpage_1.dw_flat.reset()
	cb_new.visible 		= true 

	if id_qsetid <= 0 then 
		tab_1.tabpage_2.dw_selected.Reset()
		tab_1.tabpage_2.dw_available.Reset()
		return 
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		tab_1.tabpage_1.dw_qset.Retrieve( id_qsetid)
		tab_1.tabpage_2.dw_selected.Retrieve( id_qsetid)
		tab_1.tabpage_2.dw_available.Retrieve( id_qsetid)
//		// do some data validation just in case 
//		long 		ll_badqs, ll_bq
//		string 	ls_in="('", ls_comma='', ls_sql
//		ll_badqs = dw_validation.Retrieve( id_qsetid ) // del questions in flat qset that are not in hier table
//		If ll_badqs > 0 then
//			FOR ll_bq = 1 to ll_badqs 
//				ls_in = ls_in + ls_comma + string( dw_validation.GetItemNumber( ll_bq, 'questionid') )
//				ls_comma = "', '"
//			NEXT 
//			ls_in = ls_in + "')" 
//			ls_sql = ' DELETE FROM QGEN_QSET_QUESTIONS WHERE qsetid = '+ string(id_qsetid) +' AND questionid in '+ ls_in 
//			EXECUTE IMMEDIATE :ls_sql ;
//			IF SQLCA.sqlcode = 0 then
//				COMMIT;
//			ELSE
//				ROLLBACK;
//			END IF
//			ls_sql = " DELETE FROM VZT_HIERARCHY WHERE treetype = 'QSETORG' AND nodetype = 'QSET' and reportid not in (SELECT qsetid from qgen_qset )"
//		END IF 
		
		if IsValid( inv_qgen) and id_qsetid > 0 then 
			inv_qgen.event ue_create_qset( id_qsetid, tab_1.tabpage_3.dw_survey) 
		End If
		tab_1.SelectTab ( 1 )			
		
//		 cb_ins.visible			= true
//		 cb_del.visible			= true
	END IF 

//------------------------------------------------------------	
// grouping or leaf level 
//------------------------------------------------------------	
ElseIf itvi_current.level > 2 then  
	if is_leafind = 'Y' then // Question level 
		if il_current_item_row > 0 then 
			id_questionid = double( ids_source.object.reportid [ il_current_item_row ] )
//			messagebox('qq', string( id_questionid )) 
			dw_question.Retrieve( id_questionid ) 
			long ll_ansrow
			cb_delete1.visible 	= true 
			cb_save.visible 		= true 
			cb_save.enabled 		= true 
			ll_ansrow = dw_answers.Retrieve( id_questionid)
			dw_answers.visible 	= true 	
			tab_1.tabpage_4.visible = true // questions visible
			tab_1.tabpage_4.tab_2.tabpage_6.cb_ins.visible			= true
			if ll_ansrow > 0 then tab_1.tabpage_4.tab_2.tabpage_6.cb_del.visible	= true
			
			tab_1.SelectTab ( 4 )			
		END IF 
	elseif is_leafind = 'N' then // grouping 
		tab_1.SelectTab ( 1 )			
	end if
END IF
end event

event tv_1::dragdrop;call super::dragdrop;Integer				li_Pending,max_order, li_Rows,ai_level 
Long					ll_NewItem, rtn, ll_rc , ll_drop_row , ll_parent_row , ll_after_handle 
String  				max_id,	ls_sourceid, ls_targetid, ls_filter , ls_expr , ls_source_rpt_id ,ls_leaf
string				ls_new_parent_id, ls_error, ls_code
TreeViewItem		ltvi_Target, ltvi_Parent, ltvi_to_add
any 					sourcetype
if Not IsValid( source) then return 
If GetItem(handle, ltvi_Target) = -1 Then Return

// the source can be a dw or another tv item
If io_dropsourcetype = TreeView! then 
	string ls_dragleaf, ls_dropleaf, ls_hierparentid, ls_dragqset, ls_dropqset
	ls_dragqset = parent.of_getparentidbynode ( il_dragsource, 'QSET')
	ls_dropqset = parent.of_getparentidbynode ( il_droptarget, 'QSET')
	If ls_dragqset <> ls_dropqset then 
		MessageBox('Multilevel Survey Edit Error', 'You can only move questions within the same questionnnaire!', StopSign!)
		Return 
	END IF 
	ls_dropleaf = ids_source.object.leafind [il_droprow ] 
	ls_dragleaf	= ids_source.object.leafind [il_dragrow ] 
	If itvi_Current.Level > 1 then //and ls_dragleaf	= 'Y' Then 		// 1. Moving one question 
		If ls_dropleaf = 'Y' then
			// insert sibling, refresh parent.
			ltvi_Parent = itvi_dropparent
			ls_hierparentid = is_DropParentId
		ELSE
			// dropping on a folder - it is the parent. Insert child.
			ls_hierparentid = is_dropid
			ltvi_Parent = itvi_droptarget
		END IF 
		UPDATE "VZT_HIERARCHY"  set  "vzt_hierarchy"."parent_id" = :ls_hierparentid 
		WHERE "id"= :is_DragId ;  
		
		If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to update VZT_HIERARCHY pointer.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return 
		END IF
		COMMIT;
		// delete olditem 
		tv_1.DeleteItem ( il_DragSource )
		of_refresh_children ( ltvi_Parent.itemhandle ) 
//	ELSE // moving folder - same logic?
	END IF 
	If itvi_Current.Level > 1 and is_leafind <> 'Y' Then 		// 2. Moving folder (level > 1 and not leaf)
	END IF 
ElseIf typeof( source ) = Datawindow! then 
	datawindow ldw_source
	ldw_source = source 
	
	il_DropTarget = FindItem(ParentTreeItem!, handle)
	GetItem(il_DropTarget, ltvi_Parent)

	ls_sourceid = Trim(String(itvi_Current.Data))
	ls_targetid = Trim(String(ltvi_Target.Data))

	// Get drop target level and figure where to drop 
	// Find item in the source ds
	ll_drop_row = wf_get_ds_row( ls_targetid )
	If ll_drop_row < 0 then return

	is_leafind 	= ids_source.object.leafind [ll_drop_row ] 
	is_name 		= Trim(ids_source.GetItemString(ll_drop_row ,"name"))
	is_parentid = Trim(ids_source.GetItemString(ll_drop_row ,"parent_id"))

	ll_parent_row = wf_get_ds_row( is_parentid )
	If ll_parent_row < 0 then return
	
	If ltvi_Target.level > 1 and is_leafind = 'Y' then
		// insert under parent
		ls_new_parent_id 	= is_parentid 
		ltvi_to_add			= ltvi_Parent
		ll_after_handle	= handle
	ELSE
		ls_new_parent_id 	= ls_targetid 
		ltvi_to_add			= ltvi_Target
		ll_after_handle	= 0 
	END IF 
	
	If ldw_source.dataobject <> 'd_qset_edit_qlist_available' then return 
	long ll_source_row, ll_row, ll_sort, ll_hsort
	double	ld_questionid
	string 	ls_practiceid, ls_locationid, ls_request = 'ADD', ls_hid, ls_qtext, ls_qid
			
	// insert row and populate it from object list 
	ll_source_row = ldw_source.GetSelectedRow( 0) 
	//ll_sort = dw_selectedq.RowCount() + 1
	// New Hierarchy sort 	
	SELECT MAX(orderingroup)+10 INTO :ll_hsort FROM VZT_HIERARCHY WHERE parent_id = :ls_new_parent_id ;
	ll_hsort = f_nvl(ll_hsort, 10)  
	// New flat qset questions sort 	
	SELECT MAX("sortorder")+10 INTO :ll_sort FROM "qgen_qset_questions" WHERE "qsetid" = :id_qsetid ;
	ll_sort = f_nvl(ll_sort, 10)  
		
	DO WHILE ll_source_row > 0 
		ld_questionid 	= ldw_source.GetItemNumber ( ll_source_row , 'questionid') 
		ls_qid			= string ( ld_questionid 	)
		ls_qtext			= ldw_source.GetItemString ( ll_source_row , 'qgen_questions_questiontxt') 
		ls_expr 			= " questionid = " + string(ld_questionid ) 
	// Get max child sort order for the hier. parent 			
      
		If dw_selectedq.Find( ls_expr , 0, dw_selectedq.RowCount() ) = 0 then // assign only if not exist already 
		
			INSERT INTO qgen_qset_questions 
			VALUES( :id_qsetid, :ld_questionid, :ll_sort ) ;

			If sqlca.SQLCode <> 0 Then        
	        ls_error =  sqlca.SQLerrtext
	        ls_code =  string( sqlca.SQLCode) 
	        ROLLBACK;
	        MessageBox('Database Error', 'Failed to insert question.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
	        return 
			END IF
			
			ls_hid = parent.event ue_get_new_hid () 
			If ls_hid <> '' then // now insert into hierarchy 
				INSERT INTO "VZT_HIERARCHY"  (
				"vzt_hierarchy"."id",   
   	      "vzt_hierarchy"."parent_id",   
	         "vzt_hierarchy"."name",   
   	      "vzt_hierarchy"."orderingroup",   
      	   "vzt_hierarchy"."treetype",   
         	"vzt_hierarchy"."leafind",   
	         "vzt_hierarchy"."reportid",   
	         "vzt_hierarchy"."descr",   
	         "vzt_hierarchy"."present_id",   
	         "vzt_hierarchy"."graphic_id"  ,
				"vzt_hierarchy"."nodetype"  ,
				)
				 VALUES( 
				 	:ls_hid ,   
	         	:ls_new_parent_id ,   
					:ls_qtext,   
	           	:ll_sort,   
		         'QSETORG',   
	         	'Y',   
	         	:ls_qid,   
	         	'',
					0,
					0,
					'QUESTION'
					) ;  
				If sqlca.SQLCode <> 0 Then        
		        ls_error =  sqlca.SQLerrtext
		        ls_code =  string( sqlca.SQLCode) 
		        ROLLBACK;
		        MessageBox('Database Error', 'Failed to insert question into VZT_HIERARCHY.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
		        return 
				END IF

			ELSE
				return 
			END IF 

		End if				// find
		If ll_source_row < ldw_source.RowCount() then 
			ll_source_row = ldw_source.GetSelectedRow( ll_source_row) // get next selected
		ELSE
			ll_source_row = 0
		END IF 
		ll_sort += 10
		
//		// Add the item(s) to the TreeView
//		ids_Source.Retrieve(is_treetype)
//		ls_filter = "id = '" + ls_hid +"'"
//		ids_Source.SetFilter(ls_filter)
//		ids_Source.Filter()
//		li_Rows = ids_Source.RowCount()
//		ll_after_handle = of_add_children(  ltvi_Parent.itemhandle, ll_after_handle ) // pass 1 as the level to build
//		ids_Source.SetFilter('1=1')
//		ids_Source.Filter()
		
	LOOP // while rows selected 
	COMMIT ;
	dw_selectedq.Retrieve( id_qsetid) 
	dw_availableq.Retrieve( id_qsetid) 
	ldw_source.SelectRow( 0, false) // reset all selections
	of_refresh_children ( ltvi_Parent.itemhandle ) 
ELSE
END IF // source types ------------


return 


//if trim(ltvi_Target.label) <> trim(gnv_appman.is_userid) then return

long ll_source_rpt_row , ll_target_rpt_row 
ll_source_rpt_row = ids_source.Find( "id = '"+ ls_sourceid +"'" , 1, ids_source.RowCount()) 
If ll_source_rpt_row <= 0 then return 
ls_source_rpt_id = trim(ids_source.object.reportid [ ll_source_rpt_row ] )
ls_leaf= trim(ids_source.object.leafind [ ll_source_rpt_row ] )
ls_expr = " parent_id = '"+ls_targetid+"'  and reportid = '"+ ls_source_rpt_id +"' "
ll_target_rpt_row = ids_source.Find( ls_expr, 1, ids_source.RowCount() ) 
If ll_target_rpt_row > 0  then return //ignore duplicates 
If ls_leaf ='N' or ls_leaf ='G' then return //ignore duplicates

// Verify move
GetItem(il_DragParent, ltvi_Parent)
If MessageBox("Copy Report", "Are you sure you want to Copy '" + &
						itvi_Current.Label + "' from " + ltvi_Parent.label + &
						"?", Question!, YesNo!) = 2 Then Return
//	string ls_hid
	SELECT max(VZT_HIERARCHY.id) INTO :ls_hid FROM VZT_HIERARCHY;
	if SQLCA.SQLCode < 0 then 
		messagebox("Database Error when selecting from VZT_HIERARCHY", SQLCA.SQLErrText)
		return
	end if
	//Messagebox("max_id",max_id)
 	max_id = string( long(ls_hid) + 1 )
	 
  INSERT INTO "VZT_HIERARCHY"  
  SELECT  	:max_id ,   
         	:ls_targetid,   
				"NAME",   
           	"ORDERINGROUP",   
	         "TREETYPE",   
         	"LEAFIND",   
         	"REPORTID",   
         	"DESCR" FROM VZT_HIERARCHY WHERE ID = :ls_sourceid;  
ll_rc = SQLCA.SQLcode 				
f_end_tran( SQLCA, ll_rc, "Insert into HIERARCHY", "Insert into HIERARCHY successful.", "Insert into HIERARCHY failed.")
if ll_rc < 0 then return 


end event

event tv_1::dragwithin;//overr
TreeViewItem		ltvi_Over
string 				ls_targetid , ls_leafind 	
long 					ll_over_row, ll_phandle
If GetItem(handle, ltvi_Over) = -1 Then
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
End If

ls_targetid = Trim(String(ltvi_Over.Data))

// Find item in the source ds
ids_source.SetFilter('1=1')
ids_source.Filter()
ll_over_row = ids_source.Find ( "id = '"+ls_targetid +"'", 1, ids_source.RowCount() )

If ll_over_row <= 0 then 
	MessageBox('VZT Treeview Error', '"Drop over" info record not found!~r~nID:'+ls_targetid , StopSign!) 
	return
end if

ls_leafind 	= ids_source.object.leafind [ll_over_row] 

If ltvi_Over.level > 1 then 
	If ls_leafind 	= 'Y' Then // find parent 
		// Drop target is this item's parent
		il_DropTarget = FindItem(ParentTreeItem!, handle)
	//	If il_DropTarget <> il_DragParent Then
	//		SetDropHighlight(il_DropTarget)
	//	Else
	//		SetDropHighlight(0)
	//		il_DropTarget = 0
	//	End If
	//Else
	//	 Highlight the question to drop after but remember the parent 
	Else // level > 1 but not leaf - grouping - use it 
	END IF // leaf
	If handle <> il_DragParent Then
		SetDropHighlight(handle)
		il_DropTarget = handle
	Else
		SetDropHighlight(0)
		il_DropTarget = 0
	End If

End If


end event

event tv_1::ue_item_delete_check;// overr

long 					ll_ds_row
treeviewitem 		ltvi_item
string	ls_id 
string 	ls_error, ls_code
long		ll_leaf_id

tv_1.GetItem( al_handle , ltvi_item) 
ls_id = ltvi_item.data
ll_ds_row = wf_get_ds_row( ls_id )
if ll_ds_row <= 0 then return -1
ll_leaf_id = double( ids_source.object.reportid[ ll_ds_row ] ) //question id
If ids_source.object.leafind[ ll_ds_row ] = 'Y' then 
	// Delete leaf from the database 
	if id_qsetid <=0 then 
		ROLLBACK;
		MessageBox('VZT Hierarchy Deletion Error', 'Questionnaire id missing.', stopsign!) 
		Return -1
	END IF

	DELETE FROM qgen_qset_questions  
	WHERE qgen_qset_questions.questionid 	= :ll_leaf_id AND 
			qgen_qset_questions.qsetid 		= :id_qsetid ;
	
	if sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to delete Questions from Questionnaire.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return -1
	END IF
ElseIf ll_leaf_id > 0 then // qset level 
 // DELETING THE WHOLE QSET ??????????????
 int li_rc
 li_rc = MessageBox('Questionnaire Deletion','Are you sure you want to delete Questionnaire '+string(id_qsetid) +' Comletetely?', question!, YesNo!, 2)
 if li_rc = 1 then 	
	DELETE FROM QGEN_QSET
	WHERE QGEN_QSET.qsetid = :id_qsetid ;
	
	if sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to delete Questionnaire.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return -1
	END IF
 end if	
End If

// DELEte HIER record // done in trigger
DELETE FROM VZT_HIERARCHY WHERE ID = :ls_id AND TREETYPE = 'QSETORG' ;

if sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to delete from VZT_HIERARCHY.'+&
		  '~r~nID:'+ls_id+ &  
		  '~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return -1
END IF

commit;

return 1

//
//
//string ls_filter 
////1. Delete this row AND ALL CHILDREN !!! from hierarchy 
//
////if is_leafind = 'Y' 
// 
//ids_Source.Retrieve(is_treetype)
////ls_filter = "parent_id = '" + ls_parentid +"'"
//ids_Source.SetFilter(ls_filter)
//ids_Source.Filter()
//ids_Source.SetSort('parent_id A, orderingroup A')
//ids_Source.Sort()
//
////2. Delete questions from QSET for children leaves in ids_source 
//



end event

event tv_1::ue_item_delete;call super::ue_item_delete;tab_1.tabpage_2.dw_selected.Retrieve( id_qsetid)
tab_1.tabpage_2.dw_available.Retrieve( id_qsetid)
this.event ue_processitem ( il_currentitem )
return 1
end event

event tv_1::ue_item_insert_desc;//overr
string ls_hid , ls_leaf ,ls_error, ls_code
long ll_sort, ll_row

ls_hid = parent.event ue_get_new_hid ()
ll_sort = 99
ls_leaf = 'N'
//if ls_hid <= 0 then return -1

INSERT INTO "VZT_HIERARCHY"  (
				"vzt_hierarchy"."id",   
   	      "vzt_hierarchy"."parent_id",   
	         "vzt_hierarchy"."name",   
   	      "vzt_hierarchy"."orderingroup",   
      	   "vzt_hierarchy"."treetype",   
         	"vzt_hierarchy"."leafind",   
	         "vzt_hierarchy"."reportid",   
	         "vzt_hierarchy"."descr",   
	         "vzt_hierarchy"."present_id",   
	         "vzt_hierarchy"."graphic_id"  ,
				"vzt_hierarchy"."nodetype"  ,
				)
				 VALUES( 
				 	:ls_hid ,   
	         	:as_parentid ,   
					'New Item',   
	           	:ll_sort,   
		         'QSETORG',   
	         	:ls_leaf ,   
	         	'',   
	         	'',
					0,
					0,
					''
					) ;  
				If sqlca.SQLCode <> 0 Then        
		        ls_error =  sqlca.SQLerrtext
		        ls_code =  string( sqlca.SQLCode) 
		        ROLLBACK;
		        MessageBox('Database Error', 'Failed to insert question into VZT_HIERARCHY.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
		        return ''
				END IF
		
COMMIT;
ll_row = ids_source.InsertRow(0)
if ll_row > 0 then 
	ids_source.object.id [ll_row] 			= ls_hid
	ids_source.object.parent_id [ll_row] 	= as_parentid 
	ids_source.object.name [ll_row] 			= 'New Item'
	ids_source.object.orderingroup[ll_row] = ll_sort
	ids_source.object.treetype [ll_row] 	= 'QSETORG'
	ids_source.object.leafind [ll_row] 		= 	ls_leaf 
END IF

return ls_hid
end event

event tv_1::beginlabeledit;
return 0
end event

event tv_1::endlabeledit;TreeViewItem		ltvi_edit
string 				ls_newtext, ls_hid,ls_error, ls_code
GetItem(handle, ltvi_edit)

ls_hid		= string(ltvi_edit.data)

If not IsNull(newtext ) then 
	UPDATE VZT_HIERARCHY SET name = :newtext WHERE id = :ls_hid;

	If sqlca.SQLCode <> 0 Then        
  	    ls_error =  sqlca.SQLerrtext
     	 ls_code =  string( sqlca.SQLCode) 
       ROLLBACK;
       MessageBox('Database Error', 'Failed to udate VZT_HIERARCHY item name~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
       return 1
	END IF

	COMMIT;
END IF

this.event ue_processitem( handle )
tab_1.SelectTab( 5)
end event

type st_vertical from w_vzt_treeview_base`st_vertical within w_qgen_qset_tv_edit
end type

type st_horizontal1 from w_vzt_treeview_base`st_horizontal1 within w_qgen_qset_tv_edit
end type

type dw_hier_base from w_vzt_treeview_base`dw_hier_base within w_qgen_qset_tv_edit
integer taborder = 40
end type

type dw_font_base from w_vzt_treeview_base`dw_font_base within w_qgen_qset_tv_edit
integer taborder = 50
end type

type tab_1 from tab within w_qgen_qset_tv_edit
event ue_resize ( long newwidth,  long newheight )
integer x = 1426
integer width = 2688
integer height = 1724
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type

event ue_resize;//
tab_1.tabpage_3.dw_survey.width 	= newwidth 	- 35 //(5 * tab_1.tabpage_3.dw_survey.x)
tab_1.tabpage_3.dw_survey.height = newheight - 140 // (6 * tab_1.tabpage_3.dw_survey.y)

tab_1.tabpage_4.tab_2.width 	= newwidth 	- 35  
tab_1.tabpage_4.tab_2.height 	= newheight - 140  
end event

event selectionchanged;

CHOOSE CASE newindex
	CASE 3
		if IsValid( inv_qgen) and id_qsetid > 0 then 
			inv_qgen.event ue_create_qset( id_qsetid, tab_1.tabpage_3.dw_survey) 
		End If
END CHOOSE

end event

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_7=create tabpage_7
this.tabpage_8=create tabpage_8
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_7,&
this.tabpage_8}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_7)
destroy(this.tabpage_8)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2651
integer height = 1596
long backcolor = 79741120
string text = "QSET Details"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditDataTabular!"
long picturemaskcolor = 553648127
dw_qset dw_qset
cb_new_qset cb_new_qset
cb_del_qset cb_del_qset
cb_4 cb_4
dw_flat dw_flat
end type

on tabpage_1.create
this.dw_qset=create dw_qset
this.cb_new_qset=create cb_new_qset
this.cb_del_qset=create cb_del_qset
this.cb_4=create cb_4
this.dw_flat=create dw_flat
this.Control[]={this.dw_qset,&
this.cb_new_qset,&
this.cb_del_qset,&
this.cb_4,&
this.dw_flat}
end on

on tabpage_1.destroy
destroy(this.dw_qset)
destroy(this.cb_new_qset)
destroy(this.cb_del_qset)
destroy(this.cb_4)
destroy(this.dw_flat)
end on

type dw_qset from uo_vzt_dwbase within tabpage_1
integer x = 59
integer y = 44
integer width = 2171
integer height = 748
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_qset_edit_tv"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.ib_poweredit = true 
_SetNullonNewSearch 			= true
_ResetMaskOnSearch 			= false
_ResetDataObjectOnSelect 	= false
//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'sortorder', 'descr', 'y_start','y_before_q', 'active', 'showqnum' ,& 
			'y_q_to_a','x_start_q','x_start_a' }

is_searchable[]	=  is_editable[]

dw_primary = this 
wf_setupdateable( dw_primary, 'Questionnaire Detail', true, true)
end event

event ue_refresh_identity;long ll_row
If this.GetRow() <= 0 then return  

if f_nvl(this.GetitemNumber( this.GetRow(), 'qsetid'),0) = 0 then 
	
	SELECT max(qsetid) into :id_qsetid from qgen_qset ;
	//MessageBox('qid',string(id_questionid))
	this.setitem( this.GetRow(), 'qsetid', id_qsetid)
	
END IF
end event

type cb_new_qset from commandbutton within tabpage_1
integer x = 215
integer y = 812
integer width = 457
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New Questionnaire"
end type

event clicked;iw_mywindow.event ue_cb_new()  
cb_newsearch.visible = false
end event

type cb_del_qset from commandbutton within tabpage_1
integer x = 818
integer y = 812
integer width = 507
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Questionnaire"
end type

type cb_4 from commandbutton within tabpage_1
event type long ue_process_level ( string as_hierid,  long al_next )
integer x = 1440
integer y = 812
integer width = 453
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Build Flat Order"
end type

event ue_process_level;long ll_rows, ll_row, ll_next 
string ls_hierid, ls_qsetid
ll_rows = dw_flat.retrieve( as_hierid ) // get children 
ls_qsetid = string( id_qsetid)
FOR ll_row = 1 to ll_rows 
	ls_hierid = dw_flat.GetItemString( ll_row , 'id') 
	UPDATE VZT_HIERARCHY SET flatorder = :al_next , top_parent_node = :ls_qsetid
	where id = :ls_hierid; 
	al_next = this.event ue_process_level( ls_hierid , al_next + 1 )
	dw_flat.retrieve( as_hierid ) // refresh level 
NEXT
COMMIT;
return al_next + 1 
end event

event clicked;string ls_id

dw_flat.SetRedraw(false) 

ls_id = dw_hier.GetItemString( 1, 'id')
this.event ue_process_level( ls_id , 1 )

dw_flat.SetRedraw(true ) 
end event

type dw_flat from uo_vzt_dwbase within tabpage_1
integer x = 23
integer y = 916
integer width = 2066
integer height = 556
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_qset_hier_flat"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2651
integer height = 1596
long backcolor = 79741120
string text = "Questions"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Where!"
long picturemaskcolor = 553648127
st_3 st_3
dw_selected dw_selected
dw_available dw_available
st_1 st_1
st_2 st_2
cb_up cb_up
cb_1 cb_1
end type

on tabpage_2.create
this.st_3=create st_3
this.dw_selected=create dw_selected
this.dw_available=create dw_available
this.st_1=create st_1
this.st_2=create st_2
this.cb_up=create cb_up
this.cb_1=create cb_1
this.Control[]={this.st_3,&
this.dw_selected,&
this.dw_available,&
this.st_1,&
this.st_2,&
this.cb_up,&
this.cb_1}
end on

on tabpage_2.destroy
destroy(this.st_3)
destroy(this.dw_selected)
destroy(this.dw_available)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_up)
destroy(this.cb_1)
end on

type st_3 from statictext within tabpage_2
integer x = 754
integer y = 1500
integer width = 411
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "double click to delete"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_selected from uo_vzt_dwbase within tabpage_2
integer y = 68
integer width = 1211
integer height = 1412
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_qset_edit_qlist_selected"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dropable 						= true
_drop_selected_DW 			= true  
_drop_available_DW 			= false // available options
_selection_service 			= 'M'  

tab_1.tabpage_2.dw_available._dw_droptarget = this

this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'questionid_t', 'questionid A', 'questionid D')
this.inv_field_sort.of_setcolumn( 'question_t', 'qgen_questions_questiontxt A', 'qgen_questions_questiontxt D')
this.inv_field_sort.of_setcolumn( 'sortorder_t', 'sortorder A', 'sortorder D')

this.setsort( 'questionid A')


end event

event dragdrop;datawindow ldw_source
long ll_source_row, ll_row, ll_sort
double	ld_questionid
string 	ls_expr, ls_practiceid, ls_locationid, ls_request = 'ADD'
			
ldw_source = source 
If IsValid( ldw_source ) then 
	// insert row and populate it from object list 
	if ldw_source.dataobject = 'd_qset_edit_qlist_available' then 
		ll_source_row = ldw_source.GetSelectedRow( 0) 
		ll_sort = this.RowCount() + 1
		DO WHILE ll_source_row > 0 

			ld_questionid = ldw_source.GetItemNumber ( ll_source_row , 'questionid') 
			ls_expr = " questionid = " + string(ld_questionid ) 
			
			If this.Find( ls_expr , 0, this.RowCount() ) = 0 then // assign only if not exist already 
				INSERT INTO qgen_qset_questions 
				VALUES( :id_qsetid, :ld_questionid, :ll_sort ) ;
			End if				// find
			If ll_source_row < ldw_source.RowCount() then 
				ll_source_row = ldw_source.GetSelectedRow( ll_source_row) // get next selected
			ELSE
				ll_source_row = 0
			END IF 
			ll_sort += 10
		LOOP // while rows selected 
		COMMIT ;
		this.Retrieve( id_qsetid) 
	End If
	ldw_source.SelectRow( 0, false) // reset all selections
End If
end event

event ue_delete_selected;call super::ue_delete_selected;double ld_questionid

ld_questionid = this.GetItemNumber ( al_row , 'questionid') 
DELETE FROM qgen_qset_questions 
WHERE 
			qsetid 		= :id_qsetid and 
			questionid 	= :ld_questionid;
			
return f_dbcheck( SQLCA, 'Selected QSET Questions', '', 'Delete failed.', true) 



end event

event ue_selected_row_up;long ll_row, ll_thissort, ll_newrow
long ll_this_sort, ll_prev_sort, ll_questionid


ll_row = this.GetSelectedRow( 0) 
if ll_row <= 1 or ll_row > This.RowCount() then return

ll_this_sort = this.GetItemNumber( ll_row		, 'sortorder')
ll_questionid= this.GetItemNumber( ll_row		, 'questionid')
ll_prev_sort = this.GetItemNumber( ll_row -1	, 'sortorder')
If ll_this_sort = ll_prev_sort then ll_prev_sort = ll_prev_sort - 1

this.SetItem( ll_row			, 'sortorder', ll_prev_sort )
this.SetItem( ll_row - 1 	, 'sortorder', ll_this_sort )

If this.Update( false, true) = 1 then 
	COMMIT;
ELSE
	ROLLBACK;
END IF

this.sort()
this.selectrow(0, false)
ll_newrow = this.Find( 'questionid = '+string( ll_questionid) , 0, this.RowCount() )
if ll_newrow > 0 then 
	this.selectrow(ll_newrow , true)
Else
	this.selectrow(ll_row - 1, true)
END IF

end event

event ue_selected_row_down;long ll_row, ll_thissort, ll_newrow
long ll_this_sort, ll_next_sort , ll_questionid

ll_row = this.GetSelectedRow( 0) 
if ll_row <= 0 or ll_row >= This.RowCount() then return

ll_this_sort = this.GetItemNumber( ll_row		, 'sortorder')
ll_questionid= this.GetItemNumber( ll_row		, 'questionid')
ll_next_sort = this.GetItemNumber( ll_row +1	, 'sortorder')
If ll_this_sort = ll_next_sort then ll_next_sort = ll_next_sort + 1

this.SetItem( ll_row			, 'sortorder', ll_next_sort )
this.SetItem( ll_row + 1 	, 'sortorder', ll_this_sort )

If this.Update( false, true) = 1 then 
	COMMIT;
ELSE
	ROLLBACK;
END IF

this.sort()
this.selectrow(0, false)
ll_newrow = this.Find( 'questionid = '+string( ll_questionid) , 0, this.RowCount() )
if ll_newrow > 0 then 
	this.selectrow(ll_newrow , true)
Else
	this.selectrow(ll_row + 1, true)
END IF

end event

event doubleclicked;call super::doubleclicked;tab_1.tabpage_2.dw_available.Retrieve( id_qsetid)
end event

event ue_dragdrop_refresh;this.Retrieve( id_qsetid)
end event

type dw_available from uo_vzt_dwbase within tabpage_2
integer x = 1230
integer y = 68
integer width = 1198
integer height = 1412
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_qset_edit_qlist_available"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;_dragable 						= true
_dropable 						= false
_drop_available_DW 			= true // available options
_selection_service = 'M'  

this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'questionid_t', 'questionid A', 'questionid D')
this.inv_field_sort.of_setcolumn( 'question_t', 'qgen_questions_questiontxt A', 'qgen_questions_questiontxt D')

this.setsort( 'questionid A')


end event

type st_1 from statictext within tabpage_2
integer x = 133
integer y = 4
integer width = 590
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Selected questions:"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_2
integer x = 1605
integer y = 4
integer width = 832
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Available Questions:"
boolean focusrectangle = false
end type

type cb_up from commandbutton within tabpage_2
integer x = 18
integer y = 1508
integer width = 334
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Move Up"
end type

event clicked;tab_1.tabpage_2.dw_selected.event ue_selected_row_up ()
end event

type cb_1 from commandbutton within tabpage_2
integer x = 393
integer y = 1508
integer width = 334
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Move Down"
end type

event clicked;tab_1.tabpage_2.dw_selected.event ue_selected_row_down ()
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2651
integer height = 1596
long backcolor = 79741120
string text = "Preview"
long tabbackcolor = 79741120
string picturename = "Options!"
long picturemaskcolor = 553648127
dw_survey dw_survey
end type

on tabpage_3.create
this.dw_survey=create dw_survey
this.Control[]={this.dw_survey}
end on

on tabpage_3.destroy
destroy(this.dw_survey)
end on

type dw_survey from uo_vzt_dwbase within tabpage_3
integer y = 12
integer width = 2098
integer height = 1436
boolean bringtotop = true
string dataobject = "d_template02"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2651
integer height = 1596
long backcolor = 79741120
string text = "Question"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
tab_2 tab_2
end type

on tabpage_4.create
this.tab_2=create tab_2
this.Control[]={this.tab_2}
end on

on tabpage_4.destroy
destroy(this.tab_2)
end on

type tab_2 from tab within tabpage_4
integer width = 2007
integer height = 1428
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
integer selectedtab = 1
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type

on tab_2.create
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.Control[]={this.tabpage_5,&
this.tabpage_6}
end on

on tab_2.destroy
destroy(this.tabpage_5)
destroy(this.tabpage_6)
end on

type tabpage_5 from userobject within tab_2
integer x = 18
integer y = 108
integer width = 1970
integer height = 1304
long backcolor = 79741120
string text = "Question"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_question_tab dw_question_tab
end type

on tabpage_5.create
this.dw_question_tab=create dw_question_tab
this.Control[]={this.dw_question_tab}
end on

on tabpage_5.destroy
destroy(this.dw_question_tab)
end on

type dw_question_tab from uo_vzt_dwbase within tabpage_5
integer x = 23
integer width = 1888
integer height = 1288
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_qlist02q_edit_tv"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_refresh_identity;long ll_row
If this.GetRow() <= 0 then return  

if f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0) = 0 then 
	
	SELECT max(questionid) into :id_questionid from qgen_questions ;
	//MessageBox('qid',string(id_questionid))
	this.setitem( this.GetRow(), 'questionid', id_questionid)
	
END IF
end event

event constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'questiontxt', 'descr', 'qtypeid', 'width','height', 'same_row',  &
			'repeat', 'ansperline', 'scorable' , 			& 
			'ddlookuptype','ddcodecol','dddispcol',  		&
			'ddlookup','ddcoltype', 'weblookup', 'weight','fontface','fontsize','bold', &
			'italic', 'under', 'fgcolor','bgcolor', 'defgraphtype'}

is_searchable[]	=  is_editable[]


wf_setupdateable( tab_1.tabpage_4.tab_2.tabpage_5.dw_question_tab, 'Question Detail', false, false)

end event

event itemchanged;call super::itemchanged;if row <= 0 or row > this.RowCount() then return 

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
	END IF
	
END IF // new row
end event

event buttonclicked;string ls_lookupprocessor, ls_newvalue, ls_autoreplace, ls_colname
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

type tabpage_6 from userobject within tab_2
integer x = 18
integer y = 108
integer width = 1970
integer height = 1304
long backcolor = 79741120
string text = "Answers"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_answers_tab dw_answers_tab
cb_ins cb_ins
cb_del cb_del
end type

on tabpage_6.create
this.dw_answers_tab=create dw_answers_tab
this.cb_ins=create cb_ins
this.cb_del=create cb_del
this.Control[]={this.dw_answers_tab,&
this.cb_ins,&
this.cb_del}
end on

on tabpage_6.destroy
destroy(this.dw_answers_tab)
destroy(this.cb_ins)
destroy(this.cb_del)
end on

type dw_answers_tab from uo_vzt_dwbase within tabpage_6
integer y = 12
integer width = 1687
integer height = 1084
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_answers_edit"
boolean vscrollbar = true
end type

event constructor;call super::constructor;wf_setupdateable( tab_1.tabpage_4.tab_2.tabpage_6.dw_answers_tab, "Answer Choices", false, false)

end event

event ue_update_keys_on_new;If row <= 0 then return 1
this.SetItem( row, 'questionid', id_questionid)
return 1
end event

type cb_ins from commandbutton within tabpage_6
integer x = 14
integer y = 1104
integer width = 165
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Ins"
end type

event clicked;if dw_answers.visible then 
	long			ll_newrow
 	ll_newrow = dw_answers.EVENT ue_insert_new( 'answertxt')
	if ll_newrow <= 0 then return 
	dw_answers.SetItem( ll_newrow, 'sortorder', ll_newrow * 10)
	tab_1.tabpage_4.tab_2.tabpage_6.cb_del.visible	= true
End IF 
end event

type cb_del from commandbutton within tabpage_6
integer x = 215
integer y = 1104
integer width = 165
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Del"
end type

event clicked;if dw_answers.visible and dw_answers.RowCount() > 0 then dw_answers.DeleteRow(0)
If dw_answers.RowCount() <=0 then this.visible = false
end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2651
integer height = 1596
long backcolor = 79741120
string text = "Hierarchy Detail"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "TreeView!"
long picturemaskcolor = 553648127
dw_present dw_present
dw_hier_edit dw_hier_edit
end type

on tabpage_7.create
this.dw_present=create dw_present
this.dw_hier_edit=create dw_hier_edit
this.Control[]={this.dw_present,&
this.dw_hier_edit}
end on

on tabpage_7.destroy
destroy(this.dw_present)
destroy(this.dw_hier_edit)
end on

type dw_present from uo_vzt_dwbase within tabpage_7
integer y = 444
integer width = 1266
integer height = 668
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_vzt_present_edit"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;wf_setupdateable( dw_present, "Hierarchy text presentation", false, false)

end event

event buttonclicked;string ls_lookupprocessor, ls_newvalue, ls_autoreplace, ls_colname
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

type dw_hier_edit from uo_vzt_dwbase within tabpage_7
integer y = 44
integer width = 2231
integer height = 888
integer taborder = 20
string dataobject = "d_qgen_hierarchy_edit"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;wf_setupdateable( dw_hier_edit, "Hierarchy detail", false, false)

end event

event itemchanged;call super::itemchanged;if row <= 0 or row > 1 then return 

IF dwo.name = 'name' then 
	itvi_current.label = data
END IF 
end event

type tabpage_8 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2651
integer height = 1596
long backcolor = 79741120
string text = "Export"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_xq dw_xq
dw_xqq dw_xqq
dw_xh dw_xh
dw_xpr dw_xpr
dw_xac dw_xac
cb_2 cb_2
sle_exportfile sle_exportfile
cb_3 cb_3
dw_xqs dw_xqs
end type

on tabpage_8.create
this.dw_xq=create dw_xq
this.dw_xqq=create dw_xqq
this.dw_xh=create dw_xh
this.dw_xpr=create dw_xpr
this.dw_xac=create dw_xac
this.cb_2=create cb_2
this.sle_exportfile=create sle_exportfile
this.cb_3=create cb_3
this.dw_xqs=create dw_xqs
this.Control[]={this.dw_xq,&
this.dw_xqq,&
this.dw_xh,&
this.dw_xpr,&
this.dw_xac,&
this.cb_2,&
this.sle_exportfile,&
this.cb_3,&
this.dw_xqs}
end on

on tabpage_8.destroy
destroy(this.dw_xq)
destroy(this.dw_xqq)
destroy(this.dw_xh)
destroy(this.dw_xpr)
destroy(this.dw_xac)
destroy(this.cb_2)
destroy(this.sle_exportfile)
destroy(this.cb_3)
destroy(this.dw_xqs)
end on

type dw_xq from uo_vzt_dwbase within tabpage_8
integer x = 9
integer y = 140
integer width = 2085
integer height = 132
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_questions"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_xqq from uo_vzt_dwbase within tabpage_8
integer x = 9
integer y = 284
integer width = 1157
integer height = 240
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_qset_questions"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_xh from uo_vzt_dwbase within tabpage_8
integer x = 9
integer y = 800
integer width = 2098
integer height = 396
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_qset_hier"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_xpr from uo_vzt_dwbase within tabpage_8
integer x = 1170
integer y = 284
integer width = 933
integer height = 240
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_presentation"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_xac from uo_vzt_dwbase within tabpage_8
integer x = 9
integer y = 528
integer width = 2098
integer height = 268
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_answer_choices"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cb_2 from commandbutton within tabpage_8
integer x = 9
integer y = 1220
integer width = 197
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "export"
end type

event clicked;string ls_fname

ls_fname = sle_exportfile.text + string(id_qsetid)

dw_xqs.SaveAS( ls_fname + '_xqs', Text!, false )
dw_xh.SaveAS( 	ls_fname + '_xh', Text!, false )
dw_xpr.SaveAS( ls_fname + '_xpr', Text!, false )
dw_xq.SaveAS( 	ls_fname + '_xq', Text!, false )
dw_xqq.SaveAS( ls_fname + '_xqq', Text!, false )
dw_xac.SaveAS( ls_fname + '_xac', Text!, false )

end event

type sle_exportfile from singlelineedit within tabpage_8
integer x = 224
integer y = 1228
integer width = 489
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "c:\windows\temp\"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within tabpage_8
integer x = 736
integer y = 1228
integer width = 201
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "import"
end type

type dw_xqs from uo_vzt_dwbase within tabpage_8
integer x = 9
integer y = 4
integer width = 2080
integer height = 140
integer taborder = 20
string dataobject = "d_export_qset"
boolean hscrollbar = true
end type

type dw_validation from uo_vzt_dwbase within w_qgen_qset_tv_edit
boolean visible = false
integer x = 2304
integer y = 1608
integer width = 722
integer height = 236
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_export_qset_hier_validation"
borderstyle borderstyle = stylebox!
end type

