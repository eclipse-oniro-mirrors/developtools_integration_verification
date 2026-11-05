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
 * @id EXP_07_11_03_001_PASS_TYPEREF_STATIC_METHOD
 * @expect compile-pass
 * @section 7.11.3
 * @design typeReference.identifier 形式：方法声明为 static，修饰符检查通过
 * @note 正向用例：验证 typeReference 调用的方法必须是 static，本用例满足条件
 */
class Utility {
    static max(a: int, b: int): int {
        if (a > b) { return a }
        return b
    }
    static isPositive(x: int): boolean {
        return x > 0
    }
}

function main(): void {
    let m: int = Utility.max(10, 20)
    let p: boolean = Utility.isPositive(5)
}
