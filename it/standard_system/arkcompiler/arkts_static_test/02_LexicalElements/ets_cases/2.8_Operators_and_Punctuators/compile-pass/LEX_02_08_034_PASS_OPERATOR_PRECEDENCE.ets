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
 * @id LEX_02_08_034_PASS_OPERATOR_PRECEDENCE
 * @expect compile-pass
 * @section 2.8
 * @design 运算符优先级
 * @note compile-pass 用例：验证运算符优先级
 */

// 运算符优先级
// 乘法优先于加法
let x1 = 2 + 3 * 4  // 14

// 指数优先于乘法
let x2 = 2 * 3 ** 2  // 18

// 逻辑与优先于逻辑或
let x3 = true || false && false  // true

// 三元运算符优先级
let x4 = true ? 1 : 2
