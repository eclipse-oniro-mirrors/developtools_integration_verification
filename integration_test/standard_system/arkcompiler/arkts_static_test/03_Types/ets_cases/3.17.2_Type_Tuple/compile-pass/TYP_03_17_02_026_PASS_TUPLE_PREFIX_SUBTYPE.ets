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
 * @id TYP_03_17_02_026_PASS_TUPLE_PREFIX_SUBTYPE
 * @expect compile-pass
 * @section 3.17.2
 * @design 验证元组前缀子类型关系：[string, number, boolean] 可赋值给 [string, number]（spec/semantics.md:450-461）
 * @note 正向用例：tuple 子类型要求 n>=m 且前缀元素类型 identical
 */
function main(): void {
  let d: [string, number, boolean] = ["a", 1, true]
  let b: [string, number] = d
  console.log("verified")
}