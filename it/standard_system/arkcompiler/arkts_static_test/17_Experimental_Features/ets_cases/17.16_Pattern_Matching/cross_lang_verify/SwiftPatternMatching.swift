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
 * Swift 5.x equivalent for ArkTS 17.16 Pattern Matching
 * Note: Swift uses 'is' keyword where ArkTS uses 'instanceof'
 * Swift compiler not available on this system - reference code only
 */

class Animal {
    var name = "animal"
}
class Dog: Animal {
    func bark() { print("woof") }
}
class Cat: Animal {
    func meow() { print("meow") }
}
class Fruit {
    var name = "fruit"
}
class Apple: Fruit {
    var color = "red"
}
class Banana: Fruit {
    var color = "yellow"
}

func identify(_ f: Fruit) -> String {
    if f is Apple { return "apple" }
    else if f is Banana { return "banana" }
    else { return "unknown" }
}

// Main tests
var passCount = 0
var failCount = 0

// Test 1: is String
let obj: Any = "hello"
if obj is String { passCount += 1; print("PASS: test1 is String") }
else { failCount += 1 }
if !(obj is Int) { passCount += 1; print("PASS: test1 not is Int") }
else { failCount += 1 }

// Test 2: Class hierarchy
let v: Animal = Dog()
if v is Animal { passCount += 1; print("PASS: test2 Dog is Animal") }
else { failCount += 1 }
if v is Dog { passCount += 1; print("PASS: test2 Dog is Dog") }
else { failCount += 1 }
if !(v is Cat) { passCount += 1; print("PASS: test2 Dog not Cat") }
else { failCount += 1 }
let v2: Animal = Animal()
if !(v2 is Dog) { passCount += 1; print("PASS: test2 Animal not Dog") }
else { failCount += 1 }

// Test 3: Branch dispatch via switch pattern matching (Swift feature beyond ArkTS)
let a: Fruit = Apple()
let b: Fruit = Banana()
let u: Fruit = Fruit()
if identify(a) == "apple" { passCount += 1; print("PASS: test3 Apple") }
else { failCount += 1 }
if identify(b) == "banana" { passCount += 1; print("PASS: test3 Banana") }
else { failCount += 1 }
if identify(u) == "unknown" { passCount += 1; print("PASS: test3 unknown") }
else { failCount += 1 }

// Test 4: nil is Type (always false)
let nullObj: Any? = nil
if nil is String { failCount += 1; print("FAIL: test4") }
else { passCount += 1; print("PASS: test4 nil not is String") }
let strObj: Any = "world"
if strObj is String { passCount += 1; print("PASS: test4 world is String") }
else { failCount += 1 }

// Test 5: Swift switch pattern matching (advanced feature)
let x: Any = "pattern"
switch x {
case let s as String where s.count > 0:
    passCount += 1; print("PASS: test5 switch pattern matching with binding")
default:
    failCount += 1
}

// KEY DIFFERENCE: Swift uses 'is' where ArkTS uses 'instanceof'
// ArkTS explicitly rejects 'is': ESY169587 "is operator is not supported"
// Swift // ArkTS // Java
// 'is'  // 'instanceof'  // 'instanceof'

print("\n=== SUMMARY: \(passCount) passed, \(failCount) failed ===")
if failCount > 0 { fatalError("Tests failed") }
