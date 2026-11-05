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
 * @id EXP_07_27_06_005_PASS_ENUM_INT_MIXED
 * @expect compile-pass
 * @section 7.27.6
 * @design 验证混合初始化的 int 基类型枚举关系运算符编译通过
 * @note 正向用例：Red=0, Blue=5(显式), Green=6(Red+5+1)
 *       显式和隐式值混合的枚举成员关系运算
 */
enum Mixed { Red, Blue = 5, Green }  // Red=0, Blue=5, Green=6

function main(): void {
    let r1: boolean = Mixed.Red < Mixed.Blue;    // 0 < 5 → true
    let r2: boolean = Mixed.Green > Mixed.Blue;  // 6 > 5 → true
    let r3: boolean = Mixed.Red <= Mixed.Green;  // 0 <= 6 → true
    let r4: boolean = Mixed.Blue >= Mixed.Red;   // 5 >= 0 → true
    let r5: boolean = Mixed.Blue < Mixed.Green;  // 5 < 6 → true
    let r6: boolean = Mixed.Red > Mixed.Blue;    // 0 > 5 → false

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
