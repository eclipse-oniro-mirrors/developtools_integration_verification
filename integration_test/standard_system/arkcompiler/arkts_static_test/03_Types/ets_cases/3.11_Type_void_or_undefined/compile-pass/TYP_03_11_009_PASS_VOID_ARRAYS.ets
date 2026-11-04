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
 * @id TYP_03_11_009_PASS_VOID_ARRAYS
 * @expect compile-pass
 * @section 3.11
 * @design void 可用于数组类型参数，数组字面量 [undefined] 合法
 * @note 正向用例：spec §3.11 A1<void>/A2<void>/void[]
 */
type A1<T> = T[]
type A2<T> = Array<T>

function testVoidArrays(): void {
  const a1: A1<void> = [undefined]
  const a2: A2<void> = [undefined, undefined]
  const a3: void[] = [undefined]

  let u: undefined = a1[0]
  let v: void = a2[0]
}