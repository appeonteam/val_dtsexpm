$PBExportHeader$uo_vzt_olebase.sru
forward
global type uo_vzt_olebase from olecontrol
end type
end forward

global type uo_vzt_olebase from olecontrol
integer width = 992
integer height = 736
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "uo_vzt_olebase.udo"
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
event type integer ue_loadobj ( )
event type integer ue_loadfile ( )
event type integer ue_paste ( )
event type integer ue_pastespecial ( )
event type integer ue_pastelink ( )
event type integer ue_savetodb ( )
event type integer ue_retrieve ( double ad_oleid )
event ue_ole_save_sql ( )
event ue_ole_save_blob_sql ( )
event ue_ole_save_count_sql ( )
event type double ue_get_inserted_id ( )
event type integer ue_ole_save_upd_ref ( )
event ue_ole_save_upd_ref_sql ( )
end type
global uo_vzt_olebase uo_vzt_olebase

type variables
omactivatetype	i_acttype=OffSite! // InPlace! //(offsite!)
string	is_title, is_descr, is_rand
double	id_ole
boolean	ib_notsaved, ib_prompt_save=true
integer  ii_olecount
blob 		ib_object
end variables

forward prototypes
public function integer uf_activate (omactivatetype aat_type)
public function integer uf_save ()
public function integer uf_loadfile ()
public function integer uf_loadobj ()
public function integer uf_paste ()
public function integer uf_pastelink ()
public function integer uf_pastespecial ()
public function integer uf_retrieve (double ad_id)
public function integer uf_save (double ad_oleid)
public function integer uf_savefile (string as_filename)
public function integer uf_loadfile (string as_file)
public function integer uf_save_check ()
end prototypes

event ue_loadobj;return this.uf_loadobj()
end event

event ue_loadfile;return this.uf_loadfile()
end event

event ue_paste;return this.uf_paste()
end event

event ue_pastespecial;return this.uf_pastespecial()
end event

event ue_pastelink;return this.uf_pastelink()
end event

event ue_savetodb;return this.uf_save()
end event

event ue_retrieve;return this.uf_retrieve( ad_oleid )
end event

event ue_ole_save_sql();  INSERT INTO ole  
      	   ( 	idauto,   id ,
					object,
	           	description )  
	  VALUES ( :id_ole,   :is_title,
					' ',
      	     :is_descr )  ;
				  
				  
end event

event ue_ole_save_blob_sql(); updateblob ole 
 		set 	object = :ib_object
 		where idauto = :id_ole;

end event

event ue_ole_save_count_sql();  SELECT count(*)  
    INTO :ii_olecount
    FROM ole  
   WHERE ole.idauto = :id_ole   ;

end event

event type double ue_get_inserted_id();return 0
end event

event type integer ue_ole_save_upd_ref();return 1 //default
end event

public function integer uf_activate (omactivatetype aat_type);//Activate the control
If this.activate(aat_Type) <> 0 Then
	Messagebox("VZT OLE Activate","Unable to Activate")
	Return -1
End If

Return 1

end function

public function integer uf_save ();int 		li_rc

string 	ls_error, ls_code

//get the data from the ole control
ib_object = this.objectdata
//MessageBox('OLe', string(id_ole) )
//check if id already exists 
If id_ole > 0 then 
  this.event ue_ole_save_count_sql ()
//  SELECT count(*)  
//    INTO :li_rc
//    FROM ole  
//   WHERE ole.idauto = :id_ole   ;
END IF 

//insert a new row if this is a new title
If ii_olecount = 0 or id_ole = 0 Then
	//add the title, desc to the database 
	is_rand = f_random_string( 20) 
	this.event ue_ole_save_sql ()
//	  INSERT INTO ole  
//      	   ( 	idauto,   id ,
//					object,
//	           	description )  
//	  VALUES ( :id_ole,   :is_title,
//					' ',
//      	     :is_descr )  ;
//
	If sqlca.SQLCode <> 0 Then        
 		ls_error =  sqlca.SQLerrtext
      ls_code 	=  string( sqlca.SQLCode) 
      ROLLBACK;
      MessageBox('VZT Database Error', 'Failed to insert OLE record.~r~n~r~nCode:'+ls_code+'~r~nMessage:'+ls_error)
      return -1
	ELSE
		this.event ue_get_inserted_id ()
	End If
End IF // no insert for existing objects

//sqlca.autocommit = TRUE
//update the row just inserted adding the blob ole control now
 this.event ue_ole_save_blob_sql ()
// updateblob ole 
// 		set 	object = :lb_object
// 		where idauto = :id_ole;
//
if SQLCA.SQLCode = -1 then
	ls_error =  sqlca.SQLerrtext
   ls_code 	=  string( sqlca.SQLCode) 
   ROLLBACK;
	MessageBox("VZT OLE Update error",SQLCA.SQLErrText,Information!)
	return -1
end if

if this.event ue_ole_save_upd_ref () < 0 then
	ROLLBACK;
	return -1
END IF

commit;

//reset control features
//sle_title.displayonly = True
//mle_desc.displayonly = True
//this.title = sle_title.text
ib_notsaved = false

//sqlca.autocommit = FALSE
//have menu selection reflect changes
//dw_ole.reset()
//dw_ole.retrieve()

return 0
end function

public function integer uf_loadfile ();string 	ls_path, ls_filename

if uf_save_check() < 0 then return -10

GetFileOpenName("select file to open",ls_path,ls_filename)

If ls_filename ="" Then return 0

If this.insertfile(ls_path) = 0 Then
	ib_notsaved = true
End If

return 1
end function

public function integer uf_loadobj ();string ls_typename

if uf_save_check() < 0 then return -10

// Using the ole funtion insertobject() the user will
// be prompted from a listing for avialable ole servers on their system.
// The ole control will then be loaded with a blank ole object of that type.
If this.insertobject( ) = 0 Then
	ib_notsaved = true
End If
return 1
end function

public function integer uf_paste ();int li_rc, li_rc2

if uf_save_check() < 0 then return -10

//copies the data in the clipboard to the ole control
li_rc = this.paste( ) 
If li_rc <> 0 Then Messagebox("Paste","The contents was not copied to the OLE control")
 
ib_notsaved = true
return 1
end function

public function integer uf_pastelink ();int li_rc, li_rc2

if uf_save_check() < 0 then return -10

//copy the contents to the ole control.. The server application must be running

li_rc = this.pastelink() 
If li_rc <> 0 Then Messagebox("Paste Link","The contents was not linked to the OLE control")
 
ib_notsaved = true

return 1
end function

public function integer uf_pastespecial ();int li_rc, li_rc2

if uf_save_check() < 0 then return -10

//paste special allows the user to determine if when the object is pasted in the ole
//control whether it will be embeded or linked.
li_rc = this.pastespecial() 
If li_rc <> 0 Then Messagebox("Paste Special","The contents was not copied to the OLE control")

ib_notsaved = true
return 1
end function

public function integer uf_retrieve (double ad_id);blob ole_blob
int li_rc

If f_nvl(ad_id,0) <= 0 Then return -10
if uf_save_check() < 0 then return -10
 
id_ole	= f_nvl(ad_id,0)
//this will load the text and description into the sle and mle on screen
  		SELECT 	ole.id,   
  					ole.description  
    	INTO 		:is_title, 
	 				:is_descr
   	FROM 		ole  
   	WHERE 	ole.idauto = :ad_id   ;


if SQLCA.SQLCode = -1 then MessageBox("VZT OLE RETRIEVE SQL error -1",SQLCA.SQLErrText,Information!)

SELECTBLOB object  into :ole_blob FROM ole WHERE idauto = :ad_id;

if SQLCA.SQLCode <> 0 then	MessageBox("VZT OLE BLOB RETRIEVE SQL error",SQLCA.SQLErrText,Information!)

this.objectdata = ole_blob		//assigning the blob data to the actual data control
ib_notsaved = False

return 1 
end function

public function integer uf_save (double ad_oleid);id_ole = ad_oleid
return this.uf_save()
end function

public function integer uf_savefile (string as_filename);int 		li_rc, li_FileNum 
blob 		lb_object, lb_part
string 	ls_error, ls_code
long		ll_len, ll_start, ll_limit
boolean	lb_doit=true
//get the data from the ole control
lb_object = this.objectdata

li_FileNum = FileOpen( as_filename, StreamMode!, Write!, Shared!, Replace!)

If li_FileNum < 0 then 
	MessageBox('OLE Save Error', 'Could not open file: '+as_filename ) 
	return -1
END IF

ll_limit = 32765 

If  LEN ( lb_object ) > ll_limit then 
	ll_start = 1
	lb_part 	= BLOBMID( lb_object , ll_start, ll_limit ) 
	lb_object= BLOBMID( lb_object , ll_start + ll_limit ) // the rest 
ELSE
	lb_part 	= lb_object 
	lb_object= BLOB('')
END IF 

DO WHILE lb_doit 
	li_rc = FileWrite(li_FileNum, lb_part ) 
	If li_rc < 0 then 
		MessageBox('OLE Write Error', 'Could not write file: '+as_filename ) 
		FileClose(li_FileNum)
		return -1
	END IF
	If  LEN ( lb_object ) > ll_limit then 
		lb_part 	= BLOBMID( lb_object , 1, ll_limit ) 
		lb_object= BLOBMID( lb_object , 1 + ll_limit ) // the rest 
	ELSEif LEN ( lb_object ) > 0 then 
		lb_part 	= lb_object 
		lb_object= BLOB('')
	ELSE 
		lb_doit = false
	END IF 
LOOP

li_rc = FileClose(li_FileNum)
If li_rc < 0 then 
	MessageBox('OLE Write Error', 'Could not close file: '+as_filename ) 
	FileClose(li_FileNum)
	return -1
END IF

return 0

end function

public function integer uf_loadfile (string as_file);string 	ls_path, ls_filename
int 		li_rc, 	li_rc2

if not FileExists (as_file) then 
	Messagebox("OLE loadfile error","File "+as_file+" does not exist.")
	return -10
end if

If this.insertfile(as_file) = 0 Then
	ib_notsaved = true
End If

return 1
end function

public function integer uf_save_check ();int li_rc, li_rc2 
If ib_notsaved and ib_prompt_save Then 
	li_rc = Messagebox("The current OLE Object has changed","Do you want to save?",Question!,YESNOCancel!)
	If li_rc = 1 Then li_rc2 = uf_save()
	If li_rc2 = -1 or li_rc = 3 Then Return -10
End If
return 1
end function

event doubleclicked;this.uf_activate(i_acttype)
end event

on uo_vzt_olebase.create
end on

on uo_vzt_olebase.destroy
end on


Start of PowerBuilder Binary Data Section : Do NOT Edit
08uo_vzt_olebase.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18uo_vzt_olebase.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
