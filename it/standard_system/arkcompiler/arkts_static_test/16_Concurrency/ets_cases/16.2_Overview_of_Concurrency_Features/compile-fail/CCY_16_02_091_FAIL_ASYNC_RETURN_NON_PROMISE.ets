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
 * @id CCY_16_02_091_FAIL_ASYNC_RETURN_NON_PROMISE
 * @expect compile-fail
 * @section 16.2
 * @design async 函数必须返回 Promise<T>
 * @note 反向用例：验证 async 函数返回非 Promise 类型编译报错
 */
async function foo(): string {
    return 'hello';
}
