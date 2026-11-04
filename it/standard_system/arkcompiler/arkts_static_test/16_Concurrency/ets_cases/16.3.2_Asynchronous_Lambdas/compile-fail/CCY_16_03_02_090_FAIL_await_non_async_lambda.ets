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
 * @id CCY_16_03_02_090_FAIL_await_non_async_lambda
 * @expect compile-fail
 * @section 16.3.2
 * @design await 在非 async lambda 中
 * @note 反向用例：验证 await 在非 async lambda 中应编译错误
 */
function main(): void {
    let fn = () => {
        let x = await 42;
    };
}
