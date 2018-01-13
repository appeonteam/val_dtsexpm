$PBExportHeader$w_calc_time.srw
forward
global type w_calc_time from window
end type
type st_2 from statictext within w_calc_time
end type
type mle_tape from multilineedit within w_calc_time
end type
type st_equalsign from statictext within w_calc_time
end type
type em_to from editmask within w_calc_time
end type
type ddlb_to from dropdownlistbox within w_calc_time
end type
type ddlb_from from dropdownlistbox within w_calc_time
end type
type cb_equals from commandbutton within w_calc_time
end type
type em_from from editmask within w_calc_time
end type
type ln_1 from line within w_calc_time
end type
end forward

global type w_calc_time from window
integer x = 832
integer y = 356
integer width = 1303
integer height = 380
boolean titlebar = true
string title = "Time Calculator"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 134217750
string icon = "TIMECALC.ICO"
st_2 st_2
mle_tape mle_tape
st_equalsign st_equalsign
em_to em_to
ddlb_to ddlb_to
ddlb_from ddlb_from
cb_equals cb_equals
em_from em_from
ln_1 ln_1
end type
global w_calc_time w_calc_time

type variables
int nOrigHeight
end variables

on mousemove;w_main.SetMicroHelp( This.Tag )

end on

on open;nOrigHeight = This.Height
end on

on w_calc_time.create
this.st_2=create st_2
this.mle_tape=create mle_tape
this.st_equalsign=create st_equalsign
this.em_to=create em_to
this.ddlb_to=create ddlb_to
this.ddlb_from=create ddlb_from
this.cb_equals=create cb_equals
this.em_from=create em_from
this.ln_1=create ln_1
this.Control[]={this.st_2,&
this.mle_tape,&
this.st_equalsign,&
this.em_to,&
this.ddlb_to,&
this.ddlb_from,&
this.cb_equals,&
this.em_from,&
this.ln_1}
end on

on w_calc_time.destroy
destroy(this.st_2)
destroy(this.mle_tape)
destroy(this.st_equalsign)
destroy(this.em_to)
destroy(this.ddlb_to)
destroy(this.ddlb_from)
destroy(this.cb_equals)
destroy(this.em_from)
destroy(this.ln_1)
end on

type st_2 from statictext within w_calc_time
integer x = 32
integer y = 324
integer width = 407
integer height = 56
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Calculator Tape"
boolean focusrectangle = false
end type

type mle_tape from multilineedit within w_calc_time
event mousemove pbm_mousemove
string tag = "This is a running tape of your most recent calculations."
integer x = 32
integer y = 400
integer width = 1211
integer height = 484
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "**------------------------>> End-of-Tape"
boolean vscrollbar = true
boolean autovscroll = true
integer tabstop[] = {4}
borderstyle borderstyle = stylelowered!
end type

on mousemove;w_main.SetMicroHelp( This.Tag )

end on

type st_equalsign from statictext within w_calc_time
integer x = 462
integer y = 44
integer width = 105
integer height = 72
integer textsize = -14
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "="
alignment alignment = center!
boolean focusrectangle = false
end type

type em_to from editmask within w_calc_time
event mousemove pbm_mousemove
string tag = "The resulting value of the computation."
integer x = 576
integer y = 40
integer width = 667
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "arrow!"
long textcolor = 33554432
boolean enabled = false
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,##0.0#########"
double increment = 1
string minmax = "1~~"
end type

on mousemove;w_main.SetMicroHelp( This.Tag )

end on

type ddlb_to from dropdownlistbox within w_calc_time
event mousemove pbm_mousemove
string tag = "Choose the unit of measurement for the result value to be computed as."
integer x = 827
integer y = 168
integer width = 421
integer height = 564
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "IBeam!"
long textcolor = 33554432
string text = "Hours"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Seconds","Minutes","Hours","Days","Weeks","Months","Years"}
borderstyle borderstyle = stylelowered!
end type

on mousemove;w_main.SetMicroHelp( This.Tag )

end on

type ddlb_from from dropdownlistbox within w_calc_time
event mousemove pbm_mousemove
string tag = "Choose the unit of measurement for the original value to be taken as."
integer x = 32
integer y = 164
integer width = 421
integer height = 564
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "IBeam!"
long textcolor = 33554432
string text = "Minutes"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Seconds","Minutes","Hours","Days","Weeks","Months","Years"}
borderstyle borderstyle = stylelowered!
end type

on mousemove;w_main.SetMicroHelp( This.Tag )

end on

type cb_equals from commandbutton within w_calc_time
event mousemove pbm_mousemove
string tag = "Press here to calculate the entered value."
integer x = 494
integer y = 164
integer width = 288
integer height = 104
integer taborder = 30
integer textsize = -14
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
string text = "="
boolean default = true
end type

on mousemove;w_main.SetMicroHelp( this.tag )
end on

on clicked;decimal nFromNumber = 0, nToNumber = 0
string cTape = ""

nFromNumber = Double( em_from.Text )    // let's start
cTape = cTape + String( nFromNumber ) + " "
// convert 'from number' to seconds or greatest accuracy
Choose Case ddlb_from.Text
Case "Minutes"
	nFromNumber = nFromNumber * 60
	cTape = cTape + "Minutes "
Case "Hours"
	nFromNumber = nFromNumber * 3600
	cTape = cTape + "Hours "
Case "Days"
	nFromNumber = nFromNumber * 86400
	cTape = cTape + "Days "
Case "Weeks"
	nFromNumber = nFromNumber * 604800
	cTape = cTape + "Weeks "
Case "Months"
	nFromNumber = nFromNumber * 2620800
	cTape = cTape + "Months "
Case "Years"
	nFromNumber = nFromNumber * 31449600
	cTape = cTape + "Years "
Case Else
End Choose

nToNumber = nFromNumber
// convert 'to number' to desired conversion format
cTape = cTape + " =  "
Choose Case ddlb_to.Text
Case "Minutes"
	nToNumber = Round(nToNumber / 60, 2)
	cTape = cTape + String( nToNumber ) + " Minutes"
Case "Hours"
	nToNumber =  Round(nToNumber / 3600, 2)
	cTape = cTape + String( nToNumber ) + " Hours"
Case "Days"
	nToNumber =  Round(nToNumber / 86400, 2) 
	cTape = cTape + String( nToNumber ) + " Days"
Case "Weeks"
	nToNumber =  Round(nToNumber / 604800, 2)
	cTape = cTape + String( nToNumber ) + " Weeks"
Case "Months"
	nToNumber =  Round(nToNumber / 2620800, 2)
	cTape = cTape + String( nToNumber ) + " Months"
Case "Years"
	nToNumber =  Round(nToNumber / 31449600, 2)
	cTape = cTape + String( nToNumber ) + " Years"
Case Else
End Choose

mle_tape.SelectText( 1, 0 )                             // rewind to 1st pos            
mle_tape.ReplaceText( "~r~n" )                  // insert new line
mle_tape.SelectText( 1, 0 )                             // rewind to 1st pos
mle_tape.ReplaceText( cTape )                           // insert text for new line

em_to.Text = String( nToNumber )

end on

on rbuttondown;// If already Fully Open Then
If w_calc_time.Height > mle_tape.Y Then
	w_calc_time.Resize( w_calc_time.Width, nOrigHeight )
// ELse If not already Fully Open Then Open
Else
	// gives programmed equal bottom border to designed left border of 
	// multi-line edit
	w_calc_time.Resize( w_calc_time.Width, &
							mle_tape.Y + mle_tape.Height + 96 + mle_tape.X )
End If

end on

type em_from from editmask within w_calc_time
event mousemove pbm_mousemove
string tag = "Enter the original value to be computed."
integer x = 32
integer y = 36
integer width = 421
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,##0.0#########"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

on mousemove;w_main.SetMicroHelp( This.Tag )

end on

on rbuttondown;This.SelectText( 1, Len( This.Text ) )
end on

on getfocus;This.SelectText( 1, Len( This.Text ) )
end on

type ln_1 from line within w_calc_time
long linecolor = 33554432
integer linethickness = 5
integer beginx = 41
integer beginy = 312
integer endx = 1243
integer endy = 312
end type

