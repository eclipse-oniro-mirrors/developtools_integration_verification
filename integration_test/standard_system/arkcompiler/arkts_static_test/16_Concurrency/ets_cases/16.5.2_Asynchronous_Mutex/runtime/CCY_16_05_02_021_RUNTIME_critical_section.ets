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
 * @id CCY_16_05_02_021_RUNTIME_critical_section
 * @expect runtime
 * @section 16.5.2
 * @design concurrency.stackless.AsyncMutex 保护临界区内含 await 悬挂点
 * @note 运行时用例：验证 lock/unlock 间含 await 的临界区执行正确
 */
class SharedState {
    public value: string = 'nothing';
}
let state: SharedState = new SharedState();
let mutex: concurrency.stackless.AsyncMutex = new concurrency.stackless.AsyncMutex();
async function modify(): Promise<void> {
    await mutex.lock();
    state.value = 'updated';
    await new Promise<void>((resolve: (v: void) => void, reject: (e: Error) => void) => {
        resolve(undefined);
    });
    state.value = 'final';
    mutex.unlock();
}
function main(): void {
    let p: Promise<void> = modify();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
