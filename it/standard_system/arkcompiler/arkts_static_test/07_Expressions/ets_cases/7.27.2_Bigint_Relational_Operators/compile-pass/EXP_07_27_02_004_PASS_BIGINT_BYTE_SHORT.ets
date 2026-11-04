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
 * @id EXP_07_27_02_004_PASS_BIGINT_BYTE_SHORT
 * @expect compile-pass
 * @section 7.27.2
 * @design bigint 与 byte/short 类型关系运算编译通过，byte/short 隐式转换为 bigint
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       byte/short 是整数类型，按规则转换为 bigint 后比较
 */
function main(): void {
    let b: bigint = 2n;
    let bt: byte = 3;
    let s: short = 5;

    // bigint vs byte
    let r1: boolean = b < bt;
    let r2: boolean = b <= bt;
    let r3: boolean = b > bt;
    let r4: boolean = b >= bt;

    // byte vs bigint
    let r5: boolean = bt > b;
    let r6: boolean = bt <= b;

    // bigint vs short
    let r7: boolean = b < s;
    let r8: boolean = b <= s;
    let r9: boolean = b > s;
    let r10: boolean = b >= s;

    // short vs bigint
    let r11: boolean = s > b;
    let r12: boolean = s >= b;

    // 负值
    let neg: byte = -1;
    let r13: boolean = b > neg;

    console.log('r1: ' + r1);
}
