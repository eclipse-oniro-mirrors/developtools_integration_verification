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
 * @id TYP_03_19_02_011_RUNTIME_INTERFACE_COMMON_METHOD
 * @expect runtime
 * @section 3.19.2
 * @design interface union 共同方法运行时分发
 * @note 运行时用例：接口联合类型共同方法
 */
interface I11A { area(): int }
interface I11B { area(): int }
class Square11 implements I11A { area(): int { return 16 } }
class Circle11 implements I11B { area(): int { return 9 } }

function getArea(x: I11A | I11B): int {
  return x.area()
}

function main(): void {
  let a: int = getArea(new Square11())
  if (a != 16) throw new Error("Square area failed")
  let b: int = getArea(new Circle11())
  if (b != 9) throw new Error("Circle area failed")
  console.log("interface common method verified")
}