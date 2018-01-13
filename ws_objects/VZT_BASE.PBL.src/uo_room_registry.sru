$PBExportHeader$uo_room_registry.sru
forward
global type uo_room_registry from userobject
end type
type st_1 from statictext within uo_room_registry
end type
end forward

global type uo_room_registry from userobject
integer width = 224
integer height = 168
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event type string ue_update_room ( )
event ue_init_vars ( )
event ue_reset_vars ( )
st_1 st_1
end type
global uo_room_registry uo_room_registry

type variables
// table vars 
string	room_code,   guest_lname,   guest_fname
string	addr1, addr2, city, state,  zip,  country, company_name
string	email, freq_guest_num,  phone
string 	adults_num
string  	arr_date  , dep_date
string	reg_code,  share1_lname,   share1_fname
string	share2_lname, share2_fname
string	share3_lname, share3_fname  
//


end variables

event type string ue_update_room();string ls_room_code, ls_guest_lname, ls_guest_fname
string ls_ret

ls_ret = 'Parm last name:"'+ guest_lname + '" parm First name: "' + guest_fname +'"'

	SELECT 
			room_code, guest_lname, guest_fname		
	INTO :ls_room_code, :ls_guest_lname, :ls_guest_fname	
	FROM room_registry
	WHERE room_code = :room_code ;
	
	ls_guest_lname = f_nvl(ls_guest_lname,'')
	ls_guest_fname = f_nvl(ls_guest_fname,'')
		
	IF guest_lname	= ls_guest_lname	AND guest_fname = ls_guest_fname THEN
		//same guest in room - no update needed
		ls_ret += ' Same Guest In Room: db last name: "'+ ls_guest_lname + '" db First name: "' + ls_guest_fname +'" '
	ELSE
		IF ISNULL( ls_room_code ) or ls_room_code='' then  
			INSERT INTO room_registry (room_code ) 
			VALUES ( :room_code ); 
			ls_ret += ' Inserted Room Registry '
		END IF 
		
		UPDATE room_registry 
		SET 
	      guest_lname = :guest_lname ,
         guest_fname = :guest_fname,   
         addr1 		= :addr1,   
         addr2			= :addr2,   
         city			= :city,   
         state			= :state,   
         zip			= :zip,   
         country		= :country,   
         company_name= :company_name,   
         email			= :email,   
         freq_guest_num=:freq_guest_num,   
         aduts_num	= :adults_num,   
         phone			= :phone,   
         date_from	= :arr_date,   
         date_to		= :dep_date,   
         reg_code		= :reg_code,   
         share1_lname= :share1_lname,   
         share1_fname= :share1_fname,   
         share2_lname= :share2_lname,   
         share2_fname= :share2_fname,   
         share3_lname= :share3_lname,   
         share3_fname= :share3_fname
   	WHERE room_code = :room_code ;
		ls_ret += ' Updated Room Registry '
	
	END IF
	If sqlca.sqlcode >= 0 then 
		COMMIT;
		ls_ret += ' Work Commited '

	ELSE
		ROLLBACK;
		ls_ret += ' ERROR: Work Rolled Back '
	END IF
return ls_ret 
end event

event ue_init_vars();//room_code 		= dw_schedule.GetItemString( il_row, "room_code") 
//guest_lname		= dw_schedule.GetItemString( il_row, "guest_lname")
//guest_fname		= dw_schedule.GetItemString( il_row, "guest_fname")
//addr1				= dw_schedule.GetItemString( il_row, "addr1")
//addr2				= dw_schedule.GetItemString( il_row, "addr2")
//city				= dw_schedule.GetItemString( il_row, "city")
//state				= dw_schedule.GetItemString( il_row, "state")
//zip				= dw_schedule.GetItemString( il_row, "zip")
//country			= dw_schedule.GetItemString( il_row, "country")
//company_name	= dw_schedule.GetItemString( il_row, "company_name")
//email				= dw_schedule.GetItemString( il_row, "email")
//freq_guest_num	= dw_schedule.GetItemString( il_row, "freq_guest_num")
//
//aduts_num		= dw_schedule.GetItemString( il_row, "aduts_num")
//aduts_num		=  MID(aduts_num, 1,1)
//	
//phone				= dw_schedule.GetItemString( il_row, "phone")
//arr_date  		= dw_schedule.GetItemString( il_row, "date_from")
//dep_date  		= dw_schedule.GetItemString( il_row, "date_to")
//reg_code			= dw_schedule.GetItemString( il_row, "reg_code")
//share1_lname	= dw_schedule.GetItemString( il_row, "share1_lname")
//share1_fname	= dw_schedule.GetItemString( il_row, "share1_fname")
//share2_lname	= dw_schedule.GetItemString( il_row, "share2_lname")
//share2_fname 	= dw_schedule.GetItemString( il_row, "share2_fname")
//share3_lname	= dw_schedule.GetItemString( il_row, "share3_lname")
//share3_fname  	= dw_schedule.GetItemString( il_row, "share3_fname")
//
end event

event ue_reset_vars();room_code 		= ''
guest_lname		= ''
guest_fname		= ''
addr1				= ''
addr2				= ''
city				= ''
state				= ''
zip				= ''
country			= ''
company_name	= ''
email				= ''
freq_guest_num	= ''

adults_num		= ''
	
phone				= ''
arr_date  		= ''
dep_date  		= ''
reg_code			= ''
share1_lname	= ''
share1_fname	= ''
share2_lname	= ''
share2_fname 	= ''
share3_lname	= ''
share3_fname  	= ''

end event

on uo_room_registry.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on uo_room_registry.destroy
destroy(this.st_1)
end on

type st_1 from statictext within uo_room_registry
integer x = 5
integer y = 4
integer width = 183
integer height = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "room registry"
boolean focusrectangle = false
end type

