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
 * @id CLS_09_07_017_PASS_OVERRIDE_INTERFACE_DEFAULT
 * @expect compile-pass
 * @section 9.7.5
 * @design 方法重写：通过override重写来自接口默认实现的方法
 * @note 正向用例：类实现接口提供默认实现，子类使用override重写该方法
 */
interface Drawable017 {
  draw(): string
  getShapeName(): string
}

class Shape017 implements Drawable017 {
  draw(): string {
    return "Drawing a shape"
  }

  getShapeName(): string {
    return "Shape"
  }
}

class Circle017 extends Shape017 {
  // Override method that was originally declared in the interface
  // and implemented in the base class
  override draw(): string {
    return "Drawing a circle"
  }

  override getShapeName(): string {
    return "Circle"
  }
}

class Rectangle017 extends Shape017 {
  // Override without the 'override' keyword is also valid
  // but override makes the intent explicit
  draw(): string {
    return "Drawing a rectangle"
  }

  getShapeName(): string {
    return "Rectangle"
  }
}

function testInterfaceDefaultOverride(): void {
  let s: Shape017 = new Shape017()
  let c: Circle017 = new Circle017()
  let r: Rectangle017 = new Rectangle017()

  console.log(s.draw())
  console.log(c.draw())
  console.log(r.draw())
}
