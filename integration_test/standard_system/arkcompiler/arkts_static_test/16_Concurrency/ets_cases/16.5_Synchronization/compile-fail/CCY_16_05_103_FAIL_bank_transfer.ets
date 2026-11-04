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
 * @id CCY_16_05_103_FAIL_bank_transfer
 * @expect compile-fail
 * @section 16.5
 * @design 两个账户间转账，需要同时获取两个账户的锁
 * @note 反向用例：验证 AsyncLock 不支持 lock()/unlock() 方法，应编译报错
 */

let accountA: { balance: number; lock: AsyncLock } = { balance: 200, lock: new AsyncLock() };
let accountB: { balance: number; lock: AsyncLock } = { balance: 50, lock: new AsyncLock() };

async function transfer(
    from: { balance: number; lock: AsyncLock },
    to: { balance: number; lock: AsyncLock },
    amount: number
): Promise<void> {
    await from.lock.lock();
    await to.lock.lock();
    try {
        if (from.balance >= amount) {
    from.balance -= amount;
            to.balance += amount;
            console.info('Transferred ' + amount);
  } else {
    console.info('Insufficient balance');
        }
    } finally {
        to.lock.unlock();
        from.lock.unlock();
    }
}

async function runTransfer(): Promise<void> {
    await transfer(accountA, accountB, 80);
    console.info('A: ' + accountA.balance + ', B: ' + accountB.balance);
}

runTransfer();
