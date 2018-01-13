$PBExportHeader$w_vzt_rpt_submitter.srw
forward
global type w_vzt_rpt_submitter from w_vzt_rpt_base
end type
type dw_schedule from uo_vzt_dwbase within w_vzt_rpt_submitter
end type
type cb_rebuild from commandbutton within w_vzt_rpt_submitter
end type
type cb_run_online from commandbutton within w_vzt_rpt_submitter
end type
type cb_run_batch from commandbutton within w_vzt_rpt_submitter
end type
type cb_resetcount from commandbutton within w_vzt_rpt_submitter
end type
type cb_export from commandbutton within w_vzt_rpt_submitter
end type
type dw_exe_test from datawindow within w_vzt_rpt_submitter
end type
type cb_reload from commandbutton within w_vzt_rpt_submitter
end type
end forward

global type w_vzt_rpt_submitter from w_vzt_rpt_base
integer width = 2624
integer height = 1892
string title = "Report Definition"
dw_schedule dw_schedule
cb_rebuild cb_rebuild
cb_run_online cb_run_online
cb_run_batch cb_run_batch
cb_resetcount cb_resetcount
cb_export cb_export
dw_exe_test dw_exe_test
cb_reload cb_reload
end type
global w_vzt_rpt_submitter w_vzt_rpt_submitter

type variables
str_reporter_reportparms  istr_run_parms, istr_parms
uo_vzt_dwbase idw_def,  idw_parms, idw_rpt
end variables

on w_vzt_rpt_submitter.create
int iCurrent
call super::create
this.dw_schedule=create dw_schedule
this.cb_rebuild=create cb_rebuild
this.cb_run_online=create cb_run_online
this.cb_run_batch=create cb_run_batch
this.cb_resetcount=create cb_resetcount
this.cb_export=create cb_export
this.dw_exe_test=create dw_exe_test
this.cb_reload=create cb_reload
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_schedule
this.Control[iCurrent+2]=this.cb_rebuild
this.Control[iCurrent+3]=this.cb_run_online
this.Control[iCurrent+4]=this.cb_run_batch
this.Control[iCurrent+5]=this.cb_resetcount
this.Control[iCurrent+6]=this.cb_export
this.Control[iCurrent+7]=this.dw_exe_test
this.Control[iCurrent+8]=this.cb_reload
end on

on w_vzt_rpt_submitter.destroy
call super::destroy
destroy(this.dw_schedule)
destroy(this.cb_rebuild)
destroy(this.cb_run_online)
destroy(this.cb_run_batch)
destroy(this.cb_resetcount)
destroy(this.cb_export)
destroy(this.dw_exe_test)
destroy(this.cb_reload)
end on

event open;call super::open;// determine what kind of call this is 
istr_parms = Message.PowerObjectParm
If not IsValid ( istr_parms) then 
	MessageBox("Report Error", "Missing parameters.", StopSign! )
	POST close(this) 
	return
End If

is_accessflags = 'RWA' 

cb_reload.visible = fALSE

string ls_newsql
long ll_rc
string ls_outputid

this.visible =  false

if isValid(im_menu) then	
	im_menu.m_file.m_saveas.visible 			= false
	im_menu.m_file.m_printpreview.visible 	= false
	im_menu.m_file.m_dash11.visible 			= false
	im_menu.m_file.m_open.visible 			= false
	im_menu.m_file.m_print.visible 			= false
	im_menu.m_file.m_printall.visible 		= false
	im_menu.m_file.m_pagesetup.visible 		= false
end if	

ls_newsql = Upper(dw_schedule.getSQLSelect())
ls_newsql = ls_newsql + " WHERE id = '" +  trim(istr_parms.schedule_id) +"' " 
ll_rc = dw_schedule.setSQLSelect(ls_newsql) 

tab_1.Openpage( "uo_tabpage_dw_repparms"   )
idw_parms = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Parameters", "", 0, tab_1)
ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = idw_parms 
If POS(is_accessflags, 'W' ) <= 0 then 
	dw_mainlist.hscrollbar = false 
	
	idw_parms.object.parmname.TabSequence = 0
	idw_parms.object.reportid_t.visible = false
	idw_parms.object.parmtype.visible = false
	idw_parms.object.parmtype_t.visible = false
	idw_parms.object.autoreplace.visible = false

	idw_parms.object.wheretag.visible = false
	idw_parms.object.wheretag_t.visible = false
	idw_parms.object.grouptag.visible = false
	idw_parms.object.grouptag_t.visible = false
	idw_parms.object.reportid.visible = false
	idw_parms.object.id_t.visible = false
//	idw_parms.object.cb_search.visible = false
	idw_parms.object.lookuptype_t.visible = false
	idw_parms.object.lookuptype.visible = false
	idw_parms.object.lookupprocessor_t.visible = false
	idw_parms.object.lookupprocessor.visible = false
	idw_parms.object.editmask_t.visible = false
	idw_parms.object.editmask.visible = false
		
	dw_mainlist.object.keeplast.visible = false
	dw_mainlist.object.keeplast_t.visible = false
	dw_mainlist.object.recurring.visible = false
	dw_mainlist.object.recurring_t.visible = false	
	dw_mainlist.object.timetorun.visible = false	
	dw_mainlist.object.timetorunend.visible = false	
	dw_mainlist.object.timetorun_t.visible = false	
	dw_mainlist.object.daytorunmon.visible = false		
	dw_mainlist.object.daytorunmon_t.visible = false		
	dw_mainlist.object.daytoruntue.visible = false			
	dw_mainlist.object.daytoruntue_t.visible = false				
	dw_mainlist.object.daytorunwed.visible = false			
	dw_mainlist.object.daytorunwed_t.visible = false			
	dw_mainlist.object.daytorunthu.visible = false			
	dw_mainlist.object.daytorunthu_t.visible = false				
	dw_mainlist.object.daytorunfri.visible = false			
	dw_mainlist.object.daytorunfri_t.visible = false			
	dw_mainlist.object.daytorunsat.visible = false			
	dw_mainlist.object.daytorunsat_t.visible = false			
	dw_mainlist.object.daytorunsun.visible = false			
	dw_mainlist.object.daytorunsun_t.visible = false				
	dw_mainlist.object.rptdesc.visible = false			
	dw_mainlist.object.rptdesc_t.visible = false				
	dw_mainlist.object.securitylevel.visible = false			
	dw_mainlist.object.securitylevel_t.visible = false			
	
	dw_mainlist.object.reportid.visible = false
	dw_mainlist.object.userid.visible = false

	if isValid(im_menu) then	
		im_menu.m_file.m_new.visible = false
		im_menu.m_file.m_delete.visible = false
		im_menu.m_file.m_save.visible = false
	end if
	
	cb_rebuild.visible = false
	cb_save.visible = false
	cb_export.visible = false	
	cb_resetcount.visible = false		

	
	
End If 

tab_1.Openpage( "uo_tabpage_dw_repdef"  )
idw_def = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Definition", "", 0, tab_1)
If POS(is_accessflags, 'W' ) <= 0 then 
//	tab_1.tabpage[UpperBound(tab_1.tabpage[])].enabled = false
	idw_def.Object.Datawindow.readonly="YES"

	idw_def.object.drilldownreportid.visible 	= false
	idw_def.object.drilldownreportid_t.visible= false
	idw_def.object.c_rancount.visible 			= false
	idw_def.object.timetorun.visible 			= false
	idw_def.object.timetorunend.visible 		= false
	idw_def.object.timetorun_t.visible 			= false
	idw_def.object.timetorunend_t.visible 		= false	
	idw_def.object.daystokeep.visible 			= false 
	idw_def.object.daystokeep_t.visible 		= false 
	idw_def.object.daystokeep_t1.visible 		= false 		
	idw_def.object.keeplast.visible 				= false 
	idw_def.object.keeplast_t.visible 			= false 
	idw_def.object.recurring_t.visible 			= false 
	idw_def.object.recurring.visible 			= false 
	idw_def.object.daytorunmon.visible 			= false 
	idw_def.object.daytorunmon_t.visible 		= false 
	idw_def.object.daytoruntue.visible 			= false 
	idw_def.object.daytoruntue_t.visible 		= false 
	idw_def.object.daytorunwed.visible 			= false 
	idw_def.object.daytorunwed_t.visible 		= false 
	idw_def.object.daytorunthu.visible 			= false 
	idw_def.object.daytorunthu_t.visible 		= false 
	idw_def.object.daytorunfri.visible 			= false 
	idw_def.object.daytorunfri_t.visible 		= false 
	idw_def.object.daytorunsat.visible 			= false 
	idw_def.object.daytorunsat_t.visible 		= false 
	idw_def.object.daytorunsun.visible 			= false 
	idw_def.object.daytorunsun_t.visible 		= false 
	idw_def.object.userid.visible 				= false 
	idw_def.object.userid_t.visible 				= false 
	idw_def.object.securitylevel.visible 		= false 
	idw_def.object.securitylevel_t.visible 	= false 
	idw_def.object.dwdataobjectname.visible 	= false 
	idw_def.object.dwdataobjectname_t.visible = false 

Else

	idw_def.Object.Datawindow.readonly="NO"
	idw_def.object.timetorun.visible 			= true
	idw_def.object.timetorunend.visible 		= true
	idw_def.object.timetorun_t.visible 			= true
	idw_def.object.timetorunend_t.visible 		= true
	idw_def.object.daystokeep.visible 			= true
	idw_def.object.daystokeep_t.visible 		= true
	idw_def.object.daystokeep_t1.visible 		= true
	idw_def.object.keeplast.visible 				= true  
	idw_def.object.keeplast_t.visible 			= true 
	idw_def.object.recurring_t.visible 			= true 
	idw_def.object.recurring.visible 			= true 
	idw_def.object.daytorunmon.visible 			= true 
	idw_def.object.daytorunmon_t.visible 		= true 
	idw_def.object.daytoruntue.visible 			= true 
	idw_def.object.daytoruntue_t.visible 		= true 
	idw_def.object.daytorunwed.visible 			= true 
	idw_def.object.daytorunwed_t.visible 		= true 
	idw_def.object.daytorunthu.visible 			= true 
	idw_def.object.daytorunthu_t.visible 		= true 
	idw_def.object.daytorunfri.visible 			= true 
	idw_def.object.daytorunfri_t.visible 		= true 
	idw_def.object.daytorunsat.visible 			= true 
	idw_def.object.daytorunsat_t.visible 		= true 
	idw_def.object.daytorunsun.visible 			= true 
	idw_def.object.daytorunsun_t.visible 		= true 
	idw_def.object.userid.visible 				= true 
	idw_def.object.userid_t.visible 				= true 
	idw_def.object.securitylevel.visible 		= true 
	idw_def.object.securitylevel_t.visible 	= true 
	idw_def.object.dwdataobjectname.visible 	= true 
	idw_def.object.dwdataobjectname_t.visible = true 	
	
	string ls_exe_test
	ls_exe_test = dw_exe_test.Describe("DataWindow.Column.Count")
	If trim( ls_exe_test ) = '1' then 
		cb_rebuild.enabled = true // PB Dev mode
	Else
		//cb_rebuild.enabled = false // EXE
	End If
End If 
ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = idw_def 

dw_primary = idw_def 
dw_primary_list = dw_mainlist

tab_1.Openpage( "uo_tabpage_dw"  )
idw_rpt = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Report", "", 0)
If POS(is_accessflags, 'W' ) <= 0 then tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible= false

ll_rc = dw_mainlist.Retrieve( istr_parms.report_id )  // retrieve from repdef based on hierarchy 
if ll_rc > 0 then 
	integer li_cnt 
	For li_cnt = 1 to ll_rc // delete whatever is not authorized
		If dw_mainlist.object.vzt_hierarchy_leafind [li_cnt] = 'Y' then 
		//	If gnv_appman.inv_security.uf_user_has_rights ( "REPORT", dw_mainlist.object.reportid [li_cnt], false ) = '' then 
		//		dw_mainlist.DeleteRow( li_cnt) 		
		//		li_cnt = li_cnt - 1 
		//	End If
		End If
		If li_cnt = dw_mainlist.RowCount() then li_cnt = 999
	Next 
End If
dw_mainlist.resetupdate()
if dw_mainlist.ShareData( idw_def) <> 1 then MessageBox('VZT Reporter Error', 'Failed to share report list.', StopSign!)

this.visible =  true 


end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_run_online.y 	= newheight - ii_resizeband_y - cb_run_online.height
		cb_run_batch.y 	= newheight - ii_resizeband_y - cb_run_batch.height
		cb_rebuild.y		= newheight - ii_resizeband_y - cb_rebuild.height 
		cb_resetcount.y	= newheight - ii_resizeband_y - cb_resetcount.height 
		cb_export.y			= newheight - ii_resizeband_y - cb_export.height 
		dw_mainlist.width = newwidth  - dw_mainlist.x * 2 		
		If newwidth > 2634 then 
			cb_close.x = newwidth - cb_close.width - ii_resizeband_x
		End If 
	End IF 
End IF 	
end event

event ue_postopen_01;//override
end event

event ue_save_review_check;call super::ue_save_review_check;If ii_savestatus < 0  then return 
string  				ls_temp ,  ls_repid, ls_syntax
long 					ll_len, ll_next = 1
string ls_rpt_do='' , ls_parms_do =''

setpointer(Hourglass!)

if idw_def.RowCount() > 0 then 
	ls_rpt_do	=  trim( idw_def.object.dwdataobjectname [ idw_def.GetRow()])
	ls_repid		=	trim( idw_def.object.reportid[ idw_def.GetRow()])

	If Not IsNull( ls_rpt_do ) and ls_rpt_do <> '' then 
		idw_rpt.dataobject 	= ls_rpt_do
		 
		blob blob_syntax_and_data
		f_dw_to_syntax_and_data ( idw_rpt, 	true, blob_syntax_and_data ) // report object 
		blob_syntax_and_data = blob_syntax_and_data  + blob( "0000000" )
		UPDATEBLOB  "VZT_REPORTDEF" SET "DWSYNTAX" = :blob_syntax_and_data WHERE "REPORTID" = :ls_repid ;
		 
	End If // empty def	
end if 


end event

type cb_dfilter from w_vzt_rpt_base`cb_dfilter within w_vzt_rpt_submitter
end type

type uo_trace01 from w_vzt_rpt_base`uo_trace01 within w_vzt_rpt_submitter
end type

type dw_mainlist from w_vzt_rpt_base`dw_mainlist within w_vzt_rpt_submitter
integer x = 14
integer width = 2537
integer height = 300
integer taborder = 160
string dataobject = "d_rpt_def_list"
boolean hscrollbar = true
end type

event dw_mainlist::rowfocuschanged;call super::rowfocuschanged;If currentrow > 0 and currentrow <= this.RowCount() then 
	SetPointer( hourglass! )
	idw_rpt.dataobject = 'd_empty'	
	istr_parms.report_id = this.object.hier_id [ currentrow]
	idw_parms.Retrieve( trim(this.object.reportid [ currentrow] ), trim(is_accessflags) )
	idw_parms.fkeyvals[1] = trim(this.object.reportid [ currentrow])
	
End IF
end event

type cb_last_search from w_vzt_rpt_base`cb_last_search within w_vzt_rpt_submitter
end type

type cb_close from w_vzt_rpt_base`cb_close within w_vzt_rpt_submitter
integer x = 2281
integer y = 1696
end type

type cb_delete1 from w_vzt_rpt_base`cb_delete1 within w_vzt_rpt_submitter
integer taborder = 120
end type

type cb_save from w_vzt_rpt_base`cb_save within w_vzt_rpt_submitter
integer x = 832
integer y = 1696
integer width = 357
integer taborder = 130
string text = "Sa&ve Parms"
end type

type cb_select from w_vzt_rpt_base`cb_select within w_vzt_rpt_submitter
integer x = 2619
integer y = 1324
integer taborder = 110
end type

type cb_new from w_vzt_rpt_base`cb_new within w_vzt_rpt_submitter
integer x = 2574
integer y = 1540
integer taborder = 150
end type

type cb_newsearch from w_vzt_rpt_base`cb_newsearch within w_vzt_rpt_submitter
integer x = 311
integer y = 1660
integer taborder = 90
end type

type cb_search from w_vzt_rpt_base`cb_search within w_vzt_rpt_submitter
boolean visible = false
integer x = 416
integer y = 1660
integer taborder = 80
end type

type st_foundrecs from w_vzt_rpt_base`st_foundrecs within w_vzt_rpt_submitter
integer x = 2615
integer y = 1232
end type

type st_stop from w_vzt_rpt_base`st_stop within w_vzt_rpt_submitter
integer x = 3593
end type

type dw_data from w_vzt_rpt_base`dw_data within w_vzt_rpt_submitter
integer x = 2875
integer y = 1500
integer taborder = 40
end type

type dw_print from w_vzt_rpt_base`dw_print within w_vzt_rpt_submitter
integer x = 3237
integer y = 1596
integer taborder = 200
end type

type uo_ddcal from w_vzt_rpt_base`uo_ddcal within w_vzt_rpt_submitter
end type

type uo_zoom from w_vzt_rpt_base`uo_zoom within w_vzt_rpt_submitter
boolean visible = false
integer x = 2149
integer y = 1604
integer taborder = 140
end type

type cbx_preview from w_vzt_rpt_base`cbx_preview within w_vzt_rpt_submitter
end type

type tab_1 from w_vzt_rpt_base`tab_1 within w_vzt_rpt_submitter
event type integer ue_refresh_ddparms ( string as_reportid )
integer x = 14
integer y = 316
integer height = 1360
integer taborder = 60
boolean bringtotop = true
end type

event tab_1::ue_refresh_ddparms;// refresh drilldown columns from the orig. definition of the target report
idw_parms.SetFilter( "parmtype = 'DDCOLUMN'")
idw_parms.Filter()
long ll_ddparm_row, ll_ddparms, ll_parmorder
ll_ddparms = idw_parms.RowCount()
// delete old ddcolumn definitions
If ll_ddparms > 0 then 
	FOr ll_ddparm_row = 1 to ll_ddparms
		idw_parms.DeleteRow( 0 ) 
	Next
End If
idw_parms.SetFilter( "1=1")
idw_parms.Filter()

//retrieve parameters from def table for the target report
datastore lds_parms 
lds_parms = CREATE datastore
lds_parms.dataobject = idw_parms.dataobject 
lds_parms.SetTransObject( SQLCA) 
ll_ddparms = lds_parms.Retrieve( as_reportid, trim(is_accessflags) )
lds_parms.SetFilter( "trim(parmtype) IN ('STRING', 'DATE', 'NUMBER')") // copy only true parameters
lds_parms.Filter()
ll_ddparms = lds_parms.RowCount()
If ll_ddparms > 0 then 
	ll_parmorder =	10
	IF idw_parms.RowCount() > 0 then ll_parmorder =	idw_parms.object.parmorder [idw_parms.RowCount()] + 10 
	FOr ll_ddparm_row = 1 to ll_ddparms
		lds_parms.object.parmtype [ ll_ddparm_row ] = 'DDCOLUMN' // make it drill down in the parent report
		lds_parms.object.parmname [ ll_ddparm_row ] = trim(lds_parms.object.parmname [ ll_ddparm_row ])+" (drill down to "+ trim( as_reportid) +")"
		lds_parms.object.reportid [ ll_ddparm_row ] = idw_def.object.reportid [1]
		lds_parms.object.parmorder[ ll_ddparm_row ] = ll_parmorder 
		ll_parmorder =	ll_parmorder + 10
	Next
End If

If ll_ddparms > 0 then lds_parms.RowsMove( 1, ll_ddparms, Primary!, idw_parms, 999, Primary!)
DESTROY lds_parms
return 1
end event

event tab_1::menu_new;call super::menu_new;if this.SelectedTab = 1 then // parms 
	if idw_parms.getRow() > 0 then 
		idw_parms.SetItem( idw_parms.getRow(), "accessflags", MID(TRIM(is_accessflags)+"************************", 1 , 20)  )
	End If
End If	
end event

type dw_schedule from uo_vzt_dwbase within w_vzt_rpt_submitter
boolean visible = false
integer x = 2610
integer y = 48
integer width = 1586
integer height = 436
integer taborder = 20
string dataobject = "d_schedule"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = this 
end event

type cb_rebuild from commandbutton within w_vzt_rpt_submitter
integer x = 1193
integer y = 1696
integer width = 416
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Regen Reports"
end type

event clicked;setpointer(Hourglass!)

if idw_def.RowCount() > 0 then 
	ii_savestatus = 1
	iw_mywindow.event ue_save_review_check() // save blob 
		
	If ii_savestatus > 0  and  SQLCA.sqlcode = 0 then 
		commit using SQLCA;
		Messagebox("Report Object Creation", "Report Objects created.")
	ELSE
		Rollback using SQLCA;
		Messagebox("Report Object Creation", "Object Creation failed.", stopsign!)
	End If
		
end if 
end event

type cb_run_online from commandbutton within w_vzt_rpt_submitter
integer x = 14
integer y = 1696
integer width = 311
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Run Online"
end type

event clicked;if idw_parms.AcceptText() <> 1 then return
parent.event ue_submit_report("ONLINE", idw_def, idw_parms, idw_rpt, istr_parms.report_id  ) // hierarchy pointer
end event

type cb_run_batch from commandbutton within w_vzt_rpt_submitter
integer x = 334
integer y = 1696
integer width = 375
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Run in Batch"
end type

event clicked;if idw_parms.AcceptText() <> 1 then return
parent.event ue_submit_report("BATCH", idw_def, idw_parms, idw_rpt, istr_parms.report_id  ) // hierarchy pointer
end event

type cb_resetcount from commandbutton within w_vzt_rpt_submitter
integer x = 1618
integer y = 1696
integer width = 370
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset Count"
end type

event clicked;if idw_def.rowcount() > 0 then 
	idw_def.SetItem( idw_def.getrow(), "parmcount", 0)
	idw_def.SetItem( idw_def.getrow(), "countstartdate", f_sysdate() )
	idw_def.SetItem( idw_def.getrow(), "averageruntime" , datetime( date('01/01/1960'), time("00:00:00") ))
	idw_def.groupcalc()
	parent.POST event ue_save_all()
End IF
end event

type cb_export from commandbutton within w_vzt_rpt_submitter
integer x = 1998
integer y = 1696
integer width = 206
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export"
end type

event clicked;istr_run_parms.mode = "EXPORT"
istr_run_parms.schedule_id = idw_def.object.dwdataobjectname [ idw_def.GetRow() ]
istr_run_parms.report_id = istr_parms.report_id // hierarchy pointer 
int li_rc 

openwithparm( w_vzt_rpt_processor, istr_run_parms )		

end event

type dw_exe_test from datawindow within w_vzt_rpt_submitter
boolean visible = false
integer x = 2551
integer y = 1636
integer width = 206
integer height = 60
integer taborder = 100
boolean bringtotop = true
string dataobject = "aaa_d_exe_test"
boolean border = false
boolean livescroll = true
end type

type cb_reload from commandbutton within w_vzt_rpt_submitter
integer x = 718
integer y = 1696
integer width = 105
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "rel"
end type

event clicked;datastore lds_reports, lds_parms, lds_hier
string ls_sql ='', ls_reportid
ls_sql ='' 
long 		ll_parmrow 


lds_reports = CREATE datastore
lds_parms	= CREATE datastore
lds_hier		= CREATE datastore

lds_reports.dataobject 	= 'd_exp_rptdef'
lds_parms.dataobject 	= 'd_exp_rptparms'
lds_hier.dataobject 		= 'd_exp_hier'

lds_reports.SetTransObject (SQLCA) 
lds_parms.SetTransObject (SQLCA) 
lds_hier.SetTransObject (SQLCA) 

lds_reports.Retrieve(ls_reportid) 
lds_parms.Retrieve(ls_reportid) 
lds_hier.Retrieve(ls_reportid) 

// REPORT
string reportid 
string userid1
string rtitle 
string keeplast 
string recurring
string windowname
string dwdataobjectname
string dwsyntax
string daytorunmon
string daytoruntue
string daytorunwed
string daytorunthu
string daytorunfri
string daytorunsat
string daytorunsun
string rptdesc
long 	 daystokeep
long 	 parmcount 
string securitylevel
datetime countstartdate
datetime averageruntime
string drilldownreportid
datetime timetorun
datetime timetorunend
string subtype
string distribution_list_id


reportid 				= lds_reports.GetItemString( 1, 'reportid')
userid1 					= lds_reports.GetItemString( 1, 'userid')
rtitle 					= lds_reports.GetItemString( 1, 'rtitle')
keeplast 				= lds_reports.GetItemString( 1, 'keeplast')
recurring				= lds_reports.GetItemString( 1, 'recurring')
windowname				= lds_reports.GetItemString( 1, 'windowname')
dwdataobjectname 		= lds_reports.GetItemString( 1, 'dwdataobjectname')
dwsyntax 				= ''
daytorunmon 			= lds_reports.GetItemString( 1, 'daytorunmon')
daytoruntue 			= lds_reports.GetItemString( 1, 'daytoruntue')
daytorunwed 			= lds_reports.GetItemString( 1, 'daytorunwed')
daytorunthu 			= lds_reports.GetItemString( 1, 'daytorunthu')
daytorunfri 			= lds_reports.GetItemString( 1, 'daytorunfri')
daytorunsat 			= lds_reports.GetItemString( 1, 'daytorunsat')
daytorunsun 			= lds_reports.GetItemString( 1, 'daytorunsun')
rptdesc 					= lds_reports.GetItemString( 1, 'rptdesc')
daystokeep  			= lds_reports.GetItemNumber( 1, 'daystokeep')
parmcount 				= lds_reports.GetItemNumber( 1, 'parmcount')
securitylevel 			= lds_reports.GetItemString( 1, 'securitylevel')
drilldownreportid  	= lds_reports.GetItemString( 1, 'drilldownreportid')
subtype  				= lds_reports.GetItemString( 1, 'subtype ')
distribution_list_id	= lds_reports.GetItemString( 1, 'distribution_list_id')

ls_sql = ls_sql + '~r~n' + ' INSERT INTO vzt_reportdef VALUES ( ' &
			+ " '" + reportid+ "' , " &   
			+ " '" + userid1 + "' , " &  
			+ " '" + rtitle + "' , " &  
			+ " '" + keeplast+ "' , " &   
  			+ " '" + recurring+ "' , " &     
         + " '" + windowname+ "' , " &     
         + " '" + dwdataobjectname+ "' , " &     
         + " '" + dwsyntax+ "' , " &     
         + " '" + daytorunmon+ "' , " &     
         + " '" + daytoruntue+ "' , " &     
         + " '" + daytorunwed+ "' , " &     
         + " '" + daytorunthu+ "' , " &     
         + " '" + daytorunfri+ "' , " &     
         + " '" + daytorunsat+ "' , " &     
         + " '" + daytorunsun+ "' , " &     
         + " '" + rptdesc+ "' , " &     
         + " " + string(daystokeep) + " , " &     
         + " " + string(parmcount) + " , " &     
         + " '" + securitylevel+ "' , " &     
         + " vzt_getdate() , " &     
         + " NULL ," &     
         + " '" + drilldownreportid + "' , " &     
         + " NULL , " &     
         + " NULL , " &     
         + " '" + subtype+ "' , " &     
         + " '" + distribution_list_id  &
			+ " ) " + "~r~n GO ~r~n" 

// PARAMETERS 			
string parmname
string parmvalue
datetime parmdate
string parmtype
string replacetype
string wheretag
string grouptag
decimal{2} parmnum 
string editmask
string lookuptype
string lookupprocessor
string autoreplace
string optionalcolumnvisible
long parmorder
string weblookup_do
string weblookup_code_colname
string weblookup_disp_colname
string weblookup_type
string queryname
string querydescr
string numeric_list
string usermod
string parmdescr
string use_descr


FOR ll_parmrow = 1 to lds_parms.RowCOunt()
	
reportid 					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'reportid') ,'') 
parmname						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'parmname') ,'')    
parmvalue					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'parmvalue') ,'')    
parmdate						= lds_parms.GetItemDatetime( ll_parmrow, 'parmdate')    
parmtype						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'parmtype') ,'')    
replacetype					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'replacetype') ,'')    
wheretag						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'wheretag') ,'')    
grouptag						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'grouptag') ,'')    
parmnum						= f_nvl( lds_parms.GetItemNumber( ll_parmrow, 'parmnum') ,0)    
editmask						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'editmask') ,'')    
lookuptype					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'lookuptype') ,'')    
lookupprocessor			= f_nvl( lds_parms.GetItemString( ll_parmrow, 'lookupprocessor') ,'')    
autoreplace					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'autoreplace') ,'')    
optionalcolumnvisible	= f_nvl( lds_parms.GetItemString( ll_parmrow, 'optionalcolumnvisible') ,'')    
parmorder					= f_nvl( lds_parms.GetItemNumber( ll_parmrow, 'parmorder') ,0)    
weblookup_do				= f_nvl( lds_parms.GetItemString( ll_parmrow, 'weblookup_do') ,'')    
weblookup_code_colname	= f_nvl( lds_parms.GetItemString( ll_parmrow, 'weblookup_code_colname') ,'')    
weblookup_disp_colname	= f_nvl( lds_parms.GetItemString( ll_parmrow, 'weblookup_disp_colname') ,'')    
weblookup_type				= f_nvl( lds_parms.GetItemString( ll_parmrow, 'weblookup_type') ,'')    
userid1						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'userid') ,'')    
queryname					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'queryname') ,'')    
querydescr					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'querydescr') ,'')    
numeric_list				= f_nvl( lds_parms.GetItemString( ll_parmrow, 'numeric_list') ,'')    
usermod  					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'usermod') ,'') 
parmdescr 					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'parmdescr') ,'') 
use_descr					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'use_descr') ,'') 

ls_sql = ls_sql + '~r~n' + ' INSERT INTO vzt_reportdefparms VALUES ( ' &
+ " '" +  reportid + "' , " &    
+ " '" +  parmname + "' , " &    
+ " '" +  parmvalue + "' , " &    
+ " vzt_date( '"+ string(parmdate,'YYYY-MM-DD') + "), " &    
+ " '" +  parmtype + "' , " &    
+ " '" +  replacetype + "' , " &    
+ " '" +  wheretag + "' , " & 
+ " '" +  grouptag + "' , " &    
+ " " +   string( parmnum  )+ " , " &    
+ " '" +  editmask  + "' , " &    
+ " '" +  lookuptype + "' , " &    
+ " '" +  lookupprocessor + "' , " &    
+ " '" +  autoreplace + "' , " &    
+ " '" +  optionalcolumnvisible + "' , " &    
+ " '" +  string(parmorder ) + " , " &    
+ " '" +  weblookup_do  + "' , " &
+ " '" +  weblookup_code_colname  + "' , " &    
+ " '" +  weblookup_disp_colname + "' , " &    
+ " '" +  weblookup_type + "' , " &    
+ " '" +  userid1 + "' , " &    
+ " '" +  queryname + "' , " &    
+ " '" +  querydescr + "' , " &    
+ " '" +  numeric_list  + "' , " &    
+ " '" +  usermod  + "', " &    
+ " '" +  parmdescr  + "', " &    
+ " '" +  use_descr  + "' " &    
			+ " ) " + "~r~n GO ~r~n" 
NEXT 
// HIERARCHY


end event

