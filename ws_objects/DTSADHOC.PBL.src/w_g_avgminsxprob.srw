$PBExportHeader$w_g_avgminsxprob.srw
forward
global type w_g_avgminsxprob from w_graph_sheet_using_dw
end type
end forward

global type w_g_avgminsxprob from w_graph_sheet_using_dw
int Height=1516
boolean TitleBar=true
string Title="Avg. Response by Task"
string MenuName="m_graph"
end type
global w_g_avgminsxprob w_g_avgminsxprob

on w_g_avgminsxprob.create
call super::create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
end on

on w_g_avgminsxprob.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from w_graph_sheet_using_dw`dw_1 within w_g_avgminsxprob
string DataObject="g_response_x_prob"
end type

