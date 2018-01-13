$PBExportHeader$w_progress_window.srw
forward
global type w_progress_window from window
end type
type st_message from statictext within w_progress_window
end type
type cb_1 from commandbutton within w_progress_window
end type
end forward

global type w_progress_window from window
integer x = 672
integer y = 264
integer width = 1723
integer height = 376
boolean titlebar = true
string title = "Progress Window"
windowtype windowtype = popup!
long backcolor = 134217750
st_message st_message
cb_1 cb_1
end type
global w_progress_window w_progress_window

type variables
str_progress istr_progress

window iw_callingwindow
end variables

forward prototypes
public subroutine wf_center_window ()
public subroutine wf_set_message (string as_message)
end prototypes

public subroutine wf_center_window ();environment env
integer rtn

rtn = GetEnvironment(env)

IF rtn <> 1 THEN RETURN


This.x = pixelstounits(( env.screenwidth / 2 )  - (unitstopixels(this.width / 2,xunitstopixels!)),xpixelstounits!)
this.y = pixelstounits(( env.screenheight / 2 ) - (unitstopixels(this.height / 2,yunitstopixels!)),ypixelstounits!)


end subroutine

public subroutine wf_set_message (string as_message);st_message.text = as_message
end subroutine

event open;istr_progress = message.powerobjectparm

this.title       = istr_progress.ss_title
iw_callingwindow = istr_progress.sw_callingwindow
st_message.text  = istr_progress.ss_message
wf_center_window()
If IsValid( w_main) then 
	w_main.enabled = FALSE
end if	
end event

on w_progress_window.create
this.st_message=create st_message
this.cb_1=create cb_1
this.Control[]={this.st_message,&
this.cb_1}
end on

on w_progress_window.destroy
destroy(this.st_message)
destroy(this.cb_1)
end on

event close;if isValid(w_main) then
	w_main.enabled = true
end if	
end event

type st_message from statictext within w_progress_window
integer x = 9
integer y = 24
integer width = 1682
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long backcolor = 79741120
boolean enabled = false
string text = "none"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_progress_window
integer x = 709
integer y = 152
integer width = 293
integer height = 108
integer taborder = 2
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string text = "Cancel"
boolean cancel = true
end type

event clicked;iw_callingwindow.triggerevent("ue_cancelquery")
close(parent)
end event

