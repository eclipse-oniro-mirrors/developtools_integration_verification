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
 * @id TYP_03_01_045_RUNTIME_NULL_CHECK
 * @expect runtime
 * @section 3.1
 * @design null 在联合类型中的运行时检查
 * @note 运行时用例：验证 T|null 的 null 检查和收窄
 */
function safeLength(s: string | null): int {
  if (s == null) {
    return -1
  }
  // 收窄后可调用 string 方法
  return s.length
}

function main(): void {
  let r1: int = safeLength(null)
  if (r1 != -1) {
    throw new Error("null input should return -1")
  }

  let r2: int = safeLength("hello")
  if (r2 != 5) {
    throw new Error("'hello' length should be 5")
  }

  let r3: int = safeLength("")
  if (r3 != 0) {
    throw new Error("'' length should be 0")
  }

  console.log("Null check verified")
}