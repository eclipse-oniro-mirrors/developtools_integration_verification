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
 * @id EXP_07_16_012_RUNTIME_FALSE_CASE
 * @expect runtime
 * @section 7.16
 * @design 验证 instanceof 在无继承关系类型上返回 false
 * @note 运行时用例：不相关类型 instanceof false 场景
 */
class A {}
class B {}

function main(): void {
  let a = new A()
  if (a instanceof B) {
    throw new Error('assertion failed: a instanceof B should be false')
  }
console.log('verified')
}
