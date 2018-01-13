$PBExportHeader$uo_tabpage_dw.sru
forward
global type uo_tabpage_dw from uo_tabpage_base01
end type
type dw_1 from uo_vzt_dwbase within uo_tabpage_dw
end type
end forward

global type uo_tabpage_dw from uo_tabpage_base01
integer width = 2373
integer height = 700
dw_1 dw_1
end type
global uo_tabpage_dw uo_tabpage_dw

type variables
long 		il_inserted_row
string 	is_gr
end variables

on uo_tabpage_dw.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on uo_tabpage_dw.destroy
call super::destroy
destroy(this.dw_1)
end on

event ue_get_main_dw;Return dw_1
end event

event ue_resize;call super::ue_resize;dw_1.x = delta_x 
dw_1.y = delta_y 
dw_1.width  = newwidth - (2 * this.delta_x )
dw_1.height = newheight - (2 * this.delta_y )


end event

event ue_print;datawindow ldw_target
ldw_target = dw_1
openWithParm( w_vzt_pagerange, ldw_target) 
If Message.StringParm = '1' then 
	// see if cover page requested 
	parenttab.event dynamic ue_print_cover ( ldw_target ) 
	ldw_target.print()
End If

end event

event ue_new;il_inserted_row = dw_1.insertRow( 0)
end event

event ue_delete;call super::ue_delete;dw_1.DeleteRow( 0)
end event

type dw_1 from uo_vzt_dwbase within uo_tabpage_dw
integer x = 14
integer y = 40
integer width = 2313
integer height = 604
integer taborder = 20
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event doubleclicked;call super::doubleclicked;if IsValid( parenttab) then parenttab.event ue_drilldown( dw_1, xpos, ypos, row, dwo) 
end event

event ue_gr_rbuttondown;int li_category, li_series
window lw_parent

If IsValid( parenttab) then 
	lw_parent = parenttab.w_parent
ELSE
	return 
END IF
 
// has a statictext box been declared in the inherited constructor?
IF IsValid( ist_display) THEN

	// Get the object clicked on
	this.ObjectAtPointer( is_graphname, li_series, li_category )

	// did the user click on a graph element?
	IF li_category > 0 THEN

		// get the category name
		is_category = CategoryName( is_graphname, li_category )

		// position the statictext box at the mouse 
		If lw_parent.PointerX() < lw_parent.Width / 2 Then
			ist_display.x = lw_parent.PointerX() + 1 //- ist_display.width - 1
		Else
			ist_display.x = lw_parent.PointerX() - ist_display.width - 1
		End If
		If lw_parent.PointerY() < lw_parent.Height / 2 Then
			ist_display.y = lw_parent.PointerY() + 1 //- ist_display.height - 1
		Else
			ist_display.y = lw_parent.PointerY() - ist_display.height - 1
		End If
		// populate the statictext box
		ist_display.text = String( GetData( is_graphname,  li_series, li_category ) )

		// make the text box visible
		ist_display.visible = true
		
	END IF

END IF


end event

event printpage;if IsValid( parenttab) then parenttab.event dynamic ue_printpage(pagenumber, copy)
end event

event scrollvertical;if IsValid( parenttab) then parenttab.event dynamic ue_scrollvertical(scrollpos)
end event

event clicked;call super::clicked;is_gr = dw_1.GetObjectAtPointer()
if pos( is_gr , 'gr_') > 0 then 
	is_gr = MID(is_gr , 1, 4) 
	if IsValid( parenttab) then parenttab.event dynamic ue_set_graph(is_gr) 
END IF	
end event

