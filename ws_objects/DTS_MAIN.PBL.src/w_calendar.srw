$PBExportHeader$w_calendar.srw
$PBExportComments$Pop-up calendar window.
forward
global type w_calendar from window
end type
type cb_cancel from commandbutton within w_calendar
end type
type cb_ok from commandbutton within w_calendar
end type
type cb_nextyear from commandbutton within w_calendar
end type
type cb_lastyear from commandbutton within w_calendar
end type
type cb_nextmonth from commandbutton within w_calendar
end type
type cb_lastmonth from commandbutton within w_calendar
end type
type dw_calendar from datawindow within w_calendar
end type
end forward

global type w_calendar from window
integer x = 411
integer y = 84
integer width = 1947
integer height = 1304
boolean titlebar = true
string title = "Calendar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217750
event drawcalendar pbm_custom01
event dateclicked pbm_custom02
cb_cancel cb_cancel
cb_ok cb_ok
cb_nextyear cb_nextyear
cb_lastyear cb_lastyear
cb_nextmonth cb_nextmonth
cb_lastmonth cb_lastmonth
dw_calendar dw_calendar
end type
global w_calendar w_calendar

type variables
date id_Startdate          // startdate day 1 of current month
date id_ActiveDate       // active date clicked   
integer ii_ActiveEle       // active element clicked
integer ii_StartEle         // starting element for day 1
boolean ib_DateOK       // is the date acceptable
string isa_days[42]       // array of strings used for day numbers
boolean ib_FirstTime     // has calendar just opened?
long il_selectedcolor     // color of selected dates
long il_unselectedcolor // color of unselected dates
boolean ib_setactivedate // processing flag
u_dw_maint idw_parent  // maint this was called from
end variables

forward prototypes
public function date wf_firstofmonth (date ad_date)
end prototypes

on drawcalendar;Integer li_First, i, li_DaysInMonth, li_End, li_Start, li_Day, li_Active
String ls_objectname, ls_today, ls_modify, ls_header

// set title for calendar
ls_header = gf_MonthName( id_startdate ) + ", " + String( Year( id_startdate), "####")

// What array element is the first of the month
li_First = DayNumber( Date( Year( id_startdate ), Month( id_startdate ) , 1))

ii_startele = li_first

// Fill text of days to day 1 with empty string
li_End = li_First - 1
FOR i = 1 TO li_End
	isa_days[i] = ""
NEXT

//  calculate number of days in month

li_DaysInMonth = gf_daysInMonth( id_startdate )

// Fill in days in month
li_Start = li_End + 1
li_Active = li_Start + Day( id_activedate ) - 1
li_End = li_Start + li_DaysInMonth - 1
li_Day = 0
FOR i = li_Start TO li_End
	li_Day = li_Day + 1
	isa_days[i] = String( li_Day , "[General]" ) + " "
NEXT

li_Start = li_End + 1
FOR i = li_Start TO 42
	isa_days[i] = ""
NEXT

// update datawindow

dw_calendar.DwModify(	"st_header.text = ~""+ls_header+"~" " +& 
                       	"st_01.text = ~"" + isa_days[1] + "~"" + &
                       	"st_02.text = ~"" + isa_days[2] + "~"" + &
                       	"st_03.text = ~"" + isa_days[3] + "~"" + &
                       	"st_04.text = ~"" + isa_days[4] + "~"" + &
                       	"st_05.text = ~"" + isa_days[5] + "~"" + &
                       	"st_06.text = ~"" + isa_days[6] + "~"" + &
                       	"st_07.text = ~"" + isa_days[7] + "~"" + &
                       	"st_08.text = ~"" + isa_days[8] + "~"" + &
                       	"st_09.text = ~"" + isa_days[9] + "~"" + &
                       	"st_10.text = ~"" + isa_days[10] + "~"" + &
                       	"st_11.text = ~"" + isa_days[11] + "~"" + &
                       	"st_12.text = ~"" + isa_days[12] + "~"" + &
                       	"st_13.text = ~"" + isa_days[13] + "~"" + &
                       	"st_14.text = ~"" + isa_days[14] + "~"" + &
                       	"st_15.text = ~"" + isa_days[15] + "~"" + &
                       	"st_16.text = ~"" + isa_days[16] + "~"" + &
                       	"st_17.text = ~"" + isa_days[17] + "~"" + &
                       	"st_18.text = ~"" + isa_days[18] + "~"" + &
                       	"st_19.text = ~"" + isa_days[19] + "~"" + &
                       	"st_20.text = ~"" + isa_days[20] + "~"" + &
                       	"st_21.text = ~"" + isa_days[21] + "~"" + &
                       	"st_22.text = ~"" + isa_days[22] + "~"" + &
                       	"st_23.text = ~"" + isa_days[23] + "~"" + &
                       	"st_24.text = ~"" + isa_days[24] + "~"" + &
                       	"st_25.text = ~"" + isa_days[25] + "~"" + &
                       	"st_26.text = ~"" + isa_days[26] + "~"" + &
                       	"st_27.text = ~"" + isa_days[27] + "~"" + &
                       	"st_28.text = ~"" + isa_days[28] + "~"" + &
                       	"st_29.text = ~"" + isa_days[29] + "~"" + &
                       	"st_30.text = ~"" + isa_days[30] + "~"" + &
                       	"st_31.text = ~"" + isa_days[31] + "~"" + &
                       	"st_32.text = ~"" + isa_days[32] + "~"" + &
                       	"st_33.text = ~"" + isa_days[33] + "~"" + &
                       	"st_34.text = ~"" + isa_days[34] + "~"" + &
                       	"st_35.text = ~"" + isa_days[35] + "~"" + &
                       	"st_36.text = ~"" + isa_days[36] + "~"" + &
                       	"st_37.text = ~"" + isa_days[37] + "~"" + &
                       	"st_38.text = ~"" + isa_days[38] + "~"" + &
                       	"st_39.text = ~"" + isa_days[39] + "~"" + &
                       	"st_40.text = ~"" + isa_days[40] + "~"" + &
                       	"st_41.text = ~"" + isa_days[41] + "~"" + &
                       	"st_42.text = ~"" + isa_days[42] + "~"")

// First time, so highlight today...
IF ib_firsttime THEN	
	ib_firsttime = FALSE

	//IF ib_setactivedate THEN id_startdate = id_activedate

	// update instance var
	ii_activeele = li_Active

	// calculate objectname for today ...
	IF li_Active < 10 THEN
  		ls_Today = "0" + String( li_Active, "##" )
	ELSE
  		ls_Today = String( li_Active, "##" )
	END IF 

	ls_objectname = "st_"+ls_today

	ls_modify = Left( ls_objectname, 5 ) +".background.color = ~"" + String(il_selectedcolor) +"~" " +&
   				Left( ls_objectname, 5 ) +".background.mode = ~"0~""	

	dw_calendar.dwModify( ls_modify)

END IF
end on

on dateclicked;String ls_objectname, ls_modify, ls_oldobjectname, ls_oldelement
Integer li_start, li_element, li_oldelement

ls_objectname = dw_calendar.dwGetObjectAtPointer() 

// is the pointer in the datawindow on a text object?
IF Left( ls_objectname, 2) = "st" THEN

	// Is the pointer on a day?
	li_start = Pos( ls_objectname, "_") + 1
	li_element = Integer( Mid( ls_objectname, li_start, 2 ))
	IF li_element > 0 THEN
		li_oldelement = ii_activeele
		ii_activeele = li_element
		ib_dateok = TRUE
		id_activedate = RelativeDate(id_startdate,(ii_activeele - ii_startele))
		ib_dateok = Month(id_activedate) = Month(id_startdate)
	ELSE
	  	ib_dateok = FALSE
	END IF
ELSE
  	ib_dateok = FALSE
END IF

IF ib_dateok THEN

	// change color of old selected date to original color
	IF li_oldelement > 9 THEN
  		ls_oldelement = String( li_oldelement, "##")
	ELSE
		ls_oldelement = "0" + String( li_oldelement, "##")
	END IF

	ls_oldobjectname = "st_" + ls_oldelement
	ls_modify = Left( ls_oldobjectname, 5 ) +".background.color = ~"" + String(il_unselectedcolor) +"~" " +&
  				Left( ls_oldobjectname, 5 ) +".background.mode = ~"0~""	
	dw_calendar.dwModify( ls_modify)

	// change color of new selected date to selected color

	ls_modify = Left( ls_objectname, 5 ) +".background.color = ~"" + String(il_selectedcolor) +"~" " +&
   				Left( ls_objectname, 5 ) +".background.mode = ~"0~""	
	dw_calendar.dwModify( ls_modify)
ELSE

	ii_activeele = li_oldelement 
END IF
end on

public function date wf_firstofmonth (date ad_date);Date ld_return

ld_return = Date(Year(ad_date), Month(ad_date), 1)

RETURN ld_return
end function

on open;// There are three instance variables that should be accessed 
// from an extended dateclicked event.
//
// ii_ActiveEle is element of st_days[] that is active
//
// id_ActiveDate is the active date
//
// ib_DateOK is a boolean that says whether the date picked is ok - picked
//    within the current month

string ls_color

idw_parent = Message.PowerObjectParm

ib_setactivedate = TRUE

id_activedate = Today()

// initialize to this month
id_startdate = Date( Year( id_activedate ), Month( id_activedate ), 1 )

// window just opened, set first time iVar, 
// used to cause current date to be highlighted
ib_firsttime = TRUE
ib_dateok = TRUE

dw_calendar.InsertRow( 0 )

// set the instance variable for the unselected backgroundcolor

ls_color = dw_calendar.dwDescribe( "st_01.background.color" )
il_unselectedcolor = Long( ls_color )

// default the selected color to cyan
il_selectedcolor = RGB( 0, 255,255 )

// trigger drawing calendar
This.Postevent( "drawcalendar" )
end on

on w_calendar.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_nextyear=create cb_nextyear
this.cb_lastyear=create cb_lastyear
this.cb_nextmonth=create cb_nextmonth
this.cb_lastmonth=create cb_lastmonth
this.dw_calendar=create dw_calendar
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.cb_nextyear,&
this.cb_lastyear,&
this.cb_nextmonth,&
this.cb_lastmonth,&
this.dw_calendar}
end on

on w_calendar.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_nextyear)
destroy(this.cb_lastyear)
destroy(this.cb_nextmonth)
destroy(this.cb_lastmonth)
destroy(this.dw_calendar)
end on

on key;IF KeyDown( KeyPageDown! ) THEN
	TriggerEvent( cb_nextmonth, Clicked! )
ElSEIF KeyDown( KeyPageUp! ) then
	TriggerEvent( cb_lastmonth, Clicked! )
END IF
end on

type cb_cancel from commandbutton within w_calendar
integer x = 1641
integer y = 296
integer width = 247
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
end type

on clicked;Close( parent )

end on

type cb_ok from commandbutton within w_calendar
integer x = 1641
integer y = 140
integer width = 247
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
boolean default = true
end type

on clicked;idw_parent.SetItem( idw_parent.ii_currow, idw_parent.ii_curcol,&
	 id_activedate )

Close( parent )




end on

type cb_nextyear from commandbutton within w_calendar
integer x = 1481
integer y = 40
integer width = 96
integer height = 72
integer taborder = 50
integer textsize = -6
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string text = ">>"
end type

on clicked;String ls_oldobjectname, ls_modify

SetPointer( HourGlass! )

IF ii_activeele < 10 THEN
	ls_oldobjectname = "st_0" + String( ii_activeele, "#")
ELSE
	ls_oldobjectname = "st_" + String( ii_activeele, "##")
END IF

ls_modify = Left( ls_oldobjectname, 5 ) +".background.color = ~"" + String(il_unselectedcolor) +"~" " +&
  				Left( ls_oldobjectname, 5 ) +".background.mode = ~"0~""	

dw_calendar.dwModify( ls_modify )

id_activedate 	= gf_addyear( id_activedate )
id_startdate	= wf_firstofmonth( id_activedate )
ib_firsttime 	= true

parent.TriggerEvent( "drawcalendar" )

end on

type cb_lastyear from commandbutton within w_calendar
integer x = 1211
integer y = 40
integer width = 96
integer height = 72
integer taborder = 40
integer textsize = -6
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string text = "<<"
end type

on clicked;String ls_oldobjectname, ls_modify

SetPointer( HourGlass! )

IF ii_activeele < 10 THEN
	ls_oldobjectname = "st_0" + String( ii_activeele, "#")
ELSE
	ls_oldobjectname = "st_" + String( ii_activeele, "##")
END IF

ls_modify = Left( ls_oldobjectname, 5 ) +".background.color = ~"" + String(il_unselectedcolor) +"~" " +&
  				Left( ls_oldobjectname, 5 ) +".background.mode = ~"0~""	

dw_calendar.dwModify( ls_modify )

id_activedate 	= gf_subtractyear( id_activedate )
id_startdate	= wf_firstofmonth( id_activedate )
ib_firsttime 	= true

parent.TriggerEvent( "drawcalendar" )

end on

type cb_nextmonth from commandbutton within w_calendar
integer x = 1394
integer y = 40
integer width = 87
integer height = 72
integer taborder = 30
integer textsize = -6
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string text = ">"
end type

on clicked;String ls_oldobjectname, ls_modify

SetPointer( HourGlass! )

// subtract a month from current month
IF ii_activeele < 10 THEN
	ls_oldobjectname = "st_0" + String( ii_activeele, "#")
ELSE
	ls_oldobjectname = "st_" + String( ii_activeele, "##")
END IF

ls_modify = Left( ls_oldobjectname, 5 ) +".background.color = ~"" + String(il_unselectedcolor) +"~" " +&
  				Left( ls_oldobjectname, 5 ) +".background.mode = ~"0~""	

dw_calendar.dwModify( ls_modify )

id_activedate 	= gf_addmonth( id_activedate )
id_startdate	= wf_firstofmonth( id_activedate )
ib_firsttime 	= true

parent.TriggerEvent( "drawcalendar" )


end on

type cb_lastmonth from commandbutton within w_calendar
integer x = 1307
integer y = 40
integer width = 87
integer height = 72
integer taborder = 20
integer textsize = -6
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string text = "<"
end type

on clicked;String ls_oldobjectname, ls_modify

SetPointer( HourGlass! )

// subtract a month from current month

IF ii_activeele < 10 THEN
	ls_oldobjectname = "st_0" + String( ii_activeele, "#")
ELSE
	ls_oldobjectname = "st_" + String( ii_activeele, "##")
END IF

ls_modify = Left( ls_oldobjectname, 5 ) +".background.color = ~"" + String(il_unselectedcolor) +"~" " +&
  				Left( ls_oldobjectname, 5 ) +".background.mode = ~"0~""	

dw_calendar.dwModify( ls_modify )

id_activedate 	= gf_subtractmonth( id_activedate )
id_startdate	= wf_firstofmonth( id_activedate )
ib_firsttime 	= true

parent.TriggerEvent( "drawcalendar" )

end on

type dw_calendar from datawindow within w_calendar
integer x = 37
integer y = 32
integer width = 1550
integer height = 1128
integer taborder = 10
string dataobject = "d_calendar"
borderstyle borderstyle = stylelowered!
end type

on clicked;parent.TriggerEvent( "DateClicked" )


end on

on doubleclicked;cb_ok.TriggerEvent( Clicked! )



end on

