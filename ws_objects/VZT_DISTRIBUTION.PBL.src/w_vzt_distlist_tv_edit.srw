$PBExportHeader$w_vzt_distlist_tv_edit.srw
forward
global type w_vzt_distlist_tv_edit from w_vzt_treeview_base
end type
type tab_1 from tab within w_vzt_distlist_tv_edit
end type
type tabpage_1 from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type cb_filter from commandbutton within tabpage_1
end type
type dw_contact_list from uo_vzt_dwbase within tabpage_1
end type
type dw_address from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_2 cb_2
cb_1 cb_1
cb_filter cb_filter
dw_contact_list dw_contact_list
dw_address dw_address
end type
type tabpage_2 from userobject within tab_1
end type
type dw_selected from uo_vzt_dwbase within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_selected dw_selected
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
type tab_1 from tab within w_vzt_distlist_tv_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_7 tabpage_7
end type
end forward

global type w_vzt_distlist_tv_edit from w_vzt_treeview_base
integer x = 18
integer width = 4686
integer height = 2232
string title = "Distribution List Edit"
tab_1 tab_1
end type
global w_vzt_distlist_tv_edit w_vzt_distlist_tv_edit

type variables
long 	il_listid, il_addressid
string	is_hierid
uo_vzt_dwbase   dw_answers, dw_question, dw_list
uo_vzt_dwbase   dw_selectedq, dw_availableq 
end variables

on w_vzt_distlist_tv_edit.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_vzt_distlist_tv_edit.destroy
call super::destroy
destroy(this.tab_1)
end on

event ue_preopen;call super::ue_preopen;is_treetype = 'DISTLIST'

// The following lines are for setting up the resizing service
idrg_Vertical 		= tv_1 
idrg_Horizontal	= tab_1 // idw_Data
ist_Horizontal 	= st_horizontal1

end event

event open;call super::open;
it_main_tab = tab_1

is_accessflags = 'WR'
dw_primary = tab_1.tabpage_1.dw_contact_list

if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

//cb_newsearch.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
//dw_data.POST SetFocus()

//dw_answers  = tab_1.tabpage_4.tab_2.tabpage_6.dw_answers_tab
//dw_question = tab_1.tabpage_4.tab_2.tabpage_5.dw_question_tab
dw_selectedq= tab_1.tabpage_2.dw_selected
//dw_availableq=tab_1.tabpage_2.dw_available

dw_font_base.ShareData( tab_1.tabpage_7.dw_present )
dw_hier_base.ShareData( tab_1.tabpage_7.dw_hier_edit)

//dw_font		=tab_1.tabpage_7.dw_present
//dw_hier		=tab_1.tabpage_7.dw_hier_edit
dw_list			=tab_1.tabpage_1.dw_contact_list

dw_primary.Retrieve()
dw_primary.event ue_rowselected(1, true) 
end event

event resize;call super::resize;// resize tab pages
end event

type cb_dfilter from w_vzt_treeview_base`cb_dfilter within w_vzt_distlist_tv_edit
end type

type uo_trace01 from w_vzt_treeview_base`uo_trace01 within w_vzt_distlist_tv_edit
end type

type dw_mainlist from w_vzt_treeview_base`dw_mainlist within w_vzt_distlist_tv_edit
end type

type cb_last_search from w_vzt_treeview_base`cb_last_search within w_vzt_distlist_tv_edit
integer x = 3319
integer y = 2124
end type

type cb_close from w_vzt_treeview_base`cb_close within w_vzt_distlist_tv_edit
integer taborder = 90
end type

type cb_delete1 from w_vzt_treeview_base`cb_delete1 within w_vzt_distlist_tv_edit
integer x = 1691
integer y = 1744
integer taborder = 150
boolean enabled = false
end type

type cb_save from w_vzt_treeview_base`cb_save within w_vzt_distlist_tv_edit
integer x = 1120
integer y = 1744
integer width = 192
integer taborder = 130
end type

type cb_select from w_vzt_treeview_base`cb_select within w_vzt_distlist_tv_edit
integer x = 2880
integer y = 2124
integer taborder = 120
end type

type cb_new from w_vzt_treeview_base`cb_new within w_vzt_distlist_tv_edit
boolean visible = false
integer x = 1403
integer y = 1744
integer width = 192
integer taborder = 140
boolean enabled = false
end type

type cb_newsearch from w_vzt_treeview_base`cb_newsearch within w_vzt_distlist_tv_edit
integer x = 2304
integer y = 2124
integer taborder = 110
end type

type cb_search from w_vzt_treeview_base`cb_search within w_vzt_distlist_tv_edit
integer x = 2651
integer y = 2124
integer taborder = 100
end type

type st_foundrecs from w_vzt_treeview_base`st_foundrecs within w_vzt_distlist_tv_edit
end type

type st_stop from w_vzt_treeview_base`st_stop within w_vzt_distlist_tv_edit
end type

type dw_data from w_vzt_treeview_base`dw_data within w_vzt_distlist_tv_edit
integer taborder = 60
end type

type dw_print from w_vzt_treeview_base`dw_print within w_vzt_distlist_tv_edit
integer taborder = 160
end type

type uo_ddcal from w_vzt_treeview_base`uo_ddcal within w_vzt_distlist_tv_edit
end type

type dw_detail from w_vzt_treeview_base`dw_detail within w_vzt_distlist_tv_edit
boolean visible = false
integer x = 1669
integer y = 1620
integer width = 1426
integer height = 140
integer taborder = 70
end type

type tv_1 from w_vzt_treeview_base`tv_1 within w_vzt_distlist_tv_edit
integer y = 12
integer height = 1584
integer taborder = 50
end type

event tv_1::selectionchanged;call super::selectionchanged;// if type = Q (qset) then retrieve detail info
end event

event tv_1::ue_processitem;call super::ue_processitem;//MessageBox( 'test', string( itvi_current.data)  + ':'+ string(itvi_current.level) ) 

If 		itvi_current.level = 1 then 	// Top level 
//------------------------------------------------------------	
//------------------------------------------------------------	
ElseIf 	itvi_current.level >= 2 then  	
		cb_new.visible 		= true 
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		tab_1.tabpage_1.dw_contact_list.Retrieve( )
		tab_1.tabpage_2.dw_selected.Retrieve( is_itemid)

		tab_1.SelectTab ( 1 )			
		
//		 cb_ins.visible			= true
//		 cb_del.visible			= true
//	END IF 

	if is_leafind = 'Y' then // address level 
		if il_current_item_row > 0 then 
			il_addressid = long( ids_source.object.reportid [ il_current_item_row ] )
////			messagebox('qq', string( il_addressid )) 
//			dw_question.Retrieve( il_addressid ) 
//			long ll_ansrow
//			cb_delete1.visible 	= true 
//			cb_save.visible 		= true 
//			cb_save.enabled 		= true 
//			ll_ansrow = dw_answers.Retrieve( il_addressid )
//			dw_answers.visible 	= true 	
		END IF 
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
//	ls_dragqset = parent.of_getparentidbynode ( il_dragsource, 'QSET')
//	ls_dropqset = parent.of_getparentidbynode ( il_droptarget, 'QSET')
//	If ls_dragqset <> ls_dropqset then 
//		MessageBox('Distribution List Edit Error', 'You can only move items within the same list!', StopSign!)
//		Return 
//	END IF 
	ls_dropleaf = ids_source.object.leafind [il_droprow ] 
	ls_dragleaf	= ids_source.object.leafind [il_dragrow ] 
	If itvi_Current.Level > 1 then //and ls_dragleaf	= 'Y' Then 		// 1. Moving one item 
		If ls_dropleaf = 'Y' then
			// insert sibling, refresh parent.
			ltvi_Parent = itvi_dropparent
			ls_hierparentid = is_DropParentId
		ELSE
			// dropping on a folder - it is the parent. Insert child.
			ls_hierparentid = is_dropid
			ltvi_Parent = itvi_droptarget
		END IF 
		If is_DragId = ls_hierparentid then 
        MessageBox('Drop Error', 'Cannot drop item on itself!', stopsign!)
        return 
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
	
	If ldw_source.dataobject <> 'd_emailids_available' then return 
	long 		ll_source_row, ll_row, ll_sort
	double	ld_questionid
	string 	ls_practiceid, ls_locationid, ls_request = 'ADD', ls_hid, ls_qtext, ls_qid
			
	// insert row and populate it from object list 
	ll_source_row = ldw_source.GetSelectedRow( 0) 
	ll_sort = dw_selectedq.RowCount() + 1
	DO WHILE ll_source_row > 0 
		ld_questionid 	= ldw_source.GetItemNumber ( ll_source_row , 'id') 
		ls_qid			= string ( ld_questionid 	)
		ls_qtext			= '<'+ trim(ldw_source.GetItemString ( ll_source_row , 'firstname')) +', ' &
								+ trim(ldw_source.GetItemString ( ll_source_row , 'lastname')) +'>' &
								+ trim(ldw_source.GetItemString ( ll_source_row , 'address')) 
		ls_expr 			= " id = " + string(ld_questionid ) 

		dw_selectedq.Retrieve( ls_new_parent_id )
		If dw_selectedq.Find( ls_expr , 0, dw_selectedq.RowCount() ) = 0 then // assign only if not exist already 
		
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
		         :is_treetype,   
	         	'Y',   
	         	:ls_qid,   
	         	'',
					0,
					0,
					'CONTACT'
					) ;  
				If sqlca.SQLCode <> 0 Then        
		        ls_error =  sqlca.SQLerrtext
		        ls_code =  string( sqlca.SQLCode) 
		        ROLLBACK; 
		        MessageBox('Database Error', 'Failed to insert item into VZT_HIERARCHY.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
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
	dw_selectedq.Retrieve( ls_new_parent_id ) 
//	dw_availableq.Retrieve( id_qsetid) 
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

End If
If handle <> il_DragParent Then
	SetDropHighlight(handle)
	il_DropTarget = handle
Else
	SetDropHighlight(0)
	il_DropTarget = 0
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
ll_leaf_id = double( ids_source.object.reportid[ ll_ds_row ] )

//If ids_source.object.leafind[ ll_ds_row ] = 'Y' then 
//ElseIf ll_leaf_id > 0 then // qset level 
//End If

// DELEte HIER record // done in trigger
DELETE FROM VZT_HIERARCHY WHERE ID = :ls_id AND TREETYPE = :is_treetype ;

if sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to delete from VZT_HIERARCHY.'+&
		  '~r~nID:'+ls_id+ &  
		  '~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return -1
END IF

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

event tv_1::ue_item_delete;call super::ue_item_delete;tab_1.tabpage_2.dw_selected.Retrieve( is_hierid) 
//tab_1.tabpage_2.dw_available.Retrieve( id_qsetid)
this.event ue_processitem ( il_currentitem )
return 1
end event

event tv_1::beginlabeledit;
return 0
end event

event tv_1::endlabeledit;TreeViewItem		ltvi_edit
string 				ls_newtext, ls_hid,ls_error, ls_code
GetItem(handle, ltvi_edit)

ls_hid		= string(ltvi_edit.data)

UPDATE VZT_HIERARCHY SET name = :newtext WHERE id = :ls_hid;

If sqlca.SQLCode <> 0 Then        
       ls_error =  sqlca.SQLerrtext
       ls_code =  string( sqlca.SQLCode) 
       ROLLBACK;
       MessageBox('Database Error', 'Failed to insert question into VZT_HIERARCHY.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
       return 1
END IF

COMMIT;

this.event ue_processitem( handle )
tab_1.SelectTab( 5)
end event

type st_vertical from w_vzt_treeview_base`st_vertical within w_vzt_distlist_tv_edit
end type

type st_horizontal1 from w_vzt_treeview_base`st_horizontal1 within w_vzt_distlist_tv_edit
end type

type dw_hier_base from w_vzt_treeview_base`dw_hier_base within w_vzt_distlist_tv_edit
end type

type dw_font_base from w_vzt_treeview_base`dw_font_base within w_vzt_distlist_tv_edit
integer taborder = 40
end type

type tab_1 from tab within w_vzt_distlist_tv_edit
event ue_resize ( long newwidth,  long newheight )
integer x = 1426
integer y = 8
integer width = 2953
integer height = 1588
integer taborder = 80
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
tabpage_7 tabpage_7
end type

event ue_resize;//
//tab_1.tabpage_3.dw_survey.width 	= newwidth 	- 35 //(5 * tab_1.tabpage_3.dw_survey.x)
//tab_1.tabpage_3.dw_survey.height = newheight - 140 // (6 * tab_1.tabpage_3.dw_survey.y)

//tab_1.tabpage_4.tab_2.width 	= newwidth 	- 35  
//tab_1.tabpage_4.tab_2.height 	= newheight - 140  
end event

event selectionchanged;

//CHOOSE CASE newindex
//	CASE 3
//		if IsValid( inv_qgen) and id_qsetid > 0 then 
//			inv_qgen.event ue_create_qset( id_qsetid, tab_1.tabpage_3.dw_survey) 
//		End If
//END CHOOSE
//
end event

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_7)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2917
integer height = 1460
long backcolor = 79741120
string text = "Contact "
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditDataTabular!"
long picturemaskcolor = 553648127
cb_2 cb_2
cb_1 cb_1
cb_filter cb_filter
dw_contact_list dw_contact_list
dw_address dw_address
end type

on tabpage_1.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_filter=create cb_filter
this.dw_contact_list=create dw_contact_list
this.dw_address=create dw_address
this.Control[]={this.cb_2,&
this.cb_1,&
this.cb_filter,&
this.dw_contact_list,&
this.dw_address}
end on

on tabpage_1.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_filter)
destroy(this.dw_contact_list)
destroy(this.dw_address)
end on

type cb_2 from commandbutton within tabpage_1
integer x = 997
integer y = 1360
integer width = 471
integer height = 68
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Reset Filter"
end type

event clicked;string ls_filter
//dw_avail.Filter()
ls_filter =''
dw_contact_list.SetFilter( ls_filter )
dw_contact_list.Filter() 

end event

type cb_1 from commandbutton within tabpage_1
integer x = 503
integer y = 1360
integer width = 471
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Staff Only"
end type

event clicked;string ls_filter
//dw_avail.Filter()
ls_filter = "contacttype = 'STAFF'" 
dw_contact_list.SetFilter( ls_filter )
dw_contact_list.Filter() 

end event

type cb_filter from commandbutton within tabpage_1
integer x = 14
integer y = 1360
integer width = 471
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Filter Contacts"
end type

event clicked;string ls_filter
//dw_avail.Filter()
setNull (ls_filter) 
dw_contact_list.SetFilter( ls_filter )
dw_contact_list.Filter() 

end event

type dw_contact_list from uo_vzt_dwbase within tabpage_1
integer x = 9
integer y = 16
integer width = 2752
integer height = 532
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_contact_list"
boolean vscrollbar = true
boolean hsplitscroll = false
boolean livescroll = false
end type

event constructor;call super::constructor;this.ib_poweredit = true 
_SetNullonNewSearch 			= true
_ResetMaskOnSearch 			= false
_ResetDataObjectOnSelect 	= false
//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

//is_editable[]	={'sortorder', 'descr', 'y_start','y_before_q', 'active', 'showqnum' ,& 
//			'y_q_to_a','x_start_q','x_start_a' }
_selection_service = 'S'  // 'S' single, 'M' - multi
is_searchable[]	=  is_editable[]

dw_primary = this 
wf_setupdateable( dw_primary, 'Questionnaire Detail', true, true)

this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'firstname_t', 'firstname A', 'firstname D')
this.inv_field_sort.of_setcolumn( 'lastname_t', 'lastname A, firstname A', 'lastname D, firstname D')
this.inv_field_sort.of_setcolumn( 'contacttype_t', 'contacttype A, lastname A, firstname A', 'contacttype D, firstname A, lastname A')
this.setsort( 'contacttype A, lastname A, firstname A')



end event

event ue_refresh_identity;long ll_row
If this.GetRow() <= 0 then return  

//if f_nvl(this.GetitemNumber( this.GetRow(), 'id'),0) = 0 then 
//	
//	SELECT max(qsetid) into :id_qsetid from qgen_qset ;
//	//MessageBox('qid',string(id_questionid))
//	this.setitem( this.GetRow(), 'qsetid', id_qsetid)
//	
//END IF
end event

event ue_rowselected;if row <= 0 or not ab_selected then return 1
if this.rowcount() < row then return -1
long ll_contact_id
ll_contact_id = this.object.id [row]
dw_address.Retrieve( ll_contact_id )

return 1
end event

type dw_address from uo_vzt_dwbase within tabpage_1
integer x = 9
integer y = 564
integer width = 2752
integer height = 768
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_emailids_available"
boolean hsplitscroll = false
end type

event constructor;call super::constructor;_dragable 					= true
_drop_available_DW 		= true // available options
_selection_service 		= 'S'
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2917
integer height = 1460
long backcolor = 79741120
string text = "Selected Email IDs"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom025!"
long picturemaskcolor = 553648127
dw_selected dw_selected
end type

on tabpage_2.create
this.dw_selected=create dw_selected
this.Control[]={this.dw_selected}
end on

on tabpage_2.destroy
destroy(this.dw_selected)
end on

type dw_selected from uo_vzt_dwbase within tabpage_2
integer y = 12
integer width = 1746
integer height = 1020
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_address_selected"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event constructor;call super::constructor;//_dragable 						= true
_dropable 						= false
//_drop_available_DW 			= true // available options
_selection_service = 'M'  
end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2917
integer height = 1460
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
integer x = 270
integer y = 468
integer width = 1349
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
integer y = 68
integer width = 1714
integer height = 412
integer taborder = 20
boolean bringtotop = true
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

