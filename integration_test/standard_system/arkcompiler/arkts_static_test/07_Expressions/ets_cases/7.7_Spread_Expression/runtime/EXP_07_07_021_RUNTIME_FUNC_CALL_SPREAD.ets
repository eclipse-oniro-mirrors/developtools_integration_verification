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
 * @id EXP_07_07_021_RUNTIME_FUNC_CALL_SPREAD
 * @expect runtime
 * @section 7.7
 * @design 函数调用扩展运行时验证：foo(...arr) 通过 rest 参数正确接收扩展值
 * @note 运行时用例：验证函数调用中扩展数组的正确性
 */
function foo(...p: int[]): int[] {
    return p
}

function main(): void {
    let arr: int[] = [10, 20, 30]
    let result: int[] = foo(...arr)
    if (result.length != 3) {
        throw new Error('assertion failed: length != 3')
    }
    if (result[0] != 10 || result[1] != 20 || result[2] != 30) {
        throw new Error('assertion failed: values mismatch')
    }
console.log('verified')
}
