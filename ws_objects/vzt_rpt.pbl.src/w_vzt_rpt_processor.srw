$PBExportHeader$w_vzt_rpt_processor.srw
forward
global type w_vzt_rpt_processor from w_vzt_rpt_base
end type
type dw_repdef from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type dw_repout from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type cb_run_again from commandbutton within w_vzt_rpt_processor
end type
type cb_show_sql from commandbutton within w_vzt_rpt_processor
end type
type cb_show_syntax from commandbutton within w_vzt_rpt_processor
end type
type dw_parms from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type dw_def from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type dw_rpt from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type dw_schedule from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type cbx_cover from checkbox within w_vzt_rpt_processor
end type
type dw_cover from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type st_data from statictext within w_vzt_rpt_processor
end type
type dw_distribution from uo_vzt_dwbase within w_vzt_rpt_processor
end type
type p_1 from picture within w_vzt_rpt_processor
end type
type dw_remote_connections from uo_vzt_dwbase within w_vzt_rpt_processor
end type
end forward

global type w_vzt_rpt_processor from w_vzt_rpt_base
integer x = 123
integer y = 60
integer width = 3232
integer height = 1852
windowstate windowstate = minimized!
long backcolor = 80269528
event ue_error ( string as_header,  string as_text )
event ue_process_report ( )
event type integer ue_where_tags ( ref string as_container,  long al_max_row,  ref datawindow adw_parms,  boolean ab_strip_quotes )
event ue_report_output ( )
event type datetime ue_replace_date ( string as_replace,  datetime adt_datetime )
event ue_postopen_02 ( )
event type integer ue_calc_statistics ( )
event copy_to_clipboard ( )
event graph_color ( )
event graph_fillpatterns ( )
event graph_title ( )
event graph_type ( )
event graph_spacing ( )
event ue_optional_cols ( ref uo_vzt_dwbase ldw_parms,  ref uo_vzt_dwbase ldw_rpt )
event type integer ue_common_fields ( ref uo_vzt_dwbase ldw_rpt,  ref uo_vzt_dwbase ldw_parms )
event ue_check_graph ( ref uo_vzt_dwbase ldw_rpt )
event ue_display_report ( )
event type string ue_build_parmstring ( ref uo_vzt_dwbase adw_parm )
event type integer ue_post_retrieve ( ref uo_vzt_dwbase adw_rpt )
event ue_display_report_file ( )
event type integer ue_retrieve_report ( ref datawindow adw_rpt,  string as_reportid,  string as_hierid )
event ue_restore_pics ( ref blob ablob,  ref datawindow adw_rpt )
event ue_del_pics ( )
event ue_http_get_url ( )
dw_repdef dw_repdef
dw_repout dw_repout
cb_run_again cb_run_again
cb_show_sql cb_show_sql
cb_show_syntax cb_show_syntax
dw_parms dw_parms
dw_def dw_def
dw_rpt dw_rpt
dw_schedule dw_schedule
cbx_cover cbx_cover
dw_cover dw_cover
st_data st_data
dw_distribution dw_distribution
p_1 p_1
dw_remote_connections dw_remote_connections
end type
global w_vzt_rpt_processor w_vzt_rpt_processor

type variables
str_reporter_reportparms  istr_parms
boolean         ib_repdef_sql_updated=false
datetime         idt_report_runtime 
blob	      ib_bitmaps
boolean         	ib_drilldown=false
uo_vzt_dwbase    	idw_rpt
int		ii_minhdr, ii_minsum, ii_minftr // bands
string		is_parmsbox, is_debugmode, is_parmtabonreport
string		is_buttons, is_pics[]
string		is_status_distributed='e-mailed ', is_graph
st_graphparm	ist_graphparm

//Remote Connection vars
//uo_server_services   iuo_server_services // proxy
//uo_shared_info	iuo_shared_info // proxy 
//nvo_vzt_remote	i_remote
 
end variables

forward prototypes
public function boolean wf_is_visual (ref datawindow adw_source, string as_colname, ref string as_obj)
public function blob of_remote_test (string as_hid, string as_return_msg)
end prototypes

event ue_error;//istr_parms.mode
integer li_rc
CHOOSE CASE istr_parms.mode
	CASE "BATCH" 			 
			dw_schedule.object.status 	[1] = "ERROR"
			dw_schedule.object.message [1] = as_text
			li_rc = dw_schedule.Update (false, true) 
			f_end_tran(SQLCA, li_rc, '', '', '') 

	CASE "ONLINE", "DISPLAY" 
		MessageBox( as_header, as_text, stopsign!)
		POST close(this)		
END CHOOSE

end event

event ue_process_report();long 		ll_rc, ll_row, ll_pages , ll_reports, ll_seconds
string 	ls_newsql, ls_sub_portion, ls_seclabel , ls_datemask
		 
st_foundrecs.text 	= ''
st_foundrecs.visible = true 
tab_1.Visible 			= false 
	
uo_vzt_dwbase 		ldw_parms, ldw_rpt
long 					ll_sub_start, ll_sub_end , ll_parm_row, ll_parms_count , li_nn
string 				ls_parmvalue, ls_parmtype, ls_wheretag, ls_scomm, ls_ecomm
string 				ls_repid, ls_preview
					
	
		SELECT 	reportminhdr, 	reportminsum, 	reportminftr , parmsonreport , parmtabonreport
		INTO		:ii_minhdr, 	:ii_minsum, 	:ii_minftr ,	:is_parmsbox , :is_parmtabonreport
		FROM 		VZT_sysoptions WHERE id = 1 ;
		is_parmtabonreport =	f_nvl(is_parmtabonreport,'N')
		
		CHOOSE CASE istr_parms.mode
			CASE "BATCH", "BATCHOL"
				ls_seclabel = f_getseclabel( dw_schedule.object.securitylevel[ 1], SQLCA) 
				 
				blob blob_syntax_and_data
				datawindow ldw_temp
				SELECTBLOB DWSYNTAX into :blob_syntax_and_data FROM VZT_BATCHSCHEDULE 
				WHERE upper(id) = upper(:istr_parms.schedule_id);
					
				ls_preview = string( BLOBmid( blob_syntax_and_data, 1, 100) ) 
				ls_preview = string( BLOBmid( blob_syntax_and_data, 1, 100) ,EncodingANSI!) 
					
				if len(blob_syntax_and_data) < 16 then 
				 	If gnv_appman.is_debugmode = 'Y' then 
						MessageBox('VZT report processor ue_process_report1', '3 Report parameters and/or definition is missing from batch schedule')
					END IF

					this.event ue_error( "Report Creation Error", "Report parameters and/or definition is missing from batch schedule.") 		
					close(this)
					return
				END IF 

				tab_1.Openpage( "uo_tabpage_dw_repparms"   )
				ldw_temp = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()	
				If is_parmtabonreport <> 'Y' then tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = false
				If gnv_appman.is_debugmode  = 'Y' AND POS(is_accessflags, 'W') > 0 then tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = true
				f_dw_to_syntax_and_data( ldw_temp, false, blob_syntax_and_data ) // parms object
	
				if len(blob_syntax_and_data) < 16 then 
						this.event ue_error( "Report Creation Error", "Report definition is missing from batch schedule.") 		
						close(this)
					return
				END IF 
				
			 	If gnv_appman.is_debugmode = 'Y' then 
						MessageBox('VZT report processor ue_process_report1', '3d')
				END IF

					tab_1.Openpage( "uo_tabpage_dw"   )
					ldw_temp = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
					ll_rc = f_dw_to_syntax_and_data( ldw_temp, false, blob_syntax_and_data ) // parms object

					if ll_rc < 0 then 
						this.event ue_error( "Report Creation Error", "Report definition is missing from batch schedule.(2)") 		
						close(this)
						return
					END IF 
					ldw_temp.SetTransObject( SQLCA) 
					this.event ue_restore_pics (blob_syntax_and_data, ldw_temp)				
				//	END IF 
 				
				
			CASE "ONLINE", "EXPORT"		, "WEBOL"
				If istr_parms.report_id = '' or IsNUll( istr_parms.report_id) then 
					this.event ue_error( "VZT Online Report Error", "Report Id is missing.") 		
					close(this)
					return
				END IF 
				dw_repdef.SetTransObject( SQLCA) 
				ll_reports = dw_repdef.Retrieve( istr_parms.report_id ) 		
		
				If ll_reports <= 0 then 
					this.event ue_error( "VZT Report Error", "Report entry '"+ trim(istr_parms.report_id )+"' not found.") 		
					close(this)
					return			
				END IF 

				ls_seclabel = f_getseclabel( dw_repdef.object.securitylevel[ 1], SQLCA) 

				For ll_row = 1 to ll_reports 
					if dw_repdef.object.hierarchy_leafind[ll_row ] = 'Y' then 
						st_foundrecs.text = 'Reading Report ...'+ string( ll_row) +' out of ' + string( ll_reports ) 
						// ONLINE : create parameters and report pair - get rpt from definition NOT FROM BATCH QUEUE !!!
						ls_repid = dw_repdef.object.reportid [ll_row]
						SELECTBLOB DWSYNTAX into :blob_syntax_and_data FROM VZT_REPORTDEF WHERE id = :ls_repid;
						if len(blob_syntax_and_data) < 12 then 
							this.event ue_error( "Report Creation Error", "Report parameters and/or definition is missing from batch schedule.") 		
							close(this)
							return
						END IF 
						tab_1.Openpage( "uo_tabpage_dw_repparms"   )
						ldw_temp = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()	
						If is_parmtabonreport <> 'Y' then tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = false
//						f_dw_to_syntax_and_data( ldw_temp, false, blob_syntax_and_data )  
//						if len(blob_syntax_and_data) < 12 then 
//							this.event ue_error( "Report Creation Error", "Report definition is missing from batch schedule.") 		
//							return
//						END IF 
						tab_1.Openpage( "uo_tabpage_dw"   )
						ldw_temp = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
						ll_rc = f_dw_to_syntax_and_data( ldw_temp, false, blob_syntax_and_data )  
						if ll_rc < 0 then 
							this.event ue_error( "Report Creation Error", "Report definition is missing from batch schedule.(3)") 		
							close(this)
							return
						END IF 
						ldw_temp.SetTransObject( SQLCA) 
						this.event ue_restore_pics (blob_syntax_and_data, ldw_temp)				
					end if // leaf				
				Next 
				dw_repdef.SetFilter( "vzt_hierarchy_leafind = 'Y' ")
				dw_repdef.Filter( )
		END CHOOSE		

	If istr_parms.mode <> "EXPORT" then // skip parms and retrieval for export 
		ll_pages = UpperBound(tab_1.tabpage[])
		//if POS(_accessflags , 'W') > 0 then ll_pages = ll_pages - 1 // skip admin
		For ll_row = 2 to ll_pages step 2 
				ldw_parms = tab_1.tabpage[ll_row - 1 ].event dynamic ue_get_main_dw()
				CHOOSE CASE istr_parms.mode
					CASE "ONLINE", "WEBOL" 
						ll_parms_count = ldw_parms.Retrieve( dw_repdef.object.reportid [ ll_row/2 ], trim(is_accessflags),'SYS', 'DEFAULT' ) 
					CASE "BATCH", "BATCHOL"
						ll_parms_count = ldw_parms.RowCount() 
				END CHOOSE								
				string ls_pobj 
				ls_pobj = ldw_parms.Object.DataWindow.Objects
				
				If wf_is_visual(ldw_parms, 'autoreplace', ls_pobj) 	then ldw_parms.object.autoreplace.visible = false
				If wf_is_visual(ldw_parms, 'reportid_t', ls_pobj) 		then ldw_parms.object.reportid_t.visible 	= false
				If wf_is_visual(ldw_parms, 'parmtype', ls_pobj) 		then ldw_parms.object.parmtype.visible 	= false
				If wf_is_visual(ldw_parms, 'parmtype_t', ls_pobj) 		then ldw_parms.object.parmtype_t.visible 	= false
//				ldw_parms.object.replacetype.visible 	= false
				If wf_is_visual(ldw_parms, 'wheretag', ls_pobj) 		then ldw_parms.object.wheretag.visible 	= false
				If wf_is_visual(ldw_parms, 'wheretag_t', ls_pobj) 		then ldw_parms.object.wheretag_t.visible 	= false
		
				If wf_is_visual(ldw_parms, 'reportid', ls_pobj) 		then ldw_parms.object.reportid.visible 	= false
				If wf_is_visual(ldw_parms, 'id_t', ls_pobj) 				then ldw_parms.object.id_t.visible 			= false
				If wf_is_visual(ldw_parms, 'cb_search', ls_pobj) 		then ldw_parms.object.cb_search.visible 	= false
				If wf_is_visual(ldw_parms, 'lookuptype_t', ls_pobj) 	then ldw_parms.object.lookuptype_t.visible= false
				If wf_is_visual(ldw_parms, 'lookuptype', ls_pobj) 		then ldw_parms.object.lookuptype.visible 	= false
				If wf_is_visual(ldw_parms, 'lookupprocessor_t', ls_pobj) then ldw_parms.object.lookupprocessor_t.visible = false
				If wf_is_visual(ldw_parms, 'lookupprocessor', ls_pobj) then ldw_parms.object.lookupprocessor.visible = false
				If wf_is_visual(ldw_parms, 'editmask_t', ls_pobj) 		then ldw_parms.object.editmask_t.visible 	= false
				If wf_is_visual(ldw_parms, 'editmask', ls_pobj) 		then ldw_parms.object.editmask.visible 	= false				
				If wf_is_visual(ldw_parms, 'parmorder', ls_pobj) 		then ldw_parms.object.parmorder.visible 	= false				
				
				ldw_parms.object.parmname.TabSequence=	'0'
		
				ldw_rpt = tab_1.tabpage[ll_row ].event dynamic ue_get_main_dw() 	
				if not Isvalid( ldw_rpt) 		then continue 
				if not ldw_rpt.dataobject='' 	then continue 
			
				// Create common report fields from a template depending on paper size/orientaion
				this.event ue_common_fields( ldw_rpt, ldw_parms) 
				
				string ls_userparms = ''
				If ll_parms_count > 0 then 
					// Create list of current parms as a string 
					ls_userparms = this.event ue_build_parmstring( ldw_parms) 
					boolean lb_strip_quotes=false
			     //--------------------------------------------------------- 
				  // Evaluate and substitute parameters for this report
			     //--------------------------------------------------------- 
				  ls_newsql = Upper(ldw_rpt.getSQLSelect())
				  li_nn = 1
				  DO WHILE li_nn < 10
					ls_scomm = "/*" + string(li_nn)
					ls_ecomm = string(li_nn) + "*/"
					ll_sub_start 	= POS(ls_newsql, ls_scomm  ) 
					ll_sub_end 		= POS(ls_newsql, ls_ecomm  ) 
				   DO WHILE ll_sub_start > 0 AND ll_sub_end > 0 
	 				 ls_sub_portion = MID( ls_newsql , ll_sub_start + len(ls_scomm), ll_sub_end - ll_sub_start - len(ls_scomm) )
					 // Replace each parameter tag with it's value 
					 this.event ue_where_tags (ls_sub_portion , ll_parms_count , ldw_parms, lb_strip_quotes) 
					 ls_newsql = MID( ls_newsql , 1, ll_sub_start - 1) + " "+ ls_sub_portion + " "+ MID( ls_newsql , ll_sub_end + 3)

					 ll_sub_start 	= POS(ls_newsql, ls_scomm  ) 
					 ll_sub_end 	= POS(ls_newsql, ls_ecomm  ) 
				   LOOP	
					li_nn = li_nn + 1					
					if li_nn = 9 then lb_strip_quotes = true
				  LOOP					  
  				  // Replace each parameter tag with it's value (outside of comments
				  // strip quotes on string lists not in where clause (for function calls)
				  this.event ue_where_tags (ls_newsql, ll_parms_count , ldw_parms, true) 
				  ll_rc = ldw_rpt.setSQLSelect(ls_newsql) 				  
				Else
					tab_1.tabpage[ ll_row - 1 ].visible = false // hide empty parms tabpage
				End if	
		Next 
		
		this.width = this.width + 10 		
		// retrieve the reports skip the parm dw's
		string ls_seq, ls_footer
		ll_pages = UpperBound(tab_1.tabpage[]) 
	//	if POS(_accessflags , 'W') > 0 then ll_pages = ll_pages - 1 // skip admin
	p_1.X = (this.width - p_1.width)  / 2 
	p_1.y = (this.height - p_1.height)  / 2 
	p_1.visible = true 
	
		For ll_row = 2 to ll_pages step 2 
				ldw_parms 	= tab_1.tabpage[ll_row - 1 ].event dynamic ue_get_main_dw()
				ldw_rpt 		= tab_1.tabpage[ll_row ].event dynamic ue_get_main_dw() 			
	 			
				If gnv_appman.is_debugmode = 'Y' then 
					If ib_use_remote then 
						If ib_http then
							MessageBox('VZT report processor', 'Used remote DB via HTTP')
						else 
							MessageBox('VZT report processor', 'Used remote DB')
						end if
					
					ELSE
						MessageBox('VZT report processor', 'Used local DB')
					END IF
				END IF

				If ib_use_remote THEN 
					If ib_http then 
						// no transobject needed
					ELSE
						ldw_rpt.SetTransObject( i_tran_remote) //Asign remote trans to report  
					END IF
				END IF
				
				ldw_parms.object.datawindow.readonly = true
				ls_seq 	= string (ll_row / 2 ,'00')
				ll_rc 	= tab_1.tabpage[ ll_row - 1]. dynamic uf_set_tab_parms("Parms " ,	'', 0, tab_1) 
				ll_rc 	= tab_1.tabpage[ ll_row ]. 	dynamic uf_set_tab_parms("Report ", '', 0, tab_1) 
				st_foundrecs.text = 'Retrieving Report ...'+ string(ll_row/2)  +' out of ' + string( ll_pages / 2 ) 
				idt_report_runtime = f_sysdate()  // ll_pages / 2
				string ls_hierid, ls_objects
				SELECT reportid into :ls_hierid FROM VZT_BATCHSCHEDULE WHERE upper(id) = upper(:istr_parms.schedule_id) ;
				SELECT reportid into :ls_repid FROM VZT_HIERARCHY WHERE id = :ls_hierid;
				ll_rc = this.event ue_retrieve_report (ldw_rpt, ls_repid, ls_hierid ) 
				
				ls_objects = ldw_rpt.Object.DataWindow.Objects
			
				this.event ue_check_graph( ldw_rpt) 
			
				ldw_rpt._selection_service ='S' // allow row selection 
				this.event ue_optional_cols ( ldw_parms, ldw_rpt) // set opt. visibility
				If istr_parms.mode <> "WEBOL" then this.event ue_calc_statistics( ) //calculate run time statistics
				
				ls_datemask = 'MMM-DD-YYYY hh:mm:ss'
				if left( gnv_appman.is_datemask, 1) = 'd' then ls_datemask = 'DD-MMM-YYYY hh:mm:ss'
				
				if POS( ls_objects, 'c_ranon') > 0 then ldw_rpt.Object.c_ranon.text = "Ran on " + string (f_sysdate(), ls_datemask )  
				If IsNull(ls_seclabel ) then ls_seclabel =' *** --------- *** '				
				if POS( ls_objects, 't_security') > 0 then ldw_rpt.Object.t_security.text = ls_seclabel 
				IF integer( ldw_rpt.Object.DataWindow.header.Height) < ii_minhdr 	then ldw_rpt.Object.DataWindow.header.Height = ii_minhdr
				IF integer( ldw_rpt.Object.DataWindow.summary.Height)< ii_minsum  then ldw_rpt.Object.DataWindow.Footer.Height = ii_minsum
				IF integer( ldw_rpt.Object.DataWindow.Footer.Height) < ii_minftr  then ldw_rpt.Object.DataWindow.Footer.Height = ii_minftr
				
				// fill parm box if requested
				if POS( ls_objects, 'parms_t') > 0 and is_parmsbox = 'Y' and not ldw_rpt.ib_graph then 
					int li_sumheight 
					li_sumheight = integer (ldw_rpt.Object.DataWindow.summary.Height )
					IF li_sumheight < 612 then ldw_rpt.Object.DataWindow.summary.Height = 612
					li_sumheight = integer (ldw_rpt.Object.DataWindow.summary.Height )
					ldw_rpt.Object.parms_t.y =  li_sumheight - 4 - integer ( ldw_rpt.Object.parms_t.height) 
					ldw_rpt.Object.parms_t.width = 3000 // portrait width
					ldw_rpt.Object.parms_t.text = ls_userparms
				END IF 	
				// Allow descendant postprocessing
				this.event ue_post_retrieve( ldw_rpt) 
		Next 
		p_1.visible = false
	End If //EXPORT		
	
	If istr_parms.mode = 'BATCH' then 
		this.event ue_report_output()    	// save output and goodbye
		this.event ue_distribute_report()   // email the report (if requested) 		
		close (this) 
		return
	END If 
	
	st_foundrecs.visible = false 
	tab_1.Visible = true 
	
	If istr_parms.mode = 'BATCHOL' or istr_parms.mode = 'ONLINES' then 
		string 	ls_schedid
		int 		li_rc
//		this.event ue_distribute_report()   // email the report (if requested) 		
		ls_schedid = dw_schedule.object.id [ 1] 
		DELETE FROM vzt_batchschedule where upper(id) = upper(:ls_schedid) ;
		If SQLCA.sqlcode <> 0 then	li_rc = -10
		f_end_tran (SQLCA, li_rc , '', '', '') 			

END If 

end event

event type integer ue_where_tags(ref string as_container, long al_max_row, ref datawindow adw_parms, boolean ab_strip_quotes);string 	ls_ptype, ls_parmvalue , ls_wheretag , ls_replace
long 		ll_parm_row 
datetime ldt_date 
string   ls_date
long 		ll_year


// Replace all parameters with tags
For ll_parm_row = 1 to al_max_row 
	ls_ptype = Upper( trim( adw_parms.object.parmtype[ ll_parm_row ] ))
	ls_replace	= Upper( trim( adw_parms.object.replacetype[ ll_parm_row ] ))
	CHOOSE CASE ls_ptype 
		CASE 'STRING'
			ls_parmvalue = trim(adw_parms.object.parmvalue [ ll_parm_row ])
			If len(ls_parmvalue) > 2 then		
				// strip outer quotes for the IN (' ;ppppppp ') placeholder
				If Mid(ls_parmvalue, 1,1) ="'" and Mid(ls_parmvalue, len(ls_parmvalue),1)="'" then
					ls_parmvalue = MID( ls_parmvalue, 2, len( ls_parmvalue )- 2)
				END IF
				// strip inner quotes for the IN (' ;ppppppp ') 
				// when they were as a function argument 
				If POS( ls_parmvalue, ',') > 0 and ab_strip_quotes then 
					ls_parmvalue = f_replace(ls_parmvalue, "'","")
				END IF
				
			END IF
		CASE 'DATE'
			If adw_parms.object.autoreplace [ll_parm_row] = 'Y' then 
				adw_parms.object.parmdate [ll_parm_row] = this.event ue_replace_date( ls_replace, adw_parms.object.parmdate [ll_parm_row]	)
				ldt_date = adw_parms.GetItemDAteTime( ll_parm_row , 'parmdate') 
			ELSE
				ls_date	= adw_parms.GetItemString( ll_parm_row , 'parmvalue') 
				If IsDAte(ls_date	) then 
					ldt_date = datetime( date(ls_date)	)
				ELSE
					ldt_date = adw_parms.GetItemDAteTime( ll_parm_row , 'parmdate') 
				END IF 
			End IF				
			ll_year  = year( date(ldt_date ))
			ls_parmvalue = String(ldt_date, 'yyyy-mm-dd' )
			//	ls_parmvalue = String(ldt_date, 'mm/dd/yyyy' )
			
		CASE 'DATETIME'
			If adw_parms.object.autoreplace [ll_parm_row] = 'Y' then 
				adw_parms.object.parmdate [ll_parm_row] = this.event ue_replace_date( ls_replace, adw_parms.object.parmdate [ll_parm_row]	)
			End IF
			IF SQLCA.dbms = 'ODBC' then
				ls_parmvalue = String(adw_parms.object.parmdate [ ll_parm_row ], 'yyyy-mm-dd hh:mm:ss.ffffff' )
			END IF
			IF POS(SQLCA.dbms, 'ORA') > 0 then
				ls_parmvalue = String(adw_parms.object.parmdate [ ll_parm_row ], 'mm/dd/yyyy' )
			END IF
					
		CASE 'NUMBER'
			ls_parmvalue = String(adw_parms.object.parmnum [ ll_parm_row ] )
			// for database replace commas with periods !!!!!!!!
			ls_parmvalue = f_replace( ls_parmvalue, ',', '.')
			ls_parmvalue = f_replace( ls_parmvalue, '.0000', '')
			ls_parmvalue = f_replace( ls_parmvalue, '.000', '')
			ls_parmvalue = f_replace( ls_parmvalue, '.00', '')
			ls_parmvalue = f_replace( ls_parmvalue, '.0', '')
	END CHOOSE
	
	ls_wheretag = UPPER( TRIM( adw_parms.object.wheretag[ ll_parm_row ] )) 
	f_replace (as_container , ls_wheretag, ls_parmvalue) 
	// replace title if there 
	string ls_title 
	long 	ll_row 
	ll_row = dw_schedule.GetRow()
	If ll_row >0 then
		ls_title = trim(dw_schedule.GetItemString( ll_row , 'title' ))
		f_replace (as_container , ';RTITLE', ls_title) 
	END IF
Next


return 1
end event

event ue_report_output;int li_rc 
li_rc = 1 
string ls_id, ls_title, ls_reportid, ls_seclevel, ls_msg, ls_scheduleid, ls_keeplast
datetime ldt_finished
string ls_values

		ls_keeplast		= dw_schedule.object.keeplast [ 1]
		ls_scheduleid	= dw_schedule.object.id 		[ 1]
		ls_reportid 	= dw_schedule.object.reportid [ 1]
		ls_seclevel 	= dw_schedule.object.securitylevel[ 1]
		ls_title 		= dw_schedule.object.title 	[ 1]
		ldt_finished 	= datetime( today(), now()) 
		ls_id = string( ldt_finished, "mmddhhmmssfff a/p") 
		ls_id = f_random_string( 10) + f_replace( ls_id, ' ','')  
		ls_values = '~r~n id="'+ls_id +'"~r~n reportid="'+ls_reportid+'"~r~n userid="'+gnv_appman.is_userid+'"~r~n title="'+ls_title +'"~r~n finished="'+string(ldt_finished )
		
		If ls_keeplast	<> 'Y' then 
			ls_msg = ' deleting old data from report output table.'			
			DELETE FROM VZT_REPORTOUTPUT where scheduleid = :ls_scheduleid ;
			If SQLCA.sqlcode <> 0 then	li_rc = -5
		End If 
		
		If li_rc > 0 then 
			ls_msg = ' inserting into report output table.'
			INSERT INTO VZT_REPORTOUTPUT
			VALUES ( :ls_id, :ls_reportid, :gnv_appman.is_userid, :ls_title , :ldt_finished, null,  :ls_seclevel,  :ls_scheduleid);
			If SQLCA.sqlcode <> 0 then	
//				li_rc = -10
				ROLLBACK; // and try to run it again 
				li_rc = 0 
				ls_msg = ls_msg + ls_values
				dw_schedule.object.message 		[1] = ls_msg 
				dw_schedule.object.outputid 		[1] = ls_id 
				dw_schedule.object.status 			[1] = "SUBMITTED"
				setnull( ldt_finished)
				dw_schedule.object.starteddate 	[1] = ldt_finished
				If dw_schedule.Update (false, true) < 0 then 
					ROLLBACK; 
				ELSE
					COMMIT; 
				END IF
				RETURN
			ELSE
			END IF
		End If
		
		If li_rc > 0 then 
			setpointer(Hourglass!)
			long ll_len, ll_next = 1, ll_page , ll_max_pages
			blob blob_syntax_and_data 
			string ls_rpt_do='' 
			datawindow ldw_rpt
			ls_msg = ' saving report data.'
			ll_max_pages = upperbound( tab_1.tabpage[]) 
			For ll_page = 1 to ll_max_pages
				ldw_rpt = tab_1.tabpage[ll_page].event dynamic ue_get_main_dw() 
//				If tab_1.tabpage[ll_page].visible then 
					f_dw_to_syntax_and_data( ldw_rpt,true, blob_syntax_and_data ) // report object 
//				end if 
			Next 
			// add bitmaps blob to the result 
			If len(ib_bitmaps) > 24 then blob_syntax_and_data = blob_syntax_and_data + ib_bitmaps
					
			UPDATEBLOB VZT_REPORTOUTPUT SET RPTOUTPUT = :blob_syntax_and_data
			WHERE ID = :ls_id ;
		End IF 
		If SQLCA.sqlcode <> 0 then	li_rc = -20

		If li_rc > 0 then 
			ls_msg = ' updating batch schedule.'
			dw_schedule.object.message 		[1] = "Report completed."
			dw_schedule.object.outputid 		[1] = ls_id 
			dw_schedule.object.status 			[1] = "FINISHED"
			dw_schedule.object.finisheddate 	[1] = ldt_finished
			If dw_schedule.Update (false, true) < 0 then li_rc = -30
		End If
		If li_rc < 0 then dw_schedule.object.message [1] = "error while "+ls_msg + ", "+ trim(SQLCA.SQLerrtext)
		f_end_tran(SQLCA, li_rc, '', '', '') 		
		If li_rc < 0 then // save error info to schedule queue
			dw_schedule.object.status [1] = "ERROR"
			li_rc = dw_schedule.Update (false, true) 
			f_end_tran(SQLCA, li_rc, '', '', '') 
		End If


end event

event ue_replace_date;			int li_day	, li_year, li_month , li_delta
			datetime ldt_result ,ldt_sysdate
			ldt_sysdate = f_sysdate()
			li_day	= day( date(ldt_sysdate) )
			li_year	= year(date(ldt_sysdate) )
			li_month = month(date(ldt_sysdate) )

			if NOT IsValid( inv_dates) then inv_dates = CREATE uo_vzt_dates 

			// CHANGE NOW to 00:00 or 23:59:59 depending on from to date !!!!!!!

			ldt_result 	= adt_datetime
			li_delta		= inv_dates.of_getdelta( trim(as_replace)) // get PREV NEXT qualifier 
			CHOOSE CASE as_replace	
				CASE 'WEEKAGO' 
					ldt_result = datetime( RelativeDate( date(ldt_sysdate) , -7 ), now()) 
				CASE 'TODAY' 
					ldt_result  = ldt_sysdate 
				CASE 'YESTERDAY' 
					ldt_result  = datetime( RelativeDate( date(ldt_sysdate) , -1 ), now()) 
				CASE 'TOMORROW' 
					ldt_result  = datetime( RelativeDate( date(ldt_sysdate) , +1 ), now()) 
				CASE 'YEARBEG'
					ldt_result 	= datetime( date( "01/01/"+string(li_year)), now()) 
				CASE 'YEARAGO' 					
					li_year 	= li_year - 1
					ldt_result 	= datetime( date( string(li_month)+"/"+string(li_day)+"/"+string(li_year)), now()) 					
				CASE 'Q1BEGTY' 					
					ldt_result 	= datetime( date( "03/31/"+string(li_year)) ) 					
				CASE 'Q1ENDTY' 					
					ldt_result 	= datetime( date( "03/31/"+string(li_year)) ) 					
				CASE 'Q2BEGTY' 					
					ldt_result 	= datetime( date( "04/01/"+string(li_year)) ) 					
				CASE 'Q2ENDTY' 					
					ldt_result 	= datetime( date( "06/30/"+string(li_year)) ) 					
				CASE 'Q3BEGTY' 					
					ldt_result 	= datetime( date( "07/01/"+string(li_year)) ) 					
				CASE 'Q3ENDTY' 					
					ldt_result 	= datetime( date( "09/30/"+string(li_year)) ) 					
				CASE 'Q4BEGTY' 					
					ldt_result 	= datetime( date( "10/01/"+string(li_year)) ) 					
				CASE 'Q4ENDTY' 					
					ldt_result 	= datetime( date( "12/31/"+string(li_year)) ) 					
				CASE 'QCBEGTY'  
					If 1  <= li_month  and li_month  <= 3 	then ldt_result =datetime( date( "01/01/"+string(li_year)) ) 					
					If 4  <= li_month  and li_month  <= 6 	then ldt_result =datetime( date( "04/01/"+string(li_year)) ) 					
					If 7  <= li_month  and li_month  <= 9 	then ldt_result =datetime( date( "07/01/"+string(li_year)) ) 					
					If 10 <= li_month  and li_month  <= 12 then ldt_result =datetime( date( "10/01/"+string(li_year)) ) 					
				CASE 'QCENDTY'  
					If 1  <= li_month and li_month  <= 3 	then ldt_result =datetime( date( "03/31/"+string(li_year)) ) 					
					If 4  <= li_month and li_month  <= 6 	then ldt_result =datetime( date( "06/30/"+string(li_year)) ) 					
					If 7  <= li_month and li_month  <= 9 	then ldt_result =datetime( date( "09/30/"+string(li_year)) ) 					
					If 10 <= li_month and li_month  <= 12 	then ldt_result =datetime( date( "12/31/"+string(li_year)) ) 					

				CASE 'Q1ENDLY' 					
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "03/31/"+string(li_year)) ) 					
				CASE 'Q2BEGLY' 					
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "04/01/"+string(li_year)) ) 					
				CASE 'Q2ENDLY' 					
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "06/30/"+string(li_year)) ) 					
				CASE 'Q3BEGLY' 					
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "07/01/"+string(li_year)) ) 					
				CASE 'Q3ENDLY' 					
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "09/30/"+string(li_year)) ) 					
				CASE 'Q4BEGLY' 					
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "10/01/"+string(li_year)) ) 					
				CASE 'Q4ENDLY'
					li_year 	= li_year - 1					
					ldt_result =datetime( date( "12/31/"+string(li_year)) ) 					
				CASE 'QCBEGLY'  
					li_year 	= li_year - 1					
					If 1  <= li_month  and li_month  <= 3 	then ldt_result =datetime( date( "01/01/"+string(li_year)) ) 					
					If 4  <= li_month  and li_month  <= 6 	then ldt_result =datetime( date( "04/01/"+string(li_year)) ) 					
					If 7  <= li_month  and li_month  <= 9 	then ldt_result =datetime( date( "07/01/"+string(li_year)) ) 					
					If 10 <= li_month  and li_month  <= 12 then ldt_result =datetime( date( "10/01/"+string(li_year)) ) 					
				CASE 'QCENDLY'  
					li_year 	= li_year - 1					
					If 1  <= li_month and li_month  <= 3 	then ldt_result =datetime( date( "03/31/"+string(li_year)) ) 					
					If 4  <= li_month and li_month  <= 6 	then ldt_result =datetime( date( "06/30/"+string(li_year)) ) 					
					If 7  <= li_month and li_month  <= 9 	then ldt_result =datetime( date( "09/30/"+string(li_year)) ) 					
					If 10 <= li_month and li_month  <= 12 	then ldt_result =datetime( date( "12/31/"+string(li_year)) ) 					
					
				// END OF MONTH VARS 
				CASE 'EOMCURR' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 0)
				CASE 'EOMPREV1' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -1)
				CASE 'EOMPREV2' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -2)
				CASE 'EOMPREV3' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -3)
				CASE 'EOMPREV4' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -4)
				CASE 'EOMPREV5' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -5)
				CASE 'EOMPREV6' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -6)
				CASE 'EOMPREV7' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -7)
				CASE 'EOMPREV8' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -8)
				CASE 'EOMPREV9' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -9)
				CASE 'EOMPREV10' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -10)
				CASE 'EOMPREV11' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -11)
				CASE 'EOMPREV12' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , -12)
				CASE 'EOMNEXT1' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 1)
				CASE 'EOMNEXT2' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 2)
				CASE 'EOMNEXT3' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 3)
				CASE 'EOMNEXT4' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 4)
				CASE 'EOMNEXT5' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 5)
				CASE 'EOMNEXT6' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 6)
				CASE 'EOMNEXT7' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 7)
				CASE 'EOMNEXT8' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 8)
				CASE 'EOMNEXT9' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 9)
				CASE 'EOMNEXT10' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 10)
				CASE 'EOMNEXT11' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 11)
				CASE 'EOMNEXT12' 
					ldt_result = inv_dates.of_eom( ldt_sysdate , 12)

				
				CASE 'BOMCURR' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 0)
				CASE 'BOMPREV1' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -1)
				CASE 'BOMPREV2' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -2)
				CASE 'BOMPREV3' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -3)
				CASE 'BOMPREV4' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -4)
				CASE 'BOMPREV5' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -5)
				CASE 'BOMPREV6' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -6)
				CASE 'BOMPREV7' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -7)
				CASE 'BOMPREV8' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -8)
				CASE 'BOMPREV9' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -9)
				CASE 'BOMPREV10' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -10)
				CASE 'BOMPREV11' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -11)
				CASE 'BOMPREV12' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , -12)
				CASE 'BOMNEXT1' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 1)
				CASE 'BOMNEXT2' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 2)
				CASE 'BOMNEXT3' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 3)
				CASE 'BOMNEXT4' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 4)
				CASE 'BOMNEXT5' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 5)
				CASE 'BOMNEXT6' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 6)
				CASE 'BOMNEXT7' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 7)
				CASE 'BOMNEXT8' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 8)
				CASE 'BOMNEXT9' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 9)
				CASE 'BOMNEXT10' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 10)
				CASE 'BOMNEXT11' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 11)
				CASE 'BOMNEXT12' 
					ldt_result = inv_dates.of_bom( ldt_sysdate , 12)
					
				CASE 'MONTHAGO' 
					li_month = li_month - 1
					If li_month = 0 then 
						li_year 	= li_year - 1
						li_month = 12
					End If 
					if li_month = 2 and li_day > 28 then 
						li_day = 28 
						If IsDate( "02/29/"+ string( li_year) ) then li_day = 29
					End If 
					ldt_result = datetime( date( string(li_month)+"/"+string(li_day)+"/"+string(li_year)), now()) 
				CASE ELSE
					If IsNumber( as_replace	) then //use it as days +/- sysdate
						ldt_result = datetime( RelativeDate( date(ldt_sysdate) , integer(as_replace)), now()) 					
					End If 
			END CHOOSE					

return ldt_result
end event

event ue_postopen_02();if gnv_appman.is_debugmode='Y' then 
	Messagebox('VZT Report processor trace', 'before ue_postopen_02. Mode:' + istr_parms.mode   )
end if			


CHOOSE CASE istr_parms.mode 
	CASE 'DISPLAYF' 
		cb_show_sql.visible		= false
		cb_show_syntax.visible	= false
		dw_distribution.visible	= false

		this.visible 		=  true 		
		this.windowstate 	= 	Normal!		// = Normal!		
		
	CASE 'DISPLAY' 
		this.visible 		=  true 		
		this.windowstate 	= Maximized!		// = Normal!		
	CASE 'ONLINE' , 'BATCHOL', "EXPORT"
		this.visible 		=  true 		
		this.windowstate 	= Maximized!
	CASE 'WEBOL' 
		this.visible 		=  true 		
		this.windowstate 	= Normal!
END CHOOSE

if gnv_appman.is_debugmode='Y' then 
	Messagebox('VZT Report processor trace', 'After ue_postopen_02. Mode:' + istr_parms.mode   )
end if			

end event

event ue_calc_statistics;long ll_seconds , ll_runcount, li_rc , ll_oldseconds, ll_avgseconds
time lt_avg, lt_start, lt_end
string ls_reportid
datetime ldt_current_avg, ldt_new_avg 
li_rc = 0
ls_reportid = trim(dw_schedule.object.reportid [1] )
SELECT reportid into :ls_reportid FROM vzt_hierarchy where id = :ls_reportid and leafind = 'Y';
IF SQLCA.sqlcode <> 0 then return 1

UPDATE vzt_reportdef SET parmcount = parmcount + 1 where reportid = :ls_reportid ; // this only gets a lock on the record 
SELECT averageruntime, parmcount INTO :ldt_current_avg , :ll_runcount FROM vzt_reportdef where reportid = :ls_reportid;
if SQLCA.SQLcode <> 0 then 
//	messagebox("PC err", string( SQLCA.SQLcode ))
	return -5 
END IF 
if IsNull(ll_runcount ) then ll_runcount = 1 

lt_start = time( idt_report_runtime )
lt_end 	= time( f_sysdate() ) 
//messagebox("STATS time", "START time:" + string( lt_start ) + "~n~rEnd time:" + string( lt_end ) )
ll_seconds = MAX( 1, secondsafter( lt_start, lt_end ) )

If IsNUll( ldt_current_avg ) or year(date(ldt_current_avg)) < 1960  then 
	ll_avgseconds = MAX(1, ll_seconds )
Else
	lt_avg = time( ldt_current_avg)
	ll_oldseconds = hour( lt_avg )* 3600 + minute( lt_avg )* 60 + second( lt_avg ) 
	ll_avgseconds = MAX( 1, (ll_seconds + ll_oldseconds ) / 2 )
END IF
//messagebox("stats new secs" , string( ll_seconds ))
//messagebox("stats old secs" , string( ll_oldseconds ))
//messagebox("stats avg secs" , string( ll_avgseconds))
ldt_new_avg = datetime( date('01/01/1960'), relativetime( time("00:00:00"), ll_avgseconds) )
//messagebox("stats time" , string( ldt_new_avg ))
UPDATE vzt_reportdef SET averageruntime = :ldt_new_avg,  parmcount = :ll_runcount  where reportid = :ls_reportid ;
if SQLCA.SQLcode <> 0 then li_rc = -10 
f_end_tran (SQLCA, li_rc , '', '', '') 			
return 1
end event

event copy_to_clipboard;idw_rpt.ClipBoard ("gr_1" ) // Copy the graph to the Windows Clipboard.
end event

event graph_color();if idw_rpt.ib_graph then 
	ist_graphparm.dwreport		= idw_rpt 
	ist_graphparm.graphobject 	= is_graph  
 	if IsNull( is_graph  ) or trim(is_graph )= ''  then is_graph ='gr_1'  
 
	OpenWithParm (w_vzt_graph_color, ist_graphparm)
	
end if	
end event

event graph_title;if idw_rpt.ib_graph then OpenWithParm (w_vzt_graph_title, idw_rpt)

end event

event graph_type;if idw_rpt.ib_graph then OpenWithParm (w_vzt_graph_type, idw_rpt)
end event

event graph_spacing;if idw_rpt.ib_graph then OpenWithParm (w_vzt_graph_spacing, idw_rpt)
end event

event ue_optional_cols;	// Make optional columns visible or not - as requested by user
				ldw_parms.SetFilter ("parmtype = 'COLUMN'")
				ldw_parms.Filter ()
				long ll_optcolcnt, ll_optrow
				string ls_colname, ls_objects, ls_expr, ls_modret
				ll_optcolcnt = ldw_parms.RowCount()
				ls_objects = ldw_rpt.Object.DataWindow.Objects
				If ll_optcolcnt > 0 then 
					For ll_optrow = 1 to ll_optcolcnt 
						ls_colname = lower(trim(string(ldw_parms.object.parmvalue [ll_optrow ]) ))
						If string(ldw_parms.object.optionalcolumnvisible [ll_optrow ]) = 'Y' then 
							if POS( ls_objects, ls_colname) > 0 then 
								ls_expr 		= ls_colname + ".Visible = '1'"
								ls_modret 	= ldw_rpt.Modify( ls_expr )
							END IF 
							if POS( ls_objects, ls_colname+"_t") > 0 then 
								ls_expr = ls_colname+"_t"+ ".Visible = '1'"
								ls_modret = ldw_rpt.Modify( ls_expr )
							END IF 
						Else
							if POS( ls_objects, ls_colname) > 0 then 
								ls_expr = ls_colname + ".Visible = '0'"
								ls_modret = ldw_rpt.Modify( ls_expr )								
							End If 
							if POS( ls_objects, ls_colname+"_t") > 0 then 
								ls_expr = ls_colname+"_t"+ ".Visible = '0'"
								ls_modret = ldw_rpt.Modify( ls_expr )								
							End If 
						END IF
					Next
				End If
				
				ldw_parms.SetFilter ("1 = 1")
				ldw_parms.Filter()
				ldw_parms.Sort()
end event

event ue_common_fields;// Create common report fields from a template depending on paper size/orientaion
string 	ls_global_portrait, ls_global_landscape,ls_global_landscape_legal
string 	ls_draft_portrait, ls_draft_landscape, ls_draft_legal , ls_ret
boolean  lb_draft

	SELECT reportfields_portrait, reportfields_landscape, reportfields_landscape_legal, draft_portrait, draft_landscape, draft_legal 
		INTO :ls_global_portrait, :ls_global_landscape, :ls_global_landscape_legal , :ls_draft_portrait, :ls_draft_landscape, :ls_draft_legal 
		FROM vzt_sysoptions WHERE id = 1 USING SQLCA ; 
		
		ls_global_portrait 			= f_nvl( ls_global_portrait 			, '')
		ls_global_landscape			= f_nvl( ls_global_landscape			, '')
		ls_global_landscape_legal 	= f_nvl( ls_global_landscape_legal 	, '')
		ls_draft_portrait				= f_nvl( ls_draft_portrait				, '')
		ls_draft_landscape			= f_nvl( ls_draft_landscape			, '')
		ls_draft_legal 				= f_nvl( ls_draft_legal 				, '')
		
		lb_draft = false
		If ldw_parms.Find( "parmname='DRAFT'", 1, ldw_parms.RowCount()) > 0 then lb_draft = true 
			
		if not isValid (ldw_rpt) then 
			this.event ue_error( "Report Creation Error", "Report object missing while processing common fields.") 		
			return -1
		END IF 
		
		IF TRIM(ldw_rpt.Object.DataWindow.Print.Orientation) = '1' then // use landscape template
		   If TRIM(ldw_rpt.Object.DataWindow.Print.Paper.Size) = '5' then // legal 8x14
				If ls_global_landscape_legal 		<> '' then ls_ret = ldw_rpt.Modify ( ls_global_landscape_legal )
				If lb_draft and ls_draft_legal 	<> '' then ls_ret = ldw_rpt.Modify ( ls_draft_legal )
			Else
				If ls_global_landscape <> '' then ls_ret = ldw_rpt.Modify ( ls_global_landscape )						
				If lb_draft and ls_draft_landscape <> ''then ls_ret = ldw_rpt.Modify ( ls_draft_landscape ) 
			END IF 
		ELSE // use portrait
			If ls_global_portrait <> '' then ls_ret = ldw_rpt.Modify ( ls_global_portrait )
			If lb_draft and ls_draft_portrait <> '' then ls_ret = ldw_rpt.Modify ( ls_draft_portrait ) 					
		END IF 
				
				
return 1
end event

event ue_check_graph;	string ls_objects 
	
	ls_objects = ldw_rpt.Object.DataWindow.Objects
	idw_rpt 						= ldw_rpt
	
	if POS(ls_objects, 'gr_') > 0 then 
		idw_rpt.ib_graph 		= true 
		uo_zoom.visible 		= false
		cbx_preview.visible 	= false
		
		//enable graph menu
		im_menu.dynamic of_enable_graph( true )
	End If
	
	idw_rpt.ist_display 			= st_data
	
	
end event

event ue_display_report;long 		ll_rc
string 	ls_outputid

If f_nvl(istr_parms.schedule_id,'') = '' then 
	this.event ue_error( "VZT Display Report Error", "Schedule entry pointer is missing.") 		
	HALT CLOSE
END IF 

cb_run_again.visible = false
ll_rc = dw_schedule.Retrieve() 
If ll_rc <= 0 then 
	this.event ue_error( "VZT Display Report Error", "Schedule entry '"+ trim(istr_parms.schedule_id )+"' not found.") 
	HALT CLOSE
END IF 

this.title = this.title +": "+ string( dw_schedule.object.title[1]) 
ls_outputid = trim( dw_schedule.object.outputid [1] )
if f_nvl(ls_outputid,'') = '' then 
	this.event ue_error( "VZT Display Report Error", "Output id missing from Schedule entry '"+ trim(istr_parms.schedule_id )+"'.") 
	HALT CLOSE
END IF 

//IF SQLCA.dbms = 'ODBC' then
	blob  			blob_syntax_and_data
	uo_vzt_dwbase 	ldw_temp
						
	SELECTBLOB RPTOUTPUT INTO :blob_syntax_and_data FROM VZT_REPORTOUTPUT WHERE ID = :ls_outputid ;
	if len(blob_syntax_and_data) < 12 then 
		this.event ue_error( "VZT Report Display Creation Error", "Report output definition is missing Report Output Table.") 		
		return
	END IF 
	tab_1.Openpage( "uo_tabpage_dw_repparms"   )
	ldw_temp = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()	
	ll_rc 	= tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Parms 01", '', 0 , tab_1) 
	f_dw_to_syntax_and_data( ldw_temp, false, blob_syntax_and_data ) 
	ldw_temp.object.datawindow.readonly = true
	
	if len(blob_syntax_and_data) < 12 then 
		this.event ue_error( "VZT Report Display Creation Error", "Report definition is missing from Report Output Table.") 		
		return
	END IF 
	tab_1.Openpage( "uo_tabpage_dw"   )
	ldw_temp = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
	ll_rc 	= tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Report 01", '', 0 , tab_1) 
	f_dw_to_syntax_and_data( ldw_temp, false, blob_syntax_and_data ) 
	ldw_temp.SetTransObject( SQLCA) 
	ldw_temp._selection_service ='S' // allow row selection 
	this.event ue_restore_pics(blob_syntax_and_data, ldw_temp)
	
	this.event ue_check_graph( ldw_temp) 
	
//END IF   // odbc


If  UpperBound(tab_1.tabpage[]) > 1 then 
	tab_1.POST Selecttab( 2) 
End If
end event

event ue_build_parmstring;// Replace each parameter tag with it's value 
long 		ll_parm_row , ll_max_parm
string 	ls_parmtype, ls_parmvalue  , ls_replace, ls_comma, ls_ret 
datetime ldt_date 
string   ls_date, ls_use_descr
long 		ll_year

ll_max_parm = adw_parm.RowCount() 
For ll_parm_row = 1 to ll_max_parm  
	ls_parmtype = Upper( trim( adw_parm.object.parmtype[ ll_parm_row ] ))
	ls_replace	= Upper( trim( adw_parm.object.replacetype[ ll_parm_row ] ))
	ls_use_descr= Upper( trim( adw_parm.object.use_descr[ ll_parm_row ] ))
	CHOOSE CASE ls_parmtype 
		CASE 'STRING'
			if ls_use_descr = 'Y' then
				ls_parmvalue = f_nvl(trim(adw_parm.object.parmdescr [ ll_parm_row ]),'*ALL*')
				if trim(ls_parmvalue) = '' then ls_parmvalue = '*ALL*'
			ELSE
				ls_parmvalue = f_nvl(trim(adw_parm.object.parmvalue [ ll_parm_row ]),'')
			END IF		
		CASE 'DATE'
			If adw_parm.object.autoreplace [ll_parm_row] = 'Y' then 
				adw_parm.object.parmdate [ll_parm_row] = this.event ue_replace_date( ls_replace, adw_parm.object.parmdate [ll_parm_row]	)
				ldt_date = adw_parm.GetItemDAteTime( ll_parm_row , 'parmdate') 
			ELSE				
				ls_date	= adw_parm.GetItemString( ll_parm_row , 'parmvalue') 
				If IsDAte(ls_date	) then 
					ldt_date = datetime( date(ls_date)	)
				ELSE
					ldt_date = adw_parm.GetItemDAteTime( ll_parm_row , 'parmdate') 
				END IF 
			End IF
			ll_year  = year( date(ldt_date ))
			ls_parmvalue = String(ldt_date, 'yyyy-mm-dd' )
			If ls_parmvalue = '1800-01-01' then 
				ls_parmvalue = '*ALL*'
			ELSE
				IF gnv_appman.is_datemask <> '' then
					ls_parmvalue = String(ldt_date, gnv_appman.is_datemask )
				END IF
			END IF
		CASE 'DATETIME'
			string ls_mask 
			If adw_parm.object.autoreplace [ll_parm_row] = 'Y' then 
				adw_parm.object.parmdate [ll_parm_row] = this.event ue_replace_date( ls_replace, adw_parm.object.parmdate [ll_parm_row]	)
			End IF
			IF SQLCA.dbms = 'ODBC' then
				ls_mask = 'yyyy-mm-dd'
				IF gnv_appman.is_datemask <> '' then
					ls_mask = gnv_appman.is_datemask
				END IF
				ls_parmvalue = String(adw_parm.object.parmdate [ ll_parm_row ], ls_mask + ' hh:mm:ss.ffffff' )
			END IF
			IF POS(SQLCA.dbms, 'ORA') > 0 then
				ls_parmvalue = String(adw_parm.object.parmdate [ ll_parm_row ], ls_mask )
			END IF
					
		CASE 'NUMBER'
			ls_parmvalue = String(adw_parm.object.parmnum [ ll_parm_row ] )
	END CHOOSE
	ls_ret += ls_comma + adw_parm.object.parmname [ ll_parm_row ] +' '+ ls_parmvalue 
	ls_comma = ', '
Next 
//
return ls_ret
end event

event ue_display_report_file;long 		ll_rc
string 	ls_outputid

//IF SQLCA.dbms = 'ODBC' then
	blob  			blob_syntax_and_data
	uo_vzt_dwbase 	ldw_parms, ldw_rpt

	// read file info blob instead of select 
	f_vzt_readfile_to_blob ( istr_parms.report_id, blob_syntax_and_data)
	if len(blob_syntax_and_data) < 12 then 
		this.event ue_error( "VZT Report Display Creation Error", "Report definition is missing from Report Output Table.") 		
		return
	END IF 

	tab_1.Openpage( "uo_tabpage_dw_repparms"   )
	ldw_parms = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()	
	ll_rc 	= tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Parms 01", '', 0 , tab_1) 
	tab_1.tabpage[UpperBound(tab_1.tabpage[])]. visible = false // DO NOT DISPLAY PARMS!
	f_dw_to_syntax_and_data( ldw_parms , false, blob_syntax_and_data ) 
	ldw_parms.object.datawindow.readonly = true

	if len(blob_syntax_and_data) < 12 then 
		this.event ue_error( "VZT Report Display Creation Error", "Report definition is missing from Report Output Table.") 		
		return
	END IF 

	tab_1.Openpage( "uo_tabpage_dw"   )
	ldw_rpt = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
	ll_rc 	= tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Report 01", '', 0 , tab_1) 
	f_dw_to_syntax_and_data( ldw_rpt, false, blob_syntax_and_data ) 
//	ldw_temp.SetTransObject( SQLCA) 
// ldw_temp._selection_service ='S' // allow row selection 
	this.event ue_restore_pics(blob_syntax_and_data, ldw_rpt)

	this.event ue_check_graph( ldw_rpt) 
	
//END IF   // odbc

If  UpperBound(tab_1.tabpage[]) > 1 then 
	tab_1.POST Selecttab( 2) 
End If

cb_show_sql.visible		= false
cb_show_syntax.visible	= false
dw_distribution.visible	= false



end event

event type integer ue_retrieve_report(ref datawindow adw_rpt, string as_reportid, string as_hierid);int 			li_rc, ll_maxconn , ll_remote, li_ret
string 		ls_connid
datastore	lds_temp_remote
long			ll_rptrows
string 		ls_syntax, ls_data, ls_ret
blob 			lblob_syntax , lblob_remote_data
long 			ll_ret, ll_b4rows, ll_aftrows

li_rc = 1  //
ll_maxconn = dw_remote_connections.retrieve (as_reportid ) 

If ll_maxconn <= 0 then 
	// Local reporting only 
	li_ret = 1 
	If gnv_appman.is_debugmode  = 'Y' then 
		li_ret = MessageBox( "Report Trace", "Retrieve Report?", question!, yesno!) 
	END IF
	if li_ret = 1 then  
		If ib_http then // get data via HTTP
			this.event ue_http_get_url () 
			ll_ret = f_vzt_html_retrieve_dw( is_url+is_page, is_args, adw_rpt) 
		ELSE
			li_rc = adw_rpt.retrieve ( ) 
		END IF
	END IF
else
	// ---------------------------------------------------------------------	
	// Retrieve remote data for consolidation
	// ---------------------------------------------------------------------	
	lds_temp_remote = CREATE datastore
	lds_temp_remote.dataobject = adw_rpt.dataobject
	
//	if not isValid( i_remote ) then i_remote = CREATE nvo_vzt_remote	
	ls_syntax		= adw_rpt.object.datawindow.syntax 
	lblob_syntax 	= blob( adw_rpt.object.datawindow.syntax )
	lds_temp_remote.Create (ls_syntax)
	// ---------------------------------------------------------------------	
	// For each remote connection:
	// ---------------------------------------------------------------------	
	For ll_remote = 1 to ll_maxconn  
//		ls_connid	= dw_remote_connections.GetItemString( ll_remote, 'id' )
//		i_remote.f_get_connection_info( ls_connid ) 
//		i_remote.f_client_connect_to_server( true ) 		//	Connect to remote dpb server 
//		If i_remote.is_errcode <> '0' then
//			MessageBox('VZT Remote Report Connection Error', 'Code: '+i_remote.is_errcode +','+ i_remote.is_errtext, stopsign!)	
//			return -1
//		End If	
				
//		ll_ret = i_remote.myconnect.CreateInstance(iuo_shared_info) // server object instance
	
		// ---------------------------------------------------------------------	
		//	Get PRERETRIEVED data or run report remotely
		// ---------------------------------------------------------------------	
//		if IsValid(iuo_shared_info) then 
////			lblob_remote_data = iuo_shared_info.f_get_remote_data( lblob_syntax, ls_ret)
//			lblob_remote_data = iuo_shared_info.f_get_remote_rpt_from_queue( as_hierid, ls_ret)
////			lblob_remote_data = this.of_remote_test( as_hierid, ls_ret)

//			ls_syntax = string ( lblob_remote_data )
//			ll_rptrows = lds_temp_remote.RowCount()
//			If ll_rptrows > 0 then lds_temp_remote.ROwsDiscard( 1, ll_rptrows, Primary!)
//			lds_temp_remote.ImportString( ls_syntax ) // import remote data 
//			ll_rptrows = lds_temp_remote.RowCount()
//			ll_b4rows = adw_rpt.RowCount()
			// Append remote data to existing report 
			If ll_rptrows > 0 then li_rc = lds_temp_remote.RowsCopy ( 1, ll_rptrows, Primary!, adw_rpt, 999999, Primary! )
			If li_rc  < 0 then
				MessageBox('VZT Remote Report Error', 'Code: '+string(li_rc) +', rows copy failed.')	
				return -1
			End If	
			ll_aftrows = adw_rpt.RowCount()
			If gnv_appman.is_debugmode = 'Y' then
				MessageBox('VZT Remote Debug', ''+ &
				'connid: '+ ls_connid +'~r~n' + & 
				'remote rows: '+string(ll_rptrows) +'~r~n' + & 
				'b4 rows: '+string(ll_b4rows) +'~r~n' + & 
				'after rows: '+string(ll_aftrows) +'~r~n' )
			End IF
//		end if 
//		i_remote.f_client_connect_to_server( false ) 		//	disconnect from remote dpb server 
	Next
end if
if isValid( lds_temp_remote ) then destroy lds_temp_remote
return li_rc

//		ls_syntax 	= 'TEST' + string( now())
//		if IsValid(iuo_shared_info) then iuo_shared_info.f_insert_test( ls_syntax 	)

end event

event ue_restore_pics(ref blob ablob, ref datawindow adw_rpt);string ls_object, ls_filename, ls_objects,ls_rc 
blob 		b_pic
long		ll_objlen, ll_fsufflen, ll_piclen   
if len(ablob) < 24 then return 
ib_bitmaps = ablob // save pics blob for later use for output

DO WHILE len(ablob) > 24 
	ll_objlen 	= long (string( BLOBmid( ablob, 1, 8) ,EncodingANSI!))
	ll_fsufflen = long (string( BLOBmid( ablob, 9, 8) ,EncodingANSI!))
	ll_piclen 	= long (string( BLOBmid( ablob,17, 8) ,EncodingANSI!))
	if ll_objlen <=0 or ll_fsufflen <= 0 or ll_piclen <= 0 then return 
	
	ls_object 	= string( BLOBmid( ablob,25, ll_objlen ) ,EncodingANSI!)
	ls_filename = string( BLOBmid( ablob,25+ll_objlen, ll_fsufflen ) ,EncodingANSI!) 
	If len(ls_object ) <=0 or ls_object = '' or len( ls_filename)<=0 or ls_filename='' then return 
	b_pic			= BLOBmid( ablob,25+ll_objlen+ll_fsufflen, ll_piclen)

	ls_filename = 'C:\TMP_VZRPIC'+ f_random_string(6)+'.'+ls_filename 
	f_vzt_writefile_from_blob( ls_filename, b_pic) 
	is_pics[upperbound(is_pics) + 1]= ls_filename 
	
	ls_objects = adw_rpt.Object.DataWindow.Objects
	If pos(ls_objects, ls_object) > 0 then 
		ls_rc = adw_rpt.Modify( ls_object+ '.filename="'+ ls_filename+ '"')
	END IF
	ablob = blobMID (ablob, 25+ll_objlen + ll_fsufflen + ll_piclen ) //the rest if any

LOOP

		
end event

event ue_del_pics;If upperBound( is_pics []) > 0 then

	long 		ll_pic, ll_maxpics
	string 	ls_filename

	ll_maxpics = upperBound( is_pics []) 
	FOR	ll_pic = 1 to ll_maxpics
		ls_filename = is_pics [ll_pic ] 
		If FileExists( ls_filename ) then FileDelete( ls_filename )
	NEXT

END IF
end event

event ue_http_get_url();// set up url and args
end event

public function boolean wf_is_visual (ref datawindow adw_source, string as_colname, ref string as_obj);boolean lb_ret
string ls_x
lb_ret = false
If POS(as_obj, as_colname) > 0 then 
//	IF integer(adw_source.object.autoreplace.x) > 0 then lb_ret = true 
	ls_x = adw_source.DESCRIBE( as_colname+'.x')
	IF integer( ls_x ) > 0 then lb_ret = true 
END IF 

return lb_ret
			
end function

public function blob of_remote_test (string as_hid, string as_return_msg);transaction l_tran
blob			lblob_return, blob_syntax_and_data
datastore 	lds_local
integer  	li_count
string 		ls_msg, ls_syntax, ls_preview, ls_data
lblob_return = blob('')
long 		ll_slen , ll_dlen

//this.f_remote_init( gnv_appman, l_tran ) 
l_tran = SQLCA
as_hid = f_nvl( as_hid, '')

SELECT count(*) INTO :li_count FROM VZT_REPORTOUTPUT
where reportid = :as_hid USING l_tran;

if li_count <> 1 then
	ls_msg	= 'report count for '+ as_hid +'on the queue not unique. Count:' + string( li_count) 
Else
	// Get report output
	SELECTBLOB rptoutput INTO :blob_syntax_and_data FROM VZT_REPORTOUTPUT  
	where reportid = :as_hid USING l_tran;
	// get data portion only
	ll_slen = long (string( BLOBmid( blob_syntax_and_data, 1, 8) ,EncodingANSI!)) // parms dw
	ll_dlen = long (string( BLOBmid( blob_syntax_and_data, 9, 8) ,EncodingANSI!)) // parms dw
	ls_preview = string( BLOBmid( blob_syntax_and_data, 1, 16),EncodingANSI!) 
	If ll_dlen  > 0 then 
		blob_syntax_and_data = blobMID	(blob_syntax_and_data, 17 +ll_slen +ll_dlen  ) //the rest
		ls_preview = string( BLOBmid( blob_syntax_and_data, 1, 16),EncodingANSI!) 
		ll_slen = long (string( BLOBmid( blob_syntax_and_data, 1, 8),EncodingANSI! )) // report dw 
		ll_dlen = long (string( BLOBmid( blob_syntax_and_data, 9, 8) ,EncodingANSI!)) // report dw
		lblob_return = blobMID 	(blob_syntax_and_data, 17 +ll_slen, ll_dlen  )
	else 
		
	end if
	
END IF 

return 		lblob_return
end function

on w_vzt_rpt_processor.create
int iCurrent
call super::create
this.dw_repdef=create dw_repdef
this.dw_repout=create dw_repout
this.cb_run_again=create cb_run_again
this.cb_show_sql=create cb_show_sql
this.cb_show_syntax=create cb_show_syntax
this.dw_parms=create dw_parms
this.dw_def=create dw_def
this.dw_rpt=create dw_rpt
this.dw_schedule=create dw_schedule
this.cbx_cover=create cbx_cover
this.dw_cover=create dw_cover
this.st_data=create st_data
this.dw_distribution=create dw_distribution
this.p_1=create p_1
this.dw_remote_connections=create dw_remote_connections
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_repdef
this.Control[iCurrent+2]=this.dw_repout
this.Control[iCurrent+3]=this.cb_run_again
this.Control[iCurrent+4]=this.cb_show_sql
this.Control[iCurrent+5]=this.cb_show_syntax
this.Control[iCurrent+6]=this.dw_parms
this.Control[iCurrent+7]=this.dw_def
this.Control[iCurrent+8]=this.dw_rpt
this.Control[iCurrent+9]=this.dw_schedule
this.Control[iCurrent+10]=this.cbx_cover
this.Control[iCurrent+11]=this.dw_cover
this.Control[iCurrent+12]=this.st_data
this.Control[iCurrent+13]=this.dw_distribution
this.Control[iCurrent+14]=this.p_1
this.Control[iCurrent+15]=this.dw_remote_connections
end on

on w_vzt_rpt_processor.destroy
call super::destroy
destroy(this.dw_repdef)
destroy(this.dw_repout)
destroy(this.cb_run_again)
destroy(this.cb_show_sql)
destroy(this.cb_show_syntax)
destroy(this.dw_parms)
destroy(this.dw_def)
destroy(this.dw_rpt)
destroy(this.dw_schedule)
destroy(this.cbx_cover)
destroy(this.dw_cover)
destroy(this.st_data)
destroy(this.dw_distribution)
destroy(this.p_1)
destroy(this.dw_remote_connections)
end on

event open;call super::open;istr_parms = Message.PowerObjectParm
If not IsValid ( istr_parms) then 
	POST close(this) 
	return
End If
if istr_parms.live_trace='Y' then
	gnv_appman.is_debugmode='Y' 
end if 

string 		ls_newsql
long 			ll_rc
ib_bitmaps 	= blob('')

ib_closebtn_on_right= false

If IsValid( im_menu) then 
	im_menu.m_file.m_new.visible 			= false
	im_menu.m_file.m_open.visible 		= false
	im_menu.m_file.m_save.visible 		= false
	//im_menu.m_file.m_saveas.visible 	= false
	im_menu.m_file.m_delete.visible 		= false
	im_menu.m_file.m_properties.visible = false
	im_menu.m_file.m_dash11.visible 		= false

	im_menu.m_file.m_print.visible 			= true
	im_menu.m_file.m_printscreen.visible	= true
	im_menu.m_file.m_print.enabled			= true
	im_menu.m_file.m_printscreen.enabled	= true

END IF 
If lower(gnv_appman.is_apptitle)	= 'commentator' then
	If IsValid (w_gcc_main) then w_gcc_main.event dynamic ue_menu_set()
end if

//	im_menu.m_file.m_print.visible 			= true
//	im_menu.m_file.m_printscreen.visible	= true
//	im_menu.m_file.m_print.enabled			= true
//	im_menu.m_file.m_printscreen.enabled	= true
//end if

if gnv_appman.is_debugmode='Y' then 
	string ls_msg
	ls_msg = 'istr_parms.live_trace: ' 	+ istr_parms.live_trace + '~r~n'
	ls_msg +='istr_parms.mode: ' 			+ istr_parms.mode+ '~r~n'
	ls_msg +='istr_parms.schedule_id: ' + istr_parms.schedule_id+ '~r~n'
	ls_msg +='istr_parms.report_id: '	+ istr_parms.report_id+ '~r~n'
	ls_msg +='istr_parms.userid: ' 		+ istr_parms.userid+ '~r~n'
	ls_msg +='istr_parms.hierarchy_id: '+ istr_parms.hierarchy_id+ '~r~n'
	ls_msg +='istr_parms.live_trace: ' 		+ istr_parms.live_trace+ '~r~n'
	
	Messagebox('VZT Report processor trace', ls_msg )
	this.visible =  true 
else
	this.visible =  false
end if

SELECT reporterbuttons INTO :is_buttons FROM VZT_SYSOPTIONS WHERE id =1 ;

ls_newsql 	= Upper(dw_schedule.getSQLSelect())
// VZ Added upper for RU db configuration 1/27/2006

ls_newsql 	= ls_newsql + " WHERE upper(id) = '" +  upper(trim(istr_parms.schedule_id)) +"' " 
ls_newsql 	= f_nvl(ls_newsql, '*** null sql ***')
if gnv_appman.is_debugmode='Y' then 
	clipboard ( ls_newsql )
	Messagebox( "VZT Report Processor trace", "updating batch schedule selection criteria. ls_newsql:" + ls_newsql)
END IF

ll_rc 		= dw_schedule.setSQLSelect(ls_newsql) 
if ll_rc <> 1 then 
	if gnv_appman.is_debugmode='Y' then 
		Messagebox( "VZT Report Processor trace", "Failed to update batch schedule selection criteria. ls_newsql:" + ls_newsql)
	END IF
	
	this.event ue_error( "VZT Report Processor", "Failed to update batch schedule selection criteria.")
	HALT CLOSE
ELSE
	if gnv_appman.is_debugmode='Y' then 
		Messagebox( "VZT Report Processor trace", "Updated batch schedule selection criteria. ls_newsql:" + ls_newsql)
	END IF
end if

CHOOSE CASE istr_parms.mode
	CASE "BATCH" , "BATCHOL" 				// run the report, save the output, and close 
		CLIPBOARD(ls_newsql)
		ll_rc = dw_schedule.Retrieve() 
		if gnv_appman.is_debugmode='Y' then 
			Messagebox('VZT Report processor trace', 'BATCH: retrieved schedule, rc='+string(ll_rc) )
		end if			
				
		if ll_rc > 0 then 
			this.title = this.title +": "+ string( dw_schedule.object.title[1]) 
			if gnv_appman.is_debugmode='Y' then 
				Messagebox('VZT Report processor trace', 'BATCH: before ue_process_report' )
			end if			
			this.post event ue_process_report()
		else
			if gnv_appman.is_debugmode='Y' then 
				Messagebox( "VZT Report Processor trace", "Failed to retrieve schedule report data.~r~n No Rows Returned ~r~n check CLIPBOARD " + ls_newsql)
			END IF

		end if 	
	CASE "ONLINE" ,"EXPORT"  				// run the report and display it
		this.post event ue_process_report()
		
	CASE "DISPLAY" 							// find the output of the report and just display it
		this.event ue_display_report()
	CASE "DISPLAYF" 							// find the output of the report and just display it
		this.event ue_display_report_file()

END CHOOSE

IF is_buttons ='Y' or gnv_appman.is_debugmode = 'Y' then 
	cb_run_again.visible = true	
	cbx_preview.visible 	= true	
	uo_zoom.visible 		= true		
ELSE
	cb_run_again.visible = false
	cbx_preview.visible 	= false	
	uo_zoom.visible 		= false	
END IF



If POS(is_accessflags, "W") > 0 AND gnv_appman.is_debugmode = 'Y' then 
	cb_show_sql.visible 		= true
	cb_show_syntax.visible 	= true
ELSE
	cb_show_sql.visible 		= false
	cb_show_syntax.visible 	= false
//	tab_1.POST Openpage( "uo_tabpage_dw_admin"  )
//	idw_def = tab_1.tabpage[UpperBound(tab_1.tabpage[])].event dynamic ue_get_main_dw()
//	tab_1.tabpage[UpperBound(tab_1.tabpage[])]. dynamic uf_set_tab_parms("Definition", "", 0, tab_1)
End IF
this.POST event ue_postopen_02 ()



end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_run_again.y			= 	newheight -  cb_run_again.height 	- ii_resizeband_y 
		cb_show_sql.y			= 	newheight -  cb_show_sql.height 		- ii_resizeband_y 
		cb_show_syntax.y		=	newheight -  cb_show_syntax.height 	- ii_resizeband_y 
		cbx_cover.y				=	newheight -  cbx_cover.height 		- ii_resizeband_y 
		cbx_preview.y			= 	newheight -  cbx_preview.height 		- ii_resizeband_y 
		uo_zoom.y				= 	newheight -  uo_zoom.height 			- ii_resizeband_y 

		If ib_closebtn_on_right then 
			If newwidth > 3223 then 
			cb_close.x = newwidth - cb_close.width - ii_resizeband_x
			End If 
		END IF 
	End IF 
End IF 	
end event

event ue_postopen_01;//override

end event

event menu_saveas;//override
this.event menu_saveas_init()
tab_1.idw_current.SaveAs( )
end event

event ue_assign_menu;//override
this.ChangeMenu(m_vzt_rpt_master) 
im_menu = this.menuid 
end event

event menu_copy;//If POS( idw_def.GetItemString(idw_def.GetRow(), 'subtype'), 'GR') > 0 then 
	idw_rpt.ClipBoard ("gr_1" ) // Copy the graph to the Windows Clipboard.
//ELSE
//END IF 
end event

event ue_distribute_report;//string 	ls_dist_list_id, ls_id, ls_now
//long		ll_maxrows, ll_row, ll_ret, ll_rc
//datetime	ldt_now
//ls_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
//ls_id					= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
//If ls_dist_list_id = '' then return 
//
//ll_maxrows = dw_distribution.Retrieve( ls_dist_list_id )
//If ll_maxrows <= 0 then 
//	IF istr_parms.mode <> 'BATCH' then 
//		MessageBox('VZT Reporter Error', 'Report distribution list is empty.~r~nReport will not be mailed.', Exclamation!) 
//	END IF
//	return 
//END IF 
//	
////IF istr_parms.mode <> 'BATCH' then 
////	MessageBox('VZT Reporter Email', 'Would you like to email the report to the following receipients?', Question!) 
////END IF	
//	
//// Mail to list 
//if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 
//
//string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
//string ls_fname, ls_lname, ls_filename, ls_subject , ls_htmlfile, ls_vzrfile
//
////	ole_1.uf_savefile( is_tempdir + sle_2.text + '.DOC' ) 
//ls_filename =  dw_schedule.object.id[1] 
//f_replace(ls_filename, ',','')
//f_replace(ls_filename, ':','')
//f_replace(ls_filename, ';','')
//f_replace(ls_filename, ':','')
//f_replace(ls_filename, '/','')
//f_replace(ls_filename, '\','')
//f_replace(ls_filename, '|','')
//f_replace(ls_filename, '-','_')
//
//// Save report in two flavors
//ls_htmlfile =  upper( gnv_appman.is_tempdir + ls_filename + '.HTM' )
//ls_vzrfile	=  upper( gnv_appman.is_tempdir + ls_filename + '.VZR' )
//
//blob blob_syntax_and_data 
//f_dw_to_syntax_and_data( idw_rpt,true, blob_syntax_and_data ) // report object 
//
//f_vzt_writefile_from_blob( 	ls_vzrfile	, blob_syntax_and_data )
//idw_rpt.SaveAs(					ls_htmlfile , HTMLTable!, FALSE) 
//
//ls_attachfile[1]	= ls_htmlfile 
//ls_attachfile[2]	= ls_vzrfile 
//ls_subject			= f_nvl(dw_schedule.object.title [ dw_schedule.GetRow() ] , '')
//FOR ll_row = 1 to ll_maxrows 
//	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
//	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
//	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
//	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
//NEXT
//
//ll_ret = inv_mail.uf_mail_send( ls_subject,'***',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
//	
//// Update message to reflect report was emailed 
//IF ll_ret >= 0 then 
//	ll_rc = 1 
//	ldt_now = f_sysdate()  
//	ls_now = string ( ldt_now , 'mm-dd-yyyy hh:mm:ss')
//	UPDATE vzt_batchschedule SET message1=RTRIM(message1)+', '+ :is_status_distributed+' '+:ls_now 
//	WHERE id = :ls_id;
//	If SQLCA.SQLcode <> 0 then ll_rc = -10
//	f_end_tran (SQLCA, ll_rc, '', '','' )
//END IF 
//
//if IsValid(inv_mail) then DESTROY inv_mail 
// 
//FileDelete ( ls_filename )
//
end event

event close;call super::close;//if isValid( i_remote ) then destroy i_remote 	
this.event ue_del_pics ()
end event

event activate;If IsValid (w_main) then w_main.event dynamic ue_menu_set()
end event

event menu_saveas_init;call super::menu_saveas_init;string ls_rpt_format, ls_rpt_pdf_style 

SELECT rpt_format, rpt_pdf_style INTO :ls_rpt_format, :ls_rpt_pdf_style 
FROM VZT_SYSOPTIONS 
USING SQLCA;

If IsNull(ls_rpt_format) or ls_rpt_format ='' then ls_rpt_format = 'VZR'
If ls_rpt_format ='PDF' then
	if IsNull(ls_rpt_pdf_style ) then ls_rpt_pdf_style = 'XSLFOP' 
ELSE
	ls_rpt_pdf_style = ''
END IF

int li_ret
IF ls_rpt_pdf_style = 'XSLFOP' then

	tab_1.idw_current.Object.Datawindow.Export.PDF.Method = XSLFOP! 
	tab_1.idw_current.Object.Datawindow.Export.PDF.XSLFOP.print = 'No' 
ELSE
 	tab_1.idw_current.Object.Datawindow.Export.PDF.Method = DISTILL! 
 	tab_1.idw_current.Object.Datawindow.Export.PDF.DISTILL.CustomPOstScript = 'No' 
END IF
end event

type cb_tmpl from w_vzt_rpt_base`cb_tmpl within w_vzt_rpt_processor
end type

type cb_dfilter from w_vzt_rpt_base`cb_dfilter within w_vzt_rpt_processor
end type

type uo_trace01 from w_vzt_rpt_base`uo_trace01 within w_vzt_rpt_processor
end type

type dw_mainlist from w_vzt_rpt_base`dw_mainlist within w_vzt_rpt_processor
integer taborder = 230
end type

type cb_last_search from w_vzt_rpt_base`cb_last_search within w_vzt_rpt_processor
end type

type cb_close from w_vzt_rpt_base`cb_close within w_vzt_rpt_processor
integer x = 631
integer y = 1648
integer taborder = 80
end type

type cb_delete1 from w_vzt_rpt_base`cb_delete1 within w_vzt_rpt_processor
integer taborder = 160
end type

type cb_save from w_vzt_rpt_base`cb_save within w_vzt_rpt_processor
boolean visible = false
integer x = 27
integer y = 1648
integer taborder = 200
end type

type cb_select from w_vzt_rpt_base`cb_select within w_vzt_rpt_processor
integer x = 370
integer y = 1568
integer taborder = 190
end type

type cb_new from w_vzt_rpt_base`cb_new within w_vzt_rpt_processor
integer taborder = 220
end type

type cb_newsearch from w_vzt_rpt_base`cb_newsearch within w_vzt_rpt_processor
integer x = 9
integer y = 1564
integer taborder = 180
end type

type cb_search from w_vzt_rpt_base`cb_search within w_vzt_rpt_processor
boolean visible = false
integer taborder = 150
end type

type st_foundrecs from w_vzt_rpt_base`st_foundrecs within w_vzt_rpt_processor
integer x = 311
integer y = 1648
integer width = 896
end type

type st_stop from w_vzt_rpt_base`st_stop within w_vzt_rpt_processor
end type

type dw_data from w_vzt_rpt_base`dw_data within w_vzt_rpt_processor
integer taborder = 130
end type

type dw_print from w_vzt_rpt_base`dw_print within w_vzt_rpt_processor
integer taborder = 240
end type

type uo_ddcal from w_vzt_rpt_base`uo_ddcal within w_vzt_rpt_processor
end type

type uo_zoom from w_vzt_rpt_base`uo_zoom within w_vzt_rpt_processor
integer x = 2437
integer y = 1568
integer width = 448
integer height = 160
integer taborder = 210
long backcolor = 80269524
end type

type cbx_preview from w_vzt_rpt_base`cbx_preview within w_vzt_rpt_processor
boolean visible = true
integer x = 1957
integer y = 1652
fontcharset fontcharset = ansi!
long backcolor = 80269524
end type

type tab_1 from w_vzt_rpt_base`tab_1 within w_vzt_rpt_processor
event ue_set_graph ( string as_grname )
integer x = 0
integer width = 2747
integer height = 1572
integer taborder = 140
boolean bringtotop = true
end type

event ue_set_graph;	is_graph = as_grname
end event

event tab_1::selectionchanged;call super::selectionchanged;integer li_odd
li_odd = (newindex/2) 
li_odd = li_odd * 2 

If li_odd <> newindex then 
	uo_zoom.visible 								= false
	cbx_preview.visible 							= false
	if isValid(im_menu) then im_menu.m_file.m_printpreview.visible 	= false
Else
	IF is_buttons ='Y' or gnv_appman.is_debugmode = 'Y' then
		uo_zoom.visible 		= true 
		cbx_preview.visible 	= true 
		if isValid(im_menu) then im_menu.m_file.m_printpreview.visible = true 		
	END IF 

End If


end event

event tab_1::ue_drilldown;If row <= 0 then return 1
int li_temp , li_defrow
li_temp = this.SelectedTab / 2
If li_temp * 2 = this.SelectedTab then // even tabpage = report, odd = parms
	ib_drilldown = true 
	adw_source.SelectRow(0, false)
	adw_source.SelectRow( row, true)
	string ls_report, ls_hier_id, ls_drilldown_report 
	datawindow ldw_curr_parms
	ls_report = dw_schedule.object.reportid [1] // hier id
	SELECT reportid into :ls_report FROM vzt_hierarchy where id = :ls_report and leafind = 'Y';
	IF SQLCA.sqlcode <> 0 then return 1
	SELECT drilldownreportid INTO :ls_drilldown_report FROM vzt_reportdef WHERE reportid = :ls_report ;
	If IsNull(ls_drilldown_report ) or ls_drilldown_report = '' then return 1
	// find first hierarchy leaf pointing to drill down report 
	SELECT id into :ls_hier_id FROM vzt_hierarchy where reportid = :ls_drilldown_report and leafind = 'Y';
	li_defrow = dw_def.Retrieve( ls_hier_id ) 
	dw_parms.Retrieve( ls_drilldown_report ,  trim(is_accessflags) )
	dw_parms.SetFilter( "parmtype <> 'DDCOLUMN'") // exclude drill down parms in target 
	dw_parms.Filter()

	// Propagate DDCOLUMN parameters
	ldw_curr_parms = tab_1.tabpage[ this.SelectedTab - 1 ].event dynamic ue_get_main_dw()	
	ldw_curr_parms.SetFilter( "parmtype = 'DDCOLUMN'")
	ldw_curr_parms.Filter()
	long ll_ddparm_row, ll_ddparms, ll_parmorder, ll_target_parm_row
	string ls_coltype, ls_colname, ls_tag, ls_parmtype
	ll_ddparms = ldw_curr_parms.RowCount()

	If ll_ddparms > 0 then 
		FOr ll_ddparm_row = 1 to ll_ddparms
			// get the column value from the current row, and set the target parm based on its 'where' tag
			ls_colname 	= trim( ldw_curr_parms.object.parmvalue [ll_ddparm_row ])
			ls_tag		= trim( ldw_curr_parms.object.wheretag  [ll_ddparm_row ])
			ls_coltype	= trim(Upper(adw_source.describe( ls_colname + ".ColType")))
			ll_target_parm_row = dw_parms.Find( "wheretag ='"+ls_tag+"'", 1, dw_parms.RowCount() )
			If ll_target_parm_row > 0 then // found matching tag replace the value
				ls_parmtype = trim( dw_parms.object.parmtype [ ll_target_parm_row ] ) 
				CHOOSE CASE ls_parmtype 
					CASE "STRING"
						dw_parms.object.parmvalue[ ll_target_parm_row ] = adw_source.GetItemString( row , ls_colname )
					CASE "DATE"
						dw_parms.object.parmdate[ ll_target_parm_row ] = adw_source.GetItemDatetime( row , ls_colname )						
					CASE "NUMBER"
						dw_parms.object.parmnum[ ll_target_parm_row ] = adw_source.GetItemNumber( row , ls_colname )
				END CHOOSE
			End if
		Next
	End If
	ldw_curr_parms.SetFilter( "1=1")
	ldw_curr_parms.Filter()
	dw_parms.SetFilter( "1=1")
	dw_parms.Filter()
	parent.event ue_submit_report("ONLINE", dw_def, dw_parms, dw_rpt, ls_hier_id  ) // hierarchy pointer
End If
ib_drilldown = false
return 1

	// Prepare drill down parms and submit report 
//	ll_pages = UpperBound(tab_1.tabpage[])
//	For ll_row = 2 to ll_pages step 2 
//			dw_parms = tab_1.tabpage[ll_row - 1 ].event dynamic ue_get_main_dw()
//			CHOOSE CASE istr_parms.mode
//				CASE "ONLINE"
//					ll_parms_count = dw_parms.Retrieve( dw_repdef.object.reportid [ ll_row/2 ], trim(_accessflags) ) 
//				CASE "BATCH", "BATCHOL"
//					ll_parms_count = dw_parms.RowCount() 
//			END CHOOSE		

end event

event tab_1::ue_print_cover;// ( called from ue_print of the tabpage )

if not cbx_cover.checked then return 
// Print Cover if requested... 

// Set up common template fields
string ls_cover_portrait, ls_cover_landscape, ls_cover_legal_portrait, ls_cover_legal_landscape 

	SELECT 	cover_portrait, 		
				cover_landscape, 		
				cover_legal , 				
				cover_legal_landscape
				
	INTO 		:ls_cover_portrait, 	
				:ls_cover_landscape, 
				:ls_cover_legal_portrait, 
				:ls_cover_legal_landscape 
				
	FROM ocmoptions WHERE appname = 'GLOBAL' USING SQLCA ; 
	
	If IsNull( ls_cover_portrait) 			then ls_cover_portrait= ''
	If IsNull( ls_cover_landscape) 			then ls_cover_landscape = ''
	If IsNull( ls_cover_legal_portrait) 	then ls_cover_legal_portrait= ''
	If IsNull( ls_cover_legal_landscape) 	then ls_cover_legal_landscape= ''

	IF TRIM(adw_target.Object.DataWindow.Print.Orientation) = '1' then // use landscape template
	   If TRIM(adw_target.Object.DataWindow.Print.Paper.Size) = '5' then // legal 8x14
			dw_cover.dataobject = 'd_report_cover_template_legal_landscape'
			If ls_cover_legal_landscape <> '' then dw_cover.Modify ( ls_cover_legal_landscape  )
		Else // regular size 
			dw_cover.dataobject = 'd_report_cover_template_landscape'
			If ls_cover_landscape <> '' then dw_cover.Modify ( ls_cover_landscape )						
		END IF 
	ELSE // use portrait
	   If TRIM(adw_target.Object.DataWindow.Print.Paper.Size) = '5' then // legal 8x14		
			dw_cover.dataobject = 'd_report_cover_template_legal_portrait'
			If ls_cover_legal_portrait <> '' then dw_cover.Modify ( ls_cover_legal_portrait )
		Else // regular size 
			dw_cover.dataobject = 'd_report_cover_template'
			If ls_cover_portrait <> '' then dw_cover.Modify ( ls_cover_portrait)						
		END IF 
	END IF 

// Copy text titles (must all be string computed fields !!!!!!!!!!! )
String 	ls_objects , ls_colname , ls_modret , ls_expr
int 		li_textboxes 
ls_objects = adw_target.Object.DataWindow.Objects
FOR li_textboxes = 1 to 10 
	ls_colname = 'report_title' + trim( string( li_textboxes ) )
	if POS( ls_objects, ls_colname) > 0 then 
		ls_expr 		= ls_colname + ".expression"
		ls_expr 		= adw_target.Describe( ls_expr) 
		If POS( ls_expr , '"') > 0 then 
			MEssageBox("Cover Page Error", "Double quotes are not allowed in titles.")
			Return
		END IF 
		ls_expr		= trim(  adw_target.Describe( 'evaluate("'+ ls_expr+ '",1)' ) )
		ls_expr		= ls_colname + ".text='" + ls_expr		+"'" 
		ls_modret 	= dw_cover.Modify(ls_expr)
	END IF 
NEXT 

if POS( ls_objects, 't_security') > 0 then 
	ls_expr		= adw_target.Object.t_security.text
	dw_cover.Object.t_security.text = ls_expr		
End If 	
dw_cover.Print()
end event

type dw_repdef from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2610
integer y = 956
integer width = 1591
integer height = 180
integer taborder = 110
string dataobject = "d_rpt_def_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type dw_repout from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2619
integer y = 1500
integer width = 1577
integer height = 224
integer taborder = 20
string dataobject = "d_vzt_reportoutput_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type cb_run_again from commandbutton within w_vzt_rpt_processor
boolean visible = false
integer x = 841
integer y = 1648
integer width = 338
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Run Again"
end type

event clicked;tab_1.idw_current.Retrieve() 
end event

type cb_show_sql from commandbutton within w_vzt_rpt_processor
boolean visible = false
integer x = 1211
integer y = 1648
integer width = 311
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Show SQL"
end type

event clicked;string  		ls_newsql 
ls_newsql 	= Upper(tab_1.idw_current.getSQLSelect())
Clipboard( ls_newsql ) 
MessageBox("VZT Reporter: Report SQL",  ls_newsql )
end event

type cb_show_syntax from commandbutton within w_vzt_rpt_processor
boolean visible = false
integer x = 1577
integer y = 1648
integer width = 329
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Show Syntax"
end type

event clicked;string ls_syntax 
ls_syntax = "$PBExportHeader$" +istr_parms.schedule_id +".srd~r~n"+ tab_1.idw_current.Describe("DataWindow.Syntax") 
Clipboard( ls_syntax ) 
MessageBox("VZT Reporter: Report Syntax",  ls_syntax )
end event

type dw_parms from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2665
integer y = 28
integer width = 1550
integer height = 268
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_parms_03"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type dw_def from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2647
integer y = 304
integer width = 1559
integer height = 288
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_rpt_def_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type dw_rpt from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 3730
integer y = 1148
integer width = 645
integer height = 388
integer taborder = 60
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type dw_schedule from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2642
integer y = 604
integer width = 1586
integer height = 324
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_schedule"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = this 
end event

event dberror;CHOOSE CASE istr_parms.mode 
	CASE 'DISPLAY' , 'ONLINE', "EXPORT"
		return 0 
	CASE 'BATCHOL'
		return 1 
END CHOOSE

return 0 
end event

type cbx_cover from checkbox within w_vzt_rpt_processor
boolean visible = false
integer x = 1294
integer y = 1652
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Cover Page"
end type

type dw_cover from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2647
integer y = 940
integer width = 512
integer height = 276
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_report_cover_template"
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type st_data from statictext within w_vzt_rpt_processor
boolean visible = false
integer x = 2469
integer y = 1584
integer width = 466
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 65535
long backcolor = 8388608
string text = "graph info"
alignment alignment = center!
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_distribution from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2784
integer y = 1236
integer width = 1842
integer height = 172
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_contact_list_ids"
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

type p_1 from picture within w_vzt_rpt_processor
boolean visible = false
integer x = 1033
integer y = 428
integer width = 960
integer height = 492
boolean bringtotop = true
boolean originalsize = true
string picturename = "stpwtch2a.bmp"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_remote_connections from uo_vzt_dwbase within w_vzt_rpt_processor
boolean visible = false
integer x = 2752
integer y = 548
integer width = 411
integer height = 376
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_report_remote_connections"
borderstyle borderstyle = stylebox!
end type

