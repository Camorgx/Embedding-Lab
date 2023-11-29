.section .text
.global sort
sort:
    stmfd sp!, {r4-r9}
    ldr r1, [r0]        @ r1 = arg->str_num
    mov r2, #0          @ r2 = i = 0
loopi:
    cmp r2, r1
    bge exit            @ if i >= arg->str_num, exit loopi
    sub r3, r1, #1      @ r3 = j = arg->str_num - 1
loopj:
    cmp r3, r2
    ble addi            @ if j <= i, exit loopj
    mov r7, #0          @ r7 = k = 0
    mov r5, r3, lsl#2   @ r5 = 4 * j
    add r4, r5, r0      @ r4 = &arg->str[j - 1]
    ldr r5, [r4]        @ r5 = arg->str[j - 1]
    ldr r6, [r4, #4]    @ r6 = arg->str[j]
loopk:
    ldrb r8, [r5, r7]   @ r8 = arg->str[j - 1][k]
    ldrb r9, [r6, r7]   @ r9 = arg->str[j][k]
    cmp r7, #20
    bge swap            @ if k >= 20, goto swap
    cmp r9, r8
    bne swap            @ if arg->str[j - 1][k] != arg->str[j][k], goto swap
    add r7, r7, #1      @ ++k
    b loopk
swap:
    cmp r9, r8
    bge subj            @ if arg->str[j][k] >= arg->str[j-1][k], skip swap
    str r6, [r4]        @ arg->str[j - 1] = arg->str[j]
    str r5, [r4, #4]    @ arg->str[j] = arg->str[j - 1]
subj:
    sub r3, r3, #1      @ --j
    b loopj
addi:
    add r2, r2, #1      @ ++i
    b loopi
exit:
    ldmfd SP!, {R4-R9}
    mov pc, lr
.end
