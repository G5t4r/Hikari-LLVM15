; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64 < %s | FileCheck %s

; This test is reduced fom https://github.com/android/ndk/issues/1207 for an
; issue with the following DAGCobmine operation:
;   truncate(build_vector(x,y)) -> build_vector(truncate(x),truncate(y))
; The combine should avoid creating illegal types if types have already been
; legalized.

define void @no_combine(i32 %p) local_unnamed_addr {
; CHECK-LABEL: no_combine:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v0.4h, #4
; CHECK-NEXT:    dup v1.4s, w0
; CHECK-NEXT:    xtn v1.4h, v1.4s
; CHECK-NEXT:    mov v1.d[1], v0.d[0]
; CHECK-NEXT:    uzp1 v0.16b, v1.16b, v1.16b
; CHECK-NEXT:    str q0, [x8]
; CHECK-NEXT:    ret

; The two shufflevector operations are needed to force the DAGCombine to happen
; after type legalization and before operation legalization.  Removing either
; makes the combine to happen before type legalization and the issue no longer
; repros.
  %1 = insertelement <16 x i32> undef, i32 %p, i32 0
  %2 = shufflevector <16 x i32> %1, <16 x i32> undef, <16 x i32> <i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef>
  %3 = shufflevector <16 x i32> %2, <16 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 4, i32 4, i32 4, i32 4, i32 undef, i32 undef, i32 undef, i32 undef, i32 4, i32 4, i32 4, i32 4>, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 8, i32 9, i32 10, i32 11, i32 28, i32 29, i32 30, i32 31>
  %4 = trunc <16 x i32> %3 to <16 x i8>
  %5 = bitcast i8* undef to <16 x i8>*
  store <16 x i8> %4, <16 x i8>* %5, align 1
  ret void
}

; Test case to ensure that the combine is done before type legalization.
define void @do_combine(i32 %p) local_unnamed_addr {
; CHECK-LABEL: do_combine:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.16b, w0
; CHECK-NEXT:    str q0, [x8]
; CHECK-NEXT:    ret
  %1 = insertelement <16 x i32> undef, i32 %p, i32 0
  %2 = shufflevector <16 x i32> %1, <16 x i32> undef, <16 x i32> <i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef>
  %3 = trunc <16 x i32> %2 to <16 x i8>
  %4 = bitcast i8* undef to <16 x i8>*
  store <16 x i8> %3, <16 x i8>* %4, align 1
  ret void
}