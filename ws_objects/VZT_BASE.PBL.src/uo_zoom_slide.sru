$PBExportHeader$uo_zoom_slide.sru
forward
global type uo_zoom_slide from UserObject
end type
type cb_100_p from commandbutton within uo_zoom_slide
end type
type hsb_zoom_p from hscrollbar within uo_zoom_slide
end type
type cb_100 from commandbutton within uo_zoom_slide
end type
type hsb_zoom from hscrollbar within uo_zoom_slide
end type
end forward

global type uo_zoom_slide from UserObject
int Width=795
int Height=172
long BackColor=12632256
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=16777215
cb_100_p cb_100_p
hsb_zoom_p hsb_zoom_p
cb_100 cb_100
hsb_zoom hsb_zoom
end type
global uo_zoom_slide uo_zoom_slide

type variables
uo_vzt_dwbase  dw_target
integer ii_line = 5, ii_page = 10 , ii_max = 300, ii_min = 10
end variables

forward prototypes
public function integer uf_settarget (ref datawindow adw_target)
end prototypes

public function integer uf_settarget (ref datawindow adw_target);If not IsValid( adw_target) or IsNUll( adw_target ) then return -1
this.dw_target = adw_target 
integer li_zoom , li_zoom_p 
if Not IsValid( this.dw_target.Object ) then return -1
li_zoom = integer( this.dw_target.Object.DataWindow.Zoom )

hsb_zoom.position = li_zoom 
cb_100.text = 'zoom '+ string ( li_zoom ) + '%'

If trim(upper(string(dw_target.Object.DataWindow.Print.Preview))) = 'YES' then
	li_zoom_p = integer( dw_target.Object.DataWindow.Print.Preview.Zoom )
//	hsb_zoom.width = 371
//	cb_100.width = 371
	cb_100_p.text = 'zoom ' + string ( li_zoom_p) +'%'
	hsb_zoom_p.x			= hsb_zoom.x
	cb_100_p.x				= cb_100.x
	hsb_zoom.visible 		= false
	cb_100.visible			= false
	hsb_zoom_p.visible 	= true 
	cb_100_p.visible 		= true 
Else
//	hsb_zoom.width = 700
//	cb_100.width 	= 700	
	hsb_zoom_p.visible 	= false
	cb_100_p.visible 		= false
	hsb_zoom.visible 		= true
	cb_100.visible			= true
	
End If

return 1
end function

on uo_zoom_slide.create
this.cb_100_p=create cb_100_p
this.hsb_zoom_p=create hsb_zoom_p
this.cb_100=create cb_100
this.hsb_zoom=create hsb_zoom
this.Control[]={this.cb_100_p,&
this.hsb_zoom_p,&
this.cb_100,&
this.hsb_zoom}
end on

on uo_zoom_slide.destroy
destroy(this.cb_100_p)
destroy(this.hsb_zoom_p)
destroy(this.cb_100)
destroy(this.hsb_zoom)
end on

event constructor;// modify in the descendant as desired 

//ii_line 	= 10				// line increment
//ii_page	= 20				// page increment
//ii_max		= 300				// max zoom
//ii_min		= 10 				// min zoom
//
//dw_target = dw_primary 	// target dw
hsb_zoom.maxposition = ii_max		
hsb_zoom.minposition = ii_min 

end event

type cb_100_p from commandbutton within uo_zoom_slide
int X=398
int Y=88
int Width=366
int Height=68
int TabOrder=10
boolean Visible=false
string Text="zoom 100%"
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if IsNull(dw_target) or not IsValid( dw_target) then return
//If IsNull(dw_target.dataobject ) or trim(dw_target.dataobject) = '' then return
dw_target.Object.DataWindow.Print.Preview.Zoom = '100'
hsb_zoom.position = 100
this.text = 'zoom 100%' 
end event

type hsb_zoom_p from hscrollbar within uo_zoom_slide
int X=398
int Y=12
int Width=370
int Height=64
boolean Visible=false
boolean Enabled=false
int MinPosition=10
int MaxPosition=200
int Position=100
end type

event lineleft;if IsNull(dw_target) or not IsValid( dw_target) then return
dw_target.Object.DataWindow.Print.Preview.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Print.Preview.Zoom ) - ii_line ))
cb_100_p.text = 'zoom ' + String ( dw_target.Object.DataWindow.Print.Preview.Zoom ) +'%'
hsb_zoom_p.position = Integer ( dw_target.Object.DataWindow.Print.Preview.Zoom  ) 

end event

event moved;if IsNull(dw_target) or not IsValid( dw_target) then return
dw_target.Object.DataWindow.Print.Preview.Zoom = string( integer (scrollpos / 5) * 5 ) 
cb_100_p.text = 'zoom ' + String ( dw_target.Object.DataWindow.Print.Preview.Zoom ) +'%'

end event

event pageleft;if IsNull(dw_target) or not IsValid( dw_target) then return
dw_target.Object.DataWindow.Print.Preview.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Print.Preview.Zoom ) - ii_page ))
cb_100_p.text = 'zoom ' + String ( dw_target.Object.DataWindow.Print.Preview.Zoom ) +'%'
hsb_zoom_p.position = Integer ( dw_target.Object.DataWindow.Print.Preview.Zoom  ) 

end event

event pageright;if IsNull(dw_target) or not IsValid( dw_target) then return
dw_target.Object.DataWindow.Print.Preview.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Print.Preview.Zoom ) + ii_page ))
cb_100_p.text = 'zoom ' + String ( dw_target.Object.DataWindow.Print.Preview.Zoom ) +'%'
hsb_zoom_p.position = Integer ( dw_target.Object.DataWindow.Print.Preview.Zoom  ) 

end event

event lineright;if IsNull(dw_target) or not IsValid( dw_target) then return
dw_target.Object.DataWindow.Print.Preview.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Print.Preview.Zoom ) + ii_line ))
cb_100_p.text = 'zoom ' + String ( dw_target.Object.DataWindow.Print.Preview.Zoom ) +'%'
hsb_zoom_p.position = Integer ( dw_target.Object.DataWindow.Print.Preview.Zoom  ) 

end event

type cb_100 from commandbutton within uo_zoom_slide
int Y=88
int Width=366
int Height=68
int TabOrder=20
string Text="zoom 100%"
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if IsNull(dw_target) or not IsValid( dw_target) then return
//If IsNull(dw_target.dataobject ) or trim(dw_target.dataobject) = '' then return
dw_target.Object.DataWindow.Zoom = '100'
hsb_zoom.position = 100
this.text = 'zoom 100%' 
end event

type hsb_zoom from hscrollbar within uo_zoom_slide
int Y=12
int Width=370
int Height=64
boolean Enabled=false
int MinPosition=10
int MaxPosition=200
int Position=100
end type

event moved;if IsNull(dw_target) or not IsValid( dw_target) then return
if Not IsValid( dw_target.Object ) then return

//If IsNull(dw_target.dataobject ) or trim(dw_target.dataobject) = '' then return
dw_target.Object.DataWindow.Zoom = string( integer (scrollpos / 5) * 5 ) 
cb_100.text = 'zoom ' + String ( dw_target.Object.DataWindow.Zoom ) + '%'
end event

event lineleft;if IsNull(dw_target) or not IsValid( dw_target) then return
if Not IsValid( dw_target.Object ) then return

dw_target.Object.DataWindow.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Zoom )- ii_line ))
cb_100.text = 'zoom ' + String ( dw_target.Object.DataWindow.Zoom ) + '%'
hsb_zoom.position = Integer ( dw_target.Object.DataWindow.Zoom ) 
end event

event pageleft;if IsNull(dw_target) or not IsValid( dw_target) then return
if Not IsValid( dw_target.Object ) then return

dw_target.Object.DataWindow.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Zoom )- ii_page ))
cb_100.text = 'zoom ' + String ( dw_target.Object.DataWindow.Zoom ) + '%'
hsb_zoom.position = Integer ( dw_target.Object.DataWindow.Zoom ) 
end event

event lineright;if IsNull(dw_target) or not IsValid( dw_target) then return
if Not IsValid( dw_target.Object ) then return

//If IsNull(dw_target.dataobject ) or trim(dw_target.dataobject) = '' then return
dw_target.Object.DataWindow.Zoom = string( MIn(ii_max, integer( dw_target.Object.DataWindow.Zoom) + ii_line ))
cb_100.text = 'zoom ' + String ( dw_target.Object.DataWindow.Zoom ) + '%'
hsb_zoom.position = Integer ( dw_target.Object.DataWindow.Zoom ) 
end event

event pageright;if IsNull(dw_target) or not IsValid( dw_target) then return
if Not IsValid( dw_target.Object ) then return

if IsNull(dw_target) or not IsValid( dw_target) then return
dw_target.Object.DataWindow.Zoom = string ( MAX(ii_min, integer( dw_target.Object.DataWindow.Zoom ) + ii_page ))
cb_100.text = 'zoom ' + String ( dw_target.Object.DataWindow.Zoom ) + '%'
hsb_zoom.position = Integer ( dw_target.Object.DataWindow.Zoom ) 
end event

