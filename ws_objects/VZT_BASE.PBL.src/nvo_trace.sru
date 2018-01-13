$PBExportHeader$nvo_trace.sru
forward
global type nvo_trace from userobject
end type
type cb_view from commandbutton within nvo_trace
end type
type cb_2 from commandbutton within nvo_trace
end type
type sle_file from singlelineedit within nvo_trace
end type
type st_1 from statictext within nvo_trace
end type
type cbx_trace from checkbox within nvo_trace
end type
end forward

global type nvo_trace from userobject
integer width = 987
integer height = 96
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event type integer ue_trace ( string as_header,  string as_text )
cb_view cb_view
cb_2 cb_2
sle_file sle_file
st_1 st_1
cbx_trace cbx_trace
end type
global nvo_trace nvo_trace

event ue_trace;If not cbx_trace.checked then 
	// display msg only when DEBUG!
	if f_isdebug() then 
		MessageBox( as_header, as_text)
	end if
Else // trace checked 
	string ls_file, ls_sep
	ls_sep = '----------------------------------------------------'
	ls_file = sle_file.text
	long lfile
	If ls_file <> "" then
		lfile = FileOpen( ls_file, linemode!, write!)
		FileWrite (lfile , ls_sep)
		FileWrite (lfile , as_header)
		FileWrite (lfile , as_text )
		FileWrite (lfile , ls_sep)
		FileClose(lfile ) 
	END IF
END IF
return 0
end event

on nvo_trace.create
this.cb_view=create cb_view
this.cb_2=create cb_2
this.sle_file=create sle_file
this.st_1=create st_1
this.cbx_trace=create cbx_trace
this.Control[]={this.cb_view,&
this.cb_2,&
this.sle_file,&
this.st_1,&
this.cbx_trace}
end on

on nvo_trace.destroy
destroy(this.cb_view)
destroy(this.cb_2)
destroy(this.sle_file)
destroy(this.st_1)
destroy(this.cbx_trace)
end on

event constructor;st_1.backcolor = this.backcolor
cbx_trace.backcolor = this.backcolor
end event

type cb_view from commandbutton within nvo_trace
integer x = 727
integer y = 4
integer width = 137
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "view"
end type

event clicked;If FileExists(sle_file.text) then
	Run( "notepad.exe " + sle_file.text )
END IF
end event

type cb_2 from commandbutton within nvo_trace
integer x = 571
integer y = 4
integer width = 155
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "erase"
end type

event clicked;If FileExists(sle_file.text) then FileDelete(sle_file.text)


end event

type sle_file from singlelineedit within nvo_trace
integer x = 206
integer y = 4
integer width = 357
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "c:\trace01.txt"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within nvo_trace
integer x = 87
integer y = 12
integer width = 128
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "trace"
boolean focusrectangle = false
end type

type cbx_trace from checkbox within nvo_trace
integer y = 4
integer width = 69
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

