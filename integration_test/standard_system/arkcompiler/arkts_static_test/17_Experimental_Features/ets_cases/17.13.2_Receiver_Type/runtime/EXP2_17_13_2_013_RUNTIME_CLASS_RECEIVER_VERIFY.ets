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
 * @id EXP2_17_13_2_013_RUNTIME_CLASS_RECEIVER_VERIFY
 * @expect runtime
 * @section 17.13.2
 * @design 运行时验证：类类型接收者函数正确执行
 * @note 运行时用例：实际执行验证类作为接收者类型
 */
class BankAccount { public balance: number = 0 }
function deposit(this: BankAccount, amount: number): number {
  this.balance = this.balance + amount; return this.balance
}
function withdraw(this: BankAccount, amount: number): number {
  this.balance = this.balance - amount; return this.balance
}
function main(): void {
  let acc: BankAccount = new BankAccount()
  let r1: number = acc.deposit(500)
  if (r1 != 500) { throw new Error('assertion failed: expected 500, got ' + r1) }
  let r2: number = acc.withdraw(200)
  if (r2 != 300) { throw new Error('assertion failed: expected 300, got ' + r2) }
  let r3: number = deposit(acc, 100)
  if (r3 != 400) { throw new Error('assertion failed: expected 400, got ' + r3) }
  console.log('verified')
}
