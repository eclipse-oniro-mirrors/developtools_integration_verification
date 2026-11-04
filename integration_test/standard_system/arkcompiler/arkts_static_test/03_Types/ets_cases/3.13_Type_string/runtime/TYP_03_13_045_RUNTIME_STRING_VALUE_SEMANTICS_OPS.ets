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
 * @id TYP_03_13_045_RUNTIME_STRING_VALUE_SEMANTICS_OPS
 * @expect runtime
 * @section 3.13
 * @design 验证 string 的值类型语义：== 比较的是值而非引用
 * @note 运行时用例：两个相同值的 string 变量 == 返回 true
 */
function main(): void {
  let s1: string = "hello"
  let s2: string = "hello"
  let s3: string = "world"

  if (s1 !== s2) throw new Error("s1 !== s2 assert failed, value semantics broken")
  if (s1 === s3) throw new Error("s1 === s3 assert failed")
  if (s1 == s2) {} else throw new Error("s1 == s2 failed")
  if (s1 != s3) {} else throw new Error("s1 != s3 failed")

  console.log("TYP_03_13_045 verified")
}