$PBExportHeader$u_analog_clock.sru
$PBExportComments$Graphic analog clock
forward
global type u_analog_clock from UserObject
end type
type st_7 from statictext within u_analog_clock
end type
type st_4 from statictext within u_analog_clock
end type
type st_10 from statictext within u_analog_clock
end type
type st_1 from statictext within u_analog_clock
end type
type st_5 from statictext within u_analog_clock
end type
type st_3 from statictext within u_analog_clock
end type
type st_6 from statictext within u_analog_clock
end type
type st_2 from statictext within u_analog_clock
end type
type st_11 from statictext within u_analog_clock
end type
type st_9 from statictext within u_analog_clock
end type
type st_12 from statictext within u_analog_clock
end type
type st_8 from statictext within u_analog_clock
end type
type oval_1 from oval within u_analog_clock
end type
type ln_seconds from line within u_analog_clock
end type
type ln_hours from line within u_analog_clock
end type
type ln_minutes from line within u_analog_clock
end type
end forward

global type u_analog_clock from UserObject
int Width=617
int Height=468
boolean Border=true
long BackColor=8388608
long PictureMaskColor=25166016
long TabBackColor=67108864
string Pointer="HAND.CUR"
event timer pbm_timer
st_7 st_7
st_4 st_4
st_10 st_10
st_1 st_1
st_5 st_5
st_3 st_3
st_6 st_6
st_2 st_2
st_11 st_11
st_9 st_9
st_12 st_12
st_8 st_8
oval_1 oval_1
ln_seconds ln_seconds
ln_hours ln_hours
ln_minutes ln_minutes
end type
global u_analog_clock u_analog_clock

type variables
int midx, midy
boolean showing
int oldx2, oldx3, oldy2, oldy3
end variables

forward prototypes
public subroutine start_ticking ()
public subroutine stop_ticking ()
end prototypes

event timer;//Timer script for u_analog_clock

real xx
int x2, y2, x3, y3

// initialize first time in
if showing = false then
	// Save midpoint of workspace in instance variables midx and midy.
	// This is the center of the clock. 
	midy = this.height/2
	midx = this.width/2

	// Set begining x & y for second, minute & hour hands
	ln_seconds.beginx=midx
	ln_seconds.beginy=midy

	ln_minutes.beginx=midx 
	ln_minutes.beginy=midy 

	ln_hours.beginx=midx 
	ln_hours.beginy=midy 
end if


// Compute and set the end x,y for seconds
xx=2*Second(Now( ))
xx=xx/60
xx=pi(xx)
// Adjust so hand is shorter than outer edge of clock 
ln_seconds.endx  =midx + 250*Sin(xx)	
ln_seconds.endy  =midy - 220*Cos(xx)

// Compute and set the end x,y for minutes
xx=2*(60*Minute(Now( )) + Second(Now( )))
xx=xx/3600
xx=Pi(xx)

// Move minute hand only when minute has changed
// Old minute is saved in instance variables x2,y2
x2=Int(midx + 240*Sin(xx))
if x2 <> oldx2 or y2 <> oldy2 then
	ln_minutes.endx  =x2
	oldx2      =x2
	y2=Int(midy - 210*Cos(xx))
	ln_minutes.endy = y2
	oldy2 = y2
end if

// Compute and set the end x,y for hours
xx = 2*(3600*Hour(Now( )) + 60*Minute(Now( )) + Second(Now( )))
xx = xx/3600
xx = xx/12
xx = Pi(xx)

// Move hour hand only when hour has changed
// Old hour is saved in instance variables x3,y3
x3 = Int(midx + 175*Sin(x))
if x3 <> oldx3 then
	ln_hours.endx  =x3
	oldx3 = x3
end if

y3=Int(midy - 155*Cos(xx))
if y3 <> oldy3 then
	ln_hours.endy  =y3
	oldy3 = y3
end if

// Make hands visible first time in
if showing = false then
	showing = true
	ln_seconds.Show( )
	ln_minutes.Show( )
	ln_hours.Show( )
end if









end event

public subroutine start_ticking ();int id
id = SetTimer (Handle (this), 1, 1000, 0)
if id = 0 then
	MessageBox ("Error!", "Unable to start timer!")
end if
end subroutine

public subroutine stop_ticking ();boolean ret
ret = KillTimer ( Handle(this), 1)
if ret = false then
	 MessageBox ("Error!", "Specified timer not active!")
end if
end subroutine

on u_analog_clock.create
this.st_7=create st_7
this.st_4=create st_4
this.st_10=create st_10
this.st_1=create st_1
this.st_5=create st_5
this.st_3=create st_3
this.st_6=create st_6
this.st_2=create st_2
this.st_11=create st_11
this.st_9=create st_9
this.st_12=create st_12
this.st_8=create st_8
this.oval_1=create oval_1
this.ln_seconds=create ln_seconds
this.ln_hours=create ln_hours
this.ln_minutes=create ln_minutes
this.Control[]={this.st_7,&
this.st_4,&
this.st_10,&
this.st_1,&
this.st_5,&
this.st_3,&
this.st_6,&
this.st_2,&
this.st_11,&
this.st_9,&
this.st_12,&
this.st_8,&
this.oval_1,&
this.ln_seconds,&
this.ln_hours,&
this.ln_minutes}
end on

on u_analog_clock.destroy
destroy(this.st_7)
destroy(this.st_4)
destroy(this.st_10)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.st_2)
destroy(this.st_11)
destroy(this.st_9)
destroy(this.st_12)
destroy(this.st_8)
destroy(this.oval_1)
destroy(this.ln_seconds)
destroy(this.ln_hours)
destroy(this.ln_minutes)
end on

type st_7 from statictext within u_analog_clock
int X=256
int Y=404
int Width=91
int Height=72
boolean Enabled=false
string Text="6"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within u_analog_clock
int X=521
int Y=204
int Width=91
int Height=72
boolean Enabled=false
string Text="3"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_10 from statictext within u_analog_clock
int Y=204
int Width=91
int Height=72
boolean Enabled=false
string Text="9"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within u_analog_clock
int X=256
int Width=91
int Height=72
boolean Enabled=false
string Text="12"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within u_analog_clock
int X=475
int Y=296
int Width=91
int Height=72
boolean Enabled=false
string Text="4"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within u_analog_clock
int X=475
int Y=116
int Width=91
int Height=72
boolean Enabled=false
string Text="2"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_6 from statictext within u_analog_clock
int X=375
int Y=380
int Width=91
int Height=72
boolean Enabled=false
string Text="5"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within u_analog_clock
int X=375
int Y=36
int Width=91
int Height=72
boolean Enabled=false
string Text="1"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_11 from statictext within u_analog_clock
int X=41
int Y=296
int Width=91
int Height=72
boolean Enabled=false
string Text="8"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within u_analog_clock
int X=41
int Y=116
int Width=91
int Height=72
boolean Enabled=false
string Text="10"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_12 from statictext within u_analog_clock
int X=133
int Y=380
int Width=91
int Height=72
boolean Enabled=false
string Text="7"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_8 from statictext within u_analog_clock
int X=133
int Y=36
int Width=91
int Height=72
boolean Enabled=false
string Text="11"
Alignment Alignment=Center!
long TextColor=65535
long BackColor=8388608
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type oval_1 from oval within u_analog_clock
int X=37
int Y=44
int Width=530
int Height=388
boolean Enabled=false
int LineThickness=4
long LineColor=8388608
long FillColor=8388608
end type

type ln_seconds from line within u_analog_clock
boolean Visible=false
boolean Enabled=false
int BeginX=306
int BeginY=248
int EndX=306
int EndY=400
int LineThickness=4
long LineColor=16776960
end type

type ln_hours from line within u_analog_clock
boolean Visible=false
boolean Enabled=false
int BeginX=306
int BeginY=212
int EndX=306
int EndY=112
int LineThickness=16
long LineColor=16776960
end type

type ln_minutes from line within u_analog_clock
boolean Visible=false
boolean Enabled=false
int BeginX=315
int BeginY=240
int EndX=512
int EndY=244
int LineThickness=8
long LineColor=16776960
end type

