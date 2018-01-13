$PBExportHeader$w_equipment_custom.srw
forward
global type w_equipment_custom from w_vzt_base
end type
type r_1 from rectangle within w_equipment_custom
end type
type dw_contact_address from uo_vzt_dwbase within w_equipment_custom
end type
type tab_1 from tab within w_equipment_custom
end type
type tabpage_1 from userobject within tab_1
end type
type cb_6 from commandbutton within tabpage_1
end type
type pb_docs from picturebutton within tabpage_1
end type
type dw_detail from uo_vzt_dwbase within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_6 cb_6
pb_docs pb_docs
dw_detail dw_detail
end type
type tabpage_pm from userobject within tab_1
end type
type rb_all from radiobutton within tabpage_pm
end type
type cb_11 from commandbutton within tabpage_pm
end type
type cb_10 from commandbutton within tabpage_pm
end type
type cb_1 from commandbutton within tabpage_pm
end type
type dw_avail from uo_vzt_dwbase within tabpage_pm
end type
type dw_sel from uo_vzt_dwbase within tabpage_pm
end type
type sle_1 from singlelineedit within tabpage_pm
end type
type rb_2 from radiobutton within tabpage_pm
end type
type rb_10 from radiobutton within tabpage_pm
end type
type rb_9 from radiobutton within tabpage_pm
end type
type rb_8 from radiobutton within tabpage_pm
end type
type rb_3 from radiobutton within tabpage_pm
end type
type rb_6 from radiobutton within tabpage_pm
end type
type rb_5 from radiobutton within tabpage_pm
end type
type rb_4 from radiobutton within tabpage_pm
end type
type rb_1 from radiobutton within tabpage_pm
end type
type gb_1 from groupbox within tabpage_pm
end type
type tabpage_pm from userobject within tab_1
rb_all rb_all
cb_11 cb_11
cb_10 cb_10
cb_1 cb_1
dw_avail dw_avail
dw_sel dw_sel
sle_1 sle_1
rb_2 rb_2
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
rb_3 rb_3
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_1 rb_1
gb_1 gb_1
end type
type tabpage_scon from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_scon
end type
type cb_9 from commandbutton within tabpage_scon
end type
type cb_8 from commandbutton within tabpage_scon
end type
type dw_3 from uo_vzt_dwbase within tabpage_scon
end type
type dw_2 from uo_vzt_dwbase within tabpage_scon
end type
type tabpage_scon from userobject within tab_1
cb_3 cb_3
cb_9 cb_9
cb_8 cb_8
dw_3 dw_3
dw_2 dw_2
end type
type tabpage_parts from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_parts
end type
type dw_parts from uo_vzt_dwbase within tabpage_parts
end type
type tabpage_parts from userobject within tab_1
cb_2 cb_2
dw_parts dw_parts
end type
type tabpage_ptask from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_ptask
end type
type dw_ptasks from uo_vzt_dwbase within tabpage_ptask
end type
type tabpage_ptask from userobject within tab_1
cb_4 cb_4
dw_ptasks dw_ptasks
end type
type tabpage_ctask from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_ctask
end type
type dw_ctasks from uo_vzt_dwbase within tabpage_ctask
end type
type tabpage_ctask from userobject within tab_1
cb_5 cb_5
dw_ctasks dw_ctasks
end type
type tab_1 from tab within w_equipment_custom
tabpage_1 tabpage_1
tabpage_pm tabpage_pm
tabpage_scon tabpage_scon
tabpage_parts tabpage_parts
tabpage_ptask tabpage_ptask
tabpage_ctask tabpage_ctask
end type
type phl_1 from picturehyperlink within w_equipment_custom
end type
type tab_2 from tab within w_equipment_custom
end type
type tabpage_cat from userobject within tab_2
end type
type dw_eq_cat from uo_vzt_dwbase within tabpage_cat
end type
type tabpage_cat from userobject within tab_2
dw_eq_cat dw_eq_cat
end type
type tabpage_zone from userobject within tab_2
end type
type dw_eq_zone from uo_vzt_dwbase within tabpage_zone
end type
type tabpage_zone from userobject within tab_2
dw_eq_zone dw_eq_zone
end type
type tab_2 from tab within w_equipment_custom
tabpage_cat tabpage_cat
tabpage_zone tabpage_zone
end type
type p_2 from picture within w_equipment_custom
end type
type cbx_1 from checkbox within w_equipment_custom
end type
type st_number from singlelineedit within w_equipment_custom
end type
type st_name from singlelineedit within w_equipment_custom
end type
type cb_dup from commandbutton within w_equipment_custom
end type
end forward

global type w_equipment_custom from w_vzt_base
integer width = 5184
integer height = 2296
string title = "PM Buddy"
windowstate windowstate = maximized!
event ue_refresh_links ( )
r_1 r_1
dw_contact_address dw_contact_address
tab_1 tab_1
phl_1 phl_1
tab_2 tab_2
p_2 p_2
cbx_1 cbx_1
st_number st_number
st_name st_name
cb_dup cb_dup
end type
global w_equipment_custom w_equipment_custom

type variables

uo_vzt_dwbase   	idw_details, idw_addresses, idw_scon, idw_proj
uo_vzt_dwbase   	idw_eq_cat, idw_eq_zone , idw_pm_sel, idw_pm_avl
uo_vzt_dwbase	 	idw_parts, idw_ptasks, idw_ctasks, idw_scon_sel, idw_scon_avl

long il_part_id

string area_number , area_name, is_new_eq_id

int	 period_selected = 7

boolean ib_save_clicked // for refresh performance

W_EQUIPMENT_CUSTOM iw_win

str_response istr_parms

end variables

forward prototypes
public subroutine addrowpmselectedtaskdw (long dwselrow)
public subroutine addrowservicecontractsselecteddw (long dwselrow)
public subroutine updateselectedpmdw (integer prm_period)
end prototypes

event ue_refresh_links();idw_pm_sel.Retrieve( 	area_number )
idw_pm_avl.Retrieve( 	area_number )
UpdateSelectedPMDW( period_selected );


idw_scon_sel.Retrieve( 	integer( area_number )   )
idw_scon_avl.Retrieve( 	  )

idw_parts.Retrieve( 	integer( area_number )  )

idw_ptasks.Retrieve( 	area_number )
idw_ctasks.Retrieve( 	area_number )

cb_dup.visible = true 
end event

public subroutine addrowpmselectedtaskdw (long dwselrow);string problem_number;
string subproblem_number;
int period;

subproblem_number	= idw_pm_avl.getItemString( dwselrow,	"subproblem_subproblem_number");
problem_number		= idw_pm_avl.getItemString( dwselrow,	"subproblem_problem_number");
period					= period_selected;


DELETE from vzt_equipment_task_map 
WHERE 			equipment_id 			= :area_number
			AND 	problem_number 		= :problem_number
			AND 	subproblem_number	= :subproblem_number;

INSERT INTO vzt_equipment_task_map (equipment_id,period,problem_number,subproblem_number)
VALUES (:area_number,	:period,	:problem_number,		:subproblem_number);

if sqlca.sqlcode <>0 Then
		Rollback;				
		MessageBox('Eq. Error','Eq Task Map Insert Failed')
else 
		commit;
end if

end subroutine

public subroutine addrowservicecontractsselecteddw (long dwselrow);int svc_cont_no = 0; 

if dwselrow <= 0 then return 

svc_cont_no	=	idw_scon_avl.GetItemNumber( dwselrow,"id");

DELETE from equipment_svc_cont_map 
WHERE  			equipment_id 	= :area_number
			AND 	svc_cont_id 		= :svc_cont_no;

insert into equipment_svc_cont_map ( equipment_id, svc_cont_id)
values ( :area_number, :svc_cont_no);

if sqlca.sqlcode <>0 Then
	rollback;
	MessageBox('DB Error equipment_svc_cont_map',sqlca.sqlcode)
else 
	commit;
end if

end subroutine

public subroutine updateselectedpmdw (integer prm_period);string ls_expr 

ls_expr = ''
If prm_period > 0 then 
	ls_expr = "vzt_equipment_task_map_period= "+string(prm_period) 
END IF

idw_pm_sel.setFilter( ls_expr );
idw_pm_sel.Filter();
period_selected=prm_period;

end subroutine

on w_equipment_custom.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
this.tab_1=create tab_1
this.phl_1=create phl_1
this.tab_2=create tab_2
this.p_2=create p_2
this.cbx_1=create cbx_1
this.st_number=create st_number
this.st_name=create st_name
this.cb_dup=create cb_dup
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.phl_1
this.Control[iCurrent+5]=this.tab_2
this.Control[iCurrent+6]=this.p_2
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.st_number
this.Control[iCurrent+9]=this.st_name
this.Control[iCurrent+10]=this.cb_dup
end on

on w_equipment_custom.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
destroy(this.tab_1)
destroy(this.phl_1)
destroy(this.tab_2)
destroy(this.p_2)
destroy(this.cbx_1)
destroy(this.st_number)
destroy(this.st_name)
destroy(this.cb_dup)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

iw_win = this

idw_details 		= tab_1.tabpage_1.dw_detail
idw_eq_cat		= tab_2.tabpage_cat.dw_eq_cat			
idw_eq_zone	= tab_2.tabpage_zone.dw_eq_zone
idw_parts		= tab_1.tabpage_parts.dw_parts

idw_pm_sel		= tab_1.tabpage_pm.dw_sel
idw_pm_avl		= tab_1.tabpage_pm.dw_avail
idw_scon_sel	= tab_1.tabpage_scon.dw_2
idw_scon_avl	= tab_1.tabpage_scon.dw_3
idw_ptasks 		= tab_1.tabpage_ptask.dw_ptasks 		
idw_ctasks		= tab_1.tabpage_ctask.dw_ctasks 		

ib_stay_tab_on_save = true

//dw_data.ShareData( idw_details )
//is_dfilter_label='phonebook'

dw_primary 		= idw_details			
dw_primary_list 	= idw_eq_cat 
it_main_tab 			= tab_1

cb_newsearch.event clicked()

//cb_search.event clicked()
//this.event ue_dfilter_readini ()
//this.event ue_dfilter ()

cb_new.visible = true 

//this.ib_autoscroll=false
//ib_do_required = true
//ib_setrowonscroll = true 

ib_resizeenabled = true


end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)
end event

event resize;ii_resizeband_y = 20
if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_new.y 		= newheight - ii_resizeband_y - cb_new.height
		cb_newsearch.y = newheight - ii_resizeband_y - cb_newsearch.height
		cb_save.y 		= newheight - ii_resizeband_y - cb_save.height
		cb_search.y 	= newheight - ii_resizeband_y - cb_search.height
		cb_select.y 	= newheight - ii_resizeband_y - cb_select.height
		cb_delete1.y 	= newheight - ii_resizeband_y - cb_delete1.height		
		cb_close.y 		= newheight - ii_resizeband_y - cb_close.height		
		st_stop.y		= newheight - ii_resizeband_y - st_stop.height
		cb_last_search.y=newheight - ii_resizeband_y - cb_last_search.height
		st_foundrecs.y	= newheight - ii_resizeband_y - st_foundrecs.height		
		cb_dfilter.y	= newheight - ii_resizeband_y - cb_dfilter.height		
		
		cb_dup.y = cb_close.y 
		
	//	dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
	//	dw_primary.width	= newwidth  - dw_primary.x * 2 
		
		dw_mainlist.height	= newheight - ii_resizeband_y * 2 - dw_mainlist.y - tab_1.height - r_1.height 
		dw_mainlist.width	= newwidth  - dw_mainlist.x * 2 

		r_1.y				= cb_save.y - 20
		r_1.width 		= newwidth - r_1.x * 2 

			
		tab_2.x 			= 10
		tab_1.x 			= 10
		tab_1.y 			= newheight - tab_1.height - st_stop.height - ii_resizeband_y * 2  
		tab_1.width 		= newwidth - tab_1.x * 2 
		tab_2.width 		= tab_1.width 		

		If tab_1.visible then 
			tab_2.height		= newheight - ii_resizeband_y * 2 - tab_1.height - tab_2.y - 100 
		ELSE
			tab_2.height		= newheight - ii_resizeband_y * 2  - tab_2.y - st_stop.height  
		END IF
		
		idw_eq_cat.width		= tab_2.width - 70
		idw_eq_cat.height 	= tab_2.height - 150 
		
		idw_eq_zone.width	= idw_eq_cat.width	
		idw_eq_zone.height 	= idw_eq_cat.height 

		idw_ptasks.width		= idw_eq_cat.width	 
		idw_ptasks.height 		= idw_eq_cat.height 

		idw_ctasks.width		= idw_eq_cat.width	 
		idw_ctasks.height 		= idw_eq_cat.height 
		
	End IF 
End IF 	
end event

event ue_dfilter;call super::ue_dfilter;string lsFilter 
int liRc
		
if trim(is_dfilter[1]) <> '' and is_dfilter[1] <> '*ALL*' then	
	lsFilter =  'POS("'+UPPER(trim(is_dfilter[1]))+  '", UPPER(contacttype)) > 0' 
	liRc = dw_primary.SetFilter (lsFilter) 
	liRc = dw_primary.Filter () 
	liRc = liRc
ELSE
	liRc = dw_primary.SetFilter ('') 
	liRc = dw_primary.Filter () 
END IF

//		dw_mainlist

end event

event ue_cb_new;call super::ue_cb_new;
select max(area_number) into :is_new_eq_id 
FROM equipment_master ;

is_new_eq_id = string( integer(is_new_eq_id) + 1 ) 

if idw_details.GetRow() > 0 then
	idw_details.SetITem( idw_details.GetRow() , 'area_number', is_new_eq_id ) 
END IF
end event

type cb_tmpl from w_vzt_base`cb_tmpl within w_equipment_custom
end type

type cb_dfilter from w_vzt_base`cb_dfilter within w_equipment_custom
integer x = 1824
integer y = 1928
integer width = 178
integer textsize = -8
string facename = "Lucida Sans"
boolean enabled = false
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_equipment_custom
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_equipment_custom
boolean visible = false
integer x = 2158
integer y = 16
integer width = 1490
integer height = 256
boolean enabled = false
string dataobject = "d_equipment_by_category"
end type

event dw_mainlist::ue_rowselected;//if row > 0 and row <= this.RowCount() AND ab_selected = true then
//	this.event ue_get_key_values( row ) 
//	this.event ue_retrieve_links() 
	
	
//	id_main_id = f_nvl(this.GetItemNumber(row,'id') , 0)
//	idw_vpart_sel.id_main_id_local 	= id_main_id 
//	idw_vpart_avail.id_main_id_local = id_main_id 
//	
//	cb_new.visible 	= true 
//	is_vendor_type = f_nvl(this.GetItemString(row,'contacttype') ,'')
////Reset tabs based on vendor type:
//tab_1.tabpage_items.visible = true 
//tab_1.tabpage_projects.visible = false
//tab_1.tabpage_scon.visible = false
//
//choose case is_vendor_type 
//	case 'DESIGNER' 
//		tab_1.tabpage_projects.visible = true 
//		tab_1.tabpage_items.visible = false 
//	case 'CONTRACTOR' 
//		tab_1.tabpage_scon.visible = true 
//		tab_1.tabpage_items.visible = false 
//	case 'MUNICIPAL' 
//		
//	case else
//end choose
//
//
//	if id_main_id <= 0 then 
//		idw_addresses.Reset()
//		return 1
//	ELSE
//		cb_delete1.visible 	= true 
//		cb_save.visible 		= true 
//		cb_save.enabled 		= true 
//		long ll_rows
//		
////		ll_rows = idw_details.Retrieve( id_main_id ) 
//
//		ll_rows = idw_scon.Retrieve( id_main_id )
//		ll_rows = idw_proj.Retrieve( id_main_id )
//		ll_rows = idw_addresses.Retrieve( id_main_id )
////		ll_rows = dw_contact_address.Retrieve( id_main_id )
//
//		ll_rows = idw_vpart_sel.Retrieve( id_main_id )
//		ll_rows = idw_vpart_avail.Retrieve( id_main_id )
//		
//		ll_rows = 0
////		dw_answers.visible 	= true 	
////		cb_ins.visible			= true
////		cb_del.visible			= true
//	END IF 
//
	
//END IF	

return 1


end event

event dw_mainlist::constructor;call super::constructor;//this.of_setfieldsort( true) 
//this.inv_field_sort.of_setcolumn( 'comp_name_t', 'firstname A', 'firstname D')
//this.inv_field_sort.of_setcolumn( 'contacttype_t', 'contacttype A, firstname A', 'contacttype D, firstname A')
//
//this.setsort( 'firstname A')
//
//
end event

event dw_mainlist::ue_get_key_values;call super::ue_get_key_values;if al_row > 0 then 
	//id_main_id = f_nvl(this.GetItemNumber(al_row ,'id') , 0)
	//idw_vpart_sel.id_main_id_local 	= id_main_id 
	//idw_vpart_avail.id_main_id_local 	= id_main_id 
	
	cb_new.visible 	= true 
//	is_vendor_type = f_nvl(this.GetItemString(al_row ,'contacttype') ,'')

//setfocus( tab_1.tabpage_1)

//	if id_main_id <= 0 then 
//		idw_addresses.Reset()
//		return 
//	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		long ll_rows
		
//		ll_rows = idw_details.Retrieve( id_main_id ) 
//		ll_rows = idw_scon.Retrieve( id_main_id )
//		ll_rows = idw_proj.Retrieve( id_main_id )
//		ll_rows = idw_addresses.Retrieve( id_main_id )
//		ll_rows = dw_contact_address.Retrieve( id_main_id )

//		ll_rows = idw_vpart_sel.Retrieve( id_main_id )
//		ll_rows = idw_vpart_avail.Retrieve( id_main_id )
		
		ll_rows = 0
//	END IF 
	
END IF	

return 


end event

type cb_last_search from w_vzt_base`cb_last_search within w_equipment_custom
integer x = 718
integer y = 1928
integer width = 343
integer taborder = 20
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_close from w_vzt_base`cb_close within w_equipment_custom
integer x = 2217
integer y = 1928
integer width = 201
integer taborder = 50
integer textsize = -8
fontcharset fontcharset = russiancharset!
string facename = "Lucida Sans"
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_equipment_custom
boolean visible = true
integer x = 2007
integer y = 1928
integer width = 201
integer taborder = 110
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_delete1::clicked;//OVERR
If Is_PasswordOK( Get_Event_Security( "PB" ) ) Then
	
MessageBox("Deletion Alert","Deleting this Equipment will delete all Pending work tickets or affect Reporting function." );

f_log_delete(idw_details,  idw_details.GetRow())
delete from area where area_number=:area_number;
delete from equipment_master where area_number=:area_number;
delete from vzt_equipment_task_map where equipment_id = :area_number;
delete from equipment_service_cont_map where equipment_id=:area_number;

commit;

cb_newsearch.event clicked()
dw_primary.ib_search_again = true 
cb_search.event clicked()

end if


end event

type cb_save from w_vzt_base`cb_save within w_equipment_custom
integer x = 1408
integer y = 1928
integer width = 201
integer taborder = 90
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_save::clicked;call super::clicked;if ii_savestatus >=0 then 
//	dw_mainlist.event ue_get_key_values ( dw_mainlist.GetRow() )
	//idw_addresses.Retrieve( id_main_id )
END IF

ib_save_clicked = true // for refresh performance
end event

type cb_select from w_vzt_base`cb_select within w_equipment_custom
integer x = 1198
integer y = 1928
integer width = 201
integer taborder = 80
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_new from w_vzt_base`cb_new within w_equipment_custom
integer x = 1618
integer y = 1928
integer width = 201
integer taborder = 100
integer textsize = -8
string facename = "Lucida Sans"
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_equipment_custom
integer x = 55
integer y = 1928
integer taborder = 70
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_newsearch::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
If idw_details.dataobject = 'd_equipment_master_detail_parms' then
	idw_details.dataobject = 'd_equipment_master_detail'
	idw_details.SetTransObject( SQLCA)
//	idw_details.ShareData( idw_eq_cat )

END IF
tab_2.selecttab(1)
Super::EVENT Clicked()
end event

type cb_search from w_vzt_base`cb_search within w_equipment_custom
integer x = 407
integer y = 1928
integer width = 302
integer taborder = 60
integer textsize = -8
string facename = "Lucida Sans"
end type

event cb_search::clicked;call super::clicked;cb_new.visible = true 
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_equipment_custom
integer x = 2514
integer y = 1928
integer width = 247
integer textsize = -8
long backcolor = 67108864
end type

type st_stop from w_vzt_base`st_stop within w_equipment_custom
integer x = 2574
integer y = 1928
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_equipment_custom
boolean visible = false
integer x = 3099
integer y = 396
integer width = 137
integer height = 108
integer taborder = 40
string dataobject = "d_vendor_edit"
boolean vscrollbar = false
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'firstname', 'lastname','title'} // 'id',

is_searchable[]	=  is_editable[]


end event

event dw_data::ue_refresh_identity;//long ll_row, ll_id
//ll_row = this.GetRow() 
//if ll_row <= 0 then return  
//
//ll_id = f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0)
//if ll_id = 0 then 
//	SELECT max(questionid) into :id_questionid from qgen_questions ;
//	this.setitem( this.GetRow(), 'questionid', id_questionid)
////	MessageBox('qid',string(id_questionid))
//ELSE
//	id_questionid = ll_id 
//END IF
//
//
end event

event dw_data::ue_update_keys_on_new;If row <= 0 then return 1

long ll_id, ll_row, ll_count
ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)

if ll_id = 0 then 
	SELECT max(id) + 1 into :ll_id from vzt_contact ;
	this.setitem( row, 'id', ll_id )
END IF
return 1
end event

type dw_print from w_vzt_base`dw_print within w_equipment_custom
integer x = 3547
integer y = 768
integer taborder = 120
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_equipment_custom
integer x = 2016
integer y = 8
end type

type r_1 from rectangle within w_equipment_custom
boolean visible = false
integer linethickness = 12
long fillcolor = 8421504
integer x = 347
integer y = 2060
integer width = 91
integer height = 112
end type

type dw_contact_address from uo_vzt_dwbase within w_equipment_custom
boolean visible = false
integer x = 3365
integer y = 256
integer width = 645
integer height = 428
integer taborder = 20
string dataobject = "d_contact_address_edit"
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)
end event

type tab_1 from tab within w_equipment_custom
integer x = 23
integer y = 948
integer width = 5088
integer height = 1236
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_pm tabpage_pm
tabpage_scon tabpage_scon
tabpage_parts tabpage_parts
tabpage_ptask tabpage_ptask
tabpage_ctask tabpage_ctask
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_pm=create tabpage_pm
this.tabpage_scon=create tabpage_scon
this.tabpage_parts=create tabpage_parts
this.tabpage_ptask=create tabpage_ptask
this.tabpage_ctask=create tabpage_ctask
this.Control[]={this.tabpage_1,&
this.tabpage_pm,&
this.tabpage_scon,&
this.tabpage_parts,&
this.tabpage_ptask,&
this.tabpage_ctask}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_pm)
destroy(this.tabpage_scon)
destroy(this.tabpage_parts)
destroy(this.tabpage_ptask)
destroy(this.tabpage_ctask)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 5051
integer height = 1124
long backcolor = 79349703
string text = "Details"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
cb_6 cb_6
pb_docs pb_docs
dw_detail dw_detail
end type

on tabpage_1.create
this.cb_6=create cb_6
this.pb_docs=create pb_docs
this.dw_detail=create dw_detail
this.Control[]={this.cb_6,&
this.pb_docs,&
this.dw_detail}
end on

on tabpage_1.destroy
destroy(this.cb_6)
destroy(this.pb_docs)
destroy(this.dw_detail)
end on

type cb_6 from commandbutton within tabpage_1
integer x = 3771
integer y = 32
integer width = 343
integer height = 72
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_detail.Print()
end event

type pb_docs from picturebutton within tabpage_1
integer x = 3621
integer y = 28
integer width = 119
integer height = 104
integer taborder = 130
boolean bringtotop = true
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "DOCs"
string picturename = "Custom001!"
vtextalign vtextalign = vcenter!
end type

event clicked;if area_number = '' then
	return 
ELSE
	OpenWithParm (w_equipment_linked_docs, area_number )
END IF
end event

type dw_detail from uo_vzt_dwbase within tabpage_1
integer x = 9
integer y = 28
integer width = 3547
integer height = 1064
integer taborder = 20
string dataobject = "d_equipment_master_detail"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;post wf_setupdateable ( dw_detail, "eq detail", true, true ) // set updateable, title and selectable

//this.ib_poweredit = true 

is_protected[]	={''}
is_restricted[]	={''}
is_required[]	={''}

_set_bg_opaque_on_search 	= true 
_SetNullonNewSearch 			= true
_ResetMaskOnSearch 			= true
_ResetDataObjectOnSelect 		= true

is_editable[]	={'category', 'area_name',  'area_number', 'zone_code', 'zone_group_code', &
	'model', 'serialno', & 
'manufacturer', 'vendor',  'purchasecost',  &
		'purchasedate', 'warranty_expires', &
		'extended_warranty' , 'descr'  } 
		
is_searchable[]	=  is_editable[]


end event

event rowfocuschanged;call super::rowfocuschanged;iw_mywindow.wf_linked_scroll( dw_primary, dw_primary_list, dw_primary_list) 
//this.event ue_get_key_values ()
//iw_mywindow.event ue_retrieve_links()

end event

type tabpage_pm from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 96
integer width = 5051
integer height = 1124
long backcolor = 67108864
string text = "PM Presets"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
rb_all rb_all
cb_11 cb_11
cb_10 cb_10
cb_1 cb_1
dw_avail dw_avail
dw_sel dw_sel
sle_1 sle_1
rb_2 rb_2
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
rb_3 rb_3
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_1 rb_1
gb_1 gb_1
end type

on tabpage_pm.create
this.rb_all=create rb_all
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_1=create cb_1
this.dw_avail=create dw_avail
this.dw_sel=create dw_sel
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_10=create rb_10
this.rb_9=create rb_9
this.rb_8=create rb_8
this.rb_3=create rb_3
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.rb_all,&
this.cb_11,&
this.cb_10,&
this.cb_1,&
this.dw_avail,&
this.dw_sel,&
this.sle_1,&
this.rb_2,&
this.rb_10,&
this.rb_9,&
this.rb_8,&
this.rb_3,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_1,&
this.gb_1}
end on

on tabpage_pm.destroy
destroy(this.rb_all)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_1)
destroy(this.dw_avail)
destroy(this.dw_sel)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_10)
destroy(this.rb_9)
destroy(this.rb_8)
destroy(this.rb_3)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_1)
destroy(this.gb_1)
end on

type rb_all from radiobutton within tabpage_pm
integer x = 1353
integer y = 84
integer width = 265
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
end type

event clicked;UpdateSelectedPMDW( 0 );
end event

type cb_11 from commandbutton within tabpage_pm
integer x = 2213
integer y = 608
integer width = 201
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = ">"
end type

event clicked;long ll_find = 1, ll_row

ll_row = 0;

do   
	ll_row = idw_pm_sel.getSelectedRow( ll_row );

	if ( ll_row> 0) then
		idw_pm_sel.SelectRow(	ll_row,false);
		idw_pm_sel.deleteRow(	ll_row);
		If tab_1.tabpage_pm.dw_sel.update() = 1 then
			Commit; 
		ELSE
			Rollback;
		END IF
	
	end if 

LOOP while ( ll_row > 0)

end event

type cb_10 from commandbutton within tabpage_pm
integer x = 2208
integer y = 512
integer width = 201
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<"
end type

event clicked;if( trim(area_number)="") then
	MessageBox("Equipment Selection ", "Please select an equipment");
	return 0;
end if

long ll_find = 1, ll_row 

ll_row =0;

do   
	ll_row 	=	idw_pm_avl.getSelectedRow(ll_row );
	if ll_row  > 0 then
		AddRowPMSelectedTaskDW(ll_row );	
		tab_1.tabpage_pm.dw_avail.SelectRow(ll_row ,false);
	end if 

LOOP while (ll_row  > 0)

idw_pm_sel.Retrieve( area_number) 
UpdateSelectedPMDW( period_selected);
end event

type cb_1 from commandbutton within tabpage_pm
integer x = 2053
integer y = 16
integer width = 343
integer height = 72
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_sel.Print()
end event

type dw_avail from uo_vzt_dwbase within tabpage_pm
event ue_get_key_values ( long row )
integer x = 2432
integer y = 404
integer width = 2345
integer height = 676
integer taborder = 60
string dataobject = "d_equipment_problem_subproblem"
boolean vscrollbar = true
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'M'  // 'S' single, 'M' - multi

end event

type dw_sel from uo_vzt_dwbase within tabpage_pm
event ue_get_key_values ( long row )
integer x = 14
integer y = 412
integer width = 2185
integer height = 676
integer taborder = 50
string dataobject = "d_equipment_task_list_new"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

type sle_1 from singlelineedit within tabpage_pm
integer x = 1367
integer y = 268
integer width = 137
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
string text = "25"
borderstyle borderstyle = stylelowered!
end type

event modified;if isnumber(tab_1.tabpage_pm.sle_1.text) then
	UpdateSelectedPMDW( integer(tab_1.tabpage_pm.sle_1.text));
else
	MessageBox("Error ","Please enter a valid numeric value for Period ");
	tab_1.tabpage_pm.sle_1.text="";
end if 
end event

type rb_2 from radiobutton within tabpage_pm
integer x = 933
integer y = 280
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Other"
end type

event clicked;if isnumber(tab_1.tabpage_pm.sle_1.text) then
	
//tab_1.tabpage_pm.dw_sel.SetTransObject(SQLCA)
tab_1.tabpage_pm.dw_sel.setFilter("vzt_equipment_task_map_period="+tab_1.tabpage_pm.sle_1.text);
tab_1.tabpage_pm.dw_sel.Filter();
period_selected=Integer(tab_1.tabpage_pm.sle_1.text);

else
	MessageBox("Error ","Please enter a valid numeric value for Period ");	
	tab_1.tabpage_pm.sle_1.text="";

end if 
end event

type rb_10 from radiobutton within tabpage_pm
integer x = 933
integer y = 184
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "360 Days"
end type

event clicked;UpdateSelectedPMDW(360);
end event

type rb_9 from radiobutton within tabpage_pm
integer x = 933
integer y = 80
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "180 Days"
end type

event clicked;UpdateSelectedPMDW(180);
end event

type rb_8 from radiobutton within tabpage_pm
integer x = 521
integer y = 280
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "90 Days"
end type

event clicked;UpdateSelectedPMDW(90);
end event

type rb_3 from radiobutton within tabpage_pm
integer x = 521
integer y = 180
integer width = 343
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "60 Days"
end type

event clicked;UpdateSelectedPMDW(60);
end event

type rb_6 from radiobutton within tabpage_pm
integer x = 521
integer y = 84
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "30 Days"
end type

event clicked;UpdateSelectedPMDW(30);
end event

type rb_5 from radiobutton within tabpage_pm
integer x = 128
integer y = 280
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "21 Days"
end type

event clicked;UpdateSelectedPMDW(21);
end event

type rb_4 from radiobutton within tabpage_pm
integer x = 128
integer y = 184
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "14 Days"
end type

event clicked;UpdateSelectedPMDW(14);
end event

type rb_1 from radiobutton within tabpage_pm
integer x = 123
integer y = 88
integer width = 402
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "7 Days"
boolean checked = true
end type

event clicked;UpdateSelectedPMDW(7);


end event

type gb_1 from groupbox within tabpage_pm
integer x = 23
integer y = 24
integer width = 1696
integer height = 376
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Period or Enter for Custom Period"
end type

type tabpage_scon from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 96
integer width = 5051
integer height = 1124
long backcolor = 67108864
string text = "Service Contracts and Docs"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
cb_3 cb_3
cb_9 cb_9
cb_8 cb_8
dw_3 dw_3
dw_2 dw_2
end type

on tabpage_scon.create
this.cb_3=create cb_3
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_3=create dw_3
this.dw_2=create dw_2
this.Control[]={this.cb_3,&
this.cb_9,&
this.cb_8,&
this.dw_3,&
this.dw_2}
end on

on tabpage_scon.destroy
destroy(this.cb_3)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_3)
destroy(this.dw_2)
end on

type cb_3 from commandbutton within tabpage_scon
integer x = 2249
integer y = 32
integer width = 229
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_2.Print()
end event

type cb_9 from commandbutton within tabpage_scon
integer x = 2254
integer y = 568
integer width = 201
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = ">"
end type

event clicked;long ll_row = 0

do   
	ll_row=	idw_scon_sel.getSelectedRow( ll_row);

	if ll_row> 0 then
		idw_scon_sel.SelectRow(ll_row, false);
		idw_scon_sel.deleteRow(ll_row);
		if idw_scon_sel.update() = 1 then
			commit;
		else
			rollback;
		end if
	end if 

LOOP while (ll_row > 0)
end event

type cb_8 from commandbutton within tabpage_scon
integer x = 2258
integer y = 468
integer width = 197
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<"
end type

event clicked;if( trim(area_number)="") then
	MessageBox("Equipment Selection ", "Please select an equipment");
	return 0
end if

long ll_row
ll_row = 0;

do   
	ll_row = idw_scon_avl.getSelectedRow(	ll_row );
	if ll_row > 0 then
		idw_scon_avl.SelectRow(ll_row , false);
		AddRowServiceContractsSelectedDW(  ll_row);	
	end if 
LOOP while (ll_row > 0)

idw_scon_sel.Retrieve ( integer (area_number) )
end event

type dw_3 from uo_vzt_dwbase within tabpage_scon
event ue_get_key_values ( long row )
integer x = 2505
integer y = 32
integer width = 2181
integer height = 1064
integer taborder = 60
string dataobject = "d_equipment_all_service_contracts_list"
boolean vscrollbar = true
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'M'  // 'S' single, 'M' - multi

end event

type dw_2 from uo_vzt_dwbase within tabpage_scon
event ue_get_key_values ( long row )
integer x = 18
integer y = 32
integer width = 2185
integer height = 1060
integer taborder = 60
string dataobject = "d_equipment_svc_contact_sel"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'M'  // 'S' single, 'M' - multi

end event

event doubleclicked;call super::doubleclicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

String vendor_sel;
vendor_sel=dw_2.getItemString(row,"vzt_service_cont_descr");
OpenSheetWithParm( w_equipment_svc_edit, vendor_sel , gnv_appman.iw_frame, 0, Original! );

end event

type tabpage_parts from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 96
integer width = 5051
integer height = 1124
long backcolor = 67108864
string text = "Linked Parts and Supplies"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
cb_2 cb_2
dw_parts dw_parts
end type

on tabpage_parts.create
this.cb_2=create cb_2
this.dw_parts=create dw_parts
this.Control[]={this.cb_2,&
this.dw_parts}
end on

on tabpage_parts.destroy
destroy(this.cb_2)
destroy(this.dw_parts)
end on

type cb_2 from commandbutton within tabpage_parts
integer x = 2482
integer y = 4
integer width = 343
integer height = 72
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_parts.Print()
end event

type dw_parts from uo_vzt_dwbase within tabpage_parts
event ue_get_key_values ( long row )
integer x = 23
integer y = 12
integer width = 2213
integer height = 1060
integer taborder = 70
string dataobject = "d_equipment_parts"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

event doubleclicked;call super::doubleclicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

long part_sel;
part_sel=idw_parts.getItemNumber(row,"vzt_part_id");

OpenSheetWithParm( w_equipment_part_edit, part_sel, gnv_appman.iw_frame, 0, Original! );
end event

type tabpage_ptask from userobject within tab_1
integer x = 18
integer y = 96
integer width = 5051
integer height = 1124
long backcolor = 67108864
string text = "Pending Tasks"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
cb_4 cb_4
dw_ptasks dw_ptasks
end type

on tabpage_ptask.create
this.cb_4=create cb_4
this.dw_ptasks=create dw_ptasks
this.Control[]={this.cb_4,&
this.dw_ptasks}
end on

on tabpage_ptask.destroy
destroy(this.cb_4)
destroy(this.dw_ptasks)
end on

type cb_4 from commandbutton within tabpage_ptask
integer x = 2875
integer width = 343
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_ptasks.Print()
end event

type dw_ptasks from uo_vzt_dwbase within tabpage_ptask
event ue_get_key_values ( long row )
integer x = 9
integer y = 68
integer width = 3529
integer height = 1044
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_eq_pending_calls"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

event doubleclicked;call super::doubleclicked;if row <= 0 then return 

If Is_PasswordOK( Get_Event_Security( "CM" ) ) Then
	string callNumber, action, statCode, clickedColNum
	
	callNumber 		= dw_ptasks.GetItemString(dw_ptasks.GetRow(),"call_number")
	statCode 		= dw_ptasks.GetItemString(dw_ptasks.GetRow(),"stat_code")
	clickedColNum 	= dw_ptasks.GetColumnName()
	clickedColNum	 = string(f_find_col_num(clickedColNum),"00")
	
	if integer(statCode) < 10 then
 	  action = '1'
	else
		action = '2'
	end if
	If IsValid( w_call_upd ) Then
//		MessageBox("col num",string(f_find_col_num(clickedColumn),"00"))
		w_call_upd.sCallNumber = callNumber
		w_call_upd.openMode = action
		w_call_upd.colToSet = integer(clickedColNum)
		w_call_upd.TriggerEvent("ue_refresh")
		if w_call_upd.st_mode.text = 'Add' then // try to modify a closed call
			SetPointer ( arrow! )
		else
			open(w_call_upd)
		end if
	else
//		MessageBox("col num",string(f_find_col_num(clickedColumn),"00"))
		If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
			OpenSheetWithParm( w_call_upd, action+clickedColNum+callNumber, "w_call_upd", w_main, 0, Original! )
		else
			MessageBox("Failed","Opening Call Screen failed!")
		end if
	end if
end if
end event

type tabpage_ctask from userobject within tab_1
integer x = 18
integer y = 96
integer width = 5051
integer height = 1124
long backcolor = 67108864
string text = "Closed Tasks"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
cb_5 cb_5
dw_ctasks dw_ctasks
end type

on tabpage_ctask.create
this.cb_5=create cb_5
this.dw_ctasks=create dw_ctasks
this.Control[]={this.cb_5,&
this.dw_ctasks}
end on

on tabpage_ctask.destroy
destroy(this.cb_5)
destroy(this.dw_ctasks)
end on

type cb_5 from commandbutton within tabpage_ctask
integer x = 2866
integer y = 8
integer width = 343
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_ctasks.Print()
end event

type dw_ctasks from uo_vzt_dwbase within tabpage_ctask
event ue_get_key_values ( long row )
integer x = 5
integer y = 76
integer width = 3529
integer height = 1032
integer taborder = 90
string dataobject = "d_eq_closed_calls"
boolean ib_poweredit = true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

type phl_1 from picturehyperlink within w_equipment_custom
integer x = 96
integer y = 32
integer width = 1106
integer height = 180
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = "PM Buddy.jpg"
boolean focusrectangle = false
end type

type tab_2 from tab within w_equipment_custom
integer x = 23
integer y = 252
integer width = 5093
integer height = 688
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_cat tabpage_cat
tabpage_zone tabpage_zone
end type

on tab_2.create
this.tabpage_cat=create tabpage_cat
this.tabpage_zone=create tabpage_zone
this.Control[]={this.tabpage_cat,&
this.tabpage_zone}
end on

on tab_2.destroy
destroy(this.tabpage_cat)
destroy(this.tabpage_zone)
end on

event selectionchanged;
If newindex = 2 then
	if idw_eq_zone.RowCount() <= 0 then 
		// no data - retrieve first time 
		SetPointer( hourglass!) 
		idw_eq_zone.Retrieve()
	else // data already retrieved 
		if ib_save_clicked then 
			SetPointer( hourglass!) 
			idw_eq_zone.Retrieve()
		end if
	
		cb_newsearch.visible = true
		cb_search.visible = false
		ib_save_clicked = false 
	end if
Else
	If oldindex = 2 then
		cb_newsearch.event clicked()
		dw_primary.ib_search_again = true 
		cb_search.event clicked()
	END IF 
end if

end event

type tabpage_cat from userobject within tab_2
integer x = 18
integer y = 96
integer width = 5056
integer height = 576
long backcolor = 67108864
string text = "Equipment By Category"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
dw_eq_cat dw_eq_cat
end type

on tabpage_cat.create
this.dw_eq_cat=create dw_eq_cat
this.Control[]={this.dw_eq_cat}
end on

on tabpage_cat.destroy
destroy(this.dw_eq_cat)
end on

type dw_eq_cat from uo_vzt_dwbase within tabpage_cat
event ue_get_key_values ( long row )
integer x = 9
integer y = 16
integer width = 3040
integer height = 1064
integer taborder = 30
string dataobject = "d_equipment_by_category"
boolean ib_poweredit = true
end type

event ue_get_key_values(long row);area_number	=this.GetItemString(row,"area_number");
area_name		=this.GetItemString(row,"area_name");
st_number.text =area_number	
st_name.text 	=area_name

iw_mywindow.event dynamic ue_refresh_links () 



end event

event rowfocuschanged;If Not ib_selecting then 
	iw_mywindow.wf_linked_scroll( dw_primary_list, dw_primary, dw_primary_list) 
End IF

If not ib_doingnew and not ib_newsearch then 
	this.event ue_get_key_values ( currentrow)
	iw_win.event ue_refresh_links() 
END IF
end event

type tabpage_zone from userobject within tab_2
integer x = 18
integer y = 96
integer width = 5056
integer height = 576
long backcolor = 67108864
string text = "Equipment By Zone"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
dw_eq_zone dw_eq_zone
end type

on tabpage_zone.create
this.dw_eq_zone=create dw_eq_zone
this.Control[]={this.dw_eq_zone}
end on

on tabpage_zone.destroy
destroy(this.dw_eq_zone)
end on

type dw_eq_zone from uo_vzt_dwbase within tabpage_zone
event ue_get_key_values ( long row )
integer x = 14
integer y = 12
integer width = 3040
integer height = 1064
integer taborder = 40
string dataobject = "d_equipment_by_zone_2level"
boolean ib_poweredit = true
end type

event ue_get_key_values(long row);
area_number	=this.GetItemString(row,"area_number");
area_name		=this.GetItemString(row,"area_name");
st_number.text =area_number	
st_name.text 	=area_name

If idw_details.dataobject = 'd_equipment_master_detail'  then
	idw_details.dataobject = 'd_equipment_master_detail_parms'
	idw_details.SetTransObject( SQLCA)
END IF

long ll_rows
ll_rows = idw_details.Retrieve( area_number)
ll_rows = ll_rows


end event

event rowfocuschanged;call super::rowfocuschanged;If not ib_doingnew and not ib_newsearch then 
	this.event ue_get_key_values ( currentrow) 
	iw_win.event ue_refresh_links() 
END IF
end event

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

type p_2 from picture within w_equipment_custom
integer x = 3758
integer y = 96
integer width = 155
integer height = 132
boolean bringtotop = true
string picturename = "rapid_response_icon_48.bmp"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_equipment_custom
integer x = 3323
integer y = 144
integer width = 347
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 67108864
string text = "Details Box"
boolean checked = true
boolean lefttext = true
borderstyle borderstyle = styleraised!
end type

event clicked;if (cbx_1.checked) then 
	tab_2.height = tab_2.height - tab_1.height - 10 
	tab_1.show()
else
	tab_1.hide()
	tab_2.height = tab_2.height + tab_1.height + 10 
end if

	idw_eq_cat.width		= tab_2.width - 70
	idw_eq_cat.height 	= tab_2.height - 150 
	idw_eq_zone.width	= idw_eq_cat.width	
	idw_eq_zone.height 	= idw_eq_cat.height 


//parent.event resize( 0, parent.width,  parent.height)  
end event

type st_number from singlelineedit within w_equipment_custom
boolean visible = false
integer x = 1312
integer y = 36
integer width = 443
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_name from singlelineedit within w_equipment_custom
boolean visible = false
integer x = 1312
integer y = 128
integer width = 690
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_dup from commandbutton within w_equipment_custom
boolean visible = false
integer x = 2839
integer y = 1928
integer width = 201
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Co&py "
end type

event clicked;//window lw_display 
//string ls_windowname
//ls_windowname = 'w_equipment_copy'   

istr_parms.string1 = area_number
//openWithParm( lw_display,  istr_parms, ls_windowname )		
openWithParm( w_equipment_copy,  istr_parms )		

istr_parms = Message.PowerObjectParm
if not isValid( istr_parms) then return 0
If istr_parms.rc <= 0 then return 0

// Refresh all lists 
tab_1.SelectTab( 1) 
cb_newsearch.event clicked()
//dw_primary.ib_search_again = true 
cb_search.event clicked()

end event

