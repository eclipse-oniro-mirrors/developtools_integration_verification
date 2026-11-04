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
 * @id TYP_03_03_010_PASS_PARENTHESES_PRIORITY
 * @expect compile-pass
 * @section 3.3
 * @design 类型组合括号优先级规则: union 优先级最低
 *   - string[] | undefined  → 整个数组可空（非元素）
 *   - (string | undefined)[]  → 数组元素可空
 *   - () => string | undefined  → 函数返回值可空
 *   - (() => string) | undefined  → 整个函数可空
 * @note 正向用例：验证 spec §3.3 括号优先级规则四种正确用法
 */
function testParenthesesPriority(): void {
  // A nullish array with elements of type string
  let a: string[] | undefined
  let s: string[] = []
  a = s
  a = undefined

  // An array with elements whose types are string or undefined
  let b1: (string | undefined)[]
  b1 = ["aa", undefined]

  // string or array of undefined elements
  let b2: string | undefined[]
  b2 = [undefined, undefined]
  b2 = "hello"

  // A function type that returns string or undefined
  let c: () => string | undefined
  c = (): string | undefined => { return undefined }

  // (A function type that returns string) or undefined
  let d: (() => string) | undefined
  d = undefined
  d = (): string => { return "hi" }
}