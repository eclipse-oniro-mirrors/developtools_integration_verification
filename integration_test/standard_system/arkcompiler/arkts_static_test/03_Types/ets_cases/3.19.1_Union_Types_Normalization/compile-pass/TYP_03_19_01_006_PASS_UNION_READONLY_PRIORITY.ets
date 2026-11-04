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
 * @id TYP_03_19_01_006_PASS_UNION_READONLY_PRIORITY
 * @expect compile-pass
 * @section 3.19.1
 * @design readonly 版本优先：(number[]) | (readonly number[]) → readonly number[]
 * @note 正向用例：验证联合类型中 readonly 版本优先
 */
type Mixed = number[] | readonly number[]

function main(): void {
  let arr: number[] = [1, 2, 3]
  let m: Mixed = arr
  console.log("verified")
}