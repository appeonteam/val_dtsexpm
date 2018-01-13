$PBExportHeader$w_approval_calls.srw
forward
global type w_approval_calls from w_pending_calls
end type
end forward

global type w_approval_calls from w_pending_calls
end type
global w_approval_calls w_approval_calls

on w_approval_calls.create
call super::create
end on

on w_approval_calls.destroy
call super::destroy
end on

type p_3 from w_pending_calls`p_3 within w_approval_calls
end type

type pb_exit from w_pending_calls`pb_exit within w_approval_calls
end type

type pb_filter from w_pending_calls`pb_filter within w_approval_calls
end type

type pb_refresh from w_pending_calls`pb_refresh within w_approval_calls
end type

type pb_findprev from w_pending_calls`pb_findprev within w_approval_calls
end type

type pb_findnext from w_pending_calls`pb_findnext within w_approval_calls
end type

type pb_find from w_pending_calls`pb_find within w_approval_calls
end type

type pb_sort from w_pending_calls`pb_sort within w_approval_calls
end type

type pb_modify from w_pending_calls`pb_modify within w_approval_calls
end type

type pb_copy from w_pending_calls`pb_copy within w_approval_calls
end type

type pb_closecall from w_pending_calls`pb_closecall within w_approval_calls
end type

type p_screen_hdr from w_pending_calls`p_screen_hdr within w_approval_calls
end type

type p_2 from w_pending_calls`p_2 within w_approval_calls
end type

type st_filter from w_pending_calls`st_filter within w_approval_calls
end type

type ddlb_filter from w_pending_calls`ddlb_filter within w_approval_calls
end type

type st_9 from w_pending_calls`st_9 within w_approval_calls
end type

type st_status from w_pending_calls`st_status within w_approval_calls
end type

type pb_last from w_pending_calls`pb_last within w_approval_calls
end type

type st_19 from w_pending_calls`st_19 within w_approval_calls
end type

type st_readsecs from w_pending_calls`st_readsecs within w_approval_calls
end type

type st_17 from w_pending_calls`st_17 within w_approval_calls
end type

type st_16 from w_pending_calls`st_16 within w_approval_calls
end type

type st_nextread from w_pending_calls`st_nextread within w_approval_calls
end type

type st_lastread from w_pending_calls`st_lastread within w_approval_calls
end type

type st_13 from w_pending_calls`st_13 within w_approval_calls
end type

type dw_3 from w_pending_calls`dw_3 within w_approval_calls
end type

type dw_1 from w_pending_calls`dw_1 within w_approval_calls
end type

