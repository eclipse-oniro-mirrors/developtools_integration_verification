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
 * @id TYP_03_17_01_001_PASS_READONLY_TUPLE_BASIC
 * @expect compile-pass
 * @section 3.17.1
 * @design 验证基本只读元组声明和访问
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let tuple: readonly [number, string] = [1, "abc"]

function main(): void {
  if (tuple[0] !== 1) throw new Error("tuple[0] should be 1")
  if (tuple[1] !== "abc") throw new Error("tuple[1] should be abc")
  console.log("verified")
}
