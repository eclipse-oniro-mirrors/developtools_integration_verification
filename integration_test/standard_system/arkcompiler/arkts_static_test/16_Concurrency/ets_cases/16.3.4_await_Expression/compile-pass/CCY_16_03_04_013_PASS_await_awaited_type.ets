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
 * @id CCY_16_03_04_013_PASS_await_awaited_type
 * @expect compile-pass
 * @section 16.3.4
 * @design Awaited<T> 结果类型编译验证
 * @note 正向用例：验证 await 结果类型为 Awaited<T> 即解包后的类型
 */
async function test(): Promise<string> {
    let v: string = await Promise.resolve('hello');
    return v;
}
