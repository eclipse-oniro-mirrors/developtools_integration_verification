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
 * @id CLS_09_09_002_PASS_SECONDARY_CONSTRUCTOR
 * @expect compile-pass
 * @section 9.9.1
 * @design 辅助构造器通过this()调用主构造器
 * @note 正向用例：验证secondary constructor调用same-class primary constructor
 */
class Point2 {
  x: int = 0
  y: int = 0
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  constructor() {
    this(0, 0)
  }
}
function test(): void {
  let p1: Point2 = new Point2(10, 20)
  let p2: Point2 = new Point2()
}
