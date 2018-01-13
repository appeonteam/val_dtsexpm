$PBExportHeader$w_vzt_splash.srw
forward
global type w_vzt_splash from Window
end type
end forward

global type w_vzt_splash from Window
int X=823
int Y=360
int Width=1513
int Height=876
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
end type
global w_vzt_splash w_vzt_splash

on w_vzt_splash.create
end on

on w_vzt_splash.destroy
end on

event open;long ll_timer

ll_timer = Message.DoubleParm

end event

