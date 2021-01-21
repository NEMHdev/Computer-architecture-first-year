; ----- EXAMPLE 5 ------- CHARACTER INPUT OUTPUT --------------------------

; --------------------------------------------------------------
;  Input key presses from the keyboard until Enter is pressed.
; --------------------------------------------------------------
	CLO		; Close unwanted windows.
	MOV	BL,C0	; Copy value in BL to C0
Rep:
	IN	00	; Wait for key press - Store it in AL.
	MOV	[BL],AL ; Copies the contents opf AL to BL
	INC	BL	; Incrementing BL to point to next screen position
	CMP	AL,0D	; Was it the Enter key? (ASCII 0D)
	JNZ	Rep	; No - jump back.  Yes - end.
	
END

; --------------------------------------------------------------