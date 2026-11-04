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
 * @id LEX_02_06_044_PASS_CASE_SENSITIVITY
 * @expect compile-pass
 * @section 2.6
 * @design 标识符大小写敏感
 * @note compile-pass 用例：验证标识符大小写敏感
 */

// 大小写敏感的标识符
let myVar = 1
let MyVar = 2
let MYVAR = 3
let myvar = 4

// 不同大小写的标识符可以共存
let x = 10
let X = 20
let _x = 30
let _X = 40
