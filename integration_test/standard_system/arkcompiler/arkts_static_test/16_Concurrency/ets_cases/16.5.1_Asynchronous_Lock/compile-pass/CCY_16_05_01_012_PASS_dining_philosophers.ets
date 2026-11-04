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
 * @id CCY_16_05_01_012_PASS_dining_philosophers
 * @expect compile-pass
 * @section 16.5.1
 * @design 哲学家就餐模型：两个哲学家使用两个 AsyncLock
 * @note 正向用例：验证 AsyncLock 在哲学家就餐场景编译通过
 */

let chopstickA: AsyncLock = new AsyncLock();
let chopstickB: AsyncLock = new AsyncLock();

async function philosopherOne(): Promise<void> {
    await chopstickA.lockAsync<void>(async () => {
        console.info('PhilosopherOne picked up chopstickA');
        await chopstickB.lockAsync<void>(async () => {
            console.info('PhilosopherOne picked up chopstickB, eating');
        });
    });
}

async function philosopherTwo(): Promise<void> {
    await chopstickA.lockAsync<void>(async () => {
        console.info('PhilosopherTwo picked up chopstickA');
        await chopstickB.lockAsync<void>(async () => {
            console.info('PhilosopherTwo picked up chopstickB, eating');
        });
    });
}

async function runDining(): Promise<void> {
    await Promise.all([philosopherOne(), philosopherTwo()]);
}

function main(): void {
    runDining();
}
