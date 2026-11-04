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
 * @id TYP_03_11_006_PASS_VOID_GENERIC_CLASS
 * @expect compile-pass
 * @section 3.11
 * @design void 和 undefined 可作为泛型类类型实参
 * @note 正向用例：spec §3.11 A<void>/A<undefined>
 */
class A6<T> {
  f: T
  constructor(f: T) { this.f = f }
  m(): T { return this.f }
}

function testVoidGenericClass(): void {
  let a1 = new A6<void>(undefined)
  let a2 = new A6<undefined>(undefined)

  let v1: void = a1.f
  let v2: undefined = a2.m()
}