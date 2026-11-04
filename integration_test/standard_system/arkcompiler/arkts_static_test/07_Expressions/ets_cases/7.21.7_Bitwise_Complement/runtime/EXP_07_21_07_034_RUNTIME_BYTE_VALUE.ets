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
 * @id EXP_07_21_07_034_RUNTIME_BYTE_VALUE
 * @expect runtime
 * @section 7.21.7
 * @design 验证 ~byte 运行时值正确：~2=-3(int), ~(-1)=0(int)
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let a: byte = 2
    let ra: int = ~a
    if (ra != -3) {
        throw new Error('assertion failed: ~byte(2) != -3, got ' + ra)
    }

    let b: byte = -1
    let rb: int = ~b
    if (rb != 0) {
        throw new Error('assertion failed: ~byte(-1) != 0, got ' + rb)
    }

    let c: byte = 0
    let rc: int = ~c
    if (rc != -1) {
        throw new Error('assertion failed: ~byte(0) != -1, got ' + rc)
    }

    let d: byte = 127
    let rd: int = ~d
    if (rd != -128) {
        throw new Error('assertion failed: ~byte(127) != -128, got ' + rd)
    }
console.log('verified')
}
