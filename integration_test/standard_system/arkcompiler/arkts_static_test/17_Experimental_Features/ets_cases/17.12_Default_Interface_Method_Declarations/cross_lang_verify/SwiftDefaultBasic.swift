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
 * Swift equivalent of ArkTS EXP2_17_12_001 - Default method via protocol extension
 * Tests: protocol with default implementation via extension, class adopts without override
 * Note: Swift does NOT have default methods in protocols directly.
 *       Swift uses protocol extensions to provide default implementations.
 *       Swift does NOT support private methods in protocol extensions.
 */

protocol Greeter {
    // Protocol only declares the requirement
    func greet() -> String
}

extension Greeter {
    // Extension provides default implementation
    func greet() -> String {
        return "Hello from default"
    }
}

class Person: Greeter {
    var name: String = "Alice"
    // Does not override greet(), uses default from extension
}

// Since Swift doesn't have a "main" function, we use a top-level script
let p = Person()
let result = p.greet()
if result != "Hello from default" {
    fatalError("FAIL: expected 'Hello from default', got '\(result)'")
}
print("PASS: \(result)")
