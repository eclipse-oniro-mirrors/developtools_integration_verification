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
 * @id CLS_09_08_001_PASS_BASIC_GETTER_SETTER
 * @expect compile-pass
 * @section 9.8
 * @design 基本的 getter 和 setter 声明，使用 private 字段作为 backing store
 * @note 正向用例：getter 有显式返回类型和无参；setter 有单参数和无返回类型；两者通过 field access 语法访问
 */
class Person {
  private _age: int = 0
  get age(): int { return this._age }
  set age(a: int) {
    if (a < 0) { return }
    this._age = a
  }
}

class Point {
  private _x: double = 0.0
  private _y: double = 0.0
  get x(): double { return this._x }
  set x(v: double) { this._x = v }
  get y(): double { return this._y }
  set y(v: double) { this._y = v }
}

function testBasicAccessor(): void {
  let p: Person = new Person()
  p.age = 25        // setter called
  let a: int = p.age // getter called
  let pt: Point = new Point()
  pt.x = 10.0
  pt.y = 20.0
  let xv: double = pt.x
  let yv: double = pt.y
}
