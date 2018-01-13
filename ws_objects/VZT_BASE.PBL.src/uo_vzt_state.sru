$PBExportHeader$uo_vzt_state.sru
forward
global type uo_vzt_state from UserObject
end type
type dw_company from uo_vzt_dwbase within uo_vzt_state
end type
end forward

global type uo_vzt_state from UserObject
int Width=462
int Height=444
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
event ue_caller_editchange ( string as_company )
event ue_caller_init ( )
event ue_caller_posteditchange ( long matchedrows )
event ue_caller_postselection ( )
event ue_losefocus ( )
dw_company dw_company
end type
global uo_vzt_state uo_vzt_state

type variables
nvo_company	inv_company
uo_vzt_dwbase	idw_caller
string		is_caller_col, is_input, is_data_col='company'

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

on uo_vzt_state.create
this.dw_company=create dw_company
this.Control[]={this.dw_company}
end on

on uo_vzt_state.destroy
destroy(this.dw_company)
end on

event constructor;this.visible = false

inv_company = CREATE nvo_company	
// inv_company.ib_one_ds = true 
inv_company.uf_init(false, false, 'codecaps', true, 'd_dddw_states' )
this.is_data_col = 'code' 

this.event ue_caller_init()

end event

event destructor;IF IsValid( inv_company ) then  DESTROY inv_company 

end event

type dw_company from uo_vzt_dwbase within uo_vzt_state
int X=0
int Y=0
int Width=448
int Height=428
string DataObject="d_dddw_states"
boolean VScrollBar=true
end type

event constructor;call super::constructor;_selection_service = 'S'  // 'S' single, 'M' - multi

end event

event ue_rowselected;if row > 0 and ab_selected then
	// pass selected string to the caller object
	string 	ls_company
	long		ll_caller_row
	ls_company = this.GetItemString( row, is_data_col)
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

