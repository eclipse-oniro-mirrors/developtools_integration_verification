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
 * @id CCY_16_06_03_002_PASS_promise_catch
 * @expect compile-pass
 * @section 16.6.3
 * @design 验证 Promise.catch() 回调处理拒绝
 * @note 正向用例：Promise reject 后执行 catch 回调
 */
let promise: Promise<string> = new Promise((resolve: Function, reject: Function) => {
    reject(new Error('Rejected intentionally'));
});

promise.catch((err: Error) => {
    console.info('Caught: ' + err.message);
});
