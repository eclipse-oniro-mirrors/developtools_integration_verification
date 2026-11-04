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
 * @id EXP_07_16_014_RUNTIME_INTERFACE_INSTANCEOF
 * @expect runtime
 * @section 7.16
 * @design 验证接口实现类的 instanceof 运行时行为
 * @note 运行时用例：接口类型引用 instanceof 具体类场景
 */
interface I { foo(): void }
class A implements I {
  foo(): void {}
}
class B {}

function main(): void {
  let a: I = new A()
  if (!(a instanceof A)) {
    throw new Error('assertion failed: I reference to A should be instanceof A')
  }
  if (a instanceof B) {
    throw new Error('assertion failed: A instance should not be instanceof B')
  }
console.log('verified')
}
