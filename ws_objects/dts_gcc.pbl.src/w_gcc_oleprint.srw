$PBExportHeader$w_gcc_oleprint.srw
forward
global type w_gcc_oleprint from w_vzt_base
end type
type cb_print from commandbutton within w_gcc_oleprint
end type
type cbx_printpreview from checkbox within w_gcc_oleprint
end type
end forward

global type w_gcc_oleprint from w_vzt_base
int Width=2555
int Height=1792
event ue_writehistory ( )
cb_print cb_print
cbx_printpreview cbx_printpreview
end type
global w_gcc_oleprint w_gcc_oleprint

type variables
str_dts_call	istr_parms
string		is_descr, is_action_code
end variables

event ue_writehistory;// Save it in the GCC history log
string 		ls_data, ls_syntax, ls_descr, ls_error
long 			ll_rc
datetime		ldt_action

ls_data 		= dw_data.object.datawindow.data 
ls_syntax 	= dw_data.object.datawindow.Syntax 
ls_descr		= f_nvl(is_descr,'??? Letter') + ' printed'
ldt_action	= datetime( today(), now() )
 INSERT INTO gcc_history  
         ( gccid,   
           actioncode,   
			  action_dt,  
           descr,   
           letter_syntax,   
           letter_data,   
           )  
  VALUES ( :istr_parms.gccid,   
           :is_action_code,   
			  :ldt_action,
           :ls_descr,   
           :ls_syntax,   
           :ls_data
           )  ;
If SQLCA.sqlcode = 0 then 
	COMMIT;
Else
	ll_rc		= SQLCA.sqlcode
	ls_error = SQLCA.sqlerrtext
	ROLLBACK;
	MessageBox('GCC History', 'Insert failed. RC='+string (ll_rc)+ '~r~nError:'+ ls_error, Stopsign!)
END IF

//------------
//string ls_test
// SELECT letter_syntax INTO :ls_test
//    FROM gcc_history 
//	 WHERE 	gccid 		= :istr_parms.gccid 	AND 
//	 			action_dt 	= :ldt_action 			AND
//			  	actioncode 	= 'TL' ;
//
//ls_test = ls_test
end event

on w_gcc_oleprint.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cbx_printpreview=create cbx_printpreview
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cbx_printpreview
end on

on w_gcc_oleprint.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cbx_printpreview)
end on

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


dw_data.SetRedraw(false)
dw_data.retrieve (istr_parms.gccid)
cb_select.visible = false
st_foundrecs.visible = false
//dw_data.Object.DataWindow.Print.Preview='Yes'
//dw_data.Object.DataWindow.Print.Preview.Zoom='140'
dw_data.SetRedraw(true)
end event

event ue_assign_menu;//override
end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_print.y=		newheight - ii_resizeband_y - cb_print.height
		cbx_printpreview.y = newheight - ii_resizeband_y - cbx_printpreview.height
	End IF 
End IF 	
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_gcc_oleprint
boolean Visible=false
end type

type cb_last_search from w_vzt_base`cb_last_search within w_gcc_oleprint
int TabOrder=20
end type

type cb_close from w_vzt_base`cb_close within w_gcc_oleprint
int X=2254
int Y=1608
int TabOrder=40
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_gcc_oleprint
int TabOrder=100
end type

type cb_save from w_vzt_base`cb_save within w_gcc_oleprint
int TabOrder=80
boolean Visible=false
end type

type cb_select from w_vzt_base`cb_select within w_gcc_oleprint
int TabOrder=70
boolean Visible=false
boolean Enabled=false
end type

type cb_new from w_vzt_base`cb_new within w_gcc_oleprint
int TabOrder=90
boolean Visible=false
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_gcc_oleprint
int TabOrder=60
boolean Visible=false
end type

type cb_search from w_vzt_base`cb_search within w_gcc_oleprint
int TabOrder=50
boolean Visible=false
end type

type st_foundrecs from w_vzt_base`st_foundrecs within w_gcc_oleprint
boolean Visible=false
boolean BringToTop=true
end type

type st_stop from w_vzt_base`st_stop within w_gcc_oleprint
boolean BringToTop=true
end type

type dw_data from w_vzt_base`dw_data within w_gcc_oleprint
int X=18
int Y=8
int Width=2482
int Height=1580
int TabOrder=30
string DataObject="d_letter_thanks"
end type

type dw_print from w_vzt_base`dw_print within w_gcc_oleprint
int TabOrder=110
boolean BringToTop=true
end type

type cb_print from commandbutton within w_gcc_oleprint
int X=1015
int Y=1604
int Width=192
int Height=72
int TabOrder=40
string Text="Print"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//if dw_data.Print() <> 1 then return // commented for test 
parent.event ue_writehistory()
 
end event

type cbx_printpreview from checkbox within w_gcc_oleprint
int X=1394
int Y=1600
int Width=448
int Height=76
boolean BringToTop=true
string Text="Print Preview"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if cbx_printpreview.checked then 
	dw_data.Object.DataWindow.Print.Preview='Yes'
Else
	dw_data.Object.DataWindow.Print.Preview='No'
END IF 
//dw_data.Object.DataWindow.Print.Preview.Zoom='140'
end event

