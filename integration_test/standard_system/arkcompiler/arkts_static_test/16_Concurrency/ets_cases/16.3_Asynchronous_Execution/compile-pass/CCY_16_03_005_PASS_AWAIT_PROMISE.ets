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
 * @id CCY_16_03_005_PASS_AWAIT_PROMISE
 * @expect compile-pass
 * @section 16.3
 * @design await Promise 表达式
 * @note 正向用例：验证 await Promise 在 async 函数中通过编译
 */
async function getData(): Promise<number> {
    let p: Promise<number> = new Promise<number>((resolve: (v: number) => void) => { resolve(42); });
    let result: number = await p;
    return result;
}
