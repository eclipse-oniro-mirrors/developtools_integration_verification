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
 * @id TYP_03_21_05_003_PASS_COVARIANT
 * @expect compile-pass
 * @section 3.21.5
 * @design U <: T ⇒ Readonly<U> <: Readonly<T>
 * @note 正向用例：子类型协变
 */
interface Super3 { name: string }
interface Sub3 extends Super3 { name: string }

function testCovariant(): void {
  let rSub: Readonly<Sub3> = {name: "s"}
  let rSuper: Readonly<Super3> = rSub
}