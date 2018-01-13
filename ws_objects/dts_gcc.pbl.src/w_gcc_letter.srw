$PBExportHeader$w_gcc_letter.srw
forward
global type w_gcc_letter from w_vzt_base_ole
end type
type cb_history from commandbutton within w_gcc_letter
end type
type cb_mail from commandbutton within w_gcc_letter
end type
type sle_1 from singlelineedit within w_gcc_letter
end type
type st_1 from statictext within w_gcc_letter
end type
type st_2 from statictext within w_gcc_letter
end type
type sle_2 from singlelineedit within w_gcc_letter
end type
type st_3 from statictext within w_gcc_letter
end type
type mle_msg from multilineedit within w_gcc_letter
end type
type dw_guest from uo_vzt_dwbase within w_gcc_letter
end type
end forward

global type w_gcc_letter from w_vzt_base_ole
integer x = 123
integer y = 160
string title = "GCC Letter template"
string menuname = ""
long backcolor = 80269528
event ue_write_history ( string as_parm )
event ue_export_link ( )
event ue_printreport ( )
event ue_emailletter ( )
event ue_emailgetparms ( )
event ue_markprinted ( )
event ue_ole_fill_template ( )
event ue_ole_set_bookmarks ( )
event ue_ole_fill_bookmarks ( )
event ue_ole_additional_bookmarks ( )
event ue_refresh_oledoc ( )
cb_history cb_history
cb_mail cb_mail
sle_1 sle_1
st_1 st_1
st_2 st_2
sle_2 sle_2
st_3 st_3
mle_msg mle_msg
dw_guest dw_guest
end type
global w_gcc_letter w_gcc_letter

type variables
str_dts_call	istr_parms
string		is_descr, is_action_code
//string		is_mailsubj
uo_vzt_mail	inv_mail
boolean		ib_edit, ib_cc_bcc=true, ib_attach=true
string		is_tempdir
//string		is_emailfile='C:\WINDOWS\TEMP\'
string		is_tempxls="gcc_oleguest.XLS"
string		is_mailtext='---'
string		is_msgtext

boolean		ib_do_excel=false, ib_fill_bookmarks=true, ib_ole_save=true
string		is_bookmarks[], is_cols [], is_ole_doc
OleObject 	wd, Ole_Doc

end variables

event ue_write_history(string as_parm);blob 		lb_object
string 	ls_error, ls_code

if not ib_ole_save then return 

this.event ue_refresh_oledoc ()

lb_object = ole_1.objectdata 
f_write_gcc_history( istr_parms.gccid, is_action_code, lb_object, is_descr+' '+as_parm, '', is_msgtext)
ole_1.ib_prompt_save = false

end event

event ue_export_link();//dw_guest.SetRedraw(false)
dw_guest.retrieve (istr_parms.gccid) 

dw_guest.object.offer  [1] = istr_parms.offer
dw_guest.object.amount [1] = istr_parms.amount
dw_guest.object.gcc_url [1] = istr_parms.gcc_url


If ib_do_excel then 
	if dw_guest.SaveAs( is_tempdir + is_tempxls, Excel5!, True) < 0 then MessageBox('Directory Error', 'Temp XLS file could not be created!', stopsign!)
ELSE
	// Ole updates via direct PB->MS WORD after activation
END IF 

sle_1.text = 'Hello...'
sle_2.text = 'GCCEMAIL'
end event

event ue_printreport;MessageBox('Print Letter', 'You must use MS Word to print letters!')
end event

event ue_emailletter;this.event ue_emailgetparms()

int li_ret
if len(istr_parms.guestemail) > 0 then 
	string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]


	ole_1.uf_savefile( is_tempdir + sle_2.text + '.DOC' )

	ls_mailtoname[1]	= istr_parms.guestname
	ls_mailtoid[1]		= istr_parms.guestemail
	
	If ib_attach then
		ls_attachfile[1]	= is_tempdir + sle_2.text + '.DOC' 
	END IF
	
	li_ret = inv_mail.uf_mail_logon() 
	// additional receipients 
	If ib_cc_bcc then 
		If MessageBox('Additional e-mail recipients', 'Would you like to add additonal recipients (i.e. cc: or bcc:)?', Question!, yesno!) = 1 then 
			li_ret = inv_mail.uf_mail_address()
		end if	
	end if	
//	if inv_mail.uf_mail_send( sle_1.text, '', ls_mailtoname[], &
	if inv_mail.uf_mail_send_no_logon( sle_1.text, is_mailtext, ls_mailtoname[], &
				ls_mailtoid[], ls_attachfile[]) > 0 then 
			this.event ue_write_history('e-mailed')
	End IF
	
End If

end event

event ue_markprinted;if ib_edit then
	long ll_ret 
	ll_ret= MessageBox('Letter Print Confirmation', 'Would you like to mark letter printed?', Question!, YesNo!,1) 
	If ll_ret = 1 then cb_history.event clicked()
End If
end event

event ue_ole_fill_template();// objects created on open event 
	this.event ue_ole_set_bookmarks () 
	 
	if MID(is_tempdir, len(is_tempdir), 1) <> "\" then is_tempdir = is_tempdir + "\"
	is_ole_doc = is_tempdir + "DTS_OLE.doc" 
	
	FileDelete( is_ole_doc )
	ole_1.uf_savefile ( is_ole_doc )

   Wd.ConnectToNewObject("Word.Application.8")  //The .8 is optional 
   Ole_Doc = Wd.Documents.Open( is_ole_doc ) 
	Wd.Visible=TRUE
	
	if ib_fill_bookmarks then 
		this.event ue_ole_fill_bookmarks () 
		this.event ue_ole_additional_bookmarks () 
		ib_fill_bookmarks = false // don't do again... unless template changes
	end if
	
	if ib_ole_save then // no need to save when viewing history
		wd.ActiveDocument.Save()
		ole_1.uf_loadfile ( is_ole_doc )
	end if 
//	 
//	ls_text = string( f_nvl( dw_guest.GetItemNumber( 1, "amount" ),0) )
//	Ole_Doc.Bookmarks.Item("amount").Range.text = ls_text 
	
	
//	Ole_Doc.Bookmarks.Item("prefix02").Range.text = "Mr." 
// Ole_Doc.Bookmarks.Item("addr1").Range.text = "203 Mountain Ave" 
// Ole_Doc.Bookmarks.Item("lname").Range.text = "Simpson" 

// Header1 is the name of the bookmark in the header. 

//Conversely, the following line does the same thing: 
    //Wd.ActiveDocument.Bookmarks.Item("prefix01").Range.Text = "Mr." 
//	 Wd.ActiveDocument.Bookmarks.Item("fname").Range.Text = "Bart" 

 //   Ole_Doc.Bookmarks.Item("prefix").Range.text = "Mr." 
 //   Ole_Doc.Bookmarks.Item("lastname").Range.text = "Zamalin" 

    
	 // This places "here's my footer" in the footer bookmark called Footer1. 

//	Ole_Doc.ActiveDocument.CheckSpelling()
//	wd.ActiveDocument.Save()
//	wd.ActiveDocument.Close()
//	wd.ActiveDocument.Clear() 


/* 

PowerBuilder OLE Programming with Microsoft Word 97 (Word 8) 

This document reviews how to find the correct Visual Basic for Application syntax needed in Word and how to convert it into the correct PowerBuilder syntax. Includes examples of the PowerBuilder syntax for Word 8 OLE automation. 

This document describes how to find the correct Visual Basic for Applications (VBA) syntax needed in Word 8 and how to convert it into the correct Powerbuilder syntax


Beginning with Word 8/Office 97, Microsoft changed the way applications communicate with Word via OLE. Old WordBasic syntax may not work properly and converting them to VBA equivalents may be required.


Using the Word Macro Editor
An easy way to determine the VBA functions and their syntax by using the macro editor which is integrated in Word. To obtain the VBA functions turn on the macro recording in Word, perform the tasks you wish the macro to perform (ie. highlight some text), and then turn off the recording. With ALT + F11 you are able to open the macro editor and see the syntax used by Word. 


To get a complete description of a function and to see the complete syntax you can use the help file VBAWRD8.HLP which is available through a custom installation of Word (you must specify to install this help file during the installation process, it is not installed by default). Here you will find information regarding the functions you can use in Word and their VBA and WordBasic syntax. Furthermore you will be instructed which functions you can use with Word 8.


Converting VB Syntax to the PowerBuilder Syntax
Hints: 
a. PowerBuilder uses square brackets for array indices
b. Functions with several values are separated by comma between round brackets

Conversion example :
Here you see a macro recorded with the macro editor in Word.
Sub Macro1()
' VB Syntax in a macro
' see hint a.
Selection.Information(wdWithInTable)

' see hint b.
Selection.MoveLeft Unit:=wdCharacter, Count:=5

' function without values
Selection.TypeBackspace

End Sub
From the VBAWRD8.HLP file, here is the definition of the MoveLeft() function used in the macro:

Selection.MoveLeft(Unit, Count, Extend)
Unit optional Variant: wdCell, wdCharacter, wdWord or wdSentence. Default = wdCharacter.
Count optional: . Number of Units to move. Default = 1.
Extend optional: wdMove or wdExtend 


Here is the syntax to call the MoveLeft() function

// PB syntax 
ole_object.selection.Information[12]
ole_object.selection.MoveLeft(1,5,1)
ole_object.selection.TypeBackspace()


The question is now: What value does the constants "wdWithInTable", "wdCharacter" contain? These are only known to MS Word, which prevents PowerBuilder from having any knowledge about them. However each constant is associated with a value which can be used in its place. In general, most of them are integers and you can display them in a message box within the macro to determine their actual value
i.e.

Sub Makro1()
' this is a small messagebox to find out the integer 
' value of an enumerated datatype in Word. 
' in this case the value 5 
Answer = MsgBox(wdLine, 0)
End Sub

Alternatively, Microsoft's support website, http://search.support.microsoft.com/default.aspx?scid=kb;en-us;112671 has a technical article, Q112671, which documents all of the constants and their numerical equivalents that may be found in Microsoft Office.
In PowerBuilder, you would pass the actual value of the Word constant to the function. You can also declare a constant in PowerScript and associate it with the same value; when calling the Word function, pass it the constant you declared instead of the actual value. This allows you to make global changes easily to your code if Microsoft decides to change the value of the Word constant in future releases.

Under "Partial Listing of Visual Basic," you find a list with common constants and their numeric equivalents.



The Word Object Model
If you open VBAWRD8.HLP file you will find the hierarchy of the Microsoft Word Objects. Through OLE, you can traverse the hierarchy by using PowerBuilder's dot notation.

Some common objects/methods and attributes are:
Application, System, MailMessage, Selection, Selection.Font, Selection.Pagesetup, Selection.Border, Selection.Words, ActiveDocument, ActivePrinter, Checkspelling, CheckGrammar ... 

Several methods and attributes of the Application object can be used without specifying the "application" constant. For example the ActiveDocument or Documents are considered global objects within Word. Instead of writing: 

ole_object.application.ActiveDocument.CheckSpelling() 
you can write:
ole_object.ActiveDocument.CheckSpelling()

Below you'll find some code examples using the objects, methods and attributes of Word.



Code Examples

For all following examples the PowerBuilder OleObject is assumed to have already been create dynamically with:

OLEObject ole_object
ole_object = CREATE OLEObject

If you use the PowerBuilder OLE control (ole_1) you must remember to include the "object" constant before accessing Microsoft Word objects, properties, and functions.

i.e.

myinteger = ole_1.object.application.Activedocument.kind
or 
ole_1.object.application.Selection.Font.Italic = TRUE


Connect to Word 8 

// Connect to Word 8 (starts Word 8) , if successful Opens employee.doc ,
// if unsuccessful , display msg box for "ole error". 
IF ole_object.ConnectToNewObject("word.application.8") = 0 THEN
ole_object.Documents.open("c:\my documents\employee.doc")
ELSE
MessageBox('OLE Error','Unable to start an OLE server process!',Exclamation!)
END IF

// Make Word 8 visible - ( Set to FALSE for Word 8 to be invisible )
ole_object.Visible=TRUE


Bookmarks 

// To insert text in a specal place you can define a Bookmark 
// The function Exists() veryfies if the Bookmark exists in the document
// `GoTo` brings the cursor to the bookmank and `TypeText` insert the text.

IF ole_object.object.ActiveDocument.Bookmarks.Exists( " bookmark_name " ) THEN 
ole_object.Selection.Goto(TRUE,0,0,"bookmark_name")
ole_object.Selection.TypeText("text to insert")
ELSE
ole_object.ActiveDocument.bookmarks.add("bookmark_name")
END IF



Spellchecker and grammarchecker method

// starts the grammar / spell check of word for the whole active document
ole_object.ActiveDocument.CheckGrammar()
ole_object.ActiveDocument.CheckSpelling()
// starts the grammar / spell check for the specific text.
ole_object.ActiveDocument.CheckGrammar("text to check")
ole_object.ActiveDocument.CheckSpelling("text to check")

How should the text look


// set the font to italic, bold or change the current font to Arial with 
// size 24
ole_object.Selection.Font.Italic = TRUE
ole_object.Selection.Font.bold = TRUE
ole_object.Selection.Font.Name = "Arial"
ole_object.Selection.Font.Size = 24
ole_object.Selection.Words[1].Italic = True
ole_object.ActiveDocument.Paragraphs[1].Range.Font = "Arial"


Step through and find the text

// goto the bookmark `state`
ole_object.selection.GoTo(TRUE,0,0,"state")

// goto the next line wdGoToLine = 3
ole_object.selection.GoToNext(3)

// find a text
ole_object.Selection.Find.Forward = True
ole_object.Selection.ClearFormatting 
ole_object.Selection.MatchWholeWord = True
ole_object.Selection.MatchCase = False
ole_object.Selection.Wrap = wdFindContinue
ole_object.Selection.Execute("PowerBuilder")


Activate and access a Word blob in a Datawindow 


If you have an OLE column specified in a Datawindow you must activate the column to and then associate it with an OLEObject to get access to its properties and functions.: 

// Activate the ole blob in this case is `ole` the name of the ole blob 
// column and the blob is in the first row.

dw_1.oleActivate(1,"ole",0)

// Create a oleobject to get access to the running word application server 
OLEObject myoleobject
myoleobject = CREATE OLEObject

// connect to Word that is currently running from OleActivate()
IF myoleobject.ConnectToObject("", "word.application.8") <> 0 THEN
MessageBox('OLE Error','Unable to start an OLE server process!',Exclamation!)
END IF

myoleobject.Visible=TRUE

// access the propertie 
CHOOSE CASE myoleobject.ActiveDocument.kind
CASE 0 ...
CASE 1 ...
END CHOOSE 
*/

end event

event ue_ole_set_bookmarks();is_bookmarks[] = {"prefix01", "prefix02",	"prefix03", "fname", 		"fname1", 		"fname2", 		"lname", 	"lname1",	"lname2", 	"title", "company","addr1", "addr2", "city", "state", "zip", "country", "offer" }
is_cols [] 		= {"prefix", 	"prefix",	"prefix", 	"first_name", 	"first_name", 	"first_name", 	"last_name","last_name","last_name","title", "comp_name","addr1", "addr2", "city", "state", "zip", "country","offer" }


// custom01-custom10 bookmarks are reserved/defined in the word template for the future 

// existing customers with older templates will have to add these bookmarks in
// MS Word and change the color to white, if not used. 


end event

event ue_ole_fill_bookmarks();integer 			li_marks
string 			ls_text 
	
For li_marks = 1 to UpperBound (is_bookmarks [])
	ls_text = f_nvl( dw_guest.GetItemString( 1, is_cols[ li_marks] ),'') 
   Ole_Doc.Bookmarks.Item( is_bookmarks [li_marks] ).Range.text = ls_text 
Next 

end event

event ue_ole_additional_bookmarks();	string ls_text 
	decimal ld_amount
	ld_amount = f_nvl( dw_guest.GetItemNumber( 1, "amount" ),0)
	
	if ld_amount > 0 then 
		ls_text = string( ld_amount, "0.00"  )
		Ole_Doc.Bookmarks.Item("amount").Range.text = ls_text 
	END IF 
	
end event

event ue_refresh_oledoc();if is_ole_doc <> '' then
	ole_1.uf_loadfile ( is_ole_doc ) // read edited file back into ole object
end if

end event

on w_gcc_letter.create
int iCurrent
call super::create
this.cb_history=create cb_history
this.cb_mail=create cb_mail
this.sle_1=create sle_1
this.st_1=create st_1
this.st_2=create st_2
this.sle_2=create sle_2
this.st_3=create st_3
this.mle_msg=create mle_msg
this.dw_guest=create dw_guest
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_history
this.Control[iCurrent+2]=this.cb_mail
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.sle_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.mle_msg
this.Control[iCurrent+9]=this.dw_guest
end on

on w_gcc_letter.destroy
call super::destroy
destroy(this.cb_history)
destroy(this.cb_mail)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.mle_msg)
destroy(this.dw_guest)
end on

event ue_get_data;//overr
double d_id
long ll_row
d_id = id_oleid // temp 
dw_mainlist.retrieve() 
ole_1.event ue_retrieve(d_id )
id_oleid = d_id 
ll_row = dw_mainlist.Find( 'idauto = '+ string( d_id ) , 1, dw_mainlist.RowCount() )
if ll_row > 0 then
	dw_mainlist.SetRow( ll_row )
	dw_mainlist.ScrollToRow( ll_row )
	dw_mainlist.event ue_rowselected( ll_row, true )
END IF
cb_new.visible = false


end event

event open;call super::open;ib_resizeenabled = true

istr_parms = Message.PowerObjectParm
If not IsValid( istr_parms) then
	MessageBox('GCC Letter Error', 'Invalid call parameter.', Exclamation!)
	close( this)
	return 
End If	

is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'
gnv_appman.is_userid = cPassUserName

SELECT option03 INTO :is_tempdir from vzt_sysoptions where id = 1;
If trim(is_tempdir) ='' or IsNULL(is_tempdir) then is_tempdir = 'C:\WINDOWS\TEMP\'

this.event ue_export_link()

if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail

cb_select.visible 		= false
st_foundrecs.visible 	= false

cb_new.visible = false

ole_1.i_acttype = OffSite! // to print !!!!!

if len(string(f_nvl(istr_parms.guestemail,''))) > 0 then 
	sle_1.enabled = true 
	sle_2.enabled = true 
	cb_mail.enabled = true
end if 
cb_delete1.visible = false
cb_getfile.visible = false


Wd = Create OleObject 
Ole_Doc = Create OleObject 

ole_1.ib_prompt_save = false

end event

event resize;call super::resize;if sizetype <> 1 then 
		int  li_y, li_x
		li_y = 11
		li_x = 11
		dw_mainlist.y 	= newheight - ii_resizeband_y - dw_mainlist.height		
		dw_mainlist.x	= li_x
		
		cb_close.y 		= newheight - ii_resizeband_y - cb_close.height		
		cb_history.y 	= newheight - ii_resizeband_y - cb_history.height		
		cb_mail.y 		= newheight - ii_resizeband_y - cb_mail.height		
		cb_oleedit.y 	= newheight - ii_resizeband_y - cb_oleedit.height		
//		cb_oletest.y 	= newheight - ii_resizeband_y - cb_oletest.height		

		sle_2.y 			= cb_oleedit.y - sle_2.height	- 15
		st_2.y 			= sle_2.y 			
		st_3.y			= sle_2.y 			
		sle_1.y 			= sle_2.y - sle_1.height	- 10
		st_1.y 			= sle_1.y 			

		ole_1.x			= li_x
		ole_1.y			= li_y
		ole_1.height	= newheight - dw_mainlist.height - li_y - 2 * ii_resizeband_y // cb_close.height - 50
		ole_1.width		= newwidth  - li_x * 2 
	
End IF 
cb_getfile.visible = false		
end event

event ue_assign_menu;//	overr
end event

event close;if IsValid(inv_mail) then DESTROY inv_mail 
FileDelete( is_tempdir	+ is_tempxls ) 
FileDelete( is_tempdir + + sle_2.text + '.DOC'  )

FileDelete( is_ole_doc )

destroy Wd
destroy Ole_Doc 
	
end event

event closequery;call super::closequery;this.event ue_markprinted()
 
end event

event activate;call super::activate;if ib_edit = true then this.event ue_refresh_oledoc()

end event

type uo_trace01 from w_vzt_base_ole`uo_trace01 within w_gcc_letter
end type

type dw_mainlist from w_vzt_base_ole`dw_mainlist within w_gcc_letter
integer x = 55
integer y = 1568
integer width = 1445
integer height = 260
end type

event dw_mainlist::ue_rowselected;call super::ue_rowselected;cb_delete1.visible = false
if is_subject <> '' then sle_1.text = is_subject
ib_fill_bookmarks = true
return 1
end event

event dw_mainlist::rowfocuschanged;call super::rowfocuschanged;ib_fill_bookmarks = true
end event

type cb_last_search from w_vzt_base_ole`cb_last_search within w_gcc_letter
end type

type cb_close from w_vzt_base_ole`cb_close within w_gcc_letter
integer x = 2811
integer y = 1724
integer taborder = 100
end type

type cb_delete1 from w_vzt_base_ole`cb_delete1 within w_gcc_letter
integer taborder = 160
end type

type cb_save from w_vzt_base_ole`cb_save within w_gcc_letter
boolean visible = false
integer y = 1620
integer taborder = 140
end type

type cb_select from w_vzt_base_ole`cb_select within w_gcc_letter
boolean visible = false
integer x = 5001
integer y = 2000
integer taborder = 130
end type

type cb_new from w_vzt_base_ole`cb_new within w_gcc_letter
boolean visible = false
integer y = 1620
integer taborder = 150
end type

type cb_newsearch from w_vzt_base_ole`cb_newsearch within w_gcc_letter
boolean visible = false
integer taborder = 120
end type

type cb_search from w_vzt_base_ole`cb_search within w_gcc_letter
boolean visible = false
integer y = 1620
integer taborder = 110
end type

type st_foundrecs from w_vzt_base_ole`st_foundrecs within w_gcc_letter
boolean visible = false
integer x = 5001
end type

type st_stop from w_vzt_base_ole`st_stop within w_gcc_letter
integer x = 5001
integer y = 12
end type

type dw_data from w_vzt_base_ole`dw_data within w_gcc_letter
boolean visible = false
integer x = 1271
integer width = 603
integer height = 96
integer taborder = 90
end type

type dw_print from w_vzt_base_ole`dw_print within w_gcc_letter
integer taborder = 170
end type

type ole_1 from w_vzt_base_ole`ole_1 within w_gcc_letter
integer x = 55
integer y = 44
integer width = 3017
integer height = 1532
integer taborder = 70
end type

type cb_oleedit from w_vzt_base_ole`cb_oleedit within w_gcc_letter
integer x = 1559
integer y = 1724
integer width = 489
integer taborder = 50
string text = "&Edit / Print Letter"
end type

event cb_oleedit::clicked;//0verride
//Messagebox('Reminder', "Don't Forget to click File-Update while in MS Word!")

ib_edit = true 
//call super::clicked
//cb_save.visible = false
//cb_save.enabled = false

post event ue_ole_fill_template () // fill with client data 
end event

type cb_getfile from w_vzt_base_ole`cb_getfile within w_gcc_letter
boolean visible = false
integer taborder = 80
boolean enabled = false
end type

type cb_history from commandbutton within w_gcc_letter
integer x = 2441
integer y = 1724
integer width = 357
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mark Printed"
end type

event clicked;if not ib_edit then
	MessageBox( 'GCC Letter', 'You must Edit/Print the letter before you can mark it printed!')
	return 
end if

parent.event ue_write_history('printed')
this.enabled = false
ib_edit = false

post close(parent)

end event

type cb_mail from commandbutton within w_gcc_letter
integer x = 2062
integer y = 1724
integer width = 352
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "e-mail letter"
end type

event clicked;parent.event ue_emailletter()
end event

type sle_1 from singlelineedit within w_gcc_letter
integer x = 1975
integer y = 1580
integer width = 1097
integer height = 68
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_gcc_letter
integer x = 1554
integer y = 1584
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "e-mail subject:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_gcc_letter
integer x = 1554
integer y = 1652
integer width = 416
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "e-mail file name"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_gcc_letter
integer x = 1975
integer y = 1648
integer width = 480
integer height = 64
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_gcc_letter
integer x = 2464
integer y = 1652
integer width = 178
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = ".DOC"
boolean focusrectangle = false
end type

type mle_msg from multilineedit within w_gcc_letter
boolean visible = false
integer x = 23
integer y = 28
integer width = 3131
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_guest from uo_vzt_dwbase within w_gcc_letter
boolean visible = false
integer x = 1504
integer width = 1870
integer height = 588
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_gcc_guest_for_letter"
borderstyle borderstyle = stylebox!
end type

