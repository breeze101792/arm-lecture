	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}
	@r3:counter, r4:c-1, r5:c-2, r6:current
	mov r3, r0
	mov r4, #-1
	mov r5, #1
	
loop:
	add r6, r5, r4
	mov r4, r5
	mov r5, r6
	subs r3, r3, #1
	bge loop
	mov r0, r6

	pop {r3, r4, r5, r6, pc}
	@EPILOG
	@ END CODE MODIFICATION
	.size fibonacci, .-fibonacci
	.end
