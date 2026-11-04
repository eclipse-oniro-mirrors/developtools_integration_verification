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
 * @id CLS_09_08_003_PASS_OVERRIDE_ACCESSOR_COVARIANT
 * @expect compile-pass
 * @section 9.8
 * @design override getter 返回类型协变（更具体），setter 参数类型逆变（更泛化）
 * @note 正向用例：getter covariant (Derived <: Base), setter contravariant (Base >: Derived)
 */
class Base {
  get field(): Base { return new Base() }
  set field(a_field: Derived) {}
}

class Derived extends Base {
  override get field(): Derived { return new Derived() }
  override set field(a_field: Base) {}
}

function testOverrideCovariant(): void {
  let b: Base = new Derived()
  b.field = new Derived() // setter is called
  let r: Base = b.field    // getter is called
}
