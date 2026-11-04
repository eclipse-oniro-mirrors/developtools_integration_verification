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
 * @id TYP_03_17_02_008_PASS_TUPLE_CAST
 * @expect compile-pass
 * @section 3.17.2
 * @design 验证 Tuple 可用于 cast expression（spec/types.md:1247-1248）
 * @note 正向用例：Type Tuple 经 Type Erasure 保留，可用于 cast
 */
function main(): void {
  let pair: [number, string] = [1, "abc"]
  let obj: Object = pair as Object
  console.log("verified")
}