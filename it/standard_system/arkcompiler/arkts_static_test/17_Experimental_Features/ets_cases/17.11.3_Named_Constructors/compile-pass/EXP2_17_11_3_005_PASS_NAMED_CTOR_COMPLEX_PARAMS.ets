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
 * @id EXP2_17_11_3_005_PASS_NAMED_CTOR_COMPLEX_PARAMS
 * @expect compile-pass
 * @section 17.11.3
 * @design 命名构造函数接受多个参数：验证命名构造函数可以接受多个不同类型参数
 * @note 正向用例：验证命名构造函数支持复杂参数列表
 */
class Rectangle {
  public w: int
  public h: int

  constructor FromPoints(x1: int, y1: int, x2: int, y2: int) {
    this.w = x2 - x1
    this.h = y2 - y1
  }
  constructor FromSize(width: int, height: int) {
    this.w = width
    this.h = height
  }
  overload constructor { FromPoints, FromSize }
}

function testComplexParams(): void {
  let r1: Rectangle = new Rectangle(0, 0, 10, 5)
  let r2: Rectangle = new Rectangle(8, 4)
  console.log(r1.w)
  console.log(r1.h)
  console.log(r2.w)
  console.log(r2.h)
}
