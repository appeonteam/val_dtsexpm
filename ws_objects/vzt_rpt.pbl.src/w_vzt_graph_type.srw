$PBExportHeader$w_vzt_graph_type.srw
forward
global type w_vzt_graph_type from Window
end type
type uo_1 from u_graph_gallery within w_vzt_graph_type
end type
end forward

global type w_vzt_graph_type from Window
int X=352
int Y=276
int Width=2222
int Height=1124
boolean TitleBar=true
string Title="Select Graph Type"
boolean ControlMenu=true
boolean Resizable=true
WindowType WindowType=response!
uo_1 uo_1
end type
global w_vzt_graph_type w_vzt_graph_type

type variables
datawindow dw_parm
end variables

on w_vzt_graph_type.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_vzt_graph_type.destroy
destroy(this.uo_1)
end on

on open;// Receive and remember in the dw_parm instance variable, the 
// datawindow object that has been passed by the window 
// that opened this.
dw_parm = message.powerobjectparm
end on

type uo_1 from u_graph_gallery within w_vzt_graph_type
int X=0
int Y=0
end type

on uo_1.destroy
call u_graph_gallery::destroy
end on

event gallery_ok;int c,r, ret
string g_type

// Get the graph type from the graph gallery user object.
ret = uf_query_gallery (r, c, g_type)
if ret = 0 then
	messagebox ("Sorry!","Clicked on invalid type")
	return
end if

// The user clicked on a graph type. Set the type in the passed 
// datawindow object.
Choose Case g_type
	case "area3d"
		dw_parm.Modify ("gr_1.graphtype=15")
	case "areagraph"
		dw_parm.Modify ("gr_1.graphtype=1")
	case "bar3dobjgraph"
		dw_parm.Modify ("gr_1.graphtype=4")
	case "barstack3dobjgraph"
		dw_parm.Modify ("gr_1.graphtype=6")
	case "bargraph"
		dw_parm.Modify ("gr_1.graphtype=2")
	case "bar3dgraph"
		dw_parm.Modify ("gr_1.graphtype=3")
	case "barstackgraph"
		dw_parm.Modify ("gr_1.graphtype=5")
	case "col3dgraph"
		dw_parm.Modify ("gr_1.graphtype=8")
	case "col3dobjgraph"
		dw_parm.Modify ("gr_1.graphtype=9")
	case "colgraph"
		dw_parm.Modify ("gr_1.graphtype=7")
	case "colstack3dobjgraph"
		dw_parm.Modify ("gr_1.graphtype=11")
	case "colstackgraph"
		dw_parm.Modify ("gr_1.graphtype=10")
	case "line3d"
		dw_parm.Modify ("gr_1.graphtype=16")
	case "linegraph"
		dw_parm.Modify ("gr_1.graphtype=12")
	case "pie3d"
		dw_parm.Modify ("gr_1.graphtype=17")
	case "piegraph"
		dw_parm.Modify ("gr_1.graphtype=13")
	case "scattergraph"
		dw_parm.Modify ("gr_1.graphtype=14")
	case else
		messagebox ("Error!", "Invalid Graph Type")
end choose

Close (parent)
end event

on gallery_cancel;call u_graph_gallery::gallery_cancel;Close (parent)

end on

