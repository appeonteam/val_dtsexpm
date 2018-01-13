$PBExportHeader$u_multi_select_pm.sru
forward
global type u_multi_select_pm from userobject
end type
type uo_ddlb_1 from dropdownlistbox within u_multi_select_pm
end type
type uo_lb_1 from listbox within u_multi_select_pm
end type
end forward

global type u_multi_select_pm from userobject
integer width = 1184
integer height = 96
long backcolor = 12632256
string pointer = "HAND.CUR"
long tabtextcolor = 33554432
event size_open pbm_custom01
event size_closed pbm_custom02
event ue_clear pbm_custom03
event mousemove pbm_mousemove
uo_ddlb_1 uo_ddlb_1
uo_lb_1 uo_lb_1
end type
global u_multi_select_pm u_multi_select_pm

type variables
string cCriteria
string cColumn2Retrieve
string cColumn2AdHoc
string cTable2Use
Integer nOpenHgt
Integer nOpenWid
Integer nClosHgt
Integer nClosWid
string  load_lb
string  lb_code[]
string  lb_desc[]
integer max_lb_code
string is_selected , is_codestring
Boolean ib_loaded
string cDbWhere 

end variables

forward prototypes
public function string uf_return_ddlb_text ()
public function string uf_return_codestring ()
public subroutine uf_clear_selected ()
public subroutine uf_select_items ()
public subroutine uf_mod_dd_list ()
public subroutine uf_mod_ddlist ()
public subroutine uf_pop_is_selected (string in_is_selected)
public subroutine uf_show_uo_lb_1 (boolean sw)
end prototypes

on size_open;This.BringToTop = True
This.Resize( nOpenWid, nOpenHgt )

end on

on size_closed;This.Resize( nClosWid, nClosHgt )
This.BringToTop = False

end on

event mousemove;f_MicroHelp( This.Tag ) //vz 2005–05–15
end event

public function string uf_return_ddlb_text ();return(uo_ddlb_1.text)
end function

public function string uf_return_codestring ();// returns coma delimited code string consisting of lb_code array
//  values that corraspond to selected listbox items
//  This string is built in the listbox's losefocus event
// 
return(is_codestring)

end function

public subroutine uf_clear_selected ();Int li_cnt

For li_cnt = 1 to uo_lb_1.totalitems()
    If uo_lb_1.state(li_cnt) = 1  THEN
       uo_lb_1.setstate(li_cnt,FALSE)
    END IF
NEXT
end subroutine

public subroutine uf_select_items ();///////////////////////////////////////////////////////////////
// Purpose : selects items in ddlb according to is_selected string
//
// Note.. is_selected string is a coma delimited list of selected
//       items. This string is saved when user chooses to save the
//       report parms.
//
// Called from ue_load event of w_adhoc
//        
////////////////////////////////////////////////////////////////
Integer li_pos , li_index
String  ls_items , ls_item

// if lb_1 is empty then we must populate
IF uo_lb_1.totalitems() < 1 THEN
	uo_ddlb_1.triggerevent(selectionchanged!)
END IF

ls_items = trim(is_selected)

// parse items from string and selected the matching ddlb items
DO WHILE len(ls_items) > 0
   li_pos = pos(ls_items,',')
	IF li_pos = 0 THEN
		IF len(trim(ls_items)) > 0 THEN
			ls_item = trim(ls_items)
			ls_items = ""
		END IF
	ELSE
		ls_item  = trim(mid(ls_items,1,li_pos - 1))
		ls_items = trim(mid(ls_items,li_pos+1,len(ls_items)))
	END IF
	li_index = uo_lb_1.finditem(ls_item,0)
	IF li_index > 0 THEn
		uo_lb_1.SetState( li_index, True )
   END IF
LOOP
//uo_lb_1.Visible = FALSE

end subroutine

public subroutine uf_mod_dd_list ();
end subroutine

public subroutine uf_mod_ddlist ();//uo_ddlb_1.deleteitem(2)
//uo_ddlb_1.additem("Ming") 


end subroutine

public subroutine uf_pop_is_selected (string in_is_selected);is_selected = in_is_selected
end subroutine

public subroutine uf_show_uo_lb_1 (boolean sw);uo_lb_1.Visible=sw
end subroutine

on constructor; /*
	This sets the var's used by the events size_open() and size_closed()
	in sizing the control when the drop-down list-box is not being shown so the
	user-control space doesn't block the controls or leave an ugly
	box (there should be an easier way to do this).
*/

nOpenHgt = uo_ddlb_1.Height + uo_ddlb_1.Y
nOpenWid = uo_ddlb_1.Width + (uo_ddlb_1.X * 2)
//nClosHgt = uo_ddlb_1.Height + uo_ddlb_1.Y
nClosHgt = 100 + ( uo_ddlb_1.Y * 2 )
nClosWid = uo_ddlb_1.Width + (uo_ddlb_1.X * 2)
TriggerEvent("size_closed")
end on

on u_multi_select_pm.create
this.uo_ddlb_1=create uo_ddlb_1
this.uo_lb_1=create uo_lb_1
this.Control[]={this.uo_ddlb_1,&
this.uo_lb_1}
end on

on u_multi_select_pm.destroy
destroy(this.uo_ddlb_1)
destroy(this.uo_lb_1)
end on

type uo_ddlb_1 from dropdownlistbox within u_multi_select_pm
event mousemove pbm_mousemove
integer x = 5
integer y = 4
integer width = 1170
integer height = 228
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
string pointer = "HAND.CUR"
long textcolor = 33554432
long backcolor = 33554431
string text = "[All]"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"[All]","[Selected]"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;integer ret = 0
integer niCtr = 0
integer ndCtr = 0
string cHold1, cHold2

If Trim(Upper(this.text)) = "[SELECTED]" Then
	uo_lb_1.Visible = False
	uo_lb_1.x = uo_ddlb_1.x
	uo_lb_1.Width = uo_ddlb_1.Width + 00 //was + 30
	uo_lb_1.y = uo_ddlb_1.y + 88	// 88 for height of drop-down list-box single-line
   IF not ib_loaded THEN	
	  is_selected=''
      ib_loaded = TRUE
      if load_lb = ""  then
 		   ret = pop_lb_from_db ( cColumn2Retrieve, cTable2Use, uo_lb_1 )
	   elseif load_lb = "status" then
           ret = pop_lb_arrays_from_db("stat_code","stat_desc","callstat",&
										   uo_lb_1, lb_code[], lb_desc[], &
											max_lb_code)
    	elseif load_lb = "room" then
			  ret = pop_lb_arrays_from_db("area_number","area_name","area",&
										  uo_lb_1, lb_code[], lb_desc[],&
                                max_lb_code)
		elseif load_lb = "guest" then
			ret = pop_lb_from_db_union( cColumn2Retrieve,  uo_lb_1)
		elseif load_lb = "subtask" then
			ret = pop_lb_from_db_where (cColumn2Retrieve,cTable2Use, cDbWhere ,uo_lb_1)
	//		ret = pop_lb_from_db ( cColumn2Retrieve, cTable2Use, uo_lb_1 )
	   end if		
	   if ret <> 0 then
		   MessageBox( "Error!", sqlca.sqlerrtext )
	   end if	// now let's reselect those available in the criteria string
    END IF
	 

//	uo_lb_1.Height = Min( ( uo_lb_1.TotalItems() * 64 ), 640 )
	uo_lb_1.Height = Min( ( uo_lb_1.TotalItems() * 58 ), 580 )
	uo_lb_1.Visible = True
	uo_lb_1.SetFocus()
Else
	cCriteria = ""
   is_codestring = ""
	// 6/25/97 sfm clear selected items 
   uf_clear_selected()
		 
// SFM 1/21/96 removed
	// empty current window
//	Do While uo_lb_1.DeleteItem(1) > 0
//	Loop
End If
end event

event losefocus;if keydown (keytab!) then
	Parent.TriggerEvent("size_closed")
end if


end event

type uo_lb_1 from listbox within u_multi_select_pm
event mousemove pbm_mousemove
string tag = "Left click (de-)selects single.  Right click toggles Include or Exclude. [Tab] or [Enter] accepts chosen items."
boolean visible = false
integer x = 9
integer y = 4
integer width = 1083
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HAND.CUR"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
Else
	// left button is down, set MicroHelp()
	f_MicroHelp( This.Tag ) //vz 2005–05–15
End If

end event

event losefocus;integer niCtr= 0
integer nfCtr= 0
long nSelected = 0
boolean found_code 

is_codestring = ""  // sfm holds comma delimited code values
cCriteria = ""
This.Visible = False
IF Upper( Trim( uo_ddlb_1.Text ) ) = "[SELECTED]" Then
	if load_lb = "" or load_lb = 'guest' or load_lb = 'subtask' then
		For niCtr = 1 to This.TotalItems()
			IF Len(cCriteria) = 0 Then
				cCriteria = " and ("
			End If
			IF This.State(niCtr) = 1 Then
            If nselected = 0 THEN
               is_selected = this.text(niCtr)
            ELSE
               is_selected = is_selected + ', '+ this.text(niCtr)
            END IF
         	cCriteria = cCriteria + " " + cColumn2AdHoc + " = '" + &
				This.Text(niCtr) + "' or "
	          nSelected++
				// we won't reset this if we have only one selected
				uo_ddlb_1.Text = This.Text(niCtr)
			End If
		Next	// niCtr
	else
		For niCtr = 1 to This.TotalItems()
			IF Len(cCriteria) = 0 Then
				cCriteria = " and ("
			End If
			IF This.State(niCtr) = 1 Then
				For nfCtr = 1 to max_lb_code
					 if lb_desc[nfCtr] = This.Text(niCtr) then 
						 exit
					 end if
				Next
				cCriteria = cCriteria + " " + cColumn2AdHoc + " = '" + &
					lb_code[nfCtr] + "' or "
            If nselected = 0 THEN
               is_selected = this.text(niCtr)
               is_codestring = lb_code[nfCtr] // SFM build code string
            ELSE
               is_selected   = is_selected   + ', '+ this.text(niCtr)
               is_codestring = is_codestring + ',' + lb_code[nfCtr] // SFM build code string
           END IF
           nSelected++
			// we won't reset this if we have only one selected
				uo_ddlb_1.Text = This.Text(niCtr)
			End If
		Next	// niCtr
	end if
	// either all or none (pseudo-all) selected (if all then none...right)
	If nSelected = This.TotalItems() or nSelected = 0 Then
		cCriteria = ""
      is_codestring = ""
		uo_ddlb_1.Text = "[All]"	
		is_selected = '' // clear selected value
	// if only one selected then we are already displaying the value above
	ElseIf nSelected = 1 Then
		cCriteria = Left(cCriteria, Len(cCriteria)-4) + ")"
		uo_ddlb_1.Text = "[Selected]"	
		
	Else
		cCriteria = Left(cCriteria, Len(cCriteria)-4) + ")"
		uo_ddlb_1.Text = "[Selected]"	
	End If

End If

// SFM 1/21/97 removed
// empty current window
//Do While This.DeleteItem(1) > 0
//Loop

Parent.TriggerEvent("size_closed")
if IsValid(w_main) then 
	SetMicroHelp( w_main, dispatch_tracking_system.MicroHelpDefault )
end if








end event

event other;If KeyDown( keyEnter! ) Then
//	MessageBox( "Key Trapped", "[Enter] key trapped" )
	Send(Handle(This),256,9,Long(0,0))		// force <Tab> key
End If
end event

event getfocus;nOpenHgt = uo_lb_1.Height + uo_lb_1.y - 2
nOpenWid = uo_ddlb_1.Width + ( uo_ddlb_1.X * 2 )

if IsValid(w_main) then
	SetMicroHelp( w_main, "Right-click toggles --> Include or Exclude." )
end if

// if the losefocus was triggered by an off-window event then we'll wind up back here
// (due to last tab order) with an invisible list-box, empty as well so might as well
//  go back to All/Selected DDLBox.
If This.Visible = True Then
	Parent.TriggerEvent("size_open")
Else
	uo_ddlb_1.SetFocus()
End If

end event

on rbuttondown;long nSelected
boolean lSetState
int niCtr

For niCtr = 1 to This.TotalItems()
	IF This.State( niCtr ) = 1 Then
		lSetState = False
	Else
		lSetState = True
	End If
	This.SetState( niCtr, lSetState )
Next	// niCtr

end on

