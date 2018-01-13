$PBExportHeader$w_vzt_rpt_processor_4s.srw
$PBExportComments$processor for Four Seasons Berlin corp. rpts
forward
global type w_vzt_rpt_processor_4s from w_vzt_rpt_processor
end type
type cb_mail from commandbutton within w_vzt_rpt_processor_4s
end type
end forward

global type w_vzt_rpt_processor_4s from w_vzt_rpt_processor
cb_mail cb_mail
end type
global w_vzt_rpt_processor_4s w_vzt_rpt_processor_4s

on w_vzt_rpt_processor_4s.create
int iCurrent
call super::create
this.cb_mail=create cb_mail
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_mail
end on

on w_vzt_rpt_processor_4s.destroy
call super::destroy
destroy(this.cb_mail)
end on

event ue_distribute_report;call super::ue_distribute_report;string 	ls_dist_list_id, ls_id, ls_now, ls_pfx, ls_message
long		ll_maxrows, ll_row, ll_ret, ll_rc, ll_pos
datetime	ldt_now
ls_dist_list_id 	= f_nvl(dw_schedule.object.distribution_list_id [ dw_schedule.GetRow() ] , '')
ls_id					= f_nvl(dw_schedule.object.id [ dw_schedule.GetRow() ] , '')
If ls_dist_list_id = '' then return 

SELECT pfx1 INTO :ls_pfx 
from vzt_sysoptions WHERE id = 1;

ll_maxrows = dw_distribution.Retrieve( ls_dist_list_id )
If ll_maxrows <= 0 then 
	IF istr_parms.mode <> 'BATCH' then 
		MessageBox('VZT Reporter Error', 'Report distribution list is empty.~r~nReport will not be mailed.', Exclamation!) 
	END IF
	return 
END IF 
	
// Mail to list 
if Not IsValid(inv_mail) then inv_mail = CREATE uo_vzt_mail 

string ls_mailtoname[], ls_mailtoid[], ls_attachfile[]
string ls_fname, ls_lname, ls_filename, ls_subject , ls_htmlfile, ls_vzrfile
string ls_letter
//ls_filename =  dw_schedule.object.id[1] 
ls_filename =  dw_schedule.GetItemString(1, 'title') 

ls_letter = ''
if POS(ls_filename,"'RA'") >0 or POS(ls_filename,"'A'")>0 then ls_letter ='A'
if POS(ls_filename,"'RC'") >0 or POS(ls_filename,"'C'")>0 then ls_letter ='C'
if POS(ls_filename,"'RR'") >0 or POS(ls_filename,"'R'")>0 then ls_letter ='R'

ll_pos = MONTH(today()) - 1 // prev month 
If ll_pos = 0 then ll_pos = 12 

ls_filename = ls_pfx +MID(string(year(today()),'0000'),3,2) + string(ll_pos,'00') + ls_letter

f_replace(ls_filename, ',','')
f_replace(ls_filename, ':','')
f_replace(ls_filename, ';','')
f_replace(ls_filename, ':','')
f_replace(ls_filename, '/','')
f_replace(ls_filename, '\','')
f_replace(ls_filename, '|','')
f_replace(ls_filename, '-','_')

// Save report in CSV flavor for 4 seasons 
ls_vzrfile	=  upper( gnv_appman.is_tempdir + ls_filename + '.CSV' )

FileDelete( ls_vzrfile ) 

idw_rpt.SaveAs( ls_vzrfile, CSV!, true) 

ls_attachfile[1]	= ls_vzrfile 

ls_subject			= 'Four Seasons '+ls_pfx+' Extracts, Report: '+ ls_filename  
FOR ll_row = 1 to ll_maxrows 
	ls_fname 					= trim( dw_distribution.object.vzt_contact_firstname 	[ll_row] )
	ls_lname 					= trim( dw_distribution.object.vzt_contact_lastname 	[ll_row] )
	ls_mailtoname[ll_row]	= ls_lname + ', ' + ls_fname 
	ls_mailtoid[ll_row]		= dw_distribution.object.address [ll_row] 
NEXT

ll_ret = inv_mail.uf_mail_send( ls_subject,'*Four Seasons ' +ls_pfx+' Export attached ( '+ls_filename+ ')*' ,ls_mailtoname[],ls_mailtoid[],ls_attachfile[]) 

ls_message	= f_nvl(dw_schedule.object.message [ dw_schedule.GetRow() ] , '')
ls_message	= ls_message+ ' EMAILED (FS) '+ string(datetime(today(), now()))
dw_schedule.SetItem( dw_schedule.GetRow(), 'message', ls_message)
if dw_schedule.update() = 1 then
	commit;
else
	rollback;
end if
	
if IsValid(inv_mail) then DESTROY inv_mail 
 
FileDelete ( ls_vzrfile )

end event

event resize;call super::resize;if ib_resizeenabled then 
	if sizetype <> 1 then 
		cb_mail.y	= 	newheight -  cb_mail.height 	- ii_resizeband_y 
	End IF 
End IF 	
end event

type cb_dfilter from w_vzt_rpt_processor`cb_dfilter within w_vzt_rpt_processor_4s
end type

type uo_trace01 from w_vzt_rpt_processor`uo_trace01 within w_vzt_rpt_processor_4s
end type

type dw_mainlist from w_vzt_rpt_processor`dw_mainlist within w_vzt_rpt_processor_4s
integer taborder = 240
end type

type cb_last_search from w_vzt_rpt_processor`cb_last_search within w_vzt_rpt_processor_4s
end type

type cb_close from w_vzt_rpt_processor`cb_close within w_vzt_rpt_processor_4s
integer taborder = 90
end type

type cb_delete1 from w_vzt_rpt_processor`cb_delete1 within w_vzt_rpt_processor_4s
integer taborder = 170
end type

type cb_save from w_vzt_rpt_processor`cb_save within w_vzt_rpt_processor_4s
integer taborder = 210
end type

type cb_select from w_vzt_rpt_processor`cb_select within w_vzt_rpt_processor_4s
integer taborder = 200
end type

type cb_new from w_vzt_rpt_processor`cb_new within w_vzt_rpt_processor_4s
integer taborder = 230
end type

type cb_newsearch from w_vzt_rpt_processor`cb_newsearch within w_vzt_rpt_processor_4s
integer taborder = 190
end type

type cb_search from w_vzt_rpt_processor`cb_search within w_vzt_rpt_processor_4s
integer taborder = 160
end type

type st_foundrecs from w_vzt_rpt_processor`st_foundrecs within w_vzt_rpt_processor_4s
end type

type st_stop from w_vzt_rpt_processor`st_stop within w_vzt_rpt_processor_4s
end type

type dw_data from w_vzt_rpt_processor`dw_data within w_vzt_rpt_processor_4s
integer taborder = 140
end type

type dw_print from w_vzt_rpt_processor`dw_print within w_vzt_rpt_processor_4s
integer taborder = 250
end type

type uo_ddcal from w_vzt_rpt_processor`uo_ddcal within w_vzt_rpt_processor_4s
end type

type uo_zoom from w_vzt_rpt_processor`uo_zoom within w_vzt_rpt_processor_4s
integer taborder = 220
end type

type cbx_preview from w_vzt_rpt_processor`cbx_preview within w_vzt_rpt_processor_4s
end type

type tab_1 from w_vzt_rpt_processor`tab_1 within w_vzt_rpt_processor_4s
integer taborder = 150
end type

type dw_repdef from w_vzt_rpt_processor`dw_repdef within w_vzt_rpt_processor_4s
integer taborder = 120
end type

type dw_repout from w_vzt_rpt_processor`dw_repout within w_vzt_rpt_processor_4s
end type

type cb_run_again from w_vzt_rpt_processor`cb_run_again within w_vzt_rpt_processor_4s
integer taborder = 180
end type

type cb_show_sql from w_vzt_rpt_processor`cb_show_sql within w_vzt_rpt_processor_4s
integer taborder = 100
end type

type cb_show_syntax from w_vzt_rpt_processor`cb_show_syntax within w_vzt_rpt_processor_4s
integer taborder = 110
end type

type dw_parms from w_vzt_rpt_processor`dw_parms within w_vzt_rpt_processor_4s
integer taborder = 80
end type

type dw_def from w_vzt_rpt_processor`dw_def within w_vzt_rpt_processor_4s
integer taborder = 60
end type

type dw_rpt from w_vzt_rpt_processor`dw_rpt within w_vzt_rpt_processor_4s
integer taborder = 70
end type

type dw_schedule from w_vzt_rpt_processor`dw_schedule within w_vzt_rpt_processor_4s
integer taborder = 130
end type

type cbx_cover from w_vzt_rpt_processor`cbx_cover within w_vzt_rpt_processor_4s
end type

type dw_cover from w_vzt_rpt_processor`dw_cover within w_vzt_rpt_processor_4s
integer taborder = 50
end type

type st_data from w_vzt_rpt_processor`st_data within w_vzt_rpt_processor_4s
end type

type dw_distribution from w_vzt_rpt_processor`dw_distribution within w_vzt_rpt_processor_4s
integer x = 1431
integer y = 1568
integer taborder = 40
end type

type p_1 from w_vzt_rpt_processor`p_1 within w_vzt_rpt_processor_4s
end type

type dw_remote_connections from w_vzt_rpt_processor`dw_remote_connections within w_vzt_rpt_processor_4s
integer taborder = 30
end type

type cb_mail from commandbutton within w_vzt_rpt_processor_4s
integer x = 1019
integer y = 1648
integer width = 247
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "email"
end type

event clicked;parent.event ue_distribute_report ()
end event

