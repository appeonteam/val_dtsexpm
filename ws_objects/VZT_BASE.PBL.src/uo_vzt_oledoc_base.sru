$PBExportHeader$uo_vzt_oledoc_base.sru
forward
global type uo_vzt_oledoc_base from uo_vzt_olebase
end type
end forward

global type uo_vzt_oledoc_base from uo_vzt_olebase
end type
global uo_vzt_oledoc_base uo_vzt_oledoc_base

type variables
string is_objtype /* MS word, Excel etc */
string is_category
end variables

forward prototypes
public function integer uf_retrieve (double ad_id)
end prototypes

public function integer uf_retrieve (double ad_id);blob ole_blob
int li_rc

If f_nvl(ad_id,0) <= 0 Then return -10

//test if changes were made to the control that have not yet been saved
if uf_save_check() < 0 then return -10
 
id_ole	= f_nvl(ad_id,0)
//this will load the text and description into the sle and mle on screen
  		SELECT 	ole.descr 
    	INTO 		:is_descr
   	FROM 		vzt_ole_doc ole
   	WHERE 	ole.idauto = :ad_id   ;


if SQLCA.SQLCode = -1 then MessageBox("VZT OLE RETRIEVE SQL error -1",SQLCA.SQLErrText,Information!)

SELECTBLOB object  into :ole_blob FROM vzt_ole_doc WHERE idauto = :ad_id;

if SQLCA.SQLCode <> 0 then	MessageBox("VZT OLE BLOB RETRIEVE SQL error",SQLCA.SQLErrText,Information!)

this.objectdata = ole_blob		//assigning the blob data to the actual data control
ib_notsaved = False

return 1 
end function

on uo_vzt_oledoc_base.create
call super::create
end on

on uo_vzt_oledoc_base.destroy
call super::destroy
end on

event ue_ole_save_blob_sql;string ls_temp
 updateblob vzt_ole_doc 
 		set 	object = :ib_object
 		where idauto = :id_ole;

ls_temp = 'xx'
end event

event ue_ole_save_count_sql;string ls_temp
  SELECT count(*)  
    INTO :ii_olecount
    FROM vzt_ole_doc  
   WHERE idauto = :id_ole   ;
ls_temp = '99'
end event

event ue_ole_save_sql;string ls_temp
  INSERT INTO vzt_ole_doc  
  
      	   ( 	object,
	           	object_type,
	           	descr,
					category, 
					rand)  
					
	  VALUES (  ' ',
				  :is_objtype,
      	  		   :is_descr,
				  :is_category, 
				  :is_rand)  ;
				  
	ls_temp = 'ff'			  
	
string ls_error, ls_code

if SQLCA.SQLCode <> 0 then
	ls_error =  f_nvl(sqlca.SQLerrtext, '*')
   ls_code 	=  string( sqlca.SQLCode) 
   ROLLBACK;
	MessageBox("VZT OLE DOC Insert error",ls_error, Information!)
	return 
end if

return 




	
end event

event ue_get_inserted_id;SELECT idauto into :id_ole FROM vzt_ole_doc 
WHERE rand = :is_rand;

is_rand = is_rand
return id_ole
end event

event ue_ole_save_upd_ref;call super::ue_ole_save_upd_ref;string ls_error, ls_code
this.event ue_ole_save_upd_ref_sql () // execute actual SQL in descentant

if SQLCA.SQLCode = -1 then
	ls_error =  f_nvl(sqlca.SQLerrtext, '*')
   ls_code 	=  string( sqlca.SQLCode) 
   ROLLBACK;
	
	MessageBox("VZT OLE Update error",ls_error, Information!) 
	
	DELETE from vzt_ole_doc WHERE rand = :is_rand ;
	ls_error =  f_nvl(sqlca.SQLerrtext, '*')
	ls_code 	=  string( sqlca.SQLCode) 
	COMMIT;
	
	return -1
end if

return 1




end event

