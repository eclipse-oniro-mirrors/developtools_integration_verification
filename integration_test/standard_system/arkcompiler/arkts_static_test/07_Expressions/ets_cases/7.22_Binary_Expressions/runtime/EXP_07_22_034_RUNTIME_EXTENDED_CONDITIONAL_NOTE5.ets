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
 * @id EXP_07_22_034_RUNTIME_EXTENDED_CONDITIONAL_NOTE5
 * @expect runtime
 * @section 7.22
 * @design 验证 Note 5：Extended Conditional Expressions——&&/|| 支持非 boolean 类型，
 *         使用 JS 风格 truthy/falsy 语义：
 *         falsy: null, undefined, 0, "", false
 *         truthy: 非零数值, 非空字符串, 对象
 * @note 运行时用例：非 boolean 操作数的 &&/|| 行为
 */
function main(): void {
  // || 返回第一个 truthy 或最后一个 falsy
  let r1 = null || 42
  if (r1 != 42) {
    throw new Error('null || 42 should be 42, got ' + r1)
  }

  let r2 = 0 || 'default'
  if (r2 != 'default') {
    throw new Error('0 || 'default' should be 'default', got ' + r2)
  }

  let r3 = '' || 'fallback'
  if (r3 != 'fallback') {
    throw new Error(''' || 'fallback' should be 'fallback', got ' + r3)
  }

  // 第一个 truthy 即返回
  let r4 = 'hello' || 'world'
  if (r4 != 'hello') {
    throw new Error(''hello' || 'world' should be 'hello', got ' + r4)
  }

  let r5 = 42 || 0
  if (r5 != 42) {
    throw new Error('42 || 0 should be 42, got ' + r5)
  }

  // && 返回第一个 falsy 或最后一个 truthy
  let r6 = null && 42
  if (r6 != null) {
    throw new Error('null && 42 should be null, got ' + r6)
  }

  let r7 = 'hello' && 'world'
  if (r7 != 'world') {
    throw new Error(''hello' && 'world' should be 'world', got ' + r7)
  }

  let r8 = 42 && 0
  if (r8 != 0) {
    throw new Error('42 && 0 should be 0, got ' + r8)
  }

  // truthy 对象
  let obj = {}
  let r9 = obj || 'fallback'
  if (r9 != obj) {
    throw new Error('Object || fallback should be the object itself')
  }
console.log('verified')
}
main()
