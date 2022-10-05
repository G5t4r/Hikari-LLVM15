; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx1010 < %s | FileCheck -check-prefixes=FAST %s
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx90a < %s | FileCheck -check-prefixes=FAST %s
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 < %s | FileCheck -check-prefixes=FAST %s
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck -check-prefixes=SLOW %s

; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx1010 < %s | FileCheck -check-prefixes=ALL-SIZE %s
; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx90a < %s | FileCheck -check-prefixes=ALL-SIZE %s
; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 < %s | FileCheck -check-prefixes=ALL-SIZE %s
; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck -check-prefixes=ALL-SIZE %s
; END.

declare i64        @llvm.umax.i64(i64, i64)
declare <2 x i64>  @llvm.umax.v2i64(<2 x i64>, <2 x i64>)
declare <4 x i64>  @llvm.umax.v4i64(<4 x i64>, <4 x i64>)
declare <8 x i64>  @llvm.umax.v8i64(<8 x i64>, <8 x i64>)

declare i32        @llvm.umax.i32(i32, i32)
declare <2 x i32>  @llvm.umax.v2i32(<2 x i32>, <2 x i32>)
declare <4 x i32>  @llvm.umax.v4i32(<4 x i32>, <4 x i32>)
declare <8 x i32>  @llvm.umax.v8i32(<8 x i32>, <8 x i32>)
declare <16 x i32> @llvm.umax.v16i32(<16 x i32>, <16 x i32>)

declare i16        @llvm.umax.i16(i16, i16)
declare <2 x i16>  @llvm.umax.v2i16(<2 x i16>, <2 x i16>)
declare <4 x i16>  @llvm.umax.v4i16(<4 x i16>, <4 x i16>)
declare <8 x i16>  @llvm.umax.v8i16(<8 x i16>, <8 x i16>)
declare <16 x i16> @llvm.umax.v16i16(<16 x i16>, <16 x i16>)
declare <32 x i16> @llvm.umax.v32i16(<32 x i16>, <32 x i16>)

declare i8         @llvm.umax.i8(i8,  i8)
declare <2 x i8>   @llvm.umax.v2i8(<2 x i8>, <2 x i8>)
declare <4 x i8>   @llvm.umax.v4i8(<4 x i8>, <4 x i8>)
declare <8 x i8>   @llvm.umax.v8i8(<8 x i8>, <8 x i8>)
declare <16 x i8>  @llvm.umax.v16i8(<16 x i8>, <16 x i8>)
declare <32 x i8>  @llvm.umax.v32i8(<32 x i8>, <32 x i8>)
declare <64 x i8>  @llvm.umax.v64i8(<64 x i8>, <64 x i8>)

define i32 @umax(i32 %arg) {
; FAST-LABEL: 'umax'
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I64 = call i64 @llvm.umax.i64(i64 undef, i64 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I64 = call <2 x i64> @llvm.umax.v2i64(<2 x i64> undef, <2 x i64> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I64 = call <4 x i64> @llvm.umax.v4i64(<4 x i64> undef, <4 x i64> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I64 = call <8 x i64> @llvm.umax.v8i64(<8 x i64> undef, <8 x i64> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I32 = call i32 @llvm.umax.i32(i32 undef, i32 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I32 = call <2 x i32> @llvm.umax.v2i32(<2 x i32> undef, <2 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I32 = call <4 x i32> @llvm.umax.v4i32(<4 x i32> undef, <4 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I32 = call <8 x i32> @llvm.umax.v8i32(<8 x i32> undef, <8 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I32 = call <16 x i32> @llvm.umax.v16i32(<16 x i32> undef, <16 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I16 = call i16 @llvm.umax.i16(i16 undef, i16 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I16 = call <2 x i16> @llvm.umax.v2i16(<2 x i16> undef, <2 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V4I16 = call <4 x i16> @llvm.umax.v4i16(<4 x i16> undef, <4 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 30 for instruction: %V8I16 = call <8 x i16> @llvm.umax.v8i16(<8 x i16> undef, <8 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 62 for instruction: %V16I16 = call <16 x i16> @llvm.umax.v16i16(<16 x i16> undef, <16 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 126 for instruction: %V32I16 = call <32 x i16> @llvm.umax.v32i16(<32 x i16> undef, <32 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I8 = call i8 @llvm.umax.i8(i8 undef, i8 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I8 = call <2 x i8> @llvm.umax.v2i8(<2 x i8> undef, <2 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I8 = call <4 x i8> @llvm.umax.v4i8(<4 x i8> undef, <4 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I8 = call <8 x i8> @llvm.umax.v8i8(<8 x i8> undef, <8 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I8 = call <16 x i8> @llvm.umax.v16i8(<16 x i8> undef, <16 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32I8 = call <32 x i8> @llvm.umax.v32i8(<32 x i8> undef, <32 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 256 for instruction: %V64I8 = call <64 x i8> @llvm.umax.v64i8(<64 x i8> undef, <64 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret i32 undef
;
; SLOW-LABEL: 'umax'
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I64 = call i64 @llvm.umax.i64(i64 undef, i64 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I64 = call <2 x i64> @llvm.umax.v2i64(<2 x i64> undef, <2 x i64> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I64 = call <4 x i64> @llvm.umax.v4i64(<4 x i64> undef, <4 x i64> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I64 = call <8 x i64> @llvm.umax.v8i64(<8 x i64> undef, <8 x i64> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I32 = call i32 @llvm.umax.i32(i32 undef, i32 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I32 = call <2 x i32> @llvm.umax.v2i32(<2 x i32> undef, <2 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I32 = call <4 x i32> @llvm.umax.v4i32(<4 x i32> undef, <4 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I32 = call <8 x i32> @llvm.umax.v8i32(<8 x i32> undef, <8 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I32 = call <16 x i32> @llvm.umax.v16i32(<16 x i32> undef, <16 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I16 = call i16 @llvm.umax.i16(i16 undef, i16 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I16 = call <2 x i16> @llvm.umax.v2i16(<2 x i16> undef, <2 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I16 = call <4 x i16> @llvm.umax.v4i16(<4 x i16> undef, <4 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I16 = call <8 x i16> @llvm.umax.v8i16(<8 x i16> undef, <8 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I16 = call <16 x i16> @llvm.umax.v16i16(<16 x i16> undef, <16 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32I16 = call <32 x i16> @llvm.umax.v32i16(<32 x i16> undef, <32 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I8 = call i8 @llvm.umax.i8(i8 undef, i8 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I8 = call <2 x i8> @llvm.umax.v2i8(<2 x i8> undef, <2 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I8 = call <4 x i8> @llvm.umax.v4i8(<4 x i8> undef, <4 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I8 = call <8 x i8> @llvm.umax.v8i8(<8 x i8> undef, <8 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I8 = call <16 x i8> @llvm.umax.v16i8(<16 x i8> undef, <16 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32I8 = call <32 x i8> @llvm.umax.v32i8(<32 x i8> undef, <32 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 256 for instruction: %V64I8 = call <64 x i8> @llvm.umax.v64i8(<64 x i8> undef, <64 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret i32 undef
;
; ALL-SIZE-LABEL: 'umax'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I64 = call i64 @llvm.umax.i64(i64 undef, i64 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I64 = call <2 x i64> @llvm.umax.v2i64(<2 x i64> undef, <2 x i64> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I64 = call <4 x i64> @llvm.umax.v4i64(<4 x i64> undef, <4 x i64> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I64 = call <8 x i64> @llvm.umax.v8i64(<8 x i64> undef, <8 x i64> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I32 = call i32 @llvm.umax.i32(i32 undef, i32 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I32 = call <2 x i32> @llvm.umax.v2i32(<2 x i32> undef, <2 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I32 = call <4 x i32> @llvm.umax.v4i32(<4 x i32> undef, <4 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = call <8 x i32> @llvm.umax.v8i32(<8 x i32> undef, <8 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I32 = call <16 x i32> @llvm.umax.v16i32(<16 x i32> undef, <16 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I16 = call i16 @llvm.umax.i16(i16 undef, i16 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I16 = call <2 x i16> @llvm.umax.v2i16(<2 x i16> undef, <2 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I16 = call <4 x i16> @llvm.umax.v4i16(<4 x i16> undef, <4 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I16 = call <8 x i16> @llvm.umax.v8i16(<8 x i16> undef, <8 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = call <16 x i16> @llvm.umax.v16i16(<16 x i16> undef, <16 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I16 = call <32 x i16> @llvm.umax.v32i16(<32 x i16> undef, <32 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I8 = call i8 @llvm.umax.i8(i8 undef, i8 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I8 = call <2 x i8> @llvm.umax.v2i8(<2 x i8> undef, <2 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I8 = call <4 x i8> @llvm.umax.v4i8(<4 x i8> undef, <4 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I8 = call <8 x i8> @llvm.umax.v8i8(<8 x i8> undef, <8 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I8 = call <16 x i8> @llvm.umax.v16i8(<16 x i8> undef, <16 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = call <32 x i8> @llvm.umax.v32i8(<32 x i8> undef, <32 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V64I8 = call <64 x i8> @llvm.umax.v64i8(<64 x i8> undef, <64 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
  %I64 = call i64 @llvm.umax.i64(i64 undef, i64 undef)
  %V2I64 = call <2 x i64> @llvm.umax.v2i64(<2 x i64> undef, <2 x i64> undef)
  %V4I64 = call <4 x i64> @llvm.umax.v4i64(<4 x i64> undef, <4 x i64> undef)
  %V8I64 = call <8 x i64> @llvm.umax.v8i64(<8 x i64> undef, <8 x i64> undef)

  %I32 = call i32 @llvm.umax.i32(i32 undef, i32 undef)
  %V2I32  = call <2 x i32>  @llvm.umax.v2i32(<2 x i32> undef, <2 x i32> undef)
  %V4I32  = call <4 x i32>  @llvm.umax.v4i32(<4 x i32> undef, <4 x i32> undef)
  %V8I32  = call <8 x i32>  @llvm.umax.v8i32(<8 x i32> undef, <8 x i32> undef)
  %V16I32 = call <16 x i32> @llvm.umax.v16i32(<16 x i32> undef, <16 x i32> undef)

  %I16 = call i16 @llvm.umax.i16(i16 undef, i16 undef)
  %V2I16  = call <2 x i16>  @llvm.umax.v2i16(<2 x i16> undef, <2 x i16> undef)
  %V4I16  = call <4 x i16>  @llvm.umax.v4i16(<4 x i16> undef, <4 x i16> undef)
  %V8I16  = call <8 x i16>  @llvm.umax.v8i16(<8 x i16> undef, <8 x i16> undef)
  %V16I16 = call <16 x i16> @llvm.umax.v16i16(<16 x i16> undef, <16 x i16> undef)
  %V32I16 = call <32 x i16> @llvm.umax.v32i16(<32 x i16> undef, <32 x i16> undef)

  %I8 = call i8 @llvm.umax.i8(i8 undef, i8 undef)
  %V2I8 =  call <2 x i8>  @llvm.umax.v2i8(<2 x i8> undef, <2 x i8> undef)
  %V4I8 =  call <4 x i8>  @llvm.umax.v4i8(<4 x i8> undef, <4 x i8> undef)
  %V8I8 =  call <8 x i8>  @llvm.umax.v8i8(<8 x i8> undef, <8 x i8> undef)
  %V16I8 = call <16 x i8> @llvm.umax.v16i8(<16 x i8> undef, <16 x i8> undef)
  %V32I8 = call <32 x i8> @llvm.umax.v32i8(<32 x i8> undef, <32 x i8> undef)
  %V64I8 = call <64 x i8> @llvm.umax.v64i8(<64 x i8> undef, <64 x i8> undef)

  ret i32 undef
}

declare i64        @llvm.umin.i64(i64, i64)
declare <2 x i64>  @llvm.umin.v2i64(<2 x i64>, <2 x i64>)
declare <4 x i64>  @llvm.umin.v4i64(<4 x i64>, <4 x i64>)
declare <8 x i64>  @llvm.umin.v8i64(<8 x i64>, <8 x i64>)

declare i32        @llvm.umin.i32(i32, i32)
declare <2 x i32>  @llvm.umin.v2i32(<2 x i32>, <2 x i32>)
declare <4 x i32>  @llvm.umin.v4i32(<4 x i32>, <4 x i32>)
declare <8 x i32>  @llvm.umin.v8i32(<8 x i32>, <8 x i32>)
declare <16 x i32> @llvm.umin.v16i32(<16 x i32>, <16 x i32>)

declare i16        @llvm.umin.i16(i16, i16)
declare <2 x i16>  @llvm.umin.v2i16(<2 x i16>, <2 x i16>)
declare <4 x i16>  @llvm.umin.v4i16(<4 x i16>, <4 x i16>)
declare <8 x i16>  @llvm.umin.v8i16(<8 x i16>, <8 x i16>)
declare <16 x i16> @llvm.umin.v16i16(<16 x i16>, <16 x i16>)
declare <32 x i16> @llvm.umin.v32i16(<32 x i16>, <32 x i16>)

declare i8         @llvm.umin.i8(i8,  i8)
declare <2 x i8>   @llvm.umin.v2i8(<2 x i8>, <2 x i8>)
declare <4 x i8>   @llvm.umin.v4i8(<4 x i8>, <4 x i8>)
declare <8 x i8>   @llvm.umin.v8i8(<8 x i8>, <8 x i8>)
declare <16 x i8>  @llvm.umin.v16i8(<16 x i8>, <16 x i8>)
declare <32 x i8>  @llvm.umin.v32i8(<32 x i8>, <32 x i8>)
declare <64 x i8>  @llvm.umin.v64i8(<64 x i8>, <64 x i8>)

define i32 @umin(i32 %arg) {
; FAST-LABEL: 'umin'
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I64 = call i64 @llvm.umin.i64(i64 undef, i64 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I64 = call <2 x i64> @llvm.umin.v2i64(<2 x i64> undef, <2 x i64> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I64 = call <4 x i64> @llvm.umin.v4i64(<4 x i64> undef, <4 x i64> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I64 = call <8 x i64> @llvm.umin.v8i64(<8 x i64> undef, <8 x i64> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I32 = call i32 @llvm.umin.i32(i32 undef, i32 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I32 = call <2 x i32> @llvm.umin.v2i32(<2 x i32> undef, <2 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I32 = call <4 x i32> @llvm.umin.v4i32(<4 x i32> undef, <4 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I32 = call <8 x i32> @llvm.umin.v8i32(<8 x i32> undef, <8 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I32 = call <16 x i32> @llvm.umin.v16i32(<16 x i32> undef, <16 x i32> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I16 = call i16 @llvm.umin.i16(i16 undef, i16 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I16 = call <2 x i16> @llvm.umin.v2i16(<2 x i16> undef, <2 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V4I16 = call <4 x i16> @llvm.umin.v4i16(<4 x i16> undef, <4 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 30 for instruction: %V8I16 = call <8 x i16> @llvm.umin.v8i16(<8 x i16> undef, <8 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 62 for instruction: %V16I16 = call <16 x i16> @llvm.umin.v16i16(<16 x i16> undef, <16 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 126 for instruction: %V32I16 = call <32 x i16> @llvm.umin.v32i16(<32 x i16> undef, <32 x i16> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I8 = call i8 @llvm.umin.i8(i8 undef, i8 undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I8 = call <2 x i8> @llvm.umin.v2i8(<2 x i8> undef, <2 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I8 = call <4 x i8> @llvm.umin.v4i8(<4 x i8> undef, <4 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I8 = call <8 x i8> @llvm.umin.v8i8(<8 x i8> undef, <8 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I8 = call <16 x i8> @llvm.umin.v16i8(<16 x i8> undef, <16 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32I8 = call <32 x i8> @llvm.umin.v32i8(<32 x i8> undef, <32 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 256 for instruction: %V64I8 = call <64 x i8> @llvm.umin.v64i8(<64 x i8> undef, <64 x i8> undef)
; FAST-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret i32 undef
;
; SLOW-LABEL: 'umin'
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I64 = call i64 @llvm.umin.i64(i64 undef, i64 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I64 = call <2 x i64> @llvm.umin.v2i64(<2 x i64> undef, <2 x i64> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I64 = call <4 x i64> @llvm.umin.v4i64(<4 x i64> undef, <4 x i64> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I64 = call <8 x i64> @llvm.umin.v8i64(<8 x i64> undef, <8 x i64> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I32 = call i32 @llvm.umin.i32(i32 undef, i32 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I32 = call <2 x i32> @llvm.umin.v2i32(<2 x i32> undef, <2 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I32 = call <4 x i32> @llvm.umin.v4i32(<4 x i32> undef, <4 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I32 = call <8 x i32> @llvm.umin.v8i32(<8 x i32> undef, <8 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I32 = call <16 x i32> @llvm.umin.v16i32(<16 x i32> undef, <16 x i32> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I16 = call i16 @llvm.umin.i16(i16 undef, i16 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I16 = call <2 x i16> @llvm.umin.v2i16(<2 x i16> undef, <2 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I16 = call <4 x i16> @llvm.umin.v4i16(<4 x i16> undef, <4 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I16 = call <8 x i16> @llvm.umin.v8i16(<8 x i16> undef, <8 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I16 = call <16 x i16> @llvm.umin.v16i16(<16 x i16> undef, <16 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32I16 = call <32 x i16> @llvm.umin.v32i16(<32 x i16> undef, <32 x i16> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I8 = call i8 @llvm.umin.i8(i8 undef, i8 undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I8 = call <2 x i8> @llvm.umin.v2i8(<2 x i8> undef, <2 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I8 = call <4 x i8> @llvm.umin.v4i8(<4 x i8> undef, <4 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I8 = call <8 x i8> @llvm.umin.v8i8(<8 x i8> undef, <8 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I8 = call <16 x i8> @llvm.umin.v16i8(<16 x i8> undef, <16 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32I8 = call <32 x i8> @llvm.umin.v32i8(<32 x i8> undef, <32 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 256 for instruction: %V64I8 = call <64 x i8> @llvm.umin.v64i8(<64 x i8> undef, <64 x i8> undef)
; SLOW-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret i32 undef
;
; ALL-SIZE-LABEL: 'umin'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I64 = call i64 @llvm.umin.i64(i64 undef, i64 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I64 = call <2 x i64> @llvm.umin.v2i64(<2 x i64> undef, <2 x i64> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I64 = call <4 x i64> @llvm.umin.v4i64(<4 x i64> undef, <4 x i64> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I64 = call <8 x i64> @llvm.umin.v8i64(<8 x i64> undef, <8 x i64> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I32 = call i32 @llvm.umin.i32(i32 undef, i32 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I32 = call <2 x i32> @llvm.umin.v2i32(<2 x i32> undef, <2 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I32 = call <4 x i32> @llvm.umin.v4i32(<4 x i32> undef, <4 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = call <8 x i32> @llvm.umin.v8i32(<8 x i32> undef, <8 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I32 = call <16 x i32> @llvm.umin.v16i32(<16 x i32> undef, <16 x i32> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I16 = call i16 @llvm.umin.i16(i16 undef, i16 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I16 = call <2 x i16> @llvm.umin.v2i16(<2 x i16> undef, <2 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I16 = call <4 x i16> @llvm.umin.v4i16(<4 x i16> undef, <4 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I16 = call <8 x i16> @llvm.umin.v8i16(<8 x i16> undef, <8 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = call <16 x i16> @llvm.umin.v16i16(<16 x i16> undef, <16 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I16 = call <32 x i16> @llvm.umin.v32i16(<32 x i16> undef, <32 x i16> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %I8 = call i8 @llvm.umin.i8(i8 undef, i8 undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V2I8 = call <2 x i8> @llvm.umin.v2i8(<2 x i8> undef, <2 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I8 = call <4 x i8> @llvm.umin.v4i8(<4 x i8> undef, <4 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I8 = call <8 x i8> @llvm.umin.v8i8(<8 x i8> undef, <8 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I8 = call <16 x i8> @llvm.umin.v16i8(<16 x i8> undef, <16 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = call <32 x i8> @llvm.umin.v32i8(<32 x i8> undef, <32 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V64I8 = call <64 x i8> @llvm.umin.v64i8(<64 x i8> undef, <64 x i8> undef)
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
  %I64 = call i64 @llvm.umin.i64(i64 undef, i64 undef)
  %V2I64 = call <2 x i64> @llvm.umin.v2i64(<2 x i64> undef, <2 x i64> undef)
  %V4I64 = call <4 x i64> @llvm.umin.v4i64(<4 x i64> undef, <4 x i64> undef)
  %V8I64 = call <8 x i64> @llvm.umin.v8i64(<8 x i64> undef, <8 x i64> undef)

  %I32 = call i32 @llvm.umin.i32(i32 undef, i32 undef)
  %V2I32  = call <2 x i32>  @llvm.umin.v2i32(<2 x i32> undef, <2 x i32> undef)
  %V4I32  = call <4 x i32>  @llvm.umin.v4i32(<4 x i32> undef, <4 x i32> undef)
  %V8I32  = call <8 x i32>  @llvm.umin.v8i32(<8 x i32> undef, <8 x i32> undef)
  %V16I32 = call <16 x i32> @llvm.umin.v16i32(<16 x i32> undef, <16 x i32> undef)

  %I16 = call i16 @llvm.umin.i16(i16 undef, i16 undef)
  %V2I16  = call <2 x i16>  @llvm.umin.v2i16(<2 x i16> undef, <2 x i16> undef)
  %V4I16  = call <4 x i16>  @llvm.umin.v4i16(<4 x i16> undef, <4 x i16> undef)
  %V8I16  = call <8 x i16>  @llvm.umin.v8i16(<8 x i16> undef, <8 x i16> undef)
  %V16I16 = call <16 x i16> @llvm.umin.v16i16(<16 x i16> undef, <16 x i16> undef)
  %V32I16 = call <32 x i16> @llvm.umin.v32i16(<32 x i16> undef, <32 x i16> undef)

  %I8 = call i8 @llvm.umin.i8(i8 undef, i8 undef)
  %V2I8 =  call <2 x i8>  @llvm.umin.v2i8(<2 x i8> undef, <2 x i8> undef)
  %V4I8 =  call <4 x i8>  @llvm.umin.v4i8(<4 x i8> undef, <4 x i8> undef)
  %V8I8 =  call <8 x i8>  @llvm.umin.v8i8(<8 x i8> undef, <8 x i8> undef)
  %V16I8 = call <16 x i8> @llvm.umin.v16i8(<16 x i8> undef, <16 x i8> undef)
  %V32I8 = call <32 x i8> @llvm.umin.v32i8(<32 x i8> undef, <32 x i8> undef)
  %V64I8 = call <64 x i8> @llvm.umin.v64i8(<64 x i8> undef, <64 x i8> undef)

  ret i32 undef
}