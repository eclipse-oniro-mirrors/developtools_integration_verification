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
 * @id EXP2_17_13_1_014_RUNTIME_THIS_BINDING_VERIFY
 * @expect runtime
 * @section 17.13.1
 * @design 运行时验证：this 绑定正确——方法调用和普通调用指向同一个接收者对象
 * @note 运行时用例：实际执行验证 this 绑定指向正确的接收者
 */
class Tracker { public id: number = 0 }
function identify(this: Tracker): number { return this.id }
function main(): void {
  let t1: Tracker = new Tracker(); t1.id = 100
  let t2: Tracker = new Tracker(); t2.id = 200
  let r1: number = t1.identify()
  if (r1 != 100) { throw new Error('assertion failed: expected 100, got ' + r1) }
  let r2: number = t2.identify()
  if (r2 != 200) { throw new Error('assertion failed: expected 200, got ' + r2) }
  let r3: number = identify(t1)
  if (r3 != 100) { throw new Error('assertion failed: expected 100, got ' + r3) }
  console.log('verified')
}
