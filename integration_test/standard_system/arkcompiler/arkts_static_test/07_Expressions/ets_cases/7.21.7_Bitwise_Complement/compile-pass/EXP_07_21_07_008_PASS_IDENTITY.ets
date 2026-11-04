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
 * @id EXP_07_21_07_008_PASS_IDENTITY
 * @expect compile-pass
 * @section 7.21.7
 * @design 验证 ~x 与 (-x)-1 恒等式对所有数值类型成立（编译时合法）
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testIdentityInt(): void {
    let x: int = 42
    let r1: int = ~x
    let r2: int = (-x) - 1
}

function testIdentityShort(): void {
    let x: short = 2
    let r1: int = ~x
    let r2: int = (-x) - 1   // -short returns int (widening)
}

function testIdentityLong(): void {
    let x: long = 10000000000
    let r1: long = ~x
    let r2: long = (-x) - 1
}

function testIdentityByte(): void {
    let x: byte = 2
    let r1: int = ~x
    let r2: int = (-x) - 1   // -byte returns int (widening)
}

function testIdentityBigint(): void {
    let x: bigint = 2n
    let r1: bigint = ~x
    let r2: bigint = (-x) - 1n
}

function main(): void {
    testIdentityInt()
    testIdentityShort()
    testIdentityLong()
    testIdentityByte()
    testIdentityBigint()
    console.log('verified')
}
