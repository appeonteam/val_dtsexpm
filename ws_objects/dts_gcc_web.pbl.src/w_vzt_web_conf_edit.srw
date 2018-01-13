$PBExportHeader$w_vzt_web_conf_edit.srw
forward
global type w_vzt_web_conf_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_web_conf_edit
end type
type dw_contact_address from uo_vzt_dwbase within w_vzt_web_conf_edit
end type
end forward

global type w_vzt_web_conf_edit from w_vzt_base
int Width=2478
int Height=1712
boolean TitleBar=true
string Title="Contact Maintenance"
event ue_poweredit ( )
r_1 r_1
dw_contact_address dw_contact_address
end type
global w_vzt_web_conf_edit w_vzt_web_conf_edit

type variables
long 	il_contactid
end variables

event ue_poweredit;cb_select.visible = false
end event

on w_vzt_web_conf_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.dw_contact_address=create dw_contact_address
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.dw_contact_address
end on

on w_vzt_web_conf_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.dw_contact_address)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

cb_newsearch.event clicked()
cb_new.visible = true 
//dw_data.SetColumn('guest_last_name')
dw_data.POST SetFocus()


end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)
end event

event ue_cb_new;call super::ue_cb_new;//cb_del.visible	= false
//cb_ins.visible = false
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_web_conf_edit
int X=9
int Width=2405
int Height=412
string DataObject="d_web_conf_list"
end type

event dw_mainlist::ue_rowselected;if row > 0 and row <= this.RowCount() AND ab_selected = true then
	il_contactid = f_nvl(dw_data.GetItemNumber(row,'id') , 0)

	cb_new.visible 		= true 

	if il_contactid <= 0 then 
		return 1
	ELSE
		cb_delete1.visible 	= true 
		cb_save.visible 		= true 
		cb_save.enabled 		= true 
		cb_select.visible 	= false
//		dw_answers.Retrieve( il_contactid )
	END IF 

	
END IF	

return 1


end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_web_conf_edit
int X=901
int Y=1472
int Width=302
int TabOrder=20
int TextSize=-8
end type

type cb_close from w_vzt_base`cb_close within w_vzt_web_conf_edit
int X=2203
int Y=1472
int TabOrder=50
int TextSize=-8
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_web_conf_edit
int X=1362
int Y=1472
int Width=178
int TabOrder=110
int TextSize=-8
end type

type cb_save from w_vzt_base`cb_save within w_vzt_web_conf_edit
int X=722
int Y=1472
int Width=165
int TabOrder=90
int TextSize=-8
end type

type cb_select from w_vzt_base`cb_select within w_vzt_web_conf_edit
int X=549
int Y=1472
int Width=165
int TabOrder=80
boolean Visible=false
int TextSize=-8
end type

type cb_new from w_vzt_base`cb_new within w_vzt_web_conf_edit
int X=1211
int Y=1472
int Width=137
int TabOrder=100
int TextSize=-8
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_web_conf_edit
int X=32
int Y=1472
int Width=302
int TabOrder=70
int TextSize=-8
end type

event cb_newsearch::clicked;call super::clicked;//dw_answers.visible 	= false
//cb_ins.visible			= false
//cb_del.visible			= false
end event

type cb_search from w_vzt_base`cb_search within w_vzt_web_conf_edit
int X=343
int Y=1472
int Width=192
int TabOrder=60
int TextSize=-8
end type

event cb_search::clicked;call super::clicked;cb_select.visible = false
parent.post event ue_poweredit ()
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_web_conf_edit
int X=1545
int Y=1472
int Width=247
boolean BringToTop=true
long BackColor=8421504
int TextSize=-8
end type

type st_stop from w_vzt_base`st_stop within w_vzt_web_conf_edit
int X=1563
int Y=1472
boolean BringToTop=true
int TextSize=-8
int Weight=400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_web_conf_edit
int X=9
int Y=436
int Width=2405
int Height=1004
int TabOrder=40
string DataObject="d_web_conf_edit"
boolean VScrollBar=false
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true  

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'descr', 'start_dte','end_dte', 'long_descr'} // 'id',

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
	SELECT max(id) + 1 into :ll_id from vzt_web_conference ;
	this.setitem( row, 'id', ll_id )
END IF
return 1
end event

event dw_data::getfocus;cb_select.visible = false
end event

type dw_print from w_vzt_base`dw_print within w_vzt_web_conf_edit
int X=2674
int Y=1128
int TabOrder=120
boolean BringToTop=true
end type

type r_1 from rectangle within w_vzt_web_conf_edit
int X=14
int Y=1452
int Width=2405
int Height=112
boolean Enabled=false
int LineThickness=12
long FillColor=8421504
end type

type dw_contact_address from uo_vzt_dwbase within w_vzt_web_conf_edit
int X=2441
int Y=104
int Width=645
int Height=572
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
string DataObject="d_contact_address_edit"
BorderStyle BorderStyle=StyleBox!
boolean VScrollBar=true
end type

event constructor;call super::constructor;//wf_setupdateable( dw_contact_address, "Contact Addresses", false, false)
end event

