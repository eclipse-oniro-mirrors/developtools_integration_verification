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
 * @id CLS_09_08_017_PASS_ABSTRACT_ACCESSOR
 * @expect compile-pass
 * @section 9.8
 * @design 抽象类中的抽象 getter/setter 声明
 * @note 正向用例：abstract class 可以声明 abstract getter 和 setter，由具体子类实现
 */
abstract class Shape {
  abstract get name(): string
  abstract set name(n: string)
  abstract get area(): double
}

class Square extends Shape {
  private _name: string = ""
  private _side: double = 0.0
  get name(): string { return this._name }
  set name(n: string) { this._name = n }
  get area(): double { return this._side * this._side }
  set side(s: double) { this._side = s }
}

class Circle extends Shape {
  private _name: string = ""
  private _radius: double = 0.0
  get name(): string { return this._name }
  set name(n: string) { this._name = n }
  get area(): double { return 3.1415926 * this._radius * this._radius }
  set radius(r: double) { this._radius = r }
}

function testAbstractAccessor(): void {
  let sq: Square = new Square()
  sq.name = "SquareA"
  let sqName: string = sq.name
  sq.side = 5.0
  let sqArea: double = sq.area
  let ci: Circle = new Circle()
  ci.name = "CircleB"
  ci.radius = 3.0
  let ciArea: double = ci.area
}
