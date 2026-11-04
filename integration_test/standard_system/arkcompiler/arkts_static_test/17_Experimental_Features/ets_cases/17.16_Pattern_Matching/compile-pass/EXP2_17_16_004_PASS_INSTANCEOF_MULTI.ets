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
 * @id EXP2_17_16_004_PASS_INSTANCEOF_MULTI
 * @expect compile-pass
 * @section 17.16
 * @design 多个 instanceof 检查组合使用——验证在多种类型间进行识别
 * @note 正向用例：验证连续 instanceof 检查编译通过，含 null 检查兼容
 */
function testInstanceofMulti(): void {
  let val: Object = 'test'
  let checks: int = 0
  if (val instanceof String) { checks++ }
  if (val instanceof Number) { checks++ }
  if (val instanceof Object) { checks++ }
  console.log('checks passed: ' + checks)
}
