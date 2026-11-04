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
 * @id CLS_09_07_020_RUNTIME_ABSTRACT_DISPATCH
 * @expect runtime
 * @section 9.7.3
 * @design 抽象方法通过基类引用分派到子类实现
 * @note 运行时用例：验证多态分派
 */
abstract class Animal { abstract speak(): string }
class Dog extends Animal { speak(): string { return "woof" } }
class Cat extends Animal { speak(): string { return "meow" } }
function main(): void {
  let a1: Animal = new Dog()
  let a2: Animal = new Cat()
  if (a1.speak() != "woof") { throw new Error("dog should woof") }
  if (a2.speak() != "meow") { throw new Error("cat should meow") }
  console.log("verified")
}
