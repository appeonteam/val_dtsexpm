$PBExportHeader$u_dw_maint.sru
$PBExportComments$Base maint control.
forward
global type u_dw_maint from datawindow
end type
end forward

shared variables
integer si_process
end variables

global type u_dw_maint from datawindow
integer width = 402
integer height = 320
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
end type
global u_dw_maint u_dw_maint

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
long ii_currow
integer ii_curcol
integer ii_insertmode
integer ii_xdistance
integer ii_ydistance
long ii_lastrow
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
boolean deleteAll 

window iw_parent
end variables

forward prototypes
public function string uf_coltype (string as_column)
public function boolean uf_allowclose ()
public subroutine uf_set_delete_all (boolean del)
public function integer uf_log_delete (datawindow dw_nm, double dw_row)
end prototypes

event ue_insert;// ue_insert Event
long i, li_howmany
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
//		This.dwSetItemStatus(ii_currow, 0, PRIMARY!, NewModified!)

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

end event

event ue_retrievenext;Integer li_numargs

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

end event

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
//      dw_1.TriggerEvent( "ue_closequery", 1 )
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
				ls_message = "Data has been modified since last saved!  Do you want to save changes?"
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

on ue_seed;//Integer li_counter, li_howmany, li_success
long  li_counter, li_howmany, li_success

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
//		Bug-fix --> if using values then isa_forkeycols is empty 
//		(else shows data type of source data anyway...
//		...use isa_primkeycols to determine data type for destination field
//		02/13/95 - EGM
//		CHOOSE CASE uf_coltype( isa_forkeycols[li_counter] )
		CHOOSE CASE uf_coltype( isa_primkeycols[li_counter] )
		CASE "N"
//			This.SetItem( ii_currow, ii_curcol,&
			This.SetItem( ii_currow, isa_primkeycols[li_counter],&
			 Integer( isa_primkeyvals[li_counter] ) )
		CASE "S"
//			This.SetItem( ii_currow, ii_curcol,&
			This.SetItem( ii_currow, isa_primkeycols[li_counter],&
			 isa_primkeyvals[li_counter] )
		CASE "D"
//			This.SetItem( ii_currow, ii_curcol,&
			This.SetItem( ii_currow, isa_primkeycols[li_counter],&
			 Date( isa_primkeyvals[li_counter] ) )
		END CHOOSE
	NEXT
END IF

end on

on ue_update;// Update this control - 
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

end on

on ue_find;SetPointer( HourGlass! )

// open the find window and send this control as an argument

OpenWithParm( w_find, This )

end on

on ue_sort;SetPointer( HourGlass! )

// Open the sorted window and send this control as an argument

This.TriggerEvent( "ue_closequery" )

IF si_process <> -1 THEN
	OpenWithParm( w_sort_by, This )

END IF

end on

event ue_delete;long      i
Long         ll_rows
DwItemStatus lpb_status
int deletedCount
string currDwName

is_mode = "DEL"
lpb_status = this.GetItemStatus(ii_currow, 0, Primary!) 

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
//		uf_log_delete(this,1)
		f_log_delete(this,1)
		deletedCount=This.DeleteRow(1)
//		MessageBox("user name (all)",cPassUserName)
	NEXT
ELSE
	currDwName = this.dataobject
//	uf_log_delete(this,this.GetRow())
	f_log_delete(this,this.GetRow())
	deletedCount=	This.DeleteRow(0)
//	MessageBox("user name (1)",cPassUserName)
END IF
//if deletedCount > 1 then
//	MessageBox("row deleted","deleted "+string(deletedCount)+" from "+this.dataobject)
//end if
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


end event

event ue_scroll;String ls_row

// This event keeps the currently scrolled to row focused
ls_row = This.Describe( "datawindow.FirstRowOnPage" )
This.ScrollToRow( Long( ls_row ) )


end event

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

event ue_resetupdate;//
//  No longer in insert mode
//
is_mode = "UPD"

This.ResetUpdate()

IF Handle( idw_next ) <> 0 THEN
	idw_next.TriggerEvent( "ue_resetupdate" )
END IF
end event

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

on ue_prepareupdate;//
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
	This.TriggerEvent( "ue_update" )

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

// sfm 2/96 changed position of endif .. we want to reset all update
//   flags along the chain not just the lastone ie firstinchain

		IF ib_firstinchain THEN
			COMMIT;
      End IF
	   This.TriggerEvent( "ue_resetupdate" )
//		END IF
	END IF
END IF

end on

public function string uf_coltype (string as_column);String ls_describe, ls_type, ls_return

ls_describe = as_column + ".coltype"

ls_type = This.Describe( ls_describe )

ls_type = Upper( Mid( ls_type, 1, 5 ) )

CHOOSE CASE ls_type
CASE "CHAR("
	ls_return = "S"
CASE "DATE "
	ls_return = "D"
CASE "DECIM", "NUMBE" ,"LONG"
	ls_return = "N"
CASE ELSE
	MessageBox( "Developer Error - Invalid Column Type",&
		 "The column type:" +ls_type+" specified is not allowed!" )
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

public subroutine uf_set_delete_all (boolean del);deleteAll = del

end subroutine

public function integer uf_log_delete (datawindow dw_nm, double dw_row);string	table_key_str, table_key_str2
double table_key_num
if dw_nm.dataobject = 'd_problem2' then
	table_key_str=dw_nm.GetItemString(dw_row,'problem_number')
	insert 	into problem_log 
	select 	problem_desc ,
				problem_number,
				timer1_start_min,
				timer2_start_min,
				timer1_reps,
				timer2_reps,
				auth_take_off_timer,
				default_status,
				pre_openable,
				timer_level,
				mx_map,
				mm_map,
				desc_tran,
				timer3_start_min,
				timer3_reps,
				action = 'D',
				action_ts = getdate(),
				action_user = :cPassUserName
	from		problem where problem_number=:table_key_str;
	if sqlca.sqlcode <> 0 then MessageBox("DB Error",sqlca.sqlerrtext)
	MessageBox("delete",'key='+table_key_str+' user='+cPassUserName)
	return 0
end if

if dw_nm.dataobject = 'd_subproblem2' then
	table_key_str2=dw_nm.GetItemString(dw_row,'subproblem_number')
	table_key_str=dw_nm.GetItemString(dw_row,'problem_number')
	insert		into subproblem_log
	select 	subproblem_desc,       
				subproblem_number,     
				problem_number,        
				timer1_start_min,      
				timer2_start_min,      
				timer1_reps,     	    
				timer2_reps,     	    
				auth_take_off_timer,   
				default_status     ,   
				pre_openable       ,   
				timer_level        ,   
				auto_assign_ind    ,   
				dept_assign        ,   
				init_paging_min    ,   
				retcode     	,	      
				mx_map      	,	      
				mm_map      	,	      
				lnk_task_no        ,   
				lnk_subtask_no     ,   
				use_depart_dt      ,   
				post_amt    	,	      
				post_code          ,   
				resp_task_no       ,   
				resp_subtask_no    ,   
				recurring_template_id ,
				tasking_offset      ,  
				desc_tran     	    ,  
				depart_offset       ,  
				timer3_start_min    ,  
				timer3_reps         ,  
				ext_pref_code       ,  
				skip_history        ,  
				ext_pref_onetime ,   
				action = 'D'     		,      
				action_ts  = getdate() 		,      
				action_user = :cPassUserName	  
	from 		subproblem	
	where	problem_number=:table_key_str and subproblem_number=:table_key_str2;
	if sqlca.sqlcode <> 0 then MessageBox("DB Error",sqlca.sqlerrtext)
	MessageBox("delete",'key='+table_key_str+' '+table_key_str2+' user='+cPassUserName)
	return 0
end if
return 1
end function

event doubleclicked;String ls_objectname, ls_syntax, ls_datatype

//	allow calendar to pop up if user doubleclicks 
// on a date column in a datawindow

// what column did the user click on?
ls_objectname = This.GetObjectAtPointer()
ls_objectname = Left( ls_objectname, Pos( ls_objectname, "~t" ) - 1 ) 

// is it a date column?
ls_syntax = ls_objectname + ".Coltype"
ls_datatype = This.Describe( ls_syntax ) 

IF ls_datatype = "date" or ls_datatype = "datetime" THEN
//	// pop up calendar ...
//	SetPointer( HourGlass! )
//	OpenWithParm( w_calendar, This )
END IF

end event

event clicked;string cClickedRow
long nRow2Go2
int rowF

// so the pointer isn't going anywhere anyway
//If This.GetClickedRow() <= 0 Then
If row <= 0 Then
	cClickedRow = This.GetBandAtPointer()
	If Pos( cClickedRow, "detail" ) = 1 Then
		nRow2Go2 = Integer( Mid( cClickedRow, Pos(cClickedRow,"~t")-Len("~t") ) )
		If nRow2Go2 > 0 Then
			This.SetRow( nRow2Go2 )
		End If
	End If
Else
//	This.SetRow( This.GetClickedRow()) 
	This.SetRow( row ) 
End If
end event

event dberror;egm_dberror( This )		// record error in text file
//This.SetActionCode( 1 )	// turn off default message
return 1

end event

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

event constructor;

iw_parent = parent
// This event sets up the default values for the datawindow.
// extend this script and override any values as necesary.

This.SetTransObject( sqlca )

ii_xdistance = iw_parent.Height - ( This.x + This.Height )
ii_ydistance = iw_parent.Width - ( This.x + This.Width )

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
end event

on itemfocuschanged;// Save the current column name and number to instance variables

ii_curcol = This.GetColumn()
is_curcolname = This.GetColumnName()
end on

on u_dw_maint.create
end on

on u_dw_maint.destroy
end on

