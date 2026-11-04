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
 * @id EXP_07_27_02_002_PASS_BIGINT_INT
 * @expect compile-pass
 * @section 7.27.2
 * @design bigint 与 int 类型关系运算编译通过，int 隐式转换为 bigint
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       Spec 示例：let b = 2n; b < 3  // true, '2' is converted implicitly to bigint
 */
function main(): void {
    let b: bigint = 2n;
    let n: int = 3;

    // bigint vs int
    let r1: boolean = b < n;
    let r2: boolean = b <= n;
    let r3: boolean = b > n;
    let r4: boolean = b >= n;

    // int vs bigint（交换操作数顺序）
    let r5: boolean = n > b;
    let r6: boolean = n >= b;
    let r7: boolean = n < b;
    let r8: boolean = n <= b;

    // 字面量
    let r9: boolean = 2n < 3;
    let r10: boolean = 2n >= 3;

    console.log('r1: ' + r1);
}
