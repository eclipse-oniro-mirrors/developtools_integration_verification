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
 * @id EXP_07_11_03_004_PASS_TYPEREF_STATIC_COMPATIBLE_ARGS
 * @expect compile-pass
 * @section 7.11.3
 * @design typeReference.identifier 静态方法调用参数兼容性检查：参数类型匹配时通过
 * @note 正向用例：验证 typeReference 静态方法调用时，参数类型兼容性检查通过
 */
class Calculator {
    static add(a: int, b: int): int {
        return a + b
    }
    static concat(a: string, b: string): string {
        return a + b
    }
    static sum(values: int[]): int {
        let s: int = 0
        for (let i: int = 0; i < values.length; i++) {
            s = s + values[i]
        }
        return s
    }
}

function main(): void {
    let r1: int = Calculator.add(3, 4)
    let r2: string = Calculator.concat('Hello', ' World')
    let arr: int[] = [1, 2, 3]
    let r3: int = Calculator.sum(arr)
}
