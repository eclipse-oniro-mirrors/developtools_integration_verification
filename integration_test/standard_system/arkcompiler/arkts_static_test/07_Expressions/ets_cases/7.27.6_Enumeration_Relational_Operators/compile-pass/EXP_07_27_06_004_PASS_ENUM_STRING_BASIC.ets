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
 * @id EXP_07_27_06_004_PASS_ENUM_STRING_BASIC
 * @expect compile-pass
 * @section 7.27.6
 * @design 验证 string 基类型枚举四个关系运算符编译通过
 * @note 正向用例：string 基类型枚举成员使用 <, <=, >, >= 运算符
 *       基于字符串字典序比较语义
 */
enum StrEnum: string { A = 'apple', B = 'banana', C = 'cherry' }

function main(): void {
    let r1: boolean = StrEnum.A < StrEnum.B;   // 'apple' < 'banana' → true
    let r2: boolean = StrEnum.A <= StrEnum.A;  // 'apple' <= 'apple' → true
    let r3: boolean = StrEnum.C > StrEnum.A;   // 'cherry' > 'apple' → true
    let r4: boolean = StrEnum.B >= StrEnum.A;  // 'banana' >= 'apple' → true
    let r5: boolean = StrEnum.A <= StrEnum.B;  // 'apple' <= 'banana' → true
    let r6: boolean = StrEnum.B >= StrEnum.B;  // 'banana' >= 'banana' → true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
