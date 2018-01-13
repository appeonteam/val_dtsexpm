$PBExportHeader$u_bottom_bar.sru
forward
global type u_bottom_bar from userobject
end type
type uo_1 from u_bottom_tab within u_bottom_bar
end type
type uo_2 from u_bottom_tab within u_bottom_bar
end type
type uo_3 from u_bottom_tab within u_bottom_bar
end type
type uo_4 from u_bottom_tab within u_bottom_bar
end type
type uo_5 from u_bottom_tab within u_bottom_bar
end type
type uo_6 from u_bottom_tab within u_bottom_bar
end type
type uo_7 from u_bottom_tab within u_bottom_bar
end type
end forward

global type u_bottom_bar from userobject
integer width = 2747
integer height = 100
long backcolor = 8421504
event ue_bar_clicked pbm_custom01
event mousemove pbm_mousemove
uo_1 uo_1
uo_2 uo_2
uo_3 uo_3
uo_4 uo_4
uo_5 uo_5
uo_6 uo_6
uo_7 uo_7
end type
global u_bottom_bar u_bottom_bar

type variables
// integer ii_tab_index
integer ii_lastindex = 1
integer ii_index = 1
string cCurrPict = "curtab3.bmp"
string cUnCurrPict = "tab3.bmp"
end variables

forward prototypes
public function userobject uf_getobject (integer ai_index)
public subroutine uf_settabs (string asa_tabnames[7])
end prototypes

on ue_bar_clicked;// ue_bar_clicked in u_bottom_bar

// create reference variable for 
// the individual tabs
u_bottom_tab lu_curtab, lu_lasttab

// get the last tab and the current tab 
lu_curtab	= uf_getobject ( ii_index )
lu_lasttab 	= uf_getobject ( ii_lastindex )

// set the last tab to normal
lu_lasttab.st_text.weight = 400
lu_lasttab.p_1.picturename = cUnCurrPict

// set the current tab to bold - need to do 2nd in case same selected
lu_curtab.st_text.weight = 700
lu_curtab.p_1.picturename = cCurrPict


end on

event mousemove;// Does the user have the left mouse button down?
If Message.WordParm = 1 Then
	// If left button is down, then drag control across window
Else
	// left button is down, set MicroHelp()
	if IsValid(w_main) then 
		w_main.SetMicroHelp( dispatch_tracking_system.MicroHelpDefault )
	end if
End If

end event

public function userobject uf_getobject (integer ai_index);// This function is designed to accept an integer as an argument that will be used as an index into the tab bar. It will return a  reference to a user object of type u_bottom_tab.
// User Object Function uf_getobject 
// in u_bottom_bar

u_bottom_tab retval

CHOOSE CASE ai_index
	CASE 1
		retval = uo_1
	CASE 2
		retval = uo_2
	CASE 3
		retval = uo_3
	CASE 4
		retval = uo_4
	CASE 5
		retval = uo_5
	CASE 6
		retval = uo_6
	CASE 7
		retval = uo_7
END CHOOSE

RETURN retval


end function

public subroutine uf_settabs (string asa_tabnames[7]);// User Object Function uf_settabs
// in u_bottom_bar

// declare variables for counters
integer i, li_numberoftabs

// declare variable to be a reference
// to the user object individuual tabs
u_bottom_tab lu_tab

li_numberoftabs = UpperBound( asa_tabnames )

// loop through array
// set the static text display in the tabs
FOR i = 1 TO li_numberoftabs

	// get a reference into the local variable
	lu_tab = uf_getobject ( i )

	// update the static text object in the 
	// tab object
	lu_tab.st_text.text = asa_tabnames[i]
//	lu_tab.dw2Show = dwa_dwnames[i]
	// for pointer over tab control - SetMicroHelp( this.tag )
	lu_tab.Tag = "[Click] to add/edit/delete or print " + asa_tabnames[i] + " information."

NEXT


end subroutine

event constructor;// The first tab is automatically made current.
// set the index instance variable to 
// the first tab
ii_index = 1

If Pos( cCurrPict, "\" ) = 0 Then
	cCurrPict = cAppPath + cCurrPict
End If
If Pos( cUnCurrPict, "\" ) = 0 Then
	cUnCurrPict = cAppPath + cUnCurrPict
End If

// update the instance variable in all 
// the u_bottom_tab objects. This variable
// will be used as a tag to figure out 
// which tab has been clicked in the 
// ue_bar_clicked event
uo_1.ii_tab_index = 1
uo_2.ii_tab_index = 2
uo_3.ii_tab_index = 3
uo_4.ii_tab_index = 4
uo_5.ii_tab_index = 5
uo_6.ii_tab_index = 6
uo_7.ii_tab_index = 7

uo_1.st_text.weight = 700
uo_1.p_1.picturename = cCurrPict



end event

on u_bottom_bar.create
this.uo_1=create uo_1
this.uo_2=create uo_2
this.uo_3=create uo_3
this.uo_4=create uo_4
this.uo_5=create uo_5
this.uo_6=create uo_6
this.uo_7=create uo_7
this.Control[]={this.uo_1,&
this.uo_2,&
this.uo_3,&
this.uo_4,&
this.uo_5,&
this.uo_6,&
this.uo_7}
end on

on u_bottom_bar.destroy
destroy(this.uo_1)
destroy(this.uo_2)
destroy(this.uo_3)
destroy(this.uo_4)
destroy(this.uo_5)
destroy(this.uo_6)
destroy(this.uo_7)
end on

type uo_1 from u_bottom_tab within u_bottom_bar
integer x = 18
integer width = 389
integer height = 124
integer taborder = 10
end type

on uo_1.destroy
call u_bottom_tab::destroy
end on

type uo_2 from u_bottom_tab within u_bottom_bar
integer x = 407
integer width = 389
integer height = 124
integer taborder = 20
end type

on uo_2.destroy
call u_bottom_tab::destroy
end on

type uo_3 from u_bottom_tab within u_bottom_bar
integer x = 795
integer width = 389
integer height = 124
integer taborder = 30
end type

on uo_3.destroy
call u_bottom_tab::destroy
end on

type uo_4 from u_bottom_tab within u_bottom_bar
integer x = 1184
integer width = 389
integer height = 124
integer taborder = 40
end type

on uo_4.destroy
call u_bottom_tab::destroy
end on

type uo_5 from u_bottom_tab within u_bottom_bar
integer x = 1573
integer width = 389
integer height = 124
integer taborder = 50
end type

on uo_5.destroy
call u_bottom_tab::destroy
end on

type uo_6 from u_bottom_tab within u_bottom_bar
integer x = 1957
integer width = 389
integer height = 124
integer taborder = 60
end type

on uo_6.destroy
call u_bottom_tab::destroy
end on

type uo_7 from u_bottom_tab within u_bottom_bar
integer x = 2341
integer width = 389
integer height = 124
integer taborder = 70
boolean bringtotop = true
end type

on uo_7.destroy
call u_bottom_tab::destroy
end on

