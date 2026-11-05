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
 * @id TYP_03_04_020_RUNTIME_INTERFACE_NAMED_TYPE
 * @expect runtime
 * @section 3.4
 * @design 接口作为命名类型的多态分发，多个类实现同一接口
 * @note 运行时用例：interface named type 在运行时多态行为
 */
interface Shape20 {
  area(): int
}

class Square20 implements Shape20 {
  side: int
  constructor(s: int) { this.side = s }
  area(): int { return this.side * this.side }
}

class Triangle20 implements Shape20 {
  base: int
  height: int
  constructor(b: int, h: int) {
    this.base = b
    this.height = h
  }
  area(): int { return (this.base * this.height) / 2 }
}

function totalArea(shapes: Shape20[]): int {
  let sum: int = 0
  for (let s of shapes) {
    sum += s.area()
  }
  return sum
}

function main(): void {
  let shapes: Shape20[] = [new Square20(3), new Triangle20(4, 6)]
  let total: int = totalArea(shapes)
  // 9 + 12 = 21
  if (total != 21) {
    throw new Error("totalArea should be 21, got " + total)
  }

  let s: Shape20 = new Square20(5)
  if (s.area() != 25) {
    throw new Error("Square20(5).area should be 25")
  }

  console.log("Interface named type dispatch verified")
}