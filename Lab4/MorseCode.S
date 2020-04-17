# MorseCode.S
# Feb 9, 2016

#--------------------------------------------------------------------
    .data    
    .macro pushall
    push r16
    push r17
    push r18
    push r19
    push r20
    push r21
    push r22
    push r23
    push r24
    push R25
    push r26
    push r27
    push r28
    push r29
    push r30
    push r31
  .endm 

  .macro popall
    pop r31
    pop r30
    pop r29
    pop r28
    pop r27
    pop r26
    pop R25
    pop r24
    pop r23
    pop r23
    pop r21
    pop r20
    pop r19
    pop r18
    pop r17
    pop r16
  .endm

  
morse_table: # binary representation of Morse code: 0: dot; 1: dash
    .byte 0b01, 0b1000, 0b1010, 0b100, 0b0, 0b0010, 0b110, 0b0000, 0b00, 0b0111, 0b101, 0b0100, 0b11, 0b10, 0b111, 0b0110, 0b1101, 0b010, 0b000, 0b1, 0b001, 0b0001, 0b011, 0b1001, 0b1011, 0b1100, 0b01111, 0b00111, 0b00011, 0b00001, 0b00000, 0b10000, 0b11000, 0b11100, 0b11110, 0b11111
morse_width: # the number of binary digits in each character
    .byte 2, 4, 4, 3, 1, 4, 3, 4, 2, 4, 3, 4, 2, 2, 3, 4, 4, 3, 3, 1, 3, 4, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
ascii_table: # the English symbols encoded by the above Morse code 
    .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
table_length:
    .byte 26

    .comm val, 1
    .comm width, 1
    .comm ascii, 1
    .global val, ascii, width

#---------------------------------------------------------------------
    .text
    .global decode_morse

decode_morse:
    pushall
    
    ldi r31, hi8(morse_table) ; initialize high byte of Z
    ldi r30, lo8(morse_table) ; initialize low byte of Z
    ldi r29, hi8(ascii_table) ; initialize high byte of Y
    ldi r28, lo8(ascii_table) ; initialize low byte of Y
    ldi r27, hi8(morse_width) ; initialize high byte of X
    ldi r26, lo8(morse_width) ; initialize low byte of X

    # ENTER YOUR CODE BELOW

    #this function checks inputs binary value andd the width of the binary digit 
    #after that it matches them to predefined values of all the symbols and returns the ascii character
    #elsee zero orr because there is  no match.
loopp:
    ld   r20, X+ ;;Width of morse
    ld   r21, Y+ ;;the Ascii table
    ld   r22, Z+ ;;morse table
    lds  r18, val   ;;val
    lds  r19, width ;;width
    cp   r19, r20
    breq compare    ;; if equal then branch to compare
    jmp  loopp

# this essential checks if its equal and if it is then it sets the ascii 
compare:
    cp   r22, r18
    breq setAscii
    jmp  loopp

# sets ascii
setAscii:
    sts  ascii, r21
    popall
ret
