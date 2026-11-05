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
 * @id EXP_07_16_011_RUNTIME_TRUE_CASE
 * @expect runtime
 * @section 7.16
 * @design 验证 instanceof 在运行时对子类实例返回 true
 * @note 运行时用例：基本 instanceof true 场景
 */
class A {}
class B extends A {}

function main(): void {
  let a: A = new B()
  if (!(a instanceof B)) {
    throw new Error('assertion failed: a instanceof B should be true')
  }
  if (!(a instanceof A)) {
    throw new Error('assertion failed: a instanceof A should be true')
  }
console.log('verified')
}
