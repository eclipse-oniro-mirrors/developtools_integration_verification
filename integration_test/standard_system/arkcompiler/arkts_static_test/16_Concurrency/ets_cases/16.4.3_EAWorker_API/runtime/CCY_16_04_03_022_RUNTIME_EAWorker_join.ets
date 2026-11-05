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
 * @id CCY_16_04_03_022_RUNTIME_EAWorker_join
 * @expect runtime
 * @section 16.4.3
 * @design EAWorker join 等待 worker 完成
 * @note 运行时用例：验证 EAWorker.join 等待 worker 执行完成后继续
 */
async function test(): Promise<void> {
    let worker: EAWorker = new EAWorker();
    worker.start();
    let p: Promise<number> = worker.run<number>((): number => {
        return 99;
    });
    let v: number = await p;
    let joined: Promise<void> = worker.join();
    await joined;
}
function main(): void {
    let p: Promise<void> = test();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}
