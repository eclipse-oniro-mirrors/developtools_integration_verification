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
 * @id TYP_03_16_007_PASS_OBJECT_ARRAY
 * @expect compile-pass
 * @section 3.16
 * @design 验证对象类型数组
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Point {
  x: number = 0
  y: number = 0
}

let arr: Point[] = [new Point(), new Point()]

function main(): void {
  arr[0].x = 1
  arr[0].y = 2
  if (arr[0].x !== 1) throw new Error("x should be 1")
  if (arr[0].y !== 2) throw new Error("y should be 2")
  console.log("verified")
}
