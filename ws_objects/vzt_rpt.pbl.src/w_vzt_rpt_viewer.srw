$PBExportHeader$w_vzt_rpt_viewer.srw
forward
global type w_vzt_rpt_viewer from w_vzt_rpt_processor
end type
end forward

global type w_vzt_rpt_viewer from w_vzt_rpt_processor
integer x = 73
integer y = 24
integer width = 3442
integer height = 2120
string menuname = "m_vzt_rpt_viewer"
end type
global w_vzt_rpt_viewer w_vzt_rpt_viewer

on w_vzt_rpt_viewer.create
int iCurrent
call super::create
if this.MenuName = "m_vzt_rpt_viewer" then this.MenuID = create m_vzt_rpt_viewer
end on

on w_vzt_rpt_viewer.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;//overr
istr_parms = Message.PowerObjectParm
If not IsValid ( istr_parms) then 
	POST close(this) 
	return
End If

dw_primary 					= dw_data
dw_primary_list 			= dw_mainlist
dw_primary.ist_x_of_y 	= st_foundrecs
iw_mywindow = this
ib_resizeenabled 	= true 
is_search_do 		= dw_primary.dataobject
it_main_tab 		= tab_1
tab_1.w_parent 	= this 
tab_1.iuo_zoom 	= this.uo_zoom 

string 	ls_newsql
long 		ll_rc

ib_closebtn_on_right= false

this.visible =  false

//	CASE "DISPLAYF" 							// find the output of the report and just display it
	this.event ue_display_report_file()

IF is_buttons ='Y' then
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

event ue_check_graph;//overr
string ls_objects 
menu l_menu

	ls_objects = ldw_rpt.Object.DataWindow.Objects
	idw_rpt 						= ldw_rpt
	
	if POS(ls_objects, 'gr_') > 0 then 
		idw_rpt.ib_graph 		= true 
		uo_zoom.visible 		= false
		cbx_preview.visible 	= false
		
		//this.ChangeMenu(m_vzt_rpt_master) 
		l_menu = this.menuid 
//		l_menu.dynamic of_enable_graph( true )
	End If
	
	idw_rpt.ist_display 			= st_data
	
	
end event

type uo_trace01 from w_vzt_rpt_processor`uo_trace01 within w_vzt_rpt_viewer
end type

type dw_mainlist from w_vzt_rpt_processor`dw_mainlist within w_vzt_rpt_viewer
end type

type cb_last_search from w_vzt_rpt_processor`cb_last_search within w_vzt_rpt_viewer
end type

type cb_close from w_vzt_rpt_processor`cb_close within w_vzt_rpt_viewer
end type

type cb_delete1 from w_vzt_rpt_processor`cb_delete1 within w_vzt_rpt_viewer
end type

type cb_save from w_vzt_rpt_processor`cb_save within w_vzt_rpt_viewer
end type

type cb_select from w_vzt_rpt_processor`cb_select within w_vzt_rpt_viewer
end type

type cb_new from w_vzt_rpt_processor`cb_new within w_vzt_rpt_viewer
end type

type cb_newsearch from w_vzt_rpt_processor`cb_newsearch within w_vzt_rpt_viewer
end type

type cb_search from w_vzt_rpt_processor`cb_search within w_vzt_rpt_viewer
end type

type st_foundrecs from w_vzt_rpt_processor`st_foundrecs within w_vzt_rpt_viewer
end type

type st_stop from w_vzt_rpt_processor`st_stop within w_vzt_rpt_viewer
end type

type dw_data from w_vzt_rpt_processor`dw_data within w_vzt_rpt_viewer
end type

type dw_print from w_vzt_rpt_processor`dw_print within w_vzt_rpt_viewer
end type

type uo_zoom from w_vzt_rpt_processor`uo_zoom within w_vzt_rpt_viewer
end type

type cbx_preview from w_vzt_rpt_processor`cbx_preview within w_vzt_rpt_viewer
end type

type tab_1 from w_vzt_rpt_processor`tab_1 within w_vzt_rpt_viewer
end type

type dw_repdef from w_vzt_rpt_processor`dw_repdef within w_vzt_rpt_viewer
end type

type dw_repout from w_vzt_rpt_processor`dw_repout within w_vzt_rpt_viewer
end type

type cb_run_again from w_vzt_rpt_processor`cb_run_again within w_vzt_rpt_viewer
end type

type cb_show_sql from w_vzt_rpt_processor`cb_show_sql within w_vzt_rpt_viewer
end type

type cb_show_syntax from w_vzt_rpt_processor`cb_show_syntax within w_vzt_rpt_viewer
end type

type dw_parms from w_vzt_rpt_processor`dw_parms within w_vzt_rpt_viewer
end type

type dw_def from w_vzt_rpt_processor`dw_def within w_vzt_rpt_viewer
end type

type dw_rpt from w_vzt_rpt_processor`dw_rpt within w_vzt_rpt_viewer
end type

type dw_schedule from w_vzt_rpt_processor`dw_schedule within w_vzt_rpt_viewer
end type

type cbx_cover from w_vzt_rpt_processor`cbx_cover within w_vzt_rpt_viewer
end type

type dw_cover from w_vzt_rpt_processor`dw_cover within w_vzt_rpt_viewer
end type

type st_data from w_vzt_rpt_processor`st_data within w_vzt_rpt_viewer
end type

type dw_distribution from w_vzt_rpt_processor`dw_distribution within w_vzt_rpt_viewer
end type

type p_1 from w_vzt_rpt_processor`p_1 within w_vzt_rpt_viewer
end type

type dw_remote_connections from w_vzt_rpt_processor`dw_remote_connections within w_vzt_rpt_viewer
end type

