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
// Swift equivalent of ArkTS 17.6 Iterable Types
// Corresponds to: EXP2_17_06_001, EXP2_17_06_013, EXP2_17_06_014, EXP2_17_06_015
// Swift uses Sequence protocol (makeIterator()) and IteratorProtocol (next())

// Custom Sequence: Range produces integers from 'from' to 'to'
struct RangeSequence: Sequence {
    let from: Int
    let to: Int

    func makeIterator() -> RangeIterator {
        return RangeIterator(from: from, to: to)
    }
}

struct RangeIterator: IteratorProtocol {
    var current: Int
    let end: Int

    init(from: Int, to: Int) {
        self.current = from
        self.end = to
    }

    mutating func next() -> Int? {
        guard current <= end else {
            return nil
        }
        defer { current += 1 }
        return current
    }
}

// Generic Wrapper Sequence (corresponds to EXP2_17_06_008)
struct WrapperSequence<E>: Sequence {
    let value: E

    func makeIterator() -> WrapperIterator<E> {
        return WrapperIterator(value: value)
    }
}

struct WrapperIterator<E>: IteratorProtocol {
    let value: E
    var emitted = false

    mutating func next() -> E? {
        guard !emitted else {
            return nil
        }
        emitted = true
        return value
    }
}

// --- Test Entry ---
func main() {
    // Test 1: Basic for-in with custom range
    let r = RangeSequence(from: 1, to: 5)
    var sum = 0
    var count = 0
    for v in r {
        sum += v
        count += 1
    }
    assert(sum == 15, "custom sequence sum failed: expected 15, got \(sum)")
    assert(count == 5, "custom sequence count failed: expected 5, got \(count)")

    // Test 2: Empty range
    let emptyRange = RangeSequence(from: 5, to: 1)
    var emptyCount = 0
    for _ in emptyRange {
        emptyCount += 1
    }
    assert(emptyCount == 0, "empty sequence failed: \(emptyCount)")

    // Test 3: Array (built-in Sequence in Swift)
    let arr = [10, 20, 30]
    var arrSum = 0
    var arrCount = 0
    for x in arr {
        arrSum += x
        arrCount += 1
    }
    assert(arrSum == 60, "array for-in sum failed: \(arrSum)")
    assert(arrCount == 3, "array for-in count failed: \(arrCount)")

    // Test 4: String (built-in Sequence in Swift)
    let s = "ArkTS"
    var result = ""
    var strCount = 0
    for ch in s {
        result.append(ch)
        strCount += 1
    }
    assert(result == "ArkTS", "string for-in concat failed: \(result)")
    assert(strCount == 5, "string for-in count failed: \(strCount)")

    // Test 5: Generic Wrapper
    let w = WrapperSequence(value: "hello")
    var wrapCount = 0
    for val in w {
        assert(val == "hello", "wrapper value failed: \(val)")
        wrapCount += 1
    }
    assert(wrapCount == 1, "wrapper count failed: \(wrapCount)")

    print("verified")
}

main()
