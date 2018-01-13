$PBExportHeader$uo_vzt_mm_tabpage_parms.sru
forward
global type uo_vzt_mm_tabpage_parms from uo_tabpage_dw
end type
type dw_queries from uo_vzt_dwbase within uo_vzt_mm_tabpage_parms
end type
type cb_saveq from commandbutton within uo_vzt_mm_tabpage_parms
end type
type cb_delquery from commandbutton within uo_vzt_mm_tabpage_parms
end type
type cb_newq from commandbutton within uo_vzt_mm_tabpage_parms
end type
end forward

global type uo_vzt_mm_tabpage_parms from uo_tabpage_dw
integer width = 2267
integer height = 1376
string text = "Report Definition"
string picturename = "scriptyes!"
dw_queries dw_queries
cb_saveq cb_saveq
cb_delquery cb_delquery
cb_newq cb_newq
end type
global uo_vzt_mm_tabpage_parms uo_vzt_mm_tabpage_parms

type variables
string is_report
boolean 	ib_qrefresh
end variables

on uo_vzt_mm_tabpage_parms.create
int iCurrent
call super::create
this.dw_queries=create dw_queries
this.cb_saveq=create cb_saveq
this.cb_delquery=create cb_delquery
this.cb_newq=create cb_newq
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_queries
this.Control[iCurrent+2]=this.cb_saveq
this.Control[iCurrent+3]=this.cb_delquery
this.Control[iCurrent+4]=this.cb_newq
end on

on uo_vzt_mm_tabpage_parms.destroy
call super::destroy
destroy(this.dw_queries)
destroy(this.cb_saveq)
destroy(this.cb_delquery)
destroy(this.cb_newq)
end on

event ue_resize;//overr
dw_1.x = delta_x 
dw_1.y = delta_y 
dw_1.width  = newwidth - (2 * this.delta_x )
dw_queries.y = newheight - dw_queries.height -  this.delta_y
cb_saveq.y 		=	dw_queries.y
cb_newq.y 		=	cb_saveq.y + cb_saveq.height + 2
cb_delquery.y	=	cb_newq.y  + cb_newq.height + 2 
dw_1.height = newheight - dw_queries.height - (3 * this.delta_y )

 
end event

type dw_1 from uo_tabpage_dw`dw_1 within uo_vzt_mm_tabpage_parms
event ue_dateset ( )
integer y = 12
integer width = 2226
integer height = 992
integer taborder = 10
string dataobject = "d_vzt_mm_rpt_parms"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event dw_1::ue_dateset;	// 1900 date defaults
	long 		ll_row, ll_rowcount
	string	ls_parmtype, ls_datevalue
	datetime ldt_parm
	ll_rowcount = this.RowCount()
	FOR ll_row = 1 to ll_rowcount
		ls_parmtype = this.getitemString( ll_row, 'parmtype')
		If ls_parmtype = 'DATE' or ls_parmtype = 'DATETIME' then 
			ldt_parm	= this.getitemDatetime( ll_row, 'parmdate') 
			IF date(ldt_parm) = date('1/1/1900') then ldt_parm	= f_sysdate()
			this.Setitem( ll_row, 'parmdate', ldt_parm	)
			ls_datevalue = string(ldt_parm	, 'mm/dd/yyyy') 
			this.setitem( ll_row, 'parmvalue', ls_datevalue ) // y2k PB bug on describe data			
		END IF 
	NEXT
end event

event dw_1::constructor;call super::constructor;fkeycols[1]="reportid"
end event

event dw_1::ue_update_keys_on_new;If UpperBound( fkeyvals[]) > 0 then this.setitem( row ,fkeycols[1], fkeyvals[1])
return 1

end event

event dw_1::clicked;call super::clicked;if row <=0 or row > this.RowCount() then return 

CHOOSE CASE dwo.name 
	CASE 'b_search'
		string ls_lookuptype, ls_lookupprocessor
		ls_lookuptype 			= this.object.lookuptype [row] 
		ls_lookupprocessor 	= this.object.lookupprocessor [row] 
		CHOOSE CASE ls_lookuptype 
			CASE 'DDDW'
			CASE 'WINDOW'	
				
		END CHOOSE
END CHOOSE
end event

event dw_1::buttonclicked;string ls_parmtype, ls_lookuptype, ls_lookupprocessor,ls_parmvalue, ls_newvalue, ls_autoreplace
string ls_numlist, ls_newdescr
window  lw_processor
DataWindowChild  dwchild
//str_rptgen_reportparms lst_parms
st_lookup_parm		lst_lparms
st_lookup_ret		lst_retparms

If row <= 0 or row > this.RowCount() then return
If this.accepttext() <> 1 then return 

ls_parmtype 			= trim( this.object.parmtype 	[row] )
ls_lookuptype 			= this.object.lookuptype 		[row] 
ls_lookupprocessor 	= this.object.lookupprocessor [row] 
ls_autoreplace			= UPPER( this.object.autoreplace	[row] )
ls_numlist				= UPPER( this.object.numeric_list [row] )
lst_lparms.selection = UPPER( this.object.weblookup_type [row] )

//parenttab.tabposition = TabsOnBottom! 
long ll_x, ll_y, ll_w, ll_h, ll_rc

ll_y = parenttab.y
ll_y = parenttab.tabpage[1].y
ll_y = this.y
ll_y = long(this.object.parmvalue.y)
ll_y = long(this.object.datawindow.detail.height)

ll_x = long(this.object.parmvalue.x) + parenttab.x + this.x
ll_y = long(this.object.parmvalue.y) + parenttab.y + this.y +parenttab.tabpage[1].y+ ((row - 1) * long(this.object.datawindow.detail.height)) + long(this.object.datawindow.header.height)

//MessageBox('lookup', string(dwo.name)+':~r~nX:'+string(dwo.x)+':~r~nY:'+string(dwo.y))

// get current value
CHOOSE CASE ls_parmtype 
	CASE 'DATE'
		ls_parmvalue = string( this.object.parmdate [row],"yyyy mmm dd" )
		dw_1.SetColumn('parmdate')
		
		if ls_autoreplace	= 'Y' then 
			ls_lookupprocessor 	= 'w_vzt_replace_lookup' 			
			ls_lookuptype 			= 'WINDOW'
		END IF
	CASE 'DATETIME'
		ls_parmvalue = string( this.object.parmdate [row], "yyyy mmm dd" )
		dw_1.SetColumn('parmdate')
		if ls_autoreplace	= 'Y' then 
			ls_lookupprocessor 	= 'w_vzt_replace_lookup' 			
			ls_lookuptype 			= 'WINDOW'
		END IF
	CASE 'STRING'
		dw_1.SetColumn('parmvalue')
		ls_parmvalue = this.object.parmvalue [row] 
	CASE 'NUMBER'
		dw_1.SetColumn('parmnum')
		ls_parmvalue = string( this.object.parmnum [row] )
		 
END CHOOSE

dw_1.SetRow(row) 
dw_1.ScrollToRow(row) 
		
if ls_lookupprocessor = '' or isNull (ls_lookupprocessor) then return 

CHOOSE CASE ls_lookuptype 	
	CASE 'DDDW'
	CASE 'UO'
		userobject uo_lookup
	//	parenttab.visible = false
      ll_rc = parenttab.w_parent.OpenUserObjectWithParm(uo_lookup, "ccc", "u_multi_select_01", ll_x, ll_y)
   	if ll_rc <> 1 then messagebox('lookup error' , ' object creation failed')
		uo_lookup.bringtotop = true
		uo_lookup.triggerevent ("size_open")
	CASE 'WINDOW'
		lst_lparms.parmvalue = ls_parmvalue
		lst_lparms.codecol	= this.object.weblookup_code_colname [row]
		lst_lparms.desccol	= this.object.weblookup_disp_colname [row]
		lst_lparms.dataobject= this.object.weblookup_do [row]
		lst_lparms.x = ll_x + parenttab.w_parent.x
		lst_lparms.y = ll_y + parenttab.w_parent.y + 160
		lst_lparms.numlist	= ls_numlist
	   OpenWithParm(lw_processor, lst_lparms , ls_lookupprocessor )
	CASE ELSE
		return
END CHOOSE

//ls_newvalue = message.stringparm 
lst_retparms = message.PowerObjectPArm
ls_newvalue  = lst_retparms.newvalue
ls_newdescr  = lst_retparms.newdescr

dw_1.SetFocus()

If ls_newvalue =  "CANCEL" then
    return
Else
	CHOOSE CASE ls_parmtype 
		CASE 'DATE'
			if ls_autoreplace	= 'Y' then 
			   this.object.replacetype [row] = TRIM(UPPER(ls_newvalue ))
			Else
			   this.object.parmdate [row] = datetime( date( ls_newvalue ), time("00:00 AM") )
			END IF
		CASE 'STRING'
			this.object.parmvalue [row] = ls_newvalue 
			this.object.parmdescr [row] = ls_newdescr 
	
		CASE 'NUMBER'
			If IsNumber( ls_newvalue ) then this.object.parmnumber [row] = dec( ls_newvalue ) 
	END CHOOSE
End If
this.event ue_dateset()

end event

event dw_1::retrieveend;call super::retrieveend;string ls_report 
if rowcount <= 0 then
	cb_delquery.visible 	= false
	cb_newq.visible 		= false
	cb_saveq.visible 		= false
	dw_queries.visible 	= false
	return
Else
	cb_delquery.visible 	= true
	cb_newq.visible 		= true
	cb_saveq.visible 		= true
	dw_queries.visible 	= true

	this.event ue_dateset()
	
	is_report = this.GetItemString( 1, 'reportid')
	if not ib_qrefresh then dw_queries.Retrieve( is_report, gnv_appman.is_userid)
END IF 
end event

event dw_1::updatestart;call super::updatestart;	this.event ue_dateset()
end event

event dw_1::itemchanged;call super::itemchanged;this.POST event ue_dateset()
if row <=0 then return

If dwo.name = 'parmdescr' then return  2
end event

event dw_1::ue_setmasks;if f_nvl(gnv_appman.is_datemask,'') <> '' then 
	this.Object.parmdate.EditMask.Mask	= gnv_appman.is_datemask
END IF
end event

event dw_1::losefocus;call super::losefocus;this.AcceptText()
this.event ue_dateset()

end event

type dw_queries from uo_vzt_dwbase within uo_vzt_mm_tabpage_parms
integer x = 9
integer y = 1020
integer width = 987
integer height = 348
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_vzt_mm_rpt_querylist"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'
end event

event itemchanged;call super::itemchanged;
if row <= 0 then return


If lower(dwo.name) = 'querydescr' then

	long ll_parmrow, ll_maxparms
	string 	ls_randkey
	ll_maxparms = dw_1.RowCount()
	If ll_maxparms <= 0 then return 

 	FOR ll_parmrow = 1 to ll_maxparms
 		dw_1.SetItem(  ll_parmrow, 'querydescr', data)
	NEXT
	
End If 
end event

event ue_rowselected;string ls_randkey
if not ab_selected then return 1
if row <= 0 then return 1

ls_randkey = this.GetItemString( row, 'queryname') 
ib_qrefresh = true
dw_1.Retrieve( is_report, 'RW', gnv_appman.is_userid, ls_randkey )
ib_qrefresh = false

return 1
end event

event clicked;call super::clicked;this.post event ue_rowselected(row, true)
end event

type cb_saveq from commandbutton within uo_vzt_mm_tabpage_parms
integer x = 1010
integer y = 1020
integer width = 585
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save Query"
end type

event clicked;long ll_parmrow, ll_maxparms, ls_userid

ll_maxparms = dw_1.RowCount()
If ll_maxparms <= 0 then return 

if dw_queries.AcceptText() <> 1 then return 

If dw_1.GetItemString( 1, 'userid') <> gnv_appman.is_userid then 
	//MessageBox('Save Query', 'Save failed', Exclamation!)
	return
END IF 
If dw_1.Update(true, true) = 1 then
	COMMIT;
	MessageBox('Save Query', 'Saved successfully.')
	//dw_queries.Retrieve( is_report, gnv_appman.is_userid)
ELSE
	ROLLBACK;
	MessageBox('Save Query', 'Save failed', Exclamation!)
END IF 
end event

type cb_delquery from commandbutton within uo_vzt_mm_tabpage_parms
integer x = 1010
integer y = 1172
integer width = 585
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete Query"
end type

event clicked;long 		ll_qrow 
string	ls_qname, ls_report, ls_qdescr
ll_qrow = dw_queries.GetRow()
if ll_qrow <= 0 or ll_qrow > dw_queries.RowCount() then return 
ls_qname	= f_nvl(dw_queries.GetItemString( ll_qrow, 'queryname') , '*--*' )
ls_qdescr= f_nvl(dw_queries.GetItemString( ll_qrow, 'querydescr') , '*--*' )
ls_report= dw_queries.GetItemString( ll_qrow, 'reportid')
If MessageBox('Confirm Delete', 'Are you sure you want to delete query "'+ls_qdescr+'" ?', Question!, YesNo!, 2) = 1 then 
	DELETE FROM VZT_REPORTDEFPARMS WHERE reportid = :ls_report AND
		userid = :gnv_appman.is_userid AND
		queryname = :ls_qname AND 
		userid <> 'SYS' and queryname <> 'DEFAULT';
		
	f_end_tran0( SQLCA, 'Query Deletion', 'Deleted successfully.', 'Deletion failed.')
	dw_queries.Retrieve( ls_report, gnv_appman.is_userid)
END IF	
end event

type cb_newq from commandbutton within uo_vzt_mm_tabpage_parms
integer x = 1010
integer y = 1100
integer width = 585
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save Query As New"
end type

event clicked;long ll_parmrow, ll_maxparms
string 	ls_randkey
ll_maxparms = dw_1.RowCount()
If ll_maxparms <= 0 then return 

ls_randkey = f_random_string(15)
if dw_1.accepttext() <> 1 then return

FOR ll_parmrow = 1 to ll_maxparms
	dw_1.SetItemStatus( ll_parmrow, 0, Primary!, New!)
	dw_1.SetItemStatus( ll_parmrow, 0, Primary!, NewModified!)
	dw_1.SetItem(  ll_parmrow, 'queryname', 	ls_randkey)
	dw_1.SetItem(  ll_parmrow, 'querydescr', 'New Query')
	dw_1.SetItem(  ll_parmrow, 'userid', gnv_appman.is_userid)

NEXT

If dw_1.Update(true, false) = 1 then
	COMMIT;
	dw_queries.Retrieve( is_report, gnv_appman.is_userid)
	ib_qrefresh = true
	dw_1.Retrieve( is_report, 'RW', gnv_appman.is_userid, ls_randkey )
	ib_qrefresh = false
ELSE
	ROLLBACK;
	MessageBox('Save New Query', 'Save failed', Exclamation!)
END IF 
end event

