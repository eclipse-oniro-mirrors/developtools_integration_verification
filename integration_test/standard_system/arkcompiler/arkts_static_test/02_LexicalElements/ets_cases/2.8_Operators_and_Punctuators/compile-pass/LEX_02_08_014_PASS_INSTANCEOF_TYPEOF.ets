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
 * @id LEX_02_08_014_PASS_INSTANCEOF_TYPEOF
 * @expect compile-pass
 * @section 2.8
 * @design instanceof 与 typeof 作为运算符的词法识别
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Animal {}
class Dog extends Animal {}
function testInstanceofTypeof(): void {
  let pet: Animal = new Dog()
  let r1: boolean = pet instanceof Dog
  let r2: boolean = pet instanceof Animal
  let n: number = 42
  let s: string = "hello"
  let t1: string = typeof n
  let t2: string = typeof s
}
