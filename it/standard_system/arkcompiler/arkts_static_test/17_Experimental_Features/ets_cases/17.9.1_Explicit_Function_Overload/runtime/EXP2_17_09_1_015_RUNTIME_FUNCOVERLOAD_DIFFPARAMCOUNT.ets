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
 * @id EXP2_17_09_1_015_RUNTIME_FUNCOVERLOAD_DIFFPARAMCOUNT
 * @expect runtime
 * @section 17.9.1
 * @design overload 按参数数量区分
 * @note 运行时用例：不同参数数量调用不同函数
 */
let dispatchCount: string = ''

function g0(): string { dispatchCount += '0'; return 'zero' }
function g1(a: string): string { dispatchCount += '1'; return 'one:' + a }
function g2(a: string, b: string): string { dispatchCount += '2'; return 'two:' + a + ',' + b }

overload greeter { g0, g1, g2 }

function main(): void {
  dispatchCount = ''
  let r0: string = greeter()
  if (dispatchCount != '0') { throw new Error("g0 not called, got: " + dispatchCount) }

  dispatchCount = ''
  let r1: string = greeter('hello')
  if (dispatchCount != '1') { throw new Error("g1 not called, got: " + dispatchCount) }

  dispatchCount = ''
  let r2: string = greeter('hello', 'world')
  if (dispatchCount != '2') { throw new Error("g2 not called, got: " + dispatchCount) }

  console.log('Parameter count dispatch verified')
}
