$PBExportHeader$w_vzt_alec_report_def.srw
forward
global type w_vzt_alec_report_def from w_vzt_mm_report_def
end type
type cb_rebuild from commandbutton within w_vzt_alec_report_def
end type
type cb_resetcount from commandbutton within w_vzt_alec_report_def
end type
type cb_export from commandbutton within w_vzt_alec_report_def
end type
end forward

global type w_vzt_alec_report_def from w_vzt_mm_report_def
integer width = 2464
integer height = 2044
string title = "Alec!  Reports and Graphs"
cb_rebuild cb_rebuild
cb_resetcount cb_resetcount
cb_export cb_export
end type
global w_vzt_alec_report_def w_vzt_alec_report_def

on w_vzt_alec_report_def.create
int iCurrent
call super::create
this.cb_rebuild=create cb_rebuild
this.cb_resetcount=create cb_resetcount
this.cb_export=create cb_export
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_rebuild
this.Control[iCurrent+2]=this.cb_resetcount
this.Control[iCurrent+3]=this.cb_export
end on

on w_vzt_alec_report_def.destroy
call super::destroy
destroy(this.cb_rebuild)
destroy(this.cb_resetcount)
destroy(this.cb_export)
end on

event open;call super::open;tab_1.tabpage[2].visible = true
tab_1.tabpage[3].visible = true

end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_rebuild.y 		= newheight - ii_resizeband_y - cb_rebuild.height
		cb_resetcount.y 	= newheight - ii_resizeband_y - cb_resetcount.height
		cb_export.y 		= newheight - ii_resizeband_y 	- cb_export.height
		
//	//	dw_mainlist.width = newwidth  - dw_mainlist.x * 2 		
//		If newwidth > 2634 then 
//			cb_close.x = newwidth - cb_close.width - ii_resizeband_x
//		End If 
	End IF 
End IF 	
end event

event ue_save_review_check;//overr
If ii_savestatus < 5  then return //only rebuild on request from alec
string  	ls_temp ,  ls_repid, ls_syntax, ls_bmp_data
long 		ll_len, ll_next = 1, ll_rc, ll_objects, ll_obj, ll_dot
string 	ls_rpt_do='' , ls_parms_do ='', ls_objects, ls_obj_array[],ls_filename
blob 		lb_bitmap	
blob blob_syntax_and_data

setpointer(Hourglass!)

if idw_def.RowCount() > 0 then 
	ls_rpt_do	=  trim( idw_def.object.dwdataobjectname [ idw_def.GetRow()])
	ls_repid		=	trim( idw_def.object.reportid[ idw_def.GetRow()])

	If Not IsNull( ls_rpt_do ) and ls_rpt_do <> '' then 
		idw_rpt.dataobject 	= ls_rpt_do
		 
		ll_rc = f_dw_to_syntax_and_data ( idw_rpt, 	true, blob_syntax_and_data ) // report object 
		if len(blob_syntax_and_data) < 20 then
			MessageBox('VZT Report Creation Error','Report source is missing.', stopsign!)
			ii_savestatus = -100
			return 
		END IF
	//	blob_syntax_and_data = blob_syntax_and_data  		//+ blob( "0000000" )
		// add bitmaps  to blob ... 
		ls_objects = idw_rpt.Object.DataWindow.Objects 
		clipboard( ls_objects)
		ll_objects = f_vzt_parse( ls_objects, ls_obj_array, '~t' ) 
		lb_bitmap = blob('')
		FOR ll_obj = 1 to ll_objects
			IF MID( ls_obj_array[ll_obj], 1, 2) = 'p_' then // get file name 
				ls_filename = idw_rpt.Describe( ls_obj_array[ll_obj] + '.filename' ) 
				ll_len = f_vzt_readfile_to_blob( ls_filename , lb_bitmap)
				ll_len = len (lb_bitmap) 
				ll_dot = POS ( ls_filename, '.') 
				If ll_dot > 0 then
					ls_filename = MID( ls_filename , ll_dot + 1)
					ls_bmp_data = 	string(len(ls_obj_array[ll_obj]),'00000000') + &
										string(len(ls_filename), 			'00000000') + &
										string(ll_len, 						'00000000') + &
										ls_obj_array[ll_obj] + ls_filename 
					blob_syntax_and_data = blob_syntax_and_data + blob(ls_bmp_data) +lb_bitmap
				END IF
			END IF
		NEXT 
		UPDATEBLOB  "VZT_REPORTDEF" SET "DWSYNTAX" = :blob_syntax_and_data WHERE "REPORTID" = :ls_repid ;
		f_vzt_writefile_from_blob( 'C:\TMP_BMP_TEST.BMP', lb_bitmap)
		f_vzt_writefile_from_blob( 'C:\TMP_BMP_TEST.TXT', blob_syntax_and_data)
	End If // empty def	
end if 




end event

type cb_dfilter from w_vzt_mm_report_def`cb_dfilter within w_vzt_alec_report_def
end type

type uo_trace01 from w_vzt_mm_report_def`uo_trace01 within w_vzt_alec_report_def
end type

type dw_mainlist from w_vzt_mm_report_def`dw_mainlist within w_vzt_alec_report_def
integer width = 2386
integer taborder = 160
end type

type cb_last_search from w_vzt_mm_report_def`cb_last_search within w_vzt_alec_report_def
end type

type cb_close from w_vzt_mm_report_def`cb_close within w_vzt_alec_report_def
integer x = 2213
integer y = 1848
end type

type cb_delete1 from w_vzt_mm_report_def`cb_delete1 within w_vzt_alec_report_def
integer taborder = 120
end type

type cb_save from w_vzt_mm_report_def`cb_save within w_vzt_alec_report_def
integer y = 1848
integer taborder = 130
end type

type cb_select from w_vzt_mm_report_def`cb_select within w_vzt_alec_report_def
integer taborder = 110
end type

type cb_new from w_vzt_mm_report_def`cb_new within w_vzt_alec_report_def
integer taborder = 150
end type

type cb_newsearch from w_vzt_mm_report_def`cb_newsearch within w_vzt_alec_report_def
integer y = 1804
integer taborder = 90
end type

type cb_search from w_vzt_mm_report_def`cb_search within w_vzt_alec_report_def
integer y = 1804
integer taborder = 80
end type

type st_foundrecs from w_vzt_mm_report_def`st_foundrecs within w_vzt_alec_report_def
end type

type st_stop from w_vzt_mm_report_def`st_stop within w_vzt_alec_report_def
end type

type dw_data from w_vzt_mm_report_def`dw_data within w_vzt_alec_report_def
end type

type dw_print from w_vzt_mm_report_def`dw_print within w_vzt_alec_report_def
integer taborder = 180
end type

type uo_ddcal from w_vzt_mm_report_def`uo_ddcal within w_vzt_alec_report_def
end type

type uo_zoom from w_vzt_mm_report_def`uo_zoom within w_vzt_alec_report_def
integer y = 1748
integer taborder = 140
end type

type cbx_preview from w_vzt_mm_report_def`cbx_preview within w_vzt_alec_report_def
end type

type tab_1 from w_vzt_mm_report_def`tab_1 within w_vzt_alec_report_def
integer y = 496
integer width = 2395
integer height = 1340
integer taborder = 70
end type

type dw_schedule from w_vzt_mm_report_def`dw_schedule within w_vzt_alec_report_def
end type

type cb_run_online from w_vzt_mm_report_def`cb_run_online within w_vzt_alec_report_def
integer y = 1848
integer taborder = 170
fontcharset fontcharset = ansi!
end type

event cb_run_online::clicked;//overr
parent.event ue_submit_report("BATCH", idw_def, idw_parms, idw_rpt, istr_parms.report_id  ) // hierarchy pointer

end event

type dw_exe_test from w_vzt_mm_report_def`dw_exe_test within w_vzt_alec_report_def
integer taborder = 100
end type

type cb_reload from w_vzt_mm_report_def`cb_reload within w_vzt_alec_report_def
integer y = 1840
end type

type cb_rebuild from commandbutton within w_vzt_alec_report_def
integer x = 704
integer y = 1848
integer width = 457
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rebuild Reports"
end type

event clicked;setpointer(Hourglass!)
long ll_maxrows, ll_row, ll_rc

long ll_list_row, ll_list_rows
string ls_reportid

ll_list_rows = dw_mainlist.RowCount() 

For ll_list_row = 1 to ll_list_rows 
	dw_mainlist.SetRow( ll_list_row )
	dw_mainlist.ScrollToRow( ll_list_row )
	
	ll_maxrows = idw_def.RowCount() 
	if ll_maxrows > 0 then 
		ls_reportid = idw_def.GetItemString(1, "reportid") 
		ii_savestatus = 5
		iw_mywindow.event ue_save_review_check() // save blob 
		
		If ii_savestatus > 0  and  SQLCA.sqlcode = 0 then 
			commit using SQLCA;
		ELSE
			Rollback using SQLCA;
			Messagebox("Report Object Creation", "Object Creation failed.", stopsign!)
			return -10
		End If
	end if 
next 

Messagebox("Report Object Creation", "Report Objects created.")

end event

type cb_resetcount from commandbutton within w_vzt_alec_report_def
integer x = 1202
integer y = 1848
integer width = 352
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset Stats"
end type

event clicked;if idw_def.rowcount() > 0 then 
	idw_def.SetItem( idw_def.getrow(), "parmcount", 0)
	idw_def.SetItem( idw_def.getrow(), "countstartdate", f_sysdate() )
	idw_def.SetItem( idw_def.getrow(), "averageruntime" , datetime( date('01/01/1960'), time("00:00:00") ))
	idw_def.groupcalc()
	parent.POST event ue_save_all()
End IF
end event

type cb_export from commandbutton within w_vzt_alec_report_def
integer x = 1577
integer y = 1848
integer width = 567
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export Report Source"
end type

event clicked;istr_run_parms.mode = "EXPORT"
istr_run_parms.schedule_id = idw_def.object.dwdataobjectname [ idw_def.GetRow() ]
istr_run_parms.report_id = istr_parms.report_id // hierarchy pointer 
int li_rc 

openwithparm( w_vzt_rpt_processor, istr_run_parms )		

end event

