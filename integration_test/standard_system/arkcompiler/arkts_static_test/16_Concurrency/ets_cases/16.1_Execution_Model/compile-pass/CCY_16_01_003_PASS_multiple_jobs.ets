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
 * @id CCY_16_01_003_PASS_multiple_jobs
 * @expect compile-pass
 * @section 16.1
 * @design 多个 job 的创建和返回值获取
 * @note 正向用例：验证多个并发 job 的定义和 Promise 返回值通信
 */
async function jobA(): Promise<string> {
    return 'A';
}

async function jobB(): Promise<string> {
    return 'B';
}

async function main(): Promise<void> {
    let resultA: Promise<string> = jobA();
    let resultB: Promise<string> = jobB();
    let a: string = await resultA;
    let b: string = await resultB;
    console.log(a + b);
}
