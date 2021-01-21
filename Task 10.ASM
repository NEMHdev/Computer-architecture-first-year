; ----- EXAMPLE 4 ------- COUNTING AND JUMP --------------------------

	MOV	AL,0	; Initial value stored in AL
	MOV	BL,1	; Initial value stored in BL

Rep:			; Jump back to this label

	ADD	AL,BL	;ADD BL to AL and stored in AL
	MOV 	[A0],AL	;MOV value from AL to memory location [A0]
	MOV	[B0],BL	;MOV value from BL to memory location [B0]
	MOV	AL,[B0]	;MOV value from memory location [B0] to AL
	MOV	BL,[A0]	;MOV value from memory location [A0] to BL
	
	
	JMP	Rep	; Jump back to Rep

	END		; Program Ends

; ===== Program Ends ===============================