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
 * @id CCY_16_01_021_RUNTIME_job_completion
 * @expect runtime
 * @section 16.1
 * @design job 完成触发 Promise resolve
 * @note 运行时用例：async job 完成后 Promise 被 resolve
 */
async function simpleJob(): Promise<number> {
    return 1;
}

async function main(): Promise<void> {
    let v: number = await simpleJob();
    if (v != 1) {
    throw new Error('unexpected');
  }
  }
    }
console.log('verified');
}
