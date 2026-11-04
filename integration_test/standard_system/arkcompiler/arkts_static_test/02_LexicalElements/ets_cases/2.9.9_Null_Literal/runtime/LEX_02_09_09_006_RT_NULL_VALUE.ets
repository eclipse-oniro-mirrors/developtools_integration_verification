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
 * @id LEX_02_09_09_006_RT_NULL_VALUE
 * @expect runtime
 * @section 2.9.9
 * @design null 值验证
 * @note runtime 用例：验证 null 值的运行时行为
 */

function main(): void {
  // null 值
  let x1: null = null
  if (x1 !== null) { throw new Error("null failed, got " + x1) }

  // T | null 类型
  let x2: int | null = null
  if (x2 !== null) { throw new Error("int | null failed") }

  let x3: string | null = null
  if (x3 !== null) { throw new Error("string | null failed") }
}
