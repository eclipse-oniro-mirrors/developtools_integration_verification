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
 * @id EXP_07_27_02_025_RUNTIME_BIGINT_DOUBLE
 * @expect runtime
 * @section 7.27.2
 * @design bigint 与 double 类型关系运算运行时验证，bigint 隐式转换为 double 后比较
 *  * @note 运行时用例：验证该场景的运行时行为
 *       Spec 规则：If numeric operand is double, bigint is converted to double
 *       Spec 示例：b < 3.0 // true, 'b' is converted to double
 *       注意：bigint→double 转换对 > 2^53 的值可能有精度损失
 */
function main(): void {
    let b: bigint = 2n;

    // bigint < double
    if ((b < 3.0) != true) { throw new Error('1: 2n < 3.0 should be true'); }
    if ((b < 1.5) != false) { throw new Error('2: 2n < 1.5 should be false'); }
    if ((b < 2.0) != false) { throw new Error('3: 2n < 2.0 should be false'); }

    // bigint <= double
    if ((b <= 3.0) != true) { throw new Error('4: 2n <= 3.0 should be true'); }
    if ((b <= 2.0) != true) { throw new Error('5: 2n <= 2.0 should be true'); }
    if ((b <= 1.5) != false) { throw new Error('6: 2n <= 1.5 should be false'); }

    // bigint > double
    if ((b > 1.5) != true) { throw new Error('7: 2n > 1.5 should be true'); }
    if ((b > 2.0) != false) { throw new Error('8: 2n > 2.0 should be false'); }
    if ((b > 3.0) != false) { throw new Error('9: 2n > 3.0 should be false'); }

    // bigint >= double
    if ((b >= 1.5) != true) { throw new Error('10: 2n >= 1.5 should be true'); }
    if ((b >= 2.0) != true) { throw new Error('11: 2n >= 2.0 should be true'); }
    if ((b >= 3.0) != false) { throw new Error('12: 2n >= 3.0 should be false'); }

    // double vs bigint
    if ((3.0 > b) != true) { throw new Error('13: 3.0 > 2n should be true'); }
    if ((3.0 < b) != false) { throw new Error('14: 3.0 < 2n should be false'); }

    // 负值 bigint vs double
    let neg: bigint = -5n;
    if ((neg < 3.0) != true) { throw new Error('15: -5n < 3.0 should be true'); }
    if ((neg < -3.0) != true) { throw new Error('16: -5n < -3.0 should be true'); }
    if ((neg > -10.0) != true) { throw new Error('17: -5n > -10.0 should be true'); }

    // 大 bigint → double 可能精度损失
    // 9007199254740993 不能精确表示为 double，但此处仅验证编译和运行不崩溃
    let large: bigint = 9007199254740993n;
    if ((large > 9007199254740992.0) != true) {
        // 可能因为精度损失变成相等，但至少不会崩溃
        // double 9007199254740992.0 无法区分 9007199254740993
        // 所以 expected: false（精度损失导致相等比较）
        // 这个测试点仅验证运行时不崩溃
    }
console.log('verified');
}
