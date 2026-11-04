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
 * @id TYP_03_16_02_002_PASS_READONLY_ARRAY_T_SYNTAX
 * @expect compile-pass
 * @section 3.16.2
 * @design 验证 ReadonlyArray<T> 语法声明只读数组
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let arr: ReadonlyArray<number> = [1, 2, 3]

function main(): void {
  if (arr.length !== 3) throw new Error("length should be 3")
  if (arr[0] !== 1) throw new Error("arr[0] should be 1")
  console.log("verified")
}
