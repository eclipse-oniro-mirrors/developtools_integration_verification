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
 * @id EXP_07_07_017_RUNTIME_BASIC_SPREAD
 * @expect runtime
 * @section 7.7
 * @design 运行时基本扩展验证：int[] 数组扩展后的值正确性
 * @note 运行时用例：验证扩展表达式数组元素值正确
 */
function main(): void {
    let arr: int[] = [1, 2, 3]
    let result: int[] = [...arr]
    if (result.length != 3) {
        throw new Error('assertion failed: length != 3')
    }
    if (result[0] != 1 || result[1] != 2 || result[2] != 3) {
        throw new Error('assertion failed: values mismatch')
    }
console.log('verified')
}
