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
 * @id NAM_04_06_05_003_PASS_TERNARY_INFER_LET
 * @expect compile-pass
 * @section 4.6.5
 * @design 三元运算类型推断-let
 * @note 正向用例：验证 let 三元运算类型推断
 */
function cond(): boolean { return Math.random() < 0.5 ? true : false; }
let b_var = cond() ? 1 : 2;
let c_var = cond() ? 3 : 3.14;
let c1 = true ? 3 : 3.14;
let c2 = false ? 3 : 3.14;
let d_var = cond() ? "one" : "two";
let e_var = cond() ? 1 : "one";
let e1 = true ? 1 : "one";
let e2 = false ? 1 : "one";
