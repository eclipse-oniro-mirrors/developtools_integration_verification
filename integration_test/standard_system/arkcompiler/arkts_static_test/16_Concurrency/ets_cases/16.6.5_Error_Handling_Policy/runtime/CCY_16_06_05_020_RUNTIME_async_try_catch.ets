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
 * @id CCY_16_06_05_020_RUNTIME_async_try_catch
 * @expect runtime
 * @section 16.6.5
 * @design async 函数内 try/catch 捕获异常
 * @note 运行时用例：验证 async 函数中 try/catch 处理 rejected promise
 */
async function risky(): Promise<string> {
    throw new Error('fail');
}
async function safeCall(): Promise<void> {
    try {
        let data: string = await risky();
    } catch (e) {
        console.log('verified');
}
}
function main(): void {
    let p: Promise<void> = safeCall();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
