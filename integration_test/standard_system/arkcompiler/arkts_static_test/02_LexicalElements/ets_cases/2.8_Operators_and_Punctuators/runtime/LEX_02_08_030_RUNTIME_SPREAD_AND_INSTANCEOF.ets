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
 * @id LEX_02_08_030_RUNTIME_SPREAD_AND_INSTANCEOF
 * @expect runtime
 * @section 2.8
 * @design 展开运算符 ... 与 instanceof / typeof 运算符运行时语义
 * @note 运行时用例：实际执行验证语义正确性
 */
class Animal {}
class Dog extends Animal {}

function sumAll(...nums: number[]): number {
  let total: number = 0
  for (const n of nums) {
    total += n
  }
  return total
}

function main(): void {
  let a: number[] = [1, 2, 3]
  let b: number[] = [...a, 4, 5]
  if (b.length !== 5) { throw new Error("spread in array literal failed") }
  if (b[0] !== 1 || b[4] !== 5) { throw new Error("spread element order wrong") }

  let s: number = sumAll(...a)
  if (s !== 6) { throw new Error("spread to varargs failed") }

  let pet: Animal = new Dog()
  if (!(pet instanceof Dog)) { throw new Error("instanceof Dog failed") }
  if (!(pet instanceof Animal)) { throw new Error("instanceof Animal failed") }

  let n: number = 42
  let t: string = typeof n
  if (t.length === 0) { throw new Error("typeof returned empty string") }
}
