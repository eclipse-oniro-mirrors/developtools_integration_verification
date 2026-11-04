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
 * @id EXP_07_21_07_035_RUNTIME_FLOAT_VALUE
 * @expect runtime
 * @section 7.21.7
 * @design 验证 ~float 运行时值：float 先截断为 int 再求反
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let a: float = 2.5 as float
    let ra: int = ~a
    if (ra != -3) {
        throw new Error('assertion failed: ~float(2.5) != -3, got ' + ra)
    }

    let b: float = (-2.5) as float
    let rb: int = ~b
    if (rb != 1) {
        throw new Error('assertion failed: ~float(-2.5) != 1, got ' + rb)
    }

    let c: float = 0.0 as float
    let rc: int = ~c
    if (rc != -1) {
        throw new Error('assertion failed: ~float(0.0) != -1, got ' + rc)
    }

    let d: float = (-1.0) as float
    let rd: int = ~d
    if (rd != 0) {
        throw new Error('assertion failed: ~float(-1.0) != 0, got ' + rd)
    }
console.log('verified')
}
