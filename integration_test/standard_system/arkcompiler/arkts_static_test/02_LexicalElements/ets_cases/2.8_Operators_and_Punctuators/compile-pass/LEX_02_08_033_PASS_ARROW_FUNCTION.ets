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
 * @id LEX_02_08_033_PASS_ARROW_FUNCTION
 * @expect compile-pass
 * @section 2.8
 * @design 箭头函数
 * @note compile-pass 用例：验证箭头函数 =>
 */

// 箭头函数 =>
let add = (a: int, b: int): int => a + b
let square = (x: int): int => x * x
let greet = (name: string): string => `Hello, ${name}!`

// 多行箭头函数
let complex = (x: int, y: int): int => {
  let sum = x + y
  return sum * 2
}
