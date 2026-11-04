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
 * @id CCY_16_05_190_FAIL_race_condition
 * @expect compile-fail
 * @section 16.5
 * @design 演示非同步共享计数器访问，编译器检测竞态条件
 * @note 反向用例：验证 AsyncLock 不支持 lock()/unlock() 方法，应编译报错
 */

let raceCounter: number = 0;

async function unsafeIncrement(): Promise<void> {
    let tmp: number = raceCounter;
    raceCounter = tmp + 1;
}

async function runRaceCondition(): Promise<void> {
    await Promise.all([
        unsafeIncrement(),
        unsafeIncrement(),
        unsafeIncrement()
    ]);
}

runRaceCondition();
