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
 * @id CCY_16_04_03_020_RUNTIME_EAWorker_run_task
 * @expect runtime
 * @section 16.4.3
 * @design EAWorker 创建 worker 并执行任务
 * @note 运行时用例：验证 EAWorker 创建、启动、运行任务并获取结果
 */
function main(): void {
    let worker: EAWorker = new EAWorker();
    worker.start();
    let p: Promise<number> = worker.run<number>((): number => {
        return 42;
    });
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
    worker.quit();
    console.log('verified');
}
