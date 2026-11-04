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
 * @id CCY_16_05_01_092_FAIL_dining_wrong_api
 * @expect compile-fail
 * @section 16.5.1
 * @design 哲学家就餐：错误使用 AsyncLock（调用不存在的方法）
 * @note 反向用例：验证 AsyncLock 对象调用不存在方法应编译报错
 */
let lock: AsyncLock = new AsyncLock();
function main(): void {
    lock.wait();
}
