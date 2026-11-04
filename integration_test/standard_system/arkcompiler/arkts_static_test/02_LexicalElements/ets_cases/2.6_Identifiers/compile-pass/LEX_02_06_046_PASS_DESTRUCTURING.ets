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
 * @id LEX_02_06_046_PASS_DESTRUCTURING
 * @expect compile-pass
 * @section 2.6
 * @design 解构中的标识符
 * @note compile-pass 用例：验证解构赋值中的标识符
 */

// 数组解构
let arr = [1, 2, 3]
let a = arr[0]
let b = arr[1]
let c = arr[2]

// 对象访问
interface Point {
  x: int
  y: int
}

let point: Point = { x: 10, y: 20 }
let x = point.x
let y = point.y
