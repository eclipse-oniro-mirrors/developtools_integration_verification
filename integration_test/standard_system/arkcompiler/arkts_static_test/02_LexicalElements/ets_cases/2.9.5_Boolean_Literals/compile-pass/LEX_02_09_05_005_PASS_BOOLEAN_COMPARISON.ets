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
 * @id LEX_02_09_05_005_PASS_BOOLEAN_COMPARISON
 * @expect compile-pass
 * @section 2.9.5
 * @design 布尔比较运算
 * @note compile-pass 用例：验证布尔比较运算语法
 */

// 布尔比较运算
let x1: boolean = true === true
let x2: boolean = true !== false
let x3: boolean = false === false
let x4: boolean = true !== true
