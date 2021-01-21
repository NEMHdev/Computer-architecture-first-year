
; ----- EXAMPLE 9 ------- Text I/O -------------------

; --------------------------------------------------------------
; A program to read in a string of text and store it in RAM.
; The end of text will be labelled with ASCII code zero/null.
; --------------------------------------------------------------
; THE MAIN PROGRAM
	MOV	BL,70	; [70] is the address where the text will
			; be stored. The procedure uses this.

	CALL	10	; The procedure at [10] reads in text and
			; places it starting from the address
			; in BL.

			; BL should still contain [70] here.
	MOV	CL,C0	;
	CALL	30

	CALL	80	; This procedure does nothing until you
			; write it.  It should display the text.

	HALT		; DON'T USE "END" HERE BY MISTAKE OR THE CODE
    			; FOR THE PROCEDURES WILL NOT BE GENERATED
                
; --------------------------------------------------------------
; A PROCEDURE TO READ IN THE TEXT
	ORG	10	; Code starts from address [10]

	PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSHF		; Save the CPU flags onto the stack

Rep:
	IN	00	; Input from port 00 (keyboard)
	CMP	AL,0D	; Was key press the Enter key?
	JZ	Stop	; If yes then jump to Stop
	MOV	[BL],AL	; Copy keypress to RAM at position [BL]
	INC	BL	; BL points to the next location.
	JMP	Rep	; Jump back to get the next character

Stop:
	MOV	AL,0	; This is the NULL end marker
	MOV	[BL],AL	; Copy NULL character to this position.

	POPF		; Restore flags from the stack
	POP	BL	; Restore BL from the stack
	POP	AL	; Restore AL from the stack

	RET		; Return from the procedure.
; --------------------------------------------------------------
; A PROCEDURE TO CONVERT UPPERCASE TO LOWERCASE

	ORG	30
SaveToMemory:

	PUSH	AL 	;Save AL onto the stack
	PUSH	BL
	;PUSH	CL
	PUSHF		;Save the CPU flags onto the stack

FetchCharacter:

	MOV	CL,[BL]	;Copy value pointed to by BL to CL
	CMP	CL,0	;If CL stores 0 Return procedure
	JZ	Return

Comp1:

	CMP	CL,41	;Compare char in CL with 'A'
	JNS	Comp2	;Does Char come before 'A'if not may be from A-2
	INC 	BL
	JMP	FetchCharacter

Comp2:

	CMP	CL,5B	;Compare char in CL with 'A'
	JS	ConvertCharacter	;Does Char come before 'A'if not may be from A-2
	INC	BL
	JMP	FetchCharacter

ConvertCharacter:

	ADD	CL,20
	MOV	[BL],CL
	INC	BL
	JMP	FetchCharacter

Return:
	
	POPF	
	POP	BL	;Restore BL register from the stack
	POP	AL	;Restore BL register from the stack
	;POP	CL
	RET
; --------------------------------------------------------------
; A PROCEDURE TO DISPLAY TEXT ON THE SIMULATED SCREEN
	ORG	80	; Code starts from address [80]
	MOV	CL,C0	; 
	
REP1:
	
	MOV	AL,[BL]
	MOV	[CL],AL
	INC	BL
	INC	CL
	CMP	AL,0
	JNZ	REP1
	
	RET		;Returns the procedure

; --------------------------------------------------------------
	END		; It is correct to use END at the end.
; --------------------------------------------------------------