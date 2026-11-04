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
 * @id LEX_02_04_031_PASS_CONDITIONAL_LINE_SEP
 * @expect compile-pass
 * @section 2.4
 * @design 条件表达式内换行
 * @note compile-pass 用例：验证条件表达式中的换行符
 */

// if 语句内换行
let x: int = 10
if (x > 5) {
  let y = x + 1
}

// if-else 语句内换行
if (x > 5) {
  let y = x + 1
} else {
  let y = x - 1
}

// 三元表达式内换行
let z = (x > 5)
  ? x + 1
  : x - 1
