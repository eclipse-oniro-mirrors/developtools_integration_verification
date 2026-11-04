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
 * @id CCY_16_06_05_001_PASS_async_error_handling
 * @expect compile-pass
 * @section 16.6.5
 * @design 验证 async 函数内 try/catch 捕获异步异常
 * @note 正向用例：async 函数中使用 try/catch 处理 rejected promise
 */
async function safeAsyncCall(): Promise<void> {
    try {
        let data: string = await riskyOperation();
        console.info('Data: ' + data);
    } catch (e) {
        console.info('Caught async error: ' + (e as Error).message);
    }
}

async function riskyOperation(): Promise<string> {
    throw new Error('Async failure');
}

safeAsyncCall();
