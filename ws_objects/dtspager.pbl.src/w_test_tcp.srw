$PBExportHeader$w_test_tcp.srw
forward
global type w_test_tcp from Window
end type
type uo_1 from uo_vzt_tcp_metro_page within w_test_tcp
end type
end forward

global type w_test_tcp from Window
int X=82
int Y=100
int Width=3035
int Height=1204
boolean TitleBar=true
string Title="TCP Test"
long BackColor=80269528
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
uo_1 uo_1
end type
global w_test_tcp w_test_tcp

on w_test_tcp.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_test_tcp.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_vzt_tcp_metro_page within w_test_tcp
int X=27
int Y=36
int Width=2935
int Height=1040
int TabOrder=10
BorderStyle BorderStyle=StyleRaised!
end type

event constructor;call super::constructor;window lw_window
datawindow	ldw_1
lw_window	= parent
this.of_init( lw_window	, ldw_1 )  		
this.ii_timeout = 10
end event

on uo_1.destroy
call uo_vzt_tcp_metro_page::destroy
end on

