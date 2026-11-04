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
 * @id EXP2_17_13_007_RUNTIME_CLASS_RECEIVER_INVOCATION
 * @expect runtime
 * @section 17.13
 * @design 运行时验证：接收者函数通过方法调用语法和普通调用语法均正确执行
 * @note 运行时用例：实际执行验证接收者函数的运行时行为
 */
class Counter { public count: number = 0 }
function increment(this: Counter): number { this.count = this.count + 1; return this.count }
function decrement(this: Counter): number { this.count = this.count - 1; return this.count }
function main(): void {
  let c: Counter = new Counter()
  let r1: number = c.increment()
  if (r1 != 1) { throw new Error('assertion failed: expected 1, got ' + r1) }
  let r2: number = c.increment()
  if (r2 != 2) { throw new Error('assertion failed: expected 2, got ' + r2) }
  let r3: number = decrement(c)
  if (r3 != 1) { throw new Error('assertion failed: expected 1, got ' + r3) }
  console.log('verified')
}
