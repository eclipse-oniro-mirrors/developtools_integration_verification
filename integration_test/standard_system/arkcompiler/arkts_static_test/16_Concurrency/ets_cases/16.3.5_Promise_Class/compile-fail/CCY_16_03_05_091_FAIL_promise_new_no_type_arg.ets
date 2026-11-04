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
 * @id CCY_16_03_05_091_FAIL_promise_new_no_type_arg
 * @expect compile-fail
 * @section 16.3.5
 * @design Promise 构造缺少类型参数
 * @note 反向用例：验证 Promise 构造缺少泛型参数编译报错
 */
function main(): void {
    let p: Promise<number> = new Promise((resolve: (v: number) => void) => {});
}
