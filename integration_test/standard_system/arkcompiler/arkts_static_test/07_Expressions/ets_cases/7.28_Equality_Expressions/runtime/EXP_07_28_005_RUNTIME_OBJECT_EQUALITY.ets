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
 * @id EXP_07_28_005_RUNTIME_OBJECT_EQUALITY
 * @expect runtime
 * @section 7.28
 * @design 对象引用相等运行时验证

 *  * @note 运行时用例：验证该场景的运行时行为
 */
interface I {}
class A implements I {}
function main(): void {
  let a: A = new A()
  let b: A = a
  let c: A = new A()
  if (a != b) {
    throw new Error('assertion failed: same reference should be ==')
  }
  if (a == c) {
    throw new Error('assertion failed: different objects should not be ==')
  }
console.log('verified')
}
