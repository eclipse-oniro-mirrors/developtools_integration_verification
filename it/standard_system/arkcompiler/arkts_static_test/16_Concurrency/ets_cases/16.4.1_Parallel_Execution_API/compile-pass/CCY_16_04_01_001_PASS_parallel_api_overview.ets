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
 * @id CCY_16_04_01_001_PASS_parallel_api_overview
 * @expect compile-pass
 * @section 16.4.1
 * @design 并行执行 API 总览：launch API 基本用法
 * @note 正向用例：验证 launch API 作为主要并行执行 API 编译通过
 *       EAWorker API 和 Taskpool API 为 stdlib 依赖，见 16.4.3、16.4.4
 */
function main(): void {
    let p: Promise<void> = launch<void>((): void => {
        console.log('verified');
});
}
