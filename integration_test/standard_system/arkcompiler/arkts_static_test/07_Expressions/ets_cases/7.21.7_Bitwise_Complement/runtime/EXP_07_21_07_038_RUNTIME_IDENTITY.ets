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
 * @id EXP_07_21_07_038_RUNTIME_IDENTITY
 * @expect runtime
 * @section 7.21.7
 * @design 验证 ~x = (-x)-1 恒等式对 int/long/bigint 成立
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    // int identity
    let xi: int = 42
    let ri1: int = ~xi
    let ri2: int = (-xi) - 1
    if (ri1 != ri2) {
        throw new Error('assertion failed: ~42 != (-42)-1, ~42=' + ri1 + ' (-42)-1=' + ri2)
    }

    // int negative
    let xin: int = -10
    let rin1: int = ~xin
    let rin2: int = (-xin) - 1
    if (rin1 != rin2) {
        throw new Error('assertion failed: ~(-10) != (10)-1')
    }

    // long identity
    let xl: long = 10000000000
    let rl1: long = ~xl
    let rl2: long = (-xl) - 1
    if (rl1 != rl2) {
        throw new Error('assertion failed: ~long != (-long)-1')
    }

    // bigint identity
    let xb: bigint = 2n
    let rb1: bigint = ~xb
    let rb2: bigint = (-xb) - 1n
    if (rb1 != rb2) {
        throw new Error('assertion failed: ~bigint(2n) != (-2n)-1n, got ' + rb1 + ' vs ' + rb2)
    }

    // bigint negative
    let xbn: bigint = -5n
    let rbn1: bigint = ~xbn
    let rbn2: bigint = (-xbn) - 1n
    if (rbn1 != rbn2) {
        throw new Error('assertion failed: ~bigint(-5n) != (5n)-1n')
    }
console.log('verified')
}
