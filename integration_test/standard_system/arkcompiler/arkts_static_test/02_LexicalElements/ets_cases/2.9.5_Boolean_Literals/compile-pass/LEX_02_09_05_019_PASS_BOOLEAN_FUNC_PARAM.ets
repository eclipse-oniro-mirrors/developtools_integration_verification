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
 * @id LEX_02_09_05_019_PASS_BOOLEAN_FUNC_PARAM
 * @expect compile-pass
 * @section 2.9.5
 * @design 布尔函数参数
 * @note compile-pass 用例：验证布尔作为函数参数
 */

// 布尔作为函数参数
function testBool(x: boolean): boolean {
  return x
}

function and(a: boolean, b: boolean): boolean {
  return a && b
}

function or(a: boolean, b: boolean): boolean {
  return a || b
}

function not(x: boolean): boolean {
  return !x
}

let result1 = testBool(true)
let result2 = and(true, false)
let result3 = or(true, false)
let result4 = not(true)
