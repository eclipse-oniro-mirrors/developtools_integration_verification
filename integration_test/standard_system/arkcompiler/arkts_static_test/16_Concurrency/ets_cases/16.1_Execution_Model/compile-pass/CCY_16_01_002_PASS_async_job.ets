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
 * @id CCY_16_01_002_PASS_async_job
 * @expect compile-pass
 * @section 16.1
 * @design async 函数定义一个可并发执行的 job
 * @note 正向用例：async 函数创建 suspendable job，通过 Promise 通信返回值
 */
async function job(): Promise<string> {
    return 'job result';
}

async function main(): Promise<void> {
    let result: string = await job();
    console.log(result);
}
