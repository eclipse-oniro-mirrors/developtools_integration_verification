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
 * @id CCY_16_03_006_PASS_AWAIT_NON_PROMISE
 * @expect compile-pass
 * @section 16.3
 * @design await 非 Promise 值（不挂起）
 * @note 正向用例：验证 await 非 Promise 值通过编译且不挂起
 */
async function getValue(): Promise<number> {
    let v: number = await 42;
    return v;
}
