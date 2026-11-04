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
 * @id LEX_02_09_09_004_PASS_NULL_COMPARISON
 * @expect compile-pass
 * @section 2.9.9
 * @design null 比较运算
 * @note compile-pass 用例：验证 null 比较运算
 */

// null 比较运算
let x1: null = null
let x2: null = null

let b1 = x1 === x2
let b2 = x1 !== x2
let b3 = x1 === null
let b4 = x1 !== null
