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
 * @id EXP2_17_07_01_013_RUNTIME_OVERLOAD_SELECT
 * @expect runtime
 * @section 17.7.1
 * @design 运行时验证：多个 $_invoke 重载在运行时根据参数类型和数量选择正确的重载。包含无参、int、string、双 int 四种重载。
 * @note 运行时用例：实际执行验证重载选择正确
 */
class MultiOp {
    static $_invoke(): string {
        return 'no_args'
    }

    static $_invoke(x: int): int {
        return x * 3
    }

    static $_invoke(s: string): string {
        return 'str:' + s
    }

    static $_invoke(a: int, b: int): int {
        return a - b
    }
}

function main(): void {
    // Test 1: no-arg overload
    let r0: string = MultiOp()
    if (r0 != 'no_args') {
        throw new Error("FAIL: MultiOp() expected 'no_args', got '" + r0 + ''')
    }

    // Test 2: int overload
    let r1: int = MultiOp(7)
    if (r1 != 21) {
        throw new Error("FAIL: MultiOp(7) expected 21, got " + r1)
    }

    // Test 3: string overload
    let r2: string = MultiOp('hello')
    if (r2 != 'str:hello') {
        throw new Error("FAIL: MultiOp('hello') expected 'str:hello', got '" + r2 + ''')
    }

    // Test 4: two-int overload
    let r3: int = MultiOp(10, 3)
    if (r3 != 7) {
        throw new Error("FAIL: MultiOp(10,3) expected 7, got " + r3)
    }

    // Test 5: explicit call with two-int overload
    let r4: int = MultiOp.$_invoke(100, 50)
    if (r4 != 50) {
        throw new Error("FAIL: MultiOp.$_invoke(100,50) expected 50, got " + r4)
    }

    console.log('All assertions passed')
}
