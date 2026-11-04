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
 * @id LEX_02_09_08_011_PASS_UNDEFINED_OPTIONAL_PARAM
 * @expect compile-pass
 * @section 2.9.8
 * @design undefined 在可选参数中
 * @note compile-pass 用例：验证 undefined 在可选参数中的使用
 */

// undefined 在可选参数中
function test1(x?: int): int {
  return x === undefined ? 0 : x
}

function test2(x?: string): string {
  return x === undefined ? "" : x
}

let r1 = test1()
let r2 = test2()
