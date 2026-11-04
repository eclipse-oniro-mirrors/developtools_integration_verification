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
 * @id CCY_16_05_04_020_RUNTIME_condvar_notify_wait
 * @expect runtime
 * @section 16.5.4
 * @design concurrency.stackless.AsyncCondVar notifyOne + wait 模式运行
 * @note 运行时用例：验证 concurrency.stackless.AsyncCondVar 通知和等待的基本执行
 */
async function test(): Promise<void> {
    let m: concurrency.stackless.AsyncMutex = new concurrency.stackless.AsyncMutex();
    let cv: concurrency.stackless.AsyncCondVar = new concurrency.stackless.AsyncCondVar();
    let flag: boolean = false;
    await m.lock();
    flag = true;
    cv.notifyOne(m);
    m.unlock();
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
