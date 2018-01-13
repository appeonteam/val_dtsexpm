$PBExportHeader$w_vzt_base.srw
forward
global type w_vzt_base from window
end type
type cb_tmpl from commandbutton within w_vzt_base
end type
type cb_dfilter from commandbutton within w_vzt_base
end type
type uo_trace01 from nvo_trace within w_vzt_base
end type
type dw_mainlist from uo_vzt_dwbase within w_vzt_base
end type
type cb_last_search from commandbutton within w_vzt_base
end type
type cb_close from commandbutton within w_vzt_base
end type
type cb_delete1 from commandbutton within w_vzt_base
end type
type cb_save from commandbutton within w_vzt_base
end type
type cb_select from commandbutton within w_vzt_base
end type
type cb_new from commandbutton within w_vzt_base
end type
type cb_newsearch from commandbutton within w_vzt_base
end type
type cb_search from commandbutton within w_vzt_base
end type
type st_foundrecs from statictext within w_vzt_base
end type
type st_stop from statictext within w_vzt_base
end type
type dw_data from uo_vzt_dwbase within w_vzt_base
end type
type dw_print from datawindow within w_vzt_base
end type
type uo_ddcal from u_vzt_ddcal_inline within w_vzt_base
end type
end forward

global type w_vzt_base from window
integer x = 178
integer y = 300
integer width = 2971
integer height = 1088
boolean titlebar = true
string title = "Base Window Object"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79349703
event type integer pfc_messagerouter ( string as_event )
event menu_new ( )
event menu_save ( )
event menu_search ( )
event menu_newsearch ( )
event menu_exit ( )
event menu_saveas ( )
event menu_open ( )
event menu_print ( )
event type integer menu_saveas_prepare_dw ( )
event ue_postsearch ( )
event ue_save_validate ( )
event ue_save_all ( )
event ue_save_commit ( )
event ue_save_rollback ( )
event ue_save_validate_required ( )
event ue_save_review_check ( )
event ue_save_review_prepare ( )
event ue_postopen_01 ( )
event menu_print_all ( )
event type integer ue_delete ( ref datawindow adw_target,  long al_row,  boolean ab_immediate )
event type integer menu_saveas_check_keys ( )
event menu_delete ( )
event type integer ue_delete_children ( ref datawindow adw_target,  long al_row )
event menu_print_preview ( )
event ue_assign_menu ( )
event ue_visibleonopen ( )
event ue_postsearchempty ( )
event menu_print_prepare ( )
event ue_cb_new ( )
event type integer ue_search ( )
event menu_copy ( )
event ue_printscreen ( )
event ue_save_validate_page ( )
event ue_localize ( )
event ue_reset_popups ( )
event ue_retrieve_links ( )
event ue_id_change ( )
event ue_mail_report_get ( )
event ue_mail_report_to_dist ( )
event ue_mail_report_save2file ( string as_filename,  ref datawindow adw_rpt )
event ue_save_tab_select ( )
event ue_date_lookup_end ( )
event ue_date_lookup_start ( ref uo_vzt_dwbase adwtarget,  string ascolname,  integer ax,  integer ay )
event ue_setcolor ( )
event ue_save_aftersave ( )
event ue_dfilter ( )
event ue_dfilter_readini ( )
event ue_lock ( boolean ab_lock )
event ue_setcolor_tab ( ref windowobject awo,  long al_fcolor,  long al_bcolor,  string as_font )
event ue_setcolor_dw ( windowobject awo,  long al_fcolor,  long al_bcolor,  string as_font )
event type string ue_access_check ( )
event ue_postsearch_sort ( )
event ue_access_menu_check ( )
cb_tmpl cb_tmpl
cb_dfilter cb_dfilter
uo_trace01 uo_trace01
dw_mainlist dw_mainlist
cb_last_search cb_last_search
cb_close cb_close
cb_delete1 cb_delete1
cb_save cb_save
cb_select cb_select
cb_new cb_new
cb_newsearch cb_newsearch
cb_search cb_search
st_foundrecs st_foundrecs
st_stop st_stop
dw_data dw_data
dw_print dw_print
uo_ddcal uo_ddcal
end type
global w_vzt_base w_vzt_base

type variables
w_vzt_base  iw_Window 

// HTTP retrieval 
boolean 		ib_http
string		is_url, is_args, is_http_data, is_page

// Styles 
boolean		ib_use_styles = true 
long 			il_bcolor, il_fcolor
string			is_font

//locking:
boolean		ib_locked = false
string			is_lock_type ='' // S = single, M = master-detail type
string			is_lock_owner  = 'TRIAL' 
boolean		ib_audit

nvo_trace   uo_maintrace

boolean		ib_new_allowed = FALSE 	, 			ib_search_same_x = false
boolean		ib_selecting = FALSE
boolean		ib_doingnew = FALSE
boolean 		ib_scrolling = false, ib_autoscroll=TRUE
boolean		ib_searchinprogress = false 
boolean		ib_newsearch = false 
boolean		ib_searching = FALSE, ib_do_required=FALSE
boolean		ib_setrowonscroll=TRUE //------
boolean 		ib_resizeenabled = false
boolean		ib_closebtn_on_right= true, 	ib_stay_tab_on_save=true, ib_stay_tab_on_row_chg=true 
integer		ii_savestatus,						ii_tab_on_save=0, ii_init_tab = 0
integer 		ii_resizeband_x = 40 
integer 		ii_resizeband_y = 10 
integer		ii_retrieve_rc
long			ib_maxdatacolumns 
string 		is_updateable_titles[]
boolean 		ib_displayupdateprogress = false
uo_vzt_dwbase	idw_updateable []
uo_vzt_dwbase	idw_selectable[]
uo_vzt_dwbase	idw_searchable[]
uo_vzt_dwbase	idw_refreshable[]
uo_vzt_dwbase	dw_primary, dw_primary_list
integer 		ii_updatable_count=0
w_vzt_base 	iw_mywindow

tab  			it_main_tab
boolean		ib_tabsecurity = false 
double		id_main_id , id_main_id_prev // primary record key for 1-many tabs

string      	is_accessflags
string  		is_data_delim = "..####.." , is_end_delim = '..$@$..'
datawindow 	dw_report
m_vzt_master 	im_menu // menu pointer
string  	 	is_w_printoptions = "w_vzt_pagerange"
string			is_last_search_sql=''
inet			iinet_base

string 		is_rpt_pdf_style
string 		is_rpt_format , is_vzrfile	,is_pdffile	
blob			ib_rptblob

// dfilter related 
str_response istr_filter_parms
string 		 is_dfilter[], is_dfilter_label='screenname'

end variables

forward prototypes
public subroutine wf_enabletab (ref tab at_tab, boolean ab_enabled)
public subroutine wf_linked_scroll (ref datawindow adw_from, ref datawindow adw_to, ref datawindow adw_list)
public subroutine wf_linked_scroll (ref datawindow adw_from, ref datawindow adw_to, ref uo_vzt_dwbase adw_list)
public function integer wf_setdefaultbutton (ref commandbutton ab_target)
public function string wf_get_dw_title (integer ai_update_dw)
public function integer wf_gotourl (string as_url)
public function integer wf_tran_end (transaction a_tran, boolean ab_commit, boolean ab_rollback, string as_hdr, string as_msgok, string as_msgerror, integer an_nrows_expected)
public subroutine wf_setupdateable (ref uo_vzt_dwbase adw_target, string as_title, boolean ab_selectable, boolean ab_searchable)
public subroutine wf_setupdateable (ref uo_vzt_dwbase adw_target, string as_title, boolean ab_selectable, boolean ab_searchable, boolean ab_refreshable)
public subroutine wf_setupdateable (ref uo_vzt_dwbase adw_target, string as_title, boolean ab_selectable)
end prototypes

event pfc_messagerouter;CHOOSE CASE as_event
	CASE 'pfc_new' 
		this.event menu_new()
	CASE 'pfc_del' 
		this.event menu_delete()
	CASE 'pfc_open' 
		this.event menu_open()		
	CASE 'pfc_close' 
		this.event menu_exit()				
	CASE 'pfc_save' 
		this.event menu_save()				
	CASE 'pfc_saveas' 		
		this.event menu_saveAs()
	CASE 'pfc_print' 
		this.event menu_print()				
	CASE 'pfc_print_all' 
		this.event menu_print_all()				
	CASE 'pfc_printpreview' 
		this.event menu_print_preview()	

	CASE 'pfc_pagesetup' 
		PrintSetup ( )
	CASE 'pfc_printimmediate' 		
	CASE 'pfc_undo' 		
		this.event dynamic menu_undo()			
	CASE 'pfc_cut' 		
		this.event  dynamic menu_cut()			
	CASE 'pfc_paste' 		
		this.event  dynamic menu_paste()			
	CASE 'pfc_copy'
		this.event menu_copy()			
	CASE 'pfc_clear'
		this.event  dynamic menu_clear()			
	CASE 'pfc_finddlg' 		// new search ??
	CASE ELSE

END CHOOSE


return 1
end event

event menu_new;if cb_new.visible then 
	cb_new.event clicked()
Else
	If IsValid( it_main_tab) then
		it_main_tab.event dynamic menu_new ()
	End If
End If	
end event

event menu_save;if POS(is_accessflags, 'W') > 0 and &
	(cb_delete1.visible and cb_delete1.enabled) or (cb_save.visible and cb_save.enabled ) then 
	cb_save.event clicked()
END IF 
end event

event menu_search;if cb_search.visible then cb_search.event clicked()
end event

event menu_newsearch;if cb_newsearch.visible then cb_newsearch.event clicked()
end event

event menu_exit;close( this)
end event

event menu_saveas;if cb_save.visible then 
	// 
	If MessageBox("Save As New Record", "Are you sure that you want to save this record as new?", Question!, yesno!) = 1 then
		if this.event menu_saveas_check_keys() < 0 then return 
		if this.event menu_saveas_prepare_dw() < 0 then return 
		//cb_save.event clicked()
		this.event ue_save_all() 

	End If
	
End If
end event

event menu_print;// default print logic. 
datawindow ldw_printtarget
boolean lb_print_me = false

this.event menu_print_prepare() // do preprocessing logic before printing

If Not IsNull( dw_print.dataobject ) and dw_print.dataobject <> '' then 
	If dw_primary.rowcount() > 0 then 
		dw_print.Reset()
		dw_primary.rowscopy(1,dw_primary.rowcount(),Primary!,dw_print,1,Primary!)
		ldw_printtarget = dw_print
		lb_print_me = true 
	End If
Else

	If IsValid( dw_report ) then
		If IsValid( dw_report.object ) then
			If not isNull (dw_report.object ) then 
				ldw_printtarget = dw_report
				lb_print_me = true 
			End If
		End If
	End If						
	If not lb_print_me then 	
		ldw_printtarget = dw_primary
		lb_print_me = true 
	End if 
End If

If lb_print_me then 
	window w_to_open
	openWithParm( w_to_open, ldw_printtarget, is_w_printoptions) 
	string ls_temp 
	ls_temp = ldw_printtarget.object.Datawindow.Print.Page.Range 
	ls_temp = ldw_printtarget.object.Datawindow.Print.Page.RangeInclude	
	ls_temp = string(ldw_printtarget.object.Datawindow.Print.Copies )
	If Message.StringParm = '1' then 	ldw_printtarget.Print()
End IF 

end event

event menu_saveas_prepare_dw;// set required flags to make dw look like new

long ll_row
ll_row = dw_primary.GetRow()
if ll_row > 0 then 
	dw_primary.SetItemStatus( ll_row , 0, Primary!, New!)
	dw_primary.SetItemStatus( ll_row , 0, Primary!, NewModified!)
End If

return 1
end event

event ue_postsearch();long ll_recs
ll_recs = dw_primary.ROwCOunt()

if ll_recs <=0 then
	st_foundrecs.text = '0 of 0'
	st_foundrecs.visible = true
	this.event ue_postsearchempty ()
	return 
END IF 

iw_mywindow.wf_enabletab ( it_main_tab, true )
st_foundrecs.text = " 1 of "+ string(ll_recs )
st_foundrecs.visible = true 

If IsValid( dw_primary_list) AND f_nvl(dw_primary_list.dataobject,'') <> '' then 
	int li_rc 
	li_rc = dw_primary.ShareData( dw_primary_list) 
	if li_rc <> 1 then 
		MessageBox("W_VZT_BASE PostSearch Error", "Failed to share '"+dw_primary_list.dataobject + "' and '" +dw_primary_list.dataobject +"'")
	END IF
	
	If ll_recs > 0 then 
		dw_primary_list.visible = true 
		dw_primary.EVENT rowfocuschanged (1) 
		dw_primary_list.SelectRow( 1, true)
		cb_select.visible = true 
	End If 
End If 
this.event ue_postsearch_sort ()

ib_searchinprogress = false 


end event

event ue_save_validate;integer li_update_dw 
string  ls_title

For li_update_dw = 1 to UpperBound(idw_updateable[])
	ls_title = wf_get_dw_title ( li_update_dw )
	if not isValid( idw_updateable[ li_update_dw ] ) then continue 
	if f_nvl(idw_updateable[ li_update_dw ].dataobject, '') = ''  then continue
	if idw_updateable[ li_update_dw ].acceptText() <> 1 then 
		messageBox("Data Validation Error", "Error "+ls_title+". ~r~nCheck Data Window input.")
		ii_savestatus = -1
		EXIT 
	end if
Next


end event

event ue_save_all();ii_savestatus = 0
string ls_emsg

ii_tab_on_save = 0
// remember current tab 
if isvalid(it_main_tab) then 
	if ib_stay_tab_on_save then 
		ii_tab_on_save = it_main_tab.SelectedTab
	end if
end if

this.EVENT ue_save_validate()  			// validate clean input
if ii_savestatus < 0 then RETURN 

this.EVENT ue_save_validate_page()  	// validate interdepandencies on page
if ii_savestatus < 0 then RETURN 

this.EVENT ue_save_validate_required() // validate all required cols present
if ii_savestatus < 0 then RETURN 

this.EVENT ue_save_review_check() 		// make checks and any mods before save if review process required
if ii_savestatus < 0 then RETURN 

integer li_update_dw, li_savecode
string  ls_sql_err, ls_title
For li_update_dw = 1 to ii_updatable_count
	ls_title = wf_get_dw_title (li_update_dw )
	
	if not isValid( idw_updateable[ li_update_dw ] ) then continue 
	if f_nvl(idw_updateable[ li_update_dw ].dataobject, '') = ''  then continue
	
	li_savecode = idw_updateable[ li_update_dw ].Update(FALSE, FALSE) 
	if li_savecode <> 1 then
		ls_sql_err = f_nvl(SQLCA.SQLErrText,'')
		ls_emsg = "Save Failed on Update() "+ ls_title + " ~r~n~r~n"+ ls_sql_err 
		ii_savestatus = -2
		EXIT
//		if sqlca.sqlcode <> 0 then
//			ls_sql_err = f_nvl(SQLCA.SQLErrText,'')
//			ls_emsg = "Save Failed"+ ls_title + " ~r~n~r~n"+ ls_sql_err +'~r~nSQL Code:'+ string( f_nvl(string(sqlca.sqlcode),'') )
//			ii_savestatus = -3
//			EXIT 
//		end if
	end if
	// Update succeeded
	idw_updateable[ li_update_dw ].EVENT ue_refresh_identity()
Next

If ii_savestatus = 0 then 
	// all updates ok
	this.EVENT ue_save_commit () 
	
	For li_update_dw = 1 to ii_updatable_count
		if not isValid( idw_updateable[ li_update_dw ] ) then continue 
		if f_nvl(idw_updateable[ li_update_dw ].dataobject, '') = ''  then continue
	
		idw_updateable[ li_update_dw ].EVENT ue_refresh_identity()

		idw_updateable[ li_update_dw ].ResetUpdate()	
	Next		
	ii_savestatus = 1 
ELSE
	this.EVENT ue_save_ROLLBACK() 
	messageBox("Save Data", ls_emsg, StopSign!)
END IF

// select last tab if set
this.post event ue_save_tab_select ()
this.event ue_save_aftersave()

end event

event ue_save_commit;COMMIT using sqlca;
end event

event ue_save_rollback;ROLLBACK using sqlca;	
end event

event ue_save_validate_required;If ii_savestatus < 0 then RETURN 

integer li_update_dw , li_ret
IF ib_do_required=FALSE then return 
IF ii_updatable_count <= 0 then return 
// make sure all required columns in ALL updateable dw's are filled in
For li_update_dw = 1 to ii_updatable_count
	li_ret = idw_updateable[ li_update_dw ].uf_validateRequired() 
	If li_ret < 0 then ii_savestatus = -1
Next
If ii_savestatus = -1 then 
	messageBox("Validation Error", "Required column is empty.", stopsign!)
End If

////
//If _savestatus = -1 then RETURN 
//
//integer li_column, li_update_dw 
//string  ls_colname , ls_visible
//// make sure all required columns in ALL updateable dw's are filled in
//For li_update_dw = 1 to ii_updatable_count
//	For li_column = 1 to upperbound( idw_updateable[ li_update_dw ].is_required[] )
//		ls_colname = idw_updateable[ li_update_dw ].is_required[ li_column] 
//		If not IsNull( ls_colname) and trim(ls_colname) <> '' then 
//			ls_visible = trim( idw_updateable[ li_update_dw ].Describe( ls_colname+".Visible" ))
//			If ls_visible = '1' then 
//				If f_is_column_null( 1, ls_colname, idw_updateable[ li_update_dw ]) then 
//					idw_updateable[ li_update_dw ].modify( ls_colname+".Background.Color='"+ STRING(RGB(255,255,0))+ "'")
//					_savestatus = -1
//				ELSE
//					idw_updateable[ li_update_dw ].modify( ls_colname+".Background.Color='"+ STRING(RGB(255,255,255)) +"'")
//				End If
//			End If				//visible
//		End If			
//	Next
//Next
//If _savestatus = -1 then 
//	messageBox("Validation Error", "Required column is empty.", stopsign!)
//End If
//
end event

event ue_save_review_check;If ii_savestatus < 0 then RETURN 

string  ls_colname 
integer li_column, li_update_dw 

// check for restricted columns in ALL updateable dw's. 
// if any modified - the review check needed

For li_update_dw = 1 to UpperBound(idw_updateable[])
	if not isValid( idw_updateable[ li_update_dw ] ) then continue 
	if f_nvl(idw_updateable[ li_update_dw ].dataobject, '') = ''  then continue
	If  f_anymodified( 1, idw_updateable[ li_update_dw ].is_restricted[] , dw_primary) then 
		// Must first go through superviser review... 
		this.EVENT ue_save_review_prepare() 
	End If 
Next


end event

event ue_postopen_01();if is_accessflags = '' THEN 
	post close( this )
Else
	dw_primary.event ue_setshares()
	this.event ue_visibleonopen()
	dw_primary.iw_Window = this 
	if is_lock_type = 'S' then this.post event ue_lock( true) 
	If ib_search_same_x then cb_search.x = cb_newsearch.x 
	
	If this.ib_audit  then 
		// Propagate audit switch to all UPDATEable DWs
		long ll_ndx
		FOR ll_ndx = 1 to UpperBound( idw_updateable []) 
			idw_updateable [ll_ndx ].ib_audit = this.ib_audit  
		NEXT 
	END IF
	
End If
end event

event ue_delete;integer li_answer
if adw_target.RowCount() <= 0 then return 2
ii_savestatus = 0
li_answer = MessageBox("Confirm Delete", "Are you sure you want to delete this record?", Question!, yesno!, 2) 
If li_answer = 1 then
	If this.event ue_delete_children(adw_target, al_row) > 0 then 
		adw_target.DeleteRow( al_row) 
		If ab_immediate then 
			this.event menu_save ()
		End If
	Else
		MessageBox("Delete Failed", "Related records prevent deletion of this record.", Stopsign!)
	End If 
End If 

return li_answer 
end event

event menu_saveas_check_keys;integer li_column, li_max_col, li_ret
string  ls_colname 
// make sure all columns required to be modified for Save As are indeed - modified...
// this usually (but not always applies to primary key columns 
li_ret = 1 
li_max_col = upperbound( dw_primary.is_saveas_keys[] )
If li_max_col > 0 then
	For li_column = 1 to li_max_col
		ls_colname = dw_primary.is_saveas_keys[ li_column] 
		If not IsNull( ls_colname) and trim(ls_colname) <> '' then 
			If  dw_primary.GetItemStatus( dw_primary.getrow(), ls_colname , Primary!) <> DataModified! then 
				dw_primary.modify( ls_colname+".Background.Color='"+ STRING(RGB(117,210,255))+ "'")
				li_ret = -1
			ELSE
				dw_primary.modify( ls_colname+".Background.Color='"+ STRING(RGB(255,255,255))+ "'")
			End If
		End If			
	Next
End If			

If li_ret < 0 then 
	messageBox("Validation Error", "Highlighted column(s) must be modified for Save As New.", stopsign!)
End If

return li_ret 
end event

event menu_delete;if IsValid( it_main_tab) then
	it_main_tab.event dynamic menu_delete ()
End If
//if IsValid( dw_infocus) then 
//	this.event ue_delete( dw_infocus, 0, false) 
//Else

end event

event ue_delete_children;return 1
end event

event ue_assign_menu;CHOOSE CASE this.WindowType
	CASE Main!,  MDI!, MDIHelp!, Popup!
		this.ChangeMenu(m_vzt_master) 
		im_menu = this.menuid 
	CASE Child!,  Response!
END CHOOSE

end event

event ue_visibleonopen;	this.visible = true 
end event

event ue_cb_new;if is_accessflags = '' THEN return 
ib_doingnew 			= TRUE 
st_foundrecs.visible = false

long			newrow
dw_primary.RefreshDataObject() 

if dw_primary.rowCount() > 0 then
	newrow = dw_primary.insertRow(1)
else
	newrow = dw_primary.insertRow(0)
end if

if NOT (newrow > 0) then
	messageBox("Program Error", "Unable to insert new row.", StopSign!)
	return
end if

long ll_r
ll_r = dw_primary.GetRow()
ll_r = dw_primary.RowCOunt() 

If IsValid( it_main_tab) then 
	it_main_tab.Selecttab (1)
	iw_mywindow.wf_enabletab ( it_main_tab, false )
End IF
// position to new row if not already there
if dw_primary.GetRow() <> newrow and dw_primary.GetRow() > 0 or (newrow=1 and dw_primary.GetRow()=1) then
	dw_primary.scrollToRow(newrow)
	dw_primary._NewSearchInprogress=true 
	dw_primary.setRow(newrow)
	dw_primary._NewSearchInprogress=false 
END IF

int li_cnt, li_sel
li_sel	= upperBound(idw_selectable[]) 
If li_sel > 0 then 
	FOR li_cnt = 1 to li_sel
		idw_selectable[li_cnt].modifyedit ("W" ) 
	NEXT 
Else
	dw_primary.modifyedit ("W" )
END IF

dw_primary.setFocus()
f_vzt_selectrow(dw_primary)

cb_select.visible 	= false
cb_search.visible 	= false
cb_newsearch.visible = true
cb_save.visible 		= true

ib_doingnew = FALSE
end event

event type integer ue_search();long ll_rows
ll_rows = dw_primary.search('') 
if ll_rows = 0 then // no rows found 
	if ib_new_allowed then 
		cb_new.visible = true
	end if
end if
this.event ue_setcolor()
return 1
end event

event ue_printscreen;long ll_print_Job

ll_print_Job = PrintOpen( )
PrintScreen(ll_print_Job, 300, 300)
PrintClose(	ll_print_Job)
end event

event ue_save_validate_page;// validate all window data interdependencies b4 save
If ii_savestatus < 0 then RETURN 

string  ls_colname 
integer li_column, li_update_dw

For li_update_dw = 1 to UpperBound(idw_updateable[])
	if not isValid( idw_updateable[ li_update_dw ] ) then continue 
	if f_nvl(idw_updateable[ li_update_dw ].dataobject, '') = ''  then continue
		ii_savestatus = idw_updateable[ li_update_dw ].EVENT ue_validate_page() 
		if ii_savestatus < 0 then EXIT
Next


end event

event ue_localize;//	perform language specific setup...
// strings, positioning etc.
end event

event ue_reset_popups();// reset all popup editing objects
// uo_company.event ue_losefocus()
this.event  ue_date_lookup_end() 

end event

event ue_id_change();// main id (top rec) changed... refresh all links
int li_upd

FOR li_upd = 1 to UpperBound(idw_refreshable[])
	idw_refreshable[li_upd].id_main_id_local = id_main_id
	idw_refreshable[li_upd].event dynamic ue_refresh()

NEXT	

end event

event ue_mail_report_get();//// Get report from output and save as file
//string 	ls_dist_list_id, ls_id, ls_now, ls_output_id
//long		ll_maxrows, ll_row, ll_ret, ll_rc, ll_trigrow, ll_trigger
//datetime	ldt_now
//blob 		lblob 
//string	ls_mailmsg , ls_msg 
//
//ls_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
//ls_id					= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
//ls_output_id		= f_nvl(dw_schedule.object.outputid [ dw_schedule.GetRow() ] , '')
//
//ls_msg = 'ls_dist_list_id 	'+ ls_dist_list_id + "~r~n"
//ls_msg = 'ls_id'+ ls_id+ "~r~n"
//ls_msg = 'ls_output_id	'+ ls_output_id	+ "~r~n"
//
//uo_trace01.event ue_trace('Schedule Mail Send', ls_msg )
//
//
//If ls_dist_list_id = '' then return 
//
//ll_maxrows = dw_distribution.Retrieve( ls_dist_list_id )
//If ll_maxrows <= 0 then 
//	return 
//END IF 
//
//inv_output.event ue_read_report_output ( ls_output_id, lblob, dw_parms, dw_rpt, 'BATCH')
//
//// Conditional Distribution 
//// check for trigger value in the report - "-" = do trigger, "+" = skip
//ll_trigrow = f_isvalidcolumn (dw_rpt, 'vzt_trigger')
//If ll_trigrow >  0 then // email if negative only 
//	ll_trigger	= dw_rpt.GetItemNumber( ll_trigrow , 'vzt_trigger')
//	If ll_trigger >= 0 then return // skip if positive 
//END IF 
//
////IF istr_parms.mode <> 'BATCH' then 
////	MessageBox('VZT Reporter Email', 'Would you like to email the report to the following receipients?', Question!) 
////END IF	
//string ls_rpt_format, ls_rpt_pdf_style 
//
//SELECT rpt_format, rpt_pdf_style INTO :ls_rpt_format, :ls_rpt_pdf_style 
//FROM VZT_SYSOPTIONS 
//USING SQLCA;
//
//If IsNull(ls_rpt_format) or ls_rpt_format ='' then ls_rpt_format = 'VZR'
//If ls_rpt_format ='PDF' then
//	if IsNull(ls_rpt_pdf_style ) then ls_rpt_pdf_style = 'XSLFOP' 
//ELSE
//	ls_rpt_pdf_style = ''
//END IF
//
//// Mail to list 
//if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 
//
//string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
//string ls_fname, ls_lname, ls_filename, ls_pdffile, ls_vzrfile
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
////==============================================
//// Save report in VZR or PDF flavors
////==============================================
//If ls_rpt_format = 'VZR' or  ls_rpt_format = 'BOTH' then 
//	ls_vzrfile	=  upper( gnv_appman.is_tempdir + ls_filename + '.VZR' )
//	f_vzt_writefile_from_blob( ls_vzrfile	,lblob )
//	ls_pdffile = upper( gnv_appman.is_tempdir + ls_filename + '.PDF' )
//END IF 
//If ls_rpt_format = 'PDF' or  ls_rpt_format = 'BOTH' then 
//	ls_pdffile = upper( gnv_appman.is_tempdir + ls_filename + '.PDF' )
//	int li_ret 
//	IF ls_rpt_pdf_style = 'XSLFOP' then 
//		dw_rpt.Object.Datawindow.Export.PDF.Method = XSLFOP! 
//		dw_schedule.Object.Datawindow.Export.PDF.XSLFOP.print = 'No' 
//	ELSE
//		dw_rpt.Object.Datawindow.Export.PDF.Method = DISTILL! 
//		dw_rpt.Object.Datawindow.Export.PDF.DISTILL.CustomPOstScript = 'No' 
//	END IF
//	li_ret = dw_rpt.SaveAs(	ls_pdffile, PDF!, true) 
//	li_ret = li_ret 
//
//END IF 
//
//choose case ls_rpt_format 
//	case 'VZR' 
//		ls_attachfile[1]	= ls_vzrfile 
//	case 'PDF' 
//		ls_attachfile[1]	= ls_pdffile 
//	case 'BOTH' 
//		ls_attachfile[1]	= ls_vzrfile 
//		ls_attachfile[2]	= ls_pdffile 
//end choose
//
//is_mail_subject	= trim(f_nvl(dw_schedule.object.title [ dw_schedule.GetRow() ] , ''))
////If ll_trigger < 0 then ls_subject += '
//
//FOR ll_row = 1 to ll_maxrows 
//	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
//	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
//	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
//	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
//NEXT
//
//this.event ue_mail_options() // allow ancestors to modify stuff
//
//ll_ret = this.inv_mail.uf_mail_send_no_logon( is_mail_subject,'Report is attached',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
////ll_ret = this.inv_mail.uf_mail_send( ls_subject,'Report is attached',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 	
//
//// Update message to reflect report was emailed or failed
//ldt_now = f_sysdate()  
//ls_now = string ( ldt_now , 'mm-dd-yyyy hh:mm:ss')
//IF ll_ret >= 0 then 
//	ll_rc 		= 1
//	ls_mailmsg 	= is_status_distributed
//ELSE 
//	ll_rc 		= -15
//	ls_mailmsg 	= 'EMAIL FAILED.'
//END IF 
//
//UPDATE vzt_batchschedule SET message1=RTRIM(message1)+', '+ :ls_mailmsg +' '+:ls_now 
//WHERE id = :ls_id;
//If SQLCA.SQLcode <> 0 then ll_rc = -10
//f_end_tran (SQLCA, ll_rc, '', '','' )
// 
////FileDelete ( ls_htmlfile )
//FileDelete ( ls_vzrfile	 )
//
////
//// older version:
////
////string 	ls_dist_list_id, ls_id, ls_now
////long		ll_maxrows, ll_row, ll_ret, ll_rc
////datetime	ldt_now
////ls_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
////ls_id					= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
////If ls_dist_list_id = '' then return 
////
////ll_maxrows = dw_distribution.Retrieve( ls_dist_list_id )
////If ll_maxrows <= 0 then 
////	IF istr_parms.mode <> 'BATCH' then 
////		MessageBox('VZT Reporter Error', 'Report distribution list is empty.~r~nReport will not be mailed.', Exclamation!) 
////	END IF
////	return 
////END IF 
////	
//////IF istr_parms.mode <> 'BATCH' then 
//////	MessageBox('VZT Reporter Email', 'Would you like to email the report to the following receipients?', Question!) 
//////END IF	
////	
////// Mail to list 
////if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 
////
////string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
////string ls_fname, ls_lname, ls_filename, ls_subject , ls_htmlfile, ls_vzrfile
////
//////	ole_1.uf_savefile( is_tempdir + sle_2.text + '.DOC' ) 
////ls_filename =  dw_schedule.object.id[1] 
////f_replace(ls_filename, ',','')
////f_replace(ls_filename, ':','')
////f_replace(ls_filename, ';','')
////f_replace(ls_filename, ':','')
////f_replace(ls_filename, '/','')
////f_replace(ls_filename, '\','')
////f_replace(ls_filename, '|','')
////f_replace(ls_filename, '-','_')
////
////// Save report in two flavors
////ls_htmlfile =  upper( gnv_appman.is_tempdir + ls_filename + '.HTM' )
////ls_vzrfile	=  upper( gnv_appman.is_tempdir + ls_filename + '.VZR' )
////
////blob blob_syntax_and_data 
////f_dw_to_syntax_and_data( idw_rpt,true, blob_syntax_and_data ) // report object 
////
////f_vzt_writefile_from_blob( 	ls_vzrfile	, blob_syntax_and_data )
////idw_rpt.SaveAs(					ls_htmlfile , HTMLTable!, FALSE) 
////
////ls_attachfile[1]	= ls_htmlfile 
////ls_attachfile[2]	= ls_vzrfile 
////ls_subject			= f_nvl(dw_schedule.object.title [ dw_schedule.GetRow() ] , '')
////FOR ll_row = 1 to ll_maxrows 
////	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
////	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
////	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
////	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
////NEXT
////
////ll_ret = inv_mail.uf_mail_send( ls_subject,'***',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
////	
////// Update message to reflect report was emailed 
////IF ll_ret >= 0 then 
////	ll_rc = 1 
////	ldt_now = f_sysdate()  
////	ls_now = string ( ldt_now , 'mm-dd-yyyy hh:mm:ss')
////	UPDATE vzt_batchschedule SET message1=RTRIM(message1)+', '+ :is_status_distributed+' '+:ls_now 
////	WHERE id = :ls_id;
////	If SQLCA.SQLcode <> 0 then ll_rc = -10
////	f_end_tran (SQLCA, ll_rc, '', '','' )
////END IF 
////
////if IsValid(inv_mail) then DESTROY inv_mail 
//// 
////FileDelete ( ls_filename )
////
end event

event ue_mail_report_to_dist();//// mail report to dist

//string 	ls_dist_list_id, ls_id, ls_now, ls_output_id
//long		ll_maxrows, ll_row, ll_ret, ll_rc, ll_trigrow, ll_trigger
//datetime	ldt_now
//blob 		lblob 
//string	ls_mailmsg , ls_msg 
//
//ls_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
//ls_id					= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
//ls_output_id		= f_nvl(dw_schedule.object.outputid [ dw_schedule.GetRow() ] , '')
//
//ls_msg = 'ls_dist_list_id 	'+ ls_dist_list_id + "~r~n"
//ls_msg = 'ls_id'+ ls_id+ "~r~n"
//ls_msg = 'ls_output_id	'+ ls_output_id	+ "~r~n"
//
//uo_trace01.event ue_trace('Schedule Mail Send', ls_msg )
//
//
//If ls_dist_list_id = '' then return 
//
//ll_maxrows = dw_distribution.Retrieve( ls_dist_list_id )
//If ll_maxrows <= 0 then 
//	return 
//END IF 
//
//inv_output.event ue_read_report_output ( ls_output_id, lblob, dw_parms, dw_rpt, 'BATCH')
//
//// Conditional Distribution 
//// check for trigger value in the report - "-" = do trigger, "+" = skip
//ll_trigrow = f_isvalidcolumn (dw_rpt, 'vzt_trigger')
//If ll_trigrow >  0 then // email if negative only 
//	ll_trigger	= dw_rpt.GetItemNumber( ll_trigrow , 'vzt_trigger')
//	If ll_trigger >= 0 then return // skip if positive 
//END IF 
//
////IF istr_parms.mode <> 'BATCH' then 
////	MessageBox('VZT Reporter Email', 'Would you like to email the report to the following receipients?', Question!) 
////END IF	
//string ls_rpt_format, ls_rpt_pdf_style 
//
//SELECT rpt_format, rpt_pdf_style INTO :ls_rpt_format, :ls_rpt_pdf_style 
//FROM VZT_SYSOPTIONS 
//USING SQLCA;
//
//If IsNull(ls_rpt_format) or ls_rpt_format ='' then ls_rpt_format = 'VZR'
//If ls_rpt_format ='PDF' then
//	if IsNull(ls_rpt_pdf_style ) then ls_rpt_pdf_style = 'XSLFOP' 
//ELSE
//	ls_rpt_pdf_style = ''
//END IF
//
//// Mail to list 
//if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 
//
//string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
//string ls_fname, ls_lname, ls_filename, ls_pdffile, ls_vzrfile
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
////==============================================
//// Save report in VZR or PDF flavors
////==============================================
//If ls_rpt_format = 'VZR' or  ls_rpt_format = 'BOTH' then 
//	ls_vzrfile	=  upper( gnv_appman.is_tempdir + ls_filename + '.VZR' )
//	f_vzt_writefile_from_blob( ls_vzrfile	,lblob )
//	ls_pdffile = upper( gnv_appman.is_tempdir + ls_filename + '.PDF' )
//END IF 
//If ls_rpt_format = 'PDF' or  ls_rpt_format = 'BOTH' then 
//	ls_pdffile = upper( gnv_appman.is_tempdir + ls_filename + '.PDF' )
//	int li_ret 
//	IF ls_rpt_pdf_style = 'XSLFOP' then 
//		dw_rpt.Object.Datawindow.Export.PDF.Method = XSLFOP! 
//		dw_schedule.Object.Datawindow.Export.PDF.XSLFOP.print = 'No' 
//	ELSE
//		dw_rpt.Object.Datawindow.Export.PDF.Method = DISTILL! 
//		dw_rpt.Object.Datawindow.Export.PDF.DISTILL.CustomPOstScript = 'No' 
//	END IF
//	li_ret = dw_rpt.SaveAs(	ls_pdffile, PDF!, true) 
//	li_ret = li_ret 
//
//END IF 
//
//choose case ls_rpt_format 
//	case 'VZR' 
//		ls_attachfile[1]	= ls_vzrfile 
//	case 'PDF' 
//		ls_attachfile[1]	= ls_pdffile 
//	case 'BOTH' 
//		ls_attachfile[1]	= ls_vzrfile 
//		ls_attachfile[2]	= ls_pdffile 
//end choose
//
//is_mail_subject	= trim(f_nvl(dw_schedule.object.title [ dw_schedule.GetRow() ] , ''))
////If ll_trigger < 0 then ls_subject += '
//
//FOR ll_row = 1 to ll_maxrows 
//	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
//	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
//	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
//	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
//NEXT
//
//this.event ue_mail_options() // allow ancestors to modify stuff
//
//ll_ret = this.inv_mail.uf_mail_send_no_logon( is_mail_subject,'Report is attached',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
////ll_ret = this.inv_mail.uf_mail_send( ls_subject,'Report is attached',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 	
//
//// Update message to reflect report was emailed or failed
//ldt_now = f_sysdate()  
//ls_now = string ( ldt_now , 'mm-dd-yyyy hh:mm:ss')
//IF ll_ret >= 0 then 
//	ll_rc 		= 1
//	ls_mailmsg 	= is_status_distributed
//ELSE 
//	ll_rc 		= -15
//	ls_mailmsg 	= 'EMAIL FAILED.'
//END IF 
//
//UPDATE vzt_batchschedule SET message1=RTRIM(message1)+', '+ :ls_mailmsg +' '+:ls_now 
//WHERE id = :ls_id;
//If SQLCA.SQLcode <> 0 then ll_rc = -10
//f_end_tran (SQLCA, ll_rc, '', '','' )
// 
////FileDelete ( ls_htmlfile )
//FileDelete ( ls_vzrfile	 )
//
////
//// older version:
////
////string 	ls_dist_list_id, ls_id, ls_now
////long		ll_maxrows, ll_row, ll_ret, ll_rc
////datetime	ldt_now
////ls_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
////ls_id					= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
////If ls_dist_list_id = '' then return 
////
////ll_maxrows = dw_distribution.Retrieve( ls_dist_list_id )
////If ll_maxrows <= 0 then 
////	IF istr_parms.mode <> 'BATCH' then 
////		MessageBox('VZT Reporter Error', 'Report distribution list is empty.~r~nReport will not be mailed.', Exclamation!) 
////	END IF
////	return 
////END IF 
////	
//////IF istr_parms.mode <> 'BATCH' then 
//////	MessageBox('VZT Reporter Email', 'Would you like to email the report to the following receipients?', Question!) 
//////END IF	
////	
////// Mail to list 
////if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 
////
////string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
////string ls_fname, ls_lname, ls_filename, ls_subject , ls_htmlfile, ls_vzrfile
////
//////	ole_1.uf_savefile( is_tempdir + sle_2.text + '.DOC' ) 
////ls_filename =  dw_schedule.object.id[1] 
////f_replace(ls_filename, ',','')
////f_replace(ls_filename, ':','')
////f_replace(ls_filename, ';','')
////f_replace(ls_filename, ':','')
////f_replace(ls_filename, '/','')
////f_replace(ls_filename, '\','')
////f_replace(ls_filename, '|','')
////f_replace(ls_filename, '-','_')
////
////// Save report in two flavors
////ls_htmlfile =  upper( gnv_appman.is_tempdir + ls_filename + '.HTM' )
////ls_vzrfile	=  upper( gnv_appman.is_tempdir + ls_filename + '.VZR' )
////
////blob blob_syntax_and_data 
////f_dw_to_syntax_and_data( idw_rpt,true, blob_syntax_and_data ) // report object 
////
////f_vzt_writefile_from_blob( 	ls_vzrfile	, blob_syntax_and_data )
////idw_rpt.SaveAs(					ls_htmlfile , HTMLTable!, FALSE) 
////
////ls_attachfile[1]	= ls_htmlfile 
////ls_attachfile[2]	= ls_vzrfile 
////ls_subject			= f_nvl(dw_schedule.object.title [ dw_schedule.GetRow() ] , '')
////FOR ll_row = 1 to ll_maxrows 
////	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
////	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
////	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
////	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
////NEXT
////
////ll_ret = inv_mail.uf_mail_send( ls_subject,'***',ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 
////	
////// Update message to reflect report was emailed 
////IF ll_ret >= 0 then 
////	ll_rc = 1 
////	ldt_now = f_sysdate()  
////	ls_now = string ( ldt_now , 'mm-dd-yyyy hh:mm:ss')
////	UPDATE vzt_batchschedule SET message1=RTRIM(message1)+', '+ :is_status_distributed+' '+:ls_now 
////	WHERE id = :ls_id;
////	If SQLCA.SQLcode <> 0 then ll_rc = -10
////	f_end_tran (SQLCA, ll_rc, '', '','' )
////END IF 
////
////if IsValid(inv_mail) then DESTROY inv_mail 
//// 
////FileDelete ( ls_filename )
////
end event

event ue_mail_report_save2file(string as_filename, ref datawindow adw_rpt);long li_ret
//==============================================
// Save report in VZR or PDF flavors
//==============================================
//ls_htmlfile =  upper( gnv_appman.is_tempdir + ls_filename + '.HTM' )
If is_rpt_format = 'VZR' or  is_rpt_format = 'BOTH' then 
	is_vzrfile	=  upper( gnv_appman.is_tempdir + as_filename + '.VZR' )
	f_vzt_writefile_from_blob( is_vzrfile	,ib_rptblob  )
	//dw_rpt.SaveAs(	ls_htmlfile, HTMLTable!, FALSE) 
	is_pdffile = upper( gnv_appman.is_tempdir + as_filename + '.PDF' )
END IF 
If is_rpt_format = 'PDF' or  is_rpt_format = 'BOTH' then 
	is_pdffile = upper( gnv_appman.is_tempdir + as_filename + '.PDF' )
	IF is_rpt_pdf_style = 'XSLFOP' then 
		adw_rpt.Object.Datawindow.Export.PDF.Method = XSLFOP! 
		adw_rpt.Object.Datawindow.Export.PDF.XSLFOP.print = 'No' 
	ELSE
		adw_rpt.Object.Datawindow.Export.PDF.Method = DISTILL! 
		adw_rpt.Object.Datawindow.Export.PDF.DISTILL.CustomPOstScript = 'No' 
//		adw_rpt.Object.Datawindow.Export.PDF.DISTILL.print = 'No' 
	END IF
	li_ret = adw_rpt.SaveAs(	is_pdffile, PDF!, true) 
	li_ret = li_ret 

END IF 

end event

event ue_save_tab_select();if isvalid(it_main_tab) then 
	if ii_tab_on_save > 0 then 
		if ib_stay_tab_on_save then 
			it_main_tab.Selecttab ( ii_tab_on_save)
		end if 
	end if
end if


end event

event ue_date_lookup_end();uo_ddcal.event dynamic ue_LoseFocus()
uo_ddcal.visible = false

end event

event ue_date_lookup_start(ref uo_vzt_dwbase adwtarget, string ascolname, integer ax, integer ay);//ay(dwo.name, 100,200) 
integer liTabHdrHeight

liTabHdrHeight = 120

uo_ddcal.x = ax 
uo_ddcal.Y = ay
If IsValid (it_main_tab) then
	If it_main_tab.width > 0 then
		uo_ddcal.x = uo_ddcal.x + it_main_tab.x 
		uo_ddcal.Y = uo_ddcal.Y + it_main_tab.y + liTabHdrHeight 
	End IF
	
end if	

if uo_ddcal.Y + uo_ddcal.height + 20 > this.height then uo_ddcal.y = this.height - uo_ddcal.height - 30 

uo_ddcal.Init(adwtarget, ascolname ) 
uo_ddcal.Init_cal( date(adwTarget.GetItemDateTime( adwTarget.GetRow(), asColName )) )
uo_ddcal.visible = true 

end event

event ue_setcolor();long ll_row
int li_controls , lidw
datawindow ldw	
windowobject lwo

long 	ll_fcolor, ll_bcolor
string	ls_font

if gnv_appman.is_use_styles <> 'Y' then return 
if not ib_use_styles then return 

ll_row = gnv_appman.uf_find_style('COMMON_WINDOWBG')
If ll_row > 0 then
	il_bcolor 			= long ( gnv_appman.ids_styles.GetItemString(ll_row, 'bcolor'))
	il_fcolor 			= long ( gnv_appman.ids_styles.GetItemString(ll_row, 'fcolor'))
	is_font			= gnv_appman.ids_styles.GetItemString(ll_row, 'stfont')
	
	this.BackColor	= il_bcolor 
	
	//	Color objects 
	FOR li_controls = 1 to UpperBound(Control[ ]	)
		lwo= Control[li_controls ] 
		choose case Typeof(lwo)
			case datawindow! 
				this.event ue_setcolor_dw ( lwo, il_fcolor, il_bcolor, is_font)
			case tab! 
				this.event ue_setcolor_tab ( lwo, il_fcolor, il_bcolor, is_font)
			case statictext! 
				statictext lst
				lst = lwo
				ll_row = gnv_appman.uf_find_style('COMMON_STATIC_TXT')
				If ll_row > 0 then
					ll_bcolor 			= long ( gnv_appman.ids_styles.GetItemString(ll_row, 'bcolor'))
					ll_fcolor 			= long ( gnv_appman.ids_styles.GetItemString(ll_row, 'fcolor'))
					ls_font			= gnv_appman.ids_styles.GetItemString(ll_row, 'stfont') 
				ELSE
					ll_bcolor 			= il_bcolor 			
					ll_fcolor 			= il_fcolor 			
					ls_font			= is_font			
				END IF 
				lst.TextColor	= ll_fcolor		
				lst.backcolor 	= ll_bcolor		
				lst.facename	= ls_font		

		end choose
	NEXT 	
	
END IF 	

st_foundrecs.backcolor = il_bcolor
end event

event ue_dfilter();//		string lsFilter 
//		int liRc
//		
//		lsFilter =  'POS("'+UPPER(trim(''))+  '", UPPER(contacttype)) > 0' 
//		liRc = dw_mainlist.SetFilter (lsFilter) 
//		dw_mainlist.Filter ()
//
this.event ue_dfilter_readini ()



end event

event ue_dfilter_readini();string lsFile , lsFilter
lsFile = gnv_appman.cScreenSettingPath+"\"+gnv_appman.cScreenSettingFile 
is_dfilter[1]= ProfileString( lsFile, is_dfilter_label, "F1", '' )
is_dfilter[2]= ProfileString( lsFile, is_dfilter_label, "F2", '' )
is_dfilter[3]= ProfileString( lsFile, is_dfilter_label, "F3", '' )
is_dfilter[4]= ProfileString( lsFile, is_dfilter_label, "F4", '' )

end event

event ue_lock(boolean ab_lock);If dw_primary.RowCount() <= 0 then return
dwitemstatus ldw_status

ldw_status = dw_primary.GetItemStatus(1, 0, Primary!) 

If ldw_status = New! or ldw_status = NewModified! then return 

long 		ll_user
string 	ls_username, ls_msg
int			li_cnt

IF ab_lock then  
	// Check if already locked and make screen read only 
	SELECT 	VZT_LOCKS.contact_id, 
				TRIM( FIRSTNAME) + ' ' + TRIM( LASTNAME) + '(' + TRIM(VZT_USERS."LOGIN") + ')' as USERNAME 
	INTO 		:ll_user , :ls_username 
	from 		VZT_LOCKS, VZT_CONTACT, VZT_USERS
	where 	object_id 					= :id_main_id AND 
				VZT_CONTACT.id 			= VZT_LOCKS.contact_id AND
				VZT_USERS.contact_id 	= VZT_CONTACT.id 
				;
		If IsNull( ll_user ) then ll_user = 0
	If ll_user > 0 and ll_user <> gnv_appman.id_userid then 
		MessageBox(' Lock', is_lock_owner+ ' is locked by '+ls_username +'. The screen will be displayed in Read Only Mode.') 

		this.cb_save.visible 	= false
		this.cb_save.enabled 	= false
//		this.cb_new.visible 	= false
//		this.cb_new.enabled 	= false 

 		For li_cnt = 1 to UpperBound(  this.idw_updateable [] )
			this.idw_updateable [li_cnt ].Modify("DataWindow.Color='"+string(RGB(200,200,200))+"'")
			this.idw_updateable [li_cnt ].Modify("DataWindow.ReadOnly=Yes")
		NEXT
		 
		dw_primary.Modify("DataWindow.Color='"+string(RGB(200,200,200))+"'")
		dw_primary.Modify("DataWindow.ReadOnly=Yes")
		Return 
	END IF 
	
	If ll_user > 0 and ll_user =  gnv_appman.id_userid then // User already has the lock 
	 	return 
	ELSE // get a lock 
		DELETE  VZT_LOCKS 	WHERE  contact_id =:gnv_appman.id_userid and object_id = :id_main_id and object_type = :is_lock_owner ;
		INSERT VZT_LOCKS ( contact_id, object_id, object_type )  VALUES( :gnv_appman.id_userid, 	:id_main_id,	 :is_lock_owner ) ;
		ib_locked = true 
	END IF
ELSE
	if ib_locked then 
		DELETE  VZT_LOCKS 	WHERE  contact_id =:gnv_appman.id_userid and object_id = :id_main_id and object_type = :is_lock_owner ;
		ib_locked = false 
	end if
	
END IF

f_end_tran0( SQLCA, 'VZT Record Locking Error', '',  is_lock_owner+' lock failed' ) 


end event

event ue_setcolor_tab(ref windowobject awo, long al_fcolor, long al_bcolor, string as_font);tab 		l_tab
long 		ll_row,  ll_fcolor, ll_bcolor
string 	ls_font

l_tab = awo

		l_tab.backcolor = al_bcolor
		
		int  				li_tabs 
		userobject 		luo
		windowobject 	lwo
		int 				lidw
		datawindow		ldw
		
		FOR li_tabs = 1 to UpperBound( l_tab.Control[ ]	)
			luo = l_tab.Control[li_tabs ] 
			if Isvalid(luo) then 
				luo.backcolor 		= al_bcolor
				luo.tabbackcolor 	= al_bcolor
			end if 	

			FOR lidw = 1 to UpperBound(luo.Control[]) // all controls for a tabpage : dws as well as other tabs
				lwo= luo.Control[lidw ] 
				choose case Typeof(lwo) 
					case datawindow! 
						this.event ue_setcolor_dw ( lwo, al_fcolor, al_bcolor, as_font)
					case tab! 
						this.event ue_setcolor_tab ( lwo, al_fcolor, al_bcolor, as_font)
					case statictext! 
						statictext lst
						lst = lwo
						
						ll_row = gnv_appman.uf_find_style('COMMON_TABPAGE_TXT')
						If ll_row > 0 then
					
							ll_bcolor 			= long ( gnv_appman.ids_styles.GetItemString(ll_row, 'bcolor'))
							ll_fcolor 			= long ( gnv_appman.ids_styles.GetItemString(ll_row, 'fcolor'))
							ls_font			= gnv_appman.ids_styles.GetItemString(ll_row, 'stfont') 
						ELSE
							ll_bcolor 			= al_bcolor 			
							ll_fcolor 			= al_fcolor 			
						END IF 
						lst.TextColor	= ll_fcolor		
						lst.backcolor 	= ll_bcolor		
						lst.facename	= ls_font		

					case singlelineedit! 
//						this.event ue_setcolor_tab ( lwo, al_fcolor, al_bcolor, as_font)
				end choose
				
			NEXT 	
		NEXT 	

end event

event ue_setcolor_dw(windowobject awo, long al_fcolor, long al_bcolor, string as_font);datawindow ldw
string			ls_visible , ls_ret, ls_expr
string 		ls_objects,  ls_cols[],		ls_syntax, ls_type, ls_gh_font, ls_ffont, ls_col_band
string			ls_gh_font_b, ls_gh_font_i, ls_gh_font_u , ls_weight, ls_italic, ls_underline 
long			ll_col, 	ll_gh_bcolor,ll_gh_fcolor, ll_srow, ll_fcolor 

ldw = awo 

ll_gh_bcolor = al_bcolor // default

//======================================================================
// Set specific visual attributes for different types of dw
//======================================================================
ls_syntax = ldw.Describe('DataWindow.Syntax')  
If POS(ls_syntax, 'processing=1') > 0 then 
	ls_type = 'GRID' 
	ll_srow = gnv_appman.uf_find_style('COMMON_GRID_HDR')
	If ll_srow > 0 then
		ll_gh_bcolor		= long ( gnv_appman.ids_styles.GetItemString(ll_srow, 'bcolor'))
		ll_gh_fcolor		= long ( gnv_appman.ids_styles.GetItemString(ll_srow, 'fcolor'))
		ls_gh_font		= gnv_appman.ids_styles.GetItemString(ll_srow, 'stfont')
		ls_gh_font_b	= gnv_appman.ids_styles.GetItemString(ll_srow, 'b') 
		ls_gh_font_i		= gnv_appman.ids_styles.GetItemString(ll_srow, 'i')
		ls_gh_font_u 	= gnv_appman.ids_styles.GetItemString(ll_srow, 'u')
	end if
end if
//======================================================================
			
			
			
if len(ldw.dataobject) > 0 and IsValid( ldw) and  ldw.dataobject <> 'd_empty' &
	and  ldw.dataobject <> 'd_rpt_def_edit'   & 
	and  ldw.dataobject <> 'd_report_cover_template'   & 
	and  ldw.dataobject <> 'aaa_d_exe_test'   then 
	
	ldw.object.datawindow.Color			= al_bcolor
	ldw.object.datawindow.Detail.Color	= string(al_bcolor)
	ldw.object.datawindow.Header.Color	= string(ll_gh_bcolor )

	// Set column styles
	ls_objects = ldw.object.datawindow.objects
	f_vzt_parse( ls_objects , ls_cols, "~t")
	
	FOR ll_col = 1 to UpperBound( ls_cols[] )
		ls_visible = f_nvl(trim( ldw.Describe( ls_cols[ll_col]+".visible")),'**')
		if MID( ls_visible + '*', 1, 1) = '"' then ls_visible = MID( ls_visible + '**', 2, 1)
	
		If ls_visible = '1' then // only do things for visible columns  
		
			ls_ffont 		= as_font 
			ll_fcolor		= al_fcolor
			ls_weight 	= '400'
			ls_italic   	= '0'
			ls_underline = '0'
			
			ls_col_band	= upper( ldw.Describe ( ls_cols[ll_col] +'.band') )
			If ls_type = 'GRID' then 
				If ls_col_band	= 'HEADER' then 
					ls_ffont 	= ls_gh_font 
					ll_fcolor	= ll_gh_fcolor
					
					If ls_gh_font_b='Y' then 
						ls_weight 	= '700'
					END IF					
					If ls_gh_font_i='Y' then 
						ls_italic   	= '	1'
					END IF					
					If ls_gh_font_u='Y' then 
						ls_underline = '1'
					END IF					
				END IF
			END IF
			
			// Set Font Color
			ls_expr =   ls_cols[ll_col] +'.color=' + string ( ll_fcolor) 
			ls_ret = ldw.Modify( ls_expr) 
			
			// Set Font family 
			ls_expr 	= ldw.Describe ( ls_cols[ll_col] +'.font.face')
			ls_expr 	= ls_cols[ll_col] +".font.face='" + ls_ffont +"'"
			ls_ret 	= ldw.Modify( ls_expr) 

			ls_expr 	= ls_cols[ll_col] +".Font.Weight='"+ls_weight +"'"  
			ls_ret 	= ldw.Modify( ls_expr) 
			ls_expr 	= ls_cols[ll_col] +".Font.Underline='"+ls_underline+"'"  
			ls_ret 	= ldw.Modify( ls_expr) 
			ls_expr 	= ls_cols[ll_col] +".Font.Italic='"+ls_italic+"'"  
			ls_ret 	= ldw.Modify( ls_expr) 

			
		END IF
	NEXT
	
end if	



end event

event type string ue_access_check();//
If upper(gnv_appman.is_apptitle ) <> 'CROWN' then 
	return 'CRUDWA'
ELSE 
	// check user's access to the screen 
END IF
end event

public subroutine wf_enabletab (ref tab at_tab, boolean ab_enabled);If isValid( at_tab) then 
	integer li_page , li_pagecount
	li_pagecount = UpperBound( at_tab.Control[]	)
	If li_pagecount >= 1 then 
//		at_tab.SelectTab( 1) 		// select main page 
		If li_pagecount > 1 then // enable or disable the rest
			FOR li_page = 2 to li_pagecount
				at_tab.Control[li_page].Enabled = ab_enabled
			NEXT
		End If	
	End If	
End If


end subroutine

public subroutine wf_linked_scroll (ref datawindow adw_from, ref datawindow adw_to, ref datawindow adw_list);long ll_row
IF NOT ib_autoscroll then return // added to stop auto scrolling 

if ib_searchinprogress then return 
if ib_newsearch THEN RETURN 

IF ib_selecting THEN RETURN 

if not IsValid( adw_from) or not IsValid( adw_to) then return 
ll_row = adw_from.getRow()
If ll_row > 0 and ll_row  <= adw_from.RowCount() and not ib_scrolling then
	ib_scrolling = true 
	If adw_to.GetRow() <> ll_row then 
		adw_to.ScrollToRow( ll_row )
		adw_to.SetRow( ll_row )	
	End If 
	If adw_list.GetSelectedRow(0) <> ll_row then 
	//	If NOT (adw_list._dragable AND adw_list._selection_service ='M') then 
			adw_list.SelectRow( 0, false)
			adw_list.SelectRow( ll_row, true)	
			adw_list.EVENT dynamic ue_rowselected ( ll_row, true)
	//	END IF 
	ENd If
	ib_scrolling = false
End If



end subroutine

public subroutine wf_linked_scroll (ref datawindow adw_from, ref datawindow adw_to, ref uo_vzt_dwbase adw_list);long ll_row, ll_other_row
IF ib_selecting THEN RETURN 
if ib_newsearch then return 

if not IsValid( adw_from) or not IsValid( adw_to) then return 
ll_row = adw_from.getRow()
If ll_row > 0 and ll_row  <= adw_from.RowCount() and not ib_scrolling then
	ib_scrolling = true 
	ll_other_row = adw_to.GetRow()
	If ll_other_row <> ll_row then 
		adw_to.ScrollToRow( ll_row )
		adw_to.SetRow( ll_row )	
	End If 
	ll_other_row = adw_list.GetSelectedRow(0)
	If ll_other_row <> ll_row then 
		If NOT (adw_list._dragable AND adw_list._selection_service ='M') then 
			adw_list.SelectRow( 0, false)
			adw_list.SelectRow( ll_row, true)	
			adw_list.EVENT dynamic ue_rowselected ( ll_row, true)
		END IF 
	ENd If
	ib_scrolling = false
End If



end subroutine

public function integer wf_setdefaultbutton (ref commandbutton ab_target);cb_search.default 	= FALSE
cb_newsearch.default = FALSE
cb_select.default 	= FALSE
cb_save.default 		= FALSE
cb_new.default 		= FALSE

ab_target.default		= true

return 1

end function

public function string wf_get_dw_title (integer ai_update_dw);string ls_title 

ls_title = ''
If UpperBound(is_updateable_titles[]) >= ai_update_dw then ls_title = " on " +f_nvl( is_updateable_titles[ai_update_dw ] ,'')
If trim(ls_title) = '' or trim(ls_title) = 'on' then ls_title = ' on dw: '+idw_updateable[ ai_update_dw ].dataobject

return ls_title 
end function

public function integer wf_gotourl (string as_url);GetContextService("Internet", iinet_base)
iinet_base.HyperlinkToURL(as_url)
return 1
end function

public function integer wf_tran_end (transaction a_tran, boolean ab_commit, boolean ab_rollback, string as_hdr, string as_msgok, string as_msgerror, integer an_nrows_expected);string ls_sql_error ,ls_sql_code , ls_msg 
int li_ret 
 
// need additional parm for sqlnrows !!!!!!!!!!!
 If a_tran.SQLCode <> 0 or &
 	(an_nrows_expected > 0 and a_tran.sqlnrows <> an_nrows_expected) Then    

   ls_sql_error =  a_tran.SQLerrtext + " sqlnrows:"+ string(a_tran.sqlnrows )
   ls_sql_code =  string( a_tran.SQLCode) 
	IF ab_rollback then
		ROLLBACK USING a_tran;
	END IF

	ls_msg = as_msgerror + +'~r~n~r~nCode:'+ls_sql_code+'~r~nMessage:'+ ls_sql_error 
	
	If IsValid ( uo_maintrace) and as_msgerror <> '' and & 
		Not IsNull( as_hdr) and as_hdr <> '' and Not IsNull(as_msgerror ) then 
		uo_maintrace.event ue_trace( 'wf_tran_end:'+as_hdr, ls_msg ) 
	END IF
	
	RETURN -1
END IF 
IF ab_commit then
	COMMIT USING a_tran;
END IF
If IsValid ( uo_maintrace) and Not IsNull(as_msgok) and as_msgok <> '' and Not IsNull( as_hdr) and as_hdr <> '' then 
	uo_maintrace.event ue_trace( 'wf_tran_end:'+as_hdr, as_msgok ) 
END IF

return 1




end function

public subroutine wf_setupdateable (ref uo_vzt_dwbase adw_target, string as_title, boolean ab_selectable, boolean ab_searchable);If ab_selectable then idw_selectable[ UpperBound(idw_selectable[]) + 1 ] = adw_target
If ab_searchable then idw_searchable[ UpperBound(idw_searchable[]) + 1 ] = adw_target

idw_updateable[ UpperBound(idw_updateable[]) + 1 ] = adw_target
ii_updatable_count ++ 
if IsNull(as_title) then as_title = '(no title specified)'
is_updateable_titles[ii_updatable_count] = as_title

adw_target.iw_Window = this.iw_Window  

end subroutine

public subroutine wf_setupdateable (ref uo_vzt_dwbase adw_target, string as_title, boolean ab_selectable, boolean ab_searchable, boolean ab_refreshable);If ab_selectable then idw_selectable[ UpperBound(idw_selectable[]) + 1 ] = adw_target
If ab_searchable then idw_searchable[ UpperBound(idw_searchable[]) + 1 ] = adw_target
If ab_refreshable then idw_refreshable[ UpperBound(idw_refreshable[]) + 1 ] = adw_target


idw_updateable[ UpperBound(idw_updateable[]) + 1 ] = adw_target
ii_updatable_count ++ 
if IsNull(as_title) then as_title = '(no title specified)'
is_updateable_titles[ii_updatable_count] = as_title

adw_target.iw_Window = this.iw_Window  

end subroutine

public subroutine wf_setupdateable (ref uo_vzt_dwbase adw_target, string as_title, boolean ab_selectable);this.wf_setupdateable(adw_target, as_title, ab_selectable, false) 
end subroutine

on w_vzt_base.create
this.cb_tmpl=create cb_tmpl
this.cb_dfilter=create cb_dfilter
this.uo_trace01=create uo_trace01
this.dw_mainlist=create dw_mainlist
this.cb_last_search=create cb_last_search
this.cb_close=create cb_close
this.cb_delete1=create cb_delete1
this.cb_save=create cb_save
this.cb_select=create cb_select
this.cb_new=create cb_new
this.cb_newsearch=create cb_newsearch
this.cb_search=create cb_search
this.st_foundrecs=create st_foundrecs
this.st_stop=create st_stop
this.dw_data=create dw_data
this.dw_print=create dw_print
this.uo_ddcal=create uo_ddcal
this.Control[]={this.cb_tmpl,&
this.cb_dfilter,&
this.uo_trace01,&
this.dw_mainlist,&
this.cb_last_search,&
this.cb_close,&
this.cb_delete1,&
this.cb_save,&
this.cb_select,&
this.cb_new,&
this.cb_newsearch,&
this.cb_search,&
this.st_foundrecs,&
this.st_stop,&
this.dw_data,&
this.dw_print,&
this.uo_ddcal}
end on

on w_vzt_base.destroy
destroy(this.cb_tmpl)
destroy(this.cb_dfilter)
destroy(this.uo_trace01)
destroy(this.dw_mainlist)
destroy(this.cb_last_search)
destroy(this.cb_close)
destroy(this.cb_delete1)
destroy(this.cb_save)
destroy(this.cb_select)
destroy(this.cb_new)
destroy(this.cb_newsearch)
destroy(this.cb_search)
destroy(this.st_foundrecs)
destroy(this.st_stop)
destroy(this.dw_data)
destroy(this.dw_print)
destroy(this.uo_ddcal)
end on

event closequery;if ib_searching then return 1

this.event ue_lock( false ) 

end event

event resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_new.y 		= newheight - ii_resizeband_y - cb_new.height
		cb_newsearch.y = newheight - ii_resizeband_y - cb_newsearch.height
		cb_save.y 		= newheight - ii_resizeband_y - cb_save.height
		cb_search.y 	= newheight - ii_resizeband_y - cb_search.height
		cb_select.y 	= newheight - ii_resizeband_y - cb_select.height
		cb_delete1.y 	= newheight - ii_resizeband_y - cb_delete1.height		
		cb_close.y 		= newheight - ii_resizeband_y - cb_close.height
		cb_tmpl.y		= newheight - ii_resizeband_y - cb_delete1.height		
		
		st_stop.y		= newheight - ii_resizeband_y - st_stop.height
		
		cb_last_search.y=newheight - ii_resizeband_y - cb_last_search.height
		cb_dfilter.y	= newheight - ii_resizeband_y - cb_dfilter.height
		st_foundrecs.y	= newheight - ii_resizeband_y - st_foundrecs.height		
		
		dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
		dw_primary.width	= newwidth  - dw_primary.x * 2 
		uo_trace01.y = cb_close.y 
		
	End IF 
End IF 	
end event

event open;this.visible = false // prevent display until all checks done 
iw_Window = this 

this.ib_audit = gnv_appman.ib_audit 

//_accessflags = gnv_appman.inv_security.uf_user_has_rights( this.classname(), true ) 
is_accessflags  = this.event ue_access_check ()
// is_accessflags = 'RWA'
if is_accessflags = '' THEN 
	this.POST event ue_postopen_01 ()	// 
	return
End If

gnv_appman.uf_enable_styles()
this.post event ue_setcolor()

dw_primary 					= dw_data
dw_primary_list 				= dw_mainlist
dw_primary.ist_x_of_y 		= st_foundrecs
iw_mywindow 					= this
uo_maintrace					= uo_trace01 

if gnv_appman.inv_language.is_language_multi = 'Y' then this.event ue_localize()

dw_primary.iw_Window = this

this.event ue_assign_menu()  

if gnv_appman.is_admin = 'Y' then
ELSE
	this.event ue_access_menu_check()
END IF 

this.POST event ue_postopen_01 ()

this.event ue_dfilter()


end event

event clicked;this.event ue_reset_popups()
end event

type cb_tmpl from commandbutton within w_vzt_base
boolean visible = false
integer x = 2528
integer y = 816
integer width = 192
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Tmpl"
end type

event clicked;
If IsValid( it_main_tab ) then 
	gnv_appman.inv_security.of_create_template( iw_mywindow.Classname(), it_main_tab )
end if
end event

type cb_dfilter from commandbutton within w_vzt_base
boolean visible = false
integer x = 1783
integer y = 816
integer width = 206
integer height = 76
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filter"
end type

event clicked;parent.event ue_reset_popups()
int lirc
istr_filter_parms =  f_dfilter ( istr_filter_parms, is_dfilter_label ) 

if istr_filter_parms.rc >= 0 then
	is_dfilter[1] = istr_filter_parms.string1 
	is_dfilter[2] = istr_filter_parms.string2 
	is_dfilter[3] = istr_filter_parms.string3 
	is_dfilter[4] = istr_filter_parms.string4 
	cb_newsearch.event clicked()
	cb_search.event clicked()
//	parent.event ue_dfilter ()
end if


end event

type uo_trace01 from nvo_trace within w_vzt_base
boolean visible = false
integer x = 2784
integer y = 808
integer width = 901
integer taborder = 110
borderstyle borderstyle = stylelowered!
end type

on uo_trace01.destroy
call nvo_trace::destroy
end on

type dw_mainlist from uo_vzt_dwbase within w_vzt_base
event ue_get_key_values ( long al_row )
event ue_select_tabpage_on_rowchange ( long row )
event type integer ue_get_first_tab ( long al_row )
event ue_get_key_values_post ( long al_row )
integer x = 14
integer y = 12
integer width = 2464
integer height = 160
boolean vscrollbar = true
end type

event ue_get_key_values(long al_row);//if id_main_id = id_main_id_prev and id_main_id_prev <> 0 then
//	return 
//end if

if is_lock_type = 'M' then parent.event ue_lock( false) // release prev lock if any  

this.event ue_select_tabpage_on_rowchange (al_row)
if this.rowcount() <=0 then return 

this.post event ue_get_key_values_post (al_row)



end event

event ue_select_tabpage_on_rowchange(long row);// select the first visible/enabled tab page
// for now - just select tabpage 1 
int li_tab
if isvalid(it_main_tab) then 
	li_tab =  this.event ue_get_first_tab (row) 
	if li_tab <= 0 then li_tab = 1 
	if ib_stay_tab_on_row_chg then  
		if ib_stay_tab_on_save and ii_tab_on_save > 0 then 
			it_main_tab.Selecttab (ii_tab_on_save ) 
		else
	//		it_main_tab.Selecttab (li_tab)
		end if	
	else 
		it_main_tab.Selecttab (li_tab)
	end if	
end if
end event

event type integer ue_get_first_tab(long al_row);//modify in descendant 
return 1
end event

event ue_get_key_values_post(long al_row);//
//if id_main_id = id_main_id_prev and id_main_id_prev <> 0 then
//	return 
//else 
//	id_main_id_prev = id_main_id 
//end if
if is_lock_type = 'M' then parent. post event ue_lock( true) 
end event

event clicked;call super::clicked;parent.event dynamic ue_date_lookup_end() 

If row > 0 and row <= this.rowcount() then 
	parent.event ue_reset_popups()
	dw_primary.SetRow( row)
	dw_primary.ScrollToRow( row) 
	this.event ue_get_key_values ( row ) 
	
	If IsValid( it_main_tab ) and ib_tabsecurity then
		gnv_appman.inv_security.of_check_tab_access( iw_mywindow.Classname(), it_main_tab ) 
	END IF
	
	parent.event ue_retrieve_links()
End IF

end event

event constructor;call super::constructor;_selection_service = 'S'
end event

event rowfocuschanged;call super::rowfocuschanged;If Not ib_selecting then 
	parent.wf_linked_scroll( dw_primary_list, dw_primary, dw_primary_list) 
End IF

If not ib_doingnew and not ib_newsearch then 
	this.event ue_get_key_values ( currentrow)
	parent.event ue_retrieve_links()
END IF
end event

event scrollvertical;if ib_setrowonscroll then 
	parent.wf_linked_scroll( dw_primary_list, dw_primary, dw_primary_list) 
	parent.event ue_reset_popups()
END IF

end event

event ue_lbuttonup;call super::ue_lbuttonup;If IsValid( inv_field_sort) then 
	parent.wf_linked_scroll( dw_primary_list, dw_primary, dw_primary_list)
END IF


end event

event ue_rowselected;call super::ue_rowselected;If row > 0 and ab_selected and row <= this.Rowcount() then
	this.event ue_get_key_values ( row) 
END IF
return 1
end event

type cb_last_search from commandbutton within w_vzt_base
boolean visible = false
integer x = 1042
integer y = 816
integer width = 352
integer height = 76
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Last Search"
end type

event clicked;//If is_last_search_sql <> '' then
//	dw_primary
//End If
parent.event ue_reset_popups()

end event

type cb_close from commandbutton within w_vzt_base
integer x = 2290
integer y = 816
integer width = 192
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
end type

event clicked;parent.event ue_reset_popups()
parent.event menu_exit()
end event

type cb_delete1 from commandbutton within w_vzt_base
boolean visible = false
integer x = 1573
integer y = 816
integer width = 206
integer height = 76
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;parent.event ue_reset_popups()
parent.event ue_delete ( dw_primary, 0, true )
end event

type cb_save from commandbutton within w_vzt_base
event clicked pbm_bnclicked
integer x = 823
integer y = 816
integer width = 215
integer height = 76
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sa&ve"
end type

event clicked;parent.event ue_reset_popups()
parent.event ue_save_all() 
dw_mainlist.event  ue_get_key_values ( dw_mainlist.GetRow() )
end event

type cb_select from commandbutton within w_vzt_base
event clicked pbm_bnclicked
integer x = 603
integer y = 816
integer width = 215
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Edit"
end type

event clicked;ib_selecting = TRUE 
f_vzt_selectrow(dw_primary)

dw_primary.RefreshDataObject() 
dw_primary.scrollToRow(0)
cb_save.show()
wf_setdefaultbutton ( cb_save )

this.hide()
st_foundrecs.hide()


//dw_mainlist.ShareData( dw_primary)
//dw_primary.ShareData( dw_mainlist)

dw_mainlist.event ue_get_key_values ( dw_mainlist.GetRow() )
parent.event ue_retrieve_links()

int ii, isel
isel = upperBound(idw_selectable[]) 
If isel > 0 then 
	FOR ii = 1 to isel
		idw_selectable[ii].modifyedit ("W" ) 
	NEXT 
Else
	dw_primary.modifyedit ("W" )
END IF

ib_selecting = FALSE
parent.event ue_reset_popups()

end event

type cb_new from commandbutton within w_vzt_base
event clicked pbm_bnclicked
integer x = 1399
integer y = 816
integer width = 165
integer height = 76
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&New"
end type

event clicked;parent.event ue_reset_popups()
parent.event ue_cb_new()

end event

type cb_newsearch from commandbutton within w_vzt_base
event clicked pbm_bnclicked
integer x = 27
integer y = 816
integer width = 343
integer height = 76
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New &Search"
end type

event clicked;if is_accessflags = '' THEN return 
if ib_searching then return

ib_newsearch = true

integer 	li_rc

st_foundrecs.visible = false
cb_select.visible		= false
cb_save.visible 		= false
cb_new.visible 		= false
this.visible 			= false

int ii, isel
isel = upperBound(idw_searchable[]) 
If isel > 0 then 
	FOR ii = 1 to isel
		li_rc = idw_searchable[ ii ].newsearch()
	NEXT 
Else
	li_rc = dw_primary.newsearch()
	if li_rc < 0 then
		messageBox("Appication Error", "Unable to add row to enter new search "+&
						"mode, error code=" + string(li_rc) + ".", StopSign!)
	end if
END IF	
	
if dw_primary.ROwCOunt() <=0 then return 
iw_mywindow.wf_enabletab ( it_main_tab, false )

if IsValid(dw_primary_list) then dw_primary_list.visible = false

cb_search.visible 	= true 
If ib_search_same_x then cb_search.x = cb_newsearch.x 

wf_setdefaultbutton 	(cb_search )
dw_primary.visible 	= true
parent.event ue_reset_popups()

ib_newsearch = false


end event

type cb_search from commandbutton within w_vzt_base
event clicked pbm_bnclicked
integer x = 375
integer y = 816
integer width = 224
integer height = 76
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Search"
end type

event clicked;this.hide()
ib_newsearch = false 
ib_searchinprogress = true  
if is_accessflags = '' THEN return 
cb_newsearch.show()
parent.event ue_search() 
//dw_data.search() - put in the descendant 
parent.event ue_dfilter ()

iw_mywindow.POST Event ue_postsearch()

parent.event ue_reset_popups()
parent.event ue_dfilter()


end event

type st_foundrecs from statictext within w_vzt_base
integer x = 2025
integer y = 820
integer width = 242
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;parent.event ue_reset_popups()
end event

type st_stop from statictext within w_vzt_base
event clicked pbm_bnclicked
boolean visible = false
integer x = 2089
integer y = 816
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "Stop"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;ii_retrieve_rc = 1

end event

type dw_data from uo_vzt_dwbase within w_vzt_base
integer x = 14
integer y = 188
integer width = 2464
integer height = 612
integer taborder = 20
boolean vscrollbar = true
end type

event constructor;call super::constructor;ii_updatable_count = ii_updatable_count + 1 
idw_updateable[ ii_updatable_count] = this 

ib_displayupdateprogress = false // if true - shows status of every dw being updated

// uncomment in descendant 
//idw_selectable[ upperBound(idw_selectable[])+1 ] = this 
end event

event rbuttondown;call super::rbuttondown;st_foundrecs.text = string(this.getRow()) + " of " + string(this.rowCount())

end event

event retrieveend;call super::retrieveend;ib_searching 			= FALSE

wf_setdefaultbutton ( cb_newsearch )
st_stop.visible 	= false

if rowcount > 0 then
	this.scrollToRow(1)
	cb_select.show()
	st_foundrecs.text = " 1 of " + string(rowcount) 
else
	cb_select.hide()
	st_foundrecs.text = " "  
end if

end event

event retrieverow;st_foundrecs.text = string(row) 
return ii_retrieve_rc

end event

event retrievestart;st_stop.visible 		= true 
st_foundrecs.text 	= " "
ii_retrieve_rc 		= 0
st_foundrecs.visible = true 
ib_searching 			= TRUE
end event

event scrollvertical;if ib_setrowonscroll then
	string ls_row
	ls_row = this.Describe("DataWindow.FirstRowOnPage")
	st_foundrecs.Text = ls_row + " of " + string(this.rowCount())
	this.setrow( long(ls_row))
	parent.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list)

END IF
end event

event rowfocuschanged;call super::rowfocuschanged;parent.event ue_reset_popups()
parent.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list)
end event

event clicked;call super::clicked;parent.event  ue_date_lookup_end() 


end event

type dw_print from datawindow within w_vzt_base
boolean visible = false
integer x = 2528
integer y = 56
integer width = 142
integer height = 76
integer taborder = 100
boolean bringtotop = true
boolean livescroll = true
end type

type uo_ddcal from u_vzt_ddcal_inline within w_vzt_base
boolean visible = false
integer x = 1623
integer y = 52
integer width = 759
integer taborder = 30
boolean bringtotop = true
end type

on uo_ddcal.destroy
call u_vzt_ddcal_inline::destroy
end on

event doubleclicked;call super::doubleclicked;
If uo_ddcal.idw_Target.GetRow() > 0 then
	uo_ddcal.idw_Target.SetItem( uo_ddcal.idw_Target.GetRow() , uo_ddcal.is_DateCol, datetime( uo_ddcal.id_date_selected) )
END IF

parent.event ue_date_lookup_end ()
end event

