$PBExportHeader$w_vzt_mm_report_def.srw
forward
global type w_vzt_mm_report_def from w_vzt_rpt_base
end type
type dw_schedule from uo_vzt_dwbase within w_vzt_mm_report_def
end type
type cb_run_online from commandbutton within w_vzt_mm_report_def
end type
type dw_exe_test from datawindow within w_vzt_mm_report_def
end type
type cb_reload from commandbutton within w_vzt_mm_report_def
end type
end forward

global type w_vzt_mm_report_def from w_vzt_rpt_base
integer width = 2126
integer height = 1892
string title = "GCC Reports and Graphs"
dw_schedule dw_schedule
cb_run_online cb_run_online
dw_exe_test dw_exe_test
cb_reload cb_reload
end type
global w_vzt_mm_report_def w_vzt_mm_report_def

type variables
str_reporter_reportparms  istr_parms, istr_run_parms
uo_vzt_dwbase idw_def,  idw_parms, idw_rpt
string 	is_leafind, is_grouping, is_report
end variables

on w_vzt_mm_report_def.create
int iCurrent
call super::create
this.dw_schedule=create dw_schedule
this.cb_run_online=create cb_run_online
this.dw_exe_test=create dw_exe_test
this.cb_reload=create cb_reload
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_schedule
this.Control[iCurrent+2]=this.cb_run_online
this.Control[iCurrent+3]=this.dw_exe_test
this.Control[iCurrent+4]=this.cb_reload
end on

on w_vzt_mm_report_def.destroy
call super::destroy
destroy(this.dw_schedule)
destroy(this.cb_run_online)
destroy(this.dw_exe_test)
destroy(this.cb_reload)
end on

event open;call super::open;//// determine what kind of call this is 
//istr_parms = Message.PowerObjectParm
//If not IsValid ( istr_parms) then 
//	MessageBox("Report Error", "Missing parameters.", StopSign! )
//	POST close(this) 
//	return
//End If

//is_accessflags = 'R'
//if npassuserrights >= 9 then is_accessflags = 'WRA'
//gnv_appman.is_userid = cPassUserName
is_accessflags = gnv_appman.event ue_getuserrights('','')

ib_closebtn_on_right= false

string 	ls_newsql
long 		ll_rc
string 	ls_outputid

this.visible =  false
//_resizeenabled = false
if isValid(im_menu) then
	im_menu.m_file.m_saveas.visible 			= false
	im_menu.m_file.m_printpreview.visible 	= false
	im_menu.m_file.m_dash11.visible 			= false
	im_menu.m_file.m_open.visible 			= false
	im_menu.m_file.m_print.visible 			= false
	im_menu.m_file.m_printall.visible 		= false
	im_menu.m_file.m_pagesetup.visible 		= false
End If

tab_1.Openpage( "uo_vzt_mm_tabpage_parms" , is_accessflags )
idw_parms = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Parameters", "", 0, tab_1)
ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = idw_parms 
idw_parms.Object.DataWindow.header.Height = 0

If POS(is_accessflags, 'A' ) <= 0 or gnv_appman.is_debugmode <> 'Y' then 
	cb_reload.visible = false
END IF

If POS(is_accessflags, 'W' ) <= 0 then 
	dw_mainlist.hscrollbar = false 
//	
	idw_parms.object.parmname.TabSequence = 0
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

tab_1.Openpage( "uo_vzt_mm_tabpage_def" , is_accessflags ) 
idw_def = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Definition", "", 0, tab_1)
tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = false // gcc no def 


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
//if dw_mainlist.ShareData( idw_def) <> 1 then MessageBox('VZT Rpt Share Error', 'Failed on Report list and Report Def.', Stopsign!)

this.visible =  true 


end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_run_online.y 	= newheight - ii_resizeband_y - cb_run_online.height
		cb_reload.y 		= newheight - ii_resizeband_y - cb_reload.height
		
//	//	dw_mainlist.width = newwidth  - dw_mainlist.x * 2 		
//		If newwidth > 2634 then 
//			cb_close.x = newwidth - cb_close.width - ii_resizeband_x
//		End If 
	End IF 
End IF 	
end event

event ue_postopen_01;//override
end event

event ue_save_review_check;//overr
If ii_savestatus < 5  then return //only rebuild on request from alec
string  	ls_temp ,  ls_repid, ls_syntax
long 		ll_len, ll_next = 1, ll_rc
string 	ls_rpt_do='' , ls_parms_do =''

setpointer(Hourglass!)

if idw_def.RowCount() > 0 then 
	ls_rpt_do	=  trim( idw_def.object.dwdataobjectname [ idw_def.GetRow()])
	ls_repid		=	trim( idw_def.object.reportid[ idw_def.GetRow()])

	If Not IsNull( ls_rpt_do ) and ls_rpt_do <> '' then 
		idw_rpt.dataobject 	= ls_rpt_do
		 
		blob blob_syntax_and_data
		ll_rc = f_dw_to_syntax_and_data ( idw_rpt, 	true, blob_syntax_and_data ) // report object 
		if len(blob_syntax_and_data) < 20 then
			MessageBox('VZT Report Creation Error','Report source is missing.', stopsign!)
			ii_savestatus = -100
			return 
		END IF
		blob_syntax_and_data = blob_syntax_and_data  + blob( "0000000" )
		UPDATEBLOB  "VZT_REPORTDEF" SET "DWSYNTAX" = :blob_syntax_and_data WHERE "REPORTID" = :ls_repid ;
		 
	End If // empty def	
end if 


end event

event ue_assign_menu;//over
end event

type cb_dfilter from w_vzt_rpt_base`cb_dfilter within w_vzt_mm_report_def
end type

type uo_trace01 from w_vzt_rpt_base`uo_trace01 within w_vzt_mm_report_def
end type

type dw_mainlist from w_vzt_rpt_base`dw_mainlist within w_vzt_mm_report_def
boolean visible = true
integer x = 14
integer width = 2043
integer height = 476
integer taborder = 140
string dataobject = "d_vzt_mm_rpt_list"
boolean hscrollbar = true
end type

event dw_mainlist::rowfocuschanged;call super::rowfocuschanged;If currentrow > 0 and currentrow <= this.RowCount() then 
	SetPointer( hourglass! )
	idw_rpt.dataobject = 'd_empty'	
	istr_parms.report_id = this.object.hier_id [ currentrow] 
	is_leafind				= this.object.vzt_hierarchy_leafind [ currentrow] 
	is_grouping 			= this.object.grouping [ currentrow]
	is_report				= trim(f_nvl(string(this.object.reportid [ currentrow]),''))
	string		ls_type
	ls_type					= trim(f_nvl(string(this.object.subtype [ currentrow]),''))
	if is_leafind = 'G' AND is_report <> '' and ls_type <> '' then 
		cb_run_online.text = '&Run Grp' 
		idw_parms.visible = true
		cb_run_online.enabled = true
	Elseif is_leafind = 'Y'	then 
		cb_run_online.text = '&Run' 
		cb_run_online.enabled = true
		idw_parms.visible = true
	Elseif is_report = '' then 
		cb_run_online.enabled = false 
		idw_parms.visible = false
	Else
	END IF 
	
	idw_parms.Retrieve( trim(is_report ), trim(is_accessflags), 'SYS', 'DEFAULT' )
	idw_def.Retrieve( trim(is_report ) )
	idw_parms.fkeyvals[1] = trim(is_report)
	
End IF
end event

type cb_last_search from w_vzt_rpt_base`cb_last_search within w_vzt_mm_report_def
end type

type cb_close from w_vzt_rpt_base`cb_close within w_vzt_mm_report_def
integer x = 640
integer y = 1696
end type

type cb_delete1 from w_vzt_rpt_base`cb_delete1 within w_vzt_mm_report_def
integer taborder = 100
end type

type cb_save from w_vzt_rpt_base`cb_save within w_vzt_mm_report_def
integer x = 27
integer y = 1696
integer width = 370
integer taborder = 110
string text = "Sa&ve Parms"
end type

event cb_save::clicked;//overr
dw_primary.RefreshDataObject()
call super::clicked 
end event

type cb_select from w_vzt_rpt_base`cb_select within w_vzt_mm_report_def
integer x = 2619
integer y = 1324
integer taborder = 90
end type

type cb_new from w_vzt_rpt_base`cb_new within w_vzt_mm_report_def
integer x = 2574
integer y = 1540
integer taborder = 130
end type

type cb_newsearch from w_vzt_rpt_base`cb_newsearch within w_vzt_mm_report_def
integer x = 311
integer y = 1660
integer taborder = 70
end type

type cb_search from w_vzt_rpt_base`cb_search within w_vzt_mm_report_def
boolean visible = false
integer x = 416
integer y = 1660
integer taborder = 60
end type

type st_foundrecs from w_vzt_rpt_base`st_foundrecs within w_vzt_mm_report_def
integer x = 2615
integer y = 1232
end type

type st_stop from w_vzt_rpt_base`st_stop within w_vzt_mm_report_def
integer x = 3593
end type

type dw_data from w_vzt_rpt_base`dw_data within w_vzt_mm_report_def
integer x = 2875
integer y = 1500
integer taborder = 40
end type

type dw_print from w_vzt_rpt_base`dw_print within w_vzt_mm_report_def
integer x = 3237
integer y = 1596
integer taborder = 160
end type

type uo_ddcal from w_vzt_rpt_base`uo_ddcal within w_vzt_mm_report_def
end type

type uo_zoom from w_vzt_rpt_base`uo_zoom within w_vzt_mm_report_def
boolean visible = false
integer x = 2149
integer y = 1604
integer taborder = 120
end type

type cbx_preview from w_vzt_rpt_base`cbx_preview within w_vzt_mm_report_def
end type

type tab_1 from w_vzt_rpt_base`tab_1 within w_vzt_mm_report_def
event type integer ue_refresh_ddparms ( string as_reportid )
integer x = 14
integer y = 492
integer width = 2048
integer height = 1184
integer taborder = 50
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

type dw_schedule from uo_vzt_dwbase within w_vzt_mm_report_def
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

type cb_run_online from commandbutton within w_vzt_mm_report_def
integer x = 407
integer y = 1696
integer width = 219
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Run"
end type

event clicked;if is_leafind = 'G' then
	long 		ll_srow, ll_row
	boolean 	lb_done
	string	ls_grouping, ls_name, ls_report
	ll_srow	= dw_mainlist.GetRow()  
	ll_row	= ll_srow 
	ib_scrolling = true 
	if idw_parms.AcceptText() <> 1 then return
	SetPOinter(HOurglass!)
	Do while not lb_done
			ll_row = ll_row + 1
			if ll_row > dw_mainlist.RowCount() then exit
			ls_grouping = dw_mainlist.object.grouping [ ll_row]
			ls_name		= dw_mainlist.object.vzt_hierarchy_name [ ll_row]
			if ls_grouping <> is_grouping then lb_done = true  // end of group
			If not lb_done then 
//				idw_def.SetRow(	ll_row ) 
//				ls_report = idw_def.object.hier_id [ ll_defrow ] 
				is_report = trim(f_nvl(string(dw_mainlist.object.reportid [ ll_row]),''))
				idw_parms.Retrieve( trim(is_report ), trim(is_accessflags), 'SYS', 'DEFAULT' )
				idw_def.Retrieve( trim(is_report ) )
				idw_parms.fkeyvals[1] = trim(is_report)
				if idw_def.RowCount() <= 0 then exit
				parent.event ue_submit_report("ONLINES", idw_def, idw_parms, idw_rpt, is_report  ) // hierarchy pointer
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

type dw_exe_test from datawindow within w_vzt_mm_report_def
boolean visible = false
integer x = 2551
integer y = 1636
integer width = 206
integer height = 60
integer taborder = 80
boolean bringtotop = true
string dataobject = "aaa_d_exe_test"
boolean border = false
boolean livescroll = true
end type

type cb_reload from commandbutton within w_vzt_mm_report_def
integer x = 1353
integer y = 1696
integer width = 133
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rel"
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

reportid 				= f_nvl( lds_reports.GetItemString( 1, 'reportid') ,'')
userid1 					= f_nvl( lds_reports.GetItemString( 1, 'userid') ,'')
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

ls_sql = ls_sql + '~r~n~r~n' + 'INSERT INTO vzt_reportdef VALUES ( ' &
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
         + " '" + distribution_list_id +"' " &
			+ " ) " + "~r~n~r~nGO ~r~n" 

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
userid1						= f_nvl( lds_parms.GetItemString( ll_parmrow, 'userid') ,'')    
queryname					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'queryname') ,'')    
querydescr					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'querydescr') ,'')    
numeric_list				= f_nvl( lds_parms.GetItemString( ll_parmrow, 'numeric_list') ,'')    
usermod  					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'usermod') ,'') 
parmdescr 					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'parmdescr') ,'') 
use_descr					= f_nvl( lds_parms.GetItemString( ll_parmrow, 'use_descr') ,'') 

ls_sql = ls_sql + '~r~n' + 'INSERT INTO vzt_reportdefparms VALUES ( ' &
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
+ " '" +  userid1 + "' , " &    
+ " '" +  queryname + "' , " &    
+ " '" +  querydescr + "' , " &    
+ " '" +  numeric_list  + "' , " &    
+ " '" +  usermod  + "', " &    
+ " '" +  parmdescr  + "', " &    
+ " '" +  use_descr  + "' " &    
			+ " ) " + "~r~n~r~nGO ~r~n" 
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

ls_sql = ls_sql + '~r~n~r~n' + 'INSERT INTO vzt_hierarchy VALUES ( ' &
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
+ ",'','','','','' ) " + "~r~n~r~nGO ~r~n" 
// 5 web pic fields at the end 
clipboard( ls_sql )

MessageBox( 'sql:', ls_sql)
end event

