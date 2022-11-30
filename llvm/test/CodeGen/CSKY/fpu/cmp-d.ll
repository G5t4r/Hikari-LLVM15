; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py

; RUN: llc -verify-machineinstrs -csky-no-aliases < %s -mtriple=csky -float-abi=hard -mattr=+hard-float -mattr=+2e3 -mattr=+fpuv2_sf -mattr=+fpuv2_df | FileCheck %s --check-prefix=CHECK-DF
; RUN: llc -verify-machineinstrs -csky-no-aliases < %s -mtriple=csky -float-abi=hard -mattr=+hard-float -mattr=+2e3 -mattr=+fpuv3_sf -mattr=+fpuv3_df | FileCheck %s --check-prefix=CHECK-DF2


;ueq

define i1 @FCMP_DOUBLE_ueq(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ueq:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpuod vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    fcmpned vr1, vr0
; CHECK-DF-NEXT:    mvcv16 a1
; CHECK-DF-NEXT:    or16 a0, a1
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ueq:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpuo.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    fcmpne.64 vr1, vr0
; CHECK-DF2-NEXT:    mvcv16 a1
; CHECK-DF2-NEXT:    or16 a0, a1
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ueq double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ueq(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ueq:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI1_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpuod vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    fcmpned vr0, vr1
; CHECK-DF-NEXT:    mvcv16 a1
; CHECK-DF-NEXT:    or16 a0, a1
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI1_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ueq:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI1_0]
; CHECK-DF2-NEXT:    fcmpuo.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    fcmpne.64 vr0, vr1
; CHECK-DF2-NEXT:    mvcv16 a1
; CHECK-DF2-NEXT:    or16 a0, a1
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI1_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp ueq double %x, 0.0
  ret i1 %fcmp
}

;une

define i1 @FCMP_DOUBLE_une(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_une:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpned vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_une:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpne.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp une double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_une(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_une:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI3_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpned vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI3_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_une:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI3_0]
; CHECK-DF2-NEXT:    fcmpne.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI3_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp une double %x, 0.0
  ret i1 %fcmp
}

;ugt

define i1 @FCMP_DOUBLE_ugt(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ugt:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmphsd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ugt:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmphs.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ugt double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ugt(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ugt:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI5_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmphsd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI5_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ugt:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI5_0]
; CHECK-DF2-NEXT:    fcmphs.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI5_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp ugt double %x, 0.0
  ret i1 %fcmp
}


;uge

define i1 @FCMP_DOUBLE_uge(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_uge:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpltd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_uge:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmplt.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp uge double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_uge(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_uge:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI7_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpltd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI7_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_uge:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI7_0]
; CHECK-DF2-NEXT:    fcmplt.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI7_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp uge double %x, 0.0
  ret i1 %fcmp
}


;ult

define i1 @FCMP_DOUBLE_ult(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ult:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmphsd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ult:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmphs.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ult double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ult(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ult:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI9_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmphsd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI9_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ult:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI9_0]
; CHECK-DF2-NEXT:    fcmphs.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI9_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp ult double %x, 0.0
  ret i1 %fcmp
}


;ule

define i1 @FCMP_DOUBLE_ule(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ule:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpltd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ule:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmplt.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ule double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ule(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ule:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI11_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpltd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    xori32 a0, a0, 1
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI11_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ule:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI11_0]
; CHECK-DF2-NEXT:    fcmplt.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    xori32 a0, a0, 1
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI11_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp ule double %x, 0.0
  ret i1 %fcmp
}


;ogt

define i1 @FCMP_DOUBLE_ogt(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ogt:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpltd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ogt:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmplt.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ogt double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ogt(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ogt:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI13_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpltd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI13_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ogt:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI13_0]
; CHECK-DF2-NEXT:    fcmplt.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI13_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp ogt double %x, 0.0
  ret i1 %fcmp
}

;oge

define i1 @FCMP_DOUBLE_oge(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_oge:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmphsd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_oge:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmphs.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp oge double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_oge(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_oge:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI15_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmphsd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI15_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_oge:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI15_0]
; CHECK-DF2-NEXT:    fcmphs.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI15_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp oge double %x, 0.0
  ret i1 %fcmp
}


;olt

define i1 @FCMP_DOUBLE_olt(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_olt:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpltd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_olt:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmplt.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp olt double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_olt(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_olt:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI17_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpltd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI17_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_olt:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI17_0]
; CHECK-DF2-NEXT:    fcmplt.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI17_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp olt double %x, 0.0
  ret i1 %fcmp
}

;ole

define i1 @FCMP_DOUBLE_ole(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ole:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmphsd vr0, vr1
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ole:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmphs.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ole double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ole(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ole:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI19_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmphsd vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI19_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ole:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI19_0]
; CHECK-DF2-NEXT:    fcmphs.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI19_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp ole double %x, 0.0
  ret i1 %fcmp
}

;one

define i1 @FCMP_DOUBLE_one(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_one:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpuod vr1, vr0
; CHECK-DF-NEXT:    mvcv16 a0
; CHECK-DF-NEXT:    fcmpned vr1, vr0
; CHECK-DF-NEXT:    mvc32 a1
; CHECK-DF-NEXT:    and16 a0, a1
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_one:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpuo.64 vr1, vr0
; CHECK-DF2-NEXT:    mvcv16 a0
; CHECK-DF2-NEXT:    fcmpne.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a1
; CHECK-DF2-NEXT:    and16 a0, a1
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp one double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_one(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_one:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI21_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpuod vr0, vr1
; CHECK-DF-NEXT:    mvcv16 a0
; CHECK-DF-NEXT:    fcmpned vr0, vr1
; CHECK-DF-NEXT:    mvc32 a1
; CHECK-DF-NEXT:    and16 a0, a1
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI21_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_one:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI21_0]
; CHECK-DF2-NEXT:    fcmpuo.64 vr0, vr1
; CHECK-DF2-NEXT:    mvcv16 a0
; CHECK-DF2-NEXT:    fcmpne.64 vr0, vr1
; CHECK-DF2-NEXT:    mvc32 a1
; CHECK-DF2-NEXT:    and16 a0, a1
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI21_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp one double %x, 0.0
  ret i1 %fcmp
}

;oeq

define i1 @FCMP_DOUBLE_oeq(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_oeq:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpned vr1, vr0
; CHECK-DF-NEXT:    mvcv16 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_oeq:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpne.64 vr1, vr0
; CHECK-DF2-NEXT:    mvcv16 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp oeq double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_oeq(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_oeq:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    grs32 a0, .LCPI23_0
; CHECK-DF-NEXT:    fldd vr1, (a0, 0)
; CHECK-DF-NEXT:    fcmpned vr0, vr1
; CHECK-DF-NEXT:    mvcv16 a0
; CHECK-DF-NEXT:    rts16
; CHECK-DF-NEXT:    .p2align 1
; CHECK-DF-NEXT:  # %bb.1:
; CHECK-DF-NEXT:    .p2align 2
; CHECK-DF-NEXT:  .LCPI23_0:
; CHECK-DF-NEXT:    .quad 0x0000000000000000 # double 0
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_oeq:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    flrw.64 vr1, [.LCPI23_0]
; CHECK-DF2-NEXT:    fcmpne.64 vr0, vr1
; CHECK-DF2-NEXT:    mvcv16 a0
; CHECK-DF2-NEXT:    rts16
; CHECK-DF2-NEXT:    .p2align 1
; CHECK-DF2-NEXT:  # %bb.1:
; CHECK-DF2-NEXT:    .p2align 2
; CHECK-DF2-NEXT:  .LCPI23_0:
; CHECK-DF2-NEXT:    .quad 0x0000000000000000 # double 0
entry:
  %fcmp = fcmp oeq double %x, 0.0
  ret i1 %fcmp
}

;ord

define i1 @FCMP_DOUBLE_ord(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_ord:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpuod vr1, vr0
; CHECK-DF-NEXT:    mvcv16 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_ord:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpuo.64 vr1, vr0
; CHECK-DF2-NEXT:    mvcv16 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ord double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_ord(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_ord:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpuod vr0, vr0
; CHECK-DF-NEXT:    mvcv16 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_ord:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpuo.64 vr0, vr0
; CHECK-DF2-NEXT:    mvcv16 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp ord double %x, 0.0
  ret i1 %fcmp
}

;uno

define i1 @FCMP_DOUBLE_uno(double %x, double %y) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_uno:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpuod vr1, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_uno:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpuo.64 vr1, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp uno double %y, %x
  ret i1 %fcmp
}

define i1 @FCMP_DOUBLE_I_uno(double %x) {
;
;
; CHECK-DF-LABEL: FCMP_DOUBLE_I_uno:
; CHECK-DF:       # %bb.0: # %entry
; CHECK-DF-NEXT:    fcmpuod vr0, vr0
; CHECK-DF-NEXT:    mvc32 a0
; CHECK-DF-NEXT:    rts16
;
; CHECK-DF2-LABEL: FCMP_DOUBLE_I_uno:
; CHECK-DF2:       # %bb.0: # %entry
; CHECK-DF2-NEXT:    fcmpuo.64 vr0, vr0
; CHECK-DF2-NEXT:    mvc32 a0
; CHECK-DF2-NEXT:    rts16
entry:
  %fcmp = fcmp uno double %x, 0.0
  ret i1 %fcmp
}