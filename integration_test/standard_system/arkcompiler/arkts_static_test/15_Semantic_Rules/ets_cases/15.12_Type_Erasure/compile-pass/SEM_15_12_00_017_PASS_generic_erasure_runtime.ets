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
/*
 * @id SEM_15_12_00_017_PASS_generic_erasure_runtime
 * @expect compile-pass
 * @section 15.12
 * @design Generic type erasure compiles but may cause runtime ClassCastError
 * @note Spec lines 79-105: cast is performed against raw type A<>, not A<number>
 */

class A<T> {
  public field: T

  constructor(value: T) {
    this.field = value
  }
}

function unsafe(p: Object): A<number> {
  return p as A<number>
}

function sem1512Pass200GenericErasureRuntime(): void {
  let a: A<number> = unsafe(new A<string>('a'))
}
