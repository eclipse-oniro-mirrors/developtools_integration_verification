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
 * @id CCY_16_06_03_001_PASS_promise_then
 * @expect compile-pass
 * @section 16.6.3
 * @design 验证 Promise.then() 回调注册与链式调用
 * @note 正向用例：Promise resolve 后执行 then 回调
 */
let promise: Promise<string> = new Promise((resolve: Function) => {
    resolve('Hello Promise');
});

promise.then((value: string) => {
    console.info('Resolved: ' + value);
});
