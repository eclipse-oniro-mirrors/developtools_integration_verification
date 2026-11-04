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
 * @id EXP2_17_11_3_011_RUNTIME_NAMED_CTOR_CREATE
 * @expect runtime
 * @section 17.11.3
 * @design 命名构造函数创建正确对象：验证通过 overload 解析调用命名构造函数创建的对象具有正确的状态
 * @note 运行时用例：验证命名构造函数正确初始化对象字段
 */
class Point {
  public x: int
  public y: int

  constructor FromXY(xVal: int, yVal: int) {
    this.x = xVal
    this.y = yVal
  }
  constructor Origin() {
    this.x = 0
    this.y = 0
  }
  overload constructor { FromXY, Origin }
}

function main(): void {
  let p1: Point = new Point(5, 10)
  if (p1.x != 5) {
    throw new Error('assertion failed: p1.x should be 5')
  }
  if (p1.y != 10) {
    throw new Error('assertion failed: p1.y should be 10')
  }

  let p2: Point = new Point()
  if (p2.x != 0) {
    throw new Error('assertion failed: p2.x should be 0')
  }
  if (p2.y != 0) {
    throw new Error('assertion failed: p2.y should be 0')
  }

  console.log('verified')
}
