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
 * @id CCY_16_05_02_003_PASS_async_mutex_critical
 * @expect compile-pass
 * @section 16.5.2
 * @design concurrency.stackless.AsyncMutex 保护临界区（§16.5.2 例）
 * @note 正向用例：验证 lock/unlock 间操作共享数据的完整模式编译通过
 */
class SharedState {
    public value: string = 'nothing';
}
let whatIsInTheBag: SharedState = new SharedState();
let mutex: concurrency.stackless.AsyncMutex = new concurrency.stackless.AsyncMutex();
function checkAndModify(data: SharedState, expected: string, updated: string): void {
    if (data.value != expected) {
        console.log('verified');
}
    data.value = updated;
}
async function delay(): Promise<void> {
    return new Promise<void>((res, rej) => {
        setTimeout(res, 1, undefined);
    });
}
async function f(): Promise<void> {
    await mutex.lock();
    checkAndModify(whatIsInTheBag, 'nothing', 'paraglider');
    await delay();
    checkAndModify(whatIsInTheBag, 'paraglider', 'nothing');
    mutex.unlock();
}
async function g(): Promise<void> {
    await mutex.lock();
    checkAndModify(whatIsInTheBag, 'nothing', 'apple');
    await delay();
    checkAndModify(whatIsInTheBag, 'apple', 'nothing');
    mutex.unlock();
}
