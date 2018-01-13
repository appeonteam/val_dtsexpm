$PBExportHeader$w_g_avgminsxshift.srw
forward
global type w_g_avgminsxshift from w_graph_sheet_using_dw
end type
end forward

global type w_g_avgminsxshift from w_graph_sheet_using_dw
int Height=1517
boolean TitleBar=true
string Title="Avg. Response by Shift"
string MenuName="m_graph"
end type
global w_g_avgminsxshift w_g_avgminsxshift

on w_g_avgminsxshift.create
call w_graph_sheet_using_dw::create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
end on

on w_g_avgminsxshift.destroy
call w_graph_sheet_using_dw::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from w_graph_sheet_using_dw`dw_1 within w_g_avgminsxshift
string DataObject="g_response_x_shift"
end type

