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
 * @id LEX_02_07_022_PASS_HARD_KW_THIS_SUPER_NEW
 * @expect compile-pass
 * @section 2.7
 * @design 硬关键字: this, super, new, constructor
 * @note 正向用例：对象关键字
 */
class Animal022 {
  protected name: string

  constructor(name: string) {
    this.name = name
  }

  speak(): string {
    return this.name
  }
}

class Dog022 extends Animal022 {
  constructor(name: string) {
    super(name)
  }

  override speak(): string {
    return super.speak() + " (dog)"
  }
}

function test022(): void {
  let d: Dog022 = new Dog022("Rex")
  let s: string = d.speak()
}
