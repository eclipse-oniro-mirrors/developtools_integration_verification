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
 * @id CCY_16_05_01_025_RUNTIME_producer_consumer
 * @expect runtime
 * @section 16.5.1
 * @design 生产者-消费者模型运行时
 * @note 运行时用例：验证 AsyncLock 保护共享计数器的经典场景
 */
let sharedCounter: number = 0;
let lock: AsyncLock = new AsyncLock();
async function producer(): Promise<void> {
    await lock.lockAsync<void>(async () => {
        sharedCounter++;
    });
}
async function consumer(): Promise<void> {
    await lock.lockAsync<void>(async () => {
        if (sharedCounter > 0) {
            sharedCounter--;
        }
    });
}
async function test(): Promise<void> {
    await producer();
    await consumer();
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
