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
 * @id TYP_03_19_028_RUNTIME_UNION_INSTANCEOF
 * @expect runtime
 * @section 3.19
 * @design 联合类型 instanceof 收窄运行时验证
 * @note 运行时用例：验证 instanceof 正确收窄联合类型
 */
class Cat28 { sleep(): void {} meow(): string { return "meow" } }
class Dog28 { sleep(): void {} bark(): string { return "bark" } }
class Frog28 { sleep(): void {} leap(): string { return "leap" } }

type Animal28 = Cat28 | Dog28 | Frog28

function main(): void {
  let animal: Animal28 = new Cat28()
  if (animal instanceof Frog28) {
    throw new Error("Should not be Frog")
  } else if (animal instanceof Cat28) {
    let cat: Cat28 = animal as Cat28
    if (cat.meow() != "meow") {
      throw new Error("cat.meow() should be 'meow'")
    }
  }
  animal.sleep()
  console.log("verified")
}