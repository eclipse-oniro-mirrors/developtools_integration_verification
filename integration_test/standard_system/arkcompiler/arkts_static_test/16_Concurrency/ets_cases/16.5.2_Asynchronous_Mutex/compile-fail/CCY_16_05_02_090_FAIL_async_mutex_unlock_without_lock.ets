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
 * @id CCY_16_05_02_090_FAIL_async_mutex_unlock_without_lock
 * @expect compile-fail
 * @section 16.5.2
 * @design 未加锁直接 unlock
 * @note 反向用例：未先调用 lock() 直接调用 unlock()，编译器应报错
 */
let mutex: AsyncMutex = new AsyncMutex();
function f(): void {
    mutex.unlock();
}
