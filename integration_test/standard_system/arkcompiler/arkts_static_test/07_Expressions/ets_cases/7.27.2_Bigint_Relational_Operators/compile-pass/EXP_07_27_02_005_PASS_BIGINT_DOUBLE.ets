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
 * @id EXP_07_27_02_005_PASS_BIGINT_DOUBLE
 * @expect compile-pass
 * @section 7.27.2
 * @design bigint 与 double 类型关系运算编译通过，bigint 隐式转换为 double 后比较
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       Spec 示例：let b = 2n; b < 3.0  // true, 'b' is converted to double
 */
function main(): void {
    let b: bigint = 2n;
    let d: double = 3.0;

    // bigint vs double
    let r1: boolean = b < d;
    let r2: boolean = b <= d;
    let r3: boolean = b > d;
    let r4: boolean = b >= d;

    // double vs bigint
    let r5: boolean = d > b;
    let r6: boolean = d >= b;
    let r7: boolean = d < b;
    let r8: boolean = d <= b;

    // 字面量
    let r9: boolean = 2n < 3.0;
    let r10: boolean = 2n >= 3.0;

    console.log('r1: ' + r1);
}
