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
 * @id LEX_02_09_09_008_RT_NULL_TYPE_CHECK
 * @expect runtime
 * @section 2.9.9
 * @design null 类型检查
 * @note runtime 用例：验证 null 类型检查的运行时行为
 */

function main(): void {
  // null 类型检查
  let x1: null = null
  
  if (typeof x1 !== "object") {
    throw new Error("typeof null failed, got " + typeof x1)
  }

  // T | null 类型检查
  let x2: int | null = null
  if (x2 !== null) { throw new Error("int | null failed") }

  let x3: string | null = null
  if (x3 !== null) { throw new Error("string | null failed") }
}
