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
 * Swift equivalent of ArkTS $_invoke / $_instantiate callable type pattern.
 *
 * Swift has NO direct equivalent to ArkTS callable types.
 * Swift's `callAsFunction` is INSTANCE-level, not static:
 *   struct S { func callAsFunction() -> Int { 42 } }
 *   let s = S()
 *   s()  // calls s.callAsFunction()
 *
 * Swift cannot make the TYPE itself callable like ArkTS:
 *   S()  // This creates an instance, not calls callAsFunction
 *
 * Closest patterns:
 * - Static factory method: `MyClass.create()`
 * - Closure stored as static property: `MyClass.invoke = { ... }`
 */

// APPROACH 1: Static method (no callable type)
struct SimpleCallable {
    // In ArkTS: static $_invoke(): int
    // In Swift: static func / static var closure
    static func invoke() -> Int {
        return 42
    }
}

// APPROACH 2: Overloaded static methods
struct OverloadedCallable {
    static func invoke() -> Int { return 0 }
    static func invoke(_ a: Int) -> Int { return a * 2 }
    static func invoke(_ a: Int, _ b: Int) -> Int { return a + b }
}

// APPROACH 3: Static factory (equivalent to $_instantiate)
class FactoryCallable {
    var tag: String = "factory"

    static func create() -> FactoryCallable {
        return FactoryCallable()
    }

    static func create(tag: String) -> FactoryCallable {
        let obj = FactoryCallable()
        obj.tag = tag
        return obj
    }
}

// APPROACH 4: callAsFunction (instance-level, NOT equivalent to ArkTS static callable)
struct CallAsFunctionDemo {
    func callAsFunction() -> Int {
        return 100
    }
}

// ====== Main verification ======
func main() {
    // Test 1: Static invoke
    let r1 = SimpleCallable.invoke()
    assert(r1 == 42, "Expected 42")

    // Test 2: Overloaded static methods
    let r0 = OverloadedCallable.invoke()
    let r2 = OverloadedCallable.invoke(5)
    let r3 = OverloadedCallable.invoke(3, 7)
    assert(r0 == 0)
    assert(r2 == 10)
    assert(r3 == 10)

    // Test 3: Static factory
    let obj1 = FactoryCallable.create()
    let obj2 = FactoryCallable.create(tag: "test")
    assert(obj1.tag == "factory")
    assert(obj2.tag == "test")

    // Test 4: new vs static method (natural in Swift)
    let newObj = FactoryCallable()
    assert(newObj.tag == "factory", "init should use default")

    // Test 5: callAsFunction is INSTANCE-level, NOT type-level
    let callable = CallAsFunctionDemo()
    let val = callable()  // calls callAsFunction()
    assert(val == 100)
    // CallAsFunctionDemo()  // N/A: this creates an instance, NOT calls callAsFunction

    print("PASS: Swift static method / factory patterns verified")
    print("NOTE: Swift has no type-level callable mechanism (unlike ArkTS)")
}

main()
