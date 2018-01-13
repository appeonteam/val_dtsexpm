$PBExportHeader$uo_tabpage_base01.sru
forward
global type uo_tabpage_base01 from UserObject
end type
end forward

global type uo_tabpage_base01 from UserObject
int Width=2533
int Height=1516
long BackColor=79349703
long PictureMaskColor=553648127
long TabTextColor=33554432
long TabBackColor=79349703
string Text="page"
event ue_resize ( integer newwidth,  integer newheight )
event type uo_vzt_dwbase ue_get_main_dw ( )
event ue_setparenttab ( ref tab a_tab )
event ue_print ( )
event ue_new ( )
event ue_delete ( )
event ue_secure_display ( string as_rights )
end type
global uo_tabpage_base01 uo_tabpage_base01

type variables
integer delta_x= 10, delta_y = 10
uo_tab_base         parenttab

end variables

forward prototypes
public function integer uf_set_tab_parms (string as_tabtext, string as_helptext, long al_bcolor)
public function integer uf_set_tab_parms (string as_tabtext, string as_helptext, long al_bcolor, ref tab atab_parent)
end prototypes

event ue_resize;//
end event

event ue_get_main_dw;uo_vzt_dwbase dw_main

SetNull (dw_main) // return null in base
Return dw_main
end event

event ue_setparenttab;parenttab = a_tab
end event

public function integer uf_set_tab_parms (string as_tabtext, string as_helptext, long al_bcolor);this.text = as_tabtext
if al_bcolor <> 0 then 
	this.tabbackcolor = al_bcolor
End If

return 1

end function

public function integer uf_set_tab_parms (string as_tabtext, string as_helptext, long al_bcolor, ref tab atab_parent);this.parenttab = atab_parent
return this.uf_set_tab_parms (as_tabtext, as_helptext, al_bcolor)

end function

on uo_tabpage_base01.create
end on

on uo_tabpage_base01.destroy
end on

event dragdrop;// resize all objects inside 
end event

