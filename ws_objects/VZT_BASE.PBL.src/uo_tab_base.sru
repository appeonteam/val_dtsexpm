$PBExportHeader$uo_tab_base.sru
forward
global type uo_tab_base from tab
end type
end forward

global type uo_tab_base from tab
integer width = 2501
integer height = 1204
integer taborder = 1
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
boolean raggedright = true
integer selectedtab = 1
event ue_resize ( integer newwidth,  integer newheight )
event ue_print_all ( )
event ue_print ( )
event menu_new ( )
event menu_delete ( )
event type integer ue_drilldown ( ref datawindow adw_source,  integer xpos,  integer ypos,  long row,  ref dwobject dwo )
event ue_print_cover ( ref datawindow adw_target )
event ue_date_lookup_start ( string asdwoname,  integer ax,  integer ay )
end type
global uo_tab_base uo_tab_base

type variables
userobject  	TabPage[]  // DragObject
integer         	delta_y =10, delta_x = 10 
uo_zoom_slide   	iuo_zoom
datawindow    	idw_current
window		w_parent
end variables

forward prototypes
public function integer openpage (string as_pageobject)
public function integer openpage (string as_pageobject, string as_rights)
end prototypes

event ue_resize;integer li_page, li_pagecount
li_pagecount = UpperBound( tabpage[] )
If li_pagecount > 0 then 
	For li_page =1 to li_pagecount 
		tabpage[li_page].width  = newwidth - (2 * this.delta_x ) - tabpage[li_page].x 
		tabpage[li_page].height = newheight - (2 * this.delta_y ) - tabpage[li_page].y
		tabpage[li_page].Event Dynamic ue_resize( tabpage[li_page].width , tabpage[li_page].height )
	Next 
	this.SetRedraw( true) 
End IF

end event

event ue_print_all;integer li_page, li_pagecount
li_pagecount = UpperBound( tabpage[] )
If li_pagecount > 0 then 
	For li_page =1 to li_pagecount 
		tabpage[li_page].Event Dynamic ue_print() 
	Next 
End IF

end event

event ue_print;integer li_page, li_pagecount
li_pagecount = UpperBound( tabpage[] )
If li_pagecount > 0 then 
	tabpage[ this.SelectedTab ].Event Dynamic ue_print() 
End IF

end event

event menu_new;if IsValid( idw_current) then 
	integer li_newrow
	li_newrow = idw_current.InsertRow(0) 
	If li_newrow <= 0 then
		MessageBox("Error", "Could Not Insert New Row.", Stopsign!)
	Else
		idw_current.SetRow( li_newrow )
		idw_current.ScrollToRow( li_newrow )
	End If
End If
end event

event menu_delete;if IsValid( idw_current) then this.GetParent().event dynamic ue_delete( idw_current, 0, false) 
end event

event ue_date_lookup_start(string asdwoname, integer ax, integer ay);ax = ax 
//ue_date_lookup_start(dwo.name, 100,200) 
end event

public function integer openpage (string as_pageobject);integer li_page, li_rc

If as_pageobject ='' or IsNull(as_pageobject) then as_pageobject = "uo_tabpage_dw" 

li_page = UpperBound( tabpage[]) +1 
li_rc = this.OpenTab( tabpage[li_page], as_pageobject, 0) 
If li_rc > 0 then 
	tabpage[li_page].event dynamic ue_setparenttab(this )
	//this.tabpage[li_page].tabbackcolor = RGB( 122, 122, 192)
	this.SelectTab( li_page )
End If
return li_rc
end function

public function integer openpage (string as_pageobject, string as_rights);int li_rc
li_rc = this.openpage ( as_pageobject )
if li_rc >= 0 then tabpage[ UpperBound( tabpage[]) ].event dynamic ue_secure_display( as_rights)
return li_rc
end function

event selectionchanged;idw_current = tabpage[newindex].event dynamic ue_get_main_dw()
If IsValid( this.iuo_zoom ) and NOT IsNull ( this.iuo_zoom) then 
	if Not IsNULL (idw_current) then 	this.iuo_zoom.uf_settarget( idw_current )
End If
end event

