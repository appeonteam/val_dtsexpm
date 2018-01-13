$PBExportHeader$u_select_data.sru
$PBExportComments$"Scroll-as-you-type" search window
forward
global type u_select_data from UserObject
end type
type dw_display from datawindow within u_select_data
end type
type sle_enter from singlelineedit within u_select_data
end type
end forward

global type u_select_data from UserObject
int Width=1710
int Height=873
boolean Border=true
long BackColor=16777215
event ue_message pbm_custom75
dw_display dw_display
sle_enter sle_enter
end type
global u_select_data u_select_data

type variables
string is_datatype, is_col, is_val
integer ii_rows_to_display, ii_rows_selected, ii_val
boolean ib_retrieving = false
string is_dwobject
end variables

on constructor;ii_rows_to_display = 7
ib_retrieving = false
is_datatype = "s"
sle_enter. width = this.width - 40
dw_display.width = this.width - 40
dw_display.height = this.height - 125


end on

on u_select_data.create
this.dw_display=create dw_display
this.sle_enter=create sle_enter
this.Control[]={ this.dw_display,&
this.sle_enter}
end on

on u_select_data.destroy
destroy(this.dw_display)
destroy(this.sle_enter)
end on

type dw_display from datawindow within u_select_data
event ue_keyup pbm_dwnkey
int X=19
int Y=105
int Width=1669
int Height=501
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

on clicked;integer li_row
boolean lb_fire_message = false

li_row = dw_display.getClickedRow()

IF li_row  > 0 THEN
	dw_display.SelectRow( 0, false )
	dw_display.SelectRow( li_row, true )

	CHOOSE CASE is_datatype

		CASE "s"
			sle_enter.text = dw_display.GetItemString( li_row, 1 )

		CASE "i"
			sle_enter.text = String( dw_display.GetItemNumber( li_row, 1 ) )

	END CHOOSE

	IF Upper(Left( dw_display.dwDescribe( is_col +".coltype" ), 1 )) = "C" THEN
		is_val	= dw_display.GetItemString( li_row, is_col )
		lb_fire_message = true
	ELSE
		ii_val	= dw_display.GetItemNumber( li_row, is_col )
		lb_fire_message = true
	END IF		


END IF

IF lb_fire_message = true THEN
	parent.TriggerEvent ( "ue_message" )
END IF

end on

on constructor;dw_display.dataobject = is_dwobject
dw_display.SetTransObject(sqlca )

end on

on retrievestart;ib_retrieving = true
end on

on retrieveend;ib_retrieving = false
end on

on retrieverow;ii_rows_selected++

IF ii_rows_selected = ii_rows_to_display THEN
	dw_display.dbCancel()
END IF

end on

type sle_enter from singlelineedit within u_select_data
event ue_keyup pbm_keyup
int X=19
int Y=13
int Width=1669
int Height=81
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on ue_keyup;IF NOT ib_retrieving THEN

	ii_rows_selected = 0

	CHOOSE CASE is_datatype

		CASE "s"
			dw_display.retrieve( Trim( sle_enter.text)  )

		CASE "i"
			dw_display.retrieve( Integer( sle_enter.text)  )

	END CHOOSE

END IF
end on

