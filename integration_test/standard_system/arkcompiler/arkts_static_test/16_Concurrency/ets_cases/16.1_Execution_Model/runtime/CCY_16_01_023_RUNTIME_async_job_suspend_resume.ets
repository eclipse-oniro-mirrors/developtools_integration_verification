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
 * @id CCY_16_01_023_RUNTIME_async_job_suspend_resume
 * @expect runtime
 * @section 16.1
 * @design async job 在悬挂点暂停后恢复执行
 * @note 运行时用例：await 导致暂停，之后恢复并继续执行后续代码
 */
async function asyncJob(): Promise<number> {
    let x: number = 1;
    return new Promise<number>((resolve) => {
        resolve(x + 1);
    });
}

async function main(): Promise<void> {
    let v: number = await asyncJob();
    if (v != 2) {
    throw new Error('unexpected');
  }
  }
    }
console.log('verified');
}
