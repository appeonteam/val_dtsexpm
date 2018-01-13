$PBExportHeader$u_dw_graph_drilldown.sru
$PBExportComments$Graphical drill down object
forward
global type u_dw_graph_drilldown from datawindow
end type
end forward

global type u_dw_graph_drilldown from datawindow
integer width = 2665
integer height = 868
integer taborder = 1
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
event ue_retrieve pbm_custom75
event ue_rbuttonup pbm_dwnrbuttonup
event ue_retrievenext pbm_custom74
event mousemove pbm_mousemove
end type
global u_dw_graph_drilldown u_dw_graph_drilldown

type variables
datawindow idw_next
string is_graphname
string is_category
statictext ist_display  
end variables

on ue_retrieve;//this.Retrieve(  )

end on

on ue_rbuttonup;IF IsValid( ist_display) THEN
	ist_display.visible = false
END IF
end on

on ue_retrievenext;idw_next.Retrieve( is_category )
idw_next.visible = true
end on

event mousemove;int li_series, li_category
string is_series, is_series_label, is_category_label, cHelpString

	this.grObjectAtPointer( is_graphname, li_series, li_category )

	// did the user click on a graph element?
	IF li_category > 0 THEN

		// get the category name
		is_category = grCategoryName( is_graphname, li_category )
		is_series 	= grSeriesName( 	is_graphname, li_series )
		is_category_label = dwDescribe( is_graphname + ".Category.Label" )
		is_series_label = dwDescribe( is_graphname + ".Series.Label" )
//		This.grSetSeriesStyle( is_graphname, is_series, SymbolSolidCircle! )

		// populate the statictext box
		if Isvalid(w_main) then

			w_main.SetMicroHelp( "[Q&&A]  -  >>   " + is_category + "   >>   " +&
				is_series_label + "   >>   " + is_series + "   >>   " + &
				String( grGetData( is_graphname,  li_series, li_category ) ) )
		end if	

	ELse
		if Isvalid(w_main) then
			w_main.SetMicroHelp( This.Tag )
		end if	
	END IF

end event

on rbuttondown;int li_category, li_series
window lw_parent

lw_parent = parent

// has a statictext box been declared in the inherited constructor?
IF IsValid( ist_display) THEN

	// Get the object clicked on
	this.grObjectAtPointer( is_graphname, li_series, li_category )

	// did the user click on a graph element?
	IF li_category > 0 THEN

		// get the category name
		is_category = grCategoryName( is_graphname, li_category )

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
		ist_display.text = String( grGetData( is_graphname,  li_series, li_category ) )

		// make the text box visible
		ist_display.visible = true
		
	END IF

END IF


end on

on doubleclicked;int li_category, li_series

// Is there a datawindow to drill down into?
IF IsValid( idw_next) THEN

	// Get the object clicked on
	this.grObjectAtPointer( is_graphname, li_series, li_category )

	// did the user click on a graph element?
	IF li_category > 0 THEN

		// get the category name
		is_category = grCategoryName( is_graphname, li_category )

		// call a user declared event, ue_retrieve, to figure out the retriebve argument and call
		// and call the retrieve funtion for idw_next, thus allowing polymorphism
		this.TriggerEvent( "ue_retrievenext" )

	END IF

END IF


end on

on constructor;this.SetTransObject( sqlca )
is_graphname = "gr_1"

this.Postevent ("ue_retrieve" )
end on

on u_dw_graph_drilldown.create
end on

on u_dw_graph_drilldown.destroy
end on

