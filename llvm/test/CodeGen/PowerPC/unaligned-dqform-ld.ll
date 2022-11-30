; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr9 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr < %s | \
; RUN:   FileCheck %s --check-prefix=CHECK-P9-LE
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu \
; RUN:   -mcpu=pwr9 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr < %s | \
; RUN:   FileCheck %s --check-prefix=CHECK-P9-BE

%0 = type { %1 }
%1 = type { %2, %6 }
%2 = type { %3 }
%3 = type { %4 }
%4 = type { %5 }
%5 = type { i8*, i32, i32 }
%6 = type { [160 x i8] }
%7 = type { %8, i32, %8 }
%8 = type { i8*, i64 }

$abc = comdat any

; This test checks that X-Form load, lxvx, is being produced here instead of
; the DQ-Form, lxv. We should not be producing lxv here as the frame index
; value is unaligned (not a multiple of 16).
define void @abc(%0* %arg, [5 x i64] %arg1, [5 x i64] %arg2, [5 x i64] %arg3, [5 x i64] %arg4) local_unnamed_addr #0 comdat {
; CHECK-P9-LE-LABEL: abc:
; CHECK-P9-LE:       # %bb.0: # %bb
; CHECK-P9-LE-NEXT:    addi r6, r1, 120
; CHECK-P9-LE-NEXT:    addi r11, r1, 104
; CHECK-P9-LE-NEXT:    ld r0, 136(r1)
; CHECK-P9-LE-NEXT:    ld r12, 144(r1)
; CHECK-P9-LE-NEXT:    std r4, 0(r3)
; CHECK-P9-LE-NEXT:    addi r4, r1, -160
; CHECK-P9-LE-NEXT:    lxvx vs0, 0, r6
; CHECK-P9-LE-NEXT:    lxvx vs1, 0, r11
; CHECK-P9-LE-NEXT:    ld r6, 192(r1)
; CHECK-P9-LE-NEXT:    ld r11, 160(r1)
; CHECK-P9-LE-NEXT:    std r8, 0(r3)
; CHECK-P9-LE-NEXT:    std r10, 0(r3)
; CHECK-P9-LE-NEXT:    stxv vs1, 64(r4)
; CHECK-P9-LE-NEXT:    std r0, 0(r3)
; CHECK-P9-LE-NEXT:    std r11, 0(r3)
; CHECK-P9-LE-NEXT:    std r6, 0(r3)
; CHECK-P9-LE-NEXT:    addi r3, r3, 16
; CHECK-P9-LE-NEXT:    std r5, 0(0)
; CHECK-P9-LE-NEXT:    std r7, -136(r1)
; CHECK-P9-LE-NEXT:    std r9, 0(0)
; CHECK-P9-LE-NEXT:    stxv vs0, 80(r4)
; CHECK-P9-LE-NEXT:    std r12, 0(0)
; CHECK-P9-LE-NEXT:    std r3, 0(r3)
; CHECK-P9-LE-NEXT:    blr
;
; CHECK-P9-BE-LABEL: abc:
; CHECK-P9-BE:       # %bb.0: # %bb
; CHECK-P9-BE-NEXT:    addi r6, r1, 136
; CHECK-P9-BE-NEXT:    addi r11, r1, 120
; CHECK-P9-BE-NEXT:    ld r0, 152(r1)
; CHECK-P9-BE-NEXT:    ld r12, 160(r1)
; CHECK-P9-BE-NEXT:    std r4, 0(r3)
; CHECK-P9-BE-NEXT:    addi r4, r1, -160
; CHECK-P9-BE-NEXT:    lxvx vs0, 0, r6
; CHECK-P9-BE-NEXT:    lxvx vs1, 0, r11
; CHECK-P9-BE-NEXT:    ld r6, 208(r1)
; CHECK-P9-BE-NEXT:    ld r11, 176(r1)
; CHECK-P9-BE-NEXT:    std r8, 0(r3)
; CHECK-P9-BE-NEXT:    std r10, 0(r3)
; CHECK-P9-BE-NEXT:    stxv vs1, 64(r4)
; CHECK-P9-BE-NEXT:    std r0, 0(r3)
; CHECK-P9-BE-NEXT:    std r11, 0(r3)
; CHECK-P9-BE-NEXT:    std r6, 0(r3)
; CHECK-P9-BE-NEXT:    addi r3, r3, 16
; CHECK-P9-BE-NEXT:    std r5, 0(0)
; CHECK-P9-BE-NEXT:    std r7, -136(r1)
; CHECK-P9-BE-NEXT:    std r9, 0(0)
; CHECK-P9-BE-NEXT:    stxv vs0, 80(r4)
; CHECK-P9-BE-NEXT:    std r12, 0(0)
; CHECK-P9-BE-NEXT:    std r3, 0(r3)
; CHECK-P9-BE-NEXT:    blr
bb:
  %i = alloca [4 x %7], align 8
  %i5 = extractvalue [5 x i64] %arg1, 0
  %i6 = extractvalue [5 x i64] %arg1, 1
  %i7 = extractvalue [5 x i64] %arg1, 3
  %i8 = extractvalue [5 x i64] %arg1, 4
  %i9 = extractvalue [5 x i64] %arg2, 0
  %i10 = extractvalue [5 x i64] %arg2, 1
  %i11 = extractvalue [5 x i64] %arg2, 3
  %i12 = extractvalue [5 x i64] %arg2, 4
  %i13 = extractvalue [5 x i64] %arg3, 0
  %i14 = extractvalue [5 x i64] %arg3, 1
  %i15 = extractvalue [5 x i64] %arg3, 2
  %i16 = extractvalue [5 x i64] %arg3, 3
  %i17 = extractvalue [5 x i64] %arg4, 0
  %i18 = extractvalue [5 x i64] %arg4, 4
  store i64 %i5, i64* undef, align 8
  store i64 %i6, i64* null, align 8
  %i19 = getelementptr inbounds [4 x %7], [4 x %7]* %i, i64 0, i64 0, i32 2
  %i20 = bitcast %8* %i19 to i64*
  store i64 %i7, i64* %i20, align 8
  store i64 %i8, i64* undef, align 8
  store i64 %i9, i64* null, align 8
  store i64 %i10, i64* undef, align 8
  %i21 = getelementptr inbounds [4 x %7], [4 x %7]* %i, i64 0, i64 1, i32 2
  %i22 = bitcast %8* %i21 to i64*
  store i64 %i11, i64* %i22, align 8
  %i23 = getelementptr inbounds [4 x %7], [4 x %7]* %i, i64 0, i64 1, i32 2, i32 1
  store i64 %i12, i64* %i23, align 8
  %i24 = getelementptr inbounds [4 x %7], [4 x %7]* %i, i64 0, i64 2
  %i25 = bitcast %7* %i24 to i64*
  store i64 %i13, i64* %i25, align 8
  %i26 = getelementptr inbounds [4 x %7], [4 x %7]* %i, i64 0, i64 2, i32 0, i32 1
  store i64 %i14, i64* %i26, align 8
  store i64 %i15, i64* undef, align 8
  store i64 %i16, i64* null, align 8
  store i64 %i17, i64* undef, align 8
  store i64 undef, i64* null, align 8
  store i64 %i18, i64* undef, align 8
  %i27 = getelementptr inbounds %0, %0* %arg, i64 0, i32 0, i32 0, i32 0
  %i28 = getelementptr inbounds %3, %3* %i27, i64 1, i32 0
  store %4* %i28, %4** undef, align 8
  ret void
}