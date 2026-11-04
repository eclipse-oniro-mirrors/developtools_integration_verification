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
 * @id CLS_09_07_016_PASS_INSTANCE_METHOD_INTERFACE_IMPL
 * @expect compile-pass
 * @section 9.7.2
 * @design 实例方法实现接口方法：类通过implements声明实现接口，实例方法提供具体实现
 * @note 正向用例：多个接口方法由实例方法实现，支持不同返回类型和参数
 */
interface Shape016 {
  area(): double
  perimeter(): double
  scale(factor: double): void
}

interface Labeled016 {
  getLabel(): string
  setLabel(label: string): void
}

class Circle016 implements Shape016, Labeled016 {
  private _radius: double
  private _label: string

  constructor(radius: double, label: string) {
    this._radius = radius
    this._label = label
  }

  // Instance method implementing interface method
  area(): double {
    return 3.14159 * this._radius * this._radius
  }

  // Instance method implementing interface method
  perimeter(): double {
    return 2.0 * 3.14159 * this._radius
  }

  // Instance method implementing interface method with parameter
  scale(factor: double): void {
    this._radius = this._radius * factor
  }

  // Instance method implementing Labeled016 interface
  getLabel(): string {
    return this._label
  }

  // Instance method implementing Labeled016 interface
  setLabel(label: string): void {
    this._label = label
  }

  // Additional instance method not from any interface
  diameter(): double {
    return 2.0 * this._radius
  }
}

function testInterfaceImplMethods(): void {
  let c: Circle016 = new Circle016(5.0, "MyCircle")
  let a: double = c.area()
  let p: double = c.perimeter()
  c.scale(2.0)
  let a2: double = c.area()
  let lbl: string = c.getLabel()
  c.setLabel("ScaledCircle")
  let d: double = c.diameter()
}
