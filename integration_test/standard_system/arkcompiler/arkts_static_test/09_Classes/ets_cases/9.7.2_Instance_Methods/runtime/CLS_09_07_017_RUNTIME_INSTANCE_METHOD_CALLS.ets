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
 * @id CLS_09_07_017_RUNTIME_INSTANCE_METHOD_CALLS
 * @expect runtime
 * @section 9.7.2
 * @design 实例方法通过对象引用调用，验证方法分派、this绑定及字段修改的运行时行为
 * @note 运行时用例：验证实例方法调用后字段状态正确变化，方法返回值正确
 */
class BankAccount017 {
  private _balance: double = 0.0
  private _owner: string = ""

  constructor(owner: string, initialBalance: double) {
    this._owner = owner
    this._balance = initialBalance
  }

  deposit(amount: double): double {
    this._balance = this._balance + amount
    return this._balance
  }

  withdraw(amount: double): double {
    if (amount > this._balance) {
      return this._balance
    }
    this._balance = this._balance - amount
    return this._balance
  }

  getBalance(): double {
    return this._balance
  }

  getOwner(): string {
    return this._owner
  }

  transferTo(target: BankAccount017, amount: double): boolean {
    if (amount <= 0.0) {
      return false
    }
    if (amount > this._balance) {
      return false
    }
    this._balance = this._balance - amount
    target._balance = target._balance + amount
    return true
  }
}

function main(): void {
  let acc1: BankAccount017 = new BankAccount017("Alice", 1000.0)
  let acc2: BankAccount017 = new BankAccount017("Bob", 500.0)

  // Verify initial balances via instance method calls
  if (acc1.getBalance() != 1000.0) {
    throw new Error("acc1 initial balance should be 1000.0")
  }
  if (acc2.getBalance() != 500.0) {
    throw new Error("acc2 initial balance should be 500.0")
  }

  // Verify deposit instance method
  let b1: double = acc1.deposit(200.0)
  if (b1 != 1200.0) {
    throw new Error("After deposit, acc1 balance should be 1200.0")
  }
  if (acc1.getBalance() != 1200.0) {
    throw new Error("getBalance should return updated value after deposit")
  }

  // Verify withdraw instance method
  let b2: double = acc1.withdraw(300.0)
  if (b2 != 900.0) {
    throw new Error("After withdraw, acc1 balance should be 900.0")
  }

  // Verify transfer instance method (calling method on object reference)
  let ok: boolean = acc1.transferTo(acc2, 400.0)
  if (!ok) {
    throw new Error("Transfer should succeed")
  }
  if (acc1.getBalance() != 500.0) {
    throw new Error("acc1 balance after transfer should be 500.0")
  }
  if (acc2.getBalance() != 900.0) {
    throw new Error("acc2 balance after transfer should be 900.0")
  }

  // Verify transfer with insufficient funds fails
  let fail: boolean = acc1.transferTo(acc2, 1000.0)
  if (fail) {
    throw new Error("Transfer with insufficient funds should fail")
  }
  if (acc1.getBalance() != 500.0) {
    throw new Error("acc1 balance should not change after failed transfer")
  }

  // Verify owner
  if (acc1.getOwner() != "Alice") {
    throw new Error("acc1 owner should be Alice")
  }
  if (acc2.getOwner() != "Bob") {
    throw new Error("acc2 owner should be Bob")
  }

  console.log("Instance method calls runtime verified")
}
