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
 * @id EXP_07_27_02_026_RUNTIME_BIGINT_FLOAT
 * @expect runtime
 * @section 7.27.2
 * @design bigint 与 float 类型关系运算运行时验证，两者都转换为 double 后比较
 *  * @note 运行时用例：验证该场景的运行时行为
 *       Spec 规则：If numeric operand is float, both operands are converted to double
 *       Spec 示例：const f = 3.f; b < f // true, both converted to double
 *       注意：float 字面量必须用 f 后缀
 */
function main(): void {
    let b: bigint = 2n;
    let f: float = 3.0f;

    // bigint < float
    if ((b < f) != true) { throw new Error('1: 2n < 3.0f should be true'); }
    if ((b < 1.5f) != false) { throw new Error('2: 2n < 1.5f should be false'); }
    if ((b < 2.0f) != false) { throw new Error('3: 2n < 2.0f should be false'); }

    // bigint <= float
    if ((b <= f) != true) { throw new Error('4: 2n <= 3.0f should be true'); }
    if ((b <= 2.0f) != true) { throw new Error('5: 2n <= 2.0f should be true'); }
    if ((b <= 1.5f) != false) { throw new Error('6: 2n <= 1.5f should be false'); }

    // bigint > float
    if ((b > 1.5f) != true) { throw new Error('7: 2n > 1.5f should be true'); }
    if ((b > 2.0f) != false) { throw new Error('8: 2n > 2.0f should be false'); }
    if ((b > f) != false) { throw new Error('9: 2n > 3.0f should be false'); }

    // bigint >= float
    if ((b >= 1.5f) != true) { throw new Error('10: 2n >= 1.5f should be true'); }
    if ((b >= 2.0f) != true) { throw new Error('11: 2n >= 2.0f should be true'); }
    if ((b >= f) != false) { throw new Error('12: 2n >= 3.0f should be false'); }

    // float vs bigint
    if ((f > b) != true) { throw new Error('13: 3.0f > 2n should be true'); }
    if ((f < b) != false) { throw new Error('14: 3.0f < 2n should be false'); }
    if ((f >= b) != true) { throw new Error('15: 3.0f >= 2n should be true'); }

    // 负值 bigint vs float
    let neg: bigint = -5n;
    if ((neg < 3.0f) != true) { throw new Error('16: -5n < 3.0f should be true'); }
    if ((neg < -3.0f) != true) { throw new Error('17: -5n < -3.0f should be true'); }
    if ((neg > -10.0f) != true) { throw new Error('18: -5n > -10.0f should be true'); }
    if ((neg > 3.0f) != false) { throw new Error('19: -5n > 3.0f should be false'); }
console.log('verified');
}
