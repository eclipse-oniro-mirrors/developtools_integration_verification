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
 * @id TYP_03_13_046_RUNTIME_STRING_LENGTH_IMMUTABLE
 * @expect runtime
 * @section 3.13
 * @design 验证 string.length 在运行时是只读的非负整数属性
 * @note 运行时用例：验证 string.length 返回 int 且值正确
 */
function main(): void {
  let s1: string = ""
  let s2: string = "a"
  let s3: string = "hello world"
  let s4: string = "a\0b"

  if (s1.length !== 0) throw new Error("empty length failed")
  if (s2.length !== 1) throw new Error("single char length failed")
  if (s3.length !== 11) throw new Error("hello world length failed, got: " + s3.length.toString())
  if (s4.length !== 3) throw new Error("null char length failed, got: " + s4.length.toString())

  let len: int = s3.length
  if (len !== 11) throw new Error("int length assert failed")

  console.log("TYP_03_13_046 verified")
}