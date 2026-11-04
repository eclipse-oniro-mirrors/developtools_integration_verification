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
 * @id EXP_07_27_03_005_PASS_STRING_EQUAL
 * @expect compile-pass
 * @section 7.27.3
 * @design 验证相同字符串比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
let a: string = 'abc';
let r1: boolean = a < a;
let r2: boolean = a <= a;
let r3: boolean = a > a;
let r4: boolean = a >= a;
let r5: boolean = 'xyz' < 'xyz';
let r6: boolean = 'xyz' <= 'xyz';
let r7: boolean = 'xyz' > 'xyz';
let r8: boolean = 'xyz' >= 'xyz';
