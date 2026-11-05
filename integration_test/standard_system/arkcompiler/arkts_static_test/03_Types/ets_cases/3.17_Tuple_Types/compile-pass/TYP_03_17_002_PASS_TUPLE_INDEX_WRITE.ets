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
 * @id TYP_03_17_002_PASS_TUPLE_INDEX_WRITE
 * @expect compile-pass
 * @section 3.17
 * @design 验证元组元素修改
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let tuple: [number, string] = [1, "hello"]

function main(): void {
  tuple[0] = 42
  if (tuple[0] !== 42) throw new Error("tuple[0] should be 42")
  console.log("verified")
}
