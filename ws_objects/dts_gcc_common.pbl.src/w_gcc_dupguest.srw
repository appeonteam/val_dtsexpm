$PBExportHeader$w_gcc_dupguest.srw
forward
global type w_gcc_dupguest from w_vzt_base
end type
type cb_1 from commandbutton within w_gcc_dupguest
end type
end forward

global type w_gcc_dupguest from w_vzt_base
integer x = 480
integer y = 224
integer width = 1774
integer height = 1256
string title = "Guest Already In Database"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_1 cb_1
end type
global w_gcc_dupguest w_gcc_dupguest

type variables
uo_vzt_dwbase idw_from
end variables

on w_gcc_dupguest.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_gcc_dupguest.destroy
call super::destroy
destroy(this.cb_1)
end on

event open;call super::open;idw_from = Message.PowerObjectParm

idw_from.ShareData( dw_data)
idw_from.ShareData( dw_mainlist)
dw_data.is_editable[] = idw_from.is_searchable[]
dw_data.ModifyEdit('R')
dw_data.visible = true
end event

event close;dw_data.sharedataoff()
dw_mainlist.sharedataoff()
end event

event ue_assign_menu;//overr
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_gcc_dupguest
integer x = 5
integer y = 4
integer width = 1742
integer height = 312
string dataobject = "d_gcc_guest_list"
end type

type cb_last_search from w_vzt_base`cb_last_search within w_gcc_dupguest
integer x = 1947
integer y = 304
integer taborder = 20
end type

type cb_close from w_vzt_base`cb_close within w_gcc_dupguest
integer x = 681
integer y = 1036
integer width = 805
integer taborder = 40
string text = "Continue Inserting New Guest"
end type

event cb_close::clicked;//overr
CloseWithReturn( parent, '0')
end event

type cb_delete1 from w_vzt_base`cb_delete1 within w_gcc_dupguest
integer x = 2030
integer y = 796
integer taborder = 100
end type

type cb_save from w_vzt_base`cb_save within w_gcc_dupguest
boolean visible = false
integer x = 1897
integer y = 412
integer taborder = 80
end type

type cb_select from w_vzt_base`cb_select within w_gcc_dupguest
boolean visible = false
integer x = 1943
integer y = 716
integer taborder = 70
end type

type cb_new from w_vzt_base`cb_new within w_gcc_dupguest
boolean visible = false
integer x = 2185
integer y = 504
integer taborder = 90
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_gcc_dupguest
boolean visible = false
integer x = 1861
integer y = 624
integer taborder = 60
end type

type cb_search from w_vzt_base`cb_search within w_gcc_dupguest
boolean visible = false
integer x = 1838
integer y = 544
integer taborder = 50
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_gcc_dupguest
integer x = 1513
integer y = 1036
integer width = 229
end type

type st_stop from w_vzt_base`st_stop within w_gcc_dupguest
integer x = 2235
integer y = 604
end type

type dw_data from w_vzt_base`dw_data within w_gcc_dupguest
integer x = 5
integer y = 320
integer width = 1746
integer height = 696
integer taborder = 30
string dataobject = "d_gcc_guest_edit_dup"
end type

type dw_print from w_vzt_base`dw_print within w_gcc_dupguest
integer x = 1961
integer y = 844
integer taborder = 110
end type

type cb_1 from commandbutton within w_gcc_dupguest
integer x = 27
integer y = 1036
integer width = 635
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Use Selected Guest"
end type

event clicked;long ll_row
ll_row = dw_mainlist.GetSelectedRow(0)
if ll_row  < 0 then
	MessageBox('Duplicate Guest Selection Error', 'Must select a guest from the list first.', Stopsign!)
Else
	CloseWithReturn( parent, string(ll_row))
End IF
end event

