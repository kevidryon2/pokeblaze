;define SCREEN_RAM_START $9800
;define SCREEN_RAM_END $9bff

ClearScreen:
    call DisableLCD
    ld b, $7f ;Data to write
    ld hl, $0000 ;Address of start of screen RAM
.loop:
    ld a, b
    ld [hl], a
.check:
    ld a, h
    cp $9b ;Did we reach end of screen ram?
    jp z, .end
.incr:
    inc b
    inc hl
    jp .loop
.end:
    call EnableLCD
    ret
