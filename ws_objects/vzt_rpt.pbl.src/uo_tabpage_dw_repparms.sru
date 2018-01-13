$PBExportHeader$uo_tabpage_dw_repparms.sru
forward
global type uo_tabpage_dw_repparms from uo_tabpage_dw
end type
end forward

global type uo_tabpage_dw_repparms from uo_tabpage_dw
int Width=2439
int Height=1338
string PictureName="scriptyes!"
string Text="Report Definition"
end type
global uo_tabpage_dw_repparms uo_tabpage_dw_repparms

on uo_tabpage_dw_repparms.create
call super::create
end on

on uo_tabpage_dw_repparms.destroy
call super::destroy
end on

type dw_1 from uo_tabpage_dw`dw_1 within uo_tabpage_dw_repparms
int Y=19
int Width=2410
int Height=1283
boolean BringToTop=true
string DataObject="d_parms_03"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

event dw_1::constructor;call super::constructor;fkeycols[1]="reportid"
end event

event dw_1::ue_update_keys_on_new;If UpperBound( fkeyvals[]) > 0 then this.setitem( row ,fkeycols[1], fkeyvals[1])
return 1

end event

event dw_1::clicked;call super::clicked;if row <=0 or row > this.RowCount() then return 

CHOOSE CASE dwo.name 
	CASE 'b_search'
		string ls_lookuptype, ls_lookupprocessor
		ls_lookuptype 			= this.object.lookuptype [row] 
		ls_lookupprocessor 	= this.object.lookupprocessor [row] 
		CHOOSE CASE ls_lookuptype 
			CASE 'DDDW'
			CASE 'WINDOW'	
				
		END CHOOSE
END CHOOSE
end event

event dw_1::buttonclicked;string ls_parmtype, ls_lookuptype, ls_lookupprocessor,ls_parmvalue, ls_newvalue, ls_autoreplace
window  lw_processor
DataWindowChild  dwchild
str_reporter_reportparms  istr_parms
If row <= 0 or row > this.RowCount() then return
If this.accepttext() <> 1 then return 

ls_parmtype 			= trim( this.object.parmtype 	[row] )
ls_lookuptype 			= this.object.lookuptype 		[row] 
ls_lookupprocessor 	= this.object.lookupprocessor [row] 
ls_autoreplace			= UPPER( this.object.autoreplace	[row] )

// get current value
CHOOSE CASE ls_parmtype 
	CASE 'DATE'
		ls_parmvalue = string( this.object.parmdate [row],"mmm-dd-yyyy" )
		if ls_autoreplace	= 'Y' then 
			ls_lookupprocessor 	= 'w_replace_lookup' 			
			ls_lookuptype 			= 'WINDOW'
		END IF
	CASE 'STRING'
		ls_parmvalue = this.object.parmvalue [row] 
	CASE 'NUMBER'
		ls_parmvalue = string( this.object.parnumber [row] )
		 
END CHOOSE

if ls_lookupprocessor = '' or isNull (ls_lookupprocessor) then return 

CHOOSE CASE ls_lookuptype 	
	CASE 'DDDW'
      
   CASE 'WINDOW'
	   OpenWithParm(lw_processor, ls_parmvalue , ls_lookupprocessor )
	CASE ELSE
		return
END CHOOSE


ls_newvalue = message.stringparm 
If ls_newvalue =  "CANCEL" then
    return
Else
	CHOOSE CASE ls_parmtype 
		CASE 'DATE'
			if ls_autoreplace	= 'Y' then 
			   this.object.replacetype [row] = TRIM(UPPER(ls_newvalue ))
			Else
			   this.object.parmdate [row] = datetime( date( ls_newvalue ), time("00:00 AM") )
			END IF
		CASE 'STRING'
			this.object.parmvalue [row] = ls_newvalue 
		CASE 'NUMBER'
			If IsNumber( ls_newvalue ) then this.object.parmnumber [row] = dec( ls_newvalue ) 
	END CHOOSE
End If


end event

