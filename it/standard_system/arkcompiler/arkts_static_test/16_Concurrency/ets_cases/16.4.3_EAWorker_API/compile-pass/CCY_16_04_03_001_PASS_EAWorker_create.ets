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
 * @id CCY_16_04_03_001_PASS_EAWorker_create
 * @expect compile-pass
 * @section 16.4.3
 * @design EAWorker 创建和基本方法调用
 * @note 正向用例：验证 EAWorker 构造、start、run、quit 方法通过编译
 */
function main(): void {
    let worker: EAWorker = new EAWorker();
    worker.start();
    worker.isAlive();
    worker.run<number>((): number => 42);
    worker.quit();
}
