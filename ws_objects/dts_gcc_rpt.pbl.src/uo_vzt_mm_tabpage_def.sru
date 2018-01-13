$PBExportHeader$uo_vzt_mm_tabpage_def.sru
forward
global type uo_vzt_mm_tabpage_def from uo_tabpage_dw
end type
end forward

global type uo_vzt_mm_tabpage_def from uo_tabpage_dw
int Width=2345
int Height=664
long BackColor=79349703
string PictureName="scriptyes!"
string Text="Report Definition"
end type
global uo_vzt_mm_tabpage_def uo_vzt_mm_tabpage_def

on uo_vzt_mm_tabpage_def.create
call super::create
end on

on uo_vzt_mm_tabpage_def.destroy
call super::destroy
end on

event ue_secure_display;// Admin rights 
If POS(as_rights, 'A' ) > 0 then 
	dw_1.object.datawindow.detail.height = 1190
	dw_1.height = 1210
ELSE
	dw_1.object.datawindow.detail.height = 544
	dw_1.height = 544 
END IF


//If POS(as_rights, 'W' ) <= 0 then 
//	tab_1.tabpage[UpperBound(tab_1.tabpage[])].visible = false
//	idw_def.Object.Datawindow.readonly="YES"
//
//	idw_def.object.drilldownreportid.visible 	= false
//	idw_def.object.drilldownreportid_t.visible= false
//	idw_def.object.c_rancount.visible 			= false
//	idw_def.object.timetorun.visible 			= false
//	idw_def.object.timetorunend.visible 		= false
//	idw_def.object.timetorun_t.visible 			= false
//	idw_def.object.timetorunend_t.visible 		= false	
//	idw_def.object.daystokeep.visible 			= false 
//	idw_def.object.daystokeep_t.visible 		= false 
//	idw_def.object.daystokeep_t1.visible 		= false 		
//	idw_def.object.keeplast.visible 				= false 
//	idw_def.object.keeplast_t.visible 			= false 
//	idw_def.object.recurring_t.visible 			= false 
//	idw_def.object.recurring.visible 			= false 
//	idw_def.object.daytorunmon.visible 			= false 
//	idw_def.object.daytorunmon_t.visible 		= false 
//	idw_def.object.daytoruntue.visible 			= false 
//	idw_def.object.daytoruntue_t.visible 		= false 
//	idw_def.object.daytorunwed.visible 			= false 
//	idw_def.object.daytorunwed_t.visible 		= false 
//	idw_def.object.daytorunthu.visible 			= false 
//	idw_def.object.daytorunthu_t.visible 		= false 
//	idw_def.object.daytorunfri.visible 			= false 
//	idw_def.object.daytorunfri_t.visible 		= false 
//	idw_def.object.daytorunsat.visible 			= false 
//	idw_def.object.daytorunsat_t.visible 		= false 
//	idw_def.object.daytorunsun.visible 			= false 
//	idw_def.object.daytorunsun_t.visible 		= false 
//	idw_def.object.userid.visible 				= false 
//	idw_def.object.userid_t.visible 				= false 
//	idw_def.object.securitylevel.visible 		= false 
//	idw_def.object.securitylevel_t.visible 	= false 
//	idw_def.object.dwdataobjectname.visible 	= false 
//	idw_def.object.dwdataobjectname_t.visible = false 
//
//Else
//
//	idw_def.Object.Datawindow.readonly="NO"
//	idw_def.object.timetorun.visible 			= true
//	idw_def.object.timetorunend.visible 		= true
//	idw_def.object.timetorun_t.visible 			= true
//	idw_def.object.timetorunend_t.visible 		= true
//	idw_def.object.daystokeep.visible 			= true
//	idw_def.object.daystokeep_t.visible 		= true
//	idw_def.object.daystokeep_t1.visible 		= true
//	idw_def.object.keeplast.visible 				= true  
//	idw_def.object.keeplast_t.visible 			= true 
//	idw_def.object.recurring_t.visible 			= true 
//	idw_def.object.recurring.visible 			= true 
//	idw_def.object.daytorunmon.visible 			= true 
//	idw_def.object.daytorunmon_t.visible 		= true 
//	idw_def.object.daytoruntue.visible 			= true 
//	idw_def.object.daytoruntue_t.visible 		= true 
//	idw_def.object.daytorunwed.visible 			= true 
//	idw_def.object.daytorunwed_t.visible 		= true 
//	idw_def.object.daytorunthu.visible 			= true 
//	idw_def.object.daytorunthu_t.visible 		= true 
//	idw_def.object.daytorunfri.visible 			= true 
//	idw_def.object.daytorunfri_t.visible 		= true 
//	idw_def.object.daytorunsat.visible 			= true 
//	idw_def.object.daytorunsat_t.visible 		= true 
//	idw_def.object.daytorunsun.visible 			= true 
//	idw_def.object.daytorunsun_t.visible 		= true 
//	idw_def.object.userid.visible 				= true 
//	idw_def.object.userid_t.visible 				= true 
//	idw_def.object.securitylevel.visible 		= true 
//	idw_def.object.securitylevel_t.visible 	= true 
//	idw_def.object.dwdataobjectname.visible 	= true 
//	idw_def.object.dwdataobjectname_t.visible = true 	
//	
//	 
//End If 
//

end event

type dw_1 from uo_tabpage_dw`dw_1 within uo_vzt_mm_tabpage_def
int X=0
int Y=16
int Width=2295
int Height=624
boolean BringToTop=true
string DataObject="d_vzt_mm_rpt_def_edit"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean HScrollBar=false
boolean VScrollBar=false
boolean HSplitScroll=false
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

event dw_1::constructor;call super::constructor;_ResetDataObjectOnSelect 	= false
end event

