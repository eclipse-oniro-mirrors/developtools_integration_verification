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
 * @id CLS_09_08_015_PASS_GETTER_ONLY
 * @expect compile-pass
 * @section 9.8
 * @design 只声明 getter 不声明 setter 的只读计算属性
 * @note 正向用例：getter-only accessor 提供只读属性，可通过 field access 语法读取但不可写入
 */
class Rectangle {
  private _width: double = 0.0
  private _height: double = 0.0
  set width(w: double) { this._width = w }
  set height(h: double) { this._height = h }
  get area(): double { return this._width * this._height }
  get perimeter(): double { return 2.0 * (this._width + this._height) }
}

class Circle {
  private _radius: double = 0.0
  set radius(r: double) { this._radius = r }
  get radius(): double { return this._radius }
  get area(): double { return 3.1415926 * this._radius * this._radius }
  get circumference(): double { return 2.0 * 3.1415926 * this._radius }
}

function testGetterOnly(): void {
  let r: Rectangle = new Rectangle()
  r.width = 10.0
  r.height = 5.0
  let ra: double = r.area
  let rp: double = r.perimeter
  let c: Circle = new Circle()
  c.radius = 3.0
  let ca: double = c.area
  let cc: double = c.circumference
}
