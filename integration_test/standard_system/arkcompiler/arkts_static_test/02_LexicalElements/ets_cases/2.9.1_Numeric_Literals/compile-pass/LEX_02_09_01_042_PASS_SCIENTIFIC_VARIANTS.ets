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
 * @id LEX_02_09_01_042_PASS_SCIENTIFIC_VARIANTS
 * @expect compile-pass
 * @section 2.9.1
 * @design 科学计数法变体
 * @note compile-pass 用例：验证科学计数法的不同变体
 */

// 科学计数法变体
let x1 = 1.5E10
let x2 = 1.5e10
let x3 = 1e-5
let x4 = 1E-5
let x5 = 1.5e+10
let x6 = 1.5E+10
let x7 = .5e10
let x8 = 1.e10
