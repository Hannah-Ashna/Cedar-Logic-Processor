*-----------------------------------------------------------
* Program    :Capitalise
* Written by :R.J.Cant
* Date       :14/04/203
* Description:Assembly language implemetation of the capitalise program
*-----------------------------------------------------------
*Note that the help facility includes an ascii chart that can be used to find the numerical values of ascii codes
*Using this chart we find that 'A' =$41 ($ means hex) and 'a' =$61 so 'A'-'a'= -$20=$E0. Also 'z'=$7A
	ORG	$1000
START:				; first instruction of program




	LEA	testdata,A0     ; Loads testdata into A0
nxtch:	tst.b	(A0)            ; testdata[i] = 0
	BEQ	finish          ; If true, jump to finish --> this is the while(testdata[i] !=0) line
	MOVE.B	(A0),D0         ; Moves the current character from A0 to D0
	CMP.B	#$61,D0         ; Compares the value in D0 to 'a'  (testdata character - 'a'), if it is a Capital character then the N flag is set
	BLT	update          ; Branch to update if the result is less than --> When it fails to fulfill this if statement's condition if (testdata[i]>='a')
	CMP.B	#$7A,D0         ; Compares the value from D0 to 'z' (test data character - 'z'), if it is a Capital character then the N flag is set
	BGT	update          ; Branch to update if the result is greater than --> When it fails to fulfill this if statement's condition if (testdata[i]<='z')
	ADD.B	#$E0,D0         ; Convert the lower case value to upper case --> testdata[i]=testdata[i]+ 'A'-'a';
update	MOVE.B	D0,(A0)+        ; Move on to the next character in the string --> Increment the counter by 1 (i++)
	bra	nxtch           ; Branch back to nxtch to repeat the checking process --> Continue the while loop
finish:	
	TRAP	#15		; halt simulator

* Variables and Strings
testdata:	dc.b 'mThis is a test string',0      ; Declaration of the variable that stores the string --> char testdata[100] = "This is a test string"


	END	START		; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
