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
 * @id TYP_03_12_005_PASS_NULL_TRIPLE_UNION
 * @expect compile-pass
 * @section 3.12
 * @design T | null | undefined 三重联合类型声明与赋值
 * @note 正向用例：验证 null | undefined 同时出现在联合类型中
 */
function testNullTripleUnion(): void {
  let x: int | null | undefined = null
  x = 1
  x = undefined
  x = null

  let s: string | null | undefined = null
  s = "abc"
  s = undefined
}