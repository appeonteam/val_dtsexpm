$PBExportHeader$uo_qgen_tabpage_def.sru
forward
global type uo_qgen_tabpage_def from uo_tabpage_dw
end type
end forward

global type uo_qgen_tabpage_def from uo_tabpage_dw
int Width=2395
int Height=844
string PictureName="scriptyes!"
string Text="Report Definition"
end type
global uo_qgen_tabpage_def uo_qgen_tabpage_def

on uo_qgen_tabpage_def.create
call super::create
end on

on uo_qgen_tabpage_def.destroy
call super::destroy
end on

type dw_1 from uo_tabpage_dw`dw_1 within uo_qgen_tabpage_def
int X=0
int Y=16
int Width=2373
int Height=716
boolean BringToTop=true
string DataObject="d_qgen_rpt_def_edit"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean HScrollBar=false
boolean VScrollBar=false
end type

event dw_1::itemchanged;call super::itemchanged;if row >= 0 and row <= this.rowcount() then
	CHOOSE CASE dwo.name 
		CASE 'daytorunsun', 'daytorunmon', 'daytoruntue', 'daytorunwed', 'daytorunthu', 'daytorunfri', 'daytorunsat'
			If	dw_1.object.recurring [row] 	 = 'WEEKLY' then 
				dw_1.object.daytorunsun [row] 	 = 'N'
				dw_1.object.daytorunmon [row] 	 = 'N'
				dw_1.object.daytoruntue [row] 	 = 'N'
				dw_1.object.daytorunwed [row] 	 = 'N'
				dw_1.object.daytorunthu [row] 	 = 'N'
				dw_1.object.daytorunfri [row] 	 = 'N'
				dw_1.object.daytorunsat [row] 	 = 'N'			
			End If
			
		CASE 'drilldownreportid'			
			parenttab.event dynamic ue_refresh_ddparms( data )
	END CHOOSE
End if



		
		
		
		
		

end event

event dw_1::constructor;call super::constructor;_ResetDataObjectOnSelect 	= true
end event

