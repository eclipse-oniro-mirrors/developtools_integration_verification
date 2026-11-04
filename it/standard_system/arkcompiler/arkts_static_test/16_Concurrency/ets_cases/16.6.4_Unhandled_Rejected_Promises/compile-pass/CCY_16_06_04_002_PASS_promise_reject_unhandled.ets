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
 * @id CCY_16_06_04_002_PASS_promise_reject_unhandled
 * @expect compile-pass
 * @section 16.6.4
 * @design Promise 拒绝后无 await 也无 .catch() 回调（编译通过，运行时为未处理拒绝）
 * @note 正向用例：验证 rejected Promise 未注册回调语法通过编译
 *       runtime 行为：无 await 无 .catch() 视为未处理拒绝
 */
function main(): void {
    let p: Promise<never> = Promise.reject(new Error('fail'));
}
