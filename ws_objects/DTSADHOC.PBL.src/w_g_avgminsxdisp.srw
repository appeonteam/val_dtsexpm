$PBExportHeader$w_g_avgminsxdisp.srw
forward
global type w_g_avgminsxdisp from w_graph_sheet_using_dw
end type
end forward

global type w_g_avgminsxdisp from w_graph_sheet_using_dw
int Height=1517
boolean TitleBar=true
string Title="Avg. Response by Dispatcher"
string MenuName="m_graph"
end type
global w_g_avgminsxdisp w_g_avgminsxdisp

on w_g_avgminsxdisp.create
call w_graph_sheet_using_dw::create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
end on

on w_g_avgminsxdisp.destroy
call w_graph_sheet_using_dw::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from w_graph_sheet_using_dw`dw_1 within w_g_avgminsxdisp
string DataObject="g_response_x_disp"
end type

