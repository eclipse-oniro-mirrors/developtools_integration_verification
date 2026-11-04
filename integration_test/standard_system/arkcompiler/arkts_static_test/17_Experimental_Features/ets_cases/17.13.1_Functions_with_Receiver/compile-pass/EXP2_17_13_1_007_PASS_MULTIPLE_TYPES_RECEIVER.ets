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
 * @id EXP2_17_13_1_007_PASS_MULTIPLE_TYPES_RECEIVER
 * @expect compile-pass
 * @section 17.13.1
 * @design 为不同类型定义不同的接收者函数，各自独立工作
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Point2D { public x: number = 0; public y: number = 0 }
class Point3D { public x: number = 0; public y: number = 0; public z: number = 0 }
function magnitude2D(this: Point2D): number { return this.x * this.x + this.y * this.y }
function magnitude3D(this: Point3D): number { return this.x * this.x + this.y * this.y + this.z * this.z }
function testMultipleTypes(): void {
  let p2: Point2D = new Point2D(); p2.x = 3; p2.y = 4
  let m2: number = p2.magnitude2D()
  let p3: Point3D = new Point3D(); p3.x = 1; p3.y = 2; p3.z = 2
  let m3: number = p3.magnitude3D()
  console.log('compiled successfully')
}
