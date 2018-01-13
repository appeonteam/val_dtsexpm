$PBExportHeader$uo_vzt_mail.sru
forward
global type uo_vzt_mail from nonvisualobject
end type
end forward

global type uo_vzt_mail from nonvisualobject
end type
global uo_vzt_mail uo_vzt_mail

type variables
mailSession	mSes
mailReturnCode	mRet
mailMessage	mMsg, msg_empty
mailFileDescription	mAttach

boolean		ib_disp_errors = true, ib_logged_on=false
string		is_sysuser, is_syspwd, is_usename
string		is_prefix // SMTP: etc

datastore		ids_mail_queue
end variables

forward prototypes
public function integer uf_mail_logoff (ref mailsession ams_sess)
public function integer uf_mail_send (string as_subject, string as_msg, string as_mailtoname[], string as_mailtoid[], string as_attachfile[])
public function integer uf_mail_logon ()
public function integer uf_mail_get_inbox (boolean ib_logon)
public function integer uf_mail_logoff ()
public function integer uf_mail_send_no_logon (string as_subject, string as_msg, string as_mailtoname[], string as_mailtoid[], string as_attachfile[])
public function integer uf_mailaddress ()
public function integer uf_mail_address ()
end prototypes

public function integer uf_mail_logoff (ref mailsession ams_sess);string 			ls_ret	

if not isValid(ams_sess) then return 0
mRet = ams_sess.mailLogoff ( )
//ls_ret = f_mail_error_to_string ( mRet, 'Logoff:', FALSE )
ib_logged_on = false 

If mRet <> mailReturnSuccess! Then
	MessageBox ("Mail Logoff", 'Return Code <> mailReturnSuccess!' )
	return -10
End If

destroy ams_sess 

return 0

end function

public function integer uf_mail_send (string as_subject, string as_msg, string as_mailtoname[], string as_mailtoid[], string as_attachfile[]);// Clicked script for cb_send_mail

mailSession				l_mSes
mailReturnCode			l_mRet
mailMessage				l_mMsg
mailFileDescription	l_mattach

string					ls_ret, ls_syntax, ls_name, ls_open_pathname, ls_filename
int						li_index, li_nret, li_nrecipients, li_nfile, li_rc 
boolean 					lb_noerrors

/*****************************************************************
	Obtain the syntax of the DataWindow definition and contents,
	and write it in a ".dwx" transport file (in ASCII)
****************************************************************/
//dw_1.saveas(ls_attach_name,PSReport!,True)

//This is another way of sending the datawindow contents. ie breaking the 
//syntax and data up and mailing them together. 
//The PSR file is the prefered method now.
//is_dwsyntax = dw_1.Describe ( 'datawindow.syntax' )
//is_datasyntax = dw_1.Describe ( 'datawindow.syntax.data' )
//ls_syntax = is_dwsyntax + '~r' + is_datasyntax
//
//li_nfile = FileOpen  ( ls_attach_name, StreamMode!, Write!, LockReadWrite!, Replace! )
//If li_nfile < 0 Then
//	MessageBox ( "send Mail", &
//				"Unable to open file to save DataWindow attachment", &
//				 StopSign! )
//	wf_logoff_mail(l_mSes, ls_attach_name)
//	return
//End If
//li_nret = FileWrite ( li_nfile, ls_syntax )
//FileClose ( li_nfile )

/*****************************************************************
	Establish an instance of the Mail Session object, and log on
 *****************************************************************/
l_mSes = create mailSession

/*****************************************************************
	Note: If the mail-system user ID and password are known,
			they could be hard-coded here, as shown in the
			commented-out statement that follows.  If user ID and
			password are not supplied, it is assumed that they
			are stored in MSMAIL.INI
 *****************************************************************/
If gnv_appman.is_debugmode  = 'Y' then MessageBox('Mail connection', 'user: '+is_sysuser +', password: '+is_syspwd)
if LEN(is_sysuser) > 0 then
	l_mRet = l_mSes.mailLogon ( is_sysuser, is_syspwd, mailNewSession! )
ELSE
	l_mRet = l_mSes.mailLogon ( mailNewSession! )
END IF
ls_ret = f_mail_error_to_string ( l_mRet, 'Logon:', ib_disp_errors )
 
If l_mRet <> mailReturnSuccess! Then
	uf_mail_logoff(l_mSes)
	return -10
End If

SetPointer(HourGlass!)

/*****************************************************************
	Copy user's subject to the mail message.
	Set return receipt flag If needed.
	Build an Attachment structure, and assign it to the mail message.
 *****************************************************************/
l_mMsg.Subject		= f_nvl(as_subject,'')
If l_mMsg.Subject	= '' then l_mMsg.Subject = 'None'
l_mMsg.notetext 	= f_nvl(as_msg,'')
if l_mMsg.notetext ='' then l_mMsg.notetext ='---'

//l_mMsg.MessageType = msg_empty.MessageType 	

int li_maxattach, ll_attach
li_maxattach = UpperBound( as_attachfile[])

l_mMsg.AttachmentFile	= msg_empty.AttachmentFile	// reset to empty

If li_maxattach > 0 then
	For ll_attach = 1 to li_maxattach 
			if not FileExists(as_attachfile[ ll_attach]) then 
				MessageBox( 'VZT Mail Send Error', 'Attachment file is invalid: ~r~n' &
				+ '~r~n' + as_attachfile[ ll_attach] & 
				+ '~r~n~r~nPlease check the TEMP directory.' )
			end if 
			l_mattach.FileType = mailAttach!
			l_mattach.PathName = as_attachfile[ ll_attach]
			l_mattach.FileName = as_attachfile[ ll_attach]
		// Note: In MS Mail version 3.0b, Position=-1 puts attachment at
		//  the beginning of the message.
		// This will place the attachment at the End of the text of the message
//			l_mattach.Position = len(l_mMsg.notetext) - 1		
			l_mattach.Position = 0
			l_mMsg.AttachmentFile[ ll_attach] = l_mattach
	Next
End if
///*****************************************************************
//	If user requested "addresses-from-a-file," open that file and
//	read the address list.
// *****************************************************************/
//If cbx_file.checked Then
//	li_nret = GetFileOpenName ("Address", ls_open_pathname, &
//								ls_filename,"adr", &
//		"Address Text Files (*.adr),*.adr,All Files (*.*),*.*")
//	If li_nret < 1 Then return
//	li_nfile = FileOpen ( ls_open_pathname )
//	If li_nfile < 0 Then
//		MessageBox ( "send Mail", "Unable to open file " &
//						+ ls_open_pathname, StopSign! )
//		wf_logoff_mail(l_mSes, ls_attach_name)
//		return
//	End If
//
//	li_nrecipients = 0
//	do while FileRead ( li_nfile, ls_name ) > 0
//		li_nrecipients = li_nrecipients + 1
//		l_mMsg.Recipient[li_nrecipients].Name = ls_name
//	loop
//	FileClose ( li_nfile )
//End If
//
//
int li_maxto, ll_to
li_maxto = UpperBound( as_mailtoname[])

l_mMsg.Recipient	= msg_empty.Recipient		// reset to empty

If li_maxto > 0 then
	For ll_to = 1 to li_maxto
		If upper(is_usename) = 'Y' then // skip recip. name setup if necessary 
			l_mMsg.Recipient[ll_to].Name 			= 	as_mailtoname	[ ll_to ]
		END IF 
		IF is_prefix <> '' then as_mailtoid	[ ll_to ]= is_prefix + as_mailtoid [ ll_to ]
		l_mMsg.Recipient[ll_to].Address			= 	as_mailtoid		[ ll_to ]
		l_mMsg.Recipient[ll_to].RecipientType 	=	mailTo! 			//mailBCC! mailCC!mailOriginator!mailTo!
	Next
End if
//set originator
//ll_to = UpperBound( l_mMsg.Recipient[]) + 1
//l_mMsg.Recipient[ll_to].Name 				= 	'GCC Coordinator'
//l_mMsg.Recipient[ll_to].Address				= 	'sales@vztech.com'
//l_mMsg.Recipient[ll_to].RecipientType 	=	mailOriginator! 			//mailBCC! mailCC!mailOriginator!mailTo!

/*****************************************************************
	If user requested "address-from-Post-Office," call the
	mail system's Address function
 *****************************************************************/
//If cbx_address_live.checked Then
//	l_mRet = l_mSes.mailAddress ( l_mMsg )
//	If l_mRet = mailReturnUserAbort! Then 
//		st_status_bar.text = "User Canceled send Mail"
//		wf_logoff_mail(l_mSes, ls_attach_name)
//		Return
//	End If
//	ls_ret = f_mail_error_to_string ( l_mRet, 'Address Mail:', true )
//End If


/*****************************************************************
	Resolve recipient addresses, which may be only partially
	supplied, to get the complete address for each one.

	Loop in this until the names are all resovled with no
	errors. The message will not be sent If errors are in
	the user name.

	The user can cancel out of resolving names which
	will cancel the entire send mail process
 *****************************************************************/
SetPointer(HourGlass!)

//Do 
//	lb_noerrors = True
//	li_nrecipients = UpperBound( l_mMsg.Recipient )
//	For li_index = 1 To li_nrecipients
//		l_mRet = l_mSes.mailResolveRecipient(l_mMsg.Recipient[li_index].Name)
//		If l_mRet <> mailReturnSuccess! Then lb_noerrors = False
//		ls_ret = f_mail_error_to_string ( l_mRet, 'Resolve Recipient:', true )
//	Next
//	If Not lb_noerrors Then
//		Messagebox("Microsoft Mail","Error Resolving Name(s)~n~r"+&
//		"The name(s) not underlined are unresolvable.~n~n~rPlease Correct or Cancel" ,Exclamation!)
//		l_mRet = l_mSes.mailAddress(l_mMsg)
//		If l_mRet = mailReturnUserAbort! Then 
//			uf_mail_logoff(l_mSes)
//			Return -20
//		End If
//	End If
//Loop Until lb_noerrors
//
/*****************************************************************
	Now, send the mail message, including the attachment
 *****************************************************************/
If UpperBound ( l_mMsg.Recipient ) < 1 Then 
	messagebox ("VZT Mail send","Mail must include at least 1 recipient",Exclamation!)
	uf_mail_logoff(l_mSes)
	return -30
End If
// trace
If gnv_appman.is_debugmode  = 'Y' then MessageBox('Mail recipient', 'name: '+l_mMsg.Recipient[1].Name +', id: '+l_mMsg.Recipient[1].Address )
//MessageBox('Mail originator','name: '+l_mMsg.Recipient[2].Name +', id: '+l_mMsg.Recipient[2].Address )
li_rc = 1
l_mRet = l_mSes.mailsend ( l_mMsg )
ls_ret = f_mail_error_to_string ( l_mRet, 'send Mail:', true )
If mRet <> MailReturnSuccess! then 
	li_rc = -1
	uf_mail_logoff(l_mSes)
END IF
return li_rc 

end function

public function integer uf_mail_logon ();if Not IsValid ( mSes) then  mSes = create mailSession

/*****************************************************************
	Note: If the mail-system user ID and password are known,
			they could be hard-coded here, as shown in the
			commented-out statement that follows.  If user ID and
			password are not supplied, it is assumed that they
			are stored in MSMAIL.INI
 *****************************************************************/
If gnv_appman.is_debugmode  = 'Y' then MessageBox('DEBUG: Mail connection', 'User: '+is_sysuser +', Password: '+is_syspwd)
if LEN(is_sysuser) > 0 then
	mRet = mSes.mailLogon ( is_sysuser, is_syspwd, mailNewSession! )
ELSE
	mRet = mSes.mailLogon ( mailNewSession! )
END IF

string ls_ret 
ls_ret = f_mail_error_to_string ( mRet, 'Logon:', ib_disp_errors )
 
If mRet <> mailReturnSuccess! Then
	uf_mail_logoff(mSes)
	return -1
End If
If gnv_appman.is_debugmode  = 'Y' then 
	MessageBox('DEBUG: Mail connection:', 'Logon Success!')
END IF

ib_logged_on = true
return 1
end function

public function integer uf_mail_get_inbox (boolean ib_logon);
mailMessage				l_mMsg[]
mailFileDescription	l_mAttach
string					ls_ret, ls_syntax, ls_name, ls_open_pathname, ls_filename
string					ls_attach_name='DataWndw.psr'
int						li_index, li_nret, li_nrecipients, li_nfile
boolean 					lb_noerrors

If ib_logon or Not IsValid( mses) then		// logon if requested 
	if this.uf_mail_logon() < 0 then return -1
END IF

SetPointer(HourGlass!)
mRet = mSes.mailGetMessages ( '', false )

long ll_mid_row, ll_max_id, ll_row 
ids_mail_queue.Reset()
ll_max_id = upperbound( mSes.MessageID [])
FOR ll_mid_row = 1 to ll_max_id 
	mRet = mSes.mailReadMessage ( mSes.MessageID [ll_mid_row], l_mMsg[ ll_mid_row],  mailSuppressAttachments! , 	false )
	ll_row = ids_mail_queue.InsertRow(0)
	If ll_row > 0 then 
		ids_mail_queue.object.subject [ll_row ] 	= l_mMsg[ ll_mid_row].subject 
		ids_mail_queue.object.notetext [ll_row ] 	= l_mMsg[ ll_mid_row].notetext 
	END IF
NEXT

return 1
// Property				Data type				Description
// ----------------  -------------------  -----------------------------------
// AttachmentFile[ ]	mailFileDescription	Specifies the file attachment for the current message. A mailFileDescription array contains information about an attachment file.
// ConversationID		String					Specifies the conversation thread ID for the current message.
// DateReceived		String					Indicates the date on which the current message was received.
// MessageSent			Boolean					Indicates whether the current message has been sent to the mail server. (Read-only at runtime only.)·	True — Message has been sent to mail server·	False — Message has not yet been sent
// MessageType			String					Indicates the type of the current message. A value other than null or an empty string indicates use by an application other than interpersonal mail. (Runtime only.)
// NoteText				String					Specifies the content of the message body. (Runtime only.)
// ReceiptRequested	Boolean					Indicates whether a return receipt is requested for the current message. (Runtime only.)·	True — Return receipt requested·	False — Return receipt not requested
// Recipient[ ]		mailRecipient			Specifies the recipient of the current message.
// Subject				String					Specifies the subject line, displayed in the message header, for the current message.
// Unread				Boolean					Indicates whether or not the message has been read. (Read-only at runtime only.)·	True — Message has not been read·	False — Message has been read

















///*****************************************************************
//	Copy user's subject to the mail message.
//	Set return receipt flag If needed.
//	Build an Attachment structure, and assign it to the mail message.
// *****************************************************************/
////l_mMsg.Subject	= as_subject
//
////l_mMsg.MessageType	= 'PBMAIL'		// outlook test........ vz
//
//// If cbx_receipt_requested.checked Then
////	l_mMsg.ReceiptRequested = true
//// End If
//
////l_mMsg.notetext = f_nvl(as_msg,'')
//
//int li_maxattach, ll_attach
//li_maxattach = UpperBound( as_attachfile[])
//If li_maxattach > 0 then
//	For ll_attach = 1 to li_maxattach
//			l_mAttach.FileType = mailAttach!
//			l_mAttach.PathName = as_attachfile[ ll_attach]
//			l_mAttach.FileName = as_attachfile[ ll_attach]
//		// Note: In MS Mail version 3.0b, Position=-1 puts attachment at
//		//  the beginning of the message.
//		// This will place the attachment at the End of the text of the message
//			l_mAttach.Position = len(l_mMsg.notetext) - 1		
//			l_mMsg.AttachmentFile[ ll_attach] = l_mAttach
//	Next
//End if
/////*****************************************************************
////	If user requested "addresses-from-a-file," open that file and
////	read the address list.
//// *****************************************************************/
////If cbx_file.checked Then
////	li_nret = GetFileOpenName ("Address", ls_open_pathname, &
////								ls_filename,"adr", &
////		"Address Text Files (*.adr),*.adr,All Files (*.*),*.*")
////	If li_nret < 1 Then return
////	li_nfile = FileOpen ( ls_open_pathname )
////	If li_nfile < 0 Then
////		MessageBox ( "send Mail", "Unable to open file " &
////						+ ls_open_pathname, StopSign! )
////		wf_logoff_mail(mSes, ls_attach_name)
////		return
////	End If
////
////	li_nrecipients = 0
////	do while FileRead ( li_nfile, ls_name ) > 0
////		li_nrecipients = li_nrecipients + 1
////		l_mMsg.Recipient[li_nrecipients].Name = ls_name
////	loop
////	FileClose ( li_nfile )
////End If
////
////
//int li_maxto, ll_to
//li_maxto = UpperBound( as_mailtoname[])
//
//If li_maxto > 0 then
//	For ll_to = 1 to li_maxto
//		If upper(is_usename) = 'Y' then // skip recip. name setup if necessary 
//			l_mMsg.Recipient[ll_to].Name 			= 	as_mailtoname	[ ll_to ]
//		END IF 
//		IF is_prefix <> '' then as_mailtoid	[ ll_to ]= is_prefix + as_mailtoid [ ll_to ]
//		l_mMsg.Recipient[ll_to].Address				= 	as_mailtoid		[ ll_to ]
//		l_mMsg.Recipient[ll_to].RecipientType 	=	mailTo! 			//mailBCC! mailCC!mailOriginator!mailTo!
//	Next
//End if
////set originator
////ll_to = UpperBound( l_mMsg.Recipient[]) + 1
////l_mMsg.Recipient[ll_to].Name 				= 	'GCC Coordinator'
////l_mMsg.Recipient[ll_to].Address				= 	'sales@vztech.com'
////l_mMsg.Recipient[ll_to].RecipientType 	=	mailOriginator! 			//mailBCC! mailCC!mailOriginator!mailTo!
//
///*****************************************************************
//	If user requested "address-from-Post-Office," call the
//	mail system's Address function
// *****************************************************************/
////If cbx_address_live.checked Then
////	mRet = mSes.mailAddress ( l_mMsg )
////	If mRet = mailReturnUserAbort! Then 
////		st_status_bar.text = "User Canceled send Mail"
////		wf_logoff_mail(mSes, ls_attach_name)
////		Return
////	End If
////	ls_ret = f_mail_error_to_string ( mRet, 'Address Mail:', true )
////End If
//
//
///*****************************************************************
//	Resolve recipient addresses, which may be only partially
//	supplied, to get the complete address for each one.
//
//	Loop in this until the names are all resovled with no
//	errors. The message will not be sent If errors are in
//	the user name.
//
//	The user can cancel out of resolving names which
//	will cancel the entire send mail process
// *****************************************************************/
//SetPointer(HourGlass!)
//
////Do 
////	lb_noerrors = True
////	li_nrecipients = UpperBound( l_mMsg.Recipient )
////	For li_index = 1 To li_nrecipients
////		mRet = mSes.mailResolveRecipient(l_mMsg.Recipient[li_index].Name)
////		If mRet <> mailReturnSuccess! Then lb_noerrors = False
////		ls_ret = f_mail_error_to_string ( mRet, 'Resolve Recipient:', true )
////	Next
////	If Not lb_noerrors Then
////		Messagebox("Microsoft Mail","Error Resolving Name(s)~n~r"+&
////		"The name(s) not underlined are unresolvable.~n~n~rPlease Correct or Cancel" ,Exclamation!)
////		mRet = mSes.mailAddress(l_mMsg)
////		If mRet = mailReturnUserAbort! Then 
////			uf_mail_logoff(mSes)
////			Return -20
////		End If
////	End If
////Loop Until lb_noerrors
////
///*****************************************************************
//	Now, send the mail message, including the attachment
// *****************************************************************/
//If UpperBound ( l_mMsg.Recipient ) < 1 Then 
//	messagebox ("VZT Mail send","Mail must include at least 1 recipient",Exclamation!)
//	uf_mail_logoff(mSes)
//	return -30
//End If
//// trace
//If gnv_appman.is_debugmode  = 'Y' then MessageBox('Mail recipient', 'name: '+l_mMsg.Recipient[1].Name +', id: '+l_mMsg.Recipient[1].Address )
////MessageBox('Mail originator','name: '+l_mMsg.Recipient[2].Name +', id: '+l_mMsg.Recipient[2].Address )
//
//mRet = mSes.mailsend ( l_mMsg )
//ls_ret = f_mail_error_to_string ( mRet, 'send Mail:', true )
//uf_mail_logoff(mSes)
//return 1
//
end function

public function integer uf_mail_logoff ();if not isvalid(mses) then return 0
return this.uf_mail_logoff( mses) 

end function

public function integer uf_mail_send_no_logon (string as_subject, string as_msg, string as_mailtoname[], string as_mailtoid[], string as_attachfile[]);string					ls_ret, ls_syntax, ls_name, ls_open_pathname, ls_filename
int						li_index, li_nret, li_nrecipients, li_nfile, li_rc
/*****************************************************************
	Note: If the mail-system user ID and password are known,
			they could be hard-coded here, as shown in the
			commented-out statement that follows.  If user ID and
			password are not supplied, it is assumed that they
			are stored in MSMAIL.INI
 *****************************************************************/
If not ib_logged_on then
	If gnv_appman.is_debugmode  = 'Y' then MessageBox('Mail connection', 'user: '+is_sysuser +', password: '+is_syspwd)
	if LEN(is_sysuser) > 0 then
		mRet = mSes.mailLogon ( is_sysuser, is_syspwd, mailNewSession! )
	ELSE
		mRet = mSes.mailLogon ( mailNewSession! )
	END IF
	ls_ret = f_mail_error_to_string ( mRet, 'Logon:', ib_disp_errors )
	 
	If mRet <> mailReturnSuccess! Then
		uf_mail_logoff(mSes)
		return -10
	End If
END IF 

SetPointer(HourGlass!)

mMsg.Subject		= f_nvl(as_subject,'')
If mMsg.Subject	= '' then mMsg.Subject = 'None'
mMsg.notetext 		= f_nvl(as_msg,'')
if mMsg.notetext ='' then mMsg.notetext ='---'

int li_maxattach, ll_attach
li_maxattach = UpperBound( as_attachfile[])

mMsg.AttachmentFile = msg_empty.AttachmentFile // reset to empty
If li_maxattach > 0 then
	For ll_attach = 1 to li_maxattach
			if not FileExists(as_attachfile[ ll_attach]) then 
				MessageBox( 'VZT Mail Send Error', 'Attachment file is invalid: ~r~n' &
				+ '~r~n' + as_attachfile[ ll_attach] & 
				+ '~r~n~r~nPlease check the TEMP directory.' )
			end if 

			mAttach.FileType = mailAttach!
			mAttach.PathName = as_attachfile[ ll_attach]
			mAttach.FileName = as_attachfile[ ll_attach]
		// Note: In MS Mail version 3.0b, Position=-1 puts attachment at
		//  the beginning of the message.
		// This will place the attachment at the End of the text of the message
//			mAttach.Position = len(mMsg.notetext) - 1		
			mAttach.Position = 0
			mMsg.AttachmentFile[ ll_attach] = mAttach
	Next
End if
//
//
int li_maxto, ll_to
li_maxto = UpperBound( as_mailtoname[])
string 		ls_empty_array[] = {''}
mMsg.Recipient	= msg_empty.Recipient		// reset to empty

If li_maxto > 0 then
	For ll_to = 1 to li_maxto
		If upper(is_usename) = 'Y' then // skip recip. name setup if necessary 
			mMsg.Recipient[ll_to].Name 			= 	as_mailtoname	[ ll_to ]
		END IF 
		IF is_prefix <> '' then as_mailtoid	[ ll_to ]= is_prefix + as_mailtoid [ ll_to ]
		mMsg.Recipient[ll_to].Address				= 	as_mailtoid		[ ll_to ]
		mMsg.Recipient[ll_to].RecipientType 	=	mailTo! 			//mailBCC! mailCC!mailOriginator!mailTo!
	Next
End if
//set originator
//ll_to = UpperBound( l_mMsg.Recipient[]) + 1
//l_mMsg.Recipient[ll_to].Name 					= 	'GCC Coordinator'
//l_mMsg.Recipient[ll_to].Address				= 	'sales@vztech.com'
//l_mMsg.Recipient[ll_to].RecipientType 		=	mailOriginator! 			

SetPointer(HourGlass!)

If UpperBound ( mMsg.Recipient ) < 1 Then 
	messagebox ("VZT Mail send","Mail must include at least 1 recipient",Exclamation!)
// 	uf_mail_logoff(mSes)
	return -30
End If
// trace
If gnv_appman.is_debugmode  = 'Y' then MessageBox('Mail recipient', 'name: '+mMsg.Recipient[1].Name +', id: '+mMsg.Recipient[1].Address )
//MessageBox('Mail originator','name: '+l_mMsg.Recipient[2].Name +', id: '+l_mMsg.Recipient[2].Address )
li_rc = 1

mRet = mSes.mailsend ( mMsg )
ls_ret = f_mail_error_to_string ( mRet, 'Send Mail:', false ) //no error message
If mRet <> MailReturnSuccess! then li_rc = -1
return li_rc 

end function

public function integer uf_mailaddress ();mses.mailAddress ( mmsg )

return 1
end function

public function integer uf_mail_address ();mses.mailAddress ( mmsg )

return 1
end function

on uo_vzt_mail.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_vzt_mail.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;SELECT 	mailsysuserid, mailsyspwd, option02, option04 
INTO : is_sysuser, :is_syspwd, :is_usename, :is_prefix 
FROM 		vzt_sysoptions WHERE id = 1;

ids_mail_queue = create DATASTORE 
ids_mail_queue.dataobject = 'd_vzt_mail_queue' 


end event

event destructor;if this.ib_logged_on then this.uf_mail_logoff()
If IsValid( ids_mail_queue) then DESTROY ids_mail_queue
end event

