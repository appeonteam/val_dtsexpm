$PBExportHeader$w_vzt_rpt_base.srw
forward
global type w_vzt_rpt_base from w_vzt_base
end type
type uo_zoom from uo_zoom_slide within w_vzt_rpt_base
end type
type cbx_preview from checkbox within w_vzt_rpt_base
end type
type tab_1 from uo_tab_base within w_vzt_rpt_base
end type
type tab_1 from uo_tab_base within w_vzt_rpt_base
end type
end forward

global type w_vzt_rpt_base from w_vzt_base
integer width = 2638
integer height = 1780
string title = "Report Display"
event type integer ue_submit_report ( string as_mode,  ref datawindow adw_def,  ref datawindow adw_parms,  ref datawindow adw_rpt,  string as_hier_id )
event ue_distribute_report ( )
event menu_saveas_init ( )
uo_zoom uo_zoom
cbx_preview cbx_preview
tab_1 tab_1
end type
global w_vzt_rpt_base w_vzt_rpt_base

type variables
string     is_search_do
string     is_report_do
boolean    _resetdataobjectonsearch = false
uo_vzt_mail	inv_mail
uo_vzt_dates	inv_dates

transaction	i_tran_remote
boolean		ib_use_remote
end variables

event ue_submit_report;return f_submit_report( as_mode, adw_def, adw_parms, adw_rpt, as_hier_id)

end event

event menu_saveas_init();// Init PDF option 

//tab_1.idw_current.Object.Datawindow.Export.PDF.Method = XSLFOP! 
//tab_1.idw_current.Object.Datawindow.Export.PDF.XSLFOP.print = 'Yes' 
//dw_schedule.Object.Datawindow.Export.PDF.Method = DISTILL! 
//dw_schedule.Object.Datawindow.Export.PDF.DISTILL.CustomPOstScript = 'No' 


end event

on w_vzt_rpt_base.create
int iCurrent
call super::create
this.uo_zoom=create uo_zoom
this.cbx_preview=create cbx_preview
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_zoom
this.Control[iCurrent+2]=this.cbx_preview
this.Control[iCurrent+3]=this.tab_1
end on

on w_vzt_rpt_base.destroy
call super::destroy
destroy(this.uo_zoom)
destroy(this.cbx_preview)
destroy(this.tab_1)
end on

event open;call super::open;ib_resizeenabled 	= true 
is_search_do 		= dw_primary.dataobject
it_main_tab 		= tab_1
tab_1.w_parent 	= this 
tab_1.iuo_zoom 	= this.uo_zoom 

inv_dates = CREATE uo_vzt_dates
end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
	//	cb_print.y 		= newheight - ii_resizeband_y - cb_print.height
		st_foundrecs.y= newheight - ii_resizeband_y - st_foundrecs.height 
		uo_zoom.y		= newheight -  uo_zoom.height - ii_resizeband_y /2 
//		tab_1.x = _resizeband_x / 2
//		tab_1.y = _resizeband_y / 2	
		If uo_zoom.visible then 
			tab_1.height	= uo_zoom.y - tab_1.y  -  ii_resizeband_y 
		Else
			tab_1.height	= cb_save.y - tab_1.y  -  ii_resizeband_y 
		End if
		tab_1.width		= newwidth  - tab_1.x * 2 		
		tab_1.Event dynamic ue_resize( tab_1.width, tab_1.height) // allow the tab to resize the insides :)) 
		cb_close.y		= newheight - ii_resizeband_y - cb_close.height
		cbx_preview.y	=	newheight -	 cbx_preview.height - ii_resizeband_y 		
	End IF 
End IF 	
end event

event menu_print_all;call super::menu_print_all;tab_1.event ue_print_all()
end event

event menu_print;//override
tab_1.event dynamic ue_print()
end event

event menu_print_preview;call super::menu_print_preview;If IsValid( tab_1.idw_current ) then 
	If upper(trim(tab_1.idw_current.object.DataWindow.Print.Preview))='YES' then 
		tab_1.idw_current.object.DataWindow.Print.Preview='No' 
		uo_zoom.uf_settarget( tab_1.idw_current )
		cbx_preview.checked = false				
	Else
		tab_1.idw_current.object.DataWindow.Print.Preview='Yes' 
		uo_zoom.uf_settarget( tab_1.idw_current )		
		cbx_preview.checked = true 		
	End If
End If

end event

event close;if isvalid( inv_mail) then destroy inv_mail
if isvalid( inv_dates) then destroy inv_dates
end event

event menu_saveas;call super::menu_saveas;this.event menu_saveas_init()
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_rpt_base
boolean visible = false
integer x = 18
integer taborder = 100
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_rpt_base
end type

type cb_close from w_vzt_base`cb_close within w_vzt_rpt_base
integer x = 2304
integer y = 1580
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_rpt_base
integer taborder = 110
end type

type cb_save from w_vzt_base`cb_save within w_vzt_rpt_base
integer x = 389
integer y = 1584
integer width = 251
end type

type cb_select from w_vzt_base`cb_select within w_vzt_rpt_base
boolean visible = false
integer y = 1520
integer width = 283
end type

type cb_new from w_vzt_base`cb_new within w_vzt_rpt_base
boolean visible = false
integer x = 1298
integer y = 1520
integer width = 293
integer taborder = 90
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_rpt_base
boolean visible = false
integer x = 18
integer y = 1584
integer width = 347
end type

type cb_search from w_vzt_base`cb_search within w_vzt_rpt_base
integer y = 1584
integer width = 270
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_rpt_base
boolean visible = false
integer x = 933
integer y = 1520
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type st_stop from w_vzt_base`st_stop within w_vzt_rpt_base
integer x = 2144
integer y = 1504
end type

type dw_data from w_vzt_base`dw_data within w_vzt_rpt_base
boolean visible = false
integer x = 2254
integer y = 12
integer width = 270
integer height = 148
end type

type dw_print from w_vzt_base`dw_print within w_vzt_rpt_base
integer taborder = 120
end type

type uo_zoom from uo_zoom_slide within w_vzt_rpt_base
integer x = 1742
integer y = 1500
integer width = 393
integer height = 156
integer taborder = 80
long backcolor = 80269528
end type

on uo_zoom.destroy
call uo_zoom_slide::destroy
end on

event constructor;call super::constructor;this.dw_target = dw_primary
end event

type cbx_preview from checkbox within w_vzt_rpt_base
boolean visible = false
integer x = 1262
integer y = 1568
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Print Preview"
end type

event clicked;iw_mywindow.EVENT menu_print_preview() 
end event

type tab_1 from uo_tab_base within w_vzt_rpt_base
integer x = 9
integer width = 2551
integer height = 1476
integer taborder = 10
end type

event selectionchanged;call super::selectionchanged;If IsValid( tab_1.idw_current ) then 
	cbx_preview.checked = false				
	If tab_1.idw_current.RowCOunt() > 0 then 
		If upper(trim(tab_1.idw_current.object.DataWindow.Print.Preview))='YES' then 
			cbx_preview.checked = true 		
		End If
	End If		
End If

end event

