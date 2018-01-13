$PBExportHeader$w_graph_color_dw.srw
$PBExportComments$General response window to set DW graph colors.
forward
global type w_graph_color_dw from Window
end type
type rb_graph_textcolor from radiobutton within w_graph_color_dw
end type
type rb_graph_background from radiobutton within w_graph_color_dw
end type
type rb_series_background from radiobutton within w_graph_color_dw
end type
type rb_series_foreground from radiobutton within w_graph_color_dw
end type
type uo_1 from u_color_selection within w_graph_color_dw
end type
type cb_1 from commandbutton within w_graph_color_dw
end type
type gb_1 from groupbox within w_graph_color_dw
end type
end forward

global type w_graph_color_dw from Window
int X=380
int Y=253
int Width=2158
int Height=657
boolean TitleBar=true
string Title="Select Graph Colors"
long BackColor=12632256
boolean ControlMenu=true
boolean Resizable=true
WindowType WindowType=response!
rb_graph_textcolor rb_graph_textcolor
rb_graph_background rb_graph_background
rb_series_background rb_series_background
rb_series_foreground rb_series_foreground
uo_1 uo_1
cb_1 cb_1
gb_1 gb_1
end type
global w_graph_color_dw w_graph_color_dw

type variables
datawindow dw_parm
string series_name
end variables

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on w_graph_color_dw.create
this.rb_graph_textcolor=create rb_graph_textcolor
this.rb_graph_background=create rb_graph_background
this.rb_series_background=create rb_series_background
this.rb_series_foreground=create rb_series_foreground
this.uo_1=create uo_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={ this.rb_graph_textcolor,&
this.rb_graph_background,&
this.rb_series_background,&
this.rb_series_foreground,&
this.uo_1,&
this.cb_1,&
this.gb_1}
end on

on w_graph_color_dw.destroy
destroy(this.rb_graph_textcolor)
destroy(this.rb_graph_background)
destroy(this.rb_series_background)
destroy(this.rb_series_foreground)
destroy(this.uo_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

on open;long grcolor
dw_parm = message.powerobjectparm

// Set the color selector user object to the series foreground color,
// since that radio button starts out selected.
series_name = dw_parm.grSeriesName ("gr_1", 1)
dw_parm.grseriesstyle ("gr_1", series_name, foreground!, grcolor)
uo_1.set_rgb (grcolor)




end on

type rb_graph_textcolor from radiobutton within w_graph_color_dw
event mousemove pbm_mousemove
int X=942
int Y=361
int Width=645
int Height=73
int TabOrder=40
string Tag="Adjust graph foreground color."
string Text="Graph Gridlines"
long TextColor=8388608
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="System"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// Get this color type from the graph and set the color in the color
// selector user object.
uo_1.set_rgb (long(dw_parm.DWDescribe ("gr_1.textcolor")))
end on

type rb_graph_background from radiobutton within w_graph_color_dw
event mousemove pbm_mousemove
int X=942
int Y=273
int Width=659
int Height=73
int TabOrder=30
string Tag="Adjust graph background color."
string Text="Graph Background"
long TextColor=8388608
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="System"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;// Get this color type from the graph and set the color in the color
// selector user object.
uo_1.set_rgb (long(dw_parm.DWDescribe ("gr_1.backcolor")))
end on

type rb_series_background from radiobutton within w_graph_color_dw
event mousemove pbm_mousemove
int X=942
int Y=185
int Width=645
int Height=73
int TabOrder=20
string Tag="Adjust the background of colored areas used to show the amount of data for a value."
string Text="Series Outline "
long TextColor=8388608
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="System"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;long grcolor

// Get this color type from the graph and set the color in the color
// selector user object.
dw_parm.grseriesstyle ("gr_1", series_name,background!, grcolor)
uo_1.set_rgb (grcolor)

end on

type rb_series_foreground from radiobutton within w_graph_color_dw
event mousemove pbm_mousemove
int X=942
int Y=97
int Width=645
int Height=73
int TabOrder=10
string Tag="Adjust the (foreground) pattern used (variations of cross-hatch or none) used to further identify the colored areas."
string Text="Series Fill "
boolean Checked=true
long TextColor=8388608
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="System"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	SetMicroHelp( This.Tag )
End If

end on

on clicked;long grcolor

// Get this color type from the graph and set the color in the color
// selector user object.
dw_parm.grseriesstyle ("gr_1", series_name, foreground!, grcolor)
uo_1.set_rgb (grcolor)

end on

type uo_1 from u_color_selection within w_graph_color_dw
int X=65
int Y=37
int TabOrder=50
string Tag="Select graph area to change color of and then change color."
end type

on color_changed;call u_color_selection::color_changed;string new_color
// When the color is changed, change the appropriate color in the
// graph, depending on which radio button is checked currently.

new_color = string (uo_1.get_rgb())
if rb_graph_background.checked then
	dw_parm.DWModify ("gr_1.backcolor=" + new_color)
elseif rb_graph_textcolor.checked then
	dw_parm.DWModify ("gr_1.textcolor=" + new_color)
elseif rb_series_background.checked then
	dw_parm.grSetSeriesStyle ( "gr_1", series_name, background!,& 
										uo_1.get_rgb())
elseif rb_series_foreground.checked then
	dw_parm.grSetSeriesStyle ( "gr_1", series_name, foreground!,& 
										uo_1.get_rgb())
end if

end on

on uo_1.destroy
call u_color_selection::destroy
end on

type cb_1 from commandbutton within w_graph_color_dw
event mousemove pbm_mousemove
int X=1774
int Y=197
int Width=247
int Height=109
int TabOrder=60
string Tag="Leave the change color window."
string Text="OK"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

type gb_1 from groupbox within w_graph_color_dw
int X=906
int Y=9
int Width=741
int Height=481
string Tag="Adjust the amount of Red, Green and Blue (RGB) for selected graph components."
string Text="Colors"
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="System"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

