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
 * @id EXP_07_27_03_004_PASS_STRING_ASCII_ORDER
 * @expect compile-pass
 * @section 7.27.3
 * @design 验证ASCII字符顺序（数字<大写字母<小写字母）的四个关系运算符编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
let digit: string = '0';
let upper: string = 'A';
let lower: string = 'a';
let r1: boolean = digit < upper;
let r2: boolean = digit <= upper;
let r3: boolean = digit > upper;
let r4: boolean = digit >= upper;
let r5: boolean = upper < lower;
let r6: boolean = upper <= lower;
let r7: boolean = upper > lower;
let r8: boolean = upper >= lower;
let r9: boolean = digit < lower;
let r10: boolean = '0' < 'A';
