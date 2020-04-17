       .data
       
       .comm gender, 1
       .global gender
       .comm age, 1
       .global age
       .comm fat, 1
       .global fat
       
       .text
       .global lightup
lightup:
       // check gender
       lds  r17, gender
       cpi  r17, 0x01
       breq female
       cpi  r17, 0x02
       breq male
       ret
tooYoung:
      ret
female:
       //check age
       lds  r19, age
       cpi  r19, 20
       brlt tooYoung
       cpi  r19, 39
       brlt femaleYoung
       cpi  r19, 59
       brlt femaleMiddle
       cpi  r19, 79
       brlt femaleOld
       ret
femaleYoung:
       // check fat 
       lds  r20, fat
       cpi  r20, 20
       brlt fjumpBlue
       cpi  r20, 32
       brlt fjumpGreen
       cpi  r20, 38
       brlt fjumpRed
       jmp  allLedsOn
       ret
femaleMiddle:
       // check fat
       lds  r20, fat
       cpi  r20, 22
       brlt fjumpBlue
       cpi  r20, 33
       brlt fjumpGreen
       cpi  r20, 40
       brlt fjumpRed
       jmp  allLedsOn
       ret
femaleOld:
       // check fat
       lds  r20, fat
       cpi  r20, 23
       brlt fjumpBlue
       cpi  r20, 35
       brlt fjumpGreen
       cpi  r20, 41
       brlt fjumpRed
       jmp  allLedsOn
       ret
       // jumpPad for female branching
fjumpGreen:
       jmp  blinkGreen
       ret
fjumpBlue:
       jmp  blinkBlue
       ret
fjumpRed:
       jmp  blinkRed
       ret
       
male:
       //check age
       lds  r19, age
       cpi  r19, 20
       brlt nothing
       cpi  r19, 39
       brlt maleYoung
       cpi  r19, 59
       brlt maleMiddle
       cpi  r19, 80
       brlt maleOld 
       ret
maleYoung:
       //check fat
       lds  r20, fat
       cpi  r20, 7
       brlt jumpBlue
       cpi  r20, 19
       brlt jumpGreen
       cpi  r20, 24
       brlt jumpRed
       jmp  allLedsOn
       ret
maleMiddle:
       //check fat
       lds  r20, fat
       cpi  r20, 10
       brlt jumpBlue
       cpi  r20, 20
       brlt jumpGreen
       cpi  r20, 27
       brlt jumpRed
       jmp  allLedsOn
       ret
maleOld:
       //check fat 
       lds  r20, fat
       cpi  r20, 12
       brlt jumpBlue
       cpi  r20, 24
       brlt jumpGreen
       cpi  r20, 29
       brlt jumpRed
       jmp  allLedsOn
       ret
//literally nothin
nothing:
      ret
// LED stuff
blinkRed:
      //prepares r18 with a certain led
      ldi  r18, 0b00000001
      jmp  justBlink
      ret
blinkBlue:
      //prepares r18 with a certain led
      ldi  r18, 0b00100000
      jmp  justBlink
      ret
blinkGreen:
      //prepares r18 with a certain led
      ldi  r18, 0b00010000
      jmp  justBlink
      ret
allLedsOn:
      //prepares r18 with a certain leds
      ldi  r18, 0b00110001
      out  0x04, r18
      out  0x05, r18
      ret
    //jumpPad  
jumpGreen:
       jmp  blinkGreen
       ret
jumpBlue:
       jmp  blinkBlue
       ret
jumpRed:
       jmp  blinkRed
       ret
 
justBlink:
dl666:
      out  0x04, r18
      out  0x05, r18
      ldi  r20, 0x05  // this is a value for loop # 5
dl5:  ldi  r28, 0xff  // loop # 5 starts here
dl1:  ldi  r29, 0xff  // loop # 4 starts here
dl2:  nop             // basically do nothing
      nop
      nop
      nop
      nop
      nop
      dec  r29        // decrement r19 which originally starts with 255
      brne dl2        // branch off to dl2 or go back to
      dec  r28        // decrement r18 which originally starts with 255
      brne dl1        // go back to dl1
      dec  r20        // decrement r20 which originally starts with 5
      brne dl5        // essentially repeat this 5 times
      ldi  r31, 0x00  // r17 val to off
      out  0x04, r31
      out  0x05, r31  // output 
dl6:  ldi  r28, 0xff
dl3:  ldi  r29, 0xff
dl4:  nop
      nop
      nop
      nop
      nop
      nop
      dec  r29
      brne dl4
      dec  r28
      brne dl3
      dec  r20
      jmp justBlink
      ret
