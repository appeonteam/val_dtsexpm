$PBExportHeader$n_cst_vzt_tran.sru
forward
global type n_cst_vzt_tran from transaction
end type
end forward

global type n_cst_vzt_tran from transaction
end type
global n_cst_vzt_tran n_cst_vzt_tran

type prototypes
//function integer get_event_XML( ref string vEvent, string in_wait_mode, &
//string in_commit_inside) 		&
//RPCFUNC ALIAS FOR "~"BUSINESS_EVENT_EXT~".~"get_event_xml~"" 

function string METRO_GET_EVENT (ref string vEvent) &
RPCFUNC ALIAS FOR "~"METRO_GET_EVENT~"" 

//v3_hotel1
//function integer METRO_GET_EVENT (ref string vEvent) &
//RPCFUNC ALIAS FOR "~"v3_hotel1~".~"METRO_GET_EVENT~"" 


end prototypes

on n_cst_vzt_tran.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_vzt_tran.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

