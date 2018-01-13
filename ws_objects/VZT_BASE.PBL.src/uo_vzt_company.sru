$PBExportHeader$uo_vzt_company.sru
forward
global type uo_vzt_company from userobject
end type
type dw_company from uo_vzt_dwbase within uo_vzt_company
end type
end forward

global type uo_vzt_company from userobject
integer width = 1111
integer height = 444
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_caller_editchange ( string as_company )
event ue_caller_init ( )
event ue_caller_posteditchange ( long matchedrows )
event ue_caller_postselection ( )
event ue_losefocus ( )
dw_company dw_company
end type
global uo_vzt_company uo_vzt_company

type variables
nvo_company	inv_company
uo_vzt_dwbase	idw_caller
string		is_caller_col, is_input

end variables

event ue_caller_editchange;//if dw_primary.rowcount() <= 0 then return 
//if dw_primary.accepttext() <> 1 then return 

inv_company.uf_search( as_company, dw_company)

long ll_rows
ll_rows = dw_company.RowCount()
//st_numentries.text = 'Matched '+ string(ll_rows) + ' records.'
//st_numentries.visible = true
this.event ue_caller_posteditchange( ll_rows)
IF ll_rows > 0 then 
	this.visible = true
	this.SetRedraw(true)
else
	this.visible = false
end if	
end event

event ue_caller_init;// copy and update in descendant
//this.idw_caller 		= dw_data
//this.is_caller_col 	= 'guest_comp_name'

end event

event ue_caller_posteditchange;//idw_caller.post SetColumn( is_caller_col)
idw_caller.post setfocus()
end event

event ue_losefocus;this.visible = false
end event

on uo_vzt_company.create
this.dw_company=create dw_company
this.Control[]={this.dw_company}
end on

on uo_vzt_company.destroy
destroy(this.dw_company)
end on

event constructor;this.visible = false

inv_company = CREATE nvo_company	
// inv_company.ib_one_ds = true 
inv_company.uf_init(false, false, 'compcaps', true, 'd_dddw_company_caps' )
this.event ue_caller_init()

end event

event destructor;IF IsValid( inv_company ) then  DESTROY inv_company 

end event

type dw_company from uo_vzt_dwbase within uo_vzt_company
integer width = 1097
integer height = 432
string dataobject = "d_dddw_company_caps"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

event ue_rowselected;if row > 0 and ab_selected then
	// pass selected string to the caller object
	string 	ls_company
	long		ll_caller_row
	ls_company = this.GetItemString( row, 'company')
	ll_caller_row = idw_caller.GetRow()
	If ll_caller_row > 0 then
		idw_caller.SetItem( ll_caller_row , is_caller_col, ls_company) 
	END IF 
	// hide
	dw_company.SelectRow(0, false)
	parent.visible = false
	parent.event ue_caller_postselection()
end if

return 1
end event

