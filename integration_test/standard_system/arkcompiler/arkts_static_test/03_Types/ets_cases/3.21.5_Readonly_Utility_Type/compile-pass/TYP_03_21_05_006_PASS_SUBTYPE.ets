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
 * @id TYP_03_21_05_006_PASS_SUBTYPE
 * @expect compile-pass
 * @section 3.21.5
 * @design T <: Readonly<T>
 * @note 正向用例：子类型关系
 */
interface I6 {
  x: int
  y: int
}
type R6 = Readonly<I6>

function testSubtype(): void {
  let r1: R6 = {x: 1, y: 2}
  let r2: I6 = {x: 3, y: 4}
  let r3: R6 = r2
}