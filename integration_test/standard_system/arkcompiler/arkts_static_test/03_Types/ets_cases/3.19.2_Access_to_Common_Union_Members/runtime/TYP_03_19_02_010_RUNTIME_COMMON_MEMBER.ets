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
 * @id TYP_03_19_02_010_RUNTIME_COMMON_MEMBER
 * @expect runtime
 * @section 3.19.2
 * @design class union 共同字段和方法运行时访问
 * @note 运行时用例：验证共同字段和方法在运行时正确工作
 */
class Cat10 {
  n: number = 1
  foo(): string { return "cat" }
}
class Dog10 {
  n: number = 2
  foo(): string { return "dog" }
}

function main(): void {
  let u: Cat10 | Dog10 = new Cat10()
  if (u.n != 1) throw new Error("u.n should be 1")
  if (u.foo() != "cat") throw new Error("u.foo should be cat")

  u = new Dog10()
  if (u.n != 2) throw new Error("u.n should be 2")
  if (u.foo() != "dog") throw new Error("u.foo should be dog")

  console.log("common member runtime verified")
}