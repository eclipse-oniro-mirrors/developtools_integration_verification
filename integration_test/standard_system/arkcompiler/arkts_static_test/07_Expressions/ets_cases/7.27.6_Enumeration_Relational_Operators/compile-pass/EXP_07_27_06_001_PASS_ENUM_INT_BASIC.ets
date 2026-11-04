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
 * @id EXP_07_27_06_001_PASS_ENUM_INT_BASIC
 * @expect compile-pass
 * @section 7.27.6
 * @design 验证 int 基类型枚举四个关系运算符编译通过
 * @note 正向用例：int 基类型枚举成员使用 <, <=, >, >= 运算符
 *       默认基类型为 int，基于隐含值 0,1,2 的数值比较
 */
enum Color { Red, Green, Blue }  // base type: int (default)

function main(): void {
    let r1: boolean = Color.Red < Color.Green;   // 0 < 1 → true
    let r2: boolean = Color.Red <= Color.Green;  // 0 <= 1 → true
    let r3: boolean = Color.Green > Color.Red;   // 1 > 0 → true
    let r4: boolean = Color.Blue >= Color.Green; // 2 >= 1 → true
    let r5: boolean = Color.Red <= Color.Red;    // 0 <= 0 → true
    let r6: boolean = Color.Blue >= Color.Blue;  // 2 >= 2 → true
    let r7: boolean = Color.Red < Color.Blue;    // 0 < 2 → true
    let r8: boolean = Color.Blue > Color.Red;    // 2 > 0 → true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
