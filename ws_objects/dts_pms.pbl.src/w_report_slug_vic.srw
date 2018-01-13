$PBExportHeader$w_report_slug_vic.srw
forward
global type w_report_slug_vic from window
end type
type dw_2 from datawindow within w_report_slug_vic
end type
type dw_1 from datawindow within w_report_slug_vic
end type
end forward

shared variables

end variables

global type w_report_slug_vic from window
integer x = 27
integer y = 60
integer width = 2999
integer height = 1592
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = minimized!
long backcolor = 134217750
string icon = "REPORT.ICO"
event graph_type pbm_custom01
event graph_title pbm_custom02
event copy_to_clipboard pbm_custom03
event spacing pbm_custom04
event graph_fillpatterns pbm_custom05
event graph_color pbm_custom06
event ue_saveas pbm_custom08
event ue_save pbm_custom09
event ue_load pbm_custom10
event ue_sharedataon pbm_custom11
event ue_sharedataoff pbm_custom12
event ue_printreport pbm_custom13
event ue_printscreen pbm_custom14
event ue_autoprint pbm_custom15
event ue_sharedataon_pms ( )
dw_2 dw_2
dw_1 dw_1
end type
global w_report_slug_vic w_report_slug_vic

type variables
string cSortOrder
//integer iJob


end variables

on graph_type;// Open the response window to set the graph type. Pass it the 
// datawindow object and it will do the rest.
//OpenWithParm (w_graph_type_dw, dw_1)

end on

on graph_title;// Set the graph title. This is set in the child window w_graph_title.
// The window tag attribute is used as a communication mechanism. If
// the tag attribute is used for other things (e.g. context sensitive
// help), a global variable may be used.

//OpenWithParm (w_graph_title_dw, dw_1)



end on

event copy_to_clipboard;
long NbrRows

NbrRows = dw_1.RowCount()

If NbrRows > 300 then
	MessageBox("Maximum Records Selected","Please Use SaveAs Function")  
Else
	SetPointer(HourGlass!)
	clipboard(dw_1.describe('datawindow.data'))
	SetPointer(Arrow!)
	SetMicroHelp("Ready")
End If
end event

on spacing;OpenWithParm (w_graph_spacing_dw, dw_1)


end on

on graph_fillpatterns;
// Coming event:
// Will allow the setting of fill patterns when that feature 
// has been implemented.
//dw_1.grdatastyle ( gr_1, 1, 1, bdiagonal! )
end on

on graph_color;//OpenWithParm (w_graph_color_dw, dw_1)
end on

on ue_saveas;dw_1.SaveAs()
end on

on ue_save;dw_1.SaveAs()
end on

on ue_load;dw_1.ImportFile( "" )	// prompt for filename

end on

event ue_sharedataon;integer nRetCode
string ls_rc

nRetCode = w_adhoc.dw_graph.ShareData( dw_1 )
If  nRetCode <> 1 Then
	MessageBox( "Data Share Error dw_1", "There was an error in an " + &
			"attempt to link the " + This.Title + " window with the " + &
			"Q&A Window.  (Error code is " + String(nRetCode) + ")", &
			StopSign! )
	Close( this )
	return 
End If

dw_1.modify('summary1.text = "'+ w_adhoc. is_report_parms1+'"')
dw_1.modify('summary2.text = "'+ w_adhoc. is_report_parms2+'"')


nRetCode = w_adhoc.dw_graph.ShareData( dw_2 )
If  nRetCode <> 1 Then
	MessageBox( "Data Share Error dw_2", "There was an error in an " + &
			"attempt to link the " + This.Title + " window with the " + &
			"Q&A Window.  (Error code is " + String(nRetCode) + ")", &
			StopSign! )
	Close( this )
	return 
End If

dw_2.modify('summary1.text = "'+ w_adhoc. is_report_parms1+'"')
dw_2.modify('summary2.text = "'+ w_adhoc. is_report_parms2+'"')

end event

event ue_sharedataoff;integer nResponse

nResponse = dw_1.ShareDataOff()
If  nResponse <> 1 Then
	MessageBox( "Data Share Error dw_1", "There was an error in an " + &
	"attempt to UN-link the " + This.Title + " window with the " + &
	"Q&A Window.  (Error code is " + String(nResponse) + ")", &
	StopSign! )
	Close( This )
End If


nResponse = dw_2.ShareDataOff()
If  nResponse <> 1 Then
	MessageBox( "Data Share Error dw_2", "There was an error in an " + &
	"attempt to UN-link the " + This.Title + " window with the " + &
	"Q&A Window.  (Error code is " + String(nResponse) + ")", &
	StopSign! )
	Close( This )
End If

end event

on ue_printreport;/* Sfm 12/95  Added this event to match event call from m_main */

//dw_1.Sharedata(dw_2)
dw_2.print()
//dw_1.Sharedataoff()
end on

on ue_printscreen;long job
Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end on

on ue_autoprint;If dw_2.SetSort( cSortOrder ) <> 1 Then
	MessageBox( "Sort Error!", "Unable to set the SORT ORDER for " + &
					This.Title + "." )
Else
	If dw_2.Sort() <> 1 Then
		MessageBox( "Sort Error!", "Unable to SORT DATA for " + &
					This.Title + ".")
	End If
End If
//dw_1.Sharedata(dw_2)
PrintDataWindow( iJob, dw_2 )
end on

event ue_sharedataon_pms;integer nRetCode
string ls_rc

if not isValid( w_pms_adhoc) then return 

nRetCode = w_pms_adhoc.dw_graph.ShareData( dw_1 )
If  nRetCode <> 1 Then
	MessageBox( "Data Share Error dw_1", "There was an error in an " + &
			"attempt to link the " + This.Title + " window with the " + &
			"Q&A Window.  (Error code is " + String(nRetCode) + ")", &
			StopSign! )
	Close( this )
	return 
End If

dw_1.modify('summary1.text = "'+ w_pms_adhoc.is_report_parms1+'"')
dw_1.modify('summary2.text = "'+ w_pms_adhoc.is_report_parms2+'"')


nRetCode = w_pms_adhoc.dw_graph.ShareData( dw_2 )
If  nRetCode <> 1 Then
	MessageBox( "Data Share Error dw_2", "There was an error in an " + &
			"attempt to link the " + This.Title + " window with the " + &
			"Q&A Window.  (Error code is " + String(nRetCode) + ")", &
			StopSign! )
	Close( this )
	return 
End If

dw_2.modify('summary1.text = "'+ w_pms_adhoc.is_report_parms1+'"')
dw_2.modify('summary2.text = "'+ w_pms_adhoc.is_report_parms2+'"')


end event

event open; 
string sheet_name, report_type, dw_mod0, dw_mod1,dw_mod2, dw_mod_result
string open_from, open_to, schedule_from, schedule_to

SetMicroHelp( "Opening " + This.Title + " window...please wait." )
 
This.Title = This.Title + " - Report"	// enforces standard

report_type = Message.StringParm

open_from     = "min(opencall_call_indate for all)"
open_to       = "max(opencall_call_indate for all)"
schedule_from = "min(opencall_timer_start for all)"
schedule_to   = "max(opencall_timer_start for all)"
dw_mod0 		  = "sched_lbl.text = '" + report_type + "'"

if report_type = 'Scheduled' then
	dw_mod1 = " fromdate.expression=' "+schedule_from+" ' "
	dw_mod2 = " todate.expression=' "+schedule_to+" ' "
else
	dw_mod1 = " fromdate.expression=' "+open_from+" ' "
	dw_mod2 = " todate.expression=' "+open_to+" ' "
end if

dw_mod_result = dw_1.Modify(dw_mod0)
dw_mod_result = dw_2.Modify(dw_mod0)

dw_mod_result = dw_1.Modify(dw_mod1) 
if dw_mod_result <> "" then
	MessageBox("dwModify Error","from date: "+dw_mod_result)
end if
dw_mod_result = dw_1.Modify(dw_mod2) 
if dw_mod_result <> "" then
	MessageBox("dwModify Error","to date: "+dw_mod_result)
end if
dw_mod_result = dw_2.Modify(dw_mod1) 
if dw_mod_result <> "" then
	MessageBox("dwModify Error","from date: "+dw_mod_result)
end if
dw_mod_result = dw_2.Modify(dw_mod2) 
if dw_mod_result <> "" then
	MessageBox("dwModify Error","to date: "+dw_mod_result)
end if

//dw_1.SetTransObject( SQLCA )
//dw_1.Retrieve()

//If Len( Message.StringParm ) > 0 Then
//	dw_1.SetFilter( Message.StringParm )
//	dw_1.Filter( )
//End If
//SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )



end event

on activate;SetPointer( HourGlass! )
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

If dw_2.SetSort( cSortOrder ) <> 1 Then
	MessageBox( "Sort Error!", "Unable to set the SORT ORDER for " + &
					This.Title + "." )
Else
	If dw_2.Sort() <> 1 Then
		MessageBox( "Sort Error!", "Unable to SORT DATA for " + &
					This.Title + ".")
	End If
End If

SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
SetPointer( Arrow! )

/* Sfm 12/95 Modification
   Enable copy to clipboard on main menu */
//m_main.m_file.m_copy.enabled=true
end on

on deactivate;/* Sfm 12/95 Modification
   Disable copy to clipboard on main menu */
//m_main.m_file.m_copy.enabled=false
end on

on close;
//Save_Toolbar_Profile( This.Title, this)

end on

on resize;SetMicroHelp( "Resizing " + this.title + " window...please wait." )
dw_1.Move( 1, 1 )
dw_1.Resize( This.Width - 50, This.Height - 100 )
SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )

end on

on w_report_slug_vic.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on w_report_slug_vic.destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_2 from datawindow within w_report_slug_vic
boolean visible = false
integer x = 855
integer y = 1368
integer width = 178
integer height = 112
integer taborder = 20
boolean livescroll = true
end type

on constructor;This.SetTransObject( sqlca )
end on

type dw_1 from datawindow within w_report_slug_vic
string tag = "QAReport"
integer x = 27
integer y = 60
integer width = 2624
integer height = 1336
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

on constructor;This.SetTransObject( sqlca )


end on

