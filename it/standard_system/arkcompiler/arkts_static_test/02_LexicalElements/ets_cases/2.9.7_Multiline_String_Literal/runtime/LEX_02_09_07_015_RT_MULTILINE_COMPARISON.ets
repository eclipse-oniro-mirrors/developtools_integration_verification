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
 * @id LEX_02_09_07_015_RT_MULTILINE_COMPARISON
 * @expect runtime
 * @section 2.9.7
 * @design 多行字符串比较运行时验证
 * @note runtime 用例：验证多行字符串比较的运行时行为
 */

function main(): void {
  // 多行字符串比较
  let s1 = `Hello
World`
  let s2 = `Hello
World`
  if (s1 !== s2) { throw new Error("equality failed") }

  // 不同多行字符串比较
  let s3 = `Hello
World`
  let s4 = `Hello
Test`
  if (s3 === s4) { throw new Error("inequality failed") }

  // 多行字符串与普通字符串比较
  let s5 = `Hello`
  let s6 = "Hello"
  if (s5 !== s6) { throw new Error("multiline vs regular failed") }
}
