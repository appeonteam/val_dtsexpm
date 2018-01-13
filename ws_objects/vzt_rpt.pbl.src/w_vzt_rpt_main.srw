$PBExportHeader$w_vzt_rpt_main.srw
forward
global type w_vzt_rpt_main from w_vzt_treeview_base
end type
type mdi_1 from mdiclient within w_vzt_rpt_main
end type
type gb_1 from groupbox within w_vzt_rpt_main
end type
end forward

global type w_vzt_rpt_main from w_vzt_treeview_base
int Width=2790
int Height=2154
WindowType WindowType=mdihelp!
boolean TitleBar=true
string Title="Reporter"
string MenuName="m_vzt_reporter_main"
ToolBarAlignment ToolBarAlignment=AlignAtTop!
WindowState WindowState=maximized!
mdi_1 mdi_1
gb_1 gb_1
end type
global w_vzt_rpt_main w_vzt_rpt_main

type variables
string original_title, ls_filter, is_leaf
str_reporter_reportparms  istr_parms

end variables

on w_vzt_rpt_main.create
int iCurrent
call super::create
if this.MenuName = "m_vzt_reporter_main" then this.MenuID = create m_vzt_reporter_main
this.mdi_1=create mdi_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_vzt_rpt_main.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.gb_1)
end on

event ue_menu_delete_check_rights;call super::ue_menu_delete_check_rights;if trim(is_parentname) <> trim(gnv_appman.is_userid) then return -1
end event

type cb_close from w_vzt_treeview_base`cb_close within w_vzt_rpt_main
boolean Visible=false
end type

type cb_save from w_vzt_treeview_base`cb_save within w_vzt_rpt_main
boolean Visible=false
end type

type cb_new from w_vzt_treeview_base`cb_new within w_vzt_rpt_main
boolean Visible=false
end type

type st_foundrecs from w_vzt_treeview_base`st_foundrecs within w_vzt_rpt_main
boolean BringToTop=true
end type

type st_stop from w_vzt_treeview_base`st_stop within w_vzt_rpt_main
boolean BringToTop=true
end type

type dw_print from w_vzt_treeview_base`dw_print within w_vzt_rpt_main
boolean BringToTop=true
end type

type dw_detail from w_vzt_treeview_base`dw_detail within w_vzt_rpt_main
int X=1317
int Y=138
int Width=1375
int Height=1811
int TabOrder=40
end type

type tv_1 from w_vzt_treeview_base`tv_1 within w_vzt_rpt_main
int X=15
int Y=138
int Width=1295
int Height=1811
end type

event tv_1::doubleclicked;TreeViewItem ltvi_current
String  ls_parm, ls_id ,ls_leaf
long ll_found, ll_tvi, li_ctr
 
//get handle of the currently selected item
// and pass it to GetItem
ll_tvi = This.FindItem(CurrentTreeItem!, 0)
window lw_repdef

This.GetItem(ll_tvi, ltvi_current)
SetPointer(HourGlass!)

ids_source.SetFilter("")
ids_source.Filter()

ls_id =Trim(String(ltvi_current.Data))
istr_parms.report_id 	= ls_id 
istr_parms.mode 			= ''
istr_parms.schedule_id 	= ''

ll_found = ids_source.Find("id = '" + ls_id + "'", 1, ids_source.RowCount())

If ll_found > 0 then
   ls_leaf = Trim(ids_source.GetItemString(ll_found,"leafind"))
   If ls_leaf = 'Y' then OpenWithParm(lw_repdef, istr_parms, "w_vzt_rpt_submitter", parent)
else
  Messagebox("DataStore problem","Can't find hierarchy id:" + ls_id  )
End If


end event

event tv_1::constructor;call super::constructor;//Menu4 NewMenu
//NewMenu = CREATE Menu4

end event

event tv_1::clicked;//Long   ll_found,ll_parent_found,ll_folder_found
//TreeViewItem		ltvi_Source
//GetItem(handle, ltvi_Source)
//
//ids_source.SetFilter("")
//ids_source.Filter()
//
//is_itemid=Trim(String(ltvi_Source.Data))
//
//ll_found = ids_source.Find("id = '" + is_id + "'", 1, ids_source.RowCount())
//
//If ll_found > 0 then
//   is_name 		= Trim(ids_source.GetItemString(ll_found,"name"))
//   is_parentid = Trim(ids_source.GetItemString(ll_found,"parent_id"))
//	is_rptid 	= Trim(ids_source.GetItemString(ll_found,"reportid"))
//Else
//	return
//end if
//ll_parent_found = ids_source.Find("id = '" + is_parentid + "'", 1, ids_source.RowCount())
//If ll_parent_found > 0 then
//   is_parentname 	= Trim(ids_source.GetItemString(ll_parent_found,"name"))
//	is_folderid 	= Trim(ids_source.GetItemString(ll_parent_found,"parent_id"))
//Else
//	return
//end if	
//
//
//
//
end event

event tv_1::key;If Keydown(KeyDelete!) then
	m_vzt_reporter_main.m_file.m_delete.TriggerEvent(Clicked!)
end if 
end event

event tv_1::selectionchanged;call super::selectionchanged;//Long   ll_found,ll_parent_found,ll_folder_found
//TreeViewItem		ltvi_Source
//GetItem(newhandle, ltvi_Source)
//
//ids_source.SetFilter("")
//ids_source.Filter()
//
//
//is_id=Trim(String(ltvi_Source.Data))
//
//ll_found = ids_source.Find("id = '" + is_id + "'", 1, ids_source.RowCount())
////Messagebox("ll_found ", string(ll_found))
//If ll_found > 0 then
//   is_name = Trim(ids_source.GetItemString(ll_found,"name"))
//   is_parentid = Trim(ids_source.GetItemString(ll_found,"parent_id"))
//	is_rptid = Trim(ids_source.GetItemString(ll_found,"reportid"))
//
//Else
//	return
//end if
//ll_parent_found = ids_source.Find("id = '" + is_parentid + "'", 1, ids_source.RowCount())
//If ll_parent_found > 0 then
//   is_parentname = Trim(ids_source.GetItemString(ll_parent_found,"name"))
//	is_folderid = Trim(ids_source.GetItemString(ll_parent_found,"parent_id"))
//Else
//	return
//end if	
//
//
//
//
end event

event tv_1::dragdrop;Integer				li_Pending,max_order, li_Rows,ai_level 
Long					ll_NewItem, rtn, ll_rc 
String  				max_id,	ls_sourceid, ls_targetid, ls_filter1 , ls_expr , ls_source_rpt_id ,ls_leaf
TreeViewItem		ltvi_Target, ltvi_Source, ltvi_Parent, ltvi_New

If GetItem(il_DropTarget, ltvi_Target) = -1 Then Return
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return

ls_sourceid = Trim(String(ltvi_Source.Data))
ls_targetid = Trim(String(ltvi_Target.Data))

if trim(ltvi_Target.label) <> trim(gnv_appman.is_userid) then return

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
						ltvi_Source.Label + "' from " + ltvi_Parent.label + &
						"?", Question!, YesNo!) = 2 Then Return
	string ls_hid
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

// Add the item(s) to the TreeView
ids_Source.Retrieve(is_treetype)
ls_filter1 = "id = '" + max_id +"'"
ids_Source.SetFilter(ls_filter1)
ids_Source.Filter()
li_Rows = ids_Source.RowCount()
this.event ue_add_items( ltvi_Target.itemhandle, ltvi_Target.level + 1 , li_Rows ) // pass 1 as the level to build

end event

event tv_1::ue_add_items;// overr
//add the items to the TreeView using the data in the DataStore

Integer				li_source_row
TreeViewItem		ltvi_New, ltvi_parent 
boolean 				lb_doit 
long  				ll_newitem
string 				ls_label
// Add each item to the TreeView
For li_source_row = 1 To ai_Rows
	// check user access to reports 
	lb_doit = true 
	If ids_source.object.leafind [li_source_row] = 'Y' then // or ids_source.object.leafind [li_cnt] = 'G'
//		lb_doit = false 
//		If gnv_appman.inv_security.uf_user_has_rights ( "REPORT", ids_source.object.reportid [li_cnt], false ) <> '' then lb_doit = true 
		lb_doit = true // for now  
	Else 
		//------------------------------------------------
		// check for personal folder access here:
		//------------------------------------------------
		tv_1.GetItem(al_Parent, ltvi_parent ) 
		If trim(Upper(ltvi_parent.label )) = "PERSONAL FOLDERS" then 
			IF POS( is_accessflags, "A") <= 0 then // if not Admin rights  Check if own folder 
				If trim( ids_source.object.name[li_source_row]) <> trim( gnv_appman.is_userid) then lb_doit = false 
			END IF
		END IF
	End If
	
	If lb_doit then 
		// Call a function to set the values of the TreeView item from 
		// the DataStore data
		of_set_item(ai_Level, li_source_row, ltvi_New)
		
		ls_label = upper(trim(ids_source.object.name [li_source_row] )) 
		If ls_label = "PERSONAL FOLDERS" then 
			ltvi_New.PictureIndex 			= 6 // person 
			ltvi_New.SelectedPictureIndex = 6
			ll_newitem = tv_1.InsertItemLast(al_Parent, ltvi_New) 
			tv_1.POST ExpandItem( ll_newitem )
		Elseif ls_label = gnv_appman.is_userid then 
			ll_newitem = tv_1.InsertItemFirst(al_Parent, ltvi_New) 			
			tv_1.POST ExpandItem( ll_newitem )
		Else 
			this.event ue_set_picture_on_insert( li_source_row, ltvi_New ) 
			ll_newitem = tv_1.InsertItemLast(al_Parent, ltvi_New) 
		End If
		// Add the item after the last child
		If ll_newitem < 1 Then
			// Error
			MessageBox("Error", "Error inserting item", Exclamation!)
			Return -1
		End If
	End If
Next

Return ai_Rows
end event

type st_vertical from w_vzt_treeview_base`st_vertical within w_vzt_rpt_main
int Y=314
int Height=1530
end type

type st_horizontal1 from w_vzt_treeview_base`st_horizontal1 within w_vzt_rpt_main
int X=1302
int Y=157
int Width=1390
int Height=45
end type

type dw_hier_base from w_vzt_treeview_base`dw_hier_base within w_vzt_rpt_main
boolean BringToTop=true
end type

type dw_font_base from w_vzt_treeview_base`dw_font_base within w_vzt_rpt_main
boolean BringToTop=true
end type

type mdi_1 from mdiclient within w_vzt_rpt_main
long BackColor=276856960
end type

type gb_1 from groupbox within w_vzt_rpt_main
int Y=74
int Width=5555
int Height=45
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

