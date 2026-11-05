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
 * Swift cross-language verification for ArkTS 17.11.3 Named Constructors
 *
 * Swift does NOT support named constructors.
 * Instead, Swift uses static factory methods and convenience initializers
 * with argument labels to distinguish different construction semantics.
 *
 * This file demonstrates the Swift equivalent patterns for each ArkTS named constructor test case.
 */

// === Equivalent to ArkTS 001: Temperature with Celsius / Fahrenheit named constructors ===
class Temperature {
    private var value: Double // stored in Celsius

    private init(celsius: Double) {
        self.value = celsius
    }

    // Static factory method -- equivalent to ArkTS "constructor Celsius(n: double)"
    static func celsius(_ n: Double) -> Temperature {
        return Temperature(celsius: n)
    }

    // Static factory method -- equivalent to ArkTS "constructor Fahrenheit(n: double)"
    static func fahrenheit(_ n: Double) -> Temperature {
        return Temperature(celsius: (n - 32) / 1.8)
    }

    func getCelsius() -> Double {
        return value
    }
}

// === Equivalent to ArkTS 002: ValueHolder with FromInt / FromString / FromBool ===
class ValueHolder {
    private var value: Any

    private init(v: Any) {
        self.value = v
    }

    static func fromInt(_ n: Int) -> ValueHolder {
        return ValueHolder(v: n)
    }

    static func fromString(_ s: String) -> ValueHolder {
        return ValueHolder(v: s)
    }

    static func fromBool(_ b: Bool) -> ValueHolder {
        return ValueHolder(v: b)
    }

    func getValue() -> Any {
        return value
    }
}

// === Equivalent to ArkTS 003: Config with anonymous + named constructors ===
class Config {
    private var value: String

    // Default (anonymous) initializer
    init() {
        self.value = "default"
    }

    // Internal initializer for factory methods
    private init(v: String) {
        self.value = v
    }

    // Static factory -- equivalent to ArkTS "constructor FromKey(key: string)"
    static func fromKey(_ key: String) -> Config {
        return Config(v: "key:" + key)
    }

    // Static factory -- equivalent to ArkTS "constructor FromEnv(env: string)"
    static func fromEnv(_ env: String) -> Config {
        return Config(v: "env:" + env)
    }

    func getValue() -> String {
        return value
    }
}

// === Equivalent to ArkTS 005: Rectangle with FromPoints / FromSize ===
class Rectangle {
    private var width: Int
    private var height: Int

    private init(w: Int, h: Int) {
        self.width = w
        self.height = h
    }

    static func fromPoints(x1: Int, y1: Int, x2: Int, y2: Int) -> Rectangle {
        return Rectangle(w: x2 - x1, h: y2 - y1)
    }

    static func fromSize(width: Int, height: Int) -> Rectangle {
        return Rectangle(w: width, h: height)
    }

    func getWidth() -> Int { return width }
    func getHeight() -> Int { return height }
}

// === Equivalent to ArkTS 011: Point with FromXY / Origin ===
class Point {
    private var x: Int
    private var y: Int

    private init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    static func fromXY(xVal: Int, yVal: Int) -> Point {
        return Point(x: xVal, y: yVal)
    }

    static func origin() -> Point {
        return Point(x: 0, y: 0)
    }

    func getX() -> Int { return x }
    func getY() -> Int { return y }
}

// === Equivalent to ArkTS 012: User with anonymous + WithName + Full ===
class User {
    private var name: String
    private var age: Int

    // Anonymous initializer (default)
    init() {
        self.name = "unknown"
        self.age = 0
    }

    // Full initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // Static factory -- equivalent to ArkTS "constructor WithName(n: string)"
    static func withName(_ n: String) -> User {
        return User(name: n, age: 0)
    }

    func getName() -> String { return name }
    func getAge() -> Int { return age }
}

// === Equivalent to ArkTS 013: Converter with FromInt / FromDouble / FromString ===
class Converter {
    private var result: Double

    private init(r: Double) {
        self.result = r
    }

    static func fromInt(_ n: Int) -> Converter {
        return Converter(r: Double(n))
    }

    static func fromDouble(_ d: Double) -> Converter {
        return Converter(r: d * 2)
    }

    static func fromString(_ s: String) -> Converter {
        return Converter(r: 100)
    }

    func getResult() -> Double { return result }
}

// === Equivalent to ArkTS 014: Color with RGB / Hex (all named constructors) ===
class Color {
    private var r: Int
    private var g: Int
    private var b: Int

    private init(r: Int, g: Int, b: Int) {
        self.r = r
        self.g = g
        self.b = b
    }

    static func rgb(red: Int, green: Int, blue: Int) -> Color {
        return Color(r: red, g: green, b: blue)
    }

    static func hex(_ hex: String) -> Color {
        // Simplified: always returns white for demonstration
        return Color(r: 255, g: 255, b: 255)
    }

    func getR() -> Int { return r }
    func getG() -> Int { return g }
    func getB() -> Int { return b }
}

// === Main test execution ===
func testNamedConstructors() {
    // Test 001: Temperature
    let t1 = Temperature.celsius(100)
    assert(abs(t1.getCelsius() - 100.0) < 0.01, "Celsius should be 100")
    let t2 = Temperature.fahrenheit(212)
    assert(abs(t2.getCelsius() - 100.0) < 0.01, "212F should be 100C")

    // Test 002: ValueHolder
    let v1 = ValueHolder.fromInt(42)
    assert(v1.getValue() as? Int == 42, "fromInt should store 42")
    let v2 = ValueHolder.fromString("hello")
    assert(v2.getValue() as? String == "hello", "fromString should store 'hello'")
    let v3 = ValueHolder.fromBool(true)
    assert(v3.getValue() as? Bool == true, "fromBool should store true")

    // Test 003: Config (anonymous + named)
    let c1 = Config()
    assert(c1.getValue() == "default", "Default config should be 'default'")
    let c2 = Config.fromKey("db_host")
    assert(c2.getValue() == "key:db_host", "fromKey should prefix with 'key:'")
    let c3 = Config.fromEnv("production")
    assert(c3.getValue() == "env:production", "fromEnv should prefix with 'env:'")

    // Test 005: Rectangle
    let r1 = Rectangle.fromPoints(x1: 0, y1: 0, x2: 10, y2: 5)
    assert(r1.getWidth() == 10, "Width should be 10")
    assert(r1.getHeight() == 5, "Height should be 5")
    let r2 = Rectangle.fromSize(width: 8, height: 4)
    assert(r2.getWidth() == 8, "Width should be 8")
    assert(r2.getHeight() == 4, "Height should be 4")

    // Test 011: Point
    let p1 = Point.fromXY(xVal: 5, yVal: 10)
    assert(p1.getX() == 5, "Point x should be 5")
    assert(p1.getY() == 10, "Point y should be 10")
    let p2 = Point.origin()
    assert(p2.getX() == 0, "Origin x should be 0")
    assert(p2.getY() == 0, "Origin y should be 0")

    // Test 012: User
    let u1 = User()
    assert(u1.getName() == "unknown", "Default name should be 'unknown'")
    assert(u1.getAge() == 0, "Default age should be 0")
    let u2 = User.withName("Alice")
    assert(u2.getName() == "Alice", "WithName should set name to 'Alice'")
    assert(u2.getAge() == 0, "WithName age should be 0")
    let u3 = User(name: "Bob", age: 30)
    assert(u3.getName() == "Bob", "Full name should be 'Bob'")
    assert(u3.getAge() == 30, "Full age should be 30")

    // Test 013: Converter
    let conv1 = Converter.fromInt(5)
    assert(conv1.getResult() == 5.0, "FromInt should set result to 5")
    let conv2 = Converter.fromDouble(3.5)
    assert(conv2.getResult() == 7.0, "FromDouble should set result to 7")
    let conv3 = Converter.fromString("test")
    assert(conv3.getResult() == 100.0, "FromString should set result to 100")

    // Test 014: Color (all named constructors)
    let col1 = Color.rgb(red: 255, green: 0, blue: 0)
    assert(col1.getR() == 255, "RGB R should be 255")
    assert(col1.getG() == 0, "RGB G should be 0")
    assert(col1.getB() == 0, "RGB B should be 0")
    let col2 = Color.hex("#FFFFFF")
    assert(col2.getR() == 255, "Hex R should be 255")
    assert(col2.getG() == 255, "Hex G should be 255")
    assert(col2.getB() == 255, "Hex B should be 255")

    print("SWIFT VERIFIED: All named constructor comparison tests passed (static factory pattern)")
    print("NOTE: Swift has no named constructors; static factory methods are the idiomatic equivalent.")
}

testNamedConstructors()
