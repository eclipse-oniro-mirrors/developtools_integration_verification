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
 * @id EXP2_17_13_5_011_RUNTIME_THIS_ACCESS_CONSISTENCY
 * @expect runtime
 * @section 17.13.5
 * @design 运行时验证：顶层接收者函数的方法调用和普通调用产生相同结果
 * @note 运行时用例：实际执行验证this访问一致性
 */
class Container { public capacity: number = 0; public used: number = 0 }
function remaining(this: Container): number { return this.capacity - this.used }
function main(): void {
  let c: Container = new Container(); c.capacity = 100; c.used = 30
  let r1: number = c.remaining()
  if (r1 != 70) { throw new Error('assertion failed: expected 70, got ' + r1) }
  let r2: number = remaining(c)
  if (r2 != 70) { throw new Error('assertion failed: expected 70, got ' + r2) }
  console.log('verified')
}
