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
 * @id CCY_16_05_01_003_PASS_async_lock_shared
 * @expect compile-pass
 * @section 16.5.1
 * @design AsyncLock SHARED 模式
 * @note 正向用例：验证 AsyncLockMode.SHARED 作为 lockAsync 第二个参数编译通过
 */
let lock: AsyncLock = new AsyncLock();
async function f(): Promise<void> {
    let p: Promise<void> = lock.lockAsync<void>(async () => {
        console.log('verified');
}, AsyncLockMode.SHARED);
    await p;
}
