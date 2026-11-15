	.file	"CameraController.cpp"
	.intel_syntax noprefix
# GNU C++20 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c++20 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.file 0 "/home/bimachandra/Documents/projects/process-visualizer" "src/renderer/CameraController.cpp"
	.section	.text._ZSt23__is_constant_evaluatedv,"axG",@progbits,_ZSt23__is_constant_evaluatedv,comdat
	.weak	_ZSt23__is_constant_evaluatedv
	.type	_ZSt23__is_constant_evaluatedv, @function
_ZSt23__is_constant_evaluatedv:
.LFB1:
	.file 1 "/usr/include/x86_64-linux-gnu/c++/13/bits/c++config.h"
	.loc 1 541 3
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# /usr/include/x86_64-linux-gnu/c++/13/bits/c++config.h:547:     return __builtin_is_constant_evaluated();
	.loc 1 547 44
	mov	eax, 0	# _1,
# /usr/include/x86_64-linux-gnu/c++/13/bits/c++config.h:551:   }
	.loc 1 551 3
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	_ZSt23__is_constant_evaluatedv, .-_ZSt23__is_constant_evaluatedv
	.section	.text._ZSt3cosf,"axG",@progbits,_ZSt3cosf,comdat
	.weak	_ZSt3cosf
	.type	_ZSt3cosf, @function
_ZSt3cosf:
.LFB1265:
	.file 2 "/usr/include/c++/13/cmath"
	.loc 2 178 3
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
	movss	DWORD PTR -4[rbp], xmm0	# __x, __x
# /usr/include/c++/13/cmath:178:   { return __builtin_cosf(__x); }
	.loc 2 178 26
	mov	eax, DWORD PTR -4[rbp]	# tmp84, __x
	movd	xmm0, eax	#, tmp84
	call	cosf@PLT	#
# /usr/include/c++/13/cmath:178:   { return __builtin_cosf(__x); }
	.loc 2 178 33
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1265:
	.size	_ZSt3cosf, .-_ZSt3cosf
	.section	.text._ZSt3sinf,"axG",@progbits,_ZSt3sinf,comdat
	.weak	_ZSt3sinf
	.type	_ZSt3sinf, @function
_ZSt3sinf:
.LFB1298:
	.loc 2 401 3
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
	movss	DWORD PTR -4[rbp], xmm0	# __x, __x
# /usr/include/c++/13/cmath:401:   { return __builtin_sinf(__x); }
	.loc 2 401 26
	mov	eax, DWORD PTR -4[rbp]	# tmp84, __x
	movd	xmm0, eax	#, tmp84
	call	sinf@PLT	#
# /usr/include/c++/13/cmath:401:   { return __builtin_sinf(__x); }
	.loc 2 401 33
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1298:
	.size	_ZSt3sinf, .-_ZSt3sinf
	.text
	.align 2
	.globl	_ZN16CameraControllerC2Ev
	.type	_ZN16CameraControllerC2Ev, @function
_ZN16CameraControllerC2Ev:
.LFB1833:
	.file 3 "src/renderer/CameraController.cpp"
	.loc 3 6 1
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
	mov	QWORD PTR -8[rbp], rdi	# this, this
.LBB2:
# src/renderer/CameraController.cpp:6: CameraController::CameraController() {
	.loc 3 6 36
	mov	rax, QWORD PTR -8[rbp]	# tmp82, this
	pxor	xmm0, xmm0	# tmp83
	movups	XMMWORD PTR [rax], xmm0	# this_2(D)->camera, tmp83
	movups	XMMWORD PTR 16[rax], xmm0	# this_2(D)->camera, tmp83
	movups	XMMWORD PTR 28[rax], xmm0	# this_2(D)->camera, tmp83
	mov	rax, QWORD PTR -8[rbp]	# tmp84, this
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp85,
	movss	DWORD PTR 44[rax], xmm0	# this_2(D)->yaw, tmp85
	mov	rax, QWORD PTR -8[rbp]	# tmp86, this
	movss	xmm0, DWORD PTR .LC1[rip]	# tmp87,
	movss	DWORD PTR 48[rax], xmm0	# this_2(D)->pitch, tmp87
	mov	rax, QWORD PTR -8[rbp]	# tmp88, this
	movss	xmm0, DWORD PTR .LC2[rip]	# tmp89,
	movss	DWORD PTR 52[rax], xmm0	# this_2(D)->distance, tmp89
	mov	rax, QWORD PTR -8[rbp]	# tmp90, this
	pxor	xmm0, xmm0	# tmp91
	movss	DWORD PTR 56[rax], xmm0	# this_2(D)->target.x, tmp91
	mov	rax, QWORD PTR -8[rbp]	# tmp92, this
	movss	xmm0, DWORD PTR .LC4[rip]	# tmp93,
	movss	DWORD PTR 60[rax], xmm0	# this_2(D)->target.y, tmp93
	mov	rax, QWORD PTR -8[rbp]	# tmp94, this
	pxor	xmm0, xmm0	# tmp95
	movss	DWORD PTR 64[rax], xmm0	# this_2(D)->target.z, tmp95
# src/renderer/CameraController.cpp:7:     camera.target = target;
	.loc 3 7 19
	mov	rax, QWORD PTR -8[rbp]	# tmp96, this
	mov	rdx, QWORD PTR -8[rbp]	# tmp97, this
	mov	rcx, QWORD PTR 56[rdx]	# tmp98, this_2(D)->target
	mov	QWORD PTR 12[rax], rcx	# this_2(D)->camera.target, tmp98
	mov	edx, DWORD PTR 64[rdx]	# tmp99, this_2(D)->target
	mov	DWORD PTR 20[rax], edx	# this_2(D)->camera.target, tmp99
# src/renderer/CameraController.cpp:8:     camera.up = {0.0f, 1.0f, 0.0f};
	.loc 3 8 15
	mov	rax, QWORD PTR -8[rbp]	# tmp100, this
	pxor	xmm0, xmm0	# tmp101
	movss	DWORD PTR 24[rax], xmm0	# this_2(D)->camera.up.x, tmp101
	mov	rax, QWORD PTR -8[rbp]	# tmp102, this
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp103,
	movss	DWORD PTR 28[rax], xmm0	# this_2(D)->camera.up.y, tmp103
	mov	rax, QWORD PTR -8[rbp]	# tmp104, this
	pxor	xmm0, xmm0	# tmp105
	movss	DWORD PTR 32[rax], xmm0	# this_2(D)->camera.up.z, tmp105
# src/renderer/CameraController.cpp:9:     camera.fovy = 45.0f;
	.loc 3 9 17
	mov	rax, QWORD PTR -8[rbp]	# tmp106, this
	movss	xmm0, DWORD PTR .LC6[rip]	# tmp107,
	movss	DWORD PTR 36[rax], xmm0	# this_2(D)->camera.fovy, tmp107
# src/renderer/CameraController.cpp:10:     camera.projection = CAMERA_PERSPECTIVE;
	.loc 3 10 23
	mov	rax, QWORD PTR -8[rbp]	# tmp108, this
	mov	DWORD PTR 40[rax], 0	# this_2(D)->camera.projection,
# src/renderer/CameraController.cpp:12:     updatePosition();
	.loc 3 12 19
	mov	rax, QWORD PTR -8[rbp]	# tmp109, this
	mov	rdi, rax	#, tmp109
	call	_ZN16CameraController14updatePositionEv	#
.LBE2:
# src/renderer/CameraController.cpp:13: }
	.loc 3 13 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1833:
	.size	_ZN16CameraControllerC2Ev, .-_ZN16CameraControllerC2Ev
	.globl	_ZN16CameraControllerC1Ev
	.set	_ZN16CameraControllerC1Ev,_ZN16CameraControllerC2Ev
	.align 2
	.globl	_ZN16CameraController6updateEv
	.type	_ZN16CameraController6updateEv, @function
_ZN16CameraController6updateEv:
.LFB1835:
	.loc 3 15 33
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# this, this
# src/renderer/CameraController.cpp:15: void CameraController::update() {
	.loc 3 15 33
	mov	rax, QWORD PTR fs:40	# tmp133, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.49218, tmp133
	xor	eax, eax	# tmp133
.LBB3:
# src/renderer/CameraController.cpp:18:     if (IsMouseButtonDown(MOUSE_BUTTON_RIGHT)) {
	.loc 3 18 26
	mov	edi, 1	#,
	call	IsMouseButtonDown@PLT	#
# src/renderer/CameraController.cpp:18:     if (IsMouseButtonDown(MOUSE_BUTTON_RIGHT)) {
	.loc 3 18 5 discriminator 1
	test	al, al	# _23
	je	.L9	#,
.LBB4:
# src/renderer/CameraController.cpp:19:         Vector2 delta = GetMouseDelta();
	.loc 3 19 38
	call	GetMouseDelta@PLT	#
	movq	rax, xmm0	# tmp102,
	mov	QWORD PTR -16[rbp], rax	# MEM[(struct Vector2 *)_37], tmp103
# src/renderer/CameraController.cpp:21:         yaw -= delta.x * 0.005f;
	.loc 3 21 9
	mov	rax, QWORD PTR -40[rbp]	# tmp104, this
	movss	xmm0, DWORD PTR 44[rax]	# _1, this_26(D)->yaw
# src/renderer/CameraController.cpp:21:         yaw -= delta.x * 0.005f;
	.loc 3 21 22
	movss	xmm2, DWORD PTR -16[rbp]	# _2, MEM[(struct Vector2 *)_37].x
# src/renderer/CameraController.cpp:21:         yaw -= delta.x * 0.005f;
	.loc 3 21 24
	movss	xmm1, DWORD PTR .LC7[rip]	# tmp105,
	mulss	xmm1, xmm2	# _3, _2
# src/renderer/CameraController.cpp:21:         yaw -= delta.x * 0.005f;
	.loc 3 21 13
	subss	xmm0, xmm1	# _4, _3
	mov	rax, QWORD PTR -40[rbp]	# tmp106, this
	movss	DWORD PTR 44[rax], xmm0	# this_26(D)->yaw, _4
# src/renderer/CameraController.cpp:22:         pitch += delta.y * 0.005f;
	.loc 3 22 9
	mov	rax, QWORD PTR -40[rbp]	# tmp107, this
	movss	xmm1, DWORD PTR 48[rax]	# _5, this_26(D)->pitch
# src/renderer/CameraController.cpp:22:         pitch += delta.y * 0.005f;
	.loc 3 22 24
	movss	xmm2, DWORD PTR -12[rbp]	# _6, MEM[(struct Vector2 *)_37].y
# src/renderer/CameraController.cpp:22:         pitch += delta.y * 0.005f;
	.loc 3 22 26
	movss	xmm0, DWORD PTR .LC7[rip]	# tmp108,
	mulss	xmm0, xmm2	# _7, _6
# src/renderer/CameraController.cpp:22:         pitch += delta.y * 0.005f;
	.loc 3 22 15
	addss	xmm0, xmm1	# _8, _5
	mov	rax, QWORD PTR -40[rbp]	# tmp109, this
	movss	DWORD PTR 48[rax], xmm0	# this_26(D)->pitch, _8
# src/renderer/CameraController.cpp:24:         pitch = std::clamp(pitch, -1.4f, 1.4f);
	.loc 3 24 42
	movss	xmm0, DWORD PTR .LC8[rip]	# tmp110,
	movss	DWORD PTR -24[rbp], xmm0	# MEM[(float *)_20], tmp110
# src/renderer/CameraController.cpp:24:         pitch = std::clamp(pitch, -1.4f, 1.4f);
	.loc 3 24 35
	movss	xmm0, DWORD PTR .LC9[rip]	# tmp111,
	movss	DWORD PTR -28[rbp], xmm0	# D.47276, tmp111
# src/renderer/CameraController.cpp:24:         pitch = std::clamp(pitch, -1.4f, 1.4f);
	.loc 3 24 28
	mov	rax, QWORD PTR -40[rbp]	# tmp112, this
	lea	rcx, 48[rax]	# _9,
# src/renderer/CameraController.cpp:24:         pitch = std::clamp(pitch, -1.4f, 1.4f);
	.loc 3 24 27
	lea	rdx, -24[rbp]	# tmp113,
	lea	rax, -28[rbp]	# tmp114,
	mov	rsi, rax	#, tmp114
	mov	rdi, rcx	#, _9
	call	_ZSt5clampIfERKT_S2_S2_S2_	#
# src/renderer/CameraController.cpp:24:         pitch = std::clamp(pitch, -1.4f, 1.4f);
	.loc 3 24 27 is_stmt 0 discriminator 2
	movss	xmm0, DWORD PTR [rax]	# _11, *_10
# src/renderer/CameraController.cpp:24:         pitch = std::clamp(pitch, -1.4f, 1.4f);
	.loc 3 24 15 is_stmt 1 discriminator 2
	mov	rax, QWORD PTR -40[rbp]	# tmp115, this
	movss	DWORD PTR 48[rax], xmm0	# this_26(D)->pitch, _11
.L9:
.LBE4:
.LBE3:
# src/renderer/CameraController.cpp:28:     float wheel = GetMouseWheelMove();
	.loc 3 28 36
	call	GetMouseWheelMove@PLT	#
	movd	eax, xmm0	# _41,
# src/renderer/CameraController.cpp:28:     float wheel = GetMouseWheelMove();
	.loc 3 28 36 is_stmt 0 discriminator 1
	mov	DWORD PTR -20[rbp], eax	# wheel, _41
# src/renderer/CameraController.cpp:30:     distance -= wheel * 1.5f;
	.loc 3 30 5 is_stmt 1
	mov	rax, QWORD PTR -40[rbp]	# tmp116, this
	movss	xmm0, DWORD PTR 52[rax]	# _12, this_26(D)->distance
# src/renderer/CameraController.cpp:30:     distance -= wheel * 1.5f;
	.loc 3 30 23
	movss	xmm2, DWORD PTR -20[rbp]	# tmp117, wheel
	movss	xmm1, DWORD PTR .LC10[rip]	# tmp118,
	mulss	xmm1, xmm2	# _13, tmp117
# src/renderer/CameraController.cpp:30:     distance -= wheel * 1.5f;
	.loc 3 30 14
	subss	xmm0, xmm1	# _14, _13
	mov	rax, QWORD PTR -40[rbp]	# tmp119, this
	movss	DWORD PTR 52[rax], xmm0	# this_26(D)->distance, _14
# src/renderer/CameraController.cpp:31:     distance = std::clamp(distance, 3.0f, 60.0f);
	.loc 3 31 43
	movss	xmm0, DWORD PTR .LC11[rip]	# tmp120,
	movss	DWORD PTR -16[rbp], xmm0	# MEM[(float *)_37], tmp120
# src/renderer/CameraController.cpp:31:     distance = std::clamp(distance, 3.0f, 60.0f);
	.loc 3 31 37
	movss	xmm0, DWORD PTR .LC12[rip]	# tmp121,
	movss	DWORD PTR -24[rbp], xmm0	# MEM[(float *)_20], tmp121
# src/renderer/CameraController.cpp:31:     distance = std::clamp(distance, 3.0f, 60.0f);
	.loc 3 31 27
	mov	rax, QWORD PTR -40[rbp]	# tmp122, this
	lea	rcx, 52[rax]	# _15,
# src/renderer/CameraController.cpp:31:     distance = std::clamp(distance, 3.0f, 60.0f);
	.loc 3 31 26
	lea	rdx, -16[rbp]	# tmp123,
	lea	rax, -24[rbp]	# tmp124,
	mov	rsi, rax	#, tmp124
	mov	rdi, rcx	#, _15
	call	_ZSt5clampIfERKT_S2_S2_S2_	#
# src/renderer/CameraController.cpp:31:     distance = std::clamp(distance, 3.0f, 60.0f);
	.loc 3 31 26 is_stmt 0 discriminator 2
	movss	xmm0, DWORD PTR [rax]	# _17, *_16
# src/renderer/CameraController.cpp:31:     distance = std::clamp(distance, 3.0f, 60.0f);
	.loc 3 31 14 is_stmt 1 discriminator 2
	mov	rax, QWORD PTR -40[rbp]	# tmp125, this
	movss	DWORD PTR 52[rax], xmm0	# this_26(D)->distance, _17
# src/renderer/CameraController.cpp:34:     if (IsKeyPressed(KEY_R)) {
	.loc 3 34 21
	mov	edi, 82	#,
	call	IsKeyPressed@PLT	#
# src/renderer/CameraController.cpp:34:     if (IsKeyPressed(KEY_R)) {
	.loc 3 34 5 discriminator 1
	test	al, al	# _52
	je	.L10	#,
# src/renderer/CameraController.cpp:35:         yaw = 0.785f;
	.loc 3 35 13
	mov	rax, QWORD PTR -40[rbp]	# tmp126, this
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp127,
	movss	DWORD PTR 44[rax], xmm0	# this_26(D)->yaw, tmp127
# src/renderer/CameraController.cpp:36:         pitch = 0.5f;
	.loc 3 36 15
	mov	rax, QWORD PTR -40[rbp]	# tmp128, this
	movss	xmm0, DWORD PTR .LC1[rip]	# tmp129,
	movss	DWORD PTR 48[rax], xmm0	# this_26(D)->pitch, tmp129
# src/renderer/CameraController.cpp:37:         distance = 18.0f;
	.loc 3 37 18
	mov	rax, QWORD PTR -40[rbp]	# tmp130, this
	movss	xmm0, DWORD PTR .LC2[rip]	# tmp131,
	movss	DWORD PTR 52[rax], xmm0	# this_26(D)->distance, tmp131
.L10:
# src/renderer/CameraController.cpp:40:     updatePosition();
	.loc 3 40 19
	mov	rax, QWORD PTR -40[rbp]	# tmp132, this
	mov	rdi, rax	#, tmp132
	call	_ZN16CameraController14updatePositionEv	#
# src/renderer/CameraController.cpp:41: }
	.loc 3 41 1
	nop	
	mov	rax, QWORD PTR -8[rbp]	# tmp134, D.49218
	sub	rax, QWORD PTR fs:40	# tmp134, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L11	#,
	call	__stack_chk_fail@PLT	#
.L11:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1835:
	.size	_ZN16CameraController6updateEv, .-_ZN16CameraController6updateEv
	.align 2
	.globl	_ZN16CameraController14updatePositionEv
	.type	_ZN16CameraController14updatePositionEv, @function
_ZN16CameraController14updatePositionEv:
.LFB1836:
	.loc 3 43 41
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -8[rbp], rdi	# this, this
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 31
	mov	rax, QWORD PTR -8[rbp]	# tmp106, this
	movss	xmm5, DWORD PTR 56[rax]	# _1, this_26(D)->target.x
	movss	DWORD PTR -12[rbp], xmm5	# %sfp, _1
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 35
	mov	rax, QWORD PTR -8[rbp]	# tmp107, this
	movss	xmm6, DWORD PTR 52[rax]	# _2, this_26(D)->distance
	movss	DWORD PTR -16[rbp], xmm6	# %sfp, _2
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 54
	mov	rax, QWORD PTR -8[rbp]	# tmp108, this
	mov	eax, DWORD PTR 48[rax]	# _3, this_26(D)->pitch
	movd	xmm0, eax	#, _3
	call	_ZSt3cosf	#
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 44 discriminator 1
	mulss	xmm0, DWORD PTR -16[rbp]	# _4, %sfp
	movss	DWORD PTR -16[rbp], xmm0	# %sfp, _4
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 72 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp109, this
	mov	eax, DWORD PTR 44[rax]	# _6, this_26(D)->yaw
	movd	xmm0, eax	#, _6
	call	_ZSt3sinf	#
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 62 discriminator 2
	mulss	xmm0, DWORD PTR -16[rbp]	# _8, %sfp
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 33 discriminator 2
	addss	xmm0, DWORD PTR -12[rbp]	# _8, %sfp
	movss	DWORD PTR -12[rbp], xmm0	# %sfp, _8
# src/renderer/CameraController.cpp:45:                        target.y + distance * std::sin(pitch),
	.loc 3 45 31
	mov	rax, QWORD PTR -8[rbp]	# tmp110, this
	movss	xmm7, DWORD PTR 60[rax]	# _10, this_26(D)->target.y
	movss	DWORD PTR -16[rbp], xmm7	# %sfp, _10
# src/renderer/CameraController.cpp:45:                        target.y + distance * std::sin(pitch),
	.loc 3 45 35
	mov	rax, QWORD PTR -8[rbp]	# tmp111, this
	movss	xmm1, DWORD PTR 52[rax]	# _11, this_26(D)->distance
	movss	DWORD PTR -20[rbp], xmm1	# %sfp, _11
# src/renderer/CameraController.cpp:45:                        target.y + distance * std::sin(pitch),
	.loc 3 45 54
	mov	rax, QWORD PTR -8[rbp]	# tmp112, this
	mov	eax, DWORD PTR 48[rax]	# _12, this_26(D)->pitch
	movd	xmm0, eax	#, _12
	call	_ZSt3sinf	#
# src/renderer/CameraController.cpp:45:                        target.y + distance * std::sin(pitch),
	.loc 3 45 44 discriminator 1
	mulss	xmm0, DWORD PTR -20[rbp]	# _14, %sfp
# src/renderer/CameraController.cpp:45:                        target.y + distance * std::sin(pitch),
	.loc 3 45 33 discriminator 1
	movaps	xmm3, xmm0	# _14, _14
	addss	xmm3, DWORD PTR -16[rbp]	# _14, %sfp
	movss	DWORD PTR -16[rbp], xmm3	# %sfp, _14
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 31
	mov	rax, QWORD PTR -8[rbp]	# tmp113, this
	movss	xmm5, DWORD PTR 64[rax]	# _16, this_26(D)->target.z
	movss	DWORD PTR -20[rbp], xmm5	# %sfp, _16
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 35
	mov	rax, QWORD PTR -8[rbp]	# tmp114, this
	movss	xmm6, DWORD PTR 52[rax]	# _17, this_26(D)->distance
	movss	DWORD PTR -24[rbp], xmm6	# %sfp, _17
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 54
	mov	rax, QWORD PTR -8[rbp]	# tmp115, this
	mov	eax, DWORD PTR 48[rax]	# _18, this_26(D)->pitch
	movd	xmm0, eax	#, _18
	call	_ZSt3cosf	#
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 44 discriminator 1
	movaps	xmm4, xmm0	# _19, _19
	mulss	xmm4, DWORD PTR -24[rbp]	# _19, %sfp
	movss	DWORD PTR -24[rbp], xmm4	# %sfp, _19
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 72 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp116, this
	mov	eax, DWORD PTR 44[rax]	# _21, this_26(D)->yaw
	movd	xmm0, eax	#, _21
	call	_ZSt3cosf	#
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 62 discriminator 2
	mulss	xmm0, DWORD PTR -24[rbp]	# _23, %sfp
# src/renderer/CameraController.cpp:46:                        target.z + distance * std::cos(pitch) * std::cos(yaw)};
	.loc 3 46 33 discriminator 2
	addss	xmm0, DWORD PTR -20[rbp]	# _24, %sfp
# src/renderer/CameraController.cpp:44:     camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
	.loc 3 44 21
	mov	rax, QWORD PTR -8[rbp]	# tmp117, this
	movss	xmm2, DWORD PTR -12[rbp]	# _9, %sfp
	movss	DWORD PTR [rax], xmm2	# this_26(D)->camera.position.x, _9
	mov	rax, QWORD PTR -8[rbp]	# tmp118, this
	movss	xmm3, DWORD PTR -16[rbp]	# _15, %sfp
	movss	DWORD PTR 4[rax], xmm3	# this_26(D)->camera.position.y, _15
	mov	rax, QWORD PTR -8[rbp]	# tmp119, this
	movss	DWORD PTR 8[rax], xmm0	# this_26(D)->camera.position.z, _24
# src/renderer/CameraController.cpp:48:     camera.target = target;
	.loc 3 48 19
	mov	rax, QWORD PTR -8[rbp]	# tmp120, this
	mov	rdx, QWORD PTR -8[rbp]	# tmp121, this
	mov	rcx, QWORD PTR 56[rdx]	# tmp122, this_26(D)->target
	mov	QWORD PTR 12[rax], rcx	# this_26(D)->camera.target, tmp122
	mov	edx, DWORD PTR 64[rdx]	# tmp123, this_26(D)->target
	mov	DWORD PTR 20[rax], edx	# this_26(D)->camera.target, tmp123
# src/renderer/CameraController.cpp:49: }
	.loc 3 49 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1836:
	.size	_ZN16CameraController14updatePositionEv, .-_ZN16CameraController14updatePositionEv
	.align 2
	.globl	_ZNK16CameraController9getCameraEv
	.type	_ZNK16CameraController9getCameraEv, @function
_ZNK16CameraController9getCameraEv:
.LFB1837:
	.loc 3 51 53
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi	# this, this
# src/renderer/CameraController.cpp:51: const Camera3D &CameraController::getCamera() const { return camera; }
	.loc 3 51 62
	mov	rax, QWORD PTR -8[rbp]	# _2, this
# src/renderer/CameraController.cpp:51: const Camera3D &CameraController::getCamera() const { return camera; }
	.loc 3 51 70
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1837:
	.size	_ZNK16CameraController9getCameraEv, .-_ZNK16CameraController9getCameraEv
	.section	.text._ZSt5clampIfERKT_S2_S2_S2_,"axG",@progbits,_ZSt5clampIfERKT_S2_S2_S2_,comdat
	.weak	_ZSt5clampIfERKT_S2_S2_S2_
	.type	_ZSt5clampIfERKT_S2_S2_S2_, @function
_ZSt5clampIfERKT_S2_S2_S2_:
.LFB1892:
	.file 4 "/usr/include/c++/13/bits/stl_algo.h"
	.loc 4 3667 5
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -8[rbp], rdi	# __val, __val
	mov	QWORD PTR -16[rbp], rsi	# __lo, __lo
	mov	QWORD PTR -24[rbp], rdx	# __hi, __hi
# /usr/include/c++/13/bits/stl_algo.h:3669:       __glibcxx_assert(!(__hi < __lo));
	.loc 4 3669 7
	call	_ZSt23__is_constant_evaluatedv	#
# /usr/include/c++/13/bits/stl_algo.h:3669:       __glibcxx_assert(!(__hi < __lo));
	.loc 4 3669 7 is_stmt 0 discriminator 1
	test	al, al	# _1
	je	.L16	#,
	mov	rax, QWORD PTR -24[rbp]	# tmp89, __hi
	movss	xmm1, DWORD PTR [rax]	# _2, *__hi_8(D)
	mov	rax, QWORD PTR -16[rbp]	# tmp90, __lo
	movss	xmm0, DWORD PTR [rax]	# _3, *__lo_9(D)
	comiss	xmm0, xmm1	# _3, _2
	jbe	.L16	#,
# /usr/include/c++/13/bits/stl_algo.h:3669:       __glibcxx_assert(!(__hi < __lo));
	.loc 4 3669 7 discriminator 3
	mov	eax, 1	# iftmp.3_5,
# /usr/include/c++/13/bits/stl_algo.h:3669:       __glibcxx_assert(!(__hi < __lo));
	.loc 4 3669 7
	jmp	.L18	#
.L16:
# /usr/include/c++/13/bits/stl_algo.h:3669:       __glibcxx_assert(!(__hi < __lo));
	.loc 4 3669 7 discriminator 4
	mov	eax, 0	# iftmp.3_5,
.L18:
# /usr/include/c++/13/bits/stl_algo.h:3669:       __glibcxx_assert(!(__hi < __lo));
	.loc 4 3669 7 discriminator 6
	test	al, al	# iftmp.3_5
# /usr/include/c++/13/bits/stl_algo.h:3670:       return std::min(std::max(__val, __lo), __hi);
	.loc 4 3670 22 is_stmt 1
	mov	rdx, QWORD PTR -16[rbp]	# tmp91, __lo
	mov	rax, QWORD PTR -8[rbp]	# tmp92, __val
	mov	rsi, rdx	#, tmp91
	mov	rdi, rax	#, tmp92
	call	_ZSt3maxIfERKT_S2_S2_	#
	mov	rdx, rax	# _4,
# /usr/include/c++/13/bits/stl_algo.h:3670:       return std::min(std::max(__val, __lo), __hi);
	.loc 4 3670 22 is_stmt 0 discriminator 1
	mov	rax, QWORD PTR -24[rbp]	# tmp93, __hi
	mov	rsi, rax	#, tmp93
	mov	rdi, rdx	#, _4
	call	_ZSt3minIfERKT_S2_S2_	#
# /usr/include/c++/13/bits/stl_algo.h:3671:     }
	.loc 4 3671 5 is_stmt 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1892:
	.size	_ZSt5clampIfERKT_S2_S2_S2_, .-_ZSt5clampIfERKT_S2_S2_S2_
	.section	.text._ZSt3maxIfERKT_S2_S2_,"axG",@progbits,_ZSt3maxIfERKT_S2_S2_,comdat
	.weak	_ZSt3maxIfERKT_S2_S2_
	.type	_ZSt3maxIfERKT_S2_S2_, @function
_ZSt3maxIfERKT_S2_S2_:
.LFB1931:
	.file 5 "/usr/include/c++/13/bits/stl_algobase.h"
	.loc 5 257 5
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi	# __a, __a
	mov	QWORD PTR -16[rbp], rsi	# __b, __b
# /usr/include/c++/13/bits/stl_algobase.h:262:       if (__a < __b)
	.loc 5 262 15
	mov	rax, QWORD PTR -8[rbp]	# tmp86, __a
	movss	xmm1, DWORD PTR [rax]	# _1, *__a_5(D)
	mov	rax, QWORD PTR -16[rbp]	# tmp87, __b
	movss	xmm0, DWORD PTR [rax]	# _2, *__b_6(D)
# /usr/include/c++/13/bits/stl_algobase.h:262:       if (__a < __b)
	.loc 5 262 7
	comiss	xmm0, xmm1	# _2, _1
	jbe	.L27	#,
# /usr/include/c++/13/bits/stl_algobase.h:263: 	return __b;
	.loc 5 263 9
	mov	rax, QWORD PTR -16[rbp]	# _3, __b
	jmp	.L25	#
.L27:
# /usr/include/c++/13/bits/stl_algobase.h:264:       return __a;
	.loc 5 264 14
	mov	rax, QWORD PTR -8[rbp]	# _3, __a
.L25:
# /usr/include/c++/13/bits/stl_algobase.h:265:     }
	.loc 5 265 5
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1931:
	.size	_ZSt3maxIfERKT_S2_S2_, .-_ZSt3maxIfERKT_S2_S2_
	.section	.text._ZSt3minIfERKT_S2_S2_,"axG",@progbits,_ZSt3minIfERKT_S2_S2_,comdat
	.weak	_ZSt3minIfERKT_S2_S2_
	.type	_ZSt3minIfERKT_S2_S2_, @function
_ZSt3minIfERKT_S2_S2_:
.LFB1932:
	.loc 5 233 5
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi	# __a, __a
	mov	QWORD PTR -16[rbp], rsi	# __b, __b
# /usr/include/c++/13/bits/stl_algobase.h:238:       if (__b < __a)
	.loc 5 238 15
	mov	rax, QWORD PTR -16[rbp]	# tmp86, __b
	movss	xmm1, DWORD PTR [rax]	# _1, *__b_5(D)
	mov	rax, QWORD PTR -8[rbp]	# tmp87, __a
	movss	xmm0, DWORD PTR [rax]	# _2, *__a_6(D)
# /usr/include/c++/13/bits/stl_algobase.h:238:       if (__b < __a)
	.loc 5 238 7
	comiss	xmm0, xmm1	# _2, _1
	jbe	.L33	#,
# /usr/include/c++/13/bits/stl_algobase.h:239: 	return __b;
	.loc 5 239 9
	mov	rax, QWORD PTR -16[rbp]	# _3, __b
	jmp	.L31	#
.L33:
# /usr/include/c++/13/bits/stl_algobase.h:240:       return __a;
	.loc 5 240 14
	mov	rax, QWORD PTR -8[rbp]	# _3, __a
.L31:
# /usr/include/c++/13/bits/stl_algobase.h:241:     }
	.loc 5 241 5
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1932:
	.size	_ZSt3minIfERKT_S2_S2_, .-_ZSt3minIfERKT_S2_S2_
	.section	.rodata
	.align 4
.LC0:
	.long	1061746115
	.align 4
.LC1:
	.long	1056964608
	.align 4
.LC2:
	.long	1099956224
	.align 4
.LC4:
	.long	1075838976
	.align 4
.LC5:
	.long	1065353216
	.align 4
.LC6:
	.long	1110704128
	.align 4
.LC7:
	.long	1000593162
	.align 4
.LC8:
	.long	1068708659
	.align 4
.LC9:
	.long	-1078774989
	.align 4
.LC10:
	.long	1069547520
	.align 4
.LC11:
	.long	1114636288
	.align 4
.LC12:
	.long	1077936128
	.text
.Letext0:
	.file 6 "/usr/local/include/raylib.h"
	.file 7 "src/renderer/CameraController.h"
	.file 8 "/usr/include/c++/13/type_traits"
	.file 9 "/usr/include/c++/13/concepts"
	.file 10 "/usr/include/c++/13/bits/iterator_concepts.h"
	.file 11 "/usr/include/c++/13/bits/ranges_cmp.h"
	.file 12 "/usr/include/c++/13/compare"
	.file 13 "/usr/include/c++/13/debug/debug.h"
	.file 14 "/usr/include/c++/13/cstdlib"
	.file 15 "/usr/include/c++/13/numbers"
	.file 16 "/usr/include/c++/13/bits/predefined_ops.h"
	.file 17 "/usr/include/c++/13/bits/ptr_traits.h"
	.file 18 "/usr/lib/gcc/x86_64-linux-gnu/13/include/stddef.h"
	.file 19 "/usr/include/stdlib.h"
	.file 20 "/usr/include/c++/13/pstl/execution_defs.h"
	.file 21 "/usr/include/math.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xf29
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x26
	.long	.LASF242
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x27
	.byte	0x8
	.uleb128 0x1e
	.long	.LASF5
	.byte	0x8
	.byte	0xd8
	.long	0x5c
	.uleb128 0x8
	.string	"x"
	.byte	0x6
	.byte	0xd9
	.byte	0xb
	.long	0x5c
	.byte	0
	.uleb128 0x8
	.string	"y"
	.byte	0x6
	.byte	0xda
	.byte	0xb
	.long	0x5c
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF4
	.uleb128 0xb
	.long	0x5c
	.uleb128 0x9
	.long	.LASF5
	.byte	0x6
	.byte	0xdb
	.byte	0x3
	.long	0x3a
	.uleb128 0x1e
	.long	.LASF6
	.byte	0xc
	.byte	0xde
	.long	0xa1
	.uleb128 0x8
	.string	"x"
	.byte	0x6
	.byte	0xdf
	.byte	0xb
	.long	0x5c
	.byte	0
	.uleb128 0x8
	.string	"y"
	.byte	0x6
	.byte	0xe0
	.byte	0xb
	.long	0x5c
	.byte	0x4
	.uleb128 0x8
	.string	"z"
	.byte	0x6
	.byte	0xe1
	.byte	0xb
	.long	0x5c
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF6
	.byte	0x6
	.byte	0xe2
	.byte	0x3
	.long	0x74
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x28
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x29
	.long	.LASF8
	.byte	0x2c
	.byte	0x6
	.value	0x147
	.byte	0x10
	.long	0x10b
	.uleb128 0x11
	.long	.LASF9
	.value	0x148
	.byte	0xd
	.long	0xa1
	.byte	0
	.uleb128 0x11
	.long	.LASF10
	.value	0x149
	.byte	0xd
	.long	0xa1
	.byte	0xc
	.uleb128 0x2a
	.string	"up"
	.byte	0x6
	.value	0x14a
	.byte	0xd
	.long	0xa1
	.byte	0x18
	.uleb128 0x11
	.long	.LASF11
	.value	0x14b
	.byte	0xb
	.long	0x5c
	.byte	0x24
	.uleb128 0x11
	.long	.LASF12
	.value	0x14c
	.byte	0x9
	.long	0xb4
	.byte	0x28
	.byte	0
	.uleb128 0x12
	.long	.LASF8
	.byte	0x6
	.value	0x14d
	.byte	0x3
	.long	0xbb
	.uleb128 0xb
	.long	0x10b
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0xb
	.long	0x124
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.long	.LASF15
	.uleb128 0x7
	.long	0x13c
	.uleb128 0x7
	.long	0x124
	.uleb128 0x1f
	.long	0x31
	.value	0x24d
	.long	.LASF127
	.long	0x41e
	.uleb128 0x2
	.long	.LASF16
	.byte	0
	.uleb128 0x2
	.long	.LASF17
	.byte	0x27
	.uleb128 0x2
	.long	.LASF18
	.byte	0x2c
	.uleb128 0x2
	.long	.LASF19
	.byte	0x2d
	.uleb128 0x2
	.long	.LASF20
	.byte	0x2e
	.uleb128 0x2
	.long	.LASF21
	.byte	0x2f
	.uleb128 0x2
	.long	.LASF22
	.byte	0x30
	.uleb128 0x2
	.long	.LASF23
	.byte	0x31
	.uleb128 0x2
	.long	.LASF24
	.byte	0x32
	.uleb128 0x2
	.long	.LASF25
	.byte	0x33
	.uleb128 0x2
	.long	.LASF26
	.byte	0x34
	.uleb128 0x2
	.long	.LASF27
	.byte	0x35
	.uleb128 0x2
	.long	.LASF28
	.byte	0x36
	.uleb128 0x2
	.long	.LASF29
	.byte	0x37
	.uleb128 0x2
	.long	.LASF30
	.byte	0x38
	.uleb128 0x2
	.long	.LASF31
	.byte	0x39
	.uleb128 0x2
	.long	.LASF32
	.byte	0x3b
	.uleb128 0x2
	.long	.LASF33
	.byte	0x3d
	.uleb128 0x2
	.long	.LASF34
	.byte	0x41
	.uleb128 0x2
	.long	.LASF35
	.byte	0x42
	.uleb128 0x2
	.long	.LASF36
	.byte	0x43
	.uleb128 0x2
	.long	.LASF37
	.byte	0x44
	.uleb128 0x2
	.long	.LASF38
	.byte	0x45
	.uleb128 0x2
	.long	.LASF39
	.byte	0x46
	.uleb128 0x2
	.long	.LASF40
	.byte	0x47
	.uleb128 0x2
	.long	.LASF41
	.byte	0x48
	.uleb128 0x2
	.long	.LASF42
	.byte	0x49
	.uleb128 0x2
	.long	.LASF43
	.byte	0x4a
	.uleb128 0x2
	.long	.LASF44
	.byte	0x4b
	.uleb128 0x2
	.long	.LASF45
	.byte	0x4c
	.uleb128 0x2
	.long	.LASF46
	.byte	0x4d
	.uleb128 0x2
	.long	.LASF47
	.byte	0x4e
	.uleb128 0x2
	.long	.LASF48
	.byte	0x4f
	.uleb128 0x2
	.long	.LASF49
	.byte	0x50
	.uleb128 0x2
	.long	.LASF50
	.byte	0x51
	.uleb128 0x2
	.long	.LASF51
	.byte	0x52
	.uleb128 0x2
	.long	.LASF52
	.byte	0x53
	.uleb128 0x2
	.long	.LASF53
	.byte	0x54
	.uleb128 0x2
	.long	.LASF54
	.byte	0x55
	.uleb128 0x2
	.long	.LASF55
	.byte	0x56
	.uleb128 0x2
	.long	.LASF56
	.byte	0x57
	.uleb128 0x2
	.long	.LASF57
	.byte	0x58
	.uleb128 0x2
	.long	.LASF58
	.byte	0x59
	.uleb128 0x2
	.long	.LASF59
	.byte	0x5a
	.uleb128 0x2
	.long	.LASF60
	.byte	0x5b
	.uleb128 0x2
	.long	.LASF61
	.byte	0x5c
	.uleb128 0x2
	.long	.LASF62
	.byte	0x5d
	.uleb128 0x2
	.long	.LASF63
	.byte	0x60
	.uleb128 0x2
	.long	.LASF64
	.byte	0x20
	.uleb128 0x3
	.long	.LASF65
	.value	0x100
	.uleb128 0x3
	.long	.LASF66
	.value	0x101
	.uleb128 0x3
	.long	.LASF67
	.value	0x102
	.uleb128 0x3
	.long	.LASF68
	.value	0x103
	.uleb128 0x3
	.long	.LASF69
	.value	0x104
	.uleb128 0x3
	.long	.LASF70
	.value	0x105
	.uleb128 0x3
	.long	.LASF71
	.value	0x106
	.uleb128 0x3
	.long	.LASF72
	.value	0x107
	.uleb128 0x3
	.long	.LASF73
	.value	0x108
	.uleb128 0x3
	.long	.LASF74
	.value	0x109
	.uleb128 0x3
	.long	.LASF75
	.value	0x10a
	.uleb128 0x3
	.long	.LASF76
	.value	0x10b
	.uleb128 0x3
	.long	.LASF77
	.value	0x10c
	.uleb128 0x3
	.long	.LASF78
	.value	0x10d
	.uleb128 0x3
	.long	.LASF79
	.value	0x118
	.uleb128 0x3
	.long	.LASF80
	.value	0x119
	.uleb128 0x3
	.long	.LASF81
	.value	0x11a
	.uleb128 0x3
	.long	.LASF82
	.value	0x11b
	.uleb128 0x3
	.long	.LASF83
	.value	0x11c
	.uleb128 0x3
	.long	.LASF84
	.value	0x122
	.uleb128 0x3
	.long	.LASF85
	.value	0x123
	.uleb128 0x3
	.long	.LASF86
	.value	0x124
	.uleb128 0x3
	.long	.LASF87
	.value	0x125
	.uleb128 0x3
	.long	.LASF88
	.value	0x126
	.uleb128 0x3
	.long	.LASF89
	.value	0x127
	.uleb128 0x3
	.long	.LASF90
	.value	0x128
	.uleb128 0x3
	.long	.LASF91
	.value	0x129
	.uleb128 0x3
	.long	.LASF92
	.value	0x12a
	.uleb128 0x3
	.long	.LASF93
	.value	0x12b
	.uleb128 0x3
	.long	.LASF94
	.value	0x12c
	.uleb128 0x3
	.long	.LASF95
	.value	0x12d
	.uleb128 0x3
	.long	.LASF96
	.value	0x154
	.uleb128 0x3
	.long	.LASF97
	.value	0x155
	.uleb128 0x3
	.long	.LASF98
	.value	0x156
	.uleb128 0x3
	.long	.LASF99
	.value	0x157
	.uleb128 0x3
	.long	.LASF100
	.value	0x158
	.uleb128 0x3
	.long	.LASF101
	.value	0x159
	.uleb128 0x3
	.long	.LASF102
	.value	0x15a
	.uleb128 0x3
	.long	.LASF103
	.value	0x15b
	.uleb128 0x3
	.long	.LASF104
	.value	0x15c
	.uleb128 0x3
	.long	.LASF105
	.value	0x140
	.uleb128 0x3
	.long	.LASF106
	.value	0x141
	.uleb128 0x3
	.long	.LASF107
	.value	0x142
	.uleb128 0x3
	.long	.LASF108
	.value	0x143
	.uleb128 0x3
	.long	.LASF109
	.value	0x144
	.uleb128 0x3
	.long	.LASF110
	.value	0x145
	.uleb128 0x3
	.long	.LASF111
	.value	0x146
	.uleb128 0x3
	.long	.LASF112
	.value	0x147
	.uleb128 0x3
	.long	.LASF113
	.value	0x148
	.uleb128 0x3
	.long	.LASF114
	.value	0x149
	.uleb128 0x3
	.long	.LASF115
	.value	0x14a
	.uleb128 0x3
	.long	.LASF116
	.value	0x14b
	.uleb128 0x3
	.long	.LASF117
	.value	0x14c
	.uleb128 0x3
	.long	.LASF118
	.value	0x14d
	.uleb128 0x3
	.long	.LASF119
	.value	0x14e
	.uleb128 0x3
	.long	.LASF120
	.value	0x14f
	.uleb128 0x3
	.long	.LASF121
	.value	0x150
	.uleb128 0x2
	.long	.LASF122
	.byte	0x4
	.uleb128 0x2
	.long	.LASF123
	.byte	0x5
	.uleb128 0x2
	.long	.LASF124
	.byte	0x18
	.uleb128 0x2
	.long	.LASF125
	.byte	0x19
	.byte	0
	.uleb128 0x12
	.long	.LASF126
	.byte	0x6
	.value	0x2c0
	.byte	0x3
	.long	0x141
	.uleb128 0x1f
	.long	0x31
	.value	0x2c8
	.long	.LASF128
	.long	0x465
	.uleb128 0x2
	.long	.LASF129
	.byte	0
	.uleb128 0x2
	.long	.LASF130
	.byte	0x1
	.uleb128 0x2
	.long	.LASF131
	.byte	0x2
	.uleb128 0x2
	.long	.LASF132
	.byte	0x3
	.uleb128 0x2
	.long	.LASF133
	.byte	0x4
	.uleb128 0x2
	.long	.LASF134
	.byte	0x5
	.uleb128 0x2
	.long	.LASF135
	.byte	0x6
	.byte	0
	.uleb128 0x12
	.long	.LASF136
	.byte	0x6
	.value	0x2d0
	.byte	0x3
	.long	0x42b
	.uleb128 0x7
	.long	0x12b
	.uleb128 0x7
	.long	0x47c
	.uleb128 0x2b
	.uleb128 0x2c
	.long	.LASF140
	.byte	0x44
	.byte	0x7
	.byte	0x5
	.byte	0x7
	.long	0x533
	.uleb128 0xc
	.long	.LASF137
	.byte	0x7
	.byte	0x7
	.byte	0xe
	.long	0x10b
	.byte	0
	.uleb128 0x8
	.string	"yaw"
	.byte	0x7
	.byte	0x8
	.byte	0xb
	.long	0x5c
	.byte	0x2c
	.uleb128 0xc
	.long	.LASF138
	.byte	0x7
	.byte	0x9
	.byte	0xb
	.long	0x5c
	.byte	0x30
	.uleb128 0xc
	.long	.LASF139
	.byte	0x7
	.byte	0xa
	.byte	0xb
	.long	0x5c
	.byte	0x34
	.uleb128 0xc
	.long	.LASF10
	.byte	0x7
	.byte	0xc
	.byte	0xd
	.long	0xa1
	.byte	0x38
	.uleb128 0x2d
	.long	.LASF160
	.byte	0x7
	.byte	0xe
	.byte	0xa
	.long	.LASF162
	.long	0x4df
	.long	0x4e5
	.uleb128 0x13
	.long	0x538
	.byte	0
	.uleb128 0x20
	.long	.LASF140
	.byte	0x11
	.byte	0x5
	.long	.LASF142
	.long	0x4f8
	.long	0x4fe
	.uleb128 0x13
	.long	0x538
	.byte	0
	.uleb128 0x20
	.long	.LASF141
	.byte	0x12
	.byte	0xa
	.long	.LASF143
	.long	0x511
	.long	0x517
	.uleb128 0x13
	.long	0x538
	.byte	0
	.uleb128 0x2e
	.long	.LASF144
	.byte	0x7
	.byte	0x13
	.byte	0x15
	.long	.LASF145
	.long	0x542
	.byte	0x1
	.long	0x52c
	.uleb128 0x13
	.long	0x547
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x47d
	.uleb128 0x7
	.long	0x47d
	.uleb128 0xb
	.long	0x538
	.uleb128 0x21
	.long	0x118
	.uleb128 0x7
	.long	0x533
	.uleb128 0xb
	.long	0x547
	.uleb128 0x2f
	.string	"std"
	.byte	0x1
	.value	0x132
	.byte	0xb
	.long	0x79b
	.uleb128 0xf
	.long	.LASF146
	.byte	0x8
	.value	0xab0
	.byte	0xd
	.uleb128 0xf
	.long	.LASF147
	.byte	0x8
	.value	0xb06
	.byte	0xd
	.uleb128 0x14
	.long	.LASF148
	.byte	0x9
	.byte	0xb3
	.byte	0xd
	.long	0x5af
	.uleb128 0xa
	.long	.LASF149
	.byte	0x9
	.byte	0xb5
	.byte	0xf
	.uleb128 0x30
	.long	.LASF156
	.byte	0x9
	.byte	0xf1
	.byte	0x16
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa
	.byte	0x64
	.byte	0xf
	.uleb128 0xf
	.long	.LASF151
	.byte	0xa
	.value	0x343
	.byte	0xd
	.uleb128 0xf
	.long	.LASF152
	.byte	0xa
	.value	0x3c3
	.byte	0x15
	.uleb128 0xa
	.long	.LASF153
	.byte	0xb
	.byte	0x44
	.byte	0xd
	.byte	0
	.uleb128 0xa
	.long	.LASF154
	.byte	0xc
	.byte	0x2f
	.byte	0xd
	.uleb128 0xa
	.long	.LASF153
	.byte	0x8
	.byte	0x91
	.byte	0xd
	.uleb128 0xf
	.long	.LASF155
	.byte	0xc
	.value	0x239
	.byte	0xd
	.uleb128 0x31
	.long	.LASF157
	.byte	0xc
	.value	0x49a
	.byte	0x14
	.uleb128 0xa
	.long	.LASF158
	.byte	0xd
	.byte	0x32
	.byte	0xd
	.uleb128 0x4
	.byte	0x83
	.byte	0xb
	.long	0x89d
	.uleb128 0x4
	.byte	0x84
	.byte	0xb
	.long	0x8cf
	.uleb128 0x4
	.byte	0x8a
	.byte	0xb
	.long	0x933
	.uleb128 0x4
	.byte	0x8d
	.byte	0xb
	.long	0x950
	.uleb128 0x4
	.byte	0x90
	.byte	0xb
	.long	0x96b
	.uleb128 0x4
	.byte	0x91
	.byte	0xb
	.long	0x980
	.uleb128 0x4
	.byte	0x92
	.byte	0xb
	.long	0x995
	.uleb128 0x4
	.byte	0x93
	.byte	0xb
	.long	0x9aa
	.uleb128 0x4
	.byte	0x95
	.byte	0xb
	.long	0x9d5
	.uleb128 0x4
	.byte	0x98
	.byte	0xb
	.long	0x9f1
	.uleb128 0x4
	.byte	0x9a
	.byte	0xb
	.long	0xa08
	.uleb128 0x4
	.byte	0x9d
	.byte	0xb
	.long	0xa24
	.uleb128 0x4
	.byte	0x9e
	.byte	0xb
	.long	0xa40
	.uleb128 0x4
	.byte	0x9f
	.byte	0xb
	.long	0xa66
	.uleb128 0x4
	.byte	0xa1
	.byte	0xb
	.long	0xa87
	.uleb128 0x4
	.byte	0xa4
	.byte	0xb
	.long	0xaa7
	.uleb128 0x4
	.byte	0xa7
	.byte	0xb
	.long	0xaba
	.uleb128 0x4
	.byte	0xa9
	.byte	0xb
	.long	0xac7
	.uleb128 0x4
	.byte	0xaa
	.byte	0xb
	.long	0xad8
	.uleb128 0x4
	.byte	0xab
	.byte	0xb
	.long	0xaf2
	.uleb128 0x4
	.byte	0xac
	.byte	0xb
	.long	0xb16
	.uleb128 0x4
	.byte	0xad
	.byte	0xb
	.long	0xb3a
	.uleb128 0x4
	.byte	0xaf
	.byte	0xb
	.long	0xb51
	.uleb128 0x4
	.byte	0xb0
	.byte	0xb
	.long	0xb77
	.uleb128 0x4
	.byte	0xf4
	.byte	0x16
	.long	0x901
	.uleb128 0x4
	.byte	0xf9
	.byte	0x16
	.long	0x7e1
	.uleb128 0x4
	.byte	0xfa
	.byte	0x16
	.long	0xb93
	.uleb128 0x4
	.byte	0xfc
	.byte	0x16
	.long	0xbaf
	.uleb128 0x4
	.byte	0xfd
	.byte	0x16
	.long	0xc0c
	.uleb128 0x4
	.byte	0xfe
	.byte	0x16
	.long	0xbc4
	.uleb128 0x4
	.byte	0xff
	.byte	0x16
	.long	0xbe8
	.uleb128 0x15
	.byte	0xe
	.value	0x100
	.byte	0x16
	.long	0xc26
	.uleb128 0xa
	.long	.LASF159
	.byte	0xf
	.byte	0x30
	.byte	0xb
	.uleb128 0x15
	.byte	0x2
	.value	0x759
	.byte	0xb
	.long	0xc70
	.uleb128 0x15
	.byte	0x2
	.value	0x75a
	.byte	0xb
	.long	0xc64
	.uleb128 0x10
	.long	.LASF161
	.byte	0x5
	.byte	0xe9
	.byte	0x5
	.long	.LASF163
	.long	0xce7
	.long	0x6fd
	.uleb128 0xe
	.string	"_Tp"
	.long	0x5c
	.uleb128 0x1
	.long	0xce7
	.uleb128 0x1
	.long	0xce7
	.byte	0
	.uleb128 0x16
	.long	.LASF164
	.byte	0x5
	.value	0x101
	.byte	0x5
	.long	.LASF166
	.long	0xce7
	.long	0x726
	.uleb128 0xe
	.string	"_Tp"
	.long	0x5c
	.uleb128 0x1
	.long	0xce7
	.uleb128 0x1
	.long	0xce7
	.byte	0
	.uleb128 0x16
	.long	.LASF165
	.byte	0x4
	.value	0xe53
	.byte	0x5
	.long	.LASF167
	.long	0xce7
	.long	0x754
	.uleb128 0xe
	.string	"_Tp"
	.long	0x5c
	.uleb128 0x1
	.long	0xce7
	.uleb128 0x1
	.long	0xce7
	.uleb128 0x1
	.long	0xce7
	.byte	0
	.uleb128 0x32
	.string	"sin"
	.byte	0x2
	.value	0x190
	.byte	0x3
	.long	.LASF243
	.long	0x5c
	.long	0x76f
	.uleb128 0x1
	.long	0x5c
	.byte	0
	.uleb128 0x33
	.string	"cos"
	.byte	0x2
	.byte	0xb1
	.byte	0x3
	.long	.LASF244
	.long	0x5c
	.long	0x789
	.uleb128 0x1
	.long	0x5c
	.byte	0
	.uleb128 0x34
	.long	.LASF245
	.byte	0x1
	.value	0x21c
	.byte	0x3
	.long	.LASF246
	.long	0x130
	.byte	0
	.uleb128 0x35
	.long	.LASF168
	.byte	0x1
	.value	0x157
	.byte	0xb
	.long	0x7fd
	.uleb128 0xa
	.long	.LASF169
	.byte	0x10
	.byte	0x25
	.byte	0xb
	.uleb128 0x4
	.byte	0xcc
	.byte	0xb
	.long	0x901
	.uleb128 0x4
	.byte	0xdc
	.byte	0xb
	.long	0xb93
	.uleb128 0x4
	.byte	0xe7
	.byte	0xb
	.long	0xbaf
	.uleb128 0x4
	.byte	0xe8
	.byte	0xb
	.long	0xbc4
	.uleb128 0x4
	.byte	0xe9
	.byte	0xb
	.long	0xbe8
	.uleb128 0x4
	.byte	0xeb
	.byte	0xb
	.long	0xc0c
	.uleb128 0x4
	.byte	0xec
	.byte	0xb
	.long	0xc26
	.uleb128 0x36
	.string	"div"
	.byte	0xe
	.byte	0xd9
	.byte	0x3
	.long	.LASF247
	.long	0x901
	.uleb128 0x1
	.long	0x819
	.uleb128 0x1
	.long	0x819
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF170
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF171
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF172
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF173
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF174
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF175
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF176
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.long	.LASF177
	.uleb128 0xb
	.long	0x82e
	.uleb128 0x5
	.byte	0x1
	.byte	0x10
	.long	.LASF178
	.uleb128 0x5
	.byte	0x2
	.byte	0x10
	.long	.LASF179
	.uleb128 0x5
	.byte	0x4
	.byte	0x10
	.long	.LASF180
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF181
	.uleb128 0x14
	.long	.LASF182
	.byte	0x11
	.byte	0x2e
	.byte	0xb
	.long	0x86b
	.uleb128 0x37
	.byte	0xd
	.byte	0x3a
	.byte	0x18
	.long	0x5d1
	.byte	0
	.uleb128 0x9
	.long	.LASF183
	.byte	0x12
	.byte	0xd6
	.byte	0x17
	.long	0x2a
	.uleb128 0x17
	.byte	0x8
	.byte	0x3c
	.long	.LASF186
	.long	0x89d
	.uleb128 0xc
	.long	.LASF184
	.byte	0x13
	.byte	0x3d
	.byte	0x9
	.long	0xb4
	.byte	0
	.uleb128 0x8
	.string	"rem"
	.byte	0x13
	.byte	0x3e
	.byte	0x9
	.long	0xb4
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.long	.LASF185
	.byte	0x13
	.byte	0x3f
	.byte	0x5
	.long	0x877
	.uleb128 0x17
	.byte	0x10
	.byte	0x44
	.long	.LASF187
	.long	0x8cf
	.uleb128 0xc
	.long	.LASF184
	.byte	0x13
	.byte	0x45
	.byte	0xe
	.long	0x812
	.byte	0
	.uleb128 0x8
	.string	"rem"
	.byte	0x13
	.byte	0x46
	.byte	0xe
	.long	0x812
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF188
	.byte	0x13
	.byte	0x47
	.byte	0x5
	.long	0x8a9
	.uleb128 0x17
	.byte	0x10
	.byte	0x4e
	.long	.LASF189
	.long	0x901
	.uleb128 0xc
	.long	.LASF184
	.byte	0x13
	.byte	0x4f
	.byte	0x13
	.long	0x819
	.byte	0
	.uleb128 0x8
	.string	"rem"
	.byte	0x13
	.byte	0x50
	.byte	0x13
	.long	0x819
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF190
	.byte	0x13
	.byte	0x51
	.byte	0x5
	.long	0x8db
	.uleb128 0x12
	.long	.LASF191
	.byte	0x13
	.value	0x3b4
	.byte	0xf
	.long	0x91a
	.uleb128 0x7
	.long	0x91f
	.uleb128 0x38
	.long	0xb4
	.long	0x933
	.uleb128 0x1
	.long	0x477
	.uleb128 0x1
	.long	0x477
	.byte	0
	.uleb128 0x6
	.long	.LASF192
	.byte	0x13
	.value	0x2de
	.byte	0xc
	.long	0xb4
	.long	0x94a
	.uleb128 0x1
	.long	0x94a
	.byte	0
	.uleb128 0x7
	.long	0x94f
	.uleb128 0x39
	.uleb128 0x16
	.long	.LASF193
	.byte	0x13
	.value	0x2e3
	.byte	0x12
	.long	.LASF193
	.long	0xb4
	.long	0x96b
	.uleb128 0x1
	.long	0x94a
	.byte	0
	.uleb128 0xd
	.long	.LASF194
	.byte	0x66
	.byte	0xf
	.long	0x827
	.long	0x980
	.uleb128 0x1
	.long	0x472
	.byte	0
	.uleb128 0xd
	.long	.LASF195
	.byte	0x69
	.byte	0xc
	.long	0xb4
	.long	0x995
	.uleb128 0x1
	.long	0x472
	.byte	0
	.uleb128 0xd
	.long	.LASF196
	.byte	0x6c
	.byte	0x11
	.long	0x812
	.long	0x9aa
	.uleb128 0x1
	.long	0x472
	.byte	0
	.uleb128 0x6
	.long	.LASF197
	.byte	0x13
	.value	0x3c0
	.byte	0xe
	.long	0x38
	.long	0x9d5
	.uleb128 0x1
	.long	0x477
	.uleb128 0x1
	.long	0x477
	.uleb128 0x1
	.long	0x86b
	.uleb128 0x1
	.long	0x86b
	.uleb128 0x1
	.long	0x90d
	.byte	0
	.uleb128 0x3a
	.string	"div"
	.byte	0x13
	.value	0x3e0
	.byte	0xe
	.long	0x89d
	.long	0x9f1
	.uleb128 0x1
	.long	0xb4
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x6
	.long	.LASF198
	.byte	0x13
	.value	0x305
	.byte	0xe
	.long	0x13c
	.long	0xa08
	.uleb128 0x1
	.long	0x472
	.byte	0
	.uleb128 0x6
	.long	.LASF199
	.byte	0x13
	.value	0x3e2
	.byte	0xf
	.long	0x8cf
	.long	0xa24
	.uleb128 0x1
	.long	0x812
	.uleb128 0x1
	.long	0x812
	.byte	0
	.uleb128 0x6
	.long	.LASF200
	.byte	0x13
	.value	0x426
	.byte	0xc
	.long	0xb4
	.long	0xa40
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x86b
	.byte	0
	.uleb128 0x6
	.long	.LASF201
	.byte	0x13
	.value	0x431
	.byte	0xf
	.long	0x86b
	.long	0xa61
	.uleb128 0x1
	.long	0xa61
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x86b
	.byte	0
	.uleb128 0x7
	.long	0x82e
	.uleb128 0x6
	.long	.LASF202
	.byte	0x13
	.value	0x429
	.byte	0xc
	.long	0xb4
	.long	0xa87
	.uleb128 0x1
	.long	0xa61
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x86b
	.byte	0
	.uleb128 0x22
	.long	.LASF204
	.value	0x3ca
	.long	0xaa7
	.uleb128 0x1
	.long	0x38
	.uleb128 0x1
	.long	0x86b
	.uleb128 0x1
	.long	0x86b
	.uleb128 0x1
	.long	0x90d
	.byte	0
	.uleb128 0x3b
	.long	.LASF203
	.byte	0x13
	.value	0x2fa
	.byte	0xd
	.long	0xaba
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x18
	.long	.LASF232
	.byte	0x13
	.value	0x23d
	.byte	0xc
	.long	0xb4
	.uleb128 0x22
	.long	.LASF205
	.value	0x23f
	.long	0xad8
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0xd
	.long	.LASF206
	.byte	0x76
	.byte	0xf
	.long	0x827
	.long	0xaf2
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.byte	0
	.uleb128 0x10
	.long	.LASF207
	.byte	0x13
	.byte	0xd7
	.byte	0x11
	.long	.LASF208
	.long	0x812
	.long	0xb16
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x10
	.long	.LASF209
	.byte	0x13
	.byte	0xdb
	.byte	0x1a
	.long	.LASF210
	.long	0x2a
	.long	0xb3a
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x6
	.long	.LASF211
	.byte	0x13
	.value	0x39b
	.byte	0xc
	.long	0xb4
	.long	0xb51
	.uleb128 0x1
	.long	0x472
	.byte	0
	.uleb128 0x6
	.long	.LASF212
	.byte	0x13
	.value	0x435
	.byte	0xf
	.long	0x86b
	.long	0xb72
	.uleb128 0x1
	.long	0x13c
	.uleb128 0x1
	.long	0xb72
	.uleb128 0x1
	.long	0x86b
	.byte	0
	.uleb128 0x7
	.long	0x835
	.uleb128 0x6
	.long	.LASF213
	.byte	0x13
	.value	0x42d
	.byte	0xc
	.long	0xb4
	.long	0xb93
	.uleb128 0x1
	.long	0x13c
	.uleb128 0x1
	.long	0x82e
	.byte	0
	.uleb128 0x6
	.long	.LASF214
	.byte	0x13
	.value	0x3e6
	.byte	0x1e
	.long	0x901
	.long	0xbaf
	.uleb128 0x1
	.long	0x819
	.uleb128 0x1
	.long	0x819
	.byte	0
	.uleb128 0xd
	.long	.LASF215
	.byte	0x71
	.byte	0x24
	.long	0x819
	.long	0xbc4
	.uleb128 0x1
	.long	0x472
	.byte	0
	.uleb128 0x10
	.long	.LASF216
	.byte	0x13
	.byte	0xee
	.byte	0x16
	.long	.LASF217
	.long	0x819
	.long	0xbe8
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x10
	.long	.LASF218
	.byte	0x13
	.byte	0xf3
	.byte	0x1f
	.long	.LASF219
	.long	0x7fd
	.long	0xc0c
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0xd
	.long	.LASF220
	.byte	0x7c
	.byte	0xe
	.long	0x5c
	.long	0xc26
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.byte	0
	.uleb128 0xd
	.long	.LASF221
	.byte	0x7f
	.byte	0x14
	.long	0x820
	.long	0xc40
	.uleb128 0x1
	.long	0x472
	.uleb128 0x1
	.long	0x137
	.byte	0
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF222
	.uleb128 0x14
	.long	.LASF223
	.byte	0x14
	.byte	0xf
	.byte	0xb
	.long	0xc64
	.uleb128 0x3c
	.long	.LASF248
	.byte	0x14
	.byte	0x11
	.byte	0xb
	.uleb128 0x3d
	.string	"v1"
	.byte	0x14
	.byte	0x13
	.byte	0x12
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	.LASF224
	.byte	0x15
	.byte	0xa3
	.byte	0xf
	.long	0x5c
	.uleb128 0x9
	.long	.LASF225
	.byte	0x15
	.byte	0xa4
	.byte	0x10
	.long	0x827
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF226
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF227
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF228
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF229
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF230
	.uleb128 0x6
	.long	.LASF231
	.byte	0x6
	.value	0x4b2
	.byte	0xc
	.long	0x130
	.long	0xcb6
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x18
	.long	.LASF233
	.byte	0x6
	.value	0x4d5
	.byte	0xd
	.long	0x5c
	.uleb128 0x18
	.long	.LASF234
	.byte	0x6
	.value	0x4d1
	.byte	0xf
	.long	0x68
	.uleb128 0x6
	.long	.LASF235
	.byte	0x6
	.value	0x4cb
	.byte	0xc
	.long	0x130
	.long	0xce7
	.uleb128 0x1
	.long	0xb4
	.byte	0
	.uleb128 0x21
	.long	0x63
	.uleb128 0x23
	.long	0x6d5
	.quad	.LFB1932
	.quad	.LFE1932-.LFB1932
	.uleb128 0x1
	.byte	0x9c
	.long	0xd2f
	.uleb128 0xe
	.string	"_Tp"
	.long	0x5c
	.uleb128 0x19
	.string	"__a"
	.byte	0x5
	.byte	0xe9
	.byte	0x14
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.string	"__b"
	.byte	0x5
	.byte	0xe9
	.byte	0x24
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x23
	.long	0x6fd
	.quad	.LFB1931
	.quad	.LFE1931-.LFB1931
	.uleb128 0x1
	.byte	0x9c
	.long	0xd74
	.uleb128 0xe
	.string	"_Tp"
	.long	0x5c
	.uleb128 0x1a
	.string	"__a"
	.byte	0x5
	.value	0x101
	.byte	0x14
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.string	"__b"
	.byte	0x5
	.value	0x101
	.byte	0x24
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1b
	.long	0x726
	.quad	.LFB1892
	.quad	.LFE1892-.LFB1892
	.uleb128 0x1
	.byte	0x9c
	.long	0xdc0
	.uleb128 0xe
	.string	"_Tp"
	.long	0x5c
	.uleb128 0x1c
	.long	.LASF236
	.byte	0x16
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LASF237
	.byte	0x28
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.long	.LASF238
	.byte	0x39
	.long	0xce7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x3e
	.long	0x517
	.byte	0x3
	.byte	0x33
	.byte	0x11
	.long	0xde2
	.quad	.LFB1837
	.quad	.LFE1837-.LFB1837
	.uleb128 0x1
	.byte	0x9c
	.long	0xdef
	.uleb128 0x1d
	.long	.LASF239
	.long	0x54c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.long	0x4cb
	.byte	0x2b
	.long	0xe0f
	.quad	.LFB1836
	.quad	.LFE1836-.LFB1836
	.uleb128 0x1
	.byte	0x9c
	.long	0xe1c
	.uleb128 0x1d
	.long	.LASF239
	.long	0x53d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.long	0x4fe
	.byte	0xf
	.long	0xe3c
	.quad	.LFB1835
	.quad	.LFE1835-.LFB1835
	.uleb128 0x1
	.byte	0x9c
	.long	0xe77
	.uleb128 0x1d
	.long	.LASF239
	.long	0x53d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.long	.LASF240
	.byte	0x1c
	.byte	0xb
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3f
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x25
	.long	.LASF241
	.byte	0x13
	.byte	0x11
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x40
	.long	0x4e5
	.byte	0x3
	.byte	0x6
	.byte	0x1
	.long	0xe88
	.byte	0
	.long	0xe92
	.uleb128 0x41
	.long	.LASF239
	.long	0x53d
	.byte	0
	.uleb128 0x42
	.long	0xe77
	.long	.LASF249
	.long	0xeb5
	.quad	.LFB1833
	.quad	.LFE1833-.LFB1833
	.uleb128 0x1
	.byte	0x9c
	.long	0xebe
	.uleb128 0x43
	.long	0xe88
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	0x754
	.quad	.LFB1298
	.quad	.LFE1298-.LFB1298
	.uleb128 0x1
	.byte	0x9c
	.long	0xeea
	.uleb128 0x1a
	.string	"__x"
	.byte	0x2
	.value	0x190
	.byte	0xd
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.long	0x76f
	.quad	.LFB1265
	.quad	.LFE1265-.LFB1265
	.uleb128 0x1
	.byte	0x9c
	.long	0xf15
	.uleb128 0x19
	.string	"__x"
	.byte	0x2
	.byte	0xb1
	.byte	0xd
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x44
	.long	0x789
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 3667
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x89
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x89
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x89
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x2e
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x8c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.quad	.LFB1265
	.quad	.LFE1265-.LFB1265
	.quad	.LFB1298
	.quad	.LFE1298-.LFB1298
	.quad	.LFB1892
	.quad	.LFE1892-.LFB1892
	.quad	.LFB1931
	.quad	.LFE1931-.LFB1931
	.quad	.LFB1932
	.quad	.LFE1932-.LFB1932
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL0:
	.byte	0x7
	.quad	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.quad	.LFB1
	.uleb128 .LFE1-.LFB1
	.byte	0x7
	.quad	.LFB1265
	.uleb128 .LFE1265-.LFB1265
	.byte	0x7
	.quad	.LFB1298
	.uleb128 .LFE1298-.LFB1298
	.byte	0x7
	.quad	.LFB1892
	.uleb128 .LFE1892-.LFB1892
	.byte	0x7
	.quad	.LFB1931
	.uleb128 .LFE1931-.LFB1931
	.byte	0x7
	.quad	.LFB1932
	.uleb128 .LFE1932-.LFB1932
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF166:
	.string	"_ZSt3maxIfERKT_S2_S2_"
.LASF173:
	.string	"long int"
.LASF158:
	.string	"__debug"
.LASF242:
	.string	"GNU C++20 13.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c++20 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF243:
	.string	"_ZSt3sinf"
.LASF180:
	.string	"char32_t"
.LASF232:
	.string	"rand"
.LASF18:
	.string	"KEY_COMMA"
.LASF248:
	.string	"execution"
.LASF99:
	.string	"KEY_LEFT_SUPER"
.LASF125:
	.string	"KEY_VOLUME_DOWN"
.LASF211:
	.string	"system"
.LASF79:
	.string	"KEY_CAPS_LOCK"
.LASF149:
	.string	"__cust_swap"
.LASF103:
	.string	"KEY_RIGHT_SUPER"
.LASF156:
	.string	"__cust"
.LASF225:
	.string	"double_t"
.LASF226:
	.string	"_Float32"
.LASF233:
	.string	"GetMouseWheelMove"
.LASF210:
	.string	"__isoc23_strtoul"
.LASF200:
	.string	"mblen"
.LASF3:
	.string	"unsigned int"
.LASF228:
	.string	"_Float128"
.LASF168:
	.string	"__gnu_cxx"
.LASF20:
	.string	"KEY_PERIOD"
.LASF177:
	.string	"wchar_t"
.LASF138:
	.string	"pitch"
.LASF129:
	.string	"MOUSE_BUTTON_LEFT"
.LASF35:
	.string	"KEY_B"
.LASF146:
	.string	"__swappable_details"
.LASF247:
	.string	"_ZN9__gnu_cxx3divExx"
.LASF70:
	.string	"KEY_DELETE"
.LASF218:
	.string	"strtoull"
.LASF141:
	.string	"update"
.LASF169:
	.string	"__ops"
.LASF178:
	.string	"char8_t"
.LASF137:
	.string	"camera"
.LASF121:
	.string	"KEY_KP_EQUAL"
.LASF126:
	.string	"KeyboardKey"
.LASF25:
	.string	"KEY_THREE"
.LASF240:
	.string	"wheel"
.LASF53:
	.string	"KEY_T"
.LASF61:
	.string	"KEY_BACKSLASH"
.LASF38:
	.string	"KEY_E"
.LASF245:
	.string	"__is_constant_evaluated"
.LASF133:
	.string	"MOUSE_BUTTON_EXTRA"
.LASF182:
	.string	"__gnu_debug"
.LASF145:
	.string	"_ZNK16CameraController9getCameraEv"
.LASF216:
	.string	"strtoll"
.LASF80:
	.string	"KEY_SCROLL_LOCK"
.LASF144:
	.string	"getCamera"
.LASF105:
	.string	"KEY_KP_0"
.LASF106:
	.string	"KEY_KP_1"
.LASF107:
	.string	"KEY_KP_2"
.LASF108:
	.string	"KEY_KP_3"
.LASF109:
	.string	"KEY_KP_4"
.LASF110:
	.string	"KEY_KP_5"
.LASF111:
	.string	"KEY_KP_6"
.LASF112:
	.string	"KEY_KP_7"
.LASF113:
	.string	"KEY_KP_8"
.LASF114:
	.string	"KEY_KP_9"
.LASF58:
	.string	"KEY_Y"
.LASF170:
	.string	"long long unsigned int"
.LASF59:
	.string	"KEY_Z"
.LASF4:
	.string	"float"
.LASF122:
	.string	"KEY_BACK"
.LASF34:
	.string	"KEY_A"
.LASF82:
	.string	"KEY_PRINT_SCREEN"
.LASF36:
	.string	"KEY_C"
.LASF37:
	.string	"KEY_D"
.LASF147:
	.string	"__swappable_with_details"
.LASF39:
	.string	"KEY_F"
.LASF40:
	.string	"KEY_G"
.LASF41:
	.string	"KEY_H"
.LASF42:
	.string	"KEY_I"
.LASF43:
	.string	"KEY_J"
.LASF44:
	.string	"KEY_K"
.LASF45:
	.string	"KEY_L"
.LASF46:
	.string	"KEY_M"
.LASF47:
	.string	"KEY_N"
.LASF48:
	.string	"KEY_O"
.LASF49:
	.string	"KEY_P"
.LASF50:
	.string	"KEY_Q"
.LASF51:
	.string	"KEY_R"
.LASF52:
	.string	"KEY_S"
.LASF127:
	.string	"11KeyboardKey"
.LASF54:
	.string	"KEY_U"
.LASF55:
	.string	"KEY_V"
.LASF56:
	.string	"KEY_W"
.LASF57:
	.string	"KEY_X"
.LASF62:
	.string	"KEY_RIGHT_BRACKET"
.LASF97:
	.string	"KEY_LEFT_CONTROL"
.LASF33:
	.string	"KEY_EQUAL"
.LASF237:
	.string	"__lo"
.LASF230:
	.string	"_Float64x"
.LASF227:
	.string	"_Float64"
.LASF213:
	.string	"wctomb"
.LASF73:
	.string	"KEY_DOWN"
.LASF150:
	.string	"__cust_imove"
.LASF143:
	.string	"_ZN16CameraController6updateEv"
.LASF202:
	.string	"mbtowc"
.LASF71:
	.string	"KEY_RIGHT"
.LASF214:
	.string	"lldiv"
.LASF215:
	.string	"atoll"
.LASF116:
	.string	"KEY_KP_DIVIDE"
.LASF26:
	.string	"KEY_FOUR"
.LASF11:
	.string	"fovy"
.LASF8:
	.string	"Camera3D"
.LASF10:
	.string	"target"
.LASF205:
	.string	"srand"
.LASF64:
	.string	"KEY_SPACE"
.LASF124:
	.string	"KEY_VOLUME_UP"
.LASF176:
	.string	"double"
.LASF198:
	.string	"getenv"
.LASF197:
	.string	"bsearch"
.LASF29:
	.string	"KEY_SEVEN"
.LASF160:
	.string	"updatePosition"
.LASF208:
	.string	"__isoc23_strtol"
.LASF154:
	.string	"__cmp_cat"
.LASF224:
	.string	"float_t"
.LASF130:
	.string	"MOUSE_BUTTON_RIGHT"
.LASF152:
	.string	"__cust_access"
.LASF14:
	.string	"char"
.LASF102:
	.string	"KEY_RIGHT_ALT"
.LASF186:
	.string	"5div_t"
.LASF23:
	.string	"KEY_ONE"
.LASF93:
	.string	"KEY_F10"
.LASF157:
	.string	"__cmp_alg"
.LASF203:
	.string	"quick_exit"
.LASF78:
	.string	"KEY_END"
.LASF184:
	.string	"quot"
.LASF21:
	.string	"KEY_SLASH"
.LASF32:
	.string	"KEY_SEMICOLON"
.LASF217:
	.string	"__isoc23_strtoll"
.LASF167:
	.string	"_ZSt5clampIfERKT_S2_S2_S2_"
.LASF244:
	.string	"_ZSt3cosf"
.LASF174:
	.string	"long long int"
.LASF239:
	.string	"this"
.LASF15:
	.string	"bool"
.LASF12:
	.string	"projection"
.LASF115:
	.string	"KEY_KP_DECIMAL"
.LASF151:
	.string	"__cust_iswap"
.LASF199:
	.string	"ldiv"
.LASF67:
	.string	"KEY_TAB"
.LASF191:
	.string	"__compar_fn_t"
.LASF75:
	.string	"KEY_PAGE_UP"
.LASF5:
	.string	"Vector2"
.LASF6:
	.string	"Vector3"
.LASF84:
	.string	"KEY_F1"
.LASF85:
	.string	"KEY_F2"
.LASF86:
	.string	"KEY_F3"
.LASF87:
	.string	"KEY_F4"
.LASF88:
	.string	"KEY_F5"
.LASF89:
	.string	"KEY_F6"
.LASF90:
	.string	"KEY_F7"
.LASF91:
	.string	"KEY_F8"
.LASF92:
	.string	"KEY_F9"
.LASF118:
	.string	"KEY_KP_SUBTRACT"
.LASF74:
	.string	"KEY_UP"
.LASF236:
	.string	"__val"
.LASF179:
	.string	"char16_t"
.LASF155:
	.string	"__cmp_cust"
.LASF175:
	.string	"long double"
.LASF83:
	.string	"KEY_PAUSE"
.LASF163:
	.string	"_ZSt3minIfERKT_S2_S2_"
.LASF183:
	.string	"size_t"
.LASF235:
	.string	"IsMouseButtonDown"
.LASF241:
	.string	"delta"
.LASF17:
	.string	"KEY_APOSTROPHE"
.LASF19:
	.string	"KEY_MINUS"
.LASF66:
	.string	"KEY_ENTER"
.LASF231:
	.string	"IsKeyPressed"
.LASF22:
	.string	"KEY_ZERO"
.LASF172:
	.string	"short int"
.LASF68:
	.string	"KEY_BACKSPACE"
.LASF153:
	.string	"__detail"
.LASF201:
	.string	"mbstowcs"
.LASF120:
	.string	"KEY_KP_ENTER"
.LASF28:
	.string	"KEY_SIX"
.LASF101:
	.string	"KEY_RIGHT_CONTROL"
.LASF139:
	.string	"distance"
.LASF192:
	.string	"atexit"
.LASF24:
	.string	"KEY_TWO"
.LASF164:
	.string	"max<float>"
.LASF142:
	.string	"_ZN16CameraControllerC4Ev"
.LASF148:
	.string	"ranges"
.LASF188:
	.string	"ldiv_t"
.LASF65:
	.string	"KEY_ESCAPE"
.LASF60:
	.string	"KEY_LEFT_BRACKET"
.LASF193:
	.string	"at_quick_exit"
.LASF69:
	.string	"KEY_INSERT"
.LASF119:
	.string	"KEY_KP_ADD"
.LASF209:
	.string	"strtoul"
.LASF2:
	.string	"long unsigned int"
.LASF98:
	.string	"KEY_LEFT_ALT"
.LASF16:
	.string	"KEY_NULL"
.LASF159:
	.string	"numbers"
.LASF72:
	.string	"KEY_LEFT"
.LASF30:
	.string	"KEY_EIGHT"
.LASF181:
	.string	"__int128"
.LASF234:
	.string	"GetMouseDelta"
.LASF96:
	.string	"KEY_LEFT_SHIFT"
.LASF223:
	.string	"__pstl"
.LASF185:
	.string	"div_t"
.LASF7:
	.string	"unsigned char"
.LASF63:
	.string	"KEY_GRAVE"
.LASF246:
	.string	"_ZSt23__is_constant_evaluatedv"
.LASF132:
	.string	"MOUSE_BUTTON_SIDE"
.LASF100:
	.string	"KEY_RIGHT_SHIFT"
.LASF206:
	.string	"strtod"
.LASF220:
	.string	"strtof"
.LASF212:
	.string	"wcstombs"
.LASF207:
	.string	"strtol"
.LASF135:
	.string	"MOUSE_BUTTON_BACK"
.LASF117:
	.string	"KEY_KP_MULTIPLY"
.LASF31:
	.string	"KEY_NINE"
.LASF161:
	.string	"min<float>"
.LASF134:
	.string	"MOUSE_BUTTON_FORWARD"
.LASF187:
	.string	"6ldiv_t"
.LASF81:
	.string	"KEY_NUM_LOCK"
.LASF221:
	.string	"strtold"
.LASF219:
	.string	"__isoc23_strtoull"
.LASF189:
	.string	"7lldiv_t"
.LASF171:
	.string	"signed char"
.LASF140:
	.string	"CameraController"
.LASF123:
	.string	"KEY_MENU"
.LASF77:
	.string	"KEY_HOME"
.LASF13:
	.string	"short unsigned int"
.LASF190:
	.string	"lldiv_t"
.LASF194:
	.string	"atof"
.LASF195:
	.string	"atoi"
.LASF94:
	.string	"KEY_F11"
.LASF95:
	.string	"KEY_F12"
.LASF196:
	.string	"atol"
.LASF249:
	.string	"_ZN16CameraControllerC2Ev"
.LASF162:
	.string	"_ZN16CameraController14updatePositionEv"
.LASF165:
	.string	"clamp<float>"
.LASF229:
	.string	"_Float32x"
.LASF222:
	.string	"__int128 unsigned"
.LASF104:
	.string	"KEY_KB_MENU"
.LASF128:
	.string	"11MouseButton"
.LASF27:
	.string	"KEY_FIVE"
.LASF131:
	.string	"MOUSE_BUTTON_MIDDLE"
.LASF238:
	.string	"__hi"
.LASF136:
	.string	"MouseButton"
.LASF9:
	.string	"position"
.LASF76:
	.string	"KEY_PAGE_DOWN"
.LASF204:
	.string	"qsort"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/renderer/CameraController.cpp"
.LASF1:
	.string	"/home/bimachandra/Documents/projects/process-visualizer"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
