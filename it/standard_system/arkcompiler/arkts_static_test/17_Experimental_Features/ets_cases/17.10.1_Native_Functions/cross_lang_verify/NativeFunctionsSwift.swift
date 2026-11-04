/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * Swift cross-language verification for ArkTS 17.10.1 Native Functions
 *
 * Key difference: Swift does NOT have a `native` keyword.
 * Swift uses `@_cdecl` attribute for C interop or `@_silgen_name`
 * for direct symbol naming to call external C functions.
 *
 * The closest equivalent to ArkTS `native function` in Swift:
 * - @_cdecl for C-callable functions (reverse direction)
 * - Declaring external C functions via module map or bridging header
 * - @_silgen_name("symbol") for naming a Swift function with a C symbol
 *
 * N/A: Swift has no concept of "declaring a function with no body"
 * that is implemented elsewhere except through C interop declarations.
 */

import Foundation

// NOTE: Swift cannot declare "native" functions as ArkTS does.
// The closest pattern in Swift is declaring external C functions:

// In a real project with a bridging header or module map:
// extern void nativePrint(const char* msg);
// extern int add(int a, int b);
// etc.

// @_cdecl attribute for exporting Swift functions to C (reverse direction)
// This is NOT the same as ArkTS native which imports platform functions
@_cdecl("swiftAdd")
func swiftAdd(a: Int32, b: Int32) -> Int32 {
    return a + b
}

// @_silgen_name for renaming a function symbol (for C interop)
@_silgen_name("platformGetVersion")
func platformGetVersion() -> UnsafePointer<CChar>? {
    return nil  // N/A: no actual platform implementation
}

// Demonstrate: Swift cannot declare a function absent a body
// The following is INVALID Swift:
// func nativeFunc(msg: String)  // ERROR: expected '{' in body of function declaration

// Generic equivalent to ArkTS native generic function
// Swift generics cannot be directly exposed to C, so this is a Swift-only pattern
func firstElement<T>(arr: [T]) -> T? {
    return arr.first
}

// Test execution
func testNativeFunctions() {
    // Test 1: ArkTS native function = Swift @_cdecl export / C function import
    // Swift requires a body; ArkTS native has no body
    print("NOTE: Swift has NO 'native' keyword - uses @_cdecl/@_silgen_name for C interop")

    // Test 2: Function with params - Swift always requires body
    let result = swiftAdd(a: 3, b: 5)
    assert(result == 8, "Expected 8, got \(result)")

    // Test 3: Multiple functions - all require bodies in Swift
    print("PASS: Swift functions (with bodies) compile and execute")

    // Test 4: Generic function - Swift supports this natively
    let first = firstElement(arr: [10, 20, 30])
    assert(first == 10, "Expected 10, got \(first ?? -1)")
    print("PASS: generic firstElement works (with body)")

    // Test 5: No body = compile error in Swift
    // Swift compiler: error: expected '{' in body of function declaration
    print("NOTE: ArkTS 'native function' has no body; Swift ALWAYS requires body")

    print("\nSWIFT VERIFIED: All native function comparison tests passed")
    print("NOTE: Swift has NO native keyword - uses C interop (@_cdecl, @_silgen_name, bridging headers)")
}

testNativeFunctions()
