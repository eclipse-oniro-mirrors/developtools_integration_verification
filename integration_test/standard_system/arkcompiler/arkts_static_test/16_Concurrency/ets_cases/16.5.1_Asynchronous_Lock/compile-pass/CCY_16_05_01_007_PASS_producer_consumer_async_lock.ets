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
 * @id CCY_16_05_01_007_PASS_producer_consumer_async_lock
 * @expect compile-pass
 * @section 16.5.1
 * @design 生产者-消费者模型：使用 AsyncLock.lockAsync 同步共享计数器
 * @note 正向用例：验证 AsyncLock 在经典生产者消费者场景中编译通过
 */

let sharedCounter: number = 0;
let lock: AsyncLock = new AsyncLock();

async function producer(): Promise<void> {
    await lock.lockAsync<void>(async () => {
        sharedCounter++;
        console.info('Produced, count: ' + sharedCounter);
    });
}

async function consumer(): Promise<void> {
    await lock.lockAsync<void>(async () => {
        if (sharedCounter > 0) {
            sharedCounter--;
            console.info('Consumed, count: ' + sharedCounter);
        }
    });
}

async function runProducerConsumer(): Promise<void> {
    await Promise.all([producer(), producer(), consumer()]);
    console.info('Final count: ' + sharedCounter);
}

function main(): void {
    runProducerConsumer();
}
