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
 * @id CCY_16_01_005_PASS_worker_thread_independence
 * @expect compile-pass
 * @section 16.1
 * @design worker thread 一次只执行一个 job
 * @note 正向用例：main job 串行 await 两个 async job
 */
async function task1(): Promise<string> {
    return 'task1 done';
}

async function task2(): Promise<string> {
    return 'task2 done';
}

async function main(): Promise<void> {
    let r1: string = await task1();
    let r2: string = await task2();
    console.log(r1);
    console.log(r2);
}
