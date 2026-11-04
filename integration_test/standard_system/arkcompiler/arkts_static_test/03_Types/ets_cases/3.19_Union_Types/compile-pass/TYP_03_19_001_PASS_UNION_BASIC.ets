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
 * @id TYP_03_19_001_PASS_UNION_BASIC
 * @expect compile-pass
 * @section 3.19
 * @design 联合类型基本声明与赋值
 * @note 正向用例：验证联合类型声明和赋值的正确用法
 */
type StringOrNumber = string | number
type Animal = Cat | Dog | Frog | number

class Cat { sleep(): void {} }
class Dog { sleep(): void {} }
class Frog { sleep(): void {} }

function main(): void {
  let x: StringOrNumber = "hello"
  x = 42

  let a: Animal = new Cat()
  a = new Frog()
  a = 42

  console.log("verified")
}