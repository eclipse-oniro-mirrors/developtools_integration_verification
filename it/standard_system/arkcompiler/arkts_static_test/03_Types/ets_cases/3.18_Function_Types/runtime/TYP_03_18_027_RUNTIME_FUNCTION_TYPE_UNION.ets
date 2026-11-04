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
 * @id TYP_03_18_027_RUNTIME_FUNCTION_TYPE_UNION
 * @expect runtime
 * @section 3.18
 * @design 联合类型中函数类型的运行时行为验证
 * @note 运行时用例：验证联合类型中函数类型成员的调用
 */
type StringOrFunc = string | ((x: int) => int)

function main(): void {
  let val: StringOrFunc = "hello"
  if (typeof val == "string") {
    let s: string = val as string
    if (s != "hello") {
      throw new Error("string value should be 'hello'")
    }
  }

  let val2: StringOrFunc = (x: int): int => { return x * 2 }
  if (typeof val2 != "string") {
    let f: (x: int) => int = val2 as (x: int) => int
    if (f(5) != 10) {
      throw new Error("f(5) should be 10")
    }
  }

  console.log("Function type union verified")
}