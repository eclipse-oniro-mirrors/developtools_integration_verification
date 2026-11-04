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
 * @id CLS_09_08_011_RUNTIME_OVERRIDE_ACCESSOR
 * @expect runtime
 * @section 9.8
 * @design override accessor runtime验证：getter covariant, setter contravariant
 * @note 运行时用例：验证子类override getter返回更具体类型、setter接受更宽类型
 */
class AccBase {
  get field(): AccBase { return new AccBase() }
  set field(a_field: AccBase) {}
}

class AccDerived extends AccBase {
  override get field(): AccDerived { return new AccDerived() }
  override set field(a_field: AccBase) {}
}

function main(): void {
  let d: AccDerived = new AccDerived()
  let val: AccBase = d.field
  if (val == null) { throw new Error("getter should return non-null") }
  d.field = new AccBase()
  d.field = new AccDerived()
  console.log("verified")
}
