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
 * @id EXP_07_27_03_003_PASS_STRING_CASE
 * @expect compile-pass
 * @section 7.27.3
 * @design 验证字符串大小写比较的四个关系运算符编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
let a: string = 'Hello';
let b: string = 'hello';
let r1: boolean = a < b;
let r2: boolean = a <= b;
let r3: boolean = a > b;
let r4: boolean = a >= b;
let r5: boolean = 'ABC' < 'abc';
let r6: boolean = 'ABC' <= 'abc';
let r7: boolean = 'ABC' > 'abc';
let r8: boolean = 'ABC' >= 'abc';
