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
 * @id CCY_16_05_01_027_RUNTIME_bank_transfer
 * @expect runtime
 * @section 16.5.1
 * @design 银行转账运行时
 * @note 运行时用例：验证 AsyncLock 保护双账户转账
 */
let balanceA: number = 200;
let lockA: AsyncLock = new AsyncLock();
let balanceB: number = 50;
let lockB: AsyncLock = new AsyncLock();
async function transfer(amount: number): Promise<void> {
    await lockA.lockAsync<void>(async () => {
        await lockB.lockAsync<void>(async () => {
            if (balanceA >= amount) {
                balanceA -= amount;
                balanceB += amount;
            }
        });
    });
}
async function test(): Promise<void> {
    await transfer(80);
}
function main(): void {
    let p: Promise<void> = test();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
