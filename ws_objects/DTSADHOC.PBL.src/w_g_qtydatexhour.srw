$PBExportHeader$w_g_qtydatexhour.srw
forward
global type w_g_qtydatexhour from w_graph_sheet_using_dw
end type
end forward

global type w_g_qtydatexhour from w_graph_sheet_using_dw
int Height=1516
boolean TitleBar=true
string Title="Daily Calls per Hour"
string MenuName="m_graph"
end type
global w_g_qtydatexhour w_g_qtydatexhour

event open;window activesheet
string sheet_name, report_type, dw_mod0, dw_mod1,dw_mod2,dw_mod3,dw_mod4, dw_mod_result
string open_from, open_to, schedule_from, schedule_to , series_exp , category_exp


report_type = Message.StringParm

activesheet = w_main.GetActiveSheet()

This.Title = This.Title + " - Graph"	// enforces standard


SetMicroHelp( "Opening " + This.Title + " window...please wait." )

open_from     = "min(call_indate for all )"
open_to       = "max(call_indate for all )"
schedule_from = "min(timer_start for all )"
schedule_to   = "max(timer_start for all )"
series_exp    = "String(Date(timer_start), ~"yyyy-mm-dd~" )"
category_exp  = "string( Time(timer_start),~"hh~")"


dw_mod0 		  = "sched_lbl.text = '" + report_type + "'"

if report_type = 'Scheduled' then
	dw_mod1    = " fromdate.expression=' "+schedule_from+" ' "
	dw_mod2    = " todate.expression=' "+schedule_to+" ' "
   dw_mod3    = " gr_1.Series ='"+series_exp+" ' "
   dw_mod4    = " gr_1.Category ='"+category_exp+" ' "
else
	dw_mod1 = " fromdate.expression=' "+open_from+" ' "
	dw_mod2 = " todate.expression=' "+open_to+" ' "
end if



dw_mod_result = dw_1.Modify(dw_mod0)

dw_mod_result = dw_1.Modify(dw_mod1) 

//
//if dw_mod_result <> "" then
//	MessageBox("dwModify Error","from date: "+dw_mod_result)
//end if

dw_mod_result = dw_1.Modify(dw_mod2) 

//
//if dw_mod_result <> "" then
//	MessageBox("dwModify Error","to date: "+dw_mod_result)
//end if
//

if report_type = 'Scheduled' then
   dw_mod_result = dw_1.Modify(dw_mod3)

 //   if dw_mod_result <> "" then
//   	MessageBox("dwModify Error","to date: "+dw_mod_result)
//  end if
   
   dw_mod_result = dw_1.Modify(dw_mod4) 

End IF


// 

f_mod_gr_dw_ld_disp(dw_1,'fromdate',1)
f_mod_gr_dw_ld_disp(dw_1,'todate',1)
end event

on w_g_qtydatexhour.create
call super::create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
end on

on w_g_qtydatexhour.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from w_graph_sheet_using_dw`dw_1 within w_g_qtydatexhour
int X=73
int Y=0
string DataObject="g_qty_x_date_x_hour"
end type

