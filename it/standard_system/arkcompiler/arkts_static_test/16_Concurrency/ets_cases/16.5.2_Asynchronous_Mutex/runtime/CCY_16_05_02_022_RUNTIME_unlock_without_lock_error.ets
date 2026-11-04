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
 * @id CCY_16_05_02_022_RUNTIME_unlock_without_lock_error
 * @expect runtime
 * @section 16.5.2
 * @design 未加锁直接 unlock 运行时抛 IllegalLockStateError
 * @note 运行时用例：验证 unlock 未加锁时抛出运行时异常
 */
function main(): void {
    let mutex: concurrency.stackless.AsyncMutex = new concurrency.stackless.AsyncMutex();
    try {
        mutex.unlock();
        throw new Error('assertion failed: expected IllegalLockStateError');
    } catch (e) {
        console.log('verified');
}
}
