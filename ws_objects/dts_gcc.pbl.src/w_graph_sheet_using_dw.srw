$PBExportHeader$w_graph_sheet_using_dw.srw
forward
global type w_graph_sheet_using_dw from window
end type
type st_data from statictext within w_graph_sheet_using_dw
end type
type mle_1 from multilineedit within w_graph_sheet_using_dw
end type
type dw_1 from u_dw_graph_drilldown within w_graph_sheet_using_dw
end type
end forward

global type w_graph_sheet_using_dw from window
integer x = 27
integer y = 56
integer width = 2807
integer height = 1444
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = minimized!
long backcolor = 12632256
string icon = "GRAPH.ICO"
event graph_type pbm_custom01
event graph_title pbm_custom02
event copy_to_clipboard pbm_custom03
event spacing pbm_custom04
event graph_fillpatterns pbm_custom05
event graph_color pbm_custom06
event ue_saveas pbm_custom08
event ue_save pbm_custom09
event ue_sharedataoff pbm_custom11
event type long ue_sharedataon ( str_dts_report_parms astr_parms )
event ue_load pbm_custom10
event ue_printscreen pbm_custom13
event ue_printreport pbm_custom07
event ue_autoprint pbm_custom20
st_data st_data
mle_1 mle_1
dw_1 dw_1
end type
global w_graph_sheet_using_dw w_graph_sheet_using_dw

type variables
str_dts_report_parms	istr_report_parms
string cSortOrder
//integer iJob

end variables

on graph_type;// Open the response window to set the graph type. Pass it the 
// datawindow object and it will do the rest.
OpenWithParm (w_graph_type_dw, dw_1)

end on

on graph_title;// Set the graph title. This is set in the child window w_graph_title.
// The window tag attribute is used as a communication mechanism. If
// the tag attribute is used for other things (e.g. context sensitive
// help), a global variable may be used.

OpenWithParm (w_graph_title_dw, dw_1)



end on

event copy_to_clipboard;// Copy the graph to the Windows Clipboard.
dw_1.ClipBoard ("gr_1" )
end event

on spacing;OpenWithParm (w_graph_spacing_dw, dw_1)


end on

on graph_fillpatterns;
// Coming event:
// Will allow the setting of fill patterns when that feature 
// has been implemented.
//dw_1.grdatastyle ( gr_1, 1, 1, bdiagonal! )
end on

on graph_color;OpenWithParm (w_graph_color_dw, dw_1)
end on

on ue_saveas;dw_1.SaveAs()
end on

on ue_save;dw_1.SaveAs()
end on

event ue_sharedataoff;integer nResponse

nResponse = dw_1.ShareDataOff()
If  nResponse <> 1 Then
	MessageBox( "Data Share Error", "There was an error in an " + &
	"attempt to UN-link the " + This.Title + " window with the " + &
	"Q&A Window.  (Error code is " + String(nResponse) + ")", &
	StopSign! )
	Close( This )
End If

end event

event ue_sharedataon;integer nRetCode

istr_report_parms = astr_parms

nRetCode = istr_report_parms.dwsource.ShareData( dw_1 )
If  nRetCode <> 1 Then
	MessageBox( "Data Share Error", "There was an error in an " + &
			"attempt to link the " + This.Title + " window with the " + &
			"Q&A Window.  (Error code is " + String(nRetCode) + ")", &
			StopSign! )
	Close( this )
	return -1
End If

return 1
end event

on ue_load;dw_1.ImportFile( "" )	// prompt for filename

end on

on ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end on

on ue_printreport;dw_1.Print()
end on

on ue_autoprint;PrintDataWindow( iJob, dw_1 )
end on

event activate;SetPointer( HourGlass! )
SetMicroHelp( "Preparing data for " + This.Title + "...please wait." )
If dw_1.SetSort( cSortOrder ) <> 1 Then
	MessageBox( "Sort Error!", "Unable to set the SORT ORDER for " + &
					This.Title + "." )
Else
	If dw_1.Sort() <> 1 Then
		MessageBox( "Sort Error!", "Unable to SORT DATA for " + &
					This.Title + ".")
	End If
End If
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
SetPointer( Arrow! )

end event

on resize;//
//window activesheet
//integer nBorderWidth, nTitleHeight
//
//nBorderWidth = (This.Width - This.WorkSpaceWidth()) / 2
//nTitleHeight = This.Height - This.WorkSpaceHeight() - (nBorderWidth*2)
//
//SetMicroHelp( "Resizing " + this.title + " window...please wait." )
//activesheet = w_main.GetActiveSheet()
////If This.WindowState <> Minimized! Then
////dw_1.X = 1
////dw_1.Y = 1
////dw_1.Move( 1, 1 )
////mle_1.SetRedraw(False)
////dw_1.SetRedraw(False)
////This.SetRedraw( False )
////dw_1.Move( dw_1.X, nTitleHeight + nBorderWidth + (dw_1.X - nBorderWidth) )
////dw_1.Resize( This.WorkSpaceWidth() - ((dw_1.X - nBorderWidth) *  2), &
////					This.WorkSpaceHeight() - ((dw_1.X - nBorderWidth) * 3) - &
////						nTitleHeight - mle_1.Height )
//dw_1.Resize( This.Width - ((dw_1.X+nBorderWidth)*2) , &
//					This.Height - nTitleHeight - ((dw_1.X+nBorderWidth)*2) )
////dw_1.Resize( This.Width - 50, This.Height - 100 )
////mle_1.Move( dw_1.X, dw_1.Y + dw_1.Height + (dw_1.X - nBorderWidth) )
////mle_1.Resize( dw_1.Width, mle_1.Height )
//This.SetRedraw( True )
////mle_1.SetRedraw( True )
////dw_1.SetRedraw( True )
////End If
//
//SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

//* the followings are copy from w_report_slug resize event
SetMicroHelp( "Resizing " + this.title + " window...please wait." )
dw_1.Move( 1, 1 )
dw_1.Resize( This.Width - 50, This.Height - 100 )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end on

event open;This.Title = This.Title + " - Graph"	// enforces standard

istr_report_parms = Message.PowerObjectParm
end event

on w_graph_sheet_using_dw.create
this.st_data=create st_data
this.mle_1=create mle_1
this.dw_1=create dw_1
this.Control[]={this.st_data,&
this.mle_1,&
this.dw_1}
end on

on w_graph_sheet_using_dw.destroy
destroy(this.st_data)
destroy(this.mle_1)
destroy(this.dw_1)
end on

type st_data from statictext within w_graph_sheet_using_dw
integer x = 69
integer y = 60
integer width = 699
integer height = 84
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 65535
long backcolor = 8388608
string text = "none"
alignment alignment = center!
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_graph_sheet_using_dw
boolean visible = false
integer x = 96
integer y = 1436
integer width = 2345
integer height = 252
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_graph_drilldown within w_graph_sheet_using_dw
string tag = "Place the mouse cursor over an area and watch this line or click the right button for information."
integer x = 27
integer y = 20
integer width = 2665
integer height = 1252
integer taborder = 10
end type

on constructor;call u_dw_graph_drilldown::constructor;ist_display = st_data

ist_display.Visible = False


end on

