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
 * @id GEN_05_01_03_201_RUNTIME_COVARIANT_ASSIGN
 * @expect runtime
 * @section 5.1.3
 * @design 协变赋值的运行时行为验证
 * @note spec: variance allows subtyping between instantiations
 */
class Base211 { b(): int { return 1 } }
class Derived211 extends Base211 { d(): int { return 2 } }
class Covariant211<out T> {
  public readonly v: T; constructor(x: T) { this.v = x }
}
function main(): void {
  let d = new Derived211()
  let h: Covariant211<Base211> = new Covariant211<Derived211>(d)
  let val: Base211 = h.v
  if (val.b() != 1) {
    throw new Error('covariant assign failed')
  }
  if (val instanceof Derived211) {
    let dv: Derived211 = val as Derived211
    if (dv.d() != 2) {
    throw new Error('derived method failed')
  }
  }
  console.log('covariant assign runtime verified')
}