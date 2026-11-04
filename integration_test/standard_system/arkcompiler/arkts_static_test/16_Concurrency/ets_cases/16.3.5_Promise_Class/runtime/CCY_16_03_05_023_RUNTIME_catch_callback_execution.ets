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
 * @id CCY_16_03_05_023_RUNTIME_catch_callback_execution
 * @expect runtime
 * @section 16.3.5
 * @design Promise.catch 回调在 Promise reject 后执行
 * @note 运行时用例：验证 catch 回调在 Promise reject 后执行
 */
function main(): void {
    let p: Promise<number> = new Promise<number>((resolve: (v: number) => void, reject: (e: Error) => void) => {
        reject(new Error('fail'));
    });
    p.catch((e: Error) => {
        console.log('caught:' + e.message);
    });
    console.log('verified');
}
