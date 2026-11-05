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
 * @id CCY_16_05_01_021_RUNTIME_lock_shared
 * @expect runtime
 * @section 16.5.1
 * @design AsyncLock SHARED 模式运行时
 * @note 运行时用例：验证 AsyncLock SHARED 模式 lockAsync 正常执行
 */
async function test(): Promise<void> {
    let lock: AsyncLock = new AsyncLock();
    await lock.lockAsync<void>(async () => {
        console.log('verified');
}, AsyncLockMode.SHARED);
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
