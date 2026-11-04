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
 * @id EXP_07_22_015_PASS_LOGICAL_AND_OR
 * @expect compile-pass
 * @section 7.22
 * @design 验证条件与 && / 条件或 || 的类型组合：
 *          boolean&&boolean→boolean, boolean||boolean→boolean
 *         Note 5：非 boolean 类型通过 Extended Conditional Expressions
 * @note 正向用例：逻辑运算符结果类型为 boolean
 */
function main(): void {
  let a: boolean = true
  let b: boolean = false

  // boolean && boolean → boolean
  let r1 = a && b
  let r1Type = typeof(r1)
  if (r1Type != 'boolean') {
    throw new Error('boolean&&boolean should be boolean, got ' + r1Type)
  }
  if (r1 != false) {
    throw new Error('true && false should be false')
  }

  // boolean || boolean → boolean
  let r2 = a || b
  let r2Type = typeof(r2)
  if (r2Type != 'boolean') {
    throw new Error('boolean||boolean should be boolean, got ' + r2Type)
  }
  if (r2 != true) {
    throw new Error('true || false should be true')
  }

  // false && true → false
  let r3 = b && a
  if (r3 != false) {
    throw new Error('false && true should be false')
  }

  // false || false → false
  let r4 = b || b
  if (r4 != false) {
    throw new Error('false || false should be false')
  }
console.log('verified')
}
main()
