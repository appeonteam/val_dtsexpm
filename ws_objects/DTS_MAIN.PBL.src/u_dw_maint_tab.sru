$PBExportHeader$u_dw_maint_tab.sru
forward
global type u_dw_maint_tab from datawindow
end type
end forward

shared variables
integer si_process
end variables

global type u_dw_maint_tab from datawindow
integer width = 2354
integer height = 912
integer taborder = 1
boolean vscrollbar = true
boolean livescroll = true
event ue_insert pbm_custom75
event ue_retrievenext pbm_custom74
event ue_closequery pbm_custom73
event ue_seed pbm_custom72
event ue_update pbm_custom71
event ue_find pbm_custom70
event ue_sort pbm_custom69
event ue_delete pbm_custom68
event ue_scroll pbm_vscroll
event ue_size pbm_custom67
event ue_resetupdate pbm_custom66
event ue_reset pbm_custom65
event ue_discard pbm_custom64
event ue_prepareupdate pbm_custom63
event mousemove pbm_mousemove
event ue_setfields pbm_custom01
end type
global u_dw_maint_tab u_dw_maint_tab

type variables
boolean ib_prompt
boolean ib_deleteall
boolean ib_sizex
boolean ib_sizey
boolean ib_retrievenext
boolean ib_firstinchain
boolean ib_allow_rfc
boolean ib_update_ok
integer ii_seedmode
integer ii_seedtype
integer ii_savemode
integer ii_currow
integer ii_curcol
integer ii_insertmode
integer ii_xdistance
integer ii_ydistance
integer ii_lastrow
string isa_primkeycols[]
string isa_primkeyvals[]
string isa_forkeycols[]
string is_curcolname
string isa_sortcols[]
string isa_sortdesc[]
string isa_findcols[]
string isa_finddesc[]
string isa_dwnextretrcols[]
string is_firstcol
string is_promptstring
string is_childprompt
string is_deleteprompt
string is_direction = "X"
string is_mode = "UPD"
u_dw_maint idw_next
u_dw_maint idw_seedfrom
string is_table_name
string is_col_name
string is_col_value
end variables

forward prototypes
public function string uf_coltype (string as_column)
public function boolean uf_allowclose ()
public function boolean uf_chk_dup ()
end prototypes

on ue_insert;// ue_insert Event
Integer i, li_howmany
Long li_newrow
String ls_return

IF ii_savemode = 2 THEN
	//
	//	We don't want any error checking during RFC in the 
	//	Multiple explicit save mode
	//
	ib_allow_rfc = TRUE
END IF

//
//  TML (5/16/94):
//  Don't see the need for the IF statement below.  The triggering of
//  ue_closequery will ensure that my previous row (whether I was
//  previously editing or inserting) can be saved before allowing me
//  to continue with a new insert.  
//
//	 EGMJr. 12-05-94
//  That's because you're a dummy.  Took me 3 hrs. to track this BUG...
//	 ... this event is triggered twice on an insert, once on current rec
//	 and once on the new record right after it's added, thus the AcceptText()
//  below causes problems on databases with the first field in the Tab Order
//  as a NO NULL.  Does "This item requires a value." in your face 1 million
//  times mean anything to you.
//
//IF is_mode <> "INS" OR ii_savemode = 2 THEN
	//
	//  Don't let them add multiple rows in the single row paradigm.
	//

	//
	//  See if we're allowed to do this
	//
	This.TriggerEvent( "ue_closequery" )

	IF si_process = -1 THEN
		//
		//  They decided not to do this
		//
		is_mode = "UPD"
	ELSE
		//
		//  Proceed with the insert
		//
		is_mode = "INS"

		// Insert the new row at the bottom and save the rows number
		li_newrow = This.InsertRow( 0 )

		// Scroll to the newly inserted row
		This.ScrollToRow( li_newrow )

		IF li_newrow = 1 THEN
			//
			//  Make sure that RowFocusChange fires.  Doesn't normally
			//  fire when inserting the first row.
			//
			This.TriggerEvent( "rowfocuschanged" )
		END IF
	
		// Clear the contents of the rest of the chain.
		IF Handle( idw_next ) <> 0 THEN
		  	idw_next.TriggerEvent( "ue_reset" )
		END IF

		//
		//  Trick the datawindow into thinking that this row has been 
		//  modified so that ModifiedCount() will work in the CloseQuery
		//  event if they move off immediately after inserting.
		//
//		Don't know why this is necessary here. we could allow close of
//		window if status is new!, TML 5/15/94
//		This.SetItemStatus(ii_currow, 0, PRIMARY!, NewModified!)

		IF ii_seedmode = 1 THEN
			//
			//  SeedMode of 1 means seed right after inserting
			//
			This.TriggerEvent( "ue_seed" )
		END IF

		// If there is a first column specified, set that column to be the
		// one with focus
		IF is_firstcol <> "" THEN
			This.SetColumn( is_firstcol )
		END IF

		// If there is a next dw specified, Post the ue_insert event for it
		IF Handle( idw_next ) <> 0 AND ( ii_insertmode = 1 ) THEN
			idw_next.PostEvent( "ue_insert" )
		END IF

	END IF

//END IF

end on

on ue_retrievenext;Integer li_numargs

// This script has a case for all permutations of up to three retrieval
// arguments (types "N", "S", "D" only)

li_numargs = UpperBound( isa_dwnextretrcols )

CHOOSE CASE li_numargs
CASE 0
	idw_next.Retrieve()
CASE 1
	CHOOSE CASE uf_coltype( isa_dwnextretrcols[1] )
	CASE "N"
		idw_next.Retrieve( This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ) )
	CASE "S"
		idw_next.Retrieve( This.GetItemString( ii_currow, isa_dwnextretrcols[1] ) )
	CASE "D"
		idw_next.Retrieve( This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ) )
	END CHOOSE
CASE 2
	CHOOSE CASE uf_coltype( isa_dwnextretrcols[1] )
	CASE "N"
		CHOOSE CASE uf_coltype( isa_dwnextretrcols[2] )
		CASE "N"
			idw_next.Retrieve( &
			 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ) )
		CASE "S"
			idw_next.Retrieve( &
			 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ) )
		CASE "D"
			idw_next.Retrieve( &
			 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ) )
		END CHOOSE
	CASE "S"
		CHOOSE CASE uf_coltype( isa_dwnextretrcols[2] )
		CASE "N"
			idw_next.Retrieve( &
			 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ) )
		CASE "S"
			idw_next.Retrieve( &
			 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ) )
		CASE "D"
			idw_next.Retrieve( &
			 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ) )
		END CHOOSE
	CASE "D"
		CHOOSE CASE uf_coltype( isa_dwnextretrcols[2] )
		CASE "N"
			idw_next.Retrieve( &
			 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ) )
		CASE "S"
			idw_next.Retrieve( &
			 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ) )
		CASE "D"
			idw_next.Retrieve( &
			 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
			 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ) )
		END CHOOSE
	END CHOOSE
CASE 3
	CHOOSE CASE uf_coltype( isa_dwnextretrcols[1] )
	CASE "N"
		CHOOSE CASE uf_coltype( isa_dwnextretrcols[2] )
		CASE "N"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		CASE "S"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		CASE "D"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		END CHOOSE
	CASE "S"
		CHOOSE CASE uf_coltype( isa_dwnextretrcols[2] )
		CASE "N"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		CASE "S"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		CASE "D"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemString( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		END CHOOSE
	CASE "D"
		CHOOSE CASE uf_coltype( isa_dwnextretrcols[2] )
		CASE "N"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		CASE "S"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		CASE "D"
			CHOOSE CASE uf_coltype( isa_dwnextretrcols[3] )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemNumber( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "S"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemString( ii_currow, isa_dwnextretrcols[3] ) )
			CASE "N"
				idw_next.Retrieve( &
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[1] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[2] ),&
				 This.GetItemDate( ii_currow, isa_dwnextretrcols[3] ) )
			END CHOOSE
		END CHOOSE
	END CHOOSE
END CHOOSE

end on

on ue_closequery;// ue_closequery Event
Integer li_response
String ls_message
Boolean lb_promptnext
Boolean lb_changes_detected, lb_from_closequery

lb_promptnext = ib_prompt

//
//  For debugging
//
Integer li_modcount
String  ls_name

//
// This event simulates the window closequery event.  It is used to
// determine if there have been any unsaved changes to the control.
//
// This event is triggered by the Window closequery event or by
// a rowfocuschange when Explicit save mode is selected.
//

//
// Using the si_process here as a way for information to be
// shared between the dw controls without a "controlling structure"
//
si_process = 0

//
// See if there are any modified rows in this control
//
li_modcount = This.ModifiedCount()
ls_name = This.dataobject

// Don't want to display error if focused field is required
// when the insertrow() triggers the rowfocuschanged() which triggers
// this on the new record. - EGM 12/09/94
If is_mode <> "INS" Then
	This.AcceptText()
End If

//
//  On a multiple row explicit change the close query event 
//  has to Trigger this event with a parameter of 1.  All other 
//  times, it is assumed to be 0.  
//
//	 	For example:
//      This.TriggerEvent( "ue_closequery", 1 )
//
lb_from_closequery = (message.wordparm = 1)

//
//  Always check the next one in the chain
//
IF Handle( idw_next ) = 0 THEN
	lb_changes_detected = FALSE
ELSE
	idw_next.AcceptText()
	lb_changes_detected = &
		(idw_next.ModifiedCount() + idw_next.DeletedCount() > 0 )
END IF

IF ii_savemode = 0 OR ii_savemode = 1 OR lb_from_closequery THEN
	//
	//  Implicit or Single row explicit
	//
	lb_changes_detected = lb_changes_detected OR &
								 (This.ModifiedCount() > 0)
END IF


IF lb_changes_detected THEN
	IF ii_savemode = 1 THEN
		//
		//  Implicit save -	just save the changes and allow the 
		//							window to close or row focus to change
		//
		si_process = 0
		This.TriggerEvent( "ue_prepareupdate" )
	ELSE
		//
		// Are we supposed to prompt?  (This should only be FALSE if 
		//    we are down in the chain)
		//
		IF ib_prompt THEN
			// See if the client code has a save message specified
			IF is_promptstring <> "" THEN
				ls_message = is_promptstring
			ELSE
				ls_message = "Data has been modified since last saved!  " + &
					"Do you want to save ["+This.Title+"] changes?"
			END IF

			li_response = MessageBox("Changes Not Saved", ls_message,&
			 					Question!, YesNoCancel!, 1 )
			//
			//  The message has come up once, don't ask again.
			//
			lb_promptnext = FALSE
		ELSE
			//
			// We are not supposed to prompt, just save if needed.
			// Treat it like they said yes.
			//
			li_response = 1
		END IF

		// Evaluate which option the user chose from the prompt
		CHOOSE CASE li_response
			CASE 1
				//
				// They said YES
				//

				si_process = 0
				TriggerEvent( "ue_prepareupdate" )

			CASE 2
				//
				// They said NO
				//
				si_process = 1
				TriggerEvent( "ue_discard" )

			CASE 3
				//
				// They said CANCEL
				//
				si_process = -1

		END CHOOSE
	END IF
END IF	

// allows check of si_process outside object
message.DoubleParm = si_process

//
//  If they successfully went through the above OR there 
//  were no mods.
//
//  CJ 3/30/94:  The UE_PREPAREUPDATE event handles all of the commits
//               and rollbacks.
//

IF si_process = 0 AND Handle( idw_next ) <> 0 THEN
	//
	// If there is a next dw specified and the attempted 
	// save was successful.
	//

	// If they have answered one prompt, don't ask them again
	idw_next.ib_prompt = lb_promptnext

	// Go ahead and follow the chain
	idw_next.TriggerEvent( "ue_closequery" )
END IF

end on

on ue_seed;Integer li_counter, li_howmany, li_success

li_howmany = UpperBound( isa_primkeycols )

//
// Determine if we need to use columns or values
//
IF ii_seedtype = 0 THEN
	// Loop through however many ther are to be done
	FOR li_counter = 1 TO li_howmany
		// We need to know what the type of the foreign key column
		// is so we can use the proper GetItemXXX function
		CHOOSE CASE uf_coltype( isa_forkeycols[li_counter] )
		CASE "N"
			This.SetItem( ii_currow, isa_primkeycols[li_counter],&
			 idw_seedfrom.GetItemNumber( idw_seedfrom.ii_currow,&
			 isa_forkeycols[li_counter] ) )
		CASE "S"
			This.SetItem( ii_currow, isa_primkeycols[li_counter],&
			 idw_seedfrom.GetItemString( idw_seedfrom.ii_currow,&
			 isa_forkeycols[li_counter] ) )
		CASE "D"
			This.SetItem( ii_currow, isa_primkeycols[li_counter],&
			 idw_seedfrom.GetItemDate( idw_seedfrom.ii_currow,&
			 isa_forkeycols[li_counter] ) )
		END CHOOSE
	NEXT
ELSE
	// We are useing values
	FOR li_counter = 1 TO li_howmany
		// We need to know the type of each key column to be seeded
		// to convert it from a string to the proper type
		CHOOSE CASE uf_coltype( isa_forkeycols[li_counter] )
		CASE "N"
			This.SetItem( ii_currow, ii_curcol,&
			 Integer( isa_primkeyvals[li_counter] ) )
		CASE "S"
			This.SetItem( ii_currow, ii_curcol,&
			 isa_primkeyvals[li_counter] )
		CASE "D"
			This.SetItem( ii_currow, ii_curcol,&
			 Date( isa_primkeyvals[li_counter] ) )
		END CHOOSE
	NEXT
END IF

end on

event ue_update;// Update this control - 
//  DO NOT reset the update flags so 
//  if there is a failure, the save can be reattempted.

//
//  If you override this event with client code, make sure
//	 to set ib_update_ok properly.
//
//

ib_update_ok = (This.Update(TRUE,FALSE) = 1)

/////////////////////
// IF adding
//    INSERT WHERE....
//
// IF deleting 
//	   DELETE WHERE...
//
// IF updating
//	   UPDATE WHERE..

end event

on ue_find;SetPointer( HourGlass! )

// open the find window and send this control as an argument

OpenWithParm( w_find2, This )

end on

on ue_sort;SetPointer( HourGlass! )

// Open the sorted window and send this control as an argument

This.TriggerEvent( "ue_closequery" )

IF si_process <> -1 THEN
	OpenWithParm( w_sort_by2, This )

END IF

end on

on ue_delete;Integer      i
Long         ll_rows
DwItemStatus lpb_status

is_mode = "DEL"
lpb_status = this.GetItemStatus(ii_currow, 0, Primary!) 

//
//  We don't want the rowfocus change to trigger an error message 
//  if we are deleting.  If they hit delete, they are deleting the
//  record regardless of whether or not changes have been saved.
//
ib_allow_rfc = TRUE

// see if there is a next dw in the chain
IF Handle( idw_next ) <> 0 THEN
	idw_next.ib_deleteall = TRUE
	idw_next.TriggerEvent( "ue_delete" )
END IF

// if this is a child delete, delete all rows
IF ib_deleteall THEN
	ib_deleteall = FALSE
	ll_rows = This.Rowcount()
	FOR i = 1 TO ll_rows
		This.DeleteRow(1)
	NEXT
ELSE
	This.DeleteRow(0)
END IF

IF ii_lastrow > 1 THEN
	This.ScrollToRow( ii_lastrow - 1 )
END IF

IF ii_savemode <> 2 AND lpb_status <> New! AND lpb_status <> NewModified! THEN
	//
	// NV 5/12/94: 
	// Check for itemstatus, don't want to fire ue_update if row
	// being deleted was New! or NewModified!. (PB should not be 
	// generating an update if this condition exists, but it is.)
	//
	// We don't want updating while they are in the datawindow
	// They have to hit an explicit save.
	//
	TriggerEvent( "ue_update" )

	//
	// Remember to COMMIT or ROLLBACK depending on whether delete 
	// was successful or not.
	//
	IF ib_update_ok THEN
		COMMIT;
		This.TriggerEvent( "ue_resetupdate" )
	ELSE
		ROLLBACK;
	END IF
END IF

//
//	Put the flag back to it's default condition
//
is_mode = "UPD"


end on

on ue_scroll;String ls_row

// This event keeps the currently scrolled to row focused
ls_row = This.Describe( "datawindow.FirstRowOnPage" )
This.ScrollToRow( Long( ls_row ) )


end on

on ue_size;Window lw_parent

lw_parent = Parent

IF ib_sizex THEN
	IF This.x < ( lw_parent.Height - ( This.x + ii_xdistance ) ) THEN
		This.Height = lw_parent.height - This.x - ii_xdistance
	END IF
END IF
IF ib_sizey THEN
	IF This.y < ( lw_parent.width -  ( This.y + ii_ydistance ) ) THEN
		This.Width = lw_parent.Width - This.y - ii_ydistance 
	END IF
END IF


end on

on ue_resetupdate;//
//  No longer in insert mode
//
is_mode = "UPD"

This.ResetUpdate()

IF Handle( idw_next ) <> 0 THEN
	idw_next.TriggerEvent( "ue_resetupdate" )
END IF
end on

on ue_reset;// clear out the contents of the control
This.Reset()

IF Handle( idw_next ) <> 0 THEN
	idw_next.TriggerEvent( "ue_reset" )
END IF
end on

on ue_discard;//
//  Use ii_lastrow rather that ii_currow, because we might not be on
//  the row that we are discarding changes for.
//
IF is_mode = "INS" THEN
	//
	//  They're inserting, just delete the row
	//
	is_mode = "UPD"
	ib_allow_rfc = TRUE
	This.DeleteRow( ii_lastrow )
ELSE
	//
	//  They're editing, refresh row
	//
	This.ReselectRow( ii_lastrow )
END IF


end on

event ue_prepareupdate;//
//  It is the responsibility of the UE_PREPAREUPDATE event to 
//			1)  Trigger the next datawindow UE_PREPAREUPDATE event if 
//	          there is a next datawindow.
//
//			2)  Trigger the UE_SEED event (if the ii_seedmode = 2).
//
//			3)  Trigger the UE_UPDATE event.
//
//			4)  Set si_process to 0 if the update happened, -1 if
//           it did not.  (The RowFocusChanged event needs it)
//
//			5)  Issue a ROLLBACK if the update was unsuccessful.  A COMMIT
//				 if it was.
//

// Using si_process here as a way for information to be
// shared between the dw controls without a "controlling structure"

si_process = 0

//
// See if there is another datawindow in the chain
// if there is and we have deletes to process, update in reverse so
// integrity is maintained, or if we have inserts/updates go forward
//
//IF Handle( idw_next ) <> 0 THEN
//	idw_next.ib_firstinchain = FALSE
//	idw_next.TriggerEvent( "ue_prepareupdate" )
//ELSE
//	ib_firstinchain = TRUE
//END IF
//


//
// Either no attempt has been made yet, or the last save 
// was a success
//
IF si_process = 0 THEN
	IF ii_seedmode = 2 THEN
		//
		//  SeedMode of 2 means seed right before updating
		//
		This.TriggerEvent( "ue_seed" )
	END IF
	
	//
	// Update this control - 
	//
	//   The UE_UPDATE event is responsible for setting the IB_UPDATE_OK
	//   flag.
	//
//	MessageBox("dw", this.DataObject)
//    MessageBox("is_mode",is_mode)
	if is_mode = 'INS' then
		if uf_chk_dup () then
			This.TriggerEvent( "ue_update" )
		else
			MessageBox("Error","Your entry is conflicting with an existing record. Please change your entry.")
			ib_update_ok = false
			return
		end if
	else
		This.TriggerEvent( "ue_update" )
	end if

	IF Handle( idw_next ) <> 0 THEN
		idw_next.ib_firstinchain = FALSE
		idw_next.TriggerEvent( "ue_prepareupdate" )
	ELSE
		ib_firstinchain = TRUE
	END IF


	//
	// If this save fails, set the message parm so the dw up the
	// chain does not try to update
	//
	IF NOT ib_update_ok THEN
		si_process = -1
		ROLLBACK;
	ELSE

		is_mode = "UPD"

		//
		// Check to see if we are the top-most control in the chain
		//
		IF ib_firstinchain THEN
			COMMIT;

			// all saves must be OK so reset all the update flags
			This.TriggerEvent( "ue_resetupdate" )
		END IF
	END IF
END IF

end event

public function string uf_coltype (string as_column);String ls_describe, ls_type, ls_return

ls_describe = as_column + ".coltype"

ls_type = This.Describe( ls_describe )

ls_type = Upper( Mid( ls_type, 1, 5 ) )

CHOOSE CASE ls_type
CASE "CHAR("
	ls_return = "S"
CASE "DATE "
	ls_return = "D"
CASE "DECIM", "NUMBE"
	ls_return = "N"
CASE ELSE
	MessageBox( "Developer Error - Invalid Column Type",&
		 "The column type specified is not allowed!" )
	ls_return = "X"
END CHOOSE

RETURN ls_return
end function

public function boolean uf_allowclose ();//
//  This function is used to "export" the value of si_pocess since it is
//  private to the user object.  This function should be called from the
//  closequery event of the window like this...
//
//  IF NOT dw_1.uf_allowclose() THEN
//    Message.ReturnValue = 1
//  END IF
//
boolean lb_allowclose

IF This.AcceptText() = -1 THEN
	lb_allowclose = FALSE
ELSE
	This.TriggerEvent( "ue_closequery", 1, 1)
	lb_allowclose = si_process <> -1
END IF
RETURN (lb_allowclose)
end function

public function boolean uf_chk_dup ();int rec_found
string my_sql

my_sql = "select count(*) from "+is_table_name+" where "+is_col_name+"='"+is_col_value+"'"

declare my_cursor DYNAMIC cursor for SQLSA;
PREPARE SQLSA from :my_sql;
OPEN DYNAMIC my_cursor;
FETCH my_cursor into :rec_found;
CLOSE my_cursor;

if rec_found > 0 then
	return false
else
	return true
end if
end function

event clicked;string cClickedRow
integer nRow2Go2

// so the pointer isn't going anywhere anyway
If This.GetClickedRow() <= 0 Then
	cClickedRow = This.GetBandAtPointer()
	If Pos( cClickedRow, "detail" ) = 1 Then
		nRow2Go2 = Integer( Mid( cClickedRow, Pos(cClickedRow,"~t")-Len("~t") ) )
		If nRow2Go2 > 0 Then
			This.SetRow( nRow2Go2 )
		End If
	End If
Else
	This.SetRow( This.GetClickedRow() )
End If
end event

on constructor;window lw_parent

lw_parent = parent

// This event sets up the default values for the datawindow.
// extend this script and override any values as necesary.

This.SetTransObject( sqlca )

ii_xdistance = lw_parent.Height - ( This.x + This.Height )
ii_ydistance = lw_parent.Width - ( This.x + This.Width )

ii_seedmode = 0
ii_seedtype = 0
ii_savemode = 0
ii_insertmode = 0
ib_prompt = TRUE
ib_deleteall = FALSE
ib_sizex = TRUE
ib_sizey = TRUE
ib_retrievenext = TRUE

is_childprompt = "You have unsaved changes.  Do you wish to save your changes?" 

This.Retrieve()
end on

on getfocus;//long nFirstOnPage = 0, nLastOnPage = 0
//int nCurrRow, nCurrCol
//
//nCurrRow = This.GetRow()
//nCurrCol = This.GetColumn()
//
//SetMicroHelp( w_main, "Refreshing data for selected table...please wait." )
//nFirstOnPage = Long( This.Describe( "datawindow.firstrowonpage" ) )
//nLastOnPage  = Long( This.Describe( "datawindow.lastrowonpage" ) )
//
//
//This.Retrieve()
//If nFirstOnPage > 1 And nLastOnPage > This.RowCount() Then
//	This.ScrollToRow( nLastOnPage )
//	This.ScrollToRow( nFirstOnPage )
//End If
//If nCurrRow > This.GetRow() Then
//	This.SetRow( nCurrRow )
//End If
//If nCurrCol > This.GetColumn() Then
//	This.SetColumn( nCurrCol )
//End If
//
//SetMicroHelp( w_main, dispatch_tracking_system.MicroHelpDefault )
end on

event dberror;egm_dberror( This )		// record error in text file
//This.SetActionCode( 1 )	// turn off default message
return 1 // turn off default message
end event

on doubleclicked;String ls_objectname, ls_syntax, ls_datatype

//	allow calendar to pop up if user doubleclicks 
// on a date column in a datawindow

// what column did the user click on?
ls_objectname = This.GetObjectAtPointer()
ls_objectname = Left( ls_objectname, Pos( ls_objectname, "~t" ) - 1 ) 

// is it a date column?
ls_syntax = ls_objectname + ".Coltype"
ls_datatype = This.Describe( ls_syntax ) 

IF ls_datatype = "date" or ls_datatype = "datetime" THEN
	// pop up calendar ...
	SetPointer( HourGlass! )
	OpenWithParm( w_calendar, This )
END IF

end on

on rowfocuschanged;// RowFocusChange Event

IF ib_allow_rfc = FALSE THEN
	ii_currow = This.GetRow()

	//
	//  Always call the closequery event to make sure its ok to 
	//  change rows.  It will automatically do an update on implicit
	//	 saves.
	//

	//
	// The ue_closequery event has all the cool stuff necessary for
	// prompting and cascading and so forth
	//
	This.TriggerEvent( "ue_closequery" )

	IF si_process = -1 THEN
		//
		//  They changed their mind.  Don't allow the row focus to 
		//  change.
		//	
		ib_allow_rfc = TRUE
		This.SetRow( ii_lastrow )
		This.ScrollToRow( ii_lastrow )
	END IF
ELSE
	ib_allow_rfc = FALSE
END IF

//
//  Reset this in case we did not let them move off of the record
//
ii_currow  = This.GetRow()

//
//  Always update this for the next RowFocusChange
//
ii_lastrow = This.GetRow()

//
//  See if there is a next dw specified in the chain
//
IF ( Handle( idw_next ) <> 0 ) AND &
	ib_retrievenext AND si_process <> -1 THEN
	//
	//  All the code to figure out what arguments are needed and their
	//  position is in the "ue_retrievenext" event.
	//
	This.PostEvent( "ue_retrievenext" )
END IF

end on

on itemfocuschanged;// Save the current column name and number to instance variables

ii_curcol = This.GetColumn()
is_curcolname = This.GetColumnName()
end on

on u_dw_maint_tab.create
end on

on u_dw_maint_tab.destroy
end on

