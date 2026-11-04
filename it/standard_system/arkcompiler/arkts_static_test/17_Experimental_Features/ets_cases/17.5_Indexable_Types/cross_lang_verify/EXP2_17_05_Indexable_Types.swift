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
 * Swift equivalent for ArkTS 17.5 Indexable Types
 * Swift has subscripts - very similar to ArkTS $_get/$_set.
 *
 * Syntax:
 *   subscript(index: Int) -> String { get { ... } set { ... } }
 *
 * Key differences from ArkTS:
 *   - Swift uses `subscript` keyword, ArkTS uses $_get/$_set methods
 *   - Swift subscripts can be read-only (get only) or read-write (get+set)
 *   - Swift subscripts support overloading with different parameter types
 *   - Swift subscript parameters can be any type, not just Int/String
 */

// Case 1: Basic subscript (like $_get + $_set)
struct BasicStore {
    private var items: [String] = ["alpha", "beta", "gamma"]

    subscript(index: Int) -> String {
        get { return items[index] }
        set { items[index] = newValue }
    }
}

// Case 2: Read-only subscript (like $_get only)
struct ReadOnlyStore {
    private let items: [String] = ["x", "y", "z"]

    subscript(index: Int) -> String {
        return items[index]
    }
}

// Case 3: String key subscript (like $_get/$_set with string)
struct StringKeyStore {
    private var store: [String: String] = [:]

    subscript(key: String) -> String {
        get { return store[key] ?? "unknown" }
        set { store[key] = newValue }
    }
}

// Case 4: Generic subscript (like generic $_get/$_set)
struct GenericStore<T> {
    private var items: [T] = []

    subscript(index: Int) -> T? {
        get {
            guard index < items.count else { return nil }
            return items[index]
        }
        set {
            while items.count <= index { items.append(newValue!) }
            if let val = newValue { items[index] = val }
        }
    }
}

// Case 5: Overloaded subscript (multiple parameter types)
struct OverloadedStore {
    private var intData: [String] = ["a", "b"]
    private var strData: [String: String] = [:]

    subscript(index: Int) -> String {
        get { return intData[index] }
        set { intData[index] = newValue }
    }

    subscript(key: String) -> String {
        get { return strData[key] ?? "unknown" }
        set { strData[key] = newValue }
    }
}

// Main verification
func main() {
    print("=== Swift: Subscripts (equivalent to ArkTS indexable types) ===")

    // Test 1: Basic subscript
    var store = BasicStore()
    let v0 = store[0]
    assert(v0 == "alpha", "BasicStore[0] should be alpha")
    store[1] = "delta"
    assert(store[1] == "delta", "BasicStore[1] after set should be delta")
    print("Test 1 PASS: Basic subscript read/write")

    // Test 2: Read-only subscript
    let roStore = ReadOnlyStore()
    let v2 = roStore[2]
    assert(v2 == "z", "ReadOnlyStore[2] should be z")
    // roStore[0] = "new"  // Compile error: Cannot assign through subscript: subscript is get-only
    print("Test 2 PASS: Read-only subscript")

    // Test 3: String key subscript
    var strStore = StringKeyStore()
    strStore["name"] = "test"
    let name = strStore["name"]
    assert(name == "test", "StringKeyStore['name'] should be test")
    let unknown = strStore["nonexistent"]
    assert(unknown == "unknown", "StringKeyStore['nonexistent'] should be unknown")
    print("Test 3 PASS: String key subscript")

    // Test 4: Generic subscript
    var numStore = GenericStore<Int>()
    numStore[0] = 100
    numStore[1] = 200
    assert(numStore[0] == 100, "GenericStore[0] should be 100")
    assert(numStore[1] == 200, "GenericStore[1] should be 200")
    print("Test 4 PASS: Generic subscript")

    // Test 5: Overloaded subscript
    var ovStore = OverloadedStore()
    let vInt = ovStore[0]
    assert(vInt == "a", "OverloadedStore[0] should be a")
    ovStore["key"] = "value"
    let vStr = ovStore["key"]
    assert(vStr == "value", "OverloadedStore['key'] should be value")
    print("Test 5 PASS: Overloaded subscript")

    print()
    print("CONFIRMED: Swift subscripts closely match ArkTS indexable types")
    print("Key difference: Swift uses 'subscript' keyword, ArkTS uses $_get/$_set methods")
    print("verified")
}

main()
