
  .equ ADCL, 0x0078
  .equ ADCH, 0x0079
  .equ ADCSRA, 0x007A
  .equ ADCSRB, 0x007B
  .equ ADMUX, 0x007C
  .equ DDIR0, 0x007E
  .equ ADSC, 6 // bit 6 on the ADCSRA
  .text
  .global initAD
  .global readAD

initAD:  // routine which initializes the A/D lines     
    // FIXME
    ldi r16, 0xff
    sts DIDR0, r16
    ldi r17, 0x87
    sts ADS, r17
    ret // of initAD

readAD:  // routine which has one parameter in r24
    push r16
    ldi r16, 0x60
    add r16, r24
    sts admux, r16
    
    lds r16, adcsra
    ori r16, 0x40
    sts adcsra, r16
    
l1:
    lds  r16, adcsra
    andi r16, 0x40
    brne l1
    
    lds  r24, adch
    clr r25
    pop r16
    ret // of readAD
 
