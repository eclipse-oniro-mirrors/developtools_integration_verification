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
 * @id CCY_16_05_03_001_PASS_rwlock_decl
 * @expect compile-pass
 * @section 16.5.3
 * @design AsyncRWLock 声明
 * @note 正向用例：验证 AsyncRWLock 创建和读写锁声明编译通过。
 *       用 readLock()/writeLock() guard + lock()/unlock() 匹配 stdlib API。
 */
let rwlock: concurrency.stackless.AsyncReadWriteLock = new concurrency.stackless.AsyncReadWriteLock();
async function reader(): Promise<void> {
    let r = rwlock.readLock();
    await r.lock();
    console.log('reading');
    r.unlock();
}
async function writer(): Promise<void> {
    let w = rwlock.writeLock();
    await w.lock();
    console.log('writing');
    w.unlock();
}
