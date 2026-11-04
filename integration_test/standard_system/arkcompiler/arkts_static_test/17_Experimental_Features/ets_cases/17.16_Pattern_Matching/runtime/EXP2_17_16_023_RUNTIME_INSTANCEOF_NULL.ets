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
 * @id EXP2_17_16_023_RUNTIME_INSTANCEOF_NULL
 * @expect runtime
 * @section 17.16
 * @design 运行时验证 instanceof 对 null 和不同对象类型的处理
 * @note 运行时用例：验证 null instanceof AnyType 始终为 false，以及基本类型装箱的处理
 */
function main(): void {
  // null instanceof 任何类型都应该是 false
  let nullObj: Object | null = null
  if (nullObj instanceof String) {
    throw new Error('FAIL: null should not be instanceof String')
  }
  if (nullObj instanceof Object) {
    throw new Error('FAIL: null should not be instanceof Object')
  }

  // 验证非 null 对象正常工作
  let strObj: Object = 'world'
  if (!(strObj instanceof String)) {
    throw new Error('FAIL: 'world' should be instanceof String')
  }

  // null 检查与 instanceof 组合
  let maybeNull: String | null = null
  if (maybeNull !== null && maybeNull instanceof String) {
    throw new Error('FAIL: null check should prevent instanceof on null')
  }

  console.log('PASS: instanceof null handling correct')
}
