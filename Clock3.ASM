; ======================================================
; ===== Clock3.asm ===================================
; ===== Seven Segment Displays Port 02 =================

	JMP	Start	

	DB	FA	; 0 
	DB	0A	; 1
	DB	B6	; 2
	DB	9E	; 3
	DB	4E	; 4	
	DB	DC	; 5
	DB	FC	; 6
	DB	8A	; 7
	DB	FE	; 8
	DB	DE	; 9
	DB	0

Start:
	MOV	AL,0	; Copy 0 into AL 
	OUT	02	; Output to Port 02.
	MOV	AL,1	; Copy 1 into AL
	OUT	02	; Copy 0 into AL 

	MOV	CL,02	; Copy 02 into CL
	MOV	BL,03	; Copy 03 into BL
	MOV	AL,[CL]	; Move what CL points to, to AL
	OUT	02	; Output from AL register to port 02
	
Rep:
	
		
	INC	AL	; Add ONE to AL
	OUT	02	; Output to Port 02.
	INC	CL	; Add ONE to CL
	MOV	AL,[CL]	; Move what CL points to, to AL
	
	CMP	AL,0	; Last item in data table
	JNZ	Rep	; If yes then jump to REP

	MOV	AL,[BL]	; Move what BL points to, to AL
	OUT	02	; Output to Port 02.
	
	INC	BL	; Add ONE to BL
	

	CMP	AL,0	; Last item in data table
	JZ	Start	; If yes jump to start and start again
	
	MOV	CL,02	; Copy 02 into CL
	MOV	AL,[CL] ; Move what CL points to, to AL
	JMP	Rep	; Jump back to do next table entry

	
	
	END
; ======================================================