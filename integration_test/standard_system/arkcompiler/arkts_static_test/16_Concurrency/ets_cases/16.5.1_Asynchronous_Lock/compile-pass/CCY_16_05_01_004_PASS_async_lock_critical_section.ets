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
 * @id CCY_16_05_01_004_PASS_async_lock_critical_section
 * @expect compile-pass
 * @section 16.5.1
 * @design 临界区保护：lockAsync 内操作共享数据
 * @note 正向用例：验证 lockAsync 内进行共享数据的读写操作编译通过（§16.5.1 例）
 */
class SharedState {
    public value: string = 'nothing';
}
let whatIsInTheBag: SharedState = new SharedState();
let lock: AsyncLock = new AsyncLock();
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
    let p: Promise<void> = lock.lockAsync<void>(async () => {
        checkAndModify(whatIsInTheBag, 'nothing', 'paraglider');
        await delay();
        checkAndModify(whatIsInTheBag, 'paraglider', 'nothing');
    }, AsyncLockMode.EXCLUSIVE);
    await p;
}
