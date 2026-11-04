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
 * @id CCY_16_03_04_007_PASS_await_in_for_loop
 * @expect compile-pass
 * @section 16.3.4
 * @design await 在 for 循环中多顺序悬挂点
 * @note 正向用例：验证 await 在 for 循环中多次悬挂
 */
async function sum(n: number): Promise<number> {
    let total: number = 0;
    for (let i: number = 0; i < n; i++) {
        total += await Promise.resolve(i);
    }
    return total;
}
