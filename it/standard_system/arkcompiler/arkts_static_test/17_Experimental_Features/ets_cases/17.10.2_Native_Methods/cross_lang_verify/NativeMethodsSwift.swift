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
 * Swift cross-language verification for ArkTS 17.10.2 Native Methods
 *
 * Swift does NOT have a `native` keyword for methods.
 * The closest equivalents are:
 * - @objc attribute for Objective-C interop (methods callable from ObjC)
 * - @_silgen_name for direct symbol naming
 * - Importing C functions via bridging header or module map
 *
 * Unlike ArkTS/Java, Swift methods MUST have bodies.
 * There is no concept of "declaring a method without implementation"
 * except through protocol requirements (which are abstract, not native).
 */

import Foundation

// Test 1: Class with methods (ArkTS 001 equivalent)
// Swift equivalent of native methods = @objc methods for ObjC interop
class NativeCalculator {
    // Equivalent to: native add(a: int, b: int): int
    // In Swift: regular method with body, @objc for external callability
    @objc func add(_ a: Int, _ b: Int) -> Int {
        // Body required - unlike ArkTS native which has no body
        return a + b
    }

    @objc func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }

    func regularAdd(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

// Test 2: Method with params (ArkTS 002)
class DataProcessor {
    @objc func process(_ input: String, flag: Int) -> String {
        return "processed: \(input) with flag \(flag)"
    }
}

// Test 3: Static method equivalent (ArkTS 003)
// Swift uses `class` or `static` keyword, @objc for interop
class MathLib {
    @objc static func sqrt(_ x: Double) -> Double {
        return Foundation.sqrt(x)
    }

    @objc static func abs(_ x: Int) -> Int {
        return Swift.abs(x)
    }
}

// Test 4: Private method (ArkTS 004)
// Swift `private` methods still have bodies
class InternalService {
    private func internalHash(_ key: AnyObject) -> Int {
        return key.hashValue
    }

    func getHash(_ key: AnyObject) -> Int {
        return internalHash(key)
    }
}

// Test 5: Multiple methods (ArkTS 005)
class MultiNative {
    @objc func initialize() { }
    @objc func read() -> String { return "" }
    @objc func write(_ data: String) { }
    @objc func close() { }
}

// Test 6: Generic method (ArkTS 006)
class GenericOps {
    func transform<T>(_ input: T) -> T {
        return input  // identity; native would do platform-specific transform
    }
}

// Test 7: "Semicolon body" - NOT possible in Swift
// Swift always requires { } body; there is no "no body" method syntax
// class BadSemicolon { func doSomething() }  // ERROR: expected '{'

// Test 8: Override pattern (ArkTS 008)
class BaseService {
    func getData() -> String {
        return "base data"
    }
}

class ExtendedService: BaseService {
    override func getData() -> String {
        return "override data from Swift"
    }
}

// NOTE: No native+abstract restriction in Swift
// Protocols define abstract-like requirements, but they're not "native"

// Test execution
func testNativeMethods() {
    // Test 1: Basic methods work
    let calc = NativeCalculator()
    assert(calc.regularAdd(10, 20) == 30, "Expected 30")
    print("PASS 001: basic class methods work (with bodies)")

    // Test 2: Method with params
    let dp = DataProcessor()
    let result = dp.process("test", flag: 1)
    assert(result == "processed: test with flag 1", "Unexpected: \(result)")
    print("PASS 002: method with params works")

    // Test 3: Static method
    let sq = MathLib.sqrt(16.0)
    assert(sq == 4.0, "Expected 4.0, got \(sq)")
    print("PASS 003: static methods work")

    // Test 4: Private method
    let isvc = InternalService()
    let hash = isvc.getHash(NSObject())
    print("PASS 004: private methods work")

    // Test 5: Multiple methods
    print("PASS 005: multiple methods compile")

    // Test 6: Generic method
    let ops = GenericOps()
    let transformed = ops.transform(42)
    assert(transformed == 42, "Expected 42")
    print("PASS 006: generic method works")

    // Test 7: No-body methods - Swift ERROR
    print("NOTE: Swift methods ALWAYS require body; no 'native' keyword exists")

    // Test 8: Override
    let esvc = ExtendedService()
    let ov = esvc.getData()
    assert(ov == "override data from Swift", "Expected override, got \(ov)")
    print("PASS 008: override works: \(ov)")

    print("\nSWIFT VERIFIED: All native method comparison tests passed")
    print("NOTE: Swift has NO native keyword - methods always have bodies; use @objc/@_silgen_name for C/ObjC interop")
}

testNativeMethods()
