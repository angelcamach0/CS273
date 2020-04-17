;;
/*
 * Angel Camacho
 * Mar 8, 2018
 * a) no input other than manual bit patter of numbers
 * b) outputs to display
 * c) no assumptions
 * 7) we learned that it is extreamly difficult to code every bit pattern and every branch but we also
 *    understand how the assembly file communicates witht he C files and to the arduino. (including each segment
 *    )
 */
;;  AVR code to do the function of the 4  x 7 segment display of Lab 5
;;
;;
;;   Shaun Cooper
;;    CS 273
;;    Semester XXXX , 20XX
;;
;;  The basic algorithm is to have the main loop
;; set some shared variable values
;;  we then use simulataneous arrays (vectors)
;;  to figure out which segment is desired 
;;; and which sequence is needed
;;
;;  Since our setup utilizes PORTB and PORTB, then we need to main
;;   simulataneous vectors for all of the segment sequences that are neededed
;;
;; main routine does
;;   setup_ports once
;; 
;;   C code to do the following

;;   segment=0
;;   digit=9
;;   display_segment();; will display 9 on segment 0, for example
;;  
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
  .size segment_table, 4
  .size portb_table, 10
  .size portd_table, 10
  
segment_table:  #binary for seting input on PORTB for segment select
    .byte 0b00000010, 0b00000100, 0b00001000, 0b00010000
    ;; 0, 1, 2,3 4, 5, 6 , 7, 8 , 9
portb_table:  # list of binary sequences for setting port B to be ORed with segment table ite
    .byte  0b00000001,1,0,0,0,0,0,1,0,0
portd_table: # list of binary sequences for setting port D.
    .byte  0b00000000,0b11100100,0b10010000,0b11000000,0b01100100,0b01001000,0b00001100,0b11100000,0, 0b01100000
segmentv: .byte 1


  //these are the values that we are going to utilize in order to display to the correct segments and the correct numbers
  .comm segment, 1 ;; the common name for segment
  .comm digit, 1 ;; the digit into our sequences
  .global segment, digit
  
  

# --------
  .text
    //these are the values that we are going to utilize in order to display to the correct segments and the correct numbers
    //as well as the setup ports which turn the ports into output mode.
  .global setup_ports
  .global display_segment
  .global select_segment


setup_ports:    ;; routine to set the ports into output mode
  ;; set PORT B
  ldi r16,  0b00011111
  ;; set PORT D
  ldi r17,  0b11111100
  out 0x04, r16
  out 0x0A, r17
  ret           ;; of setup_ports
  
select_segment:
  ldi r19, 0
  out 0x05, r19
  out 0x0b, r19
  lds r18, segment
  cpi r18, 0
  breq segzero
  cpi r18, 1
  breq segone
  cpi r18, 2
  breq segtwo
  jmp segthree
ret

segzero:
  ldi r19, 0b00000010
  out 0x05, r19
  ret

segone:
  LDI R19, 0b00000100
  out 0x05, r19
  ret

segtwo:
  ldi r19, 0b00001000
  out 0x05, r19
  ret

segthree:
  ldi r19, 0b00010000
  out 0x05, r19
  ret


display_segment:  ;;  main entry point for setting the segment

   ;; the goal is the use "digit" to and "segment" to find the values that need
   ;; to be sent to PORTB and PORT D 

   lds r20, digit
   cpi r20, 0
   breq lightZero
   cpi r20, 1
   breq lightOne
   cpi r20, 2
   breq lightTwo
   cpi r20, 3
   breq lightThree
   cpi r20, 4
   breq lightFour
   cpi r20, 5
   breq lightFive
   cpi r20, 6
   breq lightSix
   cpi r20, 7
   breq lightSeven
   cpi r20, 8
   breq lightEight
   jmp lightNine

;; this is the binry codes that display each and every number not only that but it will also tell 
;; to which register to out put
lightZero:
  ldi r22, 0b00000001
  ldi r23, 0b00000001
  add r19, r23
  out 0x05, r19
  out 0x0b, r22
  ret
lightOne:
  ldi r22, 0b11100100
  ldi r23, 0b00000001
  add r19, r23
  out 0x05, r19
  out 0x0b, r22
  ret
lightTwo:
  ldi r22, 0b10010011
  out 0x0b, r22
  ret
lightThree:
  ldi r22, 0b11000000
  out 0x0b, r22
  ret
lightFour:
  ldi r22, 0b01100100
  out 0x0b, r22
  ret
lightFive:
  ldi r22, 0b01001000
  out 0x0b, r22
  ret
lightSix:
  ldi r22, 0b00001000
  out 0x0b, r22
  ret
lightSeven:
  ldi r22, 0b11100000
  ldi r23, 0b00000001
  add r19, r23
  out 0x05, r19
  out 0x0b, r22
  ret
lightEight:
  ldi r22, 0b00000000
  out 0x0b, r22
  ret
lightNine:
  ldi r22, 0b01100000
  out 0x0b, r22
  ret
ret ;; of display_segment
    
