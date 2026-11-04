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
 * @id CLS_09_07_021_PASS_ABSTRACT_OVERRIDE_INTERFACE
 * @expect compile-pass
 * @section 9.7.3
 * @design 抽象方法覆盖接口默认方法：abstract子类中的abstract方法覆盖接口的默认实现
 * @note 正向用例：abstract方法可以覆盖从接口继承的非abstract方法（含默认实现）
 */
interface Drawable {
  render(): string {
    return "Default render"
  }

  getLayerCount(): int {
    return 1
  }
}

abstract class Shape implements Drawable {
  // Abstract method overrides default implementation from interface
  abstract render(): string

  abstract area(): double
}

class Circle extends Shape {
  radius: double

  constructor(r: double) {
    super()
    this.radius = r
  }

  render(): string {
    return "Circle rendered"
  }

  area(): double {
    return 3.14 * this.radius * this.radius
  }

  getLayerCount(): int {
    return 2
  }
}
