 // writting AVR assembly Code
// Angel Camacho
// Due: Feb 4, 2020
// inputs x1, x2, x3 outputs calculation, assuming its a two digit number
// output is 46 when x1,x2,x3 = 12
// I learned how the add fuction works and how to set channels for the lights
#
# Global data (x1, x2, and x3)
#
    .data            //tells arduino we want to allocate memory
    .comm x1,1       //allocate one byte of memory and call it "x1"
    .global x1       //makes it so the main code can access it 
    .comm x2,1       //allocate one byte of memory and call it "x2"
    .global x2       //etc
    .comm x3,1
    .global x3

#
# Program code (addition function)
#
    .text           //
    .global addition// makes addition function global
addition:
    ldi  r17, 0x20  // sets r17 with 32
    out  0x04, r17  // sets channel 0x04 to output
    ldi  r17, 0x20  // sets r17 with 32
    out  0x05, r17  // outputs 32 to turn on LED
    lds  r18, x1    // brings the values stored into r18 from x1
    lds  r19, x2    // brings the values stored into r19 from x2
    lds  r20, x3    // brings the values stored into r20 from x3
    inc  r18        // increments by one
    dec  r19        // decrements r19 once 
    dec  r20        // decrements r20 three times
    dec  r20
    dec  r20
    add  r18, r18   // r18 times 2 basically
    add  r18, r19   // r18 plus r19
    add  r18, r20   // r18 plus r20
    sts  x3, r18    
    ret
    
