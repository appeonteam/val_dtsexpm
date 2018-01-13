$PBExportHeader$w_vzt_pagerange.srw
forward
global type w_vzt_pagerange from Window
end type
type cb_setup from commandbutton within w_vzt_pagerange
end type
type cb_cancel from commandbutton within w_vzt_pagerange
end type
type cb_print from commandbutton within w_vzt_pagerange
end type
type dw_pagerange from datawindow within w_vzt_pagerange
end type
end forward

global type w_vzt_pagerange from Window
int X=1074
int Y=484
int Width=1650
int Height=704
boolean TitleBar=true
string Title="Print"
long BackColor=79349703
boolean ControlMenu=true
WindowType WindowType=response!
cb_setup cb_setup
cb_cancel cb_cancel
cb_print cb_print
dw_pagerange dw_pagerange
end type
global w_vzt_pagerange w_vzt_pagerange

type variables
datawindow idw_target // call  argument dw to be printed
end variables

on w_vzt_pagerange.create
this.cb_setup=create cb_setup
this.cb_cancel=create cb_cancel
this.cb_print=create cb_print
this.dw_pagerange=create dw_pagerange
this.Control[]={this.cb_setup,&
this.cb_cancel,&
this.cb_print,&
this.dw_pagerange}
end on

on w_vzt_pagerange.destroy
destroy(this.cb_setup)
destroy(this.cb_cancel)
destroy(this.cb_print)
destroy(this.dw_pagerange)
end on

event open;idw_target = Message.PowerobjectParm
if IsNull( idw_target ) or NOT IsValid( idw_target ) then 
	close(this)
	return
End IF

dw_pagerange.insertRow(0)
end event

type cb_setup from commandbutton within w_vzt_pagerange
int X=1147
int Y=260
int Width=443
int Height=80
int TabOrder=10
string Text="Printer Setup"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;printsetup()
end event

type cb_cancel from commandbutton within w_vzt_pagerange
int X=1147
int Y=156
int Width=443
int Height=80
int TabOrder=20
string Text="Cancel"
boolean Cancel=true
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn( parent, '0')
end event

type cb_print from commandbutton within w_vzt_pagerange
int X=1147
int Y=52
int Width=443
int Height=80
int TabOrder=30
string Text="OK"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if dw_pagerange.accepttext () <= 0 then return

If upper(trim( dw_pagerange.object.pagerange [1])) <> 'A' then 
	idw_target.object.Datawindow.Print.Page.Range = dw_pagerange.object.pages [1]
Else
	idw_target.object.Datawindow.Print.Page.Range = ''
END IF

idw_target.object.Datawindow.Print.Page.RangeInclude	= dw_pagerange.object.print_in_range [1]
idw_target.object.Datawindow.Print.Copies 				= string( dw_pagerange.object.copies [1])
idw_target.object.Datawindow.Print.Collate				= trim(dw_pagerange.object.collate [1])
idw_target.object.Datawindow.Print.quality				= '1' // high
closewithreturn(parent, '1')
end event

type dw_pagerange from datawindow within w_vzt_pagerange
int Width=1600
int Height=580
int TabOrder=1
string DataObject="d_vzt_pagerange"
boolean Border=false
boolean LiveScroll=true
end type

