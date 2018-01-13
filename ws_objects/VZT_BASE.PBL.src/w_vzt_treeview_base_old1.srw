$PBExportHeader$w_vzt_treeview_base_old1.srw
forward
global type w_vzt_treeview_base_old1 from w_vzt_base
end type
type dw_detail from uo_vzt_dwbase within w_vzt_treeview_base_old1
end type
type tv_1 from treeview within w_vzt_treeview_base_old1
end type
type st_vertical from statictext within w_vzt_treeview_base_old1
end type
type st_horizontal1 from statictext within w_vzt_treeview_base_old1
end type
type dw_hier_base from uo_vzt_dwbase within w_vzt_treeview_base_old1
end type
type dw_font_base from uo_vzt_dwbase within w_vzt_treeview_base_old1
end type
type str_empxfers from structure within w_vzt_treeview_base_old1
end type
end forward

type str_empxfers from structure
	integer		i_reportid
	integer		i_newfolder
end type

global type w_vzt_treeview_base_old1 from w_vzt_base
integer x = 146
integer y = 4
integer width = 3479
integer height = 1932
string title = "Base Treeview"
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
event ue_populate ( )
event ue_postopen ( )
event ue_preopen ( )
event ue_save ( )
event ue_menu_delete ( )
event type integer ue_menu_delete_check_rights ( )
event pfc_messagerouter1 ( string as_event )
event type string ue_get_new_hid ( )
event ue_item_insert_child ( )
event ue_item_delete ( )
event ue_item_moveup ( )
event ue_item_movedown ( )
event ue_create_popup ( )
event ue_item_insert_sibling_after ( )
event ue_item_rename ( )
dw_detail dw_detail
tv_1 tv_1
st_vertical st_vertical
st_horizontal1 st_horizontal1
dw_hier_base dw_hier_base
dw_font_base dw_font_base
end type
global w_vzt_treeview_base_old1 w_vzt_treeview_base_old1

type prototypes

end prototypes

type variables
m_vzt_tv_popup     im_popup
any		io_dropsourcetype
TreeViewItem	itvi_Current, itvi_Parent, itvi_dragSource
TreeViewItem	itvi_DropTarget, itvi_DropParent
TreeViewItem	itvi_DragParent 
string		is_itemid, is_parentid, is_leafind
string 		is_rptid, is_parentname, is_folderid
long		il_current_item_row, il_parent_item_row
string		is_detail_do = 'd_vzt_report_desc'
integer		ii_horizpct=40
DataStore	ids_Source
Boolean		ib_Changed, ib_Retrieve
Long		il_ChangedItem, il_CurrentItem
DataWindow           idw_data
string 		is_dataobject='d_vzt_treeview_source'
string  		is_treetype='REPORT', is_name
string 		is_drag_source_hier_id , is_dragid, is_dragparentid
string  		il_oldheight_accessflags
// The following are used for the resizing service
boolean		ib_debug=False	//Debug mode
long		il_hiddencolor=0	//Bar hidden color to match the window background
long		il_OldHeight	//Save the height of the window
long		il_Oldwidth 	//Save the width of the window
string	            is_dropid, is_dropparentid
long                         il_droptarget, il_dropparent, il_droprow, il_dropparentrow
long                         il_dragsource, il_dragrow
long                         il_dragparent
integer		ii_barthickness=11	//Bar Thickness
integer		ii_windowborder = 85//15//Window border to be used on all sides
dragobject	idrg_Vertical	//Reference to the vertical control on the left of the window
dragobject	idrg_Horizontal	//Reference to the horizontal control on the right of the window
statictext	ist_Horizontal //Reference to the horizontal bar
string		is_top_id
double		id_present_id 
//tab	t_maintab
end variables

forward prototypes
public function boolean of_checkparent (long al_item, long al_parent)
public function integer of_savequery ()
public function integer wf_resizepanels ()
public function integer wf_refreshbars ()
public function integer wf_resizebars ()
public subroutine of_set_item (integer ai_level, integer ai_row, ref treeviewitem atvi_new)
public function boolean of_display_item (long al_handle, ref string as_parm)
public function long wf_get_ds_row (string as_id)
public function integer of_add_children (long al_parenthandle, integer al_handleafter)
public function integer of_refresh_children (long al_parent)
public function string of_getparentidbynode (long al_handle, string as_node)
end prototypes

event ue_populate;Integer li_Rows, li_level
String ls_filter
Long ll_lev, ll_top

SetPointer(HourGlass!)

//Build the first level
//Populate tree with elements where parent_id='00'
ls_filter = "parent_id = '00' "
ll_top = ids_Source.Find (ls_filter , 1, ids_Source.RowCOunt() )
if ll_top <= 0 then 
	MessageBox("ERROR", "Could not find top of the hierarchy.", StopSign! )
	return
End If 

is_top_id = string( ids_Source.object.id [ll_top ] )
ids_Source.object.hier_level [ll_top ] = 0 
ls_filter = "id = '" + is_top_id +"'"
ids_Source.SetFilter(ls_filter)
ids_Source.Filter()
li_Rows = ids_Source.RowCount()

// Add the items to the TreeView
tv_1.event ue_add_items(0, 1, li_Rows)// pass 1 as the level to build

//Expand top-most level

tv_1.ExpandItem(1)
end event

event ue_postopen;SetPointer(HourGlass!)
ids_Source.Retrieve(is_treetype) 

Post Event ue_populate()
 
idw_Data = dw_detail
dw_detail.DataObject = is_detail_do // 'd_vzt_report_desc'
dw_detail.SetTransObject(SQLCA)
dw_detail.Retrieve( is_top_id )

end event

event ue_preopen;ids_Source.DataObject = is_dataobject 

// The following lines are for setting up the resizing service
il_OldHeight 		= This.WorkspaceHeight()
//idrg_Vertical 	= idw_Data
idrg_Vertical 		= tv_1 
idrg_Horizontal	= idw_Data
ist_Horizontal 	= st_horizontal1

end event

event ue_save;Integer	li_Cnt
If  ib_Changed Then idw_Data.Update()
tv_1.Post Event ue_clearupdateditems()

end event

event ue_menu_delete;Int   ll_tvi,ll_found
long	ll_rc

TreeViewItem		ltvi_Target, ltvi_Source, ltvi_Parent

if this.event ue_menu_delete_check_rights() < 0 then return

IF messagebox("Confirm Deletion","Are you sure you want to delete '" + &
						is_name + "' from folder " + is_parentname + &
						"?", Question!, YesNo!) = 2 Then Return
	 DELETE FROM VZT_HIERARCHY  
	 WHERE id = :is_itemid
	 ;
If SQLCA.SQLCode < 0 then ll_rc = -10 
f_end_tran( SQLCA, ll_rc, "Delete from HIERARCHY", "Delete from HIERARCHY successful.", "Delete from HIERARCHY failed.")

//refresh datastore
ids_source.Retrieve( is_treetype) 

// Delete from the treeview:
//ids_Source.SetFilter('id = "'+is_itemid)
//ids_Source.Filter()

ll_tvi = tv_1.FindItem(CurrentTreeItem!, 0)
tv_1.DeleteItem(ll_tvi)

end event

event ue_menu_delete_check_rights;return 1
end event

event pfc_messagerouter1;CHOOSE CASE as_event
	CASE 'pfc_new' 
//		this.event menu_new()
	CASE 'pfc_del' 
		this.event ue_menu_delete()
	CASE 'pfc_open' 
//		this.event menu_open()		
	CASE 'pfc_close' 
//		this.event menu_exit()				
	CASE 'pfc_save' 
//		this.event menu_save()				
	CASE 'pfc_saveas' 		
//		this.event menu_saveAs()
	CASE 'pfc_print' 
//		this.event menu_print()				
	CASE 'pfc_print_all' 
//		this.event menu_print_all()				
	CASE 'pfc_printpreview' 
//		this.event menu_print_preview()	

	CASE 'pfc_pagesetup' 
		PrintSetup ( )
	CASE 'pfc_printimmediate' 		
	CASE 'pfc_undo' 		
	CASE 'pfc_cut' 		
	CASE 'pfc_paste' 		
	CASE 'pfc_copy'
	CASE 'pfc_clear'
	CASE 'pfc_finddlg' 		// new search ??
	CASE ELSE

END CHOOSE



end event

event ue_get_new_hid;string ls_hid,  ls_error, ls_code

/// get a lock 
     UPDATE "vzt_hierarchy"
      SET 	treetype = treetype ;

If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to create new id.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return ''
END IF

SELECT MAX(ID) INTO :ls_hid
FROM "vzt_hierarchy" ;

If sqlca.SQLCode <> 0 Then       // Database ERROR...lost connection...who knows?
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to select new id.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return ''
END IF

ls_hid = STRING( LONG ( ls_hid ) + 1 )

return ls_hid 


end event

event ue_item_insert_child;tv_1.event ue_item_insert (il_currentitem * (-1) )
end event

event ue_item_delete;tv_1.event ue_item_delete (0) 

end event

event ue_item_moveup;tv_1.event ue_item_moveup(0)
end event

event ue_item_movedown;tv_1.event ue_item_movedown(0)
end event

event ue_create_popup;im_popup = CREATE m_vzt_tv_popup
end event

event ue_item_insert_sibling_after;tv_1.event ue_item_insert (il_currentitem)
end event

event ue_item_rename;tv_1.Editlabel( il_currentitem )
end event

public function boolean of_checkparent (long al_item, long al_parent);//	Determine whether one item is a parent of another

Do
	al_Item = tv_1.FindItem(ParentTreeItem!, al_Item)
	If al_Item = al_Parent Then Return True
Loop Until al_Item <= 0

Return False

end function

public function integer of_savequery ();Integer	li_Ret

li_Ret = MessageBox("Warning", "If you select another item in the TreeView, you changes " + &
								"will be lost.  Do you wish to save now?", Question!, YesNoCancel!)

If li_Ret = 3 Then
	Return 1
Else
	If li_Ret = 1 Then
		//Trigger Event ue_save()
	Else
		tv_1.Trigger Event ue_clearupdateditems()
	End If
	
	Return 0
End If



end function

public function integer wf_resizepanels ();//Resize the panels according to the Lines, 
//BarThickness, and WindowBorder.

Integer	li_Cnt, li_X, li_Y, li_HHeight, li_HWidth
Long		ll_Width, ll_Height

ll_Width = this.WorkSpaceWidth()
ll_Height = this.WorkspaceHeight()+5

If ll_Width < idrg_Vertical.X +150 Then
	ll_Width = idrg_Vertical.X +150
End If

If ll_Height < idrg_Vertical.Y +150  Then
	ll_Height = Idrg_Vertical.Y +150
End If

// Left vertical object processing
//idrg_Vertical.Move (ii_WindowBorder, ii_WindowBorder)
idrg_Vertical.Resize (st_vertical.X - idrg_Vertical.X, ll_Height - idrg_Vertical.Y - ii_WindowBorder)
idrg_Vertical.event dynamic ue_resize( li_HWidth, li_HHeight )


// Horizontal object processing

li_X = st_vertical.X + ii_BarThickness 
//li_Y = ist_Horizontal.Y + ii_BarThickness
idrg_Horizontal.Move (li_X, ist_Horizontal.Y )
	

li_HWidth = ll_Width - li_X  // ist_Horizontal.Width
//li_HHeight = ll_Height - (ist_Horizontal.Y + (2 * ii_BarThickness)) - ii_WindowBorder
li_HHeight = idrg_Vertical.height
idrg_Horizontal.Resize (li_HWidth, li_HHeight)
idrg_Horizontal.event dynamic ue_resize( li_HWidth, li_HHeight )

Return 1

end function

public function integer wf_refreshbars ();//Force appropriate order
st_vertical.SetPosition(ToTop!)

//Make sure the Width is not lost
st_vertical.Width = ii_BarThickness


ist_Horizontal.SetPosition(ToTop!)
ist_Horizontal.Height = ii_BarThickness


Return 1

end function

public function integer wf_resizebars ();//Resize Bars according to Bars themselves, WindowBorder, and BarThickness.

Integer	li_HX, li_HW, li_Cnt

st_vertical.Move(st_vertical.X, 0) // ii_WindowBorder)
st_vertical.Resize(ii_barthickness, This.WorkSpaceHeight() -  ii_WindowBorder)

li_HX = st_vertical.X + ii_BarThickness
li_HW = This.WorkSpaceWidth() - li_HX - ii_WindowBorder

ist_Horizontal.Move(li_HX, ist_Horizontal.Y)
ist_Horizontal.Resize(li_HW, ii_BarThickness)



wf_RefreshBars()

Return 1

end function

public subroutine of_set_item (integer ai_level, integer ai_row, ref treeviewitem atvi_new);// Set the Lable and Data attributes for the new item from the data in the DataStore

Integer	li_Picture
long     ll_childrow

atvi_New.Label = ids_Source.Object.name[ai_Row]
atvi_New.Data 	= ids_Source.Object.id[ai_Row]

ll_childrow = ids_Source.Find( "parent_id = '"+ atvi_New.Data + "'", 1, ids_Source.RowCount() )

IF ai_level <= 4 or ll_childrow > 0  Then 
	atvi_New.Children 		= True
	//if ll_childrow <= 0 then atvi_New.Children = false
	atvi_New.PictureIndex 	= ai_level

	if ai_Level = 2  Then
   atvi_New.SelectedPictureIndex = tv_1.AddPicture("Custom050!")
   else
		atvi_New.SelectedPictureIndex = ai_level
	end if
Else
	atvi_New.Children = False
	li_Picture = tv_1.AddPicture("ScriptYes!")
	atvi_New.PictureIndex = li_Picture
	atvi_New.SelectedPictureIndex = ai_level
End If




//tv_1.AddPicture("Custom050!")

end subroutine

public function boolean of_display_item (long al_handle, ref string as_parm);// Function to display the data for the record selected in the 
// appropriate DataWindow.

Long					ll_Parent, ll_rc
String				ls_id  , ls_ParentParm
//TreeViewItem		ltvi_Current, ltvi_Parent
			
tv_1.GetItem(al_Handle, itvi_Current)

If ib_Retrieve Then
	If al_Handle = il_CurrentItem Then
		// This item is already displayed, True return code indicates
		// that the item was already set.
		as_Parm = trim(string(itvi_Current.Data))
		Return True
	End If

	If itvi_Current.Level > 1 Then
		// Get the retrieval argument from the Parent item
		ll_Parent = tv_1.FindItem(ParentTreeItem!, al_Handle)
		of_display_item( ll_Parent, ls_ParentParm)
		
		If itvi_Current.Level = 3 Then
			// The third level requires retrieval arguments from the 
			// two previous levels.
			ll_Parent = tv_1.FindItem(ParentTreeItem!, ll_Parent)
			tv_1.GetItem(ll_Parent, itvi_Parent)
		End If
	End If
End If
ls_id = String(itvi_Current.Data)
ll_rc = idw_data.Retrieve( ls_id  )
Return False
 
end function

public function long wf_get_ds_row (string as_id);long ll_ds_row
ids_source.SetFilter('1=1')
ids_source.Filter()
ll_ds_row = ids_source.Find ( "id = '"+as_id +"'", 1, ids_source.RowCount() )
If ll_ds_row <= 0 then 
	MessageBox('VZT Treeview Error', 'Hierarchy info record not found!~r~nID:'+as_id , StopSign!) 
	return -1
end if

return ll_ds_row
end function

public function integer of_add_children (long al_parenthandle, integer al_handleafter);Integer				li_source_row, li_level 
TreeViewItem		ltvi_New, ltvi_parent 
boolean 				lb_doit = true 
long  				ll_newitem, ll_maxrow
string 				ls_label

ll_maxrow = ids_source.RowCount() 
tv_1.GetItem(al_parenthandle, ltvi_parent ) 
li_level = ltvi_parent.level + 1
For li_source_row = 1 To ll_maxrow 
	// check user access to reports 
	
	If lb_doit then 
		of_set_item( li_level , li_source_row, ltvi_New)
		
		ls_label = upper(trim(ids_source.object.name [li_source_row] )) 
		tv_1.event ue_set_picture_on_insert( li_source_row, ltvi_New ) 
		
		If al_handleafter > 0 then
			ll_newitem = tv_1.InsertItem(al_parenthandle, al_handleafter, ltvi_New) 
		ELSE
			ll_newitem = tv_1.InsertItemLast(al_parenthandle, ltvi_New) 			
		END IF 
		If ll_newitem < 1 Then
			// Error
			MessageBox("Error", "Error inserting item", Exclamation!)
			Return -1
		End If
	End If
Next

Return ll_newitem 
end function

public function integer of_refresh_children (long al_parent);string ls_data [], ls_parentid, ls_filter , ls_label
treeviewitem		ltvi_child, ltvi_parent, ltvi_New
long ll_next_child, li_source_row, li_rows, li_level ,ll_newitem

tv_1.GetItem( al_parent , ltvi_parent)
ls_parentid = ltvi_parent.data
li_level		= ltvi_parent.level + 1

ll_next_child = tv_1.FindItem( ChildTreeItem!, al_parent)
DO While ll_next_child > 0 
  	tv_1.GetItem( ll_next_child , ltvi_child)
	ls_data [upperbound (ls_data[])+1] = ltvi_child.data
	tv_1.DeleteItem( ll_next_child )
	ll_next_child = tv_1.FindItem( ChildTreeItem!, al_parent)
LOOP 

// Now Add the item(s) to the TreeView
ids_Source.Retrieve(is_treetype)
ls_filter = "parent_id = '" + ls_parentid +"'"
ids_Source.SetFilter(ls_filter)
ids_Source.Filter()
ids_Source.SetSort('parent_id A, orderingroup A')
ids_Source.Sort()

li_Rows = ids_Source.RowCount()
FOR li_source_row = 1 to li_Rows 
	// insert items	
		of_set_item( li_level , li_source_row, ltvi_New)
//		ids_Source.SetItem( li_source_row, 'orderingroup', li_source_row )
		ls_label = upper(trim(ids_source.object.name [li_source_row] )) 
		tv_1.event ue_set_picture_on_insert( li_source_row, ltvi_New ) 
		ll_newitem = tv_1.InsertItemLast(al_parent, ltvi_New) 			
		If ll_newitem < 1 Then
			MessageBox("Error", "Error inserting item", Exclamation!)
			Return -1
		End If
NEXT 

ids_Source.SetFilter('1=1')
ids_Source.Filter()
ids_Source.SetSort('')
ids_Source.Sort()
return 1
end function

public function string of_getparentidbynode (long al_handle, string as_node);string ls_ret, ls_id, ls_node
long		ll_handle, ll_dsrow 
treeviewitem ltvi_temp
ls_ret = ''
ll_handle = al_handle

tv_1.GetItem(ll_handle , ltvi_temp)
DO WHILE ltvi_temp.level >= 1 
	ls_id = Trim(String(ltvi_temp.Data))
	ll_dsrow = wf_get_ds_row( ls_id  )
	If ll_dsrow > 0 then 
		ls_node 	= trim(string(ids_source.object.nodetype [ll_dsrow]))
		ls_ret	= trim(string(ids_source.object.id [ll_dsrow]))
	ELSE 
		exit
	END IF
	IF as_node = ls_node then EXIT
	ll_handle = tv_1.FindItem(ParentTreeItem!, ll_handle)
	if ll_handle <= 0 then exit
	tv_1.GetItem(ll_handle , ltvi_temp)
LOOP

return ls_ret
end function

on w_vzt_treeview_base_old1.create
int iCurrent
call super::create
this.dw_detail=create dw_detail
this.tv_1=create tv_1
this.st_vertical=create st_vertical
this.st_horizontal1=create st_horizontal1
this.dw_hier_base=create dw_hier_base
this.dw_font_base=create dw_font_base
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_detail
this.Control[iCurrent+2]=this.tv_1
this.Control[iCurrent+3]=this.st_vertical
this.Control[iCurrent+4]=this.st_horizontal1
this.Control[iCurrent+5]=this.dw_hier_base
this.Control[iCurrent+6]=this.dw_font_base
end on

on w_vzt_treeview_base_old1.destroy
call super::destroy
destroy(this.dw_detail)
destroy(this.tv_1)
destroy(this.st_vertical)
destroy(this.st_horizontal1)
destroy(this.dw_hier_base)
destroy(this.dw_font_base)
end on

event open;//IS_accessflags = gnv_appman.inv_security.uf_user_has_rights( this.classname(), true ) 
//if is_accessflags = '' THEN 	return

iw_mywindow = this
this.event ue_create_popup ()

ids_Source = Create DataStore
this.event ue_preopen()		// allow descendant initialization
ids_Source.SetTransObject(sqlca) 

ii_windowborder	= 2 * ii_resizeband_y + cb_close.height	

// Set the color of the bars to make them invisible
il_HiddenColor 				= This.BackColor
st_Vertical.BackColor 		= il_HiddenColor
ist_Horizontal.BackColor 	= il_HiddenColor

tv_1.x = 10
tv_1.y = 0

dw_font_base.visible = false
dw_hier_base.visible = false

//Resize Bars
wf_ResizeBars()
//Resize the panels
wf_ResizePanels()

this.SetMicroHelp( String(Today(), "mm/dd/yyyy  hh:mm"))
this.event ue_postopen()	//allow descendant mods

end event

event close;If IsValid(ids_Source) 	then Destroy ids_Source
If IsValid(im_popup) 	then Destroy im_popup

end event

event resize;Integer		li_Delta , li_Cnt

if sizetype <> 1 then 
	cb_new.y 		= newheight - ii_resizeband_y - cb_new.height
	cb_save.y 		= newheight - ii_resizeband_y - cb_save.height
	cb_close.y 		= newheight - ii_resizeband_y - cb_close.height		
	cb_delete1.y 	= newheight - ii_resizeband_y - cb_delete1.height		
End IF 


// Do not run the first time the window is opened.
If IsValid(idrg_Vertical) Then
	// Move the horizontal bars porportionally
	li_Delta = newheight - il_OldHeight
	il_OldHeight = newheight 
	
	li_Cnt = 0
	ist_Horizontal.Y = ist_Horizontal.Y + (li_Cnt*li_Delta)
//
	// Move the vertical bars porportionally
	li_Delta = newwidth - il_Oldwidth
	il_Oldwidth = newwidth 

	st_vertical.x = ( newwidth - st_vertical.width) * ii_horizpct / 100 
	wf_ResizeBars()
	wf_ResizePanels()
end if




end event

event key;if keydown(keyF1!) then messagebox("REPORT GENERATOR HELP","God helps them that help themselves")
end event

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_treeview_base_old1
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_treeview_base_old1
boolean visible = false
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_treeview_base_old1
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_vzt_treeview_base_old1
integer x = 750
integer y = 1744
integer taborder = 70
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_treeview_base_old1
integer taborder = 130
end type

type cb_save from w_vzt_base`cb_save within w_vzt_treeview_base_old1
integer x = 9
integer y = 1748
integer taborder = 110
end type

type cb_select from w_vzt_base`cb_select within w_vzt_treeview_base_old1
boolean visible = false
integer taborder = 100
end type

type cb_new from w_vzt_base`cb_new within w_vzt_treeview_base_old1
integer x = 251
integer y = 1748
integer taborder = 120
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_treeview_base_old1
boolean visible = false
integer taborder = 90
end type

type cb_search from w_vzt_base`cb_search within w_vzt_treeview_base_old1
boolean visible = false
integer y = 820
integer taborder = 80
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_treeview_base_old1
boolean visible = false
integer x = 480
integer y = 1748
end type

type st_stop from w_vzt_base`st_stop within w_vzt_treeview_base_old1
end type

type dw_data from w_vzt_base`dw_data within w_vzt_treeview_base_old1
boolean visible = false
integer x = 1458
integer y = 32
integer width = 1367
integer height = 300
integer taborder = 50
end type

type dw_print from w_vzt_base`dw_print within w_vzt_treeview_base_old1
integer taborder = 140
end type

type dw_detail from uo_vzt_dwbase within w_vzt_treeview_base_old1
integer x = 1426
integer y = 44
integer width = 1417
integer height = 1452
integer taborder = 60
string dataobject = "d_template"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type tv_1 from treeview within w_vzt_treeview_base_old1
event ue_clearupdateditems ( )
event ue_processitem ( long al_itemhandle )
event ue_set_current_data ( long handle )
event type integer ue_item_insert ( long al_handle )
event type integer ue_item_delete ( long al_handle )
event type integer ue_item_moveup ( long al_handle )
event type integer ue_item_movedown ( long al_handle )
event type integer ue_item_delete_check ( long al_handle )
event type integer ue_item_delete_children ( long al_parent )
event type integer ue_add_items ( long al_parent,  integer ai_level,  integer ai_rows )
event ue_set_picture_on_insert ( long al_source_row,  ref treeviewitem atvi_target )
event type string ue_add_items_row_access_check ( long al_row )
event type double ue_init_presentation ( string as_parentid,  string as_parenttable )
event type integer ue_item_insert_check ( long al_handle )
event type string ue_item_insert_desc ( string as_parentid )
event ue_endlabeledit ( )
integer x = 9
integer y = 44
integer width = 1399
integer height = 1632
integer taborder = 40
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean disabledragdrop = false
long picturemaskcolor = 12632256
string statepicturename[] = {"ScriptYes!","Custom066!","Custom072!","Custom076!"}
long statepicturemaskcolor = 553648127
end type

event ue_clearupdateditems;Long					ll_Empty
Integer				li_Cnt, li_Limit
TreeViewItem		ltvi_Item

// Clear the state pictures from all items

//li_Limit = UpperBound(il_ChangedItem)


GetItem(il_ChangedItem, ltvi_Item)
ltvi_Item.StatePictureIndex = 0
SetItem(il_ChangedItem, ltvi_Item)


il_ChangedItem = ll_Empty
ib_Changed = False


end event

event ue_processitem;Long					ll_Parent, ll_rc
String				ls_id  , ls_ParentParm
if Not IsValid( parent) then return 
if Not IsValid( ids_source) then return 
			
If al_itemhandle = il_CurrentItem Then 
//		as_Parm = trim(string(itvi_Current.Data))
//		Return  
Else
	il_CurrentItem = al_itemhandle
End If

 
// get and/or initialize presentation info  
If il_current_item_row > 0 and il_current_item_row <= ids_source.rowCount() then 
	id_present_id  = double(ids_source.object.present_id [ il_current_item_row ])
END IF

If is_itemid <> '' 	then 
	dw_hier_base.Retrieve ( is_itemid ) 
	If id_present_id  = 0 then 
		// init presentation
		id_present_id  = this.event ue_init_presentation ( is_itemid, 'VZT_HIERARCHY')
	END IF 
END IF 

If id_present_id > 0 then dw_font_base.Retrieve ( id_present_id )
end event

event ue_set_current_data;long ll_parent

ids_source.SetFilter('1=1')
ids_source.Filter()

GetItem(handle, itvi_Current)

il_currentitem = handle

is_itemid =Trim(String(itvi_Current.Data))

// Find item in the source ds
il_current_item_row = ids_source.Find ( "id = '"+is_itemid +"'", 1, ids_source.RowCount() )

If il_current_item_row <= 0 then 
	MessageBox('VZT Treeview Error', 'Source current data record not found!~r~nID:'+is_itemid , StopSign!) 
	return
end if

is_leafind 	= ids_source.object.leafind [il_current_item_row] 
is_name 		= Trim(ids_source.GetItemString(il_current_item_row,"name"))
is_parentid = Trim(ids_source.GetItemString(il_current_item_row,"parent_id"))
is_rptid 	= Trim(ids_source.GetItemString(il_current_item_row,"reportid"))


If itvi_Current.Level > 1 Then
	// Get the retrieval argument from the Parent item
	ll_Parent = tv_1.FindItem(ParentTreeItem!, handle)
	tv_1.GetItem(ll_Parent, itvi_Parent)
	// Find item in the source ds
	is_parentid = f_nvl(trim(string(itvi_Parent.Data)),'')
	il_parent_item_row = ids_source.Find ( "id = '"+is_parentid +"'", 1, ids_source.RowCount() )
	If il_parent_item_row <= 0 then 
		MessageBox('VZT Treeview Error', 'Source parent data record not found!~r~nID:'+is_parentid , StopSign!) 
	ELSE
	   is_parentname 	= Trim(ids_source.GetItemString(il_parent_item_row,"name"))
		is_folderid 	= Trim(ids_source.GetItemString(il_parent_item_row,"parent_id"))
	END IF 
End If


end event

event ue_item_insert;// handle is the "after" handle
// parent is one level above 

long 				li_answer , ll_hid, ll_parenthandle, ll_srow, ll_level, ll_inserted_handle
string			ls_title, ls_newid , ls_parentid
treeviewitem	ltv_inserted
boolean			lb_child

if al_handle 	= 0 then al_handle = il_currentitem

if al_handle > 0 then 
	ll_parenthandle	= FindItem( ParentTreeItem!, al_handle) // insert siblng 
	ls_parentid			= is_parentid
	lb_child				= false
	ll_level 			= itvi_current.level
ELSE
	ll_parenthandle	= FindItem( currenttreeitem!, 0) // insert child // al_handle * (-1) // insert child under the parm item
	ls_parentid			= is_itemid
	lb_child				= true
	ll_level 			= itvi_current.level + 1
END IF

if ll_parenthandle <= 0 then return -1

if this.event ue_item_insert_check( al_handle ) < 0 then return -1 // let descendants handle it
// find parent

ls_newid = this.event ue_item_insert_desc( ls_parentid ) // let descendants handle it 
if ls_newid = '' then return -1 

//ids_source.Retrieve( is_treetype) 
//ids_source.setFilter('1=1')
//ids_source.Filter()
//ids_source.SetSort('')
//ids_source.sort()

ll_srow = wf_get_ds_row( ls_newid ) 
if ll_srow <= 0 then return -1

parent.of_set_item( ll_level , ll_srow , ltv_inserted )

If	lb_child	then
	ll_inserted_handle =	tv_1.InsertItemFirst( ll_parenthandle, ltv_inserted ) 
ELSE
	ll_inserted_handle =	tv_1.InsertItem( ll_parenthandle, il_currentitem, ltv_inserted ) 
END IF

tv_1.SetFocus()
tv_1.SelectItem ( ll_inserted_handle  )
tv_1.EditLabel(ll_inserted_handle)

return 1


end event

event ue_item_delete;long 		li_answer 
string	ls_title
ls_title		 = f_nvl( itvi_current.label,'*no name*')
if al_handle = 0 then al_handle = il_currentitem
ii_savestatus = 0
li_answer = MessageBox("Confirm Delete", "Are you sure you want to delete item '"+ls_title+"' and all its children (if any) ?", Question!, yesno!, 2) 
If li_answer = 1 then
	if this.event ue_item_delete_children ( al_handle ) < 0 then return -1 // delete children first if any 
	// continue deleting tv item - all db tables should be updated in delete_check event !!!!
	if this.event ue_item_delete_check (al_handle) < 0 then return -1 
	tv_1.DeleteItem( al_handle ) 
	COMMIT; //
	ids_source.Retrieve( is_treetype) 
	ids_source.setFilter('1=1')
	ids_source.Filter()
	ids_source.SetSort('')
	ids_source.sort()
	tv_1.POST SetFocus()
	return 1
End If 

return 0
end event

event ue_item_moveup;// get previous sibling if any
// switch order fields in ids_source and save
// delete previous sibling  and reinsert after current 

//for now use current item only

long ll_prevsib, ll_parent, ll_prev_row, ll_order_prev, ll_order_curr
string  ls_error , ls_code, ls_prev_id
treeviewitem	ltvi_PrevSib
ll_prevsib 	= tv_1.FindItem(PreviousTreeItem!, il_currentitem) 
if ll_prevsib < 0 then return 0 // no prev sib.
tv_1.GetItem( ll_prevsib , ltvi_PrevSib)
ls_prev_id = ltvi_PrevSib.data
ll_prev_row = wf_get_ds_row( ls_prev_id )
if ll_prev_row <= 0 then return 0

ll_order_prev 	= ids_source.object.orderingroup[ ll_prev_row ]
ll_order_curr	= ids_source.object.orderingroup[ il_current_item_row ]

		UPDATE "VZT_HIERARCHY"  set  "vzt_hierarchy"."orderingroup" = :ll_order_prev 	
		WHERE "id"= :is_itemid;  
		
		If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to update VZT_HIERARCHY pointer.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return 0
		END IF
		
		UPDATE "VZT_HIERARCHY"  set  "vzt_hierarchy"."orderingroup" = :ll_order_curr	
		WHERE "id"= :ls_prev_id ;  
		
		If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to update VZT_HIERARCHY pointer.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return 0
		END IF

		// update datastore 
		ids_source.object.orderingroup[ ll_prev_row ]			= ll_order_curr	
		ids_source.object.orderingroup[ il_current_item_row ] = ll_order_prev 	
		
		COMMIT;
		// delete olditem 
//		tv_1.DeleteItem ( ll_prevsib )
		of_refresh_children ( itvi_Parent.itemhandle ) 
		tv_1.POST SelectItem ( ll_prevsib )
return 0
end event

event ue_item_movedown;// get next sibling if any
// switch order fields in ids_source and save
// delete nextious sibling  and reinsert after current 

//for now use current item only

long ll_nextsib, ll_parent, ll_next_row, ll_order_next, ll_order_curr
string  ls_error , ls_code, ls_next_id
treeviewitem	ltvi_nextSib
ll_nextsib 	= tv_1.FindItem(NextTreeItem!, il_currentitem) 
if ll_nextsib < 0 then return 0 // no next sib.
tv_1.GetItem( ll_nextsib , ltvi_nextSib)
ls_next_id = ltvi_nextSib.data
ll_next_row = wf_get_ds_row( ls_next_id )
if ll_next_row <= 0 then return 0
ll_order_next 	= ids_source.object.orderingroup[ ll_next_row ]
ll_order_curr	= ids_source.object.orderingroup[ il_current_item_row ]

		UPDATE "VZT_HIERARCHY"  set  "vzt_hierarchy"."orderingroup" = :ll_order_next 	
		WHERE "id"= :is_itemid;  
		
		If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to update VZT_HIERARCHY pointer.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return 0
		END IF
		
		UPDATE "VZT_HIERARCHY"  set  "vzt_hierarchy"."orderingroup" = :ll_order_curr	
		WHERE "id"= :ls_next_id ;  
		
		If sqlca.SQLCode <> 0 Then        
        ls_error =  sqlca.SQLerrtext
        ls_code =  string( sqlca.SQLCode) 
        ROLLBACK;
        MessageBox('Database Error', 'Failed to update VZT_HIERARCHY pointer.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
        return 0
		END IF

		// update datastore 
		ids_source.object.orderingroup[ ll_next_row ]			= ll_order_curr	
		ids_source.object.orderingroup[ il_current_item_row ] = ll_order_next 	
		
		COMMIT;
		// delete olditem 
//		tv_1.DeleteItem ( ll_nextsib )
		of_refresh_children ( itvi_Parent.itemhandle ) 
		tv_1.POST SelectItem ( ll_nextsib )
return 0
end event

event ue_item_delete_check;return 1

// use the following in descendant
//
//long 					ll_ds_row
//treeviewitem 		ltvi_item
//string				ls_id
//
//tv_1.GetItem( al_handle , ltvi_item) 
//ls_id = ltvi_item.data
//ll_ds_row = wf_get_ds_row( ls_id )
//if ll_ds_row <= 0 then return -1
//If ids_source.object.leafind = 'Y' then 
//	// Delete leaf from the database 
//End If

end event

event ue_item_delete_children;long 					ll_next_child , ll_child_ds_row
treeviewitem 		ltvi_child
string				ls_child_id

ll_next_child = tv_1.FindItem( ChildTreeItem!, al_parent)
DO While ll_next_child > 0 
  	tv_1.GetItem( ll_next_child , ltvi_child) 
	ls_child_id = ltvi_child.data
	ll_child_ds_row = wf_get_ds_row( ls_child_id )
	if ll_child_ds_row <= 0 then return -1
	If ids_source.object.leafind [ll_child_ds_row]<> 'Y' then 
		// first delete recursively children of this item
		this.event ue_item_delete_children ( ll_next_child ) 
	END IF 
	if this.event ue_item_delete_check (ll_next_child) < 0 then return -1
	tv_1.DeleteItem( ll_next_child )
	ll_next_child = tv_1.FindItem( ChildTreeItem!, al_parent)
LOOP 

return 1
end event

event ue_add_items;//add the items to the TreeView using the data in the DataStore

Integer				li_source_row
TreeViewItem		ltvi_New, ltvi_parent 
long  				ll_newitem
string 				ls_label
// Add each item to the TreeView
For li_source_row = 1 To ai_Rows
	// check user access to source row 
	if this.event ue_add_items_row_access_check ( li_source_row ) = '' then continue 

	ids_Source.object.hier_level [li_source_row ] = ai_Level 
	// Set the values of the TreeView item from DataStore 
	of_set_item(ai_Level, li_source_row, ltvi_New)
		
	ls_label = upper(trim(ids_source.object.name [li_source_row] )) 
//	ll_newitem = tv_1.InsertItemFirst(al_Parent, ltvi_New) 			
//	tv_1.POST ExpandItem( ll_newitem )
	this.event ue_set_picture_on_insert( li_source_row, ltvi_New ) 
	ll_newitem = tv_1.InsertItemLast(al_Parent, ltvi_New) 
	
	If ll_newitem < 1 Then 
		MessageBox("Error", "Error inserting item:"+ls_label, Exclamation!)
		Return -1
	End If
Next

Return ai_Rows
end event

event ue_set_picture_on_insert;if al_source_row <= 0 then return 

If ids_source.object.parent_id [al_source_row] = '00' or ids_source.object.parent_id [al_source_row]='' then
		atvi_target.PictureIndex 			= 1 // top of h-chy
		atvi_target.SelectedPictureIndex = 1
ElseIf ids_source.object.leafind [al_source_row] = 'Y' then // leaf 
		atvi_target.PictureIndex 			= 4
		atvi_target.SelectedPictureIndex = 4
ELSE 
		atvi_target.PictureIndex 			= 2   //closed - folder 
		atvi_target.SelectedPictureIndex = 2 	// 5	// open need to chg index on exp/contr
END IF

 
end event

event ue_add_items_row_access_check;return 'RW' // default full access
end event

event ue_init_presentation;double ld_id

ld_id = 0

  INSERT INTO "vzt_presentation"  
         ( "fontface",   
           "fontsize",   
           "bold",   
           "italic",   
           "under",   
           "fgcolor",   
           "bgcolor",   
           "id",   
           "parentkey",   
           "height",   
           "width",   
           "x",   
           "y_before",   
           "y_after",   
           "border",   
           "borderthickness" , "parenttable" )  
  VALUES ( 'Arial',   
           8,   
           'N',   
           'N',   
           'N',   
           0,   
           99999999,   
           null,   
           :as_parentid,   
           16,   
           200,   
           0,   
           0,   
           0,   
           '0',   
           0 , :as_parenttable )  ;

IF SQLCA.sqlcode = 0 then 
	SELECT "id" INTO :ld_id  FROM "vzt_presentation" 
	where  "parentkey" = :as_parentid AND 
			"parenttable" = 'VZT_HIERARCHY' ;
			
	UPDATE "VZT_HIERARCHY" SET "PRESENT_ID" = :ld_id WHERE "VZT_HIERARCHY"."ID" = :as_parentid ;
	IF SQLCA.sqlcode <> 0 then 
		ROLLBACK;
		MessageBox('VZT Database Error', 'Failed to create presentation entry. ~r~n~r~nParent ID:'+ string(f_nvl(as_parentid,'*NULL*'))+'~r~nParent Table:'+ string(f_nvl(as_parenttable ,'*NULL*')) )
	END IF 
	COMMIT;
ELSE
	ROLLBACK;
	MessageBox('VZT Database Error', 'Failed to insert presentation entry. ~r~n~r~nParent ID:'+ string(f_nvl(as_parentid,'*NULL*'))+'~r~nParent Table:'+ string(f_nvl(as_parenttable ,'*NULL*')) )
END IF
return ld_id
end event

event ue_item_insert_check;return 1
end event

event ue_item_insert_desc;string ls_hid , ls_leaf ,ls_error, ls_code
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
		         :is_treetype,   
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
		        MessageBox('Database Error', 'Failed to insert item into VZT_HIERARCHY.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
		        return ''
				END IF
		
COMMIT;
ll_row = ids_source.InsertRow(0)
if ll_row > 0 then 
	ids_source.object.id [ll_row] 			= ls_hid
	ids_source.object.parent_id [ll_row] 	= as_parentid 
	ids_source.object.name [ll_row] 			= 'New Item'
	ids_source.object.orderingroup[ll_row] = ll_sort
	ids_source.object.treetype [ll_row] 	= is_treetype
	ids_source.object.leafind [ll_row] 		= ls_leaf 
END IF

return ls_hid
end event

event ue_endlabeledit;//tab_1.SelectTab( 5)
end event

event begindrag;GetItem(handle, itvi_DragSource)

// Save the handle of the item that is being dragged and its parent
il_DragSource = handle
il_DragParent = FindItem(ParentTreeItem!, handle)
itvi_Current  = itvi_DragSource
GetItem(il_DragParent , itvi_DragParent)

is_itemid 					= Trim(String(itvi_DragSource.Data))
is_drag_source_hier_id 	= is_itemid 
is_dragid					= is_itemid 
is_dragparentid			= Trim(String(itvi_DragParent.Data))

il_dragrow = wf_get_ds_row( is_itemid )

end event

event dragwithin;TreeViewItem		ltvi_Over

If GetItem(handle, ltvi_Over) = -1 Then
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
End If
il_dropparent = FindItem(ParentTreeItem!, handle)


////	 Highlight the department to be dropped on.
//	If handle <> il_DragParent Then
//		SetDropHighlight(handle)
//		il_DropTarget = handle
//	Else
//		SetDropHighlight(0)
//		il_DropTarget = 0
//	End If
//
//	// Drop target is this item's parent
//	If il_DropTarget <> il_DragParent Then
//		SetDropHighlight(il_DropTarget)
//	Else
//		SetDropHighlight(0)
//		il_DropTarget = 0
//	End If
//End If

end event

event itempopulate;// Populate the tree with this item's children

Integer				li_Level, li_Rows
TreeViewItem		ltvi_Current, ltvi_Parent
String				ls_filter, lstvi

SetPointer(HourGlass!)
// Determine the level
GetItem(handle, ltvi_Current)
li_Level = ltvi_Current.Level + 1

//This item's data (which is 'id') will serve as argument to SetFilter
//Determine the parent for the new data

lstvi = string(ltvi_Current.Data)
ls_filter = "parent_id = '"+ lstvi +" '"

ids_Source.SetFilter(ls_filter)
ids_Source.Filter()
ids_Source.SetSort("orderingroup A")

ids_Source.Sort()
li_Rows = ids_Source.RowCount()

//call of_add_items function to populate parent with its children
if li_Rows > 0 then
	this.event ue_add_items(handle, li_Level, li_Rows)
end if
This.SelectItem(handle)
end event

event selectionchanged;// Display the data for the record selected  

long 			ll_Parent 
Parent.SetRedraw(False)

// Display this item in the proper DataWindow
//of_display_item(newhandle, li_Parm)
tv_1.GetItem(newhandle, itvi_Current)
is_itemid = f_nvl(trim(string(itvi_Current.Data)),'')
Integer		li_Cnt 
For li_Cnt = (itvi_current.Level + 1) To 5
	il_CurrentItem = 0
Next

this.event ue_set_current_data ( newhandle ) 
this.event ue_processitem(newhandle )

Parent.SetRedraw(True)


end event

event constructor;// Add the pictures to be used.
// This is done in this script rather than the painter to allow the
// picture size to be set.  Otherwise it gets set to be equal to the
// size of the first picture added.

This.PictureHeight 	= 15
This.PictureWidth 	= 16

//This.AddPicture("C:\data\pbbmp\Tree.bmp")
This.AddPicture("Custom051!") // palm tree 
This.AddPicture("Custom039!") // closed folder
This.AddPicture("Compile!")   // mult pages
This.AddPicture("ScriptYes!") // filled page
This.AddPicture("Custom050!") // open folder 
This.AddPicture("Custom076!") // man / glasses 
This.AddPicture("Custom067!") // graph

end event

event selectionchanging;// Determine whether to allow the user to change selection, and
// whether to re-retrieve the new item's DataWindow, based on
// the item selected and the items updated.  Returning 0 from
// this event will allow the selection to change.  Returning 1 will not.

Integer				li_Cnt, li_Start
Long					ll_OldParent, ll_NewParent
Boolean				lb_Changed
TreeViewItem		ltvi_Old, ltvi_New

ib_Retrieve = True

If GetItem(oldhandle, ltvi_Old) = -1 Or &
	GetItem(newhandle, ltvi_New) = -1 Then Return 0

If ltvi_Old.Level = ltvi_New.Level Then
	// Changing selection to another item on the same level.
	// First determine if the DW will need to be re-retrieved.  If the
	// new item has the same parent as the old, it does not.
	If FindItem(ParentTreeItem!, oldhandle) = FindItem(ParentTreeItem!, newhandle) Then
		ib_Retrieve = False
		Return 0

	Else
		// If nothing below the old item has been changed, do not need to save.
		For li_Cnt = ltvi_Old.Level To 4
			If ib_Changed Then
				//Return of_savequery()
			Else
				Return 0
			End If
		Next
	End If

ElseIf ltvi_Old.Level < ltvi_New.Level Then
	// Selecting an item lower down the tree.
	// If a record below the old item has been changed, and
	// the old item is not a parent of the new item, must save.
	For li_Cnt = (ltvi_Old.Level) To 4
		If ib_Changed Then
			lb_Changed = True
		End If
	Next
	If lb_Changed Then
//		If Not of_checkparent(newhandle, oldhandle) Then Return of_savequery()
	Else
		Return 0
	End If

Else
	// Selecting an item higher in the tree.
	// If the parent of new is also the parent of old, then do not have to retrieve.
	ll_NewParent = FindItem(ParentTreeItem!, newhandle)
	If of_checkparent(oldhandle, ll_NewParent) Then
		ib_Retrieve = False
		li_Start = ltvi_New.Level + 1
	Else
		li_Start = ltvi_New.Level
	End If
	
	// If a record below the new one has been changed, must save.
	For li_Cnt = li_Start To 4
		If ib_Changed Then
			lb_Changed = True
		End If
	Next
	If lb_Changed Then
		Return of_savequery()
	Else
		Return 0
	End If
End If
end event

event clicked;Long   ll_folder_found
TreeViewItem		ltvi_Source
GetItem(handle, ltvi_Source)

SetDropHighlight(0)
SetDropHighlight(handle)
this.event ue_set_current_data ( handle ) 




end event

event rightclicked;this.event clicked(handle)

im_popup.m_item.post PopMenu(PointerX(), PointerY())
end event

event dragdrop;if Not IsValid( source) then return 
If GetItem(handle, itvi_DropTarget) = -1 Then Return
il_DropTarget = handle 
il_DropParent = FindItem(ParentTreeItem!, handle)
GetItem(il_DropParent, itvi_DropParent)
io_dropsourcetype = typeof( source ) 
is_dropid			= Trim(String(itvi_DropTarget.Data))
is_dropparentid	= Trim(String(itvi_DropParent.Data))
il_droprow = wf_get_ds_row( is_dropid )
If il_droprow < 0 then return

//is_leafind 			= ids_source.object.leafind [il_droprow ] 
//is_name 				= Trim(ids_source.GetItemString(il_droprow ,"name"))
il_dropparentrow	= wf_get_ds_row( is_dropparentid	 )


end event

event endlabeledit;TreeViewItem		ltvi_edit
string 				ls_newtext, ls_hid,ls_error, ls_code
GetItem(handle, ltvi_edit)

ls_hid		= string(ltvi_edit.data)

UPDATE VZT_HIERARCHY SET name = :newtext WHERE id = :ls_hid;

If sqlca.SQLCode <> 0 Then        
       ls_error =  sqlca.SQLerrtext
       ls_code =  string( sqlca.SQLCode) 
       ROLLBACK;
       MessageBox('Database Error', 'Failed to update item in VZT_HIERARCHY.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
       return 1
END IF

COMMIT;

this.event ue_processitem( handle )
this.event ue_endlabeledit()

end event

event beginlabeledit;
return 0
end event

type st_vertical from statictext within w_vzt_treeview_base_old1
event mouseup pbm_lbuttonup
event mousemove pbm_mousemove
event mousedown pbm_lbuttondown
integer x = 151
integer width = 50
integer height = 1764
string dragicon = "Exclamation!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 12632256
long backcolor = 8421504
boolean border = true
long bordercolor = 276856960
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mouseup;///Hide the bar
If Not ib_debug Then This.BackColor =il_HiddenColor

//Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()
end event

event mousemove;
//Check for move in progess
If KeyDown(keyLeftButton!) Then
	This.x = Parent.Pointerx()
End If
end event

event mousedown;If Not ib_Debug Then This.BackColor = il_HiddenColor
end event

type st_horizontal1 from statictext within w_vzt_treeview_base_old1
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
boolean visible = false
integer x = 1289
integer width = 1445
integer height = 36
string dragicon = "Exclamation!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeNS!"
long textcolor = 12632256
long backcolor = 0
boolean enabled = false
long bordercolor = 276856960
boolean focusrectangle = false
end type

event mousemove;//Check for move in progess
If KeyDown(keyLeftButton!) Then
	If Not ib_debug Then This.BackColor = il_HiddenColor 
	This.Y = Parent.PointerY()
End If
end event

event mouseup;//Hide the bar
If Not ib_Debug Then This.BackColor = il_HiddenColor

//Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()


end event

event mousedown;If Not ib_Debug Then This.BackColor = il_HiddenColor  
end event

type dw_hier_base from uo_vzt_dwbase within w_vzt_treeview_base_old1
integer x = 1435
integer y = 1520
integer width = 649
integer height = 164
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_qgen_hierarchy_edit"
borderstyle borderstyle = stylebox!
end type

event updateend;ids_Source.Retrieve(is_treetype)
end event

type dw_font_base from uo_vzt_dwbase within w_vzt_treeview_base_old1
integer x = 2112
integer y = 1516
integer width = 549
integer height = 172
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_vzt_present_edit"
borderstyle borderstyle = stylebox!
end type

