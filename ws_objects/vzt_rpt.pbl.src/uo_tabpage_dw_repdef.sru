$PBExportHeader$uo_tabpage_dw_repdef.sru
forward
global type uo_tabpage_dw_repdef from uo_tabpage_dw
end type
end forward

global type uo_tabpage_dw_repdef from uo_tabpage_dw
int Width=2441
int Height=1324
string PictureName="scriptyes!"
string Text="Report Definition"
end type
global uo_tabpage_dw_repdef uo_tabpage_dw_repdef

on uo_tabpage_dw_repdef.create
call super::create
end on

on uo_tabpage_dw_repdef.destroy
call super::destroy
end on

type dw_1 from uo_tabpage_dw`dw_1 within uo_tabpage_dw_repdef
int Y=16
int Width=2409
int Height=1284
boolean BringToTop=true
string DataObject="d_vzt_rpt_def_edit"
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

