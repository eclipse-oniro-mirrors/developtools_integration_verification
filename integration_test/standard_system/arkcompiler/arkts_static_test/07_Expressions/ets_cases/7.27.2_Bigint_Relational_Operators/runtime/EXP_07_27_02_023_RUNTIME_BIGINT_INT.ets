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
 * @id EXP_07_27_02_023_RUNTIME_BIGINT_INT
 * @expect runtime
 * @section 7.27.2
 * @design bigint 与 int 类型关系运算运行时验证，int 隐式转换为 bigint 后比较
 *  * @note 运行时用例：验证该场景的运行时行为
 *       Spec 规则：integer type 转换为 bigint 后比较
 *       Spec 示例：b < 3 // true, '2' is converted implicitly to bigint
 */
function main(): void {
    let b: bigint = 2n;

    // bigint < int
    if ((b < 3) != true) { throw new Error('1: 2n < 3 should be true'); }
    if ((b < 1) != false) { throw new Error('2: 2n < 1 should be false'); }
    if ((b < 2) != false) { throw new Error('3: 2n < 2 should be false'); }

    // bigint <= int
    if ((b <= 3) != true) { throw new Error('4: 2n <= 3 should be true'); }
    if ((b <= 2) != true) { throw new Error('5: 2n <= 2 should be true'); }
    if ((b <= 1) != false) { throw new Error('6: 2n <= 1 should be false'); }

    // bigint > int
    if ((b > 1) != true) { throw new Error('7: 2n > 1 should be true'); }
    if ((b > 2) != false) { throw new Error('8: 2n > 2 should be false'); }
    if ((b > 3) != false) { throw new Error('9: 2n > 3 should be false'); }

    // bigint >= int
    if ((b >= 1) != true) { throw new Error('10: 2n >= 1 should be true'); }
    if ((b >= 2) != true) { throw new Error('11: 2n >= 2 should be true'); }
    if ((b >= 3) != false) { throw new Error('12: 2n >= 3 should be false'); }

    // int vs bigint（反转操作数）
    if ((3 > b) != true) { throw new Error('13: 3 > 2n should be true'); }
    if ((3 < b) != false) { throw new Error('14: 3 < 2n should be false'); }
    if ((3 >= b) != true) { throw new Error('15: 3 >= 2n should be true'); }
    if ((2 >= b) != true) { throw new Error('16: 2 >= 2n should be true'); }

    // 负值 bigint vs int
    let neg: bigint = -5n;
    if ((neg < 3) != true) { throw new Error('17: -5n < 3 should be true'); }
    if ((neg < -3) != true) { throw new Error('18: -5n < -3 should be true'); }
    if ((neg > -10) != true) { throw new Error('19: -5n > -10 should be true'); }
    if ((neg > 3) != false) { throw new Error('20: -5n > 3 should be false'); }
console.log('verified');
}
