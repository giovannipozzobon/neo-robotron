; ***************************************************************************************
; ***************************************************************************************
;
;		Name : 		hulk.asm
;		Author :	Paul Robson (paul@robsons.org.uk)
;		Date : 		22nd April 2024
;		Reviewed :	No
;		Purpose :	Grunt Class
;
; ***************************************************************************************
; ***************************************************************************************

; ***************************************************************************************
;
;									Grunt Object 
;
; ***************************************************************************************

OHHulk:
		.method MSG_INIT,OHHUInitHandler
		.method MSG_CONTROL,OHHUControl
		.method MSG_SHOT,OHHUOnHit
		.superclass


OHHUInitHandler:
		.animation GR_HULK

OHHUControl:
		jsr 	ChasePlayer
		.speed 	64
		.brains 1
		rts


OHHUOnHit:
		lda 	OBDirection,y
		sta 	OBDirection,x
		.brains 7
		.speed 3
		rts


