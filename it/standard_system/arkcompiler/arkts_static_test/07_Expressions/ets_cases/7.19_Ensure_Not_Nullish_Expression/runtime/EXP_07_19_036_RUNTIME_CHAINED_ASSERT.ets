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
 * @id EXP_07_19_036_RUNTIME_CHAINED_ASSERT
 * @expect runtime
 * @section 7.19
 * @design 验证 ! 在复合表达式中运行时正确计算结果
 * @note 运行时用例：! 在算术、嵌套表达式中正常运行
 */
function main(): void {
    let a: int | undefined = 7
    let b: int | undefined = 3
    let sum: int = a! + b!
    if (sum != 10) {
        throw new Error('assertion failed: expected 10, got ' + sum)
    }

    let x: int | undefined = 5
    let y: int = x! * 2 + 1
    if (y != 11) {
        throw new Error('assertion failed: expected 11, got ' + y)
    }
console.log('verified')
}
