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
 * @id LEX_02_04_030_PASS_OBJ_LITERAL_LINE_SEP
 * @expect compile-pass
 * @section 2.4
 * @design 对象字面量内换行
 * @note compile-pass 用例：验证对象字面量中的换行符
 */

// 对象字面量内换行（需要显式类型）
interface Point {
  x: int
  y: int
  z: int
}

let obj1: Point = {
  x: 1,
  y: 2,
  z: 3
}

// 单行对象字面量
let obj2: Point = { x: 1, y: 2, z: 3 }

// 嵌套对象字面量
interface Nested {
  a: Point
  b: Point
}

let obj3: Nested = {
  a: {
    x: 1,
    y: 2,
    z: 3
  },
  b: {
    x: 4,
    y: 5,
    z: 6
  }
}
