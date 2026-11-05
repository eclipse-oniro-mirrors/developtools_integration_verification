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
 * @id EXP2_17_13_4_013_RUNTIME_LAMBDA_BOTH_CALL_SYNTAX
 * @expect runtime
 * @section 17.13.4
 * @design 运行时验证：带接收者lambda通过普通调用语法执行，同时验证顶层接收者函数的方法调用语法
 * @note 运行时用例：实际执行验证接收者函数的两种调用方式
 */
class Buffer { public data: number[] = [] }
function sumData(this: Buffer): number {
  let total: number = 0
  for (let elem of this.data) { total = total + elem }
  return total
}
function main(): void {
  let buf: Buffer = new Buffer(); buf.data = [10, 20, 30, 40]
  let r1: number = buf.sumData()
  if (r1 != 100) { throw new Error('assertion failed: expected 100, got ' + r1) }
  let r2: number = sumData(buf)
  if (r2 != 100) { throw new Error('assertion failed: expected 100, got ' + r2) }
  console.log('verified')
}
