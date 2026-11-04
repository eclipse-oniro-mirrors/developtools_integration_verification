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
// Swift equivalent of ArkTS §17.7.1 Callable Types with $_invoke Method.
//
// Swift 5.2+ has `callAsFunction` which allows instances of a type to be called
// as functions. This is the closest analog to ArkTS $_invoke, but with a key
// difference: Swift's `callAsFunction` is INSTANCE-level, while ArkTS $_invoke
// is CLASS-level (static).
//
// Swift does NOT have a direct class-level callable pattern.
// You can call a type's static method, but not the type name itself.
//
// ⚠️ UNABLE TO EXECUTE: No Swift runtime available on this system.
// Code is written based on Swift 5.10 documentation and is expected to compile.
// Expected results are annotated.

// Case 1: Swift callAsFunction (instance-level, closest analog)
struct SimpleCallable {
    func callAsFunction() {
        print("SimpleCallable called")
    }
}
// Usage: let s = SimpleCallable(); s()  // ✅ calls callAsFunction
// NOT: SimpleCallable()  // This would call the constructor, not callAsFunction

// Case 2: callAsFunction with params and return
struct Calculator {
    func callAsFunction(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func callAsFunction(_ a: String, _ b: String) -> String {
        return a + b
    }
}
// Usage: let calc = Calculator(); calc(2, 3) → 5
// NOT: Calculator(2, 3)  // This would try to call an init with those args

// Case 3: Static method — the normal Swift way (like Java)
// Swift does NOT let you call a type name as a function directly,
// but you CAN call static methods on a metatype.
struct MathOp {
    static func add(_ a: Int, _ b: Int) -> Int { return a + b }
    static func multiply(_ a: Int, _ b: Int) -> Int { return a * b }
}
// Usage: MathOp.add(2, 3) → 5
// NOT: MathOp(2, 3)  // ❌ invalid

// Case 4: callAsFunction on a class (instance method, not static)
class ClassCallable {
    var value: Int
    init(value: Int) { self.value = value }
    func callAsFunction() -> Int { return value }
}
// Usage: let c = ClassCallable(value: 42); c() → 42
// NOT: ClassCallable()  // This is the constructor (init), not callAsFunction

// Case 5: Generic struct with callAsFunction
// Swift generics DO allow callAsFunction to use type parameters
// This is a key difference from ArkTS where static $_invoke cannot use type params
struct GenericCallable<T> {
    func callAsFunction(_ value: T) -> T {
        return value
    }
}
// Usage: let g = GenericCallable<Int>(); g(42) → 42
// Swift can do this because callAsFunction is instance-level

// Test assertions (expected results — cannot execute due to no Swift runtime)
// let s = SimpleCallable()
// s()  // prints: "SimpleCallable called"
//
// let calc = Calculator()
// assert(calc(2, 3) == 5)
// assert(calc("Hello", "World") == "HelloWorld")
//
// assert(MathOp.add(10, 20) == 30)
//
// let c = ClassCallable(value: 42)
// assert(c() == 42)
//
// let g = GenericCallable<Int>()
// assert(g(42) == 42)
//
// print("All Swift assertions would pass (expected)")

// N/A markers for ArkTS-specific concepts:
// N/A(1): Class-level callable (ClassName() → $_invoke) — Swift has no equivalent
// N/A(2): Explicit $_invoke call — Swift has no such named method convention
// N/A(3): Both $_invoke + $_instantiate error — N/A, concept doesn't exist
// N/A(4): Static method callable — Swift only supports instance-level callAsFunction
// N/A(5): "new expression" distinction — Swift's init is always called for construction

print("Swift code written for comparison. Cannot execute: no Swift runtime available.")
print("Swift callAsFunction is instance-level; ArkTS $_invoke is class-level (static).")
