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
 * @id CCY_16_05_102_FAIL_deadlock_scenario
 * @expect compile-fail
 * @section 16.5
 * @design 两个锁以不同顺序获取，模拟死锁场景（死锁为运行时问题，编译应通过）
 * @note 反向用例：验证 AsyncLock 不支持 lock()/unlock() 方法，应编译报错
 */

let lockA: AsyncLock = new AsyncLock();
let lockB: AsyncLock = new AsyncLock();

async function jobOne(): Promise<void> {
    await lockA.lock();
    console.info('JobOne acquired lockA');
    await lockB.lock();
    console.info('JobOne acquired lockB');
    lockB.unlock();
    lockA.unlock();
}

async function jobTwo(): Promise<void> {
    await lockB.lock();
    console.info('JobTwo acquired lockB');
    await lockA.lock();
    console.info('JobTwo acquired lockA');
    lockA.unlock();
    lockB.unlock();
}

async function runDeadlockScenario(): Promise<void> {
    // 死锁仅在运行时出现，编译应正常通过
    Promise.all([jobOne(), jobTwo()]);
}

runDeadlockScenario();
