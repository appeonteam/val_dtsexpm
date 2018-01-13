$PBExportHeader$u_ddcal.sru
forward
global type u_ddcal from UserObject
end type
type sle_date from editmask within u_ddcal
end type
type cb_1 from commandbutton within u_ddcal
end type
type st_2 from statictext within u_ddcal
end type
type st_1 from statictext within u_ddcal
end type
type mle_ddcal from multilineedit within u_ddcal
end type
type p_next from picture within u_ddcal
end type
type p_prev from picture within u_ddcal
end type
type p_ddlb from picture within u_ddcal
end type
type sle_date1 from singlelineedit within u_ddcal
end type
type dw_cal from datawindow within u_ddcal
end type
end forward

global type u_ddcal from UserObject
int Width=736
int Height=800
long BackColor=12632256
long PictureMaskColor=25166016
long TabBackColor=67108864
event size_open pbm_custom01
event size_closed pbm_custom02
event mousemove pbm_mousemove
event ue_setmasks ( )
sle_date sle_date
cb_1 cb_1
st_2 st_2
st_1 st_1
mle_ddcal mle_ddcal
p_next p_next
p_prev p_prev
p_ddlb p_ddlb
sle_date1 sle_date1
dw_cal dw_cal
end type
global u_ddcal u_ddcal

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
public subroutine enter_day_numbers (integer start_day_num, integer days_in_month)
public function integer get_month_number (string month)
public function string get_month_string (integer month)
public subroutine draw_month (integer year, integer month)
public subroutine set_date_format (string date_format)
public function date getselecteddate ()
end prototypes

on size_open;//Height = nOpenHgt
//Width  = nOpenWid
BringToTop = True
Resize( nOpenWid , nOpenHgt )

end on

on size_closed;//Height = nClosHgt
//Width  = nClosWid
Resize( nClosWid, nClosHgt )
BringToTop = False

end on

event mousemove;// Does the user have the left mouse button down?
//If Message.WordParm = 1 Then

If flags = 1 then 
	// left button is down, set MicroHelp()
if isValid( w_main) then w_main.SetMicroHelp( This.Tag )
End If

end event

event ue_setmasks;if not IsValid( gnv_appman) then return 
if f_nvl(gnv_appman.is_datemask ,'') = ''  then return 

this.set_date_format ( gnv_appman.is_datemask )
end event

public subroutine init_cal (date start_date);Int nFirstDayNum, nCell, nDaysInMonth
String strYear, strMonth, strModify, strReturn
Date dFirstDay


//Insert a row into the script datawindow
InsertRow(dw_cal,0)

//Set the variables for Day, Month and Year from the date passed to
//the function
nMonth 	= Month(start_date)
nYear 	= Year(start_date)
nDay 		= Day(start_date)

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
Modify(dw_cal,"st_month.text=~"" + strMonth + "~"")

//Enter the numbers of the days
enter_day_numbers(nFirstDayNum,nDaysInMonth)

//????
SetItem(dw_cal,1,nCell,String(Day(start_date)))

//Display the first day in bold (or 3D)
//strModify = "#" + string(nCell) + ".font.weight=~"700~""
strModify = "#" + string(nCell) + ".border=5"
strReturn = Modify(dw_cal,strModify)
If strReturn <> "" then MessageBox("Modify",strReturn)

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

public subroutine enter_day_numbers (integer start_day_num, integer days_in_month);Int nCount, nDayCount
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
	strReturn = Modify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("Modify",strReturn)
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

public subroutine draw_month (integer year, integer month);Int nFirstDayNum, nCell, nDaysInMonth
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
	strReturn = Modify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("Modify",strReturn)
End If

//Set the Title
strMonth = get_month_string(nMonth) + " " + string(nYear)
Modify(dw_cal,"st_month.text=~"" + strMonth + "~"")

//Enter the day numbers into the datawindow
enter_day_numbers(nFirstDayNum,nDaysInMonth)

//????
SetItem(dw_cal,1,nCell,String(nDay))

//Highlight the current date
//strModify = "#" + string(nCell) + ".font.weight=~"700~""
strModify = "#" + string(nCell) + ".border=5"
strReturn = Modify(dw_cal,strModify)
If strReturn <> "" then MessageBox("Modify",strReturn)

//Set the old column for next time
i_old_column = nCell

//Reset the pointer and Redraw
SetPointer(Arrow!)
SetRedraw(dw_cal,TRUE)

end subroutine

public subroutine set_date_format (string date_format);strDateFormat = date_format

If gnv_appman.is_debugmode = 'Y' then
	MessageBox('Date Format', strDateFormat )
End IF
sle_date.SetMask	( DateMask!, strDateFormat )
If not Isnull( iDateSelected) and year(iDateSelected) > 1950 then  
	sle_date.text = string(iDateSelected, strDateFormat )
else
//	sle_date.text = '00/00/00'
END IF
end subroutine

public function date getselecteddate ();date ldt_ret
sle_date.GetData( ldt_ret )
return ldt_ret
end function

event constructor;// Set the mask 
this.event ue_setmasks()
/*
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
nClosHgt = Max( sle_date.Height, p_ddlb.Height )

// starts on same pixel text ends on so
nClosWid = sle_date.Width + p_ddlb.Width + 10

TriggerEvent("size_closed")


end event

on u_ddcal.create
this.sle_date=create sle_date
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.mle_ddcal=create mle_ddcal
this.p_next=create p_next
this.p_prev=create p_prev
this.p_ddlb=create p_ddlb
this.sle_date1=create sle_date1
this.dw_cal=create dw_cal
this.Control[]={this.sle_date,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.mle_ddcal,&
this.p_next,&
this.p_prev,&
this.p_ddlb,&
this.sle_date1,&
this.dw_cal}
end on

on u_ddcal.destroy
destroy(this.sle_date)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_ddcal)
destroy(this.p_next)
destroy(this.p_prev)
destroy(this.p_ddlb)
destroy(this.sle_date1)
destroy(this.dw_cal)
end on

type sle_date from editmask within u_ddcal
int X=9
int Y=12
int Width=334
int Height=84
int TabOrder=11
string Tag="Left-click to enter the desired Date.  (This will close the Drop-Down Calendar if opened."
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within u_ddcal
int X=32
int Y=732
int Width=649
int Height=60
string Text="Cancel"
boolean Cancel=true
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;Parent.TriggerEvent("size_closed")
end on

type st_2 from statictext within u_ddcal
int X=471
int Y=16
int Width=238
int Height=44
boolean Enabled=false
string Text="Double-click"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65280
long BackColor=0
int TextSize=-6
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within u_ddcal
int X=466
int Y=48
int Width=242
int Height=44
boolean Enabled=false
string Text="day to select."
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65280
long BackColor=0
int TextSize=-6
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_ddcal from multilineedit within u_ddcal
int X=466
int Y=12
int Width=242
int Height=84
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
boolean AutoVScroll=true
long TextColor=8388608
long BackColor=0
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p_next from picture within u_ddcal
event mousemove pbm_mousemove
int X=622
int Y=124
int Width=73
int Height=60
boolean Visible=false
string Tag="Left-Click to Increment 1 Month.  Right-click to Increment 1 Year."
string PictureName="next1.bmp"
boolean OriginalSize=true
end type

event mousemove;if isValid(w_main) then w_main.SetMicroHelp( This.Tag )

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

type p_prev from picture within u_ddcal
event mousemove pbm_mousemove
int X=23
int Y=128
int Width=78
int Height=64
boolean Visible=false
string Tag="Left-Click to Decrement 1 Month.  Right-click to Decrement 1 Year."
string PictureName="prior1.bmp"
end type

event mousemove;if isValid(w_main) then w_main.SetMicroHelp( This.Tag )

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

type p_ddlb from picture within u_ddcal
event mousemove pbm_mousemove
int X=347
int Y=12
int Width=73
int Height=92
string Tag="Left-Click to Open && Close the Drop-Down Calendar."
string PictureName="ddlb.bmp"
boolean Border=true
boolean FocusRectangle=false
end type

event clicked;
//Works as a toggle, if the DropDown is visible, make it invisible
//otherwise make it visible
string ls_text
date 	lDate

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
	ls_text = sle_date.text 
	If ls_text = "00/00/0000" or ls_text = "00/00/00" or ls_text = '01/01/1900' then
		init_cal(today())
	Else
		sle_date.GetData( ldate ) // get the date value, not string
		If year(ldate ) < 1950 then 
			ldate = today()
			init_cal(today())
		END IF 
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

type sle_date1 from singlelineedit within u_ddcal
event mousemove pbm_mousemove
int X=178
int Y=492
int Width=334
int Height=84
int TabOrder=1
boolean Visible=false
string Tag="Left-click to enter the desired Date.  (This will close the Drop-Down Calendar if opened."
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on losefocus;// EGM 03/04/95 if we're resetting might as well resize as well - fixes several display bugs
Parent.TriggerEvent("size_closed")

end on

event getfocus;String strModify, strReturn

// EGM 03/04/95 if we're resetting might as well resize as well - fixes several display bugs
Parent.TriggerEvent("size_closed")

//Make all components of the DropDown Invisible
dw_cal.visible = FALSE
p_next.visible = FALSE
p_prev.visible = FALSE

//????
If i_old_column <> 0 then
	strModify = "#" + string(i_old_Column) + ".font.weight=~"400~""
	strReturn = Modify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("Modify",strReturn)
End If


end event

type dw_cal from datawindow within u_ddcal
event mousemove pbm_mousemove
int X=5
int Y=116
int Width=727
int Height=608
boolean Visible=false
string Tag="Double-click the day you you would like to select."
string DataObject="d_calendar"
end type

event mousemove;if isValid( w_main) then w_main.SetMicroHelp( This.Tag )


end event

event clicked;Int nClickedColumn
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
strReturn = Modify(dw_cal,strModify)
If strReturn <> "" then MessageBox("Modify",strReturn)

//If the highlight was on a previous column (i_old_column = 0)
//set the border of the old column back to normal
If i_old_column <> 0 then
//	strModify = "#" + string(i_old_Column) + ".font.weight=~"400~""
	strModify = "#" + string(i_old_Column) + ".border=0"
	strReturn = Modify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("Modify",strReturn)
End If

//Set the old column for next time
i_old_column = nClickedColumn

end event

event doubleclicked;Int nClickedCol, nLength
String strDay, strModify, strReturn

nClickedCol = GetClickedColumn(dw_cal)
If nClickedCol = 0 then Return

//Set the Day to the chosen column
strDay = GetItemString(dw_cal,1,nClickedCol)
nDay = Integer(strDay)

//Return the chosen date into the SingleLineEdit in the chosen format
idateselected = Date(nYear,nMonth,nDay)
sle_date.text = String(idateselected  , strDateFormat )


//If there is an old column, reset the border
If i_old_column <> 0 then
	strModify = "#" + string(nClickedCol) + ".font.weight=~"400~""
	strReturn = Modify(dw_cal,strModify)
	If strReturn <> "" then MessageBox("Modify",strReturn)
End If
parent.TriggerEvent("size_closed")
//Hide the components of the DropDown
dw_cal.visible = FALSE
p_next.visible = FALSE
p_prev.visible = FALSE



end event

