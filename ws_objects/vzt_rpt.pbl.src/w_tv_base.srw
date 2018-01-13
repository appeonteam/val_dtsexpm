$PBExportHeader$w_tv_base.srw
forward
global type w_tv_base from Window
end type
type dw_detail from uo_vzt_dwbase within w_tv_base
end type
type cb_update from commandbutton within w_tv_base
end type
type tv_1 from treeview within w_tv_base
end type
type st_vertical from statictext within w_tv_base
end type
type st_horizontal1 from statictext within w_tv_base
end type
end forward

type str_empxfers from structure
	integer		i_reportid
	integer		i_newfolder
end type

global type w_tv_base from Window
int X=146
int Y=4
int Width=2921
int Height=1824
boolean TitleBar=true
string Title="Base Treeview"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_populate ( )
event ue_postopen ( )
event ue_preopen ( )
event ue_save ( )
event ue_menu_delete ( )
event type integer ue_menu_delete_check_rights ( )
event pfc_messagerouter ( string as_event )
dw_detail dw_detail
cb_update cb_update
tv_1 tv_1
st_vertical st_vertical
st_horizontal1 st_horizontal1
end type
global w_tv_base w_tv_base

type prototypes

end prototypes

type variables
integer		ii_horizpct=40
DataStore	ids_Source
Boolean		ib_Changed, ib_Retrieve
Long		il_ChangedItem, il_CurrentItem
DataWindow           idw_data
string 		is_dataobject='d_vzt_treeview_source'
string  		is_treetype='REPORT',is_name,is_rptid,is_id,is_parentid,is_parentname,is_folderid
string  il_oldheight_accessflags
// The following are used for the resizing service
boolean		ib_debug=False	//Debug mode
long		il_hiddencolor=0	//Bar hidden color to match the window background
long		il_OldHeight	//Save the height of the window
long		il_Oldwidth 	//Save the width of the window
long                         il_droptarget
long                         il_dragsource
long                         il_dragparent
integer		ii_barthickness=11	//Bar Thickness
integer		ii_windowborder=15	//Window border to be used on all sides
dragobject	idrg_Vertical	//Reference to the vertical control on the left of the window
dragobject	idrg_Horizontal	//Reference to the horizontal control on the right of the window
statictext	ist_Horizontal //Reference to the horizontal bar
string		is_top_id
string                        _accessflags
end variables

forward prototypes
public function integer of_add_items (long al_parent, integer ai_level, integer ai_rows)
public function boolean of_checkparent (long al_item, long al_parent)
public function integer of_savequery ()
public function integer wf_resizepanels ()
public function integer wf_refreshbars ()
public function integer wf_resizebars ()
public subroutine of_set_item (integer ai_level, integer ai_row, ref treeviewitem atvi_new)
public function boolean of_display_item (long al_handle, ref string as_parm)
end prototypes

event ue_populate;Integer li_Rows
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
ls_filter = "id = '" + is_top_id +"'"
ids_Source.SetFilter(ls_filter)
ids_Source.Filter()
li_Rows = ids_Source.RowCount()

// Add the items to the TreeView
of_add_items(0, 1, li_Rows)// pass 1 as the level to build

//Expand top-most level

tv_1.ExpandItem(1)
end event

event ue_postopen;SetPointer(HourGlass!)
ids_Source.Retrieve(is_treetype) 

Post Event ue_populate()
 
idw_Data = dw_detail
dw_detail.DataObject = 'd_vzt_report_desc'
dw_detail.SetTransObject(SQLCA)
dw_detail.Retrieve( is_top_id )

end event

event ue_preopen;ids_Source.DataObject = is_dataobject 
end event

event ue_save;Integer	li_Cnt
If  ib_Changed Then idw_Data.Update()
tv_1.Post Event ue_clearupdateditems()

end event

event ue_menu_delete;Int   ll_tvi,ll_found
long	ll_rc

TreeViewItem		ltvi_Target, ltvi_Source, ltvi_Parent

if this.event ue_menu_delete_check_rights() < 0 then return
if trim(is_parentname) <> trim(gnv_appman.is_userid) then return 

IF messagebox("Confirm Deletion","Are you sure you want to delete '" + &
						is_name + "' from your personal folder " + is_parentname + &
						"?", Question!, YesNo!) = 2 Then Return
	 DELETE FROM VZT_HIERARCHY  
	 WHERE id = :is_id
	 ;
If SQLCA.SQLCode < 0 then ll_rc = -10 
f_end_tran( SQLCA, ll_rc, "Delete from HIERARCHY", "Delete from HIERARCHY successful.", "Delete from HIERARCHY failed.")

//refresh datastore
ids_source.Retrieve( is_treetype) 

// Delete from the treeview:
ids_Source.SetFilter(is_id)
ids_Source.Filter()

ll_tvi = tv_1.FindItem(CurrentTreeItem!, 0)
tv_1.DeleteItem(ll_tvi)

end event

event ue_menu_delete_check_rights;return 1
end event

event pfc_messagerouter;CHOOSE CASE as_event
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

public function integer of_add_items (long al_parent, integer ai_level, integer ai_rows);// Function to add the items to the TreeView using the data in the DataStore

Integer				li_Cnt
TreeViewItem		ltvi_New, ltvi_parent 
boolean 				lb_doit 
long  				ll_newitem
string 				ls_label
// Add each item to the TreeView
For li_Cnt = 1 To ai_Rows
	// check user access to reports 
	lb_doit = true 
	If ids_source.object.leafind [li_cnt] = 'Y' then // or ids_source.object.leafind [li_cnt] = 'G'
//		lb_doit = false 
//		If gnv_appman.inv_security.uf_user_has_rights ( "REPORT", ids_source.object.reportid [li_cnt], false ) <> '' then lb_doit = true 
		lb_doit = true // for now  
	Else 
		//------------------------------------------------
		// check for personal folder access here:
		//------------------------------------------------
		tv_1.GetItem(al_Parent, ltvi_parent ) 
		If trim(Upper(ltvi_parent.label )) = "PERSONAL FOLDERS" then 
			IF POS( _accessflags, "A") <= 0 then // if not Admin rights  Check if own folder 
				If trim( ids_source.object.name[li_cnt]) <> trim( gnv_appman.is_userid) then lb_doit = false 
			END IF
		END IF
	End If
	
	If lb_doit then 
		// Call a function to set the values of the TreeView item from 
		// the DataStore data
		of_set_item(ai_Level, li_Cnt, ltvi_New)
		
		ls_label = upper(trim(ids_source.object.name [li_cnt] )) 
		If ls_label = "PERSONAL FOLDERS" then 
			ltvi_New.PictureIndex 			= 6 // person 
			ltvi_New.SelectedPictureIndex = 6
			ll_newitem = tv_1.InsertItemLast(al_Parent, ltvi_New) 
			tv_1.POST ExpandItem( ll_newitem )
		Elseif ls_label = gnv_appman.is_userid then 
			ll_newitem = tv_1.InsertItemFirst(al_Parent, ltvi_New) 			
			tv_1.POST ExpandItem( ll_newitem )
		Else 
			If ids_source.object.parent_id [li_cnt] = '00' or ids_source.object.parent_id [li_cnt]='' then
				ltvi_New.PictureIndex 			= 1
				ltvi_New.SelectedPictureIndex = 1
			ElseIf ids_source.object.leafind [li_cnt] = 'Y' then
				ltvi_New.PictureIndex 			= 4
				ltvi_New.SelectedPictureIndex = 4
			ELSE 
				ltvi_New.PictureIndex 			= 2   //closed 
				ltvi_New.SelectedPictureIndex = 2 // 5	// open need to chg index on exp/contr
			END IF
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
end function

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

// Horizontal object processing

li_X = st_vertical.X + ii_BarThickness 
//li_Y = ist_Horizontal.Y + ii_BarThickness
idrg_Horizontal.Move (li_X, ist_Horizontal.Y )
	

li_HWidth = ist_Horizontal.Width
li_HHeight = ll_Height - (ist_Horizontal.Y + (2 * ii_BarThickness)) + ii_WindowBorder
idrg_Horizontal.Resize (li_HWidth, li_HHeight)


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

st_vertical.Move(st_vertical.X, ii_WindowBorder)
st_vertical.Resize(ii_barthickness, 5 + This.WorkSpaceHeight() - (2 * ii_WindowBorder))

li_HX = st_vertical.X + ii_BarThickness
li_HW = This.WorkSpaceWidth() - li_HX - ii_WindowBorder

ist_Horizontal.Move(li_HX, ist_Horizontal.Y)
ist_Horizontal.Resize(li_HW, ii_BarThickness)



wf_RefreshBars()

Return 1

end function

public subroutine of_set_item (integer ai_level, integer ai_row, ref treeviewitem atvi_new);// Set the Lable and Data attributes for the new item from the data in the DataStore

Integer	li_Picture


atvi_New.Label = ids_Source.Object.name[ai_Row]
atvi_New.Data = ids_Source.Object.id[ai_Row]

IF ai_Level < 4  Then
	atvi_New.Children = True

	atvi_New.PictureIndex = ai_level

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
String				ls_id , ls_ParentParm,ls_Filter
TreeViewItem		ltvi_Current, ltvi_Parent
			
tv_1.GetItem(al_Handle, ltvi_Current)

If ib_Retrieve Then
	If al_Handle = il_CurrentItem Then
		// This item is already displayed, True return code indicates
		// that the item was already set.
		as_Parm = trim(string(ltvi_Current.Data))
		Return True
	End If

	If ltvi_Current.Level > 1 Then
		// Get the retrieval argument from the Parent item
		ll_Parent = tv_1.FindItem(ParentTreeItem!, al_Handle)
		of_display_item( ll_Parent, ls_ParentParm)
		
		If ltvi_Current.Level = 3 Then
			// The third level requires retrieval arguments from the 
			// two previous levels.
			ll_Parent = tv_1.FindItem(ParentTreeItem!, ll_Parent)
			tv_1.GetItem(ll_Parent, ltvi_Parent)
		End If
	End If
End If
ls_id = String(ltvi_Current.Data)
ll_rc = idw_data.Retrieve( ls_id  )
Return False
 
end function

on w_tv_base.create
this.dw_detail=create dw_detail
this.cb_update=create cb_update
this.tv_1=create tv_1
this.st_vertical=create st_vertical
this.st_horizontal1=create st_horizontal1
this.Control[]={this.dw_detail,&
this.cb_update,&
this.tv_1,&
this.st_vertical,&
this.st_horizontal1}
end on

on w_tv_base.destroy
destroy(this.dw_detail)
destroy(this.cb_update)
destroy(this.tv_1)
destroy(this.st_vertical)
destroy(this.st_horizontal1)
end on

event open;//_accessflags = gnv_appman.inv_security.uf_user_has_rights( this.classname(), true ) 
//if _accessflags = '' THEN 	return

ids_Source = Create DataStore
this.event ue_preopen()		// allow descendant initialization
ids_Source.SetTransObject(sqlca) 
idw_Data = dw_detail		//reference to datawindow


// The following lines are for setting up the resizing service
il_OldHeight = This.WorkspaceHeight()
//idrg_Vertical = idw_Data
idrg_Vertical = tv_1 
idrg_Horizontal = idw_Data
ist_Horizontal = st_horizontal1


// Set the color of the bars to make them invisible
il_HiddenColor = This.BackColor
st_Vertical.BackColor = il_HiddenColor
ist_Horizontal.BackColor = il_HiddenColor

//Resize Bars
wf_ResizeBars()
//Resize the panels
wf_ResizePanels()

this.event ue_postopen()	//allow descendant mods
end event

event close;If IsValid(ids_Source) then Destroy ids_Source



end event

event resize;
Integer		li_Delta , li_Cnt

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
	//	Resize Bars
	wf_ResizeBars()
//
	//	Resize the panels
	wf_ResizePanels()
end if
end event

event key;if keydown(keyF1!) then messagebox("REPORT GENERATOR HELP","God helps them that help themselves")
end event

type dw_detail from uo_vzt_dwbase within w_tv_base
int X=1403
int Y=56
int Width=1417
int Height=1612
int TabOrder=30
boolean HScrollBar=true
boolean VScrollBar=true
end type

type cb_update from commandbutton within w_tv_base
int X=1147
int Y=48
int Width=338
int Height=84
int TabOrder=10
boolean Visible=false
string Text="Update"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//Integer	li_Cnt, li_Xfers
//
//// Save all changes
//li_Xfers = UpperBound(istr_PendingXfers)
//
//For li_Cnt = 1 To li_Xfers
//	UPDATE "employee"  
//	      SET "dept_id" = :istr_PendingXfers[li_Cnt].i_NewDept  
//	 WHERE "employee"."emp_id" = :istr_PendingXfers[li_Cnt].i_EmpID   ;
//	If sqlca.sqlcode <> 0 Then
//		MessageBox("Update Error", "Error updating employees:  " + String(sqlca.sqlcode) + &
//							" - " + sqlca.sqlerrtext, Exclamation!)
//		Rollback;
//	End If
//Next
//
//Commit;
//
//Close(Parent)

end event

type tv_1 from treeview within w_tv_base
event ue_clearupdateditems ( )
int Y=56
int Width=1371
int Height=1612
int TabOrder=20
boolean DragAuto=true
BorderStyle BorderStyle=StyleLowered!
boolean DisableDragDrop=false
boolean LinesAtRoot=true
long PictureMaskColor=12632256
string StatePictureName[]={"ScriptYes!",&
"Custom066!",&
"Custom072!",&
"Custom076!"}
long StatePictureMaskColor=553648127
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

event begindrag;TreeViewItem		ltvi_Source
if trim(is_parentname) = gnv_appman.is_userid then return

GetItem(handle, ltvi_Source)

// Save the handle of the item that is being dragged and its parent (department)
il_DragSource = handle
il_DragParent = FindItem(ParentTreeItem!, handle)

is_id=Trim(String(ltvi_Source.Data))

end event

event dragwithin;TreeViewItem		ltvi_Over

If GetItem(handle, ltvi_Over) = -1 Then
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
End If

If ltvi_Over.level = 3 Then
	// Highlight the department to be dropped on.
	If handle <> il_DragParent Then
		SetDropHighlight(handle)
		il_DropTarget = handle
	Else
		SetDropHighlight(0)
		il_DropTarget = 0
	End If
Else
	// Drop target is this item's parent
	il_DropTarget = FindItem(ParentTreeItem!, handle)
	If il_DropTarget <> il_DragParent Then
		SetDropHighlight(il_DropTarget)
	Else
		SetDropHighlight(0)
		il_DropTarget = 0
	End If
End If

end event

event dragdrop;Integer				li_Pending,max_order, li_Rows,ai_level 
Long					ll_NewItem, rtn, ll_rc 
String  				max_id,	ls_sourceid, ls_targetid, ls_filter , ls_expr , ls_source_rpt_id ,ls_leaf
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
ls_filter = "id = '" + max_id +"'"
ids_Source.SetFilter(ls_filter)
ids_Source.Filter()
li_Rows = ids_Source.RowCount()
of_add_items( ltvi_Target.itemhandle, ltvi_Target.level + 1 , li_Rows ) // pass 1 as the level to build

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
	of_add_items(handle, li_Level, li_Rows)
end if
This.SelectItem(handle)
end event

event selectionchanged;// Display the data for the record selected in the DataWindow(s)

Integer					li_Cnt 
string 					li_Parm
TreeViewItem			ltvi_New

Parent.SetRedraw(False)
// Display this item in the proper DataWindow
of_display_item(newhandle, li_Parm)

// Reset DataWindow
GetItem(newhandle, ltvi_New)

For li_Cnt = (ltvi_New.Level + 1) To 5
	il_CurrentItem = 0
Next

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

type st_vertical from statictext within w_tv_base
event mouseup pbm_lbuttonup
event mousemove pbm_mousemove
event mousedown pbm_lbuttondown
int X=1344
int Y=244
int Width=41
int Height=520
string DragIcon="Exclamation!"
boolean FocusRectangle=false
long TextColor=12632256
long BackColor=12632256
long BorderColor=276856960
string Pointer="SizeWE!"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

type st_horizontal1 from statictext within w_tv_base
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
int X=1289
int Width=1445
int Height=36
boolean Visible=false
boolean Enabled=false
string DragIcon="Exclamation!"
boolean FocusRectangle=false
long TextColor=12632256
long BackColor=0
long BorderColor=276856960
string Pointer="SizeNS!"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

