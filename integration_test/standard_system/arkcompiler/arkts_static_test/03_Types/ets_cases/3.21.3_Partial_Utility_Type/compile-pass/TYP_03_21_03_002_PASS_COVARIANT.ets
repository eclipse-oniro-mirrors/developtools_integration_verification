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
 * @id TYP_03_21_03_002_PASS_COVARIANT
 * @expect compile-pass
 * @section 3.21.3
 * @design U <: T ⇒ Partial<U> <: Partial<T>
 * @note 正向用例：子类型协变
 */
interface Super2 { name: string }
interface Sub2 extends Super2 { extra: int }

function testCovariant(): void {
  let pSub: Partial<Sub2> = {name: "s", extra: 1}
  let pSuper: Partial<Super2> = pSub
}