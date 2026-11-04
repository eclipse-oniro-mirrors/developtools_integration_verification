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
 * Swift cross-language verification for ArkTS 17.10.3 Native Constructors
 *
 * Key difference: Swift does NOT have a `native` keyword at all,
 * and constructors (init) MUST have a body in Swift.
 *
 * There is NO equivalent to ArkTS `native constructor()` in Swift.
 * Swift constructors are always defined with an implementation body.
 *
 * The closest equivalent patterns:
 * 1. @objc init() for Objective-C interop - but still has a body
 * 2. Class with failable init?() returning nil for abstract-like behavior
 * 3. Factory method pattern wrapping C/ObjC object creation
 *
 * This is a CRITICAL difference: ArkTS uniquely allows native constructors.
 */

import Foundation

// Test 1: No-param constructor (ArkTS 001 equivalent)
// Swift: init always has body
class NativeCtorSwift {
    var val: Int = 0
    var factor: Double = 0.0

    // Swift: init MUST have body - equivalent to ArkTS non-native constructor
    // ArkTS: native constructor() would compile (no body)
    init() {
        self.val = 0
        self.factor = 0.0
    }

    init(val: Int) {
        self.val = val
        self.factor = Double(val) * 2.0
    }

    func getValue() -> Int { return val }
    func getDouble() -> Double { return factor }
}

// Test 2: Constructor with params (ArkTS 002 equivalent)
class NativeCtorWithParams {
    var value: Int
    var factor: Double

    // Equivalent to ArkTS native constructor(val: int, factor: double)
    // Swift requires body; ArkTS native constructor has none
    init(val: Int, factor: Double) {
        self.value = val
        self.factor = factor
    }
}

// Test 3: Subclass constructor (ArkTS 003 equivalent)
class BaseClass {
    init() {}
}

class DerivedNativeClass: BaseClass {
    // ArkTS: native constructor() would compile
    // Swift: init must call super.init() - no native concept
    override init() {
        super.init()
    }
}

// Test 4: Mixed constructors (ArkTS 004 equivalent)
class MixedCtorSwift {
    var xVal: Int
    var yVal: Double

    // Equivalent to ArkTS native constructor() - but Swift requires body
    init() {
        self.xVal = 0
        self.yVal = 0.0
    }

    // Equivalent to ArkTS regular constructor(val: int)
    init(val: Int) {
        self.xVal = val
        self.yVal = Double(val) * 2.0
    }

    func getValue() -> Int { return xVal }
    func getDouble() -> Double { return yVal }
}

// Test 5: Type usage (ArkTS 005 equivalent)
class NativeTypeClass {
    var tag: String

    init() {
        self.tag = "swift_type"
    }

    func describe() -> String { return tag }
}

// Verify: No-body init is INVALID in Swift
// class BadNative { init() }  // ERROR: expected '{' in body of 'init' declaration

// Test execution
func testNativeConstructors() {
    // Test 1: No-arg constructor
    let obj1 = NativeCtorSwift()
    assert(obj1.getValue() == 0, "Expected 0, got \(obj1.getValue())")
    print("PASS 001: no-arg init works (Swift: body required)")

    // Test 2: Parameterized constructor
    let obj2 = NativeCtorSwift(val: 21)
    assert(obj2.getValue() == 21, "Expected 21")
    assert(obj2.getDouble() == 42.0, "Expected 42.0")
    print("PASS 002: init with params works (Swift: body required)")

    // Test 3: Subclass
    let obj3 = DerivedNativeClass()
    print("PASS 003: subclass init works")

    // Test 4: Multiple constructors
    let obj4a = MixedCtorSwift()
    let obj4b = MixedCtorSwift(val: 15)
    assert(obj4b.getValue() == 15, "Expected 15, got \(obj4b.getValue())")
    assert(obj4b.getDouble() == 30.0, "Expected 30.0")
    print("PASS 004: multiple inits work (Swift: all need bodies)")

    // Test 5: Type usage
    var ref: NativeTypeClass? = nil
    assert(ref == nil, "Expected nil reference")
    let arr: [NativeTypeClass] = []
    assert(arr.count == 0, "Expected empty array")
    print("PASS 005: type usage works (nil reference, empty array)")

    // Key differences documented:
    print("\n--- KEY DIFFERENCES: Swift vs ArkTS native constructors ---")
    print("DIFF 1: Swift does NOT support native constructors")
    print("  ArkTS: native constructor()  -- compiles (ESE0084 if body present)")
    print("  Swift: init() {}             -- body ALWAYS required")
    print("DIFF 2: No 'native' keyword in Swift at all")
    print("  ArkTS: native keyword for functions, methods, constructors")
    print("  Swift: NO native keyword - uses @objc, @_cdecl, @_silgen_name")
    print("DIFF 3: Swift init always has body")
    print("  ArkTS: native constructor() has NO body (platform provides)")
    print("  Swift: init declarations MUST have body or be protocol requirements")

    print("\nSWIFT VERIFIED: All native constructor comparison tests passed")
    print("CONCLUSION: ArkTS native constructor is a unique feature; no equivalent in Swift")
}

testNativeConstructors()
