$PBExportHeader$w_call_linked_docs.srw
forward
global type w_call_linked_docs from window
end type
type dw_doc from uo_vzt_dwbase within w_call_linked_docs
end type
type cb_save from commandbutton within w_call_linked_docs
end type
type cb_getfile from commandbutton within w_call_linked_docs
end type
type cb_oleedit from commandbutton within w_call_linked_docs
end type
type cb_del from commandbutton within w_call_linked_docs
end type
type cb_ins from commandbutton within w_call_linked_docs
end type
type ole_1 from uo_vzt_oledoc_base within w_call_linked_docs
end type
end forward

global type w_call_linked_docs from window
integer width = 3415
integer height = 1968
boolean titlebar = true
string title = "Linked Documents"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_doc dw_doc
cb_save cb_save
cb_getfile cb_getfile
cb_oleedit cb_oleedit
cb_del cb_del
cb_ins cb_ins
ole_1 ole_1
end type
global w_call_linked_docs w_call_linked_docs

type variables
//VZ DOCS:
Datawindow dw_1 
double	id_oleid, id_doc_id
uo_vzt_dwbase   idw_docs

string 	is_call_number


end variables

on w_call_linked_docs.create
this.dw_doc=create dw_doc
this.cb_save=create cb_save
this.cb_getfile=create cb_getfile
this.cb_oleedit=create cb_oleedit
this.cb_del=create cb_del
this.cb_ins=create cb_ins
this.ole_1=create ole_1
this.Control[]={this.dw_doc,&
this.cb_save,&
this.cb_getfile,&
this.cb_oleedit,&
this.cb_del,&
this.cb_ins,&
this.ole_1}
end on

on w_call_linked_docs.destroy
destroy(this.dw_doc)
destroy(this.cb_save)
destroy(this.cb_getfile)
destroy(this.cb_oleedit)
destroy(this.cb_del)
destroy(this.cb_ins)
destroy(this.ole_1)
end on

event open;is_call_number = f_nvl(Message.StringParm , '')
if is_call_number = '' then
	Messagebox('Linked Documents','Error: call number not specified')
	post Close(this)
END IF

idw_docs = dw_doc
//verify access right
If Is_PasswordOK( Get_Event_Security( "LD" ) ) Then
	// ok
ELSE
	post Close(this)	
END IF 

idw_docs.Retrieve( is_call_number )


end event

type dw_doc from uo_vzt_dwbase within w_call_linked_docs
integer x = 14
integer y = 20
integer width = 1637
integer height = 1724
integer taborder = 30
string dataobject = "d_mod_calls_doc_list"
boolean vscrollbar = true
end type

event clicked;call super::clicked;if row = 1 and this.RowCOunt() = 1 then 
	this.event rowfocuschanged (1)
end if
end event

event constructor;call super::constructor;//post wf_setupdateable ( dw_doc, "Contract documents", true, true  ) // set updateable, title and selectable

this.ib_poweredit = true 

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={ 'doc_type', 'descr'} 

is_searchable[]	=  is_editable[]

_selection_service = 'S' 

end event

event editchanged;call super::editchanged;cb_save.visible = true 
end event

event retrieveend;call super::retrieveend;ole_1.Clear() 
this.event rowfocuschanged( this.getrow())
end event

event rowfocuschanged;call super::rowfocuschanged;long row
double ld_ole

row = currentrow
If row <= 0 or row > this.Rowcount() then return 

id_oleid = f_nvl( this.GetItemNumber( row, 'ole_doc_id') ,0)
id_doc_id = f_nvl( this.GetItemNumber( row, 'id') ,0)

ld_ole = id_oleid

ole_1.Clear() 
ole_1.id_ole = 0
if id_oleid > 0 then 
	ole_1.event ue_Retrieve( id_oleid) 
	//cb_delete1.visible = true 
end if
return 1



end event

type cb_save from commandbutton within w_call_linked_docs
integer x = 27
integer y = 1760
integer width = 1623
integer height = 76
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save Doc Reference"
end type

event clicked;long			ll_ret
 	
ll_ret = dw_doc.Update (true, true) 
If 	ll_ret  <> 1 then
	MessageBox('Database Error', 'Document referece not saved!')
END IF
end event

type cb_getfile from commandbutton within w_call_linked_docs
integer x = 2377
integer y = 1760
integer width = 361
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Get Doc File"
end type

event clicked;long ll_row
dwitemstatus lst_stat
ll_row = dw_doc.GetROw() 
lst_stat = idw_docs.GetItemStatus( ll_row, 0, Primary!)
If lst_stat = New! or lst_stat = NewModified! then
	MessageBox("Recent Changes Unsaved", "Please save changes before adding a document!", StopSign!)
ELSE	
	int li_rc
	li_rc = ole_1.event ue_loadfile()
	if li_rc > 0 then 
		li_rc = ole_1.uf_save()
		if li_rc >= 0 then 
			idw_docs.Retrieve( is_call_number )
			if ll_row > 0 then
				idw_docs.SetRow( ll_row) 
				idw_docs.ScrollToRow( ll_row) 
				idw_docs.SelectRow(0,false)
				idw_docs.SelectRow(ll_row,true)
			end if	
		end if 
		cb_save.enabled = true 
	end if
END IF



end event

type cb_oleedit from commandbutton within w_call_linked_docs
integer x = 1993
integer y = 1760
integer width = 375
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "&Edit/View Doc"
end type

event clicked;ole_1.uf_activate(ole_1.i_acttype)
cb_save.visible = true 
cb_save.enabled = true 
end event

type cb_del from commandbutton within w_call_linked_docs
integer x = 1819
integer y = 1760
integer width = 142
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<-Del"
end type

event clicked;	long ll_row  , ll_ret
	string ls_expr
	double ld_doc_id, ld_ole_doc_id
	
	ll_ret = MessageBox( "Document Reference Deletion", 'Are you sure you want to delete this document reference?~r~n(The original document would not be deleted)', question!, YesNo!)
	If ll_ret = 1 then
		ll_row = idw_docs.GetRow() 
		If ll_row <= 0 then return 
		ld_doc_id 		= idw_docs.object.id [ll_row ]
		ld_ole_doc_id  = idw_docs.object.ole_doc_id [ll_row ]
		idw_docs.DeleteRow(0) 
	
		DELETE vzt_ole_doc 
		WHERE idauto = :ld_ole_doc_id ;
		
		ll_ret 		= idw_docs.Update (true, true) 
		IF ll_ret = 1 then
			COMMIT;
			ole_1.event ue_Retrieve( 0) 
		ELSE
			ROLLBACK;
		END IF
END IF
end event

type cb_ins from commandbutton within w_call_linked_docs
integer x = 1673
integer y = 1760
integer width = 142
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "<-Ins"
end type

event clicked;	long			ll_newrow, ll_ret
 	ll_newrow = idw_docs.EVENT ue_insert_new( 'doc_type') 
	if ll_newrow <= 0 then return 
	idw_docs.SetItem( ll_newrow, 'call_number', 	is_call_number)
	
	ll_ret 		= idw_docs.Update (true, true) 
	IF ll_ret = 1 then
		COMMIT;
	ELSE
		ROLLBACK;
	END IF

	id_doc_id 	= idw_docs.GetItemNumber(ll_newrow, 'id') 

	idw_docs.ScrollToRow(ll_newrow)
	idw_docs.SetRow(ll_newrow)
	idw_docs.SelectRow(0, false)
	idw_docs.SelectRow(ll_newrow, true)

	cb_getfile.post event Clicked()
end event

type ole_1 from uo_vzt_oledoc_base within w_call_linked_docs
integer x = 1669
integer y = 16
integer width = 1691
integer height = 1724
integer taborder = 20
string binarykey = "w_call_linked_docs.win"
end type

event ue_ole_save_upd_ref_sql;double ld_ole, ld_doc_id ,ld_main_id 
ld_ole			= id_ole
ld_doc_id 		= id_doc_id 

if ld_ole > 0 then 
	UPDATE vzt_call_docs SET ole_doc_id = :ld_ole 
	WHERE id = :ld_doc_id AND call_number = :is_call_number ;
	
	ld_ole = SQLCA.SQLCODE
end if
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
07w_call_linked_docs.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17w_call_linked_docs.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
