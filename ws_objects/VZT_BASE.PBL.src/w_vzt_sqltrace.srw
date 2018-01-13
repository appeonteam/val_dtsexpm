$PBExportHeader$w_vzt_sqltrace.srw
forward
global type w_vzt_sqltrace from w_vzt_base
end type
type cb_sort1 from commandbutton within w_vzt_sqltrace
end type
end forward

global type w_vzt_sqltrace from w_vzt_base
integer x = 50
integer y = 50
integer width = 4782
integer height = 2556
string title = "VZT SQL Trace"
cb_sort1 cb_sort1
end type
global w_vzt_sqltrace w_vzt_sqltrace

on w_vzt_sqltrace.create
int iCurrent
call super::create
this.cb_sort1=create cb_sort1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_sort1
end on

on w_vzt_sqltrace.destroy
call super::destroy
destroy(this.cb_sort1)
end on

event open;call super::open;cb_newsearch.event clicked()
cb_search.event clicked()

//dw_mainlist.sort()
end event

event ue_assign_menu;//
end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_sqltrace
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_sqltrace
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_sqltrace
integer width = 4699
integer height = 1824
string dataobject = "d_trace_list"
boolean hscrollbar = true
end type

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_sqltrace
integer x = 1038
integer y = 2336
integer width = 192
end type

type cb_close from w_vzt_base`cb_close within w_vzt_sqltrace
integer x = 2286
integer y = 2336
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_sqltrace
boolean visible = true
integer x = 1413
integer y = 2336
integer width = 325
string text = "Clear Trace"
end type

event cb_delete1::clicked;//
DELETE FROM vzt_trace ;
COMMIT;
end event

type cb_save from w_vzt_base`cb_save within w_vzt_sqltrace
integer x = 818
integer y = 2336
end type

type cb_select from w_vzt_base`cb_select within w_vzt_sqltrace
integer x = 599
integer y = 2336
end type

type cb_new from w_vzt_base`cb_new within w_vzt_sqltrace
integer x = 1243
integer y = 2336
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_sqltrace
integer x = 23
integer y = 2336
end type

type cb_search from w_vzt_base`cb_search within w_vzt_sqltrace
integer x = 370
integer y = 2336
end type

event cb_search::clicked;call super::clicked; dw_mainlist.SetSort('id D, dte D')
 dw_mainlist.post sort()
 
 cb_sort1.post event clicked() 

end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_sqltrace
integer x = 2021
integer y = 2340
end type

type st_stop from w_vzt_base`st_stop within w_vzt_sqltrace
integer x = 2085
integer y = 2336
end type

type dw_data from w_vzt_base`dw_data within w_vzt_sqltrace
integer x = 9
integer y = 1836
integer width = 4366
integer height = 472
string dataobject = "d_trace_view"
boolean hscrollbar = true
boolean border = false
end type

type dw_print from w_vzt_base`dw_print within w_vzt_sqltrace
integer x = 2656
integer y = 1316
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_sqltrace
end type

type cb_sort1 from commandbutton within w_vzt_sqltrace
integer x = 1751
integer y = 2336
integer width = 178
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sort"
end type

event clicked;dw_mainlist.SetSort( 'id D, dte D')
dw_mainlist.Sort( )
end event

