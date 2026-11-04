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
 * @id CCY_16_02_001_PASS_ASYNC_AWAIT
 * @expect compile-pass
 * @section 16.2
 * @design 异步执行原语：async/await/Promise 基本用法
 * @note 正向用例：验证 async 函数、await 表达式、Promise 类型通过编译
 */
async function fetchValue(): Promise<number> {
    return 42;
}
async function main(): Promise<void> {
    let v: number = await fetchValue();
    console.log('' + v);
}
