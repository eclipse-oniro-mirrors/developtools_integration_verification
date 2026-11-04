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
 * @id EXP2_17_07_01_012_RUNTIME_SHORT_FORM_CALL
 * @expect runtime
 * @section 17.7.1
 * @design 运行时验证：短形式 ClassName(args) 和显式 ClassName.$_invoke(args) 产生相同结果。通过 int 加法和 string 拼接验证。
 * @note 运行时用例：实际执行验证短形式与显式调用结果一致
 */
class Add {
    static $_invoke(a: int, b: int): int {
        return a + b
    }

    static $_invoke(a: string, b: string): string {
        return a + b
    }
}

function main(): void {
    // Test 1: int add via short form
    let r1: int = Add(2, 2)
    if (r1 != 4) {
        throw new Error("FAIL: Add(2,2) expected 4, got " + r1)
    }

    // Test 2: int add via explicit form
    let r2: int = Add.$_invoke(10, 20)
    if (r2 != 30) {
        throw new Error("FAIL: Add.$_invoke(10,20) expected 30, got " + r2)
    }

    // Test 3: Short form and explicit form should return same result for same args
    let r3: int = Add(5, 15)
    let r4: int = Add.$_invoke(5, 15)
    if (r3 != r4) {
        throw new Error("FAIL: short form " + r3 + ' != explicit form ' + r4)
    }

    // Test 4: string concatenation via short form
    let s1: string = Add("Number ", 'one')
    if (s1 != 'Number one') {
        throw new Error("FAIL: Add('Number ', 'one') expected 'Number one', got '" + s1 + ''')
    }

    console.log('All assertions passed')
}
