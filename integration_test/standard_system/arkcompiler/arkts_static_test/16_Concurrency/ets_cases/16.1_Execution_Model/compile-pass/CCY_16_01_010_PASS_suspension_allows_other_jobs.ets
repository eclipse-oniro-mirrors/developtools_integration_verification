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
 * @id CCY_16_01_010_PASS_suspension_allows_other_jobs
 * @expect compile-pass
 * @section 16.1
 * @design 悬挂点允许同一 worker thread 上另一个 job 执行
 * @note 正向用例：await 暂停当前 job，使其他 job 获得执行机会
 */
async function microTask(): Promise<string> {
    return 'micro';
}

async function main(): Promise<void> {
    let p: Promise<string> = microTask();
    let result: string = await p;
    console.log(result);
}
