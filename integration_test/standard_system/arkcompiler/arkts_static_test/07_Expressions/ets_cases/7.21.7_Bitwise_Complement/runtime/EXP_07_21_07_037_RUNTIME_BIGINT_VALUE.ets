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
 * @id EXP_07_21_07_037_RUNTIME_BIGINT_VALUE
 * @expect runtime
 * @section 7.21.7
 * @design 验证 ~bigint 运行时值正确：~2n=-3n, ~(-3n)=2n
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let a: bigint = 2n
    let ra: bigint = ~a
    if (ra != -3n) {
        throw new Error('assertion failed: ~bigint(2n) != -3n, got ' + ra)
    }

    let b: bigint = -3n
    let rb: bigint = ~b
    if (rb != 2n) {
        throw new Error('assertion failed: ~bigint(-3n) != 2n, got ' + rb)
    }

    let c: bigint = 0n
    let rc: bigint = ~c
    if (rc != -1n) {
        throw new Error('assertion failed: ~bigint(0n) != -1n, got ' + rc)
    }

    let d: bigint = 1n
    let rd: bigint = ~d
    if (rd != -2n) {
        throw new Error('assertion failed: ~bigint(1n) != -2n, got ' + rd)
    }
console.log('verified')
}
