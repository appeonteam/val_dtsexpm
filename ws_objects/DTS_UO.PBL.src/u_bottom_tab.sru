$PBExportHeader$u_bottom_tab.sru
forward
global type u_bottom_tab from userobject
end type
type st_text from statictext within u_bottom_tab
end type
type p_1 from picture within u_bottom_tab
end type
end forward

global type u_bottom_tab from userobject
integer width = 439
integer height = 136
long backcolor = 8421504
event ue_click pbm_custom01
st_text st_text
p_1 p_1
end type
global u_bottom_tab u_bottom_tab

type variables
integer ii_tab_index
end variables

event ue_click;// ue_click for u_bottom_tab

// declare an reference variable for 
// the user object u_bottom_bar

u_bottom_bar lu_bar

// assign the parent object (the bar) of this
// object (the tab) to the variable
// in order to have a reference
lu_bar = parent
//
//// update variables in the bar
//lu_bar.ii_lastindex = lu_bar.ii_index
//lu_bar.ii_index = ii_tab_index
//
// Trigger the event in the bar to 
// tell the bar it has been clicked
lu_bar.TriggerEvent( "ue_bar_clicked", ii_tab_index, Long(String(ii_tab_index)) )

end event

on u_bottom_tab.create
this.st_text=create st_text
this.p_1=create p_1
this.Control[]={this.st_text,&
this.p_1}
end on

on u_bottom_tab.destroy
destroy(this.st_text)
destroy(this.p_1)
end on

type st_text from statictext within u_bottom_tab
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 16
integer width = 311
integer height = 60
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long backcolor = 12632256
boolean enabled = false
string text = "-"
alignment alignment = center!
long bordercolor = 27354725
end type

event ue_mousemove;if IsValid(w_main) then 
	w_main.SetMicroHelp( Parent.Tag )
end if

end event

on clicked;// fire off the picture control clicked event
p_1.TriggerEVent( Clicked! )

end on

type p_1 from picture within u_bottom_tab
event ue_mousemove pbm_mousemove
integer width = 421
integer height = 120
string pointer = "HAND.CUR"
string picturename = "tab3.bmp"
boolean focusrectangle = false
end type

event ue_mousemove;if IsValid(w_main) then 
	w_main.SetMicroHelp( Parent.Tag )
end if

end event

on clicked;// fire off the user object user event
parent.TriggerEvent( "ue_click" )

end on

