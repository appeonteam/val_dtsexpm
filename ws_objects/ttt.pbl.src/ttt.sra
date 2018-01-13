$PBExportHeader$ttt.sra
$PBExportComments$Generated Application Object
forward
global type ttt from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type ttt from application
string appname = "ttt"
end type
global ttt ttt

on ttt.create
appname = "ttt"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on ttt.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

