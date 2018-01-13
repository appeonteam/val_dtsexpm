$PBExportHeader$w_vzt_mm_report_def_gr.srw
forward
global type w_vzt_mm_report_def_gr from w_vzt_rpt_base
end type
type dw_schedule from uo_vzt_dwbase within w_vzt_mm_report_def_gr
end type
type cb_run_online from commandbutton within w_vzt_mm_report_def_gr
end type
type dw_exe_test from datawindow within w_vzt_mm_report_def_gr
end type
type cb_rungroup from commandbutton within w_vzt_mm_report_def_gr
end type
type cb_reload from commandbutton within w_vzt_mm_report_def_gr
end type
end forward

global type w_vzt_mm_report_def_gr from w_vzt_rpt_base
int Width=2615
int Height=1892
boolean TitleBar=true
string Title="Questionnaire Graphs"
dw_schedule dw_schedule
cb_run_online cb_run_online
dw_exe_test dw_exe_test
cb_rungroup cb_rungroup
cb_reload cb_reload
end type
global w_vzt_mm_report_def_gr w_vzt_mm_report_def_gr

type variables
str_reporter_reportparms  istr_parms, istr_run_parms
uo_vzt_dwbase idw_def,  idw_parms, idw_rpt
string 	is_leafind, is_grouping, is_report
end variables

on w_vzt_mm_report_def_gr.create
int iCurrent
call super::create
this.dw_schedule=create dw_schedule
this.cb_run_online=create cb_run_online
this.dw_exe_test=create dw_exe_test
this.cb_rungroup=create cb_rungroup
this.cb_reload=create cb_reload
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_schedule
this.Control[iCurrent+2]=this.cb_run_online
this.Control[iCurrent+3]=this.dw_exe_test
this.Control[iCurrent+4]=this.cb_rungroup
this.Control[iCurrent+5]=this.cb_reload
end on

on w_vzt_mm_report_def_gr.destroy
call super::destroy
destroy(this.dw_schedule)
destroy(this.cb_run_online)
destroy(this.dw_exe_test)
destroy(this.cb_rungroup)
destroy(this.cb_reload)
end on

event open;call super::open;//// determine what kind of call this is 
//istr_parms = Message.PowerObjectParm
//If not IsValid ( istr_parms) then 
//	MessageBox("Report Error", "Missing parameters.", StopSign! )
//	POST close(this) 
//	return
//End If

is_accessflags = 'R'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

string 	ls_newsql
long 		ll_rc
string 	ls_outputid

If POS(is_accessflags, 'A' ) <= 0 or gnv_appman.is_debugmode <> 'Y' then 
	cb_reload.visible = false
END IF

ib_closebtn_on_right = false
this.visible =  false

if isValid(im_menu) then
	im_menu.m_file.m_saveas.visible 			= false
	im_menu.m_file.m_printpreview.visible 	= false
	im_menu.m_file.m_dash11.visible 			= false
	im_menu.m_file.m_open.visible 			= false
	im_menu.m_file.m_print.visible 			= false
	im_menu.m_file.m_printall.visible 		= false
	im_menu.m_file.m_pagesetup.visible 		= false
End If

tab_1.Openpage( "uo_vzt_mm_tabpage_parms"   )
idw_parms = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Parameters", "", 0, tab_1)
ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = idw_parms 
idw_parms.Object.DataWindow.header.Height = 0

If POS(is_accessflags, 'W' ) <= 0 then 
	dw_mainlist.hscrollbar = false 
	
//	idw_parms.object.parmname.TabSequence = 0
//	idw_parms.object.reportid_t.visible = false
//	idw_parms.object.parmtype.visible = false
//	idw_parms.object.parmtype_t.visible = false
//	idw_parms.object.autoreplace.visible = false
//
//	idw_parms.object.wheretag.visible = false
//	idw_parms.object.wheretag_t.visible = false
//	idw_parms.object.grouptag.visible = false
//	idw_parms.object.grouptag_t.visible = false
//	idw_parms.object.reportid.visible = false
//	idw_parms.object.id_t.visible = false
////	idw_parms.object.cb_search.visible = false
//	idw_parms.object.lookuptype_t.visible = false
//	idw_parms.object.lookuptype.visible = false
//	idw_parms.object.lookupprocessor_t.visible = false
//	idw_parms.object.lookupprocessor.visible = false
//	idw_parms.object.editmask_t.visible = false
//	idw_parms.object.editmask.visible = false
	if isValid(im_menu) then			
		im_menu.m_file.m_new.visible = false
		im_menu.m_file.m_delete.visible = false
		im_menu.m_file.m_save.visible = false	
	end if
 	cb_save.visible = false
 
	
End If 

tab_1.Openpage( "uo_vzt_mm_tabpage_def"  ) 
idw_def = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
idw_def.dataobject = dw_mainlist.dataobject // 'd_qgen_std_rpt_list_h'
idw_def.SetTransObject( SQLCA)

tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Definition", "", 0, tab_1)
tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = false
//If POS(_accessflags, 'W' ) <= 0 then 
//	tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = false
//	idw_def.Object.Datawindow.readonly="YES"
//
//	idw_def.object.drilldownreportid.visible 	= false
//	idw_def.object.drilldownreportid_t.visible= false
//	idw_def.object.c_rancount.visible 			= false
//	idw_def.object.timetorun.visible 			= false
//	idw_def.object.timetorunend.visible 		= false
//	idw_def.object.timetorun_t.visible 			= false
//	idw_def.object.timetorunend_t.visible 		= false	
//	idw_def.object.daystokeep.visible 			= false 
//	idw_def.object.daystokeep_t.visible 		= false 
//	idw_def.object.daystokeep_t1.visible 		= false 		
//	idw_def.object.keeplast.visible 				= false 
//	idw_def.object.keeplast_t.visible 			= false 
//	idw_def.object.recurring_t.visible 			= false 
//	idw_def.object.recurring.visible 			= false 
//	idw_def.object.daytorunmon.visible 			= false 
//	idw_def.object.daytorunmon_t.visible 		= false 
//	idw_def.object.daytoruntue.visible 			= false 
//	idw_def.object.daytoruntue_t.visible 		= false 
//	idw_def.object.daytorunwed.visible 			= false 
//	idw_def.object.daytorunwed_t.visible 		= false 
//	idw_def.object.daytorunthu.visible 			= false 
//	idw_def.object.daytorunthu_t.visible 		= false 
//	idw_def.object.daytorunfri.visible 			= false 
//	idw_def.object.daytorunfri_t.visible 		= false 
//	idw_def.object.daytorunsat.visible 			= false 
//	idw_def.object.daytorunsat_t.visible 		= false 
//	idw_def.object.daytorunsun.visible 			= false 
//	idw_def.object.daytorunsun_t.visible 		= false 
//	idw_def.object.userid.visible 				= false 
//	idw_def.object.userid_t.visible 				= false 
//	idw_def.object.securitylevel.visible 		= false 
//	idw_def.object.securitylevel_t.visible 	= false 
//	idw_def.object.dwdataobjectname.visible 	= false 
//	idw_def.object.dwdataobjectname_t.visible = false 
//
//Else
//
//	idw_def.Object.Datawindow.readonly="NO"
//	idw_def.object.timetorun.visible 			= true
//	idw_def.object.timetorunend.visible 		= true
//	idw_def.object.timetorun_t.visible 			= true
//	idw_def.object.timetorunend_t.visible 		= true
//	idw_def.object.daystokeep.visible 			= true
//	idw_def.object.daystokeep_t.visible 		= true
//	idw_def.object.daystokeep_t1.visible 		= true
//	idw_def.object.keeplast.visible 				= true  
//	idw_def.object.keeplast_t.visible 			= true 
//	idw_def.object.recurring_t.visible 			= true 
//	idw_def.object.recurring.visible 			= true 
//	idw_def.object.daytorunmon.visible 			= true 
//	idw_def.object.daytorunmon_t.visible 		= true 
//	idw_def.object.daytoruntue.visible 			= true 
//	idw_def.object.daytoruntue_t.visible 		= true 
//	idw_def.object.daytorunwed.visible 			= true 
//	idw_def.object.daytorunwed_t.visible 		= true 
//	idw_def.object.daytorunthu.visible 			= true 
//	idw_def.object.daytorunthu_t.visible 		= true 
//	idw_def.object.daytorunfri.visible 			= true 
//	idw_def.object.daytorunfri_t.visible 		= true 
//	idw_def.object.daytorunsat.visible 			= true 
//	idw_def.object.daytorunsat_t.visible 		= true 
//	idw_def.object.daytorunsun.visible 			= true 
//	idw_def.object.daytorunsun_t.visible 		= true 
//	idw_def.object.userid.visible 				= true 
//	idw_def.object.userid_t.visible 				= true 
//	idw_def.object.securitylevel.visible 		= true 
//	idw_def.object.securitylevel_t.visible 	= true 
//	idw_def.object.dwdataobjectname.visible 	= true 
//	idw_def.object.dwdataobjectname_t.visible = true 	
//	
//	 
//End If 
//

ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = idw_def 

dw_primary = idw_def 
dw_primary_list = dw_mainlist

tab_1.Openpage( "uo_tabpage_dw"  )
idw_rpt = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Report", "", 0)
tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible= false

ll_rc = dw_mainlist.Retrieve( )  // retrieve all reports 
dw_mainlist.resetupdate()
if dw_mainlist.ShareData( idw_def) <> 1 then MessageBox('VZT Rpt Share Error', 'Failed on Report list and Report Def.', Stopsign!)

this.visible =  true 


end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_run_online.y 	= newheight - ii_resizeband_y - cb_run_online.height
		cb_rungroup.y 		= newheight - ii_resizeband_y - cb_rungroup.height

		cb_reload.y 		= newheight - ii_resizeband_y - cb_reload.height
	
//		dw_mainlist.width = newwidth  - dw_mainlist.x * 2 		
//		If newwidth > 2634 then 
//			cb_close.x = newwidth - cb_close.width - ii_resizeband_x
//		End If 
	End IF 
End IF 	
end event

event ue_postopen_01;//override
end event

event ue_save_review_check;call super::ue_save_review_check;//
If ii_savestatus = -1 then return 
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

event ue_assign_menu;//overr
end event

type dw_mainlist from w_vzt_rpt_base`dw_mainlist within w_vzt_mm_report_def_gr
int X=14
int Width=2107
int Height=512
int TabOrder=150
boolean Visible=true
string DataObject="d_qgen_std_rpt_list_h"
boolean HScrollBar=true
end type

event dw_mainlist::rowfocuschanged;call super::rowfocuschanged;If currentrow > 0 and currentrow <= this.RowCount() then 
	SetPointer( hourglass! )
	idw_rpt.dataobject = 'd_empty'	
	istr_parms.report_id = this.object.hier_id [ currentrow] 
	is_leafind				= this.object.vzt_hierarchy_leafind [ currentrow] 
	is_grouping 			= this.object.grouping [ currentrow]
	is_report				= this.object.reportid [ currentrow]
	
	if is_leafind = 'G' then 
		cb_run_online.text = '&Run Group' 
		idw_parms.visible = true
		cb_run_online.enabled = true
	Elseif is_leafind = 'Y'	then 
		cb_run_online.text = '&Run' 
		cb_run_online.enabled = true
		idw_parms.visible = true
	Elseif isNull( is_report) then 
		cb_run_online.enabled = false 
		idw_parms.visible = false
	Else
	END IF 
	
	long ll_parmrows, ll_qrow  
	ll_parmrows = idw_parms.Retrieve( trim(is_report ), trim(is_accessflags), 'SYS', 'DEFAULT' )
	
	// Set question parm automatically
	If ll_parmrows > 0 then
		string ls_expr, ls_questionid
		ls_questionid	= string( this.object.questionid [ currentrow])
		ls_expr = 'POS(upper(parmname), "QUESTION") > 0'  
		ll_qrow = idw_parms.Find( ls_expr, 1, ll_parmrows)
		If ll_qrow > 0 then idw_parms.SetItem( ll_qrow , 'parmvalue', ls_questionid	)
		tab_1.tabpage[ 1 ].event dynamic ue_set_questionid ( ls_questionid )
	END IF
	idw_parms.fkeyvals[1] = trim(is_report)
	
End IF
end event

type cb_close from w_vzt_rpt_base`cb_close within w_vzt_mm_report_def_gr
int X=590
int Y=1708
end type

type cb_save from w_vzt_rpt_base`cb_save within w_vzt_mm_report_def_gr
int X=27
int Y=1708
int Width=343
int TabOrder=120
string Text="Sa&ve Parms"
end type

event cb_save::clicked;//overr
dw_primary.RefreshDataObject()
call super::clicked 
end event

type cb_select from w_vzt_rpt_base`cb_select within w_vzt_mm_report_def_gr
int X=2619
int Y=1324
int TabOrder=100
end type

type cb_new from w_vzt_rpt_base`cb_new within w_vzt_mm_report_def_gr
int X=2574
int Y=1540
int TabOrder=140
end type

type cb_newsearch from w_vzt_rpt_base`cb_newsearch within w_vzt_mm_report_def_gr
int X=311
int Y=1660
int TabOrder=80
end type

type cb_search from w_vzt_rpt_base`cb_search within w_vzt_mm_report_def_gr
int X=416
int Y=1660
int TabOrder=70
boolean Visible=false
end type

type st_foundrecs from w_vzt_rpt_base`st_foundrecs within w_vzt_mm_report_def_gr
int X=2615
int Y=1232
boolean BringToTop=true
end type

type st_stop from w_vzt_rpt_base`st_stop within w_vzt_mm_report_def_gr
int X=3593
boolean BringToTop=true
end type

type dw_data from w_vzt_rpt_base`dw_data within w_vzt_mm_report_def_gr
int X=2875
int Y=1500
int TabOrder=40
end type

type dw_print from w_vzt_rpt_base`dw_print within w_vzt_mm_report_def_gr
int X=3237
int Y=1596
int TabOrder=170
boolean BringToTop=true
end type

type uo_zoom from w_vzt_rpt_base`uo_zoom within w_vzt_mm_report_def_gr
int X=2149
int Y=1604
int TabOrder=130
boolean Visible=false
end type

type cbx_preview from w_vzt_rpt_base`cbx_preview within w_vzt_mm_report_def_gr
boolean BringToTop=true
end type

type tab_1 from w_vzt_rpt_base`tab_1 within w_vzt_mm_report_def_gr
event type integer ue_refresh_ddparms ( string as_reportid )
int X=14
int Y=528
int Height=1148
int TabOrder=60
boolean BringToTop=true
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

type dw_schedule from uo_vzt_dwbase within w_vzt_mm_report_def_gr
int X=2610
int Y=48
int Width=1586
int Height=436
int TabOrder=20
boolean Visible=false
string DataObject="d_schedule"
BorderStyle BorderStyle=StyleBox!
boolean HScrollBar=true
boolean VScrollBar=true
boolean Resizable=true
end type

event constructor;call super::constructor;ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = this 
end event

type cb_run_online from commandbutton within w_vzt_mm_report_def_gr
int X=379
int Y=1708
int Width=201
int Height=76
int TabOrder=160
boolean BringToTop=true
string Text="&Run"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if is_leafind = 'G' then
	long 		ll_srow, ll_row
	boolean 	lb_done
	string	ls_grouping, ls_name, ls_report
	ll_srow	= dw_mainlist.GetRow()  
	ll_row	= ll_srow 
	if idw_parms.AcceptText() <> 1 then return
	ib_scrolling = true 
	SetPOinter(HOurglass!)
	Do while not lb_done
			ll_row = ll_row + 1
			if ll_row > idw_def.RowCount() then exit
			ls_grouping = dw_mainlist.object.grouping [ ll_row]
			ls_name		= dw_mainlist.object.vzt_hierarchy_name [ ll_row]
			if ls_grouping <> is_grouping then lb_done = true  // end of group
			If not lb_done then 
				idw_def.SetRow(	ll_row ) 
				ls_report = idw_def.object.hier_id [ ll_row] 
				parent.event ue_submit_report("ONLINES", idw_def, idw_parms, idw_rpt, ls_report  ) // hierarchy pointer
				EXIT
			End If 
			//if ll_row - ll_srow > 5 then lb_done = true 
	Loop
	ib_scrolling = false 
Else
	if isValid(m_gcc_main) then
		m_gcc_main.m_file.m_print.enabled = true
		m_gcc_main.m_file.m_printscreen.enabled = true
	end if
	parent.event ue_submit_report("ONLINES", idw_def, idw_parms, idw_rpt, istr_parms.report_id  ) // hierarchy pointer
END IF

end event

type dw_exe_test from datawindow within w_vzt_mm_report_def_gr
int X=2551
int Y=1636
int Width=206
int Height=60
int TabOrder=90
boolean Visible=false
boolean BringToTop=true
string DataObject="aaa_d_exe_test"
boolean Border=false
boolean LiveScroll=true
end type

type cb_rungroup from commandbutton within w_vzt_mm_report_def_gr
int X=594
int Y=1708
int Width=389
int Height=76
int TabOrder=50
boolean Visible=false
boolean BringToTop=true
string Text="Run Group"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;	long 		ll_srow, ll_row, ll_count=0
	boolean 	lb_done
	string	ls_group, ls_name, ls_report, ls_cgroup, ls_question
	ll_srow	= dw_mainlist.GetRow()  
	ll_row	= ll_srow 
	ib_scrolling = true 
	ls_group = trim(f_nvl(dw_mainlist.object.hqset [ ll_row],''))
	SetPOinter(HOurglass!)
	Do while not lb_done
			ll_count = ll_count + 1
			ll_row = ll_row + 1
			if ll_row > idw_def.RowCount() then exit
			ls_cgroup 	= trim(f_nvl(dw_mainlist.object.hqset [ ll_row],''))
			ls_name		= trim( dw_mainlist.object.vzt_hierarchy_name [ ll_row])
			ls_question	= trim( dw_mainlist.object.questiontxt [ ll_row])
			if ls_group <> ls_cgroup then lb_done = true  // end of group
			If not lb_done then 
				idw_def.SetRow(	ll_row ) 
				ls_report = idw_def.object.hier_id [ ll_row] 
				w_main.SetMicroHelp( string(ll_count) + ' Submitting ' + ls_question+'('+ls_name+')'	) 				
				MessageBox('Status', string(ll_count) + ' Submitting ' + ls_question+'('+ls_name+')'	) 				
				Yield ( )
				parent.event ue_submit_report("ONLINES", idw_def, idw_parms, idw_rpt, ls_report  ) // hierarchy pointer
				MessageBox('sss', 'a')
				Yield ( )
			End If 
			if ll_count > 5 then lb_done = true 
	Loop
	ib_scrolling = false 

end event

type cb_reload from commandbutton within w_vzt_mm_report_def_gr
int X=1353
int Y=1696
int Width=133
int Height=76
int TabOrder=70
boolean BringToTop=true
string Text="Rel"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;datastore lds_reports, lds_parms, lds_hier
string ls_sql ='', ls_reportid
ls_sql ='' 
long 		ll_parmrow 

ls_reportid = is_report

if trim(f_nvl(ls_reportid,'')) = '' then return 

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
string userid 
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

reportid 				= f_nvl( lds_reports.GetItemString( 1, 'reportid') ,'')
userid 					= f_nvl( lds_reports.GetItemString( 1, 'userid') ,'')
rtitle 					= f_nvl( lds_reports.GetItemString( 1, 'rtitle') ,'')
keeplast 				= f_nvl( lds_reports.GetItemString( 1, 'keeplast') ,'')
recurring				= f_nvl( lds_reports.GetItemString( 1, 'recurring') ,'')
windowname				= f_nvl( lds_reports.GetItemString( 1, 'windowname') ,'')
dwdataobjectname 		= f_nvl( lds_reports.GetItemString( 1, 'dwdataobjectname') ,'')
dwsyntax 				= ''
daytorunmon 			= f_nvl( lds_reports.GetItemString( 1, 'daytorunmon') ,'')
daytoruntue 			= f_nvl( lds_reports.GetItemString( 1, 'daytoruntue') ,'')
daytorunwed 			= f_nvl( lds_reports.GetItemString( 1, 'daytorunwed') ,'')
daytorunthu 			= f_nvl( lds_reports.GetItemString( 1, 'daytorunthu') ,'')
daytorunfri 			= f_nvl( lds_reports.GetItemString( 1, 'daytorunfri') ,'')
daytorunsat 			= f_nvl( lds_reports.GetItemString( 1, 'daytorunsat') ,'')
daytorunsun 			= f_nvl( lds_reports.GetItemString( 1, 'daytorunsun') ,'')
rptdesc 					= f_nvl( lds_reports.GetItemString( 1, 'rptdesc') ,'')
daystokeep  			= f_nvl( lds_reports.GetItemNumber( 1, 'daystokeep') ,7)
parmcount 				= f_nvl( lds_reports.GetItemNumber( 1, 'parmcount') ,0)
securitylevel 			= f_nvl( lds_reports.GetItemString( 1, 'securitylevel') ,'01')
drilldownreportid  	= f_nvl( lds_reports.GetItemString( 1, 'drilldownreportid') ,'')
subtype  				= f_nvl( lds_reports.GetItemString( 1, 'subtype') ,'')
distribution_list_id	= f_nvl( lds_reports.GetItemString( 1, 'distribution_list_id') ,'')

ls_sql = ls_sql + '~r~n' + ' INSERT INTO vzt_reportdef VALUES ( ' &
			+ " '" + reportid+ "' , " &   
			+ " '" + userid + "' , " &  
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
         + " '" + distribution_list_id +"' " &
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


If lds_parms.RowCount() > 0 then 

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
userid						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'userid') ,'')    
queryname					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'queryname') ,'')    
querydescr					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'querydescr') ,'')    
numeric_list				= f_nvl( lds_parms.GetItemString( ll_parmrow, 'numeric_list') ,'')    
usermod  					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'usermod') ,'') 

ls_sql = ls_sql + '~r~n' + ' INSERT INTO vzt_reportdefparms VALUES ( ' &
+ " '" +  reportid + "' , " &    
+ " '" +  parmname + "' , " &    
+ " '" +  parmvalue + "' , " &    
+ " vzt_date( '"+ string(parmdate,'YYYY-MM-DD') + "'), " &    
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
+ " " +  string(parmorder ) + " , " &    
+ " '" +  weblookup_do  + "' , " &
+ " '" +  weblookup_code_colname  + "' , " &    
+ " '" +  weblookup_disp_colname + "' , " &    
+ " '" +  weblookup_type + "' , " &    
+ " '" +  userid + "' , " &    
+ " '" +  queryname + "' , " &    
+ " '" +  querydescr + "' , " &    
+ " '" +  numeric_list  + "' , " &    
+ " '" +  usermod  + "' " &    
			+ " ) " + "~r~n GO ~r~n" 
NEXT 
END IF // no parms

// HIERARCHY
string id   
string parent_id   
string name   
long 		orderingroup   
string treetype   
string leafind   
string descr   
double present_id   
double graphic_id   
string nodetype   
long flatorder   
string top_parent_node  

id 						= f_nvl( lds_hier.GetItemString( 1, 'id') ,'')   
parent_id 				= f_nvl( lds_hier.GetItemString( 1, 'parent_id') ,'')    
name 						= f_nvl( lds_hier.GetItemString( 1, 'name') ,'')    
orderingroup 			= f_nvl( lds_hier.GetItemNumber( 1, 'orderingroup') ,0)    
treetype 				= f_nvl( lds_hier.GetItemString( 1, 'treetype') ,'')    
leafind 					= f_nvl( lds_hier.GetItemString( 1, 'leafind') ,'')    
reportid 				= f_nvl( lds_hier.GetItemString( 1, 'reportid') ,'')    
descr 					= f_nvl( lds_hier.GetItemString( 1, 'descr') ,'')    
present_id 				= f_nvl( lds_hier.GetItemNumber( 1, 'present_id') ,0)    
graphic_id 				= f_nvl( lds_hier.GetItemNumber( 1, 'graphic_id') ,0)    
nodetype 				= f_nvl( lds_hier.GetItemString( 1, 'nodetype') ,'')    
distribution_list_id = f_nvl( lds_hier.GetItemString( 1, 'distribution_list_id') ,'')    
flatorder 				= f_nvl( lds_hier.GetItemNumber( 1, 'flatorder') ,0)    
top_parent_node 		= f_nvl( lds_hier.GetItemString( 1, 'top_parent_node') ,'') 

ls_sql = ls_sql + '~r~n' + ' INSERT INTO vzt_hierarchy VALUES ( ' &
+ " '" +  id+ "' , " &       
+ " '" +  parent_id+ "' , " &       
+ " '" +  name + "' , " &       
+ "  " +  string(orderingroup) + " , " &       
+ " '" +  treetype + "' , " &       
+ " '" +  leafind + "' , " &       
+ " '" +  reportid + "' , " &       
+ " '" +  descr + "' , " &       
+ "  " +  string(present_id) + " , " &       
+ "  " +  string(graphic_id) + " , " &       
+ " '" +  nodetype + "' , " &       
+ " '" +  distribution_list_id + "' , " &       
+ "  " +  string(flatorder) + " , " &       
+ " '" +  top_parent_node   + " ' " &
+ " ) " + "~r~n GO ~r~n" 

clipboard( ls_sql )

MessageBox( 'sql:', ls_sql)
end event

