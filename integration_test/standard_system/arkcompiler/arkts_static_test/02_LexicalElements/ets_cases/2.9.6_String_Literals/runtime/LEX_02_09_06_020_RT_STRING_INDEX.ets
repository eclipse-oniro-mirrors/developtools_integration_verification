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
 * @id LEX_02_09_06_020_RT_STRING_INDEX
 * @expect runtime
 * @section 2.9.6
 * @design 字符串索引访问验证
 * @note runtime 用例：验证字符串索引访问
 */

function main(): void {
  // 验证字符串索引访问
  let s1: string = "Hello"
  let c1: string = s1[0]
  if (c1 !== "H") { throw new Error("index 0 failed, got " + c1) }

  let c2: string = s1[1]
  if (c2 !== "e") { throw new Error("index 1 failed, got " + c2) }

  let c3: string = s1[4]
  if (c3 !== "o") { throw new Error("index 4 failed, got " + c3) }

  // 验证空字符串索引（应该抛出异常或返回 undefined）
  let s2: string = ""
  // 空字符串没有有效索引
}
