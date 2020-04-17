
 // Angel Camacho
 // CS273
    .file "test.S" // this sets the name of the file
    .text          
    .global testf
testf:
      ldi    r17, 0x20  // sets r17 with 32
      out    0x04, r17  // sets channel 0x04 to output
      ldi    r16, 100   // sets how many times it will blink
all:  ldi    r17, 0x20  // sets r17 with 32
      out    0x05, r17  // outputs 32 to turn on LED
      ldi    r20, 0x05  // this is a value for loop # 5
dl5:  ldi    r18, 0xff  // loop # 5 starts here
dl1:  ldi    r19, 0xff  // loop # 4 starts here
dl2:  nop               // basically do nothing
      nop
      nop
      nop
      dec    r19        // decrement r19 which originally starts with 255
      brne   dl2        // branch off to dl2 or go back to
      dec    r18        // decrement r18 which originally starts with 255
      brne   dl1        // go back to dl1
      dec    r20        // decrement r20 which originally starts with 5
      brne   dl5        // essentially repeat this 5 times
      ldi    r17, 0x00  // r17 val to off
      out    0x05, r17  // output 
      ldi    r20, 0x05  // does basically the same as the previous loops
dl6:  ldi    r18, 0xff
dl3:  ldi    r19, 0xff
dl4:  nop
      nop
      nop
      nop
      dec    r19
      brne   dl4
      dec    r18
      brne   dl3
      dec    r20
      brne   dl6       
      dec    r16
      brne   all        // basically repeats this 50 times and thats it
      ret
    
