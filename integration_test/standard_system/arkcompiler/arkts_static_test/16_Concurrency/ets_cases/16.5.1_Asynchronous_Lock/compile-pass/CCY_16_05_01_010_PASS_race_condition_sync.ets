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
 * @id CCY_16_05_01_010_PASS_race_condition_sync
 * @expect compile-pass
 * @section 16.5.1
 * @design 共享计数器同步访问避免竞态条件
 * @note 正向用例：验证 AsyncLock 同步共享计数器编译通过
 */

let safeCounter: number = 0;
let lock: AsyncLock = new AsyncLock();

async function safeIncrement(): Promise<void> {
    await lock.lockAsync<void>(async () => {
        let tmp: number = safeCounter;
        safeCounter = tmp + 1;
        console.info('Counter: ' + safeCounter);
    });
}

async function runSafeIncrements(): Promise<void> {
    await Promise.all([
        safeIncrement(),
        safeIncrement(),
        safeIncrement()
    ]);
    console.info('Final counter: ' + safeCounter);
}

function main(): void {
    runSafeIncrements();
}
