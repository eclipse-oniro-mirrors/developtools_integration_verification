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
 * @id CCY_16_CI_003_PASS_launch_with_lock
 * @expect compile-pass
 * @section 16.5.1
 * @design launch 执行的 job 内使用 AsyncLock
 * @note 正向用例：验证 launch + AsyncLock 集成编译通过
 */
function main(): void {
    let lock: AsyncLock = new AsyncLock();
    let p1: Promise<void> = launch<void>((): void => {
        let p2: Promise<void> = lock.lockAsync<void>((): void => {});
    });
}
