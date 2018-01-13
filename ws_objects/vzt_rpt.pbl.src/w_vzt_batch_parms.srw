$PBExportHeader$w_vzt_batch_parms.srw
forward
global type w_vzt_batch_parms from w_vzt_base_response
end type
type st_1 from statictext within w_vzt_batch_parms
end type
type dw_distlist from uo_vzt_dwbase within w_vzt_batch_parms
end type
type dw_recurring from uo_vzt_dwbase within w_vzt_batch_parms
end type
end forward

global type w_vzt_batch_parms from w_vzt_base_response
integer width = 2331
integer height = 1048
string title = "Batch Report Submission"
st_1 st_1
dw_distlist dw_distlist
dw_recurring dw_recurring
end type
global w_vzt_batch_parms w_vzt_batch_parms

type variables
datawindowchild 	idwc_distlist, idwc_recurring
end variables

on w_vzt_batch_parms.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_distlist=create dw_distlist
this.dw_recurring=create dw_recurring
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_distlist
this.Control[iCurrent+3]=this.dw_recurring
end on

on w_vzt_batch_parms.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_distlist)
destroy(this.dw_recurring)
end on

event open;dw_response.object.reportid.visible = 0
dw_response.object.reportid_t.visible = 0

istr_parms = Message.PowerObjectParm
If not IsValid (istr_parms ) then 
	this.POST event ue_cancel()
	RETURN
End IF

long ll_row
ll_row = dw_response.RowCOunt()
If ll_row > 0 then dw_response.RowsDiscard(1, ll_row, Primary! )

ll_row = istr_parms.dw1.GetRow()
If ll_row <=0 then return 

//istr_parms.dw1.RowsCopy( ll_row , ll_row , Primary!, dw_response, 1,Primary!)
dw_response.object.data = istr_parms.dw1.object.data 
dw_response.SetRow(ll_row )
dw_response.ScrollToRow(ll_row )

dw_response.object.userid.visible 				= false 
dw_response.object.userid_t.visible 			= false 
dw_response.object.securitylevel.visible 		= false 
dw_response.object.securitylevel_t.visible 	= false 
dw_response.object.dwdataobjectname.visible 	= false 
dw_response.object.dwdataobjectname_t.visible = false 
dw_response.object.rptdesc.visible 				= false 
dw_response.object.rptdesc_t.visible 			= false 

If dw_response.RowCOunt() <=0 then return 
If IsNUll (dw_response.object.recurring[1]) then dw_response.object.recurring[1]='ONETIME'
//dw_response.object.title [1] = istr_parms.dw1.object.title [1] 
dw_response._selection_service = '' 

dw_distlist.Retrieve()
if dw_response.GetChild( 'distribution_list_id', idwc_distlist) > 0 then
	dw_distlist.ShareData( idwc_distlist)
END IF
dw_recurring.Retrieve()
if dw_response.GetChild( 'recurring', idwc_recurring) > 0 then
	dw_recurring.ShareData( idwc_recurring)
END IF

end event

event ue_process_ok;call super::ue_process_ok;if dw_response.AcceptText() <> 1 then 
	istr_parms.rc = -1
	return 
Else
	istr_parms.dw1.SetItem( 1, "recurring", string( dw_response.object.recurring [1] ) )
	istr_parms.dw1.object.data = dw_response.object.data  
	istr_parms.dw1.SetItem( 1, "distribution_list_id", string( dw_response.object.distribution_list_id [1] ) )

End If

end event

type dw_response from w_vzt_base_response`dw_response within w_vzt_batch_parms
integer x = 0
integer y = 152
integer width = 2281
integer height = 640
string dataobject = "d_vzt_mm_rpt_def_edit"
end type

event dw_response::constructor;call super::constructor;_selection_service = '' 
end event

event dw_response::doubleclicked;//override
end event

type cb_2 from w_vzt_base_response`cb_2 within w_vzt_batch_parms
integer x = 1266
integer y = 828
integer height = 80
integer taborder = 40
boolean default = false
end type

type cb_1 from w_vzt_base_response`cb_1 within w_vzt_batch_parms
integer x = 832
integer y = 828
integer height = 80
integer taborder = 20
end type

type st_1 from statictext within w_vzt_batch_parms
integer x = 265
integer y = 36
integer width = 1842
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Would you like to submit this report to batch queue?"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_distlist from uo_vzt_dwbase within w_vzt_batch_parms
boolean visible = false
integer x = 1582
integer y = 812
integer width = 699
integer height = 252
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_vzt_dddw_distribution"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type dw_recurring from uo_vzt_dwbase within w_vzt_batch_parms
boolean visible = false
integer x = 50
integer y = 740
integer width = 667
integer height = 196
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_recurring_dddw"
boolean border = false
borderstyle borderstyle = stylebox!
end type

