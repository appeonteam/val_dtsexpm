$PBExportHeader$w_qgen_report_def.srw
forward
global type w_qgen_report_def from w_vzt_rpt_base
end type
type dw_schedule from uo_vzt_dwbase within w_qgen_report_def
end type
type cb_run_online from commandbutton within w_qgen_report_def
end type
type dw_exe_test from datawindow within w_qgen_report_def
end type
end forward

global type w_qgen_report_def from w_vzt_rpt_base
int Width=2615
int Height=1892
boolean TitleBar=true
string Title="Questionnaire Graphs"
dw_schedule dw_schedule
cb_run_online cb_run_online
dw_exe_test dw_exe_test
end type
global w_qgen_report_def w_qgen_report_def

type variables
str_reporter_reportparms  istr_parms, istr_run_parms
uo_vzt_dwbase idw_def,  idw_parms, idw_rpt
string 	is_leafind, is_grouping, is_report
end variables

on w_qgen_report_def.create
int iCurrent
call super::create
this.dw_schedule=create dw_schedule
this.cb_run_online=create cb_run_online
this.dw_exe_test=create dw_exe_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_schedule
this.Control[iCurrent+2]=this.cb_run_online
this.Control[iCurrent+3]=this.dw_exe_test
end on

on w_qgen_report_def.destroy
call super::destroy
destroy(this.dw_schedule)
destroy(this.cb_run_online)
destroy(this.dw_exe_test)
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

tab_1.Openpage( "uo_qgen_tabpage_parms"   )
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

tab_1.Openpage( "uo_qgen_tabpage_def"  ) 
idw_def = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
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
		
	//	dw_mainlist.width = newwidth  - dw_mainlist.x * 2 		
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

type dw_mainlist from w_vzt_rpt_base`dw_mainlist within w_qgen_report_def
int X=14
int Y=8
int Width=2107
int Height=512
int TabOrder=140
boolean Visible=true
string DataObject="d_qgen_std_rpt_list"
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
		cb_run_online.text = 'Run Group' 
		idw_parms.visible = true
		cb_run_online.enabled = true
	Elseif is_leafind = 'Y'	then 
		cb_run_online.text = 'Run' 
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

type cb_close from w_vzt_rpt_base`cb_close within w_qgen_report_def
int X=599
int Y=1696
end type

type cb_delete1 from w_vzt_rpt_base`cb_delete1 within w_qgen_report_def
int TabOrder=100
end type

type cb_save from w_vzt_rpt_base`cb_save within w_qgen_report_def
int X=27
int Y=1696
int Width=343
int TabOrder=110
string Text="Sa&ve Parms"
end type

event cb_save::clicked;//overr
dw_primary.RefreshDataObject()
call super::clicked 
end event

type cb_select from w_vzt_rpt_base`cb_select within w_qgen_report_def
int X=2619
int Y=1320
int TabOrder=90
end type

type cb_new from w_vzt_rpt_base`cb_new within w_qgen_report_def
int X=2574
int Y=1540
int TabOrder=130
end type

type cb_newsearch from w_vzt_rpt_base`cb_newsearch within w_qgen_report_def
int X=311
int Y=1660
int TabOrder=70
end type

type cb_search from w_vzt_rpt_base`cb_search within w_qgen_report_def
int X=416
int Y=1660
int TabOrder=60
boolean Visible=false
end type

type st_foundrecs from w_vzt_rpt_base`st_foundrecs within w_qgen_report_def
int X=2615
int Y=1232
boolean BringToTop=true
end type

type st_stop from w_vzt_rpt_base`st_stop within w_qgen_report_def
int X=3593
boolean BringToTop=true
end type

type dw_data from w_vzt_rpt_base`dw_data within w_qgen_report_def
int X=2875
int Y=1500
int TabOrder=40
end type

type dw_print from w_vzt_rpt_base`dw_print within w_qgen_report_def
int X=3237
int Y=1596
int TabOrder=160
boolean BringToTop=true
end type

type uo_zoom from w_vzt_rpt_base`uo_zoom within w_qgen_report_def
int X=2149
int Y=1604
int TabOrder=120
boolean Visible=false
end type

type cbx_preview from w_vzt_rpt_base`cbx_preview within w_qgen_report_def
boolean BringToTop=true
end type

type tab_1 from w_vzt_rpt_base`tab_1 within w_qgen_report_def
event type integer ue_refresh_ddparms ( string as_reportid )
int X=14
int Y=528
int Height=1148
int TabOrder=50
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

type dw_schedule from uo_vzt_dwbase within w_qgen_report_def
int X=2606
int Y=48
int Width=1582
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

type cb_run_online from commandbutton within w_qgen_report_def
int X=389
int Y=1696
int Width=192
int Height=72
int TabOrder=150
boolean BringToTop=true
string Text="Run "
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
				
			End If 
			//if ll_row - ll_srow > 5 then lb_done = true 
	Loop
	ib_scrolling = false 
Else
	parent.event ue_submit_report("ONLINES", idw_def, idw_parms, idw_rpt, istr_parms.report_id  ) // hierarchy pointer
END IF

end event

type dw_exe_test from datawindow within w_qgen_report_def
int X=2551
int Y=1636
int Width=206
int Height=60
int TabOrder=80
boolean Visible=false
boolean BringToTop=true
string DataObject="aaa_d_exe_test"
boolean Border=false
boolean LiveScroll=true
end type

