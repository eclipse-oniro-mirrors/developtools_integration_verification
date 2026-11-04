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
 * @id TYP_03_02_001_PASS_CLASS_DECLARE
 * @expect compile-pass
 * @section 3.2
 * @design 用户定义类类型的基本声明、new 实例化、成员字段和方法访问
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Point {
  x: int = 0
  y: int = 0
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  distance(): int {
    return this.x * this.x + this.y * this.y
  }
}

function testClassDeclare(): void {
  let p: Point = new Point(3, 4)
  let d: int = p.distance()
  let x: int = p.x
}