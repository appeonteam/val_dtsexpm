$PBExportHeader$w_gcc_letter_thanks_feedback.srw
forward
global type w_gcc_letter_thanks_feedback from w_gcc_letter
end type
end forward

global type w_gcc_letter_thanks_feedback from w_gcc_letter
boolean TitleBar=true
string Title="GCC  Feedback Request Letter"
long BackColor=80269528
end type
global w_gcc_letter_thanks_feedback w_gcc_letter_thanks_feedback

on w_gcc_letter_thanks_feedback.create
call super::create
end on

on w_gcc_letter_thanks_feedback.destroy
call super::destroy
end on

event open;call super::open;id_oleid = 9
is_action_code = 'FRL'
is_descr			= 'Feedback Request letter'
sle_1.text		= 'Please tell us what you think!'
end event

type cb_close from w_gcc_letter`cb_close within w_gcc_letter_thanks_feedback
int TabOrder=100
end type

type cb_delete1 from w_gcc_letter`cb_delete1 within w_gcc_letter_thanks_feedback
int TabOrder=160
end type

type cb_save from w_gcc_letter`cb_save within w_gcc_letter_thanks_feedback
int TabOrder=140
end type

type cb_select from w_gcc_letter`cb_select within w_gcc_letter_thanks_feedback
int TabOrder=130
end type

type cb_new from w_gcc_letter`cb_new within w_gcc_letter_thanks_feedback
int TabOrder=150
end type

type cb_newsearch from w_gcc_letter`cb_newsearch within w_gcc_letter_thanks_feedback
int TabOrder=120
end type

type cb_search from w_gcc_letter`cb_search within w_gcc_letter_thanks_feedback
int TabOrder=110
end type

type st_foundrecs from w_gcc_letter`st_foundrecs within w_gcc_letter_thanks_feedback
boolean BringToTop=true
end type

type st_stop from w_gcc_letter`st_stop within w_gcc_letter_thanks_feedback
boolean BringToTop=true
end type

type dw_data from w_gcc_letter`dw_data within w_gcc_letter_thanks_feedback
int TabOrder=90
end type

type dw_print from w_gcc_letter`dw_print within w_gcc_letter_thanks_feedback
int TabOrder=170
boolean BringToTop=true
end type

type ole_1 from w_gcc_letter`ole_1 within w_gcc_letter_thanks_feedback
int TabOrder=70
boolean BringToTop=true
end type

type cb_oleedit from w_gcc_letter`cb_oleedit within w_gcc_letter_thanks_feedback
int TabOrder=50
end type

type cb_getfile from w_gcc_letter`cb_getfile within w_gcc_letter_thanks_feedback
int TabOrder=80
boolean BringToTop=true
end type

type cb_history from w_gcc_letter`cb_history within w_gcc_letter_thanks_feedback
int TabOrder=180
boolean BringToTop=true
end type

type cb_mail from w_gcc_letter`cb_mail within w_gcc_letter_thanks_feedback
int TabOrder=190
boolean Visible=false
boolean BringToTop=true
end type

type sle_1 from w_gcc_letter`sle_1 within w_gcc_letter_thanks_feedback
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from w_gcc_letter`st_1 within w_gcc_letter_thanks_feedback
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from w_gcc_letter`st_2 within w_gcc_letter_thanks_feedback
boolean Visible=false
boolean BringToTop=true
end type

type sle_2 from w_gcc_letter`sle_2 within w_gcc_letter_thanks_feedback
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
end type

type st_3 from w_gcc_letter`st_3 within w_gcc_letter_thanks_feedback
boolean Visible=false
boolean BringToTop=true
end type

type dw_guest from w_gcc_letter`dw_guest within w_gcc_letter_thanks_feedback
int TabOrder=60
boolean BringToTop=true
end type

