	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.extern printf
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r4, r5, r6, lr}

	mov r4, r0 	@ R4 = R0 - 0 (update flags)

	mov r1, r4
	ldr	r0, =string1
	bl	printf

	mov r5, #0		@ init fib(0) = 0
	mov r6, #1		@ init fib(1) = 1
.Loop:
	mov r0, r6		@ R0 = R6 and also the result
	add r6, r5, r6	@ R6 += R5
	mov r5, r0		@ R5 = R0   (exchange R5, R6)
	subs r4, r4, #1 	@ R4 = R4 - 1
	bne .Loop

	mov r1, r0
	ldr	r0, =string2
	bl	printf

	pop {r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.data 
	string1: .asciz "The fibonacci sequence at %d is: "
	string2: .asciz "%d\n"
	.end


