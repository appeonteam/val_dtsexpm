$PBExportHeader$w_vzt_template_edit_web.srw
forward
global type w_vzt_template_edit_web from w_vzt_base
end type
type r_1 from rectangle within w_vzt_template_edit_web
end type
end forward

global type w_vzt_template_edit_web from w_vzt_base
int Width=3182
int Height=1564
boolean TitleBar=true
string Title="Maintain Survey Letter Templates"
long BackColor=80269528
boolean Resizable=false
r_1 r_1
end type
global w_vzt_template_edit_web w_vzt_template_edit_web

on w_vzt_template_edit_web.create
int iCurrent
call super::create
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
end on

on w_vzt_template_edit_web.destroy
call super::destroy
destroy(this.r_1)
end on

event open;call super::open;cb_newsearch.event clicked()
cb_search.event clicked()

cb_select.visible 	= true
cb_select.enabled 	= true
cb_save.enabled 		= true
cb_new.visible 		= true
end event

event ue_assign_menu;//
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_template_edit_web
int Width=3136
int Height=360
string DataObject="d_vzt_ole_list_edu"
end type

event dw_mainlist::constructor;call super::constructor;this.of_setfieldsort( true) 
this.inv_field_sort.of_setcolumn( 'last_name_t', 'last_name A, first_name A', 'last_name D, first_name D')
this.inv_field_sort.of_setcolumn( 'first_name_t', 'guest_first_name A, guest_last_name A', 'guest_first_name D, guest_last_name D')
this.inv_field_sort.of_setcolumn( 'city_t', 'city A, last_name A, first_name A', 'city D, last_name A, first_name A')
this.inv_field_sort.of_setcolumn( 'state_t', 'state A, last_name A, first_name A', 'state D, last_name A, first_name A')
this.inv_field_sort.of_setcolumn( 'zip_t', 'zip A, last_name A, first_name A', 'zip D, last_name A, first_name A')
this.inv_field_sort.of_setcolumn( 'id_t', 'ID A','id D')



end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_template_edit_web
int X=645
int Y=1368
end type

type cb_close from w_vzt_base`cb_close within w_vzt_template_edit_web
int X=2935
int Y=1368
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_template_edit_web
int X=1175
int Y=1368
end type

type cb_save from w_vzt_base`cb_save within w_vzt_template_edit_web
int X=1609
int Y=1368
boolean Enabled=false
end type

type cb_select from w_vzt_base`cb_select within w_vzt_template_edit_web
int X=1385
int Y=1368
boolean Enabled=false
end type

event cb_select::clicked;call super::clicked;dw_data.post SetFocus()
end event

type cb_new from w_vzt_base`cb_new within w_vzt_template_edit_web
int X=1001
int Y=1368
end type

event cb_new::clicked;call super::clicked;cb_delete1.visible 	= FALSE
end event

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_template_edit_web
int X=64
int Y=1368
end type

event cb_newsearch::clicked;call super::clicked;cb_delete1.visible 	= FALSE
end event

type cb_search from w_vzt_base`cb_search within w_vzt_template_edit_web
int X=411
int Y=1368
end type

event cb_search::clicked;call super::clicked;cb_new.visible 		= true
cb_delete1.visible 	= true
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_template_edit_web
int X=1883
int Y=1368
int Width=233
boolean BringToTop=true
long BackColor=8421504
end type

type st_stop from w_vzt_base`st_stop within w_vzt_template_edit_web
int X=1911
int Y=1368
boolean BringToTop=true
end type

type dw_data from w_vzt_base`dw_data within w_vzt_template_edit_web
int Y=388
int Width=3141
int Height=940
string DataObject="d_vzt_ole_edit_web"
end type

event dw_data::constructor;call super::constructor;_ResetDataObjectOnSelect 	= true
is_editable[]	= { & 
'id','description', 'subject', 'longdesc'}

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_searchable[]	= is_editable[]	


end event

event dw_data::dberror;error.of_dberror( sqldbcode, sqlerrtext, sqlsyntax, buffer, row, this.dataobject)
end event

type dw_print from w_vzt_base`dw_print within w_vzt_template_edit_web
int X=1403
int Y=1368
boolean BringToTop=true
end type

type r_1 from rectangle within w_vzt_template_edit_web
int X=14
int Y=1348
int Width=3141
int Height=112
boolean Enabled=false
int LineThickness=12
long FillColor=8421504
end type

