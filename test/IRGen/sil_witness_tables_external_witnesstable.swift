// RUN: %empty-directory(%t)
// RUN: %target-swift-frontend -emit-module %S/Inputs/sil_witness_tables_external_input.swift -o %t/Swift.swiftmodule -parse-stdlib -parse-as-library -module-name Swift -module-link-name swiftCore
// RUN: %target-swift-frontend -I %t -primary-file %s -emit-ir | %FileCheck %s -check-prefix CHECK -check-prefix CHECK-%target-import-type

import Swift

// CHECK: @"$ss1XVN" = external {{(dllimport )?}}global %swift.type
// CHECK-DIRECT: @"$ss1XVs1PsWP" = external {{(dllimport )?}}global i8*
// CHECK-INDIRECT-NOT: @"$ss1XVs1PsWP" = external {{(dllimport )?}}global i8*

func doSomething<T : P>(_ t : T) -> Y {
  return t.doSomething()
}

func done() -> Y {
  let x = X()
  return doSomething(x)
}
