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
 * @id LEX_02_09_05_009_RT_BOOLEAN_COMPARISON
 * @expect runtime
 * @section 2.9.5
 * @design 布尔比较正确性
 * @note runtime 用例：验证布尔比较结果
 */

function main(): void {
  // 验证相等比较
  let x1: boolean = true === true
  if (x1 !== true) { throw new Error("true === true failed") }

  let x2: boolean = false === false
  if (x2 !== true) { throw new Error("false === false failed") }

  let x3: boolean = true === false
  if (x3 !== false) { throw new Error("true === false failed") }

  // 验证不等比较
  let x4: boolean = true !== false
  if (x4 !== true) { throw new Error("true !== false failed") }

  let x5: boolean = false !== true
  if (x5 !== true) { throw new Error("false !== true failed") }

  let x6: boolean = true !== true
  if (x6 !== false) { throw new Error("true !== true failed") }
}
