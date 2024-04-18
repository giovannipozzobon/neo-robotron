; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		move.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		14th April 2024
;		Reviewed :	No
;		Purpose :	Move all objects
;
; ***************************************************************************************
; ***************************************************************************************


; ***************************************************************************************
;
;									Move all object
;
; ***************************************************************************************

MoveObjects:
		ldx 	#0  						; look for an unused object
_MOLoop: 		
		bit 	OBFlags,x
		bmi 	_MONoObject	
		jsr 	_MoveOneObject
_MONoObject:		
		inx
		cpx 	#OBJ_COUNT
		bne 	_MOLoop 
		rts  								; cannot create, exit.

_MoveOneObject:
		dec 	OBSpeedCounter,x 			; speed counter down to zero.
		bne 	_MONotMove
		lda 	OBSpeed,x 					; reset speed counter
		sta 	OBSpeedCounter,x
		
		lda 	OBDirection,x 				; current direction.
		ldy 	OBXPos,x 					; new X position => Y
		lsr 	a
		bcc 	_MONotLeft
		dey
_MONotLeft:
		lsr 	a		
		bcc 	_MONotRight
		iny
_MONotRight:
		phy 								; new Y position on stack

		ldy 	OBYPos,x 					; new Y position => Y
		lsr 	a
		bcc 	_MONotUp
		dey
_MONotUp:
		lsr 	a		
		bcc 	_MONotDown
		iny
_MONotDown:
		pla 								; (A,Y) are new coordinates.

		cmp 	#4  						; check out of bounds.
		bcc 	_MOHitWall
		cmp 	#156
		bcs 	_MOHitWall
		cpy 	#4
		bcc 	_MOHitWall
		cpy 	#108
		bcs 	_MOHitWall

		sta 	OBXPos,x 					; update position.
		tya
		sta 	OBYPos,x

		jsr 	RedrawObject

		lda 	OBFlags,x 					; toggle animation flag
		eor 	#$40
		sta 	OBFlags,x

_MONotMove:
		rts

_MOHitWall:
		rts		