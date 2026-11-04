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
 * @id LEX_02_11_002_PASS_LINE_TERMINATOR_EXPR
 * @expect compile-pass
 * @section 2.11
 * @design 表达式语句由行分隔符终止
 * @note compile-pass 用例：验证表达式语句由行分隔符终止
 */

// 表达式语句由行分隔符终止
let x1: int = 1
let x2: int = 2
let x3: int = x1 + x2
