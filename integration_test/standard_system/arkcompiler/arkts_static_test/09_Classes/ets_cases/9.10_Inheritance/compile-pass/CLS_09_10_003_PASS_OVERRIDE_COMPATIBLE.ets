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
 * @id CLS_09_10_003_PASS_OVERRIDE_COMPATIBLE
 * @expect compile-pass
 * @section 9.10
 * @design 重写方法签名满足override-compatible：参数逆变、返回类型协变
 * @note 正向用例：override-compatible签名，派生类参数类型是基类参数类型的超类型，返回类型是子类型
 */
class Shape {
  public area(): int {
    return 0
  }
}

class Circle extends Shape {
  public radius: int = 0

  public area(): int {
    return 314 * this.radius * this.radius / 100
  }
}

class Processor {
  public process(s: Shape): Shape {
    return s
  }
}

class CircleProcessor extends Processor {
  public process(s: Shape): Circle {
    let c: Circle = new Circle()
    return c
  }
}

class Validator {
  public validate(s: Shape): Shape {
    return s
  }
}

class CircleValidator extends Validator {
  public validate(s: Shape): Circle {
    let c: Circle = new Circle()
    c.radius = 10
    return c
  }
}

function testOverrideCompatible(): void {
  let cp: CircleProcessor = new CircleProcessor()
  let cv: CircleValidator = new CircleValidator()
  let shape: Shape = new Shape()
  let result1: Circle = cp.process(shape)
  let result2: Circle = cv.validate(shape)
}
