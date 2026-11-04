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
 * @id LEX_02_04_037_RT_OBJ_LITERAL_LINE_SEP
 * @expect runtime
 * @section 2.4
 * @design 对象字面量内换行运行时验证
 * @note runtime 用例：验证对象字面量中的换行符不影响程序行为
 */

interface Point {
  x: int
  y: int
  z: int
}

interface Nested {
  a: Point
  b: Point
}

function main(): void {
  // 对象字面量内换行
  let obj1: Point = {
    x: 1,
    y: 2,
    z: 3
  }

  if (obj1.x !== 1) { throw new Error("obj1.x failed, got " + obj1.x) }
  if (obj1.y !== 2) { throw new Error("obj1.y failed, got " + obj1.y) }
  if (obj1.z !== 3) { throw new Error("obj1.z failed, got " + obj1.z) }

  // 嵌套对象字面量
  let obj2: Nested = {
    a: {
      x: 10,
      y: 20,
      z: 30
    },
    b: {
      x: 40,
      y: 50,
      z: 60
    }
  }

  if (obj2.a.x !== 10) { throw new Error("obj2.a.x failed, got " + obj2.a.x) }
  if (obj2.b.y !== 50) { throw new Error("obj2.b.y failed, got " + obj2.b.y) }
}
