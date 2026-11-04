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
 * @id LEX_02_09_05_013_RT_BOOLEAN_TO_STRING
 * @expect runtime
 * @section 2.9.5
 * @design 布尔转字符串验证
 * @note runtime 用例：验证布尔转字符串
 */

function main(): void {
  // 验证布尔转字符串
  let x1: boolean = true
  let s1: string = x1.toString()
  if (s1 !== "true") { throw new Error("true.toString() failed, got " + s1) }

  let x2: boolean = false
  let s2: string = x2.toString()
  if (s2 !== "false") { throw new Error("false.toString() failed, got " + s2) }

  // 验证布尔字符串拼接
  let x3: boolean = true
  let s3: string = "value is " + x3.toString()
  if (s3 !== "value is true") { throw new Error("string concat failed, got " + s3) }
}
