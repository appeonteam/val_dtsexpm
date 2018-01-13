$PBExportHeader$w_vzt_base_ole.srw
forward
global type w_vzt_base_ole from w_vzt_base
end type
type ole_1 from uo_vzt_olebase within w_vzt_base_ole
end type
type cb_oleedit from commandbutton within w_vzt_base_ole
end type
type cb_getfile from commandbutton within w_vzt_base_ole
end type
end forward

global type w_vzt_base_ole from w_vzt_base
integer width = 3461
integer height = 1932
string title = "Base Ole Objects Display Edit"
string menuname = "m_ole_example"
event ue_get_data ( )
event ue_paste ( )
event ue_pastespecial ( )
event ue_pastelink ( )
event ue_loadfile ( )
event ue_loadobj ( )
event ue_savetodb ( )
ole_1 ole_1
cb_oleedit cb_oleedit
cb_getfile cb_getfile
end type
global w_vzt_base_ole w_vzt_base_ole

type variables
double	id_oleid
string	is_subject, is_orig_text

end variables

event ue_get_data();SetPointer(HourGlass!)


cb_newsearch.event clicked()
cb_search.event clicked()

ole_1.ib_prompt_save = false // templates can't be modified here

end event

event ue_paste;ole_1.event ue_paste()
end event

event ue_pastespecial;ole_1.event ue_pastespecial()
end event

event ue_pastelink;ole_1.event ue_pastelink()
end event

event ue_loadfile;ole_1.event ue_loadfile()
end event

event ue_loadobj;ole_1.event ue_loadobj()
end event

event ue_savetodb;if id_oleid > 0 then ole_1.uf_save(id_oleid)
end event

on w_vzt_base_ole.create
int iCurrent
call super::create
if this.MenuName = "m_ole_example" then this.MenuID = create m_ole_example
this.ole_1=create ole_1
this.cb_oleedit=create cb_oleedit
this.cb_getfile=create cb_getfile
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_1
this.Control[iCurrent+2]=this.cb_oleedit
this.Control[iCurrent+3]=this.cb_getfile
end on

on w_vzt_base_ole.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.ole_1)
destroy(this.cb_oleedit)
destroy(this.cb_getfile)
end on

event open;call super::open;
this.event post ue_get_data() 
cb_new.visible = true 
ib_resizeenabled = true
end event

event closequery;call super::closequery;int li_rc, li_rc2


//dont allow the user to quit unless changes were saved or abandon the control changes
If ole_1.uf_save_check() < 0 Then 
	message.returnvalue = 1
end if

end event

event menu_copy;int li_rc
//copy contents of the ole control to the clipboard
li_rc = ole_1.copy( )
If li_rc <> 0 Then Messagebox("Copy Error", "Error "+ String(li_rc) + " occured during copy to clipboard")
end event

event ue_assign_menu;//override
this.ChangeMenu(m_ole_example) 
		im_menu = this.menuid 
end event

event ue_save_commit;//override
long			ll_row, ll_rc
ll_rc = 1
// get last guest id before saving gcc
dwitemstatus ldstatus
ldstatus = dw_data.GetItemStatus( dw_data.GetRow(), 0, Primary!)
If ldstatus = New! or ldstatus = NewModified! then // if new then ...
	SELECT max(idauto) into :id_oleid from ole ;
	ll_row	= dw_data.GetRow() 
	If ll_row <= 0 then 
		MessageBox('Save Error','No ole header data found on save.', Stopsign!)
		return 
	END IF
	
	ll_rc =	ole_1.dynamic uf_save(id_oleid) 
	
ELSE
	ll_rc = ole_1.dynamic uf_save(id_oleid) 
END IF 
f_end_tran( SQLCA, ll_rc, 'OLE Save' , 'Save succeeded', 'Save failed')

end event

event resize;//override
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
		
//		dw_primary.height	= newheight - ii_resizeband_y * 2 - dw_primary.y - cb_search.height 
//		dw_primary.width	= newwidth  - dw_primary.x * 2 

		ole_1.height		= newheight - ii_resizeband_y * 2 - ole_1.y - cb_search.height 
		ole_1.width			= newwidth  - ole_1.x * 2 
		cb_getfile.y 		= newheight - ii_resizeband_y - cb_getfile.height
		cb_oleedit.y 		= newheight - ii_resizeband_y - cb_oleedit.height
	End IF 
End IF 	
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_base_ole
integer x = 5
integer y = 8
integer width = 1294
integer height = 544
string dataobject = "d_vzt_ole_list"
end type

event dw_mainlist::ue_rowselected;If row <= 0 or not ab_selected or row > this.Rowcount() then return -1
id_oleid = f_nvl( this.GetItemNumber( row, 'idauto') ,0)
is_subject = f_nvl( this.GetItemString( row, 'subject') ,'')
if id_oleid > 0 then ole_1.event ue_Retrieve( id_oleid) 
cb_delete1.visible = true 
return 1
end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_base_ole
integer x = 3040
integer y = 1628
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_vzt_base_ole
integer x = 2318
integer y = 1628
integer taborder = 60
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_base_ole
integer x = 1563
integer y = 1628
integer taborder = 120
end type

event cb_delete1::clicked;//overr
cb_save.visible = true 
cb_save.enabled = true 
call super::clicked
if ii_savestatus >= 0 then cb_save.visible = false


end event

type cb_save from w_vzt_base`cb_save within w_vzt_base_ole
integer x = 818
integer y = 1628
integer taborder = 100
end type

type cb_select from w_vzt_base`cb_select within w_vzt_base_ole
integer x = 599
integer y = 1628
integer taborder = 90
end type

event cb_select::clicked;call super::clicked;dw_mainlist.event ue_rowselected(1, true)
end event

type cb_new from w_vzt_base`cb_new within w_vzt_base_ole
integer x = 1390
integer y = 1628
integer taborder = 110
end type

event cb_new::clicked;call super::clicked;blob lb_object
ole_1.objectdata = lb_object 

int li_rc
cb_save.enabled = false
li_rc = ole_1.event ue_loadfile()
if li_rc > 0 then cb_save.enabled = true 

end event

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_base_ole
integer x = 18
integer y = 1628
integer taborder = 80
end type

event cb_newsearch::clicked;call super::clicked;blob lb_object
ole_1.objectdata = lb_object 
end event

type cb_search from w_vzt_base`cb_search within w_vzt_base_ole
integer x = 366
integer y = 1628
integer taborder = 70
end type

event cb_search::clicked;call super::clicked;cb_new.visible = true 
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_base_ole
integer x = 2053
integer y = 1628
end type

type st_stop from w_vzt_base`st_stop within w_vzt_base_ole
integer x = 2080
integer y = 1628
end type

type dw_data from w_vzt_base`dw_data within w_vzt_base_ole
integer x = 1312
integer y = 4
integer width = 2043
integer height = 548
integer taborder = 50
string dataobject = "d_vzt_ole_edit"
boolean vscrollbar = false
end type

event dw_data::ue_rowselected;return 1
end event

event dw_data::constructor;call super::constructor;//_selection_service = 'S'   


is_editable[]	={'id','description', 'subject'}
//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}
is_searchable[]	= is_editable[]
end event

type dw_print from w_vzt_base`dw_print within w_vzt_base_ole
integer x = 1833
integer y = 1628
integer taborder = 130
end type

type ole_1 from uo_vzt_olebase within w_vzt_base_ole
integer x = 9
integer y = 556
integer width = 3346
integer height = 1060
integer taborder = 30
boolean bringtotop = true
string binarykey = "w_vzt_base_ole.win"
end type

type cb_oleedit from commandbutton within w_vzt_base_ole
integer x = 1038
integer y = 1628
integer width = 279
integer height = 76
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ole Edit"
end type

event clicked;ole_1.uf_activate(ole_1.i_acttype)
cb_save.visible = true 
cb_save.enabled = true 
end event

type cb_getfile from commandbutton within w_vzt_base_ole
integer x = 2565
integer y = 1628
integer width = 466
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get Template File"
end type

event clicked;int li_rc
li_rc = ole_1.event ue_loadfile()
if li_rc > 0 then 
	cb_save.enabled = true 
	cb_save.visible = true 
end if
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_vzt_base_ole.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_vzt_base_ole.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
