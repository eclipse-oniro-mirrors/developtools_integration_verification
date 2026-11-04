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
 * Swift equivalent of ArkTS EXP2_17_12_023 - Complex logic via protocol extension
 * Tests: conditionals, loops in protocol extension default implementations
 * Note: Swift protocol extensions cannot access instance stored properties directly.
 *       We use a protocol requirement (var threshold: Int { get }) instead.
 */

protocol DataProcessor {
    var threshold: Int { get }
    func processData(_ values: [Int]) -> Int
    func getCategory(_ score: Int) -> String
}

extension DataProcessor {
    func processData(_ values: [Int]) -> Int {
        var sum = 0
        var count = 0
        for v in values {
            if v > threshold {
                sum += v
                count += 1
            }
        }
        if count > 0 {
            return sum / count
        } else {
            return 0
        }
    }

    func getCategory(_ score: Int) -> String {
        if score >= 90 {
            return "A"
        } else if score >= 80 {
            return "B"
        } else if score >= 70 {
            return "C"
        } else if score >= 60 {
            return "D"
        } else {
            return "F"
        }
    }
}

class Processor: DataProcessor {
    var threshold: Int = 50
}

let proc = Processor()

// Test 1: processData
let arr: [Int] = [10, 60, 20, 80, 30, 100]
let avg = proc.processData(arr)
// Values above 50: 60, 80, 100 -> sum=240, count=3, avg=80
if avg != 80 {
    fatalError("FAIL: processData expected 80, got \(avg)")
}

// Test 2: processData with no values above threshold
let arr2: [Int] = [10, 20, 30, 40]
let avg2 = proc.processData(arr2)
if avg2 != 0 {
    fatalError("FAIL: processData empty match expected 0, got \(avg2)")
}

// Test 3: getCategory
let catA = proc.getCategory(95)
if catA != "A" {
    fatalError("FAIL: getCategory(95) expected A, got \(catA)")
}

let catF = proc.getCategory(55)
if catF != "F" {
    fatalError("FAIL: getCategory(55) expected F, got \(catF)")
}

print("PASS: complex logic in default methods works correctly")
