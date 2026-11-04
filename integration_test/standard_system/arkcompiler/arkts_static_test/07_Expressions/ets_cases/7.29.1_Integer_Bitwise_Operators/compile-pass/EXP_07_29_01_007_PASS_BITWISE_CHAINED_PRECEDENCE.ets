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
 * @id EXP_07_29_01_007_PASS_BITWISE_CHAINED_PRECEDENCE
 * @expect compile-pass
 * @section 7.29.1
 * @design 链式位运算及优先级（& > ^ > |）的编译通过验证
 * @note 正向用例：验证 &, ^, | 链式组合和左结合性编译通过
 *       验证 & 优先于 ^ 优先于 | 的优先级规则（通过括号分组体现）
 */
function main(): void {
    let a: int = 60;
    let b: int = 13;
    let c: int = 7;

    // 链式：a & b | c（先 & 后 |）
    let chain1: int = a & b | c;

    // 链式：a ^ b & c（先 & 后 ^）
    let chain2: int = a ^ b & c;

    // 链式：a | b ^ c（先 ^ 后 |）
    let chain3: int = a | b ^ c;

    // 三层链式
    let chain4: int = a & b ^ c | a;

    // 用括号明确分组
    let withParen1: int = (a & b) | c;
    let withParen2: int = a & (b | c);

    console.log('chain1: ' + chain1);
    console.log('chain2: ' + chain2);
    console.log('chain3: ' + chain3);
    console.log('chain4: ' + chain4);
}
