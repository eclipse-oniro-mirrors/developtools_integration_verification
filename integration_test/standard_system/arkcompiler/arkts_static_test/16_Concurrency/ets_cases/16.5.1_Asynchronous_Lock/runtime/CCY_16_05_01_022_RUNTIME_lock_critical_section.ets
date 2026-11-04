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
 * @id CCY_16_05_01_022_RUNTIME_lock_critical_section
 * @expect runtime
 * @section 16.5.1
 * @design AsyncLock 临界区保护（含 await 悬挂点）
 * @note 运行时用例：验证 lockAsync 临界区内含 await 悬挂点的正确执行
 */
class SharedState {
    public value: string = 'nothing';
}
let state: SharedState = new SharedState();
let lock: AsyncLock = new AsyncLock();
async function test(): Promise<void> {
    await lock.lockAsync<void>(async () => {
        state.value = 'updated';
        await new Promise<void>((resolve: () => void) => resolve());
        state.value = 'final';
    }, AsyncLockMode.EXCLUSIVE);
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
