$PBExportHeader$w_equipment_custom_old.srw
forward
global type w_equipment_custom_old from window
end type
type p_2 from picture within w_equipment_custom_old
end type
type cbx_1 from checkbox within w_equipment_custom_old
end type
type p_1 from picture within w_equipment_custom_old
end type
type tab_2 from tab within w_equipment_custom_old
end type
type tabpage_8 from userobject within tab_2
end type
type dw_8 from uo_vzt_dwbase within tabpage_8
end type
type tabpage_8 from userobject within tab_2
dw_8 dw_8
end type
type tabpage_9 from userobject within tab_2
end type
type dw_7 from datawindow within tabpage_9
end type
type tabpage_9 from userobject within tab_2
dw_7 dw_7
end type
type tabpage_7 from userobject within tab_2
end type
type dw_1 from uo_vzt_dwbase within tabpage_7
end type
type tabpage_7 from userobject within tab_2
dw_1 dw_1
end type
type tab_2 from tab within w_equipment_custom_old
tabpage_8 tabpage_8
tabpage_9 tabpage_9
tabpage_7 tabpage_7
end type
type tab_1 from tab within w_equipment_custom_old
end type
type tabpage_13 from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_13
end type
type pb_docs from picturebutton within tabpage_13
end type
type cb_dup from commandbutton within tabpage_13
end type
type cb_bt_update from commandbutton within tabpage_13
end type
type cb_bt_print from commandbutton within tabpage_13
end type
type cb_bt_save from commandbutton within tabpage_13
end type
type cb_bt_cancel from commandbutton within tabpage_13
end type
type cb_bt_delete from commandbutton within tabpage_13
end type
type cb_bt_edit from commandbutton within tabpage_13
end type
type cb_bt_insertnew from commandbutton within tabpage_13
end type
type cb_bt_newsearch from commandbutton within tabpage_13
end type
type cb_bt_search from commandbutton within tabpage_13
end type
type dw_9 from datawindow within tabpage_13
end type
type tabpage_13 from userobject within tab_1
cb_1 cb_1
pb_docs pb_docs
cb_dup cb_dup
cb_bt_update cb_bt_update
cb_bt_print cb_bt_print
cb_bt_save cb_bt_save
cb_bt_cancel cb_bt_cancel
cb_bt_delete cb_bt_delete
cb_bt_edit cb_bt_edit
cb_bt_insertnew cb_bt_insertnew
cb_bt_newsearch cb_bt_newsearch
cb_bt_search cb_bt_search
dw_9 dw_9
end type
type tabpage_6 from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_6
end type
type rb_3 from radiobutton within tabpage_6
end type
type dw_sel from datawindow within tabpage_6
end type
type dw_avail from datawindow within tabpage_6
end type
type cb_11 from commandbutton within tabpage_6
end type
type cb_10 from commandbutton within tabpage_6
end type
type sle_1 from singlelineedit within tabpage_6
end type
type rb_2 from radiobutton within tabpage_6
end type
type rb_10 from radiobutton within tabpage_6
end type
type rb_9 from radiobutton within tabpage_6
end type
type rb_8 from radiobutton within tabpage_6
end type
type rb_6 from radiobutton within tabpage_6
end type
type rb_5 from radiobutton within tabpage_6
end type
type rb_4 from radiobutton within tabpage_6
end type
type rb_1 from radiobutton within tabpage_6
end type
type gb_1 from groupbox within tabpage_6
end type
type tabpage_6 from userobject within tab_1
cb_2 cb_2
rb_3 rb_3
dw_sel dw_sel
dw_avail dw_avail
cb_11 cb_11
cb_10 cb_10
sle_1 sle_1
rb_2 rb_2
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_1 rb_1
gb_1 gb_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_2
end type
type cb_9 from commandbutton within tabpage_2
end type
type cb_8 from commandbutton within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type dw_3 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_3 cb_3
cb_9 cb_9
cb_8 cb_8
dw_2 dw_2
dw_3 dw_3
end type
type tabpage_3 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_3
end type
type dw_4 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_4 cb_4
dw_4 dw_4
end type
type tabpage_4 from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_4
end type
type dw_5 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_5 cb_5
dw_5 dw_5
end type
type tabpage_5 from userobject within tab_1
end type
type cb_6 from commandbutton within tabpage_5
end type
type dw_6 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_6 cb_6
dw_6 dw_6
end type
type tab_1 from tab within w_equipment_custom_old
tabpage_13 tabpage_13
tabpage_6 tabpage_6
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
end forward

global type w_equipment_custom_old from window
integer width = 6176
integer height = 3268
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean toolbarvisible = false
event ue_refresh ( long al_row )
p_2 p_2
cbx_1 cbx_1
p_1 p_1
tab_2 tab_2
tab_1 tab_1
end type
global w_equipment_custom_old w_equipment_custom_old

type variables
String area_number;
String area_name;
long rowselected=0;
int period_selected=0;
string pm_filter='30';
long svc_cont_bank_row_selected=0;

double	id_oleid, id_doc_id,id_main_id
uo_vzt_dwbase   idw_details, idw_docs
uo_vzt_dwbase   idw_vpart_sel, idw_vpart_avail, idw_vpart

int detailmode=0;


//vic
str_response istr_parms




end variables

forward prototypes
public function string wf_get_next_equip_number ()
public subroutine loadtopframe ()
public subroutine loadtabequipment ()
public subroutine addrowservicecontractsselecteddw (integer dwselrow)
public subroutine addrowpmselectedtaskdw (integer dwselrow)
public subroutine loadservicepartsdw (string prm_area_number)
public subroutine updateclosingcallsdw (string prm_area_number)
public subroutine updateequipmentdetailsdw (string prm_area_number)
public subroutine updateselectedpmdw (string prm_area_number, integer prm_period)
public subroutine updateselectedservicecontractsdw (string prm_area_number)
public subroutine updatelinkedpartssuppliesdw (string prm_area_number)
public subroutine addequipmentinareatable ()
public subroutine addrowinequipmenttable ()
public subroutine updatependingcallsdw (string prm_area_name)
public subroutine deleteequipmentfromall (string val_area_number)
public subroutine updateequipment (string prm_area_number)
public function integer wf_refresh (long al_row)
end prototypes

event ue_refresh(long al_row);if al_row <= 0 then return

		area_number=tab_2.tabpage_8.dw_8.GetItemString(al_row,"equipment_master_area_number");
	
		updateequipmentdetailsdw(area_number);	
		loadservicepartsdw(area_number);		
		updatependingcallsdw(area_number);
		UpdateClosingCallsDW(area_number);
		UpdateSelectedPMDW(area_number,7);
		updatelinkedpartssuppliesdw(area_number);
		UpdateSelectedServiceContractsDW(area_number);
end event

public function string wf_get_next_equip_number ();string sNextNum
integer iNextNum

select max(convert(integer,area_number))   into :sNextNum 
from 	equipment_master;

if sqlca.sqlcode < 0 then
	egm_sqlerror( SQLCA )
	return ''
end if

//MessageBox("max equipment number",sNextNum);
return string(long(sNextNum)+1);
end function

public subroutine loadtopframe ();tab_2.tabpage_9.dw_7.Retrieve();
tab_2.tabpage_8.dw_8.Retrieve()
tab_2.tabpage_7.dw_1.RETRIEVE();
tab_1.tabpage_13.dw_9.retrieve();



end subroutine

public subroutine loadtabequipment ();long ll_end, ll_find;

TRY
		ll_end = tab_1.tabpage_13.dw_9.RowCount()
			
		ll_find = tab_1.tabpage_13.dw_9.Find("area_number ='"+area_number+"'", ll_find, ll_end)
		tab_1.tabpage_13.dw_9.ScrollToRow(ll_find)
			
			  
		CATCH ( PBXRuntimeError re )
			
	//			MessageBox( "Caught error", re.getMessage() )
			
END TRY

end subroutine

public subroutine addrowservicecontractsselecteddw (integer dwselrow);int svc_cont_no =0; 

svc_cont_no=tab_1.tabpage_2.dw_3.GetItemNumber(dwselrow,"id");

insert into equipment_svc_cont_map ( equipment_id, svc_cont_id)
values ( :area_number, :svc_cont_no);

if sqlca.sqlcode <>0 Then
	rollback;
	MessageBox('DB Error equipment_svc_cont_map',sqlca.sqlcode)
else 
	commit;
end if

svc_cont_no=tab_1.tabpage_2.dw_2.Retrieve();


end subroutine

public subroutine addrowpmselectedtaskdw (integer dwselrow);string problem_number;
string subproblem_number;
int period;

subproblem_number=tab_1.tabpage_6.dw_avail.getItemString(dwselrow,"subproblem_subproblem_number");
problem_number=tab_1.tabpage_6.dw_avail.getItemString(dwselrow,"subproblem_problem_number");
period=period_selected;

insert into vzt_equipment_task_map (equipment_id,period,problem_number,subproblem_number)
values (:area_number,:period,:problem_number,:subproblem_number);

if sqlca.sqlcode <>0 Then
		Rollback;				
		MessageBox('Eq. Error','Eq Task Map Insert Failed')
else 
		commit;
end if

tab_1.tabpage_6.dw_sel.Retrieve();

end subroutine

public subroutine loadservicepartsdw (string prm_area_number);tab_1.tabpage_3.dw_4.setFilter("vzt_equipment_task_map_equipment_id ="+prm_area_number);
tab_1.tabpage_3.dw_4.Filter();
tab_1.tabpage_3.dw_4.Retrieve();
		

end subroutine

public subroutine updateclosingcallsdw (string prm_area_number);tab_1.tabpage_5.dw_6.SetFilter("room = '"+area_number+"'");
tab_1.tabpage_5.dw_6.Filter();
tab_1.tabpage_5.dw_6.Retrieve();
		
end subroutine

public subroutine updateequipmentdetailsdw (string prm_area_number);long ll_find = 1, ll_end;			
ll_end = tab_1.tabpage_13.dw_9.RowCount()			
ll_find = tab_1.tabpage_13.dw_9.Find("area_number ='"+area_number+"'", ll_find, ll_end)
tab_1.tabpage_13.dw_9.ScrollToRow(ll_find)
			
			
end subroutine

public subroutine updateselectedpmdw (string prm_area_number, integer prm_period);tab_1.tabpage_6.dw_sel.setFilter("vzt_equipment_task_map_period= "+string(prm_period)+" and vzt_equipment_task_map_equipment_id="+prm_area_number);
tab_1.tabpage_6.dw_sel.Filter();
period_selected=prm_period;
tab_1.tabpage_6.dw_sel.Retrieve();
end subroutine

public subroutine updateselectedservicecontractsdw (string prm_area_number);GraphicObject whichControl;
whichControl=GetFocus();

if( typeof(tab_1.tabpage_2.dw_2)=typeof(whichControl)) Then
	tab_1.tabpage_2.dw_2.SetFilter(" equipment_svc_cont_map_equipment_id = "+prm_area_number);
	tab_1.tabpage_2.dw_2.Filter();
	tab_1.tabpage_2.dw_2.Retrieve();
else
end if




end subroutine

public subroutine updatelinkedpartssuppliesdw (string prm_area_number);tab_1.tabpage_3.dw_4.SetFilter("vzt_equipment_task_map_equipment_id ="+prm_area_number);
tab_1.tabpage_3.dw_4.Filter();
tab_1.tabpage_3.dw_4.Retrieve();
end subroutine

public subroutine addequipmentinareatable ();string val_area_number,val_area_name,val_zone_code,val_zone_group_code;


val_area_number=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"area_number");
val_area_name=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"area_name");
val_zone_code=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"zone_code");
val_zone_group_code=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"zone_group_code");


delete from area where area_number = :val_area_number;
insert into area(area_number,area_name,room_type,unit_type,zone_group_code) values (:val_area_number,:val_area_name,'E',:val_zone_code,:val_zone_group_code);

if sqlca.sqlcode <>0 Then
	rollback;
else 
	commit;
end if




end subroutine

public subroutine addrowinequipmenttable ();string  val_category,val_manufacturer,val_model,val_serialno;
string val_area_number,val_zone_code,val_zone_group_code,val_area_name;
DateTime val_purchasedate,val_extended_warranty,val_warranty_expires;
double val_purchasecost;
int val_vendor;
 
val_category=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"category");
val_manufacturer=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"manufacturer");
val_model=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"model");
val_serialno=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"serialno");
//messagebox("1","1");

val_purchasecost=tab_1.tabpage_13.dw_9.getItemNumber(tab_1.tabpage_13.dw_9.getRow(),"purchasecost");
val_area_number=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"area_number");
val_zone_code=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"zone_code");
val_zone_group_code=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"zone_group_code");
val_area_name=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"area_name");
//messagebox("1","2");
val_vendor=tab_1.tabpage_13.dw_9.getItemNumber(tab_1.tabpage_13.dw_9.getRow(),"vendor");
//messagebox("1","3");
val_purchasedate=tab_1.tabpage_13.dw_9.getItemDateTime(tab_1.tabpage_13.dw_9.getRow(),"purchasedate");
//messagebox("1","4");
val_extended_warranty=tab_1.tabpage_13.dw_9.getItemDateTime(tab_1.tabpage_13.dw_9.getRow(),"extended_warranty");
val_warranty_expires=tab_1.tabpage_13.dw_9.getItemDateTime(tab_1.tabpage_13.dw_9.getRow(),"warranty_expires");

delete from equipment_master where area_number=:val_area_number;
insert into equipment_master(category,manufacturer,model,serialno,purchasecost,area_number,zone_code,zone_group_code,area_name,vendor,purchasedate,extended_warranty,warranty_expires) values &
(:val_category,:val_manufacturer,:val_model,:val_serialno,:val_purchasecost,:val_area_number,:val_zone_code,:val_zone_group_code,:val_area_name,:val_vendor,:val_purchasedate,:val_extended_warranty,:val_warranty_expires);

if sqlca.sqlcode <>0 Then
	rollback;		
	MessageBox('DB Error',sqlca.sqlcode)
else 
	commit;
end if

end subroutine

public subroutine updatependingcallsdw (string prm_area_name);tab_1.tabpage_4.dw_5.SetFilter("room_num= '"+prm_area_name+"'");
tab_1.tabpage_4.dw_5.Filter();
tab_1.tabpage_4.dw_5.Retrieve();
		
end subroutine

public subroutine deleteequipmentfromall (string val_area_number);delete from area where area_number = :val_area_number;
delete from equipment_master where area_number=:val_area_number;

commit;
end subroutine

public subroutine updateequipment (string prm_area_number);string  val_category,val_manufacturer,val_model,val_serialno;
string val_area_number,val_zone_code,val_zone_group_code,val_area_name, ls_descr
DateTime val_purchasedate,val_extended_warranty,val_warranty_expires;
double val_purchasecost;
int val_vendor;
 
val_category=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"category");
val_manufacturer=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"manufacturer");
val_model=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"model");
val_serialno=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"serialno");

val_purchasecost=tab_1.tabpage_13.dw_9.getItemNumber(tab_1.tabpage_13.dw_9.getRow(),"purchasecost");
val_area_number=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"area_number");
val_zone_code=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"zone_code");
val_zone_group_code=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"zone_group_code");
val_area_name=tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"area_name");
val_vendor=tab_1.tabpage_13.dw_9.getItemNumber(tab_1.tabpage_13.dw_9.getRow(),"vendor");
val_purchasedate=tab_1.tabpage_13.dw_9.getItemDateTime(tab_1.tabpage_13.dw_9.getRow(),"purchasedate");
val_extended_warranty=tab_1.tabpage_13.dw_9.getItemDateTime(tab_1.tabpage_13.dw_9.getRow(),"extended_warranty");
val_warranty_expires=tab_1.tabpage_13.dw_9.getItemDateTime(tab_1.tabpage_13.dw_9.getRow(),"warranty_expires");

ls_descr = tab_1.tabpage_13.dw_9.getItemString(tab_1.tabpage_13.dw_9.getRow(),"descr");

update equipment_master 
set 
category=:val_category, 
manufacturer=:val_manufacturer,
model=:val_model,
serialno=:val_serialno,
purchasecost=:val_purchasecost,
zone_code=:val_zone_code,
zone_group_code=:val_zone_group_code,
vendor=:val_vendor,
area_name=:val_area_name,
purchasedate=:val_purchasedate,
extended_warranty=:val_extended_warranty,
warranty_expires=:val_warranty_expires,
descr=:ls_descr 
where area_number=:prm_area_number;

if sqlca.sqlcode <>0 Then
		MessageBox('Equpment Update Error on Equipment Master',sqlca.sqlcode)
		rollback; 
else 
	update area 
	set area_name = :val_area_name
	WHERE area_number=:prm_area_number;

	if sqlca.sqlcode <>0 Then
			MessageBox('Equpment Update Error on Area',sqlca.sqlcode)
			rollback; 
	else
		commit;
	end if
end if

end subroutine

public function integer wf_refresh (long al_row);//
event ue_refresh( al_row) 

return 1
end function

on w_equipment_custom_old.create
this.p_2=create p_2
this.cbx_1=create cbx_1
this.p_1=create p_1
this.tab_2=create tab_2
this.tab_1=create tab_1
this.Control[]={this.p_2,&
this.cbx_1,&
this.p_1,&
this.tab_2,&
this.tab_1}
end on

on w_equipment_custom_old.destroy
destroy(this.p_2)
destroy(this.cbx_1)
destroy(this.p_1)
destroy(this.tab_2)
destroy(this.tab_1)
end on

event open;tab_2.tabpage_8.dw_8.SetTransObject(SQLCA)
tab_2.tabpage_9.dw_7.SetTransObject(SQLCA)
tab_2.tabpage_7.dw_1.settransobject(SQLCA);

tab_1.tabpage_2.dw_2.settrans(SQLCA);
tab_1.tabpage_2.dw_3.settrans(SQLCA);
tab_1.tabpage_3.dw_4.settrans(SQLCA);	
tab_1.tabpage_4.dw_5.SetTransObject(SQLCA);
tab_1.tabpage_5.dw_6.SetTransObject(SQLCA);
tab_1.tabpage_6.dw_sel.SetTransObject(SQLCA)
tab_1.tabpage_6.dw_avail.SetTransObject(SQLCA)
tab_1.tabpage_13.dw_9.SetTransObject(SQLCA);

tab_1.tabpage_13.dw_9.Retrieve();

long ll_newrow

ll_newrow =tab_1.tabpage_13.dw_9.InsertRow(0)
tab_1.tabpage_13.dw_9.ScrollToRow(ll_newrow)

cbx_1.checked = false
end event

type p_2 from picture within w_equipment_custom_old
integer x = 4105
integer y = 60
integer width = 169
integer height = 144
string picturename = "rapid_response_icon_48.bmp"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_equipment_custom_old
integer x = 3685
integer y = 120
integer width = 347
integer height = 76
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
	


tab_2.resize(5778,824)
tab_2.tabpage_9.dw_7.resize((tab_2.width)-100, (tab_2.height)-175);
tab_2.tabpage_8.dw_8.resize((tab_2.width)-100, (tab_2.height)-175);
tab_2.tabpage_7.dw_1.resize((tab_2.width)-100, (tab_2.height)-175);
tab_1.show()



else
	
tab_2.resize(parent.width - 80, parent.height  - 400 );
tab_2.tabpage_9.dw_7.resize((tab_2.width)-100, (tab_2.height)-175);
tab_2.tabpage_8.dw_8.resize((tab_2.width)-100, (tab_2.height)-175);
tab_2.tabpage_7.dw_1.resize((tab_2.width)-100, (tab_2.height)-175);
tab_1.hide()

	
	
end if

end event

type p_1 from picture within w_equipment_custom_old
integer x = 37
integer y = 24
integer width = 1262
integer height = 168
string picturename = "PM Buddy.jpg"
boolean focusrectangle = false
end type

type tab_2 from tab within w_equipment_custom_old
event create ( )
event destroy ( )
integer x = 5
integer y = 232
integer width = 5778
integer height = 824
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 8421504
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_8 tabpage_8
tabpage_9 tabpage_9
tabpage_7 tabpage_7
end type

on tab_2.create
this.tabpage_8=create tabpage_8
this.tabpage_9=create tabpage_9
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_8,&
this.tabpage_9,&
this.tabpage_7}
end on

on tab_2.destroy
destroy(this.tabpage_8)
destroy(this.tabpage_9)
destroy(this.tabpage_7)
end on

type tabpage_8 from userobject within tab_2
integer x = 18
integer y = 100
integer width = 5742
integer height = 708
long backcolor = 67108864
string text = "Equipment by Category"
long tabtextcolor = 21130554
long picturemaskcolor = 536870912
dw_8 dw_8
end type

on tabpage_8.create
this.dw_8=create dw_8
this.Control[]={this.dw_8}
end on

on tabpage_8.destroy
destroy(this.dw_8)
end on

type dw_8 from uo_vzt_dwbase within tabpage_8
integer x = 14
integer y = 24
integer width = 5691
integer height = 660
integer taborder = 50
string dataobject = "d_equipment_by_category"
boolean vscrollbar = true
end type

event clicked;call super::clicked;if  ( row > 0 ) Then
	
area_number=tab_2.tabpage_8.dw_8.GetItemString(row,"equipment_master_area_number");
area_name=tab_2.tabpage_8.dw_8.GetItemString(row,"equipment_master_area_name");
	
updateequipmentdetailsdw(area_number);	
loadservicepartsdw(area_number);		
updatependingcallsdw(area_number);
UpdateClosingCallsDW(area_number);
UpdateSelectedPMDW(area_number,7);
updatelinkedpartssuppliesdw(area_number);
UpdateSelectedServiceContractsDW(area_number);

end if 


end event

event doubleclicked;call super::doubleclicked;tab_1.show();
end event

event rowfocuschanged;call super::rowfocuschanged;//MessageBox("row number ",currentrow);
if  ( currentrow > 0 ) Then
	
	wf_refresh( currentrow) 
		
end if 


end event

type tabpage_9 from userobject within tab_2
boolean visible = false
integer x = 18
integer y = 100
integer width = 5742
integer height = 708
long backcolor = 134217728
string text = "Equipment By Zone New"
long tabtextcolor = 33554432
long tabbackcolor = 134217728
long picturemaskcolor = 536870912
dw_7 dw_7
end type

on tabpage_9.create
this.dw_7=create dw_7
this.Control[]={this.dw_7}
end on

on tabpage_9.destroy
destroy(this.dw_7)
end on

type dw_7 from datawindow within tabpage_9
integer y = 44
integer width = 5641
integer height = 640
integer taborder = 30
string title = "none"
string dataobject = "d_equipment_with_contacts"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;

if  ( row > 0 ) Then
	

//MessageBox("hello",dwo.name);
	area_number=tab_2.tabpage_9.dw_7.GetItemString(tab_2.tabpage_9.dw_7.getRow(),'equipment_master_area_number');
	//area_name=tab_2.tabpage_8.dw_8.GetItemString(row,"equipment_master_area_name");
	

	updateequipmentdetailsdw(area_number);	
	
	
			
		//MessageBox("hello","calling loadservicepartsdw");
		loadservicepartsdw(area_number);		
		
		//MessageBox("hello","calling updatependingpartsdw");
		updatependingcallsdw(area_name);
		
		//MessageBox("hello","calling updateclosingcalls");
		UpdateClosingCallsDW(area_number);
		
		UpdateSelectedPMDW(area_number,7);
		
		updatelinkedpartssuppliesdw(area_number);
		
		UpdateSelectedServiceContractsDW(area_number);
end if 

end event

event rowfocuschanged;


if  ( currentrow > 0 ) Then
	


	area_number=tab_2.tabpage_9.dw_7.GetItemString(tab_2.tabpage_9.dw_7.getRow(),'equipment_master_area_number');
	

	updateequipmentdetailsdw(area_number);	
	
	
			
		//MessageBox("hello","calling loadservicepartsdw");
		loadservicepartsdw(area_number);		
		
		//MessageBox("hello","calling updatependingpartsdw");
		updatependingcallsdw(area_number);
		
		//MessageBox("hello","calling updateclosingcalls");
		UpdateClosingCallsDW(area_number);
		
		UpdateSelectedPMDW(area_number,7);
		
		updatelinkedpartssuppliesdw(area_number);
		
		UpdateSelectedServiceContractsDW(area_number);
end if 

end event

event doubleclicked;//tab_1.show();
end event

type tabpage_7 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 5742
integer height = 708
long backcolor = 67108864
string text = "Equipment by Zone"
long tabtextcolor = 21130554
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_7.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_7.destroy
destroy(this.dw_1)
end on

type dw_1 from uo_vzt_dwbase within tabpage_7
integer x = 9
integer y = 20
integer width = 5701
integer height = 668
integer taborder = 60
string dataobject = "d_equipment_by_zone_2level"
boolean vscrollbar = true
end type

event clicked;call super::clicked;if  ( row > 0 ) Then
	area_number=tab_2.tabpage_7.dw_1.GetItemString(row,"equipment_master_area_number");
	if isNull(area_number) or area_number = '' then return 
	
		updateequipmentdetailsdw(area_number);	
		loadservicepartsdw(area_number);		
		updatependingcallsdw(area_number);
		UpdateClosingCallsDW(area_number);
		UpdateSelectedPMDW(area_number,7);
		updatelinkedpartssuppliesdw(area_number);
	UpdateSelectedServiceContractsDW(area_number);
		
end if 


end event

event doubleclicked;call super::doubleclicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

tab_1.show();
end event

event rowfocuschanged;call super::rowfocuschanged;if  ( currentrow > 0 ) Then
		area_number=tab_2.tabpage_7.dw_1.GetItemString(currentrow,"equipment_master_area_number");
		if isNull(area_number) or area_number = '' then return 

		updateequipmentdetailsdw(area_number);	
		loadservicepartsdw(area_number);		
		updatependingcallsdw(area_number);
		UpdateClosingCallsDW(area_number);
		UpdateSelectedPMDW(area_number,7);
		updatelinkedpartssuppliesdw(area_number);
		UpdateSelectedServiceContractsDW(area_number);
		
end if 


end event

event itemchanged;call super::itemchanged;//if  ( row > 0 ) Then
//	
//	area_number=tab_2.tabpage_7.dw_1.GetItemString(row,"equipment_master_area_number");
//		updateequipmentdetailsdw(area_number);	
//		loadservicepartsdw(area_number);		
//		updatependingcallsdw(area_number);
//		UpdateClosingCallsDW(area_number);
//		UpdateSelectedPMDW(area_number,7);
//		updatelinkedpartssuppliesdw(area_number);
//		UpdateSelectedServiceContractsDW(area_number);
//		
//end if 
//
//
end event

type tab_1 from tab within w_equipment_custom_old
event create ( )
event destroy ( )
integer x = 5
integer y = 1144
integer width = 5769
integer height = 1512
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 8421504
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
boolean pictureonright = true
integer selectedtab = 1
tabpage_13 tabpage_13
tabpage_6 tabpage_6
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_13=create tabpage_13
this.tabpage_6=create tabpage_6
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_13,&
this.tabpage_6,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_13)
destroy(this.tabpage_6)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event selectionchanged;/*

//MessageBox("hello",1);


//MessageBox("hello",2);


//MessageBox("hello",3);
tab_1.tabpage_4.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_5.Retrieve()

//MessageBox("hello",4);
tab_1.tabpage_5.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_5.dw_6.Retrieve()


//MessageBox("hello",6);

//tab_1.tabpage_6.dw_avail.SetFilter("problem_default_status ='20'" );
//tab_1.tabpage_6.dw_avail.Filter()


tab_1.tabpage_6.dw_sel.SetTransObject(SQLCA)
tab_1.tabpage_6.dw_sel.Retrieve();

tab_1.tabpage_6.dw_sel.setFilter("vzt_equipment_task_map_period= "+pm_filter+" and vzt_equipment_task_map_equipment_id="+area_number);
tab_1.tabpage_6.dw_sel.Filter();
tab_1.tabpage_6.dw_sel.Retrieve();

*/

//tab_1.tabpage_3.dw_4.SetTransObject(SQLCA)
//tab_1.tabpage_3.dw_4.Retrieve()

tab_1.tabpage_2.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_3.Retrieve()


tab_1.tabpage_6.dw_avail.SeTTrans(SQLCA);
tab_1.tabpage_6.dw_avail.RETRIEVE();
end event

type tabpage_13 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 5733
integer height = 1396
long backcolor = 134217728
string text = "Equipment Details"
long tabtextcolor = 21130554
long tabbackcolor = 134217728
long picturemaskcolor = 553648127
cb_1 cb_1
pb_docs pb_docs
cb_dup cb_dup
cb_bt_update cb_bt_update
cb_bt_print cb_bt_print
cb_bt_save cb_bt_save
cb_bt_cancel cb_bt_cancel
cb_bt_delete cb_bt_delete
cb_bt_edit cb_bt_edit
cb_bt_insertnew cb_bt_insertnew
cb_bt_newsearch cb_bt_newsearch
cb_bt_search cb_bt_search
dw_9 dw_9
end type

on tabpage_13.create
this.cb_1=create cb_1
this.pb_docs=create pb_docs
this.cb_dup=create cb_dup
this.cb_bt_update=create cb_bt_update
this.cb_bt_print=create cb_bt_print
this.cb_bt_save=create cb_bt_save
this.cb_bt_cancel=create cb_bt_cancel
this.cb_bt_delete=create cb_bt_delete
this.cb_bt_edit=create cb_bt_edit
this.cb_bt_insertnew=create cb_bt_insertnew
this.cb_bt_newsearch=create cb_bt_newsearch
this.cb_bt_search=create cb_bt_search
this.dw_9=create dw_9
this.Control[]={this.cb_1,&
this.pb_docs,&
this.cb_dup,&
this.cb_bt_update,&
this.cb_bt_print,&
this.cb_bt_save,&
this.cb_bt_cancel,&
this.cb_bt_delete,&
this.cb_bt_edit,&
this.cb_bt_insertnew,&
this.cb_bt_newsearch,&
this.cb_bt_search,&
this.dw_9}
end on

on tabpage_13.destroy
destroy(this.cb_1)
destroy(this.pb_docs)
destroy(this.cb_dup)
destroy(this.cb_bt_update)
destroy(this.cb_bt_print)
destroy(this.cb_bt_save)
destroy(this.cb_bt_cancel)
destroy(this.cb_bt_delete)
destroy(this.cb_bt_edit)
destroy(this.cb_bt_insertnew)
destroy(this.cb_bt_newsearch)
destroy(this.cb_bt_search)
destroy(this.dw_9)
end on

type cb_1 from commandbutton within tabpage_13
integer x = 4352
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
string text = "&Reset Filter"
end type

event clicked;tab_2.tabpage_8.dw_8.Retrieve() 
tab_2.tabpage_8.dw_8.SetFilter('')
tab_2.tabpage_8.dw_8.Filter()

end event

type pb_docs from picturebutton within tabpage_13
integer x = 3433
integer y = 100
integer width = 119
integer height = 104
integer taborder = 120
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

type cb_dup from commandbutton within tabpage_13
boolean visible = false
integer x = 3854
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
string text = "Co&py "
end type

event clicked;window lw_display 
string ls_windowname
ls_windowname = 'w_equipment_copy'   

istr_parms.string1 = area_number
openWithParm( lw_display,  istr_parms, ls_windowname )		

istr_parms = Message.PowerObjectParm
if not isValid( istr_parms) then return 0
If istr_parms.rc <= 0 then return 0

// Refresh all lists 
loadtopframe()

wf_refresh( tab_2.tabpage_8.dw_8.GetRow() )
end event

type cb_bt_update from commandbutton within tabpage_13
boolean visible = false
integer x = 3360
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Update"
end type

event clicked;string ls_expr
long 	ll_frow

ls_expr = "equipment_master_area_number = '"  + area_number + "'" 

if isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'area_number')) Then
	MessageBox ("Validation Error ", "Area Number cannot be left blank");	
	tab_1.tabpage_13.dw_9.SetColumn("area_number");
	return 0;
end if


if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'category'))) Then
	MessageBox ("Validation Error ", "Category cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("category");
		return 0;
end if

if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'area_name'))) Then
	MessageBox ("Validation Error ", "Equipment Name  cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("area_name");
		return 0;
end if


if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'zone_code')) )Then
	MessageBox ("Validation Error ", "Zone Code  cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("zone_code");
		return 0;
end if

if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'zone_group_code'))) Then
	MessageBox ("Validation Error ", "Zone Group Code  cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("zone_group_code");
		return 0;
end if

tab_1.tabpage_13.dw_9.accepttext();
updateequipment(area_number);

loadtopframe();

cb_bt_save.hide();
cb_bt_cancel.hide();
cb_bt_delete.show();
cb_bt_edit.show();
cb_bt_insertnew.show();
cb_bt_update.hide();
cb_bt_edit.show();
cb_dup.visible = true

//equipment_master_area_name
ll_frow = tab_2.tabpage_8.dw_8.Find ( ls_expr, 1, tab_2.tabpage_8.dw_8.RowCount() )
If ll_frow > 0 then
	tab_2.tabpage_8.dw_8.SetRow(ll_frow )
	tab_2.tabpage_8.dw_8.ScrollToRow( ll_frow)
End if
end event

type cb_bt_print from commandbutton within tabpage_13
boolean visible = false
integer x = 919
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Print"
end type

event clicked;
OpenSheetWithParm( w_equipment_print_main, area_number , gnv_appman.iw_frame, 0, Original! );

//OpenSheet( w_vzt_mm_report_def_eq, gnv_appman.iw_frame, 0, Original! );


end event

type cb_bt_save from commandbutton within tabpage_13
integer x = 3296
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Save"
end type

event clicked;string ls_expr
long 	ll_frow

ls_expr = tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'area_number')
if isNull(ls_expr ) Then
	MessageBox ("Validation Error ", "Area Number cannot be left blank");	
	tab_1.tabpage_13.dw_9.SetColumn("area_number");
	return 0;
end if

ls_expr = "equipment_master_area_number = '"  + ls_expr + "'" 

if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'category'))) Then
	MessageBox ("Validation Error ", "Category cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("category");
		return 0;
end if


if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'area_name'))) Then
	MessageBox ("Validation Error ", "Equipment Name  cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("area_name");
		return 0;
end if

if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'zone_code')) )Then
	MessageBox ("Validation Error ", "Zone Code  cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("zone_code");
		return 0;
end if

if (isNull(tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'zone_group_code'))) Then
	MessageBox ("Validation Error ", "Zone Group Code  cannot be left blank");	
		tab_1.tabpage_13.dw_9.SetColumn("zone_group_code");
		return 0;
end if

AddEquipmentInAreaTable();
addrowinequipmenttable();

long ll_newrow

//ll_newrow =tab_1.tabpage_13.dw_9.InsertRow(0)
//tab_1.tabpage_13.dw_9.ScrollToRow(ll_newrow)

tab_2.tabpage_8.dw_8.SetRedraw( false )
tab_1.tabpage_13.dw_9.SetRedraw( false )

loadtopframe();

cb_bt_save.hide();
cb_bt_cancel.hide();
cb_bt_delete.show();
cb_bt_edit.show();
cb_bt_insertnew.show();
cb_dup.visible = true

ll_frow = tab_2.tabpage_8.dw_8.Find ( ls_expr, 1, tab_2.tabpage_8.dw_8.RowCount() )
If ll_frow > 0 then
	tab_2.tabpage_8.dw_8.SetRow(ll_frow )
	tab_2.tabpage_8.dw_8.SelectRow(0, false)
	tab_2.tabpage_8.dw_8.SelectRow(ll_frow , true)
	tab_2.tabpage_8.dw_8.ScrollToRow( ll_frow)
End if

tab_2.tabpage_8.dw_8.SetRedraw( true)
tab_1.tabpage_13.dw_9.SetRedraw( true )

end event

type cb_bt_cancel from commandbutton within tabpage_13
boolean visible = false
integer x = 2875
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Cancel"
end type

event clicked;
cb_bt_save.hide();
cb_bt_cancel.hide();
cb_bt_delete.show();
cb_bt_edit.show();
cb_bt_insertnew.show();
cb_dup.visible = true
end event

type cb_bt_delete from commandbutton within tabpage_13
boolean visible = false
integer x = 2235
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Delete"
end type

event clicked;

If Is_PasswordOK( Get_Event_Security( "PB" ) ) Then
	
MessageBox("Deletion Alert","Deleting this Equipment will delete all Pending work tickets or affect Reporting function." );
	

delete from area where area_number=:area_number;
delete from equipment_master where area_number=:area_number;
delete from vzt_equipment_task_map where equipment_id = :area_number;
delete from equipment_service_cont_map where equipment_id=:area_number;

//tab_1.tabpage_13.dw_9.deleterow(tab_1.tabpage_13.dw_9.getrow());
//tab_1.tabpage_13.dw_9.update();
commit;


loadtopframe();

end if


end event

type cb_bt_edit from commandbutton within tabpage_13
boolean visible = false
integer x = 1801
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Edit"
end type

event clicked;

detailmode=1;

//cb_5.show();
//cb_4.hide();
//cb_1.hide();
//cb_7.show();



cb_bt_insertnew.hide();

cb_bt_cancel.show();
cb_bt_delete.hide();
cb_bt_edit.hide();
cb_bt_update.show();
cb_bt_save.hide();
cb_dup.visible = false
end event

type cb_bt_insertnew from commandbutton within tabpage_13
integer x = 1362
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Insert New"
end type

event clicked;

long ll_newrow

ll_newrow =tab_1.tabpage_13.dw_9.InsertRow(0)

tab_1.tabpage_13.dw_9.ScrollToRow(ll_newrow)
//tab_1.tabpage_13.dw_9.acceptText();
//cb_4.hide();
//cb_1.hide();
//cb_5.show();
//cb_7.show();

cb_bt_insertnew.hide();
cb_bt_save.show();
cb_bt_cancel.show();
cb_bt_delete.hide();
cb_bt_edit.hide();
cb_dup.visible = false

tab_1.tabpage_13.dw_9.SetColumn('category')
tab_1.tabpage_13.dw_9.SetFocus()


end event

type cb_bt_newsearch from commandbutton within tabpage_13
boolean visible = false
integer x = 471
integer y = 1168
integer width = 411
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&New Search"
end type

event clicked;long ll_newrow

ll_newrow =tab_1.tabpage_13.dw_9.InsertRow(0)

tab_1.tabpage_13.dw_9.ScrollToRow(ll_newrow)
tab_1.tabpage_13.dw_9.acceptText();


cb_bt_search.show();
end event

type cb_bt_search from commandbutton within tabpage_13
integer x = 27
integer y = 1168
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Search"
end type

event clicked;long ll_find = 1, ll_end

tab_1.tabpage_13.dw_9.accepttext();

string srch_manufacturer;
string srch_model;
string srch_vendor;
string srch_category;
string filterString;
string srch_equipment_name;

 

srch_manufacturer=tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'Manufacturer')	;
srch_model			=tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'Model')				;
srch_category		=tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'Category')			;
srch_equipment_name=tab_1.tabpage_13.dw_9.GetItemString(tab_1.tabpage_13.dw_9.GetRow(),'area_name')			;
srch_vendor = string(tab_1.tabpage_13.dw_9.GetItemNumber(tab_1.tabpage_13.dw_9.GetRow(),'Vendor'))			;


if( isNull(srch_manufacturer)) Then
	srch_manufacturer="=upper(equipment_master_manufacturer) or IsNull(equipment_master_manufacturer) ";
else
	srch_manufacturer=" like upper('%"+srch_manufacturer+"%')";
end if 

if( isNull(srch_model )) Then
	srch_model="=upper(equipment_master_model) or IsNull( equipment_master_model) ";
else
		srch_model=" like upper('%"+srch_model+"%')";
end if 

if( isNull( srch_vendor )) Then
	srch_vendor="=equipment_master_vendor or IsNull( equipment_master_vendor)  ";
else
	srch_vendor=" ="+srch_vendor+" ";
end if 

if( isNull(  srch_category)) Then
	srch_category="=upper(equipment_master_category)  or IsNull( equipment_master_category) ";
else
	srch_category=" like upper('%"+srch_category+"%')";
end if 

if( isNull(  srch_equipment_name)) Then
	srch_equipment_name="=upper(equipment_master_area_name) or IsNull( equipment_master_area_name) ";
else
	srch_equipment_name=" like upper('%"+srch_equipment_name+"%')";
end if 



//filterString="equipment_master_manufacturer="+srch_manufacturer;
filterString=" ( upper(equipment_master_manufacturer) "+srch_manufacturer+") "  &
+ "  and ( upper(equipment_master_model) "+srch_model +")" &
+ "  and ( equipment_master_vendor "+srch_vendor +")" &
+ "  and ( upper(equipment_master_category)"+srch_category +")" &
+ "  and ( upper(equipment_master_area_name)"+srch_equipment_name+")";


ll_end = tab_2.tabpage_8.dw_8.RowCount()
tab_2.tabpage_8.dw_8.SetFilter(filterString);
tab_2.tabpage_8.dw_8.Filter();
tab_2.tabpage_8.dw_8.Retrieve();


filterString=" ( upper(equipment_master_manufacturer) "+srch_manufacturer+") "  &
+ "  and ( upper(equipment_master_model) "+srch_model +")" &
+ "  and ( upper(equipment_master_area_name)"+srch_equipment_name+")";

tab_2.tabpage_7.dw_1.setfilter(filterstring);
tab_2.tabpage_7.dw_1.filter();
tab_2.tabpage_7.dw_1.retrieve(); 

cb_bt_newsearch.show();

cb_bt_print.show();
cb_bt_edit.show();
cb_bt_delete.show();
cb_bt_delete.show();
cb_dup.visible = true
end event

type dw_9 from datawindow within tabpage_13
integer x = 32
integer y = 44
integer width = 3621
integer height = 1096
integer taborder = 50
string title = "none"
string dataobject = "d_equipment_master_entry_april_17_2"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//MessageBox("data",data);

string CurrentColumn, ColumnContent

CurrentColumn = this.GetColumnName()

if CurrentColumn = 'area_name' then
		this.SetItem(row,'area_number',wf_get_next_equip_number())	
	
end if
end event

type tabpage_6 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 5733
integer height = 1396
long backcolor = 67108864
string text = "PM Presets"
long tabtextcolor = 21130554
long picturemaskcolor = 553648127
cb_2 cb_2
rb_3 rb_3
dw_sel dw_sel
dw_avail dw_avail
cb_11 cb_11
cb_10 cb_10
sle_1 sle_1
rb_2 rb_2
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_1 rb_1
gb_1 gb_1
end type

on tabpage_6.create
this.cb_2=create cb_2
this.rb_3=create rb_3
this.dw_sel=create dw_sel
this.dw_avail=create dw_avail
this.cb_11=create cb_11
this.cb_10=create cb_10
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_10=create rb_10
this.rb_9=create rb_9
this.rb_8=create rb_8
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.rb_3,&
this.dw_sel,&
this.dw_avail,&
this.cb_11,&
this.cb_10,&
this.sle_1,&
this.rb_2,&
this.rb_10,&
this.rb_9,&
this.rb_8,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_1,&
this.gb_1}
end on

on tabpage_6.destroy
destroy(this.cb_2)
destroy(this.rb_3)
destroy(this.dw_sel)
destroy(this.dw_avail)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_10)
destroy(this.rb_9)
destroy(this.rb_8)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_1)
destroy(this.gb_1)
end on

type cb_2 from commandbutton within tabpage_6
integer x = 1806
integer y = 60
integer width = 343
integer height = 100
integer taborder = 130
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

type rb_3 from radiobutton within tabpage_6
integer x = 471
integer y = 208
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

event clicked;UpdateSelectedPMDW(area_number,60);
end event

type dw_sel from datawindow within tabpage_6
integer x = 59
integer y = 424
integer width = 2126
integer height = 856
integer taborder = 70
string title = "none"
string dataobject = "d_equipment_task_list_new"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

this.selectrow(row,true);
end event

type dw_avail from datawindow within tabpage_6
integer x = 2487
integer y = 424
integer width = 2254
integer height = 856
integer taborder = 60
string title = "none"
string dataobject = "d_equipment_problem_subproblem"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

this.selectrow(row,true);
end event

type cb_11 from commandbutton within tabpage_6
integer x = 2235
integer y = 796
integer width = 201
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = ">"
end type

event clicked;
long ll_find = 1, ll_end, ll_currentrowpointer

svc_cont_bank_row_selected=0;

ll_end = tab_1.tabpage_2.dw_2.RowCount()


do   
	
svc_cont_bank_row_selected=tab_1.tabpage_6.dw_sel.getSelectedRow(svc_cont_bank_row_selected);

//MessageBox("Hello",svc_cont_bank_row_selected);

if (svc_cont_bank_row_selected > 0) then
	
	tab_1.tabpage_6.dw_sel.deleteRow(svc_cont_bank_row_selected);
	tab_1.tabpage_6.dw_sel.update();
	tab_1.tabpage_6.dw_sel.SelectRow(svc_cont_bank_row_selected,false);
	
end if 

LOOP while (svc_cont_bank_row_selected > 0)
end event

type cb_10 from commandbutton within tabpage_6
integer x = 2235
integer y = 668
integer width = 201
integer height = 88
integer taborder = 70
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




long ll_find = 1, ll_end, ll_currentrowpointer

svc_cont_bank_row_selected=0;

ll_end = tab_1.tabpage_6.dw_avail.RowCount()


do   
	
svc_cont_bank_row_selected=tab_1.tabpage_6.dw_avail.getSelectedRow(svc_cont_bank_row_selected);

if (svc_cont_bank_row_selected > 0) then
	
	AddRowPMSelectedTaskDW(svc_cont_bank_row_selected);	
	tab_1.tabpage_6.dw_avail.SelectRow(svc_cont_bank_row_selected,false);
	
end if 

LOOP while (svc_cont_bank_row_selected > 0)

UpdateSelectedPMDW(area_number,period_selected);
end event

type sle_1 from singlelineedit within tabpage_6
integer x = 1289
integer y = 288
integer width = 137
integer height = 88
integer taborder = 40
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

event modified;if isnumber(tab_1.tabpage_6.sle_1.text) then
	
UpdateSelectedPMDW(area_number,integer(tab_1.tabpage_6.sle_1.text));
else
	
MessageBox("Error ","Please enter a valid numeric value for Period ");

tab_1.tabpage_6.sle_1.text="";
end if 
end event

type rb_2 from radiobutton within tabpage_6
integer x = 882
integer y = 308
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

event clicked;if isnumber(tab_1.tabpage_6.sle_1.text) then
	
tab_1.tabpage_6.dw_sel.SetTransObject(SQLCA)
tab_1.tabpage_6.dw_sel.setFilter("vzt_equipment_task_map_period="+tab_1.tabpage_6.sle_1.text);
tab_1.tabpage_6.dw_sel.Filter();
period_selected=Integer(tab_1.tabpage_6.sle_1.text);

else
	MessageBox("Error ","Please enter a valid numeric value for Period ");	
	tab_1.tabpage_6.sle_1.text="";

end if 
end event

type rb_10 from radiobutton within tabpage_6
integer x = 882
integer y = 212
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

event clicked;UpdateSelectedPMDW(area_number,360);
end event

type rb_9 from radiobutton within tabpage_6
integer x = 882
integer y = 108
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

event clicked;UpdateSelectedPMDW(area_number,180);
end event

type rb_8 from radiobutton within tabpage_6
integer x = 471
integer y = 308
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

event clicked;UpdateSelectedPMDW(area_number,90);
end event

type rb_6 from radiobutton within tabpage_6
integer x = 471
integer y = 112
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

event clicked;UpdateSelectedPMDW(area_number,30);
end event

type rb_5 from radiobutton within tabpage_6
integer x = 78
integer y = 308
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

event clicked;UpdateSelectedPMDW(area_number,21);
end event

type rb_4 from radiobutton within tabpage_6
integer x = 78
integer y = 212
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

event clicked;UpdateSelectedPMDW(area_number,14);
end event

type rb_1 from radiobutton within tabpage_6
integer x = 73
integer y = 116
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

event clicked;UpdateSelectedPMDW(area_number,7);


end event

type gb_1 from groupbox within tabpage_6
integer x = 55
integer y = 24
integer width = 1696
integer height = 376
integer taborder = 50
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

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 5733
integer height = 1396
long backcolor = 67108864
string text = "Service Contracts and Docs"
long tabtextcolor = 21130554
long picturemaskcolor = 536870912
cb_3 cb_3
cb_9 cb_9
cb_8 cb_8
dw_2 dw_2
dw_3 dw_3
end type

on tabpage_2.create
this.cb_3=create cb_3
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_2=create dw_2
this.dw_3=create dw_3
this.Control[]={this.cb_3,&
this.cb_9,&
this.cb_8,&
this.dw_2,&
this.dw_3}
end on

on tabpage_2.destroy
destroy(this.cb_3)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_2)
destroy(this.dw_3)
end on

event dragdrop;//MessageBox("area_number",area_number);
end event

type cb_3 from commandbutton within tabpage_2
integer x = 91
integer y = 1200
integer width = 343
integer height = 100
integer taborder = 140
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

type cb_9 from commandbutton within tabpage_2
integer x = 2542
integer y = 672
integer width = 215
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = ">"
end type

event clicked;long ll_find = 1, ll_end, ll_currentrowpointer

svc_cont_bank_row_selected=0;

ll_end = tab_1.tabpage_2.dw_2.RowCount()

//ll_find = tab_1.tabpage_1.dw_2.Find("area_number ='"+area_number+"'", ll_find, ll_end)
//tab_1.tabpage_1.dw_2.ScrollToRow(ll_find)


do   
	
svc_cont_bank_row_selected=tab_1.tabpage_2.dw_2.getSelectedRow(svc_cont_bank_row_selected);

//MessageBox("Hello",svc_cont_bank_row_selected);

if (svc_cont_bank_row_selected > 0) then
	
	tab_1.tabpage_2.dw_2.deleteRow(svc_cont_bank_row_selected);
	tab_1.tabpage_2.dw_2.update();
	tab_1.tabpage_2.dw_2.SelectRow(svc_cont_bank_row_selected,false);
	
end if 

LOOP while (svc_cont_bank_row_selected > 0)
end event

type cb_8 from commandbutton within tabpage_2
integer x = 2551
integer y = 528
integer width = 197
integer height = 72
integer taborder = 50
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




long ll_find = 1, ll_end, ll_currentrowpointer

svc_cont_bank_row_selected=0;

ll_end = tab_1.tabpage_2.dw_3.RowCount()

//ll_find = tab_1.tabpage_1.dw_2.Find("area_number ='"+area_number+"'", ll_find, ll_end)
//tab_1.tabpage_1.dw_2.ScrollToRow(ll_find)


do   
	
svc_cont_bank_row_selected=tab_1.tabpage_2.dw_3.getSelectedRow(svc_cont_bank_row_selected);

//MessageBox("Hello",svc_cont_bank_row_selected);

if (svc_cont_bank_row_selected > 0) then
	
	AddRowServiceContractsSelectedDW(svc_cont_bank_row_selected);	
	tab_1.tabpage_2.dw_3.SelectRow(svc_cont_bank_row_selected,false);
	
end if 

LOOP while (svc_cont_bank_row_selected > 0)
end event

type dw_2 from datawindow within tabpage_2
integer x = 82
integer y = 148
integer width = 2427
integer height = 1028
integer taborder = 50
string title = "none"
string dataobject = "d_equipment_svc_contact_sel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

String vendor_sel;
vendor_sel=tab_1.tabpage_2.dw_2.getItemString(row,"vzt_service_cont_descr");
OpenSheetWithParm( w_equipment_svc_edit, vendor_sel , gnv_appman.iw_frame, 0, Original! );

end event

event clicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

tab_1.tabpage_2.dw_2.selectRow(row,true);
end event

type dw_3 from datawindow within tabpage_2
integer x = 2784
integer y = 152
integer width = 2281
integer height = 1024
integer taborder = 30
string dragicon = "Drag1pg.ico"
string title = "none"
string dataobject = "d_equipment_all_service_contracts_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dragleave;svc_cont_bank_row_selected=this.getSelectedRow(0);

//MessageBox("Hello",svc_cont_bank_row_selected);
end event

event clicked;if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

tab_1.tabpage_2.dw_3.SelectRow(row,true);
end event

event dragdrop;//MessageBox("hello","dragdrop started");
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 5733
integer height = 1396
long backcolor = 67108864
string text = "Linked Parts and Supplies"
long tabtextcolor = 21130554
long picturemaskcolor = 536870912
cb_4 cb_4
dw_4 dw_4
end type

on tabpage_3.create
this.cb_4=create cb_4
this.dw_4=create dw_4
this.Control[]={this.cb_4,&
this.dw_4}
end on

on tabpage_3.destroy
destroy(this.cb_4)
destroy(this.dw_4)
end on

type cb_4 from commandbutton within tabpage_3
integer x = 23
integer y = 1228
integer width = 343
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_4.Print()
end event

type dw_4 from datawindow within tabpage_3
integer x = 27
integer y = 36
integer width = 5678
integer height = 1180
integer taborder = 30
string title = "none"
string dataobject = "d_equipment_parts"
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//MessageBox("vendor selected" , tab_1.tabpage_2.dw_2.getItemString(tab_1.tabpage_2.dw_2.getRow(),"vzt_service_cont_descr"));


if row <= 0 then return // vz !!!!!!!!!!!!!!!!!!!!!

long part_sel;
part_sel=tab_1.tabpage_3.dw_4.getItemNumber(row,"vzt_part_id");

OpenSheetWithParm( w_equipment_part_edit, part_sel, gnv_appman.iw_frame, 0, Original! );
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 5733
integer height = 1396
long backcolor = 67108864
string text = "Pending Tasks"
long tabtextcolor = 21130554
long picturemaskcolor = 536870912
cb_5 cb_5
dw_5 dw_5
end type

on tabpage_4.create
this.cb_5=create cb_5
this.dw_5=create dw_5
this.Control[]={this.cb_5,&
this.dw_5}
end on

on tabpage_4.destroy
destroy(this.cb_5)
destroy(this.dw_5)
end on

type cb_5 from commandbutton within tabpage_4
integer x = 18
integer y = 1248
integer width = 343
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_5.Print()
end event

type dw_5 from datawindow within tabpage_4
integer x = 18
integer y = 28
integer width = 5696
integer height = 1216
integer taborder = 30
string title = "none"
string dataobject = "d_pending_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row <= 0 then return 

If Is_PasswordOK( Get_Event_Security( "CM" ) ) Then
	string callNumber, action, statCode, clickedColNum
	
	callNumber 		= dw_5.GetItemString(dw_5.GetRow(),"call_number")
	statCode 		= dw_5.GetItemString(dw_5.GetRow(),"stat_code")
	clickedColNum 	= dw_5.GetColumnName()
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

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 5733
integer height = 1396
long backcolor = 67108864
string text = "Closed Tasks"
long tabtextcolor = 21130554
long picturemaskcolor = 536870912
cb_6 cb_6
dw_6 dw_6
end type

on tabpage_5.create
this.cb_6=create cb_6
this.dw_6=create dw_6
this.Control[]={this.cb_6,&
this.dw_6}
end on

on tabpage_5.destroy
destroy(this.cb_6)
destroy(this.dw_6)
end on

type cb_6 from commandbutton within tabpage_5
integer x = 23
integer y = 1280
integer width = 343
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Print"
end type

event clicked;dw_6.Print()
end event

type dw_6 from datawindow within tabpage_5
integer x = 23
integer y = 28
integer width = 5691
integer height = 1244
integer taborder = 40
string title = "none"
string dataobject = "d_closed_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

