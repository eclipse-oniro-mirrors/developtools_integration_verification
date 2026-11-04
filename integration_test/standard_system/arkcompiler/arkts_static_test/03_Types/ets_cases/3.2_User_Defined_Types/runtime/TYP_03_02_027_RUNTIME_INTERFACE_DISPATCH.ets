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
 * @id TYP_03_02_027_RUNTIME_INTERFACE_DISPATCH
 * @expect runtime
 * @section 3.2
 * @design 接口多态运行时方法分发
 * @note 运行时用例：验证多个类实现同一接口时的多态行为
 */
interface Shape {
  area(): int
}

class Square implements Shape {
  side: int
  constructor(s: int) {
    this.side = s
  }
  area(): int {
    return this.side * this.side
  }
}

class Rectangle implements Shape {
  w: int
  h: int
  constructor(w: int, h: int) {
    this.w = w
    this.h = h
  }
  area(): int {
    return this.w * this.h
  }
}

function totalArea(shapes: Shape[]): int {
  let sum: int = 0
  for (let s of shapes) {
    sum += s.area()
  }
  return sum
}

function main(): void {
  let shapes: Shape[] = [new Square(3), new Rectangle(2, 5)]
  let total: int = totalArea(shapes)
  if (total != 19) {
    throw new Error("total should be 19, got " + total)
  }

  let s: Shape = new Square(4)
  if (s.area() != 16) {
    throw new Error("Square(4).area should be 16")
  }

  console.log("Interface dispatch verified")
}