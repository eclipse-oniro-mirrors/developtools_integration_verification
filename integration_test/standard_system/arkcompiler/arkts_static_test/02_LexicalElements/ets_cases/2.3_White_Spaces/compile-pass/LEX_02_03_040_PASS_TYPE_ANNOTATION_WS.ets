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
 * @id LEX_02_03_040_PASS_TYPE_ANNOTATION_WS
 * @expect compile-pass
 * @section 2.3
 * @design 类型注解周围空白
 * @note compile-pass 用例：验证类型注解周围的空白
 */

// 类型注解周围空白
let x1: int = 1
let x2 : int = 2
let x3:int = 3
let x4 :int = 4
let x5:  int = 5

// 函数参数类型注解
function add(a: int, b: int): int {
  return a + b
}

function add2(a : int, b : int) : int {
  return a + b
}
