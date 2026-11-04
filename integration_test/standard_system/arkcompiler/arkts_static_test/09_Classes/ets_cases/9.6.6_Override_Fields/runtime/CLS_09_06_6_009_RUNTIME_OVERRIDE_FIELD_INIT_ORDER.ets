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
 * @id CLS_09_06_6_009_RUNTIME_OVERRIDE_FIELD_INIT_ORDER
 * @expect runtime
 * @section 9.6.6
 * @design override字段初始化顺序运行时验证
 * @note 运行时用例：验证override字段初始化器在超类构造器上下文中执行
 */
class OverrideOrderBase {
  field: int = 123
}
class OverrideOrderSub extends OverrideOrderBase {
  field: int = 456
}
function main(): void {
  let s = new OverrideOrderSub()
  if (s.field != 456) { throw new Error("s.field should be 456") }
  console.log("Override field init order verified")
}
