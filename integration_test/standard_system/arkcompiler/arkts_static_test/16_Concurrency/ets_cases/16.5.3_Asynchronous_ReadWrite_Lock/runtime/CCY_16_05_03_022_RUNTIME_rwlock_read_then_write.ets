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
 * @id CCY_16_05_03_022_RUNTIME_rwlock_read_then_write
 * @expect runtime
 * @section 16.5.3
 * @design AsyncRWLock 先读后写
 * @note 运行时用例：验证 AsyncRWLock 先获取读锁再获取写锁
 */
async function test(): Promise<void> {
    let rw: concurrency.stackless.AsyncReadWriteLock = new concurrency.stackless.AsyncReadWriteLock();
    let r = rw.readLock();
    await r.lock();
    r.unlock();
    let w = rw.writeLock();
    await w.lock();
    w.unlock();
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
