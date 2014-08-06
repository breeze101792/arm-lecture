	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
	@ INSERT CODE BELOW
	@stmfd sp!, {r3, r4,r5, lr}
	ldr r3, =locked
	@ldrex r4, [r0]
check:
	ldrex r4, [r0]
	cmp r3, r4
	beq check

	strex r4, r3, [r0]
	cmp r4, #1
	beq check

	@ldmfd sp!, {r3, r4, r5,  pc}
	@ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	@stmfd sp!, {r3, r4, lr}
	ldr r3, =unlocked
	str r3, [r0]
@write:
	@strex r4, r3, [r0]
	@cmp r4, #1
	@beq write
	@ldmfd sp!, {r3, r4, pc}
	@ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
