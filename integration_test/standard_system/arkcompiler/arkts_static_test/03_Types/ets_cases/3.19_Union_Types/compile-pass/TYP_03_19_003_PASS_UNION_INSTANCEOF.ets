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
 * @id TYP_03_19_003_PASS_UNION_INSTANCEOF
 * @expect compile-pass
 * @section 3.19
 * @design 联合类型通过 instanceof 收窄
 * @note 正向用例：验证 instanceof 收窄联合类型
 */
class Cat { sleep(): void {} meow(): void {} }
class Dog { sleep(): void {} bark(): void {} }
class Frog { sleep(): void {} leap(): void {} }

type Animal = Cat | Dog | Frog

function main(): void {
  let animal: Animal = new Cat()
  if (animal instanceof Frog) {
    let frog: Frog = animal as Frog
    frog.leap()
  }
  animal.sleep()
  console.log("verified")
}