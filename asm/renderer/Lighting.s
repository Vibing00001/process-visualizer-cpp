	.file	"Lighting.cpp"
	.intel_syntax noprefix
# GNU C++20 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c++20 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.file 0 "/home/bimachandra/Documents/projects/process-visualizer" "src/renderer/Lighting.cpp"
	.section	.rodata
.LC0:
	.string	"shaders/lighting.fs"
.LC1:
	.string	"shaders/lighting.vs"
.LC2:
	.string	"lightDirection"
.LC3:
	.string	"viewPos"
	.text
	.align 2
	.globl	_ZN8LightingC2Ev
	.type	_ZN8LightingC2Ev, @function
_ZN8LightingC2Ev:
.LFB2:
	.file 1 "src/renderer/Lighting.cpp"
	.loc 1 3 1
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	rbx	#
	sub	rsp, 56	#,
	.cfi_offset 3, -24
	mov	QWORD PTR -56[rbp], rdi	# this, this
# src/renderer/Lighting.cpp:3: Lighting::Lighting() {
	.loc 1 3 1
	mov	rax, QWORD PTR fs:40	# tmp108, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -24[rbp], rax	# D.5962, tmp108
	xor	eax, eax	# tmp108
.LBB2:
# src/renderer/Lighting.cpp:3: Lighting::Lighting() {
	.loc 1 3 20
	mov	rax, QWORD PTR -56[rbp]	# tmp84, this
	mov	QWORD PTR [rax], 0	# this_4(D)->shader,
	mov	QWORD PTR 8[rax], 0	# this_4(D)->shader,
	mov	rax, QWORD PTR -56[rbp]	# tmp85, this
	mov	DWORD PTR 16[rax], -1	# this_4(D)->viewLocation,
.LBB3:
# src/renderer/Lighting.cpp:4:     shader = LoadShader("shaders/lighting.vs", "shaders/lighting.fs");
	.loc 1 4 24
	mov	rbx, QWORD PTR -56[rbp]	# tmp86, this
	lea	rax, .LC0[rip]	# tmp87,
	mov	rsi, rax	#, tmp87
	lea	rax, .LC1[rip]	# tmp88,
	mov	rdi, rax	#, tmp88
	call	LoadShader@PLT	#
	mov	ecx, eax	# tmp89,
	mov	rax, rdx	# tmp90,
	mov	DWORD PTR [rbx], ecx	# this_4(D)->shader, tmp89
	mov	QWORD PTR 8[rbx], rax	# this_4(D)->shader, tmp90
# src/renderer/Lighting.cpp:6:     const int lightLocation = GetShaderLocation(shader, "lightDirection");
	.loc 1 6 48
	mov	rax, QWORD PTR -56[rbp]	# tmp91, this
	mov	ecx, DWORD PTR [rax]	# tmp92, this_4(D)->shader
	mov	rax, QWORD PTR 8[rax]	# tmp93, this_4(D)->shader
	lea	rdx, .LC2[rip]	# tmp94,
	mov	edi, ecx	#, tmp92
	mov	rsi, rax	#, tmp93
	call	GetShaderLocation@PLT	#
# src/renderer/Lighting.cpp:6:     const int lightLocation = GetShaderLocation(shader, "lightDirection");
	.loc 1 6 48 is_stmt 0 discriminator 1
	mov	DWORD PTR -40[rbp], eax	# lightLocation, _10
# src/renderer/Lighting.cpp:7:     viewLocation = GetShaderLocation(shader, "viewPos");
	.loc 1 7 37 is_stmt 1
	mov	rax, QWORD PTR -56[rbp]	# tmp95, this
	mov	ecx, DWORD PTR [rax]	# tmp96, this_4(D)->shader
	mov	rax, QWORD PTR 8[rax]	# tmp97, this_4(D)->shader
	lea	rdx, .LC3[rip]	# tmp98,
	mov	edi, ecx	#, tmp96
	mov	rsi, rax	#, tmp97
	call	GetShaderLocation@PLT	#
# src/renderer/Lighting.cpp:7:     viewLocation = GetShaderLocation(shader, "viewPos");
	.loc 1 7 18 discriminator 1
	mov	rdx, QWORD PTR -56[rbp]	# tmp99, this
	mov	DWORD PTR 16[rdx], eax	# this_4(D)->viewLocation, _1
# src/renderer/Lighting.cpp:10:     const float direction[3] = {0.5f, 0.85f, 0.35f};
	.loc 1 10 17
	movss	xmm0, DWORD PTR .LC4[rip]	# tmp100,
	movss	DWORD PTR -36[rbp], xmm0	# direction[0], tmp100
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp101,
	movss	DWORD PTR -32[rbp], xmm0	# direction[1], tmp101
	movss	xmm0, DWORD PTR .LC6[rip]	# tmp102,
	movss	DWORD PTR -28[rbp], xmm0	# direction[2], tmp102
# src/renderer/Lighting.cpp:11:     SetShaderValue(shader, lightLocation, direction, SHADER_UNIFORM_VEC3);
	.loc 1 11 19
	lea	rcx, -36[rbp]	# tmp103,
	mov	edx, DWORD PTR -40[rbp]	# tmp104, lightLocation
	mov	rax, QWORD PTR -56[rbp]	# tmp105, this
	mov	esi, DWORD PTR [rax]	# tmp106, this_4(D)->shader
	mov	rax, QWORD PTR 8[rax]	# tmp107, this_4(D)->shader
	mov	r8d, 2	#,
	mov	edi, esi	#, tmp106
	mov	rsi, rax	#, tmp107
	call	SetShaderValue@PLT	#
.LBE3:
.LBE2:
# src/renderer/Lighting.cpp:12: }
	.loc 1 12 1
	nop	
	mov	rax, QWORD PTR -24[rbp]	# tmp109, D.5962
	sub	rax, QWORD PTR fs:40	# tmp109, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L2	#,
	call	__stack_chk_fail@PLT	#
.L2:
	mov	rbx, QWORD PTR -8[rbp]	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	_ZN8LightingC2Ev, .-_ZN8LightingC2Ev
	.globl	_ZN8LightingC1Ev
	.set	_ZN8LightingC1Ev,_ZN8LightingC2Ev
	.align 2
	.globl	_ZN8LightingD2Ev
	.type	_ZN8LightingD2Ev, @function
_ZN8LightingD2Ev:
.LFB5:
	.loc 1 14 1
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
	mov	QWORD PTR -8[rbp], rdi	# this, this
.LBB4:
# src/renderer/Lighting.cpp:15:     if (shader.id != 0) UnloadShader(shader);
	.loc 1 15 16
	mov	rax, QWORD PTR -8[rbp]	# tmp83, this
	mov	eax, DWORD PTR [rax]	# _1, this_4(D)->shader.id
# src/renderer/Lighting.cpp:15:     if (shader.id != 0) UnloadShader(shader);
	.loc 1 15 5
	test	eax, eax	# _1
	je	.L5	#,
# src/renderer/Lighting.cpp:15:     if (shader.id != 0) UnloadShader(shader);
	.loc 1 15 37 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp84, this
	mov	edx, DWORD PTR [rax]	# tmp85, this_4(D)->shader
	mov	rax, QWORD PTR 8[rax]	# tmp86, this_4(D)->shader
	mov	edi, edx	#, tmp85
	mov	rsi, rax	#, tmp86
	call	UnloadShader@PLT	#
.L5:
.LBE4:
# src/renderer/Lighting.cpp:16: }
	.loc 1 16 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA5:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5-.LLSDACSB5
.LLSDACSB5:
.LLSDACSE5:
	.text
	.size	_ZN8LightingD2Ev, .-_ZN8LightingD2Ev
	.globl	_ZN8LightingD1Ev
	.set	_ZN8LightingD1Ev,_ZN8LightingD2Ev
	.align 2
	.globl	_ZNK8Lighting6updateERK8Camera3D
	.type	_ZNK8Lighting6updateERK8Camera3D, @function
_ZNK8Lighting6updateERK8Camera3D:
.LFB7:
	.loc 1 18 53
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# this, this
	mov	QWORD PTR -48[rbp], rsi	# camera, camera
# src/renderer/Lighting.cpp:18: void Lighting::update(const Camera3D& camera) const {
	.loc 1 18 53
	mov	rax, QWORD PTR fs:40	# tmp94, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.5968, tmp94
	xor	eax, eax	# tmp94
# src/renderer/Lighting.cpp:20:         camera.position.x, camera.position.y, camera.position.z
	.loc 1 20 25
	mov	rax, QWORD PTR -48[rbp]	# tmp86, camera
	movss	xmm0, DWORD PTR [rax]	# _1, camera_6(D)->position.x
# src/renderer/Lighting.cpp:21:     };
	.loc 1 21 5
	movss	DWORD PTR -20[rbp], xmm0	# position[0], _1
# src/renderer/Lighting.cpp:20:         camera.position.x, camera.position.y, camera.position.z
	.loc 1 20 44
	mov	rax, QWORD PTR -48[rbp]	# tmp87, camera
	movss	xmm0, DWORD PTR 4[rax]	# _2, camera_6(D)->position.y
# src/renderer/Lighting.cpp:21:     };
	.loc 1 21 5
	movss	DWORD PTR -16[rbp], xmm0	# position[1], _2
# src/renderer/Lighting.cpp:20:         camera.position.x, camera.position.y, camera.position.z
	.loc 1 20 63
	mov	rax, QWORD PTR -48[rbp]	# tmp88, camera
	movss	xmm0, DWORD PTR 8[rax]	# _3, camera_6(D)->position.z
# src/renderer/Lighting.cpp:21:     };
	.loc 1 21 5
	movss	DWORD PTR -12[rbp], xmm0	# position[2], _3
# src/renderer/Lighting.cpp:22:     SetShaderValue(shader, viewLocation, position, SHADER_UNIFORM_VEC3);
	.loc 1 22 28
	mov	rax, QWORD PTR -40[rbp]	# tmp89, this
	mov	edx, DWORD PTR 16[rax]	# _4, this_10(D)->viewLocation
# src/renderer/Lighting.cpp:22:     SetShaderValue(shader, viewLocation, position, SHADER_UNIFORM_VEC3);
	.loc 1 22 19
	lea	rcx, -20[rbp]	# tmp90,
	mov	rax, QWORD PTR -40[rbp]	# tmp91, this
	mov	esi, DWORD PTR [rax]	# tmp92, this_10(D)->shader
	mov	rax, QWORD PTR 8[rax]	# tmp93, this_10(D)->shader
	mov	r8d, 2	#,
	mov	edi, esi	#, tmp92
	mov	rsi, rax	#, tmp93
	call	SetShaderValue@PLT	#
# src/renderer/Lighting.cpp:23: }
	.loc 1 23 1
	nop	
	mov	rax, QWORD PTR -8[rbp]	# tmp95, D.5968
	sub	rax, QWORD PTR fs:40	# tmp95, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L7	#,
	call	__stack_chk_fail@PLT	#
.L7:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	_ZNK8Lighting6updateERK8Camera3D, .-_ZNK8Lighting6updateERK8Camera3D
	.section	.rodata
	.align 4
.LC4:
	.long	1056964608
	.align 4
.LC5:
	.long	1062836634
	.align 4
.LC6:
	.long	1051931443
	.text
.Letext0:
	.file 2 "/usr/local/include/raylib.h"
	.file 3 "src/renderer/Lighting.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4a9
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x19
	.long	.LASF54
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF4
	.uleb128 0x3
	.long	0x3c
	.uleb128 0x1a
	.long	.LASF6
	.byte	0xc
	.byte	0x2
	.byte	0xde
	.byte	0x10
	.long	0x71
	.uleb128 0x9
	.string	"x"
	.byte	0xdf
	.long	0x3c
	.byte	0
	.uleb128 0x9
	.string	"y"
	.byte	0xe0
	.long	0x3c
	.byte	0x4
	.uleb128 0x9
	.string	"z"
	.byte	0xe1
	.long	0x3c
	.byte	0x8
	.byte	0
	.uleb128 0x1b
	.long	.LASF6
	.byte	0x2
	.byte	0xe2
	.byte	0x3
	.long	0x48
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	0x84
	.uleb128 0xd
	.long	.LASF7
	.byte	0x2c
	.value	0x147
	.long	0xdd
	.uleb128 0x6
	.long	.LASF8
	.value	0x148
	.byte	0xd
	.long	0x71
	.byte	0
	.uleb128 0x6
	.long	.LASF9
	.value	0x149
	.byte	0xd
	.long	0x71
	.byte	0xc
	.uleb128 0xe
	.string	"up"
	.value	0x14a
	.byte	0xd
	.long	0x71
	.byte	0x18
	.uleb128 0x6
	.long	.LASF10
	.value	0x14b
	.byte	0xb
	.long	0x3c
	.byte	0x24
	.uleb128 0x6
	.long	.LASF11
	.value	0x14c
	.byte	0x9
	.long	0x84
	.byte	0x28
	.byte	0
	.uleb128 0xa
	.long	.LASF7
	.value	0x14d
	.long	0x90
	.uleb128 0x3
	.long	0xdd
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF12
	.uleb128 0xd
	.long	.LASF13
	.byte	0x10
	.value	0x177
	.long	0x11a
	.uleb128 0xe
	.string	"id"
	.value	0x178
	.byte	0x12
	.long	0x35
	.byte	0
	.uleb128 0x6
	.long	.LASF14
	.value	0x179
	.byte	0xa
	.long	0x11a
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	0x84
	.uleb128 0xa
	.long	.LASF13
	.value	0x17a
	.long	0xf4
	.uleb128 0x3
	.long	0x11f
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x3
	.long	0x12f
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.long	.LASF16
	.uleb128 0x1d
	.byte	0x7
	.byte	0x4
	.long	0x35
	.byte	0x2
	.value	0x33b
	.byte	0xe
	.long	.LASF55
	.long	0x1a4
	.uleb128 0x2
	.long	.LASF17
	.byte	0
	.uleb128 0x2
	.long	.LASF18
	.byte	0x1
	.uleb128 0x2
	.long	.LASF19
	.byte	0x2
	.uleb128 0x2
	.long	.LASF20
	.byte	0x3
	.uleb128 0x2
	.long	.LASF21
	.byte	0x4
	.uleb128 0x2
	.long	.LASF22
	.byte	0x5
	.uleb128 0x2
	.long	.LASF23
	.byte	0x6
	.uleb128 0x2
	.long	.LASF24
	.byte	0x7
	.uleb128 0x2
	.long	.LASF25
	.byte	0x8
	.uleb128 0x2
	.long	.LASF26
	.byte	0x9
	.uleb128 0x2
	.long	.LASF27
	.byte	0xa
	.uleb128 0x2
	.long	.LASF28
	.byte	0xb
	.uleb128 0x2
	.long	.LASF29
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.long	.LASF30
	.value	0x349
	.long	0x142
	.uleb128 0x7
	.long	0x136
	.uleb128 0x7
	.long	0x1b9
	.uleb128 0x1e
	.uleb128 0x1f
	.long	.LASF31
	.byte	0x18
	.byte	0x3
	.byte	0x5
	.byte	0x7
	.long	0x2d0
	.uleb128 0xb
	.long	.LASF31
	.byte	0x7
	.byte	0x5
	.long	.LASF33
	.long	0x1da
	.long	0x1e0
	.uleb128 0x4
	.long	0x2d5
	.byte	0
	.uleb128 0xb
	.long	.LASF32
	.byte	0x8
	.byte	0x5
	.long	.LASF34
	.long	0x1f3
	.long	0x1fe
	.uleb128 0x4
	.long	0x2d5
	.uleb128 0x4
	.long	0x84
	.byte	0
	.uleb128 0xf
	.long	.LASF31
	.byte	0xa
	.long	.LASF35
	.long	0x210
	.long	0x21b
	.uleb128 0x4
	.long	0x2d5
	.uleb128 0x1
	.long	0x2df
	.byte	0
	.uleb128 0x10
	.long	.LASF37
	.byte	0xb
	.long	.LASF38
	.long	0x2e4
	.long	0x231
	.long	0x23c
	.uleb128 0x4
	.long	0x2d5
	.uleb128 0x1
	.long	0x2df
	.byte	0
	.uleb128 0xf
	.long	.LASF31
	.byte	0xc
	.long	.LASF36
	.long	0x24e
	.long	0x259
	.uleb128 0x4
	.long	0x2d5
	.uleb128 0x1
	.long	0x2e9
	.byte	0
	.uleb128 0x10
	.long	.LASF37
	.byte	0xd
	.long	.LASF39
	.long	0x2e4
	.long	0x26f
	.long	0x27a
	.uleb128 0x4
	.long	0x2d5
	.uleb128 0x1
	.long	0x2e9
	.byte	0
	.uleb128 0xb
	.long	.LASF40
	.byte	0xf
	.byte	0xa
	.long	.LASF41
	.long	0x28d
	.long	0x298
	.uleb128 0x4
	.long	0x2ef
	.uleb128 0x1
	.long	0x2f9
	.byte	0
	.uleb128 0x20
	.long	.LASF42
	.byte	0x3
	.byte	0x10
	.byte	0x13
	.long	.LASF43
	.long	0x2fe
	.byte	0x1
	.long	0x2b1
	.long	0x2b7
	.uleb128 0x4
	.long	0x2ef
	.byte	0
	.uleb128 0x11
	.long	.LASF44
	.byte	0x13
	.byte	0xc
	.long	0x11f
	.byte	0
	.uleb128 0x11
	.long	.LASF45
	.byte	0x14
	.byte	0x9
	.long	0x84
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	0x1ba
	.uleb128 0x7
	.long	0x1ba
	.uleb128 0x3
	.long	0x2d5
	.uleb128 0x8
	.long	0x2d0
	.uleb128 0x8
	.long	0x1ba
	.uleb128 0x21
	.byte	0x8
	.long	0x1ba
	.uleb128 0x7
	.long	0x2d0
	.uleb128 0x3
	.long	0x2ef
	.uleb128 0x8
	.long	0xe8
	.uleb128 0x8
	.long	0x12a
	.uleb128 0x12
	.long	.LASF46
	.value	0x438
	.long	0x314
	.uleb128 0x1
	.long	0x11f
	.byte	0
	.uleb128 0x12
	.long	.LASF47
	.value	0x434
	.long	0x334
	.uleb128 0x1
	.long	0x11f
	.uleb128 0x1
	.long	0x84
	.uleb128 0x1
	.long	0x1b4
	.uleb128 0x1
	.long	0x84
	.byte	0
	.uleb128 0x13
	.long	.LASF48
	.value	0x432
	.byte	0xb
	.long	0x84
	.long	0x34f
	.uleb128 0x1
	.long	0x11f
	.uleb128 0x1
	.long	0x1af
	.byte	0
	.uleb128 0x13
	.long	.LASF49
	.value	0x42f
	.byte	0xe
	.long	0x11f
	.long	0x36a
	.uleb128 0x1
	.long	0x1af
	.uleb128 0x1
	.long	0x1af
	.byte	0
	.uleb128 0x22
	.long	0x27a
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.long	0x38c
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x3b7
	.uleb128 0x23
	.long	.LASF50
	.long	0x2f4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF56
	.byte	0x1
	.byte	0x12
	.byte	0x27
	.long	0x2f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x25
	.long	.LASF8
	.byte	0x1
	.byte	0x13
	.byte	0x11
	.long	0x3b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x26
	.long	0x43
	.long	0x3c7
	.uleb128 0x27
	.long	0x2e
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	0x3b7
	.uleb128 0x14
	.long	0x1e0
	.byte	0xe
	.long	0x3da
	.long	0x3ed
	.uleb128 0xc
	.long	.LASF50
	.long	0x2da
	.uleb128 0xc
	.long	.LASF51
	.long	0x8b
	.byte	0
	.uleb128 0x28
	.long	0x3cc
	.long	.LASF57
	.long	0x410
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x419
	.uleb128 0x15
	.long	0x3da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	0x1c7
	.byte	0x3
	.long	0x427
	.long	0x449
	.uleb128 0xc
	.long	.LASF50
	.long	0x2da
	.uleb128 0x29
	.uleb128 0x16
	.long	.LASF52
	.byte	0x6
	.byte	0xf
	.long	0x8b
	.uleb128 0x16
	.long	.LASF53
	.byte	0xa
	.byte	0x11
	.long	0x3c7
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	0x419
	.long	.LASF58
	.long	0x468
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	0x427
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2b
	.long	0x430
	.long	0x485
	.uleb128 0x17
	.long	0x431
	.uleb128 0x17
	.long	0x43c
	.byte	0
	.uleb128 0x2c
	.long	0x430
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x18
	.long	0x431
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.long	0x43c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x8a
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x8a
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
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
	.sleb128 3
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
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x42
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"locs"
.LASF29:
	.string	"SHADER_UNIFORM_SAMPLER2D"
.LASF38:
	.string	"_ZN8LightingaSERKS_"
.LASF16:
	.string	"bool"
.LASF56:
	.string	"camera"
.LASF47:
	.string	"SetShaderValue"
.LASF13:
	.string	"Shader"
.LASF53:
	.string	"direction"
.LASF40:
	.string	"update"
.LASF31:
	.string	"Lighting"
.LASF4:
	.string	"float"
.LASF44:
	.string	"shader"
.LASF21:
	.string	"SHADER_UNIFORM_INT"
.LASF50:
	.string	"this"
.LASF26:
	.string	"SHADER_UNIFORM_UIVEC2"
.LASF46:
	.string	"UnloadShader"
.LASF28:
	.string	"SHADER_UNIFORM_UIVEC4"
.LASF2:
	.string	"long unsigned int"
.LASF12:
	.string	"short unsigned int"
.LASF25:
	.string	"SHADER_UNIFORM_UINT"
.LASF54:
	.string	"GNU C++20 13.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c++20 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF18:
	.string	"SHADER_UNIFORM_VEC2"
.LASF22:
	.string	"SHADER_UNIFORM_IVEC2"
.LASF23:
	.string	"SHADER_UNIFORM_IVEC3"
.LASF24:
	.string	"SHADER_UNIFORM_IVEC4"
.LASF48:
	.string	"GetShaderLocation"
.LASF49:
	.string	"LoadShader"
.LASF6:
	.string	"Vector3"
.LASF8:
	.string	"position"
.LASF33:
	.string	"_ZN8LightingC4Ev"
.LASF5:
	.string	"unsigned char"
.LASF3:
	.string	"unsigned int"
.LASF9:
	.string	"target"
.LASF57:
	.string	"_ZN8LightingD2Ev"
.LASF27:
	.string	"SHADER_UNIFORM_UIVEC3"
.LASF35:
	.string	"_ZN8LightingC4ERKS_"
.LASF20:
	.string	"SHADER_UNIFORM_VEC4"
.LASF17:
	.string	"SHADER_UNIFORM_FLOAT"
.LASF43:
	.string	"_ZNK8Lighting9getShaderEv"
.LASF7:
	.string	"Camera3D"
.LASF15:
	.string	"char"
.LASF39:
	.string	"_ZN8LightingaSEOS_"
.LASF34:
	.string	"_ZN8LightingD4Ev"
.LASF10:
	.string	"fovy"
.LASF41:
	.string	"_ZNK8Lighting6updateERK8Camera3D"
.LASF51:
	.string	"__in_chrg"
.LASF42:
	.string	"getShader"
.LASF58:
	.string	"_ZN8LightingC2Ev"
.LASF36:
	.string	"_ZN8LightingC4EOS_"
.LASF19:
	.string	"SHADER_UNIFORM_VEC3"
.LASF52:
	.string	"lightLocation"
.LASF37:
	.string	"operator="
.LASF32:
	.string	"~Lighting"
.LASF30:
	.string	"ShaderUniformDataType"
.LASF55:
	.string	"21ShaderUniformDataType"
.LASF11:
	.string	"projection"
.LASF45:
	.string	"viewLocation"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/renderer/Lighting.cpp"
.LASF1:
	.string	"/home/bimachandra/Documents/projects/process-visualizer"
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
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
