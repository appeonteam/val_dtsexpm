$PBExportHeader$vzt_emailer.sra
$PBExportComments$Generated Application Object
forward
global type vzt_emailer from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global n_cst_vzt_error error
global message message
end forward

global variables
string	userid, groupid, userfirstname, userlastname
string	accessrights, qresolvenotes
string	maininifile 
string 	gstrPBINI
nvo_vzt_appman	gnv_appman
long 	npassuserrights
string	cpassusername
window	w_main

//compatibility
string cSysErrorFile = "", cappname='SmartAlec'
end variables

global type vzt_emailer from application
string appname = "vzt_emailer"
end type
global vzt_emailer vzt_emailer

on vzt_emailer.create
appname="vzt_emailer"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create n_cst_vzt_error
end on

on vzt_emailer.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gnv_appman 					= CREATE nvo_vzt_appman
application 				la_app
la_app 						= this 
gnv_appman.uf_initialize( la_app , Commandline )
gnv_appman.is_userid  	= 'batch'
gnv_appman.is_groupid 	= 'MIS'

gnv_appman.is_apptitle		= 'VZT_EMAILER'
gnv_appman.id_last_updated = date( '2006 Apr 28') 
gnv_appman.is_version		= '1.1'

//Openwithparm (w_vzt_alec_about_flash, '' )
//f_wait( 2)
//if IsValid( w_vzt_alec_about_flash) then close (w_vzt_alec_about_flash)

gnv_appman.uf_startsecurity() 

openWithParm( w_vzt_email_schedule, 'sys')
 
 
end event

event close;If IsValid( gnv_appman) then DESTROY gnv_appman


end event

