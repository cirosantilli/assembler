; # cmps

    ; Compare two arrays

#include <lkmc.h>

section .data

    bs4 db 0, 1, 2, 3
    bs4_2 db 0, 0, 0, 0

LKMC_PROLOGUE

    mov esi, bs4
    mov byte [bs4], 0
    mov byte [bs4 + 1], 1

    mov edi, bs4_2
    mov byte [bs4_2], 0
    mov byte [bs4_2 + 1], 2

    cld
    cmpsb
    ASSERT_FLAG jz
    mov eax, esi
    sub eax, bs4
    LKMC_ASSERT_EQ(%eax, $1)
    mov eax, edi
    sub eax, bs4_2
    LKMC_ASSERT_EQ(%eax, $1)
    LKMC_ASSERT_EQ [bs4], 0, byte
    LKMC_ASSERT_EQ [bs4_2], 0, byte

    std
    movsb
    ASSERT_FLAG jnz
    mov eax, esi
    sub eax, bs4
    LKMC_ASSERT_EQ(%eax, $0)
    mov eax, edi
    sub eax, bs4_2
    LKMC_ASSERT_EQ(%eax, $0)
    LKMC_ASSERT_EQ [bs4 + 1], 1, byte
    ; TODO why fail?
    ;LKMC_ASSERT_EQ [bs4_2 + 1], 2, byte

LKMC_EPILOGUE
