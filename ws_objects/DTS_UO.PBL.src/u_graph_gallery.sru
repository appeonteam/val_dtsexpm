$PBExportHeader$u_graph_gallery.sru
$PBExportComments$Gallery of graph types
forward
global type u_graph_gallery from UserObject
end type
type st_1 from statictext within u_graph_gallery
end type
type cb_ok from commandbutton within u_graph_gallery
end type
type cb_cancel from commandbutton within u_graph_gallery
end type
type p_gallery from picture within u_graph_gallery
end type
end forward

global type u_graph_gallery from UserObject
int Width=2195
int Height=1025
boolean Border=true
long BackColor=12632256
event gallery_ok pbm_custom01
event gallery_cancel pbm_custom02
st_1 st_1
cb_ok cb_ok
cb_cancel cb_cancel
p_gallery p_gallery
end type
global u_graph_gallery u_graph_gallery

type variables
int     ui_row=0, ui_col=0
string graph_type

end variables

forward prototypes
public function integer uf_query_gallery (ref int a_row, ref int a_col, ref string a_type)
end prototypes

public function integer uf_query_gallery (ref int a_row, ref int a_col, ref string a_type);// integer Function UF_QUERY_GALLERY (int a_row, int a_col)

//	Returns current values of ui_row and ui_col 
// in a_row and a_col, respectively

// Returns +1 if current row and column are valid, 0 if not valid

a_row = ui_row
a_col = ui_col

if ui_row = 2 and ui_col = 6 then
	
	return 0		
elseif ui_row < 1 or ui_col < 1 then
	return 0
else
	a_type = graph_type
	return 1
end if


end function

on u_graph_gallery.create
this.st_1=create st_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.p_gallery=create p_gallery
this.Control[]={ this.st_1,&
this.cb_ok,&
this.cb_cancel,&
this.p_gallery}
end on

on u_graph_gallery.destroy
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.p_gallery)
end on

type st_1 from statictext within u_graph_gallery
int X=1866
int Y=861
int Width=211
int Height=73
boolean Visible=false
boolean Enabled=false
string Text="none"
Alignment Alignment=Center!
long TextColor=16777215
long BackColor=8388608
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ok from commandbutton within u_graph_gallery
int X=1847
int Y=85
int Width=266
int Height=109
int TabOrder=20
string Text="OK"
boolean Default=true
string Pointer="HAND.CUR"
end type

on clicked;// Clicked script for CB_OK

Parent.TriggerEvent ("gallery_ok")
end on

type cb_cancel from commandbutton within u_graph_gallery
int X=1847
int Y=221
int Width=266
int Height=109
int TabOrder=10
string Text="Cancel"
boolean Cancel=true
string Pointer="HAND.CUR"
end type

on clicked;// Clicked script for CB_CANCEL

Parent.TriggerEvent ("gallery_cancel")
end on

type p_gallery from picture within u_graph_gallery
int X=10
int Y=9
int Width=1793
int Height=993
string PictureName="grgallry.bmp"
boolean OriginalSize=true
string Pointer="HAND.CUR"
end type

on clicked;// Clicked script for P_GALLERY

int	x_pic, y_pic, x_text, y_text
string	t
string	graph_type_a [6,3] = { &
		"areagraph","bargraph","colgraph","linegraph","piegraph","scattergraph",&
		"area3d","bar3dgraph","col3dgraph","line3d","pie3d","error",&
		"barstackgraph","colstackgraph","bar3dobjgraph","col3dobjgraph",&
		"barstack3dobjgraph","colstack3dobjgraph"}						
//grgraphtype	graph_type_a [6,3] = { &
//		areagraph!,bargraph!,colgraph!,linegraph!,piegraph!,scattergraph!,&
//		area3d!,bar3dgraph!,col3dgraph!,line3d!,pie3d!,error!,&
//		barstackgraph!,colstackgraph!,bar3dobjgraph!,col3dobjgraph!,&
//		barstack3dobjgraph!,colstack3dobjgraph!}	

string	titles_1[6] = {"Area", "Bar", "Column", "Line", "Pie", "Scatter"}
string	titles_3[6] = {"Bar", "Column", "Bar", "Column", "Bar", "Column"}

x_pic = this.PointerX () // - this.x
y_pic = this.PointerY () // - this.y

ui_col = ((x_pic - 28) / 288) + 1

if y_pic < 333 then
	ui_row = 1
	t = titles_1[ui_col]
	y_text = 231
elseif y_pic < 661 then
	ui_row = 2
	t = titles_1[ui_col]
	y_text = 555
else
	ui_row = 3
	t = titles_3[ui_col]
	y_text = 883
end if

st_1.text = t
x_text = this.x + ((ui_col -1) * 288) + 64
y_text = y_text - this.y

st_1.hide ()
if ui_row = 2 and ui_col = 6 then
	beep (1)			// Only 5 entries in Row 2 (no 3D Scatter)
else
	st_1.move (x_text, y_text)
	st_1.show ()
end if
graph_type = graph_type_a [ui_col, ui_row]

end on

on doubleclicked;TriggerEvent (cb_ok, clicked!)
end on

