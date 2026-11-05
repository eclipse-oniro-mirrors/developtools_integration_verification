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
 * @id EXP_07_21_07_036_RUNTIME_DOUBLE_VALUE
 * @expect runtime
 * @section 7.21.7
 * @design 验证 ~double 运行时值：double 先截断为 long 再求反
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let a: double = 2.5
    let ra: long = ~a
    if (ra != -3) {
        throw new Error('assertion failed: ~double(2.5) != -3, got ' + ra)
    }

    let b: double = (-2.5)
    let rb: long = ~b
    if (rb != 1) {
        throw new Error('assertion failed: ~double(-2.5) != 1, got ' + rb)
    }

    let c: double = 0.0
    let rc: long = ~c
    if (rc != -1) {
        throw new Error('assertion failed: ~double(0.0) != -1, got ' + rc)
    }

    let d: double = (-1.0)
    let rd: long = ~d
    if (rd != 0) {
        throw new Error('assertion failed: ~double(-1.0) != 0, got ' + rd)
    }
console.log('verified')
}
