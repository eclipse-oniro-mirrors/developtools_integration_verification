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
 * @id LEX_02_03_044_RT_TYPE_ANNOTATION_WS
 * @expect runtime
 * @section 2.3
 * @design 类型注解周围空白运行时验证
 * @note runtime 用例：验证类型注解周围的空白不影响程序行为
 */

function add1(a: int, b: int): int {
  return a + b
}

function add2(a : int, b : int) : int {
  return a + b
}

function main(): void {
  // 类型注解周围空白不影响程序行为
  let x: int = 10
  let y : int = 20
  let z:int = 30

  let result1 = add1(x, y)
  if (result1 !== 30) { throw new Error("add1 failed, got " + result1) }

  let result2 = add2(x, y)
  if (result2 !== 30) { throw new Error("add2 failed, got " + result2) }

  let sum = x + y + z
  if (sum !== 60) { throw new Error("sum failed, got " + sum) }
}
