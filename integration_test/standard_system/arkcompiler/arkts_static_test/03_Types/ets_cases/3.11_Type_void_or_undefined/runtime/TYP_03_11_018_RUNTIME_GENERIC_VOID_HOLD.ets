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
 * @id TYP_03_11_018_RUNTIME_GENERIC_VOID_HOLD
 * @expect runtime
 * @section 3.11
 * @design 泛型 A<void> 持有 undefined
 * @note 运行时用例：void 作为泛型实参
 */
class A18<T> {
  f: T
  constructor(f: T) { this.f = f }
  m(): T { return this.f }
}

function main(): void {
  let a1 = new A18<void>(undefined)
  if (a1.f !== undefined) {
    throw new Error("A<void>.f should be undefined")
  }
  if (a1.m() !== undefined) {
    throw new Error("A<void>.m should be undefined")
  }

  let a2 = new A18<undefined>(undefined)
  if (a2.m() !== undefined) {
    throw new Error("A<undefined>.m should be undefined")
  }

  console.log("generic void hold verified")
}