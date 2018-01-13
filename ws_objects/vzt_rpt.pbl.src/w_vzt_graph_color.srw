$PBExportHeader$w_vzt_graph_color.srw
forward
global type w_vzt_graph_color from window
end type
type cb_cancel from commandbutton within w_vzt_graph_color
end type
type rb_graph_textcolor from radiobutton within w_vzt_graph_color
end type
type rb_graph_background from radiobutton within w_vzt_graph_color
end type
type rb_series_background from radiobutton within w_vzt_graph_color
end type
type rb_series_foreground from radiobutton within w_vzt_graph_color
end type
type uo_1 from u_color_selection within w_vzt_graph_color
end type
type cb_1 from commandbutton within w_vzt_graph_color
end type
type gb_1 from groupbox within w_vzt_graph_color
end type
end forward

global type w_vzt_graph_color from window
integer x = 379
integer y = 252
integer width = 2158
integer height = 656
boolean titlebar = true
string title = "Select Graph Colors"
boolean controlmenu = true
boolean resizable = true
windowtype windowtype = response!
long backcolor = 12632256
cb_cancel cb_cancel
rb_graph_textcolor rb_graph_textcolor
rb_graph_background rb_graph_background
rb_series_background rb_series_background
rb_series_foreground rb_series_foreground
uo_1 uo_1
cb_1 cb_1
gb_1 gb_1
end type
global w_vzt_graph_color w_vzt_graph_color

type variables
datawindow 		dw_parm
string 			series_name, is_graph
st_graphparm	ist_graphparm
end variables

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on w_vzt_graph_color.create
this.cb_cancel=create cb_cancel
this.rb_graph_textcolor=create rb_graph_textcolor
this.rb_graph_background=create rb_graph_background
this.rb_series_background=create rb_series_background
this.rb_series_foreground=create rb_series_foreground
this.uo_1=create uo_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_cancel,&
this.rb_graph_textcolor,&
this.rb_graph_background,&
this.rb_series_background,&
this.rb_series_foreground,&
this.uo_1,&
this.cb_1,&
this.gb_1}
end on

on w_vzt_graph_color.destroy
destroy(this.cb_cancel)
destroy(this.rb_graph_textcolor)
destroy(this.rb_graph_background)
destroy(this.rb_series_background)
destroy(this.rb_series_foreground)
destroy(this.uo_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;long grcolor
//dw_parm = message.powerobjectparm
ist_graphparm = message.powerobjectparm
dw_parm 	= ist_graphparm.dwreport
is_graph = ist_graphparm.graphobject
if IsNull(is_graph) or trim(is_graph) = '' then is_graph='gr_1'

cb_cancel.visible = false // for now

// Set the color selector user object to the series foreground color,
// since that radio button starts out selected.
//series_name = dw_parm.SeriesName ("gr_1", 1)
series_name = dw_parm.SeriesName (is_graph, 1)
dw_parm.SetSeriesStyle (is_graph, series_name, foreground!, grcolor)
uo_1.set_rgb (grcolor)




end event

type cb_cancel from commandbutton within w_vzt_graph_color
integer x = 1774
integer y = 340
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

type rb_graph_textcolor from radiobutton within w_vzt_graph_color
event mousemove pbm_mousemove
string tag = "Adjust graph foreground color."
integer x = 946
integer y = 364
integer width = 645
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "System"
long textcolor = 8388608
long backcolor = 12632256
string text = "Graph Gridlines"
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;// Get this color type from the graph and set the color in the color
// selector user object.
uo_1.set_rgb (long(dw_parm.Describe (is_graph+".textcolor")))
end event

type rb_graph_background from radiobutton within w_vzt_graph_color
event mousemove pbm_mousemove
string tag = "Adjust graph background color."
integer x = 946
integer y = 272
integer width = 658
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "System"
long textcolor = 8388608
long backcolor = 12632256
string text = "Graph Background"
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;// Get this color type from the graph and set the color in the color
// selector user object.
uo_1.set_rgb (long(dw_parm.Describe (is_graph+".backcolor")))
end event

type rb_series_background from radiobutton within w_vzt_graph_color
event mousemove pbm_mousemove
string tag = "Adjust the background of colored areas used to show the amount of data for a value."
integer x = 946
integer y = 188
integer width = 645
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "System"
long textcolor = 8388608
long backcolor = 12632256
string text = "Series Outline "
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;long grcolor

// Get this color type from the graph and set the color in the color
// selector user object.
dw_parm.setseriesstyle (is_graph, series_name,background!, grcolor)
uo_1.set_rgb (grcolor)

end event

type rb_series_foreground from radiobutton within w_vzt_graph_color
event mousemove pbm_mousemove
string tag = "Adjust the (foreground) pattern used (variations of cross-hatch or none) used to further identify the colored areas."
integer x = 946
integer y = 96
integer width = 645
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "System"
long textcolor = 8388608
long backcolor = 12632256
string text = "Series Fill "
boolean checked = true
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

event clicked;long grcolor

// Get this color type from the graph and set the color in the color
// selector user object.
dw_parm.Setseriesstyle (is_graph, series_name, foreground!, grcolor)
uo_1.set_rgb (grcolor)

end event

type uo_1 from u_color_selection within w_vzt_graph_color
string tag = "Select graph area to change color of and then change color."
integer x = 64
integer y = 36
integer height = 460
integer taborder = 50
end type

event color_changed;string new_color
// When the color is changed, change the appropriate color in the
// graph, depending on which radio button is checked currently.

new_color = string (uo_1.get_rgb())
if rb_graph_background.checked then
	dw_parm.Modify (is_graph+".backcolor=" + new_color)
elseif rb_graph_textcolor.checked then
	dw_parm.Modify (is_graph+".textcolor=" + new_color)
elseif rb_series_background.checked then
	dw_parm.SetSeriesStyle ( is_graph, series_name, background!,& 
										uo_1.get_rgb())
elseif rb_series_foreground.checked then
	dw_parm.SetSeriesStyle ( is_graph, series_name, foreground!,& 
										uo_1.get_rgb())
end if

end event

on uo_1.destroy
call u_color_selection::destroy
end on

type cb_1 from commandbutton within w_vzt_graph_color
event mousemove pbm_mousemove
string tag = "Leave the change color window."
integer x = 1774
integer y = 196
integer width = 247
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;Close (parent)
end on

type gb_1 from groupbox within w_vzt_graph_color
string tag = "Adjust the amount of Red, Green and Blue (RGB) for selected graph components."
integer x = 905
integer y = 12
integer width = 741
integer height = 480
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "System"
long textcolor = 8388608
long backcolor = 12632256
string text = "Colors"
end type

