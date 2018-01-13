$PBExportHeader$w_vzt_text_edit.srw
forward
global type w_vzt_text_edit from w_vzt_base
end type
type dw_text_detail from uo_vzt_dwbase within w_vzt_text_edit
end type
type dw_lang_all from uo_vzt_dwbase within w_vzt_text_edit
end type
type cb_test from commandbutton within w_vzt_text_edit
end type
end forward

global type w_vzt_text_edit from w_vzt_base
int Width=2531
int Height=1437
dw_text_detail dw_text_detail
dw_lang_all dw_lang_all
cb_test cb_test
end type
global w_vzt_text_edit w_vzt_text_edit

type variables
string 	is_text_id
long 	il_langs
end variables

on w_vzt_text_edit.create
int iCurrent
call super::create
this.dw_text_detail=create dw_text_detail
this.dw_lang_all=create dw_lang_all
this.cb_test=create cb_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_text_detail
this.Control[iCurrent+2]=this.dw_lang_all
this.Control[iCurrent+3]=this.cb_test
end on

on w_vzt_text_edit.destroy
call super::destroy
destroy(this.dw_text_detail)
destroy(this.dw_lang_all)
destroy(this.cb_test)
end on

event open;call super::open;il_langs = dw_lang_all.Retrieve()
cb_newsearch.event Clicked()
cb_test.visible = false
end event

type dw_mainlist from w_vzt_base`dw_mainlist within w_vzt_text_edit
int Height=422
string DataObject="d_text_edit_list"
end type

event dw_mainlist::ue_rowselected;if row <=0 or row > this.rowcount() then return 0

if ab_selected then
	long ll_lrow, ll_foundrow, ll_detrows, ll_newdetrow
	is_text_id = this.GetItemString( row, 'vzt_text_id')
	ll_detrows = dw_text_detail.Retrieve(is_text_id )
	
	// insert not translated rows automatically...
	If il_langs < 1 then return -1
	string ls_lang, ls_active
	For ll_lrow = 1 to il_langs 
		ls_lang 		= trim( dw_lang_all.GetItemString( ll_lrow , 'name'))
		ls_active	= dw_lang_all.GetItemString( ll_lrow , 'active')
		ll_foundrow = dw_text_detail.Find( 'vzt_text_language = "'+ ls_lang + '"', 1, ll_detrows)
		IF ll_foundrow = 0 then // need to insert 
			ll_newdetrow = dw_text_detail.InsertRow(0) 
			If ll_newdetrow > 0 then  
				dw_text_detail.SetItem( ll_newdetrow, 'vzt_languages_name',		ls_lang)
				dw_text_detail.SetItem( ll_newdetrow, 'vzt_languages_active',	ls_active)				
				dw_text_detail.SetItem( ll_newdetrow, 'vzt_text_language', 		ls_lang)
				dw_text_detail.SetItem( ll_newdetrow, 'vzt_text_id', 				is_text_id )
				dw_text_detail.SetItem( ll_newdetrow, 'vzt_text_text', 			'Not Translated' )
				
			END IF
		END IF 
	Next	
Else
END IF
cb_save.visible 	= true 
cb_select.visible = false
cb_test.visible = true 
return 0
end event

event dw_mainlist::constructor;call super::constructor;//_selection_service = 'S'  // 'S' single, 'M' - multi
end event

type cb_last_search from w_vzt_base`cb_last_search within w_vzt_text_edit
int X=1039
int Y=1197
int TabOrder=20
end type

type cb_close from w_vzt_base`cb_close within w_vzt_text_edit
int X=2286
int Y=1197
int TabOrder=60
end type

type cb_delete1 from w_vzt_base`cb_delete1 within w_vzt_text_edit
int X=1569
int Y=1197
int TabOrder=120
end type

type cb_save from w_vzt_base`cb_save within w_vzt_text_edit
int X=819
int Y=1197
int TabOrder=100
end type

type cb_select from w_vzt_base`cb_select within w_vzt_text_edit
int X=2779
int Y=1126
int TabOrder=90
boolean Visible=false
end type

type cb_new from w_vzt_base`cb_new within w_vzt_text_edit
int X=1397
int Y=1197
int TabOrder=110
end type

type cb_newsearch from w_vzt_base`cb_newsearch within w_vzt_text_edit
int X=22
int Y=1197
int TabOrder=80
end type

type cb_search from w_vzt_base`cb_search within w_vzt_text_edit
int X=373
int Y=1197
int TabOrder=70
end type

event cb_search::clicked;call super::clicked;cb_select.visible = false
end event

type st_foundrecs from w_vzt_base`st_foundrecs within w_vzt_text_edit
int X=2022
int Y=1200
boolean BringToTop=true
end type

type st_stop from w_vzt_base`st_stop within w_vzt_text_edit
int X=2085
int Y=1197
boolean BringToTop=true
end type

type dw_data from w_vzt_base`dw_data within w_vzt_text_edit
int Y=451
int Height=166
int TabOrder=50
string DataObject="d_text_edit_header"
boolean VScrollBar=false
end type

event dw_data::constructor;call super::constructor;_ResetDataObjectOnSelect 	= true
ib_poweredit					= true
is_editable[]	= { 'vzt_text_id','vzt_text_text','vzt_text_descr' }
is_searchable[]	= { 'vzt_text_id','vzt_text_text','vzt_text_descr' }

//is_protected[]	={''}
//is_restricted[]	={''}
//is_required[]	={''}

end event

type dw_print from w_vzt_base`dw_print within w_vzt_text_edit
int X=1840
int Y=1200
int TabOrder=130
boolean BringToTop=true
end type

type dw_text_detail from uo_vzt_dwbase within w_vzt_text_edit
int X=18
int Y=634
int Width=2461
int Height=541
int TabOrder=40
boolean BringToTop=true
string DataObject="d_text_edit_detail"
boolean HScrollBar=true
boolean VScrollBar=true
end type

event constructor;call super::constructor;parent.wf_setupdateable( dw_text_detail, 'Text Detail', false, false)
end event

type dw_lang_all from uo_vzt_dwbase within w_vzt_text_edit
int X=2491
int Y=714
int Width=830
int Height=387
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
string DataObject="d_dddw_languages_all"
BorderStyle BorderStyle=StyleBox!
end type

type cb_test from commandbutton within w_vzt_text_edit
int X=611
int Y=1197
int Width=197
int Height=74
int TabOrder=130
boolean BringToTop=true
string Text="Test"
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;is_text_id = f_nvl( is_text_id, '')
MessageBox('Language Test', 'Selected Language: ' + gnv_appman.inv_language.is_language + &
				'~r~n~String: '+ gnv_appman.inv_language.of_get_text( is_text_id ))
end event

