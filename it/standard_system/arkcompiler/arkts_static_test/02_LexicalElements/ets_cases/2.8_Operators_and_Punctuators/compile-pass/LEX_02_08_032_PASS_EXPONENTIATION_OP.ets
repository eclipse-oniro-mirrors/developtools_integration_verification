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
 * @id LEX_02_08_032_PASS_EXPONENTIATION_OP
 * @expect compile-pass
 * @section 2.8
 * @design 指数运算符
 * @note compile-pass 用例：验证指数运算符 **
 */

// 指数运算符 **
let x1 = 2 ** 3
let x2 = 10 ** 2
let x3 = 2 ** 10
let x4 = 1 ** 0
