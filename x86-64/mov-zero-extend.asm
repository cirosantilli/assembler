;# mov zero extend
;
; mov r32 zero extends to the full register.
;
; This does not happen on 8 and 16 bit operations.
;
; http://stackoverflow.com/questions/11177137/why-do-most-x64-instructions-zero-the-upper-part-of-a-32-bit-register

#include <lkmc.h>

LKMC_PROLOGUE
    mov rax, 0x12345678_9ABCDEF0
    mov eax, 1
    LKMC_ASSERT_EQ(%rax, $1)

    ; Does not happen for 16 and 8 bit.
    mov eax, 0x12345678
    mov ax, 1
    LKMC_ASSERT_EQ(%rax, $0x12340001)

    mov eax, 0x12345678
    mov al, 1
    LKMC_ASSERT_EQ(%rax, $0x12345601)

LKMC_EPILOGUE
