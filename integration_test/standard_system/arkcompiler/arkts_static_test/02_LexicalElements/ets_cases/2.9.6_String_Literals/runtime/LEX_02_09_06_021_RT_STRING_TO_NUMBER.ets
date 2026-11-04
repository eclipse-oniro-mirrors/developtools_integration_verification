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
 * @id LEX_02_09_06_021_RT_STRING_TO_NUMBER
 * @expect runtime
 * @section 2.9.6
 * @design 字符串与数字转换验证
 * @note runtime 用例：验证字符串转数字
 */

function main(): void {
  // 验证字符串转整数
  let s1: string = "123"
  let n1: int = Int.parseInt(s1, 10)
  if (n1 !== 123) { throw new Error("parseInt failed, got " + n1) }

  // 验证十六进制字符串转整数
  let s2: string = "FF"
  let n2: int = Int.parseInt(s2, 16)
  if (n2 !== 255) { throw new Error("parseInt hex failed, got " + n2) }

  // 验证数字转字符串
  let n3: int = 456
  let s3: string = n3.toString()
  if (s3 !== "456") { throw new Error("toString failed, got " + s3) }

  // 验证负数转字符串
  let n4: int = -789
  let s4: string = n4.toString()
  if (s4 !== "-789") { throw new Error("negative toString failed, got " + s4) }
}
