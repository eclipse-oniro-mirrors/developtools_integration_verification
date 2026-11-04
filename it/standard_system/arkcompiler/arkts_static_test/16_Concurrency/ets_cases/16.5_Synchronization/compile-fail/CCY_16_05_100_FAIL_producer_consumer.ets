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
 * @id CCY_16_05_100_FAIL_producer_consumer
 * @expect compile-fail
 * @section 16.5
 * @design 生产者-消费者模型：一个 async 函数生产（递增计数器），另一个消费，使用 AsyncLock 同步
 * @note 反向用例：验证 AsyncLock 不支持 lock()/unlock() 方法，应编译报错
 */

let sharedCounter: number = 0;
let lock: AsyncLock = new AsyncLock();

async function producer(): Promise<void> {
    await lock.lock();
    try {
        sharedCounter++;
        console.info('Produced, count: ' + sharedCounter);
    } finally {
        lock.unlock();
    }
}

async function consumer(): Promise<void> {
    await lock.lock();
    try {
        if (sharedCounter > 0) {
            sharedCounter--;
            console.info('Consumed, count: ' + sharedCounter);
        }
    } finally {
        lock.unlock();
    }
}

async function runProducerConsumer(): Promise<void> {
    await Promise.all([producer(), producer(), consumer()]);
    console.info('Final count: ' + sharedCounter);
}

runProducerConsumer();
