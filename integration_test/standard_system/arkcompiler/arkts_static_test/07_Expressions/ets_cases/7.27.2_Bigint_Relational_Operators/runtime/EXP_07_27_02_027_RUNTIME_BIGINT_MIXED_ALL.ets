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
 * @id EXP_07_27_02_027_RUNTIME_BIGINT_MIXED_ALL
 * @expect runtime
 * @section 7.27.2
 * @design bigint 与全部数值类型混合的比较运行时验证
 *  * @note 运行时用例：验证该场景的运行时行为
 *       覆盖：byte/short/int/long/float/double 全部六种数值类型
 */
function main(): void {
    let b: bigint = 10n;

    // bigint vs byte
    if ((b > 5) != true) { throw new Error('1: 10n > byte(5) should be true'); }
    if ((b < 5) != false) { throw new Error('2: 10n < byte(5) should be false'); }
    if ((b <= 10) != true) { throw new Error('3: 10n <= byte(10) should be true'); }

    // bigint vs short
    if ((b > 10) != false) { throw new Error('4: 10n > short(10) should be false'); }
    if ((b >= 10) != true) { throw new Error('5: 10n >= short(10) should be true'); }
    if ((b < 20) != true) { throw new Error('6: 10n < short(20) should be true'); }

    // bigint vs int
    let i: int = 5;
    if ((b > i) != true) { throw new Error('7: 10n > int(5) should be true'); }
    if ((b < i) != false) { throw new Error('8: 10n < int(5) should be false'); }

    // bigint vs long
    let l: long = 15;
    if ((b < l) != true) { throw new Error('9: 10n < long(15) should be true'); }
    if ((b > l) != false) { throw new Error('10: 10n > long(15) should be false'); }

    // bigint vs float
    let f: float = 10.5f;
    if ((b < f) != true) { throw new Error('11: 10n < float(10.5) should be true'); }
    if ((b > f) != false) { throw new Error('12: 10n > float(10.5) should be false'); }
    // bigint 10 转换为 double 10.0，float 10.5 转换为 double 10.5
    // 10.0 < 10.5 = true

    // bigint vs double
    let d: double = 20.5;
    if ((b < d) != true) { throw new Error('13: 10n < double(20.5) should be true'); }
    if ((b > d) != false) { throw new Error('14: 10n > double(20.5) should be false'); }

    // byte vs bigint
    if ((5 > b) != false) { throw new Error('15: byte(5) > 10n should be false'); }
    if ((5 < b) != true) { throw new Error('16: byte(5) < 10n should be true'); }

    // short vs bigint
    if ((20 > b) != true) { throw new Error('17: short(20) > 10n should be true'); }
    if ((20 <= b) != false) { throw new Error('18: short(20) <= 10n should be false'); }
console.log('verified');
}
