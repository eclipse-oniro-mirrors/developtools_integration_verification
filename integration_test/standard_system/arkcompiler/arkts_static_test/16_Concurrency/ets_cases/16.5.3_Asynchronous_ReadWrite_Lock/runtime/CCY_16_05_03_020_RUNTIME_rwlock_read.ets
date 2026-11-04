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
 * @id CCY_16_05_03_020_RUNTIME_rwlock_read
 * @expect runtime
 * @section 16.5.3
 * @design AsyncRWLock 读锁执行
 * @note 运行时用例：验证 AsyncRWLock readLock/lock/unlock 正常执行
 */
async function test(): Promise<void> {
    let rw: concurrency.stackless.AsyncReadWriteLock = new concurrency.stackless.AsyncReadWriteLock();
    let r = rw.readLock();
    await r.lock();
    console.log('reading');
    r.unlock();
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
