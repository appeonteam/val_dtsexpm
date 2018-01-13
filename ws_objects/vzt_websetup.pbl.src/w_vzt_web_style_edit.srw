$PBExportHeader$w_vzt_web_style_edit.srw
forward
global type w_vzt_web_style_edit from w_vzt_base
end type
type r_1 from rectangle within w_vzt_web_style_edit
end type
type cb_create_all_qsets from commandbutton within w_vzt_web_style_edit
end type
type sle_2 from singlelineedit within w_vzt_web_style_edit
end type
type cb_4 from commandbutton within w_vzt_web_style_edit
end type
type sle_hexcolor from singlelineedit within w_vzt_web_style_edit
end type
type cb_hex from commandbutton within w_vzt_web_style_edit
end type
type em_r from editmask within w_vzt_web_style_edit
end type
type em_g from editmask within w_vzt_web_style_edit
end type
type em_b from editmask within w_vzt_web_style_edit
end type
type st_3 from statictext within w_vzt_web_style_edit
end type
type st_4 from statictext within w_vzt_web_style_edit
end type
type em_rf from editmask within w_vzt_web_style_edit
end type
type em_gf from editmask within w_vzt_web_style_edit
end type
type em_bf from editmask within w_vzt_web_style_edit
end type
type sle_hexcolorf from singlelineedit within w_vzt_web_style_edit
end type
type st_1 from statictext within w_vzt_web_style_edit
end type
type st_2 from statictext within w_vzt_web_style_edit
end type
type st_rebuild from statictext within w_vzt_web_style_edit
end type
type dw_1 from uo_vzt_dwbase within w_vzt_web_style_edit
end type
type st_5 from statictext within w_vzt_web_style_edit
end type
type cbx_comments from checkbox within w_vzt_web_style_edit
end type
type cb_5 from commandbutton within w_vzt_web_style_edit
end type
type cb_6 from commandbutton within w_vzt_web_style_edit
end type
type dw_prop from uo_vzt_dwbase within w_vzt_web_style_edit
end type
type dw_pq from uo_vzt_dwbase within w_vzt_web_style_edit
end type
type cbx_local_db from checkbox within w_vzt_web_style_edit
end type
type st_6 from statictext within w_vzt_web_style_edit
end type
end forward

global type w_vzt_web_style_edit from w_vzt_base
integer width = 3712
integer height = 2184
string title = "VZTECH Web Service Setup"
long backcolor = 80269528
r_1 r_1
cb_create_all_qsets cb_create_all_qsets
sle_2 sle_2
cb_4 cb_4
sle_hexcolor sle_hexcolor
cb_hex cb_hex
em_r em_r
em_g em_g
em_b em_b
st_3 st_3
st_4 st_4
em_rf em_rf
em_gf em_gf
em_bf em_bf
sle_hexcolorf sle_hexcolorf
st_1 st_1
st_2 st_2
st_rebuild st_rebuild
dw_1 dw_1
st_5 st_5
cbx_comments cbx_comments
cb_5 cb_5
cb_6 cb_6
dw_prop dw_prop
dw_pq dw_pq
cbx_local_db cbx_local_db
st_6 st_6
end type
global w_vzt_web_style_edit w_vzt_web_style_edit

type variables
long 				il_contactid
nvo_qgen			inv_qgen
boolean			ib_webdb, ib_local_db_only
n_cst_vzt_tran	i_web_tran
string			is_dparm
n_cst_dbcopy	inv_dbcopy
end variables

on w_vzt_web_style_edit.create
int iCurrent
call super::create
this.r_1=create r_1
this.cb_create_all_qsets=create cb_create_all_qsets
this.sle_2=create sle_2
this.cb_4=create cb_4
this.sle_hexcolor=create sle_hexcolor
this.cb_hex=create cb_hex
this.em_r=create em_r
this.em_g=create em_g
this.em_b=create em_b
this.st_3=create st_3
this.st_4=create st_4
this.em_rf=create em_rf
this.em_gf=create em_gf
this.em_bf=create em_bf
this.sle_hexcolorf=create sle_hexcolorf
this.st_1=create st_1
this.st_2=create st_2
this.st_rebuild=create st_rebuild
this.dw_1=create dw_1
this.st_5=create st_5
this.cbx_comments=create cbx_comments
this.cb_5=create cb_5
this.cb_6=create cb_6
this.dw_prop=create dw_prop
this.dw_pq=create dw_pq
this.cbx_local_db=create cbx_local_db
this.st_6=create st_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.cb_create_all_qsets
this.Control[iCurrent+3]=this.sle_2
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.sle_hexcolor
this.Control[iCurrent+6]=this.cb_hex
this.Control[iCurrent+7]=this.em_r
this.Control[iCurrent+8]=this.em_g
this.Control[iCurrent+9]=this.em_b
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.em_rf
this.Control[iCurrent+13]=this.em_gf
this.Control[iCurrent+14]=this.em_bf
this.Control[iCurrent+15]=this.sle_hexcolorf
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_rebuild
this.Control[iCurrent+19]=this.dw_1
this.Control[iCurrent+20]=this.st_5
this.Control[iCurrent+21]=this.cbx_comments
this.Control[iCurrent+22]=this.cb_5
this.Control[iCurrent+23]=this.cb_6
this.Control[iCurrent+24]=this.dw_prop
this.Control[iCurrent+25]=this.dw_pq
this.Control[iCurrent+26]=this.cbx_local_db
this.Control[iCurrent+27]=this.st_6
end on

on w_vzt_web_style_edit.destroy
call super::destroy
destroy(this.r_1)
destroy(this.cb_create_all_qsets)
destroy(this.sle_2)
destroy(this.cb_4)
destroy(this.sle_hexcolor)
destroy(this.cb_hex)
destroy(this.em_r)
destroy(this.em_g)
destroy(this.em_b)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_rf)
destroy(this.em_gf)
destroy(this.em_bf)
destroy(this.sle_hexcolorf)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_rebuild)
destroy(this.dw_1)
destroy(this.st_5)
destroy(this.cbx_comments)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.dw_prop)
destroy(this.dw_pq)
destroy(this.cbx_local_db)
destroy(this.st_6)
end on

event open;call super::open;is_accessflags = 'WR'
if npassuserrights = 9 then is_accessflags = 'WRA'

inv_qgen = create nvo_qgen		
dw_1.Retrieve() 

long ll_tranx
ll_tranx = UpperBound( gnv_appman.i_tran[]) + 1 
gnv_appman.i_tran[ll_tranx ] = CREATE n_cst_vzt_tran 
i_web_tran = gnv_appman.i_tran[ll_tranx ] 
inv_qgen.event ue_web_tran( ib_webdb, is_dparm, i_web_tran )
ib_http = inv_qgen.ib_http
ib_local_db_only = cbx_local_db.checked 
inv_qgen.ib_local_db_only = this.ib_local_db_only 


cb_newsearch.event clicked()
cb_search.event clicked()
cb_new.visible = true 

//dw_data.SetColumn('guest_last_name')
//dw_data.POST SetFocus() 
cb_save.visible = true 
cb_select.visible = false
dw_mainlist.visible = false

cb_hex.event clicked()

end event

event ue_assign_menu;//
end event

event ue_save_commit;call super::ue_save_commit;dw_mainlist.event ue_rowselected( dw_mainlist.GetRow(), true)
end event

event close;if isvalid(inv_qgen)		then destroy inv_qgen 
if isvalid(i_web_tran)	then destroy i_web_tran

end event

type cb_dfilter from w_vzt_base`cb_dfilter within w_vzt_web_style_edit
end type

type uo_trace01 from w_vzt_base`uo_trace01 within w_vzt_web_style_edit
end type

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_web_style_edit
boolean visible = false
integer x = 3049
integer width = 224
integer height = 336
end type

event dw_mainlist::ue_rowselected;//if row > 0 and row <= this.RowCount() AND ab_selected = true then
//	il_contactid = f_nvl(dw_data.GetItemNumber(row,'id') , 0)
//
//	cb_new.visible 		= true 
//
//	if il_contactid <= 0 then 
//		dw_answers.Reset()
//		return 1
//	ELSE
//		cb_delete1.visible 	= true 
//		cb_save.visible 		= true 
//		cb_save.enabled 		= true 
//		dw_answers.Retrieve( il_contactid )
//		dw_contact_address.Retrieve( il_contactid )
//		dw_answers.visible 	= true 	
//		cb_ins.visible			= true
//		cb_del.visible			= true
//	END IF 
//
//	
//END IF	

return 1


end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_web_style_edit
integer x = 901
integer y = 1896
integer width = 302
integer taborder = 20
integer textsize = -8
end type

type cb_close from w_vzt_base`cb_close within w_vzt_web_style_edit
integer x = 1851
integer y = 1896
integer taborder = 210
integer textsize = -8
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_web_style_edit
integer x = 1362
integer y = 1896
integer width = 178
integer taborder = 270
integer textsize = -8
end type

type cb_save from w_vzt_base`cb_save within w_vzt_web_style_edit
integer x = 722
integer y = 1896
integer width = 165
integer taborder = 250
integer textsize = -8
end type

type cb_select from w_vzt_base`cb_select within w_vzt_web_style_edit
integer x = 549
integer y = 1896
integer width = 165
integer taborder = 240
integer textsize = -8
end type

type cb_new from w_vzt_base`cb_new within w_vzt_web_style_edit
integer x = 1211
integer y = 1896
integer width = 137
integer taborder = 260
integer textsize = -8
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_web_style_edit
integer x = 32
integer y = 1896
integer width = 302
integer taborder = 230
integer textsize = -8
end type

event cb_newsearch::clicked;call super::clicked;//cb_search.event clicked()
end event

type cb_search from w_vzt_base`cb_search within w_vzt_web_style_edit
integer x = 343
integer y = 1896
integer width = 192
integer taborder = 220
integer textsize = -8
end type

event cb_search::clicked;call super::clicked;cb_save.visible = true 
cb_select.visible = false

end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_web_style_edit
integer x = 1545
integer y = 1896
integer width = 247
integer textsize = -8
long backcolor = 8421504
end type

type st_stop from w_vzt_base`st_stop within w_vzt_web_style_edit
integer x = 1577
integer y = 1896
integer textsize = -8
integer weight = 400
end type

type dw_data from w_vzt_base`dw_data within w_vzt_web_style_edit
integer x = 5
integer y = 4
integer width = 3648
integer height = 1264
integer taborder = 150
string dataobject = "d_web_style_list"
end type

event dw_data::constructor;call super::constructor;this.ib_poweredit = true 
_ResetDataObjectOnSelect 	= true
//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

is_editable[]	={'style_id', 'style','comment0', 'property_id', 'qsetid', 'style_name'} // 'id',

is_searchable[]	=  is_editable[]


end event

event dw_data::ue_refresh_identity;//long ll_row, ll_id
//ll_row = this.GetRow() 
//if ll_row <= 0 then return  
//
//ll_id = f_nvl(this.GetitemNumber( this.GetRow(), 'questionid'),0)
//if ll_id = 0 then 
//	SELECT max(questionid) into :id_questionid from qgen_questions ;
//	this.setitem( this.GetRow(), 'questionid', id_questionid)
////	MessageBox('qid',string(id_questionid))
//ELSE
//	id_questionid = ll_id 
//END IF
//
//
end event

event dw_data::ue_update_keys_on_new;If row <= 0 then return 1

long ll_id, ll_row, ll_count
ll_id = f_nvl(this.GetitemNumber( row, 'id'),0)

if ll_id = 0 then 
	SELECT max(id) + 1 into :ll_id from vzt_contact ;
	this.setitem( row, 'id', ll_id )
END IF
return 1
end event

type dw_print from w_vzt_base`dw_print within w_vzt_web_style_edit
integer x = 3058
integer y = 1468
integer taborder = 280
end type

type uo_ddcal from w_vzt_base`uo_ddcal within w_vzt_web_style_edit
end type

type r_1 from rectangle within w_vzt_web_style_edit
integer linethickness = 12
long fillcolor = 8421504
integer x = 14
integer y = 1876
integer width = 2135
integer height = 112
end type

type cb_create_all_qsets from commandbutton within w_vzt_web_style_edit
integer x = 23
integer y = 1372
integer width = 567
integer height = 68
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "create qset html (all)"
end type

event clicked;int 		li_survey_row, li_max_rows, li_survey, li_propid
string 	ls_htmlfile 


dw_1.visible 			= false
st_rebuild.visible 	= true

inv_qgen.ib_html_comments = cbx_comments.checked 

st_rebuild.text		= 'Rebuilding active survey lists...'
cb_5.event clicked() // default prop/qset 
st_rebuild.text		= 'Rebuilding styles...'
cb_4.event clicked() // styles rebuild 

li_max_rows = dw_1.Retrieve()
If li_max_rows > 0 then 
 FOR li_survey_row = 1 to li_max_rows 
	st_rebuild.text		= 'Rebuilding HTML... ' + inv_qgen.crlf+ string(li_survey_row)+ ' of '+ string(li_max_rows)
	dw_1.SelectRow( 0, false)
	dw_1.SelectRow( li_survey_row , true)
	li_survey = dw_1.GetItemNumber( li_survey_row, 'qsetid')
	li_propid = dw_1.GetItemNumber( li_survey_row , 'vzt_property_id')

	inv_qgen.event ue_html_create_qset( li_propid, li_survey )
	inv_qgen.event ue_save_qset_html(li_propid, SQLCA)
	If ib_webdb then 
		if not ib_local_db_only then // skip remote web db even if in sysoptions
			If ib_http then 
				inv_qgen.event ue_save_qset_html_http(li_propid) // update via HTTP
			else
				inv_qgen.event ue_save_qset_html(li_propid, i_web_tran)
			end if
		end if // local db only check
	end if 
	ls_htmlfile =  upper( trim(sle_2.text) + 'prop'+string(li_propid,'000') +'qset'+string(li_survey, '000')+'.HTM' ) // .ASP .HTM
	f_vzt_writefile_from_blob( ls_htmlfile , inv_qgen.ib_html )
 NEXT
END IF

cb_newsearch.event clicked()
cb_search.event clicked()

st_rebuild.visible 	= false
dw_1.visible 			= true

end event

type sle_2 from singlelineedit within w_vzt_web_style_edit
integer x = 18
integer y = 1292
integer width = 969
integer height = 76
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "C:\Inetpub\WWWROOT\"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_vzt_web_style_edit
integer x = 23
integer y = 1444
integer width = 1019
integer height = 72
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset Style From Template for all Prop/Qset"
end type

event clicked;
long ll_row, ll_maxrows, li_rc 
string ls_execute, ls_qsetid, ls_propid, ls_code, ls_message 	
ll_maxrows = dw_1.rowcount()
FOR ll_row = 1 to ll_maxrows
	ls_qsetid	= string( dw_1.GetItemNumber( ll_row, 'qsetid') )
	ls_propid	= string( dw_1.GetItemNumber( ll_row, 'vzt_property_id') )
	
	ls_execute = 'exec vzt_web_style_reset01 @ai_property_id ='+ ls_propid + ', @ai_qsetid = '+ ls_qsetid
	execute immediate :ls_execute using SQLCA;
	If SQLCA.sqlcode <> 0 then	
		ls_code 		= string(SQLCA.sqlcode) 
		ls_message 	= f_nvl(SQLCA.sqlerrtext,'*')
		li_rc = -10
	END IF 
	f_end_tran (SQLCA, li_rc , 'Styles HTML Creation', '','Styles HTML Creation failed in main db.'+'~r~n~r~nSQL Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )
NEXT
		
// ------------------------------------------------------------------------
If ib_webdb then 	
 if ib_http then 
	// do not copy styles for now 
 else
	If not IsValid( inv_dbcopy ) then inv_dbcopy = CREATE n_cst_dbcopy 
	DELETE FROM vzt_web_style USING i_web_tran ;
	If SQLCA.sqlcode <> 0 then	
		ls_code 		= string(SQLCA.sqlcode) 
		ls_message 	= f_nvl(SQLCA.sqlerrtext,'*')
		li_rc = -10
	END IF 
	f_end_tran (i_web_tran , li_rc , 'Styles HTML Creation', '','Styles HTML Delete failed in web db.'+'~r~n~r~nSQL Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )
	
	inv_dbcopy.of_init( 'd_web_style_list', SQLCA, i_web_tran) // do, tran_from, tran_to
	inv_dbcopy.ids_data.Retrieve ()
	li_rc 		= inv_dbcopy.of_copy( true ) // copy with commit  
	ls_code 		= string(i_web_tran.sqlcode) 
	ls_message 	= f_nvl(i_web_tran.sqlerrtext,'*')
	If li_rc < 0 then 
		MessageBox('Styles HTML Creation', 'Styles HTML Creation failed in web db.'+'~r~n~r~nSQL Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )
	end if
end if // http 
end if
				
end event

type sle_hexcolor from singlelineedit within w_vzt_web_style_edit
integer x = 1650
integer y = 1304
integer width = 229
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_hex from commandbutton within w_vzt_web_style_edit
integer x = 1477
integer y = 1308
integer width = 169
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "hex"
end type

event clicked;long ll_color
//ll_color	= RGB( integer(sle_r.text), integer(sle_g.text), integer(sle_b.text) )
ll_color	= RGB( integer(em_r.text), integer(em_g.text), integer(em_b.text) )
st_1.backcolor = ll_color	
sle_hexcolor.text = f_html_color_from_rgb( ll_color )

ll_color	= RGB( integer(em_rf.text), integer(em_gf.text), integer(em_bf.text) )
st_1.textcolor = ll_color	
sle_hexcolorf.text = f_html_color_from_rgb( ll_color )



end event

type em_r from editmask within w_vzt_web_style_edit
integer x = 1518
integer y = 1388
integer width = 201
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "180"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

type em_g from editmask within w_vzt_web_style_edit
integer x = 1728
integer y = 1388
integer width = 201
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 32768
string text = "130"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

type em_b from editmask within w_vzt_web_style_edit
integer x = 1938
integer y = 1388
integer width = 201
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
string text = "220"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

type st_3 from statictext within w_vzt_web_style_edit
integer x = 1472
integer y = 1396
integer width = 55
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421504
boolean enabled = false
string text = "B"
boolean focusrectangle = false
end type

type st_4 from statictext within w_vzt_web_style_edit
integer x = 1472
integer y = 1476
integer width = 55
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421504
boolean enabled = false
string text = "F"
boolean focusrectangle = false
end type

type em_rf from editmask within w_vzt_web_style_edit
integer x = 1518
integer y = 1476
integer width = 201
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "255"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

type em_gf from editmask within w_vzt_web_style_edit
integer x = 1728
integer y = 1476
integer width = 201
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 32768
string text = "255"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

type em_bf from editmask within w_vzt_web_style_edit
integer x = 1938
integer y = 1476
integer width = 201
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
string text = "255"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~255"
end type

type sle_hexcolorf from singlelineedit within w_vzt_web_style_edit
integer x = 1883
integer y = 1304
integer width = 256
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_vzt_web_style_edit
integer x = 2153
integer y = 1304
integer width = 288
integer height = 252
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 67108864
boolean enabled = false
string text = "sample HTML text "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_vzt_web_style_edit
integer x = 1454
integer y = 1288
integer width = 1019
integer height = 288
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 8421504
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_rebuild from statictext within w_vzt_web_style_edit
boolean visible = false
integer x = 2487
integer y = 1288
integer width = 1161
integer height = 704
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rebuilding HTML..."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from uo_vzt_dwbase within w_vzt_web_style_edit
integer x = 2482
integer y = 1288
integer width = 1184
integer height = 716
integer taborder = 110
string dataobject = "d_dddw_active_syrveys_by_prop"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'
end event

type st_5 from statictext within w_vzt_web_style_edit
integer x = 603
integer y = 1380
integer width = 265
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "comments?"
boolean focusrectangle = false
end type

type cbx_comments from checkbox within w_vzt_web_style_edit
integer x = 855
integer y = 1372
integer width = 69
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

type cb_5 from commandbutton within w_vzt_web_style_edit
integer x = 384
integer y = 1524
integer width = 654
integer height = 68
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Create Default Prop/Qset"
end type

event clicked;int li_rc
string ls_execute,  ls_propid, ls_code, ls_message 	

select option06 into :ls_propid from vzt_sysoptions where id=1 using SQLCA;
if trim(f_nvl(ls_propid,''))='' then
	messagebox ('Definition Incomplete', 'Property name is not defined in sysoptions!',stopsign!)
	open( w_vzt_sysoptions_edit)
	return 
end if
	
ls_execute = 'exec vzt_web_def_prop '
execute immediate :ls_execute using SQLCA;
If SQLCA.sqlcode <> 0 then	
	ls_code 		= string(SQLCA.sqlcode) 
	ls_message 	= f_nvl(SQLCA.sqlerrtext,'*')
	li_rc = -10
END IF 
f_end_tran (SQLCA, li_rc , 'Default Property/Qset Creation', '','Default Property/Qset Creation failed in main db.'+'~r~n~r~nSQL Code:'+ ls_code +'~r~n~Error Message:'+ ls_message  )

end event

type cb_6 from commandbutton within w_vzt_web_style_edit
integer x = 23
integer y = 1524
integer width = 347
integer height = 68
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sysoptions"
end type

event clicked;open( w_vzt_sysoptions_edit)
	
end event

type dw_prop from uo_vzt_dwbase within w_vzt_web_style_edit
boolean visible = false
integer x = 2103
integer y = 1052
integer width = 1184
integer height = 220
integer taborder = 130
string dataobject = "d_dddw_active_syrveys_by_prop"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'
end event

type dw_pq from uo_vzt_dwbase within w_vzt_web_style_edit
boolean visible = false
integer y = 1036
integer width = 1678
integer height = 244
integer taborder = 140
string dataobject = "d_vzt_properties_list"
boolean vscrollbar = true
end type

event constructor;call super::constructor;_selection_service = 'S'
end event

type cbx_local_db from checkbox within w_vzt_web_style_edit
integer x = 1230
integer y = 1372
integer width = 69
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean checked = true
boolean lefttext = true
end type

event clicked;ib_local_db_only 				= cbx_local_db.checked 
inv_qgen.ib_local_db_only 	= ib_local_db_only 

end event

type st_6 from statictext within w_vzt_web_style_edit
integer x = 951
integer y = 1380
integer width = 283
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "local db only"
boolean focusrectangle = false
end type

