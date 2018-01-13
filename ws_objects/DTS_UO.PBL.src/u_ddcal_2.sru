$PBExportHeader$u_ddcal_2.sru
forward
global type u_ddcal_2 from userobject
end type
type cb_1 from commandbutton within u_ddcal_2
end type
type st_2 from statictext within u_ddcal_2
end type
type st_1 from statictext within u_ddcal_2
end type
type mle_ddcal from multilineedit within u_ddcal_2
end type
type p_next from picture within u_ddcal_2
end type
type p_prev from picture within u_ddcal_2
end type
type p_ddlb from picture within u_ddcal_2
end type
type sle_date from singlelineedit within u_ddcal_2
end type
type dw_cal from datawindow within u_ddcal_2
end type
end forward

global type u_ddcal_2 from userobject
integer width = 750
integer height = 816
long backcolor = 67108864
event size_open pbm_custom01
event size_closed pbm_custom02
event mousemove pbm_mousemove
cb_1 cb_1
st_2 st_2
st_1 st_1
mle_ddcal mle_ddcal
p_next p_next
p_prev p_prev
p_ddlb p_ddlb
sle_date sle_date
dw_cal dw_cal
end type
global u_ddcal_2 u_ddcal_2

type variables
Int i_old_column, nDay, nMonth, nYear
String strDateFormat = "mm/dd/yyyy"
Date iDateSelected
Integer nOpenHgt
Integer nOpenWid
Integer nClosHgt
Integer nClosWid
end variables

forward prototypes
public subroutine init_cal (date start_date)
public function integer days_in_month (integer month, integer year)
public subroutine enter_day_numbers (int start_day_num, int days_in_month)
public function integer get_month_number (string month)
public function string get_month_string (integer month)
public subroutine draw_month (int year, int month)
public subroutine set_date_format (string date_format)
end prototypes

event size_open;//Height = nOpenHgt
//Width  = nOpenWid
BringToTop = True
Resize( nOpenWid , nOpenHgt + 10 )

end event

on size_closed;//Height = nClosHgt
//Width  = nClosWid
Resize( nClosWid, nClosHgt )
BringToTop = False

end on

public subroutine init_cal (date start_date);Int nFirstDayNum, nCell, nDaysInMonth
String strYear, strMonth, strModify, strReturn
Date dFirstDay


//Insert a row into the script datawindow
InsertRow(dw_cal,0)

//Set the variables for Day, Month and Year from the date passed to
//the function
nMonth = Month(start_date)
nYear = Year(start_date)
nDay = Day(start_date)

//Find how many days in the relevant month
nDaysInMonth = days_in_month(nMonth,nYear)

//Find the date of the first day of this month
dFirstDay = Date(nYear,nMonth,1)

//What day of the week is the first day of the month
nFirstDayNum = DayNumber(dFirstDay)

//Set the starting "cell" in the datawindow. i.e the column in which
//the first day of the month will be displayed
nCell = nFirstDayNum + nDay - 1

//Set the Title of the calendar with the Month and Year
strMonth = get_month_string(nMonth) + " " + string(nYear)
dwModify(dw_cal,"st_month.text=~"" + strMonth + "~"")

//Enter the numbers of the days
enter_day_numbers(nFirstDayNum,nDaysInMonth)

//????
SetItem(dw_cal,1,nCell,String(Day(start_date)))

//Display the first day in bold (or 3D)
//strModify = "#" + string(nCell) + ".font.weight=~"700~""
strModify = "#" + string(nCell) + ".border=5"
strReturn = dwModify(dw_cal,strModify)
If strReturn <> "" then MessageBox("dwModify",strReturn)

//Set the instance variable i_old_column to hold the current cell, so
//when we change it, we know the old setting
i_old_column = nCell

end subroutine

public function integer days_in_month (integer month, integer year);//Most cases are straight forward in that there are a fixed number of 
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
//		calculation error for year of 200. comment out by MN 
//		If Mod(year,100) = 0 then
//			bLeapYear = False
//
	//If the year is not divisible by 100, but is by 4 then it is a
	//leap year

		If Mod(year,4) = 0 then 
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

public subroutine enter_day_numbers (int start_day_num, int days_in_month);Int nCount, nDayCount
string	strmodify, strReturn

//Blank the columns before the first day of the month
For nCount = 1 to start_day_num
	SetItem(dw_cal,1,nCount,"")
Next

//Set the columns for the days to the String of their Day number
For nCount = 1 to days_in_month
	//Use nDayCount to find which column needs to be set
	nDayCount = start_day_num + nCount - 1
	SetItem(dw_cal,1,nDayCount,String(nCount))
Next

//Move to next column
nDayCount = nDayCount + 1

//Blank remainder of columns
For nCount = nDayCount to 42
	SetItem(dw_cal,1,nCount,"")
Next


//If there was an old column turn off the highlight
If i_old_column <> 0 then
//	strModify = "#" + string(i_old_Column) + ".font.weight=~"400~""
	strModify = "#" + string(i_old_Column) + ".border=0"
	strReturn = dwModify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("dwModify",strReturn)
End If


i_old_column = 0


end subroutine

public function integer get_month_number (string month);Int month_number

CHOOSE CASE month
	CASE "Jan"
		month_number = 1
	CASE "Feb"
		month_number = 2
	CASE "Mar"
		month_number = 3
	CASE "Apr"
		month_number = 4
	CASE "May"
		month_number = 5
	CASE "Jun"
		month_number = 6
	CASE "Jul"
		month_number = 7
	CASE "Aug"
		month_number = 8
	CASE "Sep"
		month_number = 9
	CASE "Oct"
		month_number = 10
	CASE "Nov"
		month_number = 11
	CASE "Dec"
		month_number = 12
END CHOOSE

return month_number
end function

public function string get_month_string (integer month);String strMonth

CHOOSE CASE month
	CASE 1
		strMonth = "January"
	CASE 2
		strMonth = "February"
	CASE 3
		strMonth = "March"
	CASE 4
		strMonth = "April"
	CASE 5
		strMonth = "May"
	CASE 6
		strMonth = "June"
	CASE 7
		strMonth = "July"
	CASE 8
		strMonth = "August"
	CASE 9
		strMonth = "September"
	CASE 10
		strMonth = "October"
	CASE 11
		strMonth = "November"
	CASE 12
		strMonth = "December"
END CHOOSE

return strMonth
end function

public subroutine draw_month (int year, int month);Int nFirstDayNum, nCell, nDaysInMonth
Date dFirstDay
String strYear, strMonth, strModify, strReturn

//Set Pointer to an Hourglass and turn off redrawing of Calendar
SetPointer(Hourglass!)
SetRedraw(dw_cal,FALSE)

//Set Instance variables to arguments
nMonth = month
nYear = year

//Work out how many days in the month
nDaysInMonth = days_in_month(nMonth,nYear)

//Find the date of the first day in the month
dFirstDay = Date(nYear,nMonth,1)

//Find what day of the week this is
nFirstDayNum = DayNumber(dFirstDay)

//Set the first cell
nCell = nFirstDayNum + nDay - 1

//If there was an old column turn off the highlight
If i_old_column <> 0 then
//	strModify = "#" + string(i_old_Column) + ".font.weight=~"400~""
	strModify = "#" + string(i_old_Column) + ".border=0"
	strReturn = dwModify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("dwModify",strReturn)
End If

//Set the Title
strMonth = get_month_string(nMonth) + " " + string(nYear)
dwModify(dw_cal,"st_month.text=~"" + strMonth + "~"")

//Enter the day numbers into the datawindow
enter_day_numbers(nFirstDayNum,nDaysInMonth)

//????
SetItem(dw_cal,1,nCell,String(nDay))

//Highlight the current date
//strModify = "#" + string(nCell) + ".font.weight=~"700~""
strModify = "#" + string(nCell) + ".border=5"
strReturn = dwModify(dw_cal,strModify)
If strReturn <> "" then MessageBox("dwModify",strReturn)

//Set the old column for next time
i_old_column = nCell

//Reset the pointer and Redraw
SetPointer(Arrow!)
SetRedraw(dw_cal,TRUE)

end subroutine

public subroutine set_date_format (string date_format);strDateFormat = date_format
end subroutine

event constructor;/*
	This sets the var's used by the events size_open() and size_closed()
	in sizing the control when the calendar is not being shown so the
	user-control space doesn't block the controls or leave an ugly
	box (there should be an easier way to do this).
*/

// in case we've done someting wierd in painter we'll test for max height
//nOpenHgt = dw_cal.Height + Max( sle_date.Height, p_ddlb.Height )
nOpenHgt = dw_cal.Height + Max( sle_date.Height, p_ddlb.Height ) + 30

// starts on same pixel text ends on so -1
//nOpenWid = Max(dw_cal.Width, sle_date.Width + p_ddlb.Width - 1)
nOpenWid = dw_cal.width + 17

// both should be same size, but who knows
nClosHgt = Max( sle_date.Height+10, p_ddlb.Height+10 )

// starts on same pixel text ends on so
nClosWid = sle_date.Width + p_ddlb.Width + 10

TriggerEvent("size_closed")

end event

on u_ddcal_2.create
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.mle_ddcal=create mle_ddcal
this.p_next=create p_next
this.p_prev=create p_prev
this.p_ddlb=create p_ddlb
this.sle_date=create sle_date
this.dw_cal=create dw_cal
this.Control[]={this.cb_1,&
this.st_2,&
this.st_1,&
this.mle_ddcal,&
this.p_next,&
this.p_prev,&
this.p_ddlb,&
this.sle_date,&
this.dw_cal}
end on

on u_ddcal_2.destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_ddcal)
destroy(this.p_next)
destroy(this.p_prev)
destroy(this.p_ddlb)
destroy(this.sle_date)
destroy(this.dw_cal)
end on

type cb_1 from commandbutton within u_ddcal_2
integer x = 32
integer y = 740
integer width = 649
integer height = 64
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Cancel"
boolean cancel = true
end type

on clicked;Parent.TriggerEvent("size_closed")
end on

type st_2 from statictext within u_ddcal_2
integer x = 448
integer y = 4
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "double-click"
alignment alignment = center!
long bordercolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within u_ddcal_2
integer x = 448
integer y = 52
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "day to select"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_ddcal from multilineedit within u_ddcal_2
integer x = 466
integer y = 12
integer width = 242
integer height = 84
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 0
boolean autovscroll = true
alignment alignment = center!
borderstyle borderstyle = stylelowered!
end type

type p_next from picture within u_ddcal_2
event mousemove pbm_mousemove
string tag = "Left-Click to Increment 1 Month.  Right-click to Increment 1 Year."
boolean visible = false
integer x = 622
integer y = 140
integer width = 73
integer height = 60
boolean originalsize = true
string picturename = "next3.bmp"
end type

event mousemove;if IsValid(w_main) then 
	w_main.SetMicroHelp( This.Tag )
end if



end event

on rbuttondown;// right click adds years...not months.
//Increment the month number, but if its 13, set back to 1 (January)
nYear = nYear + 1

//Draw the month
draw_month ( nYear, nMonth )
end on

on clicked;//Increment the month number, but if its 13, set back to 1 (January)
nMonth = nMonth + 1
If nMonth = 13 then
	nMonth = 1
	nYear = nYear + 1
End If

//Draw the month
draw_month ( nYear, nMonth )
end on

type p_prev from picture within u_ddcal_2
event mousemove pbm_mousemove
string tag = "Left-Click to Decrement 1 Month.  Right-click to Decrement 1 Year."
boolean visible = false
integer x = 23
integer y = 136
integer width = 78
integer height = 64
string picturename = "prior3.bmp"
end type

event mousemove;if IsValid(w_main) then 
	w_main.SetMicroHelp( This.Tag )
end if



end event

on rbuttondown;// right click adds years...not months.
//Increment the month number, but if its 13, set back to 1 (January)
nYear = nYear - 1

//Draw the month
draw_month ( nYear, nMonth )
end on

on clicked;//Decrement the month, if 0, set to 12 (December)
nMonth = nMonth - 1
If nMonth = 0 then
	nMonth = 12
	nYear = nYear - 1
End If

//Darw the month
draw_month ( nYear, nMonth )
end on

type p_ddlb from picture within u_ddcal_2
event mousemove pbm_mousemove
string tag = "Left-Click to Open && Close the Drop-Down Calendar."
integer x = 370
integer y = 8
integer width = 73
integer height = 83
string picturename = "ddlb.bmp"
boolean border = true
boolean focusrectangle = false
end type

event clicked;
//Works as a toggle, if the DropDown is visible, make it invisible
//otherwise make it visible

date 	lDate
strdateformat = cDateFormatStr
If dw_cal.visible then
	parent.TriggerEvent("size_closed")
	dw_cal.visible = FALSE
	p_next.visible = FALSE
	p_prev.visible = FALSE
else

	//Reset the datawindow
	reset(dw_cal)

	// If there is already a date in the edit box then make this the
	// current date in the calendar, otherwise use today

	If sle_date.text = "" then
		init_cal(today())
	Else
		ldate = f_str_d_to_d(sle_date.text)
		if nDay = 0 then nDay = 1
//		lDate = date(nYear, nMonth, nDay)  // This line used for debugging
		init_cal(ldate)
//		init_cal(date(nYear, nMonth, nDay))
	End If

	dw_cal.visible = TRUE
	p_next.visible = TRUE
	p_prev.visible = TRUE

	parent.TriggerEvent("size_open")
End If
end event

type sle_date from singlelineedit within u_ddcal_2
event mousemove pbm_mousemove
string tag = "Left-click to enter the desired Date.  (This will close the Drop-Down Calendar if opened."
integer x = 9
integer y = 8
integer width = 370
integer height = 84
integer taborder = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

on losefocus;// EGM 03/04/95 if we're resetting might as well resize as well - fixes several display bugs
Parent.TriggerEvent("size_closed")

end on

on getfocus;String strModify, strReturn

// EGM 03/04/95 if we're resetting might as well resize as well - fixes several display bugs
Parent.TriggerEvent("size_closed")

//Make all components of the DropDown Invisible
dw_cal.visible = FALSE
p_next.visible = FALSE
p_prev.visible = FALSE

//????
If i_old_column <> 0 then
	strModify = "#" + string(i_old_Column) + ".font.weight=~"400~""
	strReturn = dwModify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("dwModify",strReturn)
End If


end on

type dw_cal from datawindow within u_ddcal_2
event mousemove pbm_mousemove
string tag = "Double-click the day you you would like to select."
boolean visible = false
integer x = 5
integer y = 120
integer width = 727
integer height = 608
string dataobject = "d_calendar"
end type

event mousemove;if IsValid(w_main) then 
	w_main.SetMicroHelp( This.Tag )
end if



end event

on clicked;Int nClickedColumn
String strOld, strOldNum, strDay, strModify, strReturn

//Find which column was clicked on and return if it is no valid
nClickedColumn = GetClickedColumn(dw_cal)
If nClickedColumn = 0 then Return

//Set Day to the text of the clicked column. Return if it is an
//empty column
strDay = GetItemString(dw_cal,1,nClickedColumn)
If strDay = "" then Return

//Convert to a number and place in Instance variable
nDay = Integer(strDay)

//????
SetItem(dw_cal,1,nClickedColumn,strDay)

//Highlight chosen day
//strModify = "#" + string(nClickedColumn) + ".font.weight=~"700~""
strModify = "#" + string(nClickedColumn) + ".border=5"
strReturn = dwModify(dw_cal,strModify)
If strReturn <> "" then MessageBox("dwModify",strReturn)

//If the highlight was on a previous column (i_old_column = 0)
//set the border of the old column back to normal
If i_old_column <> 0 then
//	strModify = "#" + string(i_old_Column) + ".font.weight=~"400~""
	strModify = "#" + string(i_old_Column) + ".border=0"
	strReturn = dwModify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("dwModify",strReturn)
End If

//Set the old column for next time
i_old_column = nClickedColumn

end on

on doubleclicked;Int nClickedCol, nLength
String strDay, strModify, strReturn

nClickedCol = GetClickedColumn(dw_cal)
If nClickedCol = 0 then Return

//Set the Day to the chosen column
strDay = GetItemString(dw_cal,1,nClickedCol)
nDay = Integer(strDay)

//Return the chosen date into the SingleLineEdit in the chosen format
sle_date.text = String( Date(nYear,nMonth,nDay), strDateFormat )

//If there is an old column, reset the border
If i_old_column <> 0 then
	strModify = "#" + string(nClickedCol) + ".font.weight=~"400~""
	strReturn = dwModify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("dwModify",strReturn)
End If
parent.TriggerEvent("size_closed")
//Hide the components of the DropDown
dw_cal.visible = FALSE
p_next.visible = FALSE
p_prev.visible = FALSE



end on

