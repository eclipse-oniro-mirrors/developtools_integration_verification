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
 * @id TYP_03_19_005_PASS_UNION_PREDEFINED
 * @expect compile-pass
 * @section 3.19
 * @design 预定义类型的联合类型
 * @note 正向用例：验证 number | boolean 联合类型和 instanceof 收窄
 */
type Predefined = number | boolean

function main(): void {
  let p: Predefined = 7
  if (p instanceof number) {
    let n: number = p as number
    console.log(n)
  }
  p = true
  console.log("verified")
}