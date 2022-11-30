; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -function-specialization -force-function-specialization -S < %s | FileCheck %s

; Check that we don't crash and specialise on a poison value.

%struct.quux = type { i16 }
%struct.spam = type { i16 }

@global.12 = external global %struct.quux, align 1

define internal i16 @wobble(%struct.spam* byval(%struct.spam) %arg2) {
; CHECK-LABEL: @wobble(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[C:%.*]] = bitcast %struct.spam* [[ARG2:%.*]] to i16*
; CHECK-NEXT:    unreachable
;
bb:
  %C = bitcast %struct.spam* %arg2 to i16*
  unreachable
}

define internal i16 @snork() {
; CHECK-LABEL: @snork(
; CHECK-NEXT:  bb4:
; CHECK-NEXT:    [[B:%.*]] = call i16 @wobble(%struct.spam* poison)
; CHECK-NEXT:    unreachable
;
bb4:
  %B = call i16 @wobble(%struct.spam* poison)
  unreachable
}

define i16 @main() {
; CHECK-LABEL: @main(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[A:%.*]] = call i16 @snork()
; CHECK-NEXT:    unreachable
;
bb:
  %A = call i16 @snork()
  unreachable
}