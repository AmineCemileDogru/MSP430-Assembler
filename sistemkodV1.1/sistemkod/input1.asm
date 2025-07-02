; Sayfa 1 - 5 tane MOV komutu ve ikinci sayfayı çağırma
.text
.org    0x1100

MOV     #0x1234, R4
MOV     #0x5678, R5
MOV     #0x9ABC, R6
MOV     #0xDEF0, R7
MOV     #0x1111, R8

CALL    #SECOND_PAGE 