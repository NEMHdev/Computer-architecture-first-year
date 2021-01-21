; ----- EXAMPLE 5 ------- CHARACTER INPUT OUTPUT --------------------------

; --------------------------------------------------------------
;  Input key presses from the keyboard until Enter is pressed.
; --------------------------------------------------------------
	CLO		; Close unwanted windows.
	MOV	BL,A0	; Copy value in BL to A0
Rep:
	IN	00	; Wait for key press - Store it in AL.
	MOV	[BL],AL ; 
	INC	BL	; 
	CMP	AL,0D	; Was it the Enter key? (ASCII 0D)
	JNZ	Rep	; No - jump back.  Yes - end.
	MOV	BL,A0	; Move the contents of A0 to BL
	MOV	CL,C0	; Move the contents of C0 to CL

Rep2:
	MOV	AL,[BL]	;	
	MOV	[CL],AL	;
	INC	BL	;
	INC	CL	;
	CMP	AL,0D	;
	JNZ	Rep2	;


END

; --------------------------------------------------------------