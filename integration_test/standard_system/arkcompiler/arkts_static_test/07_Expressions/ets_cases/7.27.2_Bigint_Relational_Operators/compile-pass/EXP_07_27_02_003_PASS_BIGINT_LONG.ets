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
 * @id EXP_07_27_02_003_PASS_BIGINT_LONG
 * @expect compile-pass
 * @section 7.27.2
 * @design bigint 与 long 类型关系运算编译通过，long 隐式转换为 bigint
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       long 是整数类型，按规则转换为 bigint 后比较
 */
function main(): void {
    let b: bigint = 2n;
    let l: long = 3;

    // bigint vs long
    let r1: boolean = b < l;
    let r2: boolean = b <= l;
    let r3: boolean = b > l;
    let r4: boolean = b >= l;

    // long vs bigint
    let r5: boolean = l > b;
    let r6: boolean = l >= b;
    let r7: boolean = l < b;
    let r8: boolean = l <= b;

    // 大值 long
    let big: long = 2147483648; // 超过 int 范围的值
    let r9: boolean = b < big;

    console.log('r1: ' + r1);
}
