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
 * @id LEX_02_09_05_006_PASS_BOOLEAN_USAGE
 * @expect compile-pass
 * @section 2.9.5
 * @design 布尔赋值与使用
 * @note compile-pass 用例：验证布尔赋值、参数、返回值
 */

// 布尔变量赋值
let a: boolean = true
let b: boolean = a

// 布尔作为函数参数
function testParam(x: boolean): boolean {
  return x
}

// 布尔作为函数返回值
function testReturn(): boolean {
  return true
}

let c: boolean = testParam(true)
let d: boolean = testReturn()
