$PBExportHeader$nvo_vzt_metro_appman.sru
forward
global type nvo_vzt_metro_appman from nvo_vzt_appman
end type
end forward

global type nvo_vzt_metro_appman from nvo_vzt_appman
end type
global nvo_vzt_metro_appman nvo_vzt_metro_appman

on nvo_vzt_metro_appman.create
TriggerEvent( this, "constructor" )
end on

on nvo_vzt_metro_appman.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor;is_shared_do[]={'d_dl_room'}
end event

event ue_getuserrights;//overr 
string ls_rights
gnv_appman.is_userid = cPassUserName
ls_rights = 'WR'
if npassuserrights = 9 then ls_rights = 'WRA'
return ls_rights 


end event

