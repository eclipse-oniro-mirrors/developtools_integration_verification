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
 * @id EXP_07_29_01_006_PASS_BIGINT_BITWISE
 * @expect compile-pass
 * @section 7.29.1
 * @design bigint 类型三个位运算符（&, ^, |）的编译通过验证
 * @note 正向用例：验证两个 bigint 操作数在 &, ^, | 运算中编译通过（无需转换）
 */
function main(): void {
    let a: bigint = 60n;
    let b: bigint = 13n;

    // bigint & bigint
    let andResult: bigint = a & b;

    // bigint ^ bigint
    let xorResult: bigint = a ^ b;

    // bigint | bigint
    let orResult: bigint = a | b;

    // 字面量 bigint 位运算
    let lAnd: bigint = 5n & 3n;
    let lXor: bigint = 5n ^ 3n;
    let lOr: bigint = 5n | 3n;

    console.log('bigint & result: ' + andResult);
    console.log('bigint ^ result: ' + xorResult);
    console.log('bigint | result: ' + orResult);
}
