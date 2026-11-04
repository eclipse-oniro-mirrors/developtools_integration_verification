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
 * @id EXP_07_27_03_006_PASS_STRING_VARIABLES
 * @expect compile-pass
 * @section 7.27.3
 * @design 验证字符串变量比较的所有关系运算符编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
const c1: string = 'hello';
const c2: string = 'world';
let v1: string = 'alpha';
let v2: string = 'beta';
let r1: boolean = c1 < c2;
let r2: boolean = c1 <= c2;
let r3: boolean = c1 > c2;
let r4: boolean = c1 >= c2;
let r5: boolean = v1 < v2;
let r6: boolean = v1 <= v2;
let r7: boolean = v1 > v2;
let r8: boolean = v1 >= v2;
