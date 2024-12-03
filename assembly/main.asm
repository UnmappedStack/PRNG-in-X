;; ===== Linear Congruential Generator (LCG) in x86_64 NASM Assembly =====
;;           Written by Jake Steinburger (UnmappedStack) in 2024.
;;   Copyright under the MIT license. See the GitHub repo for more info.
;;            LCG is a pseudo-random number generator, or PRNG.

[BITS 64]

global main
extern printf
extern time

%define mod        2147483648
%define multiplier 1103515245
%define increment  12345

section .text

;; Summary:
;;   Takes a seed value and generates a new pseudo-random value from it.
;; Args:
;;   rdi: Prev value
;; Returns:
;;   rax: New value
gen_num: push rbp
         mov r15, multiplier
         mov rax, rdi
         mul r15
         mov rdi, rax
         mov r15, increment
         add rdi, r15
         mov rax, rdi
         mov r15, mod
         div r15
         mov rdx, rax
         pop rbp
         ret

;; Summary:
;;   Get the time to use as a seed (UNIX epoch) and loop 10 times, each time generating a new random
;;   number based on the previous one.
;; Args:
;;   None, but _start may pass argv, argc, and env vars
;; Returns:
;;   rax: Status code, 0 on success.
main:  push rbp
       mov rbp, rsp
       xor rdi, rdi
       call time
       xor r12, r12
loop0: cmp r12, 10
       jge loop1
       mov rdi, r14
       call gen_num
       mov r14, rax
       lea rdi, [strlit0]
       mov rsi, r12
       mov rdx, rax
       call printf
       inc r12
       jmp loop0
loop1: pop rbp
       xor rax, rax
       ret

section .rodata

strlit0:    db "%i: Generated number: %u", 10, 0
