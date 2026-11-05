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
 * @id CLS_09_07_008_FAIL_OVERRIDE_NOTHING_STATIC
 * @expect compile-fail
 * @section 9.7.5
 * @design 重写违规：override未重写任何超类方法；override与static组合
 * @note 反向用例：override修饰符约束违规
 */
class Base008 {
  foo(): void {}
}

class BadOverride008 extends Base008 {
  // Error: override overrides no method from superclass
  override bar(): void {}

  // Error: override cannot combine with static
  static override foo(): void {}
}
