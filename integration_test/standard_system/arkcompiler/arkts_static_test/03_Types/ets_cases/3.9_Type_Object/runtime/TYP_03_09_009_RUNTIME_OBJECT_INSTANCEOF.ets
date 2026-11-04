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
 * @id TYP_03_09_009_RUNTIME_OBJECT_INSTANCEOF
 * @expect runtime
 * @section 3.9
 * @design Object 上的 instanceof 检查
 * @note 运行时用例
 */
class Animal9 {}
class Dog9 extends Animal9 {}

function main(): void {
  let d: Object = new Dog9()
  if (!(d instanceof Animal9)) {
    throw new Error("Dog should be instance of Animal")
  }
  if (!(d instanceof Dog9)) {
    throw new Error("d should be Dog9")
  }
  if (!(d instanceof Object)) {
    throw new Error("d should be Object")
  }

  let s: Object = "hello"
  if (!(s instanceof string)) {
    throw new Error("string instanceof failed")
  }

  console.log("Object instanceof verified")
}