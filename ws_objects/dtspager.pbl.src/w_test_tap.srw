$PBExportHeader$w_test_tap.srw
forward
global type w_test_tap from Window
end type
type st_port from statictext within w_test_tap
end type
type sle_port from singlelineedit within w_test_tap
end type
type cb_closelink from commandbutton within w_test_tap
end type
type cb_openlink from commandbutton within w_test_tap
end type
type st_5 from statictext within w_test_tap
end type
type sle_1 from singlelineedit within w_test_tap
end type
type st_4 from statictext within w_test_tap
end type
type sle_timer from singlelineedit within w_test_tap
end type
type st_3 from statictext within w_test_tap
end type
type sle_err from singlelineedit within w_test_tap
end type
type cb_2 from commandbutton within w_test_tap
end type
type st_2 from statictext within w_test_tap
end type
type sle_pager from singlelineedit within w_test_tap
end type
type st_1 from statictext within w_test_tap
end type
type sle_msg from singlelineedit within w_test_tap
end type
type cb_1 from commandbutton within w_test_tap
end type
type ole_1 from olecustomcontrol within w_test_tap
end type
end forward

global type w_test_tap from Window
int X=1074
int Y=484
int Width=2574
int Height=1332
boolean TitleBar=true
string Title="Test TAP "
long BackColor=79349703
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
st_port st_port
sle_port sle_port
cb_closelink cb_closelink
cb_openlink cb_openlink
st_5 st_5
sle_1 sle_1
st_4 st_4
sle_timer sle_timer
st_3 st_3
sle_err sle_err
cb_2 cb_2
st_2 st_2
sle_pager sle_pager
st_1 st_1
sle_msg sle_msg
cb_1 cb_1
ole_1 ole_1
end type
global w_test_tap w_test_tap

type variables
integer errorNo
integer currentStage
integer retryCount
integer delayCount
string errorDesc
string comStr
boolean msg1Sent
boolean msg2Sent
boolean linkOpen 

end variables

forward prototypes
public function string calcchecksum (string pagerid, string msg)
public function boolean send_tap_page (string pagerid, string msg)
public function boolean wait_id ()
public subroutine send_cr ()
public subroutine send_escape_pg1 ()
public function boolean wait_ack1 ()
public subroutine send_message (string msg)
public function boolean wait_ack2 ()
public subroutine send_eot ()
public function string calc_checksum (string msg)
public function boolean openlink ()
public function boolean sending_msg (string pagerid, string msg)
public function boolean check_ack2 ()
end prototypes

public function string calcchecksum (string pagerid, string msg);string 	tmpStr,sum1,sum2,sum3,calcCheckSum
long 		tmpCheckSum
long 		ix,n1,n2,n3

tmpStr = char(CODE_STX) + pagerid + char(CODE_CR) + msg + char(CODE_CR) + char(CODE_ETX)
//tmpStr = char(CODE_STX) + pagerid + char(13) + msg + char(13) + char(3)
for ix = 1 to len(tmpStr)
	tmpCheckSum = tmpCheckSum + asc(mid(tmpStr,ix,1))
next
//sum1 = string(mod(integer(tmpCheckSum)/256,16))
//sum2 = string(mod(integer(tmpCheckSum)/16,16))
//sum3 = string(mod(integer(tmpCheckSum),16))

n1 = mod(integer(tmpCheckSum)/256,16)
n2 = mod(integer(tmpCheckSum)/16,16)
n3 = mod(integer(tmpCheckSum),16)

calcCheckSum=char(n1+48)+char(n2+48)+char(n3+48)
return calcCheckSum
end function

public function boolean send_tap_page (string pagerid, string msg);string checkSum
boolean messageSent
string tmpMsg

retryCount = 1
messageSent = false
msg1Sent = false
msg2Sent = false
currentStage = sndSendCR
errorDesc = ""
errorNo = errNoError

do while errorNo = errNoError and messageSent = false
	if currentStage = sndSendCR then
		ole_1.object.InBufferCount = 0
		send_cr()
	end if
	if currentStage = sndWaitID then
		delayCount = 0
		if wait_id() then
//			messagebox("done","wait_id!")
			sle_1.text = "wait_id done!"
		end if
	end if
	if currentStage = sndSendPG1 then
		ole_1.object.InBufferCount = 0
		send_escape_pg1()
	end if
	if currentStage = sndWaitAck1 then
		delayCount = 0
		if wait_ack1() then
//			messagebox("done","wait_ack1!")
			sle_1.text = "wait_ack1 done!"
		end if
	end if
	if currentStage = sndSendMessage then
		ole_1.object.InBufferCount = 0
//		if msg1Sent = false then
			tmpMsg = char(CODE_STX) + pagerid + char(CODE_CR) + msg + char(CODE_CR) + char(CODE_ETX)
//		else
//			tmpMsg = char(CODE_STX) + pagerid + char(CODE_CR) + sle_msg2.text + char(CODE_CR) + char(CODE_ETX)
//		end if
		checkSum = calc_checksum(tmpMsg)
		tmpMsg = tmpMsg + checkSum + char(CODE_CR)
		send_message(tmpMsg)
	end if
	if currentStage = sndWaitAck2 then
		delayCount = 0
		if wait_ack2() then
			sle_1.text = "wait_ack2 done!"
		end if
	end if
	if currentStage = sndSendEOT then
		ole_1.object.InBufferCount = 0
		send_eot()
		messageSent = true
	end if
loop

if errorNo <> errNoError then
	messageSent = false
	if errorNo = errWaitID then
		errorDesc = "No ID!"
	elseif errorNo = errWaitAck1 then
		errorDesc = "No Acknowledge 1!"
	elseif errorNo = errWaitAck2 then
		errorDesc = "No Acknowledge 2!"
	end if
else
	messageSent = true
end if
sle_err.text = errorDesc
return messageSent

end function

public function boolean wait_id ();
string inputBuffer
boolean waitID 
waitID = false
do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
	yield()
loop

inputBuffer = trim(ole_1.object.Input)
if left(inputBuffer,3) = "ID=" then
	waitID = true
	currentStage = sndSendPG1
	retryCount = 1
else
	waitId = false
	currentStage = sndSendCR
	retryCount = retryCount + 1
end if
if retryCount > MAX_RETRIES then
	retryCount = 1
	errorNo = errWaitID
end if

return waitId

	
end function

public subroutine send_cr ();comStr = char(CODE_CR)
ole_1.object.Output = comStr
sle_1.text = "Send CR!"
currentStage = sndWaitID
end subroutine

public subroutine send_escape_pg1 ();comStr = char(CODE_ESC) + "PG1" + char(CODE_CR)
ole_1.object.Output = comStr
currentStage = sndWaitAck1

end subroutine

public function boolean wait_ack1 ();
string inputBuffer
boolean waitAck1
if not isValid( w_test_tap) then return false
waitAck1 = false
do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
	yield()
loop

inputBuffer = trim(ole_1.object.input)
if Right(inputBuffer,3) = "[p"+char(CODE_CR) then
	waitAck1 = true
	currentStage = sndSendMessage
	retryCount = 1
else
	currentStage = sndSendPG1
	retryCount = retryCount + 1
end if
if retryCount > MAX_RETRIES then
	retryCount = 1
	errorNo = errWaitAck1
end if
return waitAck1
end function

public subroutine send_message (string msg);ole_1.object.OutPut = msg
currentStage = sndWaitAck2

end subroutine

public function boolean wait_ack2 ();string inputBuffer
boolean waitAck2

if not isValid( w_test_tap) then return false
waitAck2 = false
do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
	yield()
loop

inputBuffer = trim(ole_1.object.Input)
if right(inputBuffer,2) = char(CODE_ACK) + char(CODE_CR) then
	waitAck2 = true
	retryCount = 1
	
//	if msg1Sent = false then
//		msg1Sent = true
//		currentStage = sndSendMessage
//	else
//		msg2Sent = true
		currentStage = sndSendEOT
//	end if
else
	if left(inputBuffer,2) = char(CODE_NAK) + char(CODE_CR) then
		currentStage = sndSendMessage
		retryCount = retryCount + 1
	end if
end if
if retryCount > MAX_RETRIES then
	retryCount = 1
	errorNo = errWaitAck2
end if
return waitAck2



end function

public subroutine send_eot ();ole_1.object.Output = char(CODE_EOT) + char(CODE_CR)
currentStage = sndWaitAck2
end subroutine

public function string calc_checksum (string msg);string 	tmpMsg,sum1,sum2,sum3,calcCheckSum
long 		tmpCheckSum
long 		ix,n1,n2,n3

tmpMsg = msg
//tmpStr = char(CODE_STX) + pagerid + char(13) + msg + char(13) + char(3)
for ix = 1 to len(tmpMsg)
	tmpCheckSum = tmpCheckSum + asc(mid(tmpMsg,ix,1))
next
//sum1 = string(mod(integer(tmpCheckSum)/256,16))
//sum2 = string(mod(integer(tmpCheckSum)/16,16))
//sum3 = string(mod(integer(tmpCheckSum),16))

n1 = mod(integer(tmpCheckSum)/256,16)
n2 = mod(integer(tmpCheckSum)/16,16)
n3 = mod(integer(tmpCheckSum),16)

calcCheckSum=char(n1+48)+char(n2+48)+char(n3+48)
return calcCheckSum
end function

public function boolean openlink ();
retryCount = 1
currentStage = sndSendCR
errorDesc = ""
errorNo = errNoError
linkOpen = false

do while errorNo = errNoError and linkOpen = false
	if currentStage = sndSendCR then
		ole_1.object.InBufferCount = 0
		send_cr()
	end if
	if currentStage = sndWaitID then
		delayCount = 0
		if wait_id() then
			sle_1.text = "wait_id done!"
		end if
	end if
	if currentStage = sndSendPG1 then
		ole_1.object.InBufferCount = 0
		send_escape_pg1()
	end if
	if currentStage = sndWaitAck1 then
		delayCount = 0
		if wait_ack1() then
			sle_1.text = "wait_ack1 done!"
		end if
	end if
	if currentStage = sndSendMessage then
		linkOpen = true
	end if
loop

if errorNo <> errNoError then
	linkOpen = false
	if errorNo = errWaitID then
		errorDesc = "No ID!"
	elseif errorNo = errWaitAck1 then
		errorDesc = "No Acknowledge 1!"
	elseif errorNo = errWaitAck2 then
		errorDesc = "No Acknowledge 2!"
	end if
else
	linkOpen = true
end if
sle_err.text = errorDesc
return linkOpen

end function

public function boolean sending_msg (string pagerid, string msg);string checkSum
boolean messageSent
string tmpMsg

retryCount = 1
messageSent = false
currentStage = sndSendMessage
errorDesc = ""
errorNo = errNoError

do while errorNo = errNoError and messageSent = false
	if currentStage = sndSendMessage then
		ole_1.object.InBufferCount = 0
		tmpMsg = char(CODE_STX) + pagerid + char(CODE_CR) + left(msg,248) + char(CODE_CR) + char(CODE_ETX)
		checkSum = calc_checksum(tmpMsg)
		tmpMsg = tmpMsg + checkSum + char(CODE_CR)
		send_message(tmpMsg)
	end if
	if currentStage = sndWaitAck2 then
		delayCount = 0
		if wait_ack2() then
			messageSent = true
		end if
	end if
loop

if errorNo <> errNoError then
	messageSent = false
	if errorNo = errWaitID then
		errorDesc = "No ID!"
	elseif errorNo = errWaitAck1 then
		errorDesc = "No Acknowledge 1!"
	elseif errorNo = errWaitAck2 then
		errorDesc = "No Acknowledge 2!"
	end if
else
	messageSent = true
end if
sle_err.text = errorDesc
return messageSent

end function

public function boolean check_ack2 ();string inputBuffer
boolean waitAck2

if not isValid( w_test_tap) then return false
waitAck2 = false

do while ole_1.object.InBufferCount = 0 and delayCount < MAX_DELAY
	yield()
loop

inputBuffer = trim(ole_1.object.Input)
if right(inputBuffer,2) = char(CODE_ACK) + char(CODE_CR) then
	waitAck2 = true
	retryCount = 1
else
	if left(inputBuffer,2) = char(CODE_NAK) + char(CODE_CR) then
		currentStage = sndSendMessage
		retryCount = retryCount + 1
	end if
end if
if retryCount > MAX_RETRIES then
	retryCount = 1
	errorNo = errWaitAck2
end if
return waitAck2



end function

on w_test_tap.create
this.st_port=create st_port
this.sle_port=create sle_port
this.cb_closelink=create cb_closelink
this.cb_openlink=create cb_openlink
this.st_5=create st_5
this.sle_1=create sle_1
this.st_4=create st_4
this.sle_timer=create sle_timer
this.st_3=create st_3
this.sle_err=create sle_err
this.cb_2=create cb_2
this.st_2=create st_2
this.sle_pager=create sle_pager
this.st_1=create st_1
this.sle_msg=create sle_msg
this.cb_1=create cb_1
this.ole_1=create ole_1
this.Control[]={this.st_port,&
this.sle_port,&
this.cb_closelink,&
this.cb_openlink,&
this.st_5,&
this.sle_1,&
this.st_4,&
this.sle_timer,&
this.st_3,&
this.sle_err,&
this.cb_2,&
this.st_2,&
this.sle_pager,&
this.st_1,&
this.sle_msg,&
this.cb_1,&
this.ole_1}
end on

on w_test_tap.destroy
destroy(this.st_port)
destroy(this.sle_port)
destroy(this.cb_closelink)
destroy(this.cb_openlink)
destroy(this.st_5)
destroy(this.sle_1)
destroy(this.st_4)
destroy(this.sle_timer)
destroy(this.st_3)
destroy(this.sle_err)
destroy(this.cb_2)
destroy(this.st_2)
destroy(this.sle_pager)
destroy(this.st_1)
destroy(this.sle_msg)
destroy(this.cb_1)
destroy(this.ole_1)
end on

event open;if ole_1.object.PortOpen = false then
	ole_1.object.CommPort = integer( sle_port.text) 
	ole_1.object.Settings = "9600,N,8,1"
	ole_1.object.InputLen = 0
	ole_1.object.InputMode = 0 // comInputModeText
	ole_1.object.PortOpen = TRUE
end if

end event

event close;if ole_1.object.PortOpen = true then
	ole_1.object.OutBufferCount=0
	comStr = char(CODE_EOT)+char(CODE_CR)
	ole_1.object.output = comStr
	ole_1.object.PortOpen = FALSE
end if
end event

event timer;delayCount = delayCount + 1
//messagebox('delaycount',string(delaycount))
//timer(0)
sle_timer.text = string(delayCount)
end event

type st_port from statictext within w_test_tap
int X=965
int Y=64
int Width=421
int Height=76
boolean Enabled=false
string Text="Port:"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_port from singlelineedit within w_test_tap
int X=983
int Y=168
int Width=247
int Height=92
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
string Text="4"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_closelink from commandbutton within w_test_tap
int X=1234
int Y=1028
int Width=370
int Height=108
int TabOrder=90
string Text="Close Link"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;send_eot()
end event

type cb_openlink from commandbutton within w_test_tap
int X=197
int Y=1028
int Width=338
int Height=108
int TabOrder=70
string Text="Open Link"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;timer(.1)
if parent.openlink() = false then
	messagebox("error","Can't open comm link!")
else
	sle_1.text = "Link Opened!"
end if
timer(0)
end event

type st_5 from statictext within w_test_tap
int X=192
int Y=784
int Width=270
int Height=76
boolean Enabled=false
string Text="Progress "
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_test_tap
int X=192
int Y=884
int Width=2272
int Height=92
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_test_tap
int X=1225
int Y=564
int Width=361
int Height=76
boolean Enabled=false
string Text="timer counter"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_timer from singlelineedit within w_test_tap
int X=1239
int Y=668
int Width=265
int Height=92
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_test_tap
int X=192
int Y=564
int Width=402
int Height=76
boolean Enabled=false
string Text="Error Message"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_err from singlelineedit within w_test_tap
int X=192
int Y=664
int Width=969
int Height=92
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_test_tap
int X=2080
int Y=1020
int Width=325
int Height=108
int TabOrder=80
string Text="Open Port"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if ole_1.object.PortOpen = false then
	ole_1.object.CommPort = 1
	ole_1.object.Settings = "9600,N,8,1"
	ole_1.object.InputLen = 0
	ole_1.object.InputMode = 0 // comInputModeText
	ole_1.object.PortOpen = TRUE
end if
end event

type st_2 from statictext within w_test_tap
int X=192
int Y=60
int Width=421
int Height=76
boolean Enabled=false
string Text="Pager Number"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_pager from singlelineedit within w_test_tap
int X=192
int Y=168
int Width=247
int Height=92
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
string Text="100"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_test_tap
int X=192
int Y=336
int Width=686
int Height=76
boolean Enabled=false
string Text="Type Your Message Here"
boolean FocusRectangle=false
long BackColor=79349703
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_msg from singlelineedit within w_test_tap
int X=192
int Y=432
int Width=1408
int Height=92
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
string Text="ming"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_test_tap
int X=731
int Y=1028
int Width=306
int Height=108
int TabOrder=100
string Text="Send"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;sle_err.text = ''
//send_tap_page(sle_pager.text,sle_msg.text)
timer(.1)
if sending_msg(sle_pager.text,sle_msg.text) then
	sle_1.text = "Page sent!"
end if
timer(0)

end event

type ole_1 from olecustomcontrol within w_test_tap
event oncomm ( )
int X=2290
int Y=20
int Width=174
int Height=152
int TabOrder=10
long BackColor=16777215
string BinaryKey="w_test_tap.win"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
01w_test_tap.bin 
2A00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000009b8fc0e001c1941800000003000000800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000260000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004648a5600101b2c6e0000b68214000000000000009b8fc0e001c194189b8fc0e001c19418000000000000000000000000fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00430079007000690072006800670020007400630028002000290039003100340039000000200000000000000000000000000000000000000000000000001234432100000008000003ed000003ed648a560100050000000400000000040000000200000025800008000000000000000000000000003f0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000003c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11w_test_tap.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
