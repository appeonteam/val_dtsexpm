$PBExportHeader$u_vzt_ddcal.sru
forward
global type u_vzt_ddcal from userobject
end type
type sle_date from editmask within u_vzt_ddcal
end type
type cb_null from commandbutton within u_vzt_ddcal
end type
type cb_today from commandbutton within u_vzt_ddcal
end type
type p_1 from picture within u_vzt_ddcal
end type
type p_next from picture within u_vzt_ddcal
end type
type p_prev from picture within u_vzt_ddcal
end type
type p_ddlb from picture within u_vzt_ddcal
end type
type dw_cal from datawindow within u_vzt_ddcal
end type
end forward

global type u_vzt_ddcal from userobject
integer width = 823
integer height = 752
long backcolor = 134217728
event doubleclicked ( )
event ue_setmasks ( )
sle_date sle_date
cb_null cb_null
cb_today cb_today
p_1 p_1
p_next p_next
p_prev p_prev
p_ddlb p_ddlb
dw_cal dw_cal
end type
global u_vzt_ddcal u_vzt_ddcal

type variables
Int ii_old_column, ii_Day, ii_Month, ii_Year
String is_DateFormat = "mm/dd/yyyy"
Date id_date_selected

uo_vzt_dwbase  idw_Target
string 			is_DateCol
end variables

forward prototypes
public function int days_in_month (int month, int year)
public subroutine draw_month (int year, int month)
public subroutine enter_day_numbers (int ai_start_day_num, int ai_days_in_month)
public function int get_month_number (string as_month)
public function string get_month_string (int as_month)
public subroutine set_date_format (string as_date_format)
public subroutine init_cal (date ad_start_date)
public subroutine init (ref uo_vzt_dwbase adw_target, string as_datecol)
end prototypes

event ue_setmasks;if not IsValid( gnv_appman) then return 
if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 

this.set_date_format ( gnv_appman.is_datemask )
end event

public function int days_in_month (int month, int year);//Most cases are straight forward in that there are a fixed number of 
//days in 11 of the 12 months.  February is, of course, the problem.
//In a leap year February has 29 days, otherwise 28.

Int nDaysInMonth
Boolean bLeapYear

CHOOSE CASE month
	CASE 1, 3, 5, 7, 8, 10, 12
		nDaysInMonth = 31
	CASE 4, 6, 9, 11
		nDaysInMonth = 30
	CASE 2
	//If a year is divisible by 100 without a remainder, then it is
	//NOT a leap year

		If Mod(year,100) = 0 then
			bLeapYear = False

	//If the year is not divisible by 100, but is by 4 then it is a
	//leap year

		ElseIf Mod(year,4) = 0 then 
			bLeapYear = True

	//If neither case is true then it is not a leap year

		Else 
			bLeapYear = False
		End If

	//If it is a leap year, February has 29 days, otherwise 28

		If bLeapYear then
			nDaysInMonth = 29
		Else
			nDaysInMonth = 28
		End If

END CHOOSE

//Return the number of days in the relevant month
return nDaysInMonth
end function

public subroutine draw_month (int year, int month);Int  li_FirstDayNum, li_cell, li_daysinmonth
Date ld_firstday
String ls_month, ls_modify, ls_return

//Set Pointer to an Hourglass and turn off redrawing of Calendar
SetPointer(Hourglass!)
SetRedraw(dw_cal,FALSE)

//Set Instance variables to arguments
ii_month = month
ii_year = year

//check in the instance day is valid for month/year 
//back the day down one if invalid for month ie 31 will become 30
Do While Date(ii_year,ii_month,ii_day) = Date(00,1,1)
	ii_day --
Loop

//Work out how many days in the month
li_daysinmonth = days_in_month(ii_month,ii_year)

//Find the date of the first day in the month
ld_firstday = Date(ii_year,ii_month,1)

//Find what day of the week this is
li_FirstDayNum = DayNumber(ld_firstday)

//Set the first cell
li_cell = li_FirstDayNum + ii_day - 1

//If there was an old column turn off the highlight
If ii_old_column <> 0 then
	ls_modify = "#" + string(ii_old_Column) + ".border=0"
	ls_return = dw_cal.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

//Set the Title
ls_month = get_month_string(ii_month) + " " + string(ii_year)
dw_cal.Modify("st_month.text=~"" + ls_month + "~"")

//Enter the day numbers into the datawindow
enter_day_numbers(li_FirstDayNum,li_daysinmonth)

//????
dw_cal.SetItem(1,li_cell,String(ii_day))

//Highlight the current date
//ls_modify = "#" + string(li_cell) + ".font.weight=~"700~""
ls_modify = "#" + string(li_cell) + ".border=5"
ls_return = dw_cal.Modify(ls_modify)
If ls_return <> "" then MessageBox("Modify",ls_return)

//Set the old column for next time
ii_old_column = li_cell

//Reset the pointer and Redraw
SetPointer(Arrow!)
dw_cal.SetRedraw(TRUE)

end subroutine

public subroutine enter_day_numbers (int ai_start_day_num, int ai_days_in_month);Int li_count, li_daycount
string	ls_modify, ls_return

//Blank the columns before the first day of the month
For li_count = 1 to ai_start_day_num
	dw_cal.SetItem(1,li_count,"")
Next

//Set the columns for the days to the String of their Day number
For li_count = 1 to ai_days_in_month
	//Use li_daycount to find which column needs to be set
	li_daycount = ai_start_day_num + li_count - 1
	dw_cal.SetItem(1,li_daycount,String(li_count))
Next

//Move to next column
li_daycount = li_daycount + 1

//Blank remainder of columns
For li_count = li_daycount to 42
	dw_cal.SetItem(1,li_count,"")
Next


//If there was an old column turn off the highlight
If ii_old_column <> 0 then
	ls_modify = "#" + string(ii_old_Column) + ".border=0"
	ls_return = dw_cal.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If


ii_old_column = 0


end subroutine

public function int get_month_number (string as_month);Int li_month_number

CHOOSE CASE as_month
	CASE "Jan"
		li_month_number = 1
	CASE "Feb"
		li_month_number = 2
	CASE "Mar"
		li_month_number = 3
	CASE "Apr"
		li_month_number = 4
	CASE "May"
		li_month_number = 5
	CASE "Jun"
		li_month_number = 6
	CASE "Jul"
		li_month_number = 7
	CASE "Aug"
		li_month_number = 8
	CASE "Sep"
		li_month_number = 9
	CASE "Oct"
		li_month_number = 10
	CASE "Nov"
		li_month_number = 11
	CASE "Dec"
		li_month_number = 12
END CHOOSE

return li_month_number
end function

public function string get_month_string (int as_month);String ls_month

CHOOSE CASE as_month
	CASE 1
		ls_month = "January"
	CASE 2
		ls_month = "February"
	CASE 3
		ls_month = "March"
	CASE 4
		ls_month = "April"
	CASE 5
		ls_month = "May"
	CASE 6
		ls_month = "June"
	CASE 7
		ls_month = "July"
	CASE 8
		ls_month = "August"
	CASE 9
		ls_month = "September"
	CASE 10
		ls_month = "October"
	CASE 11
		ls_month = "November"
	CASE 12
		ls_month = "December"
END CHOOSE

return ls_month
end function

public subroutine set_date_format (string as_date_format);is_DateFormat = as_date_format
sle_date.SetMask	( DateMask!, is_DateFormat )
If not Isnull( id_date_selected) then  
	sle_date.text = string(id_date_selected, is_dateformat)
END IF
end subroutine

public subroutine init_cal (date ad_start_date);Int li_FirstDayNum, li_Cell, li_DaysInMonth
String ls_Year, ls_Month, ls_Modify, ls_Return
Date ld_FirstDay, ld_start_date
//This initializes the calendar date

If IsNull(ad_start_date ) or Year(ad_start_date) < 1800 then
  ld_start_date=today()
ELSE
	ld_start_date = ad_start_date
END IF

//Insert a row into the script datawindow
dw_cal.InsertRow(0)

//Set the variables for Day, Month and Year from the date passed to
//the function
ii_Month = Month(ld_start_date)
ii_Year 	= Year(ld_start_date)
ii_Day 	= Day(ld_start_date)

//Find how many days in the relevant month
li_daysinmonth = days_in_month(ii_month,ii_year)

//Find the date of the first day of this month
ld_FirstDay = Date(ii_Year,ii_month,1)

//What day of the week is the first day of the month
li_FirstDayNum = DayNumber(ld_FirstDay)

//Set the starting "cell" in the datawindow. i.e the column in which
//the first day of the month will be displayed
li_Cell = li_FirstDayNum + ii_Day - 1

//Set the Title of the calendar with the Month and Year
ls_Month = get_month_string(ii_Month) + " " + string(ii_Year)
dw_cal.Modify("st_month.text=~"" + ls_month + "~"")

//Enter the numbers of the days
enter_day_numbers(li_FirstDayNum, li_DaysInMonth)

dw_cal.SetItem(1,li_cell,String(Day(ld_start_date)))

//Display the first day in bold (or 3D)
ls_modify = "#" + string(li_cell) + ".border=5"
ls_return = dw_cal.Modify(ls_Modify)
If ls_return <> "" then MessageBox("Modify",ls_return)

//Set the instance variable i_old_column to hold the current cell, so
//when we change it, we know the old setting
ii_old_column = li_Cell

id_date_selected = ld_start_date
sle_date.text = String( ld_start_date, is_dateformat )

end subroutine

public subroutine init (ref uo_vzt_dwbase adw_target, string as_datecol);idw_Target	= adw_Target 
is_DateCol 	= as_DateCol
end subroutine

on u_vzt_ddcal.create
this.sle_date=create sle_date
this.cb_null=create cb_null
this.cb_today=create cb_today
this.p_1=create p_1
this.p_next=create p_next
this.p_prev=create p_prev
this.p_ddlb=create p_ddlb
this.dw_cal=create dw_cal
this.Control[]={this.sle_date,&
this.cb_null,&
this.cb_today,&
this.p_1,&
this.p_next,&
this.p_prev,&
this.p_ddlb,&
this.dw_cal}
end on

on u_vzt_ddcal.destroy
destroy(this.sle_date)
destroy(this.cb_null)
destroy(this.cb_today)
destroy(this.p_1)
destroy(this.p_next)
destroy(this.p_prev)
destroy(this.p_ddlb)
destroy(this.dw_cal)
end on

event constructor;this.event ue_setmasks()
end event

type sle_date from editmask within u_vzt_ddcal
string tag = "Left-click to enter the desired Date.  (This will close the Drop-Down Calendar if opened."
integer x = 229
integer y = 24
integer width = 334
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 134217728
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yy"
end type

type cb_null from commandbutton within u_vzt_ddcal
integer x = 590
integer y = 16
integer width = 197
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "set null"
end type

event clicked;parent.init_cal( date('1/1/1800' ))
end event

type cb_today from commandbutton within u_vzt_ddcal
integer x = 32
integer y = 16
integer width = 178
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "today"
end type

event clicked;parent.init_cal( today() )
end event

type p_1 from picture within u_vzt_ddcal
boolean visible = false
integer x = 613
integer y = 52
integer width = 78
integer height = 92
boolean enabled = false
string picturename = "ddlb.bmp"
boolean focusrectangle = false
end type

on clicked;//
////Works as a toggle, if the DropDown is visible, make it invisible
////otherwise make it visible
//
//date 	ld_date
////parent.resize(parent.width,parent.height*5)
//If dw_cal.visible then
//	dw_cal.visible = FALSE
//	p_next.visible = FALSE
//	p_prev.visible = FALSE
//else
//
//	//Reset the datawindow
//
//	reset(dw_cal)
//
//	// If there is already a date in the edit box then make this the
//	// current date in the calendar, otherwise use today
//	If ii_day = 0 Then ii_day = 1
//	ld_date = date(ii_year, ii_month, ii_day)  // This line used for debugging
//	init_cal(date(ii_year, ii_month, ii_day))
//
//
//	dw_cal.visible = TRUE
//	p_next.visible = TRUE
//	p_prev.visible = TRUE
//
//	dw_cal.setfocus()
//End If
end on

type p_next from picture within u_vzt_ddcal
integer x = 695
integer y = 108
integer width = 73
integer height = 60
boolean originalsize = true
string picturename = "nexT3.bmp"
end type

event clicked;//Increment the month number, but if its 13, set back to 1 (January)
ii_month = ii_month + 1
If ii_month = 13 then
	ii_month = 1
	ii_year = ii_year + 1
End If

//check if selected day is no longer valid for new month
If not(isdate(string(ii_month) + "/" + string(ii_day) + "/"+ string(ii_year))) Then ii_day = 1
	
//Draw the month
draw_month ( ii_year, ii_month )

//Return the chosen date into the SingleLineEdit in the chosen format
id_date_selected = date(ii_year,ii_month,ii_Day)
//sle_date.text = String( id_date_selected, ls_dateFormat )
sle_date.text = String( id_date_selected, "mmm-dd-yyyy" )
end event

type p_prev from picture within u_vzt_ddcal
integer x = 59
integer y = 108
integer width = 73
integer height = 60
boolean originalsize = true
string picturename = "prior3.bmp"
end type

event clicked;//Decrement the month, if 0, set to 12 (December)
ii_month = ii_month - 1
If ii_month = 0 then
	ii_month = 12
	ii_year = ii_year - 1
End If

//check if selected day is no longer valid for new month
If not(isdate(string(ii_month) + "/" + string(ii_day) + "/"+ string(ii_year))) Then ii_day = 1

//Darw the month
draw_month ( ii_year, ii_month )




//Return the chosen date into the SingleLineEdit in the chosen format
id_date_selected = date(ii_year,ii_month,ii_Day)
//sle_date.text = String( id_date_selected, ls_dateFormat )
sle_date.text = String( id_date_selected, "mmm-dd-yyyy" )
end event

type p_ddlb from picture within u_vzt_ddcal
boolean visible = false
integer x = 837
integer y = 36
integer width = 78
integer height = 92
boolean enabled = false
boolean originalsize = true
string picturename = "ddlb.bmp"
boolean focusrectangle = false
end type

on clicked;
//Works as a toggle, if the DropDown is visible, make it invisible
//otherwise make it visible

date 	ld_date

//If dw_cal.visible then
//	dw_cal.visible = FALSE
//	p_next.visible = FALSE
//	p_prev.visible = FALSE
//else
//
	//Reset the datawindow

	reset(dw_cal)

	// If there is already a date in the edit box then make this the
	// current date in the calendar, otherwise use today
	ii_day = 1
	ld_date = date(ii_year, ii_month, ii_day)  // This line used for debugging
	init_cal(date(ii_year, ii_month, ii_day))


	dw_cal.visible = TRUE
	p_next.visible = TRUE
	p_prev.visible = TRUE

	dw_cal.setfocus()
//End If
end on

type dw_cal from datawindow within u_vzt_ddcal
event ue_dwnkey pbm_dwnkey
integer x = 32
integer y = 96
integer width = 754
integer height = 636
integer taborder = 30
string dataobject = "d_calendar"
end type

on ue_dwnkey;//This script will allow someone to use the ctrl right arrow and
//ctrl left arrow key combinations to change the months on
//the calendar


If keydown(keyRightArrow!) and keydown(keyControl!) then
	p_next.triggerevent(clicked!)
Elseif keydown(keyLeftArrow!) and keydown(keyControl!) then
	p_prev.triggerevent(clicked!)
End If
end on

event clicked;Int li_clickedcolumn
String ls_day, ls_modify, ls_return

//Find which column was clicked on and return if it is not valid
li_clickedcolumn = dw_cal.GetClickedColumn()
If li_clickedcolumn = 0 then Return

//Set Day to the text of the clicked column. Return if it is an
//empty column
ls_day = dw_cal.GetItemString(1,li_clickedcolumn)
If ls_day = "" then Return

//Convert to a number and place in Instance variable
ii_day = Integer(ls_day)

//
dw_cal.SetItem(1,li_clickedcolumn,ls_day)

//If the highlight was on a previous column (i_old_column = 0)
//set the border of the old column back to normal
If ii_old_column <> 0 then
	ls_modify = "#" + string(ii_old_Column) + ".border=0"
	ls_return = dw_cal.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

//Highlight chosen day
ls_modify = "#" + string(li_clickedcolumn) + ".border=5"
ls_return = dw_cal.Modify(ls_modify)
If ls_return <> "" then MessageBox("Modify",ls_return)


//Set the old column for next time
ii_old_column = li_clickedcolumn


//Return the chosen date into the SingleLineEdit in the chosen format
id_date_selected = date(ii_year,ii_month,ii_Day)
sle_date.text = String( id_date_selected, is_dateFormat)


end event

event doubleclicked;Int li_nclickedcol
String ls_day, ls_modify, ls_return

li_nclickedcol = dw_cal.GetClickedColumn()
If li_nclickedcol = 0 then Return

//Set the Day to the chosen column
ls_day = dw_cal.GetItemString(1,li_nclickedcol)
ii_day = Integer(ls_day)

//Return the chosen date into the SingleLineEdit in the chosen format
id_date_selected = date(ii_year,ii_month,ii_Day)
sle_date.text = String( id_date_selected, is_dateFormat )

parent.event doubleclicked()
end event

