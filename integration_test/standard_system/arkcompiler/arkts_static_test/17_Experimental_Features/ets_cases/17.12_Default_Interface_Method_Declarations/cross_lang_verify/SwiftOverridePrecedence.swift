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
 * Swift equivalent of ArkTS EXP2_17_12_021 - Override precedence
 * Tests: class override takes precedence over protocol extension default
 */

protocol Calculator {
    func compute(_ x: Int) -> Int
}

extension Calculator {
    // Default implementation: multiply by 2
    func compute(_ x: Int) -> Int {
        return x * 2
    }
}

class Doubler: Calculator {
    // Uses default from extension
}

class Tripler: Calculator {
    // Overrides the default
    func compute(_ x: Int) -> Int {
        return x * 3
    }
}

let d = Doubler()
let t = Tripler()

let r1 = d.compute(10)
if r1 != 20 {
    fatalError("FAIL: Doubler expected 20, got \(r1)")
}

let r2 = t.compute(10)
if r2 != 30 {
    fatalError("FAIL: Tripler expected 30, got \(r2)")
}

// Verify overriding doesn't affect default behavior
let r3 = d.compute(5)
if r3 != 10 {
    fatalError("FAIL: Doubler second call expected 10, got \(r3)")
}

print("PASS: override takes precedence over default")
