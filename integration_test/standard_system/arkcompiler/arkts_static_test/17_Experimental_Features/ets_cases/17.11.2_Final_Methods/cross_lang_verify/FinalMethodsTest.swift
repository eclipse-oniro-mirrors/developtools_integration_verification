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
 * Swift cross-language verification for ArkTS 17.11.2 Final Methods
 *
 * Swift supports `final func` with identical semantics:
 * - A final method cannot be overridden in subclasses (compile-time error)
 * - abstract (Swift: protocol requirements) + final conflict -- not applicable
 * - static + final is allowed in Swift (different from ArkTS)
 * - final in protocol is not allowed
 */

// Test 1: Basic final method (identical to ArkTS)
class Animal {
    final func identify() -> String {
        return "Animal"
    }
}

class Dog: Animal {
    // Cannot override identify() because it's final -- this is valid, just inheriting
    func bark() -> String {
        return "Woof"
    }
}

// Test 2: Final method with parameters and return value
class Calculator {
    final func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    final func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
}

// Test 3: Multiple final methods coexisting with regular methods
class MultiMethod {
    final func methodA() {
        print("final A")
    }

    final func methodB() {
        print("final B")
    }

    func normalMethod() {
        print("normal")
    }
}

class Child: MultiMethod {
    // Can override regular method
    override func normalMethod() {
        print("child normal")
    }
    // Cannot override methodA or methodB (final)
}

// Test 4: Deep inheritance with final method
class GrandParent {
    final func greet() -> String {
        return "Hello from GrandParent"
    }
}

class Parent: GrandParent {
    // Does not override greet -- legal
    func sayHi() -> String {
        return "Hi from Parent"
    }
}

class ChildDeep: Parent {
    // Does not override greet -- legal
    func sayHey() -> String {
        return "Hey from Child"
    }
}

// Test 5: final method with String parameter
class Greeter {
    final func greetWithPrefix(_ prefix: String, _ name: String) -> String {
        return prefix + " " + name
    }

    final func getDefaultGreeting() -> String {
        return "Hello"
    }
}

// COMPILE ERROR scenarios (commented out -- these would fail):
// 1. Override final method:
// class BadDog: Animal {
//     override func identify() -> String { return "Bad" }  // ERROR: instance method overrides a 'final' instance method
// }

// 2. final in protocol:
// protocol IFoo {
//     final func doit()  // ERROR: 'final' modifier cannot be used in protocols
// }

// 3. Deep override final:
// class BadChild: Parent {
//     override func greet() -> String { return "Bad" }  // ERROR: instance method overrides a 'final' instance method
// }

// Runtime test execution
func testFinalMethods() {
    // Test 1: Basic final method
    let a = Animal()
    assert(a.identify() == "Animal", "Animal.identify should return 'Animal'")

    let d = Dog()
    assert(d.identify() == "Animal", "Dog.identify should return 'Animal' via inheritance")
    assert(d.bark() == "Woof", "Dog.bark should return 'Woof'")

    // Test 2: Final method with params
    let calc = Calculator()
    let sum = calc.add(3, 5)
    assert(sum == 8, "3 + 5 should be 8")
    let prod = calc.multiply(4, 6)
    assert(prod == 24, "4 * 6 should be 24")

    // Test 3: Multiple final methods
    let c = Child()
    c.methodA()
    c.methodB()
    c.normalMethod()

    // Test 4: Deep inheritance
    let gp = GrandParent()
    assert(gp.greet() == "Hello from GrandParent", "GrandParent.greet mismatch")
    let p = Parent()
    assert(p.greet() == "Hello from GrandParent", "Parent.greet should inherit")
    assert(p.sayHi() == "Hi from Parent", "Parent.sayHi mismatch")
    let ch = ChildDeep()
    assert(ch.greet() == "Hello from GrandParent", "Child.greet should inherit")
    assert(ch.sayHey() == "Hey from Child", "Child.sayHey mismatch")

    // Test 5: String params
    let g = Greeter()
    let msg = g.greetWithPrefix("Mr.", "Smith")
    assert(msg == "Mr. Smith", "Greeter.greetWithPrefix mismatch")
    let def = g.getDefaultGreeting()
    assert(def == "Hello", "Greeter.getDefaultGreeting mismatch")

    // Test 6: Accumulator (runtime state modification)
    let acc = Accumulator()
    assert(acc.getTotal() == 0, "Initial total should be 0")
    assert(acc.getHistory() == "", "Initial history should be empty")
    acc.add(10)
    acc.record("+10")
    assert(acc.getTotal() == 10, "Total should be 10")
    acc.add(25)
    acc.record("+25")
    assert(acc.getTotal() == 35, "Total should be 35")
    assert(acc.getHistory() == "+10+25", "History should be '+10+25'")

    // Test 7: Math operations
    let m = MathOps()
    assert(m.square(5) == 25, "5^2 should be 25")
    assert(m.square(0) == 0, "0^2 should be 0")
    assert(m.square(-3) == 9, "(-3)^2 should be 9")
    assert(m.sumOfSquares(3, 4) == 25, "3^2 + 4^2 should be 25")
    assert(m.isEven(4) == true, "4 should be even")
    assert(m.isEven(7) == false, "7 should be odd")

    print("SWIFT VERIFIED: All final method comparison tests passed")
    print("NOTE: Swift final method semantics are identical to ArkTS (except static+final is allowed in Swift)")
}

// Runtime test classes
class Accumulator {
    var total: Int = 0
    var history: String = ""

    final func add(_ n: Int) {
        total += n
    }

    final func record(_ op: String) {
        history += op
    }

    final func getTotal() -> Int {
        return total
    }

    final func getHistory() -> String {
        return history
    }
}

class MathOps {
    final func square(_ x: Int) -> Int {
        return x * x
    }

    final func sumOfSquares(_ a: Int, _ b: Int) -> Int {
        return square(a) + square(b)
    }

    final func isEven(_ n: Int) -> Bool {
        return (n % 2) == 0
    }
}

testFinalMethods()
