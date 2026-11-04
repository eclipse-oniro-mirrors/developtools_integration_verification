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
 * @id EXP2_17_13_001_PASS_BASIC_CLASS_RECEIVER
 * @expect compile-pass
 * @section 17.13
 * @design 基本类接收者函数：为类类型定义顶层接收者函数，通过方法调用语法和普通函数调用语法使用
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Point {
  public x: number = 0
  public y: number = 0
}

function distanceFromOrigin(this: Point): number {
  return this.x * this.x + this.y * this.y
}

function testReceiverFunction(): void {
  let p: Point = new Point()
  p.x = 3; p.y = 4
  let d1: number = p.distanceFromOrigin()
  let d2: number = distanceFromOrigin(p)
  console.log('compiled successfully')
}
