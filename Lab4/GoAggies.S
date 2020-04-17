       .extern delay
       
       .data
       
       .comm val, 1
       .global val
       .comm width, 1
       .global width
       .comm ascii, 1
       .global ascii
       
       .text
       .global goaggies

# just to make my life easier turn on/off functions
on: 
        ldi r17, 0x20
        out 0x05, r17
ret

off:
        ldi r17, 0x00
        out 0x05, r17
ret

# go aggies function
goaggies:
       ldi r17, 0x20
       out 0x04, r17
       call g
       call o
       call a
       call g
       call g
       call i
       call e
       call s
ret

# this is used to determin how longg || shortt I want mi lights to be on for 
longg:
      call delayy
      call on
      call delayy
      call delayy
      call delayy
      call off
      call delayy
ret

shortt:
      call delayy
      call on
      call delayy
      call off
ret

# This is essentially a delayy 
delayy:
      ldi r22, 0xa0
      ldi r23, 0x00
      ldi r24, 0x00
      ldi r25, 0x00
      call delay
ret



# GO AGGIES! in morse code...
g:
      call longg
      call longg
      call shortt
ret

o:
      call longg
      call longg
      call longg
ret

a:
      call shortt
      call longg
ret

i:
      call shortt
      call shortt
ret

e:
      call shortt
ret

s:
      call shortt
      call shortt
ret
