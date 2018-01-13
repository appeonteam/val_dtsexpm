$PBExportHeader$n_cst_inet_result.sru
forward
global type n_cst_inet_result from internetresult
end type
end forward

global type n_cst_inet_result from internetresult
end type
global n_cst_inet_result n_cst_inet_result

type variables
blob ib_html
end variables

forward prototypes
public function integer internetdata (blob data)
end prototypes

public function integer internetdata (blob data);ib_html = data

return 1
end function

on n_cst_inet_result.create
call internetresult::create
TriggerEvent( this, "constructor" )
end on

on n_cst_inet_result.destroy
call internetresult::destroy
TriggerEvent( this, "destructor" )
end on

