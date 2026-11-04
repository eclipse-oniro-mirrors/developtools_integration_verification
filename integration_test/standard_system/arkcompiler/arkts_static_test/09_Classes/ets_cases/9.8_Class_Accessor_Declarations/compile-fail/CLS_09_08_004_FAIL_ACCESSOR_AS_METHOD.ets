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
 * @id CLS_09_08_004_FAIL_ACCESSOR_AS_METHOD
 * @expect compile-fail
 * @section 9.8
 * @design getter/setter 被当作方法调用（带括号语法）应编译失败
 * @note 反向用例：p.age() 将 getter 当方法调用；p.age(17) 将 setter 当方法调用
 */
class Person {
  private _age: int = 0
  get age(): int { return this._age }
  set age(a: int) {
    if (a < 0) { return }
    this._age = a
  }
}

function testAccessorAsMethod(): void {
  let p: Person = new Person()
  let x: int = p.age()  // Compile-time error, getter used as method
  p.age(17)             // Compile-time error, setter used as method
}
