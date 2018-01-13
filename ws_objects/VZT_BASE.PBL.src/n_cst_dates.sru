$PBExportHeader$n_cst_dates.sru
forward
global type n_cst_dates from nonvisualobject
end type
end forward

global type n_cst_dates from nonvisualobject
end type
global n_cst_dates n_cst_dates

forward prototypes
public function datetime of_bom (integer ai_month, integer ai_delta, integer ai_year)
public function datetime of_eom (integer ai_month, integer ai_delta, integer ai_year)
end prototypes

public function datetime of_bom (integer ai_month, integer ai_delta, integer ai_year);datetime ldt_result 
int		li_new_month

li_new_month = ai_month + ai_delta 

if li_new_month > 12 then
	li_new_month = li_new_month - 12 
	ai_year = ai_year + 1 // next year
End If
if li_new_month <=  0 then // went back to prev year
	li_new_month = li_new_month + 12 
	ai_year = ai_year - 1 
end if 
ldt_result = datetime( date(string(li_new_month) +"/01/"+string(ai_year)) , now()) 

return ldt_result 
end function

public function datetime of_eom (integer ai_month, integer ai_delta, integer ai_year);datetime ldt_result 
int		li_new_month

li_new_month = ai_month + ai_delta + 1 //add one since we go back a day

if li_new_month > 12 then
	li_new_month = li_new_month - 12 
	ai_year = ai_year + 1 // next year
End If
if li_new_month <=  0 then // went back to prev year
	li_new_month = li_new_month + 12 
	ai_year = ai_year - 1 
end if 
ldt_result = datetime( RelativeDate( date(string(li_new_month) +"/01/"+string(ai_year)) , -1 ), now()) 

return ldt_result 
end function

on n_cst_dates.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dates.destroy
TriggerEvent( this, "destructor" )
end on

