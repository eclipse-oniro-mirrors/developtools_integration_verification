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
 * @id TYP_03_17_02_001_PASS_TUPLE_AS_TUPLE_TYPE
 * @expect compile-pass
 * @section 3.17.2
 * @design 验证元组可赋值给 Tuple 类型（spec/types.md:1225-1238）
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let pair: [number, string] = [1, "abc"]
let a: Tuple = pair

function main(): void {
  console.log("verified")
}