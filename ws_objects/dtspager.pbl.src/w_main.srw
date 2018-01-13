$PBExportHeader$w_main.srw
forward
global type w_main from Window
end type
type mdi_1 from mdiclient within w_main
end type
end forward

global type w_main from Window
int X=1074
int Y=480
int Width=2533
int Height=1520
boolean TitleBar=true
string Title="Paging System"
string MenuName="m_main"
long BackColor=80269528
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
WindowState WindowState=maximized!
WindowType WindowType=mdihelp!
mdi_1 mdi_1
end type
global w_main w_main

on w_main.create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;m_main.m_file.m_close.Enabled = true
m_main.m_file.m_print.Enabled = true
timer(1,this)
OpenSheet( w_send_page, "w_send_page", w_main, 0, Original! )

end event

event timer;this.Title = "Paging System " + string (now(),"hh:mm:ss am/pm")
end event

event close;if IsValid(gnv_appman) then destroy gnv_appman
HALT CLOSE
end event

type mdi_1 from mdiclient within w_main
long BackColor=276856960
end type

