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
 * @id TYP_03_16_02_003_PASS_SYNTAX_EQUIVALENCE
 * @expect compile-pass
 * @section 3.16.2
 * @design 验证 readonly T[] 和 ReadonlyArray<T> 是相同类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let arr1: readonly number[] = [1, 2, 3]
let arr2: ReadonlyArray<number> = arr1

function main(): void {
  if (arr1.length !== arr2.length) throw new Error("length should be equal")
  console.log("verified")
}
