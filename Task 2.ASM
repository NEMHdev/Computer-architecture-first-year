; ----- EXAMPLE 1 ------- ARITHMETIC --------------------------

; ===== WORK OUT 4 MUL BY 2 ======================================
	CLO		; Close unwanted windows.
	MOV AL,4	; Copy a 4 into the AL register.
	MOV BL,2	; Copy a 2 into the BL register.
	MUL AL,BL	; MUL BL FROM AL. Answer goes into AL.
	END		; Program ends
; ===== Program Ends ===========================================