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
 * @id LEX_02_09_09_016_RT_NULL_TEMPLATE_STRING
 * @expect runtime
 * @section 2.9.9
 * @design null 在模板字符串中
 * @note runtime 用例：验证 null 在模板字符串中的运行时行为
 */

function main(): void {
  // null 在模板字符串中
  let x1: int | null = null
  let s1 = `value: ${x1}`
  if (s1 !== "value: null") {
    throw new Error("template string failed, got " + s1)
  }

  let x2: string | null = null
  let s2 = `value: ${x2}`
  if (s2 !== "value: null") {
    throw new Error("template string failed, got " + s2)
  }
}
