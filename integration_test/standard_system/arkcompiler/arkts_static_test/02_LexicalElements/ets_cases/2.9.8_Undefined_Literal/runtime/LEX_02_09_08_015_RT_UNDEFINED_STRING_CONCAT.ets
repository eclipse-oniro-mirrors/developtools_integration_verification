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
 * @id LEX_02_09_08_015_RT_UNDEFINED_STRING_CONCAT
 * @expect runtime
 * @section 2.9.8
 * @design undefined 在字符串连接中
 * @note runtime 用例：验证 undefined 在字符串连接中的运行时行为
 */

function main(): void {
  // undefined 在字符串连接中
  let x1: int | undefined = undefined
  let s1 = "value: " + x1
  if (s1 !== "value: undefined") {
    throw new Error("string concat failed, got " + s1)
  }

  let x2: string | undefined = undefined
  let s2 = "value: " + x2
  if (s2 !== "value: undefined") {
    throw new Error("string concat failed, got " + s2)
  }
}
