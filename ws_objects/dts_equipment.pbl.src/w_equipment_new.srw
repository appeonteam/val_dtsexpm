$PBExportHeader$w_equipment_new.srw
forward
global type w_equipment_new from w_vzt_base
end type
type tab_1 from tab within w_equipment_new
end type
type tabpage_1 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_1
end type
type sle_supplier from singlelineedit within tabpage_1
end type
type sle_manufacturer from singlelineedit within tabpage_1
end type
type sle_category from singlelineedit within tabpage_1
end type
type sle_equipment_name from singlelineedit within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_2 dw_2
sle_supplier sle_supplier
sle_manufacturer sle_manufacturer
sle_category sle_category
sle_equipment_name sle_equipment_name
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_3 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_5 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_4 dw_4
end type
type tabpage_6 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_6 dw_6
end type
type tab_1 from tab within w_equipment_new
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type
type cb_1 from commandbutton within w_equipment_new
end type
end forward

global type w_equipment_new from w_vzt_base
integer width = 3310
integer height = 2824
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = maximized!
tab_1 tab_1
cb_1 cb_1
end type
global w_equipment_new w_equipment_new

type variables
datawindow dw_2;
datawindow dw_3;

SingleLineEdit sle_equipment_name;
SingleLineEdit sle_manufacturer;
end variables

on w_equipment_new.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_equipment_new.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_1)
end on

event open;call super::open;dw_mainlist.Retrieve()
dw_data.Retrieve()
tab_1.tabpage_3.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_3.Retrieve()
tab_1.tabpage_6.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_6.dw_6.Retrieve()

tab_1.tabpage_5.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_5.dw_4.Retrieve()

end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_equipment_new
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_equipment_new
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_equipment_new
integer x = 55
integer y = 28
integer width = 3109
integer height = 616
boolean titlebar = true
string dataobject = "d_equipment_new2"
boolean controlmenu = true
boolean _setnullonnewsearch = true
boolean _resetmaskonsearch = true
boolean _resetdataobjectonselect = true
boolean _newsearchinprogress = true
boolean _set_bg_opaque_on_search = true
end type

event dw_mainlist::itemchanged;call super::itemchanged;MessageBox('hello',dw_mainlist.GetItemString(row,'area_room_type'))
MessageBox('hello',dw_mainlist.GetItemString(row,'area_area_number'))
dw_data.setRow(row)


end event

type cb_last_search from w_vzt_base`cb_last_search within w_equipment_new
end type

type cb_close from w_vzt_base`cb_close within w_equipment_new
integer x = 2363
integer y = 2276
integer height = 92
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_equipment_new
end type

type cb_save from w_vzt_base`cb_save within w_equipment_new
integer x = 896
integer y = 2276
integer height = 92
end type

type cb_select from w_vzt_base`cb_select within w_equipment_new
integer x = 677
integer y = 2276
integer height = 92
end type

type cb_new from w_vzt_base`cb_new within w_equipment_new
integer x = 1472
integer y = 2276
integer height = 96
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_equipment_new
integer x = 101
integer y = 2276
integer height = 96
end type

type cb_search from w_vzt_base`cb_search within w_equipment_new
integer x = 448
integer y = 2276
integer height = 96
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_equipment_new
integer x = 2098
integer y = 2280
integer height = 96
end type

type st_stop from w_vzt_base`st_stop within w_equipment_new
end type

type dw_data from w_vzt_base`dw_data within w_equipment_new
integer x = 64
integer y = 696
integer width = 3054
integer height = 572
string dataobject = "d_equipment_enter2"
end type

event dw_data::clicked;call super::clicked;//MessageBox("Hello",row)

tab_1.tabpage_1.dw_2.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_3.SetTransObject(SQLCA)
//tab_1.tabpage_1.dw_2.Retrieve()
//tab_1.tabpage_3.dw_3.Retrieve()

//MessageBox('hello',dw_data.GetItemString(dw_data.GetRow(),'area_room_type'))

end event

type dw_print from w_vzt_base`dw_print within w_equipment_new
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_equipment_new
end type

type tab_1 from tab within w_equipment_new
integer x = 41
integer y = 1320
integer width = 3136
integer height = 1132
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
boolean multiline = true
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 5
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1004
long backcolor = 79349703
string text = "Equipment"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_2 dw_2
sle_supplier sle_supplier
sle_manufacturer sle_manufacturer
sle_category sle_category
sle_equipment_name sle_equipment_name
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type

on tabpage_1.create
this.dw_2=create dw_2
this.sle_supplier=create sle_supplier
this.sle_manufacturer=create sle_manufacturer
this.sle_category=create sle_category
this.sle_equipment_name=create sle_equipment_name
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.dw_2,&
this.sle_supplier,&
this.sle_manufacturer,&
this.sle_category,&
this.sle_equipment_name,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on tabpage_1.destroy
destroy(this.dw_2)
destroy(this.sle_supplier)
destroy(this.sle_manufacturer)
destroy(this.sle_category)
destroy(this.sle_equipment_name)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

type dw_2 from datawindow within tabpage_1
boolean visible = false
integer x = 1481
integer y = 280
integer width = 1394
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "d_equipment_category_lookup"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type sle_supplier from singlelineedit within tabpage_1
integer x = 722
integer y = 544
integer width = 937
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = styleshadowbox!
end type

type sle_manufacturer from singlelineedit within tabpage_1
integer x = 722
integer y = 420
integer width = 937
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = styleshadowbox!
end type

type sle_category from singlelineedit within tabpage_1
integer x = 718
integer y = 268
integer width = 704
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = styleshadowbox!
end type

type sle_equipment_name from singlelineedit within tabpage_1
integer x = 718
integer y = 116
integer width = 937
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = styleshadowbox!
end type

type st_4 from statictext within tabpage_1
integer x = 87
integer y = 544
integer width = 453
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
string text = "Supplier / Dealer"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_1
integer x = 96
integer y = 420
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
string text = "Manufacturer"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_1
integer x = 91
integer y = 304
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
string text = "Category"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 87
integer y = 148
integer width = 471
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79349703
string text = "Equipment Name"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1004
long backcolor = 79349703
string text = "Default PMs"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_2.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_2.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_2
integer x = 59
integer y = 60
integer width = 2592
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "d_pending_calls"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1004
long backcolor = 79349703
string text = "Service Contracts and Docs"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_3
integer x = 55
integer y = 48
integer width = 2555
integer height = 596
integer taborder = 30
string title = "none"
string dataobject = "d_svc_cont_doc_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1004
long backcolor = 79349703
string text = "Linked Parts Supplies"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_5 dw_5
end type

event dragdrop; 
	   OpenSheetWithParm( w_vzt_svc_cont_edit, "0", gnv_appman.iw_frame, 0, Original! )

end event

on tabpage_4.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_4.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_4
integer x = 46
integer y = 60
integer width = 2501
integer height = 496
integer taborder = 40
string title = "none"
string dataobject = "d_parts_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1004
long backcolor = 79349703
string text = "Pending Tasks"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_5.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_5.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_5
integer x = 55
integer width = 2999
integer height = 552
integer taborder = 40
string title = "none"
string dataobject = "d_timer_calls"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1004
long backcolor = 79349703
string text = "Closed Tasks"
long tabtextcolor = 33554432
long tabbackcolor = 79349703
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_6.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_6.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_6
integer x = 64
integer y = 56
integer width = 2939
integer height = 640
integer taborder = 40
string title = "none"
string dataobject = "d_closed_calls"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_equipment_new
integer x = 2798
integer y = 2520
integer width = 334
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;
MessageBox('Hello','Before insert')
MessageBox('Hello',tab_1.tabpage_1.text)
MessageBox('Hello',tab_1.tabpage_1.sle_equipment_name.text)
insert into area
	(area_number,area_name,equpmt_mfr)
	values(21000,:tab_1.tabpage_1.sle_equipment_name.text, :tab_1.tabpage_1.sle_manufacturer.text);
			  
			  
			  if sqlca.sqlcode <>0 Then
				MessageBox('DB Error',sqlca.sqlcode)
			else 
				MessageBox('Success','Record Inserted')
			end if
			
			
end event

