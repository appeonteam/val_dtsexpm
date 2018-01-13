$PBExportHeader$u_secondtrans.sru
forward
global type u_secondtrans from transaction
end type
end forward

global type u_secondtrans from transaction
end type
global u_secondtrans u_secondtrans

forward prototypes
public function integer uof_init ()
end prototypes

public function integer uof_init ();
this.dbms        = sqlca.dbms
this.database    = sqlca.database 
this.userid      = sqlca.userid
this.logid       = sqlca.logid
this.servername  = sqlca.servername
this.logpass     = sqlca.logpass
this.dbpass      = sqlca.dbpass
this.dbparm      = sqlca.dbparm 
 
  
Connect using this;
IF this.SqlCode <> 0 THEN
   MEssagebox("Connection Error :","Unable to connect to database ~n"+this.sqlerrtext)
	return - 1
END IF


IF cappdbtype = 'MSSQL' THEN
   execute immediate "set quoted_identifier on" using this;
END IF
	
return 1
end function

on u_secondtrans.create
call transaction::create
TriggerEvent( this, "constructor" )
end on

on u_secondtrans.destroy
call transaction::destroy
TriggerEvent( this, "destructor" )
end on

event destructor;disconnect using this;
end event

