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
 * @id TYP_03_13_029_RUNTIME_STRING_IMMUTABILITY
 * @expect runtime
 * @section 3.13
 * @design 验证 string 不可变性——赋值后不影响原引用
 * @note 运行时用例：验证 string 赋值是创建新对象而非修改原对象
 */
function main(): void {
  let s1: string = "hello"
  let s2: string = s1
  s1 = "world"
  if (s2 !== "hello") throw new Error("immutability assert failed")
  console.log("verified")
}