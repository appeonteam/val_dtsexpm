$PBExportHeader$uo_vzt_dates.sru
forward
global type uo_vzt_dates from nonvisualobject
end type
end forward

global type uo_vzt_dates from nonvisualobject
end type
global uo_vzt_dates uo_vzt_dates

type variables
int	ii_new_month, ii_weekday_parm
int 	ii_day, ii_year, ii_month , ii_weekday
string	is_weekday
datetime 	idt_datetime, idt_result
date	idt_date


end variables

forward prototypes
public function datetime of_bom (datetime adt_datetime, integer ai_delta)
public subroutine of_setvars (datetime adt_datetime, integer ai_mdelta, integer ai_wdelta)
public function datetime of_eom (datetime adt_datetime, integer ai_delta)
public function datetime of_dow (datetime adt_datetime, integer ai_delta, string as_day)
public function integer of_getdelta (string as_repl)
end prototypes

public function datetime of_bom (datetime adt_datetime, integer ai_delta);of_setvars( adt_datetime, ai_delta, 0) 
idt_result = datetime( date(string(ii_new_month) +"/01/"+string(ii_year)) , now()) 
return idt_result 
end function

public subroutine of_setvars (datetime adt_datetime, integer ai_mdelta, integer ai_wdelta);if Not year( date( adt_datetime)) < 1800 then adt_datetime= f_sysdate()
idt_date = date( adt_datetime)

ii_day		= day( idt_date  )
ii_year		= year(idt_date  )
ii_month 	= month(idt_date  )
ii_weekday 	= DayNumber ( idt_date )
is_weekday 	= DayName ( idt_date )

ii_new_month = ii_month + ai_mdelta 

if ii_new_month > 12 then
	ii_new_month = ii_new_month - 12 
	ii_year = ii_year + 1 // next year
End If
if ii_new_month <=  0 then // went back to prev year
	ii_new_month = ii_new_month + 12 
	ii_year = ii_year - 1 
end if 

end subroutine

public function datetime of_eom (datetime adt_datetime, integer ai_delta);of_setvars( adt_datetime, ai_delta, 0) 
ii_new_month = ii_month + ai_delta + 1 //add one since we go back a day

if ii_new_month > 12 then
	ii_new_month = ii_new_month - 12 
	ii_year = ii_year + 1 // next year
End If
if ii_new_month <=  0 then // went back to prev year
	ii_new_month = ii_new_month + 12 
	ii_year = ii_year - 1 
end if 

idt_result = datetime( RelativeDate( date(string(ii_new_month) +"/01/"+string(ii_year)) , -1 ), now()) 

return idt_result 
end function

public function datetime of_dow (datetime adt_datetime, integer ai_delta, string as_day);of_setvars( adt_datetime, 0, 0) 
int li_offset

If 		as_day = 'SUN' then 
			ii_weekday_parm = 1
Elseif 	as_day = 'MON' then 
			ii_weekday_parm = 2
Elseif  	as_day = 'TUE' then 
			ii_weekday_parm = 3
Elseif 	as_day = 'WED' then 
			ii_weekday_parm = 4
Elseif 	as_day = 'THU' then 
			ii_weekday_parm = 5
Elseif 	as_day = 'FRI' then 
			ii_weekday_parm = 6
Elseif 	as_day = 'SAT' then 
			ii_weekday_parm = 7
END IF 

li_offset = ii_weekday_parm - ii_weekday 
li_offset = (ai_delta * 7) + li_offset 

idt_result = datetime( RelativeDate( idt_date , li_offset ), now()) 

return idt_result 
end function

public function integer of_getdelta (string as_repl);int li_delta, li_start
string ls_num1, ls_num2 

li_delta = 0
ls_num1=''
ls_num2=''

if not len(as_repl) < 1 then return 0
ls_num1 = MID( as_repl, len(as_repl), 1) 
if len(as_repl) >= 1 then 
	ls_num1 = MID( as_repl, len(as_repl), 1) 
	if not IsNumber(ls_num1 ) then return 0
end if
if len(as_repl) >= 2 then 
	ls_num2 =  MID( as_repl, len(as_repl)-1, 1)
	if IsNumber( ls_num2) then ls_num1 = ls_num2 + ls_num1 // add on left
end if 
if len(as_repl) >= 3 then 
	ls_num2 =  MID( as_repl, len(as_repl)-2, 1)
	if IsNumber( ls_num2) then ls_num1 = ls_num2 + ls_num1 // add on left
end if 

if IsNumber(ls_num1) then li_delta = integer ( ls_num1 ) 

return li_delta 
end function

on uo_vzt_dates.create
TriggerEvent( this, "constructor" )
end on

on uo_vzt_dates.destroy
TriggerEvent( this, "destructor" )
end on

