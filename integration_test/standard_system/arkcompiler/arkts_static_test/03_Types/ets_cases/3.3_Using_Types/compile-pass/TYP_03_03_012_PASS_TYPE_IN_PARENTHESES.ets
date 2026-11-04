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
 * @id TYP_03_03_012_PASS_TYPE_IN_PARENTHESES
 * @expect compile-pass
 * @section 3.3
 * @design 括号包裹的类型表达式 (type)
 * @note 正向用例：验证 type in parentheses 用法
 */
function testTypeInParentheses(): void {
  // 简单类型加括号合法
  let a: (int) = 42
  let b: (string) = "hi"

  // 联合类型加括号
  let u: (int | string) = 1

  // 数组元素是括号包裹的 union
  let arr: (int | string)[] = [1, "a"]

  // 函数类型加括号
  let f: ((x: int) => int) = (x: int): int => { return x }
}