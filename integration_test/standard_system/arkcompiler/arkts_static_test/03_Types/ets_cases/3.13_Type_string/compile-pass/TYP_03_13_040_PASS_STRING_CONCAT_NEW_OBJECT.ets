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
 * @id TYP_03_13_040_PASS_STRING_CONCAT_NEW_OBJECT
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 连接运算符 + 产生 string 类型值，非常量表达式可隐式创建新 string 对象
 * @note 正向用例：字符串拼接结果为 string 类型
 */
function main(): void {
  let s1: string = "hello"
  let s2: string = " "
  let s3: string = "world"
  let result: string = s1 + s2 + s3
  if (result !== "hello world") throw new Error("concat new object failed")
  console.log("verified")
}