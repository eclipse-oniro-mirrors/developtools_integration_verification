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
 * @id TYP_03_19_01_008_PASS_RECURSIVE_ALIAS_KEPT
 * @expect compile-pass
 * @section 3.19.1
 * @design 递归 type alias 在 union 归一化中保留，不展开
 * @note 正向用例：type A = A[] | string 不发生无限展开
 */
type Rec8 = Rec8[] | string

function testRecursiveAliasKept(): void {
  let r1: Rec8 = "leaf"
  let r2: Rec8 = ["a", "b"]
  let r3: Rec8 = [["nested"]]
}