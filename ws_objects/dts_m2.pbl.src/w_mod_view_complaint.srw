$PBExportHeader$w_mod_view_complaint.srw
forward
global type w_mod_view_complaint from window
end type
type p_1 from picture within w_mod_view_complaint
end type
type dw_2 from datawindow within w_mod_view_complaint
end type
type pb_1 from picturebutton within w_mod_view_complaint
end type
type uo_dt_to from u_ddcal_2 within w_mod_view_complaint
end type
type uo_dt_fr from u_ddcal_2 within w_mod_view_complaint
end type
type st_2 from statictext within w_mod_view_complaint
end type
type uo_dept from u_multi_select_02 within w_mod_view_complaint
end type
type rb_mod from radiobutton within w_mod_view_complaint
end type
type rb_complaint from radiobutton within w_mod_view_complaint
end type
type st_1 from statictext within w_mod_view_complaint
end type
type ddlb_shift from dropdownlistbox within w_mod_view_complaint
end type
type dw_1 from datawindow within w_mod_view_complaint
end type
type gb_1 from groupbox within w_mod_view_complaint
end type
end forward

global type w_mod_view_complaint from window
string tag = "MOD Browser"
integer width = 4187
integer height = 2008
boolean titlebar = true
string title = "MOD Browser"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 134217728
string icon = "Query5!"
string pointer = "Arrow!"
event ue_printreport ( )
p_1 p_1
dw_2 dw_2
pb_1 pb_1
uo_dt_to uo_dt_to
uo_dt_fr uo_dt_fr
st_2 st_2
uo_dept uo_dept
rb_mod rb_mod
rb_complaint rb_complaint
st_1 st_1
ddlb_shift ddlb_shift
dw_1 dw_1
gb_1 gb_1
end type
global w_mod_view_complaint w_mod_view_complaint

event ue_printreport();int res
res = dw_1.Sharedata(dw_2)
dw_2.print()
dw_1.Sharedataoff()
end event

on w_mod_view_complaint.create
this.p_1=create p_1
this.dw_2=create dw_2
this.pb_1=create pb_1
this.uo_dt_to=create uo_dt_to
this.uo_dt_fr=create uo_dt_fr
this.st_2=create st_2
this.uo_dept=create uo_dept
this.rb_mod=create rb_mod
this.rb_complaint=create rb_complaint
this.st_1=create st_1
this.ddlb_shift=create ddlb_shift
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.p_1,&
this.dw_2,&
this.pb_1,&
this.uo_dt_to,&
this.uo_dt_fr,&
this.st_2,&
this.uo_dept,&
this.rb_mod,&
this.rb_complaint,&
this.st_1,&
this.ddlb_shift,&
this.dw_1,&
this.gb_1}
end on

on w_mod_view_complaint.destroy
destroy(this.p_1)
destroy(this.dw_2)
destroy(this.pb_1)
destroy(this.uo_dt_to)
destroy(this.uo_dt_fr)
destroy(this.st_2)
destroy(this.uo_dept)
destroy(this.rb_mod)
destroy(this.rb_complaint)
destroy(this.st_1)
destroy(this.ddlb_shift)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.SetTransObject(sqlca)


ddlb_shift.text = 'All'
uo_dept.cTable2Use		= "instdept"
uo_dept.cColumn2Retrieve= "dept"

uo_dt_fr.sle_date.text=string(today(),cDateFormatStr)
uo_dt_to.sle_date.text=string(today(),cDateFormatStr)


end event

event resize;dw_1.Resize(This.WorkSpaceWidth() - 70, This.WorkSpaceHeight() - 380)
end event

type p_1 from picture within w_mod_view_complaint
integer x = 50
integer y = 72
integer width = 293
integer height = 208
boolean originalsize = true
string picturename = "MOD_Notepad.bmp"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_mod_view_complaint
boolean visible = false
integer x = 320
integer y = 1576
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "r_mod_complaint"
boolean resizable = true
boolean livescroll = true
end type

type pb_1 from picturebutton within w_mod_view_complaint
integer x = 3506
integer y = 168
integer width = 288
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Retrieve"
boolean default = true
string picturename = "BlankCB.bmp"
vtextalign vtextalign = top!
end type

event clicked;string arg_type, arg_shift, arg_dept, new_dt_str1, new_dt_str2
datetime arg_dt_fr, arg_dt_to

if rb_complaint.checked then
	arg_type = 'G'
else
	arg_type = 'M'
end if

arg_shift = ddlb_shift.text

if uo_dept.uf_return_ddlb_text() = '[All]' then
	arg_dept = 'All'
else
	arg_dept = uo_dept.is_selected 
end if

IF f_str_d_to_d(uo_dt_fr.sle_date.Text) > Date('1990/01/01') Then
   new_dt_str1 = string(f_str_d_to_d(uo_dt_fr.sle_date.text),'yyyy/mm/dd')
end if

IF f_str_d_to_d(uo_dt_to.sle_date.Text) > Date('1990/01/01') Then
   new_dt_str2 = string(f_str_d_to_d(uo_dt_to.sle_date.text),'yyyy/mm/dd')
end if


arg_dt_fr = datetime(date(new_dt_str1))
arg_dt_to = datetime(RelativeDate(date(new_dt_str2),1))

//messagebox("args",arg_type+' '+arg_shift+' '+arg_dept+' '+new_dt_str1+' '+string(arg_dt_to,'mm/dd/yy'))
dw_1.Retrieve(arg_type,arg_shift,arg_dept,arg_dt_fr,arg_dt_to)

end event

type uo_dt_to from u_ddcal_2 within w_mod_view_complaint
integer x = 2949
integer y = 172
integer width = 453
integer height = 100
integer taborder = 40
end type

on uo_dt_to.destroy
call u_ddcal_2::destroy
end on

type uo_dt_fr from u_ddcal_2 within w_mod_view_complaint
integer x = 2464
integer y = 176
integer width = 453
integer height = 100
integer taborder = 30
end type

on uo_dt_fr.destroy
call u_ddcal_2::destroy
end on

type st_2 from statictext within w_mod_view_complaint
integer x = 1591
integer y = 92
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 33554432
long backcolor = 134217728
string text = "Department"
boolean focusrectangle = false
end type

type uo_dept from u_multi_select_02 within w_mod_view_complaint
integer x = 1577
integer y = 180
integer taborder = 20
long backcolor = 134217728
end type

on uo_dept.destroy
call u_multi_select_02::destroy
end on

type rb_mod from radiobutton within w_mod_view_complaint
integer x = 439
integer y = 180
integer width = 338
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "MOD"
end type

type rb_complaint from radiobutton within w_mod_view_complaint
integer x = 439
integer y = 92
integer width = 402
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 33554432
long backcolor = 134217728
string text = "Complaint"
boolean checked = true
end type

type st_1 from statictext within w_mod_view_complaint
integer x = 1001
integer y = 96
integer width = 210
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 33554432
long backcolor = 134217728
string text = "Shift"
boolean focusrectangle = false
end type

type ddlb_shift from dropdownlistbox within w_mod_view_complaint
string tag = "time shift"
integer x = 987
integer y = 180
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217747
boolean sorted = false
string item[] = {"All","1 - Morning","2 - Afternoon","3 - Night"}
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_mod_view_complaint
integer x = 27
integer y = 328
integer width = 4082
integer height = 1524
integer taborder = 10
string title = "none"
string dataobject = "d_mod_complaint_view"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row = 0 then //user double-clicking on blank area
 return
end if

int col
int toOpenScreen //to open 1=Complaint/MOD, 2=Call Entry, 3=Call Back
string colNm, tpCallNum, cbCallNum, actionCode, tpStat
integer modId
col = this.GetClickedColumn()
colNm = this.GetColumnName()
modId=dw_1.GetItemNumber(row,"id")
tpCallNum=dw_1.GetItemString(row,"lnk_call_number")
tpStat=dw_1.GetItemString(row,"lnk_stat_code")
cbCallNum=dw_1.GetItemString(row,"callback_call_number")

if colNm = 'recovery_task' or colNm = 'assigned_to' then
	toOpenScreen = 2
else
	if colNm = 'repairman' or colNm = 'subproblem_1' or colNm = 'commments' then
		if cbCallNum <> '' then
			toOpenScreen = 3
		else
			toOpenScreen = 0
		end if
	else
		toOpenScreen = 1
	end if
end if

if integer(tpStat) = 99 then
	actionCode = 'C'
else
	if integer(tpStat) < 10 then
		actionCode = 'A' 
	else
		actionCode = 'B'
	end if
end if

if toOpenScreen = 1 then
	if IsValid( w_complaint_mod_upd ) then
		w_complaint_mod_upd.in_id = modId
		open (w_complaint_mod_upd)
		SetPointer ( arrow! )	
	else
		If Is_PasswordOK( Get_Event_Security( "MO" ) ) Then
			OpenSheetWithParm( w_complaint_mod_upd, string(modId), &
					w_main, 0, Original! )	
			SetPointer ( arrow! )
		end if
	end if
end if

if toOpenScreen = 2 then
	If IsValid( w_call_upd ) Then
		w_call_upd.sCallNumber = tpCallNum
		w_call_upd.openMode = actionCode
		w_call_upd.colToSet = 0
		w_call_upd.TriggerEvent("ue_refresh")
		if w_call_upd.st_mode.text = 'Add' then // try to modify a closed call
			SetPointer ( arrow! )
		else
			open(w_call_upd)
			SetPointer ( arrow! )
		end if
	else
		If Is_PasswordOK( Get_Event_Security( "CN" ) ) Then
			OpenSheetWithParm( w_call_upd, actionCode+'00'+tpCallNum, "w_call_upd", w_main, 0, Original! )
			SetPointer ( arrow! )			
		else
			MessageBox("Failed","Opening Call Screen failed!")
		end if
	end if
end if

if toOpenScreen = 3 then
	If IsValid( w_call_upd ) Then
		w_call_upd.sCallNumber = cbCallNum
		w_call_upd.openMode = actionCode
		w_call_upd.colToSet = 0
		w_call_upd.TriggerEvent("ue_refresh")
		if w_call_upd.st_mode.text = 'Add' then // try to modify a closed call
			SetPointer ( arrow! )
		else
			open(w_call_upd)
			SetPointer ( arrow! )
		end if
	else
		If Is_PasswordOK( Get_Event_Security( "CB" ) ) Then
			OpenSheetWithParm( w_call_upd, actionCode+'00'+cbCallNum, "w_call_upd", w_main, 0, Original! )
			SetPointer ( arrow! )				
		else
			MessageBox("Failed","Opening Call Screen failed!")
		end if
	end if
end if


end event

event clicked;//int col
//string colNm
//col = this.GetClickedColumn()
//colNm = this.GetColumnName()
//MessageBox("col","col:"+string(col)+" name:"+colNm)

//============================================== VZ
if row <= 0 then return // vz !!!!!!!!!! 

if dwo.name = 'lnk_doc' then
	if this.GetItemNumber(row,'lnk_doc') = 0 then // no link doc
		return
	end if
end if

if dwo.name = 'lnk_doc' then
	string ls_call_number
	if dw_1.RowCount() <= 0 then return 
	ls_call_number = f_nvl(dw_1.GetITemString( row, 'lnk_call_number'),'')
	if ls_call_number = '' then
		return 
	ELSE
		OpenWithParm (w_call_linked_docs, ls_call_number )
	END IF
END IF
//============================================== VZ

end event

type gb_1 from groupbox within w_mod_view_complaint
integer x = 416
integer y = 12
integer width = 448
integer height = 272
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans Unicode"
long textcolor = 33554432
long backcolor = 134217728
string text = "Type"
end type

