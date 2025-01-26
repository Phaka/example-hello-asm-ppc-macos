.machine ppc
.text
    .globl  _main               ; Entry point for Mac OS X

    .data
msg:
    .ascii  "Hello, World!\n"   ; Message with Unix newline
msg_len = . - msg              ; Calculate message length

    .text
_main:
    mflr    r0                  ; Save return address
    stw     r0, 8(r1)          ; Store it in caller's frame
    stwu    r1, -64(r1)        ; Create stack frame

    ; Mac OS X write syscall (4)
    li      r0, 4              ; System call number for write
    li      r3, 1              ; First argument: stdout (fd 1)
    lis     r4, msg@ha         ; Load high half of msg address
    addi    r4, r4, msg@l      ; Add low half to complete address
    li      r5, msg_len        ; Third argument: length
    sc                         ; System call

    ; Exit cleanly
    li      r0, 1              ; System call number for exit
    li      r3, 0              ; Exit status 0
    sc                         ; System call

    ; We never get here
    lwz     r0, 68(r1)         ; Restore return address
    addi    r1, r1, 64         ; Destroy stack frame
    mtlr    r0                 ; Restore link register
    blr                        ; Return
