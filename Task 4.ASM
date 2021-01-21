; ----- EXAMPLE 1 ------- ARITHMETIC --------------------------

; ===== WORK OUT 4 DIV BY 0 ======================================
	CLO		; Close unwanted windows.
	MOV AL,4	; Copy a 4 into the AL register.
	MOV BL,0	; Copy a 2 into the BL register.
	DIV AL,BL	; DIV AL BY BL. Answer goes into AL.
	END		; Program ends
; ===== Program Ends ===========================================