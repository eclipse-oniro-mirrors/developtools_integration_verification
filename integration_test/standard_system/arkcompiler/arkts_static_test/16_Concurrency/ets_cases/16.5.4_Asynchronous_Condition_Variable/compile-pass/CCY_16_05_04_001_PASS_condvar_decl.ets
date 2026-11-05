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
 * @id CCY_16_05_04_001_PASS_condvar_decl
 * @expect compile-pass
 * @section 16.5.4
 * @design concurrency.stackless.AsyncCondVar + concurrency.stackless.AsyncMutex 声明
 * @note 正向用例：验证 concurrency.stackless.AsyncCondVar 和 concurrency.stackless.AsyncMutex 配合声明编译通过
 */
let m: concurrency.stackless.AsyncMutex = new concurrency.stackless.AsyncMutex();
let cv: concurrency.stackless.AsyncCondVar = new concurrency.stackless.AsyncCondVar();
let flag: boolean = false;
