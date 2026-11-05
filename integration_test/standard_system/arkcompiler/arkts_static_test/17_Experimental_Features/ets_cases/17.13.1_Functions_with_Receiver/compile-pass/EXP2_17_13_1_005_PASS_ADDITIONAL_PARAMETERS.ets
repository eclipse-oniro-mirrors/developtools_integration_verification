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
 * @id EXP2_17_13_1_005_PASS_ADDITIONAL_PARAMETERS
 * @expect compile-pass
 * @section 17.13.1
 * @design 接收者函数带有额外参数：this 作为第一个参数后还可有其他参数
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Accumulator { public total: number = 0 }
function addValues(this: Accumulator, a: number, b: number, c: number): number {
  this.total = this.total + a + b + c; return this.total
}
function testAdditionalParams(): void {
  let acc: Accumulator = new Accumulator()
  let r1: number = acc.addValues(1, 2, 3)
  let r2: number = addValues(acc, 4, 5, 6)
  console.log('compiled successfully')
}
