$PBExportHeader$nvo_vzt_alec_appman.sru
forward
global type nvo_vzt_alec_appman from nvo_vzt_appman
end type
end forward

global type nvo_vzt_alec_appman from nvo_vzt_appman
end type
global nvo_vzt_alec_appman nvo_vzt_alec_appman

event ue_getuserrights;//overr 
//gnv_appman.is_userid = cPassUserName
//ls_rights = 'WR'
//if npassuserrights = 9 then 
string ls_rights
ls_rights = 'WRA'
return ls_rights 


end event

on nvo_vzt_alec_appman.create
TriggerEvent( this, "constructor" )
end on

on nvo_vzt_alec_appman.destroy
TriggerEvent( this, "destructor" )
end on

