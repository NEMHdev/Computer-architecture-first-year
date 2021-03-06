; ----- EXAMPLE 6 ------- PROCEDURES --------------------------

; ---------------------------------------------------------------

;  A general purpose time delay procedure.

;  The delay is controlled by the value in AL.

;  When the procedure terminates, the CPU registers are
;  restored to the same values that were present before 
;  the procedure was called. Push, Pop, Pushf and Popf
;  are used to achieve this.  In this example one procedure 

;  is re-used three times.  This re-use is one of the main 
;  advantages of using procedures.

;------ The Main Program ----------------------------------------

Start:
	MOV AL,90	; Copy 10010000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,10	; A Longer delay.
	CALL	90	; Call the procedure at address [90]
			
	MOV AL,D0	; Copy 11010000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,8	; A Longer delay.
	CALL	90	; Call the procedure at address [90]

	MOV AL,30	; Copy 00110000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,20	; A Longer delay.
	CALL	90	; Call the procedure at address [90]

	MOV AL,50	; Copy 01010000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,8	; A Longer delay.
	CALL	90	; Call the procedure at address [90]
			
	MOV AL,90	; Copy 10010000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,10	; A Longer delay.
	CALL	90	; Call the procedure at address [90]
			
	MOV AL,98	; Copy 10011000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,8	; A Longer delay.
	CALL	90	; Call the procedure at address [90]
		
	MOV AL,84	; Copy 10000100 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,20	; A Longer delay.
	CALL	90	; Call the procedure at address [90]
	
	MOV AL,88	; Copy 10001000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV	AL,8	; A Longer delay.
	CALL	90	; Call the procedure at address [90]
		

JMP	Start	; Jump back to the start.

; ----- Time Delay Procedure Stored At Address [90] -------------
	ORG	90	; Generate machine code from address [90]

	PUSH	AL	; Save AL on the stack.
	PUSHF		; Save the CPU flags on the stack.
Rep:
	DEC	AL	; Subtract one from AL.
	JNZ	REP	; Jump back to Rep if AL was not Zero.

	POPF		; Restore the CPU flags from the stack.
	POP	AL	; Restore AL from the stack.

	RET		; Return from the procedure.
; ---------------------------------------------------------------
	END
; ---------------------------------------------------------------