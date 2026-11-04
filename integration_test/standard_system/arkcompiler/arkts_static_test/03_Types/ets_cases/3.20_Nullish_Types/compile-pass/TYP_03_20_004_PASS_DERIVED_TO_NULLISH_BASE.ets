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
 * @id TYP_03_20_004_PASS_DERIVED_TO_NULLISH_BASE
 * @expect compile-pass
 * @section 3.20
 * @design 派生类值可赋给 Base|null / Base|undefined
 * @note 正向用例：T 及其派生类型均可放入 nullish T
 */
class Base4 {}
class Derived4 extends Base4 {}

function testDerivedToNullishBase(): void {
  let a: Base4 | null = new Base4()
  a = new Derived4()
  a = null

  let b: Base4 | undefined = new Derived4()
  b = undefined
}