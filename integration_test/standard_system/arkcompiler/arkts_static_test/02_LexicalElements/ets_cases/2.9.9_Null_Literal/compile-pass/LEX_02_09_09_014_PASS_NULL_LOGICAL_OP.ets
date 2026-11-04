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
 * @id LEX_02_09_09_014_PASS_NULL_LOGICAL_OP
 * @expect compile-pass
 * @section 2.9.9
 * @design null 在逻辑运算中
 * @note compile-pass 用例：验证 null 在逻辑运算中的使用
 */

// null 在逻辑运算中
let x1: int | null = null
let x2: int | null = 1

let r1 = x1 || x2
let r2 = x1 && x2
let r3 = x1 ?? x2
