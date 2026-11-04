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
 * @id TYP_03_21_01_008_PASS_COVARIANT
 * @expect compile-pass
 * @section 3.21.1
 * @design Awaited<T> 协变：T <: U → Awaited<T> <: Awaited<U>
 * @note 正向用例：spec §3.21.1 子类型协变示例
 */
class SuperType { s: int = 0 }
class SubType extends SuperType { t: int = 1 }

function foo<T extends SuperType>(p: Awaited<T>): void {}
function bar<T extends SubType>(p: Awaited<T>): void {
  foo(p)
}

function testCovariant(): void {
  let sub: SubType = new SubType()
  bar(sub)
}