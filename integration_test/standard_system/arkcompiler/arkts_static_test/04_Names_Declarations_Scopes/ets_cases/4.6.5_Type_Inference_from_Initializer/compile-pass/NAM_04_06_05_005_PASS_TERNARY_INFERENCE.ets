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
 * @id NAM_04_06_05_005_PASS_TERNARY_INFERENCE
 * @expect compile-pass
 * @section 4.6.5
 * @design 三元条件表达式类型推断
 * @note 正向用例：验证 spec 中三元条件表达式类型推断综合示例（§4.6.5 行 758-844）各类型推断正确编译
 */
function cond(): boolean { return Math.random() < 0.5 ? true : false; }

let a = null;                     // Type of 'a' is null
let aa = undefined;               // Type of 'aa' is undefined
let arr = [null, undefined];      // Type of 'arr' is (null | undefined)[]

let b = cond() ? 1 : 2;          // Type of 'b' is int
let c = cond() ? 3 : 3.14;       // Type of 'c' is int | double
let c1 = true ? 3 : 3.14;        // Type of 'c1' is int
let c2 = false ? 3 : 3.14;       // Type of 'c2' is double
let d = cond() ? "one" : "two";  // Type of 'd' is string
let e = cond() ? 1 : "one";      // Type of 'e' is int | string
let e1 = true ? 1 : "one";       // Type of 'e1' is int
let e2 = false ? 1 : "one";      // Type of 'e2' is string

const bb = cond() ? 1 : 2;       // Type of 'bb' is int
const cc = cond() ? 1 : 3.14;    // Type of 'cc' is int | double
const cc1 = true ? 1 : 3.14;     // Type of 'cc1' is int
const cc2 = false ? 1 : 3.14;    // Type of 'cc2' is double
const dd = cond() ? "one" : "two";   // Type of 'dd' is "one" | "two"
const dd1 = true ? "one" : "two";    // Type of 'dd1' is "one"
const dd2 = false ? "one" : "two";   // Type of 'dd2' is "two"
const ee = cond() ? 1 : "one";   // Type of 'ee' is int | "one"

let x1 = 1;                      // Type of 'x1' is int
const x2 = 1;                    // Type of 'x2' is int
let s1 = "1";                    // Type of 's1' is string
const s2 = "1";                  // Type of 's2' is "1"
